Return-Path: <linux-usb+bounces-22996-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6785A86931
	for <lists+linux-usb@lfdr.de>; Sat, 12 Apr 2025 01:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D25C1897F6F
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 23:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CCF2BEC47;
	Fri, 11 Apr 2025 23:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCVDmgr+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD01B1EFF9F
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 23:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744414296; cv=none; b=VSmxNIxyLOxZMrbSTPiDLs9lHOlV3x+0tx0ZQ1UCaTz22S5m0nLC54sFzUSDw6tdSaOhpOzCSU02y+RYjMtZhIvj6Zf8Drj2c/Hti4r7LP/8vLcHxlE8rHtB+niUvqc8qmMMfENHi2hjuT/P5cadjz90P7XG4jlWfaXVVwfMYA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744414296; c=relaxed/simple;
	bh=UTN8qWhkhnb+Aq4IUnPErU+MbPTmbZU8EDNMSXdV5yU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hvy6I5UkbGdq3L3n49BEe/ZKYT7vMUMmc+uviqEeqDlHYICsaZU6aydVLk8nHs6YHbWWkXQufx5/IHuDTpO7+PyEorQ+P91WwG8nHeZin2UPBJ+V0GLLR79jTdjPuAje+3PV0jAfAwxpv/g4qFH7nHK/bS57fTgCV3MCePkI7Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCVDmgr+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BB79C4CEE9
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 23:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744414295;
	bh=UTN8qWhkhnb+Aq4IUnPErU+MbPTmbZU8EDNMSXdV5yU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PCVDmgr+3KDK+l246VuIeyWkA+rKNy/jcMbrRK0N3SQTy7DYxSn9tQRVkEWFEKJg5
	 al4FMkYs3nq2E9iz6jfHnXUnEwAuYqRN+AfKjII4vD6ee9OTzF1SutxMz/TUJof8+0
	 fCHFfmDAwTf70nfCvyvdMmfvvR8/A2OxeWyy1yz5PyjnXcQkqY2iHLHD3AYEpn+O5g
	 8lnleGWk9nv+06K9cTAkpyFBwodd5A5gBRTj6OyO5OiRZvcqK21s1ZAiDCrziT/MFf
	 XnRUlx2bT4ll92GwvMmq4T5WtL2z4lssH3IPbfPdyzpN24opbAnIlB2qZSzxuMRKWC
	 h13ZIE+sks9Yw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4F258C53BC5; Fri, 11 Apr 2025 23:31:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220002] USB tethering fails with rndis_host on 6.14.2
Date: Fri, 11 Apr 2025 23:31:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aminvandh@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution
Message-ID: <bug-220002-208809-TnCQZsdoH0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220002-208809@https.bugzilla.kernel.org/>
References: <bug-220002-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D220002

hooman (aminvandh@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|CODE_FIX                    |ANSWERED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

