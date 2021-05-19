Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE3003894A7
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 19:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbhESRc4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 13:32:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:53522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355626AbhESRch (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 May 2021 13:32:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 13AA8611BF
        for <linux-usb@vger.kernel.org>; Wed, 19 May 2021 17:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621445477;
        bh=DJIpbxoWJ5TwneqxJhekP8fFHZX50dAglqEUhPv/SB4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=EYysbmHxMCE9Vcjge5bEDCIs8hzRUHUxxpEWPMSpzuXiunu5K12GTT8QfA8tuDvFu
         2h+P5VuSvI02gSaaoTQp2GULe9A7X2t1N0Hy71s7IFMz+Ulxn04Omgcu9+h6w9h3KY
         hF5kH33oJ/1vzEBvD4lhrsexGfwWqpgRTiUrema4+ZNJ2pwNc8O9oe+PUoaA4o1QA9
         sQwka36bYsNsMQL9n1Y443RecFnETYqJVxxiQHTsZNrDVjIGQeifZ4MKtCkXkUdTJQ
         Xm0LJd6OEwQxokocKyizOuUE78b2GO/kDkPrbxJeNd3RNXeGLjjqFUiWec9L/T9aVo
         A6k2Nee8HgChw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 03170611F2; Wed, 19 May 2021 17:31:17 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Wed, 19 May 2021 17:31:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: peter.ganzhorn@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213081-208809-nXJE1XQ93d@https.bugzilla.kernel.org/>
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

--- Comment #17 from Peter Ganzhorn (peter.ganzhorn@googlemail.com) ---
Created attachment 296873
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296873&action=3Dedit
usb bus 5 trace 5.12+patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
