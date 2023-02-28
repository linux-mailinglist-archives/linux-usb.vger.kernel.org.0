Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0316A5DBF
	for <lists+linux-usb@lfdr.de>; Tue, 28 Feb 2023 17:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbjB1Q4B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Feb 2023 11:56:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjB1Q4A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Feb 2023 11:56:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD9E4126D7
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 08:55:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 04C46B80E77
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 16:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A06F2C433EF
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 16:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677603342;
        bh=mgieYxw5j/obvoIMyEHnO8ntYowY07/+Fvc8EKG+r8Y=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rr/vcp+W7C2BTU95fOikqO1Ct2a53djFLIPNkg5bsfrfjby4EkhokVXkN6KuzEhR5
         MvkEoCI97EFXUZkFdgfWQV9xaeyK6aFeTbDugKJyX0DedZgbkSAdPQdw/VK/bARcfs
         iwUGt+P7WJnu7DYMnNS2p0dkPvyZa8Ix2itsJr+E7wxf+zgswtzcdz8EkbTmk4CFqO
         8gCc759wiYXbYb7wYb5ASUXNbCURLa5Vwo++kSLCuFb53OuYm2uKZZeo6v6AmpcSV6
         cfbDQVvZrBLf8FJyiYj23pxgIGDl4w6fDBTgNUx3mPmqpFkenscB9cpnSs57uU6F5s
         wfHYq9AWmhfHQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 805A6C43143; Tue, 28 Feb 2023 16:55:42 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Tue, 28 Feb 2023 16:55:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre2008@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217089-208809-9fxUjOb4NW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217089-208809@https.bugzilla.kernel.org/>
References: <bug-217089-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217089

--- Comment #17 from Pierre Germain (pierre2008@gmail.com) ---
Just to clarify: The -33 kernel has a N, and the -37 has also a N.
But when the -37 has a Y the device seems to be recognized correctly.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
