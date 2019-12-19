Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22863125EAB
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2019 11:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbfLSKNA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Dec 2019 05:13:00 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40406 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbfLSKNA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Dec 2019 05:13:00 -0500
Received: by mail-wr1-f68.google.com with SMTP id c14so5353445wrn.7
        for <linux-usb@vger.kernel.org>; Thu, 19 Dec 2019 02:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=PN6pgtTj4yzd4L0ViZh1lrsVzR0no/4rRFGhnwNsTvw=;
        b=hKwR/KhQlU2XaqqrNx983HkUgOqRyAk+SOPYXfQ9TuDLzdxMDSs2Tc0JMuOr3i16sg
         0zIDGJ6E4bXDzCACOFe5DMiCmoLKkxdUY8cUMhgO6gSWe17XQDUua2EGKsD9iiOOMA27
         TSfwsyvpcrn7rL2p1DxT3J+PLsk1jzlSr5t10i38s6T+IkPejg8OYjDRPMmOyHAltv7Y
         ZqlQsGzqtTiJB0xXA7g56jWgUdLztAwRlQPfUPXNHhxFCKlm/Y9h8coAkGV3RygcEG8f
         RWfr1EZ4OcOM2XhFdD10437BuXfMguPB18t03jxJwD2DwbcUbEkFd/78WrD0fkyAJ/kW
         x38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=PN6pgtTj4yzd4L0ViZh1lrsVzR0no/4rRFGhnwNsTvw=;
        b=ACguA5NTIhCZpao1B2n5uzpMocNatD3tokgni6YOVbKG6LI7ZgNZwiGwrhNhpKg218
         JNS81QOEm3vb/sDjjwSc66T3x8ITJHoCfCg1/sCKlmqQnUdnqX+418vu7GjOlggZdpkZ
         iBEKTz55azpvMAhRA/VT4ahTXmrp2rEAaZVcAMhV5104Hw88KiJvJkLgkEcC0nw3jcLh
         9YpU+M1JCM3Fr9IO8jnE1FY70hyaP2pxufHYTNHYSQMvhs9iljEQvVuET1MSoi6s/aXZ
         nNHHwDRE4AsvjvnqhJK+lUX61OpMBhTkZZ9OyMnX1oTMYvD2g70pKNum2v5H+clOMd1e
         oeaw==
X-Gm-Message-State: APjAAAXUIjEsi7CVqvPmPpM+SlgzbDiHxQ+R1zEvYJPLYHwuDTOAXZaT
        evX5iKHD2qwkjoN8PxlM4IwOTA==
X-Google-Smtp-Source: APXvYqyBxurjzFz3D9NwcI1h4K33j6B1IjLmbjChbkMXhw6rTcNalNzCpm4B4UCbvOxZSyRiE4EIeQ==
X-Received: by 2002:adf:f448:: with SMTP id f8mr8873278wrp.263.1576750376133;
        Thu, 19 Dec 2019 02:12:56 -0800 (PST)
