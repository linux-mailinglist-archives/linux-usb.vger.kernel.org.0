Return-Path: <linux-usb+bounces-31680-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74585CD6897
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 16:32:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF8FD307DBBE
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 15:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52BB32AAD3;
	Mon, 22 Dec 2025 15:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZfnMFU1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C7B32AAD2
	for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 15:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766417390; cv=none; b=XA2qt8LHDqwupvEM9x0A9K2HmMkWAcNgFY9URpKS0MyVxFpvdYnj004P47IwdriIOfZdjNRczHNtRWs4AFN02YJITy896jPn6W/QXh9hiVd4A3qbfaUJVDiRJw7DYQN0czr8e59HQPxfmPdFL0CjQXtf0TmESylaAI6+EHH4zPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766417390; c=relaxed/simple;
	bh=VKYVMzmse4VENDeaxPRZlnUBo4oocwkoZeRYW616Yh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A2x0HDHY6SSFpKn1XAnzOGVUMQo7SX6DhuskUwOxrYHehqavja+lWbLsYWZnnIjdjxs52owIuzKw5QMAQn6cOdtBlmHKoAGo1B/SyHPBHar5Mn1SRaSqjbFHtSV62TXS8S/v4l1YIa4e+eTl1PvqLHRf4NCV+1Wsgo8GBpAkjiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZfnMFU1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4775895d69cso17231155e9.0
        for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 07:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766417387; x=1767022187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j+OKjLww5FUfSr52sUiaIMe+sYSZvUySZJiUbOG9H3w=;
        b=jZfnMFU1neYz2N0+LZ0xZBvAMMGME99q80aCW09FNEb5XJ4fvdzUoItA0Z2PnEpIt8
         2cLFmD/1Lfrz1LLz8LL6wSLR3g3AptCvUOHKvz9JthfxbNLzURY/xdA0+GrV7VUo/OA1
         hrG3UAD2d0uLtjI1RFgbg3krwI2PdY4NbaniL63Uh7yHfEewxQ8y/ek/E4iaI0RprnzY
         WQYWhkymAFmJ6gejWhpPyRNdNby2CDCrYVCl69scI/EcLOCyHizaUZG4V98s4lqGq7t2
         dPHXSKfpJEutBWg+siqyJtA0l0pdcmq5/jrdVMfCxKcP9nVYM5ppnN62UZMVLLYmGMOU
         O5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766417387; x=1767022187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+OKjLww5FUfSr52sUiaIMe+sYSZvUySZJiUbOG9H3w=;
        b=jpvGyabS+zbehdoLQpiIvvC2EN34Hy3hH9zpmWKWzezIuZwg6alxdXbuFGfBoDt/gl
         jfDN+D3IPax0MLVw70FFk7DUJ993hM8bc8YtG1JdvXptLnmgmTJ9jRkYwoItTAvB8ipK
         3bwODCloOTx2GKAf1hOLacXFwCjJ07wgncD3Gk+mhcsYesW+aQHK2oicrRdPzbpaNmO7
         6r8aE12Br6LlHCCKcYZwdNgGa1XxEU9uew9luaqFRh6tTFWPafa3tl9c+MI0w9e9tVPF
         jcTrmRUAj1JmKdcmF7R4ed+gRq89h7WWIXBMeVoQl0Stgurqm+yfjIIlvx5DlXm9o/lQ
         BhIg==
X-Forwarded-Encrypted: i=1; AJvYcCX0Pc3bJjv+sG+dYTQ7evtVS2AXFyzBhEvRtXZWyktdNE6SCuJM5Q4x/MJHW1SEVF0Wc9m4EzbG58Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqhIUoO8Va78ignnF5iK8WCfs/AEs6DAvfi3cibq4QdpKySLGb
	OeCegVgMMbdSVW7WAqGYuEq2NN5SCTApDfol5IEPgr+QrmaGOH/oWk1+
X-Gm-Gg: AY/fxX4QeGoF+kQWQvEAPUaKFh1y66YofiSLvh1QOhMCz+0n8qw4hRxyayU5jhH0Jwb
	TFBmPKa4jpBklx5wpHhSe4icTbk9z7seNs5aCKjofmxcqKuVURSBJw+8S+ULl5npcOJZ6Gu9OuR
	S5AbYR33T0iZhuncIwUoZ5ueEglC+DF6pt56nx/g9Sg4zEtJ4gFOVxtDW1lGDZpNCfX6AiZiMB2
	aKWYbFJa0grTnqp7UFemJeihxWPQLE1bjEWjh0H1l3p/oAJMsNIPobqMh1UQ0s+bFNIVYueJAKS
	GH1ZROiKwZbJn2WwaaX7CH+SnT95cttAGhYm6bLfN2VEHBQIM5MVrew5zlhRN8Uk9GIkXxKBXmX
	B0o0iW9F5EGC3rlhr8KOvL1cjYGeyBd8jXESM2ZNUhSsTqa2OWs82QV4GjBQi4QmGGt7yFsfpXO
	sBDz4zrKTem4oaNA38U7KCLw9+0jEZDK1lPcWKiky97M7w0CqTjInUb96bESKbtw==
X-Google-Smtp-Source: AGHT+IGM6fQvuIIOpREP+B+O3M3ibRqFT50uyGcMNAnyJoixh9A0Qh1WuuHB5+i9945AYtgxkpjduQ==
X-Received: by 2002:a05:600c:37c6:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-47d1953c178mr121525005e9.3.1766417386840;
        Mon, 22 Dec 2025 07:29:46 -0800 (PST)
Received: from localhost (224.85-87-222.dynamic.clientes.euskaltel.es. [85.87.222.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2724fe8sm296520225e9.1.2025.12.22.07.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:29:46 -0800 (PST)
From: Jaime Saguillo Revilla <jaime.saguillo@gmail.com>
To: andreas.noever@gmail.com,
	westeri@kernel.org
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Jaime Saguillo Revilla <jaime.saguillo@gmail.com>
Subject: [PATCH] docs: admin-guide: thunderbolt: replace ifconfig with ip
Date: Mon, 22 Dec 2025 16:29:26 +0100
Message-ID: <20251222152927.38101-1-jaime.saguillo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ifconfig is a legacy tool and no longer installed by default on many
modern distributions. Update the documentation to reference ip from
iproute2 instead.

No functional change.

Signed-off-by: Jaime Saguillo Revilla <jaime.saguillo@gmail.com>
---
 Documentation/admin-guide/thunderbolt.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/admin-guide/thunderbolt.rst
index 07303c1346fb..89df26553aa0 100644
--- a/Documentation/admin-guide/thunderbolt.rst
+++ b/Documentation/admin-guide/thunderbolt.rst
@@ -370,7 +370,7 @@ is built-in to the kernel image, there is no need to do anything.
 
 The driver will create one virtual ethernet interface per Thunderbolt
 port which are named like ``thunderbolt0`` and so on. From this point
-you can either use standard userspace tools like ``ifconfig`` to
+you can either use standard userspace tools like ``ip`` to
 configure the interface or let your GUI handle it automatically.
 
 Forcing power
-- 
2.43.0


