Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 258AC40F52D
	for <lists+linux-usb@lfdr.de>; Fri, 17 Sep 2021 11:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241605AbhIQJub (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Sep 2021 05:50:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:32794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241478AbhIQJu3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Sep 2021 05:50:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 71C1F60F48
        for <linux-usb@vger.kernel.org>; Fri, 17 Sep 2021 09:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631872146;
        bh=baxNNICVpmNOGOtYBdp0gH0Mvi2jXDwgSrP2W3Is0kw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gIFJfdSVOEBr+/ChQcyK4Pwd7kBG4c96rq/MFaKWiUaqx/Ai6dqKQyhrfsF5nO5Rr
         vepYJ5LxRwvFb4Yn35cWjhHEkopnPtSCzw1fcSCrDKTCT6MTZs247YnOpMlZtO3bNE
         RghF6Y77svUQ2DH8tz8/eP9fblOoljKocUM18gmIMqTgf1UoerLcbODyqkFXvdgk4m
         pgXx6s/ANWFbebtEO5n+jTClqnoTwp1zg19x0mqADJakr+NU7MYwsxcVhMjf595jTw
         48BnleX/WPzXGnMjzoXL/pB9yBL2A2WBXfYjfuHs8mBqDgkT5tsHLrReqmXKCPU/ZD
         t3c86Zb8Jdjwg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 60B1D610D0; Fri, 17 Sep 2021 09:49:06 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214437] usb: hid: u2fzero: buffer overrun in u2fzero_rng_read
Date:   Fri, 17 Sep 2021 09:49:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andrew@shadura.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214437-208809-lZMQdP6wS5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214437-208809@https.bugzilla.kernel.org/>
References: <bug-214437-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214437

--- Comment #2 from Andrej Shadura (andrew@shadura.me) ---
I have submitted a patch to fix this bug

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
