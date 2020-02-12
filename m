Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4BF715A9CA
	for <lists+linux-usb@lfdr.de>; Wed, 12 Feb 2020 14:13:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbgBLNND (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Feb 2020 08:13:03 -0500
Received: from mx2.suse.de ([195.135.220.15]:56688 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726728AbgBLNND (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Feb 2020 08:13:03 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id CB477AFA8;
        Wed, 12 Feb 2020 13:13:01 +0000 (UTC)
Message-ID: <1581513174.21415.4.camel@suse.de>
Subject: Re: No PNP0CA0 device on a Dell Precision 5520 laptop
From:   Oliver Neukum <oneukum@suse.de>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Date:   Wed, 12 Feb 2020 14:12:54 +0100
In-Reply-To: <20200211144429.GD1498@kuha.fi.intel.com>
References: <1581427518.1580.3.camel@suse.de>
         <20200211135920.GB1498@kuha.fi.intel.com> <1581430450.1580.5.camel@suse.de>
         <20200211142855.GC1498@kuha.fi.intel.com> <1581431677.1580.7.camel@suse.de>
         <20200211144429.GD1498@kuha.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 11.02.2020, 16:44 +0200 schrieb Heikki Krogerus:
> On Tue, Feb 11, 2020 at 03:34:37PM +0100, Oliver Neukum wrote:

> > > 
> > 
> > yes I got that one. Thanks for the tip.
> 
> OK, cool! Let me know if the tps6598x.c driver works with that.
> 
> thanks,

Sorry for my earlier rather short report. It turns out that even
i2c_multi_instantiate does not load. A bit of debugging points
to rather inexplicable ACPI code:

        Device (UCM1)
        {
            Name (_HID, "INT3515")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (SBFB, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0038, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.PCI0.I2C0",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Name (SBFI, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveLow, Exclusive, ,, _Y28)
                    {
                        0x00000000,
                    }
                })
                CreateDWordField (SBFI, \_SB.PCI0.I2C0.UCM1._CRS._Y28._INT, GINT)  // _INT: Interrupts
                GINT = INUM (UCG1)
                Return (ConcatenateResTemplate (SBFB, SBFI))
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((UCSI == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

And indeed 'status' is 0 in sysfs. I am puzzled. I can see no sense in that unless
I am supposed to use ucsi_acpi but there is no node for that.

	Regards
		Oliver

