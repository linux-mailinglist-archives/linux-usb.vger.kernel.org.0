Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C46615C99F
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 18:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727707AbgBMRmL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 12:42:11 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:56040 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgBMRmL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Feb 2020 12:42:11 -0500
Received: by mail-pj1-f67.google.com with SMTP id d5so2673012pjz.5
        for <linux-usb@vger.kernel.org>; Thu, 13 Feb 2020 09:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Q5Vh2NxMqvs2OdmzMJW9vXRg7HNi12k3c/OFIznLWaU=;
        b=N34QxMKzZmtvlcPrxdNyvsTfNTUhpvcxeFPyeo41rk68oGYlL5rSsfQEJx91mrQsvs
         mkWvDI37RuPXYcyeNCJXM7jaNSVJfVXHCe8mkQh78jRuKiL7pIkRi7wLXzS+rFOa+fBb
         Btbyo7vCCvm5h/toy7FnIgDTLWnFNdqMbiJknZ/aA+m7RJPHWiTXESHgo898bcVI0jwr
         kPtpdNCdg5dYzMb+7TSLrvUXaQ0R+VZTG+OB6vEzaSgANkyxxduD9YmNaDwV1uKGLIUD
         RQMgjrlrZ7g299JcJ4ZanTdmcB6ErSOYArEW6LvQE7iysTUpbPwb92kxpNec7UfEYsrR
         5FVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Q5Vh2NxMqvs2OdmzMJW9vXRg7HNi12k3c/OFIznLWaU=;
        b=C8AGkzIFuTmTG1Y9Iu+HBNqOHswBm7KjzYljdUkRionAYKq4ThhF4/koGpPs5/gi7T
         ZgF3H544gSQwMbwLRdGdzURzAmbBRQAdf2XxUzWBvQS/9CwuwHjVsMgCTZprx8E0iGaQ
         11e1hagVqmTPwBFnhj4xJltgXGDDLDmMJv6tU8StMi3RdtUDgM0UjX68ftx1Lz4jOGuy
         moCj0RguaRW7+sXK9WpzwyEdxsl2oqYaAc2NY8u9+CUSQtXvo8myX/rKdL528hb1TqT0
         XDeDjhw4AIdfhkAlPYn13UQL9CCVjG8+D/DRCsWmU4iwzocTjeJnkzbnI5J3YfICXKQE
         raQQ==
X-Gm-Message-State: APjAAAXy9ZA4OPypveG/rXe5dj2hWJxkcc3teNg1LDPfAoQz9fnTxYvV
        Zy7uibDtnkLKI7cIYFsv/VkbSeco
X-Google-Smtp-Source: APXvYqzcmkTSkQQCh4KoBhZvmja35V53Ap7AErX/wu0j+0w7fczpbrHzBC9PiRoIUIZV8UmOoiyTcA==
X-Received: by 2002:a17:902:7603:: with SMTP id k3mr29200127pll.240.1581615728633;
        Thu, 13 Feb 2020 09:42:08 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l73sm3962245pge.44.2020.02.13.09.42.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 09:42:07 -0800 (PST)
Date:   Thu, 13 Feb 2020 09:42:06 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     jun.li@nxp.com, gregkh@linuxfoundation.org, linux-imx@nxp.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: tcpm: set correct data role for non-DRD
Message-ID: <20200213174206.GA5761@roeck-us.net>
References: <1581487203-27499-1-git-send-email-jun.li@nxp.com>
 <20200213171216.GO1498@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213171216.GO1498@kuha.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 13, 2020 at 07:12:16PM +0200, Heikki Krogerus wrote:
