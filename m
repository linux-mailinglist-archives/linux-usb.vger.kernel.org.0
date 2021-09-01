Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 765023FDD66
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 15:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244508AbhIANqS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 09:46:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:43942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244277AbhIANqR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 09:46:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B9D3060BD3
        for <linux-usb@vger.kernel.org>; Wed,  1 Sep 2021 13:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630503920;
        bh=tcQXRin6lSo+ZIoCsEAvyxE0Q/4Fmn3/VOb3qgsNe0M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=We72uIHqKBWkTPrHcqZgjt/PLaCPms21CIZY/KQnolylZBlTrtYOTNM6Yq5+w6h3W
         eH547OpOjV/NVuapSAv+JDokSkOE0rp0IbuKSTaT5t6G4nXqppItbl4lHjEbmAoLXd
         nWJDk0mR3fM4DRn4dItlpAILS066jlGY2N6XbRiTyuxbvZtdWihLA/J4K9E4ZDASjl
         PcJgY2yT2p6vE3GC+0qPnUlu750k4gaXvIoCEXKMkq8jaPmosp+dyuuescNdDRGkis
         cb0gUhyO1Yo+kID4D2LFDdFSX8hQiTXz4QxRRVSVHMmhBTWQd137k2bzCfMOfjvVXX
         Qh43aQknoVA6w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id B1009610CD; Wed,  1 Sep 2021 13:45:20 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Wed, 01 Sep 2021 13:45:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214259-208809-JkzPdRw09N@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #1 from wse@tuxedocomputers.com ---
Created attachment 298567
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298567&action=3Dedit
dmsg of boot without tb dock connected

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
