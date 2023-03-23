Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF756C6BB2
	for <lists+linux-usb@lfdr.de>; Thu, 23 Mar 2023 15:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbjCWO7w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Mar 2023 10:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbjCWO7v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Mar 2023 10:59:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59CBE1040A
        for <linux-usb@vger.kernel.org>; Thu, 23 Mar 2023 07:59:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DEA55B81DE5
        for <linux-usb@vger.kernel.org>; Thu, 23 Mar 2023 14:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9775AC4339C
        for <linux-usb@vger.kernel.org>; Thu, 23 Mar 2023 14:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679583587;
        bh=1F/bHuE8/ajCUTjRe/tduzp30aIq+D9DuH6eJHAuBuo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Wbs6FVbWS4IN2qCFRQhDiWd5xSWvihIsy9uJgaWdw4qPNoYMrlQaXqBuhlN6VpExw
         UZJZcAjiOME9T3zmkMMPhixXRkED9hNMc4FD3y35mU/bMrFRzrfIpWG5K5MYx9QzwA
         AwSFtP1ap5Q1J3UNUvwMGm8W0w0dcY1OB/tJBf5sGrOF3e9rk57VYAv+3nbP1wsJag
         WOMvS6vcpHI0ANGZ77J1jV9LCDgiWeta/TSG7qz9+daLy0EwGfBeE15iDOvh+s1tFB
         wdn92VTjMGn4eVIxH6KrIVdGZhYZoFEjXsjzhvbYphkBX6UJoyFnsAQue9aZcnXjrS
         OZvveUroVV5eA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 74A31C43141; Thu, 23 Mar 2023 14:59:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Thu, 23 Mar 2023 14:59:47 +0000
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
Message-ID: <bug-217122-208809-KrZpo73nie@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

--- Comment #10 from J=C3=BCrgen Herrmann (t-5@t-5.eu) ---
I already did one complete bisect which took 13 steps and came out with a
change that 100$ was totally unrelated to the problem. So I'm  doing it aga=
in,
suspect I made a mistake along the way. I takes a lot of time because I do =
one
bisect a day as the problem can be so sporadic, to be totally sure I don't =
miss
it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
