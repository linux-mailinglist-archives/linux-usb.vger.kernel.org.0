Return-Path: <linux-usb+bounces-27074-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DF3B2E705
	for <lists+linux-usb@lfdr.de>; Wed, 20 Aug 2025 22:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77B7C7BD47D
	for <lists+linux-usb@lfdr.de>; Wed, 20 Aug 2025 20:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD822D879D;
	Wed, 20 Aug 2025 20:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="gDu97V0n"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECCF2D321A
	for <linux-usb@vger.kernel.org>; Wed, 20 Aug 2025 20:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755723208; cv=none; b=sHohtYkIXg4f8k2D3dRfXmBecJ/HEi3x+kHFYfLqcPBXNTys/SwrY3ykCVPNc3dsn7EYWHcnpzjS92+vfmrzJAtE4cqAZYMxqtY9SIfC3AdE/M5hUXTSBfUNHPV4QAPnr5C3kNzEbqUS+PghvT68sSyEq26wiLNrJIvOPG5I6ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755723208; c=relaxed/simple;
	bh=VIyrJpEFIPYoatsZhLYlrCU2ggqd1pXHZxxhokSZRmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwXJcoZzaxzUlCWV5LYb3SogDtMshE07jINvwinQTkFT/dwWWyQyFEbwjsGVwc8fS86fLw0sUMn8G0OlHmGuHw7XLNmGLr+KxYB1RhN4MiIZkbJHymig266ocIVBV6qht6vikoCX46HeqbVsxC/pJ3NlnA2h4h0gpCKm+612rPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=gDu97V0n; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7e8706491ecso35299985a.2
        for <linux-usb@vger.kernel.org>; Wed, 20 Aug 2025 13:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755723206; x=1756328006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jJpxMjDnIaSlIPid+3+Qy5Nk3nV+2lcHpQzCfyRt4qQ=;
        b=gDu97V0nQJlqRrlxk3m/ZQZA29Z4N9oSMOIYlcTE/cVlCvDnOONG1oTf+ORxMuh8RC
         fTwmxF4Y2XdJ60s+N/RKjMnO4HsVkeInndxSwgVRYZkPM6GtomReWiO5zabTNkXp0rlF
         sZEwN13mypzuapn3K1UdBaMaktQWacNn9aErvCSQcusCJM4QkRKYaX5Lx+EbmRrvD6Rg
         jysLUmvFr0TdPjKYJk28jjLwuyGiyRsx5WqUxnFVdXyUN7DMy2WQ7RSqCxyNiFttogeS
         UJkZCz5skTcTVDtYjjU0DlHEhiZPpWYnUpZNC+uBYHV27qE3k/1lzDeKVALSQuAGUwrb
         iMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755723206; x=1756328006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJpxMjDnIaSlIPid+3+Qy5Nk3nV+2lcHpQzCfyRt4qQ=;
        b=ibRaI+/xx9om7L2wWJfCZiwxrSc9OdjdaV10V+O4RvS1QQhSgWhv/XT51dBzyH96WV
         xrh+NFy7zLfEoigV92anc6hlHv/ZxRQiuMsGPhcqPyN5jBsLMnIcCsuoHTIrOnjgp8Er
         xQDTxCtjvtwbW/hhkGHP2KI1BZ78Utll2N6HAePWyTN89uNaHivXr5Vd3N46X0SD8v46
         8jjVcNUOXjiBjmcuoQG537y55NTzMG/Bs2rQGwt/egsNNGruCy3DnQv3XD1kL3gPMTbk
         PML7ZVqWRMbuxFrJrNglAgZ3NaxUMyU8sObPQHUdXPB30IEmK5lMNX1stYvE09tmY6sH
         ugfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlJS3tg0H0DIVzroE/Exh1wALcoTVSmIfKqZZvu3sj481koX8aZDHW9Ro6g/skJVHR6DTLsafTv3A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0F8Mr8TQxR7oWl+BZFxPQ1R+WcCiMpMfTx7MR8UuE/ekLHFS0
	+EqUpNCxBrOXDllqr4dOBKEGqSb7i9WC6AyuQIWxAymwv67RDjS9Fnwen+uqfFzjaQ==
