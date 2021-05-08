Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F46B377164
	for <lists+linux-usb@lfdr.de>; Sat,  8 May 2021 13:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbhEHLTH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 May 2021 07:19:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:33882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230449AbhEHLTH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 8 May 2021 07:19:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id BB8F761019
        for <linux-usb@vger.kernel.org>; Sat,  8 May 2021 11:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620472685;
        bh=c6YdDh6chJmNOXlPW72MfJKAsDA+hsiRRZVUrfBzpd0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=J7HGYdiVXpq5dA+WTkd83F4OgCWD6L8OoJKNOqgk1mflVBxzuUPkn3bPVW/A/WrMH
         VNe//6hUOAX9dxtxTJ4aVBYrIl85RbYzlUUeotT8FtY091Uyu4O8UIaAy3EjSVgZGS
         iqYBq9/4RC6lfqRX+Z3UUCn0fV0RYbyw/8VGIl4EHAqBC5+4Ra9wtTPXyxQZZQ4tTb
         +ebjHv/L03VSSbqbRve5wpU+hge4MIt6D/IM5iyLRx9TIaFD8PNoIL+JkV4J7tshQE
         0QMMcYEX1zyQmUkuegRSL1p+/4ULHJulRS6MtwHA0Xa+A1wKzQrsrlPQwnYsWLQLcX
         U49mn88s74/4A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id AA517611B0; Sat,  8 May 2021 11:18:05 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212995] A possible divide by zero in qh_urb_transaction
Date:   Sat, 08 May 2021 11:18:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212995-208809-2BOGTyS7lg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212995-208809@https.bugzilla.kernel.org/>
References: <bug-212995-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212995

--- Comment #1 from Greg Kroah-Hartman (greg@kroah.com) ---
On Sat, May 08, 2021 at 11:14:25AM +0000, bugzilla-daemon@bugzilla.kernel.o=
rg
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D212995
>=20
>             Bug ID: 212995
>            Summary: A possible divide by zero in qh_urb_transaction
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.12.2
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: yguoaz@gmail.com
>         Regression: No
>=20
> In the file drivers/usb/host/ehci-q.c, the function qh_urb_transaction has
> the
> following code (link to the code location:
>
> https://github.com/torvalds/linux/blob/dd860052c99b1e088352bdd4fb7aef46f8=
d2ef47/drivers/usb/host/ehci-q.c#L715):
>=20
> maxpacket =3D usb_maxpacket(urb->dev, urb->pipe, !is_input);
> ...
> if (usb_pipeout(urb->pipe) && (urb->transfer_flags & URB_ZERO_PACKET)
>                            && !(urb->transfer_buffer_length % maxpacket))
>=20
> However, the function usb_maxpacket may retun 0, leading to a possible di=
vide
> zero problem in the remainder operation:

Please feel free to submit a patch to the developers, but first see how
it could be possible for usb_maxpacket to ever return 0 for this.  Are
you sure it's not already sanitized by the time it gets here?

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
