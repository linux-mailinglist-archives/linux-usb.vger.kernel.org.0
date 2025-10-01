Return-Path: <linux-usb+bounces-28842-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A38A5BB1989
	for <lists+linux-usb@lfdr.de>; Wed, 01 Oct 2025 21:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13AF91927EC6
	for <lists+linux-usb@lfdr.de>; Wed,  1 Oct 2025 19:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE9D2E888C;
	Wed,  1 Oct 2025 19:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="pqTvXqLl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A16B2E54DE
	for <linux-usb@vger.kernel.org>; Wed,  1 Oct 2025 19:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759346838; cv=none; b=OQCe8kCf4RDC2ou1g6TCCKoz1iwX/ls0U0X9jZ/CCcyI8lW2JmZ0G8eursAnBT86zDbnsMR1Mkjqj/dD0m/dWBNpxDHK3BOoYluq+0x0aow/375qFKOCQvRW7pA4b97ZI1Y1uoMuZcR2KPsG6jwpbdaI5ZXuRSydnPNBQMP1c+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759346838; c=relaxed/simple;
	bh=BqUqfjbbIk2RMxzELZOEqam7X3uWklhQApQK1gUJlzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ta6OHAA4uzoV7ya+vJeKKAfLi63/md+16JrPL7lffJQX4esCT9GyJAr3EIETwpTjn0oas/4dR2HbO+YFfo/xst4/LkIN0xWK/Q7fVSrR0OOPxtKm6wcr4o+foONwGKnwB7fcuYpTYELF9KylwUhSNxuEqZwAd4HpfNx/J0BdLKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=pqTvXqLl; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-78f75b0a058so3006576d6.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 12:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1759346836; x=1759951636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2V+2YyAsaZ3I7TYdWPdvpGBgv7Y1/ICHylOytB8g/nY=;
        b=pqTvXqLlz5JvYBfCo8j1uiJL3yOd8vUKHXvu31s+TGOmGqtt+YDl9xPU25Rac7pT4L
         yF1A8WNcOSutKcoMToWM3DCDSxGY920sk5YZ1zL3BLe6WXWkgek/VZD03317pOrFrWeG
         QXFvzHZLRe4FMxjI+Qyr3/wtdNqTn/tpWSGD7GEiscOcbPCuhI1zqMdky71nLmnkZeK3
         Zh1U5qldfOcEcZ8uQhi6YzF32M44hR4U5LKgggtVFliNWBG6Zs1BeAVm9xj2nn+TUHkP
         EbRtzbLGDunxndioIDgKi/5fZI2LVRscXKAuBqSHqdrqZN6UT4chYKCpjaAkSogCdmKP
         HLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759346836; x=1759951636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2V+2YyAsaZ3I7TYdWPdvpGBgv7Y1/ICHylOytB8g/nY=;
        b=jV+cZK/nF6qjVY2zhm1ZRpscAF1WapQB/Fu25lCbGhxif1b3BHLAmM18Q2vCZnK2UJ
         b5+P54RWeQVLwXERzIxzfb8Rty7HcF4X0ANH6/7V09XNdHxekvr9ewA9quU1SNtGpnLt
         saMO5NYbnmeS3j/i3QQSD+ZOJFyRcnoGk3ctzHyPN7/X7NuFHL8LpaI47jPqb1hau6no
         MCU+ro7bYv6HQfOQyEwyNDjXC90k4zQpzWLRVEd0syh9GhENMoXAPJ0wkULMdqAG3hOo
         gWZBhrZcLb4ElzsvCPp0qiRwVl6sGcwFZFrJJdtOtjavadesttPtqDlzS5BfBE+bebbA
         GmWA==
X-Gm-Message-State: AOJu0Yyepn3/DwwiQwOAj0dBI2g2t4KgDgTiznFtR+drCVuW4jSZizj2
	0TCYMAr+2wxwSAE2sq/uE8M6gLyCB/ie0QT21SShTmsZO/5yBNwCf1+hPMwFr9p2pZjwiywvkTK
	0tDo=
X-Gm-Gg: ASbGnctzrhIorEq3YCwPcL7anVPlPyHdLpnlUgDqCd+vAQZGMXvRSJuz3Y+1WL3BRJN
	e8d3AlKqOtzxj8Q83jKTnh29Gg1oZ7mHEamFnYhj6G061UC+bCBbnmZTj5PJlmrbXR3mrKAu1Wl
	2ps4XvYcQnIoM3DkR8c4ALmF89H1r+wZ/QTi9P7EfPtriM8A4F/pciZGZSDDXZxHXnZvt41mJqv
	SEWqmlenb5fLhaqM1bwdPLtqTtzckx9c4cHhvo5CiA4Vc5R1FmzcwdO7nCoCBYggISWgNJfdsof
	OibIbLoR7EKyZTqXzQoTh+vf5TOC4+/lu7zsM9e6/xYXfJJtWyE3rNwskHEyv9iXRxZDEqJ/hYJ
	/OSAV/rFnokLToRVKBrLpkF53SCMFLLaB2ct1XSpZiNJRcmIz4LHJlpbRmzjU7/RRqTHRjfkHCo
	D0wrf4LnCBxivlE0AYSD/p0pGB8pbff5v4fz5nT3YRcnltNF/PKR/lUzGApg==
