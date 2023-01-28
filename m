Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7445867F6AB
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jan 2023 10:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233418AbjA1JX7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Jan 2023 04:23:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232296AbjA1JX6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 Jan 2023 04:23:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D85D51E9E0
        for <linux-usb@vger.kernel.org>; Sat, 28 Jan 2023 01:23:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6B630B801BE
        for <linux-usb@vger.kernel.org>; Sat, 28 Jan 2023 09:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18BEFC433A0
        for <linux-usb@vger.kernel.org>; Sat, 28 Jan 2023 09:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674897834;
        bh=jsRXSg2UW55ny33nfkyGy9i5fVbnm4tlm41zKTYO5vY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IeSJrMPLjjEKrRHwtN1E6X8jJmFDgfPIppC+bBEcliwJD/7FyZq09DMT0yMe8kvt6
         /tK0owncCUhBTx0t6cPNAQHavZsH2YR+e7ZmYPKYmdHthTJxye2s6w5SD49L0pr0mc
         ZD5xZ60HmNshcK6X/iTv8dhHPKaZt5qdknzUR2pDnR6d3EN1kBPl4ku4K4GK5/Xx03
         Qwtmgtxpbvh+/V2Kt+MFSQmkti9s0A5B6T60zkndGwBwYthfWmZ/x4J9F2HPdqrDQ9
         7SW/3l+lgITTJlb02RYzU4PVttTh4kMmP3UV84xmC9ZqozN50Wgap62AM7NSdiKtcL
         u1WMaxUwlAOfw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 08C0FC43142; Sat, 28 Jan 2023 09:23:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216697] Resume from suspend stopped working
Date:   Sat, 28 Jan 2023 09:23:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: oliver@diereehs.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216697-208809-HfZCTLbkD0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216697-208809@https.bugzilla.kernel.org/>
References: <bug-216697-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216697

Oliver Reeh (oliver@diereehs.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |oliver@diereehs.de

--- Comment #13 from Oliver Reeh (oliver@diereehs.de) ---
Is this fix suitable for kernel 6.1.x?
If yes then I'm willing to test it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
