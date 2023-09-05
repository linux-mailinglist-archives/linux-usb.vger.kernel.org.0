Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5FFB792FA3
	for <lists+linux-usb@lfdr.de>; Tue,  5 Sep 2023 22:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbjIEUNB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Sep 2023 16:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242563AbjIEUMl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Sep 2023 16:12:41 -0400
X-Greylist: delayed 215 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 05 Sep 2023 13:12:12 PDT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C6A210F5
        for <linux-usb@vger.kernel.org>; Tue,  5 Sep 2023 13:12:12 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3155BC4AF78
        for <linux-usb@vger.kernel.org>; Tue,  5 Sep 2023 19:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693943035;
        bh=OYYePw820VbKCznQb8dH9Cib11ny5go+FPc3UygQXng=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Hb0E958RIxqM4jsM+tns9PHuLg8mymjZSgykk/c4vkXBhQh1FvOxwiXkgZjNMtbOO
         qx9UJ63ygPXgw5c7l7FUmCIK/jqIIKIjd6oMXPaphD5q0AmkFszqniEirTfMCh+id9
         RgIgjQHVxL0WRrExFKCqJ5QYPl3t9MDtKL71KOqcL16wesEf2fCu+RUT5nZuWfFSL/
         e+AzRkTGvLH6OV8Gec2ob+Tg3ue5btDdRBf7sxd1XneFJmO4OB9jTjlTn34e5NbBlc
         57arZK/Gi/w/QgMCVq2gv1/Obwd89iE8/5r5leKR2bMU+Sa48P5dBLs5DrK1rlS1zl
         xvIG/46oTjphw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 17B1AC53BCD; Tue,  5 Sep 2023 19:43:55 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217862] [BUG] Alauda driver causes oops when inserted with card
 in with transfer buffer is on stack, throws errors if card is inserted
 afterwards.
Date:   Tue, 05 Sep 2023 19:43:54 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217862-208809-EBHJlN8wj5@https.bugzilla.kernel.org/>
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

Alan Stern (stern@rowland.harvard.edu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |stern@rowland.harvard.edu

--- Comment #11 from Alan Stern (stern@rowland.harvard.edu) ---
It's hard to tell exactly what's happening.  There are several different odd
things going on.

In the first test, the device seems to alternate between saying that the me=
dia
is present and that it isn't present.  No way to tell why it's doing this.

The oops in the second test results from the fact that the
alauda_ensure_map_for_zone() routine doesn't check the return value from its
call to alauda_read_map().  That's bad programming.  But the reason the call
failed was because the command transferred by alauda_get_redu_data() wasn't
accepted by the device.  Instead the command timed out and the driver had to
cancel it and reset the device.

The same thing happened with the command transferred by alauda_reset_media(=
) in
the first test.  I can't tell if the problem is that the command isn't being
sent properly or that the device isn't working properly.

Can you collect a USB trace on the Windows system (with Wireshark or someth=
ing
similar)?  If it shows the same command being sent and accepted by the devi=
ce,
it will mean there's something wrong with the way the commands are transfer=
red
on the Linux system.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
