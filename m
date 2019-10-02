Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E69BC49F0
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2019 10:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbfJBIt0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 04:49:26 -0400
Received: from mga11.intel.com ([192.55.52.93]:57077 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725799AbfJBIt0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Oct 2019 04:49:26 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Oct 2019 01:49:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,573,1559545200"; 
   d="scan'208";a="205281421"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 02 Oct 2019 01:49:21 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 02 Oct 2019 11:49:21 +0300
Date:   Wed, 2 Oct 2019 11:49:21 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Anthony Wong <anthony.wong@canonical.com>,
        Mario.Limonciello@dell.com,
        Andreas Noever <andreas.noever@gmail.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [RFC PATCH 17/22] thunderbolt: Add initial support for USB4
Message-ID: <20191002084921.GJ2714@lahna.fi.intel.com>
References: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
 <20191001113830.13028-18-mika.westerberg@linux.intel.com>
 <20191001124748.GH2954373@kroah.com>
 <20191001130905.GO2714@lahna.fi.intel.com>
 <20191001145354.GA3366714@kroah.com>
 <20191001150734.GA2714@lahna.fi.intel.com>
 <1569947262.2639.15.camel@suse.com>
 <20191002083034.GE2714@lahna.fi.intel.com>
 <20191002083954.GD1687317@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002083954.GD1687317@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 02, 2019 at 10:39:54AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Oct 02, 2019 at 11:30:34AM +0300, Mika Westerberg wrote:
> > On Tue, Oct 01, 2019 at 06:27:42PM +0200, Oliver Neukum wrote:
> > > Am Dienstag, den 01.10.2019, 18:07 +0300 schrieb Mika Westerberg:
> > > 
> > > Hi,
> > > 
> > > > OK, but does that break existing .configs? I mean if you have already
> > > > CONFIG_THUNDERBOLT in your .config/defconfig does it now just get
> > > > dropped silently?
> > > 
> > > People will have to look at this new stuff anyway.
> > > 
> > > > For example firewire has CONFIG_FIREWIRE even though the "standard" name
> > > > is IEEE 1394. I was thinking maybe we can do the same for
> > > > USB4/Thunderbolt
> > > 
> > > USB and Thunderbolt used to be distinct protocols. Whereas Firewire
> > > was just a colloquial name for IEEE1394. Please be wordy here.
> > > "Unified support for USB4 and Thunderbolt4"
> > 
> > OK.
> > 
> > I've been thinking this bit more and since Thunderbolt will stick around
> > as well (it basically implements all the optional USB4 features and
> > more) so would it make sense to have the Kconfig option be
> > CONFIG_THUNDERBOLT_USB4 (or CONFIG_USB4_THUNDERBOLT)? That should cover
> > both.
> 
> I would stick with CONFIG_USB4 but put both in the Kconfig text.  Again,
> it will be easier to handle this over time.

OK, thanks Greg!

> > Comments?
> > 
> > Also does anyone have any thoughts about keeping the driver under
> > drivers/thunderbolt vs. moving it under usb like
> > drivers/usb/thunderbolt? I'm thinking if anyone not familiar with this
> > tries to enable support for USB4 so the first place he/she probably
> > looks is under "USB support" menuconfig entry.
> 
> You are not sharing/needing any of the drivers/usb/ code just yet,
> right? 

Yes, that's correct.

> I imagine that will happen "soon" and when it does, then sure,
> moving stuff is fine with me.

OK thanks!
