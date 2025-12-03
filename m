Return-Path: <linux-usb+bounces-31129-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 43559C9EF9B
	for <lists+linux-usb@lfdr.de>; Wed, 03 Dec 2025 13:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 122FE4E0F6B
	for <lists+linux-usb@lfdr.de>; Wed,  3 Dec 2025 12:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D642F60A5;
	Wed,  3 Dec 2025 12:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="aXR/u6Qo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D3C2F5A2C
	for <linux-usb@vger.kernel.org>; Wed,  3 Dec 2025 12:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764764616; cv=none; b=XkDI2Q0ueCk0vQYlBvQuwxDojG1aMNiccDk+IGoGLIfx4vutrIeVb/Zvlr9h/JgRS84AqTVRe4/nb8tMK9pitvS7W0MqfQ4aQb4o3lmXtTWK6B77RpdmX6wSekMieVqSXthiaS72C6CVgNzUPBCPOLbwyEi3if9s6qB9bNIHhpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764764616; c=relaxed/simple;
	bh=aFoi0NuQ+lB9Ye74XELf1AnWh2+qjp+R7DoiDLL8MZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lrVIstiGs644Z3bUi/jgbBHutHbKeYuGXo+TZrYtv6qS22DbQpsC3qXzT3Qh0x+I1LX422H1/jj5Ffa+F/G4iSTVsxfb5F912YLmGwGFeg1qAYVr2H19M8YkHQQcgO4WNeKIMev4p9TjiiXVX0hNZ4OpIIXJ9tgr+jSOfAh4ECQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=aXR/u6Qo; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-88051279e87so65356196d6.3
        for <linux-usb@vger.kernel.org>; Wed, 03 Dec 2025 04:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1764764614; x=1765369414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=satbyq+rTzhiXazZpyBeA4DvXCVBPZa0t059tdqKGwg=;
        b=aXR/u6QoSVAXoDtPg1SZn5DuIYVDJOD8NfZajgF29huhn4oWybIDInNk3bT1a1bUEE
         F8LSDxthFep+D1XwgTsTD3792q+OAL2Oc953BIZ3i7dew2cym8jEck3Wg5NgqwbUkKdr
         zmE5uDd4gFftoBtuTAB19qiXec+6zz9xRHWPFTubqYWbZkbkrimoGVL5iM1dJxwFKkZS
         dkP/bR7JwFdZ1lts1+6CoK1CSRzH6MVFnYkZn48yRySGHDKWqWLXWaVH+5VMMZNNvZZM
         jIgFr0rX28VQ7VD2b7tGniKbXgtqsxNJjWc+bykcVBIFlVVYfMLVNCPSgBsiTl1Qja4s
         egFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764764614; x=1765369414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=satbyq+rTzhiXazZpyBeA4DvXCVBPZa0t059tdqKGwg=;
        b=Ud2qmApq56qNXgHFcEgo+sv1SruN4JdapQKTwaR9HPvhKoPmOMcaFD6ilWu30hbVk8
         hYPvAdfbABNeGBlbffNzYKFBQKCrvObuXS0f0tUAB0PoBWp8llpIa/KwIhqDb7psVAY4
         cLr0YT/A4QpBft+FpgVKNjQdhsPSOUJUYsualnhUnGe/9ph6/fV+iWQDB+fBpD01z6bx
         LCEWzotEf3P5ZKhQFaESGqS+Hx4xqUZQZZCcoIhIc2BOvL+2OKBmw/5UzmNS5j5vV2Qu
         W/FOfM9vQXW86YQL89HysLHIVgkBfr0c9TT1xMS91Qs4Emp+xHRlb/EPQqkcJXdj9/Kx
         QSdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsZBtxEBxcPewdT0T57dKodOIKfndaJEm6GIPejfiLvdjljnZ6WuJGh76FTWHz1lfWkbEuohGKlL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmUTvdvzcBjSmPuc+Kzu7F5vW+isVfGF76I30BVePod/sm2Of8
	HHqQTBwCvOI896/UiB/xJE9JjOMa8BZZQG9Id9xK6T6A9m/f5tM0T/I4JHtELtAl7Sw=
X-Gm-Gg: ASbGncvVr5XyYLd+9wBirXzMHz+8V84py0ApcgBs9jCxyQVavFI8ELYsT6jL5I+XEdf
	uzinlo09gRvpIx6n/8l8h/ZQQLuZ85Eg3P5TF6UZNFq0XYlqEMG2MWkd0iBU/IjVL0NIsJbN3+J
	N7Q/HTyTzSxeN3Joy4/ED/cLf4Op5qN215tBTf6iHeCzkhCmAqwipVvTFuSvZKWXeBjrps3ZF4Q
	bKYUJQlCNy5TYGCP50QVa4VGMqcrD6TQSBGAoSceF5b8d/OmpM89lrOkONIixpQKEBGH1J5zaIw
	/NEkE2dVwNSDEEgD8o49JLQdiGgsuPCnAaJ3qZ1s+WfY/eeHAhal7z6lK12uOjcVW13ZzmvxZNt
	eUZWBkEm0aPxidxm6syiHrTFBTVw5rn4FkUhS+NmkW+hT7sQmqWsthplH9/ISOmABscUxrCvt7c
	fhfcta71eMIoSgViUGdik+RN3AKsCQI+Hylhf2wQeU9WOF
X-Google-Smtp-Source: AGHT+IFl3TKNz+YdngGiL3n7sUr4ySdTN/WzLz6DBC6FFCPdIEUd90ZIj3x8M5TK77zgmChu8AVP7A==
X-Received: by 2002:a05:6214:ac7:b0:876:403e:a15d with SMTP id 6a1803df08f44-888194e5b42mr27914966d6.26.1764764614078;
        Wed, 03 Dec 2025 04:23:34 -0800 (PST)
Received: from fedora (cpezg-94-253-146-247-cbl.xnet.hr. [94.253.146.247])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-4efd2f9a755sm115214351cf.3.2025.12.03.04.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 04:23:33 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 3/4] include: dt-bindings: add LAN969x clock bindings
Date: Wed,  3 Dec 2025 13:21:31 +0100
Message-ID: <20251203122313.1287950-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203122313.1287950-1-robert.marko@sartura.hr>
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the required LAN969x clock bindings.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 include/dt-bindings/clock/microchip,lan969x.h | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 include/dt-bindings/clock/microchip,lan969x.h

diff --git a/include/dt-bindings/clock/microchip,lan969x.h b/include/dt-bindings/clock/microchip,lan969x.h
new file mode 100644
index 000000000000..5a9c8bf7824a
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,lan969x.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_LAN969X_H
+#define _DT_BINDINGS_CLK_LAN969X_H
+
+#define GCK_ID_QSPI0		0
+#define GCK_ID_QSPI2		1
+#define GCK_ID_SDMMC0		2
+#define GCK_ID_SDMMC1		3
+#define GCK_ID_MCAN0		4
+#define GCK_ID_MCAN1		5
+#define GCK_ID_FLEXCOM0		6
+#define GCK_ID_FLEXCOM1		7
+#define GCK_ID_FLEXCOM2		8
+#define GCK_ID_FLEXCOM3		9
+#define GCK_ID_TIMER		10
+#define GCK_ID_USB_REFCLK	11
+
+/* Gate clocks */
+#define GCK_GATE_USB_DRD	12
+#define GCK_GATE_MCRAMC		13
+#define GCK_GATE_HMATRIX	14
+
+#endif
-- 
2.52.0


