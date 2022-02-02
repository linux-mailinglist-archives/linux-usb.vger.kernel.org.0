Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 237E54A6FA3
	for <lists+linux-usb@lfdr.de>; Wed,  2 Feb 2022 12:10:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242896AbiBBLIb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Feb 2022 06:08:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239861AbiBBLIa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Feb 2022 06:08:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03E8C061714
        for <linux-usb@vger.kernel.org>; Wed,  2 Feb 2022 03:08:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 603BA6168E
        for <linux-usb@vger.kernel.org>; Wed,  2 Feb 2022 11:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BEB71C004E1
        for <linux-usb@vger.kernel.org>; Wed,  2 Feb 2022 11:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643800109;
        bh=PJEY6Kli/8oO0ZR050gPt3UcnOMTxL79ZuzOM3Nd/KI=;
        h=From:To:Subject:Date:From;
        b=NTmqmFGcDTHRkut83lCziTFRS5fFCwR0MR+AxYtecbakfJmVvt8x0Jzv+ADh9nKjz
         b8Dg9yRQ4nhNU954Dx3foUOXneqli4SQBU3o42kixgrz8QvxyXEWC4ZxEpPCPOAKM7
         gPyNLeHkyteYjBoGgnCqR5NjbljL3jB8YadyNSjjebGhKs8hkR5Pb1cezH+j0uFqKD
         6nQQC5pht0h7dfLPKNLlGrfJh1aWvlODmTDnqWhgBET9iAPoHqAbXPQfmOt1xWKUmI
         z84e8Ky0pD82ovSfW9kBxL7x0HdKR/koMoB+Sd6AZZZnzoSESo6wqE3GkYOhoj5omY
         Mk7BUVnnooq4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9AABCC05FCB; Wed,  2 Feb 2022 11:08:29 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215561] New: snd-usb-audio:reset_resume error -22 after suspend
Date:   Wed, 02 Feb 2022 11:08:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: antifermion@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215561-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215561

            Bug ID: 215561
           Summary: snd-usb-audio:reset_resume error -22 after suspend
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.16.4
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: antifermion@protonmail.com
        Regression: No

If I use the microphone, then suspend and wake up again, I get the error

```
snd-usb-audio 1-5:1.0: reset_resume error -22
```

Aftewards, audio stops working completely. Both pipewire and pulseaudio (tr=
ied
both; not at the same time) freeze.

After running

```
rmmod -f snd_usb_audio
```

and replugging the microphone, audio works again.
Here is the relevant log:

```
[  157.791937] usbcore: deregistering interface driver snd-usb-audio
[  228.517855] usb 1-5: USB disconnect, device number 2
[  236.464334] usb 1-5: new high-speed USB device number 3 using xhci_hcd
[  236.798863] usb 1-5: New USB device found, idVendor=3D0d8c, idProduct=3D=
0171,
bcdDevice=3D 1.04
[  236.798867] usb 1-5: New USB device strings: Mfr=3D3, Product=3D1,
SerialNumber=3D0
[  236.798869] usb 1-5: Product: USB 2.0 HD Audio
[  236.798871] usb 1-5: Manufacturer: C-Media Electronics Inc.
[  236.826966] input: C-Media Electronics Inc. USB 2.0 HD Audio Consumer
Control as
/devices/pci0000:00/0000:00:01.3/0000:02:00.0/usb1/1-5/1-5:1.3/0003:0D8C:01=
71.000B/input/input40
[  236.878380] input: C-Media Electronics Inc. USB 2.0 HD Audio as
/devices/pci0000:00/0000:00:01.3/0000:02:00.0/usb1/1-5/1-5:1.3/0003:0D8C:01=
71.000B/input/input41
[  236.878447] hid-generic 0003:0D8C:0171.000B: input,hiddev96,hidraw2: USB=
 HID
v1.11 Device [C-Media Electronics Inc. USB 2.0 HD Audio] on
usb-0000:02:00.0-5/input3
[  242.306593] usbcore: registered new interface driver snd-usb-audio

```

I'm running Arch Linux (5.16.4.arch1-1). The linux-lts kernel (5.15.18-1) w=
orks
fine.

Other uses report the same error:
https://bbs.archlinux.org/viewtopic.php?id=3D273469

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
