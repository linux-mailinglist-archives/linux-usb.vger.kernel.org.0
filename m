Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 893B6482529
	for <lists+linux-usb@lfdr.de>; Fri, 31 Dec 2021 17:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbhLaQcP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Dec 2021 11:32:15 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:36650 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhLaQcO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Dec 2021 11:32:14 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 45CB7617C3
        for <linux-usb@vger.kernel.org>; Fri, 31 Dec 2021 16:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95837C36AE9
        for <linux-usb@vger.kernel.org>; Fri, 31 Dec 2021 16:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640968333;
        bh=QTc/PaqVNnMTtI8FSAdRHQuUNubtxYAV/OYRYam1R8k=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Nr+QcUjM1SKXQ9MHT/k2VbFsmlleBEwMSFpEI+qGo1rn+0vKJlgiiFuhJgt1DmXsv
         h+PCDBq4H7zoibEFiLao39zTHo8tBjqdsFynTgWmgQLqpQfk2Wa86cfPUto04i22H8
         tJ7PJ4Bb4Scsa8UHpl2A58vwbi4SV4omWgUSYA+/D3PAHrBqgufKxB/U+V+Z3bGBUm
         9xyTqySC+4Evm/p8slfVa3YatsOsNcrtFR/C3pI9rvmmCvkCwk7reTD+E4pghmGk82
         j0LxiqRuci7nlyXjLVGlYaAw1jKQjzqcLcCuaJSmx0Np+u2hPtg5ACAkx46Pg4Er2s
         u4MR/0Z2g612w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 751DBC05FCF; Fri, 31 Dec 2021 16:32:13 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213839] XHCI 7 port usb hub does not work correctly
Date:   Fri, 31 Dec 2021 16:32:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: noodles@earth.li
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213839-208809-UIohM3A7Zn@https.bugzilla.kernel.org/>
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

--- Comment #7 from Jonathan McDowell (noodles@earth.li) ---
Created attachment 300189
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300189&action=3Dedit
Plugged in under Windows, USB flash drive inserted into port on second hub

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
