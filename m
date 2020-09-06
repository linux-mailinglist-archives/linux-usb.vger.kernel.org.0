Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DADA325EC1F
	for <lists+linux-usb@lfdr.de>; Sun,  6 Sep 2020 04:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728790AbgIFCWb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Sep 2020 22:22:31 -0400
Received: from netrider.rowland.org ([192.131.102.5]:52227 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728409AbgIFCWa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Sep 2020 22:22:30 -0400
Received: (qmail 729609 invoked by uid 1000); 5 Sep 2020 22:22:29 -0400
Date:   Sat, 5 Sep 2020 22:22:29 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: How to set USB_PORT_QUIRK_OLD_SCHEME on an usb-port ?
Message-ID: <20200906022229.GA729107@rowland.harvard.edu>
References: <2f2dd720-3ab4-ba0a-16bf-8b899aafa26d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f2dd720-3ab4-ba0a-16bf-8b899aafa26d@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 05, 2020 at 01:37:38PM +0200, Hans de Goede wrote:
> Hi All,
> 
> I have been debugging an issue with a 2-in-1 which
> consists of a tablet + a kbd-dock, where the device
> turns into a clamshell when docked into the kbd-dock.
> 
> The kbd dock is connected via pogo-pins. This works
> fine when docked at boot. But there is an enumeration
> issue when hot-docked (and the keyboard looses power
> when the lid is closedm so this also triggers after
> a suspend/resume):
> 
> [ 3498.924190] usb 1-3: new full-speed USB device number 5 using xhci_hcd
> [ 3499.041725] usb 1-3: device descriptor read/64, error -71
> [ 3515.215890] usb 1-3: device descriptor read/64, error -110
> [ 3515.440369] usb 1-3: new full-speed USB device number 6 using xhci_hcd
> [ 3515.603544] usb 1-3: New USB device found, idVendor=06cb, idProduct=73f5, bcdDevice= 0.02
> [ 3515.603574] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [ 3515.603596] usb 1-3: Product: ITE Device(8910)
> [ 3515.603614] usb 1-3: Manufacturer: ITE Tech. Inc.
> 
> Note there is about 6 seconds before the keyboard becomes
> usable, which is quite long when trying to unlock the
> laptop after opening the lid.
> 
> If I set the USB_PORT_QUIRK_OLD_SCHEME on the port used by the kbd-dock:
> 
> echo 1 >  /sys/devices/pci0000\:00/0000\:00\:14.0/usb1/1-0\:1.0/usb1-port3/quirks
> 
> Then this changes to:
> 
> [ 4467.875008] usb 1-3: new full-speed USB device number 7 using xhci_hcd
> [ 4467.878483] usb 1-3: Device not responding to setup address.
> [ 4468.082476] usb 1-3: Device not responding to setup address.
> [ 4468.289990] usb 1-3: device not accepting address 7, error -71
> [ 4468.614928] usb 1-3: new full-speed USB device number 8 using xhci_hcd
> [ 4468.662392] usb 1-3: New USB device found, idVendor=06cb, idProduct=73f5, bcdDevice= 0.02
> [ 4468.662423] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [ 4468.662444] usb 1-3: Product: ITE Device(8910)
> [ 4468.662461] usb 1-3: Manufacturer: ITE Tech. Inc.
> 
> Which is a lot better wrt making the keyboard available for
> use in a timely manner.
> 
> So now I'm looking into a way to automatically do this. I would
> prefer to keep the handling of this out of the kernel, so I looked into
> udev, but it seems that the usb_port_device_type device-s registered by
> usb_hub_create_port_device() are not visible to udev?
> 
> At least I'm not seeing them, in the output of "udevadm info -e"

My impression is that fixing this would be the simplest approach.

Alan Stern

> Note another option would be to set the global old_scheme_first kernel
> cmdline parameter on this 2-in-1. That can be done with a simple
> dmi_system_id table on which to do this, but adding such a table
> seems undesirable.
> 
> 
> A third option I guess would be to try and improve the probe time
> of the kbd-dock under the new scheme.

Have you tried decreasing the initial_descriptor_timeout module 
parameter for usbcore?  That would probably help, but it's kind of a 
sledgehammer.

Alan Stern

> Any input on this would be much appreciated.
> 
> Regards,
> 
> Hans
