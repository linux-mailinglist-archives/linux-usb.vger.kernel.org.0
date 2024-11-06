Return-Path: <linux-usb+bounces-17228-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3013D9BF0BB
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 15:51:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43D2E1C23403
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 14:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6466F2036F9;
	Wed,  6 Nov 2024 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONKLNfQ5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AF0202F6A
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 14:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730904668; cv=none; b=cKwJRwRYToQy23z4EpCBEP8dwd2q7Vvn1jZrMX1PLJFqAfA4naI7a84QZlO7LVFKV/w8eOuSRU5OaHeu7CiBaplh5RIYS7x7n91DAnUQgSMgcR+atO7MMFxCO2xvryfRRRC1kdoWQRuV6U00Z22C9zZluLAEOp9ZVyq0816iEUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730904668; c=relaxed/simple;
	bh=zV9Pm4792cD2wjfsQXbFjvQE+K/H4e2yHTUN28sU4KU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYbK1nQ4Zqmz1T69TFwlIvtpntZNhAfd9L1DaGILflok2v6sWiOG5xHxoIBNmexFseBcSIp7YcY8HGVZYgbn3MEf3t752B/HCTpks+GXltyYPmQ0o8zAiP8i6lGm/DPWCWK4tepDxHRZKX+OOtqtnEG0WRhCLyB71Y2XiVjZ1Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONKLNfQ5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730904664; x=1762440664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zV9Pm4792cD2wjfsQXbFjvQE+K/H4e2yHTUN28sU4KU=;
  b=ONKLNfQ5spHw0Ea2dg0l2+DSfunQliG5t8ifPrVT1ou4lT4TYRYUWbze
   GzJf7pydxQc7glgrrUl/Zrt8O0dAkA1kKYd13Dh8DVgo3kE8BxSEJ9KsI
   515HusSkCk+t/OuEDN3FEImtTxSsKZ4/q8jvilj9B92UvW/GiPSPnbuyA
   O9Rm3BgDkkIYLDzSnzC3AfvYTOKRHeytD2VI9HRoK/Q8rpnZE3yGqPLy5
   0b6PXdqV8EjP5UM+E1BaFkQSHSC6e4EypP2/8Njet8Cpf5fcIjaFIlBF1
   2fW018FPzJp/VVRolcErfTmmG63zSdr6IL8MXfYGEhSxtfWFuuhXg5ik8
   w==;
X-CSE-ConnectionGUID: 5n6YBDVhST+eiz6khuny7w==
X-CSE-MsgGUID: DWDrhe63Q/O64ScMtYZmuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34405507"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34405507"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 06:51:04 -0800
X-CSE-ConnectionGUID: lgWhyEdfT3GOGtpPZMHo6g==
X-CSE-MsgGUID: IZ32KlCsRX6J7TYGauXIiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="89173271"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.97.183])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 06:51:01 -0800
Date: Wed, 6 Nov 2024 15:50:59 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v2 3/3] usb: misc: ljca: print firmware version
Message-ID: <ZyuCU/qVsLD8Symv@linux.intel.com>
References: <20241106123438.337117-1-stanislaw.gruszka@linux.intel.com>
 <20241106123438.337117-3-stanislaw.gruszka@linux.intel.com>
 <2024110620-dating-roman-f820@gregkh>
 <ZytxNk1DEiwiXJ5b@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZytxNk1DEiwiXJ5b@kekkonen.localdomain>

On Wed, Nov 06, 2024 at 01:37:58PM +0000, Sakari Ailus wrote:
> Hi Greg,
> 
> On Wed, Nov 06, 2024 at 01:42:33PM +0100, Greg KH wrote:
> > On Wed, Nov 06, 2024 at 01:34:38PM +0100, Stanislaw Gruszka wrote:
> > > For diagnostics purposes read firmware version from device
> > > and print it to dmesg during initialization.
> > 
> > No, sorry, when drivers work properly, they are quiet.  Think about what
> > your kernel log would look like if you did this for every single driver
> > in the tree.

Not single one, but there are plenty of drivers in the tree that
print driver/firmware/hardware version to the log. Few in the usb
subsystem:

drivers/usb/fotg210/fotg210-udc.c:      dev_info(dev, "version %s\n", DRIVER_VERSION);
drivers/usb/gadget/legacy/acm_ms.c:     dev_info(&gadget->dev, "%s, version: " DRIVER_VERSION "\n",
drivers/usb/gadget/legacy/cdc2.c:       dev_info(&gadget->dev, "%s, version: " DRIVER_VERSION "\n",
drivers/usb/gadget/legacy/ether.c:      dev_info(&gadget->dev, "%s, version: " DRIVER_VERSION "\n",
drivers/usb/gadget/legacy/hid.c:        dev_info(&gadget->dev, DRIVER_DESC ", version: " DRIVER_VERSION "\n");
drivers/usb/gadget/udc/fusb300_udc.c:   dev_info(&pdev->dev, "version %s\n", DRIVER_VERSION);
drivers/usb/gadget/udc/lpc32xx_udc.c:   dev_info(udc->dev, "%s version %s\n", driver_name, DRIVER_VERSION);
drivers/usb/gadget/udc/m66592-udc.c:    dev_info(&pdev->dev, "version %s\n", DRIVER_VERSION);
drivers/usb/gadget/udc/net2272.c:       dev_info(dev->dev, "version: %s\n", driver_vers);
drivers/usb/gadget/udc/net2272.c:       dev_info(dev->dev, "RDK2 FPGA version %08x\n",
drivers/usb/gadget/udc/r8a66597-udc.c:  dev_info(dev, "version %s\n", DRIVER_VERSION);
drivers/usb/gadget/udc/renesas_usbf.c:  dev_info(dev, "USBF version: %08x\n",
drivers/usb/host/xhci-mtk.c:    dev_info(mtk->dev, "uwk - reg:0x%x, version:%d\n",
drivers/usb/mtu3/mtu3_core.c:   dev_info(mtu->dev, "IP version 0x%x(%s IP)\n", mtu->hw_version,
drivers/usb/mtu3/mtu3_host.c:   dev_info(ssusb->dev, "uwk - reg:0x%x, version:%d\n",
drivers/usb/typec/ucsi/ucsi_ccg.c:              dev_info(dev, "secondary fw version is too low (< %d)\n",
drivers/usb/typec/ucsi/ucsi_ccg.c:              dev_info(dev, "found primary fw with later version\n");
drivers/usb/typec/ucsi/ucsi_stm32g0.c:          dev_info(g0->dev, "Flashing FW: %08x (%08x cur)\n", fw_info->version, fw_version);
drivers/usb/typec/ucsi/ucsi_stm32g0.c:  dev_info(g0->dev, "Bootloader Version 0x%02x\n", g0->bl_version);

> > > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > > Tested-by: Hans de Goede <hdegoede@redhat.com> # ThinkPad X1 Yoga Gen 8, ov2740
> > > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > > ---
> > >  drivers/usb/misc/usb-ljca.c | 29 +++++++++++++++++++++++++++++
<snip>

> > > +	}
> > > +
> > > +	dev_info(adap->dev, "Firmware version: %d.%d.%d.%d\n",
> > > +		 version.major, version.minor,
> > > +		 le16_to_cpu(version.patch), le16_to_cpu(version.build));
> > 
> > Again, sorry, but no.  Feel free to dump this in a sysfs file if you
> > really want to get access to it, but not in the kernel log.
> 
> I guess dev_dbg() should do as well.

I think that's better as we currently do not support sysfs in ljca,
so extra code would be needed.

Regards
Stanislaw

