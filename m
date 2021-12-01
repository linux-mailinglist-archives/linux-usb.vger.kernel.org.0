Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B39746475C
	for <lists+linux-usb@lfdr.de>; Wed,  1 Dec 2021 07:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241205AbhLAGu2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Dec 2021 01:50:28 -0500
Received: from mga05.intel.com ([192.55.52.43]:3312 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229492AbhLAGu1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Dec 2021 01:50:27 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="322642170"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; 
   d="scan'208";a="322642170"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2021 22:47:07 -0800
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; 
   d="scan'208";a="560211530"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2021 22:47:04 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 01 Dec 2021 08:47:01 +0200
Date:   Wed, 1 Dec 2021 08:47:01 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Yehezkel Bernat <yehezkelshb@gmail.com>
Cc:     Lukas Wunner <lukas@wunner.de>,
        USB list <linux-usb@vger.kernel.org>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 2/6] thunderbolt: Tear down existing tunnels when
 resuming from hibernate
Message-ID: <YacaZaTWr3Tyivu8@lahna>
References: <20211125073733.74902-1-mika.westerberg@linux.intel.com>
 <20211125073733.74902-3-mika.westerberg@linux.intel.com>
 <20211126200150.GA21796@wunner.de>
 <YaRy6+3rwJx6YcKn@lahna>
 <CA+CmpXug9u2kVgLOgk2WaipQOMWjihYo2OwU61ghopUG1_iHhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CmpXug9u2kVgLOgk2WaipQOMWjihYo2OwU61ghopUG1_iHhw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, Nov 30, 2021 at 08:25:40PM +0200, Yehezkel Bernat wrote:
> On Mon, Nov 29, 2021 at 8:30 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > Hi,
> >
> > On Fri, Nov 26, 2021 at 09:01:50PM +0100, Lukas Wunner wrote:
> > > On Thu, Nov 25, 2021 at 10:37:29AM +0300, Mika Westerberg wrote:
> > > > If the boot firmware implements connection manager of its own it may not
> > > > create the paths in the same way or order we do. For example it may
> > > > create first PCIe tunnel and the USB3 tunnel. When we restore our
> 
> the -> then?
> 
> > > > tunnels (first de-activating them) we may be doing that over completely
> > > > different tunnel and that leaves them possible non-functional. For this
> 
> tunnel -> tunnels? possible -> possibly?

Indeed, I'll fix those :)

> 
> > > > reason we re-use the tunnel discovery functionality and find out all the
> > > > existing tunnels, and tear them down. Once that is done we can restore
> > > > our tunnels.
> > >
> > > Hm, what if the system is running from a Thunderbolt-attached drive?
> > > Will the mount points survive tearing down and re-establishing the
> > > tunnels to that drive?
> >
> > Yes, they should. PCI is waiting for the TBT to resume so it should not
> > notice this, and all the data is at point still synced out to the disks.
> 
> But the user will notice the screen flashing, probably?

They will notice flashing anyway because we jump from one kernel to
another (as this is suspend-to-disk which involves shutting down the
machine and booting to "fresh" resume kernel first). We actually tear
down all the DP tunnels before we even enter suspend-to-disk (see
81a2e3e49f1f ("thunderbolt: Tear down DP tunnels when suspending")).

> Maybe we can continue using the already established tunnels after
> discovering them?

Yes we could but that would require us to map the existing tunnels with
the ones we had prior, and also indentify any new tunnels or missing
ones. This makes it more complex, and the approach here seem to work
according to my testing :) I can look for that solution too if you think
it is necessary.

> Is this because the FW might not support the same set of functionality?

Yes, that too.
