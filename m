Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B38855F85FD
	for <lists+linux-usb@lfdr.de>; Sat,  8 Oct 2022 18:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbiJHQGq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Oct 2022 12:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbiJHQGo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Oct 2022 12:06:44 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0CDD3E76D
        for <linux-usb@vger.kernel.org>; Sat,  8 Oct 2022 09:06:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 87FCEB80B89
        for <linux-usb@vger.kernel.org>; Sat,  8 Oct 2022 16:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29F58C433D6
        for <linux-usb@vger.kernel.org>; Sat,  8 Oct 2022 16:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665245201;
        bh=0h61PJg5RFkHZfII/GES+StiN4MZCaOyS7VUMICaSeE=;
        h=From:To:Subject:Date:From;
        b=ahaRT/L3ejpAbVo84perNIEiD3rv/ky4UcFbeCW1/tjCGOOTREzfSU6XiT6alcOcA
         YtZOZbVpsZ0WvZGyMd1Bc+dotGpd+vtj4VlBdEQMigpXmdaM2+6xybeHBL2LlGxPb+
         GUhEyhg64djdHGGSkcZ0mjIA68qeu1r0dSe9TIKGrxHDKZVDzrD79bQn6EACHMTUX8
         kfgqtg0xzcxvTMrXummkd50mNgoEOMwC88p8TEvV7UufcrIQv9wEynPQT8XVtIHa2K
         7JbKN/TuXesrtjUKdiYbfX7L3MqNu+ZIEh9A2XCWiuZpTwujiM0gy1In1FqsUVgvwT
         FZPwpLeBF+tLg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E3598C433E4; Sat,  8 Oct 2022 16:06:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216558] New: Astro A20 audio headset require module
 unload/reload
Date:   Sat, 08 Oct 2022 16:06:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: x@vierclau.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216558-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216558

            Bug ID: 216558
           Summary: Astro A20 audio headset require module unload/reload
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.0.0
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: x@vierclau.de
        Regression: No

When plugging the Astro A20 USB audio headset, the audio output is not
recognized and dmesg is filled with "usb_set_interface failed" error messag=
e.
The headset has 2 mode, PS4 and PC that can be changed by pushing on a butt=
on
on the USB key (only when the key is plugged). If I unload the snd_usb_audio
module, I can change the mode on the USB key to "computer mode", then I can
reload the the snd_sub_audio module and the headset is correctly recognized=
 and
works as expected.


$ dmesg --since '5 minutes ago'
[ 1350.840642] usb 3-2: new full-speed USB device number 4 using xhci_hcd
[ 1350.993528] usb 3-2: config 1 interface 2 altsetting 1 has 1 endpoint
descriptor, different from the interface descriptor's value: 2
[ 1351.002511] usb 3-2: New USB device found, idVendor=3D9886, idProduct=3D=
0047,
bcdDevice=3D 0.00
[ 1351.002521] usb 3-2: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[ 1351.002524] usb 3-2: Product: Astro A20
[ 1351.002527] usb 3-2: Manufacturer: Astro Gaming
[ 1356.285604] usb 3-2: 2:1: usb_set_interface failed (-110)
[ 1356.939691] audit: type=3D1101 audit(1665244597.030:106): pid=3D2836 uid=
=3D1000
auid=3D1000 ses=3D3 msg=3D'op=3DPAM:accounting grantors=3Dpam_unix,pam_perm=
it,pam_time
acct=3D"xavier" exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/dev=
/pts/1
res=3Dsuccess'
[ 1356.940904] audit: type=3D1110 audit(1665244597.033:107): pid=3D2836 uid=
=3D1000
auid=3D1000 ses=3D3 msg=3D'op=3DPAM:setcred
grantors=3Dpam_faillock,pam_permit,pam_env,pam_faillock acct=3D"root"
exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/dev/pts/1 res=3Dsuc=
cess'
[ 1356.941031] audit: type=3D1105 audit(1665244597.033:108): pid=3D2836 uid=
=3D1000
auid=3D1000 ses=3D3 msg=3D'op=3DPAM:session_open
grantors=3Dpam_systemd_home,pam_limits,pam_unix,pam_permit acct=3D"root"
exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/dev/pts/1 res=3Dsuc=
cess'
[ 1356.962881] audit: type=3D1106 audit(1665244597.053:109): pid=3D2836 uid=
=3D1000
auid=3D1000 ses=3D3 msg=3D'op=3DPAM:session_close
grantors=3Dpam_systemd_home,pam_limits,pam_unix,pam_permit acct=3D"root"
exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/dev/pts/1 res=3Dsuc=
cess'
[ 1356.962954] audit: type=3D1104 audit(1665244597.053:110): pid=3D2836 uid=
=3D1000
auid=3D1000 ses=3D3 msg=3D'op=3DPAM:setcred
grantors=3Dpam_faillock,pam_permit,pam_env,pam_faillock acct=3D"root"
exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/dev/pts/1 res=3Dsuc=
cess'
[ 1361.403694] usb 3-2: 2:0: usb_set_interface failed (-110)
[ 1361.405725] usb 3-2: 2:0: usb_set_interface failed (-71)
[ 1361.411710] usb 3-2: 2:1: usb_set_interface failed (-71)
[ 1361.413755] usb 3-2: 2:0: usb_set_interface failed (-71)
[ 1361.416721] usb 3-2: 2:0: usb_set_interface failed (-71)
[ 1361.422673] usb 3-2: 2:1: usb_set_interface failed (-71)
[ 1361.424730] usb 3-2: 2:0: usb_set_interface failed (-71)
[ 1361.427732] usb 3-2: 2:0: usb_set_interface failed (-71)
[ 1361.433797] usb 3-2: 2:1: usb_set_interface failed (-71)

After a modprobe -r snd-usb-audio

$ sudo dmesg --since '1 minute ago'=20
[ 1808.052627] perf: interrupt took too long (2528 > 2500), lowering
kernel.perf_event_max_sample_rate to 78900
[ 1820.610504] usb 3-2: new full-speed USB device number 8 using xhci_hcd
[ 1820.767162] usb 3-2: config 1 interface 2 altsetting 1 has 1 endpoint
descriptor, different from the interface descriptor's value: 2
[ 1820.776149] usb 3-2: New USB device found, idVendor=3D9886, idProduct=3D=
0047,
bcdDevice=3D 0.00
[ 1820.776162] usb 3-2: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[ 1820.776166] usb 3-2: Product: Astro A20
[ 1820.776169] usb 3-2: Manufacturer: Astro Gaming
[ 1822.838124] usb 3-2: USB disconnect, device number 8
[ 1823.160213] usb 3-2: new full-speed USB device number 9 using xhci_hcd
[ 1823.325908] usb 3-2: New USB device found, idVendor=3D9886, idProduct=3D=
0045,
bcdDevice=3D 0.00
[ 1823.325918] usb 3-2: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[ 1823.325920] usb 3-2: Product: Astro A20
[ 1823.325922] usb 3-2: Manufacturer: Astro Gaming
[ 1823.344218] hid-generic 0003:9886:0045.0004: hiddev96,hidraw1: USB HID v=
1.00
Device [Astro Gaming Astro A20] on usb-0000:04:00.4-2/input5

I can then reload the snd-usb-audio module and the headset is working.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
