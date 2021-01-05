Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D66272EB10B
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 18:09:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730504AbhAERIF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 12:08:05 -0500
Received: from mga05.intel.com ([192.55.52.43]:65165 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730430AbhAERIF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Jan 2021 12:08:05 -0500
IronPort-SDR: fig4tpgrlwa5COk7Xc2IksRThcC344F5wqt/bSdEjtaNBCKRuxFM6Q69y2t5R8/h5ePRwodqYB
 llkY5IsKKNNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="261906358"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; 
   d="scan'208";a="261906358"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 09:06:19 -0800
IronPort-SDR: yKbvUjeFEL9ue2ff+Sf5cDSpWwOUsFSfdTfI0qka5IWWkGKwKzFJmkm+GSApKGuK9ynWiIE/LJ
 rlgd3OTkHllA==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; 
   d="scan'208";a="350447558"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 09:06:16 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 05 Jan 2021 19:06:14 +0200
Date:   Tue, 5 Jan 2021 19:06:14 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>
Cc:     Yehezkel Bernat <yehezkelshb@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Christian Kellner <christian@kellner.me>
Subject: Re: [PATCH 2/2] thunderbolt: Add support for de-authorizing devices
Message-ID: <20210105170614.GI968855@lahna.fi.intel.com>
References: <20210105092808.15817-1-mika.westerberg@linux.intel.com>
 <20210105092808.15817-2-mika.westerberg@linux.intel.com>
 <CA+CmpXuFcirdh_bp1=MmXr9KHJ2XdoMiBL9ORyntoFcxpJyJYA@mail.gmail.com>
 <20210105163624.GH968855@lahna.fi.intel.com>
 <SA1PR19MB4926E78435DD9276364D0818FAD10@SA1PR19MB4926.namprd19.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA1PR19MB4926E78435DD9276364D0818FAD10@SA1PR19MB4926.namprd19.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 05, 2021 at 04:48:23PM +0000, Limonciello, Mario wrote:
> > -----Original Message-----
> > From: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Sent: Tuesday, January 5, 2021 10:36
> > To: Yehezkel Bernat
> > Cc: linux-usb@vger.kernel.org; Michael Jamet; Lukas Wunner; Andreas Noever;
> > Christian Kellner; Limonciello, Mario
> > Subject: Re: [PATCH 2/2] thunderbolt: Add support for de-authorizing devices
> > 
> > 
> > [EXTERNAL EMAIL]
> > 
> > Hi,
> > 
> > On Tue, Jan 05, 2021 at 03:53:33PM +0200, Yehezkel Bernat wrote:
> > > On Tue, Jan 5, 2021 at 11:28 AM Mika Westerberg
> > > <mika.westerberg@linux.intel.com> wrote:
> > > >
> > > > In some cases it is useful to be able de-authorize devices. For example
> > > > if user logs out the userspace can have a policy that disconnects PCIe
> > > > devices until logged in again. This is only possible for software based
> > > > connection manager as it directly controls the tunnels.
> > > >
> > > > For this reason make the authorized attribute accept writing 0 which
> > > > makes the software connection manager to tear down the corresponding
> > > > PCIe tunnel. Userspace can check if this is supported by reading a new
> > > > domain attribute deauthorization, that holds 1 in that case.
> 
> Just another idea, rather than the value of a new "deauthorize" attribute indicating
> whether this is supported how about instead a "connection_manager" attribute?
> 
> My thought being userspace can potentially make a judgement call from the information
> on how tunnels are going to behave (particularly in long chains from the suspend/resume
> cycle coming back differently).

I went for "deauthorization" because that kind of allows this to work on
systems with firmware based connection manager too (yes, Intel Maple
Ridge is using FW CM even if it is USB4 :( ). However, at the moment the
FW CM does not support any if this but nobody knows if something like
this will be implemented there.

That said, I'm fine to change this to whatever you guys think is the
best :) If "connection_manager=sw/fw" or so is better then no problem
changing that.

> > > What a great feature! Thanks for implementing it.
> 
> I agree, this sounds like a great idea.
> 
> > >
> > > BTW, is there any general way to disable the device operations before such a
> > > disconnection? The user has a way to stop removable disks, for example, but
> > > maybe other devices need additional precaution from the user (eGPU?).
> > 
> > There are ways but it depends on the driver, I guess. For instance eGPUS
> > at the moment (the ones I've tested) simply crash as their driver does
> > not support hot-remove ;-)
> > 
> > What ends up happening is essentially PCIe hot-remove so drivers that
> > are prepared for that should be fine. Of course if you had mounted
> > filesystem behind the PCIe link that was torn down you end up losing
> > your data, so the user interface should make sure the user is aware of
> > that.
> 
> I think it's also worth mentioning this risk in the thunderbolt.rst documentation
> directly.

Sure, I'll add there mention about this.
