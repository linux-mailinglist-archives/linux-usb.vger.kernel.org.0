Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 690B53655D3
	for <lists+linux-usb@lfdr.de>; Tue, 20 Apr 2021 11:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbhDTJ6o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Apr 2021 05:58:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:44258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230204AbhDTJ6o (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Apr 2021 05:58:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B88256109E
        for <linux-usb@vger.kernel.org>; Tue, 20 Apr 2021 09:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618912692;
        bh=Ghda8TSw7EZuh9Prt54XGxoadg9VIX9t8VsoZempUWM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cqsJWfN4oAXWoevQpiv3vH14a02hdNd+8SOTVwaJLbBT1gTnqU9PW4jZ06XX0R3Z+
         VVfL44+99AzfmngIGrA8u5cox/Hsp/1YPk390k07mo7wrPYW6JlPMEzNJO2haFb9wS
         dFjL/MyN9kCFFlNOV1rDOngZD2bTzU1W3B1HndJdN/tDlg2hN8QLHYlkPjTqwwTmhR
         4tIACPetSBYgnKYf4I6R/B3c7hX3TJQQL9caDt4lBnndTkrv+dWU+UCoJtLxfYX/1f
         PX9csTNYM0H8cHgHDQZyj+J4/n1YG8pFP9Hzxh/TKH6OHEmLW5BZlmqCcjp/8LqzJC
         OMDPs4AAKSxEg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id A821061185; Tue, 20 Apr 2021 09:58:12 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212725] USB CDC ACM device stop working
Date:   Tue, 20 Apr 2021 09:58:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: oliver@neukum.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212725-208809-euPfUppF9G@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212725-208809@https.bugzilla.kernel.org/>
References: <bug-212725-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212725

--- Comment #3 from Oliver Neukum (oliver@neukum.org) ---
Created attachment 296439
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296439&action=3Dedit
fix a poison/unpoison imbalance

Please test this patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
