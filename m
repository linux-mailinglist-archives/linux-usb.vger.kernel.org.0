Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1D6428A41
	for <lists+linux-usb@lfdr.de>; Mon, 11 Oct 2021 11:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235694AbhJKJ7p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Oct 2021 05:59:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:54172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235603AbhJKJ7n (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Oct 2021 05:59:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id CFC3360F0F
        for <linux-usb@vger.kernel.org>; Mon, 11 Oct 2021 09:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633946263;
        bh=yRvT/1dwxecyRirBvl0okIkHIqe5wz1zI0xa418ZGsY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oynbhbMDQRNm7XUpYlFXej9iPTmDnX3W5hngc25FHIbSMNATeaz5hoEkXQCzfcKLD
         sIcYpzBjAML0Jp6gnoGmveMwRdhqmTduj9MNqazW7nSFNj85SXBtoxDxuKix7FF8QF
         heMHKbd2By1A8gxJ3SNKAPeF0kt1IvX0alwyp+q4sv6C8Z+qbC7Bzz0LYKTM+epgap
         dirao30b8f8KejEb0d7flcnbxJC1t3HDA5sNpL2EeY5N+iByUcFnxyv0HHrXY1pY/F
         gxWvunfsBSLhb756rAk7LW6lpYBUex0MpKOKivw8L/EPmcE5IGvbfNqCQ7zY8/9xfW
         i3SD4olkl3V6g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id CC1F360E14; Mon, 11 Oct 2021 09:57:43 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213771] ch341 USB-Serial converter receives but does not send
Date:   Mon, 11 Oct 2021 09:57:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bondar.den@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213771-208809-PHQgsLFMxt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213771-208809@https.bugzilla.kernel.org/>
References: <bug-213771-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213771

--- Comment #7 from Denis Bondar (bondar.den@gmail.com) ---
(In reply to Johan Hovold from comment #6)
> On Sat, Oct 09, 2021 at 08:07:00PM +0000,
> bugzilla-daemon@bugzilla.kernel.org wrote:
>=20
> That's also not a mainline kernel. Unless you can reproduce this with a
> mainline (or stable) kernel, you need to report this to Ubuntu.
>=20
> Providing answers to the questions I asked the original reporter might
> help too.
>=20
> Johan

Thank you very much. Sorry for the inconvenience.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
