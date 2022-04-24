Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7698450D04F
	for <lists+linux-usb@lfdr.de>; Sun, 24 Apr 2022 09:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237617AbiDXHxK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 Apr 2022 03:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236428AbiDXHxJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 Apr 2022 03:53:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF7FF40E5B
        for <linux-usb@vger.kernel.org>; Sun, 24 Apr 2022 00:50:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 70C326130B
        for <linux-usb@vger.kernel.org>; Sun, 24 Apr 2022 07:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC9B9C385AE
        for <linux-usb@vger.kernel.org>; Sun, 24 Apr 2022 07:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650786608;
        bh=V5n5ocAPv6qRWmnAAOKKFUYJ3JNLB884ilWLeQwr6k8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MfQphC2DEnU0aMda3NCyQd7I8mTRUtIDBDnOcg2DJn1AdKQuEiHFPvW99PeqeRpW7
         n/6twfiRnflaMP6wcYGbogvZXpEscC7Xi4E8OKiCW2FWsIgTKZHOCj7gFYM7OIKVcr
         S+HD1i4IIRmT3XTr5g2ghiZkjkM5cmA5Kpa0Z7RXbh8SDSeP4BsxNK64BzYRYgHxXI
         /d9AP60PBC5RZlOCtr9zs4L0/F0u4aoIdHQjKhfCQxAkIjy5RGWCRrLzpP9TQKYXk4
         bnCbBMVDa0ciLvmTIMl39h93Aoes1ib59wkv9ZtbXenaGhfJ7I0z80VrdFVo/L8ApI
         RqydoqbMYuZkw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AD211C05F98; Sun, 24 Apr 2022 07:50:08 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Sun, 24 Apr 2022 07:50:07 +0000
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
Message-ID: <bug-214021-208809-kQdALNkHhR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

--- Comment #22 from Hongyu Xie (xy521521@gmail.com) ---
Hi, everyone.
What's the status on this?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
