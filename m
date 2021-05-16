Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 220FE381DC6
	for <lists+linux-usb@lfdr.de>; Sun, 16 May 2021 11:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhEPJxH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 May 2021 05:53:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:33142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229661AbhEPJxG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 16 May 2021 05:53:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7A25361040
        for <linux-usb@vger.kernel.org>; Sun, 16 May 2021 09:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621158712;
        bh=r+BaMgBMO2hTA1qZiyRE2n82kQImcN2v2TWyupzxn9s=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=H/MZ9S7hBc4VDM2Uya5evlIz+Yj1d9yoykwEZk0XExPnW3kpKflMtTuK+9lvDgIq1
         HTor4PKhiwqhRXJho0EqadEuFVGrI5GvqmhUjgBHl/DgfO6VDL51YgiBJOveIL52fy
         gTcRHYmmpxIGbERRLfU9O7KvQOi61fKEcHnFxtidhi9so0WKXbt7S0lb7bURd63EEr
         6l2ddkkIIgirqTQtWKRVuIZh9K/KH4UQ7vWeLEZLKqHP10eJXAacmPg7alHCAt79Ss
         AdSbQ/MLp4KnLDE7LBGCL/6B0hLIA1YvrnBowTfR3vN32uMmC7B79cOBjUXSmeasv8
         QwsGIDsjHIG5Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 6B2B8611F2; Sun, 16 May 2021 09:51:52 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Sun, 16 May 2021 09:51:52 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213081-208809-ErPklV5PRV@https.bugzilla.kernel.org/>
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

--- Comment #7 from Peter Ganzhorn (peter.ganzhorn@googlemail.com) ---
Alan, thanks for looking into this and spotting the difference in the trace=
s.
I know what bisecting is in theory, but haven't actually ever done it mysel=
f.
Do you know how could I limit the reported commits to xhci-related stuff wh=
en
running git bisect or point me to according documentation/instructions?
Peter

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
