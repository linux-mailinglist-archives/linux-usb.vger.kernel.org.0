Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D32C4588FD
	for <lists+linux-usb@lfdr.de>; Mon, 22 Nov 2021 06:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbhKVFgq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Nov 2021 00:36:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:36874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229994AbhKVFgp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Nov 2021 00:36:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 9B9CC6056B
        for <linux-usb@vger.kernel.org>; Mon, 22 Nov 2021 05:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637559219;
        bh=zzMUmkoh0Yj7mcPd516+jBEwrhIfEzNUTyrb7Mhl6QY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fIHIlf40BVCqsV2aDPsvT3xvXReQpbClqWMh+oAk+yir5y5XBm7PqEzxjBYsXZsG6
         EE13IxFLHmqtngVoRuYMGST1HzIpMRO+6qq6OJ9PoL/1AZJBp7SM6rlmnUaUbSPBl/
         geBizKZBe4nitVZ+nDPUViil85uSoWHrMfHW0EReg2qThAF8opGQV8hgJ8erMcOMaA
         0vaqf2TTAskgkZISpPq6XRv6p1/Gswkv/f/SwUvH8rfbnSTxsWhb7haDifLNKtyVlm
         qYkc58ouCM8Vtc/YVB1ANwD6SiwYWvAT+0iVJmVuy/W13ot/8x6to6+NYGKn9s5tze
         GXe/WW9H/XFmw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 87EB660F51; Mon, 22 Nov 2021 05:33:39 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215095] USB ehci error -110 and soft lockup on kernel 5.15.4 as
 kvm guest
Date:   Mon, 22 Nov 2021 05:33:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wangyugui@e16-tech.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215095-208809-aprOMWZaO8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215095-208809@https.bugzilla.kernel.org/>
References: <bug-215095-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215095

--- Comment #2 from wangyugui@e16-tech.com (wangyugui@e16-tech.com) ---
more test show that this issue is not fully walked around by revert
90d28fb53d4a(usb: core: reduce power-on-good delay time of root hub).

still some chance(>20%) to happen.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
