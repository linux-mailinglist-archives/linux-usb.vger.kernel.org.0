Return-Path: <linux-usb+bounces-25410-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F0FAF5AAC
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 16:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95D763B8F4B
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 14:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0E62BD5B5;
	Wed,  2 Jul 2025 14:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="unWJEanr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A762882B2
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 14:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751465522; cv=none; b=oXx5YVUxS+Z90FEQuGLt7Td+SVJdVfzNwT8xtLPdqNtARIWW0sK7b4XOsvwB+Oxfj23Z5kC3kqmTnXYizHAUjxAxZzpdl75+ihHEZpQLtkO0mNPX5x4AKYWP86UFi3ckBc4nROMhNyoS5YF7/0x25jo0tdd8hmaG2HM5ZTz4Q08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751465522; c=relaxed/simple;
	bh=Il0mPKawFM6EsD6HBp1KVoEtVqIXh1wd3HLqtwcTfNE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VjQUY6dLPiQSwoASjLWEMDX3vYN2/oFSx5kKS+pYowOdgdSLijo7CSO8Z0u8sKAUwJZT3TN9tmuaUbTbEUBjRTHqAAHY5MbFeBXSAl0L8XfEMKIqHAcZTdixgfG5q7H6MFLwviySB9kbddQzTXiGIErapVtl5kJWQ0912Rh42R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=unWJEanr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFD02C4CEED
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 14:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751465521;
	bh=Il0mPKawFM6EsD6HBp1KVoEtVqIXh1wd3HLqtwcTfNE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=unWJEanrcIyU9Mxo1AEtB8ohtBIy2rpGx4dKuuPC2GApEc6Fj2seNfdUudzJoLfGl
	 4O8SH+dpSYxP1JX2cCq+6MlmJMqxG25FYuLSb1DsofZlZjfhV7iUunFEBEMpW5HmUB
	 UnC9lXuBZZdE1opa+zyC5sxogY5RhL/6cALcsKn0PkHkIvxzgFHVJaYd/j/Q7gCdFP
	 S2CWGtJaWdARe5hs38fNR7WEOp7U4SXD5D2BEfcWfXDroqLdwjViXqFoDU9lOh/CXK
	 jJOoQ9WWO0+kEhZ1fZ256rQjMEhBm0fzTUOjwNYUCyAiSEnp5pb4xOpEESavPqHkxK
	 3B6mcu/+czi5g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AE9BCC4160E; Wed,  2 Jul 2025 14:12:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Wed, 02 Jul 2025 14:12:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220272-208809-UwFyV0z9cT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

--- Comment #27 from Alan Stern (stern@rowland.harvard.edu) ---
But if that's the explanation then why does the driver work properly some of
the time?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

