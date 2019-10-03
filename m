Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23A78C9969
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 10:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbfJCIAe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Oct 2019 04:00:34 -0400
Received: from mga02.intel.com ([134.134.136.20]:61559 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727368AbfJCIAd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Oct 2019 04:00:33 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Oct 2019 01:00:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,251,1566889200"; 
   d="scan'208";a="205560839"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 03 Oct 2019 01:00:29 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 03 Oct 2019 11:00:28 +0300
Date:   Thu, 3 Oct 2019 11:00:28 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Mario.Limonciello@dell.com
Cc:     yehezkelshb@gmail.com, linux-usb@vger.kernel.org,
        andreas.noever@gmail.com, michael.jamet@intel.com,
        rajmohan.mani@intel.com,
        nicholas.johnson-opensource@outlook.com.au, lukas@wunner.de,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        anthony.wong@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 17/22] thunderbolt: Add initial support for USB4
Message-ID: <20191003080028.GK2819@lahna.fi.intel.com>
References: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
 <20191001113830.13028-18-mika.westerberg@linux.intel.com>
 <184c95fc476146939b240557e54ee2c9@AUSX13MPC105.AMER.DELL.COM>
 <5357cb96013445d79f5c2016df8a194e@AUSX13MPC105.AMER.DELL.COM>
 <20191002083913.GG2714@lahna.fi.intel.com>
 <767f2f97059e4e9f861080672aaa18d3@AUSX13MPC105.AMER.DELL.COM>
 <CA+CmpXs4YsTA3QnD77SaXq3mRYX6oFwx+pm-3wEErwkF-02M+A@mail.gmail.com>
 <bb84da73d1df468da1707a2af09eb2de@AUSX13MPC105.AMER.DELL.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb84da73d1df468da1707a2af09eb2de@AUSX13MPC105.AMER.DELL.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 02, 2019 at 04:00:55PM +0000, Mario.Limonciello@dell.com wrote:
> > It's not even "same location - another meaning", the vendor ID comes from the
> > DROM section, so it takes a few internal jumps inside the NVM to find the
> > location. One of the "pointers" or section headers will be broken for sure.
> > 
> > And after this, we need to find the NVM in LVFS and it has to pass validation in
> > a few other locations. The chances are so low that I'd think it isn't worth
> > worrying about it.
> 
> And now I remember why the back of my mind was having this thought of wanting
> sysfs attribute in the first place.  The multiple jumps means that a lot more of the
> NVM has to be dumped to get that data, which slows down fwupd startup significantly.

IIRC currently fwupd does two reads of total 128 bytes from the active
NVM. Is that really slowing down fwupd startup significantly?

> However the kernel has this information handy already from thunderbolt init and can
> easily export an attribute which can then come from udev with no startup penalty.

Indeed kernel has this information but I'm bit hesitant to add new
attributes if that same information is already available to the
userspace rather easily. IMHO we can always add this to the driver later
as we learn new NVM formats that require more parsing from fwupd side
slowing it down considerably.
