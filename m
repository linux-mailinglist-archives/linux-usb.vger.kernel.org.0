Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11CF66EE401
	for <lists+linux-usb@lfdr.de>; Tue, 25 Apr 2023 16:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233838AbjDYOfU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Apr 2023 10:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbjDYOfT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Apr 2023 10:35:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA1724EDF
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 07:35:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 645C062838
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 14:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE944C433D2
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 14:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682433317;
        bh=PIRB5jelS+H9Gky47eR6FKu5ulGB3VIka33+wV/h35c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bNqgChmsJvyde7jvZFuPt26bFN6WxfpRx6tMN+FRT65JaZ0pZISJ6EYMVeggvLA+D
         t+kHxsXFYFFvMv9kNxvYF+tZsgEnB1qgpMgS2KDZd9v6yRp8rmDTI4GnJxixA8VqQ3
         QMRFP2UQJ2FsWle3V+rZ5rXJaeGFIOMdI+gGBs704LxYcBRShLG8cm83OddK+yQyso
         fDR4ao/EvHwZJM0ww59X+rpyNpcRfyGBtkdnzHgnbRGAeUleQ3IZCSjbWwH9yHb6QO
         Q6FNnUGYNj9SEuwkmpA0Hg6bjQ/1K4MayDWwDYa/EvCbwHYJ+h+zu59szPmZZ3rXcY
         PTmXH0uZu5S4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A8D2CC43143; Tue, 25 Apr 2023 14:35:17 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Tue, 25 Apr 2023 14:35:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: miller.hunterc@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217242-208809-qibXpcuJRR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #29 from Hunter M (miller.hunterc@gmail.com) ---
12 computers have been running since 04-19-2023 with no CPU lockups using t=
he
patches. TRB values constant at 512.=20
The only thing I have seen on 2 of the computers is a warning log for the
following:

Apr 21 07:47:37 myuser kernel: xhci_hid 0000:00:14.0: WARN Set TR Deq Ptr c=
md
failed due to incorrect slot or ep state.

However, no functionality has been lost and computers are running fine with
serial communication occurring as normal.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
