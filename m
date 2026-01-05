Return-Path: <linux-usb+bounces-31922-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 492F8CF426C
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 15:36:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 354ED3035F7A
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 14:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4950306D26;
	Mon,  5 Jan 2026 14:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPtStrTt"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4E3304BB2;
	Mon,  5 Jan 2026 14:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622913; cv=none; b=YUyuExu3mYgCDK3O+UDdYLevE5wN6mRhDZwFfvZz/WiHmGJ756+GMThzDElzHTlUlBX82IcCzmh4jI/MuJobBhBqyClKALho6Rh1UUMonuAufoWl7u8JUv7CZjdoxH9C0avD1F1hATFgoHU3itIw6Xb56L3pyH3K52AGOJPUxvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622913; c=relaxed/simple;
	bh=JyBiZ3iOCQ7wxiwcmq3NMY4BKvuKaT2ijxh4c9rJz4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F6e3sFVWMWQnxjnbLqhey5Z3izuFEAKHHkpNisVb6jWQ/Ym2286+dMKIdBDLEAS/8tQ1S5rHitg7KhVhVmz521GlwU/sKyeQ43T3/gBJGek9rki4hLVWT/+hj3/ZQgn3KRWlkZ0bf9/m1QOLXUsd5KU66suJi37F/UNve1mbdzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPtStrTt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E658FC116D0;
	Mon,  5 Jan 2026 14:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622913;
	bh=JyBiZ3iOCQ7wxiwcmq3NMY4BKvuKaT2ijxh4c9rJz4s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CPtStrTtdiVvpO4zzP2NPPq89V2F6WpgwZHlrl7g6sy4Kq2wGIIomTosBiUg4KNrT
	 6hSLZDILU7SNSGNmo3q+H4izv8eeqc8S/cdyXNC0WE2lFgBsV40uGE7ss4jVGpGwQu
	 gZOt0nntH0Lgw7d+8bvmQUBwcGvj2Haqad0XVndNMxet4ygXZaJQXwjOzOFWmpYaAR
	 mqNQTESbP65tu0GlA6gs8L4LLoTgOccyzobjOCs6a9EsLMWU1FOHdUh+ZBTUIp99w9
	 WDCQ+WZE2HEEUt279tzg2/JklHqcsKJtCEV66dOYJQzd5I6UIhQrtc9MBdU08NXGL1
	 4NKbg1ccr8XJQ==
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
Subject: [PATCH 3/5] rust: driver-core: use "kernel vertical" style for imports
Date: Mon,  5 Jan 2026 15:19:44 +0100
Message-ID: <20260105142123.95030-3-dakr@kernel.org>
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
 rust/kernel/device.rs | 14 +++++++++++---
 rust/kernel/devres.rs | 25 +++++++++++++++++++------
 rust/kernel/driver.rs | 12 ++++++++----
 3 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index a13f6ee24b09..ec9b0945b74c 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -5,12 +5,20 @@
 //! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
 
 use crate::{
-    bindings, fmt,
+    bindings,
+    fmt,
     prelude::*,
     sync::aref::ARef,
-    types::{ForeignOwnable, Opaque},
+    types::{
+        ForeignOwnable,
+        Opaque, //
+    }, //
+};
+use core::{
+    any::TypeId,
+    marker::PhantomData,
+    ptr, //
 };
-use core::{any::TypeId, marker::PhantomData, ptr};
 
 use crate::str::CStrExt as _;
 
diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 835d9c11948e..db02f8b1788d 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -8,13 +8,26 @@
 use crate::{
     alloc::Flags,
     bindings,
-    device::{Bound, Device},
-    error::{to_result, Error, Result},
-    ffi::c_void,
+    device::{
+        Bound,
+        Device, //
+    },
+    error::to_result,
     prelude::*,
-    revocable::{Revocable, RevocableGuard},
-    sync::{aref::ARef, rcu, Completion},
-    types::{ForeignOwnable, Opaque, ScopeGuard},
+    revocable::{
+        Revocable,
+        RevocableGuard, //
+    },
+    sync::{
+        aref::ARef,
+        rcu,
+        Completion, //
+    },
+    types::{
+        ForeignOwnable,
+        Opaque,
+        ScopeGuard, //
+    },
 };
 
 use pin_init::Wrapper;
diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
index 9beae2e3d57e..866d5d76ca7e 100644
--- a/rust/kernel/driver.rs
+++ b/rust/kernel/driver.rs
@@ -90,10 +90,14 @@
 //! [`pci::Driver`]: kernel::pci::Driver
 //! [`platform::Driver`]: kernel::platform::Driver
 
-use crate::error::{Error, Result};
-use crate::{acpi, device, of, str::CStr, try_pin_init, types::Opaque, ThisModule};
-use core::pin::Pin;
-use pin_init::{pin_data, pinned_drop, PinInit};
+use crate::{
+    acpi,
+    device,
+    of,
+    prelude::*,
+    types::Opaque,
+    ThisModule, //
+};
 
 /// The [`RegistrationOps`] trait serves as generic interface for subsystems (e.g., PCI, Platform,
 /// Amba, etc.) to provide the corresponding subsystem specific implementation to register /
-- 
2.52.0


