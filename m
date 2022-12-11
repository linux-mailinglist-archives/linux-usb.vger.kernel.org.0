Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B52976493A4
	for <lists+linux-usb@lfdr.de>; Sun, 11 Dec 2022 11:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiLKKgr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 11 Dec 2022 05:36:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiLKKgq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 11 Dec 2022 05:36:46 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE68E082
        for <linux-usb@vger.kernel.org>; Sun, 11 Dec 2022 02:36:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4DE8D60DC6
        for <linux-usb@vger.kernel.org>; Sun, 11 Dec 2022 10:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2C25C433F1
        for <linux-usb@vger.kernel.org>; Sun, 11 Dec 2022 10:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670755004;
        bh=ayfAAmuihRXE/hXSQQj01cp1HnI81nL6cL0sb9Zav+M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=iSN80FMa8Qo/yypKUt0LeWdoqmwOMS0tRPxHQaJVHpoPIzV5dL6v+bj1SXnEtSF29
         zkK2TzWUwlAsZoKnGqaYu2NeOP865uovAO8hSFvJMGTBxyAcjZoA/TW/V9o+4zSXIk
         07AFyPmhY295mTpsPHcFdxPMVhkB8mAsXrfr+wO9VfXqBPHSTuTv3+DgWcIy9zr4x7
         Y3yw9hpT7prLorM9Qn3mXbYRHN2R7M+guenLFMCu3ZRU0S3nHdcO4GpEq3vDpxu6sC
         VeKVdiagboTcIWvbnQO35oHoAUYvukSAMqHcUY2db/bnJnH48R8uOoZtXDSlaDRLAy
         wySPazrKmI0Mg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 99721C43141; Sun, 11 Dec 2022 10:36:44 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216697] Resume from suspend stopped working
Date:   Sun, 11 Dec 2022 10:36:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: speranskiy@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216697-208809-GrfxP6qD2H@https.bugzilla.kernel.org/>
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

--- Comment #8 from Denis (speranskiy@gmx.com) ---
I would love to try, but I'm afraid I'm not experienced enough to build the
kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
