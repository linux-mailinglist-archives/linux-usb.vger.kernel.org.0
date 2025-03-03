Return-Path: <linux-usb+bounces-21267-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4247FA4BF9B
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 12:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA3713B54AE
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 11:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E330120C03C;
	Mon,  3 Mar 2025 11:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvKCE5sg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EE61FFC5C
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 11:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741002814; cv=none; b=eID52GA8jNs0a1RxfIlk08PwKHE5zBdUPH++gxijy6uyYysLfcZSdAre12iHU75Z1yrWXedGsbVU5ANGItq7ESJbT9R6KBx51B1TbrxKjsyhcw5vd3EoSS4U55wNVrQUKme/Sls9XztkVaLzfXjNB6X28UzJ0a+xjYQxbYnvjl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741002814; c=relaxed/simple;
	bh=vFqhYG2Lk1NNRr8AwrPvU2dgXJ6U60zn4d5IXMZ64wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ttoxei+YAqYpvU0SAdL24AV8EmhzWVYQVZ5AtKUcDVLc8E75iB3ERyiCC1fT0P/ULmcEmXtScVb14Eq2E0GcaVPEnhR407zehcye0Dksdo5A2c3xtRhUgs0hhARRLAMHx30PsQonuCULVPUgfp/yp2ESEj9KxCW4PXMX/tZsw0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvKCE5sg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741002813; x=1772538813;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vFqhYG2Lk1NNRr8AwrPvU2dgXJ6U60zn4d5IXMZ64wQ=;
  b=mvKCE5sgFjCWcG1Z0o7dxE1nx0ew6LixloIjLLDGnAzIASwgOzQmwUhV
   Tg2I6IvaexIgWlGgZbbmi7y49xIaCnwachy5r9sryLg1DQy4ojPCvdXff
   c9jUUrWB/yGEsXXy8Aozs011B2JEKOS7u6eHQMY0kgogvODDgvKzF5uuh
   Cc4seJpPfgDQ8/DHa2R+KJX8WFYwyfHZGVzRKCR2yKAQ63IPKpDG14451
   OdlHCdM3xqCJgMh8mQvD+ILz2NfzmvRtyE4Iq6LtsmIM2FFWa/hIeMLvH
   5UvovVjZ+W3e9f3pynPgH6hWK/hsb2hPEvn7GdbVQL7BxtCdpfcYoFgQB
   w==;
X-CSE-ConnectionGUID: zYQCysFcTQKHCb9XWZL3LQ==
X-CSE-MsgGUID: Ck0io2qfSZaI0u+wx/mLMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41049628"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41049628"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 03:53:32 -0800
X-CSE-ConnectionGUID: i1unej3VRYqeIXeFL5A/pg==
X-CSE-MsgGUID: TKPH8wbRTU+0esxp9LUn8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118534443"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 03 Mar 2025 03:53:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 0503D125; Mon, 03 Mar 2025 13:53:29 +0200 (EET)
Date: Mon, 3 Mar 2025 13:53:29 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kenneth Crudup <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
Message-ID: <20250303115329.GT3713119@black.fi.intel.com>
References: <8e175721-806f-45d6-892a-bd3356af80c9@panix.com>
 <bd731ba2-5509-44e6-a419-814ef5329bbd@panix.com>
 <992dba2a-4919-4f76-ac48-986792d5843c@panix.com>
 <2b55ab09-8389-4916-8acc-abc73f234d21@panix.com>
 <20250303104618.GP3713119@black.fi.intel.com>
 <f31309e4-6ce5-48cf-910e-cd74f818aac8@panix.com>
 <20250303112149.GS3713119@black.fi.intel.com>
 <d56fcd99-433e-4670-8388-7035812a78d9@panix.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d56fcd99-433e-4670-8388-7035812a78d9@panix.com>

On Mon, Mar 03, 2025 at 03:38:58AM -0800, Kenneth Crudup wrote:
> 
> On 3/3/25 03:21, Mika Westerberg wrote:
> 
> > Now you say that you don't reproduce the DP tunnel issue if you simply plug
> > in monitor so let's try to figure out reliable steps to repro so we can
> > investigate.
> ...
> > So with 9d573d19547b3 only reverted, no other changes to the kernel and
> > "thunderbolt.dyndbg=+p" in the command line do following steps:
> > 
> > 1. Boot the system up, nothing connected.
> > 2. Connect TBT 4 dock to the system.
> > 3. Connect monitor to the TBT 4 dock.
> > 4. Suspend the system by closing lid.
> > 5. Resume the system by openling lid.
> > 
> > Expectation: Monitor over Thunderbolt still shows picture.
> > Actual result: Screen is blank.
> 
> I will do this in a couple of days (got a few things to do first), but what
> actually happens is I get as OOPS and have to power-button-reset to recover,
> not even SysRq-B gets me out of it (I've since added "Panic on OOPS" with a
> 15-second timeout while I was trying to figure out this DP monitor issue).

I thought the system resumes fine after you reverted the other commit
(9d573d19), no? Just you don't get display tunneled so for example if you
login over ethernet (ssh) you should still be able to get full dmesg.

> > Then since now resume at least
> > completes you can provide full dmesg to me and I can try to figure out what
> > is wrong there.
> 
> It'll have to be more pstore dumps, as resume doesn't (usually) complete
> with d6d458d42e1.

What you mean does not usually complete?

Let's try to figure out how we can get full dmesg of the crash without need
to dig the pstore things if possible at all. I was hoping it now resumes
just you don't see picture on the screen.

We can actually take PCIe out of the equation so that you ask "boltctl" to
forget the device temporarily (or from the GNOME settings "privacy and
security" -> "Thunderbolt" then "forget device" for each).  This means your
docks do not work fully but display should and then we hopefully can get
the dmesg.

I will try to reproduce on my end too. I have serial port connected so I
can see all the messages even if the kernel crashes.

