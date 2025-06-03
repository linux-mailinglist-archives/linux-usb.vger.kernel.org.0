Return-Path: <linux-usb+bounces-24460-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A844ACCD13
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 20:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9CEE3A53FB
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 18:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A62B1F4163;
	Tue,  3 Jun 2025 18:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fYZJeI5D"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A3CBA34
	for <linux-usb@vger.kernel.org>; Tue,  3 Jun 2025 18:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748975494; cv=none; b=iQys1jiJ82WYyvYKySUzCy8ASqjYzjeOetK6XJSG9j8WV6DxLWGJ4gd5MSdmGa5nC3LkR75xr4iy2oRlXLm1KPSqi37/cDvp33saraz5cCs+oNaW9jE+fajR1GfqMkE300W8eZ3bv4PNtFwusF/6hTcDnNLJNUnW9Yg49qbVVxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748975494; c=relaxed/simple;
	bh=midQSonWOIVXMJ0zZmE2sBsHq0+dc5LxlcnQVDUaJZ8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RLihkSgi8HTY3l1LdljLCbqmT7pKP0kK0iUhjlxuHWl254g4IQuhQlR3MNZnYZaMg6AVB/GQL9+6z6VU0ZexPzqLVDas9Ns+uvangeHB1jAC+gShNMm4kiDKKsuqO+bMtrx0XK1BnHSkII7vZSLwYe/Y42/r2nmAzco1MOZ5c+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fYZJeI5D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19029C4CEF4
	for <linux-usb@vger.kernel.org>; Tue,  3 Jun 2025 18:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748975493;
	bh=midQSonWOIVXMJ0zZmE2sBsHq0+dc5LxlcnQVDUaJZ8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fYZJeI5DitzU109BbBGoHoD7oh90ITX+ySD/oM4rsZgBzGrTjCZvwP+cfCl6xyEjK
	 00Nr5Oos3silQO2hhDAOjd9iwokfC9uWY/9IhShjKWkkz6HlQqvdfYolzSdrwcm1S1
	 Rcu5zamp09kBqW0CRvY9N7vD5QmNIxEVJTR1I8VL35aDcuRsH3W7jkkjRxqz8tGuOD
	 Tn6/ipDGV5DEATsdXlIsx7lRRHNrr5ZOXJUu7DCpwVbdKhgdXlubywWUHuw+ql8X2Z
	 JYNP+zHWwCcv08sXOIB6UTNy2JyxzYlwAmLBHXbNyZeRmmp3oPPp/8EA85rtQjhTUa
	 addWgrdLrhdMA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0F7ACC41616; Tue,  3 Jun 2025 18:31:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Tue, 03 Jun 2025 18:31:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: linux@roeck-us.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-3FV0gZ3jW5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #43 from Guenter Roeck (linux@roeck-us.net) ---
Like this ?

diff --git a/include/linux/slab.h b/include/linux/slab.h
index d5a8ab98035c..7b38a4bba9a5 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -507,6 +507,19 @@ static inline bool kmem_dump_obj(void *object) { return
false; }
 #endif
 #endif

+/*
+ * Align memory allocations to cache lines if DMA API debugging is active
+ * to avoid false positive DMA overlapping error messages. .
+ */
+#ifdef CONFIG_DMA_API_DEBUG
+#ifndef ARCH_KMALLOC_MINALIGN
+#define ARCH_KMALLOC_MINALIGN  L1_CACHE_BYTES
+#elif ARCH_KMALLOC_MINALIGN < L1_CACHE_BYTES
+#undef ARCH_KMALLOC_MINALIGN
+#define ARCH_KMALLOC_MINALIGN  L1_CACHE_BYTES
+#endif
+#endif
+

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

