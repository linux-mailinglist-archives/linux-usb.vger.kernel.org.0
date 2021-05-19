Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 578213894BA
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 19:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbhESRkR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 13:40:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:55054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229539AbhESRkQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 May 2021 13:40:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4DE8E6135A
        for <linux-usb@vger.kernel.org>; Wed, 19 May 2021 17:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621445936;
        bh=0G5CeThxw0mFPhGRLPioPF5NJOplIeNjOGHYXTqHcfo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Xz+Vi27mwKEOXDdzf4xa+Hoi7hPtiuiHmpcKxMW0jw0Wa7TOOd1TGO+R0orpgw1Hc
         VoUyVf3GyrDjsDTPTj0UU0bMMQd1TJbr4vHarw8R9Ydr+FyThM0uk2C7b8DV7qcTc5
         QFj/dwIXoI57/7oT6L3f9D+Bv3fguhqAv6QxlMUiPa7ersIHIj3IF/DSQ/IP9cks7i
         pWyhSQ+CxZkF8LRgS052VWJIPv0/MD7rhZTmugNXersdwExJrA7LtiBis5UhbYm2qv
         zzIoo3c7WJc27MtQLUEuuGN9WO9pF/hx/CsyprvtbjRdFBi8x61giXxzwRphZq6sVb
         bstmbBZI638ww==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 3EE3661260; Wed, 19 May 2021 17:38:56 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Wed, 19 May 2021 17:38:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: peter.ganzhorn@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213081-208809-4FmX9frnMH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213081-208809@https.bugzilla.kernel.org/>
References: <bug-213081-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213081

--- Comment #18 from Peter Ganzhorn (peter.ganzhorn@googlemail.com) ---
Created attachment 296875
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296875&action=3Dedit
usb bus 6 trace 5.12+patch

Hi Mathias, thanks for your patch.

I applied the patch to v5.12.4 and it applied just fine, but the card reade=
r is
still not working.
So sadly I have to report that the issue is not fixed with it, but I spotte=
d a
few differences with it.
I recorded new traces and it seems the trace log for bus 6 is a lot smaller
than it was without the patch, but the symptoms are very much the same.
After plugging in the display / card reader, it seems to be detected fine
according to dmesg until

[   66.338408] usb 6-2.3.1: new SuperSpeed Gen 1 USB device number 4 using
xhci_hcd
[   66.366869] usb 6-2.3.1: New USB device found, idVendor=3D05e3,
idProduct=3D0749, bcdDevice=3D15.31
[   66.366879] usb 6-2.3.1: New USB device strings: Mfr=3D3, Product=3D4,
SerialNumber=3D5
[   66.366883] usb 6-2.3.1: Product: USB3.0 Card Reader
[   66.366886] usb 6-2.3.1: Manufacturer: Generic
[   66.366889] usb 6-2.3.1: SerialNumber: 000000001531
[   66.373185] usb-storage 6-2.3.1:1.0: USB Mass Storage device detected
[   66.373392] scsi host6: usb-storage 6-2.3.1:1.0
[   67.390948] scsi 6:0:0:0: Direct-Access     Generic  STORAGE DEVICE   15=
31
PQ: 0 ANSI: 6
[   67.391389] sd 6:0:0:0: Attached scsi generic sg2 type 0

Inserting the card once did not change anything in dmesg, so I ejected and
re-inserted it. The second time I also got

[   98.068827] usb 6-2.3.1: reset SuperSpeed Gen 1 USB device number 4 using
xhci_hcd
[   98.096880] sd 6:0:0:0: [sdb] Attached SCSI removable disk

But still no partitions (which are present) detected and cfdisk fails just =
like
before.
What seems different now is I am seeing a lot less errors in dmesg, but
repeated

[  128.789141] usb 6-2.3.1: reset SuperSpeed Gen 1 USB device number 4 using
xhci_hcd
[  159.509221] usb 6-2.3.1: reset SuperSpeed Gen 1 USB device number 4 using
xhci_hcd
[  190.239273] usb 6-2.3.1: reset SuperSpeed Gen 1 USB device number 4 using
xhci_hcd
[  220.959354] usb 6-2.3.1: reset SuperSpeed Gen 1 USB device number 4 using
xhci_hcd
[  251.679495] usb 6-2.3.1: reset SuperSpeed Gen 1 USB device number 4 using
xhci_hcd
[  282.389627] usb 6-2.3.1: reset SuperSpeed Gen 1 USB device number 4 using
xhci_hcd
[  313.109866] usb 6-2.3.1: reset SuperSpeed Gen 1 USB device number 4 using
xhci_hcd
[  343.830026] usb 6-2.3.1: reset SuperSpeed Gen 1 USB device number 4 using
xhci_hcd
[  374.550193] usb 6-2.3.1: reset SuperSpeed Gen 1 USB device number 4 using
xhci_hcd
[  405.270368] usb 6-2.3.1: reset SuperSpeed Gen 1 USB device number 4 using
xhci_hcd
[  436.000490] usb 6-2.3.1: reset SuperSpeed Gen 1 USB device number 4 using
xhci_hcd

If you need more information or have anything else I can test, just let me
know.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
