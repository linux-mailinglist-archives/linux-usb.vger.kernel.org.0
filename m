Return-Path: <linux-usb+bounces-2687-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2437E55FE
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 13:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CE5DB20DD1
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 12:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0A617727;
	Wed,  8 Nov 2023 12:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndPbKnCz"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECBC14261
	for <linux-usb@vger.kernel.org>; Wed,  8 Nov 2023 12:14:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACEC01BCC
	for <linux-usb@vger.kernel.org>; Wed,  8 Nov 2023 04:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699445640; x=1730981640;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=Ryx3lgnpApCNTuYueZBXdiLCF+Sq7fF2L72rOslM2pU=;
  b=ndPbKnCzdFGrqDIlqPfOtplHiC6I+e8L3g5g+5KMS39ZRAxYtitb0ILZ
   Ynsn94822qR9XB7rdYZsTHxjkAJHbkttKsw+PgymH6mFgikllrvUSPXUP
   OyEWCm9NUQD9QyhUxToH9LupSShMAbB4kVKTiFY7aGzWuxiE432b7j6yE
   9lKyjEodzq8Tk/O0mopClQZfxgct5zYfBUUx0cCFpuBQgz7EVrYy7wD1F
   oi41M0VgWyVQqKVquo+QPH/1SUZ/JGyKFN4qWFo+F6yhmYMZj1uacGJ4u
   MlcbAWcz7PBJCQGbcurDJ4BgSS4tdiCeay3f2glyVgUh6LJKt6T1f9lqC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="475977277"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="475977277"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 04:14:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="763041591"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="763041591"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga002.jf.intel.com with ESMTP; 08 Nov 2023 04:13:58 -0800
Message-ID: <f9229409-b2a2-c0ce-9dfa-339c0cd49bdd@intel.com>
Date: Wed, 8 Nov 2023 14:15:11 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: USB 3.0 hub / controller is not working correctly - Error -28
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@intel.com>
To: Bastian Sulinski <bastiansulinski@googlemail.com>
Cc: linux-usb@vger.kernel.org
References: <CAEig5iAvL=OjPwmPuzJ6iqBYktzUW7j2TMn=ipYbTzHX8p5dnQ@mail.gmail.com>
 <1c9ca4e1-fbf3-c0ff-bd22-5a08097c18ee@intel.com>
In-Reply-To: <1c9ca4e1-fbf3-c0ff-bd22-5a08097c18ee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>
>> *Initial situation:*
>>
>> I have a freshly installed Linux Mint 21.2 system. Specifically, it's about
>> the two USB3.0 hubs, which are connected to the mainboard via an approx.
>> 1.5 meter 3.0 extension. The motherboard has two ports and a USB 3.0
>> controller. (Etron EJ168a)
>> One hub is "no-name" (passive), the other is an Icy Box IB-HUB 1701-C3
>> active.
>>
>> *Error Description:*
>>
>> Connected HID devices such as a mouse or keyboard (USB 2.0) are not
>> recognized.
>> Mass storage such as USB stick (USB2.0) as well as an external hard drive
>> (USB3.0) without any problems.
>>
>> Error in Dmesg
>>
>>
>> [ 1896.442107] usb 3-2.1: Not enough bandwidth for new device state.
>> [ 1896.442119] usb 3-2.1: can't set config #1, error -28
> 
> This Etron xHC controller claims there's not enough bandwidth available in
> this bandwidth domain to add more periodic usb endpoints (mice, keyboards etc).
> 

After digging a bit it seems that this Etron EJ168 xHCI controller has always had
issues with bandwidth calculation for Full/Low Speed devices behind external
high speed hubs.
This is something done internally in the xHC host hardware/firmware.
Not much driver can do about this.

Similar issues seen previously with this same host:

https://www.mail-archive.com/linux-usb@vger.kernel.org/msg44560.html

https://lore.kernel.org/all/20210422142133.GA245284@rowland.harvard.edu/T/

It's possible that the Windows driver has some workaround for this, but
Etron hasn't shared with me any info about this.

Thanks
Mathias



