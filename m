Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFD3F23DC1A
	for <lists+linux-usb@lfdr.de>; Thu,  6 Aug 2020 18:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729313AbgHFQqR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Aug 2020 12:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729246AbgHFQpo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Aug 2020 12:45:44 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA493C002175
        for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2020 09:14:48 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id x5so9355710wmi.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2020 09:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=H2ThGuibIMXRnTB7YOZN8+eGiNw10Bb2yG84w/KxGUU=;
        b=u1KdyiF3IzShofi2KPIGw4UolUefyqltUsFgx+93LZXitNAp8iY+DHuZYJw+fY+py+
         CZGEFEU9hq5cCiIFS6j36X28u6l5Ay0p5tGl0R57XFMALY9fongjDq39Gq8O/SbTfMHa
         I6CdFnxcGmmosadkHW3sCLRbQaxX+ao7qakMt2t07LlNZR9ayB7pO4eAYmqN5WiS7utd
         cB9FoH37EYwu6T6IKxkXaH7D6bqW8QCQkFKwKkB6gPEk66PgpTqoAvMzTtv7c/6BsCYR
         g9SBLD5tJRM9kW6Sj8UFlYe7FAAJL0SHSbtst/38wXJx31ducaDHWFicXBLEcjCB4jOU
         hZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-transfer-encoding;
        bh=H2ThGuibIMXRnTB7YOZN8+eGiNw10Bb2yG84w/KxGUU=;
        b=NWCB3QtMzMFcUL4JWZy+KovLSRnieIIqHniC631JaEvnZ6XC6ZMyzRM75ZbBj99J4j
         6Y/phE6J9/tkRtppQQwGqNeGslsyMB+UFQBRiUfEhXqOBjkkpIK0dvvqKzXNS7OyLXYs
         qsX7DmNe/fBn5FH068B6JJ6y6lTitWOsZInBZ8iA1DAZJl4jAHLPLMTEIaoXNPWd3SWd
         Wc+cx3fkIbREX4UfIIyauVBf6VfyAiO6W26GOo1TdqrAkZEdyVDUZXjRxYQlYyFC21Zz
         OTdvpBia2/C/Et4TOhXODHWtDTaNgCDUGy2QRjEYuDrrjP5ORulDiFVKo6M+WFrSbknY
         hbzw==
X-Gm-Message-State: AOAM532UVk04qYN5DCgnJ11LJkOeqii/tnid4Vy1IUGQiuGzKnL/4eQa
        qhGniKyxYjInT8YJdeXNdP+FrM9N
X-Google-Smtp-Source: ABdhPJxRlucAm/i27FhvDSo3ZFTDKEXMSfojajLEHtsNHtWOxM0On1bOHDUAerINZpOhE5dYmvUVpg==
X-Received: by 2002:a05:600c:210:: with SMTP id 16mr9000116wmi.165.1596730487332;
        Thu, 06 Aug 2020 09:14:47 -0700 (PDT)
Received: from [93.173.86.153] (93-173-86-153.bb.netvision.net.il. [93.173.86.153])
        by smtp.gmail.com with ESMTPSA id t13sm6844080wru.65.2020.08.06.09.14.45
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Aug 2020 09:14:46 -0700 (PDT)
Message-ID: <5F2C2C74.8000104@gmail.com>
Date:   Thu, 06 Aug 2020 19:14:44 +0300
From:   Eli Billauer <eli.billauer@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.12) Gecko/20100907 Fedora/3.0.7-1.fc12 Thunderbird/3.0.7
MIME-Version: 1.0
To:     Oliver Neukum <oneukum@suse.com>
CC:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: Re: [RFC]mooring API
References: <1596722827.2488.8.camel@suse.com>
In-Reply-To: <1596722827.2488.8.camel@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I feel I got more credit that I deserve. Hans de Goede discovered this 
issue and solved a specific problem that was related to the race back in 
6ec4147. I was just lucky (or unlucky) enough to get a kernel panic on 
my machine due to another problem, for which I submitted a patch.

To me the anchor API is great. If there is unclearances about its API, I 
suppose docs would help. The fact that the URB is unanchored prior to 
calling the completer is intuitive, so there's a clear benefit in that.

This requires some ungraceful code where almost nobody's looking, but if 
that makes the common programmer's life easier, I think it's a good deal.

As I see it, the question is if there are other situations where this 
race condition could cause bugs. It's all about looking for situations 
where it's harmful to consider the anchor idle because its list is empty 
(i.e. not take into account that one URB might be completing).

Regards,
    Eli

