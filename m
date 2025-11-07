Return-Path: <linux-usb+bounces-30187-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 30879C3EECD
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 09:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1A1224EE1D5
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 08:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE2830F537;
	Fri,  7 Nov 2025 08:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFwNbtrU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5CD274B2A
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 08:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762503439; cv=none; b=vA7XzC9w89nAaM2PozJk28jWZB7kYndPhxVc0tP2ysfPmA7QGeCBF2eSP0LGP1BLhXnjVOR0BFQ5ExCgHT8oJdWNlZ98Jd8iAYrF/q4UtUfec0e3OKFOzp96+3qw/GW897cQsk8mMyiHfL8TSUFxLXDSU6UOezg6LcZQsU/hec8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762503439; c=relaxed/simple;
	bh=yHCLLs5tB+dgOtQyIcCZazTksJTYOVDmw9DxGRqQDnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWTY5osPfa/fkdIeGDjHVuNb42rwF5VFxlO3hTAoqlyHdzNos9S21uDbu/aLD5ESYcFvu8VOHnMRRzLARvUqRRiN68jj4Bivl/6lNifYpMg17iwmB2Z5yZyBw02ExSKCfk+b3j4F7yniXUlBv4sHTkI+xDI7Nqi3uoqH66JgksQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFwNbtrU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762503431; x=1794039431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yHCLLs5tB+dgOtQyIcCZazTksJTYOVDmw9DxGRqQDnE=;
  b=iFwNbtrUD2DHE2hLILQZ4tlrqV4zVqcvKDL31vZCmvIcbn3o5ZT3vyef
   y+UhsHqu6oO7xJJz601luK/WZQaviGh2JE3GXk89thEvdnxqkIutXVOA3
   nDSa4ShnIDaxcvwmC8G6v+6V+h8jazYUeEnPxNZ19JKqWuDOLy1EZQ8+7
   QYTIp0rZJ3LMN4VIoVJ1mnt9Ht/mhnajOmeBzGT6UpiBo5ni8fR/PZFrC
   JEy/7JEi3oio0jTemWM/mFljkWSQ8enUWisgNAodE4nsx+P4woPanUT9c
   ZMrvjHAliU02L2sa8WsQviW+PxuEk6WyVpaove6bK/jADNrwwXo8h0wDA
   g==;
X-CSE-ConnectionGUID: 0HKiVXb8R1W6vhjpCdBcgQ==
X-CSE-MsgGUID: S5Gg+Q+qQoWKuBlZOnypTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64805090"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="64805090"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 00:17:08 -0800
X-CSE-ConnectionGUID: SMcDCencTsyGPMg7a5QPEg==
X-CSE-MsgGUID: r9PQJzSxRYG/uza/qRyY7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="193151034"
Received: from mjruhl-desk.amr.corp.intel.com (HELO kuha.fi.intel.com) ([10.124.222.72])
  by orviesa005.jf.intel.com with SMTP; 07 Nov 2025 00:17:05 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 07 Nov 2025 10:17:04 +0200
Date: Fri, 7 Nov 2025 10:17:04 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: pci: add support for the Intel Nova Lake -S
Message-ID: <aQ2q4seXxTnDnBIc@kuha.fi.intel.com>
References: <20251106115926.2317877-1-heikki.krogerus@linux.intel.com>
 <20251107001752.pr5mntqbrztgzkm5@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107001752.pr5mntqbrztgzkm5@synopsys.com>

Fri, Nov 07, 2025 at 12:18:05AM +0000, Thinh Nguyen kirjoitti:
> On Thu, Nov 06, 2025, Heikki Krogerus wrote:
> > This patch adds the necessary PCI ID for Intel Nova Lake -S
> > devices.
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >  drivers/usb/dwc3/dwc3-pci.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
> > index 39c72cb52ce7..c2bab6d4d507 100644
> > --- a/drivers/usb/dwc3/dwc3-pci.c
> > +++ b/drivers/usb/dwc3/dwc3-pci.c
> > @@ -53,6 +53,7 @@
> >  #define PCI_DEVICE_ID_INTEL_MTLP		0x7ec1
> >  #define PCI_DEVICE_ID_INTEL_MTLS		0x7f6f
> >  #define PCI_DEVICE_ID_INTEL_MTL			0x7e7e
> > +#define PCI_DEVICE_ID_INTEL_NVLS_PCH		0x6e6f
> 
> The list here doesn't follow any order. Is the placement arbitrary?
> 
> >  #define PCI_DEVICE_ID_INTEL_ARLH_PCH		0x777e
> >  #define PCI_DEVICE_ID_INTEL_TGL			0x9a15
> >  #define PCI_DEVICE_ID_INTEL_PTLH		0xe332
> > @@ -443,6 +444,7 @@ static const struct pci_device_id dwc3_pci_id_table[] = {
> >  	{ PCI_DEVICE_DATA(INTEL, MTLM, &dwc3_pci_intel_swnode) },
> >  	{ PCI_DEVICE_DATA(INTEL, MTLP, &dwc3_pci_intel_swnode) },
> >  	{ PCI_DEVICE_DATA(INTEL, MTL, &dwc3_pci_intel_swnode) },
> > +	{ PCI_DEVICE_DATA(INTEL, NVLS_PCH, &dwc3_pci_intel_swnode) },
> >  	{ PCI_DEVICE_DATA(INTEL, MTLS, &dwc3_pci_intel_swnode) },
> >  	{ PCI_DEVICE_DATA(INTEL, ARLH_PCH, &dwc3_pci_intel_swnode) },
> >  	{ PCI_DEVICE_DATA(INTEL, TGL, &dwc3_pci_intel_swnode) },
> 
> It bugs me a little how this list doesn't match the order of the product
> IDs above either.

You are correct. I'll prepeare a separate patch where I'll sort them
properly.

> > -- 
> > 2.50.1
> > 
> 
> Regardless,
> 
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

thanks,

-- 
heikki

