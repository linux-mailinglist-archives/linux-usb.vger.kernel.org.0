Return-Path: <linux-usb+bounces-21276-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E63A4C274
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 14:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A7361893E07
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 13:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5AC5212B17;
	Mon,  3 Mar 2025 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="Yl0usdpG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F9E21171F
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741010007; cv=none; b=ZbDhzMz7BR4U/eLhS1vzsWPFgH2mve5QRUGLooU0qiONZjHqSO97O2FeL7yj/22DvxA9DrRla/xPzf9tA6Z2f8H+xczyfxsMBX1GTfe5vduf2dua1/QNz+yJAA+cIb5P0a+MbVrJ1uE0Z2GPrY8JXELNhKXfoeMApm0yldLELbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741010007; c=relaxed/simple;
	bh=Tc+zpSsoRXBJzVgoLOvt1aHL9METIYrxZiOAUyDkbmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PVYB8ItxNty5pEIAg7UNeYdYTIyCnP1OfHM7Dr5zkJQ9TFO1zkys2JVR4tyh0aV4555m9Y30+fjKdjhs+xMolPE2JlnB7G8y+kCTU1WDUHR6Te4q116wTblIvnVcQp0sXONJwQVljfOlhlygovOtSc/fNJWLoyGwcmqZOPnc/WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=Yl0usdpG; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [192.168.126.189] (ip72-219-82-239.oc.oc.cox.net [72.219.82.239])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4Z60db47gtz13gb;
	Mon,  3 Mar 2025 08:53:23 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1741010003; bh=Tc+zpSsoRXBJzVgoLOvt1aHL9METIYrxZiOAUyDkbmQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Yl0usdpGBBDyo+qhVVnPpOFOiZd7dYCMHUy5OoQknoDfuatusLS7q+WuT15j/Hv2/
	 h+t97TnvJmmKAikwFa5iupA+UKFf9pZgfgsVrvY+M3++kWCA6WKAOj1a4OYELC71XF
	 S8jowbljBIOKyOb9ooG8ciZmVk+E1IYfu5YrQPTg=
Message-ID: <24ef839c-8fa5-4a19-b9c6-0a267aab84f5@panix.com>
Date: Mon, 3 Mar 2025 05:53:22 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Me <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
References: <2b55ab09-8389-4916-8acc-abc73f234d21@panix.com>
 <20250303104618.GP3713119@black.fi.intel.com>
 <f31309e4-6ce5-48cf-910e-cd74f818aac8@panix.com>
 <20250303112149.GS3713119@black.fi.intel.com>
 <d56fcd99-433e-4670-8388-7035812a78d9@panix.com>
 <20250303115329.GT3713119@black.fi.intel.com>
 <68cec31a-0132-43bd-8a61-29e0ac23b326@panix.com>
 <20250303131359.GV3713119@black.fi.intel.com>
 <744090aa-074e-443f-8a94-567dadff4c7d@panix.com>
 <20250303132327.GW3713119@black.fi.intel.com>
 <20250303134618.GX3713119@black.fi.intel.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <20250303134618.GX3713119@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


No failures for you at all? OK. It'll take me a couple of days to do all 
the steps, but I'll get on it and get back to you.

 > "Forget" all devices from boltctl to make sure PCIe is not involved.

What's this do? And my system recognizes all new TB devices 
automatically (no manual intervention required).

----
$ boltctl

<snip>

  ● Belkin Thunderbolt 3 Dock Core
    ├─ type:          peripheral
    ├─ name:          Thunderbolt 3 Dock Core
    ├─ vendor:        Belkin
    ├─ uuid:          c2010000-0072-7c1e-8310-72c784524a06
    ├─ generation:    Thunderbolt 3
    ├─ status:        authorized
    │  ├─ domain:     60838780-4021-ceb2-ffff-ffffffffffff
    │  ├─ rx speed:   40 Gb/s = 2 lanes * 20 Gb/s
    │  ├─ tx speed:   40 Gb/s = 2 lanes * 20 Gb/s
    │  └─ authflags:  none
    ├─ authorized:    Mon 03 Mar 2025 11:59:48 AM UTC
    ├─ connected:     Mon 03 Mar 2025 11:59:48 AM UTC
    └─ stored:        Sat 29 Jun 2024 11:03:09 PM UTC
       ├─ policy:     iommu
       └─ key:        no
---

On 3/3/25 05:46, Mika Westerberg wrote:
> On Mon, Mar 03, 2025 at 03:23:27PM +0200, Mika Westerberg wrote:
>> Since if it is happening over suspend resume, I suggest we stick with that
>> for repro because it involves simpler code paths.

-Kenny

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


