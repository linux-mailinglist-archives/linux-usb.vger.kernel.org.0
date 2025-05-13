Return-Path: <linux-usb+bounces-23923-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89825AB58C7
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 17:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E794461C51
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 15:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8817C2BE0FB;
	Tue, 13 May 2025 15:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="uZnzP3Vq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CCE1DED53
	for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 15:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747150646; cv=none; b=GreUvi7pcL95vXSe71Cmmt49OOxXEXp0rYjO7nG24sp/W1xItBV7Q8Fv8UOjPEKkPnwaqJ6wRkCuJJT4HxDItwpHOD/Nlb4r1r44h+xFgaphwzNUg885JOXQPAXJVuBZ6OGsfUo4/8xj6rsIS12RP1pk/8nMCF3pUwiv7rR8jQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747150646; c=relaxed/simple;
	bh=CTtDbeWwdllOOJFC6Uy8ygOqbtnJf22JPHMG6jug4UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCDeme4mn76PUO44ddK7p6bJWBqMQ9bkVe1YHsc3RxFHw3Wt8IgrxrrVkGdJdXa6G6WqAhQIjnaYWNuiQdI5sh00ytmJnaQ2T51id2MJlyBB2y1bSpdl28n92idcDfcnMM5ZOfF6PIj8M0B7wH7QoKWY8ZaIWXQ2ZXIJWkXnOWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=uZnzP3Vq; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f0c30a1cb6so43422446d6.2
        for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 08:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1747150643; x=1747755443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NFGbIoM56oY9CYSlck5qbHpuQ4uA8AlSWoOsJXQxQnQ=;
        b=uZnzP3Vqldfp6S/mKh4emO+FxOi+DjPNrQofYIRKgTxEYMOps2iJ2NB2JqdpMcQVcT
         ICWmxvCgf64vrPxEhnN/lJfPiim8y25lbegciZZKwBdNBvvydiaVgVXwifij/1ohU6bB
         9TpkHPwprdVGT3NbaFquz/Epzs4U0Zz8DNtfLaGhZr3rij+SQUB2radEPwQU/qh5x0/r
         t6LoE5pzUO6hsOZ598gKdgAEMyDKcjO/QBuI+fAyaoxurwsLP76ormN4jkUqDJ9Mtw9n
         CdHrLOZWbLqAkNTPjJh0UdiEWi6CFdOzhD7keZLmDMupJXpX05RG2ScW1zNSnBHhD+dL
         /xJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747150643; x=1747755443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFGbIoM56oY9CYSlck5qbHpuQ4uA8AlSWoOsJXQxQnQ=;
        b=pBepnUA6NQYcWxoHljS2n/EaU/5EbOfxb7HaxkW4GOP3xKm2eL4CzrR7yNsDACg03f
         m28xmWe91hidSLuZqef8lmVW6RQ8RTyTqBagFHE6wD9jytb37bBMOYtds4aWfkE4ruEq
         4Wn2rLfRq8cf3sOhN7ItuDEkbSkrkQaxeOsjfNlGRE5PUghkYKNAdRNbBZuSMEv87fpL
         CzlSEvjoNgAT9WORksUxklbCOeBWd9FBZ6ilMFrFO+PLtO/PDANYITuowSYIfN4YfLRa
         GSnpfgRTgX9RtxS0J8KiqqmHmNalWjphUfSST6/YmxMGJ4EqCKtd+/speEAfYXC6uvdc
         7vvA==
X-Forwarded-Encrypted: i=1; AJvYcCUxCRaIXBZR+dxybsnzvXADaOjCvvNCUtiKk1a9wcEVBvuBQs/MT5qWgvFxCXHN0DF8q3is2A7hnLE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyys3nED1e9UHiBzmcGZNfcu7Tzt5UjGLmFRqjGwLiHdhSKx/Vp
	81uEu43EwIkcfrIg//l5T7Etx4PXkDpJPA3wxQEhEM1DPzD3iBieW13vUZMeIg==
X-Gm-Gg: ASbGncvahCYUDBLnDek2k9Ijns6MK8Me8P1PDJRiQLKp5TZZb1UL3AJVXcUBYD1F0pW
	TqJRcvqpcmfIl2QlIftX9xQxsSvHDot+GlolY3JLitPFXMRFelyPqw/nlCEZL3e3Bano85PEjQ8
	VVn3WugX1HXrI9Ayg+0CH/KOfqiK9MG9+6Z6htAOmIILIHc6mDzvKfoneuzBJa6WCKFaiN2XnXv
	5KzHpHegtaGPfRjj7zHOefS87cCODSkAVRj/DQnmDpeJxXiN14nnCnjz3lT8rMbfrb4F8Gnrpl2
	hqlQE7Eh3+znSHhYzh7whrWra0Qb0m2TD1in+O9ZXRWNS8nN7CLCLTNkqMKxAtxjNkagTQ==
