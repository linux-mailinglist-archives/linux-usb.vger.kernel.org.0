Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0EB84C8E9A
	for <lists+linux-usb@lfdr.de>; Tue,  1 Mar 2022 16:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235562AbiCAPIx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Mar 2022 10:08:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235557AbiCAPIw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Mar 2022 10:08:52 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F1BB5C35F
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 07:08:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 00DCE61676
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 15:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62413C340EE
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 15:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646147289;
        bh=ShKiGGpRf5wwE3JVl7aUzNkXE6dVOxf0cQpjoD6C+UE=;
        h=From:To:Subject:Date:From;
        b=Vs/9OOcWN6MC0NH+tb+5ygcs1Fde8kNwsuNH3VevpmaQvlViQv5O92+94c5UrAfdU
         BgrATTU0fgCgRgEmjCPH05/uCtzUIRH2EvT/V+I+n/GLCgDrMMqpHU8BFUNQABmEPy
         +PC5A0x6qiuJJrOjrUVdjPNuLhbgqAyY3Wwgy8zwXrejVUpchLWibm/70zFkzlGcvl
         P64uz0YW7i165H/HwRUj8lcUkNvhksL45lpr7Ghnjpi0bDNBS5MHEeFay7flH5XulQ
         Jd5r34KOdmUoLi4X2LE3bgS3+TXzEq4wIcBOqk7UBM9+ocbRGmELsQc6R7FeEeDZw3
         9lwx6QxYr/nxA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3D3F1C05FCE; Tue,  1 Mar 2022 15:08:09 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215649] New: all usb devices stop working and forced to reboot
 the system
Date:   Tue, 01 Mar 2022 15:08:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: ricciare@libero.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215649-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215649

            Bug ID: 215649
           Summary: all usb devices stop working and forced to reboot the
                    system
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.16.11
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: blocking
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: ricciare@libero.it
        Regression: No

Created attachment 300513
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300513&action=3Dedit
this is the huge kernel configuration used by slackware64-current

Hi, I use slackware64-current and using the kernel 5.16.11-huge, included in
the distro. When I try to plug and mount 2 usb pendrives suddenly all usb
devices stop working (keyboard and mouse are the main ones for further pc u=
sage
nomore working). The unique option is to turn off/on the power cable, or do=
 a
reset. When rebooted this problem is going to happen again when repeatign t=
he
same operation, also using other usb pendrives (kingston 32GB usb3.0).

