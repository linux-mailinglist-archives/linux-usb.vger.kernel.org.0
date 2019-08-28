Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED469FC19
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2019 09:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbfH1Hls (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Aug 2019 03:41:48 -0400
Received: from mga09.intel.com ([134.134.136.24]:26530 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726253AbfH1Hls (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Aug 2019 03:41:48 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Aug 2019 00:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,440,1559545200"; 
   d="scan'208";a="197498688"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 28 Aug 2019 00:41:45 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 28 Aug 2019 10:41:44 +0300
Date:   Wed, 28 Aug 2019 10:41:44 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Saranya Gopal <saranya.gopal@intel.com>,
        Balaji Manoharan <m.balaji@intel.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: roles: intel: Enable static DRD mode for role
 switch
Message-ID: <20190828074144.GA5486@kuha.fi.intel.com>
References: <20190826143230.59807-1-heikki.krogerus@linux.intel.com>
 <20190826143230.59807-3-heikki.krogerus@linux.intel.com>
 <2a0d10b9-b21d-5bd6-9115-5a686bfbb701@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a0d10b9-b21d-5bd6-9115-5a686bfbb701@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 27, 2019 at 03:39:18PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 26-08-19 16:32, Heikki Krogerus wrote:
> > From: Saranya Gopal <saranya.gopal@intel.com>
> > 
> > Enable static DRD mode in Intel platforms which guarantees
> > successful role switch all the time. This fixes issues like
> > software role switch failure after cold boot and issue with
> > role switch when USB 3.0 cable is used. But, do not enable
> > static DRD mode for Cherrytrail devices which rely on firmware
> > for role switch.
> > 
> > Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
> > Signed-off-by: Balaji Manoharan <m.balaji@intel.com>
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >   .../usb/roles/intel-xhci-usb-role-switch.c    | 26 ++++++++++++++++++-
> >   1 file changed, 25 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/roles/intel-xhci-usb-role-switch.c b/drivers/usb/roles/intel-xhci-usb-role-switch.c
> > index 7325a84dd1c8..9101ff94c8d2 100644
> > --- a/drivers/usb/roles/intel-xhci-usb-role-switch.c
> > +++ b/drivers/usb/roles/intel-xhci-usb-role-switch.c
> > @@ -19,6 +19,7 @@
> >   #include <linux/module.h>
> >   #include <linux/platform_device.h>
> >   #include <linux/pm_runtime.h>
> > +#include <linux/property.h>
> >   #include <linux/usb/role.h>
> >   /* register definition */
> > @@ -26,6 +27,9 @@
> >   #define SW_VBUS_VALID			BIT(24)
> >   #define SW_IDPIN_EN			BIT(21)
> >   #define SW_IDPIN			BIT(20)
> > +#define SW_SWITCH_EN_CFG0		BIT(16)
> 
> Nitpick: Please drop the _CFG0 postfix, if anything this
> should be a prefix applied to *all* defines for the bits
> in this register
> 
> > +#define SW_DRD_STATIC_HOST_CFG0		1
> > +#define SW_DRD_STATIC_DEV_CFG0		2
> 
> So bits 0-1 together define the drd-mode. The datasheet
> calls the combination DRD_CONFIG, without a SW_ prefix,
> with the following values being defined:
> 
> 00: Dynamic role-switch
> 01: Static Host mode
> 10: Static device mode
> 11: Reserved
> 
> Notice this is an enum, so the use of bit-ops to clear the
> other state below is wrong. It happens to work, but this is
> not how a multi-bit setting should be modified.
> 
> I suggest using the following defines instead:
> 
> #define DRD_CONFIG_DYNAMIC		0
> #define DRD_CONFIG_STATIC_HOST		1
> #define DRD_CONFIG_STATIC_DEVICE	2
> #define DRD_CONFIG_MASK			3
> 
> >   #define DUAL_ROLE_CFG1			0x6c
> >   #define HOST_MODE			BIT(29)
> > @@ -37,6 +41,7 @@
> >   struct intel_xhci_usb_data {
> >   	struct usb_role_switch *role_sw;
> >   	void __iomem *base;
> > +	bool disable_sw_switch;
> 
> I would prefer for this to be enable_sw_switch and the negation
> when reading the property.
> 
> >   };
> >   static const struct software_node intel_xhci_usb_node = {
> > @@ -63,23 +68,39 @@ static int intel_xhci_usb_set_role(struct device *dev, enum usb_role role)
> >   	pm_runtime_get_sync(dev);
> > -	/* Set idpin value as requested */
> > +	/*
> > +	 * Set idpin value as requested.
> > +	 * Since some devices rely on firmware setting DRD_CONFIG and
> > +	 * SW_SWITCH_EN_CFG0 bits to be zero for role switch,
> > +	 * do not set these bits for those devices.
> > +	 */
> >   	val = readl(data->base + DUAL_ROLE_CFG0);
> >   	switch (role) {
> >   	case USB_ROLE_NONE:
> >   		val |= SW_IDPIN;
> >   		val &= ~SW_VBUS_VALID;
> > +		val &= ~(SW_DRD_STATIC_DEV_CFG0 | SW_DRD_STATIC_HOST_CFG0);
> >   		break;
> 
> Right, so this should be:
> 
> 		val &= ~DRD_CONFIG_MASK;
> 
> Also ideally this should also have a if (!data->disable_sw_switch)
> for consistency.
> 
> >   	case USB_ROLE_HOST:
> >   		val &= ~SW_IDPIN;
> >   		val &= ~SW_VBUS_VALID;
> > +		if (!data->disable_sw_switch) {
> > +			val &= ~SW_DRD_STATIC_DEV_CFG0;
> 
> So this clearing is wrong, it happens to work, but is not
> how modifying a "bit-set" / enum should be done, this should be:
> 
> 			val &= ~DRD_CONFIG_MASK;
> 
> > +			val |= SW_DRD_STATIC_HOST_CFG0;
> > +		}
> >   		break;
> >   	case USB_ROLE_DEVICE:
> >   		val |= SW_IDPIN;
> >   		val |= SW_VBUS_VALID;
> > +		if (!data->disable_sw_switch) {
> > +			val &= ~SW_DRD_STATIC_HOST_CFG0;
> > +			val |= SW_DRD_STATIC_DEV_CFG0;
> > +		}
> 
> Idem.
> 
> 
> >   		break;
> >   	}
> >   	val |= SW_IDPIN_EN;
> > +	if (!data->disable_sw_switch)
> > +		val |= SW_SWITCH_EN_CFG0;
> 
> So we now have a lot of "if (!data->disable_sw_switch)" checks,
> 
> IMHO it would be better / cleaner to do this:
> 
> 	u32 glk, val, drd_config;
> 
> 	...
> 
>  	val = readl(data->base + DUAL_ROLE_CFG0);
>  	switch (role) {
>  	case USB_ROLE_NONE:
>  		val |= SW_IDPIN;
>  		val &= ~SW_VBUS_VALID;
> 		drd_config = DRD_CONFIG_DYNAMIC;
>  		break;
>  	case USB_ROLE_HOST:
>  		val &= ~SW_IDPIN;
>  		val &= ~SW_VBUS_VALID;
> 		drd_config = DRD_CONFIG_STATIC_HOST;
>  		break;
>  	case USB_ROLE_DEVICE:
>  		val |= SW_IDPIN;
>  		val |= SW_VBUS_VALID;
> 		drd_config = DRD_CONFIG_STATIC_DEVICE;
>  		break;
>  	}
>  	val |= SW_IDPIN_EN;
> 
> 	if (!data->disable_sw_switch) {
> 		val &= ~DRD_CONFIG_MASK;
> 		val |= SW_SWITCH_EN_CFG0 | drd_config;
> 	}


That looks good to me. Saranya, Balaji! Can you fix that. I don't
think you need me for this anymore.

thanks,

-- 
heikki
