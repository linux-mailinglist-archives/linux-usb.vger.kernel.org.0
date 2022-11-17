Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26EFC62D41F
	for <lists+linux-usb@lfdr.de>; Thu, 17 Nov 2022 08:31:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239280AbiKQHbX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Nov 2022 02:31:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233220AbiKQHbW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Nov 2022 02:31:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB4329824
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 23:31:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E96A4B81FA2
        for <linux-usb@vger.kernel.org>; Thu, 17 Nov 2022 07:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99372C43148
        for <linux-usb@vger.kernel.org>; Thu, 17 Nov 2022 07:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668670278;
        bh=snXNkoluSZVVSm1IvZJRXamDEphz5cpjI/bUGrCIj0o=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rVApkfibN5fPpUO/LeCZ1HBy9ccwKdeNWaY8s7qOA1p+Tb0Xrh55DBl2CmqZTa9yx
         PAsMq/KPdnjETU4tCaJ2y7a7RHczaQuq5NUEmv9yKXyNhL/Y3e3ABiNa+sp61MH97E
         zipn3MjURWAFROyyQ1ITZINw+H29VKL9ifJWXL82g7eOYtlXaPGgTO0fLk+nphWYZ6
         jZxlFhblW1uXwZ+vTjFPSXcppLMgO8OU3sgALj1efXkZbP11qiGEojtGFDtM257BdS
         AjnLdbr43YQHcetI8DAkO8l8G13NslJO8xdi5tteXQgxeeyNPJf+VpYzoIrnKaB09p
         B0NyBWuw6mRcg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 88DACC433E7; Thu, 17 Nov 2022 07:31:18 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Thu, 17 Nov 2022 07:31:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: denis@speran.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210425-208809-WPcAWxVnZn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

Dennis (denis@speran.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |denis@speran.info

--- Comment #43 from Dennis (denis@speran.info) ---
I'm not sure if it's okay to report here, but it seems like changes made he=
re
breake resume from suspend on my laptop.=20
Archlinux kernel 6.0.6- resumes fine
Archlinux kernel 6.0.7- hangs on resume, laptop appears to stuck, nothing w=
orks
except GUI displayed but not updated and I get errors saying something like
RIP: 0010:ucsi_resume+0x2a/0x70

Lenovo ThinkBook 13s-IML

If it's inappropriate to report such issue here, could you please guide me =
how
to report, I'm totally new to kernel issue reporting.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
