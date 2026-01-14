Return-Path: <linux-usb+bounces-32344-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6DAD21066
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 20:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64AE13062E21
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 19:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F82346798;
	Wed, 14 Jan 2026 19:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="GuV5uCpo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C2D346E5D
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 19:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768418780; cv=none; b=hZcaYyT8H2hVnkK1/Imz2HVg3lxfU975bmmd3zwjDbbmkhV/2ws68SJoN2Ql8AB2E7mxllcC5qiY2crL1GhRSlJApsZs3SVrSfFhkVG//clDCQpcXxEWjGwr3I7/oo6iJBZa24celvOTQeTTc7llO310KEtL6sZd1c9IEZVdtG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768418780; c=relaxed/simple;
	bh=8PC1e7EiGa8I3htfwIvagJf3HLdJgrLyLQewfkJkM9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PcCWRsIx8TUoFskP+7ORoFgNuoULOai1le8PKUaRgnwknTls2dhCbyo1qVhaH7kpQ6vhNRk43D6Ygr8Ic9iXxmckNY4CQ5o3MrPG6qbQfPZJK0Cpg2K3+JV8IRXchkhzgHxxb0ahNYOEsbmhCBe4JssELwbByxdu+y8rJvIcP4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=GuV5uCpo; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-88fe44cce7eso974566d6.3
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 11:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1768418777; x=1769023577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nxJF7Sbb+sYk7J72rghB/RusXhNAXd0NYCufmfRO6vo=;
        b=GuV5uCpofoRXag7f2BWBsON5IceWHdwBXXMu/2Nx7SIgSHx6oNOBCg4mphJ64bJTwK
         lQzib7XSPKm9LTBpkOPZ/e2V9qPNRgO9R6XPCEf+mTnr3HE5G3dD448v2X9H8s0WvaiF
         N5lx5EaY4OMEAh0FUJU6zrG0dBK3Rwp5vfTXJH9OKvykcKUgYseEiyZfVkZUjFOKagVN
         JHWfDw72ToHBw9utWJMXsWOfUngeM7JoVJpQ0bgPcfd8k8qJSm+xCFAklPR3SAOE0HYm
         s31PBwjTr7sQ9TgORqDJ59Xy8QlEf0wKnOIPBZLsP2bBy8/BvxL/W/QptnJkWaFBKHIA
         PtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768418777; x=1769023577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxJF7Sbb+sYk7J72rghB/RusXhNAXd0NYCufmfRO6vo=;
        b=hsRvORMHrqB/VokUNhaRjcTW9/X137WQXnSwXSC6X+Q6sh+w1f+xYVaZXx6wQ/Licw
         mMwPDITIlj191mFsyFvsTi8uzm/E/aN2wyMqwWiq/aeP8xVmKSkx7rL5roq7UvU6AO2E
         CXM+VLbvSmRTgV6eltuRvuX97sH5AwAOjmbGRb+JTBIn4tBXUUJA/aj8CBPxqBQFNgd4
         c5gp/XERjVQyYV+aMcFmWyJcHtZR+PAWIsLstpKbujYtDFUQ1AoiKk7B1vdwIqmyP2rE
         ZcWtByV3YzNHYcnTAnHzcrnSxtztshE9WgDziW71T75qg8Eb4U2qp8uleAzjvxbmQDJA
         JoqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNQQF40+UG5iDGbgNfOsNMooOTfQ6qcivq2z/UDmahF/Tqk7pb1RautvrytUrp2K9TKiU7arJu0uk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQEoKIKVDaZuVKheKhM7CUB9BG0XqB7h8U6gS34EbeF1V2/7Bq
	bDCG84G1IVZy0zBu2/AqzI7GliyYrYhj6jEL4Q8jjE9C1H+JcxnFmLKnUnuahBmKXA==
X-Gm-Gg: AY/fxX7G7ptoU3+Dva/Yf9r7RbdEaE7HUCX3eOCpvIPIuioG2B2PMh9U9vdQ2pl29cO
	A8PZyXnJY9AoIOSSgmhN1xHn9XICXjBoI4mT2o/VGhUtIkVr9X8q2JYNyrfAktr6fukOXFZ7sZ7
	0Ma/i+UEvCTY3H+uPyHFC+NFNW1afd6w6juXB1ROfgg9XukUAaTp/1AD5PGQKN6YKstTaQ0X35/
	o9zpUuxU+TwvuEA81fKLnSjHrNtWypthTZL007fCIUsKkTs9vq5hVSEmlo3KMQ0UcFQNmprS5f6
	PQpMBa8ZETKpy9RdpHLPuNE49LNwP/0sXYjuDcIr0Qp3jFSO3wk89eQClJZLQD7HdY4e2tF2l1f
	oA+ZdocfhctBmSXVyHwZid88hh1AHrxYfsybnOsd5MKyVsfuaqJKN18Tpim4pfaJ8qH7ldGQDGv
	Umtyf3rji0VlGuPo5blWKQUuTA2kIVPZZcEl1RfWwc1GwP3sw5kkOLAPcFhVaU3hRVQdDaqOH0Z
	936tSQa
