Return-Path: <linux-usb+bounces-18902-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 889029FEC27
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 02:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A880161339
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 01:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E9E2AD02;
	Tue, 31 Dec 2024 01:34:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D461BA2D;
	Tue, 31 Dec 2024 01:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735608883; cv=none; b=YKAIBuBr+DH1PNZgR8FCgftNs8Eh0G64nLSvuUxxQiTqhHVJaIZEDLjvSMFgutggKQ4bzXekO37JNCoLFi2VQjt1S3XRH3+c60gLGN5y/S1dJObvhC40zPlVAE45vJaEo2rZtDkySMmlUcQCfTrgV9axo3vD+JTQaWpfRb2YDsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735608883; c=relaxed/simple;
	bh=03BmZDFlHVPf8aG+3EBnl2rR8fuht4xFVcCsna53hco=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hSe99U5GmTx7XD+QEWDn2OVBDFBFhUuLQE9mo1mAT3Fy5aLeACtFgXPVQE80ucE+aXCLnIfq/gH0Ppq2egpCXu/TogB/xbpeg8J/hOoj6nv06V8hr0Z892ZeZCqKYfkVABsmZoNqCVldglQvj2CG4G7N86FQwAbJ4pAz6IRytQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ee76befe58so12914391a91.2;
        Mon, 30 Dec 2024 17:34:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735608878; x=1736213678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=596wxlyWrBHUHAHbY6qH2LEMtmJsuKM1rfFEH81XSqM=;
        b=BpLWpHEV9MHJyf2BiFmSx7N+cDR5WWI0OdCwbU2/3dURngqaCgqXAAq2J2fEHtnQj4
         CVmMzzqOPcqYriaeFHtVSJZmNQjR+EAHPT71HMqaBUxLLAyseX+WxtanheoL/rPz3fZX
         13x1s+BWtdFa8WJ+g47WQeOaWCQwvGYRFQu21MWzEE2bHSu1t8hNpfHwavJIsooz6SWu
         patcN5y8KhP2obFzO8NDHLfA49jjMZgKngSarVwhi6ki++8+GroRrc8ezkT/zhpGROrz
         Gqe8xxA/xQEJzooMimSSocuGDRaW2w5p+/LM9b88M7lMqq6oIYd3lxn/iLP1olb/rbew
         ARrg==
X-Forwarded-Encrypted: i=1; AJvYcCUqcdpzJyJraWSwz1TNvuSBnInje/vKJHcN82ZGhyEancElZyuV+qt4+lQX/UrhGF38w24Bc+wvddPo@vger.kernel.org, AJvYcCV88DojLLaxd0z6y6QFA1ZUKUibhCtpOuDr6yohw6U7nW3mwdWy14cjDGgYzfQjVrSu/aJmD2//pHMiN1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVLvyOH20THZG+Z4C3KwCcqC0Fu6xoU9nPUdp3fR4ZYanSXWdE
	wK10CKpmaCZfAN19EpfS+fnvuTp0xIC1rqK1kW768meDJ9P9B0Lu
X-Gm-Gg: ASbGncuS2oi57J4p5z+jvi9NFr9H8johsFc8t5LkV5aR1o6i5ppChQhZO/X6WsaN8uv
	5lFgeIVe9iuBo44tRMIOoC2lNusayg6m085eEikcHz2qB1CaVCXqbfrd/+UiCk1GdPz35JWA/25
	ZwqUFFDJYUxm9vKpuSTkXyapV7l5QqBrJ1dX8VT4OAoVDs0jGP3G+brAFIL72Uf1pJybmxt0/0q
	3A8fTtABdr3HRrhjMJYlgWjUSecBkf71lqRucWDiPfN/N2t+CppsrXziiL0NdGaMtDfFleFwA==
X-Google-Smtp-Source: AGHT+IFrsKYNNVPYxkOMp3328XbXbtX3mfC2L5B4+ZUkaxv/aqUT4RpiMHB0WxMG7z+hI1qF461gNQ==
X-Received: by 2002:a17:90b:5208:b0:2ee:dcf6:1c8f with SMTP id 98e67ed59e1d1-2f452e1814bmr58771833a91.16.1735608878450;
        Mon, 30 Dec 2024 17:34:38 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed62e385sm23364742a91.22.2024.12.30.17.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 17:34:38 -0800 (PST)
From: xiehongyu1@kylinos.cn
To: pawell@cadence.com
Cc: peter.chen@kernel.org,
	rogerq@kernel.org,
	frank.li@nxp.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hongyu Xie <xiehongyu1@kylinos.cn>
Subject: [PATCH v2] usb: cdns3: remove redundant if branch
Date: Tue, 31 Dec 2024 09:34:30 +0800
Message-Id: <20241231013430.23117-1-xiehongyu1@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyu Xie <xiehongyu1@kylinos.cn>

cdns->role_sw->dev->driver_data gets set in routines showing below,
cdns_init
  sw_desc.driver_data = cdns;
  cdns->role_sw = usb_role_switch_register(dev, &sw_desc);
    dev_set_drvdata(&sw->dev, desc->driver_data);

In cdns_resume,
cdns->role = cdns_role_get(cdns->role_sw); //line redundant
  struct cdns *cdns = usb_role_switch_get_drvdata(sw);
    dev_get_drvdata(&sw->dev)
      return dev->driver_data
return cdns->role;

"line redundant" equals to,
	cdns->role = cdns->role;

So fix this if branch.

Fixes: 2cf2581cd229 ("usb: cdns3: add power lost support for system resume")
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
v1 to v2:
-replace bellow with below

 drivers/usb/cdns3/core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index 465e9267b49c..98980a23e1c2 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -529,9 +529,7 @@ int cdns_resume(struct cdns *cdns)
 	int ret = 0;
 
 	if (cdns_power_is_lost(cdns)) {
-		if (cdns->role_sw) {
-			cdns->role = cdns_role_get(cdns->role_sw);
-		} else {
+		if (!cdns->role_sw) {
 			real_role = cdns_hw_role_state_machine(cdns);
 			if (real_role != cdns->role) {
 				ret = cdns_hw_role_switch(cdns);
-- 
2.25.1


