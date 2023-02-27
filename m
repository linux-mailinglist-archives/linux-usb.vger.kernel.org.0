Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0A5D6A4D2F
	for <lists+linux-usb@lfdr.de>; Mon, 27 Feb 2023 22:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjB0V3h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Feb 2023 16:29:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjB0V3g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Feb 2023 16:29:36 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE5851D932
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 13:29:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6467AB80DB8
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 21:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07930C433EF
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 21:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677533373;
        bh=PxQJzlqXfsiqA8LqPY7bljMiw0IAZ6bgntgit7Z6/FY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WPJr6s94pg8UYAG908VCFLoQin+93PjuGUVTOgUFpJEzVkfGI740o5fDdRQoCQDSi
         pta/HGSdiLLE66GWAQqkFrJ3pdTh94MRvfyG4AyEeRFDVqTvtwJjhUASQt4kRz89FU
         uw5QD6gBYYJYH3Pfop+ZpkFo3LU7vprZMg7lPWO/Hx+vCuAHR+ZyritrEfH8ofe5Dr
         xqOSh1Iw3xHoGYXW3dC5HjNopvPpWNrD2miTKzXCNHXTwf+HrFi8q/VGHsOJpxFFmW
         tK4S4NNMc292v1hv/xfZUJ2PQAj1jkRolR022rCxP/zn4bwaib1p1mx3v2qcqcI+uX
         /8z80waun0WNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DD88AC43142; Mon, 27 Feb 2023 21:29:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217088] xone23c mixer
Date:   Mon, 27 Feb 2023 21:29:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kaufmich@valino.info
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217088-208809-XONjrTYlsl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217088-208809@https.bugzilla.kernel.org/>
References: <bug-217088-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217088

valino (kaufmich@valino.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
