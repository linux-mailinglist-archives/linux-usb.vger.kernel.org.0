Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36F5B49AAAD
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jan 2022 05:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386711AbiAYDov (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jan 2022 22:44:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S3414979AbiAYAyx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jan 2022 19:54:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58DD2C07A942
        for <linux-usb@vger.kernel.org>; Mon, 24 Jan 2022 14:39:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 414E361414
        for <linux-usb@vger.kernel.org>; Mon, 24 Jan 2022 22:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A90F8C340E9
        for <linux-usb@vger.kernel.org>; Mon, 24 Jan 2022 22:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643063960;
        bh=ukEesz4WeUj4bLI2RkxjhhC8uWoaWSnPKRo7MyaM3dY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GhT+j3GddDc3dDxhxA0q6U9yzAIr7xGE7G4KjcwV/aY2zNWjo6uMbSm/P6VFY/Kjk
         5l7+eg8VJvHANKX/7XIHOyScMoBqFOo8oZrNsGTdmyfI0weNUmnfTpfhz6qvjfbnvj
         y1JmATgYdMtkLzAXWrjwfjP8b7sI7RLAZdUU/vaZoZUxtajmibbBaZoBOWgIjs0+3s
         zDcCT6PYPPmiitb+TlEgZBIgG+OG6DxpEP9DOTZN61/HK1PF2hFxB+wjTpxZTulNce
         kFzm2YZsyLSwsx+IfBotRnXgQCeEupTwy6nmgtfBKi4I0aiTjehBnsYwWaLw8OxKjd
         ueXpBPQAieT3g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 993B8CC13B0; Mon, 24 Jan 2022 22:39:20 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215529] REGRESSION kernel NULL pointer crash in
 typec_link_ports
Date:   Mon, 24 Jan 2022 22:39:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lenb@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215529-208809-fk95kzQBrj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215529-208809@https.bugzilla.kernel.org/>
References: <bug-215529-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215529

--- Comment #1 from Len Brown (lenb@kernel.org) ---
Created attachment 300312
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300312&action=3Dedit
Dell XPS 13 9300 dmesg before patch

Usually the system hangs before I can log in.
but sometimes it comes up and I can grab the dmesg before it hangs -- attac=
hed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
