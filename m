Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA04C4ACBD9
	for <lists+linux-usb@lfdr.de>; Mon,  7 Feb 2022 23:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239306AbiBGWKT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Feb 2022 17:10:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbiBGWKT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Feb 2022 17:10:19 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92B32C061355
        for <linux-usb@vger.kernel.org>; Mon,  7 Feb 2022 14:10:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 33B1E615E2
        for <linux-usb@vger.kernel.org>; Mon,  7 Feb 2022 22:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97EB2C004E1
        for <linux-usb@vger.kernel.org>; Mon,  7 Feb 2022 22:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644271817;
        bh=7bPPvJArlbJ3tJIIygaiaKn1/ctcZocFvKRiMATqLDc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dc9LKVVoVnic2vy+nYAK9GLPoC0X8mie63jCswuPNctrMLOgPtcxdGqC+tUfBFseu
         jsRMk1QeQA7S/k9Z/E0lXxxDdOsCJzIOsM0FFYWpcD1e+HcdZKifehxGlhkPfQ1VY8
         Su2Pt2tZjupCJxK0oPrsthsPIk3x9Pu6yQWpcdi2c4PZTE7Aq2r4w+kGyQnk1gmQgy
         7KOeXhRhYAH5lkaj2QHS6bIGgjobYDrAHUQqxE2to8gvVCRWKEMQSb0BKAenxVJrHm
         01fc/9mVVZ1Q8R62wVyD+0exKjEovK9SXvOMSI6DRkU+ghYYjld0hsMi7Fjlz0jlv/
         G0Pyg8wSgVadw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7F561C05FCE; Mon,  7 Feb 2022 22:10:17 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215561] snd-usb-audio:reset_resume error -22 after suspend
Date:   Mon, 07 Feb 2022 22:10:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mark.blakeney@bullet-systems.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215561-208809-aUXGXNwPqZ@https.bugzilla.kernel.org/>
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

--- Comment #2 from Mark Blakeney (mark.blakeney@bullet-systems.net) ---
The bug has also been reported on NixOS:
https://github.com/NixOS/nixpkgs/issues/157755. Note, still occurs on 5.16.6
and .7.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
