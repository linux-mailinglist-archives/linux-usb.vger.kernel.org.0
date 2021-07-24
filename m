Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DAD23D4824
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jul 2021 16:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbhGXNui (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Jul 2021 09:50:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:58148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229539AbhGXNua (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 24 Jul 2021 09:50:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8D5A260EB4
        for <linux-usb@vger.kernel.org>; Sat, 24 Jul 2021 14:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627137056;
        bh=g2QjES9IWtw2KfTsX2WV0/mbJflrXCqw6AviOp8SuZc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=A/DrRClUZqBYJfjrFY+MNMugvNsO1B6FN7acrQYcln7JqcdpWEDLvwYgRwuep/hcb
         OjIiVMbOLNbWHGTx4BPfPmxpnzfq8rhpuv9Bm+fm8LOCtJ3NsvNAR/IcRBFFlAK7pt
         Yy44h+9+/ly5Oh1QRnQG3cZfis0CSakFbvfZU5rB9VQjhm9Shg/KlxrtjshkylPUqV
         UqEgCEvzJaihRU2JUllq/gsoh1U1yQ9E52n+uzL8gHBhz3sfiqhzPlI4En9Er1jV32
         dHn2Qj92wNujTM4KLS1YhYdpqQp04L9cdJyY9eVLbKQE+WOOVOpLwamyM3yaELXd1W
         rcwncLJcK0pPA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 79444608AB; Sat, 24 Jul 2021 14:30:56 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213839] XHCI 7 port usb hub does not work correctly
Date:   Sat, 24 Jul 2021 14:30:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213839-208809-JXKHQ9RTws@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213839-208809@https.bugzilla.kernel.org/>
References: <bug-213839-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213839

--- Comment #1 from Alan Stern (stern@rowland.harvard.edu) ---
This could easily be a power issue.  Does either the 7-port hub or the devi=
ce
you plug into it have its own power source?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
