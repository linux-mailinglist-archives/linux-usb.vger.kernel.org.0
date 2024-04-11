Return-Path: <linux-usb+bounces-9239-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B438A0755
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 06:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 052C1B24B9E
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 04:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2959F13C9AE;
	Thu, 11 Apr 2024 04:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yqRJLHdQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41F313BC0F
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 04:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712811006; cv=none; b=bsITP7h1muFCnESN03P4vdMw2QCuiocE7D28cBRuTb3BqXRzpkZQ4sQ1WOWTMGljBLqTtrFcl+56A5YXjPEi/JEny9QcptC9WcCT+llMq4zx1JZQw6gGXtT1imUs8hz2FBf7XA4yvSzjwLUO0RUGMmReUfJq92r71GgOkBmPzZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712811006; c=relaxed/simple;
	bh=u4jDQO/0VgtW95lOQWBbsTeV5DQ/5FtzVIksyRFfWk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OPxaPe1FmbtqcVsXvsC+7ApDRRkpjin44RVEq3GYX14NTJXxToQPJZdGsz7KiGrTUWmUTidrTDs019Jd3xWBcnGZhmhEnkFKI3tcjXakZsj0g6EpmnXH7OD5T7Pbm98vyeqlyakjMCDnZKaDIi5poVeHfo7D0ttgsXVFGYnJBWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yqRJLHdQ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a519e1b0e2dso789454066b.2
        for <linux-usb@vger.kernel.org>; Wed, 10 Apr 2024 21:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712811003; x=1713415803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nbmZnNz7wfcYRQ4tunBdMeZpxGP9080ZCBcMGoX6drU=;
        b=yqRJLHdQzjU00g6ZMoOfvBwOfHbG5DqdhIbQC+QUhcV0hUZVQfNyDNXs0FXwfDLSLg
         dnKh/jGE+A3Igh84/un+m0L9yXb2Xx1YztVyZMcBLMKf77xP7NZ7nlD4kEvOzqVpSdYg
         yjq8CD4YR6Xv85hxXwYsHmR/zk/rghsCjOrt61y9PQZ5tPmuhybFAgBWJEeRFkzteJpF
         4xM+ZHHWn5BT6U3JaTwwK7ZiS8El7ZrYBP3bRpJ1hm8puEDv9OA5SY57iDAwGBs28svl
         p9dXEPz7cfYch3WejEZitPcR1hIaHilui87Zvs1+fNv73QL2+7BDO8SeZS4J31ETYN4g
         4TvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712811003; x=1713415803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nbmZnNz7wfcYRQ4tunBdMeZpxGP9080ZCBcMGoX6drU=;
        b=aYQBuwe/E9CeshxIOZGB06GLmIkrjxlfWYdIr5B94DU7TcPn99douE3tsgYviy5TAN
         G+KsWgO48yyA4Ht95XchCWjEy/jQyQHdE8ikMes7Nc7Mo1mi+CKjHptzl0wrjH0CL0Q0
         cvsnIRX6j3FDA932VfI/vhB2/TT2x0m8fr+T75FbxBD6gtCDYZaF+FIrd+6IGpfcH/n0
         Ny9wWSZTuqwX6O+P9HJO1MrRsc9K5uudVVH0FmPA4w21Bri2XjWbyipEDCWolG+0khdD
         FXTP+vThCVCOt1pFX8dh10OAdfqFZc/Lr2Js6SV5Uw6D+521Z6tnDFKsegyJR0nOJNio
         EGLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD6wmVyvHnJJq1EP6PV7fWzOHERJmPtdSahjdGpzb4hIq8YM1krcr5ugWkun0ny6lNmzc4wVI6dwcoautRUrnU6DBtay4hlVJv
X-Gm-Message-State: AOJu0YzSJPbRFP64qnuE/03RWwTV+HLV2/amLftom+KNgqfq+F1cHirs
	53Jj5m4TN1uWFC3/vtvJpo4K3MbiMFnYB/sK/mF1iewE+SIZhMTsl87SGXRBBcE=
X-Google-Smtp-Source: AGHT+IGwim/1leSiJmZtZ8mYj3dH/Ok7T2kMgKqWGmEz9ndiADGBSUnqAi2n7SIJ8+QbqZ+s2RtLxg==
X-Received: by 2002:a17:907:7e84:b0:a4e:24af:d8a4 with SMTP id qb4-20020a1709077e8400b00a4e24afd8a4mr2043984ejc.28.1712811003083;
        Wed, 10 Apr 2024 21:50:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id dm11-20020a170907948b00b00a51eed4f0d7sm364899ejc.130.2024.04.10.21.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 21:50:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Apr 2024 07:49:56 +0300
Subject: [PATCH v2 4/5] usb: typec: ucsi: add update_connector callback
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-ucsi-orient-aware-v2-4-d4b1cb22a33f@linaro.org>
References: <20240411-ucsi-orient-aware-v2-0-d4b1cb22a33f@linaro.org>
In-Reply-To: <20240411-ucsi-orient-aware-v2-0-d4b1cb22a33f@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=u4jDQO/0VgtW95lOQWBbsTeV5DQ/5FtzVIksyRFfWk8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5p49tepFmkxUwtOv5uxnVvo6Yxt3zL3TVyzb2qq3qPsH
 Bsp3q3hnYzGLAyMXAyyYoosPgUtU2M2JYd92DG1HmYQKxPIFAYuTgGYyK8f7H/FGLbFvJY8E/hg
 7xr23IPJyvFetqlJD7VzM/sYJrCqsD6zlOkWrfkjnOiT7beaf/V6zTfuzH17vzy2+fdD4gar3lo
 LrfxzC9M2tK5l9lkrIutUws2880RswBNNNZ/dbDpNIR9e7nq4dtHMWXFGOYVqgUmsRrXxSVdqNS
 JE02rWJM3obKn9fPHNbD1OSwEF+2gzqePlpjmFux7POue3WqvG7ZaY226G9leT+KMZhIwjQ/TeP
 MyJ+3dcZ8utUgO9H3FWvzO4r/b/sjv73pUpY2J60WrvvjWeC8X32s3dn/U26ZXdu16LZ5X3l+op
 WNtLSEnME3oYVi0/7T5LbMzswzZF56v7zVqO7MzKTAwHAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add a callback to allow glue drivers to update the connector before
registering corresponding power supply and Type-C port. In particular
this is useful if glue drivers want to touch the connector's Type-C
capabilities structure.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 3 +++
 drivers/usb/typec/ucsi/ucsi.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 7ad544c968e4..57e73b823a4c 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1559,6 +1559,9 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
 
+	if (ucsi->ops->update_connector)
+		ucsi->ops->update_connector(con);
+
 	ret = ucsi_register_port_psy(con);
 	if (ret)
 		goto out;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 3e1241e38f3c..c4d103db9d0f 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -60,6 +60,7 @@ struct dentry;
  * @sync_write: Blocking write operation
  * @async_write: Non-blocking write operation
  * @update_altmodes: Squashes duplicate DP altmodes
+ * @update_connector: Update connector capabilities before registering
  * @connector_status: Updates connector status, called holding connector lock
  *
  * Read and write routines for UCSI interface. @sync_write must wait for the
@@ -75,6 +76,7 @@ struct ucsi_operations {
 			   const void *val, size_t val_len);
 	bool (*update_altmodes)(struct ucsi *ucsi, struct ucsi_altmode *orig,
 				struct ucsi_altmode *updated);
+	void (*update_connector)(struct ucsi_connector *con);
 	void (*connector_status)(struct ucsi_connector *con);
 };
 

-- 
2.39.2


