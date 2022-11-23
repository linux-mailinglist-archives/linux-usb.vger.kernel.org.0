Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81A4D63658E
	for <lists+linux-usb@lfdr.de>; Wed, 23 Nov 2022 17:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238759AbiKWQSm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Nov 2022 11:18:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238502AbiKWQSk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Nov 2022 11:18:40 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D391374AA8
        for <linux-usb@vger.kernel.org>; Wed, 23 Nov 2022 08:18:39 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id n205so19536094oib.1
        for <linux-usb@vger.kernel.org>; Wed, 23 Nov 2022 08:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FK7OzDutJXL4x3nOMwAL8QRV7ZrRIuLLqcVXNC+ZYvY=;
        b=DhkCQTQjMrc619ra32spj3aSCLtTrU6wN5xGjnM1jbDVL3sk/gLE6+6wZRVasaf+nK
         NnRDJ/MMVU4EgGmlLbgVIbfnPDtlWqwlFo1kK4ckCcAXLReXCzZyTbabHiTvUP4/auMG
         04hTg/jy6+1Yvc/mggdD9Brs9LWJL2stywEOdTpa/MIVpj/srsuWeqm+kasBnY0aPE08
         T0SRRSZW21hPEhXO6ZTvYxAvHxsYH9qSeQtCXH9916crnmCowSFy5TjXTKNwfkIkK24c
         Jrxr4uo2GjxrSshl9Onf7r9gOdeywmdg+itinr2XzlDbPJBD8hEyJfQAF1QkEY1VzEaF
         VHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FK7OzDutJXL4x3nOMwAL8QRV7ZrRIuLLqcVXNC+ZYvY=;
        b=70FS4HtcEdO8VurdEhPUP7ntRfwdgF6/tHmPFgfAmk0UbGPq+wHioLRzpxP5oslalJ
         +ZYY+09Zv22Gtsnla3wPXN22XvhWqNCN+qySJ+90d/HvFO2VCGS0r52u8grw+xsZivZ8
         QEpmfJ7J27cC7OroOniXtnJmbgvBTTD037y84FSyEkfdjQlnv4qI2L6sPA8EhSZdJX4/
         4bGlE7Pr1APjcigWv/73A/LU9DGfbzPi9mOQPJ904tDhUnIidV6G6iSJ5nJU1qpL9ZDE
         R6UPmAIVOxVOZVHGn7eWCTiifgzFu/OTCGAIx2+uxjeseupXWJGOVu9qIq5DR/+J3EnV
         6I9A==
X-Gm-Message-State: ANoB5pnebCg98qzXWKrlKrHQo0MIQ3+stgU33IGOU3gS6XydWPCLkoeE
        r6N2Iuids1mmk9CAD0sLSf4=
X-Google-Smtp-Source: AA0mqf7jGiOwcyuwXfJyic0muzMcQ4Ut/GVqWVlMsZ16HcXv3/BRqmRbXhD3LnPbbTcMwg/97U0uZQ==
X-Received: by 2002:aca:a946:0:b0:350:e9a8:1583 with SMTP id s67-20020acaa946000000b00350e9a81583mr16923896oie.281.1669220319128;
        Wed, 23 Nov 2022 08:18:39 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i10-20020a05683033ea00b00666a5b5d20fsm7408881otu.32.2022.11.23.08.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 08:18:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 23 Nov 2022 08:18:36 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com,
        jun.li@nxp.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH v3] usb: typec: tcpci: fix of node refcount leak in
 tcpci_register_port()
Message-ID: <20221123161836.GA2374110@roeck-us.net>
References: <20221121062416.1026192-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121062416.1026192-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 21, 2022 at 02:24:16PM +0800, Yang Yingliang wrote:
> I got the following report while doing device(mt6370-tcpc) load
> test with CONFIG_OF_UNITTEST and CONFIG_OF_DYNAMIC enabled:
> 
>   OF: ERROR: memory leak, expected refcount 1 instead of 2,
>   of_node_get()/of_node_put() unbalanced - destroy cset entry:
>   attach overlay node /i2c/pmic@34/tcpc/connector
> 
> The 'fwnode' set in tcpci_parse_config() which is called
> in tcpci_register_port(), its node refcount is increased
> in device_get_named_child_node(). It needs be put while
> exiting, so call fwnode_handle_put() in the error path of
> tcpci_register_port() and in tcpci_unregister_port() to
> avoid leak.
> 
> Fixes: 5e85a04c8c0d ("usb: typec: add fwnode to tcpc")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v2 -> v3:
>   Move fwnode_handle_put() into tcpci_unregister_port().
> 
> v1 -> v2:
>   Add description to how is the report generated and
>   the review tag from Guenter.
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index b2bfcebe218f..72f8d1e87600 100644
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
> @@ -804,6 +806,7 @@ EXPORT_SYMBOL_GPL(tcpci_register_port);
>  void tcpci_unregister_port(struct tcpci *tcpci)
>  {
>  	tcpm_unregister_port(tcpci->port);
> +	fwnode_handle_put(tcpci->tcpc.fwnode);
>  }
>  EXPORT_SYMBOL_GPL(tcpci_unregister_port);
>  
> -- 
> 2.25.1
> 
