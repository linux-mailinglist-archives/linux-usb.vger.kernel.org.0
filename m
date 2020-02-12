Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC1515ACCD
	for <lists+linux-usb@lfdr.de>; Wed, 12 Feb 2020 17:06:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727231AbgBLQGw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Feb 2020 11:06:52 -0500
Received: from mga14.intel.com ([192.55.52.115]:61732 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726351AbgBLQGw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Feb 2020 11:06:52 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Feb 2020 08:06:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,433,1574150400"; 
   d="scan'208";a="347538490"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 12 Feb 2020 08:06:49 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 12 Feb 2020 18:06:49 +0200
Date:   Wed, 12 Feb 2020 18:06:49 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Oliver Neukum <oneukum@suse.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: No PNP0CA0 device on a Dell Precision 5520 laptop
Message-ID: <20200212160649.GH1498@kuha.fi.intel.com>
References: <1581427518.1580.3.camel@suse.de>
 <20200211135920.GB1498@kuha.fi.intel.com>
 <1581430450.1580.5.camel@suse.de>
 <20200211142855.GC1498@kuha.fi.intel.com>
 <1581431677.1580.7.camel@suse.de>
 <20200211144429.GD1498@kuha.fi.intel.com>
 <1581513174.21415.4.camel@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1581513174.21415.4.camel@suse.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 12, 2020 at 02:12:54PM +0100, Oliver Neukum wrote:
> Am Dienstag, den 11.02.2020, 16:44 +0200 schrieb Heikki Krogerus:
> > On Tue, Feb 11, 2020 at 03:34:37PM +0100, Oliver Neukum wrote:
> 
> > > > 
> > > 
> > > yes I got that one. Thanks for the tip.
> > 
> > OK, cool! Let me know if the tps6598x.c driver works with that.
> > 
> > thanks,
> 
> Sorry for my earlier rather short report. It turns out that even
> i2c_multi_instantiate does not load. A bit of debugging points
> to rather inexplicable ACPI code:
> 
>         Device (UCM1)
>         {
>             Name (_HID, "INT3515")  // _HID: Hardware ID
>             Name (_UID, Zero)  // _UID: Unique ID
>             Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
>             {
>                 Name (SBFB, ResourceTemplate ()
>                 {
>                     I2cSerialBusV2 (0x0038, ControllerInitiated, 0x00061A80,
>                         AddressingMode7Bit, "\\_SB.PCI0.I2C0",
>                         0x00, ResourceConsumer, , Exclusive,
>                         )
>                 })
>                 Name (SBFI, ResourceTemplate ()
>                 {
>                     Interrupt (ResourceConsumer, Level, ActiveLow, Exclusive, ,, _Y28)
>                     {
>                         0x00000000,
>                     }
>                 })
>                 CreateDWordField (SBFI, \_SB.PCI0.I2C0.UCM1._CRS._Y28._INT, GINT)  // _INT: Interrupts
>                 GINT = INUM (UCG1)
>                 Return (ConcatenateResTemplate (SBFB, SBFI))
>             }
> 
>             Method (_STA, 0, NotSerialized)  // _STA: Status
>             {
>                 If ((UCSI == One))
>                 {
>                     Return (0x0F)
>                 }
>                 Else
>                 {
>                     Return (Zero)
>                 }
>             }
>         }
> 
> And indeed 'status' is 0 in sysfs. I am puzzled. I can see no sense in that unless
> I am supposed to use ucsi_acpi but there is no node for that.

The "UCSI" in that condition is just a variable name. It does not
actually have anything to do with the actual UCSI interface.

It looks to me like the operating system is not even made aware of the
connectors on that laptop. That is fairly common unfortunately.

The connectors will work, the firmware takes care of everything, but
they are simply not visible to the operating system. There is of
course also no way to for example swap the roles, or do anything else.

thanks,

-- 
heikki