X-Gm-Gg: ASbGncsvqN/RAloYfvjJheZOBPnBHyLJt3Cc3yLlMg6diCuIW0mR9HxhH/txPub+G4n
	v9Heo/61DuZaa/o2KsjS4UkKVC59IxZZ7ZUDMNtOp8mEx/kuUB01AagHYtJEJ75jQ9vXqJDcUE+
	ZiSxgzAUUGrQC3FVuvHBg3Y4VRLKOUjokoiqDp+N/VlRLpUNYWGuNjbtV8fOVk7aNoN60aNyqFg
	O0MndmEyxJNQ4Jy+HHkb937hNEJNbTUSVFZnaGqIMK4XCVECI8A8jV6JoTJbGfzOQTlP7VHyUH/
	BW/PIGImJ9cM8rl7AUt/9ko4tKXk/B/Nu9gUJtc2pgZ7asNUZLOZDDLfC18lWMGZ906slJE3WoS
	QORl96zxWAGD0KdTpc6ezX/Otbseh
X-Google-Smtp-Source: AGHT+IEEiHEmJejSDKIefSGWku8mNaZgNv45VwJxxj00z/0zv9pKs7j2zbjaFIDW8liClWJhp9fD8Q==
X-Received: by 2002:a05:620a:472b:b0:7e8:1cff:72fa with SMTP id af79cd13be357-7ea08e97cebmr1182285a.59.1755723205905;
        Wed, 20 Aug 2025 13:53:25 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:156:8000:24f0::a6a7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e19211asm1007437385a.51.2025.08.20.13.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:53:25 -0700 (PDT)
Date: Wed, 20 Aug 2025 16:53:22 -0400
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
Message-ID: <f632babc-6f66-4ccc-93f8-1558fbcdeb08@rowland.harvard.edu>
References: <c6c17f0d-b71d-4a44-bcef-2b65e4d634f7@kzalloc.com>
 <f6cdf21a-642f-458c-85c1-0c2e1526f539@rowland.harvard.edu>
 <28544110-3021-43da-b32e-9785c81a42c1@kzalloc.com>
 <1088432b-b433-4bab-a927-69e55d9eb433@rowland.harvard.edu>
 <2bf33071-e05e-4b89-b149-30b90888606f@rowland.harvard.edu>
 <20250819110457.I46wiKTe@linutronix.de>
 <49ee1b8a-d47a-42df-aa64-d0d62798c45b@rowland.harvard.edu>
 <20250819145700.sIWRW7Oe@linutronix.de>
 <bb7e34b7-c06b-4153-ba6c-009b9f1b34d0@rowland.harvard.edu>
 <20250820162621.UiUQUcp1@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820162621.UiUQUcp1@linutronix.de>

On Wed, Aug 20, 2025 at 06:26:21PM +0200, Sebastian Andrzej Siewior wrote:
> The problem is usually that nobody knows why exactly interrupts are
> disabled an what purpose it serves. Often the reasons is no longer there
> but the code still does it.

Indeed, that seems to be the problem in several places here.

> > More to the point, out of all the possible reasons why $SOMETHING might 
> > be invoked with disabled interrupts, which of these reasons remain valid 
> > in RT builds and which don't?
> 
> None (in most cases) because interrupt handler are threaded. So
> interrupts are never truly disabled.
> Adding the macros as you suggest would gain probably three users:
> - inode
> - dummy_hcd
> - vhci-hcd
> 
> Instead I would:
> - vhci I would suggest to remove the disabling and move its completion
>    to BH.

Agreed.  But it's up to the maintainer.

> - dummy_hcd I would suggest to either do the thing you called silly or
>   audit the gadgets and remove it.

Auditing is the best approach.  It would be a lot of work, though.
Also, it's worth noting that other UDC drivers do use the 

	spin_lock_irqsave();
	...
	spin_unlock();
	usb_gadget_giveback_request();
	spin_lock();
	... 
	spin_unlock_irqrestore();

scheme, so using it in dummy_hcd would be reasonable.

> - inode I would suggest to keep it as-is and audit it properly later
>   once someone intends to use it. It would also give the opportunity to
>   clean up the commented locking statement.

I don't know if anyone is using AIO with gadgetfs any more.  I've never 
seen any applications for it other than to test the implementation.

Alan Stern

