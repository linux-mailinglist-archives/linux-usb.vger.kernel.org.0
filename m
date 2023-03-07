Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 126836AF6A9
	for <lists+linux-usb@lfdr.de>; Tue,  7 Mar 2023 21:26:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbjCGU0i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Mar 2023 15:26:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231430AbjCGU0Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Mar 2023 15:26:16 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD8CA8395
        for <linux-usb@vger.kernel.org>; Tue,  7 Mar 2023 12:25:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 247B1614DF
        for <linux-usb@vger.kernel.org>; Tue,  7 Mar 2023 20:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A7A5C433D2
        for <linux-usb@vger.kernel.org>; Tue,  7 Mar 2023 20:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678220754;
        bh=yLFihxGZKZ4TynRAapRVjjJjNQXUlbWP/sWbjvr9yho=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nthL4Y5flc7vBS1mlzBM4OnH7vn7b8SD5l8Zw/O6WZbHYtw6cbdLZ34Ranr7R9C+O
         gevy0Ug3ChjE8MC1a1ZEQ0xqo6X51HLd/WUdZB8ur0McgvtfdN8nYDTU8VNR+2eoAj
         HYeFjXwqrrUtp9kXQgSX2WmzMO3QxgTM+Dm4tewZqEIKKg75/AqjPBmYTQc3Lj5xjZ
         XjBWNSo3MBZEuQHw5fNBZWVmhCnTJFqn+0bjic7WhnW3J9/s4TEb3M9F02iOmkUpxZ
         r3htGhLJxuLA9BuMl7EdWbw7vW0QQwERfCJBGMNsRgLqud39Eq/DyRPiDXJrukuec7
         iyeEyiUlfm2Jw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5CA97C43141; Tue,  7 Mar 2023 20:25:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Tue, 07 Mar 2023 20:25:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t-5@t-5.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217122-208809-SUHUMdcOy1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

--- Comment #8 from J=C3=BCrgen Herrmann (t-5@t-5.eu) ---
Update: I started with 6.1.0 to verify the bug is there still. As of now it
seems it is NOT in this version. Will have to run it longer, to be really s=
ure.

To be honest I probably never tried 6.1.0 but started at some point release
like 6.1.5 or so, I compile kernels in an irregular interval, something like
3-4 weeks. And then I always pick the latest stable point release.

So maybe the bug was backported from 6.2 to 6.1.y? Maybe some of you guys w=
ill
have some suspicion? If not, and if it turns out that 6.1.0 does NOT have t=
he
bug I will start a new bisect with 6.1 good, 6.2 bad.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
