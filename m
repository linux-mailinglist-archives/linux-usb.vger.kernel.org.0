Return-Path: <linux-usb+bounces-18209-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CE59E7C38
	for <lists+linux-usb@lfdr.de>; Sat,  7 Dec 2024 00:07:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14F312840AC
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2024 23:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF2320458C;
	Fri,  6 Dec 2024 23:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bHt92Kik"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9691EF090
	for <linux-usb@vger.kernel.org>; Fri,  6 Dec 2024 23:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733526453; cv=none; b=R4NNfGb7I21UXD1QkAB+DIZgx8lFCJwerDuuLnnKVplmteoBjTsS+RC79bjX01b6NNK9f3OhT4PbVunG/Us0kLbZbS63pKmmy2kiTlV6mf3CLKapTMyvigkpb9KDGfpCF6mBJUr67m65UrBSBuLGyeiIHJPj1K5I2QDy5geVS0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733526453; c=relaxed/simple;
	bh=ZrckKwaxd0iOvVnVJwtqfyNeC8EMZfsPgTDPfgGI/4E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RWB00lDeMFTdxd0OJD2sUoIgTi/Tin+6NkO+RWa51eU4GxukRCMVvPg/pDD3DIpZyq1+5+9I0N1RVycylwoJGJzkWQh9wuWbxPJ5kOrT0rEnltHwGAHF6uYUthkrWGiLBN/0szq8n3hJPxLc0QQM9meQvVIXgE+0PbgYJq2D3dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bHt92Kik; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53de8ecb39bso3489958e87.2
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2024 15:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733526448; x=1734131248; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6YU/vIe183Tuess7TedgK95pVnAD6FsLbz2wLM00SLc=;
        b=bHt92KikgE46z5RZIzBsZSkdzghCYTChLL/cj4YFPG5sfCajiNEr3lWs448xB05Luz
         qwDiM14dFobzmGuoqaWzS5CFISWqpzo3yGb89UiK3xghDFCV5ZCd5IJ8u6G62QjIHnPo
         h6e2tvVK5xZm3sVksU1u8VjOCAwnu9yb3/d6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733526448; x=1734131248;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6YU/vIe183Tuess7TedgK95pVnAD6FsLbz2wLM00SLc=;
        b=fl77/y/Z2E8vj4PRy0Qv4d0pHX2ym2yiCy7oVu8uO02ocuQJ9BmXt7kmq78BCD5B3q
         5EjUclgzqRkwgwFlpCst8q2S2RT9o7BuNUdMC7K0yNMPPBtEKmzPH3btzrBqOShYcBgT
         C2t5EUrzWd8GXdlVxI2zYM9eUqIrvpCNw79g0P7ZvmhMg11mfEnM1LdGRQzc5okhoX2/
         Mll/rOS+Pp+PDurJJg1VmQo6b2wzyfXj3GcUWfBMDYUySLSe+TlgaPsOPjPCAKVHsDDG
         /GFJ021Pov8a2G6g4VPSWexpE6yW+nF6cnBUg2yGTz4Z5/328SYFvYnwElFFGkus+w5c
         XOFg==
X-Gm-Message-State: AOJu0YxqwlQGw7xgxgx+u2ipcZAPUpP486p6JADPSH2t+k3tzmH2iqb3
	N4yieNSLts1Qc+YYwXwHoRX8J6dbRdE518UzJjg1HMj2MskgggUoSxVWs6dZiv+X3AEcJZVIw4c
	drwtS8g==
X-Gm-Gg: ASbGncvigWQ1dmaZmBTLWar5BUcv19YyOoC5GTOuhNF4Ea8Keoop4dC0ApWlSiwFWz1
	4zzcSRGnrYaLHfSbYkGMV7nwXEv3RI82lmFqr0JaJFaUewRmOm0awoZ5axv1Ry4uYudwLhV+jJP
	y6HRhqUZEZQ0NBn2qLBvd7bNB7CS249v+imvgLRyzXb0CfQ6S7Fs91m0yltLDpq6v84gmb6Rhi+
	uysmrVqGn/0OMzLj4mP6HFzVG5enHN1Kfw6SQeX0YsKTM5gFreBhn97ZT5OteWpRHaGaoGcUDGx
	AfNGMU07IDmAbh23QbW60wUd
X-Google-Smtp-Source: AGHT+IGFMcdIGA39We1ZiDHZ4HS1IHc5HK5+uMp9y8su7kInONYcz9MYFKbaBVHQwJ75b8Jp9uiN3g==
X-Received: by 2002:a05:6512:3d0c:b0:53d:effd:b06e with SMTP id 2adb3069b0e04-53e2c4fed26mr2526520e87.42.1733526448462;
        Fri, 06 Dec 2024 15:07:28 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e4da51sm303438366b.37.2024.12.06.15.07.27
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 15:07:27 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso321128566b.1
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2024 15:07:27 -0800 (PST)
X-Received: by 2002:a17:906:30cc:b0:aa5:1d08:dad7 with SMTP id
 a640c23a62f3a-aa639fb0e5bmr294353266b.9.1733526447203; Fri, 06 Dec 2024
 15:07:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Dec 2024 15:07:10 -0800
