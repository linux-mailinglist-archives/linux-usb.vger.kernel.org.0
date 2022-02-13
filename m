Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2A454B3DE5
	for <lists+linux-usb@lfdr.de>; Sun, 13 Feb 2022 23:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238435AbiBMWHM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Feb 2022 17:07:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233686AbiBMWHL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Feb 2022 17:07:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B39A21BC
        for <linux-usb@vger.kernel.org>; Sun, 13 Feb 2022 14:07:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9D6E960B7E
        for <linux-usb@vger.kernel.org>; Sun, 13 Feb 2022 22:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E583DC340F1
        for <linux-usb@vger.kernel.org>; Sun, 13 Feb 2022 22:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644790022;
        bh=IOnz23pEuXaNsLTnvO7V1ZO0t4Da1iWdH3BdGusz61E=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ufNeGs0IBxscWcIG1FpCe4CPFZIoUuLuflkNYwnGA+wcDc5aXIJvdmxIILaWIVENS
         QPhmgKZMmdKVQFAK9mpJoToz8tTQl/dVAl+yUE9lk2bIw+cgkHRgA8PahVT8rlsTUl
         P6/HiNtbJiu5qi/xMEaRj5655FhtSozKb0msUhIfWyanN3ReCNvPEswFcJ/uABLfSO
         EHt2emSLvGZTMd2SxcrNYamFB3n96bJLn3EJcERZMyDodbYorFcgSELVIEm6NFJBKc
         FTcL44VyOvegTC8pcZexROGJQ8UIVYKwVNG/hgSroEwB8SciDm8y2OLbDZmGZlFY4e
         KF6MckYh4oJyA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CEDE1CAC703; Sun, 13 Feb 2022 22:07:02 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215561] snd-usb-audio:reset_resume error -22 after suspend
Date:   Sun, 13 Feb 2022 22:07:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: antifermion@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215561-208809-BvDSsfs8Sb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215561-208809@https.bugzilla.kernel.org/>
References: <bug-215561-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215561

--- Comment #7 from antifermion@protonmail.com ---
@Takashi the first bad commit is b96681bd58276e1c7ca4ca37bbaab9f8f1738d61

```
# good: [56d33754481fe0dc7436dc4ee4fbd44b3039361d] Merge tag
'drm-next-2021-11-03' of git://anongit.freedesktop.org/drm/drm
git bisect good 56d33754481fe0dc7436dc4ee4fbd44b3039361d
# bad: [25edbc383b72c2364c7b339245c1c5db84e615e1] Merge tag 'for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma
git bisect bad 25edbc383b72c2364c7b339245c1c5db84e615e1
# good: [86e2d14b6d1a68941b6c0ef39502ec1433b680cb] ASoC: topology: Add head=
er
payload_size verification
git bisect good 86e2d14b6d1a68941b6c0ef39502ec1433b680cb
# good: [dcd68326d29b62f3039e4f4d23d3e38f24d37360] Merge tag
'devicetree-for-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
git bisect good dcd68326d29b62f3039e4f4d23d3e38f24d37360
# good: [840f4ed2d47b525c0bccc10e4aeaf7a4beeffc67] IB/qib: Rebranding of qib
driver to Cornelis Networks
git bisect good 840f4ed2d47b525c0bccc10e4aeaf7a4beeffc67
# bad: [b97053df0f04747c3c1e021ecbe99db675342954] ALSA: usb-audio: fix null
pointer dereference on pointer cs_desc
git bisect bad b97053df0f04747c3c1e021ecbe99db675342954
# good: [6f00d1651b32f7f2951d9f299eb79b03c10186e3] Merge branch 'for-linus'
into for-next
git bisect good 6f00d1651b32f7f2951d9f299eb79b03c10186e3
# bad: [7d843c494a9b69d07bc0588124599e3f665a1496] ALSA: firewire-motu: parse
messages for input parameters in register DSP model
git bisect bad 7d843c494a9b69d07bc0588124599e3f665a1496
# bad: [90b28f3bb85c39b11daf29d473ef21a935c70ec5] ALSA: firewire-motu: add
message parser for meter information in command DSP model
git bisect bad 90b28f3bb85c39b11daf29d473ef21a935c70ec5
# bad: [b96681bd58276e1c7ca4ca37bbaab9f8f1738d61] ALSA: usb-audio: Initiali=
ze
every feature unit once at probe time
git bisect bad b96681bd58276e1c7ca4ca37bbaab9f8f1738d61
# good: [509975c7789f84b4d98e06fe2db51ee4ec02eef5] ALSA: usb-audio: Drop
superfluous error message after disconnection
git bisect good 509975c7789f84b4d98e06fe2db51ee4ec02eef5
# first bad commit: [b96681bd58276e1c7ca4ca37bbaab9f8f1738d61] ALSA: usb-au=
dio:
Initialize every feature unit once at probe time

```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
