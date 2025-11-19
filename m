Return-Path: <linux-usb+bounces-30726-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CDAC6FAC3
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 16:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 99FB64F9D4A
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F064335FF4C;
	Wed, 19 Nov 2025 15:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b="HwqNl3sH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AC42E719B
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 15:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566025; cv=none; b=VYhZhjRWDvpQTbMNyYycxC8OQyz2Bn6gAP40N1CdkyAyotCte/5IVMG/ginYjHtADNn1FFn3v1kLUZSxAiVUoCTs1xJyiU5VySqshq7cf+In5oXT3znPzoU+l13LEoK2M1ToHcB04xTGDDaAZRz+a1JXbGDvZdmCGEwodOPq+0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566025; c=relaxed/simple;
	bh=q7wrThlMtajf/HLgF1WoLKp3a+lLJT3+KWHwcbSxu40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bauCPp81gazdGkRps6M9Ww1uyOX4vz5RoRg0vWE/A7mTy/ZWNcpeiIaiKoxrIMlnaH6DKgTB2C1zSHtP/oaJYMSjhVjmCahTAkzLVHFpVQtGxcg1gSRJpIX5oZirn05B72buQBvs+eh1EZxOT0L/wpyhscM5tJnF/DM4j4A3Qgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=remarkable.no; spf=pass smtp.mailfrom=remarkable.no; dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b=HwqNl3sH; arc=none smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=remarkable.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remarkable.no
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-59584301f0cso7095317e87.0
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 07:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google; t=1763566021; x=1764170821; darn=vger.kernel.org;
        h=content-transfer-encoding:organization:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=onowOugjUjASh17eTr1KgXZRHe6XnDfriOUevO0flpk=;
        b=HwqNl3sHEn221BYGdNa0Ih4yeHHGlKrVmcmogBv9ym6sEFhOir5Y4j2T19jge3JMaU
         IFMmQkWOlFTcYa9geyE8WfTyW+88YZcQHLVvqPRGnxXSS8iSX9a/8HW4YqPEvGlpwwnI
         +0UjOlKk0xJUSnT6OlagaQVwoMfKMHbKmfrcU2tk2gjm3SkkvxCiNoHoXXUyJfjTwNOh
         Z4oouWG7zbFa1VUndbIpDnO9guXN3wIxUbQ5m5TmHBmV6WFSLjSEP+feCjbbW0vqfn3T
         9iKSSaCN0/dCm17e6uVbGrvHEcP73YVJ8vSBKQ+RlHlYRmwx50HQItX02hwngmb0m3n0
         nNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566021; x=1764170821;
        h=content-transfer-encoding:organization:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=onowOugjUjASh17eTr1KgXZRHe6XnDfriOUevO0flpk=;
        b=uNaxAR8Z8iMYrQM68Ir/pkkcP/Fm46S4Z/X+xFzYMXw+ED1nmRj7DNRMGU6RtovuLr
         JIkTiVQofIexbaBQx6mPMPoTKkZVPCgHVX5b2DMIpuZ3cia5q6plPZsxD3nmf2A0jUtU
         QpqA3VK3Tp0ynmg3ZJ90A21vbrSYwbbANe9LjCNAuEmFCBfbOkpp+0fiwqV1lyL0WrQH
         2BUJKSDaxWP7ymHXSIqPDrZGSPOLXYtza5hZiOh8LUhwoXqRxN92USMDRXafwkRkL3hp
         oRxJcFIt+QKB0ziNhOJD+gz6iNPMjEH39jugx8w7Wx2rXgvJegfLoyzhvAXWSeXCOswO
         7/7Q==
X-Gm-Message-State: AOJu0Yy0hv4B5Xz7EoAuowV0jv49Tmp2SIidaODytU6/M8mkSEC3moH+
	pCJgLEuAYZuNsid8cmYfs18/DRPT7yl1FbOFAnKGSaTMlZln6AUTRHKjaDraqHNDs6G0S7f0oBE
	j402SHvrkDo4=
X-Gm-Gg: ASbGncsEIkoRgEvQiPviIMM5e3AMF4FedtkYtL8MaIv3WX6jZTM5xAL9YK1v7sL8xLa
	jqCuAE0kcIoJAZ5EXejleL95wMG7vZuVkKgSzrhx57XprDtk0oQIUW1enVN1PG+Or2RNShrDCsZ
	Hy0K+cLadxaAki1kKutvFuXDV8f24lvD06A1IBjCMziZmGyv3r7GmfzjIdcWwsmhW/43etZGReJ
	RXmpueamFjLVZMjL/vUEpoYjav8sqzAiF3wYvyh4RYrK0jXUdPxS+OomM2U4oKcVo8WkgKDA+2/
	yao9wHk2/YUqYbJkTUIKFhXd/PEUgkkG1OU8oQ8V4rlvWlZRfiBrz/kS837Npch7+3MzGEN3XMT
	LvSRSgoRfNlTALqHPr0xizw1qgEau6mN8SdiyNzKuV0yX08jPU87ld7AKwI0DiUA0CFcpg3KNHT
	MZbzEuuz5573SDqSxIuYM4qnNvixIOyPTcZ8gS/SA3V2C1hDGgbEorvyzT
X-Google-Smtp-Source: AGHT+IGpCq9LJO0nTQrFe/SBUfnnnD9WSLcASFYUoEQEsOP9LHdDBYnc3+PH8Osz0HeqQnqNqX/R1w==
X-Received: by 2002:a05:6512:3087:b0:592:f330:221 with SMTP id 2adb3069b0e04-5958419ea17mr6842143e87.6.1763566021355;
        Wed, 19 Nov 2025 07:27:01 -0800 (PST)
Received: from lima-build (ti0009a400-2724.bb.online.no. [85.167.65.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803acc1asm4906511e87.13.2025.11.19.07.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:27:01 -0800 (PST)
From: Johan Korsnes <johan.korsnes@remarkable.no>
To: linux-usb@vger.kernel.org
Cc: Johan Korsnes <johan.korsnes@remarkable.no>,
	Xu Yang <xu.yang_2@nxp.com>,
	Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: chipidea: udc: Link otg and gadget
Date: Wed, 19 Nov 2025 16:26:41 +0100
Message-ID: <20251119152641.49872-1-johan.korsnes@remarkable.no>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: reMarkable AS
Content-Transfer-Encoding: 8bit

Link OTG with gadget, same as other UDC drivers.

Signed-off-by: Johan Korsnes <johan.korsnes@remarkable.no>
Cc: Xu Yang <xu.yang_2@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/chipidea/udc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 64a421ae0f05..1d2f9543ea37 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -2125,6 +2125,9 @@ static int ci_udc_start(struct usb_gadget *gadget,
 
 	ci->driver = driver;
 
+	if (!IS_ERR_OR_NULL(ci->usb_phy))
+		otg_set_peripheral(ci->usb_phy->otg, &ci->gadget);
+
 	/* Start otg fsm for B-device */
 	if (ci_otg_is_fsm_mode(ci) && ci->fsm.id) {
 		ci_hdrc_otg_fsm_start(ci);
@@ -2166,6 +2169,9 @@ static int ci_udc_stop(struct usb_gadget *gadget)
 	spin_lock_irqsave(&ci->lock, flags);
 	ci->driver = NULL;
 
+	if (!IS_ERR_OR_NULL(ci->usb_phy))
+		otg_set_peripheral(ci->usb_phy->otg, NULL);
+
 	if (ci->vbus_active) {
 		hw_device_state(ci, 0);
 		spin_unlock_irqrestore(&ci->lock, flags);
-- 
2.51.0


