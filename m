Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D374315F93
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2019 10:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbfEGIkx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 May 2019 04:40:53 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46349 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbfEGIkw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 May 2019 04:40:52 -0400
Received: by mail-lf1-f65.google.com with SMTP id k18so11164784lfj.13
        for <linux-usb@vger.kernel.org>; Tue, 07 May 2019 01:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ji+xADNfaJTtv5uZbqXIgNnoEnwkksODtlAIFeWlJMI=;
        b=RIu87sfJ8sLBUchig0AmWeXfzQZF5yy2HrbrymQqW26ssAmv+mjWUqDWiIGFM3Tcr9
         vogmNeeZyCKIjj6nB7juBIqkhh17ct7VDI7Rmt+2988DBcUKkZ7JdyjMKVk8+d+sXKml
         QWbENBHnRbD99IekirNlf0WqHfWRjuUiLBdepXlcVAJcm+/WBMv73WrImI4TIJ9UKJbp
         tKR4akyl33r0PomKcN3wWMVqXZncfGVn2xxay59c4WWWyV0qD1oG5zzVyLnYTOC/8KjY
         5ZI35P77rOrgcVLa8AfftwG8XP9TbGrgDr0BlgXzvdtwsrhcKZcrQhWw5KK9yVjOV8bn
         YthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ji+xADNfaJTtv5uZbqXIgNnoEnwkksODtlAIFeWlJMI=;
        b=iAXWBg0fCZCDIAx5FxXilHwd+vx6Ang0YqSh+vm81gqAZign2Lr6TJ5C4Q5VzEYQj7
         bufklJzxXVcx1r9WeILHkZvTAUXAWQzCXNLxprnmTfQYY8ZU3T/XMOGj/fLvzGlb6qBg
         U30yXrgVJ+t45RrJ9J/8pHfRGBhRfZCjWeYSoIGT6WJCTC7vzz9YHBinZM5ZjjVmyBBA
         04S3OglNgB8Dlqlyd7H/ZNkPkb4mY+STdNGUM5WuMKnWfHYMaPpx3gpJ07cyzFtmgROz
         oGdrpHbk7NvxxVAmbWW04vtXOvaJgF090zmmZli+0RQUeHqFZJYWcV7IZDOr7HrRTidn
         xe5Q==
X-Gm-Message-State: APjAAAVbUx/i0mYv7DJ06sKscmCJA2qQ5zhRlAR9Z3Hg6BrDBec3/KFC
        w8XN705G+R4+ChelLaYcw5BmFA==
X-Google-Smtp-Source: APXvYqzczqdv/6jAMkHnFLMtj6YWXtCAp54lOBUFf+UM74Ih3cysdpF3WlxDInIIDgdZ8NV3y4Z1tQ==
X-Received: by 2002:a19:ae14:: with SMTP id f20mr1083046lfc.49.1557218450832;
        Tue, 07 May 2019 01:40:50 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.80.92])
        by smtp.gmail.com with ESMTPSA id u20sm2989950ljd.58.2019.05.07.01.40.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 01:40:49 -0700 (PDT)
Subject: Re: [PATCH 03/10] phy: renesas: rcar-gen3-usb2: Check dr_mode when
 not using OTG
To:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-4-chris.brandt@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <5af1345d-a7ed-c1d6-0c72-e6506427319a@cogentembedded.com>
Date:   Tue, 7 May 2019 11:40:45 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506234631.113226-4-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 07.05.2019 2:46, Chris Brandt wrote:

> When not using OTG, the PHY will need to know if it should function as
> host or peripheral by checking dr_mode in the PHY node (not the parent
> controller node).
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>   drivers/phy/renesas/phy-rcar-gen3-usb2.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index 218b32e458cb..4eaa228ebd30 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -408,7 +408,12 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>   		if (rcar_gen3_needs_init_otg(channel))
>   			rcar_gen3_init_otg(channel);
>   		rphy->otg_initialized = true;
> -	}
> +	} else
> +		/* Not OTG, so dr_mode should be set in PHY node */
> +		if (usb_get_dr_mode(channel->dev) == USB_DR_MODE_PERIPHERAL)
> +			writel(0x80000000, usb2_base + USB2_COMMCTRL);
> +		else
> +			writel(0x00000000, usb2_base + USB2_COMMCTRL);
>   
>   	rphy->initialized = true;
>   
> @@ -638,6 +643,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>   	if (of_property_read_bool(dev->of_node, "renesas,uses_usb_x1"))
>   		channel->uses_usb_x1 = true;
>   
> +

    Unrelated whitespace tweaking? :-)

>   	/*
>   	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
>   	 * And then, phy-core will manage runtime pm for this device.

MBR, Sergei
