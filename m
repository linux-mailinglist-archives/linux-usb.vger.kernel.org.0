Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C09BC6DF41E
	for <lists+linux-usb@lfdr.de>; Wed, 12 Apr 2023 13:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbjDLLq6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Apr 2023 07:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbjDLLq4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Apr 2023 07:46:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 201035599
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 04:46:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B00B462AAF
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 11:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 147D6C4339B
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 11:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681300002;
        bh=WN2eTyv1n+BLE5vfejTOhwbMiTnoAkbwM3mWH2k8Erw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fWp3cOT0PcAkhpZurURD/b2KLYcpbT99KageJlggmhnyLsulXOPR8NRdxQBoB1JGi
         huUIH72stib67J6+vi6/RGmMRRZY527bOuW/NcE2KtBvLGpD6nYM67QUOt1CfYczUV
         pDOjBsvSAjfDNKAvfE3DK7zU5Xk00i7ezNZ9xPrAUi6ui5/OLOhyGhslwYwbMo3Kgw
         NG9s7Yy8jsResvwBQ2KqOAR6MAo00XjBeWXQLX8fFNJ+re8SObDM9iHwWx9N/li1pc
         YnrvmKMbqlS5+X3U86NuGd0wLnBSoEQglhmtIwwhsAB6pqp0CKARBs2FnwmYWx9EPZ
         mRufVl+8tdeQA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id F1A6EC43142; Wed, 12 Apr 2023 11:46:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217314] Mackie Profx12v3 not working, showing unable to find
 clock source
Date:   Wed, 12 Apr 2023 11:46:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217314-208809-0dRf8Yvbod@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217314-208809@https.bugzilla.kernel.org/>
References: <bug-217314-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217314

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #2 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
did this work correctly on earlier kernel versions? if so: which was the la=
test
where things worked?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
