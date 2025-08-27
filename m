Return-Path: <linux-usb+bounces-27318-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08130B37DD6
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 10:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51390460EB1
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 08:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0E83314C5;
	Wed, 27 Aug 2025 08:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oHgoao14"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF7527780C
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 08:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756283324; cv=none; b=Fzl7U18KwWnCWv91MSRjV5ucUx8A417VWqSWC+c+mdUhDFoQ7z7eg8BBsNswdOIe7n6N76OW53VXwZh/iDEvxwtAAvPhxy4/bK2n1WnaRwHIuUMG83iOqN2VWHM1RoD6IA5nIB87j/FcHQ4lTDJaYFRA/IzCN84Yyw81Q16iNMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756283324; c=relaxed/simple;
	bh=Myjw9QnMPPcxiyDwUe5dViztAyJODgzSg8qoSXJw010=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZSScv2SiTNi/pJk1ySZTpSEgw0GGw7m801aOXLYlw9ZLxgfSTvLwbmNa/Kb54o7cKKOYtMVN6ecTtmx6KcQ0Kcqxqu4JTxpi5GGFOYTjWBFt9tuvVuS229FcC0sucwF1CEFHNd0kU0yLOX6nW81WMqdeb24S50wMYFw6qmuO4pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oHgoao14; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A17DC4CEEB
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 08:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756283323;
	bh=Myjw9QnMPPcxiyDwUe5dViztAyJODgzSg8qoSXJw010=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oHgoao14/b1195JFBq5Kv7QzLUQ21Zdqr1iaCdaZmtmcRqZKwECsNemInmqBdjS3H
	 o1E7Ft7dqvhVCwNuK+N0L5d2vg3ezjy/n+JfqjW4yndCjgZnr/2KmlaBk4QywftsYb
	 nYyrE+QzjwaxjPdQFZxSfJSijSmSKLjUSRkZB6KH3et9bQAJURwyFmcTyGkwmpQ0Pu
	 BMRUDY0kiLVtSA0sBCaj+32Ilr6JnqgTfWoyTYwRRb5733Ldfs9ow0668vTkXePYOk
	 /HNKBa6RAZWS7ysvDgSylqHMp3SGm+joJliTwtTK06nPbkyIkaHKCS1Sqf+ZXnmy1o
	 e62nsnX8hAn+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8687FC3279F; Wed, 27 Aug 2025 08:28:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Wed, 27 Aug 2025 08:28:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oliver@neukum.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-T7jwXvXxHo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #8 from Oliver Neukum (oliver@neukum.org) ---
(In reply to Paul Ausbeck from comment #7)

> disconnect/reconnect of the usb_storage device. If it would be helpful, I
> can do some more work and supply a new usbmon trace with the quirk in pla=
ce.

Please do so.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

