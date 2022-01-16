Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABFA48FAA5
	for <lists+linux-usb@lfdr.de>; Sun, 16 Jan 2022 05:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234249AbiAPEYA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 Jan 2022 23:24:00 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:45352 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbiAPEX6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 Jan 2022 23:23:58 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 0A609CE0B6D
        for <linux-usb@vger.kernel.org>; Sun, 16 Jan 2022 04:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46525C36AE9
        for <linux-usb@vger.kernel.org>; Sun, 16 Jan 2022 04:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642307035;
        bh=pgmf70FeaLTvfGfWGZ+XxCCSntaBR4hHoS2Ju3tNOWk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fBeBKPB8tIS5B/ZWW36vkOtB3xp2bu7oGSnESLp0loIdWwcUlQq9/55tSZSB/QDsJ
         P2Y7Cc4K/vKBx9ounaaNjpyca8UlBFaH4PQT25tsGw+lRzf6vF/b3ZGANkLvD/XALs
         0awC9dx1gOb9/YAdFogVpUwXNHDr3k2O5Pj/bgqxABtvJiWNGMZZJSb2i9tGEetWCC
         x0rQYG22eJdP/W+9LUMVDIL/k3XMjA8Z60Hgwpm6xVDSspZNgZqJ7uuxpf4g11DV5O
         MQlfC1s2McaAKao6rNtBYH92snmKOYPg9kTrel0yvMBqp7Xx1Lbz5ADejrqdYFXKkV
         hiOEY3YJTX4vg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2A660CC13AE; Sun, 16 Jan 2022 04:23:55 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215361] SL-6000 zaurus USB error - 'bad CDC descriptors'
Date:   Sun, 16 Jan 2022 04:23:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: bids.7405@bigpond.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215361-208809-e4bAGJUzcD@https.bugzilla.kernel.org/>
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

--- Comment #6 from Ross Maynard (bids.7405@bigpond.com) ---
Hi Greg,

I found the patch:

Bisecting: 0 revisions left to test after this (roughly 0 steps)
[16adf5d07987d93675945f3cecf0e33706566005] usbnet: Remove over-broad=20
module alias from zaurus.


On 21/12/21 7:20 pm, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D215361
>
> --- Comment #5 from Greg Kroah-Hartman (greg@kroah.com) ---
> On Tue, Dec 21, 2021 at 08:07:37AM +0000, bugzilla-daemon@bugzilla.kernel=
.org
> wrote:
>> I am wondering if there was a change in the cdc_ether or zaurus modules
>> that caused it to stop working in 3.0.
> There probably is.  Can you please use 'git bisect' between those two
> versions to find the offending change?
>
> thanks,
>
> greg k-h
>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
