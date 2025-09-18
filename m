Return-Path: <linux-usb+bounces-27028-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 891E4B2C6AE
	for <lists+linux-usb@lfdr.de>; Tue, 19 Aug 2025 16:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 083D51BC5362
	for <lists+linux-usb@lfdr.de>; Tue, 19 Aug 2025 14:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0B2226D14;
	Tue, 19 Aug 2025 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="TFfy3k/r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78D62253AB
	for <linux-usb@vger.kernel.org>; Tue, 19 Aug 2025 14:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755612758; cv=none; b=OSqo3AB9N0Ngr2HNM5UqMeSTLePXTkcwYELTXnPcq94AGxGx7EoEacuWJLqoXWQbrZFrPI9dRbTrX5NZ0pdwPZ2j0Z1KxGE4+mvmBDQAJuxlw6WSaxnhXKHF4Kc6vvpP4PHEKqybYCdQahU9Ms3mssaBqpH4e0JztG2lP9CvYz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755612758; c=relaxed/simple;
	bh=gt4mRYfjODV9zhqfPjnfdU89Lq3jwQVRdixAwLEWLSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HA6HH+4oy801cV49DlLMi09vHt6TjiOHhG2mTsDOa68fmfyK9SWX6YvNsYAP6pKfxAgCgsrK+iA+SV1hy8hCXfu0h8FDAID112VI52tWra4iWttE4PTBBboh1/dbQ6XwyjAAbCjnoFIiP8KhtP7FfGLVb9CyWBdrivUXzN3Hmyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=TFfy3k/r; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7e87036b8aeso604151085a.0
        for <linux-usb@vger.kernel.org>; Tue, 19 Aug 2025 07:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755612756; x=1756217556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bDLwUY8c5UikKYG43v+aAUoS5K12CXkZu1S6tpWU6eg=;
        b=TFfy3k/rnhuwPkiNn4niFNUXwgmnpl7DS6gFMh18k8UWlbgbmf52NdHiFYbB1xjydb
         wCJ8p3YuHFEkvLlTWoju5a+eHqH9DGz3Hbiif4xV9o9NRpsNjOArzd4M9YvD8VP75ZJX
         pkDOzeFkrTfwpYv+dwmZ45w6j0PVnOoFVlUotxpoU5EiXMIQkDlxBuFLS/CODJVeQqVl
         k2B0iiPHVSDMd355ILgBmMiJ2OxKEf95gtQPrCvxudYLMzuAgQiqJgejHHcARvVrKaGA
         TBtvv0JrFfzEQD9NazxIe/YBHGEyTcHnvSc2Nw8HDkbzcJ2GJdX/JDfZf0O4a5rGMrxI
         pooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755612756; x=1756217556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDLwUY8c5UikKYG43v+aAUoS5K12CXkZu1S6tpWU6eg=;
        b=mpnLqW/Lt6uLSXiUtcq0ljLWKkbxM0RI4pAQqooEVvnWAapl+/OuvvySt9uWs+M2iV
         6JpQPSICTseGdFulQGqGK5ws9BMdDQba866MMkKfdP40WelqM5GyfZvksEDWWCYFEOSK
         HaPekNo0Ne9vWDBcd6G80lR1Z0J7+tv1MtMg6tgAZjmKbKUK4JKVaQXShSzTa6sEOzH3
         54SKsLo3hyxvjRlu6QTW8p2OkOANpaj4HOn1R9I8SO2fNf/VoLMKKbk1VVmx1tlmTKRz
         xvEH6NreA1EYUEND3oms2ERyVJ3ltNrc9Wg4TEIaMl8XVslVmkamGnFUPVrXwYyXKfky
         r9BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUubW/c5QlLJsTrto2kd9eLlWBoW13DQEIKUb/0UQvPNzC6bBxodlpcqvG1bXynRT0srUYZd6blXjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwERN2lgfsxYvBgosc7DOwKIxtnxECRCLx3pLO/JUhp7p6yY/oV
	MXZ0NNWsSLIk2g6ccPAuJijLWrJ8KM8YcHPaqaPtE9YRKcRg7Ni/Wm/2HPXCSDZT3g==
X-Gm-Gg: ASbGncu/Wa7qoM71Ea/5ILh/b+w9gZ6rQ+PHCyUQwUCUEjcZ1o1/YpT7QmZJhbKtUkK
	40olvefZ4niB8Fqfvc/lQFCn9gG7EVBZpe3Pb05A2hUg77lt0YFVTO0x1LfNEPnNb1fTDAaiaDH
	Ri6o9kgQ8F473YEs7ht+pfowRPa9FlTLgxbcPExO8+QcirqzESsAxElfg24I2GuoV+O88zCDn59
	HumJP4+BzVjuuUyRipmWAB8iqADdP1MnZzhSS8E46IUtq3AfHzDzbdb6uOhw8cbVIt1ZbCdnwW5
	CrqvKiiNOph3tYR89/ltHfTK+61/RL4cFqGaHYmsxcXQ0m2vljW6GN8A7Y/XowSFELTVJVPVO/p
	0JzlFRofZvrltB1roECAPRzYOrcM=
