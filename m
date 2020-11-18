Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F221A2B7ECA
	for <lists+linux-usb@lfdr.de>; Wed, 18 Nov 2020 15:02:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgKRN6F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Nov 2020 08:58:05 -0500
Received: from mga07.intel.com ([134.134.136.100]:8670 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726533AbgKRN6E (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Nov 2020 08:58:04 -0500
IronPort-SDR: d1yeHgCQH/hKMZDggtrWqwCft2Fr1Cjeg4i4p/BS+WEa0Q4rCX5nLHly+dmbm0pLQtButRNXDO
 TjJG9FfwC6+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="235265375"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="235265375"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 05:58:01 -0800
IronPort-SDR: AZHFHY1fLHY7HFJTJRiRDKXZtJK0AZdZKNav5S8nlF+t8NEVp3xT4cn/Qt7OSpfADSM7R5+9Is
 VhTKR8e0+Oww==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="359434560"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 05:57:57 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 18 Nov 2020 15:55:45 +0200
Date:   Wed, 18 Nov 2020 15:55:45 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Paulian Bogdan Marinca <paulian@marinca.net>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH] thunderbolt: Fix use-after-free in
 remove_unplugged_switch()
Message-ID: <20201118135545.GV2495@lahna.fi.intel.com>
References: <20201118133745.65628-1-mika.westerberg@linux.intel.com>
 <X7Ul792kd0wiXCxM@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X7Ul792kd0wiXCxM@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 18, 2020 at 02:47:27PM +0100, Greg KH wrote:
> On Wed, Nov 18, 2020 at 04:37:45PM +0300, Mika Westerberg wrote:
> > Paulian reported a crash that happens when a dock is unplugged during
> > hibernation:
> > 
> > [78436.228217] thunderbolt 0-1: device disconnected
> > [78436.228365] BUG: kernel NULL pointer dereference, address: 00000000000001e0
> > ...
> > [78436.228397] RIP: 0010:icm_free_unplugged_children+0x109/0x1a0
> > ...
> > [78436.228432] Call Trace:
> > [78436.228439]  icm_rescan_work+0x24/0x30
> > [78436.228444]  process_one_work+0x1a3/0x3a0
> > [78436.228449]  worker_thread+0x30/0x370
> > [78436.228454]  ? process_one_work+0x3a0/0x3a0
> > [78436.228457]  kthread+0x13d/0x160
> > [78436.228461]  ? kthread_park+0x90/0x90
> > [78436.228465]  ret_from_fork+0x1f/0x30
> > 
> > This happens because remove_unplugged_switch() calls tb_switch_remove()
> > that releases the memory pointed by sw so the following lines reference
> > to a memory that might be released already.
> > 
> > Fix this by saving pointer to the parent device before calling
> > tb_switch_remove().
> > 
> > Reported-by: Paulian Bogdan Marinca <paulian@marinca.net>
> > Fixes: 4f7c2e0d8765 ("thunderbolt: Make sure device runtime resume completes before taking domain lock")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  drivers/thunderbolt/icm.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
> > index b51fc3f62b1f..05323c442b56 100644
> > --- a/drivers/thunderbolt/icm.c
> > +++ b/drivers/thunderbolt/icm.c
> > @@ -1976,7 +1976,9 @@ static int complete_rpm(struct device *dev, void *data)
> >  
> >  static void remove_unplugged_switch(struct tb_switch *sw)
> >  {
> > -	pm_runtime_get_sync(sw->dev.parent);
> > +	struct device *parent = sw->dev.parent;
> > +
> > +	pm_runtime_get_sync(parent);
> 
> If you are saving a pointer to a structure, shouldn't you increment the
> reference count?
> 
> 	struct device *parent = get_device(sw->dev.parent);
> 
> Then you know it is valid when you use it later on.

Indeed, I missed that.

> Just remember to call put_device() when you are done.

Sure I'll do this in v2. Thanks!
