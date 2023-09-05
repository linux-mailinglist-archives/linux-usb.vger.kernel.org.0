Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFC08792F9D
	for <lists+linux-usb@lfdr.de>; Tue,  5 Sep 2023 22:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232346AbjIEULC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Sep 2023 16:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231374AbjIEULA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Sep 2023 16:11:00 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D70DCE5
        for <linux-usb@vger.kernel.org>; Tue,  5 Sep 2023 13:10:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 7CA37CE126E
        for <linux-usb@vger.kernel.org>; Tue,  5 Sep 2023 17:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98FD5C433C8
        for <linux-usb@vger.kernel.org>; Tue,  5 Sep 2023 17:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693936045;
        bh=P88yCbVGjSjNye1dC3jYv+PWoR7FAnBSGl3mkSPjk0E=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=RpLaG/MByuZX5m0J0uYtTzcB7IFs8wN2z5kpCjljKUNqB+H9neBzYvx7vHNT1nfpG
         rlyZt24JZS8n71Xvm9A6+WLpx78LUMPCoAInhJPUbeOALL3KIqFFyAtfB0GXhEP6NK
         UE8B0dJGQVmlee2p4mvL7qHru/Wx3yRPst0XcSXHO6qh1dJU7+N81j786x9yIIgYBl
         HHWH5Sy3NFilNWNpW5H4nDd0GoBejv/pjHz4b6bWqPNfiKx814itq00H9ytR8GEZy1
         SGjbOSEqa/E5ZR4dCMYowKBmqmx0mFkQdgok34GYF8VmPIPvpwasQhJvIc2VbqrTEX
         r3rgiS7yOZbkQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 79B3EC4332E; Tue,  5 Sep 2023 17:47:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217862] [BUG] Alauda driver causes oops when inserted with card
 in with transfer buffer is on stack, throws errors if card is inserted
 afterwards.
Date:   Tue, 05 Sep 2023 17:47:25 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217862-208809-zY9YoR12Me@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217862-208809@https.bugzilla.kernel.org/>
References: <bug-217862-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217862

--- Comment #9 from pawlick3r@proton.me ---
Created attachment 305044
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305044&action=3Dedit
dmesg oops with debug on

I tested the reader in another PC with Windows XP and it did work, when I t=
ried
one more time on the laptop with Linux I was able to get an oops error with=
 the
debug settings on to show more information.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
