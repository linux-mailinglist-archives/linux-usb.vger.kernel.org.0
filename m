Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50D905E660A
	for <lists+linux-usb@lfdr.de>; Thu, 22 Sep 2022 16:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbiIVOmw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Sep 2022 10:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbiIVOmv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 10:42:51 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDBB926EE
        for <linux-usb@vger.kernel.org>; Thu, 22 Sep 2022 07:42:50 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id c24so8997499plo.3
        for <linux-usb@vger.kernel.org>; Thu, 22 Sep 2022 07:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=hUQtU3CWejqOHDOux0NTs6W081lBfOL85tBQ5ZdfIxs=;
        b=AoQXWwTzmLoeyiVz/uBLYwyIIHvCNxtgSNZJMAi3VGkI3GsYz9B8x5CnLqfk1q/wmE
         u3dy43RUUA4wiVDKMsBuZPn0S55uUFvA29/31h4jCqF8Q8f0ypyNqjPfFR8AdEky69Da
         PBTEMDYOA/qJmhH5B+k3qDHH0+nRJR0d6BEYZDUO6C/5NAEV4pvQXHSGDm7Jc8eIJLmB
         8XzP8V7Rupl4e76UTOJmEARGe5Rh76U/lIwuA+pS3o/IjvcIBhrHoiI20PgxRJ/pcKaX
         G8HAoTtmx6h/aBwaK+1Hha3DN1uX/NUL+3a1DLtRM9P7cfsoBaV/pjF7cV5AApj/mlVS
         Jx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=hUQtU3CWejqOHDOux0NTs6W081lBfOL85tBQ5ZdfIxs=;
        b=Enwh/0nz5TyWdpeCM18jfG5OyPHciHLbRi4ovUDdsBaua9ozq398G6u3eFE5HW4lJt
         wbNMCkNEJgV45uvZFjNew+zjQN7Fya0lcdeWutxk3A/DZWB5/xa5+j1DEtro7M++xX8a
         dayDvD6ORmAWWmcc21UafKeYwtocAbAkN8zjrqMbxJLaKjXUCpyWDcYU+5bUdW30DpBk
         HszUCTV3lvDcpgf7VLrr05KeHHPqDctXsSgRYCeoPsZOFtma1MpD0XFADmdkuP1Dx0+q
         sDv7bSH0sPP47hTtNivb5z9SuqKBGQhU4MghGKuns6LHkxRzcDG8uECWSdUU3d0WREn5
         MhrQ==
X-Gm-Message-State: ACrzQf0HZ10GaHkhv47ubO2VrSlWNFcFr7fIfvXaDgXCHscJsC0xyaeo
        2uP2+r3HaHTaubWDSRrLjw0GwtrZgB39UA==
X-Google-Smtp-Source: AMsMyM6vW8GW1hXPoiCK+kf4rV3Fcy4o/VtnD6kAA09JTmiLcPpcrSb8fmuh3jhlsTpfuN0X/gA40Q==
X-Received: by 2002:a17:902:d484:b0:178:1b69:1488 with SMTP id c4-20020a170902d48400b001781b691488mr3719990plg.156.1663857770221;
        Thu, 22 Sep 2022 07:42:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902680600b001782f94f8ebsm4259439plk.3.2022.09.22.07.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 07:42:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6b8b8858-3600-f3ed-8981-c461ed1ffa55@roeck-us.net>
Date:   Thu, 22 Sep 2022 07:42:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH -next] usb: typec: fusb302: Switch to use dev_err_probe()
 helper
Content-Language: en-US
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-usb@vger.kernel.org
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
References: <20220922134806.2204579-1-yangyingliang@huawei.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220922134806.2204579-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9/22/22 06:48, Yang Yingliang wrote:
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs. It's more simple in error path.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/usb/typec/tcpm/fusb302.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index db83b377b2f6..721b2a548084 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -1743,9 +1743,8 @@ static int fusb302_probe(struct i2c_client *client,
>   	chip->tcpm_port = tcpm_register_port(&client->dev, &chip->tcpc_dev);
>   	if (IS_ERR(chip->tcpm_port)) {
>   		fwnode_handle_put(chip->tcpc_dev.fwnode);
> -		ret = PTR_ERR(chip->tcpm_port);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "cannot register tcpm port, ret=%d", ret);
> +		ret = dev_err_probe(dev, PTR_ERR(chip->tcpm_port),
> +				    "cannot register tcpm port\n");
>   		goto destroy_workqueue;
>   	}
>   

