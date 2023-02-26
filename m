Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 687606A338E
	for <lists+linux-usb@lfdr.de>; Sun, 26 Feb 2023 20:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbjBZTPW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Feb 2023 14:15:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjBZTPV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Feb 2023 14:15:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C3DC649
        for <linux-usb@vger.kernel.org>; Sun, 26 Feb 2023 11:15:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A7D9960B46
        for <linux-usb@vger.kernel.org>; Sun, 26 Feb 2023 19:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13217C4339B
        for <linux-usb@vger.kernel.org>; Sun, 26 Feb 2023 19:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677438917;
        bh=cst3eb77Bqjd1YIzQC2XbkktyoxHAR1QC5DbSorBTaA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BfPjehKMub3KDyj3ASlrCat0mZxNHX2akqK5Suc2l2n26TtewHbtqytNSUDNEbeuk
         Q4S6LQRy5V2gDJVME6cFxtGuye2esjmYMAsIoCyfqUkE6fZ1rb2z6lGAucmGT3kS0T
         ZOQbUdfq9+mvzOow9ZDTaSkFVf8DHTgfrFt4wnB3E0ORGdPF/iyn1XKs94q1zaPFFL
         3LmxP3NbOojMjj8D73PrYEmYPPXvC4kUXjaHH+R19vhvkt+spLrQ57tGlTt29kwnaB
         Umdl+6bsR4Tn00hG0pH0TPGKK7YGmOvQIXGCjf46Lif4Khqge/A3sshbUpNjmO6AZC
         pPXaJf8FEwqTw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id F3194C43143; Sun, 26 Feb 2023 19:15:16 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Sun, 26 Feb 2023 19:15:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217089-208809-3e8UkiCk0g@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217089-208809@https.bugzilla.kernel.org/>
References: <bug-217089-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217089

--- Comment #1 from Alan Stern (stern@rowland.harvard.edu) ---
Please attach the dmesg log showing what happens when you plug the device i=
nto
the computer.  Also, please attach the output from "lsusb -v" for the devic=
e.

You also should should close Bug #217088 as it is a copy of this bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
