Return-Path: <linux-usb+bounces-15978-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E168998566
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2024 13:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09BE528253F
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2024 11:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14FA61C3310;
	Thu, 10 Oct 2024 11:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9weEEAx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004A41BE245
	for <linux-usb@vger.kernel.org>; Thu, 10 Oct 2024 11:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728561543; cv=none; b=mso1tedt4UsYpo9w6x4l1On652O3nRd35wUWtwe80+2LYJZDV9gOf8FINAqPaX971F8BKltxymBn51iAsOJ3SMBjbfRx/rwM3fquChwuU9N8MIMOLFk6iKTmmT3Yn2+/T7l7lEbZFk0DK6d7hnc99lRuQp4qVMIT/dzfo90/L0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728561543; c=relaxed/simple;
	bh=ViFJuGullRXnJd99xvAwH21cg4kp+y222TYPWpK4HeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IEVtq9f9u/GwoEpFQ1WHueOobfy7cQRI9xDhxRpFZ3c4IvIsN5sKimoXcXSJDxOMpjOfgu3er2FlXC8UcxkQvziw9XAbUWfl8DMGDLrI0KCyOQOWItt1A39SkSKA7veKrVLslm6uReIg4Q85aTIl/fVJHRpQN7EDNLWViQ1OHoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B9weEEAx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728561541; x=1760097541;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ViFJuGullRXnJd99xvAwH21cg4kp+y222TYPWpK4HeQ=;
  b=B9weEEAxQXlpEaZRRXHNtEvMQitXYABzf0eXhEYuneRBHf20YAnpgD+w
   6cVHKSJtu2WYpBo7satvSK0oUmE/M5hki/zj86Ag9PjRoYPfKu2CBJy3R
   RpCkMMt6At0ZaXPwUjTf00/sASljed/s7JXQClqtAIXMNrbUgI8FelQp8
   POhxhEUEiHhVQBC1AMeURUSoWhjr0DKIrHSqD7md0Nr4zqLL2HH75aNzB
   CsXI7O47a9SuAM3FMzXLBLL6lvDAtwED9kV8tMYri6nRqDYjFrNJArrhK
   eLROI0w2+7IaR6nNR2T44HpjsnslF7etg8TuQ57YxkN1FkiJmXECUvG3q
   g==;
X-CSE-ConnectionGUID: iFOUA1/aT8KRTsRyNyPuzg==
X-CSE-MsgGUID: XouyK66NSrmPEqnhqa3+Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="45428377"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="45428377"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 04:59:00 -0700
X-CSE-ConnectionGUID: vvGr67LuTy2mWozDpijmhw==
X-CSE-MsgGUID: Jm33z81TREO/fnxMndlnzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="76479003"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa009.jf.intel.com with ESMTP; 10 Oct 2024 04:58:57 -0700
Message-ID: <dc9bcfa6-885f-4ae2-a6be-832a985bc80e@linux.intel.com>
Date: Thu, 10 Oct 2024 15:01:07 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
To: Mario Limonciello <mario.limonciello@amd.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "<Harry Wentland" <harry.wentland@amd.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 Raju.Rangoju@amd.com, Sanath.S@amd.com, Greg KH <gregkh@linuxfoundation.org>
References: <cf45e722-144f-4d06-8dd9-2f7f54283fbc@amd.com>
 <20241003054704.GM275077@black.fi.intel.com>
 <01bf9a3a-6277-4b57-83ed-82c4bfb62dd2@amd.com>
 <20241003132726.GN275077@black.fi.intel.com>
 <797f52fa-ab9d-45c5-828b-9dcaf75fcc83@amd.com>
 <20241003134743.GO275077@black.fi.intel.com>
 <cee28cb3-a157-4d26-a68a-7b5a99161d1a@linux.intel.com>
 <c5209c31-9263-4fe7-b387-319bbaac866d@amd.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <c5209c31-9263-4fe7-b387-319bbaac866d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10.10.2024 5.23, Mario Limonciello wrote:
