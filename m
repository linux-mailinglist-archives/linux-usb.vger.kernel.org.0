Return-Path: <linux-usb+bounces-18441-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B77E99EF7ED
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 18:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E2BB28BEEC
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 17:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206D0221D93;
	Thu, 12 Dec 2024 17:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pz7t2UlG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48C1222D67
	for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 17:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734025077; cv=none; b=RITrupu6ddQk6whmGg9LG0RrKPrOWsWL0a4CyLdcWM6o8cHofCmU/+kF5MpCVEkur+HcLstBJMPQTu/d+4h7iQt649QyRltEJ35PX8s88BESAMAEW4hUcAt2N6TBOcqZ+qtS+dQMkDNgCHU3s2t7MeAZy/Ng1T2E8KLRfZM9hRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734025077; c=relaxed/simple;
	bh=eq4qtOCkb06hDKDTN86FCPnuJNO9UQ4KF+8V/v/4nKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dByJAb3qvPEuNHuaEkUzFIqMM8er8a93CwvBD8gapCVUW4ae4zzLxoKOfiKpBHVCdc3ENqW2GcFZfqPR1wOnyBSSq0naUs0edZg5zIwjuIKkEzFJ8s5u9wj7/2afmvHmzFrYSB4C2vd45sknbNdtlAJ6IJreFPT7jOo9brASD6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pz7t2UlG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361815b96cso6474645e9.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 09:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734025074; x=1734629874; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kUVhZzblYrSrrMu2VNFH87MlaC250ovaWLM615eCx/8=;
        b=Pz7t2UlGvrFf8y3eTLaItnhOrwL4ZkUjmxB/UnbKhJIDdbTmOyl/FjEusGQGuw5BIL
         PbzOQqgj228jIOLGNsR1QlD/MgiYnAdqG9wQD4RQ5B5bflri+JIh8owBgxXTqJPpScWT
         0YNNVINMmLQ2uwmGpRGszvtR843Ub+bPLRI8AGKKCFSoR6L1iNPw7+4IK0epLm4SttMt
         3T1W44wPCf/yIDwWQOTsIfUSfrbzUOHBaLCJ2KYU1imLqCr9BMK0ftgn64+Kc7EuLrNH
         Qg/Olw5nwayZ+6Q7foMpBfV3itL6Reu70eYNh38LVl+IxkVqG//p8Of13VMC7h42eGi5
         Jrsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734025074; x=1734629874;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUVhZzblYrSrrMu2VNFH87MlaC250ovaWLM615eCx/8=;
        b=CIcD+IZ/wJ1F2NjEpKgLz/404e/iFeDjTvfGxaNg6nhETUlytD4k8ZaxiUrZ5vmZIg
         02UkMgJVcahSdC+5eLiOZO/dSvW9XSOJjr4VyewPK1o8TK4Mh51T8VEyI0mfdSYMycov
         iWu9sDmbR9fJ6kkDNl6y5/Gh9d2F7nsn6s8Af0ZdqrrxTqyOs/vSS9bHssFc0BvT8yQp
         HUGuQ4Fw81HrPHE+S5HwxfDc0OUOLskjwMw3U1sphNHg+DU+El5S4NsIOErZDkG6sJhQ
         6nsmBPMXtMZ0sZ8CgM1ZR9Plh6pwdD3Bd+GTE1rnYZxXwAVMkI8FUTuWS7WVrJtyC4tv
         908A==
X-Forwarded-Encrypted: i=1; AJvYcCX7kOkuVew7F+My7+KZ5m/ev3kjt1eqSc6BqiIdwfqbEk29Ldj8Q6kLiKFgA2gEs4ecd4+1PO8otKk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3O6U5OjunP7EKseyaDlkry15CRetJ6zwZmcjzminZ2yFmoms/
	D+9GgIt9ZFohPH4xVXWey4Z5zu8c7STrW3bzsPchoudJIDrnHEHuLODxiZyf/gc=
X-Gm-Gg: ASbGncsurABNTGnUAytCg8CiBx173Jw40QVBUoicHqWUkSpVmMeE6CaUgkJTvsl5BZO
	kfClTmB1NXOdyJoAU4ethHogPZZ0ODWijiafWRgTcowp9OEHACKZ9pMFl4qXVu4sA1JqFj9kaK0
	2PgqTfZ8+EmiDhk/R2kBF8+uB2SaEVDiwCyVmXNPQSzgpxFH7ciDV6VoVDBAiwHdaBnEt0e/1vO
	HChA63o6/hXDa014TWNjeDKS1qZlne4fmNf+Dnc4dWDI3ICphl175sl
X-Google-Smtp-Source: AGHT+IFVpDtHiRWZtq+l7FcKjqWJZwBMFlQ6EB5cZvewTYDYMWWp99XI4L3CaENDY8+yfil3xKZKOQ==
X-Received: by 2002:a05:600c:1e23:b0:434:fbcd:1382 with SMTP id 5b1f17b1804b1-4361c35cef2mr63253055e9.11.1734025073939;
        Thu, 12 Dec 2024 09:37:53 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559ec08sm23148015e9.22.2024.12.12.09.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 09:37:53 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 12 Dec 2024 19:37:43 +0200
