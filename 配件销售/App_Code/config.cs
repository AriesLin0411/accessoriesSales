using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// config 的摘要说明
/// </summary>
public class config
{
    public config()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    // 应用ID,您的APPID
    public static string app_id = "2016101400686475";

    // 支付宝网关
    public static string gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 商户私钥，您的原始格式RSA私钥
    public static string private_key = "MIIEpAIBAAKCAQEAlLq63nkaAz59bp8ZqPXFfMXoXCqJWvwxRL5S9unVOibqfDLQMs8QjrTrz71DFYLBOQq1fqVVLL7Yutl7rW1v0y5T9z2pZ6HpomhP8dhwIakF7unYAoOP1SA2B8LM68btW1r8tlv5pMwVB546OSe1rfAlALS1iUq6DF6BuyS807rsr0RQoCAE1e1dNPwHXdWClTHU8aXcRLQbIpv2+JasuK0pHaZ7bohdscOOvk0Sh6BHFPuxSbyMMPgjVb5dWPVpb9ZTyGA+SeAxbSR2g3GbkFSGQYDj5vK1v/YsrGBZJL9GZ/AykS6umF1Fu+MwtQpWBXWIBZa/hlTfYbshvu8f+wIDAQABAoIBAC3v5tvkJ6as3G0YcwJ+trqtHfGpqbcSgd0rs9BTtOo7Lt2hjDDFR+Xr95G4cUnpkuidaCVvx3kEkUhU+CA+1vUxL/oDb5l0pwbklRyrryaWYCDE1VUhcYFwa3/GKSkBzjoTRk7E5byC1FQACReyLilFLQikyBVZoVFEt2koFbKHZxBcp1hL52ZgIqUroo2RO09dpk9Gz65STC8nggOSTjxe68xqBNJSRCZ+UpexG35YhQJMmIvTKb/ulINdt/7u6MfHM2+Yh/hN+0d4rLGdi6uhmKW3we0P2QHCKWz3pVNbdbo4/YVfJdYUD3SjVmyC0RzfobczSorSc0luNO72UiECgYEAyPWrqD7ZoZ7Gy/06G1LPVboWLBhbktiEjpMOJtratrvhGxUThkduv5ARcZkVyPoIGdECYWTpiEVWyCQuObr9EfPOpTpC+KdLlFFVeIKcOlmQyclYgXVkdlfk6RMxlttGYdZb7NADrywdNkb5XPnR1TZI7E0/y+ek7cdbjtik28kCgYEAvXbs0Hvxu4nRL/IyFDHT57HXa60jWOnYqHENqLhGs1rMz74v1x/gplexPXiJuwdVgpjQlAFPFmV+Ck3jqvTrUah/OyD4rVrfcD58tXtatpDr5kN9mrZVLwVhiDTg7P7ryh1/B2AH392k8EKradpRCwTwlAulKeyuZkKcGP5HN6MCgYEAgv0PXOVKujxiXEi8/V5m4vwew7NEzVzwWnakPNNeyMmCG0MLrPUWzSq9FAyy1IOVkC5anN1IE5kOzfo3X03w8yi2Q6DMUoPJke3KBnksGCSVadIiLJA2YaU9AmeOZUSchd1RofSc0iuxBtYQaHg2PAHcWpqnwONG7+6IUX4JR3ECgYBV1pecLUtr6Bi6XESMGbcj9dLfmeW11tyuE+pYUoTVpYG9bTFHic3CD2DhtMbR0ZTQQmPdampmfz0Hdhp7zdL/gBOEun9wKweoVucxYd3LcQUvocw6V/loAEwb5bkyJpy1SX/P25Y1urmLkOkQYDTvhSFqMYx23iB1fCA0wp+JeQKBgQCdIBucs6xqSFlgqfvELRGEQvgKB2Qhg/nQFKTqbqLoUsMKF9M0zkVNgrDgT+liHG3V1Nw+b6aB0OUw9agtIhBYgZ2zmuRDp+cqEMRbTb5MaCaiHh9li9hfksN69PMNTBbM6o5DJWmd4G7jVSlPvL8v3hFCE+nMXcJ4wKC+r/WjWw==";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static string alipay_public_key = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIgHnOn7LLILlKETd6BFRJ0GqgS2Y3mn1wMQmyh9zEyWlz5p1zrahRahbXAfCfSqshSNfqOmAQzSHRVjCqjsAw1jyqrXaPdKBmr90DIpIxmIyKXv4GGAkPyJ/6FTFY99uhpiq0qadD/uSzQsefWo0aTvP/65zi3eof7TcZ32oWpwIDAQAB";

    // 签名方式
    public static string sign_type = "RSA";

    // 编码格式
    public static string charset = "UTF-8";
}