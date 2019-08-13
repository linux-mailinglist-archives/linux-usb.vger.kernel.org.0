Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA3878B8A2
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2019 14:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbfHMMgK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Aug 2019 08:36:10 -0400
Received: from mga01.intel.com ([192.55.52.88]:54703 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726993AbfHMMgK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 13 Aug 2019 08:36:10 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 05:36:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; 
   d="scan'208";a="167040835"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga007.jf.intel.com with ESMTP; 13 Aug 2019 05:36:07 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Rick Tseng <rtseng@nvidia.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Oliver Neukum <oneukum@suse.com>,
        "mathias.nyman\@intel.com" <mathias.nyman@intel.com>,
        "gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] xhci: wait CNR when doing xhci resume
In-Reply-To: <MN2PR12MB3215AA4B411231FC2D67E81FB1D20@MN2PR12MB3215.namprd12.prod.outlook.com>
References: <1565594692-23683-1-git-send-email-rtseng@nvidia.com> <1565597989.14671.3.camel@suse.com> <47f0e5d6-145c-4542-362f-dbb4cccb514d@linux.intel.com> <MN2PR12MB3215AA4B411231FC2D67E81FB1D20@MN2PR12MB3215.namprd12.prod.outlook.com>
Date:   Tue, 13 Aug 2019 15:36:06 +0300
Message-ID: <87ef1pz1hl.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


(no top-posting, please)

Hi,

Rick Tseng <rtseng@nvidia.com> writes:

> Hi Mathias,
>
> Thanks for suggestion.
> The reason I do not use xhci_handshake() is we get build fail when configuring below as module:
> USB_XHCI_HCD = m
> USB_XHCI_PCI = m
>
> Fail message as below:
> ERROR: "xhci_handshake" [drivers/usb/host/xhci-pci.ko] undefined!
>
> So I write my own function to check CNR.

yeah, move that code to xhci_suspend(). It's valid for any XHCI host.

-- 
balbi
