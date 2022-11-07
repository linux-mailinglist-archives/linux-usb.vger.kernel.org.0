Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68FD161F8B6
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 17:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbiKGQPg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 11:15:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232762AbiKGQPc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 11:15:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 478BC140F2
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 08:15:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DED1B61165
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 16:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F9EFC433D6
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 16:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667837729;
        bh=RQPgkbLJRYQ+TagPuZYRuw4JxczNUVNtVaqSM1xAjmQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IW+OYe1E0dL+e8EwWWBNSfI3v8HKdnuiV3rtZUWWHkZcAI7IU9RPFDU585XuOXcN/
         l0735f3Lr3gG36s1mOZft7zJFaL4j/NIM7UDdzUXJn2f0aViIthFYoz9riksS3BRQ6
         msKopcKxHApjUsNlhbXQ/Gx/CAdwgcwLBVy8cZ3sK3XrhFPp0LGtk8WFCM4ZJ3T23T
         WE5GtPN1qN7u+2rVgReFjni1IB7iicF8uVuI0s8N0iRK5MtIXspZ7IM5a8le0IRh8F
         +BWFbkqjeeUDviDokEMc/iQm3gnMnbebp6+bXHE1vXbn6ouhFs4wHPRwW6/CYuUwWy
         a811DAcObKZEQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 37578C433E9; Mon,  7 Nov 2022 16:15:29 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Mon, 07 Nov 2022 16:15:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bjorn@helgaas.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214259-208809-vbpcoUihac@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

Bjorn Helgaas (bjorn@helgaas.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|DUPLICATE                   |---

--- Comment #37 from Bjorn Helgaas (bjorn@helgaas.com) ---
Regarding the delay, i.e., this from Konrad's attachment at comment 27:

[    6.837625] DMAR: DRHD: handling fault status reg 2
[    6.837629] DMAR: [DMA Write NO_PASID] Request device [07:00.0] fault ad=
dr
0x69935000 [fault reason 0x05] PTE Write access is not set
[   26.937996] DMAR: DRHD: handling fault status reg 2
[   26.944592] DMAR: [DMA Write NO_PASID] Request device [07:00.0] fault ad=
dr
0x69935000 [fault reason 0x05] PTE Write access is not set
[   47.417982] DMAR: DRHD: handling fault status reg 2
[   47.424711] DMAR: [DMA Write NO_PASID] Request device [07:00.0] fault ad=
dr
0x69935000 [fault reason 0x05] PTE Write access is not set=20
[   67.897999] DMAR: DRHD: handling fault status reg 2
[   67.904639] DMAR: [DMA Write NO_PASID] Request device [07:00.0] fault ad=
dr
0x69935000 [fault reason 0x05] PTE Write access is not set
[   88.372827] thunderbolt 0000:07:00.0: failed to send driver ready to ICM
[   88.380241] thunderbolt: probe of 0000:07:00.0 failed with error -110

This all involves the same device (07:00.0) and it's all likely related, so=
 I
think we should reserve *this* bug report for this DMAR/timeout issue.

As far as I can tell, this is unrelated to bug 206459 and the E820 issues
addressed by Hans de Goede's patches, so I'm going to reopen this bug repor=
t.

If we're lucky, maybe the DMAR/timeout stuff has been fixed by something
between v5.15 and v6.0.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
