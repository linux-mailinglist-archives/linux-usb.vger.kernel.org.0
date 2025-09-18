Return-Path: <linux-usb+bounces-27033-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1218FB2C8B2
	for <lists+linux-usb@lfdr.de>; Tue, 19 Aug 2025 17:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43F2D1C24390
	for <lists+linux-usb@lfdr.de>; Tue, 19 Aug 2025 15:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD3C286425;
	Tue, 19 Aug 2025 15:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="OYZJmkin"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629A4207A18
	for <linux-usb@vger.kernel.org>; Tue, 19 Aug 2025 15:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755618300; cv=none; b=aM+kwSkOZRwTNWHwKpgczoYA6iWKj1ZaXarTWdnePMmbh7lxFEFpXxuX9sYgHM3qs9hHNF3Yeh7ww8o2JIBwo3qCL0RIlWUbHRJ3Vgy1rBVGMCanCgi/O6dJZS2I6TxkZ7TQv+jahlD99pV5OvbiQosbfGWyVidQqyJ3zGFhxvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755618300; c=relaxed/simple;
	bh=pRJj1H5tO7XMkVZRCLKY+sRfLzGpi20O91KKFr0QgRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOrLqzBngxTJKIdH3eMWhA6YJUAaAZ8QXyZb9SG6TnUKkmas/GVb9+U955DYnh6eHi1CRlS55WbiY1BjH/YDpjLUQ8t9QYI3D+ExJ5Iwl37PfNCqz0/q8F3jvnt2EVe0V2PGeXPV9aIX/AK2Mg+hE2kjYXKzAcqysxnAobYOP14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=OYZJmkin; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-70a9f5625b7so49675266d6.2
        for <linux-usb@vger.kernel.org>; Tue, 19 Aug 2025 08:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755618297; x=1756223097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3KlMvHTnEPY7TidCf7GXQGzitb9p96DYnk2H6Hb9KLY=;
        b=OYZJmkini68JWEd+aizXrWYd9UbtL4fX0SK9HLZpAb4nJvdcK4zb/7U8zS7JCAZFky
         mjwRhgVwLvMRelgaEzmuFXsHgtuovpSlDKFP2bjb0XpjS5c4R8Ti6/0ZFxPkN4ZMAvq0
         GZaBLwlNPchRlMb/+XTcSGvnh6zY0nmE6qGhr85T7G3SDnuEEuhWyCgXByNYxKEQYLuX
         jwpmkzW4/AvvmeVwI8dzX7nZCafA1nrCq1adcOnktHz6o7JrwJ4M32MeSQ0jkEYihZEV
         VT8b42Dx1NbbrB3Zgxj3pqVlYE3sJWeH1cYGd2e3ac+agh85kbnx+dyCB40VlDsJmpiW
         q4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755618297; x=1756223097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KlMvHTnEPY7TidCf7GXQGzitb9p96DYnk2H6Hb9KLY=;
        b=LVZEPmZ2Z0rJykH+PU/Wx1VZeE4dvBRcVpu6Ut8BrNtrU2jJIDyV2TJodHgLisSon6
         sITRXlsJZfOjAsA8uccnE/p0OxOUgsnz0g3jiD9I1zD8GiTA139c+eKrnN7pXME8cpb9
         22HPr5r7roivQ3FvF6usXFasaocFzvD1XIHWYv921dzWJP8pRFVxEt7eA+zl/KZuNvWF
         egJHEW9v6pMGq7O3+pUkNCPVA5T0WWTaETF5+7BO/Z9VsBsVQj+FJe5B/xzT6MBoeRMT
         xZMTvvQLKuANxmTLgF/c/Vibn+dMvaBoCsANcnteJKc7Cj9XXsYB1D37MRqC92QDSGjE
         quhg==
X-Forwarded-Encrypted: i=1; AJvYcCV6Le9OfKvIGSO6/MBSGmrUrulNSzaPo6I+ipSN//KkQ/o93MvpAIPIyTOMV3KFGYcUAyPUGCOIwSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK1Gw6YOpLo6DC8JU/p3Url2Sl1t6PtcoPueFdqdCybK6nFlhf
	R1rfGvKS7o/Fm3RO+DlKY1A0jAE/oZXRZur3rqKNtzOSsdjkYI2hgi7DoDfZwg+ExQ==
X-Gm-Gg: ASbGncvdK7jSX/1ehg9BVK/EHJgfv30L+xQ2yjvaTRmnggFtkVKY2vyA7ZRnyXp3xig
	Q1+7pPcrcCV6AuogB7wYOvtPrYSEnPLjINNMomUVlqhugAO34K8lBwsQOPCanG9tKPM3QlaGC/9
	BJC3RsR8swXM3jolAV5WTv0UW9Mae9jaRRxFdudgBB8dx5yYvq6ih7+Rq9RvPm9ZYUT5U2Sotc9
	O9UIpa7rhzJRb5IWwVXSPaXrh5QPX7N6BV2ftkON8y5QIa/BPsIL57Zq5/E/ALIorVP1Z9KxwdV
	ZaOFS7nN1z0aZCr3LmifFYqU0h4+iSIWfSoMCCHr5TyOmQiGEb37unYl4UvrV211PsyHXcgDwDj
	s8nnZu1Y76nZqjNbK8ZQjUaQAq+E=