> On 10/9/2024 16:52, Mathias Nyman wrote:
>> On 3.10.2024 16.47, Mika Westerberg wrote:
>>> On Thu, Oct 03, 2024 at 08:42:21AM -0500, Mario Limonciello wrote:
>>>> On 10/3/2024 08:27, Mika Westerberg wrote:
>>>>> On Thu, Oct 03, 2024 at 08:10:11AM -0500, Mario Limonciello wrote:
>>>>>> On 10/3/2024 00:47, Mika Westerberg wrote:
>>>>>>> Hi Harry,
>>>>>>>
>>>>>>> On Wed, Oct 02, 2024 at 01:42:29PM -0400, Harry Wentland wrote:
>>>>>>>> I was checking out the 6.12 rc1 (through drm-next) kernel and found
>>>>>>>> my system hung at boot. No meaningful message showed on the kernel
>>>>>>>> boot screen.
>>>>>>>>
>>>>>>>> A bisect revealed the culprit to be
>>>>>>>>
>>>>>>>> commit f1bfb4a6fed64de1771b43a76631942279851744 (HEAD)
>>>>>>>> Author: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>>>>>> Date:   Fri Aug 30 18:26:29 2024 +0300
>>>>>>>>
>>>>>>>>        usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface
>>>>>>>>
>>>>>>>> A revert of this single patch "fixes" the issue and I can boot again.
>>>>>>>> The system in question is a Thinkpad T14 with a Ryzen 7 PRO 6850U CPU.
>>>>>>>> It's running Arch Linux but I doubt that's of consequence.
>>>>>>>>
>>>>>>>> lspci output:
>>>>>>>>        https://gist.github.com/ hwentland/59aef63d9b742b7b64d2604aae9792e0
>>>>>>>> acpidump:
>>>>>>>>        https://gist.github.com/ hwentland/4824afc8d712c3d600be5c291f7f1089
>>>>>>>>
>>>>>>>> Mario suggested I try modprobe.blacklist=xhci-hcd but that did nothing.
>>>>>>>> Another suggestion to do usbcore.nousb lets me boot to the desktop
>>>>>>>> on a kernel with the faulty patch, without USB functionality, obviously.
>>>>>>>>
>>>>>>>> I'd be happy to try any patches, provide more data, or run experiments.
>>>>>>>
>>>>>>> Do you boot with any device connected?
>>>>>>>> Second thing that I noticed, though I'm not familiar with AMD hardware,
>>>>>>> but from your lspci dump, I do not see the PCIe ports that are being
>>>>>>> used to tunnel PCIe. Does this system have PCIe tunneling disabled
>>>>>>> somehow?
>>>>>>
>>>>>> On some OEM systems it's possible to lock down from BIOS to turn off PCIe
>>>>>> tunneling, and I agree that looks like the most common cause.
>>>>>>
>>>>>> This is what you would see on a system that has tunnels (I checked on my
>>>>>> side w/ Z series laptop w/ Rembrandt and a dock connected):
>>>>>>
>>>>>>              +-03.0
>>>>>>              +-03.1-[03-32]--
>>>>>>              +-04.0
>>>>>>              +-04.1-[33-62]----00.0-[34-62]--+-02.0-[35]----00.0
>>>>>>              |                               \-04.0-[36-62]--
>>>>>>
>>>>>> 00:03.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
>>>>>> 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
>>>>>> 00:03.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h
>>>>>> USB4/Thunderbolt PCIe tunnel [1022:14cd]
>>>>>> 00:04.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
>>>>>> 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
>>>>>> 00:04.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h
>>>>>> USB4/Thunderbolt PCIe tunnel [1022:14cd]
>>>>>
>>>>> Okay this is more like what I expected, although probably not the
>>>>> reason here.
>>>>>
>>>>> Are you able to replicate the issue if you disable PCIe tunneling from
>>>>> the BIOS on your reference system? (Probably not but just in case).
>>>>
>>>> I checked on the Lenovo Z13 laptop I have and turned off "USB port" in BIOS
>>>> setup and this caused the endpoints 3.1 and 4.1 I listed above to disappear
>>>> but the system still boots up just fine for me on 6.12-rc1.
>>>
>>> Okay thanks for checking!
>>>
>>>>>>> You don't see anything on the console? It's all blank or it just hangs
>>>>>>> after some messages?
>>>>>>
>>>>>> I guess it is getting stuck on fwnode_find_reference() because it never
>>>>>> finds the given node?
>>>>>
>>>>> Looking at the code, I don't see where it could get stuck. If for some
>>>>> reason there is no such reference (there is based on the ACPI dump) then
>>>>> it should not affect the boot. It only matters when power management is
>>>>> involved.
>>>>
>>>> Nothing jumps out to me either.  Maybe this is a situation that Harry can
>>>> sprinkle a bunch of printk's all over usb_acpi_add_usb4_devlink() to
>>>> enlighten what's going on (assuming the console output is "working" when
>>>> this happened).
>>>
>>> There are couple of places there that may cause it to crash, I think.
>>
>> Its possible we end up trying to create a device link during usb3 device
>> "consumer" enumeration before the "supplier" NHI device is properly bound to a driver.
>>
>> This is something driver-api/device_link.rst states can cause issues.
>>
>> This could happen if xhci isn't capable of detecting tunneled devices,
>> but ACPI tables contain all info needed to assume device might be tunneled.
>> i.e. udev->tunnel_mode == USB_LINK_UNKNOWN.
>>
>> Harry, could you test if the code below helps?
>>
>> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
>> index 21585ed89ef8..94c335a7b933 100644
>> --- a/drivers/usb/core/usb-acpi.c
>> +++ b/drivers/usb/core/usb-acpi.c
>> @@ -173,6 +173,13 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>>          if (IS_ERR(nhi_fwnode))
>>                  return 0;
>>
>> +       if (!nhi_fwnode->dev || !device_is_bound(nhi_fwnode->dev)) {
>> +               dev_info(&port_dev->dev, "%s not tunneled as it probed before USB4 Host Interface\n",
> 
> I'm aware this message is mostly to prove whether this is the actual issue but I do want to say if this patch indeed helps Harry's problem and you keep a message in what goes upstream I don't think this is accurate for all cases.
> 
> If you have a Pre-OS CM, it might build tunnels and those could be active until the USB4 CM loads and resets them (by the default behavior).
> 
> So I think a more accurate message would just be "%s probed before USB4 host interface".

Makes sense, I'll tune the message in the final patch if this works

Thanks
Mathias


