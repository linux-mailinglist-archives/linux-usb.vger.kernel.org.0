Return-Path: <linux-usb+bounces-26180-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4324B12133
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 17:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D384A1CC5A31
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 15:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C9B2EE5FD;
	Fri, 25 Jul 2025 15:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="XZHBVXTf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EC72B9A4
	for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 15:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753458387; cv=none; b=Ju8qk6ArLFDMkTdlWd5MysTOGz/GMnyYWvCrMXKQO//415dUJHHyyZpM4pjq9mMTM+c3zJ8wcHwxP3x95nlWW067Fld94LxCovh+OUnxkfTCMN3VJe9a0bUJqsM7Iz/box25YAHco0o7/yVou9tljaqwR36qDxj+Yqh6ByJ7f0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753458387; c=relaxed/simple;
	bh=xaAQ3LDJdVzcBZAOp8TyIGGpL+K0F6NWz8bQF08EGos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lPI0poPR86O/gM5wDWK9T8wHlyDAGZxbgUuddnFUTQG+nzhxQVFq6tTIMqdg133Vj6ggWnZhM7nJMNzyg4TboNWZXTkCicMYOv4DzSVS4Y19/oWMzDZtJss3b7cR8UBvQcDEr9wleI45G7YfockbpBlSUkOAZqL2IPZmGKVpPlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=XZHBVXTf; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fad3400ea3so16552286d6.0
        for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 08:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1753458385; x=1754063185; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8WGkkRv2unyWM0ZloZk6dP7Gl6edx2qC7G/ZfqKk8Fg=;
        b=XZHBVXTfY1yVBPZ2B6aHrHvioC8UEbMBKPnuymQ8qjY4EBwDrk7OaS4lTaIIU98qUg
         19bkAc2WDtaH/ykPUnxBIkw/n1y/LMGfvqeY4uhKhx4R+znvk3P7vLtBlCIpjiAzPsL1
         WXxHQ3i+NRaWIkgxdFvpsYclGgG9/KGC9t2yyM6IE/EPrSh2FXQ/qp/Tjy3rMC7foW6r
         bUjCcbeks7SEqcSwag1CddYoLFpRS2WO5+2GogeyXsLeUIHN8cu0bcwP1bvbR+edjG1G
         I1iUF8T6iWvuMIsZI0ZdgGRZgsjKS7VuCOxBxRjEzfDMV2nz9E4fiwrQS4tfy/5lyWoZ
         KRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753458385; x=1754063185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WGkkRv2unyWM0ZloZk6dP7Gl6edx2qC7G/ZfqKk8Fg=;
        b=B9iSV7rQcpHZfO0exZPyHub5ifQg9RSw3uoV8YuNYb2NmR56Prv7HJehi21NVjbTA4
         byFkk+vYj8OM5nNN/WNG2gtUZhZwuAC8fgJr7ef9nEMV0wugPgUj6IDrsLKlRyWfCnob
         J4rJyUcr6PM0n6KiZA1ppB6OMUl1jdOyv9oIOh6IyxhNCfxYNvQpTo+G313Wdyzyt1o0
         GAQ2NcdtpcJbQe9p79YtWHV9pWo36y1Yx53SiEyTyNgCRg9BbtIgbsWgFBpnMvGlc4OV
         aIw3aQ/M9WBWZhrDbbUiex5kSDJlf56oIOjzlFJIPJprMvVnyoUCPOVUwpE/a1jDv1mX
         h1qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhEHX1DFxjocCa5DnAFT/ZwD/gfpbkCvS7tbKPN22SDBFbZPoVLl64Sx7+5oQWPn6f3f/s2EEhFyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpiDhSuj1VbZZHWXw3bYbLqPzWW/ReYERlgz53GoXvy+MKnOQK
	vlnl0J4lAKqKSlKY0LlOc+we9dLAlg+QJAfJUJ/52WySPJv1lrgVT2bJiRz1tMT6gOXCeA4eimE
	lfKY=
