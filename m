Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8402F37726F
	for <lists+linux-usb@lfdr.de>; Sat,  8 May 2021 16:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbhEHOha (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 May 2021 10:37:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:41438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229500AbhEHOh3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 8 May 2021 10:37:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 49B4F61260
        for <linux-usb@vger.kernel.org>; Sat,  8 May 2021 14:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620484588;
        bh=Wydm/iSqGZftZ0lEfRpooN8ezPXkzxhNhz4oUnSVMJs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Kjxyog94xQ1mY8hbrUftRIJkWl4dFkGnfk4138iAm7sAidhL0ocFgwUP+Dc8mvWZk
         pb4eHMw/UuOQqzuANYeZ7hxLdsFikt5idgbDT8TEBejpSlpuDmGqVaKakilYe3O/k4
         7E31tWXvi8aK+JxbVI40ktTfXPSxaPhxp8B1BHgc2V3u3GdhcRSa+IxvM0F5LVdKdY
         8nFM3cpkXOxRzcU4IrrwU2YQ3/SWYaObghCWrlI1GqsoDMAeGI9zekjtkIik1Rncu1
         a5NY/4BlXxSL091IrSf9NKWAkLu9cSxSdDzHAfnPz8osYNcYXqsxXzUocMhIXv3p8G
         0zMwRdmPapZSA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 2FCDC61186; Sat,  8 May 2021 14:36:28 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212995] A possible divide by zero in qh_urb_transaction
Date:   Sat, 08 May 2021 14:36:28 +0000
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
Message-ID: <bug-212995-208809-GxlgQA0jUC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212995-208809@https.bugzilla.kernel.org/>
References: <bug-212995-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212995

--- Comment #3 from Alan Stern (stern@rowland.harvard.edu) ---
The code _does_ make this check.  See usb_submit_urb(); near the start it d=
oes:

        ep =3D usb_pipe_endpoint(dev, urb->pipe);
        if (!ep)
                return -ENOENT;

Now if you want to make this a little clearer, you could submit a patch that
changes the code in qh_urb_transaction() to do this:

maxpacket =3D usb_endpoint_maxp(&urb->ep->desc);

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
