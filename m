Return-Path: <linux-usb+bounces-26935-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 157A7B28E6A
	for <lists+linux-usb@lfdr.de>; Sat, 16 Aug 2025 16:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B836E1C23BD2
	for <lists+linux-usb@lfdr.de>; Sat, 16 Aug 2025 14:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C0F2D7D2E;
	Sat, 16 Aug 2025 14:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="r3t4TTOM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14FB6BFCE
	for <linux-usb@vger.kernel.org>; Sat, 16 Aug 2025 14:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755353801; cv=none; b=D2F9hvFnc1HdeeMzk5JJXQWxCp9rerQX4dH+jXz4IFsGnZH2DH9B7SescFaSjVi0yg5uzCZTYhA4uEVC/Q3E+GwG/EHvNi+1rbavXE0oQSC7ZGo3c2ECvM9n3TL++0+IdF+sBHOfwyssLlF9CQpYXlKPt6bq4ZYn27IV6/KgGuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755353801; c=relaxed/simple;
	bh=jRn+68TydpTDnUBx92tCFQOcAjFK+D29aieMu5Iz3wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTE7PUxjTkLUSdYtaNxMM1kZ8+V7GUEXkuOHcwmU5oOeMv80QKbCW/mpmmYbuQEd+MZZesMopUFTgzRhaLzlEmBrgX8GElMMx+Z3UIAF6JKRuGc9wXDoUJ+dqj/6MHXvovFPuRYJ9kg/F74nvMOKX+HPfZurGXeP3MZfJ/FO4UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=r3t4TTOM; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-70a9f5b60b9so27285326d6.3
        for <linux-usb@vger.kernel.org>; Sat, 16 Aug 2025 07:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755353799; x=1755958599; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/WPrq9qE/mcKs1KinEiimPYdP4EDUSl2u22e6GWf8XM=;
        b=r3t4TTOMVxWO4lDPtw+8o8GZCz7odm3/TzNlcAuqEKpdQP9BKdWnx9bxMaMqkA2zQ9
         Peaw6tJsZkWF2plopa/QSA4XE3c6p6yLv1loBMS/zuERrbx0uhCG4VvN02SHEaDvmVwe
         700ihruGn23VWMcPiV0fqoXyIi7x99zSlzdoqiH17nPXrbgkzDB2sl6D1xyEnfyKwrr4
         mMDGWpSfh9tD3MZVmyK811otkddP6n20pShem7zDb34dcetA5KZFRmi4AAGpOzNn+PcM
         1oEp213J2bU37RtCxwvfRDj42fUWUBML8NLw4O614Bilw/oKlJ2sr3S8xYI0VgZpgFOE
         0xJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755353799; x=1755958599;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/WPrq9qE/mcKs1KinEiimPYdP4EDUSl2u22e6GWf8XM=;
        b=vjue/S6cd7t8K6oOOibABFTt0vhHZ7UXtn0RXxhXYUCHb4NH/4stVdYb8M78ThKHtb
         zhFczdc9vS12V2J6TVpu2i4xVkUrfuPJaZi66nd0FzH8iCdm8n5aPrKNiSo6n/fVP4bC
         88wCW8eJwyUYfHRs0o8vlbNYblRyPHZJGK0zLwN924EpSMuroRuVwC9Tl/KzC9i4EE7n
         yneIUv8KNSW7nlDVKBejKSDbYl3gqUre/hjp9nBvRzSUQHJ9hCRGasm3gT2CMdsLFLj6
         GQ96mBMWTlSSjwPBntiaMtnXkBs36e8AFC3ejLPEB8DqsuZsbdWcyl9PSp8xSYzaVadV
         0k7g==
X-Gm-Message-State: AOJu0YwB16xEKDl2Xuf7yc9wentCeXWvLs5LGbvce5UcKTO95s55Az/u
	7xA8F0JvWTa/vJcrWxPyPU3164LfniJfAtaA29E+3bMu+xsIzWLQcpMEewOZfnztyo9m+GrSFlj
	/5tw=
