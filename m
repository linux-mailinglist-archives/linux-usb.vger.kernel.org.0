Return-Path: <linux-usb+bounces-27374-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB2DB3C06E
	for <lists+linux-usb@lfdr.de>; Fri, 29 Aug 2025 18:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7050D1C804FA
	for <lists+linux-usb@lfdr.de>; Fri, 29 Aug 2025 16:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D779E233159;
	Fri, 29 Aug 2025 16:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOGWoYJR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC207EACD
	for <linux-usb@vger.kernel.org>; Fri, 29 Aug 2025 16:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756484239; cv=none; b=D3qzOHG50NcmhLVCs1d3hT/Nx/8zAcZEV6hHNJxSvtK5e9kyXRbfPOaL+6RJvzSdSFBMyWulScSEqI2GSCd51aKOxwtTrfRoi4su8lLwH/0CU1ACRTREA1mSxqDUdOXyz1v2RWpMopV09DWc0yuPPk5MftLoGe2HSolDYibeHG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756484239; c=relaxed/simple;
	bh=IqEu0mZHV63RbT7c7EW1+o9eNW8DrWljfij7oXtVruw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tq3IFTwKsaXDKALicmAxIbsjq1/OmIGoM0kVeQWpHyo0e4EZAdA14/sfqX1xglEMwSFsKq2zJQjkqlMdiC2e84F81zQ9/qqnZo7PKO4nMTkgKKUWbU1S1005Kda3uc0SZ0zhDhTk+gI1Vk7+GkTBOvQY7JZmsagIyKXF/4ymMcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOGWoYJR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so14738235e9.2
        for <linux-usb@vger.kernel.org>; Fri, 29 Aug 2025 09:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756484234; x=1757089034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5/xgVxD2MLPErZaWTxQKc6/6L7tUcPgyK4Fuh97vP9A=;
        b=eOGWoYJRsyTTW2+ffxKoTBbps7UMle83c9OZu9Ym+S7GWP71/54uIlpwYUWX1oGUJg
         SlpJuwdkw8Co+NdPQylK3+PQciJ5QQPHaQxrDS1mAdACp0Wp0FMPtK48xekl62zmP/XD
         xF/PhgjShIjwfdZil49flbk9j78ywdpZNQFHfDbfQvcVk2o5uzd2Xui+o1G0470DRJzM
         dlg0uE4uQHHI+iJlUEt8tiwpf/l/nRrJhMGvrD84aYJX3QnjFakfFamPZW+S9XmFvUPF
         k6dqm8Ta0p3Hqi2tBR6sq0OWKBBSytKAy5e0VEj60qUKIv1q5k/pQGa6gKU1Ky1Liaq1
         vQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756484234; x=1757089034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5/xgVxD2MLPErZaWTxQKc6/6L7tUcPgyK4Fuh97vP9A=;
        b=TaRAoNyHb2s4hhhVyDYR3kIMt0ierLA2eJlhf6nofqMhT7pLiQWtFtxJfmWNiVmMB0
         P5mk0aEuKq11dqqQlAPb3EarIoBG1/F7nHMAhVFRHXomcKfJkNzfZabvPNYHYPEecLGU
         bTLGSn8EE53TLm5L6Dvlnzcb6poWqBSJmG6mwcH2otQzGFIybGYA8aHp3UD3QmIdxRcO
         I9ONRge6TORWKnvi27vjcTHq/v51knc703NW8c7rSFNtfhEyqFmGzx4mFWEwvMK3n55z
         ISyb+DOXiP3SsFrTXpJ5L1uRun1h4XXBaT8Ra1QyI5K88JiBoDz11x7N/apMgEnodSjK
         EuBw==
X-Gm-Message-State: AOJu0YyaoWPzrpdd17wcrGAFrOaogpyDUts0hTg3KcICv+F+neniWxTb
	xZH5CaI0+kiAe+GdyANxtAdnKcTRkiwAYRIHAxvbKXCCFaposONJUutzv78IAw==
X-Gm-Gg: ASbGnct/CtWgMciwesYy5dM1mgQdqHKN/Ll7mn0H/EpRLH7bA+IEgb9TASyl393qD3O
	KPyrQkyZJ1BB6UwBZjpiOgR1S2/9CLsFsX3ei7cUYY38zahOPEq7FT87S3BiUuDnJdHf8mafjBj
	+OG7Pd341BBZcMezQH2cd6B8fC1VEE086dNZG30vEPMaaGEA/6QjvDyCgTlACRRb0IYLxkvg0Eb
	BgL+jwqPZu53CMS2OXKtMQYyeSHIxkOfM/3Y0FmJ4LZAQGKdOBFVD4uAGUm+IlZGmyeGOchfX3E
	wnFSc7s6knqgOuSBDj4uy6Zhd/Bf7DDcK9THbRSsGazJ5awXi3VNLsQHbBtV+M4WwixoqlzjCTn
	Qi61AhIIF0xPl9xlM6Em4QRl14liP/5IM57cR
X-Google-Smtp-Source: AGHT+IFxjmJYI2By5cid1aYQOeORQ3RHFcmraw1huTuiFFs2qT5P/IDEnwai5VQ36YN3v8yNcFOQiQ==
X-Received: by 2002:a05:600c:3144:b0:45b:64bc:56ea with SMTP id 5b1f17b1804b1-45b68229282mr130962915e9.23.1756484233771;
        Fri, 29 Aug 2025 09:17:13 -0700 (PDT)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b73cf86f4sm103683005e9.6.2025.08.29.09.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 09:17:13 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Petr Vorel <petr.vorel@gmail.com>
Subject: [PATCH 1/1] usb: misc: Update link to EHSET pdf doc
Date: Fri, 29 Aug 2025 18:17:08 +0200
Message-ID: <20250829161708.106813-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obviously file on the website was renamed.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 drivers/usb/misc/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index 6497c4e81e951..f314f0ec777df 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -231,8 +231,8 @@ config USB_EHSET_TEST_FIXTURE
 	  VID/PID pairs. This driver then initiates a corresponding test mode on
 	  the downstream port to which the test fixture is attached.
 
-	  See <http://www.usb.org/developers/onthego/EHSET_v1.01.pdf> for more
-	  information.
+	  See <https://www.usb.org/sites/default/files/EHSET_v1.01%281%29.pdf>
+	  for more information.
 
 config USB_ISIGHTFW
 	tristate "iSight firmware loading support"
-- 
2.51.0


