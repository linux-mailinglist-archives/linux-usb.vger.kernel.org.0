Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39CD83F471C
	for <lists+linux-usb@lfdr.de>; Mon, 23 Aug 2021 11:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbhHWJIL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Aug 2021 05:08:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:53880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229944AbhHWJIK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Aug 2021 05:08:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 36D1161262
        for <linux-usb@vger.kernel.org>; Mon, 23 Aug 2021 09:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629709648;
        bh=1RZyo8y9MdHLFoZmLotbUn1yGMEU4k3q6ZWuU/zkpEM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=vETQIATZyh1u75ESOd1WaPKrxvZIIgc9W/mFfyQ/82T+PIgThvylxKzkHg7Rg64Tq
         SXna5z5qj7SQ5iTmld74qoesFQCR9XonOXRpu3o1JxcNte1mGzENVYH8PZcb+bFFKy
         gQAuAz5PahfjFDiEb25lFzz4vwTsfOLT4PiFkhmIVblAQJFzwT82D+trkhzWKVarMb
         XfHaX1RDqeaQt/6keH7syG953mq02WfTxgUN6COw4nDNpfF/2Na+Ml6B+OEWUKjjcz
         KxTseccmPsTUXdqK9q+NSJQjnGjFIzRAr9CfavUSqCIMUw+Vc4o+W4wZBVR3uD1IR7
         dgkTUmv/NpV9Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 2E27B60FE3; Mon, 23 Aug 2021 09:07:28 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214131] ch341 communication problem
Date:   Mon, 23 Aug 2021 09:07:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johan@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214131-208809-TidqKNunUH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214131-208809@https.bugzilla.kernel.org/>
References: <bug-214131-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214131

--- Comment #3 from Johan Hovold (johan@kernel.org) ---
Thanks for reporting and tracking down the commit that caused the
regression.

Could you be a bit more specific about the symptoms here? Judging from a
quick look at the github thread, it appears that the device is still
working although timing may have changes slightly. The arch thread
indicates that the device doesn't even enumerate, which does not seem to
be the case here.

Also please provide the output of "lsusb -v" for this device.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
