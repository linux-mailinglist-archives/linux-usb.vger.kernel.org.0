Return-Path: <linux-usb+bounces-30494-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CE5C5819E
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 15:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E14433A899A
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 14:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC9E2C11CA;
	Thu, 13 Nov 2025 14:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="HztQvODp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD0B284689
	for <linux-usb@vger.kernel.org>; Thu, 13 Nov 2025 14:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763045447; cv=none; b=Yr5IwbAQQf9tbDh59D5dpL8v2g/zfIJ7vVVFjoO2FZVZZtO7unhG559DzEWDRXcFCU6gFk9+nY8SKkMKkZ6TJKGnwhDyoTqdN3wP6oE1wRrKdtyvtlKBOroapEjnbEFoABwfBXxuZvZodLNArFzSoQVCbQyV0wHWfmJ4AuR8ujM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763045447; c=relaxed/simple;
	bh=V3NRUkCwpyXAHKZhigjr+8gsAPXHs140yNAQg5Rd8BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYu9lY2JfRLl/V3VVO94MnpqOjXgWLZvyMMNpq3LDREyRahk6ETlU1IcwE67JeDxkKit7IpwL+0FlXcOiP8ml2msWdXTADUPB7gWQG9F1/mwX7u65wtD1GhuE+Pabs3pp5p6kFArD51qtgSmabadPzAgggT5U+SX/6YmqnBKsp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=HztQvODp; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ede4a30a84so5327331cf.1
        for <linux-usb@vger.kernel.org>; Thu, 13 Nov 2025 06:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1763045445; x=1763650245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ET0d96Jr74GPyOWniH5D9NAeGfbNYsnJ+p2BnWJ+Iz4=;
        b=HztQvODp/VXWNtXvR4iPJvBmULDFA35mrzuKpKOBrBl/UZBV2G/XgJfErZ2rFwOcj1
         oQa69/nCzDaVlEocv8lKOOUkX+AybjPM8w1Fl3fY6a3Cgjdc8Cf/MjgO81/YEV3rEhQ4
         aigUFOne7/KkUjcr980QKYNcLtAuk9pN3kcoTCtBRApwGuE6jF9X6QVlOOWEg/75831k
         rxDrCF6R/aeKTrw4svlcciICxa8yuAJ0uE83zOnzWWH/5kcjptVArDC4hM5tlk1wf91m
         YOCoDo7rroNRSnp6BZBaZA4xXnNhv2feGvj/OWb7oI/dI4gA4kMpmLkYG0dIqseXQ5hb
         F6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763045445; x=1763650245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ET0d96Jr74GPyOWniH5D9NAeGfbNYsnJ+p2BnWJ+Iz4=;
        b=DDaUYtUmwW4cRMS2PCRta0qC5qRIOdrgsxRmjjQMTYL9gDJIlBtszJWjnk4pBOmZPv
         AjolA1LQTxVINAdvtm/ZYiTiB5uj7XqPDGHRovzee++8c6OhoPC/JkP246unY+NKWB1y
         4e5JgiB2OC/ZRL/djSRul8MYdnM9+fq2jnS8u4YnS4Qh9rvXa/n3SY3UG/ZySNpaiaeG
         V62rypKETPR7mY0Bo9Ydcsf0tPUDQHs1ySkkCvLhFTLMowCKj4/0LAxPw4MfqomuX4vi
         mwHzhGvGe2AdeyNdHlvFZNNvjXDdTpOZbxOyWwCwUdEkPeLe92V+Nsv0tN/vFNMwTDk5
         Kqgg==
X-Forwarded-Encrypted: i=1; AJvYcCVy+R7/HFN+eNRor2ewe+p8w78ci3k7S6wkR7K8HTM/NbG0nseTQcNdhMNgP1tZtdgZhNORV1QABXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3lppPyDNOvv5XZlfIjkJV+srOAwcYqwwanQtm2wbG/0U3KFoz
	Ey6AzoM0Jl0c3DOwsUn6dHnAaRREjEsi2KdNEXZEsE3zFQTvKptvp07iTqDwj4zSaQ==
X-Gm-Gg: ASbGnctk4ksdeX3PJXYHUN28sdaUdN3Jh90lZMgIGvnVuaPYqID8zHowElqRlc6CZne
	xrWjV5fCr9RmKByZk9Ya0Z7vqkVriucNR6u1rVTy5xCyGf7Lteugq4t1FP5CVyVjO814B+sHPba
	J21yYY8HSV7itsq+B5n8cvD2DAOxV+a6mMfjY1NRcdjAcoRt6F0TuVY+pFnnEZTGE5FKXlqeeql
	mb6GDg54FE9JmeErqOEMhNJi5JOO60Lrh+mgeDusv1VPdHekF7HMcskFGe0s02dxKDtbPHoTmvz
	ptQi0J2G7E87c0fLgqWlhGqZDQmXmLzmPC2ws5tgUE4Gi0OS3gArCrVpywrpaUOyI0Y9loq4q/h
	n7Xm151hZ/QP8At2oWJkseXzdJHUmPuIK+rUYQBZWkzD4GO8Q4gQtzIH+OyxEoQzvFBqd11mhQC
	0TcpWfTXkyx+LQG8TurEjRSolDMhW/7B9ojngJn5BSweousMGebBwBmlHqHQk9XLH9pKLRftqJ9
	O2SdGou