On 06/08/20 17:07, Oliver Neukum wrote:
> Hi,
>
> why this new API? Eli found a race with the existing API. Many
> drivers are acribing to it semantics it never had. Now we have
> sort of a fix, but it is not really elegant.
> The anchors have always been about making it easier to write drivers.
> Hence if driver authors are assumuning that they have a power, we
> better provide that facility. What users need is a facility
> to group URBs together and get rid of them no questions asked.
> It would be best if we can do that with minimal changes.
>
> Here is a V2 taking into account Alan's remarks, and using a separate
> flag.
>
> 	Regards
> 		Oliver
>
> > From 79df4240287b712bbe08404af7f900c3bccfca40 Mon Sep 17 00:00:00 2001
> From: Oliver Neukum<oneukum@suse.com>
> Date: Tue, 28 Jul 2020 11:38:23 +0200
> Subject: [PATCH] USB: add mooring API
>
> This is a simplified and thereby better version of the anchor API.
> Anchors have the problem that they unanchor an URB upon giveback,
> which creates a window during which an URB is unanchored but not
> yet returned, leading to operations on anchors not having the
> semantics many driver errornously assume them to have.
> The new API keeps an URB on an anchor until it is explicitly
> unmoored.
>
> Signed-off-by: Oliver Neukum<oneukum@suse.de>
> Signed-off-by: Oliver Neukum<oneukum@suse.com>
> ---
>   drivers/usb/core/hcd.c |  4 +++-
>   drivers/usb/core/urb.c | 27 ++++++++++++++++++++++++++-
>   include/linux/usb.h    |  3 +++
>   3 files changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index a33b849e8beb..e1d26cb595c3 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -1640,7 +1640,9 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
>   	unmap_urb_for_dma(hcd, urb);
>   	usbmon_urb_complete(&hcd->self, urb, status);
>   	usb_anchor_suspend_wakeups(anchor);
> -	usb_unanchor_urb(urb);
> +	smp_rmb(); /* against usb_(un)moor_urb() */
> +	if (!urb->moored)
> +		usb_unanchor_urb(urb);
>   	if (likely(status == 0))
>   		usb_led_activity(USB_LED_EVENT_HOST);
>
> diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
> index 7bc23469f4e4..ee3c6c7c2630 100644
> --- a/drivers/usb/core/urb.c
> +++ b/drivers/usb/core/urb.c
> @@ -123,7 +123,7 @@ EXPORT_SYMBOL_GPL(usb_get_urb);
>    * This can be called to have access to URBs which are to be executed
>    * without bothering to track them
>    */
> -void usb_anchor_urb(struct urb *urb, struct usb_anchor *anchor)
> +static void __usb_anchor_urb(struct urb *urb, struct usb_anchor *anchor)
>   {
>   	unsigned long flags;
>
> @@ -137,8 +137,20 @@ void usb_anchor_urb(struct urb *urb, struct usb_anchor *anchor)
>
>   	spin_unlock_irqrestore(&anchor->lock, flags);
>   }
> +
> +void usb_anchor_urb(struct urb *urb, struct usb_anchor *anchor)
> +{
> +	__usb_anchor_urb(urb, anchor);
> +}
>   EXPORT_SYMBOL_GPL(usb_anchor_urb);
>
> +void usb_moor_urb(struct urb *urb, struct usb_anchor *anchor)
> +{
> +	urb->moored = true;
> +	__usb_anchor_urb(urb, anchor);
> +}
> +EXPORT_SYMBOL_GPL(usb_moor_urb);
> +
>   static int usb_anchor_check_wakeup(struct usb_anchor *anchor)
>   {
>   	return atomic_read(&anchor->suspend_wakeups) == 0&&
> @@ -185,6 +197,19 @@ void usb_unanchor_urb(struct urb *urb)
>   }
>   EXPORT_SYMBOL_GPL(usb_unanchor_urb);
>
> +void usb_unmoor_urb(struct urb *urb)
> +{
> +	struct usb_anchor *anchor;
> +
> +	urb->moored = false;
> +	anchor = urb->anchor;
> +	if (!anchor)
> +		return;
> +
> +	__usb_unanchor_urb(urb, anchor);
> +}
> +EXPORT_SYMBOL_GPL(usb_unmoor_urb);
> +
>   /*-------------------------------------------------------------------*/
>
>   static const int pipetypes[4] = {
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 20c555db4621..b9e1464a2552 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -1565,6 +1565,7 @@ struct urb {
>   	void *hcpriv;			/* private data for host controller */
>   	atomic_t use_count;		/* concurrent submissions counter */
>   	atomic_t reject;		/* submissions will fail */
> +	bool moored;			/* the URB is moored not anchored */
>
>   	/* public: documented fields in the urb that can be used by drivers */
>   	struct list_head urb_list;	/* list head for use by the urb's
> @@ -1732,6 +1733,8 @@ extern void usb_anchor_suspend_wakeups(struct usb_anchor *anchor);
>   extern void usb_anchor_resume_wakeups(struct usb_anchor *anchor);
>   extern void usb_anchor_urb(struct urb *urb, struct usb_anchor *anchor);
>   extern void usb_unanchor_urb(struct urb *urb);
> +extern void usb_moor_urb(struct urb *urb, struct usb_anchor *anchor);
> +extern void usb_unmoor_urb(struct urb *urb);
>   extern int usb_wait_anchor_empty_timeout(struct usb_anchor *anchor,
>   					 unsigned int timeout);
>   extern struct urb *usb_get_from_anchor(struct usb_anchor *anchor);
>    