X-Google-Smtp-Source: AGHT+IElrMH9Ao3ZilKvPzZn5oJ0jzxo1iJ9NAn96mFq01IqTjm3ifyn38TGySNhf2I7hMTwsqs95g==
X-Received: by 2002:ad4:5c42:0:b0:78d:8414:e4c2 with SMTP id 6a1803df08f44-873a7dba1b3mr76282666d6.50.1759346835579;
        Wed, 01 Oct 2025 12:27:15 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-28.harvard-secure.wrls.harvard.edu. [65.112.8.28])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878bdf52e64sm4327726d6.52.2025.10.01.12.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 12:27:15 -0700 (PDT)
Date: Wed, 1 Oct 2025 15:27:12 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: ValdikSS <iam@valdikss.org.ru>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: ohci: delay endpoint descriptor unlinking to reduce
 transfer latency
Message-ID: <1ff1f025-dd54-4c1e-bdf9-376a359178ef@rowland.harvard.edu>
References: <78c2bf8d-e67f-4520-a7fb-7a9f3db159d6@rowland.harvard.edu>
 <20250922144848.23418-1-iam@valdikss.org.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922144848.23418-1-iam@valdikss.org.ru>

On Mon, Sep 22, 2025 at 05:48:48PM +0300, ValdikSS wrote:
> The current OHCI implementation immediately unlinks Endpoint Descriptors (EDs)
> when they become idle. Unlinking process waits for the next Start of Frame (SOF)
> interrupt as a synchronization primitive before unlinking it.
> 
> This adds ~1ms latency per transfer cycle for rapid bidirectional communication
> which leads to half the USB 1.1 speed for smaller packets at best.
> 
> When a transfer completes, takeback_td() immediately calls start_ed_unlink()
> if the ED has no more TDs queued. This triggers:
> 1. ED marked for unlinking with SOF interrupt enabled
> 2. Wait for next 1ms frame boundary (SOF interrupt)
> 3. finish_unlinks() processes the ED removal
> 
> This patch adds 275+10 ms timeout to the idle EDs. If new transfers
> arrive on the same ED before timeout expiry, clear the timeout and continue
> using the ED. Only unlink EDs that remain idle after the timeout period
> are cleared by the existing I/O watchdog, which runs every 275 ms (and
> the ED timeout is 10 ms).
> 
> This eliminates SOF synchronization delays for consecutive transfers,
> but preserves the one-frame unlinking delay which was added as a
> race condition elimination measure before the modern git history
> in commit 961c380cef (March 2004) by David Brownell.
> 
> Performance Impact:
> Tested on Orange Pi Zero3 (Allwinner H618) with Canon LBP1120 printer:
> - Before: 1.984ms average latency (write-read pattern)
> - After:  0.981ms average latency
> 
> Link: https://lore.kernel.org/all/9013fce0-6764-49b1-9e54-68e915e12d7c@valdikss.org.ru/T/
> ---

Took a while for me to get around to reviewing this.  Some comments are 
included inline below.

