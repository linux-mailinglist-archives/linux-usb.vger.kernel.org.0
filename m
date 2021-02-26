Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A35E325B5F
	for <lists+linux-usb@lfdr.de>; Fri, 26 Feb 2021 02:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhBZBob (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Feb 2021 20:44:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:37910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229498AbhBZBo3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Feb 2021 20:44:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 51B0464EE3
        for <linux-usb@vger.kernel.org>; Fri, 26 Feb 2021 01:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614303829;
        bh=/xHtpymWyb01V0tdbQ7A4NZn8pwFjnEJRN9iAzrrUBc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=atkVl0tX36yxZA2PwVo4DtiElWf5wPrKxHOha3Or6TbnA71FHM1kSAjE1qoi4aDdS
         b41ApAONmoaiO+TRo61OC1csuBbrCXaW6uJwVa0AEDEsxHx/75yrlCWOeLLf98vv8a
         4qDcGM0Xz2H5sJ3ZCaiRDlr5zMnyFdQnx3Zpap+cEK/MDi+wZjDUMLkVvfIOAYhbd7
         BEpRw96Ctaxw8QUztSSmMdyGOTipMiLv+g14tCR9aONnXjHP6vhbXBUrg6wiabeodV
         Thz1W4m9yc8wD6nVzuDjuuju+3KZiSvMm+qOH8Gj5eo8vx20ghNE9GA2ZZFSxbtesn
         KLszXVHiFnbRA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 3D19361490; Fri, 26 Feb 2021 01:43:49 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Fri, 26 Feb 2021 01:43:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tomasz@grobelny.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209555-208809-GX7U73deTj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209555-208809@https.bugzilla.kernel.org/>
References: <bug-209555-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D209555

--- Comment #5 from Tomasz Grobelny (tomasz@grobelny.net) ---
Any news about this one?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
