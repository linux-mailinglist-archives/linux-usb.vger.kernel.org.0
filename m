Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4390B3FDD82
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 15:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244466AbhIANy4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 09:54:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:45342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244101AbhIANy4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 09:54:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4535F61026
        for <linux-usb@vger.kernel.org>; Wed,  1 Sep 2021 13:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630504439;
        bh=jfD6E4tpUjJ/JAQ9VurKQS+CG6Sair7OPTj7L+fGtbw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JWy6YXQHPrhXy+ebsR0sEJMkjO++q4a0wS8SUPkAC/Te38Jc1a6XOai9qr/A5FYQJ
         4tBCDSmPjrqmdGtXXMM61LpkZIqMWw3bdKdxKVw/TguquWxxsUchvph6dVuCEVwd86
         +gQ5IBKSJX3lkKSXRawnoq7EI5kz1H5euJlRcGPwVWFMxFcfPbIHFsBD8Wit7c5GuW
         omTU1g1LjvBpTQIwKHPJ1xqEyPZHHh9H5AOwjDN5RnezhXDOBbFIUt5WrbZoYFUK6r
         6v67LwGLfCj/5aIMIAwJsd/jjPVXO1ODQ1X8XTNxyiU9ZzeJRPjAUJExS+vtqWxfpx
         Sozkuv6r+H1SQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 423C5610CD; Wed,  1 Sep 2021 13:53:59 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Wed, 01 Sep 2021 13:53:59 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214259-208809-BvN6B5aO2g@https.bugzilla.kernel.org/>
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

--- Comment #13 from wse@tuxedocomputers.com ---
Created attachment 298589
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298589&action=3Dedit
lspci of boot with tb dock connected (5.13.12)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
