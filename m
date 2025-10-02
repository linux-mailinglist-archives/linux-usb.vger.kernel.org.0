Return-Path: <linux-usb+bounces-28871-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EA7BB49EE
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 19:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34B3517313C
	for <lists+linux-usb@lfdr.de>; Thu,  2 Oct 2025 17:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E504A259C94;
	Thu,  2 Oct 2025 17:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Edt3tu5f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8583786342
	for <linux-usb@vger.kernel.org>; Thu,  2 Oct 2025 17:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759424727; cv=none; b=sfZSX4n7uJ+xkoZQqabFpI82PPdPR6It+2Xdy8kdT0BW06vwJ7lRyiCLjPzoK6GxvS/pcCqnB9cdQ6YRskpsRdIIeAbL2xw6swJTs5n+7dYAnbq7d/WX5yvdPkWMKmpYabBeMzuz5CBfOzr4oBrJvXRAOAJcaThtty3oh21pk3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759424727; c=relaxed/simple;
	bh=KqAgIDOLYYlmq7vjL4DlLwiz436HioB2gAr7A2tfmDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWHe8YvdnhviP9ji9mWvkbH37FhX3hUNTld4rAYqSmLUK0xt6EwdqqHygdDsku2xWGrt9Gns+P8WFyR1jNn3RERjRT7OiphUFz6vOIqYRCsJzFQZqoKhCieO68ufvdh17ODMtLJY1/iTD/k5coKoAIX+D5Wt7IOdZq5GS/VFw1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Edt3tu5f; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-78e9f48da30so11929076d6.1
        for <linux-usb@vger.kernel.org>; Thu, 02 Oct 2025 10:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1759424724; x=1760029524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=phGzVSeo3mFMk1lUM+2AihItEguZ45xc81t0qErQ05k=;
        b=Edt3tu5fJ+85dw29qINWDL52oHEoAcHkJAlz1J8IBPIciyJ5Br2/QOtCN9IpB9zjza
         gW+P4vNDMoZHqQ/zBIWMjsP71Imayp0rTxAAIiOZ8WIDyJa8e6V+sNO7KI5m8bPBLAm2
         MkazuTyoAR+7eIpungaKs4LPzqNepcyfoGnUr9ugTjJdw/4ZUi6weKhpOhqwajE9ONZ2
         tM0W2vWOalSzrYjpgcm6/3mD3soRfhBjIuvnqFmp7s4e2RTb7bFPx/Ln5f/ySNZnI0+u
         Xiu+yiNODFuUtwgDY1xXINcM+LtCZ9ycGsvV5T1GIqrP7twsAij5e53A8KnGXrbPgTOv
         n9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759424724; x=1760029524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phGzVSeo3mFMk1lUM+2AihItEguZ45xc81t0qErQ05k=;
        b=dxl1Za4KyIcGTOrQL8xXNNl4FQcK7PYysrvfyTzohKmtlHyEdDFymSv+MayYbpsKPY
         ejyEyta4QzON/jZ7/gzJWbW45sFVKVEZkzmSkesQTIgNxm2sMHyNhzRxbv3+ns+aHiau
         0kNGgog7KpBKnEotdSUYns9XWvT6zrCqMruaT96oB2nPGZbDsEOWga7D9IchDNniZ0zk
         BbKr9PoiBXjAU9cXV1tjrOBUczeW0tbWNmNV09Vmul3GvUDf2nbLbN1E6UNGeU6OtVJF
         1otoRbXRP67jwMf6dd5kMjHucfXsqtHL+vCUzVYrYvtXgBw4xEq+eA29sbIZZphGbdN+
         nUzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQI5/0WqNWpioYreQ0NOzzKTNyxQus+3mIM8Z5nrwg/9vMyFGqpHHtdf/HUv+wIVd2bt5KTWn7eOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOvKZcmlANDwu3PTWoGq3Xmo7DHsFVNLrBpR4hgJAN+DQj5cOM
	A2UTan2VQ/CSwGLTN8rerqrUcTZm8WiT6bFJjJJ062iaCQ+KUuWBLqfN354bH9jEqocfH39cIF9
	353s=
X-Gm-Gg: ASbGncsUNPw6L33sfGBBozYb749uG7BdZ4lr3EeZoGE4lSLhulr5FC77DVEsLGwKb6O
	0UgHUGFbkDuuTJqWrjBq2gKrPkOQP6wDisdZh4bo6RzmKo0i4lScGmbhFTziy92XsO0r5DIAsQM
	2Vt5g0zwWwDaRHW3lKSdQwLAmxr4U+aH4YH6TC8NL4IzNQvqkrH5qkG99BnxmM03Yjp+xvVVVey
	bfXbiTu4mX4BOSoL6fYddiHiov9sVlWUGzB8QORh7KryNS7gFq6LsUfBVTtXqu5003ohbZeE8/i
	sRDMHE+iPXEf36RFLikNha6Doa8e9X6Qt5XznPaAEl2gIL+MfUuGqfFgYsBix38BA/CuEKPq/oM
	FNvKiY4Oj/9BUOC7IU/ColPakE4R9qtTw6kWxZFtLiOwSqOl/mCZs9osb3ZxkSJHW3gYKNZoucF
	lMzAe9mhx8/QU1/0t5zQoi5UUklKLEIwDS9DE+SDakZUxsbg8=
