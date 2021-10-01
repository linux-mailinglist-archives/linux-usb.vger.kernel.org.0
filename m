Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9120541EE3C
	for <lists+linux-usb@lfdr.de>; Fri,  1 Oct 2021 15:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231528AbhJANHx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Oct 2021 09:07:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354011AbhJANHp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Oct 2021 09:07:45 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E0FC0613E5
        for <linux-usb@vger.kernel.org>; Fri,  1 Oct 2021 06:06:01 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id x33-20020a9d37a4000000b0054733a85462so11369068otb.10
        for <linux-usb@vger.kernel.org>; Fri, 01 Oct 2021 06:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W0/sIeZEiNh8HScFCfqMG9usjQt7KqEoDwQwgA0HSn0=;
        b=qQ6daZwVsLHkYimlvLtypZal4FN5OdlF1UFCIBBEBiOP3Sx61/R2ceXrZOGYxNwCIc
         WsYoU8J7a9OqsK5rvb7ySN/m4Uom66O2bCHggObfziE4cbtG4eSufPqHfnfNjc/lm0IY
         w93ufgDi3EtTeEmSiidjrY9F845Mb/tpwbQROiX9jymIFk+i/tpdImT5zYQPdPZdbY42
         517m/ISyktXwMGRYuZMPHxtjmMqygLCLL3vk3r+1Aig1wV35TO/lIgwQOFmXS0UX0FLT
         yihU1gvhTOO9eoAa1cjU8VJNPJzYRb0nU28fsDeNWNK95OoQ4ksrWNF/G/87hb8g/mcj
         soVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=W0/sIeZEiNh8HScFCfqMG9usjQt7KqEoDwQwgA0HSn0=;
        b=L65TCnZy9LUm9TwZzT4ZgCm7elJVjk+IR9bOmzyLCvMkDMeUBOQi+73dO1x4gml6Rs
         gtDe1KzURT6tPuA/I3weX7nP0z2HNppfX+htL+Nc+hldoZk+hORbnb3KPxyvvsKHDz6p
         10d0qy4UCbH9mqfL3X9YtraVxx70Oa+KCTuxNjdU1jIVm1XPqCS9H8V6vwuJ3y3R1127
         ztYgoN/WFXxM22PRHGDzRRAlhflDN34xqT8Plbydzp+5J5YOseU7p/tOLlWnffhnn2bT
         0waNUorLVU123oPS64wjqh9VTbfwyBQmDSYN7V3+X7MjC3NLCaFGL58jpDBB9W7CHAoM
         u2Rg==
X-Gm-Message-State: AOAM532poVjRWBnITd8MHcuQJhzr0Y/kduw8yUf30TJURySsBcJvzaaF
        uG2MSH+1tQ5qcBJuKZ5LlPng74AABkA=
X-Google-Smtp-Source: ABdhPJy698kocr8C0gM72o0Yz/AfR4OVMbtONgr0oeFP7Wa5IU55s/59TGBr5QbDun0u5n3zAps1bQ==
X-Received: by 2002:a05:6830:2903:: with SMTP id z3mr9945242otu.132.1633093560784;
        Fri, 01 Oct 2021 06:06:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h17sm1126256oog.17.2021.10.01.06.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 06:06:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 1 Oct 2021 06:05:58 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH 1/1] usb: typec: tcpci: don't handle vSafe0V event if
 it's not enabled
Message-ID: <20211001130558.GB549865@roeck-us.net>
References: <20210926101415.3775058-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210926101415.3775058-1-xu.yang_2@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Sep 26, 2021 at 06:14:15PM +0800, Xu Yang wrote:
> USB TCPCI Spec, 4.4.3 Mask Registers:
> "A masked register will still indicate in the ALERT register, but shall
> not set the Alert# pin low."
> 
> Thus, the Extended Status will still indicate in ALERT register if vSafe0V
> is detected by TCPC even though being masked. In current code, howerer,
> this event will not be handled in detection time. Rather it will be
> handled when next ALERT event coming(CC evnet, PD event, etc).
> 
> Tcpm might transition to a wrong state in this situation. Thus, the vSafe0V
> event should not be handled when it's masked.
> 
> Fixes: 766c485b86ef ("usb: typec: tcpci: Add support to report vSafe0V")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/tcpm/tcpci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 9858716698df..c15eec9cc460 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -696,7 +696,7 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>  		tcpm_pd_receive(tcpci->port, &msg);
>  	}
>  
> -	if (status & TCPC_ALERT_EXTENDED_STATUS) {
> +	if (tcpci->data->vbus_vsafe0v && (status & TCPC_ALERT_EXTENDED_STATUS)) {
>  		ret = regmap_read(tcpci->regmap, TCPC_EXTENDED_STATUS, &raw);
>  		if (!ret && (raw & TCPC_EXTENDED_STATUS_VSAFE0V))
>  			tcpm_vbus_change(tcpci->port);
> -- 
> 2.25.1
> 
