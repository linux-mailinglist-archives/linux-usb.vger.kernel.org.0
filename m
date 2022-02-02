Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70A384A704D
	for <lists+linux-usb@lfdr.de>; Wed,  2 Feb 2022 12:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbiBBLuT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Feb 2022 06:50:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbiBBLuS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Feb 2022 06:50:18 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A38F0C061714
        for <linux-usb@vger.kernel.org>; Wed,  2 Feb 2022 03:50:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6D19AB8306A
        for <linux-usb@vger.kernel.org>; Wed,  2 Feb 2022 11:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B375C004E1
        for <linux-usb@vger.kernel.org>; Wed,  2 Feb 2022 11:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643802615;
        bh=LzoCcBKC4vEeup4nBlU764ZL3gJJprot6Pgq8Zq+x60=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GL9mnXBYanZ8sN3x2ieCQCQmyF3SBvefXXl/GQkE7sLg8LGJ570uG9sM7x9tb+A1k
         sFgiQ7SSlC3pZwpRg/WWGGhHUAXYKx0hOdQ/eJlX8wES4H38DNI8cKivNtaCQ9BrcG
         nP5Rj3nKy/LR38jwoU5CjJBoW3KDd8LA/D4zxLL/HB8ww8QjyhV7ZISm0uB5g/A7pe
         3FNzvqqdvN/If47sW4j8HH9CDcXiQUd3It/5jQjcVAfcgT2hyhrXi7LiYm+ETw6zA2
         b5L451/hIOZE/laq/8iIlXs5o5yYBKbKNftj15GIglMRfgiOBmoZACjcONSrNRb0ad
         Mk9N8zm17WFKw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 27DAAC05FD2; Wed,  2 Feb 2022 11:50:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215561] snd-usb-audio:reset_resume error -22 after suspend
Date:   Wed, 02 Feb 2022 11:50:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mark.blakeney@bullet-systems.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215561-208809-aL5gcRLcSI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215561-208809@https.bugzilla.kernel.org/>
References: <bug-215561-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215561

Mark Blakeney (mark.blakeney@bullet-systems.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mark.blakeney@bullet-system
                   |                            |s.net

--- Comment #1 from Mark Blakeney (mark.blakeney@bullet-systems.net) ---
To be explicit, this bug started on Arch at the release of 5.16 and has exi=
sted
in all of 5.16.1, .2, .3, .4, and .5 releases so far. I get this bug every =
time
if I suspend while my dock is plugged in.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
