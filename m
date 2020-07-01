Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7229B210DE8
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 16:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731520AbgGAOkS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 10:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbgGAOkR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 10:40:17 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7442AC08C5C1
        for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2020 07:40:17 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id m22so1446284pgv.9
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2020 07:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4FgHvZZVgdyymM92Fb8vFGltB0PHWsBIdWxw1r3qvTY=;
        b=IyRr1HgUNMV3/xnbSCQxeCuxy2EJN9HtE45fI+v7gDCsax9UYXeGK9WTxy0ep/ariD
         AIg0EACGMY0bHwmGZZTDSImAPh2NBw46oP3AELBeZBBVp9fTSIOq7S0xfaj7D9LCRNrD
         VPSNrkMdWZO4HHiAgtCYTPxaEDdyULOv08lSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4FgHvZZVgdyymM92Fb8vFGltB0PHWsBIdWxw1r3qvTY=;
        b=N3VzQKgA5LpliSkeg4mvz01mUbnO2f4/lm7QdKvqRIf+nr0kaS6HDmkM8DOjf/Muyo
         MbltDF4gP4nqSn+cf8QPRFu1WS3iR2mUntp3hJDIRbpUB7+yr77iYdZ31Purghmo5M5J
         QfpVQCDYFrumNgZ2uCHcssKH0wXi5dgMqgyspuieMMKpjekrotQuSsKz2fkdmUtThScz
         uahvWPnBCx4bdva+IRyVvffEaRlRRfdT7qOPDuvNWI47WrA1HVUfjVNdR9SqI4kV+DCo
         yD4BCmisNYPmehQsF5Wok/i9w5XAUpLjbcNL4x7UzHVFWE1PFiqrOphTC/de4JGG85Um
         +j3A==
X-Gm-Message-State: AOAM530ZJe1IH/xfkrd2JseFiJ7ynCeh/VOJMzydTeRR5AAe+Dw4UrKR
        1xVAdJtspiX234nsw5JcTh7xKQ==
X-Google-Smtp-Source: ABdhPJw/TrycudhK3joRFzMe3f9wBtswJZJ2CWFhSU541t27z78CDDV3NqneU8UsRpI+evS4jbinqw==
X-Received: by 2002:a62:768d:: with SMTP id r135mr22440868pfc.198.1593614416917;
        Wed, 01 Jul 2020 07:40:16 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id r4sm5818107pgp.60.2020.07.01.07.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 07:40:16 -0700 (PDT)
Date:   Wed, 1 Jul 2020 07:40:15 -0700
From:   Prashant Malani <pmalani@chromium.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: typec: Add num_altmodes partner attribute
Message-ID: <20200701144015.GD235106@google.com>
References: <20200701003149.3101219-1-pmalani@chromium.org>
 <20200701082230.GF856968@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701082230.GF856968@kuha.fi.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

Thanks a lot for reviewing the patch.

On Wed, Jul 01, 2020 at 11:22:30AM +0300, Heikki Krogerus wrote:
> Hi Prashant,
> 
> On Tue, Jun 30, 2020 at 05:31:48PM -0700, Prashant Malani wrote:
> > Add a user-visible attribute for the number of alt modes available in a
> > partner. This allows userspace to determine whether there are any
> > remaining alt modes left to be registered by the kernel driver. It can
> > begin implementing any policy state machine after all available alt
> > modes have been registered with the connector class framework.
> > 
> > This value is set to "-1" initially, which is an invalid value,
> > signifying that a valid number of alt modes haven't been set for the
> > partner.
> > 
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > Cc: Benson Leung <bleung@chromium.org>
> > ---
> >  drivers/usb/typec/class.c | 34 ++++++++++++++++++++++++++++++++++
> >  include/linux/usb/typec.h |  1 +
> >  2 files changed, 35 insertions(+)
> 
> You need to add documentation for the file. Add an entry for it to
> Documentation/ABI/testing/sysfs-class-typec
> 

