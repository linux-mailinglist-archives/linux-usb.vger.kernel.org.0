Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9343E7C25
	for <lists+linux-usb@lfdr.de>; Tue, 10 Aug 2021 17:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243043AbhHJP2F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Aug 2021 11:28:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:49280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241952AbhHJP2F (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Aug 2021 11:28:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 672BD60F41
        for <linux-usb@vger.kernel.org>; Tue, 10 Aug 2021 15:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628609263;
        bh=XcylXsNMhb3tWJxJFCVbSLBN3tvYtoL7Wj125szt3Rc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VYbjHRiio9bT/qXE/51bDySn70a+PWBBSUbkJlsDtIMgnLknGO9ZsolGBfRqYUiSn
         Ha19XKoXdYlsKPMIhXr/Lh3jxs5IOGdzEhu8dzxvmRpYKdsCZH8DYHvXRFptt7P95R
         aZQy2qEakjVbgapfUyBMvnvsO5DevSp8D+5ORgBhipr0FBAiEMtV1nuV3qiWgq6kBc
         Snyhy905z/2fc4d27asoR72bmR0muV011RR44GQW+wgP2BFJK5hwXwcvd0KNr+mV+e
         4YNW667mlZu3r4M+JHl8EMwObVMmpy+AtYakUTm/CFraFZcX0CByCA8Zc02uD5F/kB
         UG9BPGQXkpkWw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 5EAC660E4A; Tue, 10 Aug 2021 15:27:43 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Tue, 10 Aug 2021 15:27:43 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214021-208809-gcLnhjHzkF@https.bugzilla.kernel.org/>
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

--- Comment #1 from Chris Chiu (chris.chiu@canonical.com) ---
Created attachment 298257
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298257&action=3Dedit
output of lsusb -t

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
