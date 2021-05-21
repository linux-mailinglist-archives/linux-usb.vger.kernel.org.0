Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0DE38CB55
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 18:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237638AbhEUQ4B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 12:56:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:41888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236297AbhEUQz7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 May 2021 12:55:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8D3E461073
        for <linux-usb@vger.kernel.org>; Fri, 21 May 2021 16:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621616076;
        bh=98KPaW2HkbJLhHd3or9bg7Do1zrbsL/8VRMkguRZt0o=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dyQrcWUTYid7Cylp/pKXRN6K/p+UqpFBnhtEuXMerW7BnGNDraaiV9bNF5P3vAkOs
         j/9UaIqPwnllfkbwfxevS2O/uJMu6Dv9l2VrAa9XVAgnu+oaJ+Egj5WGqOfZD8DLD+
         8+X9u/OKlnBSsNsEhn+Y+2J2guvHztS5/SPTOLMiSp1zSiIxQBrNi4THproA4OCJvS
         iln6Z33uw2lqcaTrCpMnek3Sbc9D1YqxG2PXjvFFzCjsIIGrxPHaoca414bLwD7qNY
         JyOGApRC/MYGyVSncoG8KNUBRZtcnGVDVjWWST10pzYKc/ia2MdtbLhrFw3WWcISxm
         32StSVOy+kvRg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 7D3636129C; Fri, 21 May 2021 16:54:36 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Fri, 21 May 2021 16:54:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: peter.ganzhorn@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213081-208809-xO21fmzTIp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213081-208809@https.bugzilla.kernel.org/>
References: <bug-213081-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213081

--- Comment #27 from Peter Ganzhorn (peter.ganzhorn@googlemail.com) ---
Created attachment 296915
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296915&action=3Dedit
dmesg 5.12.5 + both patches

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
