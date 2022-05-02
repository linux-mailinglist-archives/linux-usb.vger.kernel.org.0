Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 673CC517055
	for <lists+linux-usb@lfdr.de>; Mon,  2 May 2022 15:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352768AbiEBNe1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 May 2022 09:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385386AbiEBNeT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 May 2022 09:34:19 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49DCD5F79
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 06:30:50 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so14232835fac.7
        for <linux-usb@vger.kernel.org>; Mon, 02 May 2022 06:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=o4ys4UTCxgbuInaf7IQ9XnUorMmJznKPj9Myrkrxk8U=;
        b=Z5l/+oE0q2Rw+IXb8tkBcfxXh+RuxoZY/0wca8OJd2Erkmr9xkeoFyit4wZ0Pogf9H
         HAqGXDMIk+KBEPO35dO51eI2orv0PC/ga1RoOvb/60XNO6Y7CUHS8yJsC5INRmGRSLZD
         Mx8X53aJmG+VPNT0Zj+KBXpZ0QpuVQUP9U8ZINnMSA0/mEBDFsnb+vLWxLWvqcEdQHVk
         lI+WrnJomYcPUxQn7mloKTEnFXHaz6OsjMS/8RFmL6h7tM5XEn28SMkXH9v1QkCZ76rd
         mJRkKuCWy1qdJQFqq6mtV0jmV1RiXQ+gLMoChy8dFpsRPpFptEpvokuOECCiykVvNv8Z
         aUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=o4ys4UTCxgbuInaf7IQ9XnUorMmJznKPj9Myrkrxk8U=;
        b=0Wb/B0ECJO0NIVFnaerNyhjZjl34eeBZ0NfPZBAIZeK5ikLEFCYt2tJvUeXuQ8j5PT
         hOM3OtwWI+D8IqGIFkp4JIxoepbqRPHpn2p7By7dXCG5SHZB3Zc6RkkUUoXxNONILrat
         CGsMT6vc9fMWc0eczYiNcM1bJlXIPW0o6fFiZ5Jil8T+nQCuFyWIXRduq400/v6PWSS3
         hhSDlW+uck6zJokhu8V9RYw4DpcI6t9Fwweea9MaeJ5hCmOvHHHAzKFnhtv1NW0c/4DT
         6PbCqHbyc58HmCYQ4OqZb91kAxhqMA7m9egkYiHDmjQftK8mzosCf38lctRX+9qe5ZUp
         tdGA==
X-Gm-Message-State: AOAM531dCbVVm6Bh3Y+6Pdpvu101LefvF4nDwPO7TWLaP+zij389YELz
        qkTYEaJkUbCP6PS9FrzZIWAwBXX7knhb2Q==
X-Google-Smtp-Source: ABdhPJzB3Jwa8hmFj4vrUjkBfPmb4DF0M+UpHESQ2OzOWjAKy6bBZZs/250gWKU4TR2WmKxTKP1CHg==
X-Received: by 2002:a05:6870:9a05:b0:e6:589e:1ec5 with SMTP id fo5-20020a0568709a0500b000e6589e1ec5mr6360137oab.203.1651498249583;
        Mon, 02 May 2022 06:30:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m13-20020a9d73cd000000b0060613c844adsm1603488otk.10.2022.05.02.06.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 06:30:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <258dc3fe-7a88-c523-78e4-c3d40eca167c@roeck-us.net>
Date:   Mon, 2 May 2022 06:30:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] usb: typec: tcpci: Don't skip cleanup in .remove() on
 error
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Jun Li <jun.li@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
References: <20220502080456.21568-1-u.kleine-koenig@pengutronix.de>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220502080456.21568-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/2/22 01:04, Uwe Kleine-König wrote:
> Returning an error value in an i2c remove callback results in an error
> message being emitted by the i2c core, but otherwise it doesn't make a
> difference. The device goes away anyhow and the devm cleanups are
> called.
> 
> In this case the remove callback even returns early without stopping the
> tcpm worker thread and various timers. A work scheduled on the work
> queue, or a firing timer after tcpci_remove() returned probably results
> in a use-after-free situation because the regmap and driver data were
> freed. So better make sure that tcpci_unregister_port() is called even
> if disabling the irq failed.
> 
> Also emit a more specific error message instead of the i2c core's
> "remove failed (EIO), will be ignored" and return 0 to suppress the
> core's warning.
> 
> This patch is (also) a preparation for making i2c remove callbacks
> return void.
> 
> Fixes: 3ba76256fc4e ("usb: typec: tcpci: mask event interrupts when remove driver")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/usb/typec/tcpm/tcpci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index e07d26a3cd8e..f33e08eb7670 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -877,7 +877,7 @@ static int tcpci_remove(struct i2c_client *client)
>   	/* Disable chip interrupts before unregistering port */
>   	err = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, 0);
>   	if (err < 0)
> -		return err;
> +		dev_warn(&client->dev, "Failed to disable irqs (%pe)\n", ERR_PTR(err));
>   
>   	tcpci_unregister_port(chip->tcpci);
>   
> 
> base-commit: 3123109284176b1532874591f7c81f3837bbdc17

