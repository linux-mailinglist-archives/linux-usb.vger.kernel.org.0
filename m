Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB013FBD48
	for <lists+linux-usb@lfdr.de>; Mon, 30 Aug 2021 22:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234602AbhH3UJa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Aug 2021 16:09:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:49462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234204AbhH3UJa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Aug 2021 16:09:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4CDE660F8F
        for <linux-usb@vger.kernel.org>; Mon, 30 Aug 2021 20:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630354116;
        bh=MqJxA6bnz84SSl6/w9u923BKrOe6IYIBeLWlC/xG1b8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lDQFDmW+J2OkQDFrt1sSy7QK7KXA8TuyKnnfHfgG5wn9rEzLgAhMMbMO2cS8S+DY4
         skYKVF6WX4xumGK7sAdPoNSbycOF2WrPrjuNaouYOuSNsBJCh70MJUCAg4/p3O8oBu
         8U6ED5WCofURy1AfPP5pLHk+/dFEL9z+FS279yhXXqJyqVOfBNQGlJKJB1omSJ1x3V
         FQ/Mag/E6CUZl6EsgBIgIp283Getc4l4M/0IMjm45BHRWDsNV5r04Uz8P6qAO/JePE
         YBB0lNtnrtKLC+ESn8RVEM6kK8xBAJW9LPgrYzCr9tyHKGNG8+0q2fsrvcW98lyvgo
         gL9WrcJd4p3LQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 3AB7E60F55; Mon, 30 Aug 2021 20:08:36 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214173] Built-in Renesas uPD720202 fails to initialize on
 Thinkpad T14 Gen 1 AMD
Date:   Mon, 30 Aug 2021 20:08:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: milan.plzik@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214173-208809-itlLVlR16o@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214173-208809@https.bugzilla.kernel.org/>
References: <bug-214173-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214173

Milan Plzik (milan.plzik@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
