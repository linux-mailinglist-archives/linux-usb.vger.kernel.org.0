Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3541F433368
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 12:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235147AbhJSKWY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 06:22:24 -0400
Received: from mout.gmx.com ([74.208.4.200]:46693 "EHLO mout.gmx.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230042AbhJSKWY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 Oct 2021 06:22:24 -0400
X-Greylist: delayed 301 seconds by postgrey-1.27 at vger.kernel.org; Tue, 19 Oct 2021 06:22:23 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com;
        s=dbd5af2cbaf7; t=1634638811;
        bh=JRzVTDo3XR/y3NFnCt2TciD+vl6WRr6a1L19Bmretus=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=qPLNjo3bW0MLiUIE+MkJ1jdnlODlEivTgOGbZKl5GJ4Pu6184+DdZYsLU9QbzvFLZ
         qD2AZn3JK9va4MSNyjNArtGQK7m7F90qHCC8Ojhejdumj9YHi8OKYdWICC7FhvEi+g
         2hrswTeWPdJc1tY5ZINkhtdwN21EUwVdlJmJm7Go=
X-UI-Sender-Class: 214d933f-fd2f-45c7-a636-f5d79ae31a79
Received: from [2.124.36.225] ([2.124.36.225]) by web-mail.mail.com
 (3c-app-mailcom-lxa12.server.lan [10.76.45.13]) (via HTTP); Tue, 19 Oct
 2021 12:15:09 +0200
MIME-Version: 1.0
Message-ID: <trinity-d3be8a5b-2b1c-45f8-8767-cf9cf758a0c0-1634638509008@3c-app-mailcom-lxa12>
From:   mark_k@iname.com
To:     linux-usb@vger.kernel.org
Subject: USB2 Link USB-SCSI converter and LUNs
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 19 Oct 2021 12:15:09 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:AejQhe/7zLrTWK05RrB67ZHOIrXs6x3KWtDChUfq3ASBNlbcVKrh5/1H9kQauJ6Ms+HAP
 /ZJgWvEB3PkTA3o2siYrDP0IiLjAV6fsYhpnWQGtCQQhA6a08WCI4CpK93hKbUa3hY6FkzwPEMPz
 rKOpBgDrAwm+hUdLN2EwuT4Pp1rC28hRJNOBoJjrryYGOUfuyniPc/SKoaU96jv1w9+H8W7xJzAe
 nFTB5kFkakgbvEGywOsOPSZ9/BVVKxGm8JgddC087/XU13jgsbNdQC9SyojJbfeKFlAhBrdrOb8j
 S0=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JH9M/z5HUuo=:rMuLZ0JNwsRwVH7ghzgJnN
 GMErn56hTl7f1MzIcGQQgqgeGocEUIVz2x49dRLBKrJ8mtR+ISKlT+izTyam9cTRaFZvwvr4U
 cmu2JbszyZfhrrmvZOp4cCj5L8U/AstqUAeo9xL24LRTeK9Jgin1yRzf+NWOCmAvr/0D8Rbbe
 Jt7U2QYB1l4nNwyJfKV/6qwLKQ9BwrNKLxTzZOge0Q0WaqIMGvucoW1piuAwn8pnLJHw/K2Qk
 jOloSHRnP+PShY86GtP/86WZqYrRM0mbeNebnTnk+7BjLMHYYv7qqneLVe5En144uLMtoHGUJ
 222l7jXITAuBnHFjsh8zpYd9a7YKy+OKg9Uy4wlxWWAWI/qz901+hDKPI/BR0nujzLivR5u1P
 drzluBxqI1sgbRUkFGhte5yYHB9sg3CgmYEE9v1ZcnSD0Y0gfZxWsaYTWvPRq1jiVYxXIsP6d
 /h3cdUj6zzG2exhXhy6KtNEQoDjJSywrwkNPveJA54hxlolv6GBCRcLNFD0Z2w9T6Y2+hMI7M
 3fm1stoprmh+2JcgteAYIsc5NBmfRu2v3qeWEIZPDeko4EGr4YfC4Z+IYn9WAvbc8gvnuopbn
 hj0FmaiNKUwuiERR7ES+hV3fbgEmZhEC097hQSL2jK3uFLyl/tGvFX79Tl+6QBM8GF0tPyEAX
 p4J/3rX6hbj4w/6O446blNH56G6b0ujCxsqcKAT+X4J0rZ+B+3kFSyUQWWfGhCt/xj0pR1we2
 5VRYkvuY7Jl5e3Q4S0JHSdIGvOj5HeXwCOYKyZ5goUBtk7+Mlr9Lb02UstfkNXKYlCnyXUwVK
 27l5pNz
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I have a Core Micro Systems USB2 Link USB-SCSI converter (07B4:0380).

Adding an entry to unusual_devs.h should get it to work, just needing
USB_PR_BULK. That should at least allow the connected device with SCSI ID 0
to be accessed.

However in order to access multiple targets and LUNs, the USB2 Link uses
byte 13 of the command block wrapper in a special way.

Normally CBW byte 13 has bCBWLUN in bits [3:0] with bits [7:4] reserved.
The USB2 Link expects the target ID in bits [3:0] and LUN in bits [7:4].
The advantage of that is, it should be possible to access multiple targets
without needing to modify the USB mass storage driver. (It returns 0x06 to
a Get Max LUN request since its SCSI ID is hard-coded to 7.)

Being able to access non-zero actual LUNs would of course require changes
to the driver.

I'm just wondering, how does the usb-storage driver handle these cases:

 - (What it thinks are) LUNs are not contiguous. Suppose the user has two
   SCSI devices in the chain, one with ID 0 the other with ID 3. Would it
   scan LUNs (which map to separate targets) 1, 2, 4, 5 and 6? Or would it
   give up on getting no response from LUN 1?

 - "LUN" 0 is not present. E.g. where the connected SCSI devices have IDs 1
   and 3.

 - When different "LUNs" are completely different devices (e.g. one a
   CD-ROM, another a hard disk, another a tape drive).

