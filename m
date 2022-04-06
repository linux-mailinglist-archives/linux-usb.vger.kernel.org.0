Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 940314F6C87
	for <lists+linux-usb@lfdr.de>; Wed,  6 Apr 2022 23:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234873AbiDFVXl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Apr 2022 17:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234189AbiDFVW3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Apr 2022 17:22:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CCE81F891A
        for <linux-usb@vger.kernel.org>; Wed,  6 Apr 2022 13:17:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DDCF1B82528
        for <linux-usb@vger.kernel.org>; Wed,  6 Apr 2022 20:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C783C385A1
        for <linux-usb@vger.kernel.org>; Wed,  6 Apr 2022 20:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649276233;
        bh=DI9i1/wFmG9o7sOhhdTZ/aFp+NKcN0N4nZyk54cBsRA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fPW0FmVFj+FsvSAdVr7VNOAEsmjH1njvOwKTi1P0acwYfXov4jeZ1dZVPbvHd2o2t
         jC25xh/JKOVlEqZFSVkTdmftZpoNzQ+511QcjIOQeMqPrPvUfvXoyQg74UyJjj5oWG
         EUkgdQtKtOoDZGeY84jyjIvTRNs2Tci6Rs/z/dZ+piSCAZEWHh2RFScoPKuc6vwq36
         OYRZ0ZSfWl6HnySIX+s+SRuLnQeVHVXYtEJQ1Ph83Pnccm5JCvlu23JK3obEcUUvot
         ho8YPjx6P0HXcZoyIDd0ssW45UJsrUeFmZeJd+jp1f6nTw5ZUnS24K7LRc68WJPEYm
         en2K8mSfNcnTg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6B632C05FD5; Wed,  6 Apr 2022 20:17:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215799] apple-mfi-fastcharge causes automatic pm hibernation
 entry, when iPhone gets attached
Date:   Wed, 06 Apr 2022 20:17:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: labre@posteo.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215799-208809-nWSmZk9nPV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215799-208809@https.bugzilla.kernel.org/>
References: <bug-215799-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215799

--- Comment #6 from Manuel Ullmann (labre@posteo.de) ---
(In reply to Oliver Neukum from comment #5)
> just to make this clear. We seem to have two bugs. Do both need to be fix=
ed
> to remedy this issue, or do we have two independent bugs?

They are partially dependent on each other, however the kernel can=E2=80=99=
t fix the
issue alone, while userspace can by adding a safe guard/workaround.

Is it technically more correct to report the charger as USB or should it ra=
ther
stay like it is? If the answer is yes, then the patch should be incorporate=
d.
Whether it is required depends on how the laptop-mode-tools developing
community considers workarounds for buggy drivers.

Consider the following commit [1]:

diff --git a/usr/sbin/laptop_mode b/usr/sbin/laptop_mode
index 5e2ef72..c4387ab 100755
--- a/usr/sbin/laptop_mode
+++ b/usr/sbin/laptop_mode
@@ -488,7 +488,7 @@ lmt_load_config ()
        BATTERY_NOT_DISCHARGING=3D0
        for POWER_SUPPLY in /sys/class/power_supply/* ; do
                if [ -f $POWER_SUPPLY/type ] ; then
-                       SYSFS_POWER_SUPPLY=3D1
+                       SYSFS_POWER_SUPPLY=3D$(( SYSFS_POWER_SUPPLY + 1 ))
                        if [ "$(cat $POWER_SUPPLY/type)" =3D "Mains" ]; then
                                log "VERBOSE" "Determining power state from
$POWER_SUPPLY/online."
                                if [ "$(cat $POWER_SUPPLY/online)" =3D 1 ];=
 then
@@ -497,6 +497,14 @@ lmt_load_config ()
                                fi
                         elif [ "$(cat $POWER_SUPPLY/type)" =3D "Battery" ]=
; then
                                log "VERBOSE" "Determining power state from
status of battery $POWER_SUPPLY."
+                               #INFO: Because there are and will always be
br0ken drivers
+                               if [ ! -f $POWER_SUPPLY/status ]; then
+                                       log "ERR" "Your power_supply is lac=
king
a status node"
+                                       log "ERR" "Its driver might be
reporting a wrong type"
+                                       log "ERR" "Ignoring this battery"
+                                       SYSFS_POWER_SUPPLY=3D$((
SYSFS_POWER_SUPPLY - 1 ))
+                                       continue
+                               fi
                                 #INFO: Because there are and will always be
br0ken batteries
                                if [ "$(cat $POWER_SUPPLY/status)" !=3D
"Discharging" ]; then
                                        if [ "$(cat $POWER_SUPPLY/status)" =
=3D
"Unknown" ]; then
@@ -512,11 +520,15 @@ lmt_load_config ()
                                        ON_AC=3D0
                                        break
                                fi
+                       else
+                           log "VERBOSE" "Power_supply has unexpected type
$(cat $POWER_SUPPLY/type)"
+                           log "VERBOSE" "Ignoring it"
+                           SYSFS_POWER_SUPPLY=3D$(( SYSFS_POWER_SUPPLY - 1=
 ))
                        fi
                fi
        done

-       if [ $SYSFS_POWER_SUPPLY =3D 1 ] ; then
+       if [ $SYSFS_POWER_SUPPLY -gt 0 ] ; then
                # Already found it!
                log "VERBOSE" "Not trying other options, already found a po=
wer
supply."
        elif [ $BATTERY_NOT_DISCHARGING =3D 1 ]; then
--=20
2.35.1

With the kernel patch, just the else case and increment/decrement would be
required. Without it, the handling in the battery case is required. As I sa=
id,
I would consider this a reasonable addition for robustness, but I don=E2=80=
=99t know,
whether the laptop-mode-tools community shares that opinion.

Thank you again for pointing me in the right direction.

[1]:
https://github.com/rickysarraf/laptop-mode-tools/pull/186/commits/9ddcb2e9f=
4665fa0b0620fc7eb397917d029fdfd

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
