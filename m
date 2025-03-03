Return-Path: <linux-usb+bounces-21259-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2527A4BCDC
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 11:49:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F0353AD43F
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 10:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5491F3D5D;
	Mon,  3 Mar 2025 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GfWkG6WQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8B6101C8
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 10:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740998783; cv=none; b=MfaF6+7zxsDQePDzQwQHucE+ayr/A5mLZM3Sjy8Eqem1QG9UZjL86yxYx/DPY78tJHbEJsVzcVcbINgqpCezb/d+PjNINBcJvCexzw+Kc1Af4g5roNEIVzcfOApneD+oe1t5s2QXXxjPdu0soj2r5SFXvAxzyXkw8F70z2TJ0lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740998783; c=relaxed/simple;
	bh=KrUNahOQ9kULv2NwhP6A2nZ2GjHDk7mrOjpvfGjO9/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q1lX1UVjftNmQ8n8A1d2JbmaaortY6NXDJ6cSzSfGNKOyDAraFGTLu7UUBIzLEGMtv7j2O0wBv3GMyOWBmcaGT6TPUFtAU/z2MUsPOSX0e8XZfTMRITJbbXRfRpqFRSQueZgaMTJwLdI7mjxGClkJJK35icj7drDF2FALkFwdzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GfWkG6WQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740998783; x=1772534783;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=KrUNahOQ9kULv2NwhP6A2nZ2GjHDk7mrOjpvfGjO9/A=;
  b=GfWkG6WQsNH4yfw2TezKYUH5UI7oAm9ONlLOTsdB1NNovhTbi9fzfg4+
   5jIV+JZBUmqyGwfx2OQ9xLeOzDF8BEv3E+DZvAC7gi6rHXyLlL6VUZksd
   66IyFDkio0KlzUEiwNouVvlcuKpBipjECZT5ZPU3mCIMYx67IWqXARuuH
   0ED/DQyjGBAzxdnKlI/UHhHo0GYFUNrVktZI0gow6qMPti1nwnlDqIYso
   +K7b4d31G/KUCV+JOL+KttEEBkOEJKWC9zywQQWD5f8/YIsfxAJ97S/8l
   SRICp1629mO8eriVbyRKdlCbj4s3KKOH4AT5Kn+632ExY55WwGgPfoRUX
   A==;
X-CSE-ConnectionGUID: VQtKOavPT+y4H7fBPDNvAg==
X-CSE-MsgGUID: Ggak8CDEQASlFzYxtN5HLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41895369"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41895369"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 02:46:22 -0800
X-CSE-ConnectionGUID: 0YFUxKhuQuqu56tKPKni7Q==
X-CSE-MsgGUID: sjb58AKsTh2T/AtXfgfrVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="122971837"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 03 Mar 2025 02:46:20 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 30E55125; Mon, 03 Mar 2025 12:46:18 +0200 (EET)
Date: Mon, 3 Mar 2025 12:46:18 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kenneth Crudup <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
Message-ID: <20250303104618.GP3713119@black.fi.intel.com>
References: <8e175721-806f-45d6-892a-bd3356af80c9@panix.com>
 <bd731ba2-5509-44e6-a419-814ef5329bbd@panix.com>
 <992dba2a-4919-4f76-ac48-986792d5843c@panix.com>
 <2b55ab09-8389-4916-8acc-abc73f234d21@panix.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b55ab09-8389-4916-8acc-abc73f234d21@panix.com>

Hi Kenneth,

Like discussed, let's deal one issue at the time.

It is really hard to debug anything if you keep changing the steps so
please let's keep these as separate issues:

1) Hang/crash during resume when dock + NVMe is disconnected before resume.
2) Monitor issue over DP tunnel.

For the first is this now solved if you revert
9d573d19547b3fae0c1d4e5fce52bdad3fda3664?

You can "isolate" this to PCIe side completely by doing the steps with the
commit but don't connect any monitors. Then you can do the steps (just
these , don't throw in any additional steps unless you think they are
needed but then mention them):

1. Boot the system up, nothing connected.
2. Connect TBT 4 dock to the host (no monitors)
3. Connect TBT 3 NVMe to the TBT 4 dock (no monitors)
4. Verify that the PCIe devices such as the NVMe are visible and working.
5. Suspend the system by closing the lid.
6. Unplug the device chain from the host.
7. Resume the system by opening the lid.

Expectation: System resumes just fine, PCIe devices are gone but system is
responsive.
Actual result: System does not resume and is not responsive.

If this gets solved by the revert then that's one issue nailed, good.

----------------------------------

For the second issue, I'm not sure I know the steps but since you mention
reverting d6d458d42e1e ("thunderbolt: Handle DisplayPort tunnel activation
asynchronously"), it should trigger pretty much any time you plug in
monitor so we can follow different and hopefully simpler steps:

1. Boot the system up, nothing connected.
2. Connect TBT 4 dock to the system.
3. Connect monitor to the TBT 4 dock.

Expectation: Monitor shows the screen properly.
Actual result: Blank screen.

For this issue please enable "thunderbolt.dyndbg=p+" in the kernel command
line so we can see in the dmesg what is going on. Once you reproduce (if
above steps then no need to mention, if different steps mention exactly the
simplest steps you do to reproduce) provide full dmesg of this run. I will
then take a look.

Thanks!

On Sun, Mar 02, 2025 at 08:30:55AM -0800, Kenneth Crudup wrote:
> 
> Forgot to add the dmesg.
> 
> -K
> 
> On 3/2/25 08:26, Kenneth Crudup wrote:
> > 
> > FWIW, seeing a Metric F'ton (13171) of these after testing a hibernate
> > cycle- I guess now that my resumes are completing these are occurring
> > now:
> > 
> > thunderbolt 0000:00:0d.3: hotplug event from non existent switch 1:d
> > (unplug: 0)
> > 
> > This is one of my onboard ports (presumably the right one I use all the
> > time at home):
> > 
> > ----
> > 0000:00:0d.3 USB controller [0c03]: Intel Corporation Alder Lake-P
> > Thunderbolt 4 NHI #1 [8086:466d] (rev 02) (prog-if 40 [USB4 Host
> > Interface])
> >          Subsystem: Dell Device [1028:0af3]
> >          Flags: bus master, fast devsel, latency 0, IRQ 16, IOMMU group 8
> >          Memory at 6040200000 (64-bit, non-prefetchable) [size=256K]
> >          Memory at 60402e3000 (64-bit, non-prefetchable) [size=4K]
> >          Capabilities: [80] Power Management version 3
> >          Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
> >          Capabilities: [a0] MSI-X: Enable+ Count=16 Masked-
> >          Kernel driver in use: thunderbolt
> > ----
> > 
> > -K
> > 
> 
> -- 
> Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange County
> CA



