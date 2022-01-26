Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38C7A49C64D
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 10:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239149AbiAZJ2U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 04:28:20 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:34002 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239117AbiAZJ2P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 04:28:15 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 14BC2B81AD3
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 09:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCC37C340E7
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 09:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643189292;
        bh=78TZ17HtDyJN6vJdYJZL2Etnjc8j/LVPwwa6bjyc7Yc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MDxamSKK7L4zZH6kjeGl3t50UvB1u/AmG2NTnNrT3u1P/ptWze0LYdVqXe/GtHXrg
         tveORMQkBqlkvas9U5kul6/2nWM2cyt+GGZSZH9acfuSlA4igg5yfuIBx1ikfDYROk
         WT6QUyR12E8Tv/KIvBKXOJnX4yVhQEya3Gjg+CmGyBM6BKrDO/P9BhrvH+gVBaqIF8
         lLCbcYVWpJ7ySSbImyJfSHNrQKr1PdDD9dFpNcxKMb7erHQOMQTjJym4thWvUPbsjO
         EZp+DzyZDyk8s6V3k4pJj2peBQAaKZA47XRUF5rnLhXyMjyC64pNY6egt1DG2tTx3L
         iWL9Fru/b9n1Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B7481CC13A7; Wed, 26 Jan 2022 09:28:12 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215530] typec kernel error
Date:   Wed, 26 Jan 2022 09:28:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hi2@n101n.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215530-208809-L5IcdeFYuH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215530-208809@https.bugzilla.kernel.org/>
References: <bug-215530-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215530

--- Comment #2 from neoe (hi2@n101n.xyz) ---
(In reply to The Linux kernel's regression tracker (Thorsten Leemhuis) from
comment #1)
> I'm not involved here, but I wonder if this will help:=20
>=20
> https://lore.kernel.org/linux-usb/20220124090228.41396-3-heikki.
> krogerus@linux.intel.com/

Thank you for the information. I also tried that patch, but not work for me.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