Subject: [PATCH v2] usb: typec: ucsi: Set orientation as none when
 connector is unplugged
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-usb-typec-ucsi-glink-add-orientation-none-v2-1-db5a50498a77@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGYfW2cC/52NQQ7CIBBFr9KwdkzBGoIr72G6QBjaiQYaoI1N0
 7s79ggu38/Pe5somAmLuDWbyLhQoRQZ1KkRbrRxQCDPLFSrOtlKDXN5Ql0ndDC7QjC8Kb7Aeg+
 JPbHaygKIKSLoS5BBXZUyxgj2TRkDfY7Wo2ceqdSU1yO9yN/6T2WRIKEN3mnsjNWo7/y1OZ1TH
 kS/7/sXF/3ZI+MAAAA=
X-Change-ID: 20241017-usb-typec-ucsi-glink-add-orientation-none-73f1f2522999
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 stable@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2868; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=eq4qtOCkb06hDKDTN86FCPnuJNO9UQ4KF+8V/v/4nKI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnWx9pBoNl09NLE1zf+hSbQH5Sa0RklWkkDg/U5
 JwDvnGFKr+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ1sfaQAKCRAbX0TJAJUV
 VmEeD/9ZDyRQTHGgGktWZRR6PQrT5W/4jO6KcTkGhllJEY28TeSULoNBkFUDkO3hqls3hJeAWYi
 Y5wqCjfh/mR7fBJesqQsOEARXSnjEDONeObXNFqO3EFgbECuRCUtVSyA4Koeo9VhpsFHtYlmPCY
 RPJg9V3wy19/AOzctvqErnROQjQKpo9uVR/FX/0joElPF+Da5zVZJmdxqBBr9YmuDnSwffPcqEv
 Fz/pqINmmJzGcJHtvb2ZEmxtd97NBDowSJg3BicqtLVJTlTwQrkm6zK2QA32adkiiPl9E0CA+gd
 Z/bV8Gx4MtIF8NAH5RvGYni5Brp9Er9xDuWc9NdxzYFBZ7IcYfy+oHq7LqCiXYxwl01S+bHjzgx
 e7Wz8674Q0GvTxe5/GLuEiJJrIGqqpQNY6vOdMi3AgSDQrawcPcMVsJK9kTwn5wksNXvBDXWcyc
 Bz7mIPOYxqKoYrH232ivMAn5QpeKCZm9WlQT9ea56U5yjY06rQL2ZJxvXeobOz7eBDfSsOkM3ym
 6rKKAFHMRjIploGa5rCYszhqSwZJ065AlBzlHxtPapUUkeigz26T5NkRxo91BSJ1iHkPRAd4tFY
 KXMF+CEZvtgxo9QiZslSkN5gLIyWYTljxSgz/JkOcS0I6YMFhU+T9RXlOIrdKutVpVpH+05EhIm
 LcA8r6ns0XU1j/g==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The current implementation of the ucsi glink client connector_status()
callback is only relying on the state of the gpio. This means that even
when the cable is unplugged, the orientation propagated to the switches
along the graph is "orientation normal", instead of "orientation none",
which would be the correct one in this case.

One of the Qualcomm DP-USB PHY combo drivers, which needs to be aware of
the orientation change, is relying on the "orientation none" to skip
the reinitialization of the entire PHY. Since the ucsi glink client
advertises "orientation normal" even when the cable is unplugged, the
mentioned PHY is taken down and reinitialized when in fact it should be
left as-is. This triggers a crash within the displayport controller driver
in turn, which brings the whole system down on some Qualcomm platforms.
Propagating "orientation none" from the ucsi glink client on the
connector_status() callback hides the problem of the mentioned PHY driver
away for now. But the "orientation none" is nonetheless the correct one
to be used in this case.

So propagate the "orientation none" instead when the connector status
flags says cable is disconnected.

Fixes: 76716fd5bf09 ("usb: typec: ucsi: glink: move GPIO reading into connector_status callback")
Cc: stable@vger.kernel.org # 6.10
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Re-worded the commit message to explain a bit more what is happening.
- Added Fixes tag and CC'ed stable.
- Dropped the RFC prefix.
- Used the new UCSI_CONSTAT macro which did not exist when v1 was sent.
- Link to v1: https://lore.kernel.org/r/20241017-usb-typec-ucsi-glink-add-orientation-none-v1-1-0fdc7e49a7e7@linaro.org
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 90948cd6d2972402465a2adaba3e1ed055cf0cfa..fed39d45809050f1e08dc1d34008b5c561461391 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -185,6 +185,11 @@ static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)
 	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(con->ucsi);
 	int orientation;
 
+	if (!UCSI_CONSTAT(con, CONNECTED)) {
+		typec_set_orientation(con->port, TYPEC_ORIENTATION_NONE);
+		return;
+	}
+
 	if (con->num > PMIC_GLINK_MAX_PORTS ||
 	    !ucsi->port_orientation[con->num - 1])
 		return;

---
base-commit: 3e42dc9229c5950e84b1ed705f94ed75ed208228
change-id: 20241017-usb-typec-ucsi-glink-add-orientation-none-73f1f2522999

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


