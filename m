Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1948377DBB
	for <lists+linux-usb@lfdr.de>; Mon, 10 May 2021 10:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbhEJIMh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 May 2021 04:12:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:43888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230045AbhEJIMe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 May 2021 04:12:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 29EAD613C9
        for <linux-usb@vger.kernel.org>; Mon, 10 May 2021 08:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620634290;
        bh=aO0OKI2P9jWr/ig7P/2Ev7P6zGKcjC00vVVz/2n3kjc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ke7DLqVC9xgKr3+yIjz6VAd9DsOLpRJoPXKIl5KkMxRzMpCM40NLYBnixlRvT0Gls
         pnzG92Yq55oQRdbWphEL/rpr6xhKz7pyR45FASOBhTVfCQwnkV4+D6eqD9m6ma8tfD
         qCEzIfGOD0F2mub3aQ7YUY+3VaplFnSDOqwfzxBKuMuMW2HnLZQHXqIWyOEfqnlAmn
         q+VToYQB0QEpg5otf3mvdcunIDutuAq/LMvX7HsQOjN84mS8uuH79rk0pTQ5NSY/SW
         GzS4BIss2c/6YaPeUM4KfcdwLAkmiwHjKB93Yl5qyC9RJKevOehNCs8KdQOL9IGWWA
         HRPUQYdRLrMTQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 169F561154; Mon, 10 May 2021 08:11:30 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213011] [uvcvideo] Unable to turn on Realtek Semiconductor
 Corp. Integrated Webcam HD IR emitters
Date:   Mon, 10 May 2021 08:11:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: v4l-dvb
X-Bugzilla-Component: webcam
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: beresbarnus03@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component version product
Message-ID: <bug-213011-208809-gbCvFtE4l8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213011-208809@https.bugzilla.kernel.org/>
References: <bug-213011-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213011

beresbarnus03@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |webcam
            Version|2.5                         |unspecified
            Product|Drivers                     |v4l-dvb

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
