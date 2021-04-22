Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ECEA367FB6
	for <lists+linux-usb@lfdr.de>; Thu, 22 Apr 2021 13:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236075AbhDVLmv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Apr 2021 07:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236081AbhDVLmu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Apr 2021 07:42:50 -0400
X-Greylist: delayed 402 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 22 Apr 2021 04:42:16 PDT
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C5FC06174A
        for <linux-usb@vger.kernel.org>; Thu, 22 Apr 2021 04:42:16 -0700 (PDT)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
        by mail.kmu-office.ch (Postfix) with ESMTPSA id 0D6BC5C0541;
        Thu, 22 Apr 2021 13:35:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
        t=1619091331;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ovme2ct9hvZuCBNPL3Wm+UfuebK/wFsMTOSjdM9dO6I=;
        b=OP17xoooD27dyxu4FI9Xd8VEv2BWSPbwhv73xVnkO+Fu06IuPH/atU3VBU5Stf1FFzxO97
        zXN+MB5YERp/ALIRjfb6pp4P1D9F2dx4JaNF9J6Sd87Fd3a75Ry+pEKDYcjfMi7rQplbMm
        mwwR5MgCQpIv4HN4ezkWm0mMcaa+B24=
MIME-Version: 1.0
Date:   Thu, 22 Apr 2021 13:35:30 +0200
From:   Stefan Agner <stefan@agner.ch>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] CDC-ACM: fix poison/unpoison imbalance
In-Reply-To: <20210421074513.4327-1-oneukum@suse.com>
References: <20210421074513.4327-1-oneukum@suse.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <ffd33d14769dd51375c87d43fff9cc3d@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021-04-21 09:45, Oliver Neukum wrote:
> suspend() does its poisoning conditionally, resume() does it
> unconditionally. On a device with combined interfaces this
> will balance, on a device with two interfaces the counter will
> go negative and resubmission will fail.
> 
> Both actions need to be done conditionally.

FWIW, this relates to the issue reported on the kernel bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=212725

Thanks for addressing this!

> 
> Fixes: 6069e3e927c8f ("USB: cdc-acm: untangle a circular dependency
> between callback and softint")
> Signed-off-by: Oliver Neukum <oneukum@suse.com>

Tested-by: Stefan Agner <stefan@agner.ch>

--
Stefan

> ---
>  drivers/usb/class/cdc-acm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> index 3fda1ec961d7..f5886c512fec 100644
> --- a/drivers/usb/class/cdc-acm.c
> +++ b/drivers/usb/class/cdc-acm.c
> @@ -1634,12 +1634,13 @@ static int acm_resume(struct usb_interface *intf)
>  	struct urb *urb;
>  	int rv = 0;
>  
> -	acm_unpoison_urbs(acm);
>  	spin_lock_irq(&acm->write_lock);
>  
>  	if (--acm->susp_count)
>  		goto out;
>  
> +	acm_unpoison_urbs(acm);
> +
>  	if (tty_port_initialized(&acm->port)) {
>  		rv = usb_submit_urb(acm->ctrlurb, GFP_ATOMIC);
