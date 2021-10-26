Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A878D43AE69
	for <lists+linux-usb@lfdr.de>; Tue, 26 Oct 2021 10:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234478AbhJZI4R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Oct 2021 04:56:17 -0400
Received: from mga11.intel.com ([192.55.52.93]:29964 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234254AbhJZI4Q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 Oct 2021 04:56:16 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="227311530"
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; 
   d="scan'208";a="227311530"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2021 01:53:52 -0700
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; 
   d="scan'208";a="497227169"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2021 01:53:49 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 26 Oct 2021 11:53:46 +0300
Date:   Tue, 26 Oct 2021 11:53:46 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mario Limonciello <mario.limonciello@outlook.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: Disabling intel-wmi-thunderbolt on devices without Thunderbolt /
 detecting if a device has Thunderbolt
Message-ID: <YXfCGtrtUiej2EZT@lahna>
References: <e21981cf-fef0-b73d-8fe4-4e1fab0d3864@redhat.com>
 <PH0PR15MB4992B80415BE9BD4836CF336E1839@PH0PR15MB4992.namprd15.prod.outlook.com>
 <b067d9f8-4d15-ac5e-3f1f-ff2ffa3b29aa@redhat.com>
 <YXbJZ+qP7s7TZ4rQ@lahna>
 <ba1fdd81-0580-1d1f-9e09-d78642b13d95@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba1fdd81-0580-1d1f-9e09-d78642b13d95@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, Oct 26, 2021 at 10:17:53AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 10/25/21 17:12, Mika Westerberg wrote:
> > On Mon, Oct 25, 2021 at 04:54:41PM +0200, Hans de Goede wrote:
> >>> Yes that's exactly what is supposed to happen that this attribute is made.
> >>> What exactly happens when you write into it?
> >>
> >> The _SB.CGWR ACPI method gets called, with arguments coming from ACPI
> >> settings stored in memory. Depending on those settings this function
> >> either directly pokes some MMIO or tries to talk to an I2C GPIO
> >> expander which is not present on the Surface Go, causing it to
> >> MMIO poke an I2C controller which it should not touch.
> >>
> >> In either case the AML code ends up poking stuff it should not touch
> >> and the entire force_power sysfs attribute should simply not be
> >> there on devices without thunderbolt.
> > 
> > That's right - it should not be there in the first place if there is no
> > Thunderbolt controller on that thing.
> > 
> > I guess most of the systems that have this actually do support
> > Thunderbolt so maybe we can work this around by quirking all the Surface
> > models in that driver?
> 
> I was hoping that we could avoid this, but yes if there is no easy /
> clean way to detect if there are any Thunderbolt controllers on the
> system then a DMI table is necessary.

Well, the force power thing is there just for this reason. It should
only be present on systems using ACPI assisted PCIe hotplug for
Thunderbolt devices. Apparantly some BIOS engineer forgot to remove it
on Surface :( I need to check if it is present on recent reference
BIOSes too. If it is then I'll report an internal sighting about this to
get it removed.

In theory we could also use a heuristic that if there is a TBT
controller present when the driver probes it should fail the probe or
so. Or even look for the PCI host bridge and if it got the PCIe hotplug
capability from the BIOS (through _OSC negotiation) we can assume this
system does not need the force power.
