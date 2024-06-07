Return-Path: <linux-usb+bounces-11020-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5226900525
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 15:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E48D31C21215
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 13:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E123194A60;
	Fri,  7 Jun 2024 13:36:16 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 98EA518629B
	for <linux-usb@vger.kernel.org>; Fri,  7 Jun 2024 13:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717767376; cv=none; b=nNGHW1iLhoF1AWkQ/xBcXfmxFwi3eWrgFXJAy0+UwpUhtAh2gWZxJgl6RkhyflFNRsb5Ep73swoou89FouWJpMHhIMo5dvRJYkXwATPKzaKsmVMGwffF2d7qvF42ryWTwLnpTtHtfC7xIeu67AUT0zZhHyTlNCduOsVG8b4LEPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717767376; c=relaxed/simple;
	bh=qEoPogBvmfVVC9OpBmEMEUY4zs0qEuJhne69sY4P69g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHJ/hwfMAXbe0fgGU1TTSw7cr4oCfoC/HI97RwdGhGmfCJDAKVWZV8GAtrB2ppa+2axGIRLrXOlpIBmituG+pi3A6REXv3hgG2GJqGJ/rJ+ziYgAbIYlCFEn+VLlRH1Lelnw+tfrne2QsyDnxATF66q06I1fuonZyetBK+kQlzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 47063 invoked by uid 1000); 7 Jun 2024 09:36:12 -0400
Date: Fri, 7 Jun 2024 09:36:12 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Zhangzhansheng <zhang.zhansheng@h3c.com>,
  Ladislav Michl <oss-lists@triops.cz>,
  "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
  Sneeker Yeh <sneeker.yeh@gmail.com>, Wangxiaoqing <wangxiaoqing@h3c.com>,
  Xinhaining <xinhaining@h3c.com>, Zhangchun <zhang.chunA@h3c.com>
Subject: Re: =?utf-8?B?44CQW0NvbnN1bHRpbmcgYWJvdXQ6?=
 =?utf-8?Q?_The_scsi_disk_driver_of_ub_and_storage_kernel_2=2E6=2E39_=5D?=
 =?utf-8?B?44CR?=
Message-ID: <4a66ab26-1995-4c6b-9a0e-ff1d612f8c25@rowland.harvard.edu>
References: <23cecbd846eb47099cf9e5bd986e434d@h3c.com>
 <41b21cbc-a5ff-334b-c269-d7dec248573e@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41b21cbc-a5ff-334b-c269-d7dec248573e@linux.intel.com>

On Fri, Jun 07, 2024 at 02:40:00PM +0300, Mathias Nyman wrote:
> Hi
> 
> On 7.6.2024 13.14, Zhangzhansheng wrote:
> > Mathias：
> > 
> > I am so sorry to trouble you again.
> > 
> > As you know, the kernel 2.6.39 has two scsi drivers including the ub and the mass storage, which those respectively located at directory drivers/block/ub.c and drivers/usb/storage.
> > 
> > The Ub and storage driver both can be used for USB storage driver of USB device, So I want to know which driver should be correctly used in kernel 2.6.39.
> 
> 2.6.39 is very old, 13 years now.
> Only recommendation I can give is to update the kernel.
> 
> > 
> > The question is as follow:
> > I recently use the kernel 2.6.39 scsi disk driver ub.c , encountered one deadlock issue. The root cause is that the tasklet function of ub_scsi_action(ub.c) on the CPU0
> > cutting off the CPU hardware interrupt for a long time which causing IPI interrupt sended by CPU1 without response. At the same time, the tasklet function of ub_scsi_action on CPU0 core
> > is attempting to obtain the lockA holded by the other thread task on CPU1 core which causing the lockA occurred deadlock.
> > 
> > If I replace the ub (drivers/block/ub.c ) with the mass storage (drivers/usb/storage) in kernel 2.6.39 , whether it will cause potential problem?
> 
> I'm not familiar with the Ub driver at all. Looks like it was removed in v3.7 kernel.
> It doesn't make much sense for anybody to look into it anymore.
> 
> Alan Stern would know about the mass storage driver

The best way to find out what will happen with the other driver is to 
try it and see.  Anything we can tell you would be only a guess.

However, as Mathias said, you really should not be using a 2.6 kernel.  
The current kernel version is 6.9, and you can imagine how much it has 
changed and improved in the meantime.

Alan Stern

