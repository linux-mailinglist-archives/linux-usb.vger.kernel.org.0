Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E810386F96
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 03:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245243AbhERBsl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 21:48:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:44554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233295AbhERBsk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 May 2021 21:48:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B40BE61370
        for <linux-usb@vger.kernel.org>; Tue, 18 May 2021 01:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621302443;
        bh=fFVrLCQtIpixP52udc7t1AjfupwKXF6RW3zTrtUocKU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BDzGo7XaWOHVghkp8dwTkKkn4mYw0m/bS0rg4xH9UnRYAiMOuKNlg9fvogpTi88VP
         +DKXXwY/ooQwaz3sp8IvIMO3xcHU0FD3gr5Q1gdXexRT9N89iRc8sq+PpSzr0JFku4
         0RxUnzsTiyjYpeJQPLJw8IFJ7DTjgET4CM1ktnfN4Sz5E4rkaKM1Hh5FbnZYuZv3jE
         wsV6MTiiCEO1zTQ5amUzSTrKM1NS0H4qnXH+O58YRybuPmEpxp33ZSPjiBh5pe7mWu
         2LxFDnr4WGPctKrmH+6iODGLkby235eaDQxjkC5wN9iQ9z7KG+bWd3e2oV5NXpGgk5
         o0XtG8pbyETOQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id A54F1611CA; Tue, 18 May 2021 01:47:23 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Tue, 18 May 2021 01:47:23 +0000
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
Message-ID: <bug-213081-208809-fw3JIlZfht@https.bugzilla.kernel.org/>
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

--- Comment #10 from Alan Stern (stern@rowland.harvard.edu) ---
The way to find out for sure whether this commit caused the problem is to t=
est
the kernel built from this commit and to test the kernel built with the com=
mit
reverted.  If the first one fails and the second one works, you'll know.

However, it does seem likely that this commit is related to your problem, s=
ince
they both involve halted endpoints (note that STALL is the code sent by a
device when the computer tries to communicate with a halted endpoint).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
