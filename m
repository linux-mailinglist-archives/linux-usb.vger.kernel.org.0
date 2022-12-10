Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC4C4648E47
	for <lists+linux-usb@lfdr.de>; Sat, 10 Dec 2022 11:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbiLJK7y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Dec 2022 05:59:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbiLJK7t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 10 Dec 2022 05:59:49 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B86B91CFC9
        for <linux-usb@vger.kernel.org>; Sat, 10 Dec 2022 02:59:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3C65DB827DF
        for <linux-usb@vger.kernel.org>; Sat, 10 Dec 2022 10:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D84A9C433F1
        for <linux-usb@vger.kernel.org>; Sat, 10 Dec 2022 10:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670669982;
        bh=rxZmzn4Rd3JucAmUWzCzqtKU+YiA0zPbXM55oBO4GAs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gX6dLec7G8sFtPMMXcHjOHIzZNwoQmXaYf8TzFYy5+2l2dx28RuBZBvQC3+sw3Amx
         eeeXHVhIVIeMFQ7tFPhlB3lJQqMQZOg4YhSiEJ5yz4ftrE1ZpEvY8USWJbd9+LF9bQ
         yb8oD6ehaEEEvI0FDO/bM2MVayBy0EUFE7lZlnm2+bX/wF4n4IxuO3g++Pi5X9E41j
         PdLPuefMYh+ShQ3jtRUPgmEy1sHAszWH/I94dNZ+UjFRY9OGFejF0+EiiDKdJPbNlC
         yoyNJ+RlZJoF2g7SgiJk42R4jCaka386otuiWalIn1EdP3/VWK2RcV5/xawg21f1ww
         E1PKutJWUSCrw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BD5CAC004D5; Sat, 10 Dec 2022 10:59:42 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216697] Resume from suspend stopped working
Date:   Sat, 10 Dec 2022 10:59:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216697-208809-HRLSk4TlNL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216697-208809@https.bugzilla.kernel.org/>
References: <bug-216697-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216697

--- Comment #7 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
(In reply to Heikki Krogerus from comment #6)
> There is a fix for bug 216706, but it hasn't made it into the mainline nor
> the stable kernels yet. Can somebody test that fix separately, if it helps
> with this bug as well?
> https://bugzilla.kernel.org/attachment.cgi?id=3D303247

Denis, Roman, did you try?

Heikki, just btw, there was another issue (bug 216788) where that patch hel=
ped.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
