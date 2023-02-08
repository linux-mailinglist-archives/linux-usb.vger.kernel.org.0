Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2370768E725
	for <lists+linux-usb@lfdr.de>; Wed,  8 Feb 2023 05:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbjBHEa4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Feb 2023 23:30:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbjBHEaR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Feb 2023 23:30:17 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF1AB410B4
        for <linux-usb@vger.kernel.org>; Tue,  7 Feb 2023 20:29:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3EC7761496
        for <linux-usb@vger.kernel.org>; Wed,  8 Feb 2023 04:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3E0DC433D2
        for <linux-usb@vger.kernel.org>; Wed,  8 Feb 2023 04:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675830593;
        bh=YaehkpzzFKJGirK/+1Mg/RrNrKE3iaW+Oi+fYfSk+ic=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ZIhJdOnhNIzt4stF1lgNhmqZpOigRvfe1pIsMpIN607fLN/jbxpeVnP7dHEzrxdaX
         x/yIHqMCFBigrUb5YpN44FuC2fcvFO4coB8208zM1zmv5vI2WFYuF+3azP2UiE6dR0
         oaSSKgoWPq52bdWheRjH02MgHSDdzU48Jm46ZOWga+nZxA/8vHUNTGcdZM38jdon0i
         eaiMkd8jM3K8YnC6kWOZNoyfrYzaFT6GeI/xJKRogIpe8mN9aWMaTFyNWp8dJZgoiP
         LjHo2bSltSy/tkyBQKCeNZ5sriU3AIkf5aBz7QSRA4WJyPdVnpo1ihWDjgJMc+fQU+
         EcqEOc+Fk+H8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8DE16C43144; Wed,  8 Feb 2023 04:29:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Wed, 08 Feb 2023 04:29:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chris.chiu@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-7Xx4Hl9XMT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #25 from Chris Chiu (chris.chiu@canonical.com) ---
The problem is gone after applying the patch in #23. @Mika, could you send =
it
upstream then we can start working the next step? Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
