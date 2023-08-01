Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D46176B1C7
	for <lists+linux-usb@lfdr.de>; Tue,  1 Aug 2023 12:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbjHAK3G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Aug 2023 06:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232540AbjHAK3D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Aug 2023 06:29:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 056A4EA
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 03:29:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 56D8361528
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 10:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3A80C433C8
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 10:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690885739;
        bh=AaP5ZrZ7IWWHOmaqw59trS9c/I0TLutv59/9dDB416Q=;
        h=From:To:Subject:Date:From;
        b=M9TWJWEQzdn1889UALDRp33qbSxeri3ku/Yg69q+iVnMuMu8L3Jf7cboZCmFBYdQD
         N47CrirLBq6mwMYAht7m4FeeGgldBzIk8pOhGQY69cCOiCyFq0ecyvLugqEkFJzLEh
         uR85PPBzCFW1fMSj+jaBYgZd56ggHrFkr6CjJisv2igcUDd8jY5J4NynnkVbDgQsPb
         3swjRlnJvFVDgF5+X6IbHN246JzdF5erC9UsC95LTDWgcYsd0Owftwc23xgQmkzhq3
         jwpNZoqZrXO5MrcyTe0xsYS6xN69iWAXRo83bfYKYEJ2agi6ywqsGGizLr/ajsuAsN
         E1JhABJ1MPeOg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A396EC53BD0; Tue,  1 Aug 2023 10:28:59 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217744] New: "usb usb2-port3: Cannot enable. Maybe the USB
 cable is bad?" Tiger Lake-LP Thunderbolt 4 [8086:9a13]
Date:   Tue, 01 Aug 2023 10:28:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: linux@iam.tj
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-217744-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217744

            Bug ID: 217744
           Summary: "usb usb2-port3: Cannot enable. Maybe the USB cable is
                    bad?" Tiger Lake-LP Thunderbolt 4 [8086:9a13]
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: linux@iam.tj
        Regression: No

Created attachment 304746
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304746&action=3Dedit
kernel log v6.5-rc4

On resume from suspend, since at least v6.1 and including v6.5-rc4 - an
external USB Ethernet device fails to resume due to:

usb usb2-port3: Cannot enable. Maybe the USB cable is bad?

Linux version 6.5.0-rc4+debian+tj (root@linux-builder) (gcc (Debian 12.2.0-=
14)
12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #67 SMP PREEMPT_DYNAMIC Mon =
Jul
31 22:25:03 BST 2023

DMI: LENOVO 20W6001WUS/20W6001WUS, BIOS N34ET53W (1.53 ) 08/31/2022

The affected owner (nickname 'Chosen_') and myself worked in Matrix Linux r=
oom
to narrow down the cause by building and testing v6.5-rc4 when the Debian
distro v6.1 showed the problem. There is no difference in the symptoms or t=
he
kernel messages between the versions.

Attached is the kernel log, `lspci -nnk` and `lsusb -vt`. The device is:

/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 10000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
    |__ Port 3: Dev 5, If 0, Class=3DHub, Driver=3Dhub/4p, 10000M
        ID 17ef:30ab Lenovo=20
        |__ Port 1: Dev 6, If 0, Class=3DVendor Specific Class, Driver=3Dr8=
152,
5000M
            ID 0bda:8153 Realtek Semiconductor Corp. RTL8153 Gigabit Ethern=
et
Adapter
        |__ Port 3: Dev 7, If 0, Class=3DHub, Driver=3Dhub/4p, 10000M
            ID 17ef:30ad Lenovo=20

Which seems to be connected via the host controller on

00:0d.0 USB controller [0c03]: Intel Corporation Tiger Lake-LP Thunderbolt 4
USB Controller [8086:9a13] (rev 01)
        Subsystem: Lenovo Tiger Lake-LP Thunderbolt 4 USB Controller
[17aa:22c9]
        Kernel driver in use: xhci_hcd

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
