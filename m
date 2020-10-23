Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D43B2969EC
	for <lists+linux-usb@lfdr.de>; Fri, 23 Oct 2020 08:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S375428AbgJWGtM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Oct 2020 02:49:12 -0400
Received: from mga07.intel.com ([134.134.136.100]:13317 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S373223AbgJWGtM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Oct 2020 02:49:12 -0400
IronPort-SDR: gO43Q310XusYyh2yHmbAtrvtlTcnj4xfA/XLfpyJ00Hhm156lME5YnzT1089CSdjiKN6FIT7tj
 zvHvdaGwXbFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="231829839"
X-IronPort-AV: E=Sophos;i="5.77,407,1596524400"; 
   d="scan'208";a="231829839"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2020 23:49:00 -0700
IronPort-SDR: ykeTLw1IxWW2G/uQJZNGxcMhPHeZHCNqzepoHGYcvWUZl3PsZ4o+UOnRds6ZVim3Poo0GHL53e
 x4GiS1dmH6qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,407,1596524400"; 
   d="scan'208";a="423340790"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 22 Oct 2020 23:48:56 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 23 Oct 2020 09:48:55 +0300
Date:   Fri, 23 Oct 2020 09:48:55 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     "Dmitry N. Mikushin" <maemarcus@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Any example of USB gadget for DRD device mode on Intel Gemini
 Lake?
Message-ID: <20201023064855.GR1667571@kuha.fi.intel.com>
References: <CAGR4S9HQiZCsA7Y5_47j-xBOkydKiT2Exam=36L=-vwRjt+UWA@mail.gmail.com>
 <20201019133607.GC1667571@kuha.fi.intel.com>
 <CAGR4S9F1wdUyywuBxcMYfH9wMa91xw1rL8dmZrhJrGSGbmgbzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGR4S9F1wdUyywuBxcMYfH9wMa91xw1rL8dmZrhJrGSGbmgbzg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 22, 2020 at 11:06:59PM +0200, Dmitry N. Mikushin wrote:
> Yes, AFAIK PCI_DEVICE_ID_INTEL_GLK_XHCI is actually 0x31a8, and I do have it:
> 
> 00:15.0 USB controller [0c03]: Intel Corporation Device [8086:31a8] (rev 03)

That is the xHCI controller, and it is not what you need if you want
to use the connector in device mode. The xHCI and DWC3 IPs are
separate IPs on GLK. That is why there is a mux between the two. The
dwc3 USB device controller has device ID 31aa, so you want to see a
PCI device with the device ID. It's not there.

So the dwc3 PCI device is not enabled on your board, which means you
do not have USB device controller to deal with. The connector is in
host mode only. Sorry.

If you can enter the BIOS menu, then you can try to find an option
named XDCI (so that's "XDCI" not "xHCI"). It is usually somewhere
under some USB menu. If you have that, then enable it, and you should
see the dwc3 PCI device in the operating system.

Br,

-- 
heikki
