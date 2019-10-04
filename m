Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7EBCB580
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2019 09:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387717AbfJDHyc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Oct 2019 03:54:32 -0400
Received: from mga03.intel.com ([134.134.136.65]:56043 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727409AbfJDHyc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Oct 2019 03:54:32 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Oct 2019 00:54:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,255,1566889200"; 
   d="scan'208";a="205799275"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 04 Oct 2019 00:54:26 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 04 Oct 2019 10:54:26 +0300
Date:   Fri, 4 Oct 2019 10:54:26 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Mario.Limonciello@dell.com
Cc:     yehezkelshb@gmail.com, linux-usb@vger.kernel.org,
        andreas.noever@gmail.com, michael.jamet@intel.com,
        rajmohan.mani@intel.com,
        nicholas.johnson-opensource@outlook.com.au, lukas@wunner.de,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        anthony.wong@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 17/22] thunderbolt: Add initial support for USB4
Message-ID: <20191004075426.GA2819@lahna.fi.intel.com>
References: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
 <20191001113830.13028-18-mika.westerberg@linux.intel.com>
 <184c95fc476146939b240557e54ee2c9@AUSX13MPC105.AMER.DELL.COM>
 <5357cb96013445d79f5c2016df8a194e@AUSX13MPC105.AMER.DELL.COM>
 <20191002083913.GG2714@lahna.fi.intel.com>
 <767f2f97059e4e9f861080672aaa18d3@AUSX13MPC105.AMER.DELL.COM>
 <CA+CmpXs4YsTA3QnD77SaXq3mRYX6oFwx+pm-3wEErwkF-02M+A@mail.gmail.com>
 <bb84da73d1df468da1707a2af09eb2de@AUSX13MPC105.AMER.DELL.COM>
 <20191003080028.GK2819@lahna.fi.intel.com>
 <06a04bff94494da99c5359a7fb645d19@AUSX13MPC105.AMER.DELL.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06a04bff94494da99c5359a7fb645d19@AUSX13MPC105.AMER.DELL.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 03, 2019 at 02:41:11PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Sent: Thursday, October 3, 2019 3:00 AM
> > To: Limonciello, Mario
> > Cc: yehezkelshb@gmail.com; linux-usb@vger.kernel.org;
> > andreas.noever@gmail.com; michael.jamet@intel.com;
> > rajmohan.mani@intel.com; nicholas.johnson-opensource@outlook.com.au;
> > lukas@wunner.de; gregkh@linuxfoundation.org; stern@rowland.harvard.edu;
> > anthony.wong@canonical.com; linux-kernel@vger.kernel.org
> > Subject: Re: [RFC PATCH 17/22] thunderbolt: Add initial support for USB4
> > 
> > 
> > [EXTERNAL EMAIL]
> > 
> > On Wed, Oct 02, 2019 at 04:00:55PM +0000, Mario.Limonciello@dell.com wrote:
> > > > It's not even "same location - another meaning", the vendor ID comes from
> > the
> > > > DROM section, so it takes a few internal jumps inside the NVM to find the
> > > > location. One of the "pointers" or section headers will be broken for sure.
> > > >
> > > > And after this, we need to find the NVM in LVFS and it has to pass validation
> > in
> > > > a few other locations. The chances are so low that I'd think it isn't worth
> > > > worrying about it.
> > >
> > > And now I remember why the back of my mind was having this thought of
> > wanting
> > > sysfs attribute in the first place.  The multiple jumps means that a lot more of
> > the
> > > NVM has to be dumped to get that data, which slows down fwupd startup
> > significantly.
> > 
> > IIRC currently fwupd does two reads of total 128 bytes from the active
> > NVM. Is that really slowing down fwupd startup significantly?
> 
> Yeah, I timed it with fwupd.  Here's the averages:
> 
> Without doing the reads to jump to this it's 0:00.06 seconds to probe a tree of
> Host controller and dock plugged in.
> 
> With doing the reads and just host controller:
> 0:04.40 seconds
>
> With doing the reads and host controller and dock plugged in:
> 0:10.73 seconds

OK, it clearly takes time to read them. I wonder if this includes
powering up the controller?

Also if you can get the hw_vendor_id and hw_product_id from the kernel
does that mean you don't need to do the two reads or you still need
those?
