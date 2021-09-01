Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E28D03FE149
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 19:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345727AbhIARk6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 13:40:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:39914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345345AbhIARk5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 13:40:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E143C60FDC
        for <linux-usb@vger.kernel.org>; Wed,  1 Sep 2021 17:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630518000;
        bh=18juGvIa5IxNlMnm/+ho1nzEhXURvYiKcQcFVfCVmU4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DXsmetSbK/shKYokdA6s4uwrMDgC5ewqhWHNG5VZoQf3rH7LoK5i1r9V2uQVKh2lR
         hFKywHji6tFBsdRhDR0/8H7AXS1M5WXQC/A0GEuWzg2qPrv2PZHnrPfmkotosYVwCP
         ApPbYshX8E7qUb4odIa/ha8urkNurhpttrV7TPTroynwElzUATp8dNbREXjn16mrM1
         +faVG1347TH9Fk2m1G8jmuWRaXRlv5Bjoh15iRrOgZYQ2jKS5NMyrmMy+co0huz0cy
         zs+sKrlrrzFVWwDyJeeIsGghQQpL/DTCDZIewhI2pelsXYO4Jn7E4izvKMad3BUQgn
         5rGyNfI1uUnQg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id D574B610CD; Wed,  1 Sep 2021 17:40:00 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Wed, 01 Sep 2021 17:40:00 +0000
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
Message-ID: <bug-214259-208809-4PeyyY5lwC@https.bugzilla.kernel.org/>
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

--- Comment #14 from wse@tuxedocomputers.com ---
New info: The intel_iommu=3Doff boot flag makes the DMAR errors go away. Ho=
wever
xhci errors stay and the USB ports of the dock are still disfunctional.
So they are seperate issues after all.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
