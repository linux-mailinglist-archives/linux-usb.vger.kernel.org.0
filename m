Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9E0330B8B5
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 08:36:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbhBBHfv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 02:35:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:55892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229920AbhBBHfj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Feb 2021 02:35:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id BA73564DDD
        for <linux-usb@vger.kernel.org>; Tue,  2 Feb 2021 07:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612251298;
        bh=1MYPBTJzheCviQxechVGUl36Dh6esNgoCi7dMzBUb1w=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HhQCBm3rsDA0S4udOO8WW9WWc9KjmccAXl/5F3Xb94TWyFnAi7j5xgY9QdLF4cgTS
         b3nO45WXd+QybRHqyyElYRZutTXFjn2y6MwK7WUwzu3kHBG47IMm2YbU7H9K/auDiB
         vCfAV8MnZafs8t9lybrYtjyBd/dIGu6sb0AJR/elthCLx2nDvVUfs+2UMpirW5bzfF
         8h1JVabbd6EXiiEdIxBqoQX0qvPaJMmc68Wk8sFL+kzGaLZL7bKyz69GM9ADevGSkB
         pNMFwj1j6YBvi4KdF8XlDzu/qxdKWXf2X2EPFP+koQseFCLYZsEydd6d4avnPMxP1d
         toPALGoGi61cw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id A98CD65308; Tue,  2 Feb 2021 07:34:58 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 211525] USB Canon DSLR camera seen (lsusb/dmesg) but no longer
 accessible (not mountable)
Date:   Tue, 02 Feb 2021 07:34:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211525-208809-Ciy1blKqcL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211525-208809@https.bugzilla.kernel.org/>
References: <bug-211525-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211525

--- Comment #2 from Greg Kroah-Hartman (greg@kroah.com) ---
On Tue, Feb 02, 2021 at 03:49:04AM +0000, bugzilla-daemon@bugzilla.kernel.o=
rg
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D211525
>=20
>             Bug ID: 211525
>            Summary: USB Canon DSLR camera seen (lsusb/dmesg) but no longer
>                     accessible (not mountable)
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.4.0-65-generic

As this is a Ubuntu kernel, please ask for support from Canonical, they
are the only ones that can provide it.

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
