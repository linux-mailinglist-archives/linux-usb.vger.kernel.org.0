Return-Path: <linux-usb+bounces-7280-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA9586BC19
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 00:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29F751F2556B
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 23:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A527291B;
	Wed, 28 Feb 2024 23:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TbKFe5Zz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E7C70055
	for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 23:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709162490; cv=none; b=qCrc+sNWMSAseP+yN3SmBtCKxk5jiYjq3mxzyq/bunDIRITC1t0NlDNihrYIOntRINE56fRwL9WUGikjv+yiFLiF0TjCxmALGrFsDZnAELkqW1vYpRjUQKvSATA4PeAe5waIOY+hN/Giphsog1cPrZb81jAaTbaLT6bh/mxo7QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709162490; c=relaxed/simple;
	bh=7tJEoT7UeieYnDrUIelxhTjT/DTW8yYe3f7+9yRHQ0g=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rp8T4B79/922Py4+MlxKXbEQUeq/UFK5PROy723LoMeGp9YevtYOynffkko15CSn7f4g1egHFdKTfl0WrwDlkKq7XuzR09Posqp2U47V/ZXpAmJX++itaUQL9AMEq72HfDIMVD6hk2xZe+dxGAR7HwwrcJaWJVjRt37WuSk1LfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TbKFe5Zz; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dcf22e5b70bso539894276.1
        for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 15:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709162487; x=1709767287; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E3VOyu5h5VNnqIC5C1wAkPY2R8kjBMsntg/JOJOAxJU=;
        b=TbKFe5ZzuvbIQBSmu8WfhzGno/ATX/w/sPE4xH39dKwN9JRJg5wYCkNAI46qDP013H
         tjd4rlPzbspnfaIqImPDH7JP/b6fTqDy19AxsEg9zoP7PLpIizW71kTLE+dhk62U0F/A
         DiEQjTImWs/j2GfzpMrsKKvNzBBZE95myM8BvRAcDWlBYN9ah2ag5ddtQST3WBkNeysW
         tey985fSKlMSB1mbEz+L1XSJEDK9hnkgpaWFGORxexuFNzUw1GybGnHoIth78Q+NaokH
         MSYLtbtYd70QgppYWUouTyZVGw8ZWH1+Wx2+sf2IgykhE4OUovzpcO0o2hQNaBkXAytr
         zi3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709162487; x=1709767287;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E3VOyu5h5VNnqIC5C1wAkPY2R8kjBMsntg/JOJOAxJU=;
        b=htTbZIZssT7wVu4vc//b6WjcrGY3k1gRGtiq3XIfq0rdifG9Ai3oQrRc17UNgQFSN4
         00bJTgfprTQU+o0BHYZTz/OjEZVi0W10ev5QkzrJ9WOvv/cGC0tmAy9aBmTGJ56R7qVo
         N6uKynoJB2ffLYhjLSxFuq+YIDtYm9UbvGGbB7Fw94zARIBF5KG5dxtJRgGVhc8LWT0M
         qCYGLYK1X/f0EO1Ert3ymDRln2IiY8fHlqPS+YKEEaS1sn0CIAyWPjvBeM3MmVp3WCIW
         gikM4oAQ/pP5Ro0OcRjy/cbTmeQ8WaJZ0D1dIcpv46JzehfOv75bG0ifjLE4qC2YpJFG
         AnhA==
X-Forwarded-Encrypted: i=1; AJvYcCUqaXEZslJ54nHO6VneGujK1Ov44hA6C1k6Ur2feLZP4wk/ySBBY8sdNxpI1PkwzZMzH3zIuzAkSMjlYJxP2EU9s0PLnEMCxN6o
X-Gm-Message-State: AOJu0YySXgJfU3JuIYIduaMUpFXOy3OPDrvKs6WIPpVxMsLiE5rkT4KB
	rA1TgnHEaa84SB+xkj6Zytl5x8rWbgcVgVxK5TTki8kF/efchRke3w5JTdNYusXTyrGgO9e2aLn
	3Wg==
X-Google-Smtp-Source: AGHT+IEjIkixgTa8DId0CyvT1s+vLXoCDX+hWBxpSWRQuUpZ98olYdyqzr4CrCW0CfuHkrk8xv51EhpjUis=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:6902:10c2:b0:dc6:e823:9edb with SMTP id
 w2-20020a05690210c200b00dc6e8239edbmr41694ybu.12.1709162487685; Wed, 28 Feb
 2024 15:21:27 -0800 (PST)
Date: Wed, 28 Feb 2024 23:20:34 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240228232034.3630838-1-jthies@google.com>
Subject: [PATCH v3 1/4] usb: typec: ucsi: Clean up UCSI_CABLE_PROP macros
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Clean up UCSI_CABLE_PROP macros by fixing a bitmask shifting error for
plug type and updating the modal support macro for consistent naming.

Fixes: 3cf657f07918 ("usb: typec: ucsi: Remove all bit-fields")
Cc: stable@vger.kernel.org
Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Prashant Malani <pmalani@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jameson Thies <jthies@google.com>
---
Changes in v3:
- Fixed CC stable.

Changes in v2:
- Tested on usb-testing branch merged with chromeOS 6.8-rc2 kernel.

 drivers/usb/typec/ucsi/ucsi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 7e35ffbe0a6f2..469a2baf472e4 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -259,12 +259,12 @@ struct ucsi_cable_property {
 #define UCSI_CABLE_PROP_FLAG_VBUS_IN_CABLE	BIT(0)
 #define UCSI_CABLE_PROP_FLAG_ACTIVE_CABLE	BIT(1)
 #define UCSI_CABLE_PROP_FLAG_DIRECTIONALITY	BIT(2)
-#define UCSI_CABLE_PROP_FLAG_PLUG_TYPE(_f_)	((_f_) & GENMASK(3, 0))
+#define UCSI_CABLE_PROP_FLAG_PLUG_TYPE(_f_)	(((_f_) & GENMASK(4, 3)) >> 3)
 #define   UCSI_CABLE_PROPERTY_PLUG_TYPE_A	0
 #define   UCSI_CABLE_PROPERTY_PLUG_TYPE_B	1
 #define   UCSI_CABLE_PROPERTY_PLUG_TYPE_C	2
 #define   UCSI_CABLE_PROPERTY_PLUG_OTHER	3
-#define UCSI_CABLE_PROP_MODE_SUPPORT		BIT(5)
+#define UCSI_CABLE_PROP_FLAG_MODE_SUPPORT	BIT(5)
 	u8 latency;
 } __packed;
 
-- 
2.44.0.rc1.240.g4c46232300-goog


