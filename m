Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD78227CF1
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jul 2020 12:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbgGUK2Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 06:28:16 -0400
Received: from mga05.intel.com ([192.55.52.43]:63705 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726147AbgGUK2P (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Jul 2020 06:28:15 -0400
IronPort-SDR: QQOEnFijz4Bc3b868Npk25Bd776LRqWg6V5zbM9VhWxUgB80Eleqk64rtUJolOIxEU/LO1sj1r
 ea7rimFMyIkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9688"; a="234955761"
X-IronPort-AV: E=Sophos;i="5.75,378,1589266800"; 
   d="scan'208";a="234955761"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2020 03:28:15 -0700
IronPort-SDR: 4UnjKIxfyYc24VPUVNUY3/OkKqgQg8O4CwTORCUwG15mJPmaGdy448oZwVPYt1mK9QLb7+hR7j
 PWhr0cbd7Z/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,378,1589266800"; 
   d="scan'208";a="392308817"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 21 Jul 2020 03:28:13 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 21 Jul 2020 13:28:12 +0300
Date:   Tue, 21 Jul 2020 13:28:12 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     "Kenneth R. Crudup" <kenny@panix.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: I get a new Thunderbolt domain UUID on every boot
Message-ID: <20200721102812.GX5180@lahna.fi.intel.com>
References: <alpine.DEB.2.23.453.2007051446170.4280@xps-7390>
 <20200720100723.GW5180@lahna.fi.intel.com>
 <alpine.DEB.2.23.453.2007200527070.3171@xps-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.23.453.2007200527070.3171@xps-7390>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 20, 2020 at 05:43:05AM -0700, Kenneth R. Crudup wrote:
> 
> Thank you for getting back to me.
> 
> On Mon, 20 Jul 2020, Mika Westerberg wrote:
> 
> > It is done on purpose. The BIOS generates new UUID every boot.
> 
> I see. This leads to a couple of follow-on questions, then:
> 
> There are two "competing" Linux packages for controlling/admining TB,
> "bolt" (which includes "boltctl") and "thunderbolt-tools" (which includes
> "tbtadm". I used to have both installed but I think they sometimes get
> in each other's way and settled on "thunderbolt-tools" as "bolt" was
> leaving large numbers of UUID-related files over time.
> 
> - Do you have a preference for either?

bolt

I suggest to report this to bolt upstream.

> I've noticed that I can't seem to get IOMMU protection unless I boot
> with Secure Boot on in my BIOS (which I never use, as I don't sign my
> own kernels). IOMMU/DMAR is on in my kernel.
> 
> - Is there any way to force this, or is this expected? I don't get the
> "iommu_dma_protection" set on my controllers either.

It depends on the system. The kernel expects that you have ACPI DMAR
table with bit 2 set (platform opt-in). Some systems I have seen have
"Native Security for Thunderbolt" or similar BIOS option that can be
used to enable this and others have it enabled by default.

> Finally, every now and then on a reboot, my TB dock "flaps" (repeatedly
> connects and disconnects) and I have to either connect/reconnect the TB3
> cable, or initate a power-off. I suspect this is a BIOS bug (I also have
> to set "intel_iommu=igfx_off" otherwise I get "DMA Hardware is malfunctioning"
> errors on power-down (or hibernate)).
> 
> - Have you seen this before or have any ideas?

Not seen before, but IIRC some laptops require more power than what the
dock can supply and the symptoms for that are similar that the
connection goes down and then back up several times.
