Return-Path: <linux-usb+bounces-24499-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD18ACDEC3
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 15:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CF793A6B00
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 13:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA1F28F518;
	Wed,  4 Jun 2025 13:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i02ozesw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C87B248F49
	for <linux-usb@vger.kernel.org>; Wed,  4 Jun 2025 13:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749042893; cv=none; b=WLcTYVE8JAxFVP8gvvdW/of9uzG/Vm/uyZpmgQGHf8/EPv2UtC1eAAfczk+/P+v+qnt6yiArDeltvDirYJyOAjy9XIRs5wF3EJC6HF4Tbn+h+bgNcLdjJEb0x3yo5TBnHjsUEPEdDXowI42vmK8PWJESdEdlAeOlR7q7yRxqHAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749042893; c=relaxed/simple;
	bh=8IGtynGpMn0+FpLMD+/wpYitHDO9rrQsxUyxKFFrVqQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bm3gDOXGvwRMFpy2PpemAoT5tMFSKnpNxLK90JMxi71iDZ9BYmGAj4EXxWx7IY7XyDjAI1OTKWQKXirsFas2LbT6FMKIXLCSmsuQrwQXiyyJ6eSqJ5gJIZvcmu23kz8yA7IfukQuLDo9SPqnJa4qcSZwh+jOepz9GTjryNVZjGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i02ozesw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7DDCC4CEF0
	for <linux-usb@vger.kernel.org>; Wed,  4 Jun 2025 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749042892;
	bh=8IGtynGpMn0+FpLMD+/wpYitHDO9rrQsxUyxKFFrVqQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=i02ozesw/cWqEGX39t/wgNDpf7Sq+dLv5cBFo//zO7simHpWlxn0QBXjcGl2p1yc1
	 CxBzw6pspEJPVQ8GWXA2Ow6AV9OUfjAik6QmS/zKM/6mzrU+q7cFTt0CBoTCNMOrKi
	 VEsO1UmtdVi8bV2kDAgzEfyLLG2l/eHLc44bscHNB+C8778EzBYzLforXTHLD1Vu9F
	 zE1aBLp68lt9plaRhazAsNCkF5W7tHA962SfvSL3/P9DtpKSjXiHB3YjsssFGYkozb
	 7kI67m9Uodof/AUdTfTocFV9v7QNSUsaLTRydpcHby0tzOaEYlwIfVQXPYZulCkJrJ
	 VLi8mGOnUBaTQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BC96AC41612; Wed,  4 Jun 2025 13:14:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIFVzZXJzIGFjcm9zcyBkaXN0cmlidXRpb25z?=
 =?UTF-8?B?IHNlZSDigJxjb25maWcgZmFpbGVkLCBodWIgZG9lc27igJl0IGhhdmUgYW55?=
 =?UTF-8?B?IHBvcnRzISAoZXJyIC0xOSnigJ0gZnJvbSB4aGNpX2hjZCBhdCBib290Lg==?=
Date: Wed, 04 Jun 2025 13:14:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: niklas.neronin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-220181-208809-koxfFN4sAm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220181-208809@https.bugzilla.kernel.org/>
References: <bug-220181-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220181

niklas.neronin@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |niklas.neronin@gmail.com

--- Comment #7 from niklas.neronin@gmail.com ---
Created attachment 308204
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308204&action=3Dedit
Proposed patch to add support for zero USB3 port systems

I don't have a system with zero USB3 ports to fully test this patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

