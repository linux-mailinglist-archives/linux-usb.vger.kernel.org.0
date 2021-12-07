Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2D5C46B6DC
	for <lists+linux-usb@lfdr.de>; Tue,  7 Dec 2021 10:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233711AbhLGJUQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Dec 2021 04:20:16 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:46448 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233705AbhLGJUP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Dec 2021 04:20:15 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DA836B816A7
        for <linux-usb@vger.kernel.org>; Tue,  7 Dec 2021 09:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC8D7C341C3
        for <linux-usb@vger.kernel.org>; Tue,  7 Dec 2021 09:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638868603;
        bh=sS6K3vCqJawhkOOJuzdIWDoRiHl4IofYQ1bZPZHP0GU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NTCYMQMdkeWdxcsGBnuC791N1XEEHqyEurTCWG/xCNOSXJOqUPtKd6A5bW06dDBe/
         SX9wEfduiKG0LSbub/m8qamaOCcOMNUASTsiSnfOZxjvR1YfjqxMW5cV713i7IqCSD
         hF/mZpL36Ibyi8UU1Zhznoh6vlOYeRfENXA2sfaIsnHFKUdx2Qkj1aFKTUQ0aLvkj6
         sXAMTBcqKebGR4WewyVwQL45dNlM6zbltxOdoPhdXtHXESCLdrJM8+ZVVJaMkoDuPs
         QJoapQD1wrOIoLLw4yACzLgsQNco9YdPBYvjC41jkrSNu40jiiUAH3sLVQAKw8fq1H
         K5j/2+7L4jx5g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 88B4E60EBC; Tue,  7 Dec 2021 09:16:43 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215117] ucsi_acpi: kernel NULL pointer dereference
Date:   Tue, 07 Dec 2021 09:16:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215117-208809-8Ol5tT8zyA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215117-208809@https.bugzilla.kernel.org/>
References: <bug-215117-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215117

Thorsten Leemhuis (regressions@leemhuis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #1 from Thorsten Leemhuis (regressions@leemhuis.info) ---
FWIW, sadly lot's of bugs filed in bugzilla.kernel.org don't reach the
responsible developers. This seems to be the case here. You thus might want=
 to
report your problem by mail as described in this document, as explained on =
the
front-page of bugzilla.kernel.org:
https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html

As this seems to be a regression you might want to CC the regressions maili=
ng
list on your report, as described in that document.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
