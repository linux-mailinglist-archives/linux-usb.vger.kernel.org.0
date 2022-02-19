Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7189F4BC818
	for <lists+linux-usb@lfdr.de>; Sat, 19 Feb 2022 12:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236333AbiBSLLs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Feb 2022 06:11:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbiBSLLr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 19 Feb 2022 06:11:47 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B65340E5
        for <linux-usb@vger.kernel.org>; Sat, 19 Feb 2022 03:11:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7A7DDB8013B
        for <linux-usb@vger.kernel.org>; Sat, 19 Feb 2022 11:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D512C340EB
        for <linux-usb@vger.kernel.org>; Sat, 19 Feb 2022 11:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645269085;
        bh=WzTiSPFimVNPZFvAns0vGg2jSgQs4+Y9rbI0bV8X0sk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Z6HlDDrdkOSTJUIabTJxHBukA8CanWknGew/1QPHfVgpTkQufkd5frHa1dIlaxFMz
         Mi5FQ2OUM6Obl00H3OKzkKfkQs4UvxdL0peBp/VxcB7LunaNLv0AnWpDKt3EDPb029
         3hFkoC29OxccYv6YOpO5ZmGCHMF2MU8jtclQ02Thea+zksRFZoxzuk16XcApDh8uia
         bLJEzwTUjeqCvsAY/oWTcdvyz4WUghUC3oXR+4zbb5M693n+obfuAXhjjHxz0wP9Tc
         HS+wjNi8e1vUMXNjEuVtHUbXiTztdYzTbUCOaZCy8nEPMhF6RmFrxbMYirm38tPBJh
         frpmwAwDts3vQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 20F5CC05FD2; Sat, 19 Feb 2022 11:11:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Sat, 19 Feb 2022 11:11:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t123yh@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209555-208809-q9vNW3qWMy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209555-208809@https.bugzilla.kernel.org/>
References: <bug-209555-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D209555

--- Comment #32 from Yunhao Tian (t123yh@outlook.com) ---
Hi,

Just discovered the real issue of my case. dwc2_gadget_enter_clock_gating
doesn't seem to be working for my RK3308, so disabling clock_gating does the
trick for me.=20

Specifically, I added=20

  p->no_clock_gating =3D true;=20

in dwc2_set_rk_params, and everything now works.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
