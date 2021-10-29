Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0AA544033A
	for <lists+linux-usb@lfdr.de>; Fri, 29 Oct 2021 21:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbhJ2Taa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Oct 2021 15:30:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:58774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231778AbhJ2TaJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 Oct 2021 15:30:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D448F610C7
        for <linux-usb@vger.kernel.org>; Fri, 29 Oct 2021 19:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635535659;
        bh=6ddaQdgkhCeVTq8IlypzvmuGGpj8Hq4wL/fiEdrXaVg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=K3ory+3wYGO8ORJY3uCywVGQrEQK/0s0i9tseReSFduX9TL07NOjjjCEBNHm+OfGn
         E6L01XQZ2td0HYMQeH8aVEDuNOPaqpGfZ7Ft5evyByuWyXKzn3zqTtSeDYSfn3IVQ4
         pRnHpJEKXVfoutKVgcL8NBrzqI8kpHv6bWIfx1+E9MQhe1R08xmNV9kATXYuOOz45M
         2VvyhuRJmW05V/zxvMS2g4OyoYrrCieajWgY2ymiZmSRn1vcNAKHqchJSGEYwiVVEk
         9tThhQd6ET0KmXIBgHPDIHx4AJl3swM+LtDGRl/Ypn5sRyGJHCmPWIisNNhyAB3HlG
         ACFF7ZibnNHpA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id D00BC60F14; Fri, 29 Oct 2021 19:27:39 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Fri, 29 Oct 2021 19:27:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: meven29@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-AqUFrRfMBu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #7 from M=C3=A9ven Car (meven29@gmail.com) ---
I have this naive patch that fix the main issue:

diff --git drivers/usb/typec/ucsi/ucsi.c drivers/usb/typec/ucsi/ucsi.c
index d0c63afaf345..a679359c98be 100644
--- drivers/usb/typec/ucsi/ucsi.c
+++ drivers/usb/typec/ucsi/ucsi.c
@@ -187,11 +187,22 @@ EXPORT_SYMBOL_GPL(ucsi_send_command);
 int ucsi_resume(struct ucsi *ucsi)
 {
        u64 command;
+       int ret;
+       int i;

        /* Restore UCSI notification enable mask after system resume */
        command =3D UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;

-       return ucsi_send_command(ucsi, command, NULL, 0);
+       ret =3D ucsi_send_command(ucsi, command, NULL, 0);
+       if (ret)
+               return ret;
+
+       /* update all connectors */
+       for (i =3D 0; i < ucsi->cap.num_connectors; i++) {
+               ucsi_connector_change(ucsi, i);
+       }
+
+       return ret;
 }
 EXPORT_SYMBOL_GPL(ucsi_resume);
 /* -----------------------------------------------------------------------=
---
*/


Will probably post to LKML

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
