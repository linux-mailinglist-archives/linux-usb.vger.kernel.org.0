Return-Path: <linux-usb+bounces-19771-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B2CA1CC86
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jan 2025 17:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2EFB1882185
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jan 2025 16:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534EB143895;
	Sun, 26 Jan 2025 16:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/r4W4dE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1350125A62C;
	Sun, 26 Jan 2025 16:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737907915; cv=none; b=u+s8U62BjNA37Ulog2fw6snSg+ECCzGMvC5b3ZtulVlhWYrKDUusFTB5l3JGNNm3OX76MsGwBeJ3v5//Bhh8wKwOwkT5m2igYOUyqzWb6xTjVqH0lzwe9TJbnAK8mIzTZSQmqVB8toAdXXnM5cq9htOeOmRDSUZt8Ry832FL8Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737907915; c=relaxed/simple;
	bh=0duSEgPL3lkqfXCibwypdfM92Y7TrlP120MsgjpES44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHaHRvKVrsNitGWqCWd9Xngnd0W9MsntZCr3NSHuO1yvwzSK6mg0+xSOImKIXlj0Ec8O4+F862wbbXvIMcKuyKPTZWRmYlp/kHdD24z65iSs1lXgHWT3IYLbjMVCoMjkEzuy6vFUIqE0HGzvSdIHC5XhpL3rVHuiCzV+lHsoY50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/r4W4dE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737907914; x=1769443914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0duSEgPL3lkqfXCibwypdfM92Y7TrlP120MsgjpES44=;
  b=F/r4W4dEtILpX25G8IYrEURJ1/ACYi5fLmRzMqOgoF4i+mBjcfaNh9mb
   KDnapxM6fs4OhsTaE5ovX6/UOG48RrZAZ+7LK9hJHa69p3RJ+RbnSovz6
   gorhJHO9nXSAM/e1f3LP0wExzC07hdrPuqqe4TJXGnPsSsG7U9lUw+b/Q
   wc8Cph46C2APRbXvghnx571+6Bg1BsD00gWWPwUsyjJSUx7oBwqIy2vmI
   r6JmzzgTBkBJE7eWG8IYaQ7fFH27Rwk8tFZszAQMRci5Q4sCuloqHZFLr
   5AaJDf8qxdeBnA3r5qPLfgz/lTkHauxkFNRTyRuTMvheRNKoz92OlTJD5
   g==;
X-CSE-ConnectionGUID: L3Wt5wOUS7+tzJDCHXDmrA==
X-CSE-MsgGUID: JjjkksFgRDCoENJNQ+LDeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="42137391"
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="42137391"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 08:11:53 -0800
X-CSE-ConnectionGUID: eQa/6AtiRPmjiwk23NVWIw==
X-CSE-MsgGUID: DRfs+AX4Qd6QA6VEu7TfkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108096188"
Received: from ccdjpclinux26.jer.intel.com (HELO localhost) ([10.12.50.122])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 08:11:51 -0800
Date: Sun, 26 Jan 2025 18:12:18 +0200
From: Gil Fine <gil.fine@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Aaron Rainbolt <arainbolt@kfocus.org>, YehezkelShB@gmail.com,
	michael.jamet@intel.com, andreas.noever@gmail.com,
	linux-usb@vger.kernel.org, mmikowski@kfocus.org,
	linux-kernel@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>,
	Novitzky Oren <oren.novitzky@intel.com>
Subject: Re: USB-C DisplayPort display failing to stay active with Intel
 Barlow Ridge USB4 controller, power-management related issue?
Message-ID: <Z5Ze4l3kpYTPAQDJ@ccdjLinux26>
References: <20241106060635.GJ275077@black.fi.intel.com>
 <20241106110134.1871a7f6@kf-ir16>
 <20241107094543.GL275077@black.fi.intel.com>
 <20241111082223.GP275077@black.fi.intel.com>
 <20241112164447.4d81dc3a@kfocus.org>
 <20241114115136.GB3187799@black.fi.intel.com>
 <20241114104125.00a02eb1@kf-ir16>
 <20241115132022.GC3187799@black.fi.intel.com>
 <20250124170540.1572d5db@kf-ir16>
 <20250126055347.GL3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250126055347.GL3713119@black.fi.intel.com>
Organization: Intel Israel Jerusalem (IDPj /IDCj) Har Hotzvim, HaMarpe Street
 9, Zip code 9777409

Hi,

+ Oren

On Sun, Jan 26, 2025 at 07:53:47AM +0200, Mika Westerberg wrote:
> On Fri, Jan 24, 2025 at 05:05:40PM -0600, Aaron Rainbolt wrote:
> > On Fri, 15 Nov 2024 15:20:22 +0200
> > Mika Westerberg <mika.westerberg@linux.intel.com> wrote:
> > 
> > > Hi,
> > > 
> > > On Thu, Nov 14, 2024 at 10:41:25AM -0600, Aaron Rainbolt wrote:
> > > > This is production hardware (specifically Clevo's X370SNW1-G and
> > > > X370SNV1-G laptops), available for purchase from Sager, XOTICPC,
> > > > Schenker, likely many other resellers, and our own website
> > > > at https://kfocus.org/spec/spec-m2.html (with a tool that allows users
> > > > to work around the bug). The firmware is baked into the hardware
> > > > provided to us by our ODM, and for the sake of stability we do not
> > > > modify any firmware on the machines with the exception of applying
> > > > BIOS updates provided to us directly by the ODM. They appear to get
> > > > their firmware directly from Clevo.  
> > > 
> > > Okay thanks.
> > > 
> > > > We have requested an updated BIOS from the ODM. If one is
> > > > available, we will upgrade and run the tests again.  
> > > 
> > > Yes, I hope you can get the firmwares. The one you have now is not
> > > "production quality" firmare so you should not really have that there
> > > in the first place and Clevo should definitely provide you an
> > > upgrade. Note this is separate from the BIOS. But your BIOS has issue
> > > too regarding the USB4 power contract that is required by Microsoft
> > > so I would expect that you should get that one upgraded too.
> > > 
> > > The patch I shared earlier should deal with all the other cases except
> > > that weird one where we do not seem to get unplugs (and the resource
> > > is available) which is not how the firmware is expected to work. I was
> > > planning to submit it upstream after some more validation on our end,
> > > probably afer v6.13-rc1 is released. I'll CC you.
> > > 
> > > If/when you get the new firmare I would definitely appreciate if your
> > > folks could give it a try.
> > 
> > Hi Mika, sorry for the very late follow-up, been busy with other work
> > stuff.
> 
> No worries.
> 
> > We contacted the ODM to get newer firmware. They contacted Clevo, who
> > told them that the Barlow Ridge chip in these machines is the B0
> > revision. According to them, the latest firmware available for the B0
> > revision is 14.6; they also state that the 56.x firmware is for the B1
> > revision and is incompatible.
> > 
> > Is it possible that the problem is that the driver is written
> > specifically for the B1 revision and only partially works with the B0
> > revision?
> 
> The driver support is written for USB4 v2 not specifically for certain
> Barlow Ridge silicon stepping. B0 has issues that B1 fixes but I'm not sure
> if they are related to this one. My reference host controller is actually
> B0 and it is running the 56.x firmware IIRC so not incompatible.
> 
> @Gil, can you verify this?

Actually we didn't try use latest BR firmware on old HW like B0 so can't tell
if all BR features expected to work on B0, but let me add Oren, the contact
person for these.

@Oren, Is B0 BarlowRidge is still officially supported?
I mean do we release newer NVM versions to Clevo for B0 BR?

-- 
Thanks,
Gil

