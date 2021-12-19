Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAF147A21C
	for <lists+linux-usb@lfdr.de>; Sun, 19 Dec 2021 21:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231972AbhLSUqn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Dec 2021 15:46:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbhLSUqn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Dec 2021 15:46:43 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EE37C061574
        for <linux-usb@vger.kernel.org>; Sun, 19 Dec 2021 12:46:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EABEFB80DBB
        for <linux-usb@vger.kernel.org>; Sun, 19 Dec 2021 20:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB43FC36AE8
        for <linux-usb@vger.kernel.org>; Sun, 19 Dec 2021 20:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639946800;
        bh=V08P9AlCQvyygoGdqNxyyjMjOmiIWsFmmeXJQwv4S4c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Dlbg4f57zuJI5C0eHJgXfAGCocFfcELRHJ50VZ0pbEeV+In406ABM6W8orVd6YvAd
         QQrJ/t8JnJoYLD/IlMI/Y2pd9tmFiPc9GsPYfUa5lzNHjMxXBMcWLTKVSbWLJZJLYY
         TjnbhnIAyMwpwam1mlU/MYxBpppU27GdZgKSxfoFiGQWH5TbHgdPeqemFVq0kj37LW
         56CefHyOiEG9v3Uu6eYo3QPUFbAYOYcNRNcZoANqRa5tpq5Aeg2/5i8+vifSZ5KQIr
         Lvuk+ukcgRE+d3QSSaAtCUWXBFHd7IEVlFQkHfCaAjmDlZOlWCO/kD5i265x+lAXRJ
         14b9cLnUlTfXA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 85FC4610A8; Sun, 19 Dec 2021 20:46:40 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215361] SL-6000 zaurus USB error - 'bad CDC descriptors'
Date:   Sun, 19 Dec 2021 20:46:40 +0000
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
Message-ID: <bug-215361-208809-NvhhHqEeft@https.bugzilla.kernel.org/>
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

--- Comment #1 from Ross Maynard (bids.7405@bigpond.com) ---
Correction:

In 2.6.32 the following lines were included in dmesg:

usbcore: registered new interface driver cdc_ether
usbcore: registered new interface driver zaurus
usb0: register 'zaurus' at usb-0000:00:14.0-2, pseudo-MDLM (BLAN) device,
fe:1b:05:23:49:7f
usbcore: registered new interface driver zaurus

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
