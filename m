Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07C674F86EC
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 20:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345187AbiDGSLc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Apr 2022 14:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232106AbiDGSLa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 14:11:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7130B221B9C
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 11:09:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0F2C861CB3
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 18:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6DA21C385A6
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 18:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649354969;
        bh=ERgVQ3uXqfe7xCVRCuG+FB19LfEJ1WmU9SsCFYRKb0M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ag10zT1ANt00OPKlS05z1Bo45oD0Gop6duz3cqmasOMeiCUDLf/+2zK7m3/I+uQdv
         8tp/FkzLVAiM2BQiNhQIv10Kd/CEnuFwvxHPHsfrWeHoOwZEAwqNv6RPjIOTgwf4Qc
         bHg7N0MLLbWkHe39O+349jMICLt7hFJT4+sJGLYPZr1Q83rgvtO85jr5qJ/BvShr6g
         PdL7qfx/KA4Lkc/dFYZIxMC9HiHP1doZaYrkyh14xnkK9AthMo439uhmPs36xApuvY
         RdafkilMCMkaZD2aHMFwnybDf4TA4/U2+Cf4FDJXWTsXMbUNDlZP2t5CIWtH3Uv0jz
         UKf2DPNcHIf6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 506A5C05FF5; Thu,  7 Apr 2022 18:09:29 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215799] apple-mfi-fastcharge causes automatic pm hibernation
 entry, when iPhone gets attached
Date:   Thu, 07 Apr 2022 18:09:29 +0000
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
Message-ID: <bug-215799-208809-mlfBADLfjc@https.bugzilla.kernel.org/>
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

--- Comment #8 from Manuel Ullmann (labre@posteo.de) ---
(In reply to Bastien Nocera from comment #7)
> I replied about the problem on the linux-usb list and in
> https://github.com/rickysarraf/laptop-mode-tools/issues/183
>=20
> This is most certainly a bug in the script, not a problem with the driver.

I tend to agree. But the remaining question is still, whether the driver sh=
ould
report the power_supply as battery, since it is not reporting any battery
stats. It just allows to change the charging type (Fast|Trickle). This migh=
t be
unexpected in other areas of userspace, so it might be reasonable to change=
 it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
