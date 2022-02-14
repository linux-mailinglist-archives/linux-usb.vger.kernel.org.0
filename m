Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4824B42A5
	for <lists+linux-usb@lfdr.de>; Mon, 14 Feb 2022 08:19:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241193AbiBNHPR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Feb 2022 02:15:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232498AbiBNHPQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Feb 2022 02:15:16 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E48B583BC;
        Sun, 13 Feb 2022 23:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644822908; x=1676358908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jnqVrIoZ6g488rS9qpaGDj6bY/vaGQ5sXc1wrZCGMU0=;
  b=aLRR6ALLU7RDUAF6LWgBy+fkufY/Hgsc+7ktK99limCsPds6SSSkPq0D
   bz/Z0QFuh4xWLSIq5BNPhqCu4FuFag7cmhxyvd8YOj8CDXx3jSz5c61b2
   +n2xSzQO5BQ88npgx6RkVdOeyIQDK7uTyT43+TwdWur1fbgXmX5hogrXa
   ugu9D3aLhvr027JBoY09ECW/G3HogkO8EOYcCiIHfKg8tCyoV5ZRuVxoX
   A83MRkz1jqxysBB3iP5nqWTRHkfsD5AsS8kPYU1de5n2yxw9tI8L1VmX8
   MXZK+EpQF1v5Quv0FJkJInrrE7O02rzvzZ+8O5i2roeNlPzbGG+40uQUA
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="249779329"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; 
   d="scan'208";a="249779329"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2022 23:15:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; 
   d="scan'208";a="538427082"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2022 23:15:03 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 14 Feb 2022 09:15:01 +0200
Date:   Mon, 14 Feb 2022 09:15:01 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
        "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
        "open list:RADEON and AMDGPU DRM DRIVERS" 
        <amd-gfx@lists.freedesktop.org>,
        "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" 
        <nouveau@lists.freedesktop.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Alexander.Deucher@amd.com, Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH v3 03/12] PCI: Move check for old Apple Thunderbolt
 controllers into a quirk
Message-ID: <YgoBdWvAFqNIZ2m4@lahna>
References: <20220211213508.GA736191@bhelgaas>
 <9d19c3f0-e5da-c9e5-d192-b5db88353888@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d19c3f0-e5da-c9e5-d192-b5db88353888@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Fri, Feb 11, 2022 at 04:06:20PM -0600, Limonciello, Mario wrote:
> On 2/11/2022 15:35, Bjorn Helgaas wrote:
> > On Fri, Feb 11, 2022 at 01:32:41PM -0600, Mario Limonciello wrote:
> > > `pci_bridge_d3_possible` currently checks explicitly for a Thunderbolt
> > > controller to indicate that D3 is possible.  As this is used solely
> > > for older Apple systems, move it into a quirk that enumerates across
> > > all Intel TBT controllers.
> > > 
> > > Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > > ---
> > >   drivers/pci/pci.c    | 12 +++++-----
> > >   drivers/pci/quirks.c | 53 ++++++++++++++++++++++++++++++++++++++++++++
> > >   2 files changed, 60 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > > index 9ecce435fb3f..5002e214c9a6 100644
> > > --- a/drivers/pci/pci.c
> > > +++ b/drivers/pci/pci.c
> > > @@ -1064,7 +1064,13 @@ static inline bool platform_pci_bridge_d3(struct pci_dev *dev)
> > >   	if (pci_use_mid_pm())
> > >   		return false;
> > > -	return acpi_pci_bridge_d3(dev);
> > > +	if (acpi_pci_bridge_d3(dev))
> > > +		return true;
> > > +
> > > +	if (device_property_read_bool(&dev->dev, "HotPlugSupportInD3"))
> > > +		return true;
> > 
> > Why do we need this?  acpi_pci_bridge_d3() already looks for
> > "HotPlugSupportInD3".
> 
> The Apple machines don't have ACPI companion devices that specify this
> property.
> 
> I guess this probes a different question; can `device_property_read_bool` be
> used in `acpi_pci_bridge_d3` instead of:
> 
> 	if (acpi_dev_get_property(adev, "HotPlugSupportInD3",
> 				   ACPI_TYPE_INTEGER, &obj) < 0)
> 		return false;
> 
> 	return obj->integer.value == 1;
> 
> If so, then yeah this can probably be simplified.

