Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE0531A7B0
	for <lists+linux-usb@lfdr.de>; Sat, 11 May 2019 13:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbfEKLq7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 May 2019 07:46:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:36634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728506AbfEKLq7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 11 May 2019 07:46:59 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1A9942146F;
        Sat, 11 May 2019 11:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557575217;
        bh=tIXP+MzF468skw108TXR1GNwB20Hle7UHUmjig389jo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WssoXo4fSslGCTi4IIpq2Rcqaa76BJV9BfrrHTIfyfML/ybwphiAFN9FW2BqQRbaz
         ICfXSE2r3fUoZfsALB5KQrVSQ/saKgJa6Vor+m1UZkVziYmfb0TwVpE9hN7QfUFjdc
         1DZsQ405CLBS+6KYwfraS4OXXKS8GB3HGdkAMDME=
Date:   Sat, 11 May 2019 13:46:54 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     howaboutsynergy@protonmail.com
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Eaton 5E UPS (aka MGE UPS) auto-disconnecting after
 `usb_submit_urb(ctrl) failed: -1` and `timeout initializing reports`
Message-ID: <20190511114654.GA25686@kroah.com>
References: <43W7RqIKYXiPgdTYUdZnO_ZvCI7FCgsahPEdc5p4haN6EOynzDbGKswDeRGGPfNajHNVT_eOIWZMzOvvf5lvs4BjfeMwi9IM9wLnJlcZpDE=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43W7RqIKYXiPgdTYUdZnO_ZvCI7FCgsahPEdc5p4haN6EOynzDbGKswDeRGGPfNajHNVT_eOIWZMzOvvf5lvs4BjfeMwi9IM9wLnJlcZpDE=@protonmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 11, 2019 at 10:11:52AM +0000, howaboutsynergy@protonmail.com wrote:
> Without the attached patch, upowerd (via upower.service) will cause repeated disconnect&reconnect of the USB device for Eaton 5E UPS (known in kernel headers as MGE UPS)
> and just spam things like this every 10 seconds (I thought it was 20, oh well):
> 
> [ 1156.492171] hid-generic 0003:0463:FFFF.003F: usb_submit_urb(ctrl) failed: -1
> [ 1156.492215] hid-generic 0003:0463:FFFF.003F: timeout initializing reports
> [ 1161.918674] usb 1-14: USB disconnect, device number 63
> [ 1162.659694] gpg-agent[1068]: handler 0x752b0f137700 for fd 10 started
> [ 1162.711817] gpg-agent[1068]: handler 0x752b0f137700 for fd 10 terminated
> [ 1162.806042] usb 1-14: new low-speed USB device number 64 using xhci_hcd
> [ 1163.569330] usb 1-14: New USB device found, idVendor=0463, idProduct=ffff, bcdDevice= 0.01
> [ 1163.569339] usb 1-14: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [ 1163.569344] usb 1-14: Product: 5E
> [ 1163.569347] usb 1-14: Manufacturer: EATON
> [ 1165.529902] hid-generic 0003:0463:FFFF.0040: hiddev97,hidraw4: USB HID v1.10 Device [EATON 5E] on usb-0000:00:14.0-14/input0
> [ 1165.540017] mtp-probe[5586]: checking bus 1, device 64: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-14"
> [ 1165.540180] mtp-probe[5586]: bus: 1, device: 64 was not an MTP device
> [ 1166.081247] mtp-probe[5608]: checking bus 1, device 64: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-14"
> [ 1166.081500] mtp-probe[5608]: bus: 1, device: 64 was not an MTP device
> [ 1172.042315] usb 1-14: USB disconnect, device number 64
> 
> originally reported here: https://bugzilla.kernel.org/show_bug.cgi?id=203569
> 
> Here's more info via `sudo lsusb -vvvv`:
> Bus 001 Device 005: ID 0463:ffff MGE UPS Systems UPS
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               1.10
>   bDeviceClass            0
>   bDeviceSubClass         0
>   bDeviceProtocol         0
>   bMaxPacketSize0         8
>   idVendor           0x0463 MGE UPS Systems
>   idProduct          0xffff UPS
>   bcdDevice            0.01
>   iManufacturer           1 (error)
>   iProduct                2 (error)
>   iSerial                 0
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x0022
>     bNumInterfaces          1
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0xa0
>       (Bus Powered)
>       Remote Wakeup
>     MaxPower               20mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass         3 Human Interface Device
>       bInterfaceSubClass      0
>       bInterfaceProtocol      0
>       iInterface              0
>         HID Device Descriptor:
>           bLength                 9
>           bDescriptorType        33
>           bcdHID               1.10
>           bCountryCode           33 US
>           bNumDescriptors         1
>           bDescriptorType        34 Report
>           wDescriptorLength     549
>          Report Descriptors:
>            ** UNAVAILABLE **
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0008  1x 8 bytes
>         bInterval              20
> 
> ^ that's with the patch, no idea why those two now show `error` instead of `Eaton` and `5E`:
> iManufacturer           1 (error)
> iProduct                2 (error)
> ...maybe it's the patch or the fact that the patch now allows upowerd or xfce4-power-manager (?) to communicate or something with the UPS and confused it? no idea, just guessing.
> 
> Without the patch xfce4-power-manager-settings segfaults as seen here: https://bugzilla.xfce.org/show_bug.cgi?id=15387#c5
> 
> Note: vger.kernel.org is http-only so I wasn't able to read/load it(can do https-only) thus I don't know if sending to this email works.
> 
> PS: if any devs want me to test any patches(even if unrelated to this issue), please let me know for I'll be happy to.