Ack.
Will add this in v2.
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index c9234748537a..680cbcfbd427 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -33,6 +33,7 @@ struct typec_partner {
> >  	struct usb_pd_identity		*identity;
> >  	enum typec_accessory		accessory;
> >  	struct ida			mode_ids;
> > +	int				num_altmodes;
> >  };
> >  
> >  struct typec_port {
> > @@ -532,9 +533,18 @@ static ssize_t supports_usb_power_delivery_show(struct device *dev,
> >  }
> >  static DEVICE_ATTR_RO(supports_usb_power_delivery);
> >  
> > +static ssize_t num_altmodes_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct typec_partner *p = to_typec_partner(dev);
> > +
> > +	return sprintf(buf, "%d\n", p->num_altmodes);
> > +}
> > +static DEVICE_ATTR_RO(num_altmodes);
> 
> This is up to you, but please consider naming the file
> "number_of_alternate_modes".
> 
Ack. Will update the name in v2.

> So now user space needs to understand that value -1 means "unknown",
> right?
> 
> If so, then I think it would probable be better to just hide the file
> until the actual number of alternate modes is known.
> 

SGTM.
> >  static struct attribute *typec_partner_attrs[] = {
> >  	&dev_attr_accessory_mode.attr,
> >  	&dev_attr_supports_usb_power_delivery.attr,
> > +	&dev_attr_num_altmodes.attr,
> >  	NULL
> >  };
> >  ATTRIBUTE_GROUPS(typec_partner);
> 
> -ATTRIBUTE_GROUPS(typec_partner);
> 
> static umode_t typec_partner_attr_is_visible(struct kobject *kobj,
>                                              struct attribute *attr, int n)
> {
>         struct typec_partner *partner = to_typec_partner(kobj_to_dev(kobj));
> 
>         if (attr == &dev_attr_num_altmodes.attr) {
>                 if (partner->num_altmodes < 0)
>                         return 0;
>         }
> 
>         return attr->mode;
> }
> 
> static struct attribute_group typec_partner_group = {
>         .is_visible = typec_partner_attr_is_visible,
>         .attrs = typec_partner_attrs
> };
> 
> static const struct attribute_group *typec_partner_groups[] = {
>         &typec_partner_group,
>         NULL
> };
> 

Nice, this is cool. Will make the modification in v2.

Best regards,

> > @@ -570,6 +580,29 @@ int typec_partner_set_identity(struct typec_partner *partner)
> >  }
> >  EXPORT_SYMBOL_GPL(typec_partner_set_identity);
> >  
> > +/**
> > + * typec_partner_set_num_altmodes - Update number of available altmodes
> > + * @partner: The partner to be updated
> > + * @num_alt_modes: The number of altmodes we want to specify as available
> > + *
> > + * This routine is used to report the number of alternate modes supported by the
> > + * partner. This value is *not* enforced in alt mode registration routines.
> > + *
> > + * @partner.num_altmodes is set to -1 on partner registration, denoting that
> > + * a valid value has not been set for it yet.
> > + */
> > +int typec_partner_set_num_altmodes(struct typec_partner *partner, int num_altmodes)
> > +{
> > +	if (num_altmodes < 0)
> > +		return -EINVAL;
> > +
> > +	partner->num_altmodes = num_altmodes;
> > +	sysfs_notify(&partner->dev.kobj, NULL, "num_altmodes");
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(typec_partner_set_num_altmodes);
> > +
> >  /**
> >   * typec_partner_register_altmode - Register USB Type-C Partner Alternate Mode
> >   * @partner: USB Type-C Partner that supports the alternate mode
> > @@ -612,6 +645,7 @@ struct typec_partner *typec_register_partner(struct typec_port *port,
> >  	ida_init(&partner->mode_ids);
> >  	partner->usb_pd = desc->usb_pd;
> >  	partner->accessory = desc->accessory;
> > +	partner->num_altmodes = -1;
> >  
> >  	if (desc->identity) {
> >  		/*
> > diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> > index 5daa1c49761c..ab523caa23a4 100644
> > --- a/include/linux/usb/typec.h
> > +++ b/include/linux/usb/typec.h
> > @@ -112,6 +112,7 @@ struct typec_altmode_desc {
> >  	enum typec_port_data	roles;
> >  };
> >  
> > +int typec_partner_set_num_altmodes(struct typec_partner *partner, int num_altmodes);
> >  struct typec_altmode
> >  *typec_partner_register_altmode(struct typec_partner *partner,
> >  				const struct typec_altmode_desc *desc);
> 
> thanks,
> 
> -- 
> heikki
