Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 672619CAB2
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2019 09:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730094AbfHZHgt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Aug 2019 03:36:49 -0400
Received: from mga09.intel.com ([134.134.136.24]:56154 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728168AbfHZHgt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Aug 2019 03:36:49 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Aug 2019 00:36:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,431,1559545200"; 
   d="scan'208";a="196993238"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 26 Aug 2019 00:36:46 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 26 Aug 2019 10:36:45 +0300
Date:   Mon, 26 Aug 2019 10:36:45 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     Ajay Gupta <ajaykuee@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: typec: ucsi: add support for separate DP altmode
 devices
Message-ID: <20190826073645.GE5356@kuha.fi.intel.com>
References: <20190805182413.29362-1-ajayg@nvidia.com>
 <20190815153645.GD24772@kuha.fi.intel.com>
 <BYAPR12MB27270969F256DBF62017AFACDCA80@BYAPR12MB2727.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR12MB27270969F256DBF62017AFACDCA80@BYAPR12MB2727.namprd12.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ajay,

On Mon, Aug 19, 2019 at 10:23:29PM +0000, Ajay Gupta wrote:
> > > diff --git a/drivers/usb/typec/ucsi/ucsi.h
> > > b/drivers/usb/typec/ucsi/ucsi.h index de87d0b8319d..7bbdf83c8d4a
> > > 100644
> > > --- a/drivers/usb/typec/ucsi/ucsi.h
> > > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > > @@ -274,6 +274,15 @@ struct ucsi_connector_capability {
> > >  	u8:6; /* reserved */
> > >  } __packed;
> > >
> > > +struct new_ucsi_altmode {
> > > +	u16 svid;
> > > +	u32 mid;
> > > +	u8 linked_idx;
> > > +	u8 active_idx;
> > > +#define UCSI_MULTI_LINKED_INDEX	(0xff)
> > > +	bool checked;
> > > +} __packed;
> > 
> > The name "new_ucsi_altmode" is a not clear to me.
> We need new structure for below reasons:
> a) linked_idx: To find CAM index from new squashed table to original altmode table
>    and vice versa for non-duplicate altmodes
> b) active_idx: To store currently active CAM index in original altmode table for
>    duplicate altmodes.
>    For example, whether pin C or pin D is active with DP altmode svid of 0xff01
>    
> c) checked: This is helpful during squash logic. Once we find the duplicate DP altmode then
> we mark that as checked and considered and move on to next altmode in original table in
> for loop.
> 
> > 
> > Why don't you just have a pointer to struct ucsi_altmode in that structure?
> We can do that.
> 
> > I'm not sure you really need those linked_idx, active_idx and checked members.
> We need them to handle UCSI_SET_NEW_CAM and UCSI_GET_CURRENT_CAM 
> commands. We need a way to find right indexes from original table to new squashed table
> and vice versa.
>  
> > > +
> > >  struct ucsi_altmode {
> > >  	u16 svid;
> > >  	u32 mid;
> > > @@ -408,6 +417,7 @@ struct ucsi {
> > >
> > >  struct ucsi_connector {
> > >  	int num;
> > > +	bool has_multiple_dp;
> > >
> > >  	struct ucsi *ucsi;
> > >  	struct mutex lock; /* port lock */
> > > @@ -424,6 +434,8 @@ struct ucsi_connector {
> > >
> > >  	struct ucsi_connector_status status;
> > >  	struct ucsi_connector_capability cap;
> > > +	struct new_ucsi_altmode port_alt[UCSI_MAX_ALTMODES];
> > > +	struct new_ucsi_altmode new_port_alt[UCSI_MAX_ALTMODES];
> > 
> > I'm pretty sure you don't need two of those. You should be able to handle this
> > with a pointer to the correct port_altmode member inside your structure. You
> > can also add a member to your structure that is pointer to another structure of
> > the same type:
> >         struct my_ucsi_altmode {
> >                 u16 svid;
> >                 u32 mid;
> >                 struct ucsi_altmode *port_altmode;
> >                 struct my_ucsi_altmode *companion[UCSI_MAX_ALTMODES];
> >         };
> > 
> > But I pretty sure pointer to the correct port_altmode is enough:
> > 
> >         struct my_ucsi_altmode {
> >                 u16 svid;
> >                 u32 mid;
> >                 struct ucsi_altmode *port_altmode;
> >         };
> > 
> > >  };
> We want to use data structure which is easy to track and store CAM indexes from
> from original table to new squashed table and vice versa. Having two arrays of 
> structures was easy to map between original and new tables with indexes. I will think
> more on this to further simplify it.
>  
> > I don't think there is anything preventing all this from being done in ucsi_ccg.c
> > initially. I don't think we need to touch ucsi.h nor ucsi.c at all at this point.
> We need to get all the connector altmodes and then go through it to squash
> duplicate DP altmodes. This can be done only in ucsi.c where it sends
> UCSI_CMD_GET_ALTERNATE_MODES command.
> 
> Currently ucsi.c sends UCSI_CMD_GET_ALTERNATE_MODES command requesting
> one altmode at a time and then calls ucsi_register_altmode() to register that single
> altmode. Some PPM may send two altmode and we register both.
> 
> Even if we change ucsi.c to first collect all altmodes and then register, then also ucsi_ccg.c
> will not be able to send squashed altmodes since it doesn't know if the connector has a 
> duplicate altmode until it receives all of them.
>  
> > So just collect the connector alternate modes for example into struct ucsi_ccg
> > instead of struct ucsi_connector, and then process the commands that need to
> > be handled separately in ucsi_ccg_cmd(). 
> See above. We will need to collect all altmodes inside ucsi.c and update it there.
> Separate handling of commands can be done inside ucsi_ccg.c but I thought it is better
> to enable this feature for all ucsi controllers and not only ccg.

If the solution is generic, so if it's defined in the standard
(actually, in some cases even this is not enough), or if there are
multiple users for it, the code should go to ucsi.c. This solution is
useful only on your product for now. Before there is another product
that uses the solution, it should be isolated to reduce the change of
creating regressions with other products.

thanks,

-- 
heikki
