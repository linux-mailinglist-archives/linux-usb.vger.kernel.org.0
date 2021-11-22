Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1879F45889E
	for <lists+linux-usb@lfdr.de>; Mon, 22 Nov 2021 05:24:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbhKVE1g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Nov 2021 23:27:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:42080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229870AbhKVE1f (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 21 Nov 2021 23:27:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 156CC60F42
        for <linux-usb@vger.kernel.org>; Mon, 22 Nov 2021 04:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637555070;
        bh=GUx3D5L+ipV6zhrYO17NeSp9YQwgUlqhG+lhoK+a9f4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=boPwI0oH7163WgEBAnB/NYFtMv9nicQctFw5LBVLwALTdqm+3KG8I5IBGhQraxwx9
         xLc8K/qvymWYx1RTkMA+bumzTxfLMA7rL74x+8NFVOnTEdyVMW9xU1h/8DK4iKUZyz
         K9wQGp+7KqpygmhBuuGbA6Chg0YWjnOsSUxB/YIEKJzckuzhb4+93ia0K4CRdqMF0C
         zitMx5ZkllXewCdR3SDwG41txohglukdnppseSn2GRwlnI76b8tVLj8sfZh8Pd95Th
         eItUuRljrYiBrj0NnYAlaMRqb9ntbK+lBOdAy0DJqUxYUfXAkCUeWx+7aTlzTr5PCC
         iBFNFkmvXs8+w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id BFE2C60F51; Mon, 22 Nov 2021 04:24:29 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215095] USB ehci error -110 and soft lockup on kernel 5.15.4 as
 kvm guest
Date:   Mon, 22 Nov 2021 04:24:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wangyugui@e16-tech.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215095-208809-zhouNxh2e5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215095-208809@https.bugzilla.kernel.org/>
References: <bug-215095-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215095

--- Comment #1 from wangyugui@e16-tech.com (wangyugui@e16-tech.com) ---
althought we can work around this issue by revert 90d28fb53d4a(usb: core:
reduce power-on-good delay time of root hub), but we still need to fix this
soft lockup?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
