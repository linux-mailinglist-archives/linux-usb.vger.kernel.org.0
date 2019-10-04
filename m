Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C38B2CB697
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2019 10:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728767AbfJDIpR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Oct 2019 04:45:17 -0400
Received: from mga02.intel.com ([134.134.136.20]:9621 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbfJDIpR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Oct 2019 04:45:17 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Oct 2019 01:45:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,255,1566889200"; 
   d="scan'208";a="205809177"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 04 Oct 2019 01:45:13 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 04 Oct 2019 11:45:12 +0300
Date:   Fri, 4 Oct 2019 11:45:12 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/7] usb: typec: Separate the operations vector
Message-ID: <20191004084512.GF1048@kuha.fi.intel.com>
References: <20191001094858.68643-1-heikki.krogerus@linux.intel.com>
 <20191001094858.68643-4-heikki.krogerus@linux.intel.com>
 <6378359b-cf1b-eb8a-997d-8102ee6ee241@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6378359b-cf1b-eb8a-997d-8102ee6ee241@roeck-us.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 01, 2019 at 06:22:36AM -0700, Guenter Roeck wrote:
> On 10/1/19 2:48 AM, Heikki Krogerus wrote:
> > Introducing struct typec_operations which has the same
> > callbacks as struct typec_capability. The old callbacks are
> > kept for now, but after all users have been converted, they
> > will be removed.
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >   drivers/usb/typec/class.c | 90 +++++++++++++++++++++++++--------------
> >   include/linux/usb/typec.h | 19 +++++++++
> >   2 files changed, 76 insertions(+), 33 deletions(-)
> > 
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 9fab0be8f08c..542be63795db 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -59,6 +59,7 @@ struct typec_port {
> >   	struct typec_mux		*mux;
> >   	const struct typec_capability	*cap;
> > +	const struct typec_operations	*ops;
> >   };
> >   #define to_typec_port(_dev_) container_of(_dev_, struct typec_port, dev)
> > @@ -961,11 +962,6 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
> >   		return -EOPNOTSUPP;
> >   	}
> > -	if (!port->cap->try_role) {
> > -		dev_dbg(dev, "Setting preferred role not supported\n");
> > -		return -EOPNOTSUPP;
> > -	}
> > -
> >   	role = sysfs_match_string(typec_roles, buf);
> >   	if (role < 0) {
> >   		if (sysfs_streq(buf, "none"))
> > @@ -974,9 +970,18 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
> >   			return -EINVAL;
> >   	}
> > -	ret = port->cap->try_role(port->cap, role);
> > -	if (ret)
> > -		return ret;
> > +	if (port->ops && port->ops->try_role) {
> > +		ret = port->ops->try_role(port, role);
> > +		if (ret)
> > +			return ret;
> > +	} else if (port->cap && port->cap->try_role) {
> > +		ret = port->cap->try_role(port->cap, role);
> > +		if (ret)
> > +			return ret;
> > +	} else {
> > +		dev_dbg(dev, "Setting preferred role not supported\n");
> > +		return -EOPNOTSUPP;
> > +	}
> 
> This is a semantic change: Support is now checked _after_ the string is evaluated.
> I understand the reason, but it should be noted in the patch description
> (not sure if it is worth it, though - it seems to me it makes the code more
> difficult to read).
> 
> >   	port->prefer_role = role;
> >   	return size;
> > @@ -1005,11 +1010,6 @@ static ssize_t data_role_store(struct device *dev,
> >   	struct typec_port *port = to_typec_port(dev);
> >   	int ret;
> > -	if (!port->cap->dr_set) {
> > -		dev_dbg(dev, "data role swapping not supported\n");
> > -		return -EOPNOTSUPP;
> > -	}
> > -
> >   	ret = sysfs_match_string(typec_data_roles, buf);
> >   	if (ret < 0)
> >   		return ret;
> > @@ -1020,9 +1020,19 @@ static ssize_t data_role_store(struct device *dev,
> >   		goto unlock_and_ret;
> >   	}
> > -	ret = port->cap->dr_set(port->cap, ret);
> > -	if (ret)
> > +	if (port->ops && port->ops->dr_set) {
> > +		ret = port->ops->dr_set(port, ret);
> > +		if (ret)
> > +			goto unlock_and_ret;
> > +	} else if (port->cap && port->cap->dr_set) {
> > +		ret = port->cap->dr_set(port->cap, ret);
> > +		if (ret)
> > +			goto unlock_and_ret;
> > +	} else {
> > +		dev_dbg(dev, "data role swapping not supported\n");
> > +		ret = -EOPNOTSUPP;
> >   		goto unlock_and_ret;
> 
> This really makes me wonder if the semantic change makes sense. Support
> is now evaluated _after_ the lock has been obtained. That seems like a
> waste.

OK, I'll re-think this.

> > +	}
> >   	ret = size;
> >   unlock_and_ret:
> > @@ -1055,11 +1065,6 @@ static ssize_t power_role_store(struct device *dev,
> >   		return -EOPNOTSUPP;
> >   	}
> > -	if (!port->cap->pr_set) {
> > -		dev_dbg(dev, "power role swapping not supported\n");
> > -		return -EOPNOTSUPP;
> > -	}
> > -
> >   	if (port->pwr_opmode != TYPEC_PWR_MODE_PD) {
> >   		dev_dbg(dev, "partner unable to swap power role\n");
> >   		return -EIO;
> > @@ -1077,11 +1082,21 @@ static ssize_t power_role_store(struct device *dev,
> >   		goto unlock_and_ret;
> >   	}
> > -	ret = port->cap->pr_set(port->cap, ret);
> > -	if (ret)
> > +	if (port->ops && port->ops->pr_set) {
> > +		ret = port->ops->pr_set(port, ret);
> > +		if (ret)
> > +			goto unlock_and_ret;
> > +	} else if (port->cap && port->cap->pr_set) {
> > +		ret = port->cap->pr_set(port->cap, ret);
> > +		if (ret)
> > +			goto unlock_and_ret;
> > +	} else {
> > +		dev_dbg(dev, "power role swapping not supported\n");
> > +		ret = -EOPNOTSUPP;
> >   		goto unlock_and_ret;
> > -
> > +	}
> >   	ret = size;
> > +
> >   unlock_and_ret:
> >   	mutex_unlock(&port->port_type_lock);
> >   	return ret;
> > @@ -1108,7 +1123,8 @@ port_type_store(struct device *dev, struct device_attribute *attr,
> >   	int ret;
> >   	enum typec_port_type type;
> > -	if (!port->cap->port_type_set || port->fixed_role != TYPEC_PORT_DRP) {
> > +	if ((!port->ops || !port->ops->port_type_set) ||
> > +	    !port->cap->port_type_set || port->fixed_role != TYPEC_PORT_DRP) {
> 
> The above now requires _all_ callbacks to exist, both ops and cap based ones.
> Is that on purpose ? Maybe this should be as follows ?
> 
> 	if (((!port->ops || !port->ops->port_type_set) &&
> 	     !port->cap->port_type_set) || port->fixed_role != TYPEC_PORT_DRP) {
> 
> or a bit better to read
> 	if (port->fixed_role != TYPEC_PORT_DRP ||
> 	    ((!port->ops || !port->ops->port_type_set) && !port->cap->port_type_set))

OK.


thanks,

-- 
heikki
