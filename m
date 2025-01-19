Return-Path: <linux-usb+bounces-19514-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C80AA15FFB
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jan 2025 03:19:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4002B165CA9
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jan 2025 02:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08EC1F95E;
	Sun, 19 Jan 2025 02:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lax5gy3m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D407746E;
	Sun, 19 Jan 2025 02:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737253172; cv=none; b=jj01XqhMCgaf/JRF5JbFalRPHXnjclulmmcQTrqHII+vnwiTNx8GMJYmNn5O5A6ZkVNcHGL/Uzm/BHebwDKHaOEgH9+FCuxvXK2yKIg54RRzWGsBRUnX3gWL36Zg6seLoXPlMkCchi2HpFLgsQTh1X69cYS26hFWXPH8mk9+xFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737253172; c=relaxed/simple;
	bh=qoRpXbtBkhVwnGQkY1v+h412Lpx8bX1MYLICay/M9Mo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KM2oD7pwJKMoUGu4/U4rzfa8GYoKvpGkBB0iUHKZpHbAEL1fACMn/PxX/pVmacbRjpPkakTB0EO16264tZq0uBMTgYtWyeULc2D6Ckn8hsAa/jyoli7RF5pxTTm2AAW7HGBTxUaZJJSayM9ghL5I+odaqO6D0SLm4+VPVvb22ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lax5gy3m; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2163dc5155fso62356055ad.0;
        Sat, 18 Jan 2025 18:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737253170; x=1737857970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xphr9dwRwpNzUF0l2PpeGG9kksYPNUNnPEFm2loZqKs=;
        b=lax5gy3m3lILAjA4IPw9fr7Ay+5iIR5cULx6GFwmkx59o7yC+LKNqOFE2QW0QdHxNy
         O065Yt2qjgtRVtMqu5rxamj75p2Pgzmi2M1ZoPRP8Yig9am5pvN+Z+7NDUjVe3Y/3ZDj
         m8Spi9Bv/5b1rpuRAZ7GL9unPfUpZLsH7GGFwGfbLnFWjwjO/m9TieVoFIjfXHj/ZDFs
         z7NnhT5k/xjj2dGVarPNFe4PoHvpfq2DKkuRApwT58ZIXDj1uW7C7E37M1wTo/AfOFyl
         LTlUHG054c2GxzEUQoyiAnrmNJjL8vzI8yolYP62QKj0K5faDnTg5ELC+uYeFDAWMOzz
         9KbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737253170; x=1737857970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xphr9dwRwpNzUF0l2PpeGG9kksYPNUNnPEFm2loZqKs=;
        b=b46axmx+q6fBgMqspWpj3fH0VxjFYSOgzobFOmOmM+WVhlMbCxc2YD1UdOZ0qHN9Cm
         3Z2XCP6HkP5edUhizYL7i7PDIfjs5BXOiCGHZhE+WHTFvrD7T0YcrczwLgIpxQnTNF3K
         fr9SQOSTOxKOyhCYuMlVAWx3YrcSbJ/lkEKFP6Ahvcu5LSDVDtEv/tIHcG+7vwgq2BI0
         EenRGUBtJKD0w3LOyNEudGrRjLnq5fALYdO9DEgt1YPyV2AK+jHo563pdTdJHVhrerPo
         zRK69G/gZLC8TvSu0pMtTNmc2/Ye9ZyhXjuJIXSdSN8eCMuoT1l8pHsuFvcRWy6asjrS
         jlsw==
X-Forwarded-Encrypted: i=1; AJvYcCV6hHAMBJbIiS4VgZTnsA0jxw8VZlEuctrGmm0NDqLmB+TW7nz4xj3vzAfgCc+1LALuS5SBuuezLj793tU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yytam/eDxDWFvShZZzdQJ8JKfgaHdNeCD6kH/E2H2wBZc3rvSP3
	Js2eGk8Pbp/7Y+YFlMwWTHhCitGMqs1mw49F9ofclpxFFLkYf1Hk
X-Gm-Gg: ASbGncunkHIp2v504jc57QsUyb+NjBWoSTd7kCyTyHeSWO8HYFOLS6o+ZNVG+7FoJ5e
	/U5w2J1TbzBQs/6BOiGOhYsqrXT+7B3oZAV2eBPt9iHGVid7JkV1gtPTQo25uK9pfZzP+Jw7rv6
	LSz53DZC1baQm4iPbSD3bw9fpLHDr69l9+3Q+QO4TBgV5OsdDqwcuhFpI149gI8YWITyEyl0YJO
	afUovNrX8KiPcMIbb5u8dFG9XDSmGGEvMar2mtCADt3dDSSnaN0t8IAGEMJaFcN1j+7Or3r4uYL
	y9boaB8NI9We1XtoMahcPQ==
X-Google-Smtp-Source: AGHT+IG7EXjJGMrg1p1R/k7H39Pa70uMWnW+wufIgc0HbdWBjP81IWlMGjyfceU+UNp0LWg+gxEWUw==
X-Received: by 2002:a17:902:db12:b0:215:603e:214a with SMTP id d9443c01a7336-21c352c8151mr151786045ad.1.1737253170201;
        Sat, 18 Jan 2025 18:19:30 -0800 (PST)
Received: from localhost.localdomain ([190.196.135.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d403b63sm37216535ad.235.2025.01.18.18.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 18:19:29 -0800 (PST)
From: Camila Alvarez <cam.alvarez.i@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Camila Alvarez <cam.alvarez.i@gmail.com>
Subject: [PATCH] Fix DWC3 documentation warning
Date: Sat, 18 Jan 2025 23:18:04 -0300
Message-Id: <20250119021803.23272-1-cam.alvarez.i@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes ./drivers/usb/dwc3/core.h:983: warning: Function parameter or struct member 'sg' not described in 'dwc3_request'

Signed-off-by: Camila Alvarez <cam.alvarez.i@gmail.com>
---
 drivers/usb/dwc3/core.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index f11570c8ffd0..ec74d5859343 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -942,6 +942,7 @@ struct dwc3_hwparams {
  * @request: struct usb_request to be transferred
  * @list: a list_head used for request queueing
  * @dep: struct dwc3_ep owning this request
+ * @sg: pointer to first incomplete sg 
  * @start_sg: pointer to the sg which should be queued next
  * @num_pending_sgs: counter to pending sgs
  * @remaining: amount of data remaining
-- 
2.34.1


