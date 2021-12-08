Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317A646D8A1
	for <lists+linux-usb@lfdr.de>; Wed,  8 Dec 2021 17:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232676AbhLHQlp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Dec 2021 11:41:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbhLHQlo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Dec 2021 11:41:44 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19D9CC061746
        for <linux-usb@vger.kernel.org>; Wed,  8 Dec 2021 08:38:13 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d:444a:d152:279d:1dbb])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 3E52F2D3;
        Wed,  8 Dec 2021 16:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3E52F2D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1638981492; bh=mxNHYFmpisj67MxM30DVNhn2Xon3/Uy3stVNz8uGhXY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=kxuigUq409shRRAKdssI12aJnSniOJwbcFljE7EREB6S4fPF+VjmrvLltMOu2inSv
         8LSSaIpsJEIVwOx6re5zlZM2UjawJkaLyLugqNEL3E859//kGLcA5W165vFkTBYC0/
         qKzhwVj/fpOCn1WVtwlyGWUp6Z024Ja4t47OHqUk79JLnWZRDxnAGqRkWd6z7RMFvQ
         /YuVj2jvp+WvpRZL9eGPDb5QHkVIfQ02VDJkfm02BDz8gEQg19RVixszlI0/IF92JR
         eB8YuqQwuMZV44V03BLBbI2lvfoUlnHsuWCIU74sKiczs6DjtHex+yKsjEwbxwySyH
         Svt5Hp0u87Yrg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Hortmann <philipp.g.hortmann@gmail.com>,
        "Theodore Y. Ts'o" <tytso@mit.edu>
Subject: Re: [RFC]first draft of the new driver writing guide
In-Reply-To: <601d2a8b-9d67-1d4f-41d4-ee71f4efa9ea@suse.com>
References: <601d2a8b-9d67-1d4f-41d4-ee71f4efa9ea@suse.com>
Date:   Wed, 08 Dec 2021 09:38:11 -0700
Message-ID: <87pmq7xdak.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Glad to see work on the docs!  Some comments, mostly nits...I'm
commenting on the full version since, if you're going to thrash it up,
you might as well do the whole thing...:)

Oliver Neukum <oneukum@suse.com> writes:

> .. _writing-usb-driver:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> Writing USB Device Drivers
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>
> :Author: Greg Kroah-Hartman
> :Author: Oliver Neukum
>
> Introduction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> The Linux USB subsystem has grown from supporting only two different
> types of devices in the 2.2.7 kernel (mice and keyboards), to over 20
> different types of devices in the 2.4 kernel. Linux currently supports

Describing the state in 2.4.x makes it look like this document hasn't
been updated yet.  Even if the number of device types hasn't increased,
I'd update that to 5.x.

> almost all USB class devices (standard types of devices like keyboards,
> mice, modems, printers and speakers) and an ever-growing number of
> vendor-specific devices (such as USB to serial converters, digital
> cameras, Ethernet devices and MP3 players). For a full list of the
> different USB devices currently supported, see Resources.
>
> The remaining kinds of USB devices that do not have support on Linux are
> almost all vendor-specific devices. Each vendor decides to implement a
> custom protocol to talk to their device, so a custom driver usually
> needs to be created. Some vendors are open with their USB protocols and
> help with the creation of Linux drivers, while others do not publish
> them, and developers are forced to reverse-engineer. See Resources for
> some links to handy reverse-engineering tools.
>
> This article tries to show best practices in writing USB drivers
> based on examples taken from various drivers in the kernel. I will
> concentrate on those who use a simple character device as an interface
> to user space to not obscure the specifics of USB with those of
> other subsystems.
>
> Linux USB Basics
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> If you are going to write a Linux USB driver, please become familiar
> with the USB protocol specification. It can be found, along with many
> other useful documents, at the USB home page (see Resources). An
> excellent introduction to the Linux USB subsystem can be found at the
> USB Working Devices List (see Resources). It explains how the Linux USB
> subsystem is structured and introduces the reader to the concept of USB
> urbs (USB Request Blocks), which are essential to USB drivers.
>
> The first thing a Linux USB driver needs to do is register itself with
> the Linux USB subsystem, giving it some information about which devices
> the driver supports and which functions to call when a device supported
> by the driver is inserted or removed from the system. All of this
> information is passed to the USB subsystem in the :c:type:`usb_driver`