Unfortunately the code in acpi_pci_bridge_d3() expects the device to
have an ACPI_COMPANION() which may not be the case with software nodes.

> > 
> > > +	return false;
> > >   }
> > >   /**
> > > @@ -2954,10 +2960,6 @@ bool pci_bridge_d3_possible(struct pci_dev *bridge)
> > >   		if (pci_bridge_d3_force)
> > >   			return true;
> > > -		/* Even the oldest 2010 Thunderbolt controller supports D3. */
> > > -		if (bridge->is_thunderbolt)
> > > -			return true;
> > > -
> > >   		/* Platform might know better if the bridge supports D3 */
> > >   		if (platform_pci_bridge_d3(bridge))
> > >   			return true;
> > > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > > index 6d3c88edde00..aaf098ca7d54 100644
> > > --- a/drivers/pci/quirks.c
> > > +++ b/drivers/pci/quirks.c
> > > @@ -3756,6 +3756,59 @@ DECLARE_PCI_FIXUP_SUSPEND_LATE(PCI_VENDOR_ID_INTEL,
> > >   			       quirk_apple_poweroff_thunderbolt);
> > >   #endif
> > > +/* Apple machines as old as 2010 can do D3 with Thunderbolt controllers, but don't specify
> > > + * it in the ACPI tables
> > 
> > Wrap to fit in 80 columns like the rest of the file.  Also use the:
> > 
> >    /*
> >     * comment ...
> >     */
> > 
> > style if it's more than one line.
> > 
> > I don't think "as old as 2010" is helpful here -- I assume 2010 is
> > there because there *were* no Thunderbolt controllers before 2010, but
> > the code doesn't check any dates, so we basically assume all Apple
> > machines of any age with the listed controllers can do this.
> 
> The old comment was saying that, which is where I got it from.  Yeah, I'll
> update it.
> 
> > 
> > > + */
> > > +static void quirk_apple_d3_thunderbolt(struct pci_dev *dev)
> > > +{
> > > +	struct property_entry properties[] = {
> > > +		PROPERTY_ENTRY_BOOL("HotPlugSupportInD3"),
> > > +		{},
> > > +	};
> > > +
> > > +	if (!x86_apple_machine)
> > > +		return;
> > 
> > The current code doesn't check x86_apple_machine, so this needs some
> > justification.  How do I know this works the same as before?
> 
> Mika and Lucas were saying the only reason for this codepath was Apple
> machines in the first place, which is where this idea came from.

Yes, that's the reason.

Nobody else is going to need this except Apple machines with Intel
Thunderbolt controller.

> Something specifically relevant is that the Apple machines use a SW
> connection manager, whereas everyone else up until USB4 devices use a
> firmware based connection manager with varying behaviors on generation
> (ICM).

Yup.

> > > +
> > > +	if (device_create_managed_software_node(&dev->dev, properties, NULL))
> > > +		pci_warn(dev, "could not add HotPlugSupportInD3 property");
> > > +}
> > > +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LIGHT_RIDGE,
> > > +			quirk_apple_d3_thunderbolt);
> > 
> > The current code assumes *all* Thunderbolt controllers support D3, so
> > it would assume a controller released next year would support D3, but
> > this code would assume the opposite.  Are we supposed to add
> > everything to this list, or do newer machines supply
> > HotPlugSupportInD3, or ...?
> 
> This quirk is intended specifically for Apple, which has stopped making
> Intel machines with Intel TBT controllers.
> 
> So I don't believe the list should be growing any more, if anything it might
> need to shrink if I got too many models that weren't actually in Apple
> products.  Lucas probably needs to confirm that.

Yes correct it won't be growing more.
