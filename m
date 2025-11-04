Return-Path: <linux-usb+bounces-30045-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC47C30BF2
	for <lists+linux-usb@lfdr.de>; Tue, 04 Nov 2025 12:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2594034E051
	for <lists+linux-usb@lfdr.de>; Tue,  4 Nov 2025 11:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8682EC095;
	Tue,  4 Nov 2025 11:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Urg5jwmK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67BB2EB5AF
	for <linux-usb@vger.kernel.org>; Tue,  4 Nov 2025 11:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762255982; cv=none; b=EpoVwtirQARloUSLLZDnOrB8BnYlcBZIGBEog+0UxTAGrjfz66V3pAE4pwSPM3xLEEe9Z3MmNO+xjKBiIVBOy2+0yUkDMgphXEm4zk3ZiR8SRlU4SSze179x/4iM6C1pCbwtvgY/YhW46/RKx8B0m8JK+xTqtgaytJ6E5v4A5Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762255982; c=relaxed/simple;
	bh=W1/5a7VsUfRhct0i5NaSbgry/+x9qR6Zhl7syl2QDUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IEKiB/e1WC97SxDmb5aSyhZ7Au1X1hfEkwwx2fGbZ4vJ0y4RwhYwLZbVHnzDX1R0mKRS9HdEUeNmmwLxj+oEBEQP7389tO5oTAy+zESD5Z7QZrx3oG0XwCGtoAXLPzReeP0O+6EvAbxNIzKbfse+GWNf/fMEvb9ukm9Ed+GUK9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Urg5jwmK; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so1077633266b.0
        for <linux-usb@vger.kernel.org>; Tue, 04 Nov 2025 03:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762255979; x=1762860779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Nxq+Z1fn/xWrOumJFi9/RSQVqz8cFPqXlsH8mXzKoU=;
        b=Urg5jwmK7UV5U0+Fwq9dAEOWPRIF9FKhSlSClkT0xmqk5dxZIuHkx0xCiD2huYIUDi
         pw411tgrmQzgxuxxLf0sgMzqP038QZlxuxLG2pXumkPfvqxrdH9QgvWcTDxzVkMnOZDm
         tgnR5s0UhXFL1jYQI6hOqoU60oeZNKYZcfyYVxSwUl/Gk5i+ccoanc6eH56RAWHye2bW
         AIV6F5oUCYiWzz4w/w7/io2JlQrzPK8TWONm6nlB64XmT8VsemuZbVT3Izgj1eV4833Y
         1+mtSbyb3zyNwLkcb1IHnfKNMLpEpqPSIqQo+PGYK5btASsfaoPFe81GoOsfemq04J+w
         JFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762255979; x=1762860779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Nxq+Z1fn/xWrOumJFi9/RSQVqz8cFPqXlsH8mXzKoU=;
        b=N6jxFAEecZoEJdh+PJzgUG1W1fF8N2p6rqAHFOLkP3LQvW5YV4rYBOfpRppd3A13sr
         xarD/XYGTAgt2eZeL2/rLoCo8yn2DVBEbE146ThK2niY1AScTQbgJxY9e1EaG8NP/ztn
         1dY4B53UrLiHSRuUfmoZkoohekdTPQhQZNoNo8qS1fLO2HoUJl2z96GZ3V04IJANVPgo
         gVRXJINh7rLU3zKrLIpv81u/CP+DGJAtGw1ZDwoEPrRv7PWm8cWOAG9HT2IJDqTIbgO0
         deXYUoGyMQTGYN96GZkkj5HnI0a8H6uq9toJO7ArEcoSfQMCQ6bnCubblT53pB8aLkEF
         UIYw==
X-Gm-Message-State: AOJu0YwGpDa7sxlzh8K6Epvjpm1iUDKjp4XvtRQAz0jn9Cf0EWXrZAEX
	q2PehzMus9nVLaOGLODk+cXQhrE/uNudSKSbBwyyWWVQOZYzs1DNv4nMHsQBQIcU8M8=