> Hi,
> 
> On Wed, Feb 12, 2020 at 02:00:03PM +0800, jun.li@nxp.com wrote:
> > From: Li Jun <jun.li@nxp.com>
> > 
> > Since the typec port data role is separated from power role,
> > so check the port data capability when setting data role.
> > 
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> 
> You forgot the change log. I put a minor nitpick bellow, but feel
> free to ignore it if there are no other comments.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 53 ++++++++++++++++++++++++++++++++++---------
> >  1 file changed, 42 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > index f3087ef..7009644 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -788,10 +788,30 @@ static int tcpm_set_roles(struct tcpm_port *port, bool attached,
> >  	else
> >  		orientation = TYPEC_ORIENTATION_REVERSE;
> >  
> > -	if (data == TYPEC_HOST)
> > -		usb_role = USB_ROLE_HOST;
> > -	else
> > -		usb_role = USB_ROLE_DEVICE;
> > +	if (port->typec_caps.data == TYPEC_PORT_DRD) {
> > +		if (data == TYPEC_HOST)
> > +			usb_role = USB_ROLE_HOST;
> > +		else
> > +			usb_role = USB_ROLE_DEVICE;
> > +	} else if (port->typec_caps.data == TYPEC_PORT_DFP) {
> > +		if (data == TYPEC_HOST) {
> > +			if (role == TYPEC_SOURCE)
> > +				usb_role = USB_ROLE_HOST;
> > +			else
> > +				usb_role = USB_ROLE_NONE;
> > +		} else {
> > +			return -ENOTSUPP;
> > +		}
> > +	} else {
> > +		if (data == TYPEC_DEVICE) {
> > +			if (role == TYPEC_SINK)
> > +				usb_role = USB_ROLE_DEVICE;
> > +			else
> > +				usb_role = USB_ROLE_NONE;
> > +		} else {
> > +			return -ENOTSUPP;
> > +		}
> > +	}
> >  
> >  	ret = tcpm_mux_set(port, TYPEC_STATE_USB, usb_role, orientation);
> >  	if (ret < 0)
> > @@ -1817,7 +1837,7 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
> >  		tcpm_set_state(port, SOFT_RESET, 0);
> >  		break;
> >  	case PD_CTRL_DR_SWAP:
> > -		if (port->port_type != TYPEC_PORT_DRP) {
> > +		if (port->typec_caps.data != TYPEC_PORT_DRD) {
> >  			tcpm_queue_message(port, PD_MSG_CTRL_REJECT);
> >  			break;
> >  		}
> > @@ -2609,6 +2629,9 @@ static int tcpm_src_attach(struct tcpm_port *port)
> >  	enum typec_cc_polarity polarity =
> >  				port->cc2 == TYPEC_CC_RD ? TYPEC_POLARITY_CC2
> >  							 : TYPEC_POLARITY_CC1;
> > +	enum typec_data_role data_role =
> > +				port->typec_caps.data == TYPEC_PORT_UFP ?
> > +				TYPEC_DEVICE : TYPEC_HOST;
> 
> To me something like this would be more readable:
> 
> 	enum typec_data_role data_role = TYPEC_HOST;
> 
>         if (port->typec_caps.data == TYPEC_PORT_UFP)
>                 data_role = TYPEC_DEVICE;
> 
> It does not actually add any lines in this case.
> 

A macro for those might be even better readable, especially since
the same sequence is needed several times.

Guenter

> >  	int ret;
> >  
> >  	if (port->attached)
> > @@ -2618,7 +2641,7 @@ static int tcpm_src_attach(struct tcpm_port *port)
> >  	if (ret < 0)
> >  		return ret;
> >  
> > -	ret = tcpm_set_roles(port, true, TYPEC_SOURCE, TYPEC_HOST);
> > +	ret = tcpm_set_roles(port, true, TYPEC_SOURCE, data_role);
> >  	if (ret < 0)
> >  		return ret;
> >  
> > @@ -2730,6 +2753,9 @@ static void tcpm_src_detach(struct tcpm_port *port)
> >  
> >  static int tcpm_snk_attach(struct tcpm_port *port)
> >  {
> > +	enum typec_data_role data_role =
> > +				port->typec_caps.data == TYPEC_PORT_DFP ?
> > +				TYPEC_HOST : TYPEC_DEVICE;
> 
> ditto.
> 
> >  	int ret;
> >  
> >  	if (port->attached)
> > @@ -2740,7 +2766,7 @@ static int tcpm_snk_attach(struct tcpm_port *port)
> >  	if (ret < 0)
> >  		return ret;
> >  
> > -	ret = tcpm_set_roles(port, true, TYPEC_SINK, TYPEC_DEVICE);
> > +	ret = tcpm_set_roles(port, true, TYPEC_SINK, data_role);
> >  	if (ret < 0)
> >  		return ret;
> >  
> > @@ -2761,12 +2787,15 @@ static void tcpm_snk_detach(struct tcpm_port *port)
> >  
> >  static int tcpm_acc_attach(struct tcpm_port *port)
> >  {
> > +	enum typec_data_role data_role =
> > +				port->typec_caps.data == TYPEC_PORT_UFP ?
> > +				TYPEC_DEVICE : TYPEC_HOST;
> 
> Here as well.
> 
> >  	int ret;
> >  
> >  	if (port->attached)
> >  		return 0;
> >  
> > -	ret = tcpm_set_roles(port, true, TYPEC_SOURCE, TYPEC_HOST);
> > +	ret = tcpm_set_roles(port, true, TYPEC_SOURCE, data_role);
> >  	if (ret < 0)
> >  		return ret;
> >  
> > @@ -3293,7 +3322,8 @@ static void run_state_machine(struct tcpm_port *port)
> >  		tcpm_set_vconn(port, true);
> >  		tcpm_set_vbus(port, false);
> >  		tcpm_set_roles(port, port->self_powered, TYPEC_SOURCE,
> > -			       TYPEC_HOST);
> > +			       port->typec_caps.data == TYPEC_PORT_UFP ?
> > +			       TYPEC_DEVICE : TYPEC_HOST);
> >  		tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, PD_T_SRC_RECOVER);
> >  		break;
> >  	case SRC_HARD_RESET_VBUS_ON:
> > @@ -3308,7 +3338,8 @@ static void run_state_machine(struct tcpm_port *port)
> >  		if (port->pd_capable)
> >  			tcpm_set_charge(port, false);
> >  		tcpm_set_roles(port, port->self_powered, TYPEC_SINK,
> > -			       TYPEC_DEVICE);
> > +			       port->typec_caps.data == TYPEC_PORT_DFP ?
> > +			       TYPEC_HOST : TYPEC_DEVICE);
> >  		/*
> >  		 * VBUS may or may not toggle, depending on the adapter.
> >  		 * If it doesn't toggle, transition to SNK_HARD_RESET_SINK_ON
> > @@ -3969,7 +4000,7 @@ static int tcpm_dr_set(struct typec_port *p, enum typec_data_role data)
> >  	mutex_lock(&port->swap_lock);
> >  	mutex_lock(&port->lock);
> >  
> > -	if (port->port_type != TYPEC_PORT_DRP) {
> > +	if (port->typec_caps.data != TYPEC_PORT_DRD) {
> >  		ret = -EINVAL;
> >  		goto port_unlock;
> >  	}
> > -- 
> > 2.7.4
> 
> thanks,
> 
> -- 
> heikki
