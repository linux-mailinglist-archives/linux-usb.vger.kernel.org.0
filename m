Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD82D41B3C4
	for <lists+linux-usb@lfdr.de>; Tue, 28 Sep 2021 18:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbhI1QZn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Sep 2021 12:25:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:57698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241809AbhI1QZn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Sep 2021 12:25:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8A6D261206
        for <linux-usb@vger.kernel.org>; Tue, 28 Sep 2021 16:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632846243;
        bh=mTpK4XC0aDGRZYOWA/zL4zIUbpsst4o2zXkJ5ttMChQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rbkl3un/3/OuhwKQeaKuh4D7d6B3dr9eM/fU9rrA1tUzbkMklsEPCll9UhtoH9sXF
         HI95kyWPA4lqKs6TNkYoWz5eywkzgvQaaR1aRS2rd548M8w1nkj39Cvjzyi0xUnBOm
         9T6phb9SAYk+t3zzUgOAsqSUFHLWdTcwqBmJTnJm+V9ZUUHgJUVdZramcgtnv8AhzO
         xUdQZ2CS7nWON3ubo1YWhooUm/rfWfFQZUO6HU0LJooYkBVie83gkOAwbUI1D8N6YQ
         rTkBmeEEktdnLAto0+aQt0U6GWc4Pp97m5jr06JUr/WsceSVm9OUo878d2wFanqROH
         gva5Y/E8EtewQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 7943A60EB1; Tue, 28 Sep 2021 16:24:03 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Tue, 28 Sep 2021 16:24:03 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214259-208809-fRw4FvCXEk@https.bugzilla.kernel.org/>
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

--- Comment #15 from wse@tuxedocomputers.com ---
For reference: A reddit thread discussing the descrete Asus thunderbolt pcie
card failing in the exact same way:
https://www.reddit.com/r/Thunderbolt/comments/ohjakr/asus_thunderboltex_4_l=
inux_compatability/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
