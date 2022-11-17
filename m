Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51B9462D49B
	for <lists+linux-usb@lfdr.de>; Thu, 17 Nov 2022 09:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239291AbiKQIE7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Nov 2022 03:04:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239305AbiKQIEz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Nov 2022 03:04:55 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAFD8716D2
        for <linux-usb@vger.kernel.org>; Thu, 17 Nov 2022 00:04:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 77663620F0
        for <linux-usb@vger.kernel.org>; Thu, 17 Nov 2022 08:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD7A9C43148
        for <linux-usb@vger.kernel.org>; Thu, 17 Nov 2022 08:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668672290;
        bh=WpsbTn7BKTVaAyuq5Nl2/rtGvFOqKJ+ObK2vI3YQ+dk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=k+RI4bNotiKBS/N+5W98jmWJ4ZgZLFkA3dCLpRhHnHMRSvzz4OIT7qoU75CmM8BX+
         WozXaA7/ZBrdRKlEXd29t0luJINM5fKZq/MSMRi6BFxojqLj2fMvTgPJ4TBaTEGyS5
         rIfKu4wf+U8c5nH6YKmGtYz+jsGjGp6rbbkVq3rXCSIDbGMebXg88wOXmVEn/w3qV5
         krbPy4ALqQgzCl375C5LJ+Dq7lZzSeLln/GpmJj48G9eUgIIiwHR/u1YYU5FXxBBh1
         HuuziAcd7t8eGTw8x/VAfyDFglaWky3m9v3zyn4KAE/fiC7Cwrk7Vazz0hu9f32A6b
         pttDEUjKk6BBA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CD5ECC433E7; Thu, 17 Nov 2022 08:04:50 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Thu, 17 Nov 2022 08:04:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: denis@speran.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-fpGApJVFHy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #45 from Dennis (denis@speran.info) ---
Submitted a bug https://bugzilla.kernel.org/show_bug.cgi?id=3D216697

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
