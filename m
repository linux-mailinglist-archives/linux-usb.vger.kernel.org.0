Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCF8A3F472E
	for <lists+linux-usb@lfdr.de>; Mon, 23 Aug 2021 11:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235724AbhHWJPM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Aug 2021 05:15:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:55548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230137AbhHWJPL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Aug 2021 05:15:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4039761357
        for <linux-usb@vger.kernel.org>; Mon, 23 Aug 2021 09:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629710069;
        bh=gcXr/qwDT3LFVso1kLbqWakgj1kNMoErLgFnRRKhUBg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FQ27oo8rdZKDmdtooEkXhPx8gwbLej5/BYnMnjSkvLKI5Pbmk9HM8bsc826Y8iKi7
         rJKop895W4ACkD6/KfWCHjHfRBWfn7LZK01wZYFicAXViFdliekvgpNpklQy4KVUzH
         hXg/MrO5kXcMPzKUmIhDW34p4hiEAEuXAbe5oHjlhAYTydPwZ0TXSXXVlO9HZKDpwb
         vcFe5+g+wObsI4o5CGSVPCHr/vi4UORcdHZBRly+FhbQx9CTrKD7YGO0vQ2DkOdDBx
         hX2aFJCckc59hiSOmPX9K9+4ghtvG7dGuOdx7D7B5b5JKaIz+4SuoxIRGGQqSeJN+a
         7YM2VBa+FJRsQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 3C92C60F94; Mon, 23 Aug 2021 09:14:29 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214131] ch341 communication problem
Date:   Mon, 23 Aug 2021 09:14:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pb.g@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214131-208809-LAHhFhqngF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214131-208809@https.bugzilla.kernel.org/>
References: <bug-214131-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214131

--- Comment #4 from Paul Gr=C3=B6=C3=9Fel (pb.g@gmx.de) ---
Created attachment 298433
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298433&action=3Dedit
lsusb -v

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
