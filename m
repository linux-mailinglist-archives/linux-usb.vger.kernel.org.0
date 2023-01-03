Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C100565BFE6
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jan 2023 13:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237503AbjACMcG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Jan 2023 07:32:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbjACMcF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Jan 2023 07:32:05 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE345FCE5
        for <linux-usb@vger.kernel.org>; Tue,  3 Jan 2023 04:32:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8466E612EA
        for <linux-usb@vger.kernel.org>; Tue,  3 Jan 2023 12:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6F43C433F2
        for <linux-usb@vger.kernel.org>; Tue,  3 Jan 2023 12:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672749123;
        bh=WibdfePRdIsbG+31MJ5REHo05H5n3Gfq1iWM7hyBAxw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=k74k3tMUNGGNg/IH0raeRFEZPTPPsRFdD2iiTiAlOvIzLI7neqPqk7/dmMhr9jjU2
         DfkcznPsPgRdcOuc/owCi47IVxsc4zvjAksjltN0u3fNedW/XWyBlipVhI8qsPzBVQ
         J6mctdsraCx4wBjV8OFP60FLz9/s7H9zRLLResJjnpuYs7R6fNLHQdCsQ0Vr0QRVLe
         1lGg88BygxJuWgjP2mMWSGnNhjBPvuiYqqvCG0L9BSjHHMo1/8xVUZD2+t12pWONJ1
         JuP/N17jx2fFSLRbeBXp2CQasteH32O2gockJhoWWajyzYr5Jz1d0yOT53VXEnj6m5
         DhlTKzTZ+0Yzw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D093EC43143; Tue,  3 Jan 2023 12:32:03 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216863] ThinkPad X1 Extreme Gen 5: PCIe Bus Error:
 severity=Corrected, type=Data Link Layer, (Transmitter ID) after resuming
 from sleep
Date:   Tue, 03 Jan 2023 12:32:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: frederick888@tsundere.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216863-208809-qF1QpMl3Qp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216863-208809@https.bugzilla.kernel.org/>
References: <bug-216863-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216863

--- Comment #3 from Frederick Zhang (frederick888@tsundere.moe) ---
I noticed that I can disable ACPI wakeup to avoid the warning log
flooding.

$ lspci -t
-[0000:00]-+-00.0
           +-01.0-[01]--+-00.0
           |            \-00.1
           +-04.0
           +-06.0-[04]----00.0
           +-08.0
           +-0a.0
           +-14.0
           +-14.2
           +-14.3
           +-15.0
           +-16.0
           +-1c.0-[08]--
           +-1c.7-[0a]----00.0
           +-1d.0-[20-89]----00.0-[21-89]--+-00.0-[22]----00.0
           |=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20
+-01.0-[23-55]----00.0-[24-55]--+-00.0-[25]--
           |                               |=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
+-01.0-[26-34]--
           |                               |=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
+-02.0-[35-43]--
           |                               |=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
+-03.0-[44-54]--
           |                               |=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
\-04.0-[55]----00.0
           |                               +-02.0-[56]----00.0
           |                               \-03.0-[57-89]--
           +-1f.0
           +-1f.3
           +-1f.4
           \-1f.5
$ cat /proc/acpi/wakeup
Device  S-state   Status   Sysfs node
PEG0      S4    *enabled   pci:0000:00:06.0
PEGP      S4    *disabled  pci:0000:04:00.0
PEG1      S4    *enabled   pci:0000:00:01.0
PEGP      S4    *disabled  pci:0000:01:00.0
PEG2      S4    *disabled
PEGP      S4    *disabled
XHCI      S3    *enabled   pci:0000:00:14.0
XDCI      S4    *disabled
HDAS      S4    *disabled  pci:0000:00:1f.3
CNVW      S4    *disabled  pci:0000:00:14.3
RP01      S4    *enabled   pci:0000:00:1c.0
PXSX      S4    *disabled
RP02      S4    *disabled
PXSX      S4    *disabled
RP03      S4    *disabled
PXSX      S4    *disabled
RP04      S4    *disabled
PXSX      S4    *disabled
PXSX      S4    *disabled
RP06      S4    *disabled
PXSX      S4    *disabled
RP07      S4    *disabled
PXSX      S4    *disabled
RP08      S4    *enabled   pci:0000:00:1c.7
PXSX      S4    *disabled  pci:0000:0a:00.0
                *disabled  platform:rtsx_pci_sdmmc.0
RP09      S4    *enabled   pci:0000:00:1d.0
PXSX      S4    *enabled   pci:0000:20:00.0
RP10      S4    *disabled
PXSX      S4    *disabled
RP11      S4    *disabled
PXSX      S4    *disabled
RP12      S4    *disabled
PXSX      S4    *disabled
RP13      S4    *disabled
PXSX      S4    *disabled
RP14      S4    *disabled
PXSX      S4    *disabled
RP15      S4    *disabled
PXSX      S4    *disabled
RP16      S4    *disabled
PXSX      S4    *disabled
RP17      S4    *disabled
PXSX      S4    *disabled
RP18      S4    *disabled
PXSX      S4    *disabled
RP19      S4    *disabled
PXSX      S4    *disabled
RP20      S4    *disabled
PXSX      S4    *disabled
RP21      S4    *disabled
PXSX      S4    *disabled
RP22      S4    *disabled
PXSX      S4    *disabled
RP23      S4    *disabled
PXSX      S4    *disabled
RP24      S4    *disabled
PXSX      S4    *disabled
RP25      S4    *disabled
PXSX      S4    *disabled
RP26      S4    *disabled
PXSX      S4    *disabled
RP27      S4    *disabled
PXSX      S4    *disabled
RP28      S4    *disabled
PXSX      S4    *disabled
AWAC      S4    *enabled   platform:ACPI000E:00
SLPB      S3    *enabled   platform:PNP0C0E:00
LID       S4    *enabled   platform:PNP0C0D:00
$ echo RP09 | sudo tee /proc/acpi/wakeup
RP09
$ grep RP09 /proc/acpi/wakeup
RP09      S4    *disabled  pci:0000:00:1d.0


Wake-on-LAN from S3 stopped working (as expected) though.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
