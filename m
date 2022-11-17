Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B41FB62D5DB
	for <lists+linux-usb@lfdr.de>; Thu, 17 Nov 2022 10:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239450AbiKQJGq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Nov 2022 04:06:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239690AbiKQJGo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Nov 2022 04:06:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C7E75A6D6
        for <linux-usb@vger.kernel.org>; Thu, 17 Nov 2022 01:06:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 38AB6B81D87
        for <linux-usb@vger.kernel.org>; Thu, 17 Nov 2022 09:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C76E7C433D6
        for <linux-usb@vger.kernel.org>; Thu, 17 Nov 2022 09:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668675998;
        bh=pPJoxw0DABgm7D7EMJt9++053p2ZEX7sAHK+r+ZQH7Y=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JVVsvCuiOh7B5jbx6v7fG0JeTMPLxx20S0Q7SXmdUf5i7umte5RP+F/hutDLwDRir
         xJY6QWXrsqcHgw2NkbkJVQd6fsnYFQpFSfMwmHclUacEQREfya/9ijU+HRA1otiGAE
         iq4gLU0NHNnm0XBJO0HHwoj/4xNnwSJ3F16P9UQ6QTKC0NDv+dkvt2XsOiCYFrh1y1
         v4IEgfyPmtMOEgnlaMfCyPCBQirIVEpDkOTQ18Atg99ZOrx1n5xT/jIKPn0RfubhAV
         OCYG5vE4WnsOKxAXM+Mz4RI6RIdi1QoydRKsW7lPB6NFlaB0vw7eqVP6PY3N85UVwK
         tPxpRIieL3M0A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B7A00C433E6; Thu, 17 Nov 2022 09:06:38 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216697] Resume from suspend stopped working
Date:   Thu, 17 Nov 2022 09:06:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: heikki.krogerus@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216697-208809-boeYGDRbBL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216697-208809@https.bugzilla.kernel.org/>
References: <bug-216697-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216697

--- Comment #1 from Heikki Krogerus (heikki.krogerus@linux.intel.com) ---
Can you blacklist typec_ucsi and ucsi_acpi modules to confirm that it reall=
y is
a ucsi problem?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
