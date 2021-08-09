Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A04B73E4221
	for <lists+linux-usb@lfdr.de>; Mon,  9 Aug 2021 11:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234176AbhHIJKG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Aug 2021 05:10:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:58790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234191AbhHIJKF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Aug 2021 05:10:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4274861040
        for <linux-usb@vger.kernel.org>; Mon,  9 Aug 2021 09:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628500185;
        bh=zVGqKIyViRsf4v6KcIShy/gbNm4tzIbI1Ev7uF9HmEo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kj0QPHtI/8mssGaRppc5Y/UOXhLODJaxcNzWMaKjperPzu1qmXHltDrMgNAVl3eNF
         5dn6AV99K5FQ706DKrUY6A4ufEvwGSgXGnPcAk+Ec7oUVGDv+ezMFJgpCepcieI5Hd
         kk+MBHjXiMXrMD7HYUdRlZOO/D3msophVcgLgDSnQE9FtequrNOjlSlWSt4glycxls
         2xcMhjBzvv36BIGIfhBAKbcKsO3HsCXcKRghfj6ddoMuqSDGc/2REJMayiaBhha3sw
         sLWULnIcWT5uZ+VWCHoxwlvIjSwuTXls8NqGAGH9zTfNpUntuyhBxjlzmPO4qj2fwG
         +g8IHja6jc/EA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 3776160FDA; Mon,  9 Aug 2021 09:09:45 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213967] Thinkpad T14 Chicony Webcam not recognized by kernel
Date:   Mon, 09 Aug 2021 09:09:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dev@horatiuion.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213967-208809-koqtPMVHo8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213967-208809@https.bugzilla.kernel.org/>
References: <bug-213967-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213967

--- Comment #4 from Horatiu Ion (dev@horatiuion.com) ---
Resetting my BIOS did fix it. I have only disabled secure boot, the rest is
default settings

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
