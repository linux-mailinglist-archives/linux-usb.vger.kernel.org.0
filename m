Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83B112E3FAF
	for <lists+linux-usb@lfdr.de>; Mon, 28 Dec 2020 15:44:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503358AbgL1OnQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Dec 2020 09:43:16 -0500
Received: from mga04.intel.com ([192.55.52.120]:33641 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392309AbgL1OnP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Dec 2020 09:43:15 -0500
IronPort-SDR: s+2ifm1Log9zAqv8DJVy2nV9yEAiEh42cXcT8chVHQV7JfnXMucZJU6M2ugnDjSenP50NR8rSB
 jGiH0nofJHcg==
X-IronPort-AV: E=McAfee;i="6000,8403,9847"; a="173810166"
X-IronPort-AV: E=Sophos;i="5.78,455,1599548400"; 
   d="scan'208";a="173810166"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2020 06:41:29 -0800
IronPort-SDR: 6wSThdINNqqGiTNuIvXXSLMz/k2olhZeii0RDz3JKnqnTLFcINlsW3D6J4FHz9OHru4QNIubhj
 jYzOpM9Y22Xw==
X-IronPort-AV: E=Sophos;i="5.78,455,1599548400"; 
   d="scan'208";a="459788908"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2020 06:41:28 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kttjC-000EUB-Mw; Mon, 28 Dec 2020 16:42:30 +0200
Date:   Mon, 28 Dec 2020 16:42:30 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Brad Campbell <brad@fnarfbargle.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: Patch "usb: hcd: Try MSI interrupts on PCI devices" breaks
 usb-audio on my machine
Message-ID: <20201228144230.GW4077@smile.fi.intel.com>
References: <ad10644a-ac7f-d2e5-304c-edb5d2f0d0a0@fnarfbargle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad10644a-ac7f-d2e5-304c-edb5d2f0d0a0@fnarfbargle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 28, 2020 at 07:19:49PM +0800, Brad Campbell wrote:
> G'day Andy,
> 
> Commit 306c54d0edb6ba94d39877524dddebaad7770cf2 in kernel 5.9 breaks
> usb-audio on my machine.
> 
> I have a 2011 iMac with a pair of Apple Thunderbolt displays. Both Thunderbolt
> displays have internal usb-audio devices. This patch causes the audio to stutter
> terribly. Reverting it resolves the issue on any kernel up to and
> including 5.10.3.
> 
> Booting with pci=nomsi fixes the audio issues, but causes all sorts of
> other problems (like broken Thunderbolt display routing), so that's a non-starter.
> 
> The usb audio devices would appear to be on the Pericom USB controllers in the displays.
> It wouldn't be the first peculiarity I've had on this machine due to the early Thunderbolt
> implementation.
> 
> The issue is pretty much identical with the sound card on both monitors.

Thanks for the report!

Funny that previous mail in my mailbox is exactly about this issue for
PI7C9X440SL, i.e. fix [1] I made for v5.11 and Sasha ported to v5.10
(mentioned previous mail). Can you try to apply [1] and confirm issue gone?

[1]: f83c37941e88 ("PCI: Disable MSI for Pericom PCIe-USB adapter")


>            |                               +-04.0-[39-69]----00.0-[3a-44]--+-00.0-[3b-3d]----00.0-[3c-3d]----03.0-[3d]--+-00.0  Pericom Semiconductor PI7C9X442SL USB OHCI Controller
>            |                               |                               |                                            +-00.1  Pericom Semiconductor PI7C9X442SL USB OHCI Controller
>            |                               |                               |                                            \-00.2  Pericom Semiconductor PI7C9X442SL USB EHCI Controller

>            |                               +-05.0-[6a-9a]----00.0-[6b-72]--+-00.0-[6c-6e]----00.0-[6d-6e]----03.0-[6e]--+-00.0  Pericom Semiconductor PI7C9X442SL USB OHCI Controller
>            |                               |                               |                                            +-00.1  Pericom Semiconductor PI7C9X442SL USB OHCI Controller
>            |                               |                               |                                            \-00.2  Pericom Semiconductor PI7C9X442SL USB EHCI Controller

-- 
With Best Regards,
Andy Shevchenko


