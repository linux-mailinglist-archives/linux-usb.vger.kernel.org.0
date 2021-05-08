Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1987377175
	for <lists+linux-usb@lfdr.de>; Sat,  8 May 2021 13:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbhEHLi1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 May 2021 07:38:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:44228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230234AbhEHLiX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 8 May 2021 07:38:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 76A76611ED
        for <linux-usb@vger.kernel.org>; Sat,  8 May 2021 11:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620473842;
        bh=mKkAUrF/7ChJRs69Uev+ZojkjpdCVjqXlOA/AuHLj2c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fsLjHnm80G+0Zy3eSvmiddMxAE0cGdZkeALqySwvJ+E+ff2CIoMOkXQV+C+L/JpxS
         QPp7SmEfpYQe++xdetUgOtMtxPkRGkOc13FMIVhto8QVYP85FuYGQABFwo23BJZvyy
         pJSIo9/g+yz2g3UBIxGocMgra26sc5PWY+l2DghNqoUuhmdnYOZLT18cUI0goL+RRA
         D4nLcTWrmAQ/Ij9y22AtVoFc3o0gAYnG0+wXoiQL48KW7Ua3IA6aU9V67l0WGOZDhq
         lQrqIqouW+1qj6IMerhuIzMfGrzs3fsdMUCwNI/s9ePQXkVCQgq8T62/ePCkpapFnH
         ZPeVBeL13nvXA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 6526761186; Sat,  8 May 2021 11:37:22 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212995] A possible divide by zero in qh_urb_transaction
Date:   Sat, 08 May 2021 11:37:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yguoaz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212995-208809-nLogfcS8Bq@https.bugzilla.kernel.org/>
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

--- Comment #2 from YiyuanGUO (yguoaz@gmail.com) ---
(In reply to Greg Kroah-Hartman from comment #1)
> On Sat, May 08, 2021 at 11:14:25AM +0000,
> bugzilla-daemon@bugzilla.kernel.org wrote:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D212995
> >=20
> >             Bug ID: 212995
> >            Summary: A possible divide by zero in qh_urb_transaction
> >            Product: Drivers
> >            Version: 2.5
> >     Kernel Version: 5.12.2
> >           Hardware: All
> >                 OS: Linux
> >               Tree: Mainline
> >             Status: NEW
> >           Severity: normal
> >           Priority: P1
> >          Component: USB
> >           Assignee: drivers_usb@kernel-bugs.kernel.org
> >           Reporter: yguoaz@gmail.com
> >         Regression: No
> >=20
> > In the file drivers/usb/host/ehci-q.c, the function qh_urb_transaction =
has
> > the
> > following code (link to the code location:
> >
> >
> https://github.com/torvalds/linux/blob/dd860052c99b1e088352bdd4fb7aef46f8=
d2ef47/drivers/usb/host/ehci-q.c#L715):
> >=20
> > maxpacket =3D usb_maxpacket(urb->dev, urb->pipe, !is_input);
> > ...
> > if (usb_pipeout(urb->pipe) && (urb->transfer_flags & URB_ZERO_PACKET)
> >                            && !(urb->transfer_buffer_length % maxpacket=
))
> >=20
> > However, the function usb_maxpacket may retun 0, leading to a possible
> divide
> > zero problem in the remainder operation:
>=20
> Please feel free to submit a patch to the developers, but first see how
> it could be possible for usb_maxpacket to ever return 0 for this.  Are
> you sure it's not already sanitized by the time it gets here?
>=20
> thanks,
>=20
> greg k-h

To avoid any problem, the code should ensure that urb->dev->ep_out[epnum] a=
nd
urb->dev->ep_in[epnum] are not NULL, a case that is explicitly checked insi=
de
usb_maxpacket. It seems to me that there is not direct protection against t=
he
field urb->dev.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