X-Google-Smtp-Source: AGHT+IHsJOHr6hojE7rqYrX+qOfnG5f94QM0U9BbVYttqZiqetVC0hqJlHsw3PTuBRo8TpfE2D4Y4w==
X-Received: by 2002:a05:6214:2b0f:b0:709:b691:c9b3 with SMTP id 6a1803df08f44-70c35ba7757mr35172326d6.21.1755618297027;
        Tue, 19 Aug 2025 08:44:57 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::fa48])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba902f4edsm71527736d6.14.2025.08.19.08.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 08:44:56 -0700 (PDT)
Date: Tue, 19 Aug 2025 11:44:52 -0400
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
Message-ID: <bb7e34b7-c06b-4153-ba6c-009b9f1b34d0@rowland.harvard.edu>
References: <c6c17f0d-b71d-4a44-bcef-2b65e4d634f7@kzalloc.com>
 <f6cdf21a-642f-458c-85c1-0c2e1526f539@rowland.harvard.edu>
 <28544110-3021-43da-b32e-9785c81a42c1@kzalloc.com>
 <1088432b-b433-4bab-a927-69e55d9eb433@rowland.harvard.edu>
 <2bf33071-e05e-4b89-b149-30b90888606f@rowland.harvard.edu>
 <20250819110457.I46wiKTe@linutronix.de>
 <49ee1b8a-d47a-42df-aa64-d0d62798c45b@rowland.harvard.edu>
 <20250819145700.sIWRW7Oe@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819145700.sIWRW7Oe@linutronix.de>

On Tue, Aug 19, 2025 at 04:57:00PM +0200, Sebastian Andrzej Siewior wrote:
> > There are several places in the USB stack that disable local interrupts.  
> 
> But *why*? You need locking due to SMP. So it should be simply to avoid
> irqrestore()/ irqsave() during unlock/lock or to avoid deadlocks if a
> callback is invoked from IRQ and process context and the callback
> handler does simply spin_lock() (without the _irq suffix).
> The latter shouldn't be problem due to commit
> 	ed194d1367698 ("usb: core: remove local_irq_save() around ->complete() handler")
> 
> So if completing the URB tasklet/ softirq context works for ehci/ xhci
> without creating any warning, it should also work for vhci, dummy_hcd.

dummy-hcd is different from the others; its use of local_irq_save() is 
in the gadget giveback path, not the host giveback path.  We would need 
another audit similar to the one you did for ed194d136769, but this 
time checking gadget completion handlers.

> Only RH code completes directly, everything else is shifted to softirq
> context (for ehci/HCD_BH).

Correct (except that RH code always uses softirq context; it never 
completes directly -- the kerneldoc is wrong and Greg just accepted a 
patch to change it).

There are other places that disable local interrupts.  ehci-brcm.c does 
it in order to meet a timing constraint.  ohci-omap.c and ohci-s3c2410.c 
do it for reasons I'm not aware of (no comment about it in the source).  
gadget/legacy/inode.c does it in ep_aio_cancel() -- I can only guess 
that this is somehow related to aio and not to anything in USB.

> | git grep -E 'local_irq_save|local_irq_disable' drivers/usb/ | wc -l
> | 21
> of which 10 are in pxa udc. The only one I am a bit concerned about is
> the one in usb_hcd_pci_remove() and I think we had reports and patches
> but somehow nothing did happen and I obviously forgot.
> 
> > I would expect that RT already defines functions which do this, but I 
> > don't know their names.
> 
> We don't have anything where
> 	local_irq_disable()
> 	spin_lock()
> 
> can be mapped to something equivalent other than
> 	spin_lock_irq()
> 
> I was running around and kept changing code so that we don't end up in
> this scenario where we need to disable interrupts for some reason but on
> RT we don't.
> 
> The closest thing we have is local_lock_irq() which maps to
> local_irq_disable() on !PREEMPT_RT systems. But I would prefer to avoid
> it because it serves a different purpose.
> What works is something like
> 	spin_lock_irqsave();
> 	spin_unlock();
> 	$SOMETHING
> 	spin_lock();
> 	spin_unlock_irqestore().

That's just silly.  We should have something like this:

#ifdef CONFIG_PREEMPT_RT
static inline void local_irqsave_nonrt(unsigned long flags) {}
static inline void local_irqrestore_nonrt(unsigned long flags) {}
static inline void local_irq_disable_nonrt() {}
static inline void local_irq_enable_nonrt() {}
#else
#define local_irqsave_nonrt	local_irqsave
#define local_irqrestore_nonrt	local_irqrestore
#define local_irq_disable_nonrt	local_irq_disable
#define local_irq_enable_nonrt	local_irq_enable
#endif

> The question is why should $SOMETHING be invoked with disabled
> interrupts if the function was called from process context.

More to the point, out of all the possible reasons why $SOMETHING might 
be invoked with disabled interrupts, which of these reasons remain valid 
in RT builds and which don't?

> If your concern is a missing _irqsave() in the callback then this
> shouldn't be an issue. If it is the wrong context from kcov's point of
> view then making the driver complete in tasklet should fix it since it
> would match what ehci/ xhci does. 

No, I'm not concerned about that.

Alan Stern

