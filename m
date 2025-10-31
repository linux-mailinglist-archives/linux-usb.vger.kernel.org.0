Return-Path: <linux-usb+bounces-29947-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DFDC2500B
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 13:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DE3014F4337
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 12:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFC12F261D;
	Fri, 31 Oct 2025 12:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PEYCZwD4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CAA319878
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 12:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761913668; cv=none; b=L0xlWET4n67S0Xi6hU+qNWuPGiHyomBtZdNUvRFOApMyMdfL6VLA2aQ4btE0fZt7GCi/YobqbzJ6rudIOGNZQFwMaICopl1+HalmU6/h6sPmL0Tjifh3bjgqxZcHMcXJcPGnBTE31WSKToMTTTIfPmPZSoIaeTIENyi9ipixF9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761913668; c=relaxed/simple;
	bh=tLQKEa9AffESHxb/8iaI4uyRCqk/ybcYKcsBUFhkIV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUOPrqTsR0zuv2DBxW/NayH4sw3byW+UgpCf9O+yMfwPh4/SJpEGNRuT0B7omhRsLC5tIDTIRQed0sJaudIVHEeTkcl6CeSTJS+gm0HaWNVmuJXZoojqhwwup1ySt+nx5yA6lA5ruBn/Pc+FId5e1xzzXTkuZFYJF+g7CKeoSVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PEYCZwD4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761913666; x=1793449666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tLQKEa9AffESHxb/8iaI4uyRCqk/ybcYKcsBUFhkIV4=;
  b=PEYCZwD4R09z2/p6cAwJEWe+xrgaOcNgcW1RJHAokmeZbI5btA8G8Q60
   +Lxd2BxBE+fRdeDYAUs1LT9tu7X6FFDooogFZVwR8Aivn0Eb/cmFXAUv3
   f+jPOHUPcGyCaZYl2UYFCC5ACxvsGvKOKZ+BuHSn8zDmE6CmBT6m5/p16
   AyEJ1GssnROrOguHWhQ+sd5qQeLA5jqHomtKu6d+AkAYZgJRLidgRFyMm
   K2o9RTQparqSr0eEGEdMU68lqq/NWYNiaZJ76e8GiLlzHvPhm3GhXANnr
   DM5z1/7sPcRa0EtZPEjJCso07wOz4B9Pis37g8huCzBJf3SxvrMA5fImX
   A==;
X-CSE-ConnectionGUID: 9XThK5xbRii2FeSCjzGaDQ==
X-CSE-MsgGUID: flMehcEnQnO67iycI/hnuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67934189"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="67934189"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 05:27:46 -0700
X-CSE-ConnectionGUID: DfvPPA0yTpaP87B48TVBGA==
X-CSE-MsgGUID: N8RmaZRERdWUMPL4tsceLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="190572251"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 31 Oct 2025 05:27:44 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id ECB4695; Fri, 31 Oct 2025 13:27:43 +0100 (CET)
Date: Fri, 31 Oct 2025 13:27:43 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yanis Srairi <yanis.srairi@univ-lehavre.fr>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, westeri@kernel.org,
	YehezkelShB@gmail.com
Subject: Re: [BUG] Dell Thunderbolt 4 dock not enumerated on cold boot -
 Intel Core Ultra 7 255H
Message-ID: <20251031122743.GB2912318@black.igk.intel.com>
References: <45a965a4-3b40-b808-5fde-0c9d78c8f492@univ-lehavre.fr>
 <20251031105946.GZ2912318@black.igk.intel.com>
 <926b30e9-00da-c404-53fd-2f7fb4731d5a@univ-lehavre.fr>
 <20251031113108.GA2912318@black.igk.intel.com>
 <45db8612-b893-9909-6ffb-9aee4256e471@univ-lehavre.fr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <45db8612-b893-9909-6ffb-9aee4256e471@univ-lehavre.fr>

Hi,

On Fri, Oct 31, 2025 at 01:00:13PM +0100, Yanis Srairi wrote:
> I've completed the additional diagnostics:

Thanks!

> 1. All firmware is up to date (checked with fwupd):
>   - System Firmware 
>   - USB4 controller
>   - PD 
>   - Dell dock package
> 
> 2. I've performed a cold boot and collected the requested debug info
>   (attached files):
> 
>   - tbadapters.txt
>   - port1-cs18.txt
>   - port3-cs18.txt

Yeah it looks like the USB4 link is not up at all.

> 3. After hotplug (unplug/replug), the dock works correctly and is
>   visible in tblist output (tblist-after-hotplug.txt)
> 
> Additional information: The laptop (Dell Pro Max 16), the Dell
> Thunderbolt 4 Dock, and the monitor are all brand new.
> 
> Regarding BIOS reset: I can try resetting BIOS to defaults if you think
> it would help, but I'd prefer to avoid it if the debug info gives you
> enough information. Let me know if you want me to try this.

Okay, I have one Dell Arrow Lake system here, not sure if that's the same
as yours but for when I connect Intel TB5 reference dock and power up the
system the link comes up just fine.

I looked at my BIOS settings and some of the knobs are different than
yours. Maybe you can try to change those?

For me:

 Enable External USB Ports -> On
 Enable USB Boot Support -> On

 Enable Thunderbolt Boot Support -> Off
 Disable USB4 PCIE Tunneling -> Off

 Video/Power only on Type-C Ports -> Off

(not sure if the below has anything to do with TB but good to check):

 Type-C Dock Override -> On
 Type C Dock Audio -> On
 Type C Dock Lan -> On

