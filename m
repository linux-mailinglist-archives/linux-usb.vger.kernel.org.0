Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D566E3EFA58
	for <lists+linux-usb@lfdr.de>; Wed, 18 Aug 2021 07:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237788AbhHRFtb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Aug 2021 01:49:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:36832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237618AbhHRFta (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Aug 2021 01:49:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5514A61076
        for <linux-usb@vger.kernel.org>; Wed, 18 Aug 2021 05:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629265736;
        bh=Uu4+2tbWMZjPCvQnd2LuTBiryxEDZT6MEWyJXo4NC+4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=CH2redIXt93jOUgrY2tTVfmSrnqQhuahQ3aktApFj1IUdarY3dxrWqzWR2wj4Oct8
         HWkMVkIGQ/+sUK2Bf8i71aUPKBPEiB7KMH+VIwRrsSuM0bN4hMN0gAHY73JZU/XBsR
         N2J69vjAdMwM48D4kLIpeMRGGRlRVnjHrNxk7Eeia0QmNpQIvjN6qKwMU9nE1A53QH
         BvoM6Azyl4FTIr5qcAL+lzZ1SN5hyuAnlr4BDcte6ZLCh7bDXebMhF51sj3/+W+9KQ
         s5dnV3UVGKvdiIkn3vkrFTkMUoUGBT2Es+u4tQL8J7BsJmz0OmPt6FvkCt6L12Cinz
         nTi2cqpq1N4tw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 516F960395; Wed, 18 Aug 2021 05:48:56 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Wed, 18 Aug 2021 05:48:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chris.chiu@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214021-208809-4RrWeXvgUf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

--- Comment #8 from Chris Chiu (chris.chiu@canonical.com) ---
After lots of experiments, I agree the commit is not the root cause. Since =
the
commit applied on 5.11 has no problem, but it happens when applying this co=
mmit
on 5.4 base.
The confusing part is, I can't reproduce it by enabling the dynamic debug on
xhci-hcd even with the kernel 5.4 base. I'm still trying to find out what
exactly commit cause the difference.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
