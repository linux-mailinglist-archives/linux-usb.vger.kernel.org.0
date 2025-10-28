Return-Path: <linux-usb+bounces-29788-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E301C153A8
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 15:46:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84D8F5645B7
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 14:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE35933970D;
	Tue, 28 Oct 2025 14:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GZ6m3HKn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9015E223DD1
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761662370; cv=none; b=HCweOFz3a6n1NIIcxc3HbXpA+5DlFMHDMUUm1B6TAMyA0s6Z5dWY00ZQvpGShoNQ3FP10qWaVV/922Is0os1Ct20lnHjHL74/kEh0WkuBh55FipMJ76TSrv59//WRFZPi98F6K+Hd/VVyjxBhaET0d66F6EiT+tJaZ5qKCVVcW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761662370; c=relaxed/simple;
	bh=6j7DZ69/pJ+jm4HK5EnL0Dk0EaQ1PW3sTFee6AUTNjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BMYzvdibWYA1Bd5rqsdBteFT5BR/uItqGObbTtlWwuD4mzvGIePMh0qixZotIYnW15oqP3Ra+bh1ujyVOD7D3hwqcoLdiqsLMgFFxqTG1Y+Ad0jD2thg7Yk+KAlROauKWMo4+ZR002Scd7rnDdCLmAHVfwZ6sajPD8L1olRBJsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GZ6m3HKn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-474975af41dso41363515e9.2
        for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 07:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761662366; x=1762267166; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EMGYbfLnNZolNz4SGWZENs/OOTmFr8Uy7BDON+kBWXM=;
        b=GZ6m3HKngLNjXxyBnKjQmcGT8U5DeHF3fwcGr44xlthJI85wq5h9CO4OglBFCwsw2X
         IjvzosrLS/Abu+vPhLzS04QIZ3JwW9GsgJA4TQB3CKXyDUotgB05L2PavGUMkGyIZc/m
         6EShUYFX/ukhDUr1CeZUv3aI2MY9mtGRch4rTyrAyTYvIh9+zfhRclylL+FZAwohddmC
         uI4lDJxFRxiuTPDSq+mXfJdc6kdT6cvWhVAosZTjWDUvyNzRHxo2gVaFNiYmeZ3FScDV
         G8YNjN3OadaW0W8EDMgINSSVEm97LVV4OcJZ+jU5F+ou+6DtdOyuHShDd8XBy08+6pUF
         bWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761662366; x=1762267166;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EMGYbfLnNZolNz4SGWZENs/OOTmFr8Uy7BDON+kBWXM=;
        b=vOOSyzG5vGxLGs03FXp80Ywv0KZDv13LlG44htQ2BVrRGf5Tv+NUPm00wV5NJ6DISH
         8q38ckG6naCjJahMp4DksNYejrIiNJF83fE/88coxWMF8bQpB2Mi/2QY3K9JcrqqZX3b
         gtNwORdgnI12PzXRxO1VOMh6u92EYgcIwRKGalI7pYPamkdQbVfbYnzH7ZRZZwHnah1a
         I5FWqgyX8LZRwiS1ScTPlckB1s11qj0OXNFfL/PbeAhnxy8UmKTlPwebTJX6fYogfEjV
         Y6FhT0I0QmkSVgOkLROwiWNRIEpEymQxgncUNwfB43ClZlgDMe8Z9EN5fwYG8+vfCZzI
         b7vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvdCNDXD/0a2e0GHke0o6R4XG4EnukwoHgCVuCsIL4TRruh8LUU/squ2CoJIYVm3sYeS1MqcJ6O3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUB3qy+oo1tnjVkfN7wPu+w5Whntv0+89dax/721T0Q4A0a9c5
	VvPL0+xfOqkCSjq24mDJuaR7gpvw2fsyhIAg4qcv5a+lo2N8vfXkZJ/4xY49vAERTQQ=
X-Gm-Gg: ASbGncscuMi98wvCt3zybCngB5L4hXobJ51buEmwNfjp1UnUst5aBtRyK6zAyToXS8d
	oD9qlQa7aBzWlAgcMMyQHydLjjPRkl1gK8i8y8GxBUMFdvruvTBj1K+UoKEcCUIynqkdNloMPyE
	03YP9Ko8+jlNUiX7v7yUry7DcJCNB6HysMcCBhamSLiU4wtGspHE0lv5GjzAQR5H5I4tK7xfMpV
	h3bjiSyaI3CDZlfAPFQ2ErYTM/xmBL8WtRE1KS43I+tSGv0xMGSHZEtBr7hS2BjJrbdEK8/sUI0
	SI6+HX2H2jYFn9zsnVfH7N1+DdKIJai7SyXiq3CgfSGWRml6BrsHGTatlfK0uO94/Y0/Gj0dCcP
	Uy4frgQrXm4F8p2zU72ONQ0Mf3oapGO9z7HnSL3zi7dmBldRC5I+QMl9C+MEG9XA+aCfAivmdzz
	1tma/eJzCQ
