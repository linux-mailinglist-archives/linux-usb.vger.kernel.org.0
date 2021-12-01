Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1AE14648A8
	for <lists+linux-usb@lfdr.de>; Wed,  1 Dec 2021 08:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347557AbhLAHgP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Dec 2021 02:36:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233520AbhLAHgO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Dec 2021 02:36:14 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E001C061574
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 23:32:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 83BEECE1D49
        for <linux-usb@vger.kernel.org>; Wed,  1 Dec 2021 07:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84341C53FCC
        for <linux-usb@vger.kernel.org>; Wed,  1 Dec 2021 07:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638343970;
        bh=uHEr1nMzAIhUpWAnFGhwnUmQuo8NSprzx+pXj5tS8kE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QIkEml7g6sc6DrSNrzZp4i+TG8GxEdr8g47geBITMORTrK1cLS3OfYVo3F94xm6l+
         KTYCKMWfIT43IWb+6MmWvBObAIo/GFXV4w9OykySQ4cn2Zjh0mdwihTUa9hnr8Fefi
         6UN+q5geCdobsJpDZAkiG2iave7F8o8nhw1gz80lfJUdM/8i4aJcpUkCdxiHJO9SMy
         Mo6JQ3p8ZpL2U304JSXofm6rF3UVeCD8abTcGpcIooqSp2ZkIsGDiBzR9D/jlhHRle
         ruqFhmAUb1CcxKYFj72laAQYkVIYD050XC4hljRiXBV1s6RNXFcJOXI27Oc7KvVH+o
         e/QP9k/11hDuA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 6C6C460F26; Wed,  1 Dec 2021 07:32:50 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215175] thunderbolt: consistent system freezes with Dell
 U4021QW, general protection fault, probably for non-canonical address
 0xdead000000000108, Workqueue: events tb_cfg_request_work [thunderbolt]
Date:   Wed, 01 Dec 2021 07:32:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215175-208809-DjiXm18RQU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215175-208809@https.bugzilla.kernel.org/>
References: <bug-215175-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215175

Mika Westerberg (mika.westerberg@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mika.westerberg@linux.intel
                   |                            |.com

--- Comment #1 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
This looks like some sort of list corruption. If you are able to reproduce
this, can you add "thunderbolt.dyndbg" to the kernel command line and attach
full dmesg when this happens?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
