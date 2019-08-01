Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB40E7DDA7
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2019 16:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731891AbfHAOSs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Aug 2019 10:18:48 -0400
Received: from mga02.intel.com ([134.134.136.20]:17591 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731868AbfHAOSs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 1 Aug 2019 10:18:48 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Aug 2019 07:18:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,334,1559545200"; 
   d="scan'208";a="191630581"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 01 Aug 2019 07:18:29 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 01 Aug 2019 17:18:28 +0300
Date:   Thu, 1 Aug 2019 17:18:28 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Matthew Nicholson <matthew.nicholson@adaptcentre.ie>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: Re: Linux 5.2, usb: typec: Support for Alternate Modes
Message-ID: <20190801141828.GA11871@kuha.fi.intel.com>
References: <CALko26OF4hqZ6-+KMarWU_skQj2mejgw++fShVQdAaEuQDQuiQ@mail.gmail.com>
 <20190730142756.GM28600@kuha.fi.intel.com>
 <CALko26NSuJHzH5K-nv7nM910kvW+Pcfqc09vgnZaD22hEkHO=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALko26NSuJHzH5K-nv7nM910kvW+Pcfqc09vgnZaD22hEkHO=g@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Matthew,

On Thu, Aug 01, 2019 at 01:16:34PM +0100, Matthew Nicholson wrote:
> [Resending as plain text email with attachments.]
> 
> Hi,
> The kernel version testing I'm testing on is:  v5.2.4-arch1
> I have disabled gmd, which seems to struggle with not being able to
> configure displays and becomes unresponsive.
> I'm running startx and have an xprofile script that is setting the
> displays with xrandr.
> 
> *1. dmesg output*
> I have attached two copies of dmesg and lsmod ouputs.
> Both are for v5.2.4, one set is where ucsi_acpi is blacklisted,
> another with no blacklisted modules.
> 
> *2. The exact XPS13 version*
> XPS 13 (9370) Developer edition, ships with Ubuntu.
> i7-8550U Processor
> 
> *3. BIOS version*
> The output from fwupdmgr get-devices is attached.
> XPS 13 9370 Thunderbolt Controller: v33.00
> XPS 13 9370 System Firmware: v0.1.10.0
> Synaptics VMM3332 inside Dell WD15/TB16/TB18 wired Dock: v3.10.002
> 
> At boot the firmware version listed is 1.10.0
> 
> *Can you unload the UCSI driver to see if it has any effect?*
> No changes in being display functionality. I tried to unload and to
> blacklist with config file in /etc/modprode.d

In that case the problem is not caused by the Type-C drivers. This is
more likely a regression in the Thunderbolt drivers, or the graphics
drivers.

Adding Mika and the graphics guys. Mika is the Thunderbolt maintainer
in Linux kernel. He's away now, but he'll be back on Monday.

> When ucsi_acpi is not blacked the error message:
> > typec_displayport port1-partner.0: failed to enter mode

You can ignore that message for now. It is not fatal in this case.

It happens because on this platform the embedded controller firmware
does not allow the operating system to do anything to the alternate
modes besides detecting them, not even enter or exit them (so the
firmware handles the alternate modes on its own). The DisplayPort alt
mode driver in Linux kernel does not know that, so it tries to enter
DisplayPort mode (most likely the firmware has already entered the
mode at this point). That attempt fails, and the driver prints the
message, but it really is not fatal in any way.

I'll see what could be done about that message, but for now you can
just ignore it.

> is displayed in dmseg and in getty.
> 
> *Are you able to build you own test kernels?*
> It is not something that I have done but it is something I should be able to do.
> 
> A few more details.
> The external monitors are detected and listed as available in xrandr.
> I can enable one of them at a time, however attempting to enable both
> of them will fail.
> The returned error message is:
> xrandr: Configure crtc 2 failed
> 
> 
> On Tue, 30 Jul 2019 at 15:27, Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > Hi Matthew,
> >
> > Copying the respective mailing list.
> >
> > On Wed, Jul 17, 2019 at 09:22:10AM +0100, Matthew Nicholson wrote:
> > > Hi,
> > >
> > > Thanks for your work on the linux.
> > >
> > > I am using dell xps13 with a wd15 type-c docking station, on Archlinux.
> > > Under kernel version 5.2 (and 5.2.1) I was running into some issue with
> > > having the docking station connected to multiple monitors (Only one monitor
> > > would work at a time).
> > > I tried to get the monitors working under X/xrandr and wayland/gnome.
> > > The issue is not present after downgrading back to linux 5.1.7.
> > >
> > > I am wondering what I should do to report this or help testing.
> >
> > I'm going to need some details about your platform:
> >
> > 1. dmesg output
> > 2. The exact XPS13 version
> > 3. BIOS version
> >
> > The UCSI driver got support for alternate modes in v5.2, so I'm
> > guessing that is causing this problem, but to be sure, can you unload
> > the UCSI driver to see if it has any effect?
> >
> >         % modprobe -r ucsi_acpi
> >
> > Are you able to build you own test kernels?

thanks,

-- 
heikki
