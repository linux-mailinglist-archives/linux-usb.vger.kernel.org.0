Return-Path: <linux-usb+bounces-8634-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F6D891143
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 03:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22BA428CDA6
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 02:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0277E1E504;
	Fri, 29 Mar 2024 01:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYoVUGka"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807B5A95E
	for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 01:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711677482; cv=none; b=M0HCqiOAb3vKZ683bmngrbQ19xYWJUNWsbnpw1w8RvvDfi/Q7gmzPX75vQJE4xEaP/E9AKcZ0VMEuTmGMUPm+/y81cjWdqL3rX+GA18FSMCb8Xa7LXxMW2oUw2wS7VSZZ5WkGIGXs5+/dQ6e7GXtXUhbWPTISQp4fNIA0yx250g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711677482; c=relaxed/simple;
	bh=7qb2qN6QE0vlup589yQen5LN2By30KJY8vF+2rRmWYk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ntkK8nVqG+DhnScGv1Ua4+aesKO3jm8l0oYBDM1C10Q+N2Gh6L/uLE289YHRJNISdsJgeiY4q3LmIwAf1t8JPOhONWSrbXbu0//589S2hJWA8JirFH2XySngXKhDcwbzpBELk4sY/LOEoxJaheen1X7zo9S5jVn3jZxU2zpV24M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TYoVUGka; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16189C43394
	for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 01:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711677482;
	bh=7qb2qN6QE0vlup589yQen5LN2By30KJY8vF+2rRmWYk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TYoVUGkaLIUXRR/BxausMmCXn6zJvi2j3oBF9PeA36eYVKshzWEFbbsmU8AedOgzA
	 1pejsruqNX7Em2/S7lAmVF8pPQOuIzdDBTqLEttjuS/ijmy2fVouIVA5EMwy1HpmCh
	 L1L7OqzlO+fIigWhbU2mk5IaESdmbUmt6eplH/1HiYsMldjhsN7v14738WqYlPWaa2
	 bGXzNeDxzLCgpE51EiaWsN3S2Jr/mjt3fpBEjMFmpXOnm/kCDlU2KBLUujZyKZ7DVp
	 Ys3ethd5KL2kDjDWKRJi9J63roqKg0gezTpjCw+xi0se1XiuzNdubFjb/sdvdInfXk
	 jP0Z4doiUBT3w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 02CD9C4332E; Fri, 29 Mar 2024 01:58:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218656] Regression: Update from 6.8.1 to 6.8.2 breaks E50 DAC
Date: Fri, 29 Mar 2024 01:58:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vaxerskiofficial@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DISTRO_KERNEL
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218656-208809-7AesWwDgtT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218656-208809@https.bugzilla.kernel.org/>
References: <bug-218656-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218656

vaxerskiofficial@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |DISTRO_KERNEL

--- Comment #1 from vaxerskiofficial@gmail.com ---
I'm sorry apparently Arch pushed some magical update to the same kernel ver=
sion
shortly after my report and it's fixed. Sorry for wasting time.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

