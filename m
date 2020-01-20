Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1229142C8B
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 14:51:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgATNvL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 08:51:11 -0500
Received: from mga11.intel.com ([192.55.52.93]:10642 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726819AbgATNvL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jan 2020 08:51:11 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jan 2020 05:51:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; 
   d="scan'208";a="275397834"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 20 Jan 2020 05:51:08 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 20 Jan 2020 15:51:07 +0200
Date:   Mon, 20 Jan 2020 15:51:07 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Jun Li <jun.li@nxp.com>
Cc:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/2] usb: typec: tcpm: set correct data role for non-DRD
Message-ID: <20200120135107.GD32175@kuha.fi.intel.com>
References: <1577442957-6921-1-git-send-email-jun.li@nxp.com>
 <20200109115224.GC29437@kuha.fi.intel.com>
 <VE1PR04MB65285B642821DAD91C2F692389380@VE1PR04MB6528.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VE1PR04MB65285B642821DAD91C2F692389380@VE1PR04MB6528.eurprd04.prod.outlook.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jun,

On Fri, Jan 10, 2020 at 10:41:31AM +0000, Jun Li wrote:
> > -----Original Message-----
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Sent: 2020年1月9日 19:52
> > To: Jun Li <jun.li@nxp.com>
> > Cc: linux@roeck-us.net; gregkh@linuxfoundation.org; dl-linux-imx
> > <linux-imx@nxp.com>; linux-usb@vger.kernel.org
> > Subject: Re: [PATCH 2/2] usb: typec: tcpm: set correct data role for non-DRD
> > 
> > Hi Jun,
> > 
> > Where's the 1/2 of this series?
> 
> 1/2 patch is for controller driver change, so not TO or CC you in mail list.
> Will pay attention this to avoid confuse.
> 
> > 
> > On Fri, Dec 27, 2019 at 10:39:17AM +0000, Jun Li wrote:
> > > From: Li Jun <jun.li@nxp.com>
> > >
> > > Since the typec port data role is separated from power role, so check
> > > the port data capability when setting data role.
> > >
> > > Signed-off-by: Li Jun <jun.li@nxp.com>
> > > ---
> > >  drivers/usb/typec/tcpm/tcpm.c | 24 +++++++++++++++++-------
> > >  1 file changed, 17 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/usb/typec/tcpm/tcpm.c
> > > b/drivers/usb/typec/tcpm/tcpm.c index 56fc356..1f0d82e 100644
> > > --- a/drivers/usb/typec/tcpm/tcpm.c
> > > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > > @@ -780,7 +780,7 @@ static int tcpm_set_roles(struct tcpm_port *port,
> > bool attached,
> > >  			  enum typec_role role, enum typec_data_role data)  {
> > >  	enum typec_orientation orientation;
> > > -	enum usb_role usb_role;
> > > +	enum usb_role usb_role = USB_ROLE_NONE;
> > >  	int ret;
> > >
> > >  	if (port->polarity == TYPEC_POLARITY_CC1) @@ -788,10 +788,20 @@
> > > static int tcpm_set_roles(struct tcpm_port *port, bool attached,
> > >  	else
> > >  		orientation = TYPEC_ORIENTATION_REVERSE;
> > >
> > > -	if (data == TYPEC_HOST)
> > > -		usb_role = USB_ROLE_HOST;
> > > -	else
> > > -		usb_role = USB_ROLE_DEVICE;
> > > +	if (port->typec_caps.data == TYPEC_PORT_DRD) {
> > > +		if (data == TYPEC_HOST)
> > > +			usb_role = USB_ROLE_HOST;
> > > +		else
> > > +			usb_role = USB_ROLE_DEVICE;
> > > +	} else if (port->typec_caps.data == TYPEC_PORT_DFP) {
> > > +		if (data == TYPEC_HOST)
> > > +			usb_role = USB_ROLE_HOST;
> > > +		data = TYPEC_HOST;
> > 
> > So if data != host, tcpc is told that data == host, but the mux is set to
> > USB_ROLE_NONE. So why tcpc needs to think the role is host in that case?
> 
> enum usb_role {
> 	USB_ROLE_NONE,
> 	USB_ROLE_HOST,
> 	USB_ROLE_DEVICE,
> };
> 
> enum typec_data_role {
> 	TYPEC_DEVICE,
> 	TYPEC_HOST,
> };
> 
> If the port only support DFP(host), I think we should never tell tcpc the data
> is TYPEC_DEVICE, so TYPEC_HOST. 

But we should also not have to "lie" and force the role into something
that works.

> > Shouldn't this function actually return error if the port is DFP only, and
> > TYPEC_DEVICE is requested?
> 
> Current TCPM use one API to set both power and data role, doesn't consider
> the case of dual power role but single data role. Return error in tcpm_set_roles()
> may lose the setting for power role, I think the current change is use correct
> data role value when call to tcpm_set_roles().
> For simple, I didn't change the caller places of tcpm_set_roles(), so just override the
> data and usb_role to be reasonable value here.

I think the correct thing to do would be to fix the places where the
function is called, and here return error if the unsupported role is
attempted. I hate to be picky, but this looks like a workaround that
may potentially hide real issues in the code.


> > > +	} else {
> > > +		if (data == TYPEC_DEVICE)
> > > +			usb_role = USB_ROLE_DEVICE;
> > > +		data = TYPEC_DEVICE;
> > > +	}
> > >
> > >  	ret = tcpm_mux_set(port, TYPEC_STATE_USB, usb_role, orientation);
> > >  	if (ret < 0)
> > > @@ -1817,7 +1827,7 @@ static void tcpm_pd_ctrl_request(struct
> > tcpm_port *port,
> > >  		tcpm_set_state(port, SOFT_RESET, 0);
> > >  		break;
> > >  	case PD_CTRL_DR_SWAP:
> > > -		if (port->port_type != TYPEC_PORT_DRP) {
> > > +		if (port->typec_caps.data != TYPEC_PORT_DRD) {
> > >  			tcpm_queue_message(port, PD_MSG_CTRL_REJECT);
> > >  			break;
> > >  		}
> > > @@ -3969,7 +3979,7 @@ static int tcpm_dr_set(struct typec_port *p,
> > enum typec_data_role data)
> > >  	mutex_lock(&port->swap_lock);
> > >  	mutex_lock(&port->lock);
> > >
> > > -	if (port->port_type != TYPEC_PORT_DRP) {
> > > +	if (port->typec_caps.data != TYPEC_PORT_DRD) {
> > >  		ret = -EINVAL;
> > >  		goto port_unlock;
> > >  	}
> > > --
> > > 2.7.4

thanks,

-- 
heikki
