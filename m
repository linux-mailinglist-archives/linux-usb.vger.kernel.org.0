Return-Path: <linux-usb+bounces-31921-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E22FACF42E4
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 15:39:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D81930230D5
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 14:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77281304BDF;
	Mon,  5 Jan 2026 14:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I6OJYZ08"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FCC304BB2;
	Mon,  5 Jan 2026 14:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622910; cv=none; b=ReIdOxHfsbyTYrJT0XCW/i7DP5rXaZF6WmZRD+Jc0GsLOP5oNqLs0HgkQTSbT4F1Eq2Dwb4odfsnwTNjLrADXtjupeNecs05ivT4z4/VM7mw09ErDZbjSK7/ENzENsjq6BHmHZeORkAtwu/RUtPFqa5udiw5bwJI5GCYsdhwNOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622910; c=relaxed/simple;
	bh=mI9cyjhv9VV3guCPEWgAQe4eYwa0gQ3hEasBHAOC4FI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dHRwN/YeiDwORBIWAZiJZj7YIyMNpVKcEDUmap6cUfRRv6w3Wzh/rNucHh7VP7J1WoJhxjGe3d15fCexInBYDv1olNNjjSkhwYX/PwrYeuT3Kfb4/Q8YmSLZt6jnZhF5hSrrWUIGF+3gu5bFliZdIi84QUR5hfowk6UUJmY+WMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I6OJYZ08; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C662C19421;
	Mon,  5 Jan 2026 14:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622909;
	bh=mI9cyjhv9VV3guCPEWgAQe4eYwa0gQ3hEasBHAOC4FI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I6OJYZ08NHyTP3ZgBZ2zNk/2anm9+x2nf4HzUjTBxSPmPaioeb7fGntoU7v6G+ZnH
	 2h9aIbHX4Gu9ffCl2YGxSi9tDrpQwJxkvhOuwu70kdGfPjC7/t4+ZQBBWKqx2rbTJ3
	 UUHpI4hkzUrrtI0DJwND6977h38bNLq+WFR32gKxo+3Vmmqme4pyp9xNLhAKBPYbt6
	 5N+PMvT5xaRpvQTsr57bKIrpk02tTlfvMJ6BWrY3BdPiRfiE+CSOV3FxQr/Y29dPd0
	 cFZRsBaRkQxX7hgRbK46L+z7u0YCu6yvwMmm3dWuwSJa3Fwouuj9gCrsS3HLFPMObI
	 r4pxfr794/Naw==
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
Subject: [PATCH 2/5] rust: platform: use "kernel vertical" style for imports
Date: Mon,  5 Jan 2026 15:19:43 +0100
Message-ID: <20260105142123.95030-2-dakr@kernel.org>
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
 rust/kernel/platform.rs              | 31 +++++++++++++++++++++-------
 samples/rust/rust_driver_platform.rs | 10 ++++++---
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index bddb593cee7b..8836ac46b066 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -5,22 +5,39 @@
 //! C header: [`include/linux/platform_device.h`](srctree/include/linux/platform_device.h)
 
 use crate::{
-    acpi, bindings, container_of,
-    device::{self, Bound},
+    acpi,
+    bindings,
+    container_of,
+    device::{
+        self,
+        Bound, //
+    },
     driver,
-    error::{from_result, to_result, Result},
-    io::{mem::IoRequest, Resource},
-    irq::{self, IrqRequest},
+    error::{
+        from_result,
+        to_result, //
+    },
+    io::{
+        mem::IoRequest,
+        Resource, //
+    },
+    irq::{
+        self,
+        IrqRequest, //
+    },
     of,
     prelude::*,
     types::Opaque,
-    ThisModule,
+    ThisModule, //
 };
 
 use core::{
     marker::PhantomData,
     mem::offset_of,
-    ptr::{addr_of_mut, NonNull},
+    ptr::{
+        addr_of_mut,
+        NonNull, //
+    },
 };
 
 /// An adapter for the registration of platform drivers.
diff --git a/samples/rust/rust_driver_platform.rs b/samples/rust/rust_driver_platform.rs
index a3044d773176..9537dc38c563 100644
--- a/samples/rust/rust_driver_platform.rs
+++ b/samples/rust/rust_driver_platform.rs
@@ -66,13 +66,17 @@
     acpi,
     device::{
         self,
-        property::{FwNodeReferenceArgs, NArgs},
+        property::{
+            FwNodeReferenceArgs,
+            NArgs, //
+        },
         Core,
     },
-    of, platform,
+    of,
+    platform,
     prelude::*,
     str::CString,
-    sync::aref::ARef,
+    sync::aref::ARef, //
 };
 
 struct SampleDriver {
-- 
2.52.0