X-Gmail-Original-Message-ID: <CAHk-=whPKnwZbbAp1MjogDP1aDYrCmQ63VC82+OnsLKy9M+gvg@mail.gmail.com>
Message-ID: <CAHk-=whPKnwZbbAp1MjogDP1aDYrCmQ63VC82+OnsLKy9M+gvg@mail.gmail.com>
Subject: USB: workqueues stuck in 'D' state?
To: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: USB subsystem <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

So I'm not sure if this is new or not, but I *think* I would have
noticed it earlier.

On my Ampere Altra (128-core arm64 system), I started seeing 'top'
claiming a load average of roughly 2.3 even when idle, and it seems to
be all due to this:

  $ ps ax | grep ' [DR] '
    869 ?        D      0:00 [kworker/24:1+usb_hub_wq]
   1900 ?        D      0:00 [kworker/24:7+pm]

where sometimes there are multiple of those 'pm' workers.

Doing a sysrq-w, I get this:

  task:kworker/24:3    state:D stack:0     pid:1308  tgid:1308  ppid:2
     flags:0x00000008
  Workqueue: pm pm_runtime_work
  Call trace:
   __switch_to+0xf4/0x168 (T)
   __schedule+0x248/0x648
   schedule+0x3c/0xe0
   usleep_range_state+0x118/0x150
   xhci_hub_control+0xe80/0x1090
   rh_call_control+0x274/0x7a0
   usb_hcd_submit_urb+0x13c/0x3a0
   usb_submit_urb+0x1c8/0x600
   usb_start_wait_urb+0x7c/0x180
   usb_control_msg+0xcc/0x150
   usb_port_suspend+0x414/0x510
   usb_generic_driver_suspend+0x68/0x90
   usb_suspend_both+0x1c8/0x290
   usb_runtime_suspend+0x3c/0xb0
   __rpm_callback+0x50/0x1f0
   rpm_callback+0x70/0x88
   rpm_suspend+0xe8/0x5a8
   __pm_runtime_suspend+0x4c/0x130
   usb_runtime_idle+0x48/0x68
   rpm_idle+0xa4/0x358
   pm_runtime_work+0xb0/0xe0

  task:kworker/24:7    state:D stack:0     pid:1900  tgid:1900  ppid:2
     flags:0x00000208
  Workqueue: pm pm_runtime_work
  Call trace:
   __switch_to+0xf4/0x168 (T)
   __schedule+0x248/0x648
   schedule+0x3c/0xe0
   usleep_range_state+0x118/0x150
   xhci_hub_control+0xe80/0x1090
   rh_call_control+0x274/0x7a0
   usb_hcd_submit_urb+0x13c/0x3a0
   usb_submit_urb+0x1c8/0x600
   usb_start_wait_urb+0x7c/0x180
   usb_control_msg+0xcc/0x150
   usb_port_suspend+0x414/0x510
   usb_generic_driver_suspend+0x68/0x90
   usb_suspend_both+0x1c8/0x290
   usb_runtime_suspend+0x3c/0xb0
   __rpm_callback+0x50/0x1f0
   rpm_callback+0x70/0x88
   rpm_suspend+0xe8/0x5a8
   __pm_runtime_suspend+0x4c/0x130

so it seems to be all in that xhci_hub_control() path. I'm not seeing
anything that has changed in the xhci driver in this merge window, so
maybe this goes back further, and I just haven't noticed this odd load
average issue before.

The call trace for the usb_hub_wq seems a lot less stable, but I've
seen backtraces like

  task:kworker/24:1    state:D stack:0     pid:869   tgid:869   ppid:2
     flags:0x00000008
  Workqueue: usb_hub_wq hub_event
  Call trace:
   __switch_to+0xf4/0x168 (T)
   __schedule+0x248/0x648
   schedule+0x3c/0xe0
   schedule_preempt_disabled+0x2c/0x50
   __mutex_lock.constprop.0+0x478/0x968
   __mutex_lock_slowpath+0x1c/0x38
   mutex_lock+0x6c/0x88
   hub_event+0x144/0x4a0
   process_one_work+0x170/0x408
   worker_thread+0x2cc/0x400
   kthread+0xf4/0x108
   ret_from_fork+0x10/0x20

But also just

  Workqueue: usb_hub_wq hub_event
  Call trace:
   __switch_to+0xf4/0x168 (T)
   usb_control_msg+0xcc/0x150

or

  Workqueue: usb_hub_wq hub_event
  Call trace:
   __switch_to+0xf4/0x168 (T)
   __schedule+0x248/0x648
   schedule+0x3c/0xe0
   schedule_timeout+0x94/0x120
   msleep+0x30/0x50

so at a guess it's just some interaction with that 'pm' workqueue.

I did a reboot just to verify that yes, it happened again after a
fresh boot. So it is at least *somewhat* consistently repeatable,
although I wouldn't be surprised if it's some kind of timing-dependent
race condition that just happens to trigger on this machine.

I could try to see if it's so consistent that I could bisect it, but
before I start doing that, maybe just the backtraces makes somebody go
"Ahh, that smells like XYZ"..

Hmm?

             Linus

