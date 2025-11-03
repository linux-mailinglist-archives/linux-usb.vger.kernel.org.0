Return-Path: <linux-usb+bounces-30007-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96765C2B552
	for <lists+linux-usb@lfdr.de>; Mon, 03 Nov 2025 12:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59660188C229
	for <lists+linux-usb@lfdr.de>; Mon,  3 Nov 2025 11:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060CB30215B;
	Mon,  3 Nov 2025 11:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYUlZy6d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A8227E04C
	for <linux-usb@vger.kernel.org>; Mon,  3 Nov 2025 11:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762169213; cv=none; b=ns+UJC4u8K6Pjfa8UERZM1Qz4GG3OhYBq01ovSDUoZTJPS3KL1lw/Q4hnOIgweYP4siyQ/tTSXnwsF+ZNue15kK2+Ky2z5Mpy1vmeRWefN+WqlQNz1srUkoSOTA+eBMbno8m78AsYi58hzBA7ycNBdop4MK3T52xkrY4Uuvd9YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762169213; c=relaxed/simple;
	bh=GyWy1aiXeyUuz9L/UOH1lZMug369toCG2roAABwAVGM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/lrp+iH7L6vbLk+uMX8EHmutnIftMEm8Vp3yVOeVikAa2NczYuw5vTl9G8EsXOhOBp+VvLG0BmtqW82w/FEuiwsot3537kiz1PZqMxo8T7UA4ZrJcfCYWEhdVdyAZWvXPbmZ0bfC0DP/+L7fNgewWQZCLJxPygt9La/Nrnro4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYUlZy6d; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762169211; x=1793705211;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=GyWy1aiXeyUuz9L/UOH1lZMug369toCG2roAABwAVGM=;
  b=BYUlZy6dfWrdA+e/NVbv8GifUQDCjedFJjfL6uUYbqSMRgtl61sf7s9A
   IxrVpQ1TLYiefZi9x65avGnX5GOxKa1DQwl90qKc/ZVidozuhpXrbsyS8
   KgXG1qlsWLuHAePFf4tMPXu+ZFvujBMbE0mjzsg1F6RcdeZMa/esukqNF
   YFZzN8z1quy1UIDYRz2MGv+Lrr+Qh2m1Avcd1Oa/rTSamtxX7Ib+7EFxb
   fQ4+xw1oJSgIa71hH2VYzKanw88HlXhS3fbhhE/yPpvLdmr6jJKGwmln7
   rQ/JarrOVIXSUCx+NnXcUfjk7t88mCi9VYaPAD7NEz3+ZVZFcyS7UQDmq
   g==;
X-CSE-ConnectionGUID: RUjMb4C0RpmOK8V3LHA+BA==
X-CSE-MsgGUID: duxuxlZiRQWeN2omSlkbNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="66854424"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="66854424"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 03:26:51 -0800
X-CSE-ConnectionGUID: DUz/5SjXTEqw7EgH36ELHA==
X-CSE-MsgGUID: B5oa/508RTCqUmGMJqEUdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="210372522"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 03 Nov 2025 03:26:50 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 00DDC95; Mon, 03 Nov 2025 12:26:48 +0100 (CET)
Date: Mon, 3 Nov 2025 12:26:48 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org, Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Imre Deak <imre.deak@intel.com>
Subject: Re: TB 5 Dock DP-Out non-functional
Message-ID: <20251103112648.GI2912318@black.igk.intel.com>
References: <q7k73t5utfjrpuf45ynig72eojpixepjqccvsfaqt6rg4wptst@se6ekc2eg3sv>
 <20251103055659.GD2912318@black.igk.intel.com>
 <rnp5dzfud5feidxi2qx63cxezukyszuzpj7v5f5gyoqtys3uff@e72nlrudjzxb>
 <20251103102639.GE2912318@black.igk.intel.com>
 <lerwgbxoidxvfv3ajszi467rupujg465ukh3fcokihxpv2ikjr@rbke2a76anld>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <lerwgbxoidxvfv3ajszi467rupujg465ukh3fcokihxpv2ikjr@rbke2a76anld>

Hi,

On Mon, Nov 03, 2025 at 12:01:06PM +0100, Frederik Schwan wrote:
> Whole log attached.

Great, thanks!

From that log the last BW allocation done by i915 is 12.5G:

[   51.572497] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): bandwidth allocation changed to 0/12500 Mb/s

> > Regarding the script, that's odd too but it could be that you have more
> > than one host router there (it is not clear from the truncated log). You
> > need to build the tbtools binaries though.
> 
> I do package tbtools for Arch so these are available.
> 
> tblist gives me:
> Domain 0 Route 0: 8087:7eb2 Intel Gen14
> Domain 1 Route 0: 17ef:a583 Lenovo ThinkPad P1 Gen8 / T1g Gen8
> Domain 1 Route 1: 0108:234d Lenovo ThinkPad Thunderbolt 5 Smart Dock 7500 - 40BA

Okay this has discrete Barlow Ridge TB5 host router.

> tbadapters --domain 1 --route 1:
>  1: Lane 0 (upstream)             CL0
>  2: Lane 1                        CL0
>  3: Lane 0                        CLd
>  4: Lane 1                        CLd
>  5: Lane 0                        CLd
>  6: Lane 1                        CLd
>  7: Lane 0                        CLd
>  8: Lane 1                        CLd
>  9: PCIe Up                       L1
> 10: PCIe Down                     Disabled
> 11: DisplayPort OUT               Disabled
> 12: DisplayPort OUT               Enabled

And this confirms that the DP tunnel is up.

That tb-bandwidth.sh script should work too (or tbtunnels -d1 -vv).

Anyways, from TB perspective this looks okay. Not sure about graphics. Imre
do you see anything?

