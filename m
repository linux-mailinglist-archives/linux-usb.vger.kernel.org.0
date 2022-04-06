Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 629E44F604C
	for <lists+linux-usb@lfdr.de>; Wed,  6 Apr 2022 15:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234093AbiDFNxs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Apr 2022 09:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233977AbiDFNxk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Apr 2022 09:53:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF54844CCF3
        for <linux-usb@vger.kernel.org>; Tue,  5 Apr 2022 18:56:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 554F4B8203A
        for <linux-usb@vger.kernel.org>; Wed,  6 Apr 2022 01:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E813AC385A4
        for <linux-usb@vger.kernel.org>; Wed,  6 Apr 2022 01:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649210193;
        bh=fr5V/IwM4IQkz3SCioIdpXn3p9LrtGqH7NY/CotLeNs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HXzrRGaWWZIFr1jp/pFS/RLCqwdZ4Q80p0GOUB4Ah1I4azr2RnAQMLgu0zh1HEErz
         ykrv/WmAQF81RclcVWEr6qzbzgCYuQ81e8ztWwQO0kOzvZCoCSrdaOu7GH1QNMhE7D
         nKz8r4OoF/9HpO4wivh7GR33UbjLzrs2DNcUv/D4Q7DdzBzmGOYMrCYLXBSdW0POx9
         tzAWCUXnPWYChSn0NzA6fqoIPfq7C+6QO1uuK4k7PceZLjRNGdd8Q+Cg0Vy312SSS3
         dWN4obMS8LoZXaWK751uadvv+BEki1A5P1lofzbIPLOuTQVmN0Zl45QSTgGUlweR3y
         JmYULYzjgWwvA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C58BBC05FCE; Wed,  6 Apr 2022 01:56:33 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215799] apple-mfi-fastcharge causes automatic pm hibernation
 entry, when iPhone gets attached
Date:   Wed, 06 Apr 2022 01:56:33 +0000
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
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215799-208809-A133p9a2QE@https.bugzilla.kernel.org/>
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

Manuel Ullmann (labre@posteo.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #4 from Manuel Ullmann (labre@posteo.de) ---
(In reply to Oliver Neukum from comment #2)
> Working theory:
>=20
> You are misinterpreting the system's reaction. The hibernation is not done
> automatically by the kernel. Instead the kernel reports a charger as a
> battery. That battery, being a charger, reports a charge of zero. User sp=
ace
> monitors this and does as it should if its only known power source is a
> battery at zero charge: it hibernates the system.

Your theory is correct. The laptop-mode-tools auto-hibernation facility cau=
ses
the hibernation. This happens even with the patch, because laptop-mode-tools
fails to check, whether a battery has battery-like nodes or whether there a=
re
just chargers in /sys/class/power_supply. [1]

> Please test this patch

Thank you for looking into this and for the patch. laptop-mode-tools is in
Bash, so I can send the PR myself. It would be nice, if it could be backpor=
ted,
since it fixes a bug, but laptop-mode-tools could also use a better check f=
or
battery nodes.

[1]:
https://github.com/rickysarraf/laptop-mode-tools/blob/25496b668d597f947a7d6=
5e7c2d4712e8f77692e/usr/sbin/laptop_mode#L486

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
