Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB00362F41D
	for <lists+linux-usb@lfdr.de>; Fri, 18 Nov 2022 12:59:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232902AbiKRL7j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Nov 2022 06:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbiKRL7i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Nov 2022 06:59:38 -0500
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E97511C32
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 03:59:37 -0800 (PST)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1322d768ba7so5674348fac.5
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 03:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lEPyQ6U0nByWtgfCGmk06uBQnhV7onDOMxZ+Re2Z62c=;
        b=BRU4BLYTqQdQTF+UGWI7JcvIo/e+J9I73OpXkKvFQ//Ed8MM4rY+zPOvhEEIJh0y8n
         ZAc96Bq2chWNCQocl0xSHHUJP/N3uVeZOZ+aY358ZbUnqmK7EOk7ColTQpyICETicYfp
         eCNRxKkY6kntuo+Cr1TonXlxQrOOILhwyz2YQbkHeWb7eu8o2Yoqw7a2OQlzvLxn/hwb
         1qKsjK5oAXzVkUvs7//vdDgPiI2spgvH/6Zi7sdWSgvNHr+slpezTEJBdpVr6JqJxtsr
         mLOg33LsFHFt/40srcRERRWptzX1FmwQH596j3GahnRORAl6XMuO2RCkE56uoQrqLrMs
         Oyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEPyQ6U0nByWtgfCGmk06uBQnhV7onDOMxZ+Re2Z62c=;
        b=qotI7R9lnzAxdZCN/bjYTl7AiRTsOkqEbuoul/mf7mqXasb/d9vkRbCAJjlW7i8fCA
         l8iBCYqwTf0hGtRWLyEnEczJCjeCGDK+ItZyxrODrbRs59+aXSqyGj6d+wAu9RmuWXYg
         lB0c2d0Vl5HWLsvUOjLD0qUdpzVbJ3AoE1pZD8SMGqjDnqu2W5HRO+zCjMrdnDqScQZ8
         OzwqqKYHXQaIsfSk4CkKPFYnyhxlNCpRhhSUiG+TxzHQdU8eTteL1RLRI45e+OTjX7UK
         4MjYOVcwbEVZ/FwrROoEjrUenYMYrgbC551X1H1ScsjkENGrGZ6FtMli/0EFx44BjS/t
         dqAA==
X-Gm-Message-State: ANoB5pm7JqmukCqgBV3jm5chx13FUf7Ft8DCaARt1nc9MjCBUbuz9nc+
        f/lO1cp/uT90dB8Rm4/vvnytvntne6I=
X-Google-Smtp-Source: AA0mqf4VRnKFS1viWxlvCVV2O3reLJA9REiDMMgeB0shZI2Ep1tGDlXf7csFWDSC1M4rC1h0+IMYiQ==
X-Received: by 2002:a05:6870:a2c8:b0:13c:787e:14b8 with SMTP id w8-20020a056870a2c800b0013c787e14b8mr3770620oak.153.1668772776738;
        Fri, 18 Nov 2022 03:59:36 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s23-20020a4aead7000000b0049ded99501bsm1284028ooh.40.2022.11.18.03.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 03:59:35 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 18 Nov 2022 03:59:34 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com,
        jun.li@nxp.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH] usb: typec: tcpci: fix of node refcount leak in
 tcpci_register_port()
Message-ID: <20221118115934.GA3670981@roeck-us.net>
References: <20221118081454.4003502-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118081454.4003502-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 18, 2022 at 04:14:54PM +0800, Yang Yingliang wrote:
> I got the the following report:
> 
>   OF: ERROR: memory leak, expected refcount 1 instead of 2,
>   of_node_get()/of_node_put() unbalanced - destroy cset entry:
>   attach overlay node /i2c/pmic@34/tcpc/connector
> 
> The 'fwnode' set in tcpci_parse_config(), its node refcount is
> increased in device_get_named_child_node(). It needs be put while
> exiting, so call fwnode_handle_put() in the error path of
> tcpci_register_port() and in tcpci_remove() to avoid leak.
> 
> Fixes: 5e85a04c8c0d ("usb: typec: add fwnode to tcpc")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/tcpm/tcpci.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index b2bfcebe218f..ade0a53b40ef 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -794,8 +794,10 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
>  		return ERR_PTR(err);
>  
>  	tcpci->port = tcpm_register_port(tcpci->dev, &tcpci->tcpc);
> -	if (IS_ERR(tcpci->port))
> +	if (IS_ERR(tcpci->port)) {
> +		fwnode_handle_put(tcpci->tcpc.fwnode);
>  		return ERR_CAST(tcpci->port);
> +	}
>  
>  	return tcpci;
>  }
> @@ -857,6 +859,7 @@ static void tcpci_remove(struct i2c_client *client)
>  		dev_warn(&client->dev, "Failed to disable irqs (%pe)\n", ERR_PTR(err));
>  
>  	tcpci_unregister_port(chip->tcpci);
> +	fwnode_handle_put(chip->tcpci->tcpc.fwnode);
>  }
>  
>  static const struct i2c_device_id tcpci_id[] = {
> -- 
> 2.25.1
> 