X-Received: by 2002:ad4:5d6a:0:b0:890:26d5:c1a0 with SMTP id 6a1803df08f44-89274315d22mr52633206d6.13.1768418777231;
        Wed, 14 Jan 2026 11:26:17 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-61.harvard-secure.wrls.harvard.edu. [65.112.8.61])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077234ca1sm184029396d6.36.2026.01.14.11.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 11:26:16 -0800 (PST)
Date: Wed, 14 Jan 2026 14:26:14 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Ben Greear <greearb@candelatech.com>
Cc: Hillf Danton <hdanton@sina.com>, LKML <linux-kernel@vger.kernel.org>,
	linux-usb@vger.kernel.org
Subject: Re: Deadlock in usb subsystem on shutdown, 6.18.3+
Message-ID: <2b4c47a5-1a5a-4e94-87d6-152da16a3b9c@rowland.harvard.edu>
References: <20260114024506.2210-1-hdanton@sina.com>
 <dae8dc09-0e06-446a-b6dd-4c86ec423997@candelatech.com>
 <c52546af-e39e-4096-ad11-9b38bb2d5f7e@rowland.harvard.edu>
 <a721a966-0a4b-cbc4-71ac-a482156ffa48@candelatech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a721a966-0a4b-cbc4-71ac-a482156ffa48@candelatech.com>

On Wed, Jan 14, 2026 at 09:51:48AM -0800, Ben Greear wrote:
> On 1/14/26 07:13, Alan Stern wrote:
...
> > > > > task:kworker/4:2     state:D stack:0     pid:1520  tgid:1520  ppid:2      task_flags:0x4288060 flags:0x00080000
> > > > > Workqueue: events __usb_queue_reset_device
> > > > > Call Trace:
> > > > >     <TASK>
> > > > >     __schedule+0x46b/0x1140
> > > > >     ? schedule_timeout+0x79/0xf0
> > > > >     schedule+0x23/0xc0
> > > > >     usb_kill_urb+0x7b/0xc0
> > > > >     ? housekeeping_affine+0x30/0x30
> > > > >     usb_start_wait_urb+0xd6/0x160
> > > > >     usb_control_msg+0xe2/0x140
> > > > >     hub_port_init+0x647/0xf70
> > > > >     usb_reset_and_verify_device+0x191/0x4a0
> > > > >     ? device_release_driver_internal+0x4a/0x200
> > > > >     usb_reset_device+0x138/0x280
> > > > >     __usb_queue_reset_device+0x35/0x50
> > > > >     process_one_work+0x17e/0x390
> > > > >     worker_thread+0x2c8/0x3e0
> > > > >     ? process_one_work+0x390/0x390
> > > > >     kthread+0xf7/0x1f0

> > Unfortunately, we have no to tell from the log you collected which host
> > controller driver encountered this problem.  Nor, unless you can
> > replicate the problem, any way to track down exactly where in that
> > driver the bug is -- or even any way to tell whether a proposed fix
> > actually solves the problem.
> > 
> > Alan Stern
> 
> The system was in the final stage of shutdown, so all we have in this case is serial
> console output.  If we set console to more verbose mode, would that provide what
> you need?

Maybe; it's hard to tell.  You'd have to enable dynamic debugging for 
the usbcore module and set the console to show debug-level messages.

> Or maybe 'dmesg' from when system boots?

I suspect that nothing from before the start of the shutdown would be 
useful.

> We can try to reproduce, but need some clues about what to provide to make progress.

The stack dump above shows that a kernel thread get stuck inside of 
usb_reset_device().  The first thing we would need to know is which 
device the thread is trying to reset.  Adding a dev_info() line near the 
start of usb_reset_device() would get us that information and you could 
capture it in the log.  (Along with that, we'd need to see the output 
from "lsusb -t".)

Knowing the device, we would know what host controller the device is 
attached to.  The trick will then be to figure what's going wrong with 
that host controller's driver.  It won't be easy, especially if the 
problem only occurs while the system is shutting down.

Alan Stern

