Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25E01398782
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 13:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhFBLB4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 07:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbhFBLBz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Jun 2021 07:01:55 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE3AC061574
        for <linux-usb@vger.kernel.org>; Wed,  2 Jun 2021 04:00:09 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id o5-20020a4a2c050000b0290245d6c7b555so444764ooo.11
        for <linux-usb@vger.kernel.org>; Wed, 02 Jun 2021 04:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4iv9A1h3PK60MWJoqpicapRrY1GvyL7D/2sytv0f/5o=;
        b=sEBdi3PzVgCvOSt5hhQe1c2mhISMyyvbs2MtNRYzbXIADcouu08Upa1pEZCVVXjGDu
         8d0EUPuXsyX6POjPT/qsVcgmeen0Y/6PmoT15aJHlW18CKGIx/70wwwRMZDmMIVv7Ke6
         AWaBdpHLFd3IZbXPAHyW6XM/TiSVxIdA4+yZkszj7F5ElnDFkm1iqFevfOXGIHiv8G1M
         viL+gQHi/tH5Yz0RILR3ij4XU4lq+h/hh+AZt0/lXDpTqrkbgefPOseMd//5nrkTLaVo
         oOmHnQK8bHqxGnjaYd/g2CvLN+OTa4hhKqpjsr5jxkfAuQ0RHKsQL0wa4SDRAnCdZPGV
         6cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=4iv9A1h3PK60MWJoqpicapRrY1GvyL7D/2sytv0f/5o=;
        b=CT5Owddc/4/NaRiRfFqsYlBDY5dG21mLOE7BiRpyRV3utNVyNu9KTuzs5wHWOfmqoM
         UodPU6p6k2a4ll+QNxjj/a1SOLkii5wI2CWpOVG8iAXbWjr+pl+nELfTc2S4tEMBX7k8
         6KC5E9b8PZfCRol44yr61/PIpdCwdaSl3/uHQzPll8zoUZ6gwLryojERrcDnWeRscACG
         kWVI7Wbu0avpUSVbKK61l8FOO1GLDCDOPa917fEbsBPw7kPnTWQzKwHbaDbGW67uhPmT
         StojQeeI0a4U0dvoowzKV66TfWlQlJbeVSn3TwtRb+GZPBKZNATVIAXhnu1ac6GplnkC
         JNEg==
X-Gm-Message-State: AOAM530nIO5pmdEO9Uz0wckXvutUPQsmkdZ8hiwCjV/YiO8QgS9NLr/j
        HFoMIwIFehpAycr1F9U4bFDqg7WncyY=
X-Google-Smtp-Source: ABdhPJzIPJKAx/T5BYjcs+5qYJsNyz9lDynbkmUeEyDwBA4NT49q+r3q15GxV+RD6vus62i/WYuGIQ==
X-Received: by 2002:a4a:b2ca:: with SMTP id l10mr22402498ooo.30.1622631609244;
        Wed, 02 Jun 2021 04:00:09 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r19sm3960639ooj.5.2021.06.02.04.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 04:00:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 2 Jun 2021 04:00:07 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Li Jun <jun.li@nxp.com>
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: typec: tcpm: cancel send discover hrtimer when
 unregister tcpm port
Message-ID: <20210602110007.GI1865238@roeck-us.net>
References: <1622627829-11070-1-git-send-email-jun.li@nxp.com>
 <1622627829-11070-3-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622627829-11070-3-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 02, 2021 at 05:57:09PM +0800, Li Jun wrote:
> Like the state_machine_timer, we should also cancel possible pending
> send discover identity hrtimer when unregister tcpm port.
> 
> Fixes: c34e85fa69b9 ("usb: typec: tcpm: Send DISCOVER_IDENTITY from dedicated work")
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index c7460df2119d..2899c9de6d20 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -6328,6 +6328,7 @@ void tcpm_unregister_port(struct tcpm_port *port)
>  {
>  	int i;
>  
> +	hrtimer_cancel(&port->send_discover_timer);
>  	hrtimer_cancel(&port->enable_frs_timer);
>  	hrtimer_cancel(&port->vdm_state_machine_timer);
>  	hrtimer_cancel(&port->state_machine_timer);
> -- 
> 2.25.1
> 
