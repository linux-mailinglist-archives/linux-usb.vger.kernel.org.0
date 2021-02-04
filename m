Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3231930DD4D
	for <lists+linux-usb@lfdr.de>; Wed,  3 Feb 2021 15:55:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233247AbhBCOwz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Feb 2021 09:52:55 -0500
Received: from mga04.intel.com ([192.55.52.120]:60546 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232528AbhBCOwv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Feb 2021 09:52:51 -0500
IronPort-SDR: CJxLX73ES43HZ2Y+MnTvjM3bnAmU4kUbEDNsZzjUdDHP7asFuTVO71BkER99x+FuUJrR36nHa+
 GIbCdERxpasg==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="178489994"
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="178489994"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 06:51:25 -0800
IronPort-SDR: wMb7zQMf9oswhoMxeuPLVy8qcLZP1LP//czfvHXWYkHYQu9wuiLEa7+FVbnIKuh3rES4OnRmNF
 r9eZDg04XFqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="480371552"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 03 Feb 2021 06:51:18 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 03 Feb 2021 16:51:18 +0200
Date:   Wed, 3 Feb 2021 16:51:18 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:ULTRA-WIDEBAND (UWB) SUBSYSTEM:" 
        <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/6] software node: Provide replacement for
 device_add_properties()
Message-ID: <20210203145118.GH1687065@kuha.fi.intel.com>
References: <20210202125032.64982-1-heikki.krogerus@linux.intel.com>
 <20210202125032.64982-2-heikki.krogerus@linux.intel.com>
 <CAJZ5v0gMEBV=Gm-R=5zkN-J_p7cMTBwoOJrv=ec1j6SfSYRg_w@mail.gmail.com>
 <20210202150102.GA1687065@kuha.fi.intel.com>
 <CAJZ5v0hVZBhqzLPGPHDZYPcYyJPfwgYwjzKGYaUMZOBw7Eh7CQ@mail.gmail.com>
 <20210203094535.GC1687065@kuha.fi.intel.com>
 <CAJZ5v0j6oY=hXOJtoJ=_vdWqwLDDAO8SJoG1N3nehaAcAz8G8w@mail.gmail.com>
 <20210203142655.GG1687065@kuha.fi.intel.com>
 <CAJZ5v0hwjxtADph8=R+F0bgzm1q1EMrrzZMhQQUoHG9O-wdTag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hwjxtADph8=R+F0bgzm1q1EMrrzZMhQQUoHG9O-wdTag@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 03, 2021 at 03:39:02PM +0100, Rafael J. Wysocki wrote:
> On Wed, Feb 3, 2021 at 3:27 PM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > On Wed, Feb 03, 2021 at 02:50:24PM +0100, Rafael J. Wysocki wrote:
> > > On Wed, Feb 3, 2021 at 10:45 AM Heikki Krogerus
> > > <heikki.krogerus@linux.intel.com> wrote:
> > > >
> > > > On Tue, Feb 02, 2021 at 05:08:40PM +0100, Rafael J. Wysocki wrote:
> > > > > It looks like there is a use case that cannot be addressed by using
> > > > > device_add_properties() and that's why you need this new function.
> > > > >
> > > > > Can you describe that use case, please, and explain what the problem
> > > > > with using device_add_properties() in it is?
> > > >
> > > > The problem with device_add_properties() is that it gives false
> > > > impression that the device properties are somehow directly attached to
> > > > the devices, which is not true. Now, that should not be a major issue,
> > > > but it seems that it is. I think Lee Jones basically used that as an
> > > > argument to refuse changes (and pretty minor changes) that would have
> > > > allowed us to use software nodes with the MFD drivers.
> > > >
> > > > Nevertheless, I was not planning to provide a replacement for it
> > > > originally. We do in any case have the real issue caused by that
> > > > device_remove_properties() call in device_del() which has to be fixed.
> > >
> > > What's that issue, specifically?
> >
> > The problem is that we can't now reuse or share if necessary, or just
> > in general be in charge of the lifetime of the software nodes because
> > that call is in device_del(). Now the lifetime of the software nodes
> > is always tied to the devices they are attached, no questions asked.
> 
> I see and so instead you want the reference counting to trigger the
> cleanup when the count gets to 0.
> 
> Sounds reasonable to me and please put this information into the patch
> changelog.

Yes. I'll do that.

thanks,

-- 
heikki
