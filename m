Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E361D9152
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2020 09:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbgESHtr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 May 2020 03:49:47 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45414 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbgESHtq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 May 2020 03:49:46 -0400
Received: by mail-lj1-f193.google.com with SMTP id z18so4440500lji.12
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2020 00:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6R6/K8wl7iJOxiI74lG/O3jw7mCZ9+B8+KFcoDYP070=;
        b=ZpFpm7k8Qu2IIwDAkWPZqvj/+iJKjzFxoqNIRFyRpe1fae14VTNK4bPI90LEhrRdjB
         JOjiw5N2Aehxi/dJU8Yhig+BcHkDeo3bLgSIuVyshF5I24qWEJRd3WAGgxtl1vN8uGUX
         Y2KZzvgZ6fSKF3HKSJ1copIwm7CXAkIMjnndsw9jh53xIHRaVHGlRAucZpUyM1151jS1
         zv52lxxPD00qbn/Ug3PxrJuTVThbzJZWS6zgMJCRYAiZsVrjwkpSksDT33YarVGcnNil
         YuIIQZw03M1GGFMjmiP0y5wpupymdTI9iZSIhfC4YkUWahM5yDt0pIFaOnD2fip/DmSB
         ivyg==
X-Gm-Message-State: AOAM532ku7M01CzP61U/H501+lYf8JmD5oCOdRkFZ42ZkOguMXy7fhMQ
        BpoPYYOZnCJhLcoSg5imcKrWh8MM
X-Google-Smtp-Source: ABdhPJyxpTKiHjUYnMYySb2zykoylbpMmn1xEF84tH6t2vczFmP06SCHObG6LUxyIYb/VhDZiPUNXw==
X-Received: by 2002:a2e:8018:: with SMTP id j24mr2610091ljg.99.1589874583207;
        Tue, 19 May 2020 00:49:43 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id h6sm7038695ljg.38.2020.05.19.00.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 00:49:42 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jax0P-0006LE-30; Tue, 19 May 2020 09:49:41 +0200
Date:   Tue, 19 May 2020 09:49:41 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Bin Liu <b-liu@ti.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: usb_wwan: do not resubmit rx urb on fatal errors in
 rx callback
Message-ID: <20200519074941.GA27787@localhost>
References: <20200513213646.21649-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513213646.21649-1-b-liu@ti.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 13, 2020 at 04:36:46PM -0500, Bin Liu wrote:
> usb_wwan_indat_callback() shouldn't resubmit rx urb if the previous urb
> status is a fatal error. Or the usb controller would keep processing the
> new urbs then run into interrupt storm, and has no chance to recover.
> 
> Fixes: 6c1ee66a0b2b ("USB-Serial: Fix error handling of usb_wwan")
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Bin Liu <b-liu@ti.com>
> ---
>  drivers/usb/serial/usb_wwan.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/serial/usb_wwan.c b/drivers/usb/serial/usb_wwan.c
> index 13be21aad2f4..4b9845807bee 100644
> --- a/drivers/usb/serial/usb_wwan.c
> +++ b/drivers/usb/serial/usb_wwan.c
> @@ -270,6 +270,10 @@ static void usb_wwan_indat_callback(struct urb *urb)
>  	if (status) {
>  		dev_dbg(dev, "%s: nonzero status: %d on endpoint %02x.\n",
>  			__func__, status, endpoint);
> +
> +		/* don't resubmit on fatal errors */
> +		if (status == -ESHUTDOWN || status == -ENOENT)
> +			return;
>  	} else {
>  		if (urb->actual_length) {
>  			tty_insert_flip_string(&port->port, data,

Now applied, thanks.

Johan