>  drivers/usb/host/ohci-hcd.c | 18 ++++++++++++++++++
>  drivers/usb/host/ohci-q.c   | 15 ++++++++++++---
>  drivers/usb/host/ohci.h     |  1 +
>  3 files changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
> index 9c7f30086..daaa03dd6 100644
> --- a/drivers/usb/host/ohci-hcd.c
> +++ b/drivers/usb/host/ohci-hcd.c
> @@ -364,6 +364,7 @@ ohci_endpoint_disable (struct usb_hcd *hcd, struct usb_host_endpoint *ep)
>  	if (ohci->rh_state != OHCI_RH_RUNNING) {
>  sanitize:
>  		ed->state = ED_IDLE;
> +		ed->idle_timeout = 0;
>  		ohci_work(ohci);
>  	}
>  
> @@ -384,6 +385,16 @@ ohci_endpoint_disable (struct usb_hcd *hcd, struct usb_host_endpoint *ep)
>  			break;
>  		}
>  		fallthrough;
> +	case ED_OPER:		/* check for delayed unlinking */
> +		if (list_empty(&ed->td_list) && ed->idle_timeout) {

Instead of adding these list_empty() tests, you can rely on the 
invariant that ed->idle_timeout is always 0 whenever ed->td_list is 
non-empty.

> +			/* ED marked for delayed unlinking, unlink it now */
> +			ed->idle_timeout = 0;

This isn't needed.  start_ed_unlink() calls ed_deschedule(), which sets 
ed->state to ED_UNLINK, so ed->idle_timeout will be ignored later on.

> +			start_ed_unlink(ohci, ed);
> +			spin_unlock_irqrestore (&ohci->lock, flags);
> +			schedule_timeout_uninterruptible(1);
> +			goto rescan;
> +		}
> +		fallthrough;
>  	default:
>  		/* caller was supposed to have unlinked any requests;
>  		 * that's not our job.  can't recover; must leak ed.
> @@ -795,6 +806,13 @@ static void io_watchdog_func(struct timer_list *t)
>  			}
>  		}
>  
> +		/* Check for idle EDs that have timed out and unlink them to prevent memory leaks */
> +		if (ed->state == ED_OPER && list_empty(&ed->td_list) &&
> +		    ed->idle_timeout && time_after(jiffies, ed->idle_timeout)) {
> +			ed->idle_timeout = 0;
> +			start_ed_unlink(ohci, ed);

Again, the list_empty() test and setting ed->idle_timeout to 0 aren't 
needed.

> +		}
> +
>  		/* Starting from the latest pending TD, */
>  		td = ed->pending_td;
>  
> diff --git a/drivers/usb/host/ohci-q.c b/drivers/usb/host/ohci-q.c
> index 3b445312b..1df57a454 100644
> --- a/drivers/usb/host/ohci-q.c
> +++ b/drivers/usb/host/ohci-q.c
> @@ -433,6 +433,7 @@ static struct ed *ed_get (
>  		ed->hwTailP = cpu_to_hc32 (ohci, td->td_dma);
>  		ed->hwHeadP = ed->hwTailP;	/* ED_C, ED_H zeroed */
>  		ed->state = ED_IDLE;
> +		ed->idle_timeout = 0;

Not needed since the memory allocated in ed_alloc() is zeroed.

>  
>  		is_out = !(ep->desc.bEndpointAddress & USB_DIR_IN);
>  
> @@ -603,6 +604,9 @@ static void td_submit_urb (
>  	int		i, this_sg_len, n;
>  	struct scatterlist	*sg;
>  
> +	/* Clear idle timeout since we're adding new TDs */
> +	urb_priv->ed->idle_timeout = 0;
> +
>  	/* OHCI handles the bulk/interrupt data toggles itself.  We just
>  	 * use the device toggle bits for resetting, and rely on the fact
>  	 * that resetting toggle is meaningless if the endpoint is active.
> @@ -1162,10 +1166,15 @@ static void takeback_td(struct ohci_hcd *ohci, struct td *td)
>  	if (urb_priv->td_cnt >= urb_priv->length)
>  		finish_urb(ohci, urb, status);
>  
> -	/* clean schedule:  unlink EDs that are no longer busy */
> +	/* clean schedule: delay unlinking EDs to avoid SOF synchronization overhead */
>  	if (list_empty(&ed->td_list)) {
> -		if (ed->state == ED_OPER)
> -			start_ed_unlink(ohci, ed);
> +		if (ed->state == ED_OPER) {
> +			/* Mark ED as idle but don't unlink immediately to avoid
> +			 * 1ms SOF synchronization delays on rapid consecutive transfers.
> +			 * Watchdog will clean up after 10ms if truly idle.
> +			 */
> +			ed->idle_timeout = jiffies + msecs_to_jiffies(10);

It would be a good idea to add:

			ed->idle_timeout += !ed->idle_timeout;

to handle the case where jiffies + msecs_to_jiffies(10) just happens to 
roll over to 0.

> +		}
>  
>  	/* ... reenabling halted EDs only after fault cleanup */
>  	} else if ((ed->hwINFO & cpu_to_hc32(ohci, ED_SKIP | ED_DEQUEUE))
> diff --git a/drivers/usb/host/ohci.h b/drivers/usb/host/ohci.h
> index 631dda617..858c7bebe 100644
> --- a/drivers/usb/host/ohci.h
> +++ b/drivers/usb/host/ohci.h
> @@ -75,6 +75,7 @@ struct ed {
>  #define	OKAY_TO_TAKEBACK(ohci, ed)			\
>  		((int) (ohci->wdh_cnt - ed->takeback_wdh_cnt) >= 0)
>  
> +	unsigned long		idle_timeout;	/* when ED became idle (jiffies) */
>  } __attribute__ ((aligned(16)));
>  
>  #define ED_MASK	((u32)~0x0f)		/* strip hw status in low addr bits */

Overall this looks very good.

Alan Stern

