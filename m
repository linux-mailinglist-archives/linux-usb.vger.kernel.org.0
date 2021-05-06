Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE12374ECE
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 07:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbhEFFPV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 01:15:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:59652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229622AbhEFFPV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 May 2021 01:15:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8148661177
        for <linux-usb@vger.kernel.org>; Thu,  6 May 2021 05:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620278063;
        bh=9bJw/nJRfhNEAbyBj/xo8jjjml2oS+xUje+/cASPYMA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rrfINvWWlL6ud0CZJKhu+auamdeJTtYEx4kgZhImtMx9xn18WD5yP33AM6Aab3HgM
         i3AJdgfHeCi9TNFA0UT/dio0p1MSVCv30lxMt0yUT0OOFIceICImXvC7+Yflmllnzr
         Su6FXQKEEmdwo9K6tFBtkWxHMHA1mcON92PWkNBvHhFwglI0R0RVL2G5zSTHnxLxd2
         GAEVcmU0mTJNXLSq3rXqPDU1VB98HXPOARfhiG3t+LeV4Z2GCJKCJ3Nx7AGL098KCb
         c0RihDBnh30zxfmfr41nxZISkNnd+196Y1QSMSnFBwd3pBoPh2VNwzP6wmtU4qhy0E
         Jp2InJNIuA2VQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 7195D6129D; Thu,  6 May 2021 05:14:23 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Thu, 06 May 2021 05:14:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jaffa225man@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212955-208809-IClfiANzvD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212955-208809@https.bugzilla.kernel.org/>
References: <bug-212955-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212955

--- Comment #3 from Lucas Endres (jaffa225man@gmail.com) ---
Created attachment 296663
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296663&action=3Dedit
usbmon USB 2 port non-working

Sorry, I didn't know how to eliminate other bus/device entries (since this
non-working log would contain only seemingly nonsensical selections, if ":3=
:"
is grepped).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
