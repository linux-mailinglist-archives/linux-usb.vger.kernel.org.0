Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8F2C398780
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 13:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhFBLBl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 07:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbhFBLBi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Jun 2021 07:01:38 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93AD3C061574
        for <linux-usb@vger.kernel.org>; Wed,  2 Jun 2021 03:59:54 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id x196so1838755oif.10
        for <linux-usb@vger.kernel.org>; Wed, 02 Jun 2021 03:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lO8UHG4gGqP7TS91KLY3JfRBF+Xe1poMVHIkxpVLkOM=;
        b=FIipVdnczvDz9Avm995NLpRr8l9KrgIkrrGHYfXi06mZxiH+iFWZtrn2+lYDye/H18
         tE5k29HTu+T16sN+LaBNX90t9hGk1wVJyuOypEkQhEEC87PZlX4WSAOiw/IL3lS7jFS6
         UGh3r/42ehHINSuFCSL+0A5xT/A8XZSZy3TyXYlvFeGLyNroMzGmiYmeSdvnAmuGULpe
         Pxh1X6UE0GrdAph8PQfoKiScGPJfMq/dTYMKT6KBVoGvV0CQGu3vJvHjX3BBSJoqk6Tj
         M/sP5CAzeXprvgq7Tc+Xge5Cdpe+8eLcDTqJG19juMKkXZVp6KYmlxu2ojXj9+bbnBW7
         Dx1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=lO8UHG4gGqP7TS91KLY3JfRBF+Xe1poMVHIkxpVLkOM=;
        b=f90+2uMxIGHYhPxvdJzI4n73Qnj7MZ3oWTA2MMfyg61lh9ExZ9az0cVyDo+0WsMewZ
         Cl/MMKn+BtCXK6e03rTPJ7tFIc7Hjwrn7v7ixyHU/J/4og/mZDPxKlIysvnPOZjkzEMl
         +99GkZQD3Aom+91zJXw5JlXJ/obw7T0XOjNAvRIsKDaMp04tVs5PGd2VR0d393DbY3iV
         C0lwNuBAJJE7ik8rRLPCw3ZDgpVHd3HFT4JXYSXSLIAeoQzHVzRDJ0ui+XxThYbRNWHg
         zOgMvjhzkta3FogQhnoXc1NDcegb8nFqqhxpWI3Wn/Ll6e+FfuDkbVQ1W/Nehrz4mr8Z
         DwZg==
X-Gm-Message-State: AOAM531HuBLzOSNKJCFWMhqyuh2lYWdkfqhjwk+D49Axbb6mLiClWWiB
        T0VDWf9V4N/Q2LzFvI9eOOg=
X-Google-Smtp-Source: ABdhPJwc6jdJhHhu8fXCBJfDpI7dleurR9+HtISg4Ass5Kj+FgzEs7b8k7KHoqY/OJ4zcqvwIIlPyw==
X-Received: by 2002:a05:6808:4a:: with SMTP id v10mr21347776oic.79.1622631594043;
        Wed, 02 Jun 2021 03:59:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f2sm4327366otp.77.2021.06.02.03.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 03:59:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 2 Jun 2021 03:59:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Li Jun <jun.li@nxp.com>
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: typec: tcpm: cancel frs hrtimer when unregister
 tcpm port
Message-ID: <20210602105952.GH1865238@roeck-us.net>
References: <1622627829-11070-1-git-send-email-jun.li@nxp.com>
 <1622627829-11070-2-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622627829-11070-2-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 02, 2021 at 05:57:08PM +0800, Li Jun wrote:
> Like the state_machine_timer, we should also cancel possible pending
> frs hrtimer when unregister tcpm port.
> 
> Fixes: 8dc4bd073663 ("usb: typec: tcpm: Add support for Sink Fast Role SWAP(FRS)")
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index f47685e7923d..c7460df2119d 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -6328,6 +6328,7 @@ void tcpm_unregister_port(struct tcpm_port *port)
>  {
>  	int i;
>  
> +	hrtimer_cancel(&port->enable_frs_timer);
>  	hrtimer_cancel(&port->vdm_state_machine_timer);
>  	hrtimer_cancel(&port->state_machine_timer);
>  
> -- 
> 2.25.1
> 
