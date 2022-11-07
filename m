Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91A5D61F61D
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 15:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbiKGOdx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 09:33:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232556AbiKGOdY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 09:33:24 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DA931E3D6
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 06:31:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9DF9A6109A
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 14:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08BA3C433C1
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 14:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667831509;
        bh=lYfXk/XKHxaGD4J9dMG6UcbAO5a/UUr7ADihVPjkZrQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=PTzHa3AE4t+S3JpsHu8UT96gsXelrpTPnBIjkoSUwj9E18ls+xD662JthcZk6vhhn
         4Jvzsw0tkcC0b+Gwl/GIfcbCkzCHO4v1X/VbIWnu82h1BRElB6tbf6BM1PyPG4Evvx
         mVce9a4lXFrX5oR+4a3nkmtqE1zhSKCkntVM3Z53fJCtXB3tO9zgPTVzjc8u1azlN5
         jlEeceaP0jfJTGmO6ITHnbvnqy1rPw8kVXbWtUDZK39EhjY5juwKfySJqdTiSaUISm
         fm6txpOeO44Ix8a+XufqwrJzvACb0OU4uQtc3CunG+fetacD1PZmGKZI4lt0PgcgjK
         nIMij3HomXKHQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EC54BC433E6; Mon,  7 Nov 2022 14:31:48 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Mon, 07 Nov 2022 14:31:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kjhambrick@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214259-208809-ZCbt2wuS55@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #36 from Konrad J Hambrick (kjhambrick@gmail.com) ---
Thanks for all the info wse@tuxedocomputers.com

The comments in Hans de Goede's three patches look familiar but I'll try all
three patches against 5.15.y again.

Or should I be running a different Kernel Version ?

The Code referenced at elixir.bootlin.com is from Kernel Version 6.0.7 ...

I'll test next weekend when I've got time to build ; boot ; dmesg ; repeat=
=20

Then I will open a new bug report.

Thank you and thank you and Tuxedo Computers for the tuxedo-keyboard-master=
 and
tuxedo-keyboard-ite kernel modules ( they work great for me ) !

-- kjh

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