X-Gm-Gg: ASbGncuoYpctXcH6bLdgaTvN0IeOBGyCkvwa9Cm/gPnJz3jpCC7SB5GzcfpoxhGOITr
	7eLcsFKUAKfRSAYHhwV00OYiOEyyu6GKeliWllgAfTsYtlwt21XEGPEQqrl5Ed5aAg/N2xwTfAD
	Q8wl5ssLCxx1DiDyMx7gLmYgkgRv7OLPHc/oJ0XIiLzYki8gYASgKOIlvznQ9lkbNl6rUSM6MBm
	kC/UXhQBtv8iEp0+HkbhQx45rZFLFazoV/S7UcjD2rpGZQN6Ra88HS5LmXe1TId4wEuJGsAG+AJ
	VNjTinJ1Up05v16hGlCb48HREKUISC8wWcFDYGNULk3PamVaidOBA/ZZmNK3k7x1fyUbrXJVzws
	f6tKHougf2DDhiVVnXJT2LtSAzzc=
X-Google-Smtp-Source: AGHT+IFg9HLizvQGJ4TwOzHyQne2Pjmhu3qTT34UGiwiDfF6gJsi9Wq8f0M9Mbi0CDc3I4ce5R6Msg==
X-Received: by 2002:a05:6214:3014:b0:709:76b4:5933 with SMTP id 6a1803df08f44-70ba7cb1a68mr71180886d6.52.1755353798673;
        Sat, 16 Aug 2025 07:16:38 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::f777])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba9097688sm23736106d6.25.2025.08.16.07.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 07:16:38 -0700 (PDT)
Date: Sat, 16 Aug 2025 10:16:34 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Yunseong Kim <ysk@kzalloc.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	Andrey Konovalov <andreyknvl@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com
Subject: Re: [BUG] usbip: vhci: Sleeping function called from invalid context
 in vhci_urb_enqueue on PREEMPT_RT
Message-ID: <1088432b-b433-4bab-a927-69e55d9eb433@rowland.harvard.edu>
References: <c6c17f0d-b71d-4a44-bcef-2b65e4d634f7@kzalloc.com>
 <f6cdf21a-642f-458c-85c1-0c2e1526f539@rowland.harvard.edu>
 <28544110-3021-43da-b32e-9785c81a42c1@kzalloc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28544110-3021-43da-b32e-9785c81a42c1@kzalloc.com>

On Sat, Aug 16, 2025 at 11:18:02AM +0900, Yunseong Kim wrote:
> I think this part is a macro, so it appears this way.
> 
> Link: https://github.com/torvalds/linux/blob/v6.17-rc1/include/linux/spinlock_rt.h#L96
> 
> #define spin_lock_irqsave(lock, flags)			 \
> 	do {						 \
> 		typecheck(unsigned long, flags);	 \
> 		flags = 0;				 \
> 		spin_lock(lock);			 \
> 	} while (0)
> 
> My tree is indeed 6.17-rc1. I made a mistake in the diagram,
> which caused the misunderstanding. I’ve redrawn the diagram:
> 
>   kworker (hub_event)
>       |
>       v
>   vhci_urb_enqueue() [drivers/usb/usbip/vhci_hcd.c]
>       |
>       |---> spin_unlock_irqrestore(&vhci->lock, flags);
>       |     (Context: IRQs Enabled, Process Context)
>       |---> local_irq_disable();
>       |
>       |     *** STATE CHANGE: IRQs Disabled (Atomic Context) ***
>       |
>       +-----> usb_hcd_giveback_urb() [drivers/usb/core/hcd.c]
>               |
>               v
>               __usb_hcd_giveback_urb()
>               |
>               v
>               mon_complete() [drivers/usb/mon/mon_main.c]
>               |
>               |---> spin_lock_irqsave() [include/linux/spinlock_rt.h]
>                     |
>                     v https://github.com/torvalds/linux/blob/v6.17-rc1/include/linux/spinlock_rt.h#L96
>                     spin_lock() [kernel/locking/spinlock_rt.c] <--- Attempts to acquire lock
>                     |
>                     | [On PREEMPT_RT]
>                     v
>                     rt_spin_lock() [kernel/locking/spinlock_rt.c]
>                     |
>                     v
>                     [May Sleep if contended]
>                     |
>       X <----------- BUG: Sleeping in atomic context (IRQs are disabled!)
> 
>       |
>       |---> local_irq_enable();
>             (Context: IRQs Enabled)

So it looks like we should be using a different function instead of 
local_irq_disable().  We need something which in a non-RT build will 
disable interrupts on the local CPU, but in an RT build will merely 
disable preemption.  (In fact, every occurrence of local_irq_disable() 
in the USB subsystem probably should be changed in this way.)

Is there such a function?

Alan Stern


