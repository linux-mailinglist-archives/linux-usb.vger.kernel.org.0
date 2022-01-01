Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDFE4827F0
	for <lists+linux-usb@lfdr.de>; Sat,  1 Jan 2022 17:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232518AbiAAQ01 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Jan 2022 11:26:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbiAAQ00 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Jan 2022 11:26:26 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A574C061574
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 08:26:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 55597CE091F
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 16:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86048C36AE9
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641054382;
        bh=QkrCfXSXJGxu3Z2IOU4h6/uPaaKTDDmEaCPTcd19dXg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ZwuUM+OnMYc8GgL4wVNN1hDfLOqMC+1KALrMxoPhQXONjag/d+iIU3KiDRqjg6etD
         7lcvGumzWOXWgd/ct/Try/I1LZA/RgsLhdbu2Knrz81aud+B+PlZhk1pJQkaKfk2nD
         1ydzNizKv0NZpok/0TaebeyLf3EfbRJzkgrTzcGtNrBp9Kgj+1ywNiufqJC5VfPRnd
         Z40LOoi2E49LltMeWyl8bAUwVUiMGgA2bEhfQWAABSaMoO6JjstHMI+mQbFEUCm/bU
         9nWlM8VKktDpbYW0q0ArxdpLp3rUECNbWS5iJBXiVLPQ68sumtv1y+ZhdZ4CizdyIe
         9ZcAiesd1gqiQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6CB4EC05FDD; Sat,  1 Jan 2022 16:26:22 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213839] XHCI 7 port usb hub does not work correctly
Date:   Sat, 01 Jan 2022 16:26:22 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213839-208809-oAlvmOr6hb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213839-208809@https.bugzilla.kernel.org/>
References: <bug-213839-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213839

--- Comment #15 from Alan Stern (stern@rowland.harvard.edu) ---
Created attachment 300199
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300199&action=3Dedit
Mark child resume requests in hub->event_bits, not hub->change_bits

Congratulations on tracking this down.  Later on I will send you a patch to
disable autosuspend for these hubs, if it turns out to be needed.  But for =
now,
I'd like to track down the exact pathway for the problem, if you don't mind.

Can you test the attached patch?  It looks like there is a bug in the hub
driver's resume handler.  When a resuming hub sees that one of its downstre=
am
ports got a resume request from a child device, it sets a corresponding bit=
 in
the hub->change_bits variable.  But this variable is meant for connection
changes, not suspend/resume status changes; which explains why the child hub
ends up getting reset.  The bit should be set in the hub->event_bits variab=
le
instead.  (If you read through port_event() and hub_event(), you'll see how=
 the
two variables are handled similarly but not exactly the same.)

This bug wasn't noticed before because non-buggy devices don't change their
descriptors, and hub_port_connect_change() is careful to check for cases wh=
ere
there wasn't a real connection change (i.e., device is still connected, por=
t is
still enabled, and device descriptors haven't changed).  But your buggy hub
does change its config descriptor and so it gets reset.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