Received: from [10.2.4.229] (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
        by smtp.gmail.com with ESMTPSA id a1sm5587661wmj.40.2019.12.19.02.12.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Dec 2019 02:12:55 -0800 (PST)
Subject: Re: [PATCH v2 3/6] phy: amlogic: Add Amlogic A1 USB2 PHY Driver
To:     Hanjie Lin <hanjie.lin@amlogic.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Yue Wang <yue.wang@amlogic.com>, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
References: <1576636944-196192-1-git-send-email-hanjie.lin@amlogic.com>
 <1576636944-196192-4-git-send-email-hanjie.lin@amlogic.com>
 <4cbc4216-4f1b-dab2-fccd-4ece7cfedb77@baylibre.com>
 <da372dff-4467-5d04-c8ae-055f89a5b11b@amlogic.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 mQENBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAG0KE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT6JATsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIW5AQ0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAYkBHwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8guQINBFYnf6QBEADQ+wBYa+X2n/xIQz/RUoGHf84Jm+yTqRT43t7sO48/cBW9vAn9
 GNwnJ3HRJWKATW0ZXrCr40ES/JqM1fUTfiFDB3VMdWpEfwOAT1zXS+0rX8yljgsWR1UvqyEP
 3xN0M/40Zk+rdmZKaZS8VQaXbveaiWMEmY7sBV3QvgOzB7UF2It1HwoCon5Y+PvyE3CguhBd
 9iq5iEampkMIkbA3FFCpQFI5Ai3BywkLzbA3ZtnMXR8Qt9gFZtyXvFQrB+/6hDzEPnBGZOOx
 zkd/iIX59SxBuS38LMlhPPycbFNmtauOC0DNpXCv9ACgC9tFw3exER/xQgSpDVc4vrL2Cacr
 wmQp1k9E0W+9pk/l8S1jcHx03hgCxPtQLOIyEu9iIJb27TjcXNjiInd7Uea195NldIrndD+x
 58/yU3X70qVY+eWbqzpdlwF1KRm6uV0ZOQhEhbi0FfKKgsYFgBIBchGqSOBsCbL35f9hK/JC
 6LnGDtSHeJs+jd9/qJj4WqF3x8i0sncQ/gszSajdhnWrxraG3b7/9ldMLpKo/OoihfLaCxtv
 xYmtw8TGhlMaiOxjDrohmY1z7f3rf6njskoIXUO0nabun1nPAiV1dpjleg60s3OmVQeEpr3a
 K7gR1ljkemJzM9NUoRROPaT7nMlNYQL+IwuthJd6XQqwzp1jRTGG26J97wARAQABiQM+BBgB
 AgAJBQJWJ3+kAhsCAikJEBaat7Gkz/iuwV0gBBkBAgAGBQJWJ3+kAAoJEHfc29rIyEnRk6MQ
 AJDo0nxsadLpYB26FALZsWlN74rnFXth5dQVQ7SkipmyFWZhFL8fQ9OiIoxWhM6rSg9+C1w+
 n45eByMg2b8H3mmQmyWztdI95OxSREKwbaXVapCcZnv52JRjlc3DoiiHqTZML5x1Z7lQ1T3F
 8o9sKrbFO1WQw1+Nc91+MU0MGN0jtfZ0Tvn/ouEZrSXCE4K3oDGtj3AdC764yZVq6CPigCgs
 6Ex80k6QlzCdVP3RKsnPO2xQXXPgyJPJlpD8bHHHW7OLfoR9DaBNympfcbQJeekQrTvyoASw
 EOTPKE6CVWrcQIztUp0WFTdRGgMK0cZB3Xfe6sOp24PQTHAKGtjTHNP/THomkH24Fum9K3iM
 /4Wh4V2eqGEgpdeSp5K+LdaNyNgaqzMOtt4HYk86LYLSHfFXywdlbGrY9+TqiJ+ZVW4trmui
 NIJCOku8SYansq34QzYM0x3UFRwff+45zNBEVzctSnremg1mVgrzOfXU8rt+4N1b2MxorPF8
 619aCwVP7U16qNSBaqiAJr4e5SNEnoAq18+1Gp8QsFG0ARY8xp+qaKBByWES7lRi3QbqAKZf
 yOHS6gmYo9gBmuAhc65/VtHMJtxwjpUeN4Bcs9HUpDMDVHdfeRa73wM+wY5potfQ5zkSp0Jp
 bxnv/cRBH6+c43stTffprd//4Hgz+nJcCgZKtCYIAPkUxABC85ID2CidzbraErVACmRoizhT
 KR2OiqSLW2x4xdmSiFNcIWkWJB6Qdri0Fzs2dHe8etD1HYaht1ZhZ810s7QOL7JwypO8dscN
 KTEkyoTGn6cWj0CX+PeP4xp8AR8ot4d0BhtUY34UPzjE1/xyrQFAdnLd0PP4wXxdIUuRs0+n
 WLY9Aou/vC1LAdlaGsoTVzJ2gX4fkKQIWhX0WVk41BSFeDKQ3RQ2pnuzwedLO94Bf6X0G48O
 VsbXrP9BZ6snXyHfebPnno/te5XRqZTL9aJOytB/1iUna+1MAwBxGFPvqeEUUyT+gx1l3Acl
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <e66d35b1-4e85-bde4-abf7-af3f569e64e8@baylibre.com>
Date:   Thu, 19 Dec 2019 11:12:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <da372dff-4467-5d04-c8ae-055f89a5b11b@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19/12/2019 10:48, Hanjie Lin wrote:
> 
> 
> On 2019/12/18 21:17, Neil Armstrong wrote:
>> Hi,
>>
>> On 18/12/2019 03:42, Hanjie Lin wrote:
>>> This adds support for the USB2 PHY found in the Amlogic A1 SoC Family.
>>>
>>> It supports host mode only.
>>>
>>> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
>>> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
>>> ---
>>>  drivers/phy/amlogic/phy-meson-g12a-usb2.c | 102 ++++++++++++++++++++++--------
>>>  1 file changed, 74 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
>>> index 9065ffc..2c242d3 100644
>>> --- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
>>> +++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
>>> @@ -146,11 +146,18 @@
>>>  #define RESET_COMPLETE_TIME					1000
>>>  #define PLL_RESET_COMPLETE_TIME					100
>>>  
>>> +enum {
>>> +	MESON_USB2_PHY_VERSION_10 = 0,
>>> +	MESON_USB2_PHY_VERSION_11,
>>
>> Are these the real "versions" of the phy or it's made up ?
>>
> 
> This version is made up and only for distinguish a1 and g12a.

No problem, in this case simply use the SoC family instead of 10 and 11.

Neil

> 
>>> +	MESON_USB2_PHY_VERSION_COUNT,
>>> +};
>>> +
>>>  struct phy_meson_g12a_usb2_priv {
>>>  	struct device		*dev;
>>>  	struct regmap		*regmap;
>>>  	struct clk		*clk;
>>>  	struct reset_control	*reset;
>>> +	int phy_version;
>>>  };
>>>  
>>>  static const struct regmap_config phy_meson_g12a_usb2_regmap_conf = {
>>> @@ -192,18 +199,33 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
>>>  		     FIELD_PREP(PHY_CTRL_R17_MPLL_FILTER_PVT2, 2) |
>>>  		     FIELD_PREP(PHY_CTRL_R17_MPLL_FILTER_PVT1, 9));
>>>  
>>> -	regmap_write(priv->regmap, PHY_CTRL_R18,
>>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_LKW_SEL, 1) |
>>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_LK_W, 9) |
>>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_LK_S, 0x27) |
>>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_PFD_GAIN, 1) |
>>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_ROU, 7) |
>>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_DATA_SEL, 3) |
>>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_BIAS_ADJ, 1) |
>>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_BB_MODE, 0) |
>>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_ALPHA, 3) |
>>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_ADJ_LDO, 1) |
>>> -		     PHY_CTRL_R18_MPLL_ACG_RANGE);
>>> +	if (priv->phy_version == MESON_USB2_PHY_VERSION_10)
>>> +		regmap_write(priv->regmap, PHY_CTRL_R18,
>>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_LKW_SEL, 1) |
>>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_LK_W, 9) |
>>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_LK_S, 0x27) |
>>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_PFD_GAIN, 1) |
>>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_ROU, 7) |
>>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_DATA_SEL, 3) |
>>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_BIAS_ADJ, 1) |
>>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_BB_MODE, 0) |
>>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_ALPHA, 3) |
>>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_ADJ_LDO, 1) |
>>> +			     PHY_CTRL_R18_MPLL_ACG_RANGE);
>>> +	else if (priv->phy_version == MESON_USB2_PHY_VERSION_11)
>>> +		regmap_write(priv->regmap, PHY_CTRL_R18,
>>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_LKW_SEL, 1) |
>>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_LK_W, 9) |
>>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_LK_S, 0x27) |
>>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_PFD_GAIN, 1) |
>>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_ROU, 7) |
>>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_DATA_SEL, 3) |
>>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_BIAS_ADJ, 1) |
>>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_BB_MODE, 0) |
>>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_ALPHA, 3) |
>>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_ADJ_LDO, 1) |
>>> +			     PHY_CTRL_R18_MPLL_ACG_RANGE |
>>> +			     PHY_CTRL_R18_MPLL_DCO_CLK_SEL);
>>
>> The only difference is PHY_CTRL_R18_MPLL_ACG_RANGE | PHY_CTRL_R18_MPLL_DCO_CLK_SEL,
>> you can easily simplify the code here by using a temp variable.
>>
> 
> Yes, it will looks more clearly.
> 
>>>  
>>>  	udelay(PLL_RESET_COMPLETE_TIME);
>>>  
>>> @@ -227,13 +249,24 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
>>>  		     FIELD_PREP(PHY_CTRL_R20_USB2_BGR_VREF_4_0, 0) |
>>>  		     FIELD_PREP(PHY_CTRL_R20_USB2_BGR_DBG_1_0, 0));
>>>  
>>> -	regmap_write(priv->regmap, PHY_CTRL_R4,
>>> -		     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_7_0, 0xf) |
>>> -		     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_15_8, 0xf) |
>>> -		     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_23_16, 0xf) |
>>> -		     PHY_CTRL_R4_TEST_BYPASS_MODE_EN |
>>> -		     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_1_0, 0) |
>>> -		     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_3_2, 0));
>>> +	if (priv->phy_version == MESON_USB2_PHY_VERSION_10)
>>> +		regmap_write(priv->regmap, PHY_CTRL_R4,
>>> +			     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_7_0, 0xf) |
>>> +			     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_15_8, 0xf) |
>>> +			     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_23_16, 0xf) |
>>> +			     PHY_CTRL_R4_TEST_BYPASS_MODE_EN |
>>> +			     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_1_0, 0) |
>>> +			     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_3_2, 0));
>>> +	else if (priv->phy_version == MESON_USB2_PHY_VERSION_11) {
>>> +		regmap_write(priv->regmap, PHY_CTRL_R21,
>>> +			     PHY_CTRL_R21_USB2_CAL_ACK_EN |
>>> +			     PHY_CTRL_R21_USB2_TX_STRG_PD |
>>> +			     FIELD_PREP(PHY_CTRL_R21_USB2_OTG_ACA_TRIM_1_0, 2));
>>> +
>>> +		/* Analog Settings */
>>> +		regmap_write(priv->regmap, PHY_CTRL_R13,
>>> +			     FIELD_PREP(PHY_CTRL_R13_MIN_COUNT_FOR_SYNC_DET, 7));
>>> +	}
>>>  
>>>  	/* Tuning Disconnect Threshold */
>>>  	regmap_write(priv->regmap, PHY_CTRL_R3,
>>> @@ -241,11 +274,13 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
>>>  		     FIELD_PREP(PHY_CTRL_R3_HSDIC_REF, 1) |
>>>  		     FIELD_PREP(PHY_CTRL_R3_DISC_THRESH, 3));
>>>  
>>> -	/* Analog Settings */
>>> -	regmap_write(priv->regmap, PHY_CTRL_R14, 0);
>>> -	regmap_write(priv->regmap, PHY_CTRL_R13,
>>> -		     PHY_CTRL_R13_UPDATE_PMA_SIGNALS |
>>> -		     FIELD_PREP(PHY_CTRL_R13_MIN_COUNT_FOR_SYNC_DET, 7));
>>> +	if (priv->phy_version == MESON_USB2_PHY_VERSION_10) {
>>> +		/* Analog Settings */
>>> +		regmap_write(priv->regmap, PHY_CTRL_R14, 0);
>>> +		regmap_write(priv->regmap, PHY_CTRL_R13,
>>> +			     PHY_CTRL_R13_UPDATE_PMA_SIGNALS |
>>> +			     FIELD_PREP(PHY_CTRL_R13_MIN_COUNT_FOR_SYNC_DET, 7));
>>> +	}
>>>  
>>>  	return 0;
>>>  }
>>> @@ -271,6 +306,7 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
>>>  	struct resource *res;
>>>  	struct phy_meson_g12a_usb2_priv *priv;
>>>  	struct phy *phy;
>>> +	struct device_node *np = dev->of_node;
>>>  	void __iomem *base;
>>>  	int ret;
>>>  
>>> @@ -286,14 +322,23 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
>>>  	if (IS_ERR(base))
>>>  		return PTR_ERR(base);
>>>  
>>> +	if (of_device_is_compatible(np, "amlogic,g12a-usb2-phy"))
>>> +		priv->phy_version = MESON_USB2_PHY_VERSION_10;
>>> +	else if (of_device_is_compatible(np, "amlogic,a1-usb2-phy"))
>>> +		priv->phy_version = MESON_USB2_PHY_VERSION_11;
>>> +	else
>>> +		return -EINVAL;
>>
>> Please use of_device_get_match_data() and a match data for each compatible instead.
>>
> 
> OK, I will fix it in next version.
> 
>>> +
>>>  	priv->regmap = devm_regmap_init_mmio(dev, base,
>>>  					     &phy_meson_g12a_usb2_regmap_conf);
>>>  	if (IS_ERR(priv->regmap))
>>>  		return PTR_ERR(priv->regmap);
>>>  
>>> -	priv->clk = devm_clk_get(dev, "xtal");
>>> -	if (IS_ERR(priv->clk))
>>> -		return PTR_ERR(priv->clk);
>>> +	if (priv->phy_version == MESON_USB2_PHY_VERSION_10) {
>>> +		priv->clk = devm_clk_get(dev, "xtal");
>>> +		if (IS_ERR(priv->clk))
>>> +			return PTR_ERR(priv->clk);
>>> +	}
>>>  
>>>  	priv->reset = devm_reset_control_get(dev, "phy");
>>>  	if (IS_ERR(priv->reset))
>>> @@ -322,7 +367,8 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
>>>  
>>>  static const struct of_device_id phy_meson_g12a_usb2_of_match[] = {
>>>  	{ .compatible = "amlogic,g12a-usb2-phy", },
>>> -	{ },
>>> +	{ .compatible = "amlogic,a1-usb2-phy", },
>>> +	{ /* Sentinel */ }
>>>  };
>>>  MODULE_DEVICE_TABLE(of, phy_meson_g12a_usb2_of_match);
>>>  
>>>
>>
>> Thanks,
>> Neil
>>
>> .
>>
> 
> Thanks,
> Hanjie.Lin
> 

