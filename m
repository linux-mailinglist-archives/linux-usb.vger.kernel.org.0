Return-Path: <linux-usb+bounces-12739-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C159433A7
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 17:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B015CB25B7D
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 15:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD4B1BC089;
	Wed, 31 Jul 2024 15:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2oQSdlL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795751BC081
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 15:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722440869; cv=none; b=Hr9CE3nR8qhfAcdJ9HlvMLafhJAOJjyE+Df0WkBjmCiAO0m62YjnpcYQey+hn3RBzPnKlqXriqxDPTHG7cMnGpjk8SQJkAWiw/NG4cDTozd1OrPC/HOX+FV7LOl3196NUsqWfv+zeWJng3v6PrQErjVYfRYC1p/cE1GzCuseuIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722440869; c=relaxed/simple;
	bh=f5ZSvefU6KfyTxXrTx3LPrDWiXSE+HBA6xgePrUfelA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kPiy3iRI6x72BPfbCeO/+WBjmlmdi74j+JGejN2hDTXCY4MA+frch3Rv0EaMLEXcbZoFn6l9QRFamfFBn6foDkNRD5EeT64/ZaRxXUyNDlB7rnV1De+tOceoCB1ggacLwTe/iJSZbwuUU6f7Jro037H/nqHQZeNn6c11W0kHEqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2oQSdlL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14866C4AF0F
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 15:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722440869;
	bh=f5ZSvefU6KfyTxXrTx3LPrDWiXSE+HBA6xgePrUfelA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=s2oQSdlLlgbsia9rfC4GnMxzOM1DGxBcFUV2BJOWP7ugFChqENoXLWxPXcUlPmGxX
	 +tFpB46Wxm6DEbSfrpu66UEx60AP20wVPZlD83cDBBVLVdHKrsJ//8lj9sQTvyVPsi
	 iWNcdUYthpppJnTWs/880Imig6E3d/Fs7P7a1h6uPt+ZzuH+3f922MbTHRyre91eGc
	 AP0qhLLscn72N9Pkdx80aSrxF+hcXVO48gyhItG2P0QqkxWW5VfQiq835sukBFm+MC
	 A0ZCKQuXJ4Rp9e9Xw3Eo94VaHVlqS6MRmZyV8yzcva23ROPHz62KbNPmopYysBIWS8
	 0xE8k/0xh4yzg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 086F8C433E5; Wed, 31 Jul 2024 15:47:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Wed, 31 Jul 2024 15:47:48 +0000
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
Message-ID: <bug-219111-208809-2vX7WBvvfb@https.bugzilla.kernel.org/>
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

--- Comment #8 from CH (com+bugzilla-kernel@c-henry.fr) ---
Sure I can do that.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

