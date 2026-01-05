Return-Path: <linux-usb+bounces-31924-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0EFCF443B
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 16:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF4D33121BDE
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 14:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898993093A6;
	Mon,  5 Jan 2026 14:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HApxgfk/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080D63090E6;
	Mon,  5 Jan 2026 14:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622921; cv=none; b=ihBMosmPEf+3REO3V+SXbF2JiXc1LD8631sA8gMKNHh8trEtVO7yC6KyzSFqTLug3CZCMC+PPWqotNnfov0fhQKN1OCoJMT5UaqwtKbx3bTLr7W4HWRPEnjAuu+ogfW7HAEUKglvEfc+JeA+H1dgSRTRv9ZlvfqXqbacfFh7+es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622921; c=relaxed/simple;
	bh=UQ8AbtKe3Ds0x5KlF74Uw5U33Fq6uSy/CdB2/tSHvdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u5qCcGYBP2R219jnG5TYX08F39dcF6z7dACnbGr/PPhhBUrSjYGMR2G/NEd/iRHJ8tJULHgTJe2/bWre5TjB8xVKV4eY4ZcCdXyPBNNV/NdFYLJyWStTowkptpLO+eyvAez2FZOQBFYhdE47PXGNMuzv5q6oNRLhAu8LBeWxEb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HApxgfk/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52838C19425;
	Mon,  5 Jan 2026 14:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622920;
	bh=UQ8AbtKe3Ds0x5KlF74Uw5U33Fq6uSy/CdB2/tSHvdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HApxgfk/8pOti8n4wYAML3YheRz75iI4NriIldRF3sUhZmBC/2/+vhu7DmRqTTeRy
	 cj+BoHAWxZGYu9NOHKbfRydS30RPzCnxegFcQDy3Q7iju1o+dEt4+n45lx6vJ4SmO4
	 kW/py8Yy3mr8y2FyGKxOnKE6PfLzaobf7leOT/bzdV35AGiNTSpan/7zT7Oa3QR9DF
	 pXBuDwT8afxenOXO7i6yEdn389l7j2AUePkLKtpdhRGWhGMRrMPsVjjDR0ThgYuJZV
	 GRGeuGnEuiAVJB7jVdim5FEN3jk7SfGIBgpLifFIE1JKi8e0MnSUDf5wV6KqB5dkjR
	 0i6NhAccQ0L5w==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	david.m.ertman@intel.com,
	ira.weiny@intel.com,
	leon@kernel.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 5/5] rust: faux: use "kernel vertical" style for imports
Date: Mon,  5 Jan 2026 15:19:46 +0100
Message-ID: <20260105142123.95030-5-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105142123.95030-1-dakr@kernel.org>
References: <20260105142123.95030-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert all imports to use "kernel vertical" style.

With this, subsequent patches neither introduce unrelated changes nor
leave an inconsistent import pattern.

While at it, drop unnecessary imports covered by prelude::*.

Link: https://docs.kernel.org/rust/coding-guidelines.html#imports
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/faux.rs | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
index 7fe2dd197e37..43b4974f48cd 100644
--- a/rust/kernel/faux.rs
+++ b/rust/kernel/faux.rs
@@ -6,8 +6,17 @@
 //!
 //! C header: [`include/linux/device/faux.h`](srctree/include/linux/device/faux.h)
 
-use crate::{bindings, device, error::code::*, prelude::*};
-use core::ptr::{addr_of_mut, null, null_mut, NonNull};
+use crate::{
+    bindings,
+    device,
+    prelude::*, //
+};
+use core::ptr::{
+    addr_of_mut,
+    null,
+    null_mut,
+    NonNull, //
+};
 
 /// The registration of a faux device.
 ///
-- 
2.52.0