I tried using different usb mouses (Logitech M330 Silent and Logitech M705)=
, I
have a Logitech G213 keyboard and I was connecting a 64GB Toshiba usb3.0
pendrive and a Lexar 16GB usb3.0 pendrive. Sometimes it disconnect and than
reconnects the mouse, it happens testing both of them, and when moving
documents from/to usb3 external devices the system partially locks, and all
that are situations I not experienced with my previous computers. I've 2
desktop pc: first one has Ryzen9 3900X , Gygabyte Aorus Lite x570 motherboa=
rd ,
32GB Crucial ddr4 , Samsung 870 Pro nvme 1TB , WD Black 500GB nvme ; the se=
cond
one I'm using for tests, has Ryzen7 3800X , Gygabyte Aorus Lite b450
motherboard , 16GB Crucial ddr4 , Samsung 870 Evo nvme 1TB. Both pc using
slackware64-current, both have the described usb problem. I tried using my =
sis
pc and the problem happened again (her one has an AMD A4-6300 cpu , MSI A78=
-G41
motherboard, 16GB ddr3 Kingston ram, dual booting (windows10 and MXLinux).

At the end of this message I paste the end of dmesg command, showing the
unexpected stop of all usb devices. Attached you can find the complete dmesg
output named "errore_usb.txt" and I attach you the configuration kernel file
used to compile the slackware huge kernel. If need further infos I'm at your
disposal, ask me. Nicola

Mar 1 12:33:05 casa kernel: usb 6-2: new SuperSpeed USB device number 3 usi=
ng
xhci_hcd
Mar 1 12:33:05 casa kernel: usb 6-2: New USB device found, idVendor=3D0930,
idProduct=3D6545, bcdDevice=3D 1.10
Mar 1 12:33:05 casa kernel: usb 6-2: New USB device strings: Mfr=3D1, Produ=
ct=3D2,
SerialNumber=3D3
Mar 1 12:33:05 casa kernel: usb 6-2: Product: TransMemory
Mar 1 12:33:05 casa kernel: usb 6-2: Manufacturer: TOSHIBA
Mar 1 12:33:05 casa kernel: usb 6-2: SerialNumber: C03FD5F76D5BE2C140005C54
Mar 1 12:33:05 casa kernel: usb-storage 6-2:1.0: USB Mass Storage device
detected
Mar 1 12:33:05 casa kernel: scsi host9: usb-storage 6-2:1.0
Mar 1 12:33:06 casa kernel: scsi 9:0:0:0: Direct-Access TOSHIBA TransMemory
PMAP PQ: 0 ANSI: 6
Mar 1 12:33:06 casa kernel: sd 9:0:0:0: [sde] 121995264 512-byte logical
blocks: (62.5 GB/58.2 GiB)
Mar 1 12:33:06 casa kernel: sd 9:0:0:0: [sde] Write Protect is off
Mar 1 12:33:06 casa kernel: sd 9:0:0:0: [sde] Write cache: disabled, read
cache: enabled, doesn't support DPO or FUA
Mar 1 12:33:08 casa kernel: sde: sde1
Mar 1 12:33:08 casa kernel: sd 9:0:0:0: [sde] Attached SCSI removable disk
Mar 1 12:33:12 casa kernel: usb 2-4: reset SuperSpeed USB device number 3 u=
sing
xhci_hcd
Mar 1 12:33:13 casa kernel: usb 2-3: New USB device found, idVendor=3D21c4,
idProduct=3Da838, bcdDevice=3D11.00
Mar 1 12:33:13 casa kernel: usb 2-3: New USB device strings: Mfr=3D1, Produ=
ct=3D2,
SerialNumber=3D3
Mar 1 12:33:23 casa kernel: usb 2-3: USB disconnect, device number 4
Mar 1 12:33:23 casa kernel: usb 1-6: USB disconnect, device number 2
Mar 1 12:33:23 casa kernel: usb 2-4: USB disconnect, device number 3
Mar 1 12:33:23 casa kernel: usb 1-7: USB disconnect, device number 3
Mar 1 12:33:23 casa kernel: obex-check-devi[1882]: segfault at 0 ip
00007fc63189dd3c sp 00007ffd47999c30 error 4 in
libc-2.35.so[7fc631880000+186000]
Mar 1 12:33:23 casa kernel: Code: 53 48 83 ec 28 49 8b 40 08 48 89 74 24 08=
 89
d6 85 c9 0f 85 96 02 00 00 83 fe 01 0f 84 85 01 00 00 83 fe 24 0f 87 7c 01 =
00
00 <49> 0f be 45 00 49 8b 50 68 4c 89 eb 49 89 c7 f6 44 42 01 20 74 19
Mar 1 12:33:23 casa mtp-probe: checking bus 6, device 3:
"/sys/devices/pci0000:00/0000:00:08.1/0000:0d:00.3/usb6/6-2"
Mar 1 12:33:23 casa mtp-probe: bus: 6, device: 3 was not an MTP device
Mar 1 12:33:24 casa mtp-probe: checking bus 6, device 3:
"/sys/devices/pci0000:00/0000:00:08.1/0000:0d:00.3/usb6/6-2"
Mar 1 12:33:24 casa mtp-probe: bus: 6, device: 3 was not an MTP device
Mar 1 12:33:49 casa kernel: usb 6-2: USB disconnect, device number 3
Mar 1 12:35:25 casa syslogd[1011]: syslogd v2.3.0: restart.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
