Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC022EB043
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 17:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729378AbhAEQiR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 11:38:17 -0500
Received: from mga11.intel.com ([192.55.52.93]:19850 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729375AbhAEQiQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Jan 2021 11:38:16 -0500
IronPort-SDR: chWWlcQ6aJ4voBmuVToOD4P7s5tUqW3pK3FpOUWR8YsmXHdDAzz7ucygYJvrk0PiBNMuv1uX3l
 nEWimKDs/uaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="173627023"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; 
   d="scan'208";a="173627023"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 08:36:30 -0800
IronPort-SDR: jz3lIJfiLfgIw2e9ZixlyXTg82HGtc3C10YHZ6K1L6V+cc7jdEu0723T9N2VxoUGaIo1aT7CoY
 Q63QCdhPYO4A==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; 
   d="scan'208";a="378932976"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 08:36:27 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 05 Jan 2021 18:36:24 +0200
Date:   Tue, 5 Jan 2021 18:36:24 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Yehezkel Bernat <yehezkelshb@gmail.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Christian Kellner <christian@kellner.me>,
        Mario Limonciello <mario.limonciello@dell.com>
Subject: Re: [PATCH 2/2] thunderbolt: Add support for de-authorizing devices
Message-ID: <20210105163624.GH968855@lahna.fi.intel.com>
References: <20210105092808.15817-1-mika.westerberg@linux.intel.com>
 <20210105092808.15817-2-mika.westerberg@linux.intel.com>
 <CA+CmpXuFcirdh_bp1=MmXr9KHJ2XdoMiBL9ORyntoFcxpJyJYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CmpXuFcirdh_bp1=MmXr9KHJ2XdoMiBL9ORyntoFcxpJyJYA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, Jan 05, 2021 at 03:53:33PM +0200, Yehezkel Bernat wrote:
> On Tue, Jan 5, 2021 at 11:28 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > In some cases it is useful to be able de-authorize devices. For example
> > if user logs out the userspace can have a policy that disconnects PCIe
> > devices until logged in again. This is only possible for software based
> > connection manager as it directly controls the tunnels.
> >
> > For this reason make the authorized attribute accept writing 0 which
> > makes the software connection manager to tear down the corresponding
> > PCIe tunnel. Userspace can check if this is supported by reading a new
> > domain attribute deauthorization, that holds 1 in that case.
> 
> What a great feature! Thanks for implementing it.
> 
> BTW, is there any general way to disable the device operations before such a
> disconnection? The user has a way to stop removable disks, for example, but
> maybe other devices need additional precaution from the user (eGPU?).

There are ways but it depends on the driver, I guess. For instance eGPUS
at the moment (the ones I've tested) simply crash as their driver does
not support hot-remove ;-)

What ends up happening is essentially PCIe hot-remove so drivers that
are prepared for that should be fine. Of course if you had mounted
filesystem behind the PCIe link that was torn down you end up losing
your data, so the user interface should make sure the user is aware of
that.

> >                 Possible values are supported:
> >
> > -               ==  ===========================================
> > +               ==  ===================================================
> > +               0   The device will be de-authorized (only supported if
> > +                   deauthorization attribute under domain contains 1)
> >                 1   The device will be authorized and connected
> > -               ==  ===========================================
> > +               ==  ===================================================
> >
> >                 When key attribute contains 32 byte hex string the possible
> >                 values are:
> 
> As 0 is available for 'secure' security level too, you may want to reflect it in
> the documentation here somehow.

OK.

> > +static int disapprove_switch(struct device *dev, void *data)
> 
> Maybe it's better to mark `data` as `__maybe_unused`?

Or rename `data` as `unused`? I think in ACPI side we are doing that
but sure, I'll change it.
