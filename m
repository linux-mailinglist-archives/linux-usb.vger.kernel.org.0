Return-Path: <linux-usb+bounces-27255-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1FEB34395
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 16:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 707311640B9
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 14:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C7E2FD7AC;
	Mon, 25 Aug 2025 14:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="WA1BJRIc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33273019AA
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 14:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131540; cv=none; b=SSU1DtQ34vzeU7M3jR1Fm1LA4ZiSSab/f0k8+m0DsJ7ldDKTru4hVj79EACnqE4V8m1vfW3G7uNsEH8vUoByp1j0lAQKOrr+0GdL3h27RzkNa2tjyIoCMfjENxn0o4R0nFyJ45Vr9kXXVyHwPYLAaKs9cKOyaH6OdFwyCvgIA1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131540; c=relaxed/simple;
	bh=jOfg/Y1SQiSgE9mDzqKKcsPOX6RmDmlQCtjdNfhHXKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKMIr3czm0ny2W4VklZo7llp/TRYVqdtrXUmoj4UFr/GW9X9OwEScTpk7NTiSikcl0LLymCJvmqgyq4lfOxx4tAeq5sPI2NMmOeWpNwLYNrsU+eSSHAl44Outmbj0pg+hHW76jszSXpf2RV+RdGlxEfp0XyjLX65U6I7OaxcF6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=WA1BJRIc; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7e8704cdc76so498608985a.1
        for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 07:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1756131535; x=1756736335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7lOEWufe9UzzaHtBmn1+xpK/4JhyHrg/d+7GlDI7l5Y=;
        b=WA1BJRIcqIg7wZMMeA6VP2qTl1KcuNfDYlgg+40TWTtlMJiISRN+Y/pzhd7XSOMoEW
         vZO8TdcjggpjdxNGSlBr+zkxLzTQy/17pqyhoOQ378iZcp16t6r/XqXSKchuoZvoJy5W
         3mKXPDLV4VWhVzphAKKj8MzisA18D05LnaHoVzIqKZ4Dq7HyJ5H2vH9VCpRFS91kiig7
         7lZ+VuUf4ghU7DmRBLKg6F7AhvkjL8zw4w0ftXOEUBMIjtdW7SzYqqj4tEa3PeYHAhad
         hjuh2pOFFX3tpMCLch4ZnHIkwD7IjonIeBdFP+UiIq+tigZ1FKNAt6G1W6Zcn6wuhJ0O
         2HDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131535; x=1756736335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lOEWufe9UzzaHtBmn1+xpK/4JhyHrg/d+7GlDI7l5Y=;
        b=PX/TqnuD5ui4DlxH6OcSuQKhcvi38GHPZjuAveZWTD0CUWkQhqqBHWnm/LyhsixJi6
         bFQq00UjZs0Xl3CwLd6TrudBna73zOR8qy539iUtBCb8WfnASu0uPRF2crt86ioFDQqV
         TBAW4Wse90Ar3ly53KqZISbxeTZBab8hNHd4u1mjdIUr9Iy9US24+p3S3KjCLAUlX5yE
         T3QgyvsX8xFKhJrHRE2YA4HVAr/Su5Iz0ZFt8oX0qMtaepxnCicVSZQvZNGRsbbaBKy2
         1at3ga9RIAIvLEoNIue3IKzRzQduNPCp55axotfDDsBd6lVT6kRN8SGYa6NsFILsklS4
         wnHw==
X-Forwarded-Encrypted: i=1; AJvYcCWLWyrnutxfewUt2QJHnDGAhJL9ewkbT2z1+8IXxxlhlN8Gt3EVa6IZFI7CO0a+1PJNiphQgW4KDSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYBr7NVKbf5u/qboVMiX7O9l5iXcEXMVZKVgANV8iF1K4bXqQY
	ekR5t9yTZmmcUWWxUlPZ+FnG/PSbcliGTtZqhtJVEd1Gy65aoRigAZBUpsBxg2LDlEcXcTY3ng8
	xZXY=
