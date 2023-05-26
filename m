Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F228A712E48
	for <lists+linux-usb@lfdr.de>; Fri, 26 May 2023 22:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbjEZUmg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 May 2023 16:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjEZUmf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 May 2023 16:42:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E08A114
        for <linux-usb@vger.kernel.org>; Fri, 26 May 2023 13:42:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2741365369
        for <linux-usb@vger.kernel.org>; Fri, 26 May 2023 20:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 895AAC433EF
        for <linux-usb@vger.kernel.org>; Fri, 26 May 2023 20:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685133753;
        bh=PT+7hBa+1zq/It4qhhXHytHDWdqW1JtIRrSSuIgeuUk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NDUkWXupY754mrudJK7MFACTIKbBz7fhilk5iIxp9yQ3JjLSyKJg7ciyn0OBqK2Lw
         dVErzOY8/UEehiYRGnkDWPiHc+p05jghIzfG8dREo83seCmUEyWCPYBBJRko7FKtVG
         VqK9Ll07KCnLMVYisAToOO8dR6MO3c5SNfNC+qis/gWQh0zFmV3FonywZWm9Vuj3n9
         BYk4h331LyNQfhODLG3u2U9D43YHBGrldfoywOLmjx60LqnW0QWu65pAkdlaLVB4wv
         PmSocH3AaJfCoHceGASYbHNqvVXPFpwHzzKI5ZkWyBvOPXS1bWtiz9KU3ghEULKrjS
         gTVY0LassV5IA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6DCDAC43142; Fri, 26 May 2023 20:42:33 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217434] SuperSpeed+ speed reporting wrong from Asmedia ASM3242
Date:   Fri, 26 May 2023 20:42:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: james@ettle.org.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217434-208809-gv7ksG37L0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217434-208809@https.bugzilla.kernel.org/>
References: <bug-217434-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217434

--- Comment #1 from James Ettle (james@ettle.org.uk) ---
The same seems to apply to the ASM2142/3142 controller (1b21:2142). This is=
 a
10Gbps chip, and devices do seem to connect at 10Gbps where supported, but =
this
is reported as 5Gbps.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
