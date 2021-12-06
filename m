Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB0AD46A60D
	for <lists+linux-usb@lfdr.de>; Mon,  6 Dec 2021 20:53:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348785AbhLFT5C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Dec 2021 14:57:02 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:33256 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348469AbhLFT5B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Dec 2021 14:57:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7D7FDB81084
        for <linux-usb@vger.kernel.org>; Mon,  6 Dec 2021 19:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E570C341C1
        for <linux-usb@vger.kernel.org>; Mon,  6 Dec 2021 19:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638820410;
        bh=w8JAMFBKwso7M9BLC/y+f2jmnxM2YYb3EwV9zsGMLzo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bjMhTQ8/6k9KyDRbrq1lxgZaM7tN4L0CY9vVjZ9sAtE1KasBhKyoaOEpC3nGncciD
         VAYhyV/EsadyYpBFyWG55+eKpYTnPJTsoTQSYjqdCeZJWnB3sFf0gSQq04mnPh+jkA
         N8ZS0RAwQob1vXh/8z4ylRg+vdEZGMGoJ1iY7U2hur+rUTh9FY+2vxG44KfnEnUkUb
         46emV+XcklAN0cj9yvcRZzY88LogXJd35HEICwotGw4uwBxbWnPOEEphekP8a56ekW
         9WRSE2Z+nP6ovJqT64X/Y2ZXDYNwX1Vtn9l1VrO7h18c+QSg0GCK6DwtxNReLDVhUU
         e4QYrkQUy0FLA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 0C2E161106; Mon,  6 Dec 2021 19:53:30 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215241] "usbreset" tool causes hung task on kernel 5.15.3+ with
 Hauppauge WinTV dualHD
Date:   Mon, 06 Dec 2021 19:53:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mabo@elbmurf.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215241-208809-RXpZ9lNVdG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215241-208809@https.bugzilla.kernel.org/>
References: <bug-215241-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215241

--- Comment #2 from Maximilian B=C3=B6hm (mabo@elbmurf.de) ---
I=E2=80=99m trying, but "git tag" is only showing me versions from 2.6.11 t=
o 5.9.9.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
