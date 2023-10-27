Return-Path: <linux-usb+bounces-2243-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCA57D8D5D
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 05:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E29D71C20FA0
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 03:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE79C3C2A;
	Fri, 27 Oct 2023 03:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0quwld0"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29E61C2B;
	Fri, 27 Oct 2023 03:21:14 +0000 (UTC)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BEDA192;
	Thu, 26 Oct 2023 20:21:13 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5b8f68ba4e5so1378578a12.1;
        Thu, 26 Oct 2023 20:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698376873; x=1698981673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOrCwkVqAlNg8XVEkShhR/7wXoZRdI3BqowEgZUE1O4=;
        b=g0quwld0z1luK9L41eHrVxqC9I4m0j22pE44IL1XxLqhsl99HfJ0vnVRYbIvltD0nl
         XxreSnJxoi8Q9nnnO0zC11IUcciA1iBiBgfyFJBC4XiT8iKXiZ6Id8N059efF7cS7rST
         c0LmwVCizpj1YD2Sna9a+l5DKoopY5CMwh1+gEB0h8Pyq/9zDjjU3qaXm2WtxTBpDgCs
         hdEE5qypBjtxqd5qUkwHT0knkOBIvavm/cpfU6s2e+T6CzpMXqmu1721of0uGAYbJGur
         EELxlrCTseF/XxKvv3wsBi8WC1ddrgf4QYnITOAQfKGhbMM1ItrTaHNt65pMZNV6sEdx
         mQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698376873; x=1698981673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOrCwkVqAlNg8XVEkShhR/7wXoZRdI3BqowEgZUE1O4=;
        b=cBAjNUz5nIqjD1TnWzSPnwX/s9xPR4pWmdxKF72R1icWMeRWAKerekUBPKr1pYPOsz
         LmFewH4xHIcj8WHg7lq09YLPVt2AcvYmirQz3qHE7wVn+/cOSO8Tm0bRpntRh47S1eQp
         q7KvGf20g+64/gVailCXZHt7K6EuP4wDMtt8zROMRJk75mhVgE5pImb+9r7+vRJ0jB7S
         NHw9IbJ5IBniTgdOSsANVKk//sMPNt4J7HQtt3t42EamBdlXBIZmnb8xOJnYw5n4ihzp
         khF+L1r2Mgprw5c8vGBDQVFANDwaPbRxJBOcuLyWDuiD4tbPlMLU1uBk9oCiwTxQjXaW
         wGaw==
X-Gm-Message-State: AOJu0YxMZ7SUljgrfILVV3Blsvy8LYS6eq0ctt9OQ8Z1cx6237ByyTtD
	CmOBx+LYE7vh7XdPmko5HSc=
X-Google-Smtp-Source: AGHT+IF8GaXXXaQ/WstxXLpkxPjYdO2zjaPFKSKhpF7yx6Jep1hBAhsv1xFt67SGFv5fu3Se3+hWkg==
X-Received: by 2002:a05:6a20:8417:b0:16b:f4ca:e3d9 with SMTP id c23-20020a056a20841700b0016bf4cae3d9mr2091859pzd.27.1698376872720;
        Thu, 26 Oct 2023 20:21:12 -0700 (PDT)
Received: from tx3000mach.io (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id s2-20020a170902ea0200b001c41e1e9ca7sm409771plg.215.2023.10.26.20.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 20:21:12 -0700 (PDT)
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
To: yakoyoku@gmail.com,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: gregkh@linuxfoundation.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Wedson Almeida Filho <walmeida@microsoft.com>
Subject: Re: [RFC PATCH v2 2/2] samples: rust: Add USB sample bindings
Date: Fri, 27 Oct 2023 00:21:03 -0300
Message-ID: <20231027032106.155493-1-yakoyoku@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231027003504.146703-3-yakoyoku@gmail.com>
References: <20231027003504.146703-3-yakoyoku@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was missing in the patch, but you get the point...

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index c41eaab4ddb2..845cdd856981 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -10,6 +10,7 @@
 #include <linux/errname.h>
 #include <linux/slab.h>
 #include <linux/refcount.h>
+#include <linux/usb.h>
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/workqueue.h>

