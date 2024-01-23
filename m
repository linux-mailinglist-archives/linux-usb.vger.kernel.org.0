Return-Path: <linux-usb+bounces-5406-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B168391B6
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 15:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F6FF1F269F3
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 14:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50042524A4;
	Tue, 23 Jan 2024 14:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cd1m0/OI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D51C5FDCB
	for <linux-usb@vger.kernel.org>; Tue, 23 Jan 2024 14:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706021288; cv=none; b=s19ZIKk9OTopbQQo/gX4utuFJJQSt/ztspco/83Jdy8p9GoHwD0GIBMI/JS5YT9TT59ZAxuVbJN2Fb3YvdJe1xmvWy0v7JS3NWw6cBxnHx7xW/gibufDMJEwSPlE5RNHdusJoFfLReHiuvHz+rIsdxgA0OpJZ264JknqrBLLEck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706021288; c=relaxed/simple;
	bh=5ENsX5rOe0IQTMW8kur8zXvQjDcYgxAwto8GWNiSXmU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=UzIYLReu+qPLjJBGTnPFz0+ronbUPbd8W5PJ6m/n01qROtorxRKvPh2FzjW+xkNxwTbL1ireBbIUjeUMc7nE93h/8dQ6XNIbhPotHTzwOYrBB32jNOaxoLEBNxLVzxFak6pHOVNm1NtBIdU+fC6XWANTrw1oTZnlgTYEOoMs6cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cd1m0/OI; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706021285; x=1737557285;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=5ENsX5rOe0IQTMW8kur8zXvQjDcYgxAwto8GWNiSXmU=;
  b=Cd1m0/OIaiG3ayFcj+4orWpltaywQex4MiLo3m7SeUeKfp3d4KbXea6R
   Z40BhQ4UJJZTYrceU9GRRIr7diR1uqDwJ93Zh+1sRHacHGg2dDlvVdN5R
   bLALqmwI9IhiOQcb4jGmjaGduGR3IfKtL6DMqIbAln3jGeqjr9NJgron/
   vPE6MqGdsQ1mvlWTMrOlu89dMe0WL/ZA2TTkB5MdCrj1YqYsHB231DwtF
   DP4T2eAS/6bPzGAzbOloOn80jYyk4XhAfnoMKPmESa5avmiEZP7IIbeI2
   Hbm+syBm4VS8tDboHkTfGavNlBf7L/BHwpGeQ+3YJSFCySncdib7GD1PV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="465811046"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="465811046"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 06:48:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="905260617"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="905260617"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jan 2024 06:48:03 -0800
Message-ID: <57883406-83f3-9956-16c3-2954ab3744ca@linux.intel.com>
Date: Tue, 23 Jan 2024 16:49:35 +0200
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
 <9e8bebd2-e51a-cd24-3522-a781bb0b237e@linux.intel.com>
 <e7fddc9147af4adc84f76c07b559ed77@h3c.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW0NvbnN1bHRpbmcgYWJvdXQ6IHhIQ0kgaG9zdCBk?=
 =?UTF-8?Q?ies_on_device_unplug=5d?=
In-Reply-To: <e7fddc9147af4adc84f76c07b559ed77@h3c.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22.1.2024 6.03, Zhangzhansheng wrote:
> Mathias：
> 
> Sorry for the late reply.
> 
> Specific kernel log information as showed in the email attachment.
> 
>> Also details about xHCI host vendor, kernel version, and lsusb -t output would help.
> 
> xHCI host vendor is Renesas UDP720201, kernel version is linux4.4.65. I am so sorry to say that lsusb kernel command is currently not supported.
> 
> Vendor and linux version message is as follow:
> 

4.4 kernel is now 8 years old (Jan 2016). There are a lot of changes since then,
including some Renesas host vendor specific quirks.
  
Logs show transaction errors on endpoint 0, probably while reading descriptors
during enumeration.

I'd recommend trying with a more recent kernel such as 6.7,
If that also fails the we can take a closer look at it.

If 6.7 works but you need to run a 4.4 kernel for some reason, then I'd
suggest bisecting the kernel until the right fix is found, and backport it.

lsusb is a part of usbutils. Source: https://github.com/gregkh/usbutils
But most distributions have a ready package named usbutils.

Thanks
Mathias


