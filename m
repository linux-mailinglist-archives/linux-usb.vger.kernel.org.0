Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3323179F0E2
	for <lists+linux-usb@lfdr.de>; Wed, 13 Sep 2023 20:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbjIMSIi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Sep 2023 14:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbjIMSIh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Sep 2023 14:08:37 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21C8919B6
        for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 11:08:33 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB725C433C7
        for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 18:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694628512;
        bh=LS54KB3xRQsRG27vJ8mvmm7MoeVLQGLYVcLubduxvT0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uLwWIbdTBeFT0wdLXi6p2GcSCuk5WhlNgbM7I5ShUtqzKQUOI3DMMVrlUScftcuWP
         7Ltg3fByqc2saWVOp6ziEz1bSskUoCW4poqu4nyP2SfampHGKPGs0ZcW3Oix6Apyrp
         YTi4URLe/0gsYT7zr1V7to5bMzH9cYA0oak1xM1PzKKGAtfujUi5uWw8O0TMT1S8n+
         dhECGUrdpr68KDff0Y+fuo4gy9A4SXq3pfmt1eJUdNMFNxjDPHqSr39pRp5F6zASHX
         +6X6Y1+AyR8qYumWDDZJHYIYMLVV7Og5s1pziFZo8ppe2IdGLNhxRZOMmVkT1OqdY/
         DPdeWExi8LyzQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 987B7C4332E; Wed, 13 Sep 2023 18:08:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217862] [BUG] Alauda driver causes oops when inserted with card
 in with transfer buffer is on stack, throws errors if card is inserted
 afterwards.
Date:   Wed, 13 Sep 2023 18:08:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pawlick3r@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217862-208809-QvGeEPfMR3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217862-208809@https.bugzilla.kernel.org/>
References: <bug-217862-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217862

--- Comment #18 from pawlick3r@proton.me ---
Essentially I can't read/write to the disk or mount it, or see it in
gparted/partition managers. There's an error in the attachment about some w=
rong
command or unable to read part of the card or something similar to that.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
