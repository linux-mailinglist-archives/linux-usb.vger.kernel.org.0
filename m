Return-Path: <linux-usb+bounces-4781-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D0482528C
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jan 2024 12:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77DB01C22C38
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jan 2024 11:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06E728DAF;
	Fri,  5 Jan 2024 11:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9B6EG6j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBD028E2D
	for <linux-usb@vger.kernel.org>; Fri,  5 Jan 2024 11:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704452741; x=1735988741;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=H+Tm899jxG3yqdbw2YW4uY4YFsQC5++AhTk5IsH7aAQ=;
  b=f9B6EG6j4/GoWcmQPaLG7jpqUEztTQ8Cv0LxrKGaiho8pzgESCwdvfrN
   ZaV64JC2ANsnNx+DGmpqVRKJdiwQo+g9VZ+WU62bbIHwjJpZPRt1X7Kbb
   h+0eN7T0nehgAiQiCSbRSw8WSnnQOiWp1DdROCv1JOWnKQKiWwwEOHiVr
   d8JGNIWOQ3qfpgtAkrqC4vOe7zBz5MeFL77RjiIfwq2RSWcH0oYqfH+Cq
   5zkup+go55MW1m//FSsX7M6Fs5/TFCzEKByf8tJWpOvbA2Vd4+8tTTkqp
   dgVD4tr/K/HiJHdlnlFVPpkql+1jEyv5twScIlIdhLgvE0KjMP0DAihKQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="16104110"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="16104110"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 03:05:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="1112069171"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="1112069171"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga005.fm.intel.com with ESMTP; 05 Jan 2024 03:05:37 -0800
Message-ID: <9e8bebd2-e51a-cd24-3522-a781bb0b237e@linux.intel.com>
Date: Fri, 5 Jan 2024 13:07:05 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Zhangzhansheng <zhang.zhansheng@h3c.com>,
 Ladislav Michl <oss-lists@triops.cz>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Sneeker Yeh <sneeker.yeh@gmail.com>, Wangxiaoqing <wangxiaoqing@h3c.com>,
 Xinhaining <xinhaining@h3c.com>
References: <7b049561ce33406ab9b5d0cee7fbd497@h3c.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [Consulting about: xHCI host dies on device unplug]
In-Reply-To: <7b049561ce33406ab9b5d0cee7fbd497@h3c.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5.1.2024 3.44, Zhangzhansheng wrote:
> Ladislav Michl/Mathias Nyman:
> 
> I am so sorry to trouble you.
> 
> Recenttly, I have encountered one problem which is similar to the site :https://lore.kernel.org/linux-usb/Y6L6R0J1AUan63TN@lenoch/#t described.
> 
> The problem is :
> 
> I unplug one usb3.0 u disk(Manufacturer: aigo, Product: U330), which causing usb3.0 host controller halted,then  all the usb devices connected to the usb3.0 host controller disconnected. However this problem occurred in a lower percentage.
> 
> The kernel log of my problem is as follow:
> [17746.149774] 2:usb 2-1: device descriptor read/8, error -110
> [17746.250191] 2:usb 2-1: reset SuperSpeed USB device number 17 using xhci_hcd
> [17746.263159] 2:usb 2-1: device descriptor read/8, error -71
> [17746.363202] 2:xhci_hcd 0000:02:00.0: Cannot set link state.
> [17746.363238] 2:usb usb2-port1: cannot disable (err = -32)
> [17746.718537] 0:usb 2-1: reset SuperSpeed USB device number 17 using xhci_hcd
> [17751.730166] 0:usb 2-1: device descriptor read/8, error -110
> [17751.831200] 0:usb 2-1: reset SuperSpeed USB device number 17 using xhci_hcd
> [17761.849191] 2:xhci_hcd 0000:02:00.0: xHCI host not responding to stop endpoint command.
> [17761.849221] 2:xhci_hcd 0000:02:00.0: Assuming host is dying, halting host.
> [17761.850354] 2:xhci_hcd 0000:02:00.0: HC died; cleaning up
> [17761.850394] 2:usb 2-1: device descriptor read/8, error -110
> [17761.951297] 0:usb usb1-port1: couldn't allocate usb_device
> [17761.951327] 0:usb 1-4: USB disconnect, device number 2
> [17761.951722] 0:usb 2-1: USB disconnect, device number 17
> 
> 
> So, could you tell me what is the ultimate solution of you raising on the site "https://lore.kernel.org/linux-usb/Y6L6R0J1AUan63TN@lenoch/#t".

This looks a bit different. In the case behind the link the host controller automatically
turned off immediately after the last usb device was disconnected.
Any command the driver issued ti the host after that would time out.

In your case it looks like there are other connected usb devices to this host (1-4).
driver is also trying to re-enumerate usb 2-1 but failing, as disconnect isn't completely
visible to driver. I assume 2-1 Is this the disconnected device?

full dmesg of issue with usb core and xhci dynamic debug could help:

mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control

Also details about xHCI host vendor, kernel version, and lsusb -t output would help.

Could you also get rid of that legal footer in your mail. I don't want to
worry about any possible legal issues for just responding to this.

Thanks
Mathias

