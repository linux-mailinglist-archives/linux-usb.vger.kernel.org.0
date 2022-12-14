Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC7B064CE9B
	for <lists+linux-usb@lfdr.de>; Wed, 14 Dec 2022 18:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237451AbiLNRFB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Dec 2022 12:05:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237391AbiLNREs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Dec 2022 12:04:48 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA83D29C9F
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 09:04:47 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id v82so3133116oib.4
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 09:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pR3minfJqWnquDQjiHzTlYqzXl7Tt7gM2OigMW/iecY=;
        b=Jf5aGk/M7kXMsQ902xV3TRzbIctL/zVLU9X9TDTUS4sMVZTpjEyoVW39TpEXo+3794
         VKim8EC/1SVtduHUPmXPwadF81HDcNdf9FoGfPlk1lOlhgVQ470ui/VDDY+EFku15UV6
         HEUzJ1oHc8oClCFPsCiJ05Hm5l9FnncU6eJpizwHbkXWGXj4n+KdmMpeG8giosDgLonQ
         uy+gSTRagYtv+4LT6N5eCrjTzNyd5dZ9Qah2faZTjzQhfr9fhrhSKOpxyEc3FB0PQscF
         ME3xcLT0OLrTbuKEtFkObn5TFS1DgC2bQjKADrv3YbfaYHC4RlIC8S+29KQfjWJZva/5
         SocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pR3minfJqWnquDQjiHzTlYqzXl7Tt7gM2OigMW/iecY=;
        b=gbU3Djo2OA3da6DiZam8Q+N1mExQcJ7DQ/L9pVAVo5F8ach77HpCS9gdotIa4mK7AP
         PE+Ot+5jdSnCna38B9wLg5KCGn8fpxR4OpqWYQIKY5PfZdUYr+FLZTU579ozVmRlnGsv
         ncNuV5zCRDY87PWWBbLUX1/8ZNnPpbcXn2yVCd4BrCD6Y0osA3WIjUpoA+ljAPI8BuqG
         qIAGGax/9BXyAvCeuZ0xkNIBb/fgivBQUo85FMgchfIs16z8qJS5V2rLnNX79/xKF91G
         CI4tvAacnHYE5c+TVRuFxeogLA0/ZZo8tdaxhdDxP3NNOLvgtJdsXjvZwn2Nbnf7Z79G
         eE1g==
X-Gm-Message-State: ANoB5pnkxIAlzl5wnUUj+u9LFRxFrPo3mGT+5EjFFOvsHy9/aU/I/xFw
        TFzIHmCT/a9LhVC92ITRk9+j6gmCDUw=
X-Google-Smtp-Source: AA0mqf7tjbohaIhjJ0t2ocNMOLqfVbBMovYNSP2jz+EwTdkZTtyBtqTpM0LgfNx4afRc/mBg6MzzYQ==
X-Received: by 2002:a05:6808:4087:b0:35e:bc7b:20e0 with SMTP id db7-20020a056808408700b0035ebc7b20e0mr2390640oib.38.1671037487196;
        Wed, 14 Dec 2022 09:04:47 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bl5-20020a056808308500b0035bf6b2afdesm118295oib.9.2022.12.14.09.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 09:04:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <218dbd73-d2fc-c316-ee02-43a462268f2b@roeck-us.net>
Date:   Wed, 14 Dec 2022 09:04:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com
References: <20221214022334.2520677-1-xu.yang_2@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] usb: typec: tcpci: Request IRQ with IRQF_SHARED
In-Reply-To: <20221214022334.2520677-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/13/22 18:23, Xu Yang wrote:
> Under resource constraints, this interrupt may use other interrupt line
> or this interrupt line may be shared with other devices as long as they
> meet the sharing requirements. Besides, This irq flag will not cause other
> side effect if tcpci driver is the only user.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Note: I initially thought that introducing alert_mask is overkill, but
the tcpci specification suggests that alert bits may be set even for
alerts disabled with the alert mask. So this code is ultimately simpler
than trying to determine in the interrupt handler which bits are actually
set in the alert mask.

Thanks,
Guenter

> 
> ---
> Changes since v1:
> - return IRQ_NONE if the interrupt doesn't belong to this device
> ---
>   drivers/usb/typec/tcpm/tcpci.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index fe781a38dc82..c7796511695d 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -33,6 +33,7 @@ struct tcpci {
>   	struct tcpm_port *port;
>   
>   	struct regmap *regmap;
> +	unsigned int alert_mask;
>   
>   	bool controls_vbus;
>   
> @@ -632,6 +633,9 @@ static int tcpci_init(struct tcpc_dev *tcpc)
>   		if (ret < 0)
>   			return ret;
>   	}
> +
> +	tcpci->alert_mask = reg;
> +
>   	return tcpci_write16(tcpci, TCPC_ALERT_MASK, reg);
>   }
>   
> @@ -715,7 +719,7 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>   	else if (status & TCPC_ALERT_TX_FAILED)
>   		tcpm_pd_transmit_complete(tcpci->port, TCPC_TX_FAILED);
>   
> -	return IRQ_HANDLED;
> +	return IRQ_RETVAL(status & tcpci->alert_mask); >   }
>   EXPORT_SYMBOL_GPL(tcpci_irq);
>   
> @@ -838,7 +842,7 @@ static int tcpci_probe(struct i2c_client *client)
>   
>   	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
>   					_tcpci_irq,
> -					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
> +					IRQF_SHARED | IRQF_ONESHOT | IRQF_TRIGGER_LOW,
>   					dev_name(&client->dev), chip);
>   	if (err < 0) {
>   		tcpci_unregister_port(chip->tcpci);

