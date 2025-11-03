Return-Path: <linux-usb+bounces-30004-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C60D6C2B398
	for <lists+linux-usb@lfdr.de>; Mon, 03 Nov 2025 12:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE3E13B7C04
	for <lists+linux-usb@lfdr.de>; Mon,  3 Nov 2025 11:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21C32F8BFF;
	Mon,  3 Nov 2025 11:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNizKzb4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808DF221DB5
	for <linux-usb@vger.kernel.org>; Mon,  3 Nov 2025 11:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762167755; cv=none; b=VKWSlz/RaB94tcG4akaSvTFQ/nSaSog2+vVMlP7HnDxGPbRqDTJwdmzVn82ESzyVPRmf9pem1SEzpP5WB2Pz4ycnrY4vz3+2KoVpFdZdqmkN2LxfzhGZDDBwiFbGvdoYw2fcQ1Unrt/TqtiogBsaxzAivt/8o8vqIVEKXJPpGaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762167755; c=relaxed/simple;
	bh=KipBDPAFgqJ5vnqSZqf4aUMjHNZUAa0MtmgC10K6X8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FilZZAR16j2S8ZourSQH1ohh7LisH2bhRsCEN2j6Jg/gegDUQk3x/m/f4Zh+nIZat3NJZx302tyujE5/DoyycUIq/n+mUomHLK+lmmpTWNNIKmgm8xGJ+A9mfyxZnywGdKI0IwdV0tdIXjwU1iKSn+HvLQYaHxsqrM7SvKpvAJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RNizKzb4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762167754; x=1793703754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KipBDPAFgqJ5vnqSZqf4aUMjHNZUAa0MtmgC10K6X8E=;
  b=RNizKzb49MPP/BlZmdAe53Gmw5nNJ7iciRCZhDoIKSZbA79OyJlLiGpP
   975yOApZthVDQ5lxzjcbNGkgS0mVgpk7R+syjkQ95Vpc0fVgVG0iqRMiT
   CUBPCNmo4S1sOdn/gFatyJ5dznB1tohDu03gyyBv0JlE8kAPkipWdkDsn
   ppEst0Y94UUWcMkiJipG3nNxT0405Cs5SVZ1qd9xaGm3WbunvmokrqA0Z
   zHby8G+MxRWvZhoksWnsVLT24TmqxDEfkNdeoM3jgMewJ+9qgxUjuiQLc
   N80cgYWZT+rDIluIPmG9xVWU4AforkJ3slSCKDVnciBxDCQU56g39goQ8
   g==;
X-CSE-ConnectionGUID: 8G836HjuTiOPXmtGbwEAAA==
X-CSE-MsgGUID: 4MwGU4GDS6+eldAvRkcCXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64278450"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="64278450"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 03:02:34 -0800
X-CSE-ConnectionGUID: RCrFNpDgTNG05ww3yQLjfw==
X-CSE-MsgGUID: WmmJLqz8TrC0nV81/X7Jxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="186792628"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 03 Nov 2025 03:02:32 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id D9F5695; Mon, 03 Nov 2025 12:02:30 +0100 (CET)
Date: Mon, 3 Nov 2025 12:02:30 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 0/2] thunderbolt: Bring the firmware upgrade
 documentation up-to-date
Message-ID: <20251103110230.GH2912318@black.igk.intel.com>
References: <20251028061357.2164810-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028061357.2164810-1-mika.westerberg@linux.intel.com>

On Tue, Oct 28, 2025 at 07:13:55AM +0100, Mika Westerberg wrote:
> Hi all,
> 
> The recommended way to apply Thunderbolt/USB4 firmware upgrades is through
> Linux Vendor Firmware Service (LVFS) and fwupd that are present in most
> distros. These patches update the documentation to mention this too.
> 
> Alan Borzeszkowski (2):
>   thunderbolt: Update NVM firmware upgrade documentation
>   thunderbolt: Update deprecated firmware update site in icm.c

Both applied to thundergolt.git/next.

