Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02D7248274A
	for <lists+linux-usb@lfdr.de>; Sat,  1 Jan 2022 11:39:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbiAAKj3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Jan 2022 05:39:29 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:50518 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiAAKj3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Jan 2022 05:39:29 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E0214B80CFA
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 10:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6C92C36AE7
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 10:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641033566;
        bh=0yptjrcegiIRIkOmRuYmPmDM3+pXptuc7FJwqCIM00M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=F7LSpSdu1o8vKLwcImjpR+09K2NfXbDnLwSqojq/RWv8CG/i1ejlrG0m5ISKn8MZR
         CSSv7mwaLRA1NirArpCUJmzFKerIZXDBROAZbRYyK66Os2gsd2h1WtyNB1ZcLLjkyN
         Ymb9XrtI0OYWu7ppgUxj+WsoGgnajei4dlvOUHiha9mAgkLKNFUkYxrNKQjmBgqDi8
         Y2bRDUcw6aWRBHmIQ9WRejwGOSflZbiNuF25Rua7ipOj5z/4v+3wqWInlFRX+zVT+u
         //EKj4P2uj+LSbiUsNObXmyKgbiELjBnamCfEKwwi4tAm6IACOTo/Wt3o+47PM4f1b
         g8rTGrYReJT0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9E19DC05FCC; Sat,  1 Jan 2022 10:39:26 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213839] XHCI 7 port usb hub does not work correctly
Date:   Sat, 01 Jan 2022 10:39:26 +0000
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
Message-ID: <bug-213839-208809-nUz5m1uezJ@https.bugzilla.kernel.org/>
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

--- Comment #14 from Jonathan McDowell (noodles@earth.li) ---
Created attachment 300195
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300195&action=3Dedit
dmesg, usb autosuspend, 2 drives, working

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
