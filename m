Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC9EC6542CB
	for <lists+linux-usb@lfdr.de>; Thu, 22 Dec 2022 15:22:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235485AbiLVOWt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Dec 2022 09:22:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235486AbiLVOWf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Dec 2022 09:22:35 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C3D28740
        for <linux-usb@vger.kernel.org>; Thu, 22 Dec 2022 06:22:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 33A0961AF5
        for <linux-usb@vger.kernel.org>; Thu, 22 Dec 2022 14:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98D08C433EF
        for <linux-usb@vger.kernel.org>; Thu, 22 Dec 2022 14:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671718952;
        bh=vOab4C6HkGi4BXDRvnJQkH/e9nDzzddfcZ0UlbQvS3E=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nZRLkiZF49m5m0GIxmXsccviqVr3ju5h1N1DnfQ9erI979RH+T4n3gX9r+Mp5F+hW
         MIHd3UEVpiya4UvSdd8raodwPToRw1w1Nn1KIKrGpBaItdRlQ+Ecwap6V994H3Syn+
         2IuWSK7qFPLjosAY6vgpMOdvvUCPqfzlOflGsYrkpq1dMxmxDpk/lScKUyNdL+3TNW
         DoqJVjQeUfPOCVvd05olHmPI29SX/75gk9VPitG3iLHxCvzUyzX9uK3dDiA5kDPrsW
         P+Nxln3QQkLBkoR43PfGJ1FgUy5PyJlITUJuNraC76ueOr/XPb3Evk5dJHevYaTJpR
         JcqPs+hYuVBdg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 70AE2C43142; Thu, 22 Dec 2022 14:22:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216822] Thunderbolt USB Controller (Maple Ridge) and its
 upstream pcie port fail to runtime resume
Date:   Thu, 22 Dec 2022 14:22:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mail@jakemoroni.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216822-208809-h5Qg9qr7rb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216822-208809@https.bugzilla.kernel.org/>
References: <bug-216822-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216822

--- Comment #5 from Jacob Moroni (mail@jakemoroni.com) ---
I should add that in my case, I=E2=80=99m using this add-in card in a syste=
m that has
no BIOS support for Thunderbolt. The motherboard doesn=E2=80=99t have a Thu=
nderbolt
header, so I am pulling pin 1 of the 5 pin connector up to 3.3V to force the
card to turn on, which I=E2=80=99m guessing is the equivalent of writing 1 =
to
/sys/bus/wmi/devices/86CCFD48-205E-4A77-9C48-2021CBEDE341/force_power on a
system with real support for this card.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
