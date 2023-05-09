```
import javax.crypto.*;
import javax.crypto.spec.*;
 // 定义用于加密和解密的工具类
public class EncryptionUtils {
    // 定义对称加密算法和密钥长度
    private static final String ALGO = "AES";
    private static final int KEY_SIZE = 128;
     // 定义加密方法
    public static String encrypt(String input, SecretKeySpec key) throws Exception {
        // 获取加密器实例
        Cipher cipher = Cipher.getInstance(ALGO);
        // 将加密器初始化为加密模式，并使用密钥加密数据
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] encryptedBytes = cipher.doFinal(input.getBytes());
        // 返回加密后的字符串
        return new String(Base64.getEncoder().encode(encryptedBytes));
    }
     // 定义解密方法
    public static String decrypt(String encryptedInput, SecretKeySpec key) throws Exception {
        // 获取解密器实例
        Cipher cipher = Cipher.getInstance(ALGO);
        // 将解密器初始化为解密模式，并使用密钥解密数据
        cipher.init(Cipher.DECRYPT_MODE, key);
        byte[] encryptedBytes = Base64.getDecoder().decode(encryptedInput.getBytes());
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        // 返回解密后的字符串
        return new String(decryptedBytes);
    }
}
 // 定义 MyBatis 映射器接口
public interface PersonMapper {
    @Insert("INSERT INTO person (id, name, encrypted_salary) VALUES (#{id}, #{name}, #{encryptedSalary})")
    public void insertPerson(@Param("id") int id, @Param("name") String name, @Param("encryptedSalary") String encryptedSalary);
     @Update("UPDATE person SET encrypted_salary = #{encryptedSalary} WHERE id = #{id}")
    public void updateSalary(@Param("id") int id, @Param("encryptedSalary") String encryptedSalary);
     @Select("SELECT id, name, encrypted_salary FROM person WHERE id = #{id}")
    @Results({
            @Result(property = "id", column = "id"),
            @Result(property = "name", column = "name"),
            @Result(property = "salary", column = "encrypted_salary", javaType = String.class, jdbcType = JdbcType.VARCHAR, typeHandler = EncryptedStringTypeHandler.class)
    })
    public Person selectPersonById(@Param("id") int id);
     @Delete("DELETE FROM person WHERE id = #{id}")
    public void deletePerson(@Param("id") int id);
}
 // 定义 MyBatis 类型处理器
@MappedTypes(String.class)
@MappedJdbcTypes({JdbcType.VARCHAR})
public class EncryptedStringTypeHandler extends BaseTypeHandler<String> {
    // 定义加密密钥
    private static final String SECRET_KEY = "MySecretKey12345";
    private SecretKeySpec key;
     // 在初始化类型处理器时生成对称密钥
    public EncryptedStringTypeHandler() {
        key = new SecretKeySpec(SECRET_KEY.getBytes(), ALGO);
    }
     // 重写将 Java 类型转换为数据库类型的方法
    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, String parameter, JdbcType jdbcType) throws SQLException {
        try {
            // 将明文字符串加密后再插入到数据库
            String encryptedValue = EncryptionUtils.encrypt(parameter, key);
            ps.setString(i, encryptedValue);
        } catch (Exception e) {
            throw new SQLException(e);
        }
    }
     // 重写将数据库类型转换为 Java 类型的方法
    @Override
    public String getNullableResult(ResultSet rs, String columnName) throws SQLException {
        try {
            // 从数据库获取加密字符串后再解密成明文字符串
            String encryptedValue = rs.getString(columnName);
            return EncryptionUtils.decrypt(encryptedValue, key);
        } catch (Exception e) {
            throw new SQLException(e);
        }
    }
     // 重写将数据库类型转换为 Java 类型的方法
    @Override
    public String getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        try {
            // 从数据库获取加密字符串后再解密成明文字符串
            String encryptedValue = cs.getString(columnIndex);
            return EncryptionUtils.decrypt(encryptedValue, key);
        } catch (Exception e) {
            throw new SQLException(e);
        }
    }
     // 重写将数据库类型转换为 Java 类型的方法
    @Override
    public String getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        try {
            // 从数据库获取加密字符串后再解密成明文字符串
            String encryptedValue = rs.getString(columnIndex);
            return EncryptionUtils.decrypt(encryptedValue, key);
        } catch (Exception e) {
            throw new SQLException(e);
        }
    }
}
 // 定义 Person 类
public class Person {
    private int id;
    private String name;
    private String salary;
     public int getId() { return id; }
    public void setId(int id) { this.id = id; }
     public String getName() { return name; }
    public void setName(String name) { this.name = name; }
     public String getSalary() { return salary; }
    public void setSalary(String salary) { this.salary = salary; }
}
```


```
public class DecryptTypeHandler extends BaseTypeHandler<String> {
    private List<String> targetTableNames; // 目标表名列表
    private String secretKey; // 解密密钥
     public DecryptTypeHandler(List<String> targetTableNames, String secretKey) {
        this.targetTableNames = targetTableNames;
        this.secretKey = secretKey;
    }
     @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, String s, JdbcType jdbcType) throws SQLException {
        if (s != null && targetTableNames.contains(preparedStatement.getMetaData().getTableName(i))) {
            String originalStr = MyDecryptionUtils.decrypt(s, secretKey); // 解密操作
            preparedStatement.setString(i, originalStr);
        } else {
            preparedStatement.setString(i, s);
        }
    }
     @Override
    public String getNullableResult(ResultSet resultSet, String s) throws SQLException {
        String encryptedStr = resultSet.getString(s);
        if (encryptedStr != null && targetTableNames.contains(resultSet.getMetaData().getTableName(resultSet.findColumn(s)))) {
            String originalStr = MyDecryptionUtils.decrypt(encryptedStr, secretKey); // 解密操作
            return originalStr;
        } else {
            return encryptedStr;
        }
    }
     @Override
    public String getNullableResult(ResultSet resultSet, int i) throws SQLException {
        String encryptedStr = resultSet.getString(i);
        if (encryptedStr != null && targetTableNames.contains(resultSet.getMetaData().getTableName(i))) {
            String originalStr = MyDecryptionUtils.decrypt(encryptedStr, secretKey); // 解密操作
            return originalStr;
        } else {
            return encryptedStr;
        }
    }
     @Override
    public String getNullableResult(CallableStatement callableStatement, int i) throws SQLException {
        String encryptedStr = callableStatement.getString(i);
        if (encryptedStr != null && targetTableNames.contains(callableStatement.getMetaData().getTableName(i))) {
            String originalStr = MyDecryptionUtils.decrypt(encryptedStr, secretKey); // 解密操作
            return originalStr;
        } else {
            return encryptedStr;
        }
    }
}
```