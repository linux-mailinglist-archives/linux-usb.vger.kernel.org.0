Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70650466EA2
	for <lists+linux-usb@lfdr.de>; Fri,  3 Dec 2021 01:41:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377869AbhLCAoZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Dec 2021 19:44:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377875AbhLCAoW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Dec 2021 19:44:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F01C06174A
        for <linux-usb@vger.kernel.org>; Thu,  2 Dec 2021 16:40:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 021B9B82025
        for <linux-usb@vger.kernel.org>; Fri,  3 Dec 2021 00:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA2CCC00446
        for <linux-usb@vger.kernel.org>; Fri,  3 Dec 2021 00:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638492056;
        bh=ytlVK+PXLwRw+lyxvVBT9ZsiMfe4t9GvfEJGVzGxJq0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=hvyUTSnHRgHR03+CaWNPssmzf49b1fQiFoCxJNaqatdrnzOoD3uzyriSt3hiNYBJc
         Yqg8jmyICeOxvl7hbtvr2A6VSARpgzm2g1Fhkh2jr99qMjfR2jHraaZcLjobSYVqSr
         ycDNn9MH/sn5iI8xett5w45sKQyxPfsI1hBNv/BuRUTrkc9zWGaXPlG1GasNHUUy9T
         ah5HO6MvSSaYuU62ucU+lOenxSgVJDHTDCZtT0edQFLlWR0B40KN3np0el8hhhaE9J
         Jt8edSLhE9LkBQL/8vc3ryWIJ3MFVQ4D+AGmKeYQBrswzE8PHUl3Asfbxt97TqcMzm
         L+YKXPnJLik4g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 96DD860FC4; Fri,  3 Dec 2021 00:40:55 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Fri, 03 Dec 2021 00:40:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: remyvarma@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209555-208809-gbIW8wTBue@https.bugzilla.kernel.org/>
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

--- Comment #26 from remyvarma@gmail.com ---
I am... rk3288. I was thinking about doing the same thing (although it seem=
s a
little hacky). I wonder if you wouldn't mind sharing your port for the time
being?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
