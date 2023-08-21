Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A17F7825F3
	for <lists+linux-usb@lfdr.de>; Mon, 21 Aug 2023 11:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234249AbjHUJBL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Aug 2023 05:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232799AbjHUJBK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Aug 2023 05:01:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 469F5C9
        for <linux-usb@vger.kernel.org>; Mon, 21 Aug 2023 02:01:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0179C62D05
        for <linux-usb@vger.kernel.org>; Mon, 21 Aug 2023 09:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 352A1C433CA
        for <linux-usb@vger.kernel.org>; Mon, 21 Aug 2023 09:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692608467;
        bh=oIL8pwS9Qef/zVJt1/5gWUDRBCmWNDGMPT7Mq5NNgmQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=j3w96Fx697Do2Ude6FrKrN8F+ahIUJmkryt6/A9rZPz2y71mc24+v9McNV3sGGmdK
         2SnrtDmalwB+lBHPvYTpV+7I6kJk3vr+lCa7RiZgtL6k7ObvqO8UdzGTj9SiQacN7B
         C03WJVCym+DbG6HUEvJSQdnaZgfgIeXxJccz+o8U/xW3t+oF9BRzLnglDQlz9StdTq
         RhQrTAYuREQnY/GuwNL56dVw1m0hZOTz5CEsNH5jCYPRUkIktIPwkzB0yHoJbrf8mT
         XbLw168bOqdCJJrXpAQV8h7+loo/78tEOiRhD/nkkcGZWI5eTa1DnTakzppQe+TUPa
         p8PPeowXbm/Yw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 126D0C4332E; Mon, 21 Aug 2023 09:01:07 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217811] usbhid driver misses right-click event for Rapoo
 wireless mouse
Date:   Mon, 21 Aug 2023 09:01:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.byrecki@techniline.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217811-208809-LagwoSCBWo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217811-208809@https.bugzilla.kernel.org/>
References: <bug-217811-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217811

--- Comment #2 from Michal Byrecki (michal.byrecki@techniline.com) ---
Positive, same issue with the latest mainline:

Linux crystal 6.5.0-rc7zeta #1 SMP PREEMPT_DYNAMIC Mon Aug 21 10:41:51 CEST
2023 x86_64 GNU/Linux

Just two events, for left and mid mouse clicks:
Event: time 1692608117.921419, -------------- SYN_REPORT ------------
Event: time 1692608118.001416, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90=
001
Event: time 1692608118.001416, type 1 (EV_KEY), code 272 (BTN_LEFT), value 0
Event: time 1692608118.001416, -------------- SYN_REPORT ------------
Event: time 1692608119.001433, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90=
003
Event: time 1692608119.001433, type 1 (EV_KEY), code 274 (BTN_MIDDLE), valu=
e 1
Event: time 1692608119.001433, -------------- SYN_REPORT ------------

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
