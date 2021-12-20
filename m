Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4404C47A61B
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 09:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237947AbhLTIhY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 03:37:24 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:55794 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237925AbhLTIhY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Dec 2021 03:37:24 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1567EB80C80
        for <linux-usb@vger.kernel.org>; Mon, 20 Dec 2021 08:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1959C36AE8
        for <linux-usb@vger.kernel.org>; Mon, 20 Dec 2021 08:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639989441;
        bh=s7FivtEzJVv/f+pc/kGbuBsujxvUs8nBNsRrIdeEzao=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=boSlmAGCaHI0xaYaKWcr8LVklNBmx6UtCwpugvYktLWgL7s5yP8fvW5ViPjqjwJYY
         xR693wLCz/KyX1WZ0oZXbcHqo2XraxhMigmr+NhVS14L/DfCttxcSoOBCdhtziFWgy
         EayshjKIWT6qa+BtXCdnNcHFhmNl+a4VKUDL4lwsHgCjEJ6eIZg8lqaNWyamRQ2lvV
         FkmMPoun71og8Wud3BXQjLvDqEyhbXI4mRcNbasaUvDys90B5uQzgmTVYYMsVc87s3
         3qrybLa8iF5W9G6DjJuxE9mgDymKeTF8lSLvrm9+cK0qsmlViNfVMigZR7rXosp0j2
         svR8LtAcnkdUw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id A0DFA61101; Mon, 20 Dec 2021 08:37:21 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215361] SL-6000 zaurus USB error - 'bad CDC descriptors'
Date:   Mon, 20 Dec 2021 08:37:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215361-208809-AOXtQ89db0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215361-208809@https.bugzilla.kernel.org/>
References: <bug-215361-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215361

--- Comment #3 from Greg Kroah-Hartman (greg@kroah.com) ---
On Sun, Dec 19, 2021 at 06:14:00AM +0000, bugzilla-daemon@bugzilla.kernel.o=
rg
wrote:
> A 'bad CDC descriptors' error occurs when plugging the Sharp SL-6000 zaur=
us
> into USB. It was working in 2.6.32 but has been broken from kernel 3 onwa=
rds.

2.6.32 was released in 2009, and 3.0 was released in 2011.  Can you
please try a more modern kernel like 5.15, or ask for support from the
vendor that is forcing you to use older kernels?

Or, can you use 'git bisect' between the working and failing kernel
versions to track down the offending commit?

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
