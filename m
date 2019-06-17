Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4605947A78
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2019 09:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbfFQHNa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jun 2019 03:13:30 -0400
Received: from mga04.intel.com ([192.55.52.120]:63501 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725826AbfFQHNa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Jun 2019 03:13:30 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Jun 2019 00:13:29 -0700
X-ExtLoop1: 1
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga006.fm.intel.com with ESMTP; 17 Jun 2019 00:13:27 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-actions@lists.infradead.org,
        afaerber@suse.de
Subject: Re: DWC3 USB hub issue
In-Reply-To: <20190614183213.GB29654@Mani-XPS-13-9360>
References: <20190614183213.GB29654@Mani-XPS-13-9360>
Date:   Mon, 17 Jun 2019 10:13:23 +0300
Message-ID: <874l4oit0s.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> Hello,
>
> I'm trying to upstream Designware USB3 host driver present in the Actions
> Semi S900 SoC. It can successfully detect the USB hub but when any of the
> USB device got plugged in, it fails with following error:
>
> [    4.365566] usb usb1-port1: connect-debounce failed
>
> Full log can be found here: https://pastebin.ubuntu.com/p/PNff5fZkn6/
>
> Below is the output of, lsusb -v:
>
> Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               3.00
>   bDeviceClass            9 Hub
>   bDeviceSubClass         0 Unused
>   bDeviceProtocol         3=20
>   bMaxPacketSize0         9
>   idVendor           0x1d6b Linux Foundation
>   idProduct          0x0003 3.0 root hub
>   bcdDevice            5.02
>   iManufacturer           3 Linux 5.2.0-rc3-00032-gbd970cfc7a82-dirty xhc=
i-hcd
>   iProduct                2 xHCI Host Controller
>   iSerial                 1 xhci-hcd.0.auto
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength           31
>     bNumInterfaces          1
>     bConfigurationValue     1
>     iConfiguration          0=20
>     bmAttributes         0xe0
>       Self Powered
>       Remote Wakeup
>     MaxPower                0mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass         9 Hub
>       bInterfaceSubClass      0 Unused
>       bInterfaceProtocol      0 Full speed (or root) hub
>       iInterface              0=20
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0004  1x 4 bytes
>         bInterval              12
>         bMaxBurst               0
> Hub Descriptor:
>   bLength              12
>   bDescriptorType      42
>   nNbrPorts             1
>   wHubCharacteristic 0x000a
>     No power switching (usb 1.0)
>     Per-port overcurrent protection
>   bPwrOn2PwrGood       10 * 2 milli seconds
>   bHubContrCurrent      0 milli Ampere
>   bHubDecLat          0.0 micro seconds
>   wHubDelay             0 nano seconds
>   DeviceRemovable    0x00
>  Hub Port Status:
>    Port 1: 0000.02a0 5Gbps power Rx.Detect
> Binary Object Store Descriptor:
>   bLength                 5
>   bDescriptorType        15
>   wTotalLength           15
>   bNumDeviceCaps          1
>   SuperSpeed USB Device Capability:
>     bLength                10
>     bDescriptorType        16
>     bDevCapabilityType      3
>     bmAttributes         0x02
>       Latency Tolerance Messages (LTM) Supported
>     wSpeedsSupported   0x0008
>       Device can operate at SuperSpeed (5Gbps)
>     bFunctionalitySupport   3
>       Lowest fully-functional device speed is SuperSpeed (5Gbps)
>     bU1DevExitLat           0 micro seconds
>     bU2DevExitLat           0 micro seconds
> Device Status:     0x0001
>   Self Powered
>
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>
> Devicetree snippet:
>
>                 usbdrd3_0: usb@e0400000 {
>                         compatible =3D "actions,s900-dwc3";
>                         clocks =3D <&cmu CLK_USB3_480MPLL0>,
>                                  <&cmu CLK_USB3_480MPHY0>,
>                                  <&cmu CLK_USB3_5GPHY>,
>                                  <&cmu CLK_USB3_CCE>,
>                                  <&cmu CLK_USB3_MAC>;
>                         clock-names =3D "usb3_480mpll0", "usb3_480mphy0",
>                                       "usb3_5gphy", "usb3_cce",
>                                       "usb3_mac";
>                         resets  =3D <&cmu RESET_USB3>;
>                         reset-names =3D "usb3";
>                         power-domains =3D <&sps S900_PD_USB3>;
>                         #address-cells =3D <2>;
>                         #size-cells =3D <2>;
>                         ranges;
>
>                         usbdrd_dwc3_0: dwc3 {
>                                 compatible =3D "snps,dwc3";
>                                 reg =3D <0x0 0xe0400000 0x0 0x100000>;
>                                 interrupts =3D <GIC_SPI 23 IRQ_TYPE_LEVEL=
_HIGH>;
>                                 usb-phy =3D <&usb2_phy>, <&usb3_phy>;
>                                 dr_mode =3D "host";
>                                 power-domains =3D <&sps S900_PD_USB3>;
>                                 snps,hsphy_interface =3D "utmi";
>                         };
>                 };
>
> After going through the mailing list looking for similar issue, found that
> some host controllers works with following quirk:
>
> snps,dis_u3_susphy_quirk;
>
> I tried that also but it didn't work. Can anyone shed some light on this?
>
> PS: USB3 is working fine with vendor kernel 3.10.

Check what's different between mainline and your v3.10 code. Specially
look for changes in xhci and usbcore.

Good luck

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl0HPZMACgkQzL64meEa
mQbRjA//aX3iFqVzi5/0YhX3ufS0kfSv/dvDxkqSPJA3MZt4Q73jfZtjQR2iQQt8
t0w5qGqRtDa9ofF26oZY1wG2bo4J2pZVmW5BJe9bpGOeS1Ccs143C3lTUfo/nE+s
gDhtD1fXyUUHdfZBgMffIqdoJ1L3IznL8REq8oZJyMUqVwBThkV8WTmqdg3dT6/w
eOyyzw1AGo4azKLKmRGeSowUhV5tDU/qTCPIIB9tfZXB1nDIGDBmxQLDW2uzfHpY
x9unbydidMwO0VHYk5KB0WZwu4QDkPIbGKqb8IplxXcmUt1rSaq9rPWTq/RJ81O9
2qXnv8ArnyOg3vX28MuyoZFcPHXDjYFWSffzaU07SfkZrejVg38BoFg2EMfle70E
EriUf496itcSH2v9yqSgrZoBfgncrmOtN8POGEThiYRDvdobHvFL40YSl/Y9x8yU
ZExjNn8jjouU8K+w1X36lghvtqc9heDq/dVqTl0T2KMdDBXcpIamVkAJhWJdTIEB
s8LGxE/imgMT0LK2n53k2JQe0o98nn+MYUJW2t4B/HqovX4Xp7oSHbJ+MKuIEyTa
achJO8tdzO9OZBqVeGJEfnHKA3I5uCXr4Jde2nEiKc4jCAsMfa8yaDePJV1cksZo
S3kfxZ3v3sff1tBhn3OU/zFrtr3p4MpJiyuGthvMSuM40o7LpDc=
=LUVK
-----END PGP SIGNATURE-----
--=-=-=--
