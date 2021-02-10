Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21080316A80
	for <lists+linux-usb@lfdr.de>; Wed, 10 Feb 2021 16:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbhBJPv7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Feb 2021 10:51:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:50954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229839AbhBJPv5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Feb 2021 10:51:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6132D64E08
        for <linux-usb@vger.kernel.org>; Wed, 10 Feb 2021 15:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612972277;
        bh=Fr4WAcRSCN0U4uAZ3ttW3FbI2277h7ol7gy6uQphjDk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WIBy0hT0mCFDZQCHQ+V+APlLNJEf48d2X5iLmbcXKYwlt22TYRROzwsDMRMP7jsgr
         3v4mcTY8gZgwYc5uzvjDN68eJpmzVBm1K4AJUBcla3Pwpz/pnIqGwtcqE6XLQI7eAM
         gsTILPauLO2l2PxspRwXYJJms8RPYLH/uw46c5Ah2IWpjp3sptknhXQc+GS5uYYtdV
         +PnE50DFX1KzfAuV524yzTQmLWIFqTnvNRNiRxA/kGMOvC8qYuXdwhc793XzcahZ9Q
         /6OHarRs/h94vqwXCitoP7PEVzrE/PWlBMBaoxG4ph2qRZFZ4TF1DxTJTi11w/q4sr
         waz//5bCcByAQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 50F9A6147B; Wed, 10 Feb 2021 15:51:17 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 211667] USB attached HDD enclosure failure
Date:   Wed, 10 Feb 2021 15:51:17 +0000
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
Message-ID: <bug-211667-208809-ETwffQxAFZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211667-208809@https.bugzilla.kernel.org/>
References: <bug-211667-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211667

--- Comment #1 from Alan Stern (stern@rowland.harvard.edu) ---
For more information, collect a usbmon trace for bus 4 showing what happens
when the enclosure is plugged in and powered up.  This could be a bug in the
integrated hub.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
