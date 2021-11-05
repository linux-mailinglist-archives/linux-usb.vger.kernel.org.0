Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2C9446936
	for <lists+linux-usb@lfdr.de>; Fri,  5 Nov 2021 20:39:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbhKETm3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Nov 2021 15:42:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:41004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229918AbhKETm0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Nov 2021 15:42:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F106C6120D
        for <linux-usb@vger.kernel.org>; Fri,  5 Nov 2021 19:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636141187;
        bh=wgOSEJAESpiFzgsz2cT+yC3aKgKxBbYHQbGGbqGTIu0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FB95XDQI3DKAWTcfKMHMmcMuneGpWeH0gFdBuwlCuiYH7ZvH/1EjT77HjAT52U/Cr
         3XgEgRj1fxlP+Fw7YLCmVDMOOjy0XItznkDZUzhHjCXNNg14UaQnNS38y71hH6Zyv6
         6PDY858/Qv/EpkMP271UdCU6iMjT/y5kh4PYrrl48jtHSSe9RtWd0SLq6WjqavRZK7
         Vsq7wtr+FljQ9ZpMigRZZEi78wTvRrDEUWzFQ61bUnU1zW5bG+HtnnUSXAi4J3M6Np
         P2UNStpECDKVY0mHmrn8O6roM68eZZQURAmWWGKKxjDbDuv+krndLJc3FruOlahgai
         LtT+JbSDDJvnw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id EE03F61157; Fri,  5 Nov 2021 19:39:46 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Fri, 05 Nov 2021 19:39:46 +0000
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
Message-ID: <bug-214789-208809-xsD4k74Kwl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214789-208809@https.bugzilla.kernel.org/>
References: <bug-214789-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214789

--- Comment #24 from Alan Stern (stern@rowland.harvard.edu) ---
On Fri, Nov 05, 2021 at 05:10:05PM +0000, bugzilla-daemon@bugzilla.kernel.o=
rg
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D214789
>=20
> --- Comment #22 from Scott Arnold (scott.c.arnold@nasa.gov) ---
> Hello,
> This caused problem:
>
> https://patchwork.kernel.org/project/linux-pci/patch/20200214213313.66622=
-2-sean.v.kelley@linux.intel.com/
> Scott

This is commit b88bf6c3b6ff ("PCI: Add boot interrupt quirk mechanism=20
for Xeon chipsets").

Sean and linux-pci readers, please take a look at this bug report=20
(Bugzilla #214789).

Alan Stern

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
