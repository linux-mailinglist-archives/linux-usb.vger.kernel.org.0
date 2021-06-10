Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6723A29E6
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 13:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbhFJLLs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 07:11:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:58414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229961AbhFJLLr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Jun 2021 07:11:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DB290613F5
        for <linux-usb@vger.kernel.org>; Thu, 10 Jun 2021 11:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623323391;
        bh=D9vaJEqcHCEhbIZqduY4HJC14uLuGGSv7gPGwsidbMc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ezaIbNLnJ1VkqVioQ/64vNT9qiRcwzFtmJ69zaeizO+8MuJBg6vNQIU364rzLIuSZ
         VzqaWqnyj9k6f+N7Gj5dTYpxdi+7ovlB7kXikZMaLMH7lAvMKZ0SEGH7cyVktOGbAm
         tB3KLSaON7w7FN/dQkdbEBmg6PNxgg0+wnOpuGV2MusbxPUy4DeYFEsXcQ0IhyTAZj
         QTU0FwbxvnKeMG6Zecdi2HRP23Q8A8lg89NrQ/cLngApTNF7mswf/yQwHnOzqDQnxj
         RGTfAnMEgCk7KpJHEVYcMTq3pGSN5ri69vGGkQx1A/ZiS7K6CgsuWI2PmPDhJdCkzJ
         LBDwHOS9QVDbA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id C89256113E; Thu, 10 Jun 2021 11:09:51 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212751] acm_port_activate - usb_submit_urb(ctrl irq) failed
 after kernel update
Date:   Thu, 10 Jun 2021 11:09:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m.mroz@wb.com.pl
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212751-208809-nXtoE3cVWS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212751-208809@https.bugzilla.kernel.org/>
References: <bug-212751-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212751

Mateusz (m.mroz@wb.com.pl) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |m.mroz@wb.com.pl

--- Comment #4 from Mateusz (m.mroz@wb.com.pl) ---
Found the same issue on ubuntu 18.04 : 4.15.0-144.
It started to work properly when tried running at 4.15.0-143.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
