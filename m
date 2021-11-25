Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54C4145D484
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 07:04:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347359AbhKYGHT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 01:07:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:48102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346423AbhKYGFR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Nov 2021 01:05:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36C8F6109D;
        Thu, 25 Nov 2021 06:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1637820126;
        bh=Hq2zg3G6gApQm7rRrSncgDSyVbrLu4jCluqs3U/7Weo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G6PG0C3m0+MqEnoXBwDA4tvmsymzaaW9TSxBIAFagkwvHU3tOaAqt2vsNq95v2SvQ
         Tjcav11hF8Fz05+0Qcji/O2mqCdv+gHi0qED3L3HgHNPFZoxKXGfDCrDxCfT3uba7h
         M+vB/UEhDQ2xRpC2WiUGZ0pDz5UTN83ZIDnxqTjs=
Date:   Thu, 25 Nov 2021 07:02:04 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     klondike <klondike@klondike.es>
Cc:     linux-usb@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Kranthi Kuntala <kranthi.kuntala@intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Mario.Limonciello@dell.com, Lukas Wunner <lukas@wunner.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] thunderbolt: allow vendor ID override for NVM
 programming
Message-ID: <YZ8m3E/06h/8lZcN@kroah.com>
References: <8d29b41b-3590-c4b0-a2f8-fa34063bafb3@klondike.es>
 <07bd1d90-c95f-0685-e1a8-2211c9dac251@klondike.es>
 <YZ6D7vbyaf50DSCh@kroah.com>
 <9b8ea990-558b-c2ba-100f-4e06c3a10f69@klondike.es>
 <YZ6GdhKQgrFqZLyl@kroah.com>
 <6520dbb5-d842-4ce1-c1e5-ad653eb3deca@klondike.es>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6520dbb5-d842-4ce1-c1e5-ad653eb3deca@klondike.es>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 24, 2021 at 07:56:50PM +0100, klondike wrote:
> El 24/11/21 a las 19:37, Greg Kroah-Hartman escribió:
> > On Wed, Nov 24, 2021 at 07:32:29PM +0100, klondike wrote:
> >> El 24/11/21 a las 19:26, Greg Kroah-Hartman escribió:
> >>> On Wed, Nov 24, 2021 at 05:37:05PM +0100, Francisco Blas Izquierdo Riera (klondike) wrote:
> >>>> Currently, the vendor ID reported by the chipset is checked before to
> >>>> avoid accidentally programming devices from unsupported vendors with
> >>>> a different NVM structure.
> >>>>
> >>>> Certain Thunderbolt devices store the vendor ID in the NVM, therefore
> >>>> if the NVM has become corrrupted the device will report an invalid
> >>>> vendor ID and reflashing will be impossible on GNU/Linux even if the
> >>>> device can boot in safe mode.
> >>>>
> >>>> This patch adds a new parameter ``switch_nvm_vendor_override`` which
> >>>> can be used to override the vendor ID used for detecting the NVM
> >>>> structure allowing to reflash (and authenticate) a new, valid
> >>>> image on the device.
> >>>>
> >>>> Signed-off-by: Francisco Blas Izquierdo Riera (klondike) <klondike@klondike.es>
> >>>> ---
> >>>> drivers/thunderbolt/switch.c | 9 ++++++++-
> >>>> 1 file changed, 8 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> >>>> index 3014146081..a7959c3f3f 100644
> >>>> --- a/drivers/thunderbolt/switch.c
> >>>> +++ b/drivers/thunderbolt/switch.c
> >>>> @@ -13,6 +13,7 @@
> >>>> #include <linux/sched/signal.h>
> >>>> #include <linux/sizes.h>
> >>>> #include <linux/slab.h>
> >>>> +#include <linux/moduleparam.h>
> >>>> #include "tb.h"
> >>>> @@ -34,6 +35,10 @@ struct nvm_auth_status {
> >>>> static LIST_HEAD(nvm_auth_status_cache);
> >>>> static DEFINE_MUTEX(nvm_auth_status_lock);
> >>>> +static short switch_nvm_vendor_override = -1;
> >>>> +module_param(switch_nvm_vendor_override, short, 0440);
> >>>> +MODULE_PARM_DESC(switch_nvm_vendor_override, "Override the switch vendor id on the nvm access routines");
> >>>> +
> >>>> static struct nvm_auth_status *__nvm_get_auth_status(const struct tb_switch *sw)
> >>>> {
> >>>> struct nvm_auth_status *st;
> >>>> @@ -391,7 +396,9 @@ static int tb_switch_nvm_add(struct tb_switch *sw)
> >>>> * relax this in the future when we learn other NVM formats.
> >>>> */
> >>>> if (sw->config.vendor_id != PCI_VENDOR_ID_INTEL &&
> >>>> - sw->config.vendor_id != 0x8087) {
> >>>> + sw->config.vendor_id != 0x8087 &&
> >>>> + switch_nvm_vendor_override != PCI_VENDOR_ID_INTEL &&
> >>>> + switch_nvm_vendor_override != 0x8087) {
> >>>> dev_info(&sw->dev,
> >>>> "NVM format of vendor %#x is not known, disabling NVM upgrade\n",
> >>>> sw->config.vendor_id);
> >>> Patch is corrupted :(
> >>>
> >>> Anyway, module parameters are from the 1990's and should stay there.
> >>> Please use a per-device way to handle this instead, as trying to handle
> >>> module parameters is very difficult over time.
> >>>
> >>> thanks,
> >>>
> >>> greg k-h
> >> Hi Greg!
> >>
> >> Thanks for your feedback. I'm a bit uncertain about what you mean with
> >> a per-device way. Do you mean through the sysfs interface? If so how
> >> to do so on device discovery time (which is what the Thunderbolt
> >> driver does)?
> >>
> >> I'm surely missing something here so I would really appreciate a
> >> pointer in the right direction.
> > Ah, forgot about discovery time, you want this before the device is
> > probed...
> >
> > Then what about the existing "new_id" file for the driver?  That's what
> > it is there for, right?
> Hi again Greg!
> 
> "new_id" would work well if the blacklisting was for the whole driver, but currently the driver accepts the corrupted controller just fine but disables the nvm flashing functionality for any vendor IDs it considers inappropriate.

Then fix the devices to do not have corrupted ids!  :)

Seriously, what does other operating systems do with these broken
devices?

> The only other approach I can think off is to add a sysfs entry when
> the vendor missmatches the use can use to try force enabling flashing
> for a specific vendor ID and have that create the nvm entries if not
> already there. Do you think this would be better?

I think it would be best to fix the firmware in the devices.  What
prevents that from happening?

thanks,

greg k-h
