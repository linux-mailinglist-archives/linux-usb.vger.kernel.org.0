Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0984B0A53
	for <lists+linux-usb@lfdr.de>; Thu, 10 Feb 2022 11:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239449AbiBJKLn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Feb 2022 05:11:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238921AbiBJKLm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Feb 2022 05:11:42 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94955FD5
        for <linux-usb@vger.kernel.org>; Thu, 10 Feb 2022 02:11:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 32888B824A7
        for <linux-usb@vger.kernel.org>; Thu, 10 Feb 2022 10:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4F34C340EF
        for <linux-usb@vger.kernel.org>; Thu, 10 Feb 2022 10:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644487900;
        bh=rswo58bTH/GujhIJzg4XfUYudgKfcq7eDRCyOsmM/0w=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qOFd0QbbYWfuFk2tDKcZ4hT8bs4lVsbbRq1NfwFRQIvC0XXGK7DEUEKMMy4CyPboL
         XExgyDTkFZC+d8olUEF0DfDI8FT3w6/jDMCtvc/KtturfKHXY80Fx5hpENo4QsizpB
         55+7cGwxubHlw0nBtrjmD2Tj+fXE45s0EJubybSqjWtKfeGftQ7dePfY261IIY5ALc
         H7eJ79qmOB44R5Q+TNYeW/Qz+ZViL3S23hH9xNdDWKIZ7xzYOWIkWGP4VRIzoqcijI
         H/V2VSMc04iZjE9XoroszG+t0fSIOesyOWGNTt4H/yCYPD1t9HF9GrqLe7DCiAfHKj
         QQxNBTy/S244w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A036BC05FD6; Thu, 10 Feb 2022 10:11:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215561] snd-usb-audio:reset_resume error -22 after suspend
Date:   Thu, 10 Feb 2022 10:11:40 +0000
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
Message-ID: <bug-215561-208809-L1tjuyA3Ik@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215561-208809@https.bugzilla.kernel.org/>
References: <bug-215561-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215561

--- Comment #6 from antifermion@protonmail.com ---
@Takashi I can try to bisect this weekend. Though I have not run a
self-compiled kernel on my desktop, so I have to figure that out first.

@Mark, for me force reloading the module (see
https://bbs.archlinux.org/viewtopic.php?pid=3D2018644#p2018644) works. Afte=
rwards
I can also reboot cleanly.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
