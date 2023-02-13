Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75DD869469E
	for <lists+linux-usb@lfdr.de>; Mon, 13 Feb 2023 14:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbjBMNKG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Feb 2023 08:10:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjBMNKF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Feb 2023 08:10:05 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E164417CD6
        for <linux-usb@vger.kernel.org>; Mon, 13 Feb 2023 05:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676293803; x=1707829803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GCTMOGN5DBVbdqZ+sL4Y5kqolQ3mcEnc/4B8nWrnT9A=;
  b=PFsDTZuaoQTsEAHskwHMKNZea4DRU599Q2+aZBUkX8cRFgAXUzBB20l/
   XgCbjTUYAgmZ595paNf6THfUrxgGEVzBB/XZjXu0TfsjvOxc+F7t5EEtr
   GE0ftmTd8U9BDAa2GxYiRz0Z+dqQTQD9B3xA1M6EMpdPGUJHUZE0r3+R5
   kE54SWq4XUvw4SqEGqx4U7JPXSRqgOMD8kZcC26wFfHkaPHzFZLASsEif
   ypCHkw/s+aPF3vXLVRJmnwZFRD6pb7ACrxw1T76IebOP0MvQBQZsDu6Dr
   gzN/LWO8M0B8WJv4DUCNZDoRiRoEgWNMrYb8rFVNUNWXJCBwdkSIAXjZ9
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="333021578"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="333021578"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 05:10:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="811591939"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="811591939"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 13 Feb 2023 05:10:00 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 13 Feb 2023 15:09:59 +0200
Date:   Mon, 13 Feb 2023 15:09:59 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     "Gopal, Saranya" <saranya.gopal@intel.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Regupathy, Rajaram" <rajaram.regupathy@intel.com>
Subject: Re: [PATCH] usb: typec: pd: Add higher_capability sysfs for sink PDO
Message-ID: <Y+o2p5cix1deVMv8@kuha.fi.intel.com>
References: <20230212144838.128595-1-saranya.gopal@intel.com>
 <Y+kHDxDaHnXMPdfL@kroah.com>
 <DM6PR11MB4612E727FC1991BCD27F593AE3DC9@DM6PR11MB4612.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4612E727FC1991BCD27F593AE3DC9@DM6PR11MB4612.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Sun, Feb 12, 2023 at 04:13:22PM +0000, Gopal, Saranya wrote:
> Hi Greg,
> 
> > -----Original Message-----
> > From: Greg KH <gregkh@linuxfoundation.org>
> > Sent: Sunday, February 12, 2023 9:05 PM
> > To: Gopal, Saranya <saranya.gopal@intel.com>
> > Cc: linux-usb@vger.kernel.org; Heikki Krogerus
> > <heikki.krogerus@linux.intel.com>; Regupathy, Rajaram
> > <rajaram.regupathy@intel.com>
> > Subject: Re: [PATCH] usb: typec: pd: Add higher_capability sysfs for
> > sink PDO
> > 
> > On Sun, Feb 12, 2023 at 08:18:38PM +0530, Saranya Gopal wrote:
> > > As per USB PD specification, 28th bit of sink fixed power supply
> > > PDO represents higher capability. If this bit is set, it indicates
> > > that the sink needs more than vsafe5V to provide full functionality.
> > > This patch replaces usb_suspend_supported sysfs with
> > higher_capability
> > > sysfs for sink PDO.
> > >
> > > Fixes: 662a60102c12 ("usb: typec: Separate USB Power Delivery
> > from USB Type-C")
> > > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > 
> > Where was this reviewed?  I don't see that on the list, am I missing
> > it?
> It was reviewed internally in Intel's internal mailing list.
> 
> > 
> > > Reported-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
> > > Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
> > > ---
> > >  .../ABI/testing/sysfs-class-usb_power_delivery         | 10
> > +++++++++-
> > >  drivers/usb/typec/pd.c                                 |  9 ++++++++-
> > >  2 files changed, 17 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/ABI/testing/sysfs-class-
> > usb_power_delivery b/Documentation/ABI/testing/sysfs-class-
> > usb_power_delivery
> > > index ce2b1b563cb3..59757118b6a3 100644
> > > --- a/Documentation/ABI/testing/sysfs-class-usb_power_delivery
> > > +++ b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
> > > @@ -69,7 +69,7 @@ Description:
> > >  		This file contains boolean value that tells does the
> > device
> > >  		support both source and sink power roles.
> > >
> > > -What:
> > 	/sys/class/usb_power_delivery/.../<capability>/1:fixed_sup
> > ply/usb_suspend_supported
> > > +What:		/sys/class/usb_power_delivery/.../source-
> > capabilities/1:fixed_supply/usb_suspend_supported
> > >  Date:		May 2022
> > >  Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > >  Description:
> > > @@ -78,6 +78,14 @@ Description:
> > >  		will follow the USB 2.0 and USB 3.2 rules for
> > suspend and
> > >  		resume.
> > >
> > > +What:		/sys/class/usb_power_delivery/.../sink-
> > capabilities/1:fixed_supply/higher_capability
> > > +Date:		February 2023
> > > +Contact:	Saranya Gopal <saranya.gopal@linux.intel.com>
> > > +Description:
> > > +		This file shows the value of the Higher capability bit
> > in vsafe5V Fixed Supply Object.
> > > +		If the bit is set, then the sink needs more than
> > vsafe5V(eg. 12 V) to provide
> > > +		full functionality.
> > 
> > You don't explain what this file will show.  0/1? Y/N?  J/N?
> > 
> > Also, properly wrap your lines at 80 columns for documentation
> > please.
> This sysfs will show 0/1 value.

I think we need to fix this one. Although, the description does
clearly say that this file shows the value of a bit, it's still better
to separately show the possible values - so 0 or 1.

> I have tried to maintain consistency with the rest of the file.
> (https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-class-usb_power_delivery)
> That is why I did not add the 0/1 value and also did not wrap the lines to 80.
> I can fix these in v2 if you are not convinced.

But the descriptions are wrapped at 80 characters in that document?

> > And adding a new sysfs entry does not "Fix" anything, why is this
> > tagged
> > as such?
> Sink fixed supply PDO wrongly shows usb_suspend_supported sysfs instead of higher_capability sysfs.
> Sink PDO does not have this 'usb_suspend_supported' bit.
> Only source fixed supply PDO has this bit. So, this patch adds higher_capability bit support for sink PDO.
> That is why 'fixes' tag was added.

Yep. So the value was assigned to the wrong sysfs file. I do think
this is a fix.

Br,

-- 
heikki
