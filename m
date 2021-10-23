Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2565A4385F2
	for <lists+linux-usb@lfdr.de>; Sun, 24 Oct 2021 01:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbhJWXvk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Oct 2021 19:51:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:36162 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231331AbhJWXvj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 Oct 2021 19:51:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E27FD60560
        for <linux-usb@vger.kernel.org>; Sat, 23 Oct 2021 23:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635032959;
        bh=6IBauWbEQdxNBxJelyYVk8hJ9ub5zwk2pFgA02Cp39U=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=A6U9Qx41WYrk6L+Rc5KAqZdw9KurcCQ5i7e4WF7VM5VKWiaTgJ0hHc3kecJhfbs4e
         78rFa20cQkw1E0AmSPRzBTnqKSivEGbNScua/pq2CYsmBYATNT00QpXQIoh6PoKu6M
         ipvKkx44Apxk8yiPJKR71iI0wnBiITZ4s+76f2s5VLSjl6QWZD/QhImITUk8PN0sZI
         C3ME2OmK3+NiVryCBqsFOswfde9cBYCGF22maGbnR8K+pcMTE+unkwgU5CrHQJEBvr
         WWWWprxCA3eOIlrtM97zDlkLQRB6yhHOAkJeJX0OCp7zBPFzPiIaLK9cSN1KkLCnIM
         AOXwHeI7ucOwA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id D752C60F4D; Sat, 23 Oct 2021 23:49:19 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214797] ehci-pci: unable to enumerate Sony NW-WS623 Device
Date:   Sat, 23 Oct 2021 23:49:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: Stefan.Lauterwasser@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214797-208809-yamEr80EED@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214797-208809@https.bugzilla.kernel.org/>
References: <bug-214797-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214797

Stefan.Lauterwasser@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
