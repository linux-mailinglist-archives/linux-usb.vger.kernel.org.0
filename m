Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8F87650C99
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 14:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbiLSNYs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 08:24:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbiLSNYr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 08:24:47 -0500
X-Greylist: delayed 1618 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 19 Dec 2022 05:24:44 PST
Received: from fallback4.mail.ox.ac.uk (fallback4.mail.ox.ac.uk [129.67.1.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C07B22AD4
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 05:24:44 -0800 (PST)
Received: from relay19.mail.ox.ac.uk ([129.67.1.170])
        by fallback4.mail.ox.ac.uk with esmtp (Exim 4.92)
        (envelope-from <dima.pasechnik@cs.ox.ac.uk>)
        id 1p7FiE-0001qU-HS
        for linux-usb@vger.kernel.org; Mon, 19 Dec 2022 12:57:46 +0000
Received: from smtp9.mail.ox.ac.uk ([129.67.1.206])
        by relay19.mail.ox.ac.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <dima.pasechnik@cs.ox.ac.uk>)
        id 1p7FiC-00015E-9r; Mon, 19 Dec 2022 12:57:44 +0000
Received: from cpc78303-slou2-2-0-cust186.17-4.cable.virginm.net ([62.31.33.187]:50432 helo=hilbert.cs.ox.ac.uk)
        by smtp9.mail.ox.ac.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <dima.pasechnik@cs.ox.ac.uk>)
        id 1p7FiB-0001s2-Tt; Mon, 19 Dec 2022 12:57:43 +0000
Received: by hilbert.cs.ox.ac.uk (Postfix, from userid 1000)
        id 08CE8744465; Mon, 19 Dec 2022 12:57:43 +0000 (GMT)
Date:   Mon, 19 Dec 2022 12:57:43 +0000
From:   dima.pasechnik@cs.ox.ac.uk
To:     linux-usb@vger.kernel.org
Subject: usb 1-3: Product: BBC micro:bit CMSIS-DAP not recognised
Message-ID: <Y6Bfx+Ksm/Qz3N8y@hilbert>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0HKrNtXoMoX9AcJm"
Content-Disposition: inline
X-PGP-Key: http://keys.gnupg.net/pks/lookup?op=vindex&search=dimpase@cs.ox.ac.uk
X-Oxford-Username: coml0531
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--0HKrNtXoMoX9AcJm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

this is a popular in UK education board: https://microbit.org/
- the currently sold (Version 2) one. It does on the same USB 3 things:
  mass storage, ACM, and serial. Serial appears unknown to the kernel.

With Linux kernel 6.0.8 on x86_54, and various USB serial drivers installed, upon plugging into USB
port, I see in dmesg:

[45460.035306] usb 1-3: new full-speed USB device number 10 using xhci_hcd
[45460.166959] usb 1-3: New USB device found, idVendor=0d28, idProduct=0204, bcdDevice=10.00
[45460.166965] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[45460.166967] usb 1-3: Product: BBC micro:bit CMSIS-DAP
[45460.166968] usb 1-3: Manufacturer: Arm
[45460.166970] usb 1-3: SerialNumber: 9905360200052833525e24a702a68552000000006e052820
[45460.172168] usb-storage 1-3:1.0: USB Mass Storage device detected
[45460.172538] scsi host1: usb-storage 1-3:1.0
[45460.173203] cdc_acm 1-3:1.1: ttyACM0: USB ACM device
[45460.175258] hid-generic 0003:0D28:0204.0005: hiddev96,hidraw0: USB HID v1.00 Device [Arm BBC micro:bit CMSIS-DAP] on usb-0000:00:14.0-3/input3
[45460.175581] usbserial_generic 1-3:1.4: The "generic" usb-serial driver is only for testing and one-off prototypes.
[45460.175585] usbserial_generic 1-3:1.4: Tell linux-usb@vger.kernel.org to add your device to a proper driver.
[45460.175587] usbserial_generic 1-3:1.4: device has no bulk endpoints
[45460.175818] usbserial_generic 1-3:1.5: The "generic" usb-serial driver is only for testing and one-off prototypes.
[45460.175821] usbserial_generic 1-3:1.5: Tell linux-usb@vger.kernel.org to add your device to a proper driver.
[45460.175823] usbserial_generic 1-3:1.5: generic converter detected
[45460.175905] usb 1-3: generic converter now attached to ttyUSB0
[45461.175731] scsi 1:0:0:0: Direct-Access     MBED     VFS              0.1  PQ: 0 ANSI: 2
[45461.176279] sd 1:0:0:0: [sdb] 131200 512-byte logical blocks: (67.2 MB/64.1 MiB)
[45461.176480] sd 1:0:0:0: [sdb] Write Protect is off
[45461.176484] sd 1:0:0:0: [sdb] Mode Sense: 03 00 00 00
[45461.176659] sd 1:0:0:0: [sdb] No Caching mode page found
[45461.176661] sd 1:0:0:0: [sdb] Assuming drive cache: write through
[45461.186409]  sdb:
[45461.186439] sd 1:0:0:0: [sdb] Attached SCSI removable disk

Best regards,
Dmitrii
www.pasechnik.info

--0HKrNtXoMoX9AcJm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJVdDnfI7raAa4RJxoksLHjfJBTEFAmOgX8EACgkQoksLHjfJ
BTHPIggAmxPUUD7+9fRXExVVq+o39KpPYTi/2z8YXbFklUjjqyr1M3sISc26rwe8
DoGbhc6UN1pP26S2wbWNHou8BwTDFPldpM1xfqLbLRaR3+KOPdzJBp5On48jhlUH
y1qUSZQmeVyg+xreOZVlS9UnB8gjFJBE2up6ubzH0pfQ5FE9Ykib3LOFm/lF0CF/
uH7D09G0gNdbqJeGP7/EMWMvt5M6fHANTLGR5q6bpEVGS50Bx6wCH0dBmqWRMDkb
RBrqLK19YPYmwG+CJ+UpJfuDsl9WvrhRgYdPtLoRNYFTnl0py1fDkwSO+R9N2OeA
eC1WrXO1lQNAPhaV22xH64GQT1vlUg==
=DZcp
-----END PGP SIGNATURE-----

--0HKrNtXoMoX9AcJm--
