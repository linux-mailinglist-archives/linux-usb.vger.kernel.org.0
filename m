Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9068042D949
	for <lists+linux-usb@lfdr.de>; Thu, 14 Oct 2021 14:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbhJNM31 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Oct 2021 08:29:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:44762 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230299AbhJNM30 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 Oct 2021 08:29:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E12F60E97;
        Thu, 14 Oct 2021 12:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634214442;
        bh=+N34PPWZCJM29r4WsohkvC/MMzcC4vsf5BYt4w0IV8Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mwlAnzObw+nDGUXRTHlanJd8TICiNGSG4KSCwWiPrqSXrBs9R6a0+F1C3gfd35Ds2
         dZjWs68+9XnqmE/jv89JJ2Im8Av5qNriaGpXPx/qdln5+8ACDWDfUTsQqyyQYen4Hd
         Ixz5F3WzN2kxhHCPhiDM0+uUUjfz8lsM3y/y9ojk=
Date:   Thu, 14 Oct 2021 14:27:18 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: Re: [PATCH 1/1] usb: xhci: Enable runtime-pm by default on AMD
 Yellow Carp platform
Message-ID: <YWgiJig8t2bRydxG@kroah.com>
References: <20211013151633.67355-1-mathias.nyman@linux.intel.com>
 <20211013151633.67355-2-mathias.nyman@linux.intel.com>
 <YWcMkCR0U/sWGujD@kroah.com>
 <94f2ecef-94a8-6da5-95a6-ed12f6820b54@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94f2ecef-94a8-6da5-95a6-ed12f6820b54@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 14, 2021 at 03:03:22PM +0300, Mathias Nyman wrote:
> On 13.10.2021 19.42, Greg KH wrote:
> > On Wed, Oct 13, 2021 at 06:16:33PM +0300, Mathias Nyman wrote:
> >> From: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
> >>
> >> AMD's Yellow Carp platform supports runtime power management for
> >> XHCI Controllers, so enable the same by default for all XHCI Controllers.
> >>
> >> Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
> >> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> >> Reviewed-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> >> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> >> ---
> >>  drivers/usb/host/xhci-pci.c | 15 +++++++++++++++
> >>  1 file changed, 15 insertions(+)
> >>
> >> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> >> index 2c9f25ca8edd..0e571d6af2ab 100644
> >> --- a/drivers/usb/host/xhci-pci.c
> >> +++ b/drivers/usb/host/xhci-pci.c
> >> @@ -69,6 +69,12 @@
> >>  #define PCI_DEVICE_ID_ASMEDIA_1142_XHCI			0x1242
> >>  #define PCI_DEVICE_ID_ASMEDIA_2142_XHCI			0x2142
> >>  #define PCI_DEVICE_ID_ASMEDIA_3242_XHCI			0x3242
> >> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_1	0x161a
> >> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_2	0x161b
> >> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_3	0x161d
> >> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_4	0x161e
> >> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_5	0x15d6
> >> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_6	0x15d7
> > 
> > Please keep the ids aligned whenever possible.  Why is there not 2 tabs
> > being used here?
> 
> I'll fix that  and resend 

The original author should have fixed that up, but you are being nice :)