> will prevent auto-disconnection dmesg spam for Eaton 5E UPS connection via USB cable
> thanks to Reyad Attiyat for https://bugzilla.kernel.org/show_bug.cgi?id=73321#c11 and #c12
> 
> [ 1156.492171] hid-generic 0003:0463:FFFF.003F: usb_submit_urb(ctrl) failed: -1
> [ 1156.492215] hid-generic 0003:0463:FFFF.003F: timeout initializing reports
> [ 1161.918674] usb 1-14: USB disconnect, device number 63
> [ 1162.659694] gpg-agent[1068]: handler 0x752b0f137700 for fd 10 started
> [ 1162.711817] gpg-agent[1068]: handler 0x752b0f137700 for fd 10 terminated
> [ 1162.806042] usb 1-14: new low-speed USB device number 64 using xhci_hcd
> [ 1163.569330] usb 1-14: New USB device found, idVendor=0463, idProduct=ffff, bcdDevice= 0.01
> [ 1163.569339] usb 1-14: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [ 1163.569344] usb 1-14: Product: 5E
> [ 1163.569347] usb 1-14: Manufacturer: EATON
> [ 1165.529902] hid-generic 0003:0463:FFFF.0040: hiddev97,hidraw4: USB HID v1.10 Device [EATON 5E] on usb-0000:00:14.0-14/input0
> [ 1165.540017] mtp-probe[5586]: checking bus 1, device 64: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-14"
> [ 1165.540180] mtp-probe[5586]: bus: 1, device: 64 was not an MTP device
> [ 1166.081247] mtp-probe[5608]: checking bus 1, device 64: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-14"
> [ 1166.081500] mtp-probe[5608]: bus: 1, device: 64 was not an MTP device
> [ 1172.042315] usb 1-14: USB disconnect, device number 64
> [ 1172.042948] hid-generic 0003:0463:FFFF.0040: usb_submit_urb(ctrl) failed: -19
> [ 1172.931037] usb 1-14: new low-speed USB device number 65 using xhci_hcd
> [ 1173.692895] usb 1-14: New USB device found, idVendor=0463, idProduct=ffff, bcdDevice= 0.01
> [ 1173.692903] usb 1-14: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [ 1173.692907] usb 1-14: Product: 5E
> [ 1173.692912] usb 1-14: Manufacturer: EATON
> [ 1175.653569] hid-generic 0003:0463:FFFF.0041: hiddev97,hidraw4: USB HID v1.10 Device [EATON 5E] on usb-0000:00:14.0-14/input0
> [ 1175.663973] mtp-probe[5671]: checking bus 1, device 65: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-14"
> [ 1175.664700] mtp-probe[5671]: bus: 1, device: 65 was not an MTP device
> [ 1176.192214] mtp-probe[5693]: checking bus 1, device 65: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-14"
> [ 1176.192415] mtp-probe[5693]: bus: 1, device: 65 was not an MTP device
> [ 1182.156218] usb 1-14: USB disconnect, device number 65
> [ 1182.156301] hid-generic 0003:0463:FFFF.0041: usb_submit_urb(ctrl) failed: -19
> [ 1183.044037] usb 1-14: new low-speed USB device number 66 using xhci_hcd
> [ 1183.808062] usb 1-14: New USB device found, idVendor=0463, idProduct=ffff, bcdDevice= 0.01
> [ 1183.808070] usb 1-14: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [ 1183.808075] usb 1-14: Product: 5E
> [ 1183.808078] usb 1-14: Manufacturer: EATON
> [ 1185.767289] hid-generic 0003:0463:FFFF.0042: hiddev97,hidraw4: USB HID v1.10 Device [EATON 5E] on usb-0000:00:14.0-14/input0
> [ 1185.777254] mtp-probe[5757]: checking bus 1, device 66: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-14"
> [ 1185.777378] mtp-probe[5757]: bus: 1, device: 66 was not an MTP device
> [ 1186.318828] mtp-probe[5778]: checking bus 1, device 66: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-14"
> [ 1186.318946] mtp-probe[5778]: bus: 1, device: 66 was not an MTP device
> [ 1196.428121] hid-generic 0003:0463:FFFF.0042: usb_submit_urb(ctrl) failed: -1
> [ 1196.428161] hid-generic 0003:0463:FFFF.0042: timeout initializing reports
> 
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 77ffba48cc73..1afc38515719 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -112,6 +112,7 @@ static const struct hid_device_id hid_quirks[] = {
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_POWER_COVER), HID_QUIRK_NO_INIT_REPORTS },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_SURFACE_PRO_2), HID_QUIRK_NO_INIT_REPORTS },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_TOUCH_COVER_2), HID_QUIRK_NO_INIT_REPORTS },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_MGE, USB_DEVICE_ID_MGE_UPS), HID_QUIRK_NO_INIT_REPORTS }, //added by je
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_TYPE_COVER_2), HID_QUIRK_NO_INIT_REPORTS },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_MOJO, USB_DEVICE_ID_RETRO_ADAPTER), HID_QUIRK_MULTI_INPUT },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_MSI, USB_DEVICE_ID_MSI_GT683R_LED_PANEL), HID_QUIRK_NO_INIT_REPORTS },


Can you resend this and cc: the needed developer/maintainers as found by
using scripts/get_maintainer.pl?

Also, you need to sign-off on your patch, as described by
Documentation/SubmittingPatches.

thanks,

greg k-h
