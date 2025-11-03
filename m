Return-Path: <linux-usb+bounces-30002-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D36EAC2B377
	for <lists+linux-usb@lfdr.de>; Mon, 03 Nov 2025 12:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B58513A49CC
	for <lists+linux-usb@lfdr.de>; Mon,  3 Nov 2025 11:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626C230149F;
	Mon,  3 Nov 2025 11:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JpBnL0VW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90A42FDC55;
	Mon,  3 Nov 2025 11:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762167709; cv=none; b=CIgY+aT0i2nUEUesoViWSyIE8QBid9WSYpgFQrSHSQ72jbgGsMf4+HZpcvF3wxalWYyHByjS+cE++1N0frKUG8LGia5ScF/6iqxHRn9qFGTrjwtDWE8mwxsIjCKhsfvjzgvpU2OPJlRl4FZ5qlVsJD+v2sQZR2B46ALd/P//g9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762167709; c=relaxed/simple;
	bh=g/qY6U/+iUJrxmuc+BElr45pPQ2XjXw6gWqTskB5DU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WnSNJaMjB6jZl5rv6kE4D+57T+NuLEhLE8tlr1kcinbkuDYpuAjPerssr3E6IOmw3GgU+2bL9ESv2P4sFfkNnFeirZG1795uwV+AtSNXBWYef08QUAau4E5yb/wkyyt/vPCaiTokiHDmajzlNsLssRna59wRAp+XvZRzYe/QbLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JpBnL0VW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968A6C4CEF8;
	Mon,  3 Nov 2025 11:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762167707;
	bh=g/qY6U/+iUJrxmuc+BElr45pPQ2XjXw6gWqTskB5DU4=;
	h=From:To:Cc:Subject:Date:From;
	b=JpBnL0VWITv25nUMHzJpGvsSz9SrVzV+MJWWhBZjhInE3KSOB9EsMTBhFyNDGLBfo
	 T/Kmjq6mm0FqiidT3h9lIeQ+ohAzvwa45ru0nQGtU4O4Mkp1Iwv8686EkpuZPwSa//
	 cfTjX+OGF9q0UtsQtMaEoyC2MVGY1/jUq1UisnMyYzyK2s3EMg+F8sr4x4jMELSPUK
	 OM36tkhpqgzz+rpd1gsBXR9fK1dz+JW8cPM7j6GtlU8IYW9tddIP+oT2izNcFWidl6
	 kmOrU/l8r7LOdB4usAkxShK60O7QaNDIbGV97P8uZNDeUVtBBIlS9BK4GD4aCEM35e
	 p6BrCCJt0671Q==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>
Subject: [PATCH] rust: usb: fix broken call to T::disconnect()
Date: Mon,  3 Nov 2025 12:01:03 +0100
Message-ID: <20251103110115.1925072-1-dakr@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A refactoring of Device::drvdata_obtain() broke T::disconnect() in the
USB abstractions.

"""
error[E0599]: no method named `data` found for struct `core::pin::Pin<kbox::Box<T, Kmalloc>>` in the current scope
  --> rust/kernel/usb.rs:92:34
   |
92 |         T::disconnect(intf, data.data());
   |                                  ^^^^ method not found in `core::pin::Pin<kbox::Box<T, Kmalloc>>`

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0599`.
make[2]: *** [rust/Makefile:553: rust/kernel.o] Error 1
make[1]: *** [/builddir/build/BUILD/kernel-6.18.0-build/kernel-next-20251103/linux-6.18.0-0.0.next.20251103.436.vanilla.fc44.x86_64/Makefile:1316: prepare] Error 2
make: *** [Makefile:256: __sub-make] Error 2
"""

This slipped through, since the USB abstractions are globally disabled.
However, the USB tree recently enabled them, hence it showed up in
linux-next.

Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
Closes: https://lore.kernel.org/all/1c8afbc0-e888-4702-9e4e-fa8aef0f97ae@leemhuis.info/
Fixes: 6bbaa93912bf ("rust: device: narrow the generic of drvdata_obtain()")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/usb.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 92215fdc3c6a..534e3ded5442 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -89,7 +89,7 @@ extern "C" fn disconnect_callback(intf: *mut bindings::usb_interface) {
         // and stored a `Pin<KBox<T>>`.
         let data = unsafe { dev.drvdata_obtain::<T>() };
 
-        T::disconnect(intf, data.data());
+        T::disconnect(intf, data.as_ref());
     }
 }
 
-- 
2.51.0


