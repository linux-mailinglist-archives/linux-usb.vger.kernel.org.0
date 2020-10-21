Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46D06294AE4
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 11:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438339AbgJUJ5a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 05:57:30 -0400
Received: from mail-02.mail-europe.com ([51.89.119.103]:51702 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438327AbgJUJ53 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Oct 2020 05:57:29 -0400
Date:   Wed, 21 Oct 2020 09:57:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1603274244;
        bh=H+RKzN6UhakiRlOo2OklFUd/Aq2bIDma4Z1bifkQaXc=;
        h=Date:To:From:Reply-To:Subject:From;
        b=oqj2bcIis+Kn/oqaVQsI1o//axIet44d4M2DV69zy0E+zXWEkBE9AdFJb1kq3FzFc
         LBBmcnIVGgnCwXPtDhhhnFHH1Txixn3r6xojRyJetn+ByT1VwnBak+M/vKqUOjDmTh
         J/CYHRyJPHzXa2xqXQNdsRb67xqNVlLaRq/1ctwM=
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From:   trees1010 <trees1010@protonmail.com>
Reply-To: trees1010 <trees1010@protonmail.com>
Subject: External monitors not detected via thunderbolt 3 dock in Devuan, but okay in Popos
Message-ID: <lF-Ayl8JXcksvw4NuDTxAgfBjbP8_q8efV2c-UPDwmYXtUBu4Z8rXRy_uprTc3KCQbCXwV1q_w6xcxUjvELyQtAD26ucI2etYNHfaihvKnE=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.7 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi everyone,

I hope I have come to the right place, otherwise let me know where I should=
 direct this question/problem.

I have a problem with using external monitors attached to a thunderbolt 3 d=
ock (Dell, WD19TB) that is OS specific.
The two external monitors attached via DisplayPorts to the dock are detecte=
d and used automatically by PopOS/Ubuntu 20, Kernel 5.4 (default configurat=
ion).
However, Devuan Beowulf (Debian based) with the default or latest 5.8 Kerne=
l does not detect the monitors and so they cannot be used.

The docking station is authorised using the 'bolt' utility (https://gitlab.=
freedesktop.org/bolt/bolt) for both PopOS and Devuan.

# boltctl
=E2=97=8F Dell WD19TB Thunderbolt Dock
=C2=A0=C2=A0 =E2=94=9C=E2=94=80 type:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 peripheral
=C2=A0=C2=A0 =E2=94=9C=E2=94=80 name:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 WD19TB Thunderbolt Dock
=C2=A0=C2=A0 =E2=94=9C=E2=94=80 vendor:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Dell
=C2=A0=C2=A0 =E2=94=9C=E2=94=80 uuid:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <UUID>
=C2=A0=C2=A0 =E2=94=9C=E2=94=80 generation:=C2=A0=C2=A0=C2=A0 Thunderbolt 3
=C2=A0=C2=A0 =E2=94=9C=E2=94=80 status:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 authorized
=C2=A0=C2=A0 =E2=94=82=C2=A0 =E2=94=9C=E2=94=80 domain:=C2=A0=C2=A0=C2=
=A0=C2=A0 <DOMAIN>
=C2=A0=C2=A0 =E2=94=82=C2=A0 =E2=94=9C=E2=94=80 rx speed:=C2=A0=C2=A0 40 Gb=
/s =3D 2 lanes * 20 Gb/s
=C2=A0=C2=A0 =E2=94=82=C2=A0 =E2=94=9C=E2=94=80 tx speed:=C2=A0=C2=A0 40 Gb=
/s =3D 2 lanes * 20 Gb/s
=C2=A0=C2=A0 =E2=94=82=C2=A0 =E2=94=94=E2=94=80 authflags:=C2=A0 none
=C2=A0=C2=A0 =E2=94=9C=E2=94=80 authorized:=C2=A0=C2=A0=C2=A0 Wed 07 Oct 20=
20 09:01:32 UTC
=C2=A0=C2=A0 =E2=94=9C=E2=94=80 connected:=C2=A0=C2=A0=C2=A0=C2=A0 Wed 21 O=
ct 2020 19:43:20 UTC
=C2=A0=C2=A0 =E2=94=94=E2=94=80 stored:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Wed 07 Oct 2020 08:12:45 UTC
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=9C=E2=94=80 policy:=C2=A0=C2=A0=C2=
=A0=C2=A0 auto
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=94=E2=94=80 key:=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 no

Both popos and devuan detect the thunderbolt dock being connected and the d=
ocks own USB hub.
I can attached USB devices, like a USB camera, to the dock and it works in =
both devaun and popos.

There is nothing obvious in the popos or devuan logs that would
indicate a major difference as to why the monitors don't work in devuan. Th=
ere are no errors in the devuan logs to
show why it does not detect the monitors (xrandr shows no extra connections=
 from the docking station when plugged in).

Popos Xorg.0.log shows the monitors being attached when the dock is connect=
ed to the laptop. Whilst nothing is
logged in Xorg.0.log in the case of devuan.
I can plug external monitors directly to the laptop via mini-dp and HDMI an=
d they are detected and can be used to display an extended desktop.

The only key difference I have found is by using '$ sudo ddcutil interrogat=
e'.

It shows that popos detects the DDC via i2c bus of the two external monitor=
s, whilst devuan does not detect anything.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PopOS with 5.4 kernel:

*** Primary Check 1: Identify video card and driver ***

Obtaining card and driver information from /sys...
Primary video controller at PCI address 0000:00:02.0 (boot_vga flag is set)
Device class: x030000 VGA compatible controller
Vendor: x8086 Intel Corporation
Device: x9b41 UHD Graphics
Subvendor/Subdevice: 8086/2212 Intel Corporation
Driver name: i915
Driver version: Unable to determine
I2C device: i2c-3 name: i915 gmbus dpc
I2C device: i2c-8 name: DPMST
I2C device: i2c-4 name: i915 gmbus misc
I2C device: i2c-2 name: i915 gmbus dpb
I2C device: i2c-9 name: DPMST
I2C device: i2c-5 name: i915 gmbus dpd

<SNIP>

Examining /sys/bus/i2c/devices...
/sys/bus/i2c/devices/i2c-3/name: i915 gmbus dpc
/sys/bus/i2c/devices/i2c-1/name: Synopsys DesignWare I2C adapter
/sys/bus/i2c/devices/i2c-8/name: DPMST
/sys/bus/i2c/devices/i2c-6/name: DPDDC-A
/sys/bus/i2c/devices/i2c-4/name: i915 gmbus misc
/sys/bus/i2c/devices/i2c-2/name: i915 gmbus dpb
/sys/bus/i2c/devices/i2c-0/name: SMBus I801 adapter at efa0
/sys/bus/i2c/devices/i2c-9/name: DPMST
/sys/bus/i2c/devices/i2c-7/name: DPDDC-B
/sys/bus/i2c/devices/i2c-5/name: i915 gmbus dpd

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Devuan with 5.8 kernel:

*** Primary Check 1: Identify video card and driver ***

Obtaining card and driver information from /sys...
Primary video controller at PCI address 0000:00:02.0 (boot_vga flag is set)
Device class: x030000 VGA compatible controller
Vendor: x8086 Intel Corporation
Device: x9b41 UHD Graphics
Subvendor/Subdevice: 8086/2212 Intel Corporation
Driver name: i915
Driver version: Unable to determine
I2C device: i2c-3 name: i915 gmbus dpc
I2C device: i2c-4 name: i915 gmbus misc
I2C device: i2c-2 name: i915 gmbus dpb
I2C device: i2c-5 name: i915 gmbus dpd

<SNIP>

Examining /sys/bus/i2c/devices...
/sys/bus/i2c/devices/i2c-3/name: i915 gmbus dpc
/sys/bus/i2c/devices/0-0050/name: ee1004
(each_i2c_device ) Unexpected /sys/bus/i2c/devices file name: 0-0050
/sys/bus/i2c/devices/i2c-1/name: Synopsys DesignWare I2C adapter
/sys/bus/i2c/devices/i2c-6/name: AUX A/port A
/sys/bus/i2c/devices/i2c-4/name: i915 gmbus misc
/sys/bus/i2c/devices/i2c-2/name: i915 gmbus dpb
/sys/bus/i2c/devices/i2c-0/name: SMBus I801 adapter at efa0
/sys/bus/i2c/devices/i2c-7/name: AUX B/port B
/sys/bus/i2c/devices/i2c-5/name: i915 gmbus dpd

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The kernel Thunderbolt documentation (https://www.kernel.org/doc/html/v5.4/=
admin-guide/thunderbolt.html) does not show how to
debug problems like this.

Q1. How to turn on debugging in the kernel and/or modules to provide more i=
nformation about the connection process and why it fails?

Q2. How does the kernel detect DP/HDMI ports through the thunderbolt 3 dock=
? I.e. What is meant to happen and should be seen in the logs or /sys/bus/i=
2c/devices, etc?

Q3. Is there any documentation on how the USB/DP/HDMI/Thunderbolt 3/dock sy=
stem work? Thunderspy.io was the only place I could find decent description=
 of the architecture.

Any advice appreciated.
