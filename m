Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B62236C05B2
	for <lists+linux-usb@lfdr.de>; Sun, 19 Mar 2023 22:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbjCSVir (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 17:38:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbjCSVip (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 17:38:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C30CDE1AB
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 14:38:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6122A611C1
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 21:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBBE2C433D2
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 21:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679261923;
        bh=LbOAUXr3QWIeG7E5Q0NTJ5TxM1cIo/vkSoJZlXhaEWM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=O25qCKlcsjGR6EvU0nYQqoIYTRwOevHbPp0Zl9cCrb26vs2TSHlMyWA7enQVElsx2
         6Y/zs654cPXE/0mJej8HrqC7E546CrrzevtNhQ68iILITaUdChwmWJ/550TW1or8fS
         Z7K7V0S1WTaQFuOSZO8ZUOWTko5OpeLC75BBcQTQUSO/1Et/gLkWa/3iamZlaaaOPF
         oE6w3F+tTgmxlol/q9PbonUNTXt7nENp5pxgaTSkkvguTBRb/xVyqCZkoxp7mNuqvo
         AwfThlC8QEuBQgbP/uYs4lQ9Ghh8RjHY0byOSyA7rBL8L15C0B597sKrY1lQlO/pAt
         XMb5cJLrwShdw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9FF42C43142; Sun, 19 Mar 2023 21:38:43 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217215] Oops removing usb drive
Date:   Sun, 19 Mar 2023 21:38:43 +0000
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
Message-ID: <bug-217215-208809-WXlIpLz47k@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217215-208809@https.bugzilla.kernel.org/>
References: <bug-217215-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217215

--- Comment #1 from Alan Stern (stern@rowland.harvard.edu) ---
This has nothing to do with the USB subsystem.  It is a bug in the SCSI
subsystem, presumably fixed by commit be03df3d4bfe ("scsi: core: Fix a proc=
fs
host directory removal regression").

I trust this commit will find its way into the next 6.2.stable release (even
though it was not marked as such).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
