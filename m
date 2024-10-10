Return-Path: <linux-usb+bounces-15977-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1C4998436
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2024 12:53:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31C7328511D
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2024 10:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996801C2320;
	Thu, 10 Oct 2024 10:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9xIRkUA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E14E1BF80F
	for <linux-usb@vger.kernel.org>; Thu, 10 Oct 2024 10:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728557579; cv=none; b=R0GShB62Ts88AS8QCRxA/MVhOmo3W/HFEabDPP8jUG3IH1mTVPnA0zZhrVBEanKb0+Ga6FjRhswGtAzUEIPE1D4FHHU5S2lpnVXVzm8UCEcDaJIyNDXe2SaxKY9G0X/TaF3X/qRZ7v0zydCgVQroQ2ZKzwmeswiCSx4oZ12udeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728557579; c=relaxed/simple;
	bh=tpa7KIeQ7cfW46VicRriJhA2M4oWN1mls9V3JIO9aI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbYNNoqOT8afo4fVC12nF8bQ9/TwvaR+OqxGD1fgCJB6DMe3+WORMuahFvgpIYvywxxJQo6SDqCoMEt7iCF93YBOrhmc6Bf2EgDON2q22Xud9vw18Liet6HhUdN0dNqzopXyCyqa1ECsgQvEf5//Ko36EbrvZTYDrQvfmtO2HO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9xIRkUA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728557577; x=1760093577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tpa7KIeQ7cfW46VicRriJhA2M4oWN1mls9V3JIO9aI0=;
  b=n9xIRkUASxMLnJTFHvVh4BCf14WSM+3bN3FvQYSCnPMLf7VCUWN/5rXR
   mBleyy/Gv8lMcDyZHOtzYLT1ArPSwUn7JanC1abXwj7uGZ+lTQLWKwDXx
   ECN0QPJwEZ4s1ro8JQE7JYxCnWSlUz4X0uvR/KcTjFQ4l0vwm6+R+m7lP
   6mn4Rkq/4MpFgPkyPbnl7Y7ADSYyj83MVo0WSRKf+GopSiBxqq5PF0bd2
   DSxrMCDc8hwPwDG0S4BCj05n2FicmxwdWJnjE12Yr2CLX7zc1/5qYI6dL
   n/oJ+EjDY2yZqPcx56+7WVcd0IOEsx7oxtoUIQvZkdTIcr09DTTYGr2E0
   w==;
X-CSE-ConnectionGUID: Ra4I2fuJRSOl3/m1iexPEA==
X-CSE-MsgGUID: VANMnLGYQKKbpTs0EI56OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38477869"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="38477869"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 03:52:56 -0700
X-CSE-ConnectionGUID: jJv7Sn81SByz53Y1wLZIJQ==
X-CSE-MsgGUID: An0xEWJ+TmSWB/3gWdo2Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="76466907"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa009.jf.intel.com with SMTP; 10 Oct 2024 03:52:53 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 10 Oct 2024 13:52:52 +0300
Date: Thu, 10 Oct 2024 13:52:52 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/4] usb: typec: Add attribute file showing the USB
 Modes of the partner
Message-ID: <ZweyBHmk8K32s5-o@kuha.fi.intel.com>
References: <20241009154557.2836656-1-heikki.krogerus@linux.intel.com>
 <20241009154557.2836656-3-heikki.krogerus@linux.intel.com>
 <CANFp7mVuGabGvLd5M5WYK60sMMnkS1sD3noiVYc=k0Q=Vg4rdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANFp7mVuGabGvLd5M5WYK60sMMnkS1sD3noiVYc=k0Q=Vg4rdg@mail.gmail.com>

Hi Abhishek,

Thank you for the review.

