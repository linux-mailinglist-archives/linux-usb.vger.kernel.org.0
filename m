Return-Path: <linux-usb+bounces-9633-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 905B38ADE0E
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 09:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABFC71C218A5
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 07:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA5045948;
	Tue, 23 Apr 2024 07:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZoNA7BR8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA621C698
	for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 07:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713856491; cv=none; b=AcFmZiy7ejETTX4DR8MryGS/DaLhEB/WZ9pyWA7TwEIrOoWkL9gM8sL01cusvDomkxVglEmInEKrs5lCkgN0GHOcdwsgDe5yPY+ooJ/CCKggq8M6gfj5mQweLfTiRq2iv7DXe4+4Jkf+pmWX6CKkC1IDeBampxtAPS0iPPjl3aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713856491; c=relaxed/simple;
	bh=xNeBGSO2Du8GPkcIwFEzHIgTHea2HkkZZy0f3z6Iapk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CexcwvgSozCusmLUR/9USmuZ3epbCYDz9kV/Gn0mTSqXlUyN7mJYamysjIAcMNwa4PPFSLFrW5ljEa7vC7gvwff4zA4pQgBZcKtfqdfnENjt2lmNUoBmzS4Gl9+QLjfDReOAenQYrLrKvxhfRd9pOfxoL2ljHMZVA/zyGUd9iCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZoNA7BR8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713856490; x=1745392490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xNeBGSO2Du8GPkcIwFEzHIgTHea2HkkZZy0f3z6Iapk=;
  b=ZoNA7BR8RlZCvI1NUE5yCBvHuiyHKbIz/9BiEb1UCfGUa4v2kf0XiNf7
   tdR9P/zgT/VaZQbxJe51/91UM1QjHETJSkyMAT04TgWN39DbzmLe3Mu2w
   gtH4oYolYMtfuRvjc5D8a9U9BkI3mscdsLQDLlf5fHCQmmzpNr4CFSUdU
   wUnJwHPGf8LWmVAvwZno8lhXvzU4Ia8Dk2LOwLON4ZhsObp6366wvme+W
   JiTyAsXadDBjgPsmWQvJtgNdK35B41jsKVcHnYoL0KWuPr/qNAqodeW7h
   ZhVwV5KXeCTQkXGMbujQsRDf/qf04yLMKuBOPNLKKLp1zLS4avCUY/fl9
   Q==;
X-CSE-ConnectionGUID: jjD3O0feRN+NSnUOHmmd1w==
X-CSE-MsgGUID: PNX7ScTxTsGqLzSyIuIDPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9257004"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9257004"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 00:14:49 -0700
X-CSE-ConnectionGUID: tZ9b0UoSTeaeZCnBsVHUMw==
X-CSE-MsgGUID: qxaViK4hSV67hjWYcuv+wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="28722792"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 23 Apr 2024 00:14:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id DA6A1192; Tue, 23 Apr 2024 10:14:45 +0300 (EEST)
Date: Tue, 23 Apr 2024 10:14:45 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Sanath S <Sanath.S@amd.com>
Subject: Re: [ANNOUNCE] Thunderbolt/USB4 debugging tools
Message-ID: <20240423071445.GA112498@black.fi.intel.com>
References: <20240402101020.GP112498@black.fi.intel.com>
 <2024042110-oat-juicy-e599@gregkh>
 <af511b0a-f87c-4168-8f46-8d471a5c36ec@amd.com>
 <20240423053636.GZ112498@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240423053636.GZ112498@black.fi.intel.com>

On Tue, Apr 23, 2024 at 08:36:36AM +0300, Mika Westerberg wrote:
> On Mon, Apr 22, 2024 at 09:36:24AM -0500, Mario Limonciello wrote:
> > On 4/21/2024 05:27, Greg KH wrote:
> > > On Tue, Apr 02, 2024 at 01:10:20PM +0300, Mika Westerberg wrote:
> > > > Hi all,
> > > > 
> > > > This is mostly for the folks developing and testing Thunderbolt/USB4
> > > > driver side of things but may be useful for others too. Not intented to
> > > > replace anything we already have for the regular user stack.
> > > > 
> > > > In summary this is a collection of small tools that provide bit more
> > > > user friendly access to the sysfs/debugfs/tracefs interfaces made
> > > > available by the driver. Mainly useful for debugging issues around the
> > > > software connection manager parts of the driver (although some of these
> > > > work with the firmware connection manager too). We have been using this
> > > > internally for a while.
> > > > 
> > > > The repository can be found here:
> > > > 
> > > >    https://github.com/intel/tbtools
> > > > 
> > > 
> > > 
> > > Very cool, thanks for the link!
> > > 
> > > greg k-h
> > 
> > Yes, thanks for sharing!  Is it worth adding a link somewhere in kernel
> > documentation to make it more discoverable?
> 
> I can't think of any place where this could belong though since this is
> not meant for ordinary users (so I guess admin-guide is not good place
> for it either).

Well maybe as part of the Kconfig, something like below? Does that make
sense?

diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
index 279de1ba4487..0abdb69ee9f4 100644
--- a/drivers/thunderbolt/Kconfig
+++ b/drivers/thunderbolt/Kconfig
@@ -22,7 +22,11 @@ config USB4_DEBUGFS_WRITE
 	bool "Enable write by debugfs to configuration spaces (DANGEROUS)"
 	help
 	  Enables writing to device configuration registers through
-	  debugfs interface.
+	  debugfs interface. You can use tools such as Thunderbolt/USB4
+	  debugging tools to access these registers. For more
+	  information see:
+
+	    https://github.com/intel/tbtools
 
 	  Only enable this if you know what you are doing! Never enable
 	  this for production systems or distro kernels.

