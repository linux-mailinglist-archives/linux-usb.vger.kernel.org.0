Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 462D746F2A
	for <lists+linux-usb@lfdr.de>; Sat, 15 Jun 2019 11:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfFOJEC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 Jun 2019 05:04:02 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46160 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbfFOJEC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 Jun 2019 05:04:02 -0400
Received: by mail-lj1-f194.google.com with SMTP id v24so4667720ljg.13
        for <linux-usb@vger.kernel.org>; Sat, 15 Jun 2019 02:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q5mZQFP+g8hphwb9WUWDqOBMM/numzNM18neebO4nCQ=;
        b=TKvbOvDCyXJ7QIhcAjzEBO/B5MJDBLcr6FovRgkpJYKud0J03MwhgTKTPkOjZi26OC
         w6y0buREBCG1c6uq3sPlr77/VjQzLCdgOghG9e/c5s8gS7g/L8AX8h3zdyE+oqlMe0uv
         2/GRYJIjEEw2aJ4tyvQAEzY/28rSFifUCYqKdX7G5G54vtZtwYTTTOaFWdOHS5oGYvQv
         w2sSVk7v/eZ/A5398oS0IY0/1qbcCYh0myKtRbJiNTvH4Rit3O8EVbfHFV6g1ix5jfjS
         ZS37CpScGQAeZSnQbIEHHqB3Pszv3fXHApUsSgg2x4SylV0uNWfh/9b/xGFGZDs3KNsl
         1xeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q5mZQFP+g8hphwb9WUWDqOBMM/numzNM18neebO4nCQ=;
        b=Gid6LiaatLaF+eQFhKpaa8+yPjzoPEIQHrs3+QFmHe3yYEJY+wjMhrvWQlWEbcmpU6
         82MLrZL69eGcRI8j/9G1PU9JUPXAjTF2H09QtbDo11m6QUpQChN5J9YNe7sE8TGSHHsK
         iU7TkuHlAsfkFzxmcPRsW72fZM8O2H+4EDofD33+mHJbTeK8V5UwbwNJMICYl1eC8udd
         NQ0IRQ6ZSCsfRU9VkbF282UVag2aa6CTVKOQ0ZdvjSJbLRrf7lOYvEEME6Z9VngiFeqN
         eczlCNKaStL3M7I7lj96Up90mihvGFuHr94qbui34Crs0+UXID3D3xb67UzNLy80TU2B
         fCYw==
X-Gm-Message-State: APjAAAWnU4opBmUgACzfNf/F8C6D3S1zh7pOJZU+wb4UnaQTJA6ZMScW
        ivqxqoeZxZTfc5NFMqUpLKROeQ==
X-Google-Smtp-Source: APXvYqyPpxOV0FFgM82A++kc//QU4qjulO9oJY1P3TU1+ZG9i72C0q6wCY8EH7wur3qGZzMBXEUqUg==
X-Received: by 2002:a2e:1510:: with SMTP id s16mr24630515ljd.19.1560589440559;
        Sat, 15 Jun 2019 02:04:00 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.84.132])
        by smtp.gmail.com with ESMTPSA id l25sm814819lfk.57.2019.06.15.02.03.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Jun 2019 02:04:00 -0700 (PDT)
Subject: Re: [PATCH v4 6/8] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
To:     Peter Chen <peter.chen@nxp.com>, balbi@kernel.org,
        shawnguo@kernel.org
Cc:     robh+dt@kernel.org, fabio.estevam@nxp.com, kernel@pengutronix.de,
        devicetree@vger.kernel.org, aisheng.dong@nxp.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org, chunfeng.yun@mediatek.com
References: <20190614093544.11730-1-peter.chen@nxp.com>
 <20190614093544.11730-7-peter.chen@nxp.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <0dbf01f9-7c5c-ce0b-4feb-378c9147f15a@cogentembedded.com>
Date:   Sat, 15 Jun 2019 12:03:47 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190614093544.11730-7-peter.chen@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 14.06.2019 12:35, Peter Chen wrote:

> Add imx7ulp USBOTG1 support.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>   arch/arm/boot/dts/imx7ulp.dtsi | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
> index fca6e50f37c8..5115e47715c3 100644
> --- a/arch/arm/boot/dts/imx7ulp.dtsi
> +++ b/arch/arm/boot/dts/imx7ulp.dtsi
> @@ -30,6 +30,7 @@
>   		serial1 = &lpuart5;
>   		serial2 = &lpuart6;
>   		serial3 = &lpuart7;
> +		usbphy0 = &usbphy1;

    Is that really needed?

[...]
> @@ -133,6 +134,33 @@
[...]
> +		usbphy1: usbphy@0x40350000 {

    Name it "usb-phy@40350000" please.

> +			compatible = "fsl,imx7ulp-usbphy", "fsl,imx6ul-usbphy";
> +			reg = <0x40350000 0x1000>;
> +			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pcc2 IMX7ULP_CLK_USB_PHY>;
> +			#phy-cells = <0>;
> +		};
> +
>   		usdhc0: mmc@40370000 {
>   			compatible = "fsl,imx7ulp-usdhc", "fsl,imx6sx-usdhc";
>   			reg = <0x40370000 0x10000>;
> 

MBR, Sergei
