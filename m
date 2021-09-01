Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1CA3FDD72
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 15:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244688AbhIANtz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 09:49:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:44754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240837AbhIANty (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 09:49:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 73AA76101A
        for <linux-usb@vger.kernel.org>; Wed,  1 Sep 2021 13:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630504137;
        bh=81bo7SRTFW3H5Kuucp3n9RMwrU8N/MkehvpSVP+Kqik=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IWzvkuocZKqVBECNZWVre1jAcvriW844Ij4BKBME3RSbi46RF5Xpovom3WvjzmD50
         ZunWn1r3dfow4FNsFqhf6Wn0+q2aJHe7OuQ7xQqVdJawieydlRrhJPr/P8zReSI6F/
         ML5hEMUoRkDxji23yTC3qfMT/7S57lJvR1GMUvUXqm497T2G+eDoDhiRZIVyDlpqO5
         omURlpkc85A4+eQx+IDsWmPpvWwi3Nf/FhbaBQ50K4jMDXoYYD4qSSScVaCtDRELDT
         7TXydnmidvA5hCY0/z0jxwdmA/4UI4ehHq+bHmm6vq71f+4m56iHR4kqXCnwBfKLzF
         ot4ckq6dYxExg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 708A3610CD; Wed,  1 Sep 2021 13:48:57 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Wed, 01 Sep 2021 13:48:57 +0000
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
Message-ID: <bug-214259-208809-fHliVSmVqA@https.bugzilla.kernel.org/>
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

--- Comment #6 from wse@tuxedocomputers.com ---
Created attachment 298577
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298577&action=3Dedit
lspci of boot with tb dock connected

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
