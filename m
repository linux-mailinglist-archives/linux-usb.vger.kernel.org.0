Return-Path: <linux-usb+bounces-16095-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E028399A5C4
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 16:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6227C1F22608
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 14:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6032185B0;
	Fri, 11 Oct 2024 14:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="T/SXrMoC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAADD517
	for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728655704; cv=none; b=fW3WSzOMabF3CJVFityfrRYNHVn+c5FU6UFLU4veI4JR5htNNf8fa80S90zpvO3sZwrWjbosGY/ObO9knC2Kt+loecr6j+lke+CqIGi0T2XFuZoZdTG/MTNv4US888ISB57P4Pi3AW3G8lWXcP24eBBU1obGe4JpnCp0etF47+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728655704; c=relaxed/simple;
	bh=KNHg690VzbGD19D6SFkkzazgVGxbtQ0FFBYN6fII+NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvFlcxQd2dzynQpdkJLIIwiGP+skjgdswfUL1cq28zgeMRBbC/ei6KxO8MT06b7eKirqRQb52M9zAiFNCLkTg0dffGzvO4nK183hDIoAe5BkNJvZZEN3rRnkvDW/ObZT3izZiMk024d8zyNSTGbjQ2zVb3JQKmf5Qio5prliiBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=T/SXrMoC; arc=none smtp.client-ip=209.85.222.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-7afcf9f3c96so208822785a.1
        for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 07:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1728655702; x=1729260502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SBHgSLmotPuWavg7bxJdcfW6VGuP7eov0LOsjiXZhFA=;
        b=T/SXrMoCcQdRoKjcj2os4N0Nk5Na308FNgJUuO3z1k729ZoFsldQUbWNm96Fve9lUh
         tGq9xX8LcqZzGyaq3HU9wsJocfLaGKoe7uOlCN5LbEf6OE8b/JTlGyts4XnpVa+Cuxoq
         P0yFri2WZX+DJ/EaNCuOsLntbFKePYSZAVkCE2d3iGC/vdGgPIegeApqazytjhoWmBWA
         5hmW7qoeJHLgKmXDRJoNmAqCt0moOlvhNbXPSowuqtFbU4yx/Ljj062y9R+YI4QQwQTk
         V4jP2rzRsvbiGUDsFUWg/mPyXu2K8wEzmePYn3ucU5OArfU2KXziGUXDuQ0qJDfPQ68Q
         +gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728655702; x=1729260502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBHgSLmotPuWavg7bxJdcfW6VGuP7eov0LOsjiXZhFA=;
        b=kbGXJfJTG+T0RCh5U5K5swe5L7/E24os8jVPkGcD45eEevjxRAuyAm9WmNV/wk4Xx2
         xolpjCb2ZY4A6l3Y1X54TTQy2nU1SXEmhhTieXY/F8KuBTfWwi7pgNUjHGCTwJhY7QAF
         41KRa7unpvYauk2dZzSzsPxzypZ4gLn79OOPuNugGMkWZKpj9baeaicBvzJNe4yvQB8e
         +/pUdtb77UaYkg10ifxj06qmF6v3RtaRAS6akW8Tc/vb9KT7U6yZCv8uwLBSwDQ8R9ps
         aJprKT0PADURrXXUL1jjiQnnBVj/Ob/5qdua59BsT/9qY0pMsq2vgibDOc0xUa4QKPDI
         A5aw==
X-Forwarded-Encrypted: i=1; AJvYcCWEwNTeZLLiT3A+JOoAgdUp2tb5/rT10sdklkjqunX/gOj4N1uRK0pS2QvGUtN830GbW37l9Usw7CY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0XSTtIMQSVyL67XfSVbvzlsPpUHcmb8dC+pLCzyEtmAo4e/iy
	fABSx51bjuQRwAsiH3q0GtEXf+so6KBicg49NbaNY/WsB5IwY5apeKq3gGRF8Q==
X-Google-Smtp-Source: AGHT+IHlTJKVJzss8TaMUZYn5xavVAh8mhokFlmIZWPVm1h4q2IsF8y5D6J03eYFVwIpAG+wgv1f+g==
X-Received: by 2002:a05:620a:4727:b0:7b1:161c:ef44 with SMTP id af79cd13be357-7b11a3c5c99mr409852885a.60.1728655702078;
        Fri, 11 Oct 2024 07:08:22 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:2501:2805:c6d5:fe22:7fa3:ec54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1148f07d3sm133610485a.59.2024.10.11.07.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 07:08:21 -0700 (PDT)
Date: Fri, 11 Oct 2024 10:08:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com>
Cc: Marcello Sylvester Bauer <sylv@sylv.io>, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_port_suspend
Message-ID: <d65e2258-2901-486a-ab83-ff57e9868a91@rowland.harvard.edu>
References: <6709234e.050a0220.3e960.0011.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6709234e.050a0220.3e960.0011.GAE@google.com>

On Fri, Oct 11, 2024 at 06:08:30AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    4a9fe2a8ac53 dt-bindings: usb: dwc3-imx8mp: add compatible..
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=17d067d0580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=4510af5d637450fb
> dashboard link: https://syzkaller.appspot.com/bug?extid=f342ea16c9d06d80b585
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1312c327980000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/883c5319cb52/disk-4a9fe2a8.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/caf4421ed2ef/vmlinux-4a9fe2a8.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/d8e3beb01d49/bzImage-4a9fe2a8.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com
> 
> INFO: task kworker/1:0:24 blocked for more than 143 seconds.
>       Not tainted 6.12.0-rc1-syzkaller-00027-g4a9fe2a8ac53 #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/1:0     state:D stack:23808 pid:24    tgid:24    ppid:2      flags:0x00004000
> Workqueue: pm pm_runtime_work

Let's try to verify that this problem really was caused by the timer 
changes to dummy-hcd.  The following commit is the one preceding those 
changes.

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git 920e7522e3ba

Alan Stern

