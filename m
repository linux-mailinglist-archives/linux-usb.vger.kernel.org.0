Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34AB63E4242
	for <lists+linux-usb@lfdr.de>; Mon,  9 Aug 2021 11:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234220AbhHIJPh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Aug 2021 05:15:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:33302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234157AbhHIJPg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Aug 2021 05:15:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9A78161078
        for <linux-usb@vger.kernel.org>; Mon,  9 Aug 2021 09:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628500516;
        bh=+bPgw8xmZE+ElpURfpR5MLyJH13+JeVINcuCVyBIpK4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ssk7nxopjaRvO+QsfTBJmFL8cz2e7F92IlZ0298EvDKkge5tB9iw5bMoU1Yh9JtRj
         iBP4Mft3R5JZUy9GlPQyCIuyHItMR8mj8mTtqDB3DtNAcieV8c/085A84e+TE2fN0Y
         iTEhUvaxT+E3Mo3VKn9F0Umn3uYpDzVt/j878gJ77FAE8G3ldtNf30AvKEB+GKXjvz
         AzI5L2n/7+BMRKX0ERzNPhn06J9egV1aQGjkZasKZlyQxgXXrQtjx7Tib0SlJgiywQ
         sie4xWK23s2zESKFkQSnglPYF4CCUdrVFc6828u3Hr3k41Mm9SO+5K2zTttDFQgyae
         QzSFURy0cEaNA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 8A14A60FDA; Mon,  9 Aug 2021 09:15:16 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213967] Thinkpad T14 Chicony Webcam not recognized by kernel
Date:   Mon, 09 Aug 2021 09:15:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dev@horatiuion.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213967-208809-fP4Tzq33Am@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213967-208809@https.bugzilla.kernel.org/>
References: <bug-213967-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213967

--- Comment #5 from Horatiu Ion (dev@horatiuion.com) ---
So sorry, I meant did NOT fix it. I'm still having this issue

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