X-Gm-Gg: ASbGnctI2rloiaZebK/E6MSulXDQ9XIidcqvgN1vMXsEUDon7rzQnBcjY0c9Ah8PdeS
	KDs4bWbIgHuVWr1UWkpwRpu6o+0HZ75HP3g6r6z708dgX1GTdu8VIOllsqOvWpESfZG3GLU0IzN
	NZCmRvlx1j4bnJPRU4Ig7A/HuHW5lE1T5+x7Dj3GOjIjyL5yusTEZENIYkozzed4FOhxQfNbKIJ
	ZedEAIOdQYSr4fHEUSHvuZRHnRh3F1+kFluMEdDmRINGjm+MXuY3erLqLUH1ToYD5sPwtdQmCJw
	uf5TDuXlFD2dQZfLsEIFeQIqMvqtYBmfG+0PXK59ZHETm9pLYnR35HSrc4o+pZyIrTtzgINoAa4
	zWrjT7M+EnNTrRI/dMWmMXdo=
X-Google-Smtp-Source: AGHT+IFmcN98ndZL6dSlLYKVAJOxau4Bo9pL2GEN5zNkwJGM5vAV48zrntjB9XCXsgxhTMHkCGaIjQ==
X-Received: by 2002:a05:6214:248d:b0:6ff:b41b:b5bb with SMTP id 6a1803df08f44-707205b404cmr32909726d6.26.1753458384960;
        Fri, 25 Jul 2025 08:46:24 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::317e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70729a63240sm1574636d6.27.2025.07.25.08.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 08:46:23 -0700 (PDT)
Date: Fri, 25 Jul 2025 11:46:16 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Olivier Tuchon <tcn@google.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: Add gadgetmon traffic monitor
Message-ID: <42f4753a-f7db-49a3-ba40-8743a78684b4@rowland.harvard.edu>
References: <CALU+5Va_zeqS5YK7v3HNvDKkg8srqc87P5ZaQUK5tGFUMyNrkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALU+5Va_zeqS5YK7v3HNvDKkg8srqc87P5ZaQUK5tGFUMyNrkg@mail.gmail.com>

On Fri, Jul 25, 2025 at 05:25:49PM +0200, Olivier Tuchon wrote:
> The Linux kernel lacks a tool equivalent to usbmon for the gadget side,
> making it difficult to debug the lifecycle and performance of usb_requests.
> This forces developers into using ad-hoc printk statements for
> introspection.
> 
> This commit introduces "gadgetmon", a comprehensive framework for
> monitoring USB gadget traffic. It consists of two main parts: a new
> monitoring interface in the UDC core and a loadable module that
> implements this interface to provide data to userspace.
> 
> The UDC core is modified to add an optional monitoring interface defined
> by struct usb_gadget_mon_operations in <linux/usb/gadget.h>.

This does not appear in the patch.  Was it left out by mistake?

>  An
> RCU-protected global pointer, gadget_mon_ops, is defined and exported
> to allow monitoring modules to register. Hooks are placed in
> usb_ep_queue() and usb_gadget_giveback_request() to call this interface,
> capturing request submission and completion events.

Do you expect that other gadget monitoring modules will be written?
If they are, assignment to the global pointer should be handled by a
routine in the gadget core, not in the monitoring module as done here.

> + /*
> + * optimization: for an OUT submission (host-to-device), the data
> + * has not yet arrived from the host. The buffer is an empty
> + * placeholder, so its content is not captured to save space.
> + */
> + if (event_type == GADGETMON_EVENT_SUBMIT && hdr.dir == USB_DIR_OUT)
> + payload_len = 0;

There should be a similar optimization for IN givebacks.  The data to
be transferred to the host was already recorded by the submission
hook, so you can save space by not copying it a second time during the
giveback.

> +
> + hdr.data_len = payload_len;
> + total_len = sizeof(hdr) + payload_len;
> +
> + /* lock and queue the event into the FIFO */
> + spin_lock_irqsave(&mon_lock, flags);
> +
> + if (kfifo_avail(&mon_fifo) < total_len) {
> + /* not enough space, drop the event silently */

Would it be better to keep the event but drop the tail end of the data?

Alan Stern

