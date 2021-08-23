Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B81443F459E
	for <lists+linux-usb@lfdr.de>; Mon, 23 Aug 2021 09:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234909AbhHWHKG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Aug 2021 03:10:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:60154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234861AbhHWHKF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Aug 2021 03:10:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 12BD761220
        for <linux-usb@vger.kernel.org>; Mon, 23 Aug 2021 07:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629702563;
        bh=wPKwy6Mrpj3nLtNLgBUKbrVcRdRow2vKjJW6UbXYg/A=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Mj/l8zavyIJok+MfZeHZI5pDMgWdrn520IjG11IdGqo1RyaMPQF3TN+T3iq3o72YW
         KVjiIKOHQfQlbtsPqOdnYbcwm1BCv8NMDXkF2ORqEKdmAhzjmfI80EXDh6NgTwmkNt
         J3BCwuGlHH6INeDmf2HbnWGktiruSulIJ0jAIxL4DlC0SVieVMOwq8M4SAubnosrfq
         kU6J0TtjauFbJkUnlOFl2SeK54GxBBTn4s87mqeMcfNkQjYeYwwlZrJ1MXttUdZeUh
         OWaqfZ38QcNqKMrZqvowaC4mkDCeemaPuKLXbwm0je/wdA3fihMqqybOSl5vHI58PX
         1G1UEfBxBj95Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 030E760F94; Mon, 23 Aug 2021 07:09:23 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214131] ch341 communication problem
Date:   Mon, 23 Aug 2021 07:09:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pb.g@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214131-208809-J45awxXefw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214131-208809@https.bugzilla.kernel.org/>
References: <bug-214131-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214131

--- Comment #2 from Paul Gr=C3=B6=C3=9Fel (pb.g@gmx.de) ---
Indeed, removing=20

.bulk_in_size      =3D 512,

and recompiling my 5.13.10 kernel solved the issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
