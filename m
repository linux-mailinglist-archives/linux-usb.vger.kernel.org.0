Return-Path: <linux-usb+bounces-19806-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F8EA20647
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 09:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E785C3A7B2F
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 08:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DDCC1DF986;
	Tue, 28 Jan 2025 08:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5z1tjIX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887611DDC22;
	Tue, 28 Jan 2025 08:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738052952; cv=none; b=M9gWEWV/jYhU9JKl8UOG6/oY8Eev2adAol7Dw2EW3Xj3rSPYfCvMPJAhyTN63WiOjJdTXo8bD8iLtvLEHVBfpTmaT+Zlghw900Cjom2DjH+gmS4w2QA1WZ6QUkAeWtYzEGrllEF/0IhK+vHyV2s4tbaHBuE8MtMLIUPffAnHDAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738052952; c=relaxed/simple;
	bh=BJnUpHDWhWHJ3/CtwoaKl8B0dCzoTLlZ82FLmFNryJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AF9T5LotbFID7vVDk1MTQzcSWBBprywtx6/d08ENns/YosUtEH8hoD2B/MvDbXUOzyBU1x3T3HMtVRg1dA5AVqeBsORfj4NqsvENACHOUyrF6+Cue2OXBeOzwfnBV4AN7oHv8ci6fQ7kJt1BA0FFS+xbg+IA8J+pclOGfg9pa8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5z1tjIX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738052950; x=1769588950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BJnUpHDWhWHJ3/CtwoaKl8B0dCzoTLlZ82FLmFNryJk=;
  b=P5z1tjIXBmbnlziJw8e+at+1kbdb8+irnYoWPaadsddyzHMJWXemdg9I
   R1yG5p3y5OE1uW2STITIlZMa2seduotMGvmbbodyIHqWwQ1XnchNRymAV
   yDQiUEAyKiL6GgA0v8nA70H0Bq9Ajlj1LwFypoRBiqex0akKQjQockTgU
   8bsXE8zqEwxbKiiPZFS6xytxbKfcTA+xUy3AD+OY3/Pk94ccOzXnORvnc
   jqghoDhE7RPXwOkqcrTheQe4+RD0t/RLWaJjmZHBvhq5pJ4spwuecTeJ+
   1eTmFB08CnG6yiZSsw1YE6zGfHpJsxgnfjxf1SkbNqGEYNgp+xlmFrYDv
   A==;
X-CSE-ConnectionGUID: Di/wdZt5RIah1fz0CcXpQg==
X-CSE-MsgGUID: v6KGULz+Rr+dUTeqNAh/qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="26128006"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; 
   d="scan'208";a="26128006"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 00:29:08 -0800
X-CSE-ConnectionGUID: lcrS4djuSn+Wiq4BRipxnw==
X-CSE-MsgGUID: sQm3GMroTJeuhW14PH/b/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; 
   d="scan'208";a="109200236"
Received: from ccdjpclinux26.jer.intel.com (HELO localhost) ([10.12.50.122])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 00:29:05 -0800
Date: Tue, 28 Jan 2025 10:29:32 +0200
From: Gil Fine <gil.fine@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Aaron Rainbolt <arainbolt@kfocus.org>, YehezkelShB@gmail.com,
	michael.jamet@intel.com, andreas.noever@gmail.com,
	linux-usb@vger.kernel.org, mmikowski@kfocus.org,
	linux-kernel@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>,
	Novitzky Oren <oren.novitzky@intel.com>, gil.fine@intel.com
Subject: Re: USB-C DisplayPort display failing to stay active with Intel
 Barlow Ridge USB4 controller, power-management related issue?
Message-ID: <Z5iVbOeNYmMeLMj8@ccdjLinux26>
References: <20241106110134.1871a7f6@kf-ir16>
 <20241107094543.GL275077@black.fi.intel.com>
 <20241111082223.GP275077@black.fi.intel.com>
 <20241112164447.4d81dc3a@kfocus.org>
 <20241114115136.GB3187799@black.fi.intel.com>
 <20241114104125.00a02eb1@kf-ir16>
 <20241115132022.GC3187799@black.fi.intel.com>
 <20250124170540.1572d5db@kf-ir16>
 <20250126055347.GL3713119@black.fi.intel.com>
 <Z5Ze4l3kpYTPAQDJ@ccdjLinux26>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5Ze4l3kpYTPAQDJ@ccdjLinux26>
