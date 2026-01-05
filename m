Return-Path: <linux-usb+bounces-31914-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF36CF3A4A
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 13:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F0E83133AE1
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 12:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F6533D516;
	Mon,  5 Jan 2026 12:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AHbIohl4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6E233CEA7
	for <linux-usb@vger.kernel.org>; Mon,  5 Jan 2026 12:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616995; cv=none; b=OydiolU937xOY0OwuP5iJ8vARoMmsqQb+Z/vstFyFGJrFY+QQNg95AyPZte4mZyXo9NO57zrkGGksOCjYp9F9i5cMDe5QvjF6nr63MhykjmZ7m+Zqlzq7gjDQ2nio84L30mANmbWmFCW7EvMzFuf58teBVE35W2n6QOvwtnuZvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616995; c=relaxed/simple;
	bh=B0MohqxbCI1xTkiB4+VB9WUTW3/7Lcw24CWoxffFhss=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k01VKNwTFXwbBloaMBaO7VEp9CwezTtiOTc5coiN9/0aOz32nDTVAaJ0suPqxRX8NnVFz3ewf36mTtlvom5twb3QNMmCrugueR+NLvvrW0W6B5FkNVc+pK2YsM17VU9b0hLt9DgRGpQpityyVFGBtVRkTipVCaCiQ730eY7t1Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AHbIohl4; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477cf2230c8so141997375e9.0
        for <linux-usb@vger.kernel.org>; Mon, 05 Jan 2026 04:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767616991; x=1768221791; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JmgFkrV+p7IPs0w7DRe6C0kHZv7GtilwGuTKSjHcuPE=;
        b=AHbIohl4Tjvh71bstdJO32eLMV7qymLo02EzdYQAFFrJ6smu/gTTfC8r/FzQWrTQXi
         y1phsYWSPQPJTfh+slMaApT0iXuJsY4osls1XDOTLKc97e9rwVOEH5gVMcZEePYNdbv0
         gVTKlLWpU9DcAn2XMqVNr6vawcisJblP4Vl5ipQgv+ABWZ5FNNVLA085tu01MnACcAIU
         4MJ6O8/e/TLC8w91tEXr0jVFigtFf5Hop1PW6DIACPhHkeaN6hEPlgJKfmvaXks+w9MR
         PDb1GobirXcYJaGQKnLaMWsNDm6/SKrtV5dpz6rpHRNGZZ4084mvVy549AfcNC3Z0FUj
         tbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616991; x=1768221791;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JmgFkrV+p7IPs0w7DRe6C0kHZv7GtilwGuTKSjHcuPE=;
        b=FcyC4tgu1e8uOxHK9nL17enIr/36AdC7wcsbW8qSQJVPWpaxF63UsdG4gdCPXt3zTQ
         LvFB/eIEzLwPkRggdttbfVNpVrTYYwJqYLYt3F04G/RNNB+ZMgm/gGh58DmsSuVuBRNz
         MBkOFJww6M3Uurm0tQyh9eIotfUxO8LaBtl/BOPmv6LTPU0kLi7l1I40Z7TGpxTHURuh
         AFDS2y7MK5L7VTGSA6EnR7FzsiAVUYEqisx9Rp37NJNMSm5m5iLLylMyeYMbJj9IXXCJ
         tWf9NmNZyNgpe3ZNDpPJMdh7Vc9O2LRUn6zyrY9zdLaK9wiFlNIFJRs2ldumGjiMXkA7
         BkUA==
X-Forwarded-Encrypted: i=1; AJvYcCXQy3OKMRyMrHH0a1CkQkRcuRUGb8ZLpXy7jBZioOt6h7OA5SzhYu0gokugbHfDgk4ns9UVAGb4cJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsaoHk0c9f9eCCJ0IPIR4F1W0nHW4XFPPRBv+WkJj1k7JuQry0
	5LP8yVnJry01mvfmCUTQOO51OFtjrDA6cU9EBVP4q+mFZ7BFh3lcbJNyUoFePcZ4mk6htiWrnmd
	6LjR4pH2xQyyQ5ZetHA==
X-Google-Smtp-Source: AGHT+IGd0e6KVaNU7yKaJNmfg+LVDSD8ZTaNCVkdFCCmBxQPqIAvE4LsH/9LstZQvjjFZZIDWSoUtoQGBk0gRj4=
X-Received: from wmlu14.prod.google.com ([2002:a05:600c:210e:b0:47a:916c:e045])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b8f:b0:475:e09c:960e with SMTP id 5b1f17b1804b1-47d19593d0dmr790735885e9.32.1767616991722;
 Mon, 05 Jan 2026 04:43:11 -0800 (PST)
Date: Mon, 05 Jan 2026 12:42:37 +0000
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=934; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=B0MohqxbCI1xTkiB4+VB9WUTW3/7Lcw24CWoxffFhss=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpW7G9nnDphlnEHAacIORi0SP1Wt7Lg49jqi1FY
 20FIkOEQlqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVuxvQAKCRAEWL7uWMY5
 RiTfD/4yebLqWfLaXDE2OIbogSUDyVLIkDSvS2ibQ/81QGqtSo9zuf+JF7Wis0pAfk+i8e/2oyL
 RvQU3KwltdboZ+Kb9afEunqYR4jdYoFwTazNt/Bhd6oV6RBAGK4rRG3i90Ut5Sz8XKN/gxsVx0B
 a/XYBx6nzJvec0N/Y9naXBja2cgku+ohWp83EhM4yO2/j/WUMCLQYv5hH1TQWo/vG+i9nPoja0R
 4sXyVWAm2Xcgv4llNJX/VDAPappJcDLzq6e6NAl8OUr5LD/ctF7PcOvobYBP2cio6Gjn9Y2+wax
 u4G3aCLwXWiCYb0MOOKW0Cx0LiC8F1e4qyzhPjsU7eNVOed0uTk36HHLcs+ObMimvcaN8P8V32v
 ewQecA6+KOGzDWDrXEQy5s7PniD/4EG/t85nBKqIcxFcj5mt7Rzf3N+gV19UwSEzYet9nOdpmtO
 P1A83TBsJyl936AqKAH7nLBMAJ0F+xZEoNzVqtekFk+OEHUyPsC8BFlaAT5r1IVQ7Vs2lavkU/t
 7mjEIcbAP1T3pxQOLBXn2ck9rZoED/z/JltLbwQk5lSUtJSRjR6TBfUIJwYrfd+PVkUdeZuRAA4
 I3dzeO3ghmo7e2gNaEtElOsiyxC7fPQSZTxXhV/mh+dDjD2AarTGHsVvA2dGDZVmAatTRitqWS+ uKtBoCadNGhdM9Q==
X-Mailer: b4 0.14.2
Message-ID: <20260105-define-rust-helper-v2-24-51da5f454a67@google.com>
Subject: [PATCH v2 24/27] rust: usb: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/helpers/usb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/helpers/usb.c b/rust/helpers/usb.c
index fb2aad0cbf4d26ac7fb1a3f176ee7a1d30800f92..eff1cf7be3c2d10b7e9248252d354eb8a4fd4c94 100644
--- a/rust/helpers/usb.c
+++ b/rust/helpers/usb.c
@@ -2,7 +2,8 @@
 
 #include <linux/usb.h>
 
-struct usb_device *rust_helper_interface_to_usbdev(struct usb_interface *intf)
+__rust_helper struct usb_device *
+rust_helper_interface_to_usbdev(struct usb_interface *intf)
 {
 	return interface_to_usbdev(intf);
 }

-- 
2.52.0.351.gbe84eed79e-goog


