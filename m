Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 772A16F4EB4
	for <lists+linux-usb@lfdr.de>; Wed,  3 May 2023 03:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjECB4y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 May 2023 21:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjECB4v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 May 2023 21:56:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C91572700
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 18:56:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 644B262A03
        for <linux-usb@vger.kernel.org>; Wed,  3 May 2023 01:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C44B1C433A0
        for <linux-usb@vger.kernel.org>; Wed,  3 May 2023 01:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683079009;
        bh=T92YyE7RblSTjx9OkRlTlgmYyzFAPRfIc54NTrMXeOU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=awT8i52CtX0/42mw4sHkCRlFy6m74DA082meRxmLNMVVh3L67sVpovd79LwHHW75x
         CT1V2HWPrfptZSwCqQYmHaajwGLEKsOSL4foxAlJE+3p6lJuMAGQVw1JlaiZ6F5/x6
         rZtuIYUaGAqUbPcUlviRzceCNpy6qcnU0ccQgFEFuC5m7Jj0iaPxsjyMn/lOsaPVo7
         66UdtL6CYMeiEepwIsgLymJQ6bNlIMayLoriXnBUGpcJoSnma5ONQb1FYhcX15AAbl
         5sCgnVs/H+4PlBKi87llP+Hmb9KR+XL380fLpMxERbyUHML4eVPolC6CWWT+RUS9KL
         wiwIqB7vtiYNA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AC954C072A6; Wed,  3 May 2023 01:56:49 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Wed, 03 May 2023 01:56:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chris.cope@rode.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-209555-208809-OuGRY6Fo3o@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209555-208809@https.bugzilla.kernel.org/>
References: <bug-209555-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D209555

Chris C (chris.cope@rode.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |chris.cope@rode.com

--- Comment #35 from Chris C (chris.cope@rode.com) ---
Hi,

Just confirming I had the same problem as Yunhao Tian running a fairly vani=
lla
5.10 kernel on RK3308.  Solved for me like above:

Patch:  p->no_clock_gating =3D true; into params.c


Should definitely be considered for upstreaming as a RK3308 platform specif=
ic
param for DWC2.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