X-Google-Smtp-Source: AGHT+IGsg77vJFyDzbKu3MvGfNPP07qOfc5c2jkhCzBilqMSI7IYlez2zSn+z6nzwCu/peSm/5L6Zg==
X-Received: by 2002:a05:600c:548f:b0:476:651d:27e6 with SMTP id 5b1f17b1804b1-47717e7a65dmr32654895e9.36.1761662365741;
        Tue, 28 Oct 2025 07:39:25 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd47794asm223698735e9.1.2025.10.28.07.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 07:39:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 28 Oct 2025 16:39:19 +0200
Subject: [PATCH] usb: typec: ucsi: Skip setting orientation for UCSI
 version 2.0 and above
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-ucsi-glink-skip-orientation-for-ucsi-v2-v1-1-93e936ac59b4@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJbVAGkC/yWNQQqEMAxFryJZG9BQi8xVxIW0UYNDK43KgHj3C
 TPLx+e9f4NyEVZ4VTcUvkQlJ4O2riCsU1oYJRoDNdS1DfV4BhVc3pI21E12zKanYzrMwzmX/34
 R+thR8N656DxYbS88y+f3NIzP8wU25Y+ieQAAAA==
X-Change-ID: 20251028-ucsi-glink-skip-orientation-for-ucsi-v2-6d52c6644d46
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1490; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=6j7DZ69/pJ+jm4HK5EnL0Dk0EaQ1PW3sTFee6AUTNjM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpANWbl46daAm1w3/r4ThxmHU1ITVChMcOHxIk6
 P00FOdpCYuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaQDVmwAKCRAbX0TJAJUV
 Vv1qD/9vjGwtf4UNDHDGUVSGnq3TGF4OcHkoyiXooQ0QhPWpgsXylTezsRyHUquS923olJrTJTZ
 3ySr/A9CH9nmwXHP6E1hJ534QJqN/zDOhBry5tSGC4X9mQPTQaKdtsXFC4qPI6x4h3ORIZj89Br
 uXQHEIoJZID3QeKglw5SFxeGLnbpuMx2F4QvLnrHLTCMxtZDqPffC75Y+mZ7TtgH5JKOtyh27WR
 pd2an2EVHtxuZMRo5msd/g4aSB4+7mJcUIkXKdfGVFJr9MWjaqsmStvcvJgQnyOr8MdgOXTaJzp
 hFYx/W+XYGnNCRSoK9IVLfjjGqRuxykU5ImAr9DRlRwBGR8iVtCotoLIIKUhaydsfttZO+xtcjB
 EIc5mqe9KrfCr2Lc8OBgXS54Wbr8mEz9q2k8k7q3mWuUbMMShaEq7nobQB+11oBPUbqgO1OTBg6
 /fSn9sL6OVrSDeGWtmhN9lFWotbk/PGQNcc+bn5/jKuSS0k4B1kNDw7f7XsuaDDeE8W4N9vzONb
 dOCiv+p6cNTnSbX2fNV3UgJvfGpHobdC/YilsDpkAXKGmXTdCzkN9LJxiZ/B2UjoHPHfviKpdvR
 OWsLhCjzn0N+hjqfHlkHRzAhUdVZKtQjZWl5I2OiOOYiZ25utCKqef+ZkIFpd55EqwlfojrM/v+
 UMjZOM2SI2sG/6Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

In case of UCSI version 2.0 and above, if the orientation is set from
glink as well, it will trigger the consumers along the graph (PHYs,
repeaters and so on) to reconfigure a second time. This might break
the consumer drivers which aren't currently implemented to drop the
second request of setting the same orientation.

So lets leave the orientation setting to the UCSI generic implementation
for all platform that implement UCSI spec 2.0 and above.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 11b3e24e34e2b4c21df20b6bec69619a0292c7bb..e68fd3fd0f54bfa3c5998519b17cf187bb363ec8 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -209,6 +209,10 @@ static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)
 	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(con->ucsi);
 	int orientation;
 
+	/* For UCSI 2.0 and above, orientation is part of UCSI payload */
+	if (ucsi->ucsi->version >= UCSI_VERSION_2_0)
+		return;
+
 	if (!UCSI_CONSTAT(con, CONNECTED)) {
 		typec_set_orientation(con->port, TYPEC_ORIENTATION_NONE);
 		return;

---
base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
change-id: 20251028-ucsi-glink-skip-orientation-for-ucsi-v2-6d52c6644d46

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


