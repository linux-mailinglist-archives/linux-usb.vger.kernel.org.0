Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0B1838D058
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 23:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbhEUV5j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 17:57:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:41496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229503AbhEUV5i (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 May 2021 17:57:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 68BD7613F8
        for <linux-usb@vger.kernel.org>; Fri, 21 May 2021 21:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621634174;
        bh=vjzzmiajh9SfozNhf3GiZudgMzMp+D+O2qkWRq6ERkI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=iQkLwpb+YkxA5cC2aS1SYmqySVIoWBZoGOKZNg7Y2Pv3TMJ52k/NgYz27bd9PmSQu
         70KScOirJAk3sraOt/x210h13PfG5iGg3rHSdocAk7i8U4K8VBanXDLL9SHqcrceGi
         923AmJepj3irtfksEXB1CDfFVHgNqhEGJkegmpAilELkeNroo5q8S5BhlB+ftPxSOw
         ELmHBOXlT621T5tOIRcZ163wZdCARDKULc+IJ20QzITF3eMR1eVtihepStbHZ+fCCb
         7wT2UHrdHJgVuiNhXRQczNN9aYU+aT9qX7/9bWvrzTqqzBdlJj2TQ30BdtXD0P5koI
         Z4xmc+hy/ZR9g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 60442612A4; Fri, 21 May 2021 21:56:14 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Fri, 21 May 2021 21:56:14 +0000
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
Message-ID: <bug-213081-208809-IiVeiiP9lO@https.bugzilla.kernel.org/>
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

--- Comment #31 from Alan Stern (stern@rowland.harvard.edu) ---
It's entirely possible that the other card reader doesn't issue any STALLs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
