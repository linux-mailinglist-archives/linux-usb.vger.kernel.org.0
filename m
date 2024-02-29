Return-Path: <linux-usb+bounces-7289-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D71EF86BE91
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 02:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60027281FF2
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 01:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2052364D4;
	Thu, 29 Feb 2024 01:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r3Odmy4w"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DDD36B01
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 01:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709171564; cv=none; b=X9PenUoF9gK5EHiD1WVVBtiDiMFnj+EbErt0nLBJkACSsK5EK/XEFjLPo6b3Xpn0L1qyvSwGRo6e0ZZr+VGMpmk9RjrXQF7O5cH7787H6kE2Iz+OWRGg4zU8x2fZ5hE1bEPFHW4zGd0bwV8d017qHiqyimS4Fkd3OV40LRVIkKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709171564; c=relaxed/simple;
	bh=7tJEoT7UeieYnDrUIelxhTjT/DTW8yYe3f7+9yRHQ0g=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=CsLGTmXx76+TrugrQeHPfMh+niZnMymUAzVEPD0hXz6jxRl8TE+HhzxnBORsrTUQ8LiTAAqP7zSF+vQ2z1uL/sUcjLY2Wu+B7G1zoXlwI4DUx77G9yfluDgMQxK7guOjn5efSrBwT2UUW5KFb0vTxYHZln2mmZmD+ZQVJIPrs2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r3Odmy4w; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dcd94cc48a1so703683276.3
        for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 17:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709171560; x=1709776360; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E3VOyu5h5VNnqIC5C1wAkPY2R8kjBMsntg/JOJOAxJU=;
        b=r3Odmy4w9nUoBFuT8uHtW8oR/jEYDSJB3qjSnrlPntvaLFhLvkowp9zdVwSSniuExn
         i40Udw7lMUFLwMpqpFaXHT5n8EV77mXhFu4L1PbqFTVII7E1FA2BS52lc/9jmVD7l9TS
         ss7wlGWGzqhucQOnIjvJkvvI5eWYw7NqARi1ZKP+JCJ2k/pqBUj31CtLCwaF0Bo6Y+gJ
         a80aOSCAdTqZFQBWknxpE3wG4WIKgHugdfOrfNFbVUQk6wiX6sbxKBGaE0JuCgM4H7ou
         NBnentahKIQHoirFBJcRIIAFLwGPYpq/c4Prue4jfuT0u6WDeU8HJw5nuyQCF81qmEC9
         yEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709171560; x=1709776360;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E3VOyu5h5VNnqIC5C1wAkPY2R8kjBMsntg/JOJOAxJU=;
        b=TTLSI+zuRId1yFSDmcCZMET6IqxPZdb6obLKbZrCWdjzdQnXvdWO8VGDyBB1LY2CmU
         NA0DcSvySxhkQoByvFumsFBv9V5QH+9+GQM87PCDcK6fXeORAXJ9uTowOHVCLzgqO0IN
         QINK1HHFB6iUJPEf1rzQQcN4tmbwG4j/Vz9yEfj24eX1FGSZ3FQ6haIkBz8Tg929hO8l
         3QbDT4bS3IzLeCRzQx1/P5QD2RNPXcebd+3nBgpUolKo/VSJ0R2RbicYK9UlVkcC37LA
         tFFL8P7bPpfyXN48mD4++xRVJKDvcrHUywaqOcxomE8hj0LVXNL678m9FQJzK5ao4OYN
         H7fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf41kvSI9yUT5gpXxY8oo7NxPIDsvjNbfQ2T5Fo81vMTp2OhmVkPJVuWuyc4cGlh7L/J7s2SxqEwxxeea0xvr1aMPExCXEgFJd
X-Gm-Message-State: AOJu0YzGQRlHcHtdgqlrqTGSZgtawsLQ6R5GGiyG1yimz4WrJ6lLsria
	Vb1U5D95oNIjRLzWdGV5eachPB8qQh6lfQBnRUGK2Menaq3vQ5t8Z4O79l4WSvwXC+I+p5IBtud
	CyQ==
X-Google-Smtp-Source: AGHT+IEEVeZo1PJjoBdtLbZi7QC6z28ER8EtOUgYeV01NYjBTS89wq1lQoJnDGaUjcpDYkcPSDEvQYEBbm4=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a25:dc0c:0:b0:dcd:25be:aefb with SMTP id
 y12-20020a25dc0c000000b00dcd25beaefbmr233082ybe.13.1709171560541; Wed, 28 Feb
 2024 17:52:40 -0800 (PST)
Date: Thu, 29 Feb 2024 01:52:21 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240229015221.3668955-1-jthies@google.com>
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


