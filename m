Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2F33F5D47
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 13:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236550AbhHXLpN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 07:45:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:50344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234787AbhHXLpH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Aug 2021 07:45:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E6644613AD
        for <linux-usb@vger.kernel.org>; Tue, 24 Aug 2021 11:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629805463;
        bh=JG/bdXJFbsjCFuA1KvEGpAvJxBWZbHfe3cxS4XXAT0I=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DUEzr7oEztuwWhIzH0RziWn4IX6yILf/bES2bJ8Qgh/WPR45gqwInKEdRDMeghxQk
         D2/QRG18ILMtKhlRkRzxmVCFt7blsbhzQLFkdxQvYQcJUuUu1BSPHhaEcR7TgylKQg
         ej9N9lDOSzA4+0RYuywHeAr5tS9X8wbqc8pulT53PYhihfU1S1H3DmyEkth9RvrjQQ
         GSOX9uRXI4qCcNe/SuWLUfmqlAmj1kXXCOYWyixAdnZ/T6UVul7A3rEJMtVhKWeQoX
         /Ky4nQL3RADz2H+WBdtb6i3AgeTOTBrarIu0Vb7SQXU5z+7cls/SDTXx2j+aCWm2O1
         LUwBQi18u718A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id DC05060FF2; Tue, 24 Aug 2021 11:44:23 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214131] ch341 communication problem
Date:   Tue, 24 Aug 2021 11:44:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johan@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214131-208809-JPVCKnWu6G@https.bugzilla.kernel.org/>
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

--- Comment #7 from Johan Hovold (johan@kernel.org) ---
On Mon, Aug 23, 2021 at 09:14:49AM +0000, bugzilla-daemon@bugzilla.kernel.o=
rg
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D214131
>=20
> --- Comment #5 from Paul Gr=C3=B6=C3=9Fel (pb.g@gmx.de) ---
> I agree, I couldn't find any enumerate related symptoms here:

I was able to reproduce the problem here. The device doesn't send a
zero-length package in case the received data is a multiple of the
endpoint size so that the bulk transfer doesn't complete (e.g. your
flashing application may not receive replies).

We need to revert the offending commit until we can figure out how to
configure the device to send ZLPs.

Thanks again for reporting this, and sorry about the breakage.

Johan

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