On Wed, Oct 09, 2024 at 03:16:34PM -0700, Abhishek Pandit-Subedi wrote:
> On Wed, Oct 9, 2024 at 8:46 AM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > This attribute file shows the supported USB modes (USB 2.0,
> > USB 3.0 and USB4) of the partner, and the currently active
> > mode.
> >
> > The active mode is determined primarily by checking the
> > speed of the enumerated USB device. When USB Power Delivery
> > is supported, the active USB mode should be always the mode
> > that was used with the Enter_USB Message, regardless of the
> > result of the USB enumeration. The port drivers can
> > separately assign the mode with a dedicated API.
> >
> > If USB Power Delivery Identity is supplied for the partner
> > device, the supported modes are extracted from it.
> >
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >  Documentation/ABI/testing/sysfs-class-typec |  14 +++
> >  drivers/usb/typec/class.c                   | 123 +++++++++++++++++++-
> >  drivers/usb/typec/class.h                   |   2 +
> >  include/linux/usb/typec.h                   |   5 +
> >  4 files changed, 140 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
> > index 7c307f02d99e..866865ffeb66 100644
> > --- a/Documentation/ABI/testing/sysfs-class-typec
> > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > @@ -233,6 +233,20 @@ Description:
> >                 directory exists, it will have an attribute file for every VDO
> >                 in Discover Identity command result.
> >
> > +What:          /sys/class/typec/<port>-partner/usb_mode
> > +Date:          February 2024
> > +Contact:       Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > +Description:   The USB Modes that the partner device supports. The active mode
> > +               is disaplayed in brackets. The active USB mode can be changed by
> spelling: displayed

Thanks for catching that.

