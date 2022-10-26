Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C472A60DCB5
	for <lists+linux-usb@lfdr.de>; Wed, 26 Oct 2022 10:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232731AbiJZIEh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Oct 2022 04:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiJZIEf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Oct 2022 04:04:35 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C439112ADA
        for <linux-usb@vger.kernel.org>; Wed, 26 Oct 2022 01:04:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2FCF8B82140
        for <linux-usb@vger.kernel.org>; Wed, 26 Oct 2022 08:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0A74C43145
        for <linux-usb@vger.kernel.org>; Wed, 26 Oct 2022 08:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666771470;
        bh=/i0g/T0iFQRc0+WDqfU1j9ncPJQW34K7l1H6jJfIAZw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kTJzfXZPMEknVLuzDnpdxPjF/r9/CZyT+KgQATHbSzib5/GqYqOjlxvQehCYdit92
         vFHDmpM0+xIuqBgZyjCOJwduA9IUp3u6OloFldEIQ0nAno8ImD2A0j3c0vsoWg/TV8
         stskS1tBgED50pgw4gJl9R+eGt7Q+Wt5m/Xu8Ee+xw05r+5829cXkn3SbnIJ+mGgec
         QVKlZlbEWFwKYJvfvOiAujdoz39V6PG01mGUGSZsNucs10DE4H6nwnyfDmkVZIIbKV
         ZqAe6PQALRPkSqdjXnGFd6ycHC6cVeigREszLKySVI6rF8SLhgVdqRgBJhrWWy234t
         F3Vne+B6ordAQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C1459C433E4; Wed, 26 Oct 2022 08:04:30 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Wed, 26 Oct 2022 08:04:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andrew.co@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-epK8JgPxE1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #39 from Adrien (andrew.co@free.fr) ---
@heikki Today i have installed 5.19.17 kernel (btw it appears to be the last
5.19.X kernel) I have saw that you made a fix regarding usci but the issue =
is
still present on my machine. So I don't know if this fix was referring to t=
his
specific issue, please let me know :)
thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
