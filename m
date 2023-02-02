Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5B1F6878D9
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 10:31:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbjBBJb0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 04:31:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231889AbjBBJbX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 04:31:23 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FA859E6F
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 01:31:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AE48161A44
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 09:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 222E7C433A0
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 09:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675330282;
        bh=XcI0tNjTKlV5n3zqqhzHszL7QjcYEGqs6MBsKIj1lEw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ZaqzFBqP24sll9rrFPAIfV22Ds7BFSvgQm2K/5RmTEJMev4KS2zZ65TVNf4QagCds
         KeJHBzLngT0+hBOiJBH/3GMe2idrB2zmdbErRZsgxKRLjym9cc4x3szDUJbUXAoCiB
         UG5Ar8SpQqACdOxuBncvzZfD+VxvqCMZuRS6ceVmrXgwn8aTnliIlGpuVn4zmE/byu
         NK6wXfM1fg0CDOiISiBOO4x3ghPcK/wYslfBwREVCy72CFZQlznyjKgJH6DTqj7e9m
         kwX1yjpaY8Y9jZcXeAmfMc2X43FjtmM9c690LQQBToansr/PNeIQ5pVBr4LYBx/RLR
         t3DCU7AogAWBA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 11AF3C43143; Thu,  2 Feb 2023 09:31:22 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216697] Resume from suspend stopped working
Date:   Thu, 02 Feb 2023 09:31:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: oliver@diereehs.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216697-208809-l4LJq4ShNl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216697-208809@https.bugzilla.kernel.org/>
References: <bug-216697-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216697

--- Comment #18 from Oliver Reeh (oliver@diereehs.de) ---
That explains it ... I thought commit 3d7f77e55da3455c8844b651e37779c90e201=
f48
included this fix.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
