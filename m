Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E23130AC57
	for <lists+linux-usb@lfdr.de>; Mon,  1 Feb 2021 17:13:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbhBAQLS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 11:11:18 -0500
Received: from mga09.intel.com ([134.134.136.24]:28248 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229634AbhBAQLQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Feb 2021 11:11:16 -0500
IronPort-SDR: v+/QT13qHo/PbRyMkhTwsJmTWdh5ZqL0GyWjfdW/oN/UFRKZ45BsDCoHmwsbVQDdGFvGm2tzzG
 c5lLgTgj7MQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180852301"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="180852301"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 08:09:29 -0800
IronPort-SDR: rSWPRMiVJNzn2AKUa02o2Rd/7vn5J2sGexoKrHMixux8uuXTh2aMt9JqA64cWkAaRZUaAkFFFf
 pvbLjrELqOWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="479139920"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 01 Feb 2021 08:09:26 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 01 Feb 2021 18:09:25 +0200
Date:   Mon, 1 Feb 2021 18:09:25 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Badhri Jagan Sridharan <badhri@google.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Kyle Tso <kyletso@google.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] usb: typec: tcpm: Add Callback to Usb
 Communication capable partner
Message-ID: <20210201160925.GA1433721@kuha.fi.intel.com>
References: <20210201095309.39486-1-badhri@google.com>
 <20210201151253.GG2465@kuha.fi.intel.com>
 <YBgcCu7lx036C+KN@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBgcCu7lx036C+KN@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 01, 2021 at 04:19:38PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Feb 01, 2021 at 05:12:53PM +0200, Heikki Krogerus wrote:
> > On Mon, Feb 01, 2021 at 01:53:07AM -0800, Badhri Jagan Sridharan wrote:
> > > The USB Communications Capable bit indicates if port
> > > partner is capable of communication over the USB data lines
> > > (e.g. D+/- or SS Tx/Rx). Notify the status of the bit to low
> > > level drivers to perform chip specific operation.
> > > For instance, low level driver enables USB switches on D+/D-
> > > lines to set up data path when the bit is set.
> > > 
> > > Refactored from patch initially authored by
> > > Kyle Tso <kyletso@google.com>
> > > 
> > > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > > ---
> > >  drivers/usb/typec/tcpm/tcpm.c | 16 ++++++++++++++++
> > >  include/linux/usb/tcpm.h      |  5 +++++
> > >  2 files changed, 21 insertions(+)
> > 
> > ...
> > 
> > > diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
> > > index 3af99f85e8b9..42fcfbe10590 100644
> > > --- a/include/linux/usb/tcpm.h
> > > +++ b/include/linux/usb/tcpm.h
> > > @@ -108,6 +108,10 @@ enum tcpm_transmit_type {
> > >   *		is supported by TCPC, set this callback for TCPM to query
> > >   *		whether vbus is at VSAFE0V when needed.
> > >   *		Returns true when vbus is at VSAFE0V, false otherwise.
> > > + * @set_partner_usb_comm_capable:
> > > + *              Optional; The USB Communications Capable bit indicates if port
> > > + *              partner is capable of communication over the USB data lines
> > > + *              (e.g. D+/- or SS Tx/Rx). Called to notify the status of the bit.
> > >   */
> > >  struct tcpc_dev {
> > >  	struct fwnode_handle *fwnode;
> > > @@ -139,6 +143,7 @@ struct tcpc_dev {
> > >  	int (*set_auto_vbus_discharge_threshold)(struct tcpc_dev *dev, enum typec_pwr_opmode mode,
> > >  						 bool pps_active, u32 requested_vbus_voltage);
> > >  	bool (*is_vbus_vsafe0v)(struct tcpc_dev *dev);
> > > +	void (*set_partner_usb_comm_capable)(struct tcpc_dev *dev, bool enable);
> > >  };
> > >  
> > >  struct tcpm_port;
> > 
> > There start to be a lot of callback there, separate for each function.
> > And I guess flags too... Would it be possible to have a single
> > notification callback instead, that would take the type of the
> > notification as a parameter (we could have an enum for those), and
> > then the specific object(s) for each type as another paramter (RDO I
> > guess in this case)?
> > 
> > It would then be up to the TCPC driver to extract the detail it needs
> > from that object. That would somehow feel more cleaner to me, but what
> > do you guys think?
> 
> It's pretty much the same thing, a "mux" function vs. individual
> function calls.  Personally, individual callbacks are much more
> explicit, and I think make it easier to determine what is really going
> on in each driver.
> 
> But it all does the same thing, if there's going to be loads of
> callbacks needed, then a single one makes it easier to maintain over
> time.
> 
> So it's up to the maintainer what they want to see :)

I understand your point, and I guess a "generic" notification callback
for all that would not be a good idea. However, right now it looks
like we are picking individual bits from various PD objects with those
callbacks, and that does not feel ideal to me either. After all, each of
those bits has its own flag now, even though the details is just
extracted from some PD object that we should also have access to.

I think there are ways we can improve this for example by attempting
to create the notifications per transaction instead of for each
individual result of those transactions. That way we would not need to
store the flags at least because we could deliver the entire object
that was the result of the specific transaction.

So basically, I fear that dealing with these individual bits will in
many case only serve individual device drivers, and in the worst case
start making the tcpm.c a bit more difficult to manage if we start to
have more and more of these bit callbacks.

But on the other hand, I guess we are nowhere near that point, so
let's forget about this for now.


thanks,

-- 
heikki
