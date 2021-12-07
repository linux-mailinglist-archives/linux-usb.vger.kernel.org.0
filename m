Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8434C46B82D
	for <lists+linux-usb@lfdr.de>; Tue,  7 Dec 2021 10:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232710AbhLGJ75 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Dec 2021 04:59:57 -0500
Received: from mga17.intel.com ([192.55.52.151]:10771 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229441AbhLGJ74 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Dec 2021 04:59:56 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="218228714"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; 
   d="scan'208";a="218228714"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 01:56:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; 
   d="scan'208";a="657633111"
Received: from kuha.fi.intel.com ([10.237.72.166])
  by fmsmga001.fm.intel.com with SMTP; 07 Dec 2021 01:56:23 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 07 Dec 2021 11:56:22 +0200
Date:   Tue, 7 Dec 2021 11:56:22 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Prashant Malani <pmalani@chromium.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Tobias Schramm <t.schramm@manjaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        bleung@chromium.org
Subject: Re: PATCH 0/4] usbd: typec: fusb302: Add support for specifying
 supported alternate-modes through devicetree/fwnodes
Message-ID: <Ya8vxq+/P/WG4kHo@kuha.fi.intel.com>
References: <20200714113617.10470-1-hdegoede@redhat.com>
 <Yakej0+7W+Lk9OWP@google.com>
 <9a5d71ae-a571-248c-173b-7545f9f7d344@redhat.com>
 <CACeCKafantM4ubxTLnge5DZLT87Pyrpc34nQrUvN1Zu1FgyVKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACeCKafantM4ubxTLnge5DZLT87Pyrpc34nQrUvN1Zu1FgyVKw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Fri, Dec 03, 2021 at 12:22:35PM -0800, Prashant Malani wrote:
> Hi Hans,
> 
> On Fri, Dec 3, 2021 at 2:14 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > Hi Prashant,
> >
> > On 12/2/21 20:29, Prashant Malani wrote:
> > > Hi Hans,
> > >
> > > Sorry for posting on an old thread, but I was wondering if there was
> > > still a plan to submit this? This is something we'd like to use on
> > > Chrome OS too.
> > >
> > > It sounded like the primary discussion was whether to have an "altmodes"
> > > property encaspulating the various alt modes, but not sure what the
> > > final consensus on that was (sounded to me like your current
> > > implementation was fine for now, and ACPI use cases would be handled
> > > later?).
> >
> > Support for this has already landed, but so far has only been tested
> > on a x86/ACPI device, where the firmware-nodes parsed by the new
> > typec_port_register_altmodes() helper are setup through software-nodes,
> > see:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7b458a4c5d7302947556e12c83cfe4da769665d0
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=55d8b34772e0728a224198ba605eed8cfc570aa0
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3d28466e5f4f8
> >
> > In theory this should be usable for devicetree as is. But that would
> > require documenting the current in kernel swnode bindings as
> > official devicetree bindings and getting that through the devicetree
> > bindings review process.
> 
> That's good to hear :)
> 
> >
> > I have deliberately not done this because the devicetree maintainers
> > have asked for properties / swnode "bindings" used only inside
> > the kernel (1) to NOT be documented as official devicetree bindings,
> > they (the dt bindings maintainers) want to first see at least one
> > real devicetree users before adding things like this to the
> > official devicetree bindings docs.
> >
> > Note if the way typec_port_register_altmodes() parses the fwnode
> > properties needs to change as result of the devicetree bindings review
> > process, please let me know, because then the swnode-s created in
> > drivers/platform/x86/intel/int33fe/intel_cht_int33fe_typec.c
> > need to change to match so as to not regress things on those devices.
> 
> Heikki, can we reconcile this with the format you had in mind for ACPI
> devices which specify this in ASL files?

I don't know. I'm not sure what are the changes that need to be made
in order to fit this thing into the devicetree bindings (or are there
any)?

Assuming that the proposal is still that each connector device node
would have a sub-node "altmodes" which then has a child node for each
supported alt mode, then the ASL for the first USB Type-C port (as an
example) should look roughly like this (this is prepared on top the
ACPI tables from Intel Tigerlake based Chromebook system):

        Scope (\_SB.H_EC.USBC.CON0)
        {
                Name (_DSD, Package () {
                        ToUUID("dbb8e3e6-5886-4ba6-8795-1319f52a966b"),
                        Package () {
                                Package () { "altmodes", "ALT0" },
                        }
                })

                /* The "altmodes" sub-node */
                Name (ALT0, Package () {
                        ToUUID("dbb8e3e6-5886-4ba6-8795-1319f52a966b"),
                        Package () {
                                Package () { "tbt", "ALT1" },
                                Package () { "dp", "ALT2" },
                        }
                })

                /* Thunderbolt 3 Alternate Mode */
                Name (ALT1, Package() {
                        ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                                Package () { "svid", 0x8087 },
                                Package () { "vdo", 0x00000001 },
                        },
                })

                /* DisplayPort Alternate Mode */
                Name (ALT2, Package() {
                        ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                                Package () { "svid", 0xff01 },
                                Package () { "vdo", 0x001c1c47 },
                        },
                })
        }

So with that, this series should work as is. Let me know if you need
me to explain that in more detail. The Hierarchical Data Extension
_DSD UUID is documented here:
https://uefi.org/sites/default/files/resources/_DSD-hierarchical-data-extension-UUID-v1.1.pdf

But as said, I'm now not sure what the final design should look like?

The ACPI format we can in any case quite likely make work with what
ever requirements/limitation the devicetree has. We just need to
understand what those are.

After that I would really like to see the format documented for
ACPI. Though, I'm not sure where should it be documented. I think we
are talking about some kind of BIOS writing guide or similar.

thanks,

-- 
heikki