Rather than using :c:type:, just say "struct usb_driver" and the right
things should happen.

> structure. Just about any driver can serve as an example.

example::

> static struct usb_driver uas_driver =3D {
> =C2=A0=C2=A0=C2=A0 .name =3D "uas",
> =C2=A0=C2=A0=C2=A0 .probe =3D uas_probe,
> =C2=A0=C2=A0=C2=A0 .disconnect =3D uas_disconnect,
> =C2=A0=C2=A0=C2=A0 .pre_reset =3D uas_pre_reset,
> =C2=A0=C2=A0=C2=A0 .post_reset =3D uas_post_reset,
> =C2=A0=C2=A0=C2=A0 .suspend =3D uas_suspend,
> =C2=A0=C2=A0=C2=A0 .resume =3D uas_resume,
> =C2=A0=C2=A0=C2=A0 .reset_resume =3D uas_reset_resume,
> =C2=A0=C2=A0=C2=A0 .drvwrap.driver.shutdown =3D uas_shutdown,
> =C2=A0=C2=A0=C2=A0 .id_table =3D uas_usb_ids,
> };

This, of course, will need to be indented to render properly; there are
others with the same problem.


> The variable name is a string that describes the driver. It is used in
> informational messages printed to the system log. Within the system it has
> no further function.

Is it worth considering just pulling in the kerneldoc description of
this structure rather than repeating (parts of) it here?

> The next two function pointers, probe and disconnect are called due to

s/due to/in response to/

> an addition event, that is when a device is added or removed to the system
> or a new driver loaded and a match occurs.
> Which devices match a driver is controlled by the ``id_table`` variable.

Here you've put id_table in ``literal`` markup.  I'm not sure of the
value of it (it irritates some readers of the plain-text files), but if
you're going to do this it should be done consistently.

