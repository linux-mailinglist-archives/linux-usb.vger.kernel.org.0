Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD7626A5FBC
	for <lists+linux-usb@lfdr.de>; Tue, 28 Feb 2023 20:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbjB1Tfo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Feb 2023 14:35:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjB1Tfn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Feb 2023 14:35:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C3FE2686
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 11:35:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BE9D761196
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 19:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F03CC4339E
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 19:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677612942;
        bh=4qrqkqb2BAe6rpPEhiFkxUXnDaQ0sSJduEDeDtcnhrQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=saFJcenzJaOTWu79IEdkKJsGu5uY94pK4a0zzssPBiDSlGIFlOlRc+kZ6mSlPACOz
         1sS+sUbA9nZr12t3+AmuX9oWoLNhgAKt5Yn/TPXlAsh1mR9/dPNDFD4ZLEBQLrXaST
         xXQB5kg7aNsNIOaBkCgKjGaevqv9EgQHoB9pzTEwNOsRXKaEkFpE96/AvtE0lG9OTe
         WMl5jqHpCJBSbUPxmTIEm/HTfGV3aZ0YW3qY/0o96xjkx0sng/dopYMq+9qIR4kuPa
         P+PgXPzdu75rh4xXZ4an2b6dOudwciQgXxP7rWOiOK171SpE2UH3zFqpu/cthOszbD
         celpArqB/XqtQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0F99AC43144; Tue, 28 Feb 2023 19:35:42 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Tue, 28 Feb 2023 19:35:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217089-208809-W6RhkbIhgp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217089-208809@https.bugzilla.kernel.org/>
References: <bug-217089-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217089

--- Comment #18 from Alan Stern (stern@rowland.harvard.edu) ---
Okay.  There was a change made to the kernel some time ago which caused it =
to
always use the old scheme first for initializing high-speed USB devices,
overriding the value in the old_scheme_first parameter file.  It turned out
that this change caused problems for some devices, so it was reverted about
three years ago.  I expect Ubuntu's 5.4.0-33-generic kernel release contains
that change and the -37 release contains the reversion; that would explain =
what
you're seeing.

But at least you do have a way to make the device work now.  In fact, you o=
ught
to be able to leave the parameter set to Y permanently; this will work fine
with most devices.

And if you want to know why the Xone behaves in this strange manner, probab=
ly
the only way to find out is to ask the manufacturer.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