X-Google-Smtp-Source: AGHT+IEHksdm/pCnn1uQwnUiWMrycBmsekx8bStKKlWjCJife5ySIwj7iwgMGAClNr2Csvd7UdE+Dg==
X-Received: by 2002:a05:6214:f2c:b0:6f5:41b8:47ed with SMTP id 6a1803df08f44-6f6e470e2fdmr303779196d6.0.1747150643015;
        Tue, 13 May 2025 08:37:23 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e3a0c93esm68146846d6.60.2025.05.13.08.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:37:22 -0700 (PDT)
Date: Tue, 13 May 2025 11:37:20 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: David Wang <00107082@163.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, oneukum@suse.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
Message-ID: <b334ef97-1f79-4dd9-98f6-8fd7f360101e@rowland.harvard.edu>
References: <20250512150724.4560-1-00107082@163.com>
 <20250513113817.11962-1-00107082@163.com>
 <8c963ad0-a38f-4627-be11-80ccb669d006@rowland.harvard.edu>
 <69accee9.accf.196ca18308a.Coremail.00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69accee9.accf.196ca18308a.Coremail.00107082@163.com>

On Tue, May 13, 2025 at 10:41:45PM +0800, David Wang wrote:
> 
> 
> At 2025-05-13 22:25:50, "Alan Stern" <stern@rowland.harvard.edu> wrote:
> >On Tue, May 13, 2025 at 07:38:17PM +0800, David Wang wrote:
> >> ---
> >> Changes:
> >> 1. Use caller's mem_flags if a larger memory is needed.
> >> Thanks to Oliver Neukum <oneukum@suse.com>'s review.
> >> ---
> >> URB objects have long lifecycle, an urb can be reused between
> >> enqueue-dequeue loops; The private data needed by some host controller
> >> has very short lifecycle, the memory is alloced when enqueue, and
> >> released when dequeue. For example, on a system with xhci, several
> >> minutes of usage of webcam/keyboard/mouse have memory alloc counts:
> >>   drivers/usb/core/urb.c:75 [usbcore] func:usb_alloc_urb 661
> >>   drivers/usb/host/xhci.c:1555 [xhci_hcd] func:xhci_urb_enqueue 424863
> >> Memory allocation frequency for host-controller private data can reach
> >> ~1k/s and above.
> >> 
> >> High frequent allocations for host-controller private data can be
> >> avoided if urb take over the ownership of memory, the memory then shares
> >> the longer lifecycle with urb objects.
> >> 
> >> Add a mempool to urb for hcpriv usage, the mempool only holds one block
> >> of memory and grows when larger size is requested.
> >> 
> >> Signed-off-by: David Wang <00107082@163.com>
> >
> >It should be possible to do what you want without touching the USB core 
> >code at all, changing only xhci-hcd.  That's what Mathias is suggesting.
> >
> >Instead of having an URB keep ownership of its extra memory after it 
> >completes, xhci-hcd can put the memory area onto a free list.  Then 
> >memory areas on the free list can be reused with almost no overhead when 
> >URBs are enqueued later on.
> 
> I have to disagree,  your suggestion has no much difference from requesting memory from
> system, locks and memory pool managements, all the same are needed, why bother?

There are two differences.  First, xhci-hcd already has its own lock 
that it acquires when enqueuing or dequeuing URBs, so no additional 
locks would be needed.  Second, complicated memory pool management isn't 
necessary; the management can be extremely simple.  (For example, 
Mathias suggested just reusing the most recently released memory area 
unless it is too small.)

> The reason I choose URB is that  URB life cycle contains the private data's lifecycle, 
> and no two HCD can take over the same URB as the same time.
> 
> I think the memory pool here is not actually a pool,  or I should say the mempool consists of
> pool of URBs, and each URB have only "single one" slot of mem pool in it.
> 
> 
> >
> >This idea can become more elaborate if you maintain separate free lists 
> >for different devices, or even for different endpoints, or sort the free 
> >list by the size of the memory areas.  But the basic idea is always the 
> >same: Don't change usbcore (including struct urb), and make getting and 
> >releasing the extra memory areas have extremely low overhead.
> 
> Why implements a device level memory pool would have extremely low overhead?

Because then getting or releasing memory areas from the pool could be 
carried out just by manipulating a couple of pointers.

Some fraction of the time, URBs are created on demand and destroyed upon 
completion.  Your approach would not save any time for these URBs, 
whereas my suggested approach would.  (This fraction probably isn't very 
large, although I don't know how big it is.)

> Why  making changes to usb core is bad? The idea in this thread is meant for all kinds of
> host controllers, xhci is what I have in my system; i think similar changes would benefit other
> HCs

Those other HC drivers would still require changes.  They could be 
changed to support my scheme as easily as your scheme.

If I were redesigning Linux's entire USB stack from the beginning, I 
would change it so that URBs would be dedicated to particular host 
controllers and endpoint types -- maybe even to particular endpoints.  
They would contain all the additional memory required for the HCD to use 
them, all pre-allocated, so that dynamic allocation would not be needed 
during normal use.  (The gadget subsystem behaves this way already.)

Such a drastic change isn't feasible at this point, although what you 
are suggesting is a step in that direction.  In the end it comes down 
to a time/space tradeoff, and it's very difficult to know what the best 
balance is.

I'm not saying that your approach is bad or wrong, just that there are 
other possibilities to consider.

Alan Stern

Alan Stern

