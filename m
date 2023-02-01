Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E639468607E
	for <lists+linux-usb@lfdr.de>; Wed,  1 Feb 2023 08:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbjBAHVM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Feb 2023 02:21:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbjBAHVL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Feb 2023 02:21:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9FC747423
        for <linux-usb@vger.kernel.org>; Tue, 31 Jan 2023 23:21:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 560516134A
        for <linux-usb@vger.kernel.org>; Wed,  1 Feb 2023 07:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BED44C4339B
        for <linux-usb@vger.kernel.org>; Wed,  1 Feb 2023 07:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675236069;
        bh=jryhnDC9UVVr+HxwIwlUCg666xCGSVW8haojo6T+0MA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oiN5crFst/LgivQHMJnC/zPaekzy7WETKpPYAiGpw8g7fXP9zAkaUp4BDVqlpXwSM
         jyJSjJm6mDzKksOBWWCwkjF/CCVbwuM/v//zaoPlnh/z4VcZsFt5j755qAY9ujP6rM
         oTR0YSMHL2Q0P+e6QeZO2l+vcpa7+Kr5Iv6i1n4ZsZip6bQ0nmf0OWskR3DFxaJtwa
         kPrwWi3f+tI0wyUthBDJvGS+arcwJmfRgknKbjLynzSnq729VqheZkBpdCas9lSxjV
         89sLo7nD8munsY3ILViNnmBxgfC6Qq2AWZ2AcBIcn1aXElrallDiROC7BSksLBSa5p
         eZRneOzCUg4ow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AB5CEC43145; Wed,  1 Feb 2023 07:21:09 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Wed, 01 Feb 2023 07:21:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: Liang.Xiao1@dell.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-QirKxPoRfg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #24 from Liang.Xiao1@dell.com ---
Hi Dear Sender,
I'm on leave today without email access, please expect my delay response.

Sorry for inconvinence.

Thanks
/Liang

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
