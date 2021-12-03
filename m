Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB54466E6D
	for <lists+linux-usb@lfdr.de>; Fri,  3 Dec 2021 01:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244321AbhLCAXk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Dec 2021 19:23:40 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:38416 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242524AbhLCAXj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Dec 2021 19:23:39 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 52C12B8256D
        for <linux-usb@vger.kernel.org>; Fri,  3 Dec 2021 00:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16696C53FD5
        for <linux-usb@vger.kernel.org>; Fri,  3 Dec 2021 00:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638490814;
        bh=p9YtCTglLUK85hegQW0dCw9bomqmq0u7fAQbNoZxhQA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Qj4Rc//o/BQO9mEX+85o4txCV0ywaXSboapuaFSUnwXv9JqteUR5qVhVjZysQJJBQ
         K0m01eGuExUEiplovLFjjFxHduLF/fJRupKLb9fbSzeAFbxSCBVWfIcfp9DosR7oVE
         KHXG7iizdVjOitP0cwl4sJ3O8Bk4OeC7DTwuAlqzFr1ImCHB4UhGV3uc1U2XzhEYH2
         gWqMIrZF1O6EtKiq/olNdNlJjk61EMY4aE9wTObpYDojD3a7XwLWdPzdHjQmS47iqc
         Ef7OKTfJ0aJN/k/XhS5CTqxvhUHiEtvPhbgCXC+XjkuqGCd64406G7n45lxsMsTWbX
         jDI9R8iIvH+Qg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id EE2DF60FC4; Fri,  3 Dec 2021 00:20:13 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Fri, 03 Dec 2021 00:20:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t123yh@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209555-208809-4QGw81Rmgf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209555-208809@https.bugzilla.kernel.org/>
References: <bug-209555-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D209555

--- Comment #25 from Yunhao Tian (t123yh@outlook.com) ---
Hi remyvarma,

Are you using a rockchip device? I copied dwc2 driver from
https://github.com/rockchip-linux/kernel/tree/develop-4.19 , replaced the
mainline dwc2, did some porting work, and everything starts working. I'm not
very sure what's the difference, but it just works.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
