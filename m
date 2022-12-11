Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39B026494FD
	for <lists+linux-usb@lfdr.de>; Sun, 11 Dec 2022 16:56:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbiLKP4S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 11 Dec 2022 10:56:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbiLKP4R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 11 Dec 2022 10:56:17 -0500
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC43BC06
        for <linux-usb@vger.kernel.org>; Sun, 11 Dec 2022 07:56:16 -0800 (PST)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-143ffc8c2b2so5751190fac.2
        for <linux-usb@vger.kernel.org>; Sun, 11 Dec 2022 07:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KM82x8OsRqrW9i4lpQl18e2A2KbF6ntkivK489goTq0=;
        b=fTHYOMzGMhh+aeOhl04myUltqjG1RzFqBJHyyRB3iD1APIa63rRXmIqz4TfMhNC/vb
         HyuS/C0jHsGRMp9bBZ1U2vSzeOBHBnke7KNmkvolxTd4lqmy5Lh6EEYW0nYCsma0A4Vq
         EJkGZZPtYTy+LxkFcWKoP2YnJ33lvRbmIOQ4ruDj+9HUkQQxEhjjQl6JRsrJuz5EJjLc
         pgO+3tdVL+aVswZkyLMR9YVjYQcjwcZFq0546274325QBmHMbS6gyJSsvMzX4nOLaXNA
         rHzsfIgW5lnyxTgYeKNMaFl2DVIurFD9QIbxx33TMZvGM+pHTaLFuEAJF+sXh5loA/et
         RIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KM82x8OsRqrW9i4lpQl18e2A2KbF6ntkivK489goTq0=;
        b=RgnWByJmHbKYXowttyRiPxsuXXaGV04LtvFZK7ChLfIjvtGxqvUXl47jU4FgcbylKj
         9N+7r0lNWAwwtlz7g4025F/LjO4EV3d7hsfU7kDV0axm2IB4sh1qDoHfjATJNdliKtoF
         LgDx2A6Rgp8mgtWd80hw2PPHNEcRaXKQxWBEo/lB/IEeBIi7ugZZMZC6MzRDk368bA/Y
         DkHSPO0tgqgAuY25upkaUL4xwj5Swntl0Z6QqFJ3jfWHe0ps2F6XuZbbHZyeF8CpjIlu
         v1tLGoNZSGk/ZWs/SgO+Df97sX6zp8Nz9i0x7sClRM2dcf3qEOemCDuUVyjPTJ4vRo/l
         gniA==
X-Gm-Message-State: ANoB5pn40Cw2vf7PZueZmNoRQ4gEeO0Fu/d0E+0NvINP/+/5iI/zcZjE
        /9MbBHzM3tWg27XeAn2Wr4c=
X-Google-Smtp-Source: AA0mqf4ItwTmbV2wHKU91qKzdi4kh9SHfyCk+Cv5snxwgvu+fOsjr+uEMhvlCzkwwMWFnuytBrqM1w==
X-Received: by 2002:a05:6870:5821:b0:143:dc4d:4fcb with SMTP id r33-20020a056870582100b00143dc4d4fcbmr6700537oap.43.1670774175524;
        Sun, 11 Dec 2022 07:56:15 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id cv39-20020a056870c6a700b0010c727a3c79sm3828428oab.26.2022.12.11.07.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Dec 2022 07:56:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <908adfb7-c5f5-b69c-1771-dc346ecbb0da@roeck-us.net>
Date:   Sun, 11 Dec 2022 07:56:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com
References: <20221208071648.2379254-1-xu.yang_2@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] usb: typec: tcpci: Request IRQ with IRQF_SHARED
In-Reply-To: <20221208071648.2379254-1-xu.yang_2@nxp.com>
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

On 12/7/22 23:16, Xu Yang wrote:
> Under resource constraints, this interrupt may use other interrupt line
> or this interrupt line may be shared with other devices as long as they
> meet the sharing requirements. Besides, This irq flag will not cause other
> side effect if tcpci driver is the only user. So a kindly wish to add this
> flag.

The last sentence is not appropriate for a commit description.

> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>   drivers/usb/typec/tcpm/tcpci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index fe781a38dc82..223a1de4fb1d 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -838,7 +838,7 @@ static int tcpci_probe(struct i2c_client *client)
>   
>   	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
>   					_tcpci_irq,
> -					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
> +					IRQF_SHARED | IRQF_ONESHOT | IRQF_TRIGGER_LOW,
>   					dev_name(&client->dev), chip);
>   	if (err < 0) {
>   		tcpci_unregister_port(chip->tcpci);

I don't think this is sufficient. The interrupt handler always returns
IRQ_HANDLED, even if the interrupt status was 0 and the handler did not do
anything. It should return IRQ_NONE in that case.

Guenter

