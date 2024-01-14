Return-Path: <linux-usb+bounces-5028-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E85AF82D077
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jan 2024 13:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D225B1F2198D
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jan 2024 12:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1A220EB;
	Sun, 14 Jan 2024 12:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqRtIuGs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574EE1FC4
	for <linux-usb@vger.kernel.org>; Sun, 14 Jan 2024 12:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-28ca63fd071so4060654a91.3
        for <linux-usb@vger.kernel.org>; Sun, 14 Jan 2024 04:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705233865; x=1705838665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n2FRTQjDxgbMinVjfY8semc9aCDzwF+AVNQIhkRuACI=;
        b=eqRtIuGs6VvIqOrTD1kmOKIs7hliArWqBb7ZWTlvyKypps9xWL8Hbz6KaVkWXpZUjO
         BHGcP74+FF1HwbQDhplURVHHe/4gXzbIIgqutQt7kB+f5U2zOAI2KJvrHczlDqmAcGgF
         kxE4mKHepPj/U9nAAzQk8GOt9emrdGLm3NCnGR/FboumRH5VFZrEV8qO41qp5gsAyPsi
         L0JbXgrN0lxCqqaE0wvmfhRlRfydmBM+pm87CCuAar+RRbi5IIOQwdlPm8YescDBWbQD
         YTa6Yoxg7nhZUrQ4xcPVlhEwnpbUt8lnFV7F0Zxp23X08MvPRxpO01ZoejWmoYXikaMd
         tX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705233865; x=1705838665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n2FRTQjDxgbMinVjfY8semc9aCDzwF+AVNQIhkRuACI=;
        b=jhJL13VwM6YIlbPmlbazw6VwrL/OFFqRrl7ykODfZP9EVzQO8zaLLOFfWOQTuNwIi6
         KlTjKoKvul/H8G2/x94bWie/xKdcGkDgGc9GuVeHpXcMJ4pe4uOOWLFTgilaiD4TKdfg
         hbKFtLoVHTHldagq0KHZ6oN7hoX2LycmmSVKTgc62OxNvabaNjzCHEUwYQlMf073NNaN
         XGEDhw0042c7wbbRJzqNQ9qoqTvTEqVppxZPoJuQFhA9CJyA8KRQlOpcILJxkcdtWH2T
         NXbv8BUYdOCpuS3NCY0FxYPboeN6JITBGggF28+Mp9g2+UE6NilGW6qZJ4xeQVpcG+uJ
         525g==
X-Gm-Message-State: AOJu0YykQ6f3gbATyUQjN3t9lRWCYc1UuVmgWvdBjT6g/J1cTZqJOEfH
	IIie0fC18pmKKP9NWoJey/k=
X-Google-Smtp-Source: AGHT+IGl5Ck7DW9+uhlfRVFVRXKQmsxstyAH2k0CRXgd1qb22Blt1tIOTrkMndf2qlYUr2JYoCO+ig==
X-Received: by 2002:a05:6a00:3912:b0:6d9:8453:1b55 with SMTP id fh18-20020a056a00391200b006d984531b55mr2124013pfb.0.1705233864984;
        Sun, 14 Jan 2024 04:04:24 -0800 (PST)
Received: from debian.realtek. ([115.135.24.14])
        by smtp.gmail.com with ESMTPSA id j5-20020aa783c5000000b006d99f930607sm6142846pfn.140.2024.01.14.04.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 04:04:24 -0800 (PST)
From: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
To: andreas.noever@gmail.com
Cc: michael.jamet@intel.com,
	mika.westerberg@linux.intel.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org
Subject: [PATCH] thunderbolt: Fix rollback in tb_port_lane_bonding_enable for lane 1
Date: Sun, 14 Jan 2024 20:04:20 +0800
Message-Id: <20240114120420.35378-1-rahimi.mhmmd@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If enabling lane bonding on lane 1 of a USB4 port results in an error,
the rollback should set TB_LINK_WIDTH_SINGLE for both lanes.

Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
---
 drivers/thunderbolt/switch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 44e9b09de47a..af5e4a650a29 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1136,7 +1136,7 @@ int tb_port_lane_bonding_enable(struct tb_port *port)
 		ret = tb_port_set_link_width(port->dual_link_port,
 					     TB_LINK_WIDTH_DUAL);
 		if (ret)
-			goto err_lane0;
+			goto err_lane1;
 	}
 
 	/*
-- 
2.39.2