X-Google-Smtp-Source: AGHT+IHQg04DWf8DLLAvL7X03CUOIZTn7DoQBqcIlAoSiqB7A22l6EHFGlPS13+38MuE7eItCA2s6w==
X-Received: by 2002:a05:620a:1a1f:b0:7e9:f17f:65b8 with SMTP id af79cd13be357-7e9f3361b7amr352563585a.39.1755612755346;
        Tue, 19 Aug 2025 07:12:35 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::fa48])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e066da8sm771292885a.25.2025.08.19.07.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 07:12:34 -0700 (PDT)
Date: Tue, 19 Aug 2025 10:12:31 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Yunseong Kim <ysk@kzalloc.com>, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Andrey Konovalov <andreyknvl@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com
Subject: Re: [BUG] usbip: vhci: Sleeping function called from invalid context
 in vhci_urb_enqueue on PREEMPT_RT
Message-ID: <49ee1b8a-d47a-42df-aa64-d0d62798c45b@rowland.harvard.edu>
References: <c6c17f0d-b71d-4a44-bcef-2b65e4d634f7@kzalloc.com>
 <f6cdf21a-642f-458c-85c1-0c2e1526f539@rowland.harvard.edu>
 <28544110-3021-43da-b32e-9785c81a42c1@kzalloc.com>
 <1088432b-b433-4bab-a927-69e55d9eb433@rowland.harvard.edu>
 <2bf33071-e05e-4b89-b149-30b90888606f@rowland.harvard.edu>
 <20250819110457.I46wiKTe@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819110457.I46wiKTe@linutronix.de>

On Tue, Aug 19, 2025 at 01:04:57PM +0200, Sebastian Andrzej Siewior wrote:
> On 2025-08-17 10:27:11 [-0400], Alan Stern wrote:
> > On Sat, Aug 16, 2025 at 10:16:34AM -0400, Alan Stern wrote:
> > > So it looks like we should be using a different function instead of 
> > > local_irq_disable().  We need something which in a non-RT build will 
> > > disable interrupts on the local CPU, but in an RT build will merely 
> > > disable preemption.  (In fact, every occurrence of local_irq_disable() 
> > > in the USB subsystem probably should be changed in this way.)
> > 
> > Or maybe what we need is something that in a non-RT build will disable 
> > local interrupts and in an RT build will do nothing.  (I suspect that RT 
> > kernels won't like it if we call spin_lock() while preemption is 
> > disabled.)
> 
> This is the local_irq_disable() in vhci_urb_enqueue() before
> usb_hcd_giveback_urb() is invoked. It was added in 9e8586827a706
> ("usbip: vhci_hcd: fix calling usb_hcd_giveback_urb() with irqs
> enabled").
> The warning that fixed back then was 
> |         if (WARN_ON(in_task() && kcov_mode_enabled(mode))) {
> which was kernel/kcov.c:834 as of v5.9-rc8 (as of report the mentioned
> in the commit).
> local_irq_disable() does not change the preemption counter so I am a bit
> puzzled why this did shut the warning.
> 
> > > Is there such a function?
> 
> We could use some API that accidentally does what you ask for. There
> would be local_lock_t where local_lock_irq() does that.
> What about moving the completion callback to softirq by setting HCD_BH?

You're missing the point.

There are several places in the USB stack that disable local interrupts.  
The idea was that -- on a non-RT system, which was all we had at the 
time -- spin_lock_irqsave() is logically equivalent to a combination of 
local_irq_save() and spin_lock().  Similarly, spin_lock_irq() is 
logically equivalent to local_irq_disable() plus spin_lock().

So code was written which, for various reasons, used local_irq_save() 
(or local_irq_disable()) and spin_lock() instead of spin_lock_irqsave() 
(or spin_lock_irq()).  But now we see that in RT builds, this 
equivalency is not valid.  Instead, spin_lock_irqsave(flags) is 
logically equivalent to "flags = 0" plus spin_lock() (and 
spin_lock_irq() is logically equivalent to a nop plus spin_lock()).  At 
least, that's how the material quoted earlier by Yunseong defines it.

Therefore, throughout the USB stack, we should replace calls to 
local_irq_save() and local_irq_disable() with functions that behave like 
the original in non-RT builds but do nothing in RT builds.  We shouldn't 
just worry about this one spot.

I would expect that RT already defines functions which do this, but I 
don't know their names.

Alan Stern

