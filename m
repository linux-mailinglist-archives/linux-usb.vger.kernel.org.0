Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBEF93E7C7C
	for <lists+linux-usb@lfdr.de>; Tue, 10 Aug 2021 17:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243342AbhHJPkG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Aug 2021 11:40:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:53910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243538AbhHJPja (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Aug 2021 11:39:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2373E61019
        for <linux-usb@vger.kernel.org>; Tue, 10 Aug 2021 15:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628609948;
        bh=2Y26qRA1zdBfHdou90szVkSTsQmPuz3VOu2NBTsY9/c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SweVahx0TFcxd2mQ5l5EZmVBcY8b1OsxwIeowmHdxFoIhrxhcFeadvOpaGCUpjvDy
         wX2OLrH9voUBoEzQGqOboKa0Fws4nggZsC9Niq+Pd7YVZGqGy4V1vXmvqURl0bkt0q
         QQSrgtcZJylnuyyY4QyAP2X5v0wO//RG6ef6vwXH+18jngv9ZmJ4CFoBnwazDYCAXz
         KnH86owBu3iV0O6WEQlCGsMAlQmau+psz1JI/fxnOpuR/YPXxIPX7+F58nB01ZiDUQ
         XypW1X4qDxPP5mWXM9DCWKQ+RgKw+nWfqAjk25DVDrJSHqZ9pCOx2xDjwzNEN3udiR
         dixWtxI3Wk1Kw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 0FDE660E4A; Tue, 10 Aug 2021 15:39:08 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Tue, 10 Aug 2021 15:39:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chris.chiu@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214021-208809-bYnRMXIM51@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

--- Comment #2 from Chris Chiu (chris.chiu@canonical.com) ---
Forgot to mention that this problem only happens on the high-speed hub in t=
he
attached file.=20
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
