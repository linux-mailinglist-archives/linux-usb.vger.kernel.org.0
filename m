Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2292D2E3FF1
	for <lists+linux-usb@lfdr.de>; Mon, 28 Dec 2020 15:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731557AbgL1Oqc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Dec 2020 09:46:32 -0500
Received: from mga14.intel.com ([192.55.52.115]:6548 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408024AbgL1OqW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Dec 2020 09:46:22 -0500
IronPort-SDR: TtIpk5NfwJgqL2JEuHN225EScOPu3KMuc12F0xr9LYO4WeBRK5ZQivDw3Hw2DcmeKiEvvqCPVe
 SPGGctJCIQvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9847"; a="175613063"
X-IronPort-AV: E=Sophos;i="5.78,455,1599548400"; 
   d="scan'208";a="175613063"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2020 06:44:36 -0800
IronPort-SDR: XJbZgK8zzlKf/t4uy+1ArNJIz8Vup61SoIFih0ko9erElpIycQ894vWhp3AtS7SuWORWXSAAkc
 vr2dB7MxMYIQ==
X-IronPort-AV: E=Sophos;i="5.78,455,1599548400"; 
   d="scan'208";a="418831694"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2020 06:44:34 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kttmC-000EVo-NB; Mon, 28 Dec 2020 16:45:36 +0200
Date:   Mon, 28 Dec 2020 16:45:36 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Brad Campbell <brad@fnarfbargle.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: Patch "usb: hcd: Try MSI interrupts on PCI devices" breaks
 usb-audio on my machine
Message-ID: <20201228144536.GX4077@smile.fi.intel.com>
References: <ad10644a-ac7f-d2e5-304c-edb5d2f0d0a0@fnarfbargle.com>
 <20201228144230.GW4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201228144230.GW4077@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 28, 2020 at 04:42:30PM +0200, Andy Shevchenko wrote:
> On Mon, Dec 28, 2020 at 07:19:49PM +0800, Brad Campbell wrote:
> > G'day Andy,
> > 
> > Commit 306c54d0edb6ba94d39877524dddebaad7770cf2 in kernel 5.9 breaks
> > usb-audio on my machine.
> > 
> > I have a 2011 iMac with a pair of Apple Thunderbolt displays. Both Thunderbolt
> > displays have internal usb-audio devices. This patch causes the audio to stutter
> > terribly. Reverting it resolves the issue on any kernel up to and
> > including 5.10.3.
> > 
> > Booting with pci=nomsi fixes the audio issues, but causes all sorts of
> > other problems (like broken Thunderbolt display routing), so that's a non-starter.
> > 
> > The usb audio devices would appear to be on the Pericom USB controllers in the displays.
> > It wouldn't be the first peculiarity I've had on this machine due to the early Thunderbolt
> > implementation.
> > 
> > The issue is pretty much identical with the sound card on both monitors.
> 
> Thanks for the report!
> 
> Funny that previous mail in my mailbox is exactly about this issue for
> PI7C9X440SL, i.e. fix [1] I made for v5.11 and Sasha ported to v5.10
> (mentioned previous mail). Can you try to apply [1] and confirm issue gone?
> 
> [1]: f83c37941e88 ("PCI: Disable MSI for Pericom PCIe-USB adapter")

For your convenience the URL to the actual commit:
https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/commit/?id=f83c37941e88

-- 
With Best Regards,
Andy Shevchenko


