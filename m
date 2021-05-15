Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48B3381A3E
	for <lists+linux-usb@lfdr.de>; Sat, 15 May 2021 19:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234200AbhEORqc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 May 2021 13:46:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:40542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231480AbhEORqb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 15 May 2021 13:46:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B2FB2613AF
        for <linux-usb@vger.kernel.org>; Sat, 15 May 2021 17:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621100717;
        bh=J1hCA0t7ZVZo/+57oAwA/LeD7iM1mdzBcI4bBJ5teM4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JrifBTGytyCORSZcJsxHYprl4HA2FOYZq55oPT9JULPBpiQd2VTzL084R7tBe/AkS
         9SQMMLJBSLl6McDH3ify6bwSaZPx6PEd3jYGXATo89VOPsKFD3M2DscQxIfI6lxgDj
         TyS3gpTu2TO82xrPY2cBP/eZJ1blnN1eo5cl6Hih9p9pnGFFAAaAvuLuEOPSFmqxEG
         Ha7i79SPFoGZgqY4KPTpA79Z4xfTQUbSY1iBQ+5JEOxfHiqr/EADUX8sNMJM7R2hzU
         VqD4zwjEPLxa62Yq0XkY8OGFPOmwmjL+4AUmgX8PwXV9wYHeXl2vs8TgOv8q3rnBF1
         mU+8cC7NxgWAA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id AEF22610A4; Sat, 15 May 2021 17:45:17 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Sat, 15 May 2021 17:45:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: peter.ganzhorn@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213081-208809-Ml00ORGDgK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213081-208809@https.bugzilla.kernel.org/>
References: <bug-213081-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213081

--- Comment #4 from Peter Ganzhorn (peter.ganzhorn@googlemail.com) ---
Created attachment 296785
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296785&action=3Dedit
usbmon trace 5.12 bus 5

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
