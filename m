Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52CE7618331
	for <lists+linux-usb@lfdr.de>; Thu,  3 Nov 2022 16:45:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbiKCPpk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Nov 2022 11:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232112AbiKCPpU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Nov 2022 11:45:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 809971C92B
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 08:45:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3E88DB828EB
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 15:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5B87C433B5
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 15:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667490311;
        bh=IW4TzLsZ3hmwKkXMeVL4lqKWcF2UDyIrHHfanGEUKMc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=o4fzGaWfMAWuhULPoiq+EOO1Tm2h4E5HfG7RcaKN9+N6ebFTCTrxxiUr5mLahCPGW
         3c5VBcDJXq4mxXvtULHlz4deva4JXLgcuz8Fe7iiBkL/7ehwu8llZe7Eb10y6bs/JY
         Cs4PX0k9qyt7SBIC1i1EU+3nPectgWuHfbg4XJzxOnWkKLIojlDKGWUR9ZV5bLdDVV
         LYg8+QCKRByfD1iDGss6nN5kUcpMkjZVuekJtjoE6AIrUvFiDihmUcUN+ELil4TKew
         tfUfsrZqW5iVSPmqzY+huq61TErvjM3wEWmK9LyKNaYD11WBFZn6MQlv5CDzR3guxl
         YsNTFHDWBTdNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C8B5CC433E9; Thu,  3 Nov 2022 15:45:11 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Thu, 03 Nov 2022 15:45:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bjorn@helgaas.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214259-208809-usyzZ1V71y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

Bjorn Helgaas (bjorn@helgaas.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bjorn@helgaas.com

--- Comment #25 from Bjorn Helgaas (bjorn@helgaas.com) ---
I don't know the connection to the DMAR faults, but from the first log
(https://bugzilla.kernel.org/attachment.cgi?id=3D298567):

  BIOS-e820: [mem 0x000000006bc00000-0x00000000efffffff] reserved
  pci_bus 0000:00: root bus resource [mem 0x71000000-0xdfffffff window]

This entire PCI host bridge aperture is "reserved" in the E820 map, which m=
eans
we won't allocate any PCI BARs in that area, which means hot-add won't work.

The current workaround for this is https://git.kernel.org/linus/d341838d776a
("x86/PCI: Disable E820 reserved region clipping via quirks"), which appear=
ed
in v5.19.

I think the underlying issue is that this machine has EFI, Linux converts t=
he
EFI memory map to E820 format, and it converts EFI_MEMORY_MAPPED_IO to
E820_TYPE_RESERVED.  EFI_MEMORY_MAPPED_IO means "the OS must map this memory
for use by EFI runtime services."  It does *not* mean "the OS can never use
this memory."  I think Linux should omit EFI_MEMORY_MAPPED_IO areas complet=
ely
from the E820 map.

This is basically the same issue as bug #216565.  I attached a patch there =
to
omit EFI_MEMORY_MAPPED_IO.

I would love to hear from anybody with a Clevo machine that shows similar
problems.  If you can, please boot with the patch at
https://bugzilla.kernel.org/attachment.cgi?id=3D303123 with the "efi=3Ddebu=
g"
kernel parameter, open new bugzilla with the complete dmesg log, and assign=
 it
to me.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
