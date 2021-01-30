Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C363095AF
	for <lists+linux-usb@lfdr.de>; Sat, 30 Jan 2021 15:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbhA3OB0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 30 Jan 2021 09:01:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:40088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229498AbhA3OBW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 30 Jan 2021 09:01:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A019C61481
        for <linux-usb@vger.kernel.org>; Sat, 30 Jan 2021 14:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612015235;
        bh=O/Pbq9GISldgsWxk6uqQJw8tEqkRSACaIu4/n7VJNEw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Hb6tIu0agAJ/sujrayK5mv3BT72ZtzgDX197gEl2JWBs+T1xtkm9ihAJrPR+N7jRX
         KRv7dYOaOgB+twRsxHGkQug5SnrOLUj++hWzJr2n/78ysMwuhIUqAO/RxD1HzkemgW
         uOXyCncn8t+1Z198KOsLPOe5coQOWL8T6PSFu0864R1ARFvfyWwU11j0gDHjVbnFf6
         cU3p1lJT4g0lH3Z9OJJhK8ZFZQxjx+5w7doSi0ot2eEn+w6lUTUP6zGnHLeReqRJCf
         cmKoGZdXYX8j27Di0XpYTEV4wwNwUuN8mKGv2RE5xY5fDptLe5LWnLHLjDOjVU0yeA
         7x40RTfUCUj8w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 8A951652F9; Sat, 30 Jan 2021 14:00:35 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 211479] hid-generic: offset (0) exceeds report_count (0)
Date:   Sat, 30 Jan 2021 14:00:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andreas.thalhammer@linux.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211479-208809-EW938AxyaZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211479-208809@https.bugzilla.kernel.org/>
References: <bug-211479-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211479

--- Comment #1 from Andreas (andreas.thalhammer@linux.com) ---
I forgot to mention: the keyboard works normally.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
