Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F05C782482
	for <lists+linux-usb@lfdr.de>; Mon, 21 Aug 2023 09:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbjHUHho (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Aug 2023 03:37:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232943AbjHUHhn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Aug 2023 03:37:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 307BBB6
        for <linux-usb@vger.kernel.org>; Mon, 21 Aug 2023 00:37:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B0CF861157
        for <linux-usb@vger.kernel.org>; Mon, 21 Aug 2023 07:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C67CBC433C8
        for <linux-usb@vger.kernel.org>; Mon, 21 Aug 2023 07:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692603458;
        bh=eNzRcWe/fxlJmAm745TrqTvSdyixYgJtqew/I70vyvU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NcjxYXPWJ0F/ocrq/H533OGj74XG+RVmEMzXRCb30+r5Z74DxiQhkwADaNPQhVHiG
         u7eSpmuf0r76YWSt7uTh0Z5/Xm2Ts+vvAukmwegUuZDi+wN5XWeVBymkSoF2GAKpJq
         GhmMs2MmHJDg0uf1LEdQNe8XxXQeWrf37tpwdWQo5/ndkOv22xCi7Bnv9fj4jNOpe4
         nBFtxd5wD9OqVyzC/xQnOBO4Iila5Qeb2/Kuh8SBvwO0ijaSCNsuHC+N0rx9lbNnk6
         L/y5BLLTf2tU1Qb0QuKkRyia2nGx46on/4lTl3nJWsJ8zaqoJmIx3wKXboE1kAJs+O
         PiGe82z17PDnQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AEB85C53BC6; Mon, 21 Aug 2023 07:37:38 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217811] usbhid driver misses right-click event for Rapoo
 wireless mouse
Date:   Mon, 21 Aug 2023 07:37:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bagasdotme@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217811-208809-EDPAnYDNmn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217811-208809@https.bugzilla.kernel.org/>
References: <bug-217811-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217811

Bagas Sanjaya (bagasdotme@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bagasdotme@gmail.com

--- Comment #1 from Bagas Sanjaya (bagasdotme@gmail.com) ---
(In reply to Michal Byrecki from comment #0)
> Driver improperly creates event for wireless mouse (missing right click
> event). The driver is only recognizing the left and mid-clicks, but remai=
ns
> dead calm on the right one. The mouse itself is ok.
>=20
> Linux crystal 5.13.0zeta #9 SMP Wed Jan 25 15:49:37 CET 2023 x86_64 GNU/L=
inux
>=20
> Below is the output I've got using evtester. I've clicked consecutively
> left, mid and right buttons of the mouse. The first two clicks generated
> events,while the right one does not.
>=20

Can you reproduce this issue on latest mainline (currently v6.5-rc7?)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
