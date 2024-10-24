Return-Path: <linux-usb+bounces-16642-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B5C9AE977
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 16:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1183B2860A8
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 14:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDE51E6316;
	Thu, 24 Oct 2024 14:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QRnC359m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A1F1DD0E6
	for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2024 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729781790; cv=none; b=G4iHdbihQ+A6ZtOIIz0eHZIsPwiUC+eu1KmN0/L/+oTu/dEhBh/+LEj36rmocBm6WDKuhddqFVB5UCapRLsROKsQE0ui/FiVRZVDquAk4dCARTUNf4/4384RmLbOcv0qZtAHG5MBL9YwqQf2sLcVzMtErw8WYL4DcqUB5qORnkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729781790; c=relaxed/simple;
	bh=fvydUNH5OqPdgkR+nuoFXoOarK4qyDG7AJ4USWdYb04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0tBFCPu6tNnJDSDi+1croM0H1VU9ZNIVQdO4hnoXl0V2xyuDr2oEuLln2fnNKXhj1uqMKNuxhoeJQ9k0U/ncCFd/NGzqdDiRWhhEDtkpKIfiEXzpCHkRxlUAgzhMfzcHf5tXviTGpqE35dTyLP5hq/+Xe7b9nKST4mNoLrKKhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRnC359m; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729781789; x=1761317789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fvydUNH5OqPdgkR+nuoFXoOarK4qyDG7AJ4USWdYb04=;
  b=QRnC359mXY2mu6ZuE34r4fs78pcHvtLPFfPGTSlVc+/kzTBlCoPCiyKq
   Nq4cwrBml6rJ2i8aRv7fRZXcvRKyJCI71omJ3yOeCS6cw9a909kaIl0Hn
   PcScfsPhNpF40EUAoHY8Ixd/IXyliOb+JfxE57RUSBRFvRMOH6A9OQGBB
   68RekuRw0LyRU+OfTr64lS7QMPyb3UwVgxfrEBkp9cMky51RqgznLbXLf
   HtpQh6ROxnlu0SEGet5QW88CZBR7pGu4hkraRatNQm9xx+4sQEU0hRMFy
   5kKtZREs0jDJOND5sL04qPTvKVJ+6JuGBPQOWMh/BGoGFrBtquaFzEbVG
   Q==;
X-CSE-ConnectionGUID: M4lI89gUTeWGwPSNyQxzgQ==
X-CSE-MsgGUID: k1aFQMwPSTKGmHr927nlPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="33212912"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="33212912"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 07:56:28 -0700
X-CSE-ConnectionGUID: E2DQDiugRC2hgSeDlGkbxQ==
X-CSE-MsgGUID: ivDLRGSsQGeV4uqLfqp6DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="81427736"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 24 Oct 2024 07:56:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id B8066252; Thu, 24 Oct 2024 17:56:24 +0300 (EEST)
Date: Thu, 24 Oct 2024 17:56:24 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v2] usb: acpi: fix boot hang due to early incorrect
 'tunneled' USB3 device links
Message-ID: <20241024145624.GI275077@black.fi.intel.com>
References: <20241024131355.3836538-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241024131355.3836538-1-mathias.nyman@linux.intel.com>

On Thu, Oct 24, 2024 at 04:13:55PM +0300, Mathias Nyman wrote:
> Fix a boot hang issue triggered when a USB3 device is incorrectly assumed
> to be tunneled over USB4, thus attempting to create a device link between
> the USB3 "consumer" device and the USB4 "supplier" Host Interface before
> the USB4 side is properly bound to a driver.
> 
> This could happen if xhci isn't capable of detecting tunneled devices,
> but ACPI tables contain all info needed to assume device is tunneled.
> i.e. udev->tunnel_mode == USB_LINK_UNKNOWN.
> 
> It turns out that even for actual tunneled USB3 devices it can't be
> assumed that the thunderbolt driver providing the tunnel is loaded
> before the tunneled USB3 device is created.
> The tunnel can be created by BIOS and remain in use by thunderbolt/USB4
> host driver once it loads.
> 
> Solve this by making the device link "stateless", which doesn't create
> a driver presence order dependency between the supplier and consumer
> drivers.
> It still guarantees correct suspend/resume and shutdown ordering.
> 
> cc: Mario Limonciello <mario.limonciello@amd.com>
> Fixes: f1bfb4a6fed6 ("usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface")
> Tested-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

