Return-Path: <linux-usb+bounces-21275-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 524D5A4C24D
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 14:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75ABB7A7097
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 13:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597E1211A05;
	Mon,  3 Mar 2025 13:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCwqJXM1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9A423F396
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 13:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741009583; cv=none; b=KoSOPUO/iKIzoWXN2FAnPSFvxNdky7XpYTE+GgKedg9ADVBSFZrrXAt46CffZ+Rpf7CwodFcLl3q48meZFuQe281yf4bPypKU9wweNj9oIWzt0JDUdPHfhxB1BBgVMg6Nt9f7plFkzaeJ6wlw3nOjZamkvlm5fV81esusCcfs/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741009583; c=relaxed/simple;
	bh=vVHMKmVTRVhnueo00FKILHKJrV1bPcIwumudocos4iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVB/mUD7owiPKKh1+cTvuvIZhC/NSsfK2A2/YD+Da0vSgsZ+fOpM1Sh0FcSKslIsoEfOpO6P13sA/Lnm8xNUAB2a/pYQT5V4UJ31Pba7pvWXSUVEG97yPf1//DnKvxslXpDrrRhDUOwPKsy/uZ9RPlgQfPR+fYbbDGAyt11SSF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kCwqJXM1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741009582; x=1772545582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vVHMKmVTRVhnueo00FKILHKJrV1bPcIwumudocos4iU=;
  b=kCwqJXM142MZbKhfuyQd0NaxkpwUBsAifjeqUywSvH81991K5KwgjXfM
   PcOO2kvOoL1SxMGpGlU/863seilWAFkftTnoRe1Ktr/Zp5BWw+7aW2hYp
   VuQ3b5/0dfNKCIe7ciAHSapLfp6jd1gZgRZvVoEllc20LdfWtmbFZM0Dr
   MILNZhV7vrOPzuKM7vZnnMPrmjqTTHrsItIbUaD9wXAGIwX0Fr5676oyR
   A30yRaRqExtWbAiG/uAPkuZ7oGLgNOZJ/YEermJcdwG0xYum6/VMMlu3X
   1ZXzQ1Fmhg6YghtK7S/7c3lozOOMErI5FyezgkrbOCBxAFGyzimG7eccc
   A==;
X-CSE-ConnectionGUID: nb6OqbrLSMuYcfIFc2vAXA==
X-CSE-MsgGUID: ql/Ovu26ROSIACmTtmtzyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52522387"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="52522387"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 05:46:20 -0800
X-CSE-ConnectionGUID: ik9MNXsOQFavT/Cpi2qMPw==
X-CSE-MsgGUID: LjvADXX0Rdmp5N/N3spUUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122139759"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 03 Mar 2025 05:46:19 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 643F2151; Mon, 03 Mar 2025 15:46:18 +0200 (EET)
Date: Mon, 3 Mar 2025 15:46:18 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kenneth Crudup <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
Message-ID: <20250303134618.GX3713119@black.fi.intel.com>
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
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250303132327.GW3713119@black.fi.intel.com>

On Mon, Mar 03, 2025 at 03:23:27PM +0200, Mika Westerberg wrote:
> Since if it is happening over suspend resume, I suggest we stick with that
> for repro because it involves simpler code paths.

Okay I'm now trying with following.

0. "Forget" all devices from boltctl to make sure PCIe is not involved.

1. Boot the system, nothing connected.
2. Plug in TBT 4 dock.
3. Plug in DP monitor through DP to Type-C adapter to the TBT 4 dock.
4. Verify that there is picture on that monitor.
5. Enter system suspend (s2idle):

  # rtcwake -s 30 -mmem

6. Once it wakes up verify that the monitor display a picture.
7. Repeat steps 5. and 6. several times.

I did serveral iterations (will do more) but I did not see any issues.

Can you try this one first, when you have time. If you see the issue, try
to take full dmesg.

---------------------------------------------------------------------

Then I tried another flow.

0. "Forget" all devices from boltctl to make sure PCIe is not involved.

1. Boot the system, nothing connected.
2. Plug in TBT 4 dock.
3. Plug in DP monitor through DP to Type-C adapter to the TBT 4 dock.
4. Verify that there is picture on that monitor.
5. Enter system suspend (s2idle):

  # rtcwake -s 30 -mmem

6. Once the system is suspended, unplug the monitor.
7. Once system resumes it should stay responsive.
8. Repeat steps 3. - 7. several times.

Here too, I don't see any issues. Please try this too if you have not been
able to reproduce with the first flow.

---------------------------------------------------------------------

Then yet another flow

0. "Forget" all devices from boltctl to make sure PCIe is not involved.

1. Boot the system, nothing connected.
2. Plug in TBT 4 dock.
3. Plug in DP monitor through DP to Type-C adapter to the TBT 4 dock.
4. Verify that there is picture on that monitor.
5. Enter system suspend (s2idle):

  # rtcwake -s 30 -mmem

6. Once the system is suspended, unplug the monitor.
7. Plug it back while the system is still suspended. You can use different
   Type-C port too.
8. Once system resumes the monitor should come up and show picture.
9. Repeat steps 5. - 8. several times.

I was not able to trigger any issues with this flow either but I'll
continue with them. Please try this one too if you don't manage to
reproduce the issue with the above two.

