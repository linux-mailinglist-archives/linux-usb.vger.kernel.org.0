Return-Path: <linux-usb+bounces-25578-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 471EFAFC6D7
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 11:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F48B188A8AB
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 09:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64AF02C1594;
	Tue,  8 Jul 2025 09:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q33I2/+0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12932C1583
	for <linux-usb@vger.kernel.org>; Tue,  8 Jul 2025 09:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751966033; cv=none; b=ZztQ+vMWX/nSWGx1tbn8hElcA8mxZKZzDotQAZ2U+fN6jdMwxNlSza8VfhMI0qAhrX4O0N382qaF2bdzw1y/Mp7dPIMZ4iCu3snbCnVoLCeOuXQr4YVM93rDc26XHUwCq9q1JaaeTQ79s1uEh8LGtxwzbsi4Pjsw2UEwDo2XnCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751966033; c=relaxed/simple;
	bh=Ls4uEofRa5R35Nfmio7lGoqgX2lX0kyIr7Gqcuh/TxU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eT8ccQHW4x0rOS12Zliq5kJTyugtlcX/UHTf7U8wnTpguW4K0iogq3TLeGxtgLlm+IPNFO6dmKYZBqSzULoAUsAoYqPvXC4Ls5XVO2O6Tdo3PG7nC6qdQDOw1fj23xTahE/eSInGvn1HnDBLKuAQgIK89ojJhz5rqmZmVM2UhZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q33I2/+0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F1B3C4CEF7
	for <linux-usb@vger.kernel.org>; Tue,  8 Jul 2025 09:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751966032;
	bh=Ls4uEofRa5R35Nfmio7lGoqgX2lX0kyIr7Gqcuh/TxU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=q33I2/+0FeSQn3ojWKzSAMojV7hNuY3InrvZMQDWD6h0HehroxXFLGSUapQiuB0N+
	 lqQj43Po778BFWG5MKU8XEDkwg13XusgeenBMXQQcsTmj//69bUCUobilm6XXZSFx4
	 GeIbp0fx7lSCjgX8f5d8VNKkoA+rW8Tg8vq/RIL8C8c7/IM2Y8ql2FvIn8BmGpcRNq
	 U3cqzBYXv2UZA/81CijfhtPE1ADiGL0zCWEVXvtS9swVC0AvJJCH9SrSAx0QRyYAwF
	 7pm4xDgG6tpl+Z7hg3tbJZQ7v9Lbro4LhktAdNDlKowWc0VkjyLfWCfuFsd6v4IrfB
	 wgOMErjMB8zCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 70D2AC433E1; Tue,  8 Jul 2025 09:13:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIFVzZXJzIGFjcm9zcyBkaXN0cmlidXRpb25z?=
 =?UTF-8?B?IHNlZSDigJxjb25maWcgZmFpbGVkLCBodWIgZG9lc27igJl0IGhhdmUgYW55?=
 =?UTF-8?B?IHBvcnRzISAoZXJyIC0xOSnigJ0gZnJvbSB4aGNpX2hjZCBhdCBib290Lg==?=
Date: Tue, 08 Jul 2025 09:13:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: nick.kainielsen@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220181-208809-oZpAsilDLl@https.bugzilla.kernel.org/>
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

--- Comment #11 from Nick Nielsen (nick.kainielsen@free.fr) ---
The patch seems to work.

A member of the openSuse community prepared a KMP (kernel module package) f=
or
me containing @Niklas Neronin 's patch and I no longer get the error messag=
e.

Also, looking at journalctl, the USB ports are enumerated and described as =
USB3
or 2 where appropriate.

It's not the end of my worries - boot hangs again afterwards, whether this =
is
kernel related is yet to ascertain.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

