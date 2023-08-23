Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77CE3785922
	for <lists+linux-usb@lfdr.de>; Wed, 23 Aug 2023 15:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235759AbjHWN0D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Aug 2023 09:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235806AbjHWN0A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Aug 2023 09:26:00 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E6A171E
        for <linux-usb@vger.kernel.org>; Wed, 23 Aug 2023 06:25:35 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-68a3082c771so2663971b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 23 Aug 2023 06:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692797132; x=1693401932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+MaBF28RpO/Li0UPbf4acyowfX2O1wSCCz1R8T6OAps=;
        b=JNmIO2jWMRSiAoCpQRsqc/l9u9gZ4AyubKwUe6u9vgumLLBZSQOO+/E5pgJPWY63Zg
         Ens2CQOCvT8Qp0lzEefvZYUaboBMWwFZ4LpfwLuIKanwZhUlJKOeQJSdl2Uf6pboI9w0
         Dc3P8WPq7VUto/t2L4ejtB3pgUq+GWOtCDNlA1t4lOF+snC5yjM+OgqjJW6FhMR5FLv9
         OY8J1Gm6H2v++RyY/n9+vufE+b5/HnD4Wb1JHiMpMrG5PT4dadaGO2EhS/9quimzZqq1
         25JTanujcByumbiUyTu5HliQMNX8zIJe+RCHDQtXvLTeiTJzTWOlkJuCAG8Se9GgJ5eo
         Gowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692797132; x=1693401932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+MaBF28RpO/Li0UPbf4acyowfX2O1wSCCz1R8T6OAps=;
        b=legotva2ufndPpsNyiut8Z2OeWXYPlpUnrWwWK8NG5V+sR32kMRu5eVjFacv5T9YbS
         O8z6eH0YJxo41zj1am7iAM5bkLwdYPr2RhC33dXn/E8oeC7jf+4GMj0sNhfrbRiy+y/+
         Dpv04D9JKHmjEzdZmG8B9CypHoNQ3JiPLrKrHoe6756un7B13eGbIaOID1u9TAWFdE1+
         OX30pvo4MUsYl0kW2lEw+chY9RvfqI4qs9ZGwFEbQpru9SN1fDB1kxnakepGkjIu+DIK
         YG+SNrxFaFWQIeBI0YJr7X5fBuP0ZoWxhf+N7lpRt0WMdYXIE62bvE4sP/Hbv8/2voTa
         2Buw==
X-Gm-Message-State: AOJu0YzRDr/uKe4zmd1oT6NsdBqOCyw+sPAM8OgCVDoHN61gYnvxyOyW
        +H8ClmG2uDaPEpn9sThCNaM=
X-Google-Smtp-Source: AGHT+IGGwca4bw+8Z7fwBA+S1exLVGiNB6vD3lbtEbGATA73MStM/pZUm8WUCt214rfQF+iHUn+cgw==
X-Received: by 2002:a05:6a00:ccd:b0:68a:45a1:c0f7 with SMTP id b13-20020a056a000ccd00b0068a45a1c0f7mr15489394pfv.8.1692797131500;
        Wed, 23 Aug 2023 06:25:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o15-20020a637e4f000000b00565e96d9874sm9628403pgn.89.2023.08.23.06.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 06:25:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 23 Aug 2023 06:25:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpm: reset counter when enter into
 unattached state after try role
Message-ID: <239ec364-909f-4183-aeab-474e6ef97e48@roeck-us.net>
References: <20230820151518.1403006-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230820151518.1403006-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Aug 20, 2023 at 11:15:18PM +0800, Xu Yang wrote:
> The try_src_count and try_snk_count may still be 1 after enter into
> unattached state. This may be caused by below case:
>  - SNK_TRY->SNK_TRY_WAIT->SRC_TRYWAIT->SNK_UNATTACHED
>  - SRC_TRY->SRC_TRY_WAIT->SNK_TRYWAIT->SNK_UNATTACHED
> 
> The port->attached is not true at the end and tcpm_reset_port() will not
> be called. This will reset counter into for these cases, otherwise the tcpm
> won't try role when new cable attached.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 5639b9a1e0bf..c9a186a8c58c 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -3719,6 +3719,9 @@ static void tcpm_detach(struct tcpm_port *port)
>  	if (tcpm_port_is_disconnected(port))
>  		port->hard_reset_count = 0;
>  
> +	port->try_src_count = 0;
> +	port->try_snk_count = 0;
> +
>  	if (!port->attached)
>  		return;
>  
> -- 
> 2.34.1
> 
