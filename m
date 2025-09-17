Return-Path: <linux-usb+bounces-28183-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C78A6B80194
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 16:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 914671C05830
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 08:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E114308F0F;
	Wed, 17 Sep 2025 08:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gM9Mv+XD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82308306D5E
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 08:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096936; cv=none; b=c6no2EAwuyh+Fa1AqR3DsHhFPbfd1j8PyUdc8RSiGY+CkeRjbaSN56KW+w61yj01FKA+lcWCtxGCcpkSjo+4AEU2BcdUTX2cgzY/XmENm3RpMeqd+oz2rljgL/ydQOBDsciV2mlmxKizsCfVk689ekRky/IVJc1lejzQsI7Hqmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096936; c=relaxed/simple;
	bh=ac0PNbFeZ46ykl3bTgNh+S2AWHduWK7f9ew3aBhT2Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K46uVhdYB2AAdNb5z2R2If5gFGZBovkn0UAyxZIdCpBoH3V0K1G2i71tM/IR8uRpBXIjerc1gd9HmIzEq1I3sC7vqLzq2r7jRkRkvGAtbUNVOyh1QJxzKBL7X0GJtpj29wlLe3648fqT2JVJKdFY4iulSNSJoBX/C78cQvSd8mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gM9Mv+XD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758096934; x=1789632934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ac0PNbFeZ46ykl3bTgNh+S2AWHduWK7f9ew3aBhT2Uw=;
  b=gM9Mv+XDRDtVLuR5VJktL+s4BF6lztmfmyIH8QGiMDpeZeweJ1HGcv5G
   ll6J8/MILMeRXkpKzDquddrhDj/5RmR5o177DizMcn4t2ct7NQTXp0Ynn
   gvJWRkCXv3pKSGVHS1AneLnf2Q+BEgeVGReEAHsYhKu24Z0k1KlAwEOYu
   58D943kSzzf0t1z7ty4K0VqfoBsQ3qvM6BSJJBHEDEru/+vt5bAG0obun
   sds1zdEdoM9bYfEtpIpzW/wdB8iJ+CyUxX1rqAro2kN6vmdoHJMimRCMe
   sI5Sq9h9OYVrcUAbRAvvUSVXZJ05oF3uG9aRANLvgjI6sexgmiqLBEj+Z
   Q==;
X-CSE-ConnectionGUID: 24chgmrMRYCk2zezEvwkqQ==
X-CSE-MsgGUID: ZZh53hAOQcSCuLeYNKBVjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="59438764"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="59438764"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 01:15:29 -0700
X-CSE-ConnectionGUID: 3FFSvvLqQFyYbDdBrT9ykw==
X-CSE-MsgGUID: 6B1y2J5wSn+iaN7HMxIR4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="206128969"
Received: from smile.fi.intel.com ([10.237.72.51])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 01:15:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uynK0-00000003kWF-3aHO;
	Wed, 17 Sep 2025 11:15:24 +0300
Date: Wed, 17 Sep 2025 11:15:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Subject: Re: [PATCH 00/26] thunderbolt: kernel-doc fixes
Message-ID: <aMpuHEhV4BhzUf_1@smile.fi.intel.com>
References: <20250908163230.2614397-1-mika.westerberg@linux.intel.com>
 <20250917055202.GE2912318@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917055202.GE2912318@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 17, 2025 at 07:52:02AM +0200, Mika Westerberg wrote:
> On Mon, Sep 08, 2025 at 06:32:04PM +0200, Mika Westerberg wrote:
> > Alan Borzeszkowski (26):
> >   thunderbolt: Update acpi.c function documentation
> >   thunderbolt: Update cap.c function documentation
> >   thunderbolt: Update clx.c function documentation
> >   thunderbolt: Update ctl.c function documentation
> >   thunderbolt: Add missing documentation in ctl.h tb_cfg_request struct
> >   thunderbolt: Update dma_port.c function documentation
> >   thunderbolt: Update domain.c function documentation
> >   thunderbolt: Update eeprom.c function documentation
> >   thunderbolt: Update lc.c function documentation
> >   thunderbolt: Update nhi.c function documentation
> >   thunderbolt: Add missing documentation in nhi_regs.h ring_desc structure
> >   thunderbolt: Update nvm.c function documentation
> >   thunderbolt: Update path.c function documentation
> >   thunderbolt: Update property.c function documentation
> >   thunderbolt: Update retimer.c function documentation
> >   thunderbolt: Update switch.c function documentation
> >   thunderbolt: Update tb.c function documentation
> >   thunderbolt: Update tb.h function documentation
> >   thunderbolt: Add missing documentation in tb.h
> >   thunderbolt: Update tmu.c function documentation
> >   thunderbolt: Update tunnel.c function documentation
> >   thunderbolt: Update tunnel.h function documentation
> >   thunderbolt: Update usb4.c function documentation
> >   thunderbolt: Update usb4_port.c function documentation
> >   thunderbolt: Update xdomain.c function documentation
> >   thunderbolt: Update thunderbolt.h header file
> 
> All applied to thunderbolt.git/next.

Thank you!

-- 
With Best Regards,
Andy Shevchenko



