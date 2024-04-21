Return-Path: <linux-usb+bounces-9534-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9A98ABF53
	for <lists+linux-usb@lfdr.de>; Sun, 21 Apr 2024 15:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFEE81F21826
	for <lists+linux-usb@lfdr.de>; Sun, 21 Apr 2024 13:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F80F16426;
	Sun, 21 Apr 2024 13:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EF2mIRBm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8404625
	for <linux-usb@vger.kernel.org>; Sun, 21 Apr 2024 13:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713707286; cv=none; b=lNbAZlF4yubWGv8zbGY4woa/L/0ZYSoJeVeGPKSxuW1dBOtdlkdx3KIlj+XVpnfu2p6CF1f4+YHBoUHfkd+m/5XqUTw7V/BMlsYtP8dVFpB1WzDH9xDHLv6sQqIjGKFEV15poIZYKVIhpFC6lfJp+p2hFi51sFv76JmROKaDlBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713707286; c=relaxed/simple;
	bh=kUDI9MsZDUY15FIULV8ZS07bkFaF37Bu65yCM7qkZQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CZs9oWJ8LsFh8gL6veIOi9/eEREcRsbyzQ7Kdhx0DEKzzQ/zBIlZ5h+55yq8R5MdsfGecEUEOQ6XX88nyIzde9Y4zm+xq0fuqdksL6q3tmZAk7LYeH09xvYFKVIt/Qsmu5V5N3T7oy83aUMWuNke6fVdDWwApH+vemMd9jCk1qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EF2mIRBm; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6ecec796323so3669954b3a.3
        for <linux-usb@vger.kernel.org>; Sun, 21 Apr 2024 06:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713707285; x=1714312085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BtrAXLfzcekpGywEsVXzskw6iAF5Jyh4FT9yCUxGY/U=;
        b=EF2mIRBmLh+I+Qs2AwO3L//NIsxX98w5GCP8TxbLi1+oJ8SYY9kw+2R5eDGH2Srmav
         dptAIiTvJKhqXf8L6W4kg/2LoOq3a7NMatqKAVhL7t1/q32jRIAp6V+qbhDkuxXMTLKk
         mlR2uDr6QIqt3zHmf6ASnYcSV/CmtZfelfh3iuFPOE+XWfHa6k9n7EGCwYc1UVdxSHb6
         PoQsNGry8xF+4PRx009Nx6F39uaU/ORj+ucnlEQj/1PpH6ok4reQMGyoTY9o245iLZps
         DZeTS1KYh1wedNku4Npl7yWkBLj1cNPF9vzbitZnLUyLazsReobZlIlK38bHAFX/DlhF
         F+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713707285; x=1714312085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BtrAXLfzcekpGywEsVXzskw6iAF5Jyh4FT9yCUxGY/U=;
        b=bMhawiC2PWyuOxZZCMtM1WWBkeHJj9wnE+Ru0BE3/v0mszNzlVhCI641EXMKIOX02B
         4LMxWZpuQpty9vIomkGJrGUoSXE3VF36tfVAy6q/UYQWfLP65ZL6ksQCCXRiFJu5Ms/H
         7OPDmm9TDvoNthHiu6Tv+t3+bMEyK+e/w0bQE4fQpigu2F2rO3PSUL/WKVmdxyqKSuzL
         MEZg0E5YW+/VYZMXcqCQw/XbowMj0VBhmDONhw7i4lPH3vCC9Ex9uGYN3harZwyTHRoZ
         zVCKKhSLWGYoU5QMsqK9DFaPg9+ZUkfApGlmCr18eVhK9c79ycyDCcXm+gWtVJzjx4MP
         MChg==
X-Forwarded-Encrypted: i=1; AJvYcCWAx99yDIEK5hLtLFNrApJWpNQOZjUb15INHmMgT91/2FTsCB2ktJhqO0gwDYGbhwU+A0bMKqFY5mLy02ExijdbwBF4M8U7jQDt
X-Gm-Message-State: AOJu0YyNmhVff/fxc3LkWN0CWpoRXBaI3U8i/pWBtI+9uimiRZ4HKtQ3
	tcBR36Kt7mwJOo2RowTVmlOe49EN/G3m9cSdK+RGIZomlr5XRxBo
X-Google-Smtp-Source: AGHT+IGW9QxSAi8oUw/YWJKluzRMVvr3a5hC8LGuiawhSrKfcbe4zvTzZiBi0c1UzvTRT2hIxO4W5A==
X-Received: by 2002:a05:6a20:6a09:b0:1a7:58ca:cdf3 with SMTP id p9-20020a056a206a0900b001a758cacdf3mr11408126pzk.8.1713707284928;
        Sun, 21 Apr 2024 06:48:04 -0700 (PDT)
Received: from localhost.localdomain ([113.30.217.222])
        by smtp.gmail.com with ESMTPSA id o13-20020a056a001b4d00b006e6c733bde9sm6175043pfv.155.2024.04.21.06.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 06:48:04 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: 
Cc: Anand Moon <linux.amoon@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Johan Hovold <johan@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 0/5] Use new helper function for clock and PM macro
Date: Sun, 21 Apr 2024 19:17:29 +0530
Message-ID: <20240421134752.2652-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

using new helper functions for dev resources for clock and PM
to simplify the code changes.

Addressed some review comments.

v4: Add Reviewed-by:  Alan Stern  For patches 1 - 4:
    Add Acked-by: Thinh Nguyen For patch 5
    Fix rephase commit messaeg for patch 2 and 4
    Fix some typo in the commit messagee

v3 changes:
1 Use  new DEFINE_SIMPLE_DEV_PM_OPS macro for PM operations
  Thanks to Thinh Nguyen for your inputs.
  so I have to update the $subject and commit messagee with using new
  macro.

2 Drop the dev_err_probe in return to simplify the error for clocks.

3 Dop the devm_regulator_bulk_get_enable patch.

Tests on Odroid XU4 and Odroid U3.
found no regression with suspend resume functionality.

Previous changes:
V3: https://lore.kernel.org/all/20240412142317.5191-6-linux.amoon@gmail.com/

V2: https://lore.kernel.org/all/20240404071350.4242-3-linux.amoon@gmail.com/

V1: https://patchwork.kernel.org/project/linux-samsung-soc/patch/20240301193831.3346-2-linux.amoon@gmail.com/

Thanks
-Anand

Anand Moon (5):
  usb: ehci-exynos: Use devm_clk_get_enabled() helpers
  usb: ehci-exynos: Use DEFINE_SIMPLE_DEV_PM_OPS for PM functions
  usb: ohci-exynos: Use devm_clk_get_enabled() helpers
  usb: ohci-exynos: Use DEFINE_SIMPLE_DEV_PM_OPS for PM functions
  usb: dwc3: exynos: Use DEFINE_SIMPLE_DEV_PM_OPS for PM functions

 drivers/usb/dwc3/dwc3-exynos.c | 13 +++----------
 drivers/usb/host/ehci-exynos.c | 27 ++++++---------------------
 drivers/usb/host/ohci-exynos.c | 27 ++++++---------------------
 3 files changed, 15 insertions(+), 52 deletions(-)

-- 
2.44.0


