Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D299C61F4F2
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 15:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231882AbiKGOIl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 09:08:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231875AbiKGOIl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 09:08:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 386471A383
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 06:08:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E28F4B811E6
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 14:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F6B8C433C1
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 14:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667830117;
        bh=3d4BeeuMPcwohLUphKR5tFE0O1IePAGv7u3hIUe5eF8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cm9JiERblx6+Cu/WxU8g5bYMo4wZF8mVbenjjcOnkYIpuwXUPsk+OsStO4jJ0TtCv
         kQHh6SE5eCIRIPCCB9wIFpo2Alv/0FfJYAii7gwAoep52+oNDYbz9Os/I5HIl+7q1u
         FjPY22PHUFknFQVa00QSAur4da0D3NURLZnKCXDcwUpsMH+xsbEzI+/nza+XLclrPp
         0KDLdYJ3OC4DwR38D3I4UPCuxIAUXpaQ6BKc3iiBTDcDwf0x3aeybgphFrdPhFLH5W
         cOhC+prO9gMr6fDTL5j85GC3wm23cx8/3Wn0BtzyS9zXcj35h3CmjwxeRSkiqmk9t+
         /nF//ToZqx3jg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 892B4C433E9; Mon,  7 Nov 2022 14:08:37 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Mon, 07 Nov 2022 14:08:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214259-208809-OZb0DruNdw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #35 from wse@tuxedocomputers.com ---
For reference: what fixed the Clevo X170KM for me exept the delay was this
patch series:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Dfa6dae5d82081e8d9f8e6a2baf7149442a6c1ba5

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Dd341838d776abadb3ac48abdd2f1f40df5a4fc10

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D0ae084d5a6744b1318407d8e20fb88ac0fd85d47

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
