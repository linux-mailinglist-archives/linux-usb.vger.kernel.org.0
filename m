Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31B8848C01B
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jan 2022 09:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345956AbiALIlX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 03:41:23 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:54578 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349336AbiALIlQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jan 2022 03:41:16 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 74C6C61857
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 08:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4E2BC36AEA
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 08:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641976875;
        bh=4EU8eAGvZcd97a65flVq1sWRg3wSqpvpaZj+F/BWt0Y=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oB0IbQmOVHRoY4gcY+oP1/ZpR7rFH7cmzx9FNUjXjjUUmaEBsrHVyBHu0pm1AaxZ/
         UUeN5l8DXpu3JTYdLE+GUDEzK9kDIxIVFiYLUwt0xXq5RpUD1SYITMtKDcQMh9kb/z
         LSWtaDbgXpTXYKubza8xUWtKYicrBKGcFExlamGMilUdbrkkVFfE9RzGlZDBHfjR7R
         vo7rVdUSAk8+rlhJS7u2nMy5bpFREqny1ZyzFSMBoHl/3EYQFSeCv+IvfJHVPmggGT
         8/+9HyTBaW4ndkhrTz0eo3pgp8Z148MPXzZvE7PpX8WEo3Qa3w5onUHzYmi+gbmdm5
         iss5NQJ8Gba1w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B90CFCC13AD; Wed, 12 Jan 2022 08:41:15 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215475] RMNET data connection speed would be reduced to about
 80-100Mb/s from 150Mb/s  if try to re-connect it
Date:   Wed, 12 Jan 2022 08:41:15 +0000
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
Message-ID: <bug-215475-208809-9oQM6XRkHT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215475-208809@https.bugzilla.kernel.org/>
References: <bug-215475-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215475

--- Comment #3 from Greg Kroah-Hartman (greg@kroah.com) ---
On Wed, Jan 12, 2022 at 08:03:34AM +0000, bugzilla-daemon@bugzilla.kernel.o=
rg
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D215475
>=20
> --- Comment #2 from slark_xiao@163.com ---
> Hi Greg,
>   Yes, it also happen on 5.16. I tried it with 5.16-rc8.
>=20
>   May I know what do you mean of 'usb trances'? USB protocol analyzer log=
 or
> tcpdump packages?

USB protocol analyzer log is best, to compare the data streams.

>   Actually, I do the same test with another Qualcomm modem device (not the
>   same
> serials), and issue can't be reproduced with that device. Seems issue com=
es
> from firmware of device. But we can't explain the difference beween Windo=
ws
> and
> Linux.

Then please contact the vendor that wrote the firmware, they can help
you out the best with this.

good luck!

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
