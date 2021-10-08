Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFF84265F9
	for <lists+linux-usb@lfdr.de>; Fri,  8 Oct 2021 10:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231521AbhJHIed (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Oct 2021 04:34:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:51712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229868AbhJHIec (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 Oct 2021 04:34:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7E8606101A
        for <linux-usb@vger.kernel.org>; Fri,  8 Oct 2021 08:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633681957;
        bh=gDmmxklwbgHj9NeNiO2UGjc/8Jzo7aL/t9Oh/auGE1M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aMoQe9cyKRVoaOzBMWr8CHeWffMS4ic0BNkq+m8Ekx/Up5qPTBi15u8jKOVGVT/Bs
         7qAF6YFKcvT/6fR+2SOn7CpRl/Las9ewh/fdsAbepQScl6xDV0VO04LyMvCJHaixov
         6xE9X2zhe5Z0DZvA8beg3jkwQImc65obHbUawTPZh1+PWdOhIpSb9+OS3y+WvP314K
         qb1y2P0bm7k4ZL1W2eQL9g7z5roDy1Xla1f04v5pXp+uEZIYaW/KRNdeif50mbNS1I
         T2Vh5fGnlrkD9uI2OUuDhGsBCDp1+PDJFfxYyEp++YGuvmQD4MbPosBmDfqyJ1HKEI
         HOizVDGVv1XfA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 672EA60F5C; Fri,  8 Oct 2021 08:32:37 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Fri, 08 Oct 2021 08:32:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214259-208809-nwLoL9RvKR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #16 from wse@tuxedocomputers.com ---
Found a preexisteng hack originally for tb3 fixing the issue also on this t=
b4
controller: https://bugzilla.kernel.org/show_bug.cgi?id=3D206459#c59

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