X-Google-Smtp-Source: AGHT+IFIwpnNK9iXXvhtzpssquDTl0liBWfFVOpM21u0nEQWvHOq8+H9aywE6hFbQeQgjOdt11BY+Q==
X-Received: by 2002:ad4:5ca3:0:b0:796:dc45:8034 with SMTP id 6a1803df08f44-879dc852938mr364906d6.45.1759424723965;
        Thu, 02 Oct 2025 10:05:23 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-28.harvard-secure.wrls.harvard.edu. [65.112.8.28])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878bb4469b0sm21873506d6.15.2025.10.02.10.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:05:23 -0700 (PDT)
Date: Thu, 2 Oct 2025 13:05:21 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: ValdikSS <iam@valdikss.org.ru>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: ohci: delay endpoint descriptor unlinking to
 reduce transfer latency
Message-ID: <4b3fd5ff-ae58-43c5-a36e-5ba0494f666f@rowland.harvard.edu>
References: <1ff1f025-dd54-4c1e-bdf9-376a359178ef@rowland.harvard.edu>
 <20251001223442.286058-1-iam@valdikss.org.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001223442.286058-1-iam@valdikss.org.ru>

On Thu, Oct 02, 2025 at 01:34:42AM +0300, ValdikSS wrote:
> The current OHCI implementation immediately unlinks Endpoint Descriptors
> (EDs) when they become idle. Unlinking process waits for the next Start
> of Frame (SOF) interrupt as a synchronization primitive before unlinking
> it.
> 
> This adds ~1ms latency per transfer cycle for rapid bidirectional
> communication which leads to half the USB 1.1 speed for smaller packets
> at best.
> 
> When a transfer completes, takeback_td() immediately calls
> start_ed_unlink() if the ED has no more TDs queued. This triggers:
> 1. ED marked for unlinking with SOF interrupt enabled
> 2. Wait for next 1ms frame boundary (SOF interrupt)
> 3. finish_unlinks() processes the ED removal
> 
> This patch adds 275+10 ms timeout to the idle EDs. If new transfers
> arrive on the same ED before timeout expiry, clear the timeout and
> continue using the ED. Only EDs that remain idle after the timeout
> period are cleared by the existing I/O watchdog, which runs every
> 275 ms (and the ED timeout is 10 ms).
> 
> This eliminates SOF synchronization delays for consecutive transfers,
> but preserves the one-frame unlinking delay which was added as a race
> condition elimination measure before the modern git history in
> commit 961c380cef (March 2004) by David Brownell.
> 
> Performance Impact:
> Tested on Orange Pi Zero3 (Allwinner H618) with Canon LBP1120 printer:
> - Before: 1.984ms average latency (write-read pattern)
> - After:  0.981ms average latency
> 
> Link: https://lore.kernel.org/all/9013fce0-6764-49b1-9e54-68e915e12d7c@valdikss.org.ru/T/
> Signed-off-by: ValdikSS <iam@valdikss.org.ru>
> ---
> v1 -> v2: removed redundant list_empty() checks and idle_timeout=0 assignment,
>           ensured idle_timeout jiffy to be non-zero.
> Thanks Alan!
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Looks good!  Greg won't accept it until the current merge window closes 
(about a week and a half), but he'll keep it in the queue until then.

Alan Stern

>  drivers/usb/host/ohci-hcd.c | 15 +++++++++++++++
>  drivers/usb/host/ohci-q.c   | 15 ++++++++++++---
>  drivers/usb/host/ohci.h     |  1 +
>  3 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
> index 9c7f30086..e89c9daec 100644
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
> @@ -384,6 +385,15 @@ ohci_endpoint_disable (struct usb_hcd *hcd, struct usb_host_endpoint *ep)
>  			break;
>  		}
>  		fallthrough;
> +	case ED_OPER:		/* check for delayed unlinking */
> +		if (ed->idle_timeout) {
> +			/* ED marked for delayed unlinking, unlink it now */
> +			start_ed_unlink(ohci, ed);
> +			spin_unlock_irqrestore(&ohci->lock, flags);
> +			schedule_timeout_uninterruptible(1);
> +			goto rescan;
> +		}
> +		fallthrough;
>  	default:
>  		/* caller was supposed to have unlinked any requests;
>  		 * that's not our job.  can't recover; must leak ed.
> @@ -795,6 +805,11 @@ static void io_watchdog_func(struct timer_list *t)
>  			}
>  		}
>  
> +		/* Check for idle EDs that have timed out and unlink them to prevent memory leaks */
> +		if (ed->state == ED_OPER && ed->idle_timeout &&
> +				time_after(jiffies, ed->idle_timeout))
> +			start_ed_unlink(ohci, ed);
> +
>  		/* Starting from the latest pending TD, */
>  		td = ed->pending_td;
>  
> diff --git a/drivers/usb/host/ohci-q.c b/drivers/usb/host/ohci-q.c
> index 3b445312b..e0725e490 100644
> --- a/drivers/usb/host/ohci-q.c
> +++ b/drivers/usb/host/ohci-q.c
> @@ -603,6 +603,9 @@ static void td_submit_urb (
>  	int		i, this_sg_len, n;
>  	struct scatterlist	*sg;
>  
> +	/* Clear idle timeout since we're adding new TDs */
> +	urb_priv->ed->idle_timeout = 0;
> +
>  	/* OHCI handles the bulk/interrupt data toggles itself.  We just
>  	 * use the device toggle bits for resetting, and rely on the fact
>  	 * that resetting toggle is meaningless if the endpoint is active.
> @@ -1162,10 +1165,16 @@ static void takeback_td(struct ohci_hcd *ohci, struct td *td)
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
> +			ed->idle_timeout += !ed->idle_timeout;
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
> -- 
> 2.51.0
> 

