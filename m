Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2666D292842
	for <lists+linux-usb@lfdr.de>; Mon, 19 Oct 2020 15:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727893AbgJSNgL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Oct 2020 09:36:11 -0400
Received: from mga11.intel.com ([192.55.52.93]:1543 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727297AbgJSNgL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Oct 2020 09:36:11 -0400
IronPort-SDR: aUXDBMHqHsfeQJWE4jsBbwO4QchpG+HdXueYsI/ziV35pDjqfBDUJWeaZkpMIoO1K+0Rl4Zqwb
 UgBNXjkeCZeQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9778"; a="163543497"
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
   d="scan'208";a="163543497"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2020 06:36:09 -0700
IronPort-SDR: DEDioaHQNQfGihUOZ2WZ6kdJ6QOT0PkV5nBkfI5GgCGodfqUcPmU+cmCtGOVJ9HSEdy4kQL/eR
 11TG78iD4vIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
   d="scan'208";a="422182289"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 19 Oct 2020 06:36:08 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 19 Oct 2020 16:36:07 +0300
Date:   Mon, 19 Oct 2020 16:36:07 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     "Dmitry N. Mikushin" <maemarcus@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Any example of USB gadget for DRD device mode on Intel Gemini
 Lake?
Message-ID: <20201019133607.GC1667571@kuha.fi.intel.com>
References: <CAGR4S9HQiZCsA7Y5_47j-xBOkydKiT2Exam=36L=-vwRjt+UWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGR4S9HQiZCsA7Y5_47j-xBOkydKiT2Exam=36L=-vwRjt+UWA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 19, 2020 at 01:27:35PM +0200, Dmitry N. Mikushin wrote:
> Dear All,
> 
> I'm confused by the USB gadget mode on the recent Intel SoCs, such as
> Gemini Lake. The /sys/class/udc is empty, and a SoC can't present
> itself as a IoT gadget this way, yet definitely being designed as
> such. I've noticed the concept of dual-role-device, which seems to
> replace the OTG. Particularly, Harry Pan mentioned that Gemini Lake
> supports DRD in port 0.

So do you have the dwc3 (the USB device controller) PCI device
available/visible on your system? What do you get if you run:

        lspci -nn|grep USB

The DWC3 PCI device ID on Gemini lake is 0x31aa (search
PCI_DEVICE_ID_INTEL_GLK in drivers/usb/dwc3/dwc3-pci.c).

Which board/product are you using.
Which kernel are you using?
Is the dwc3 driver enabled in your kernel?
Which gadget are you testing with? g_zero?

thanks,

-- 
heikki