Organization: Intel Israel Jerusalem (IDPj /IDCj) Har Hotzvim, HaMarpe Street
 9, Zip code 9777409

Hi,
Got reponse from Oren that B0 BarlowRidge controller is not longer supported,
and the last thunderbolt firmware we released for B0 is 16.3 , from here:
https://www.intel.com/content/www/us/en/secure/design/confidential/software-kits/kit-details.html?kitId=821065&wapkw=barlow%20ridge%20nvm%20b0

So @Aaron, please try with that one.

Thanks !

On Sun, Jan 26, 2025 at 06:12:18PM +0200, Gil Fine wrote:
> Hi,
> 
> + Oren
> 
> On Sun, Jan 26, 2025 at 07:53:47AM +0200, Mika Westerberg wrote:
> > On Fri, Jan 24, 2025 at 05:05:40PM -0600, Aaron Rainbolt wrote:
> > > On Fri, 15 Nov 2024 15:20:22 +0200
> > > Mika Westerberg <mika.westerberg@linux.intel.com> wrote:
> > > 
> > > > Hi,
> > > > 
> > > > On Thu, Nov 14, 2024 at 10:41:25AM -0600, Aaron Rainbolt wrote:
> > > > > This is production hardware (specifically Clevo's X370SNW1-G and
> > > > > X370SNV1-G laptops), available for purchase from Sager, XOTICPC,
> > > > > Schenker, likely many other resellers, and our own website
> > > > > at https://kfocus.org/spec/spec-m2.html (with a tool that allows users
> > > > > to work around the bug). The firmware is baked into the hardware
> > > > > provided to us by our ODM, and for the sake of stability we do not
> > > > > modify any firmware on the machines with the exception of applying
> > > > > BIOS updates provided to us directly by the ODM. They appear to get
> > > > > their firmware directly from Clevo.  
> > > > 
> > > > Okay thanks.
> > > > 
> > > > > We have requested an updated BIOS from the ODM. If one is
> > > > > available, we will upgrade and run the tests again.  
> > > > 
> > > > Yes, I hope you can get the firmwares. The one you have now is not
> > > > "production quality" firmare so you should not really have that there
> > > > in the first place and Clevo should definitely provide you an
> > > > upgrade. Note this is separate from the BIOS. But your BIOS has issue
> > > > too regarding the USB4 power contract that is required by Microsoft
> > > > so I would expect that you should get that one upgraded too.
> > > > 
> > > > The patch I shared earlier should deal with all the other cases except
> > > > that weird one where we do not seem to get unplugs (and the resource
> > > > is available) which is not how the firmware is expected to work. I was
> > > > planning to submit it upstream after some more validation on our end,
> > > > probably afer v6.13-rc1 is released. I'll CC you.
> > > > 
> > > > If/when you get the new firmare I would definitely appreciate if your
> > > > folks could give it a try.
> > > 
> > > Hi Mika, sorry for the very late follow-up, been busy with other work
> > > stuff.
> > 
> > No worries.
> > 
> > > We contacted the ODM to get newer firmware. They contacted Clevo, who
> > > told them that the Barlow Ridge chip in these machines is the B0
> > > revision. According to them, the latest firmware available for the B0
> > > revision is 14.6; they also state that the 56.x firmware is for the B1
> > > revision and is incompatible.
> > > 
> > > Is it possible that the problem is that the driver is written
> > > specifically for the B1 revision and only partially works with the B0
> > > revision?
> > 
> > The driver support is written for USB4 v2 not specifically for certain
> > Barlow Ridge silicon stepping. B0 has issues that B1 fixes but I'm not sure
> > if they are related to this one. My reference host controller is actually
> > B0 and it is running the 56.x firmware IIRC so not incompatible.
> > 
> > @Gil, can you verify this?
> 
> Actually we didn't try use latest BR firmware on old HW like B0 so can't tell
> if all BR features expected to work on B0, but let me add Oren, the contact
> person for these.
> 
> @Oren, Is B0 BarlowRidge is still officially supported?
> I mean do we release newer NVM versions to Clevo for B0 BR?
> 
> -- 
> Thanks,
> Gil

-- 
Thanks,
Gil