X-Gm-Gg: ASbGncstz4veKpdrVHmS3QBcMKtw6vqHt1L9frKx8iSpxenrtpQ6wKmepEZVtslplbG
	kVOPiYHmtH1pz9QlycAaHbKCbOTGrra4pMy1Yxuh/16OuvxQWt22mvpPnyU2AQPmxrAjcivIGqF
	xz7DndSoXSpAS88vkpJreO5B9HVy3c0uKRdhd/Vp/Qd2OESSJ+wN6V69jdV2BMvgeLHkdQ2at7E
	21QyaBW8tJhj7v4jBbbleCbS49Hnp9pMyceKMiDgjvqC+5oD0JkDln+Syz6+72h+SABITKdTDdm
	0vwPP4Bahy/9DUnIvMkYjgqW6dmW38VQQzAqJOMK1VH4OTx0PnbPLH/SZFfxyOvum/Az7lVI7ni
	lgb19L4PqM9HWk7jq3vGbAKS46Kgg3nlssfcaruER0un657lJBkb9EKbPsPbVEyolYeVu1/VADq
	FFiuzLtovRIbire9kXoL+LAUHz0a9jOeA8jkvyI5FZYCMB/qVL/6dXlAX+pSmxfjYmyHe6veBY
X-Google-Smtp-Source: AGHT+IHEMSASSTohnLG9wMInMyaJfMwowF7cYVsEpX3e0SDI7y3LeNeOnjHYdUJzMywCwp6kp4EraQ==
X-Received: by 2002:a17:907:9602:b0:b72:588:2976 with SMTP id a640c23a62f3a-b72058829famr341889366b.60.1762255978638;
        Tue, 04 Nov 2025 03:32:58 -0800 (PST)
Received: from jale-pg.. ([2a02:2a40:17ee:2900:8627:17a2:2166:4084])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72404470e9sm182469766b.70.2025.11.04.03.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 03:32:58 -0800 (PST)
From: Jakub Lecki <lec.jakub@gmail.com>
To: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Lecki <lec.jakub@gmail.com>
Subject: [PATCH 3/3] usbip: Limit maximum number of virtual host controllers to 31.
Date: Tue,  4 Nov 2025 12:32:48 +0100
Message-ID: <20251104113248.223594-4-lec.jakub@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104113248.223594-1-lec.jakub@gmail.com>
References: <20251104113248.223594-1-lec.jakub@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When loading the vhci-hcd module with number of virtual host controllers
configured to max value of 128, the module initialization fails due to
insufficient number of available IDs for USB busses.

Each virtual host controller registers two usb hubs (USB2.0 & USB3.0) to
the usb core, each with a unique bus number. The number of USB busses is
limited by ID allocation range [1 .. USB_MAXBUS - 1] (defined in
usb_register_bus()). Therefore, VHCI_MAX_NR_HCS must not be greater than
(USB_MAXBUS - 1) / 2 = 31.

In real world scenarios the maximum number of virtual host controllers
possible to create may be even lower as other USB host controllers may
be registered. In this case, the module initialization failure is
correct as the number of virtual host controllers must be adjusted by
a user to a given use-case.

Signed-off-by: Jakub Lecki <lec.jakub@gmail.com>
---
 drivers/usb/usbip/vhci.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/vhci.h b/drivers/usb/usbip/vhci.h
index 2772d923a8cb..3b0ea4038e51 100644
--- a/drivers/usb/usbip/vhci.h
+++ b/drivers/usb/usbip/vhci.h
@@ -76,8 +76,17 @@ enum hub_speed {
 #define VHCI_DEFAULT_HC_PORTS 8
 #define VHCI_MAX_HC_PORTS USB_SS_MAXPORTS
 
+/*
+ * Number of supported virtual host controllers. Value has upperbound of
+ * maximum possible usb busses.
+ * It is limited by a bus ID allocation in [1 .. USB_MAXBUS - 1] range,
+ * resulting in maximum of USB_MAXBUS - 1 usb busses allocated.
+ * Additionally, each virtual host controller registers 2 usb hubs (USB2.0
+ * & USB3.0), therefore maximum number of virtual host controllers is:
+ * (USB_MAXBUS - 1) / 2
+ */
 #define VHCI_DEFAULT_NR_HCS 1
-#define VHCI_MAX_NR_HCS 128
+#define VHCI_MAX_NR_HCS 31
 
 #define MAX_STATUS_NAME 16
 
-- 
2.43.0


