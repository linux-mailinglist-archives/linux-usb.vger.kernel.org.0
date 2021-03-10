Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0FC3339BC
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 11:14:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbhCJKNz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 05:13:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:39394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229657AbhCJKNq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Mar 2021 05:13:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 493C564FE4
        for <linux-usb@vger.kernel.org>; Wed, 10 Mar 2021 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615371226;
        bh=3MkERiO8jtnZmb65WoyVtYGOVCg/VUnz5HCc7XFB63M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Gpl+333CHPmH5pc5u1kvLfMi2q4RNTFPQNefvB4LNkFQ8wuc3sX2dQV/tUqNu96NG
         qx+2hyH4ZdApEgGUv+9ByrqNtd36Vw954R9bCYYelSk0JLlaTptrOunmn+b8eqRNNx
         kr5HsgUtAo8mCTNQFpzP/LV4kV0jLuNlAzW9++yZxJdi9m40TdAL7eO1WnjkrWShva
         4abgOW5p7OUVZ3AlMliYLTtATYNJ7r5+ttmJ9OrKDINJHB4mqx6lUoKD4WjPNxl9Tn
         6haCQEnXsyfoNKslyfwgax2TUddyocUWkBuSn3VKBp9r5CZB6zSLpRX9b4suXk9pvD
         2LhEx9vfQW/9A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 2E2896537D; Wed, 10 Mar 2021 10:13:46 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212045] dwc2 gadget mode read call blocks
Date:   Wed, 10 Mar 2021 10:13:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tomasz@grobelny.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212045-208809-x3O4RcHOM2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212045-208809@https.bugzilla.kernel.org/>
References: <bug-212045-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212045

--- Comment #7 from Tomasz Grobelny (tomasz@grobelny.net) ---
What do you mean by "function driver"? The userspace code that actually ope=
ns
the ep0/ep1/ep2 files exposed by functionfs? It works correctly for other
hosts.

I don't have any more data to argue it is dwc2, but still seems like an iss=
ue
in kernel USB subsystem.

Another question that might help debugging it: is it the host that should o=
pen
the ep2 endpoint? In other words: is it the host that is directly responsib=
le
for lack of any mention of ep2 in dmesg output after the device was
reinitialized?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
