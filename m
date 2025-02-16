Return-Path: <linux-usb+bounces-20688-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EA1A37180
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2025 01:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AB0A7A3088
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2025 00:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A079717E4;
	Sun, 16 Feb 2025 00:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXPxGUaP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2EE7E9
	for <linux-usb@vger.kernel.org>; Sun, 16 Feb 2025 00:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739664975; cv=none; b=ToFgJiUKPLdJe33uFvnujQDrJn4VAke1Re6OtHF/yXBEyxz7oBKAHWYCwxmw8d71YpIwXr72gSPjNxG7nUoEDE6QeggC2G9OHR8NazEBWR06+UQc0VatHjWs9HBd4/0D+mYENDNa3x3TzwBCZrsTKc2/NrkghsLbn3p4BTQQjdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739664975; c=relaxed/simple;
	bh=XWlsf+isIAxAkohHLrQkZfOvNu2Tmap8/2AntAcdZhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TVoUqMl832UwJPrN1lKVRsLHumNCyRWc4bPh6n/mpEmrC/IDS9PJ4FiyifuGTItCveligmIKAnMhHERQZu8EyT563WUMCRcbkAZVaGKC0+GJJ0yePup/TXbqFpwZHc3nmAmsdOHmVF20w2Uh/cVVbJh9ShHdLzaPf6xeGUjLAcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXPxGUaP; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fa8ada6662so6131462a91.1
        for <linux-usb@vger.kernel.org>; Sat, 15 Feb 2025 16:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739664973; x=1740269773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lUTuJeqyZZgiPtFS10sZTnTPWv3qnMdLOMr9WEQY29k=;
        b=MXPxGUaP//YrMh9pS6gtX22FCRXFYJgrxOUybMC4Z5ksiTnodmaLAjkkbO20QekUbz
         BcVqvLk+MslCcT0GNRswL5ihdkllsZo3zH02U5r/a+o4MHkSAVtD+nD7F3VeLyn/XaC2
         q8fdFlcLt2tqxlcUJfLopgs1o/hIOxkP7bOf2AC/r0C7BTuZI1W8UsMHFT1yetZnlifA
         GZOcE/Rnm1nLW/gv5hCNwLgKerR80n2+n+4OXKeR10rXA3rJxpfi8xtn44fSv1EiL3qH
         IfDh8T/WxgJOy6qyd2cr7oe2RsAJaZOqFOmNTXJT6phj0fGiGNZtyUO9+yNiNy1Q3B2E
         0yPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739664973; x=1740269773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUTuJeqyZZgiPtFS10sZTnTPWv3qnMdLOMr9WEQY29k=;
        b=QFPBiZWJwMQaqpP59q1yceGjIsrARDasbdOLPWXrKL7U03j/KO+pNmrE1zx0+m30+/
         TOeR4K4QsuqmjK9x6izR7ceSg9r8VKv9qN4p97eZss1OploGAD6898MVN0EoC7QAAn9l
         ctkj7FAUScsVG4XxQgvK4KB3gj9kr8z74AGFwDCzRv6SFl2KBmsEaNHX7sxXATC3gfzI
         QKXalLEsJvVz2mvChzfgQ/PnqkEz5tVEBP4cZVXGxULIujMl8Xj43jOpzEQQKlx1X5ZF
         ZOHT/oJt51rtobk8vsYFQJYpke5ayIgD/k+w9EYOBJiJFEaAXMYt5tET8CUIpFOR0es/
         QoRA==
X-Forwarded-Encrypted: i=1; AJvYcCVgmf2W/6pOyhwDHiWrraHDI6mh1XT52s9lZm0zAxZxO+Yzv2M+kWMl42KNaxL/EogzvYcgPTwc61M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhuvOezS4LzzNNvzT6DyzLlhWuVL3TsnwqkOZdXODTz46yTNZN
	gnbVdxXt/OdVmsvef1ckV34n5YUPlbKmlTA2Unrj25S6s0bgj4YKM7zyAE/XHUxcjQ==
X-Gm-Gg: ASbGncvs+qV12ou6CR1JGhzqd4o+AW9xjWNZohBvBoxuJ5uriNZ3lFo8aTdKaOVW5gA
	wcf+Pe3wNRk1YXh/JhQZpvsDCtEIXNneegS1gdAcrzbZHLhZiczoOvbKVZAPVWKjwZO9zCdWtcb
	NF4Aecg5Fuk6EYha+oAyMyZyqfFzCX6vmUpEUUAgfSfGQYxioHxs2UCC7WV/xGa4mQk9r5c9c1W
	KanmLVCeRELG4OxvJ+KHxUtwNZG5TR/hffSv5Q6BYyoSD63+D4ll3KvLNtopPthry8igy3s8p5v
	AQQm1629aeTs+4TsAfi/+CnioXabW8jHVyscmJ4PlFPBbnkxkT+R7NdYFpTM8NRVZrB8kEhCUc0
	AFhsN8xin
X-Google-Smtp-Source: AGHT+IGUcCVj3QePsYIRni836iJzUiguaVs4SPbdheN2Y4t8ZgPdpHk3aEceev/BbWkOGTRSUHjYiw==
X-Received: by 2002:a05:6a00:124f:b0:730:8a5b:6e61 with SMTP id d2e1a72fcca58-7326177d0ecmr8092147b3a.2.1739664972980;
        Sat, 15 Feb 2025 16:16:12 -0800 (PST)
Received: from test-suraj.qjz2hk5f2gku1a3adsvczrat5c.xx.internal.cloudapp.net ([20.9.134.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732746caf3fsm133820b3a.169.2025.02.15.16.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 16:16:12 -0800 (PST)
From: Suraj Patil <surajpatil522@gmail.com>
To: heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	Suraj Patil <surajpatil522@gmail.com>
Subject: [PATCH] docs: Fix typo in aspeed-lpc.yaml
Date: Sun, 16 Feb 2025 00:16:07 +0000
Message-ID: <20250216001609.106616-1-surajpatil522@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct 'Tehchnology' to 'Technology' in the copyright line.

Signed-off-by: Suraj Patil <surajpatil522@gmail.com>
---
 Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
index 5dfe77aca167..d88854e60b7f 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# # Copyright (c) 2021 Aspeed Tehchnology Inc.
+# # Copyright (c) 2021 Aspeed Technology Inc.
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
-- 
2.43.0


