Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0680383D05
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 21:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbhEQTQk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 15:16:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:55582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231161AbhEQTQj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 May 2021 15:16:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0CEA4611BD
        for <linux-usb@vger.kernel.org>; Mon, 17 May 2021 19:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621278923;
        bh=mOBazTXSfwJsJCtVNJrHmHOa9exC2vPkcC3DoKgjM/c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NPYuG4bjpxZRcj5ilBVVEkLZRKFEM3vawF0Z8RFSVDLqSI//658a1pmuID53b6lOy
         AZDlrJJpoSGr5s+tKg/QBEL9ZRczVt/yKMSrEM1QqhPxyqyla2oxNF8zQC0UHaee1n
         SQ2AnatZAc3DCzmpsEuuMoBPUXkTWRa6CQZ5tZrnJaAee2F8BvAU9rkrie7llbeJSB
         70B3YxSOdOEeA+fuUnPgRB9aOV/5qE9r9h8IM1cpTYhJGd6LXeBm9XuptaIHfTUVZk
         zk9s0/F5XYsXPAyQHARh74GmTjkkBhpZO9IWWtd4UAliFOETJUpI4sojHhTxDuSgio
         jWncs2K05y2+A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 0085F61176; Mon, 17 May 2021 19:15:22 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Mon, 17 May 2021 19:15:22 +0000
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
Message-ID: <bug-213081-208809-6l9irijhdy@https.bugzilla.kernel.org/>
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

--- Comment #9 from Peter Ganzhorn (peter.ganzhorn@googlemail.com) ---
Created attachment 296815
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296815&action=3Dedit
git bisect log

Well bisecting went quicker than I expected, but I don't think I can come up
with a solution for this myself.
git bisect found commit 674f8438c12125d6b4fe51d44b9316bb02b286b5 xhci: split
handling halted endpoints into two steps as the culprit, but the last two
builds before finding this final commit already refused to boot correctly.
I guess this one is part of a bigger patch series which the bisect process =
cut
in half at some point.
The description of the commit mentions:

    Note: This removes the RESET_EP_QUIRK handling which was added in
    commit ac9d8fe7c6a8 ("USB: xhci: Add quirk for Fresco Logic xHCI
hardware.")

    This quirk was added in 2009 for prototype xHCI hardware meant for
    evaluation purposes only, and should not reach consumers.

Which made me raise an eyebrow. After reading this I am not sure if I may h=
ave
some misbehaving/broken-by-design hardware here.

I'll take the liberty of adding Mathias Nyman who authored the commit I fou=
nd
to be involved in this issue to the CC list.
Hopefully he can shed some light on this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