X-Google-Smtp-Source: AGHT+IFrl7GvASaCXPeEF/Bz7u5HyCncPixtKgI1OSsTM6i3nwJfB1/d9QLc4rH6Y+Pb82nfD8qYZg==
X-Received: by 2002:a05:622a:252:b0:4ed:20bc:dc0b with SMTP id d75a77b69052e-4eddbd6ce7cmr91437691cf.35.1763045445025;
        Thu, 13 Nov 2025 06:50:45 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-29.harvard-secure.wrls.harvard.edu. [65.112.8.29])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ede86b3820sm13156341cf.4.2025.11.13.06.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 06:50:44 -0800 (PST)
Date: Thu, 13 Nov 2025 09:50:42 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Jie Deng <dengjie03@kylinos.cn>
Cc: gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
	sakari.ailus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: fix NULL dereference in usb_ifnum_to_if()
 during device removal
Message-ID: <0bec2aa5-cb3e-49c2-ab40-39a9ebceb2ad@rowland.harvard.edu>
References: <20251113114411.1410343-1-dengjie03@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113114411.1410343-1-dengjie03@kylinos.cn>

On Thu, Nov 13, 2025 at 07:44:11PM +0800, Jie Deng wrote:
> During USB device hot-unplug, in the time window between when
> usb_disconnect() calls usb_disable_device() to set
> dev->actconfig->interface[i] to NULL but before dev->actconfig
> is set to NULL.At this point, outside the kernel, usb_ifnum_to_if()
> is called through usb_set_interface(), and usb_ifnum_to_if() continues
> to access interface[i]->altsetting[i], triggering a null pointer.

> [ 9518.891254][ 1] [ T4650] Call trace:
> [ 9518.894817][ 1] [ T4650]  usb_ifnum_to_if+0x34/0x50
> [ 9518.899681][ 1] [ T4650]  usb_set_interface+0x108/0x3c8
> [ 9518.904898][ 1] [ T4650]  uvc_video_stop_streaming+0x3c/0x90 [uvcvideo]
> [ 9518.911500][ 1] [ T4650]  uvc_stop_streaming+0x24/0x90 [uvcvideo]
> [ 9518.917583][ 1] [ T4650]  __vb2_queue_cancel+0x44/0x458 [videobuf2_common]
> [ 9518.924444][ 1] [ T4650]  vb2_core_streamoff+0x20/0xb8 [videobuf2_common]
> [ 9518.931221][ 1] [ T4650]  vb2_streamoff+0x18/0x60 [videobuf2_v4l2]
> [ 9518.937390][ 1] [ T4650]  uvc_queue_streamoff+0x30/0x50 [uvcvideo]
> [ 9518.943557][ 1] [ T4650]  uvc_ioctl_streamoff+0x40/0x68 [uvcvideo]
> [ 9518.949724][ 1] [ T4650]  v4l_streamoff+0x20/0x28
> [ 9518.954415][ 1] [ T4650]  __video_do_ioctl+0x17c/0x3e0
> [ 9518.959540][ 1] [ T4650]  video_usercopy+0x1d8/0x558
> [ 9518.964490][ 1] [ T4650]  video_ioctl2+0x14/0x1c
> [ 9518.969094][ 1] [ T4650]  v4l2_ioctl+0x3c/0x58
> [ 9518.973526][ 1] [ T4650]  do_vfs_ioctl+0x374/0x7b0
> [ 9518.978304][ 1] [ T4650]  ksys_ioctl+0x78/0xa8
> [ 9518.982734][ 1] [ T4650]  sys_ioctl+0xc/0x18
> [ 9518.986991][ 1] [ T4650]  __sys_trace_return+0x0/0x4
> [ 9518.991943][ 1] [ T4650] Code: eb04005f 54000100 f9400040 91002042 (f9400003)
> [ 9518.999153][ 1] [ T4650] ---[ end trace f7c7d3236806d9a4 ]---

This looks like a bug in the uvc driver.  usb_disable_device() unbinds 
ther interface's driver before it sets dev->actconfig->interface[i] to 
NULL, and the uvc driver shouldn't call usb_set_interface() after it has 
been unbound.

> To resolve this issue, a null pointer check for config->interface[i]
> can be added in the usb_ifnum_to_if() function.

That won't fix the real bug.  You need to change the uvc driver.

Alan Stern

