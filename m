Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02AD846A3D6
	for <lists+linux-usb@lfdr.de>; Mon,  6 Dec 2021 19:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238736AbhLFSUo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Dec 2021 13:20:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbhLFSUm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Dec 2021 13:20:42 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7C9C061746
        for <linux-usb@vger.kernel.org>; Mon,  6 Dec 2021 10:17:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 263FAB811C0
        for <linux-usb@vger.kernel.org>; Mon,  6 Dec 2021 18:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6195C341C7
        for <linux-usb@vger.kernel.org>; Mon,  6 Dec 2021 18:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638814630;
        bh=CXQjMLQlWfqXv0Yx61Jr4eRU6igY/S47/39LJNsxNBA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YxJs2Xqvxn+Kjh/I8I4xlqryxB8DbPkxpAss6BbqJey9nV1pAmjS7YIFrx0X61jGL
         fxDq8m7tGdP9+pwmnRxaukF6+W8H5z+sHeW59cCufeqHPlRDh/0RFQKN2islwrh5Sr
         nEneU0zXtD0v+a0PTiDsdIkVwyjaVg6mwiYkNQ2T8VHBXHBYrfiF+7jhrJAHUCo68b
         WVBhUR8JqBVj8r8GP2b5dVvB4LIiHOBGXQpKl8XC/8qxQYyitO8GL0M47kyjFzhRXL
         cfGbQxTR1EWqYlir2svc94CxyLE1PnUe1lsDDvNlntiH/rEUgMUVOW0WcFM1axdJbH
         vb9Q21P9Nlayg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 9459061106; Mon,  6 Dec 2021 18:17:10 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215241] "usbreset" tool causes hung task on kernel 5.15.3+ with
 Hauppauge WinTV dualHD
Date:   Mon, 06 Dec 2021 18:17:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215241-208809-HwZ5cKdgdB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215241-208809@https.bugzilla.kernel.org/>
References: <bug-215241-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215241

--- Comment #1 from Alan Stern (stern@rowland.harvard.edu) ---
You can try using "git bisect" to find the commit which caused this bad
behavior.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
