Return-Path: <linux-usb+bounces-31923-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7DBCF4233
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 15:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FF3B304B4D9
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 14:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4AD308F1D;
	Mon,  5 Jan 2026 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jdudrJwi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FCE307AE3;
	Mon,  5 Jan 2026 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622917; cv=none; b=T2tX+XRAST2DkX39kFqIFx+WK5QVdV/4YROD2az2MbYaNLGl+EgWFmTOdAoaqvzBRgpkIScx6Lhd/U9sIjszd2TAQPnvlfJECS8IaPEjFzEZdpgPMfTifA6OZhFq5EbX3r1D+Wkhuw/JQPZiha+8hOsz6gNBQzm37JBkvmKe79U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622917; c=relaxed/simple;
	bh=lKwdXzQY+IBJqElPYqhZAd4xBmPlPD7EgiPF3AwIIjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bcuXtFa5HizjZvL5GJwZqYXwxSFBSFx5vL79CI8VPAD2yQawtzXD89+Dk2mGGsOB1kb+qSdgglAWtuvj01qmdll3UDfD77uaOMosyK3ukI8Hw/zizto63SnVWpAdNXgSClUBF7vWaCdEmVKKdfVqLpiwJuEB6qOLT8OaNJ54KYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jdudrJwi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3B7C116D0;
	Mon,  5 Jan 2026 14:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622916;
	bh=lKwdXzQY+IBJqElPYqhZAd4xBmPlPD7EgiPF3AwIIjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jdudrJwi8kgSPIPeyGrxbpLD9xBmfHSKnAiN6l70WFUieCh9zgAmZrO9Omx4/AusR
	 yVpgGTKIDsvrmrSCM1WFJDbNYyi7O2VSJHPg/LXo0pz5rcPzRPUJ6kVoqzddDLETXF
	 opB18iPN3FNEJw+R2vce/k7BirzU56jKABTnQRLro+nmlv23zJRrrsr/rUdBR1fM5B
	 Kmx+GbJrEBYthk8sBwPJ9C07Ll4JXl7RmGEIoG8TSYAsIVLaVFE1j/UABO8jugk5ws
	 im74a07HiewxAM6CCHAltUNxiXOO8SQ0M38G4BUxJdCMwt7ba5d6prn0Qx5uYtNr7V
	 kbci09RbPt5qA==
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
Subject: [PATCH 4/5] rust: usb: use "kernel vertical" style for imports
Date: Mon,  5 Jan 2026 15:19:45 +0100
Message-ID: <20260105142123.95030-4-dakr@kernel.org>
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
@Greg: If you agree I will take this through the driver-core tree. I will have
driver-core patches building on top of this.
---
 rust/kernel/usb.rs              | 21 +++++++++++++++------
 samples/rust/rust_driver_usb.rs | 10 +++++++++-
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index d10b65e9fb6a..99b07b5ac491 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -6,14 +6,23 @@
 //! C header: [`include/linux/usb.h`](srctree/include/linux/usb.h)
 
 use crate::{
-    bindings, device,
-    device_id::{RawDeviceId, RawDeviceIdIndex},
+    bindings,
+    device,
+    device_id::{
+        RawDeviceId,
+        RawDeviceIdIndex, //
+    },
     driver,
-    error::{from_result, to_result, Result},
+    error::{
+        from_result,
+        to_result, //
+    },
     prelude::*,
-    str::CStr,
-    types::{AlwaysRefCounted, Opaque},
-    ThisModule,
+    types::{
+        AlwaysRefCounted,
+        Opaque, //
+    },
+    ThisModule, //
 };
 use core::{
     marker::PhantomData,
diff --git a/samples/rust/rust_driver_usb.rs b/samples/rust/rust_driver_usb.rs
index 4eaad14867b2..ab72e99e1274 100644
--- a/samples/rust/rust_driver_usb.rs
+++ b/samples/rust/rust_driver_usb.rs
@@ -3,7 +3,15 @@
 
 //! Rust USB driver sample.
 
-use kernel::{device, device::Core, prelude::*, sync::aref::ARef, usb};
+use kernel::{
+    device::{
+        self,
+        Core, //
+    },
+    prelude::*,
+    sync::aref::ARef,
+    usb, //
+};
 
 struct SampleDriver {
     _intf: ARef<usb::Interface>,
-- 
2.52.0


