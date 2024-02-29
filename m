Return-Path: <linux-usb+bounces-7287-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC17486BE7A
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 02:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CDE81F24577
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 01:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798D92E85B;
	Thu, 29 Feb 2024 01:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kq3dznxC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057B3364A0
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 01:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709171415; cv=none; b=dzRDR8K53c+tNNiiC04RAPyNMkJ4T/+Uu3gkE5zRu1LYih5OuNeZb+Jo0Ce42Ix7dWg2ySgH7j4VZRlkO5UplTgUqXezR1as39FwTc3JYp/9UYwp5cb2N5j1z36j3CRKdkaZ6tkgEjAh4N9Y+htTvWFpFGemLJJNnb8tRMEEX/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709171415; c=relaxed/simple;
	bh=5Y3Y2UogQID54txbFMHUO4zxZrBfcU67KxrgFwuqSbQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q65t4YW1FpLEI8uiMaOn2mTluc5Jg3BUVrpWFyBp6ZPA8PrWhuRM0V6SbvNJAGmQheZJJcPw4Y6c0N1eOkaFHcjP97xbqF4V5JPGOJU6CeKYAdjo+l9wuMoxBwv6gHx/L2xJDXKX+li1rUmXr/98duUFfSdEt7Nryt1AjXGdOU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kq3dznxC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8ACF9C433C7
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 01:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709171414;
	bh=5Y3Y2UogQID54txbFMHUO4zxZrBfcU67KxrgFwuqSbQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Kq3dznxCaumivcbsHbeoO03JMosMS6gFahLFeReZajWDnv8QyJ5gN5qwsB69G8s/h
	 X/lD5opwHGpP7ue5mJywv7ufcHSkEK/ykYmuqhSVa6AqysbvFTCLFpmA+HGSjkmQMD
	 tj14I04G1M+TVbK/bqZak75WC+Sk1O2iwfGNGkkS1jM7oqcNNV0x8Xs9GBSqp8ZBF3
	 L7FCaSi3hPGQSAm33fiEWmqKGGtFn2KACdh6+M0/G6itfyutXn+qCaOfacMe9y/2Ig
	 Bhk+yq9lDgwLiUB2yODCWtVQU961XaPzEqFryU3nZueyE94gGX+jpV3+CGu/2vr5Vk
	 qZ4d+HgXaVJyQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7B901C53BC6; Thu, 29 Feb 2024 01:50:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218525] Thunderbolt eGPU bad performance
Date: Thu, 29 Feb 2024 01:50:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kaukov.peter@pm.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218525-208809-0ZbuCXqIFB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218525-208809@https.bugzilla.kernel.org/>
References: <bug-218525-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218525

--- Comment #4 from kaukov.peter@pm.me ---
Created attachment 305922
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305922&action=3Dedit
RTX 4090 Unigine Windows Benchmark

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

