Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4676B36E111
	for <lists+linux-usb@lfdr.de>; Wed, 28 Apr 2021 23:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbhD1VkH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Apr 2021 17:40:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:44710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231425AbhD1VkG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Apr 2021 17:40:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 508DE61448
        for <linux-usb@vger.kernel.org>; Wed, 28 Apr 2021 21:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619645961;
        bh=BrQixtQ27UhMiO342vO9Bfq51HPmiVTqzFj0feNyggs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=vEut710qXM6UOmJRvEOsnitq8xLzpu4srtotsAeeqT6iSHEpZx/BVYJ18i9LCiIL/
         FT6oYsClEgolfBaXgrSZFsYmONzdXMfHMwQN8PkHSpMYGb2ntLG/dqaTdkj/msS/ve
         Wre+X50EkidjQmToIGbYBX5uz1I41++i+KN6UBSuixTcJXil+eR9lBeeNsSg3fMXmI
         Vfje5n+YGCE059e2yNLWgjXR+RGyprh21CiTrRoLVT4yZoTkZbKyTLn/b3NkSGe8Q3
         PImdJWYe3CwshXqggfI31JawDJK+UEkcSEIaTZs76Mfa2H/LKngPbMqvbZyeuzxTQz
         vrcYLIeIl5OHw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 373F661278; Wed, 28 Apr 2021 21:39:21 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212725] USB CDC ACM device stop working
Date:   Wed, 28 Apr 2021 21:39:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stefan@agner.ch
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212725-208809-aeYv2AYlaX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212725-208809@https.bugzilla.kernel.org/>
References: <bug-212725-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212725

--- Comment #6 from Stefan Agner (stefan@agner.ch) ---
FWIW, the issue is now fixed in kernels v5.11.17/v5.10.33. I guess it will =
make
it into v5.12.1 (at this point not yet released).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