> The actual registration with the USB subsystem referencing the declared
> table is done either via the module_usb_driver(), as shown in the chaoskey
> driver::
>
> static struct usb_driver chaoskey_driver =3D {
> =C2=A0=C2=A0=C2=A0 .name =3D DRIVER_SHORT,
> =C2=A0=C2=A0=C2=A0 .probe =3D chaoskey_probe,
> =C2=A0=C2=A0=C2=A0 .disconnect =3D chaoskey_disconnect,
> =C2=A0=C2=A0=C2=A0 .suspend =3D chaoskey_suspend,
> =C2=A0=C2=A0=C2=A0 .resume =3D chaoskey_resume,
> =C2=A0=C2=A0=C2=A0 .reset_resume =3D chaoskey_resume,
> =C2=A0=C2=A0=C2=A0 .id_table =3D chaoskey_table,
> =C2=A0=C2=A0=C2=A0 .supports_autosuspend =3D 1,
> };
>
> module_usb_driver(chaoskey_driver);
>
> It is also possible to define an __init function called when the module
> containing the driver is loaded and to register the driver in that::
>
> static int __init uas_init(void)
> {
> =C2=A0=C2=A0=C2=A0 int rv;
>
> =C2=A0=C2=A0=C2=A0 workqueue =3D alloc_workqueue("uas", WQ_MEM_RECLAIM, 0=
);
> =C2=A0=C2=A0=C2=A0 if (!workqueue)
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return -ENOMEM;
>
> =C2=A0=C2=A0=C2=A0 rv =3D usb_register(&uas_driver);
> =C2=A0=C2=A0=C2=A0 if (rv) {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 destroy_workqueue(workqueue);
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return -ENOMEM;
> =C2=A0=C2=A0=C2=A0 }
>
> =C2=A0=C2=A0=C2=A0 return 0;
> }
>
> module_init(uas_init);
>
> The USB driver is then registered with a call to usb_register(). This man=
ner
> of initialisation should only be used if resources for the whole driver,
> like
> the workqueue in UAS, need to be initialised or allocated.
>
>
> When the driver is unloaded from the system, it needs to deregister
> itself with the USB subsystem. This is done with usb_deregister()
> function::
>
> static void __exit uas_exit(void)
> {
> =C2=A0=C2=A0=C2=A0 usb_deregister(&uas_driver);
> =C2=A0=C2=A0=C2=A0 destroy_workqueue(workqueue);
> }
>
> A driver shall bother with this only if it does not use module_usb_driver=
().
>
>
> To enable the linux-hotplug system to load the driver automatically when
> the device is plugged in, you need to create a ``MODULE_DEVICE_TABLE``.
> The following code tells the hotplug scripts that this module supports
> device with a given specific vendor and product ID::
>
> static const struct usb_device_id chaoskey_table[] =3D {
> =C2=A0=C2=A0=C2=A0 { USB_DEVICE(CHAOSKEY_VENDOR_ID, CHAOSKEY_PRODUCT_ID) =
},
> =C2=A0=C2=A0=C2=A0 { USB_DEVICE(ALEA_VENDOR_ID, ALEA_PRODUCT_ID) },
> =C2=A0=C2=A0=C2=A0 { },
> };
> MODULE_DEVICE_TABLE(usb, chaoskey_table);
>
> Drivers typically reuse the table given to the USB subsystem for matching
> for this purpose.
>
> There are other macros that can be used in describing a struct
> :c:type:`usb_device_id` for drivers that support a whole class of USB
> drivers. See :ref:`usb.h <usb_header>` for more information on this.
>
> Device operation
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> When a device is plugged into the USB bus that matches the device ID
> pattern that your driver registered with the USB core, the probe

This suggests that the *bus* matches the device ID; I'd reorder the
sentence a bit.

> function is called. The :c:type:`usb_interface` structure and
> the interface ID are passed to the function::
>
> static int uas_probe(struct usb_interface *intf, const struct
> usb_device_id *id)
>
>
> The driver now needs to verify that this device is actually one that it
> can accept. If so, it returns 0. If not, or if any error occurs during
> initialization, an errorcode (such as ``-ENOMEM`` or ``-ENODEV``) is
> returned from the probe function.
>
> Drivers usually start out allocating memory for a representation
> of that device in kernel space::
>
> static int usblp_probe(struct usb_interface *intf,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 const struct usb_device_id *id)
> {
> =C2=A0=C2=A0=C2=A0 struct usb_device *dev =3D interface_to_usbdev(intf);
> =C2=A0=C2=A0=C2=A0 struct usblp *usblp;
> =C2=A0=C2=A0=C2=A0 int protocol;
> =C2=A0=C2=A0=C2=A0 int retval;
>
> =C2=A0=C2=A0=C2=A0 /* Malloc and start initializing usblp structure so we=
 can use it
> =C2=A0=C2=A0=C2=A0 =C2=A0* directly. */

We should probably show coding-style-compliant comments :)

> =C2=A0=C2=A0=C2=A0 usblp =3D kzalloc(sizeof(struct usblp), GFP_KERNEL);
> =C2=A0=C2=A0=C2=A0 if (!usblp) {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 retval =3D -ENOMEM;
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 goto abort_ret;
> =C2=A0=C2=A0=C2=A0 }
>
> Then they check out the suitability of the device::
>
> =C2=A0=C2=A0=C2=A0 protocol =3D usblp_select_alts(usblp);
> =C2=A0=C2=A0=C2=A0 if (protocol < 0) {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 dev_dbg(&intf->dev,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "incompatible pr=
inter-class device 0x%4.4X/0x%4.4X\n",
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 le16_to_cpu(dev-=
>descriptor.idVendor),
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 le16_to_cpu(dev-=
>descriptor.idProduct));
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 retval =3D -ENODEV;
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 goto abort;
> =C2=A0=C2=A0=C2=A0 }
>
> And penultimately they may put the device into a correct initial state::
>
> =C2=A0=C2=A0=C2=A0 /* Setup the selected alternate setting and endpoints.=
 */
