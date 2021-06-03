Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 221AE399B2F
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jun 2021 09:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbhFCHCv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Jun 2021 03:02:51 -0400
Received: from mga14.intel.com ([192.55.52.115]:27741 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229922AbhFCHCu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Jun 2021 03:02:50 -0400
IronPort-SDR: 14T4U9opA1w6dQcW0tUF3pFYN5uPYQ2b297eWCxnEpJwE2qG8cnrdEqr6G7OrtUzjZMsLKbKvJ
 ItEDEb+1d3ag==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="203793746"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; 
   d="scan'208";a="203793746"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2021 00:01:04 -0700
IronPort-SDR: 1PFtBpUBSVqSb5lQhF0k0UFdlXMtF8ZSVZneA3QC2u/yEzXt+R7nRmQSfy2u96guAzW+albBM6
 IwBnj0Vi1HBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; 
   d="scan'208";a="550590574"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 03 Jun 2021 00:01:02 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 03 Jun 2021 10:01:01 +0300
Date:   Thu, 3 Jun 2021 10:01:01 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     USB <linux-usb@vger.kernel.org>
Subject: Re: DWC3 (PCI) software node double free on shutdown
Message-ID: <YLh+LVNWWcOBVcG+@kuha.fi.intel.com>
References: <CAHp75Vd-5U5zgtDfM5C3Jsx51HVYB+rNcHYC2XP=G7dOd=cdTg@mail.gmail.com>
 <YLYLv+ozHCHhkfUM@kuha.fi.intel.com>
 <CAHp75VeHwNh1fxjXLObO+KJG+5eY5jRxT7r7g4BmxPSbyq4Hmw@mail.gmail.com>
 <CAHp75Vdftvnv3yNx2OWLW2quSHRHrwknWjPC0zSPkx=roa6m_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vdftvnv3yNx2OWLW2quSHRHrwknWjPC0zSPkx=roa6m_Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 02, 2021 at 07:03:30PM +0300, Andy Shevchenko wrote:
> On Tue, Jun 1, 2021 at 5:57 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Tue, Jun 1, 2021 at 1:28 PM Heikki Krogerus
> > <heikki.krogerus@linux.intel.com> wrote:
> > >
> > > On Tue, Jun 01, 2021 at 12:50:18PM +0300, Andy Shevchenko wrote:
> > > > >From time to time I see this on shutdown.
> > > > I suspect this happens due to the device core trying to remove
> > > > software nodes when it should not.
> > >
> > > Yes, this is caused by the device_remove_properties() call in
> > > device_del(). We can't remove that quite yet unfortunately.
> > >
> > > Can you test if this fixes the problem:
> >
> > Thanks, I have pushed it to my repo and will monitor the behaviour for
> > a few days or so.
> 
> Unfortunately it does not prevent the issue from happening. Till now I
> have got it already twice (for dozen or so reboots).

OK, thanks. I'll try to think of something else. I guess if nothing
else works, we just have to remove that device_remove_properties()
call from device_del(). I believe there is only one user left for the
device_add_properties() function, so converting that to use software
nodes instead should not be a big problem.


thanks,

-- 
heikki
