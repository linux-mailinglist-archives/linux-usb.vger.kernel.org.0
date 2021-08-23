Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D8E3F4C12
	for <lists+linux-usb@lfdr.de>; Mon, 23 Aug 2021 16:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbhHWOHM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Aug 2021 10:07:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:33702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229518AbhHWOHM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Aug 2021 10:07:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9DBF161206
        for <linux-usb@vger.kernel.org>; Mon, 23 Aug 2021 14:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629727589;
        bh=sJrlZ1rF+sPCVLShFOccSEq4HTmZlJqZ+aYO05cGrp0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Ke1DMn1cilhkkLNV1sOmFSWmzBAetawDzO4DYMajS7EWdlDXAFkA02l4le4Um1Uyr
         PpuRr+HWZWdF1uBIQIEagvSELwLNpDRlPC1PnJ5iH0r0SJi7iHzfVkwCkIK8Vy78NR
         3zlULC+Io5wtqwNt3yUQonIjfzjbo7RxP+I4nWANLIv7Y/nz/7o21UDaPUYgoGd7/I
         hsLkrKN9sV8W2RL/wCQR9f68Z8esAcVd5bTWWCc0TQuAclAy7VgAXXHiQHXPcTvMnl
         r84T0xCN7GeQbqO9IjUC6HIXwKn2BHwotiG/UTI8Tv71kH8UTlyTaTzFiSYLeSTWRr
         0o/PrkS9JCNyw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 9634C60F43; Mon, 23 Aug 2021 14:06:29 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Mon, 23 Aug 2021 14:06:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214021-208809-BiH9q9F8Ae@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

--- Comment #12 from Alan Stern (stern@rowland.harvard.edu) ---
I may have gotten the primary and secondary mixed up.  Anyway, the general =
idea
is simple: Don't register the first root hub along with the first hcd; inst=
ead
register both root hubs along with the second hcd.

The only problem is how to tell usb_hcd_add that the first hcd is going to =
be
shared.  You'll probably need to modify xhci-hcd slightly to make this
possible.  Maybe add a new flag.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
