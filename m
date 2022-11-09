Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81904622AA4
	for <lists+linux-usb@lfdr.de>; Wed,  9 Nov 2022 12:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbiKILfb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Nov 2022 06:35:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiKILf3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Nov 2022 06:35:29 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B6EF240A1
        for <linux-usb@vger.kernel.org>; Wed,  9 Nov 2022 03:35:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA881619F7
        for <linux-usb@vger.kernel.org>; Wed,  9 Nov 2022 11:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42F3AC433B5
        for <linux-usb@vger.kernel.org>; Wed,  9 Nov 2022 11:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667993728;
        bh=G1ypX80PCVTv5809hCPKH0XxIGGo6luBYfDKIl1ELfk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ZGUm/CIe10y+Yzt8ewgpaBEZ7GKblQ5Va1pYWBSF0DvLjsUffqfieRCQoMB4Zzfn1
         P50/j2Ji6I5oVR0aE+fC6D7RfPkzNxBO/3CNxKbwHj2JVWNy0/leSjuzWwsex5uKha
         W/ORcRkenwVbIqltCMIezjqfx0oxQ0mSoxGwJvh+vPP7q/bqOjd7XUXLkhM8J76L9n
         46+rJCu+hrWCJZt0SF8O/zsu2nkAfkYVe06kvqLcZBTDPVDDFpKPtqxhqlXrzPALL0
         /5zU4Lj1hqXerVOZt+aeDkzurS7gPWTu709j97Uo200b+4EcwGnzUC400owDVTwpXm
         11F3y0vh/xKvg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 15EC4C433E6; Wed,  9 Nov 2022 11:35:28 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216630] config 1 has an invalid interface number: 2 but max is
 1
Date:   Wed, 09 Nov 2022 11:35:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216630-208809-lVOxrYbgdm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216630-208809@https.bugzilla.kernel.org/>
References: <bug-216630-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216630

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
