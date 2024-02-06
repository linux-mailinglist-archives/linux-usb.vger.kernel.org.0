Return-Path: <linux-usb+bounces-5961-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 293D184B99C
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 16:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D955529308B
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 15:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09F21332A8;
	Tue,  6 Feb 2024 15:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DCv7W5KU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD79513173E
	for <linux-usb@vger.kernel.org>; Tue,  6 Feb 2024 15:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707233475; cv=none; b=YgP+ouN0JB9/FmuFOI/rkBuHA1HXx8RjBRtBlm3wfijrCBOkQUVuy6/ln0zKfCuckITFwA17AVj+PHcucRgTT60CN0UmQYLI2Xd3N5sexn/NwVhvT15CIMbjb3PHm4EpoEuss0F6K0Wto0drDl7uvWRLfoaPQU4TLVOioH2kKMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707233475; c=relaxed/simple;
	bh=WUEUzrdH+fXW1eTkgU9X7ItqGGy0V9g3jw0xYYW+W4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kD/Qyay/4tLa7APkfW95VkZQu1UrzYRuDsHiUIvo++9L70TaVb0N0Am0zcvw8ub5zvBI4gKrZALYFqZa767k7zk9ModwWmRP/9C2BEPFZBWbJxKYnGnoL+UEfeGjO2VzW/Gs1bAgZQKOKP8O920jsDYgpPIjyc92zIhLnTmQ0Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DCv7W5KU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707233473; x=1738769473;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WUEUzrdH+fXW1eTkgU9X7ItqGGy0V9g3jw0xYYW+W4U=;
  b=DCv7W5KUyF/EiTT/f7vSRRjIL3jUblfsE8BxczkCX1cIgbHMguX2EI9p
   5lDzFMKrwjez/30msREVxH3sNLx5aq4VxTGo+NpnIBFqx83g0YNc9LNJe
   ymkMecx4fdAk6xGQdQauU6OF9ThVos7emEFWW03jOTLgq8Ixwjrb/5IeY
   ZaHxYXzJeQGgKiZU69m8yrUoYYRsUTktbzSLGjue1VdiFSD4XS1uCQmEQ
   Qt1HpTliB75aRsJftorG3knFtjLOCjybowMIO1LRusBG99MA9Z3Tw9TWc
   hea1MRHC/um3ketX8jVx1q6MrfuXETIbj1Vr7SVcjmn/XZiegSnMMBro0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="11354721"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="11354721"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 07:31:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="933495494"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="933495494"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 06 Feb 2024 07:31:08 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 06 Feb 2024 17:31:07 +0200
Date: Tue, 6 Feb 2024 17:31:07 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
	linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com
Subject: Re: [PATCH] usb: common: add driver for USB Billboard devices
Message-ID: <ZcJQuwfXctmzZ+HX@kuha.fi.intel.com>
References: <20240206125623.1208161-1-niklas.neronin@linux.intel.com>
 <2024020641-relation-embattled-1fb5@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024020641-relation-embattled-1fb5@gregkh>

On Tue, Feb 06, 2024 at 02:47:04PM +0000, Greg KH wrote:
> On Tue, Feb 06, 2024 at 02:56:23PM +0200, Niklas Neronin wrote:
> > This patch introduces the USB Billboard Driver. Its purpose is to display,
> > via debugfs, basic information about connected Billboard devices.
> 
> Very cool, I was wondering if/when someone was going to write a kernel
> driver for this type of hardware.
> 
> But why debugfs?  Normally that is locked down for root-access-only by
> the system (rightfully so), why is this information restricted?
> 
> And why is this a kernel driver at all?  Why can't you just do this in
> userspace and add support to 'lsusb' for it?

I'm to blame for that. I wanted a way to see the billboard information
when something goes wrong with the alt mode entry in an environment
where I don't necessarily have tools like lsusb - I think I need to
include usbtools package to my Buildroot to get that app. I also
proposed debugfs, because for me this would be purely for debugging
purposes.

Later I was hoping to use this information in the Type-C drivers to
help in situations where the alt mode entry fails and UCSI does not
give any information about the partner (which unfortunately is the
reality on several platforms).

This is really just a proposal - perhaps we should have started with
RFC first. But I think Niklas has done a great job in any case.


thanks,

-- 
heikki

