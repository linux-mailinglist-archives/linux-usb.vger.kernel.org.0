Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECBE82A06BC
	for <lists+linux-usb@lfdr.de>; Fri, 30 Oct 2020 14:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgJ3Nrr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Oct 2020 09:47:47 -0400
Received: from mga04.intel.com ([192.55.52.120]:33881 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725939AbgJ3Nrr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Oct 2020 09:47:47 -0400
IronPort-SDR: kat6Ku4RuaPmKkOgjtlLqQRRQcQJ31XHJGWuhGoT/IWgcfbAxpi2DxErJxX6tDyHhrSGmqaoU5
 HbB3Gf2ygITQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="166020660"
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; 
   d="scan'208";a="166020660"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2020 06:47:47 -0700
IronPort-SDR: zoUKo1FtT17ECLW2HKOd9eWzcHCd2YY0wbjYcv8h0/wYHerjM+FAAWC/qAJyeFl9EYDPWNRRvA
 xP3IETLCx2TA==
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; 
   d="scan'208";a="319324274"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2020 06:47:24 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kYUlW-002OC8-VT; Fri, 30 Oct 2020 15:48:26 +0200
Date:   Fri, 30 Oct 2020 15:48:26 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     alberto.vignani@fastwebnet.it
Cc:     support3@ftdichip.com, kuba@mareimbrium.org, johan@kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: BUG Found, was: USB-Serial FT4232H unusable with kernel 5.9.x
Message-ID: <20201030134826.GP4077@smile.fi.intel.com>
References: <21357769.49031603989896975.JavaMail.root@pr006msr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21357769.49031603989896975.JavaMail.root@pr006msr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 29, 2020 at 05:44:56PM +0100, alberto.vignani@fastwebnet.it wrote:
> By bisecting the regression I found that the FT4232 was only an innocent bystander. The real culprit was the PCIe-USB adapter that stopped sending interrupts (or sent wrong interrupts) in kernel 5.9. I have just removed the whole patch and my system is working again as in 5.8.I hope that someone will revise this patch considering that the Pericom PI7C9X440SL is affected by it.

Thank you for the report!

Can you share output of

	% lspci -vvv -nk -s <XXX> # where <XXX> is a slot of PCIe USB

for working and non-working cases?


> Here's the commit responsible:

> commit 306c54d0edb6 usb: hcd: Try MSI interrupts on PCI devices

This commit per se should not affect devices which rightfully announce MSI
support. It is possible that I have missed something or above mentioned device
is not MSI compatible.

Btw, can this PCIe-USB be connected to completely different motherboard /
machine for a testing purposes? It might be that PCI host bridge is not
friendly with the device or other way around.

...

> With 5.9 I noticed that these delays are dependent on how the ports are mapped t o linux devices:- if I remove the JTAG
>  quirk and allow all ports to be connected to ttyUSBs, there seems to 
> be no delay before the first message: 33 usec as in linux 5.8.  Of course I cannot then configure the first two ports for JTAG (FTOpen fails).
> - conversely, if I 
> remove the ftdi_sio module (with all ttyUSB devices) the initial delay 
> is even longer (7.6 seconds), and then the (slow) JTAG configuration s ucceeds.
>  Can someone confirm and investigate? Does the same happen with ST Micro Connect Lite?
> And how can I debug this one?

Can you also monitor /proc/interrupts for working and non-working cases?
Simply share its contents as well.

-- 
With Best Regards,
Andy Shevchenko


