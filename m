Return-Path: <linux-usb+bounces-20689-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8C3A37181
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2025 01:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB02416BA7B
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2025 00:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890F323A9;
	Sun, 16 Feb 2025 00:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTWOkzBW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5471FDD
	for <linux-usb@vger.kernel.org>; Sun, 16 Feb 2025 00:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739664979; cv=none; b=RYiBsTXhd5WMaZHFLGK7998cKa+uvus5Bay9tuXLdlhFBgSUvTroKDGAh1btrnEGLndlmudfEqqw/KDN4gATc0gtPLVtoSJ15aLlTH6eGy9Jmj9VZJAqoqay6Zk0efn0XhfvT8evhP401q0x9J/o/MArZbS+zj3bkDe5ixjPvx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739664979; c=relaxed/simple;
	bh=J2Ijsb+HD9ILre/twDctrrk2xivaEVKQsJ1LLyLy2gM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UX4Jb4xrGbvjO/pACQeGPRG9Qiaxzo5rmXFJysb3eiV1Aw1CMg+gPaA3c4w14ixaO7hyqBOxpynaRpVAifKjYQlSNSn2ust8SenyPqSJhYm6WdWDTAz4g7/7RlRpLbBCNgQTl53Poksla+yRUXtdBLM3SzHlO/PrbAt08zVH+ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTWOkzBW; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fc20e0f0ceso3858493a91.3
        for <linux-usb@vger.kernel.org>; Sat, 15 Feb 2025 16:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739664977; x=1740269777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZLmRNArgA80J6VvBUYgRP6X+hYuozIBGig62C2XSMA=;
        b=RTWOkzBWFHS7Q0F3bkmIKyQKN44sQ5WftbZErw+0h1yoQs9NUudmRQ4/cdQLXY03za
         Ax94/4/LhwwDWw5tWkoqnyqn5hby98xrZDMgLgx0OMzYgCoUqpFpn2U9E4l66PjBLpGT
         +MP10Jc1ycXxEdY8IN0b30uDXHxA+8wyYMEjMP1p0hS8CDURoAGZqDtfogihTMBAzoYG
         DYa1Dq/Id34LynQifumfYLK99A9wZrqQB1qc8+Z6bgTP3CSMjkj5ZDPm4CRAForFJRZ2
         GrBNDAYJORCNk1Z+meepWGfY4Cvce2S1LwjPPANmQRu6GYyPg4lO1DLGXK+HCAZj4KBW
         ZEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739664977; x=1740269777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uZLmRNArgA80J6VvBUYgRP6X+hYuozIBGig62C2XSMA=;
        b=l/TSLNU7EQqMHkoE2Y+nTjHjeNfl82KL1sem+sLtNaT5qzk+RcIUGS/jndo5pJFVsx
         YkyGgf/ZuvIWmB+3YmsLD07dK7+r/QiWhkaJTuDYX//TZWEukmF9RQQIKZI3UXwHQZXg
         xEXdP2WeGBYzHb4xOcvLnJEdi2raa2oJPMUMRjAfXc5a96z9XRNU2XL1KFVLKraf2jX7
         dowe99Q37u1NyR6LWw4KuN4CyShI/1d+dRn3feCNOR0hdhqx0U7+ZG0qDmUIppa3o1EC
         O52R3s1qOGkCTx0H8kP1TqvUizNybWsDy0LvPo4pqyQXd5YtdvxSJ2aaSUM66/wzzDmW
         T/4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeDbvu7OXVPZk0a8IORF9taxCftJJZNHAxOXdirhlPqHMEpZgKupHNixuo9WHgAG/94lRcGr1kF2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrgEIuNnkmiKZBO9tNU2Wr1MzL6U9Z54OSvmYkdFLj2jn5CgtM
	bSrvQgEAKF+Uq3J/bePEDUXlGb+5RzDmT6PRlYNaFDjA+AYd73GBW8x4fmxWQ7PSrw==
X-Gm-Gg: ASbGnctDfoLbXAiE0e3fR/8J1BWmZljh2TxFPbw4OG9sp3yFXYOPW9uuZeZwcln+6ET
	bHGa7WZIOYYzdo+SDZ2PV+lZ4NCOTpZPddbjEd2jhN7I086s776bV5QeV7A0PuGyhSg8zYbtau+
	F1tQOLhpV5+QPsgF6kedfnIMM/cdt86eOudgf30O4mlOeAy5MykDO5zVdl6TaGudRw0JzgQtuBU
	w1BCtY4YKEkFCGGOEP11UvImqS7JeA4TiqjhW+HowLX9rhUZrPPyIaZ01IMTa8O8wjtcN5J/KJh
	ZrJvgk83h8mjECE3r/we1z2QVaxPFfvvQoFE8m0Ze2PaeYkQ/3hX3WDf1SqBTdVhEvJNLxYA+4z
	PKW22WFn9
X-Google-Smtp-Source: AGHT+IGsrxgUApR1GV9NU94ubocRUU0Re/THB9/zXh/RhvVbI8ljStSc+pg8LMrGJyFOSqXowAXjEg==
X-Received: by 2002:a05:6a00:4fd6:b0:730:7d3f:8c71 with SMTP id d2e1a72fcca58-732618c8d26mr7643481b3a.19.1739664976905;
        Sat, 15 Feb 2025 16:16:16 -0800 (PST)
Received: from test-suraj.qjz2hk5f2gku1a3adsvczrat5c.xx.internal.cloudapp.net ([20.9.134.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732746caf3fsm133820b3a.169.2025.02.15.16.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 16:16:16 -0800 (PST)
From: Suraj Patil <surajpatil522@gmail.com>
To: heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	Suraj Patil <surajpatil522@gmail.com>
Subject: [PATCH] docs: Fix typo in usb/CREDITS
Date: Sun, 16 Feb 2025 00:16:08 +0000
Message-ID: <20250216001609.106616-2-surajpatil522@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250216001609.106616-1-surajpatil522@gmail.com>
References: <20250216001609.106616-1-surajpatil522@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct 'Implementors' to 'Implementers'.

Signed-off-by: Suraj Patil <surajpatil522@gmail.com>
---
 Documentation/usb/CREDITS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/usb/CREDITS b/Documentation/usb/CREDITS
index 81ea3eb29e96..ce6450a6ed7c 100644
--- a/Documentation/usb/CREDITS
+++ b/Documentation/usb/CREDITS
@@ -161,7 +161,7 @@ THANKS file in Inaky's driver):
         - The people at the linux-usb mailing list, for reading so
           many messages :) Ok, no more kidding; for all your advises!
 
-        - All the people at the USB Implementors Forum for their
+        - All the people at the USB Implementers Forum for their
           help and assistance.
 
         - Nathan Myers <ncm@cantrip.org>, for his advice! (hope you
-- 
2.43.0


