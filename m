Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD35E79F1BD
	for <lists+linux-usb@lfdr.de>; Wed, 13 Sep 2023 21:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232153AbjIMTJC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Sep 2023 15:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232126AbjIMTJB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Sep 2023 15:09:01 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD10F199F
        for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 12:08:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73EA8C433C9
        for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 19:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694632137;
        bh=CGFis7QF1ZGBsIX9xDPh/FUSFp9MP9tpaa8rD/2oB9o=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=D5FBupWvvFG6pK3U4Y2iUZuQtcODWDjBwg2Qs3H6h6jdfalACIbXxt++Gw53KjaN6
         LOaaSSC7f8ySXeEPPA3K5FAZ6KR6TpFhg+MGNK6rmHsuVBlNc+R7nqKSHj6g0uEwfh
         xBvVX/urJtusI+2G4D+RaaQg9SOY4EXLDevRWEEnFHhJVjlv8WDtxr7d0lRqBlOlz8
         ryQnboBGijGtQU/bBwYOUGXmS1Hb9g3f0xEY6McgR8Wc6An2bmCIp7SAqY3+ZmuB+A
         GO6iLAMdY0sFIkR9Jt7Jkso6pSOH72mEcq3wtUqgjsTm30nHQaBmXgIoz2CmVEaru+
         6Y+OTToLEur9g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 60DFCC53BC6; Wed, 13 Sep 2023 19:08:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217862] [BUG] Alauda driver causes oops when inserted with card
 in with transfer buffer is on stack, throws errors if card is inserted
 afterwards.
Date:   Wed, 13 Sep 2023 19:08:57 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217862-208809-YAr47nZ9Oz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217862-208809@https.bugzilla.kernel.org/>
References: <bug-217862-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217862

--- Comment #19 from Alan Stern (stern@rowland.harvard.edu) ---
Are you referring to the attachment in comment #16?  Whatever error message=
s it
contains are completely swamped by the usb-storage verbose debugging output=
; in
practice it's impossible to find them.

In any case, we've pretty much reached the limit of my knowledge about this
driver.  Everything so far has involved fixing some pretty straightforward =
bugs
(i.e., bad interactions between the driver and the rest of the kernel), but
problems involving the data sent between the driver and the device are beyo=
nd
me, since I have no idea how Alauda devices are meant to work.

If you want to proceed farther, there are two things you might try.  One is=
 to
get in touch with the people who originally wrote the driver, to see if they
still remember how it's supposed to operate and can help fix the problems.

The other is to try running an older version of the Linux kernel, back from
when the driver did work right (assuming it ever did -- something I'm not s=
ure
of).  If you do manage to find a version of the driver that works, comparin=
g it
with the current version may indicate what needs to be fixed.

One other thing: You remember that comparing the usbmon trace with the Wind=
ows
Wireshark recording showed that the Linux driver was using the wrong endpoi=
nt
for some of its commands.  Well, in fact the recording shows that Windows u=
ses
_both_ bulk_OUT endpoints at various times.  Therefore the fact that the Li=
nux
driver uses only one of them is rather suspicious.  But I don't know what e=
ach
endpoint is supposed to do or when they are supposed to be used.  (Also, th=
is
is partly why I wonder whether the driver ever really worked, given that it=
 has
never used more than one of the bulk-OUT endpoints.  Just possibly, the dev=
ices
it was written for were somehow different from the device you are using now=
.)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
