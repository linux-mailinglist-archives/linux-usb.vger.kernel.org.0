Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2806648BF6D
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jan 2022 09:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237926AbiALIDh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 03:03:37 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:56936 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237577AbiALIDh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jan 2022 03:03:37 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3F671B81E00
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 08:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0982FC36AE9
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 08:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641974615;
        bh=DbC1sleRt6iD0xhRApLMBXQ5rIzZjcdeNXG2tG8UxF4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=W+kSWi0+bYNsKsunymRvCyj6BkZ6jmAP+wSxdymhtMAhqWfwmisO//IhoVtcvtCR0
         Yz3X/n8PjxA6Sl/KaK4i/UubNUnl5DkBnS33TMSs8b26sIycicsbd3zSh/tZjTcHNJ
         R9imLz7Ff61KSR4ZU41z4HEkfGhDLVMpiDJa+SDZRWGjOXCqRbxUnAJru8m2NeC4in
         UbWvgAv8QndssOTN41fdADWIoPi1e+DBwRv9k/GHgmV6k/fxN5LHvUtPwfdeEiF3ab
         NQ83QQ/k28SLPdyeTun6W9jYeVxYphc3iLkKq3mcEP5sbg0irl9/MUys5z+L2BGKQP
         sPrA2uXQRsFHw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DCE06CC13A9; Wed, 12 Jan 2022 08:03:34 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215475] RMNET data connection speed would be reduced to about
 80-100Mb/s from 150Mb/s  if try to re-connect it
Date:   Wed, 12 Jan 2022 08:03:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: slark_xiao@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215475-208809-TGUyHg4aYE@https.bugzilla.kernel.org/>
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

--- Comment #2 from slark_xiao@163.com ---
Hi Greg,
  Yes, it also happen on 5.16. I tried it with 5.16-rc8.

  May I know what do you mean of 'usb trances'? USB protocol analyzer log or
tcpdump packages?
  Actually, I do the same test with another Qualcomm modem device (not the =
same
serials), and issue can't be reproduced with that device. Seems issue comes
from firmware of device. But we can't explain the difference beween Windows=
 and
Linux.

  So do you have any advice to confirm whether the issue relate with the dr=
iver
or not?

Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
