Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0BAB49DA62
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 07:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236382AbiA0GAO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jan 2022 01:00:14 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:43520 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233578AbiA0GAN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jan 2022 01:00:13 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DA5ADB82036
        for <linux-usb@vger.kernel.org>; Thu, 27 Jan 2022 06:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D545C340E4
        for <linux-usb@vger.kernel.org>; Thu, 27 Jan 2022 06:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643263211;
        bh=M46eHP4wBxQYiKEycza+zg9obpAi+86wPg9N0v6HcDU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DQWjl6H8qsRIX7dp6MBL0dLjt00Iy0wSVF79MGWZb5K+LyR5TLLbAk/pRUZ8OxMWd
         8SG28obLnOVXFJ/9/8eDfxkVVJf2igc9jtCEphUCDeLirzpHUyQ5cWzCQXs6iaF19e
         GBOz66twRhTnb4V0lF7ugCj6Pis0JO3wUO0m/vln5I5g7RBBXha9+D1DmKmbP3bNV8
         1ULFR93bL26s4JOqPmm9IqQ68QoimDnGG5l1YFhO0a62VR5SCAOVM6Bf5tl19LxGEP
         Kk7lfCR/2GqMDSbv4jzGscVfAjBY+5exCLyztYoFlqFF8gRB6G90szdOMQInDY8C27
         Kd8BfNkj1eKRQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 30DA2CC13AA; Thu, 27 Jan 2022 06:00:11 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215361] SL-6000 zaurus USB error - 'bad CDC descriptors'
Date:   Thu, 27 Jan 2022 06:00:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: oliver@neukum.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215361-208809-PIBgBR5rQt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215361-208809@https.bugzilla.kernel.org/>
References: <bug-215361-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215361

Oliver Neukum (oliver@neukum.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |oliver@neukum.org

--- Comment #9 from Oliver Neukum (oliver@neukum.org) ---
The SL-6000 is explicitly listed with the device and vendor IDs given here.
Looks like multiple versions of the same device. Please give the output of
'lsusb -v' for your device.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