> > +               writing to this file when the port driver is able to send Data
> > +               Reset Message to the partner. That requires USB Power Delivery
> > +               contract between the partner and the port.
> > +
> > +               Valid values:
> > +               - usb2 (USB 2.0)
> > +               - usb3 (USB 3.2)
> > +               - usb4 (USB4)
> > +
> >  USB Type-C cable devices (eg. /sys/class/typec/port0-cable/)
> >
> >  Note: Electronically Marked Cables will have a device also for one cable plug
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 9c26d2ad40df..f25cc20a2024 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -618,6 +618,74 @@ EXPORT_SYMBOL_GPL(typec_unregister_altmode);
> >  /* ------------------------------------------------------------------------- */
> >  /* Type-C Partners */
> >
> > +/**
> > + * typec_partner_set_usb_mode - Assign active USB Mode for the partner
> > + * @partner: USB Type-C partner
> > + * @mode: USB Mode (USB2, USB3 or USB4)
> > + *
> > + * The port drivers can use this function to assign the active USB Mode to
> > + * @partner. The USB Mode can change for example due to Data Reset.
> > + */
> > +void typec_partner_set_usb_mode(struct typec_partner *partner, enum usb_mode mode)
> > +{
> > +       if (!partner || partner->usb_mode == mode)
> > +               return;
> > +
> > +       partner->usb_capability |= BIT(mode - 1);
> > +       partner->usb_mode = mode;
> > +       sysfs_notify(&partner->dev.kobj, NULL, "usb_mode");
> > +}
> > +EXPORT_SYMBOL_GPL(typec_partner_set_usb_mode);
> > +
> > +static ssize_t
> > +usb_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +       struct typec_partner *partner = to_typec_partner(dev);
> > +       int len = 0;
> > +       int i;
> > +
> > +       for (i = USB_MODE_USB2; i < USB_MODE_USB4 + 1; i++) {
> > +               if (!(BIT(i - 1) & partner->usb_capability))
> > +                       continue;
> > +
> > +               if (i == partner->usb_mode)
> > +                       len += sysfs_emit_at(buf, len, "[%s] ", usb_modes[i]);
> > +               else
> > +                       len += sysfs_emit_at(buf, len, "%s ", usb_modes[i]);
> > +       }
> > +
> > +       buf[len - 1] = '\n';
> > +       return len;
> > +}
> > +
> > +static ssize_t usb_mode_store(struct device *dev, struct device_attribute *attr,
> > +                             const char *buf, size_t size)
> > +{
> > +       struct typec_partner *partner = to_typec_partner(dev);
> > +       struct typec_port *port = to_typec_port(dev->parent);
> > +       int mode;
> > +       int ret;
> > +
> > +       if (!port->ops || !port->ops->data_reset)
> > +               return -EOPNOTSUPP;
> > +
> > +       mode = sysfs_match_string(usb_modes, buf);
> > +       if (mode < 0)
> > +               return mode;
> > +
> > +       if (mode == partner->usb_mode)
> > +               return size;
> > +
> > +       ret = port->ops->data_reset(port, mode);
> > +       if (ret)
> > +               return ret;
> > +
> > +       typec_partner_set_usb_mode(partner, mode);
> > +
> > +       return size;
> > +}
> > +static DEVICE_ATTR_RW(usb_mode);
> > +
> >  static ssize_t accessory_mode_show(struct device *dev,
> >                                    struct device_attribute *attr,
> >                                    char *buf)
> > @@ -664,6 +732,7 @@ static struct attribute *typec_partner_attrs[] = {
> >         &dev_attr_supports_usb_power_delivery.attr,
> >         &dev_attr_number_of_alternate_modes.attr,
> >         &dev_attr_type.attr,
> > +       &dev_attr_usb_mode.attr,
> >         &dev_attr_usb_power_delivery_revision.attr,
> >         NULL
> >  };
> > @@ -671,6 +740,14 @@ static struct attribute *typec_partner_attrs[] = {
> >  static umode_t typec_partner_attr_is_visible(struct kobject *kobj, struct attribute *attr, int n)
> >  {
> >         struct typec_partner *partner = to_typec_partner(kobj_to_dev(kobj));
> > +       struct typec_port *port = to_typec_port(partner->dev.parent);
> > +
> > +       if (attr == &dev_attr_usb_mode.attr) {
> > +               if (!partner->usb_capability)
> > +                       return 0;
> > +               if (!port->ops || !port->ops->data_reset)
> > +                       return 0444;
> > +       }
> >
> >         if (attr == &dev_attr_number_of_alternate_modes.attr) {
> >                 if (partner->num_altmodes < 0)
> > @@ -744,10 +821,33 @@ static void typec_partner_unlink_device(struct typec_partner *partner, struct de
> >   */
> >  int typec_partner_set_identity(struct typec_partner *partner)
> >  {
> > -       if (!partner->identity)
> > +       u8 usb_capability = partner->usb_capability;
> > +       struct device *dev = &partner->dev;
> > +       struct usb_pd_identity *id;
> > +
> > +       id = get_pd_identity(dev);
> > +       if (!id)
> >                 return -EINVAL;
> >
> > -       typec_report_identity(&partner->dev);
> > +       if (to_typec_port(dev->parent)->data_role == TYPEC_HOST)  {
> > +               u32 devcap = PD_VDO_UFP_DEVCAP(id->vdo[0]);
> > +
> > +               if (devcap & (DEV_USB2_CAPABLE | DEV_USB2_BILLBOARD))
> > +                       usb_capability |= USB_CAPABILITY_USB2;
> > +               if (devcap & DEV_USB3_CAPABLE)
> > +                       usb_capability |= USB_CAPABILITY_USB3;
> > +               if (devcap & DEV_USB4_CAPABLE)
> > +                       usb_capability |= USB_CAPABILITY_USB4;
> > +       } else {
> > +               usb_capability = PD_VDO_DFP_HOSTCAP(id->vdo[0]);
> > +       }
> > +
> > +       if (partner->usb_capability != usb_capability) {
> > +               partner->usb_capability = usb_capability;
> > +               sysfs_notify(&dev->kobj, NULL, "usb_mode");
> > +       }
> > +
> > +       typec_report_identity(dev);
> >         return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(typec_partner_set_identity);
> > @@ -917,6 +1017,7 @@ struct typec_partner *typec_register_partner(struct typec_port *port,
> >         partner->usb_pd = desc->usb_pd;
> >         partner->accessory = desc->accessory;
> >         partner->num_altmodes = -1;
> > +       partner->usb_capability = desc->usb_capability;
> >         partner->pd_revision = desc->pd_revision;
> >         partner->svdm_version = port->cap->svdm_version;
> >         partner->attach = desc->attach;
> > @@ -936,6 +1037,15 @@ struct typec_partner *typec_register_partner(struct typec_port *port,
> >         partner->dev.type = &typec_partner_dev_type;
> >         dev_set_name(&partner->dev, "%s-partner", dev_name(&port->dev));
> >
> > +       if (port->usb2_dev) {
> > +               partner->usb_capability |= USB_CAPABILITY_USB2;
> > +               partner->usb_mode = USB_MODE_USB2;
> > +       }
> > +       if (port->usb3_dev) {
> > +               partner->usb_capability |= USB_CAPABILITY_USB2 | USB_CAPABILITY_USB3;
> > +               partner->usb_mode = USB_MODE_USB3;
> > +       }
> > +
> >         ret = device_register(&partner->dev);
> >         if (ret) {
> >                 dev_err(&port->dev, "failed to register partner (%d)\n", ret);
> > @@ -1935,13 +2045,18 @@ static void typec_partner_attach(struct typec_connector *con, struct device *dev
> >         struct typec_port *port = container_of(con, struct typec_port, con);
> >         struct typec_partner *partner = typec_get_partner(port);
> >         struct usb_device *udev = to_usb_device(dev);
> > +       enum usb_mode usb_mode;
> >
> > -       if (udev->speed < USB_SPEED_SUPER)
> > +       if (udev->speed < USB_SPEED_SUPER) {
> > +               usb_mode = USB_MODE_USB2;
> >                 port->usb2_dev = dev;
> > -       else
> > +       } else {
> > +               usb_mode = USB_MODE_USB3;
> >                 port->usb3_dev = dev;
> > +       }
> >
> >         if (partner) {
> > +               typec_partner_set_usb_mode(partner, usb_mode);
> >                 typec_partner_link_device(partner, dev);
> >                 put_device(&partner->dev);
> >         }
> > diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
> > index 85bc50aa54f7..b3076a24ad2e 100644
> > --- a/drivers/usb/typec/class.h
> > +++ b/drivers/usb/typec/class.h
> > @@ -35,6 +35,8 @@ struct typec_partner {
> >         int                             num_altmodes;
> >         u16                             pd_revision; /* 0300H = "3.0" */
> >         enum usb_pd_svdm_ver            svdm_version;
> > +       enum usb_mode                   usb_mode;
> > +       u8                              usb_capability;
> >
> >         struct usb_power_delivery       *pd;
> >
> > diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> > index d8999472212d..c35221b0e164 100644
> > --- a/include/linux/usb/typec.h
> > +++ b/include/linux/usb/typec.h
> > @@ -220,6 +220,7 @@ struct typec_cable_desc {
> >   * @accessory: Audio, Debug or none.
> >   * @identity: Discover Identity command data
> >   * @pd_revision: USB Power Delivery Specification Revision if supported
> > + * @usb_capability: Supported USB Modes
> >   * @attach: Notification about attached USB device
> >   * @deattach: Notification about removed USB device
> >   *
> > @@ -237,6 +238,7 @@ struct typec_partner_desc {
> >         enum typec_accessory    accessory;
> >         struct usb_pd_identity  *identity;
> >         u16                     pd_revision; /* 0300H = "3.0" */
> > +       u8                      usb_capability;
> >
> >         void (*attach)(struct typec_partner *partner, struct device *dev);
> >         void (*deattach)(struct typec_partner *partner, struct device *dev);
> > @@ -252,6 +254,7 @@ struct typec_partner_desc {
> >   * @pd_get: Get available USB Power Delivery Capabilities.
> >   * @pd_set: Set USB Power Delivery Capabilities.
> >   * @usb_mode_set: Set the USB Mode to be used with Enter_USB message
> > + * @data_reset: Set new USB mode by using the Data Reset message
> >   */
> >  struct typec_operations {
> >         int (*try_role)(struct typec_port *port, int role);
> > @@ -263,6 +266,7 @@ struct typec_operations {
> >         struct usb_power_delivery **(*pd_get)(struct typec_port *port);
> >         int (*pd_set)(struct typec_port *port, struct usb_power_delivery *pd);
> >         int (*usb_mode_set)(struct typec_port *port, enum usb_mode mode);
> > +       int (*data_reset)(struct typec_port *port, enum usb_mode mode);
> 
> I have a problem with the naming of these two functions,
> "usb_mode_set" and "data_reset".
> 
> The former, usb_mode_set, seems to exist to set the default USB mode
> on data reset. The latter, data_reset, seems to really be Data Reset +
> Enter_USB.
> 
> The former, "usb_mode_set", seems mostly useful to in-kernel TCPM to
> be able to set the default USB response after a data reset. UCSI (and
> cros_ec_typec on ChromeOS) doesn't expose this level of control.
> 
> A better declaration may be:
> * int (*default_usb_mode_set)(struct typec_port *port, enum usb_mode mode);
> * int (*enter_usb_mode)(struct typec_port *port, enum usb_mode mode);

Makes sense. Let's change it like that.

Br,

-- 
heikki

