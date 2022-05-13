Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3DED525C53
	for <lists+linux-usb@lfdr.de>; Fri, 13 May 2022 09:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352114AbiEMH3i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 May 2022 03:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbiEMH3h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 May 2022 03:29:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 542EF2A1531
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 00:29:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AF4F7B820C1
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 07:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B09AC3411A
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 07:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652426973;
        bh=Ul4luKVehnq6jHiGLdRrgEenjgCJfXyxOgciBYTuEHE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=EyKRyi2LDKimmCGahVwjlxC56mGbH6lg7HzwR0CsOGSqVz6XgO9SCPwr8ROovKr97
         F0DRM8EyBpF3P7mGqDFcGsHTu2dUeH6RtiLbbUhm9qscmArZBg1MIEfDX78ag28V/p
         zV4iRGDxbSMcQfFliyqUCdszh1JcWQLIZ8lEKLZE77aMc2YK9TuX84R+baqANLjS0H
         N9RsECuCN/UQfEumUYc8Fyj8UeAJco4FRVwyLiOmWMyfveQinhwgJbCnOxEc/uSNQj
         4U1egQwWM02ODr3DTpOFyVfrwbqclGkS1sUyGfYAI4tajcHXDesCgbwRUZNCxdWKyp
         CsqvmSE+kzDnQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 560CFCC13B2; Fri, 13 May 2022 07:29:33 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Fri, 13 May 2022 07:29:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: xy521521@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214021-208809-OSFhReXYWg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

--- Comment #26 from Hongyu Xie (xy521521@gmail.com) ---


(In reply to Mathias Nyman from comment #24)
> (In reply to Hongyu Xie from comment #23)
>=20
> > Reapplied on linux-next? Haven't seen this on linux-next.
>=20
> As I said earlier, I'd like to get these patches tested and verified by
> someone who can trigger this issue before applying them.
>=20
> Can you help me test them?

It works.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