X-Gm-Gg: ASbGncvi6euu9vcyTt1vxUuIsZj5dHLoYDACJU7/6hMibNJz2iX6AWLn3a4xFAoeYJM
	+caTS/XDFrbDdMl+t73QaVMz9zT9EgvVyzHgG+o/0+Mwy/ONCuk71Nojuq/itDBA2uDYDOxMiPR
	jktDMDM5xBVF8/IMk6pMHSMgano+lrg8gT4pfXISJRNmuD2EAJmW8IWuGvWjAeKb80ffhMHJ33g
	tKMaHDotvH6EPjYhJlF9z2Shw0KY70xlvgkAStxNWCky9ZycwT6+DPQ05SJ9XyuY0ZdkVcSWRNh
	/ogxZ3x7TU5TmZ7QVM/g3QNqrOeI6I7xf4/bRz/eraUCBVP6i5uBHA5hGkUjPVWKTQ8v/+G1KhU
	NS1BnYa2qE/qmLPB2oIZgnd3F
X-Google-Smtp-Source: AGHT+IGqROVRvsJFr2NJxQIz7E6a+HuEAlH9ebDBpqEq2it7LlxSmnRPCnHBYHexFhRqMNlgYWZSvw==
X-Received: by 2002:a05:620a:4621:b0:7e3:33e9:9d36 with SMTP id af79cd13be357-7ea1101be0amr1518331885a.50.1756131535422;
        Mon, 25 Aug 2025 07:18:55 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:156:8000:24f0::eb06])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebeca23e05sm496905585a.1.2025.08.25.07.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:18:54 -0700 (PDT)
Date: Mon, 25 Aug 2025 10:18:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+8baacc4139f12fa77909@syzkaller.appspotmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Yunseong Kim <ysk@kzalloc.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] BUG: sleeping function called from invalid
 context in dummy_dequeue
Message-ID: <0d6d8778-a45e-498f-9e31-1d926f582d7e@rowland.harvard.edu>
References: <68ac2411.050a0220.37038e.0087.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68ac2411.050a0220.37038e.0087.GAE@google.com>

On Mon, Aug 25, 2025 at 01:51:29AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    8d245acc1e88 Merge tag 'char-misc-6.17-rc3' of git://git.k..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=11e42062580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=e1e1566c7726877e
> dashboard link: https://syzkaller.appspot.com/bug?extid=8baacc4139f12fa77909
> compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13317062580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14d5ea34580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/096739d8f0ec/disk-8d245acc.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/83a21aa9b978/vmlinux-8d245acc.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/7e7f165a3b29/bzImage-8d245acc.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+8baacc4139f12fa77909@syzkaller.appspotmail.com
> 
> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
> in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 6118, name: syz.0.17
> preempt_count: 0, expected: 0
> RCU nest depth: 0, expected: 0
> 1 lock held by syz.0.17/6118:
>  #0: ffff888144724058 (&dum_hcd->dum->lock){+.+.}-{3:3}, at: spin_lock include/linux/spinlock_rt.h:44 [inline]
>  #0: ffff888144724058 (&dum_hcd->dum->lock){+.+.}-{3:3}, at: dummy_dequeue+0x164/0x480 drivers/usb/gadget/udc/dummy_hcd.c:769

Here's the solution that we settled on.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ 8d245acc1e88

Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -765,8 +765,7 @@ static int dummy_dequeue(struct usb_ep *
 	if (!dum->driver)
 		return -ESHUTDOWN;
 
-	local_irq_save(flags);
-	spin_lock(&dum->lock);
+	spin_lock_irqsave(&dum->lock, flags);
 	list_for_each_entry(iter, &ep->queue, queue) {
 		if (&iter->req != _req)
 			continue;
@@ -776,15 +775,16 @@ static int dummy_dequeue(struct usb_ep *
 		retval = 0;
 		break;
 	}
-	spin_unlock(&dum->lock);
 
 	if (retval == 0) {
 		dev_dbg(udc_dev(dum),
 				"dequeued req %p from %s, len %d buf %p\n",
 				req, _ep->name, _req->length, _req->buf);
+		spin_unlock(&dum->lock);
 		usb_gadget_giveback_request(_ep, _req);
+		spin_lock(&dum->lock);
 	}
-	local_irq_restore(flags);
+	spin_unlock_irqrestore(&dum->lock, flags);
 	return retval;
 }
 


