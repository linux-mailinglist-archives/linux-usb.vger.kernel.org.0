Return-Path: <linux-usb+bounces-13137-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E77A69492BD
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 16:12:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6F17283313
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 14:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F9F17ADE0;
	Tue,  6 Aug 2024 14:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdjT5ABU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D608F18D624
	for <linux-usb@vger.kernel.org>; Tue,  6 Aug 2024 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722953553; cv=none; b=aIWIFJSY4rZGeRWIVIej9GAPU4V6SN5VyAn3YyFrAj97U9vPgUfe73DjUF65WU+PVvehvDJ4laEELyI7aKgLPII59YJRGWE0cKxIBIFRuShxX7sjyeK9YtMGa9kECAyvXuTFKq/TTQuerMTLYAWdrnMSNVkmOmoArcD7YTlYNZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722953553; c=relaxed/simple;
	bh=dIFp+ii9WJ/Jo9ff4vF80Bqe3+AGThmg2FZlmVmj9Pw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TrlEVF8se5r/sg/z0wRkgBrJ0R0FcHxSzxl5zwDKVlSvgypSeaUwaMcoDSh5VKX7O+ywz4j3kK/Rnq/OpQQPm9f/n4R4qJG5fzNe+1rS5Y7tPQbfYUYTOaoZZVgG3YRZv0mQbWxIkBnRE7wox5lLC2geQJknAK8PL9yVEpFmkoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdjT5ABU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 696EDC32786
	for <linux-usb@vger.kernel.org>; Tue,  6 Aug 2024 14:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722953553;
	bh=dIFp+ii9WJ/Jo9ff4vF80Bqe3+AGThmg2FZlmVmj9Pw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fdjT5ABU/iH3PavfnrB2X2m+Fqj60D6ziagxZ1mTWlyxQoizXk0EIQ5e0vqyA1A0F
	 sqvj/RJy53ocCCbEztNtnVR2lk19pfHviMPjARLxKDKaGR0VLCDNYx5S7w812bGcRV
	 rLQBiw7QqgXfH+6Oip75mkGfmgeroqIrWtJd6A1cn6VDLl642HTbMThQ61XAidUU5I
	 rf96GAU+nU0FQeVAWRPVUn5cg17gID98asRE2e2+7M3wltSxjNfedx93G10A4XWzTg
	 OqF+g7hdjekHTArQ01E4DQOYxMDS0/QQP0iRYD/2UKmAf/FTntOIySlhj2UjOsHpVi
	 N5nqDNDpS+HiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 52385C53B50; Tue,  6 Aug 2024 14:12:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Tue, 06 Aug 2024 14:12:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-kHPmxySiho@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #27 from CH (com+bugzilla-kernel@c-henry.fr) ---
Wait is there a difference in the protocol between 2 stereo in and one 4
channels in? See the picture I just uploaded. This is what the devices inpu=
ts
look like in Mixxx under Windows, with the driver installed (the Wireshark
trace in the same).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

