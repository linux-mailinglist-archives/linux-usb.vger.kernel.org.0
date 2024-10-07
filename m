Return-Path: <linux-usb+bounces-15820-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7F499335F
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 18:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BA39B22AD8
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 16:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843241DB530;
	Mon,  7 Oct 2024 16:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ZfyGwqq/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7186C1D61B9
	for <linux-usb@vger.kernel.org>; Mon,  7 Oct 2024 16:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728318951; cv=none; b=MvXFgejVmfgRUuG3ns2kwWQySdUIx0KD6q5fXY7Sk653Q5cWGC3lAAIr3oGLktBkgzcRu2TGi2HkXTRk0/IxmjpIG5ohnukBSGn6tzJu//PdUWnCPm9RX3qVTljBst2ZkX4Jr7m6LqMP8K5bLd6ePfbD3X0HPjtnBRjwV5mFK58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728318951; c=relaxed/simple;
	bh=6lKjgQHMd4NGPHit4J/OsomfblS+4HFIsoEkB0mfEVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKeXJ/a9qs8BzV59fmMjHWWxfGN256LLodbE23NaSVJwzumIm1vq+msBSgEzoe8cITp9UCxW0c3LUhfunO5p68wDLgxM5RELLL4rheEjv9jbb3iz3l4OjQgiun2t6APUbUJCOwmigrhJ1F0610S1VzkjfIX0HmMcl/3BLWZ+HMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ZfyGwqq/; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e25f3748e0so45529127b3.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Oct 2024 09:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1728318947; x=1728923747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lJp16n6SAZ1v7EFU+43ke8Wi0cIKtqnbpYISUuWVtLc=;
        b=ZfyGwqq/VSW3Mx6KtEZyzrOlPKS+nYSQKDb/FOzi+olAkb59Oo0uzVRIy8Pf0M2XVJ
         V0i10FUmb5tAwhCO7GYtYk5GffWbxkaXQv7iwqLBEJihh1/VOYH8bJpAsgpu2pQRnIP5
         H+ZDpivTXmsWAzMjMvnXtpRmfMxXeHpHM57+noffEn9MWDQZlNE/2PDElr34ra0R5Cqa
         d6S4ZEbdNNuUNwJ261YEhI7I5EdIJbucTrYbJbPKv9PiGb15qHFGTM63ctb8o3BA1PYI
         GrSsptLHvMI36kiNZyIiWbQ1EWgJk0T88xuZrUwgi9AcJGxBbWxpOONpoAj86YcF/u05
         et5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728318947; x=1728923747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJp16n6SAZ1v7EFU+43ke8Wi0cIKtqnbpYISUuWVtLc=;
        b=Q+gmXpXtQa5VhB6S8wUzH6HQY0RI196MKpUEXfhgpFkYOm8CpArSyASObguc/dFVVR
         XDFJYmMf0DYvQoHVmrJPu+XtDRZEW0HoxkRgQejG/8fj7ZOsa+Qlf4Ok79CtljgTVPui
         k02YFanW0FOgcIthEzawWevfV6CKh0OgVCi57KQ8MYd45rJQMexO81fd6CYdbnrjpUMc
         qXkxCEBfmy6SWVAak7t/UN5RTaPepsMlDoK0lUI4RimvNMias0Rj39k5tygtH4ckTkxl
         1vC1PLCHTi/zYU51cvh+Gs3oOFB2MMc/WDWX2rcbjikrzgPExEbm1/evD2/lTVQ+L+Y0
         98EA==
X-Forwarded-Encrypted: i=1; AJvYcCXYkSbbOZsJZDOs7ZIzO+5nyOAv7Z7DHG3xei/7onpR6dlg/EsA6ezXq/W4lP4zFfXxMsClBmNnfLw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0blgh6rbVtu/v9WdESaVOJGs2/9KqSo5j9+T9yd17n129wckX
	YNPZqzn0tORBADpyNdluYB94eL/q4MDlVlRORfHIZRohJ2gMLPx7TjC1TEXasQ==
X-Google-Smtp-Source: AGHT+IHkIVn1+wrMA3Z6rrGLzcHjNvyMxtcS2w3ZQfr2QINyWvoy7PhmxJgqrf4FLSGYNJ+3zDccIw==
X-Received: by 2002:a05:690c:6e07:b0:6e2:1062:9b90 with SMTP id 00721157ae682-6e2c72b6587mr106900347b3.44.1728318947362;
        Mon, 07 Oct 2024 09:35:47 -0700 (PDT)
Received: from rowland.harvard.edu (wrls-249-137-9.wrls-client.fas.harvard.edu. [140.247.12.9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cba46cd10asm27229956d6.16.2024.10.07.09.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 09:35:47 -0700 (PDT)
Date: Mon, 7 Oct 2024 12:35:44 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: syzbot <syzbot+a194ded97ce38690073f@syzkaller.appspotmail.com>,
	Marcello Sylvester Bauer <sylv@sylv.io>, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_register_dev (2)
Message-ID: <24c3555b-577e-4d0e-8540-7b1f009cb7d3@rowland.harvard.edu>
References: <6703c076.050a0220.49194.0505.GAE@google.com>
 <b60f922a-5c10-4983-9404-ad18bdd86c67@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b60f922a-5c10-4983-9404-ad18bdd86c67@suse.com>

On Mon, Oct 07, 2024 at 04:16:27PM +0200, Oliver Neukum wrote:
> 
> 
> On 07.10.24 13:05, syzbot wrote:
> 
> > INFO: task kworker/1:0:25 blocked for more than 144 seconds.
> >        Not tainted 6.12.0-rc1-next-20241003-syzkaller #0
> > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > task:kworker/1:0     state:D stack:20416 pid:25    tgid:25    ppid:2      flags:0x00004000
> > Workqueue: pm pm_runtime_work
> > Call Trace:
> >   <TASK>
> >   context_switch kernel/sched/core.c:5315 [inline]
> >   __schedule+0x1895/0x4b30 kernel/sched/core.c:6675
> >   __schedule_loop kernel/sched/core.c:6752 [inline]
> >   schedule+0x14b/0x320 kernel/sched/core.c:6767
> >   usb_poison_urb+0x1bc/0x2e0 drivers/usb/core/urb.c:763
> 
> This points to a bug in the HCD.
> usb_poison_urb() is guaranteed to make progress.
> 
> >   poison_urbs drivers/usb/class/cdc-wdm.c:342 [inline]
> >   wdm_suspend+0x174/0x380 drivers/usb/class/cdc-wdm.c:1271
> >   usb_suspend_interface drivers/usb/core/driver.c:1328 [inline]
> >   usb_suspend_both+0x2a5/0x1140 drivers/usb/core/driver.c:1433
> >   usb_runtime_suspend+0x59/0x100 drivers/usb/core/driver.c:1968
> 
> What HC is used for these tests?

Although the test's console log doesn't say, the test apparently used 
the raw gadget driver, which generally is run with dummy-hcd.  That 
driver has been having unexplained problems ever since commit 
a7f3813e589f ("usb: gadget: dummy_hcd: Switch to hrtimer transfer 
scheduler"), although I don't know if they are related to this issue.

You could try asking syzbot to run the test with a patch reverting that 
commit.

Alan Stern

