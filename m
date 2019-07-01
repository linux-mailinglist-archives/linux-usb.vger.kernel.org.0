Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D493D2DA6C
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2019 12:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbfE2KYl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 May 2019 06:24:41 -0400
Received: from mga09.intel.com ([134.134.136.24]:11595 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbfE2KYk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 May 2019 06:24:40 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 May 2019 03:24:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,526,1549958400"; 
   d="scan'208";a="179534587"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga002.fm.intel.com with ESMTP; 29 May 2019 03:24:38 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Ran Wang <ran.wang_1@nxp.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list\:DESIGNWARE USB3 DRD IP DRIVER" 
        <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree\@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH] usb: dwc3: Enable the USB snooping
In-Reply-To: <AM5PR0402MB2865AB6C2A50851B7EA4E653F11F0@AM5PR0402MB2865.eurprd04.prod.outlook.com>
References: <20171115060459.45375-1-ran.wang_1@nxp.com> <87ineb9b5v.fsf@linux.intel.com> <VI1PR04MB1504776EF3D4D8C374F0C069F1290@VI1PR04MB1504.eurprd04.prod.outlook.com> <87shdfet90.fsf@linux.intel.com> <AM5PR0402MB28654EBE2D431CC2F8061CF8F11E0@AM5PR0402MB2865.eurprd04.prod.outlook.com> <87k1eaanjw.fsf@linux.intel.com> <AM5PR0402MB2865AB6C2A50851B7EA4E653F11F0@AM5PR0402MB2865.eurprd04.prod.outlook.com>
Date:   Wed, 29 May 2019 13:24:37 +0300
Message-ID: <874l5dr21m.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Ran Wang <ran.wang_1@nxp.com> writes:
>> >> >> c) WHAT does this mean for PCI devices?
>
> According to DWC3 data book, I think this (PCI) mean to the case of 'master bus type = Native'
> The data book describes this feature as 'system bus DMA option for the master bus,
> which may be configured as AHB, AXI, or Native.' On Table 6-5, it says when MBUS_TYPE
> is Native, the definition of 4 transfer types control bits [3-0] is 'Same as AXI'.
>
> However, as to the code implementation to be generic to both PCI and AXI,
> I admit I don't have a perfect solution so far, only 2 proposals with concerns:
>
> a. Create another module driver like dwc3-exynos.c (arch/arm/boot/dts/wxynos54xx.dtsi)
>     to contain above programming code. However, it will touch the same reg range of DWC3
>     I think this is not good.

I'd prefer avoiding another glue :-)

> b. Add #ifdef CONFIG_ARCH_LAYERSCAPE in drivers/usb/dwc3/core.c to constrain hacking code
>    can only take effect for Layerscape (AXI case). I know it look ugly.
>
> Do you have any better advice on this (besides changed power on default value from HW perspective)?

Maybe we don't need to care, actually. Since this property will only be
needed for RTL instantiation that didn't configure these defaults
properly during coreConsultant.

>> >> >> Another question is: Why wasn't this setup properly during
>> >> >> coreConsultant instantiation of the RTL? Do you have devices on
>> >> >> the market already that need this or is this some early FPGA model
>> >> >> or test-only
>> >> ASIC?
>
> Several Layerscape platforms like LS1043ARDB, LS1046ARDB, etc. are already on
> the market and have this issue. So I have to work out a SW patch to fix them.

Thank you, now I'm certain that this is not some temporary solution :-)

Thanks for going through this again. Please refresh the patch so we can
try to get it merged.

-- 
balbi
