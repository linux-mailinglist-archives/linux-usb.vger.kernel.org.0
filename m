Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A30EF5B79DC
	for <lists+linux-usb@lfdr.de>; Tue, 13 Sep 2022 20:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiIMSoJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Sep 2022 14:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232357AbiIMSnv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Sep 2022 14:43:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2342374CDF
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 11:20:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B3F7A61550
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 18:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D101C433D6
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 18:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663093254;
        bh=570/IwsCG1nomKo/oqKdMlBp88GoNcAhHDEkxqWuKOE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=s0gc0rqr2hrI/L6M3K3HZY1AokxhT5D0KBK3LT7bvkGuJkI7Nv6pgMsIwn8v4SMV5
         lOJqbk016xxAvlGMUlhkXbNRss2Zvp+cATCinF0l7rjDUYt7uFTZi4MAm24uYmfENv
         nL4eIlNpGRdQVgYzivLaO4dwSEuDDxKzXy6C1xYfibG8hXByUdAmr4v+/HAgWwtXbf
         NM5G8rQkEpuFTEXdEBhZJPgiEwlOgU2Gjga/mK4iVFu7J1XRylww6ZUZ/Qnbyp88xc
         42Is39yOvPORLEV63RIACNdhb5fN6K46W+NLThWeSnsv3dFp7uUwfqwh9CfaJJ+ORq
         bMMGGfUDTecgw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 04FF3C433E9; Tue, 13 Sep 2022 18:20:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216483] Logitech HID++ feature ADC_MEASUREMENT=0x1F20 reports
 battery information
Date:   Tue, 13 Sep 2022 18:20:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugzilla@hadess.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216483-208809-l2Daf6ZPc8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216483-208809@https.bugzilla.kernel.org/>
References: <bug-216483-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216483

Bastien Nocera (bugzilla@hadess.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bugzilla@hadess.net

--- Comment #1 from Bastien Nocera (bugzilla@hadess.net) ---
There's some attempts at reverse-engineering the support in:
https://github.com/Sapd/HeadsetControl/blob/master/src/devices/logitech_gpr=
o.c

Which is based off:
https://github.com/ashkitten/g933-utils/

Would be great to get the battery curves from Logitech though, I can't thin=
k it
would be too controversial...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
