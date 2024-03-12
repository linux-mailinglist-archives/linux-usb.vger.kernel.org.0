Return-Path: <linux-usb+bounces-7844-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BC8878E4B
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 06:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8B511C22173
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 05:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045D51E48C;
	Tue, 12 Mar 2024 05:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/SXkd69"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE0D10A12
	for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 05:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710222973; cv=none; b=m+MmhJwEpd57a/7U8VngJrXZ+HoJk/NsfPc9e0wn/paLOtEnz1MGpFx4xDv4gEUAQWtg9XobBFDcK+VXX9qnoN6QQn5u9YOT7OzNFh8ZpF9HBzB8RHIlb4u4+ca2WnqmZh4goL941T7adN7Ci925aDKptb7vsR0eqqtL7YTZ0rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710222973; c=relaxed/simple;
	bh=AeMCnQrcghrbfUiausLzdPueuydkmOOocRBBjL/GjSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T0wfuroMd/yN/xgibsKd59DnfrlsKRgg0/vNiwekvANfAlhdoJWdJPqS/zPvMUoy3gSDyhmSR8YcHdGcFEznH0jfMEqFn60sqjMSAof5RbqLxoktc6u+1ImAzMm9tJOGEEcCkgSHRWzpbz8BXsUqcw9lLjXBukPz0m1/5KcIoTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/SXkd69; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e6a9fafacdso30133b3a.2
        for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 22:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710222971; x=1710827771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+As1I23Fk0wt6wYR+3fekI8diQCK3+5aZIPQ4oN2LPM=;
        b=M/SXkd69Wr9mfOzPKYsOas5RQfAXsBpoThkmCb7IMGI5Gs55Ii8ICCfbdXec8smNeo
         bFiSlh7iYVq8ey7k3vVzTQ5zzNGA92MBQshZlIvVPKQaXwEJgXhR9rWsyAv2lw3sRJvL
         T9rPDIkZX+CTOXU2Xk/gEX8pLK4rRPTiGEbHF/NmVahXx/AFOHWUV+WO1t56HMbMYbe+
         T/M1BCP85ZtGu1LtiouqpoWVoUk7N2jm3f85nEfizdaa6pR6uwCq98/qWheTRLzU7Rdr
         iZ7uJfHkVALJjGQmBqPhy3WSiCutsj6LZMBdyG+iEXWnL7pBiYGmp9uMCQC9UZTbk22K
         a7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710222971; x=1710827771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+As1I23Fk0wt6wYR+3fekI8diQCK3+5aZIPQ4oN2LPM=;
        b=Ec64eDibLF4asv9vwtKoSoklxMlBQwBetSPpUWRWh6JyLU46YQvYk1O52d6AS1takC
         naBfVkdJbUgJu+eie/qPWYIxhjO4IVGnZhDPm5uuzLGBsuD1usv5UMnxD3Jp+oVhJqrk
         kIP0LFQOgXe0eNuMjJccpbJ0Xs4sf7UuAKUyxn9c29yaPmj20LKTRZ+az/aFd4SFQEb4
         CArxNsUZm6ABHLH9H6ObsV2dycM/FasfQNQcYJsxgCOqdh1rK10osRxNkueNKhUfJ8kQ
         ym2Mp+cjs+cTfSX3CnoHJzVCCDhQvf8aPa3al0UGU/wZncwy49zMk3bF7lf2ROIqTrI2
         aLQA==
X-Forwarded-Encrypted: i=1; AJvYcCWV7Z7vUq0ypW8Dc+8cipaPwnGmVLKTjqt6hHHpc7SEBWJQoJyGl4YMvbEmjHU73y3cDtJhEqWkugLAb3Gx/JQE+NWjdzSa5yJy
X-Gm-Message-State: AOJu0Yxw+zuWLCZOOrmjSjdRRTWeG/b5/IyDN32HnornRcJPfWl6C86q
	swtvLouQO/HdxLXsKlvdC/n642y/QOAQY/YHMj49qzOnYR+E0X7h
X-Google-Smtp-Source: AGHT+IH5q+U4aeI8acoozFuVn90Z/1xRn18QFi1lRYlXsImbFabgnwQwDiyTBVGNE92gA1JyoX96gA==
X-Received: by 2002:a05:6a00:2da2:b0:6e6:5012:8b38 with SMTP id fb34-20020a056a002da200b006e650128b38mr10481346pfb.25.1710222971451;
        Mon, 11 Mar 2024 22:56:11 -0700 (PDT)
Received: from petra.lan ([2607:fa18:9ffd::d95])
        by smtp.gmail.com with ESMTPSA id k30-20020aa79d1e000000b006e65720e892sm5448898pfp.94.2024.03.11.22.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 22:56:11 -0700 (PDT)
From: Alex Henrie <alexhenrie24@gmail.com>
To: linux-parport@lists.infradead.org,
	linux-usb@vger.kernel.org,
	sudipm.mukherjee@gmail.com,
	johan@kernel.org,
	daniel@gimpelevich.san-francisco.ca.us,
	hkzlabnet@gmail.com,
	reboots@g-cipher.net,
	mike@trausch.us
Cc: Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH 1/7] docs: driver-api: parport-lowlevel: clarify purpose of PARPORT_MODE_PCSPP
Date: Mon, 11 Mar 2024 23:50:26 -0600
Message-ID: <20240312055350.205878-1-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Link: http://lists.infradead.org/pipermail/linux-parport/2024-February/001237.html
Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 Documentation/driver-api/parport-lowlevel.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/parport-lowlevel.rst b/Documentation/driver-api/parport-lowlevel.rst
index 0633d70ffda7..aaf02cf62363 100644
--- a/Documentation/driver-api/parport-lowlevel.rst
+++ b/Documentation/driver-api/parport-lowlevel.rst
@@ -155,10 +155,11 @@ hardware.  It consists of flags which may be bitwise-ored together:
 
   ============================= ===============================================
   PARPORT_MODE_PCSPP		IBM PC registers are available,
-				i.e. functions that act on data,
-				control and status registers are
-				probably writing directly to the
-				hardware.
+				i.e. ``base`` (and ``base_hi`` if ECP)
+				in ``struct parport`` is valid.
+				Functions that act on data, control
+				and status registers are probably
+				writing directly to the hardware.
   PARPORT_MODE_TRISTATE		The data drivers may be turned off.
 				This allows the data lines to be used
 				for reverse (peripheral to host)
-- 
2.44.0


