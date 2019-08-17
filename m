Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DAB89136E
	for <lists+linux-usb@lfdr.de>; Sun, 18 Aug 2019 00:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbfHQWK1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Aug 2019 18:10:27 -0400
Received: from dsl092-148-226.wdc2.dsl.speakeasy.net ([66.92.148.226]:34848
        "EHLO nathanst.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfHQWK1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 17 Aug 2019 18:10:27 -0400
X-Greylist: delayed 520 seconds by postgrey-1.27 at vger.kernel.org; Sat, 17 Aug 2019 18:10:26 EDT
Received: from holmes.nathanst.com (nathanst@localhost [127.0.0.1])
        by nathanst.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id x7HM1jwj025649
        for <linux-usb@vger.kernel.org>; Sat, 17 Aug 2019 18:01:45 -0400
Received: (from nathanst@localhost)
        by holmes.nathanst.com (8.13.4/8.13.4/Submit) id x7HM1joK025647
        for linux-usb@vger.kernel.org; Sat, 17 Aug 2019 18:01:45 -0400
Date:   Sat, 17 Aug 2019 18:01:45 -0400
From:   Nathan Stratton Treadway <vgerlists@nathanst.com>
To:     linux-usb@vger.kernel.org
Subject: Adding "UAS" protocol line to usb.ids file?
Message-ID: <20190817220145.GJ1403@nathanst.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="IiVenqGWf+H9Y6IX"
Content-Disposition: inline
User-Agent: Mutt/1.5.9i
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I noticed that when I use "lsusb -v" on a UAS-enabled drive enclosure,
the bInterfaceProtocol line for #80/0x50 has a "protocol name" label but the
one for #98/0x62 does not:


========
# lsusb -v -s2:15 | grep Interface
  bDeviceClass            0 (Defined at Interface level)
    bNumInterfaces          1
    Interface Descriptor:
      bInterfaceNumber        0
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0
    Interface Descriptor:
      bInterfaceNumber        0
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     98
      iInterface              0
========



So...I was wondering if there was any particular reason that protocol
98 isn't included in the usb.ids file?


As a proof of concept I added the SCSI-subclass version of the line to
the usb.ids file (see attached patch) and lsusb successfully showed a
description for the #98 line as well:

========
# lsusb -v -s2:15 | grep Interface
  bDeviceClass            0 (Defined at Interface level)
    bNumInterfaces          1
    Interface Descriptor:
      bInterfaceNumber        0
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0
    Interface Descriptor:
      bInterfaceNumber        0
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     98 UAS
      iInterface              0
========

(This experiment was on an Ubuntu Bionic system.)

I searched the list archives (and web in general) for previous
discussion on this topic, but didn't succeed in finding this specific
issue.

(I see that 62 is in fact included in the protocol list found on
  https://usb-ids.gowdy.us/read/UC/08/06
, but it has an empty "name" column in that table -- and it's missing
completely from the current file at
  https://usb-ids.gowdy.us/usb.ids 
.)

Thanks.


							Nathan

p.s. If in fact it makes sense to add UAS to the file: I assume the UAS
protocol doesn't apply to the UFI subclass, but I don't know off hand if
it applies to the RBC subclass as well as SCSI...


--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="usb.ids_add_uas.patch"

--- usb.ids_orig	2017-04-21 16:59:17.000000000 -0400
+++ usb.ids	2019-08-17 00:05:51.688459268 -0400
@@ -18012,6 +18012,7 @@
 		00  Control/Bulk/Interrupt
 		01  Control/Bulk
 		50  Bulk-Only
+		62  UAS
 C 09  Hub
 	00  Unused
 		00  Full speed (or root) hub

--IiVenqGWf+H9Y6IX--
