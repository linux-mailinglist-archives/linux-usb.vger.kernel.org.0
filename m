Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E69365A41
	for <lists+linux-usb@lfdr.de>; Tue, 20 Apr 2021 15:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231661AbhDTNg0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Apr 2021 09:36:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:50346 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232084AbhDTNgZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Apr 2021 09:36:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0144361027
        for <linux-usb@vger.kernel.org>; Tue, 20 Apr 2021 13:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618925754;
        bh=M6RHOhtzV9Y4cAI9erSTLwlz9Bk0QBcPXzc1PyHvL0E=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kXoTtpexIpR58KMku8KitAUP8MDOebLiqm/NUvhwZYy7Idt/xVxC1Wcyz46g2Tivk
         iwbROToRmh4tBqS+9L/QHiUjeVkSghsYyVDaTx6L/ROGWO5X+aIy38R7PiVzHD4C0S
         b9HW2MSJ99JwEADYUHXOZ/WoF3AFlN1mlH3I07pb8kCmkJl4bVcEUk4j8jD9mP+81+
         7NhgUzftUenW+iyjo/oiYpyTtr4wXiz1jF6e4wO9b1LK/XFcoxIDLQ+4+/VWSmHX/8
         NLqpqNhLV1lKZi7eioUMg+fs6rrIoPHr1l8fEPiMbhZEMoGJ+87zVzsJxUuE6sbfVE
         O3MgfaEnQLjGQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id EBAC0611AC; Tue, 20 Apr 2021 13:35:53 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212725] USB CDC ACM device stop working
Date:   Tue, 20 Apr 2021 13:35:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stefan@agner.ch
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212725-208809-HwOp6Ez4bf@https.bugzilla.kernel.org/>
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

--- Comment #4 from Stefan Agner (stefan@agner.ch) ---
Thanks for the quick response!

Applied and built a 5.11.15 kernel with that patch. It indeed seems to fix =
the
issue!

It did not apply cleanly on 5.11.15 or master, there is a `spin_lock_irq` in
that area. I just moved the acm_unpoison_urbs after the suspend counter
decrement, not sure if that is the correct fix though.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
