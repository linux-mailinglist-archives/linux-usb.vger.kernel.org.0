Return-Path: <linux-usb+bounces-31920-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FCACF421E
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 15:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D260C301CCE3
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 14:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B5A303A0A;
	Mon,  5 Jan 2026 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJuq19dK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF08302750;
	Mon,  5 Jan 2026 14:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622906; cv=none; b=sWCeNtpd57Mc82PWe6OmnvSTKb4qWfYtef9zS+bRxBHOvMLympKQ1Z43DuTvXocXniG8kfr1swTozoRYVCAsDpmI2ccZCyqU4Ni/rCTPwiYpahxDYmIEVdxgn3sSlNRaO8Hv8EnzLUSz/RPMcVqd1PKJVZpsKNzDsxqj5MFejBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622906; c=relaxed/simple;
	bh=qsePMNQQT1EK2hHYvbGxrezWMujR5eV9ep7+i/5nH+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oJDAykGRmR3frqXiWH6ZQVftB/Sm385LnjkPi/e0UIbgDsse6yPBrMxCXA0aVW7FVHNKNtzTh5rEVe4/Q04gWpJ8ZuGWV3RojxJ6mhFJHZG+pXRjAA8PNFmftOSrKGipkHBAjGuNbREKRAU5QKzwmREmfoUu+1TcUVI2xaKVLO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJuq19dK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED4AC116D0;
	Mon,  5 Jan 2026 14:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622905;
	bh=qsePMNQQT1EK2hHYvbGxrezWMujR5eV9ep7+i/5nH+k=;
	h=From:To:Cc:Subject:Date:From;
	b=iJuq19dKPmfoXY+LsMf/LT6tQ7LiImZYkfAtD5HFMnqkktW/eArBFkRXjOY5CnZcG
	 qvo7TICFlhRNIJAR+hWHuHcfzHeBVqJesQGiMN8++37xtdWbiHIZf4StRzB31FI/HP
	 DRicc7oh2zCWN1GgofaECfDD4384l53W66afWuHhU86n7HiV6YM2qoEgnNkdMoOJ5r
	 NvQ7RpqhFexVgJr8tfTz1P82mcGjdkILXQAPdw0drW9K5N1PQbTC7yAbPPRjMfjpAN
	 c0Wijh6FDP6u2DvEuFarYTmylW4fuSK55vNVaj+sXrR9ZlYW2eTkh9QQ3gmZmpHfdE
	 EwSu7GJIEP/ng==
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
Subject: [PATCH 1/5] rust: auxiliary: use "kernel vertical" style for imports
Date: Mon,  5 Jan 2026 15:19:42 +0100
Message-ID: <20260105142123.95030-1-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
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
 rust/kernel/auxiliary.rs              | 21 ++++++++++++++++-----
 samples/rust/rust_driver_auxiliary.rs |  8 +++++---
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 56f3c180e8f6..f8273cf165dc 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -5,19 +5,30 @@
 //! C header: [`include/linux/auxiliary_bus.h`](srctree/include/linux/auxiliary_bus.h)
 
 use crate::{
-    bindings, container_of, device,
-    device_id::{RawDeviceId, RawDeviceIdIndex},
+    bindings,
+    container_of,
+    device,
+    device_id::{
+        RawDeviceId,
+        RawDeviceIdIndex, //
+    },
     devres::Devres,
     driver,
-    error::{from_result, to_result, Result},
+    error::{
+        from_result,
+        to_result, //
+    },
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
 
 /// An adapter for the registration of auxiliary drivers.
diff --git a/samples/rust/rust_driver_auxiliary.rs b/samples/rust/rust_driver_auxiliary.rs
index 1e4fb23cfcb0..f148124fe81f 100644
--- a/samples/rust/rust_driver_auxiliary.rs
+++ b/samples/rust/rust_driver_auxiliary.rs
@@ -6,13 +6,15 @@
 
 use kernel::{
     auxiliary,
-    device::{Bound, Core},
+    device::{
+        Bound,
+        Core, //
+    },
     devres::Devres,
     driver,
-    error::Error,
     pci,
     prelude::*,
-    InPlaceModule,
+    InPlaceModule, //
 };
 
 use core::any::TypeId;

base-commit: 7bf97992afa4e815f4ed84638340e2a93de65504
-- 
2.52.0


