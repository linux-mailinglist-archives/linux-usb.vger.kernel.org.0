Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B00CA3F74CD
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 14:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240593AbhHYMJK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 08:09:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:54044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232681AbhHYMJK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Aug 2021 08:09:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F3D8B610D0
        for <linux-usb@vger.kernel.org>; Wed, 25 Aug 2021 12:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629893305;
        bh=iDUiVh1ACREwPD9ntgVJFjPKZL7GoLJEzyFYugGohNo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=a6Y9wItABVix17NQZrJqWmG4v4xaD6g+gNBA8pgh8VSKwI6jlhkuRleuloWFpsc40
         MH19tivD6cgYKKcOafzu/vlwyEilgz1rNXTud0TNfK4r29SQoEWlwmSFU0y6jh1S0i
         86R5FC223dD/M60k7ZGaHYjj3G29eFqUIWjCxOaIrVeIdEUhCerMG13nKioNpW9r44
         2JB6q6/wroHQjPS9rjD1Wde52NalD5+LP3xKfcKgUmh/9+sNTYynf93gRP+x/omx5+
         6XxHswGOPmC4vHHAy9AkhKCmyu+M365RCq88T5ZKQIZef5AW91P99AUFEBTOcL3uRa
         vQ1VLWGjqiqDA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id E526561002; Wed, 25 Aug 2021 12:08:24 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Wed, 25 Aug 2021 12:08:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chris.chiu@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214021-208809-giXqvDU66T@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

--- Comment #14 from Chris Chiu (chris.chiu@canonical.com) ---
Thanks to the upstream patch from Kishon. I've tested and it works on my ke=
rnel
5.4 base which used to have problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