> =C2=A0=C2=A0=C2=A0 if (usblp_set_protocol(usblp, protocol) < 0) {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 retval =3D -ENODEV;=C2=A0=C2=A0=C2=
=A0 /* ->probe isn't ->ioctl */
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 goto abort;
> =C2=A0=C2=A0=C2=A0 }
>
> Only as the very last step may the device be registered with the USB
> subsystem,
> if a character device is intended as an interface to user space::
>
> =C2=A0=C2=A0=C2=A0 retval =3D usb_register_dev(intf, &usblp_class);
> =C2=A0=C2=A0=C2=A0 if (retval) {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 dev_err(&intf->dev,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "usblp: Not able=
 to get a minor (base %u, slice default): %d\n",
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 USBLP_MINOR_BASE=
, retval);
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 goto abort_intfdata;
> =C2=A0=C2=A0=C2=A0 }
>
> or with another subsystem, like SCSI core in UAS::
>
> =C2=A0=C2=A0=C2=A0 result =3D scsi_add_host(shost, &intf->dev);
> =C2=A0=C2=A0=C2=A0 if (result)
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 goto free_streams;
>
> At this point your device is live and your driver must be fully operation=
al.
> No mutual exclusion to probe() is provided.
>
> Conversely, when the device is removed from the USB bus, the disconnect
> function is called with the interface pointer. The driver needs to shut d=
own
> any pending urbs that are in the USB system.
> Remember that a device may still be open at this stage as far as user spa=
ce
> is concerned. Subsequent operations need to fail gracefully and enough st=
ate
> retained for this purpose. That means some deferred cleanup in those case=
s.
>
> Now that the device is plugged into the system and the driver is bound
> to the device, any of the functions in the :c:type:`file_operations`
> structure
> that were passed to the USB subsystem will be called from a user program
> trying to talk to the device. The first function called will be open, as

"open()" is the usual notation

