Return-Path: <linux-usb+bounces-21274-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECBDA4C1D3
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 14:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F5B11729A0
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 13:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BDE721147F;
	Mon,  3 Mar 2025 13:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwVLyIif"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7B21F1931
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 13:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741008211; cv=none; b=cHgt1UJ7t1I948beKesnqlkznK7twefpEoKwcswvIJMx+U71Tl8P8JHRvxgTF+B7J9tR0AbXORPggVz79/hmIa+dwDLwvsH5oZmsOApjDLBV9rHXISFuJAYv4qtRW2ofFI/IVUG51baASI3QHtqVEPuIQ5cQiJ9h09jeZ7fEkIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741008211; c=relaxed/simple;
	bh=auNF7EFnbykTt1m4cnyjl8eRrskwRSBKpgdyIggEcvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYBzFKWCeT64MFoMmOTpJKMh6wgEYYlNnNKW6zMouWVAxR0Nq3likZ7Om8heJ234bZbx91q/kIbSft2EEoc101Ff10/ERMgMjFBJxlY+FXfRqEN5qqtYuIRdL+Nl4VHe7M/+OzS3IEhhGLLFcm8wwVMQutMfVLnKAij3FR0Au10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hwVLyIif; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741008210; x=1772544210;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=auNF7EFnbykTt1m4cnyjl8eRrskwRSBKpgdyIggEcvM=;
  b=hwVLyIif0V0QOVGX146cnBZAzwmpitgHq9gCj1Ja9DnJF7lldwm30XlK
   HmVaO1PnqDnKiFSRPLRzDURlgrAXJB8+EOObCmdyiHrcI2GoZb0iP8nOL
   cZisybHfzzBIJjnGHYXrvVPaBLCU4eiLPeYqhdzpJrc0n6A96T+AgEKpJ
   Yg+EhkazqILAjmun3XmacUtBGawab8cTG7KEQj6s/i+mps5ACFLP0/WHA
   pdEFv8JRN4LO95mtP/ZTGPVYhc3mQcEkGdckJ15Nih52iFaGujnvea/Ch
   LzzMEeFf6BgPtfqAsLeR7OG3yL8U3uQCcEhy82f6WLd2dp337IlHGN3Dt
   w==;
X-CSE-ConnectionGUID: JRpBrgkeQI27GouSgSIs+g==
X-CSE-MsgGUID: 282WQZkvQeWD4SwC+8ix/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="59430277"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="59430277"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 05:23:29 -0800
X-CSE-ConnectionGUID: 0RPX1PPCRoeZlVw+eVxHmQ==
X-CSE-MsgGUID: 0J2fwQ9nSxmphMZXognOsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="117996557"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 03 Mar 2025 05:23:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 7BF63125; Mon, 03 Mar 2025 15:23:27 +0200 (EET)
Date: Mon, 3 Mar 2025 15:23:27 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kenneth Crudup <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
Message-ID: <20250303132327.GW3713119@black.fi.intel.com>
References: <992dba2a-4919-4f76-ac48-986792d5843c@panix.com>
 <2b55ab09-8389-4916-8acc-abc73f234d21@panix.com>
 <20250303104618.GP3713119@black.fi.intel.com>
 <f31309e4-6ce5-48cf-910e-cd74f818aac8@panix.com>
 <20250303112149.GS3713119@black.fi.intel.com>
 <d56fcd99-433e-4670-8388-7035812a78d9@panix.com>
 <20250303115329.GT3713119@black.fi.intel.com>
 <68cec31a-0132-43bd-8a61-29e0ac23b326@panix.com>
 <20250303131359.GV3713119@black.fi.intel.com>
 <744090aa-074e-443f-8a94-567dadff4c7d@panix.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <744090aa-074e-443f-8a94-567dadff4c7d@panix.com>

On Mon, Mar 03, 2025 at 05:19:27AM -0800, Kenneth Crudup wrote:
> 
> >> Oh and the failure mode for d6d458d4 is ALWAYS this, and always(?) from
> line
> >> 436/7 of ".../drivers/thunderbolt/path.c", a call to tb_port_write():
> 
> I was looking thru the pstore dumps; it may not ALWAYS be line 436, but it
> is always in "tb_port_write()".
> 
> On 3/3/25 05:13, Mika Westerberg wrote:
> 
> > That's also weird because we don't do anything for DP tunnels on resume so
> > what this code is doing is to clean up for the tunnels left by the boot
> > kernel (since this is hibernate).
> 
> OK, but for completeness' sake the crash happens on a suspend resume as well
> (and the same failure mode as a resume hibernate).

On suspend/resume we don't do anything for the DP tunnels, not even clean
up anything as compared to hibernate so it's double weird that at that
point d6d458d4 affects it in any way.

Since if it is happening over suspend resume, I suggest we stick with that
for repro because it involves simpler code paths.

