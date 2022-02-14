Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC974B4D7A
	for <lists+linux-usb@lfdr.de>; Mon, 14 Feb 2022 12:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350094AbiBNLI2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Feb 2022 06:08:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350209AbiBNLIQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Feb 2022 06:08:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E08D771C82
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 02:37:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 353A6B80E20
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 10:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D906DC340EF
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 10:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644835038;
        bh=0YxP9s3Oe9R/spdpWQ286AeULTS3B4KVxO4BPyjtDBA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dH4Sf9vAt1kWRhpzm1liJSJyoB+mLe5gAv9aei5YsRyVhmWn6LCLfoA3IgManue5e
         r0b0IBDyy+wqfryhsQER0OUDbX+Isyn9LDK0onHq7js2KVdM46XXTEAPhp/Kgjt49t
         E1dwVxNDj37jvrWSZfR6kPNx10Zh+tQHyaW3NjOd96yoe4f1iGITKbCn2AuHbmhUeh
         v9lyDs+xPEkbemNuMOMSRGN+aN0x24lA7656ahc/Vp6uqvmEQOt7nXIeNs5YVLlU77
         8qSPx51kESV+pVYEU2Y0B0RWDIfbsgXpzNB8dwFlhRg8GFqUyaRxJHe9ko85k8Sg6c
         /Nrbr66vfjY0w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C8D10CAC703; Mon, 14 Feb 2022 10:37:18 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215561] snd-usb-audio:reset_resume error -22 after suspend
Date:   Mon, 14 Feb 2022 10:37:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215561-208809-iErdMiq4WK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215561-208809@https.bugzilla.kernel.org/>
References: <bug-215561-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215561

--- Comment #10 from antifermion@protonmail.com ---
Reverting b96681bd58276e1c7ca4ca37bbaab9f8f1738d61 on top of v5.16 fixes the
issue.

I did not get any "failed to get current value for ch X" errors (I assume t=
his
would show up in the output of dmesg).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