> the program tries to open the device for I/O. We increment our private
> usage count and save a pointer to our internal structure in the file
> structure. This is done so that future calls to file operations will
> enable the driver to determine which device the user is addressing. All
> of this is done in the following example::
>
> static int chaoskey_open(struct inode *inode, struct file *file)
> {
> =C2=A0=C2=A0=C2=A0 struct chaoskey *dev;
> =C2=A0=C2=A0=C2=A0 struct usb_interface *interface;
>
> =C2=A0=C2=A0=C2=A0 /* get the interface from minor number and driver info=
rmation */
> =C2=A0=C2=A0=C2=A0 interface =3D usb_find_interface(&chaoskey_driver, imi=
nor(inode));
> =C2=A0=C2=A0=C2=A0 if (!interface)
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return -ENODEV;
>
> =C2=A0=C2=A0=C2=A0 usb_dbg(interface, "open");
>
> =C2=A0=C2=A0=C2=A0 dev =3D usb_get_intfdata(interface);
> =C2=A0=C2=A0=C2=A0 if (!dev) {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 usb_dbg(interface, "open (dev)");
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return -ENODEV;
> =C2=A0=C2=A0=C2=A0 }
>
> =C2=A0=C2=A0=C2=A0 file->private_data =3D dev;
> =C2=A0=C2=A0=C2=A0 mutex_lock(&dev->lock);
> =C2=A0=C2=A0=C2=A0 ++dev->open;
> =C2=A0=C2=A0=C2=A0 mutex_unlock(&dev->lock);
>
> Multiple calls can race. Proper locking needs to be used in the driver.
> A private count needs to be maintained because the driver must be able
> to determine when the last user of an unplugged device goes away.
>
> After the open function is called, the read and write functions are
> called to receive and send data to the device. We are using cdc-wdm
> as an example::
>
> static ssize_t wdm_write
> (struct file *file, const char __user *buffer, size_t count, loff_t *ppos)
>
> Data transfers to devices are described, initiated and controlled by means
> of a data structure called URB, which a separate tutorial is provided for.

The document contains both "URB" and "urb"; better to be consistent.

> A write operation basically splits up its data into URBs and submits them
> in the right order.
> The basic operation is complicated by the requirements of the USB subsyst=
em
> that URBs not be used while power management operations or resets are
> under way. Drivers need to heck for such conditions or make sure that the
> device be not in power save::
>
> =C2=A0=C2=A0=C2=A0 if (test_bit(WDM_DISCONNECTING, &desc->flags)) {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 rv =3D -ENODEV;
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 goto out_free_mem_lock;
> =C2=A0=C2=A0=C2=A0 }
>
> =C2=A0=C2=A0=C2=A0 r =3D usb_autopm_get_interface(desc->intf);
> =C2=A0=C2=A0=C2=A0 if (r < 0) {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 rv =3D usb_translate_errors(r);
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 goto out_free_mem_lock;
> =C2=A0=C2=A0=C2=A0 }
>
> and::
>
> =C2=A0=C2=A0=C2=A0 if (test_bit(WDM_RESETTING, &desc->flags))
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 r =3D -EIO;
>
> The :c:func:`usb_bulk_msg` function can be very useful for doing single

:c:func: is actively discouraged; just say usb_bulk_msg() and the right
thing should happen.

> reads
> or writes to a device; however, if you need to read or write constantly to
> a device, it is recommended to set up your own urbs and submit them to
> the USB subsystem. Not using your own URBs prevents you from interrupting
> ongoing transfers and does not allow you to use the ful bus bandwidth.
>
> Whenever user space closes a file, the release operation is called::
>
> =C2=A0static int chaoskey_release(struct inode *inode, struct file *file)
> =C2=A0
> =C2=A0In addition to a conventional device, which needs to only stop IO,
> =C2=A0USB need to handle that a device has already gone away. In that case
> =C2=A0the driver needs to remove any reference to the device once the las=
t user
> =C2=A0closes the device::
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 --dev->open;
>
> =C2=A0=C2=A0=C2=A0 if (!dev->present) {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (dev->open =3D=3D 0) {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mutex_unlock(&de=
v->lock);
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 chaoskey_free(de=
v);
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 } else
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mutex_unlock(&de=
v->lock);
> =C2=A0=C2=A0=C2=A0 } else
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mutex_unlock(&dev->lock);
>
> One of the more difficult problems that USB drivers must be able to
> handle smoothly is the fact that the USB device may be removed from the
> system at any point in time, even if a program is currently talking to
> it. It needs to be able to shut down any current reads and writes and
> notify the user-space programs that the device is no longer there. The
> following code (function ``chaoskey_disconnect``) is an example of how to=
 do
> this::
>
> static void chaoskey_disconnect(struct usb_interface *interface)
> {
> =C2=A0=C2=A0=C2=A0 struct chaoskey=C2=A0=C2=A0=C2=A0 *dev;
>
> =C2=A0=C2=A0=C2=A0 usb_dbg(interface, "disconnect");
> =C2=A0=C2=A0=C2=A0 dev =3D usb_get_intfdata(interface);
> =C2=A0=C2=A0=C2=A0 if (!dev) {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 usb_dbg(interface, "disconnect fail=
ed - no dev");
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return;
> =C2=A0=C2=A0=C2=A0 }
>
> =C2=A0=C2=A0=C2=A0 if (dev->hwrng_registered)
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 hwrng_unregister(&dev->hwrng);
>
> =C2=A0=C2=A0=C2=A0 usb_deregister_dev(interface, &chaoskey_class);
>
> =C2=A0=C2=A0=C2=A0 usb_set_intfdata(interface, NULL);
> =C2=A0=C2=A0=C2=A0 mutex_lock(&dev->lock);
>
> =C2=A0=C2=A0=C2=A0 dev->present =3D false;
> =C2=A0=C2=A0=C2=A0 usb_poison_urb(dev->urb);
>
> =C2=A0=C2=A0=C2=A0 if (!dev->open) {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mutex_unlock(&dev->lock);
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 chaoskey_free(dev);
> =C2=A0=C2=A0=C2=A0 } else
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mutex_unlock(&dev->lock);
>
> =C2=A0=C2=A0=C2=A0 usb_dbg(interface, "disconnect done");
> }
>
> First, the device is deregistered from the system::
>
> =C2=A0=C2=A0=C2=A0 usb_deregister_dev(interface, &chaoskey_class);
>
> That step prevents any new users of the device and generates an event
> reported to user space.
>
> Second the device is internally marked not present, thereby entering a ki=
nd
> of undead state::
>
> =C2=A0=C2=A0=C2=A0 usb_set_intfdata(interface, NULL);
> =C2=A0=C2=A0=C2=A0 mutex_lock(&dev->lock);
>
> =C2=A0=C2=A0=C2=A0 dev->present =3D false;
>
> Third any present and future IO is terminated::
>
> =C2=A0=C2=A0=C2=A0 usb_poison_urb(dev->urb);
>
> Only in the last step is the internal representation removed, if and
> only if, no users are left::
>
> =C2=A0=C2=A0=C2=A0 if (!dev->open) {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 mutex_unlock(&dev->lock);
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 chaoskey_free(dev);
>
> These operations must be performed in this specific order.
>
>
> Operations on the whole device
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>
> Keep in mind that drivers for USB devices are technically drivers for
> interfaces of USB devices. Some operations, namely reset and power
> management apply to the whole device. For those the drivers must
> coordinate. This is done in suc a way that before an operation one

suc*h*

> function is called and after an operation another function is called.
>
> For reset the following methods are provided::
>
> =C2=A0=C2=A0=C2=A0 .pre_reset =3D uas_pre_reset,
> =C2=A0=C2=A0=C2=A0 .post_reset =3D uas_post_reset,
>
> After pre_reset() the device must have ceased all IO and may not begin
> new IO. This is done here::
>
> static int wdm_pre_reset(struct usb_interface *intf)
> {
> =C2=A0=C2=A0=C2=A0 struct wdm_device *desc =3D wdm_find_device(intf);
>
> =C2=A0=C2=A0=C2=A0 /*
> =C2=A0=C2=A0=C2=A0 =C2=A0* we notify everybody using poll of
> =C2=A0=C2=A0=C2=A0 =C2=A0* an exceptional situation
> =C2=A0=C2=A0=C2=A0 =C2=A0* must be done before recovery lest a spontaneous
> =C2=A0=C2=A0=C2=A0 =C2=A0* message from the device is lost
> =C2=A0=C2=A0=C2=A0 =C2=A0*/
> =C2=A0=C2=A0=C2=A0 spin_lock_irq(&desc->iuspin);
> =C2=A0=C2=A0=C2=A0 set_bit(WDM_RESETTING, &desc->flags);=C2=A0=C2=A0=C2=
=A0 /* inform read/write */
> =C2=A0=C2=A0=C2=A0 set_bit(WDM_READ, &desc->flags);=C2=A0=C2=A0=C2=A0 /* =
unblock read */
> =C2=A0=C2=A0=C2=A0 clear_bit(WDM_IN_USE, &desc->flags);=C2=A0=C2=A0=C2=A0=
 /* unblock write */
> =C2=A0=C2=A0=C2=A0 desc->rerr =3D -EINTR;
> =C2=A0=C2=A0=C2=A0 spin_unlock_irq(&desc->iuspin);
> =C2=A0=C2=A0=C2=A0 wake_up_all(&desc->wait);
>
> And all new IO must be prevented::
>
> =C2=A0=C2=A0=C2=A0 poison_urbs(desc);
> =C2=A0=C2=A0=C2=A0 cancel_work_sync(&desc->rxwork);
> =C2=A0=C2=A0=C2=A0 cancel_work_sync(&desc->service_outs_intr);
>
> After post_reset() IO can be restarted::
>
> static int wdm_post_reset(struct usb_interface *intf)
> {
> =C2=A0=C2=A0=C2=A0 struct wdm_device *desc =3D wdm_find_device(intf);
> =C2=A0=C2=A0=C2=A0 int rv;
>
> =C2=A0=C2=A0=C2=A0 unpoison_urbs(desc);
> =C2=A0=C2=A0=C2=A0 clear_bit(WDM_OVERFLOW, &desc->flags);
> =C2=A0=C2=A0=C2=A0 clear_bit(WDM_RESETTING, &desc->flags);
>
> That may involve bringing the device back to an operable state,
> from the default state like UAS shows::
>
> =C2=A0=C2=A0=C2=A0 err =3D uas_configure_endpoints(devinfo);
> =C2=A0=C2=A0=C2=A0 if (err && err !=3D -ENODEV)
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 shost_printk(KERN_ERR, shost,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0=C2=A0 "%s: alloc streams error %d after reset",
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0=C2=A0 __func__, err);
>
> The driver must also somehow notify that the device may have lost data
> or state. That can be done either in pre_reset(), like cdc-wdm does::
>
> =C2=A0=C2=A0=C2=A0=C2=A0 spin_lock_irq(&desc->iuspin);
> =C2=A0=C2=A0=C2=A0 set_bit(WDM_RESETTING, &desc->flags);=C2=A0=C2=A0=C2=
=A0 /* inform read/write */
> =C2=A0=C2=A0=C2=A0 set_bit(WDM_READ, &desc->flags);=C2=A0=C2=A0=C2=A0 /* =
unblock read */
> =C2=A0=C2=A0=C2=A0 clear_bit(WDM_IN_USE, &desc->flags);=C2=A0=C2=A0=C2=A0=
 /* unblock write */
> =C2=A0=C2=A0=C2=A0 desc->rerr =3D -EINTR;
> =C2=A0=C2=A0=C2=A0 spin_unlock_irq(&desc->iuspin);
>
> or it can be done in post reset, lie UAS does::
>
> =C2=A0=C2=A0=C2=A0 /* we must unblock the host in every case lest we dead=
lock */
> =C2=A0=C2=A0=C2=A0 spin_lock_irqsave(shost->host_lock, flags);
> =C2=A0=C2=A0=C2=A0 scsi_report_bus_reset(shost, 0);
> =C2=A0=C2=A0=C2=A0 spin_unlock_irqrestore(shost->host_lock, flags);
>
> The operations for power management are covered in their own article.
>
>
> Conclusion
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Writing Linux USB device drivers is not a difficult task as the
> chaoskey or usblp drivers show. These drivers, combined with the other
> current
> USB drivers, should provide enough examples to help a beginning author
> create a working driver in a minimal amount of time. The linux-usb-devel
> mailing list archives also contain a lot of helpful information.
>
> Resources
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> The Linux USB Project:
> http://www.linux-usb.org/
>
> Linux Hotplug Project:
> http://linux-hotplug.sourceforge.net/
>
> linux-usb Mailing List Archives:
> https://lore.kernel.org/linux-usb/
>
> Programming Guide for Linux USB Device Drivers:
> https://lmu.web.psi.ch/docu/manuals/software_manuals/linux_sl/usb_linux_p=
rogramming_guide.pdf
>
> USB Home Page: https://www.usb.org

Overall, the idea of taking code from real drivers seems like good one,
but I worry that jumping between multiple drivers might confuse the
points a bit.  Might it be better to pick a single one and us it
everywhere?

Also, how are you going to keep the document up to date as the driver
itself changes?  There are mechanisms in Sphinx to extract code directly
from the source files; we don't really use them, so far, but could maybe
consider it.  That would keep the (rendered) document current at the
cost of significantly reducing the readability of the plain-text
version.

Thanks,

jon
