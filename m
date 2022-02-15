Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC9F4B62D8
	for <lists+linux-usb@lfdr.de>; Tue, 15 Feb 2022 06:33:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbiBOFdJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Feb 2022 00:33:09 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233567AbiBOFch (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Feb 2022 00:32:37 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 734FF91341
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 21:32:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2A3DBB817C3
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 05:32:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5D85C340F6
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 05:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644903141;
        bh=un6uh0qxxiQY4puQDKXyigmGDs9iYXOCf7Jn2Ew0Bcc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FVvdWflb0q3MRhj3hjJcttXKWama2cuPp4w6rauzd+m4KniZNwhhN409e5IPpEEu2
         gGyIKenbf8Imj3q2zEuWkNy6nSyN5S/E7sXg2gjZl+fq9ZXISDxXd4av6SSC8UlFL5
         Jw9uhl+zAtazELfBvfJ7q+xOpWAXxfs99yhJA0jUmV54O/eusevA3nf963RJFcDyj/
         ZXB9IR0XSnx4bjPQuKJ00mPlpp1xNrihz7yFEG3xu1mBFnc0uxIDore3xLSUfC3KWQ
         DmQ9IL4lF9ZomIn1zajEplGxGnoVx18jtYcN36jNG2IaKPu9BbJhSuTnPGnYE1YqIL
         Jhwb/wrOwARIA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A86FDC05FCE; Tue, 15 Feb 2022 05:32:21 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Tue, 15 Feb 2022 05:32:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bernie@codewiz.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210425-208809-g9Ntgq03o9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

Bernie Innocenti (bernie@codewiz.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bernie@codewiz.org

--- Comment #10 from Bernie Innocenti (bernie@codewiz.org) ---
Still happening on 5.17.0 on a Thinkpad X1 Gen 7.

Steps to reproduce:

1. Unplug USB-C charger

2. Correctly detected as unplugged:
   % cat /sys/class/power_supply/ucsi-source-psy-USBC000:002/online
   0

3. plug USB-C charger

4. Correctly detected as plugged:
   % cat /sys/class/power_supply/ucsi-source-psy-USBC000:002/online
   1

5. Close the lid and wait for the laptop to sleep

6. Unplug USB-C charger while the laptop is suspended

7. Wake up the laptop

8. BUG: Still detected as plugged!
   % cat /sys/class/power_supply/ucsi-source-psy-USBC000:002/online
   1


Info:

  % uname -a
  Linux giskard 5.17.0-0.rc3.89.fc36.x86_64 #1 SMP PREEMPT Mon Feb 7 14:58:=
45
UTC 2022=20
x86_64 x86_64 x86_64 GNU/Linux

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
