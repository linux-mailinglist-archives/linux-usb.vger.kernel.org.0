Return-Path: <linux-usb+bounces-7906-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FCE87A20A
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 04:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3A8128387F
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 03:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0A012E6C;
	Wed, 13 Mar 2024 03:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OP+DHje5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3009D10A36
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 03:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710302067; cv=none; b=c29t4G6YlyJWFgaeeoGsuiJVtOZulTdEvzSId/vkU3A/UIdDlpXXQzBv+QcTAvZg0MbBMGtin6iM6A37gCKV7LasCg5dvs/w9jERztzktm8wb3ROZ5gnu5ontyD8JEOIFLGMXob6oxz6AU8iyI3ykaDSk9eEcpyvgxJdLH8D5+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710302067; c=relaxed/simple;
	bh=XsTJRGmLqtfeI4uhYqv88MedEB7+Nrzpk4+GYV5RAlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nwIXqjZgY9iuucO5toSg0XHI1SNp2xIxCct1+NxsJeUAbgeFjdOIZgxol+CZ12SL+i4somJml7BhTlh8FrIui/sX36ZgWnivT+LE4YwlzLSUb7Z6Ws4Ue9fmYPCVmg8nBGBXPIBE8JPNL4q68h9PO3UZ4UHbqJNa3Bf1G1mGnRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OP+DHje5; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d27184197cso81704551fa.1
        for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 20:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710302064; x=1710906864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bhgYvXY3qfNB9puPl0tbRCud+qYwtmwix0mxjSGycJU=;
        b=OP+DHje5kxRl9YoabnmKgG0XA6Ndk2Io7E/e1tV3a9VIz1+nK1L5sFn/UnUeq7iwLm
         mltkMSrDGDBYtqfIlj2Z7UJfhqiQ4HSbYwGPCgutgMSt5qw2p2Sea5lCzN6Dcld9RX8S
         61/CoQKA6v9KF89Pbg12yakLp28ZwF+6wJBrkzWOh9+3WdyCJJjxMIc2K3tQVw2TmWnJ
         xCL44PlQQN0CNr2y0FxRnSYh7sXe3ccj//eIKlIcZjl8U+XBwHZncP7EanREO0MxnoV5
         Iz6kt/6aAbP71InEiPByf1D8zGQsO+dGfk3wWFjQgWu/5bQEnKniQSg68epIWeDXQLOT
         QNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710302064; x=1710906864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhgYvXY3qfNB9puPl0tbRCud+qYwtmwix0mxjSGycJU=;
        b=Zxu0vmLGRGYLzXabXwP+XJj9Ue5thDUOcNdxduh8KErUWO8Z7OlVivU52ELZf0Rr86
         ouIav/Hq8mgkIowvGWxJ+HtLXwjuT0U9yaXlVIcJmOoehMUSNzdXSgplU2WKPjA+wWxb
         HGdxomFo1aNjoKCQIFCdsJ+z8y9U+to6uru+1nopk0+qfR1hySxwtrNF1OMdapVQJmff
         mnICBtDxI1SxA2eQTgYGgCZJ5thS3ne5DmYxXrJos9C4Qzu3dHnhx0XBkoZcOQi52U53
         4HWUU6W5ILc9GAiFcZUhhyQbj670A0af6aacNGWlQiDgol/n2D/czwH3pHxE5+BLtnBW
         uPvw==
X-Forwarded-Encrypted: i=1; AJvYcCU+N/1KjFSZ4GVmsesemaGxOC38vl40gIpAqPdKW+ioTn8IZUVTFaUIMJHlhNEwqnxZbmihZinCmSyHyYJxI7+OdHhpbeFrb96Q
X-Gm-Message-State: AOJu0YyD2aWSV4Ew1+2382WeEdlJ9ngOdBXEIjleooxlRFQMW1rlxJS0
	eIblMxLt0lWR1GGRnJh84AkkJyFBD3D7s8t+nvwhSnRkfxkVEG6xSw5++RvlEAk=
X-Google-Smtp-Source: AGHT+IGuUJwUxKprfVv1helbjKdC5swNlM5EdpqQUBCZ/j7Fjvo76AQlVaJ8BDDIwbK/p2HrX+FHmw==
X-Received: by 2002:a2e:9a8e:0:b0:2d4:6532:f449 with SMTP id p14-20020a2e9a8e000000b002d46532f449mr1716234lji.20.1710302064505;
        Tue, 12 Mar 2024 20:54:24 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f25-20020a05651c02d900b002d0acb57c89sm1854319ljo.64.2024.03.12.20.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 20:54:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Mar 2024 05:54:13 +0200
Subject: [PATCH 3/7] usb: typec: ucsi: make ACK_CC_CI rules more obvious
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-qcom-ucsi-fixes-v1-3-74d90cb48a00@linaro.org>
References: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
In-Reply-To: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1720;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XsTJRGmLqtfeI4uhYqv88MedEB7+Nrzpk4+GYV5RAlA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl8SNraClA33CPWuYkPDFf2GlffV2yFp/DWqKa7
 JQyl/lMd/uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfEjawAKCRCLPIo+Aiko
 1YfsB/4+Nnmk2AEqncBvGZIyyIxPd3aHD2nZiLyZEb7CBulni/ZUTXCulyCwldLCgywS023JrRG
 41Rkn2pHoUQnxjPdpOs2b6fapIoXo32fP4piMRUoCIIFb+sf0+Q2oLd7zKi3Tf35i/v2htftBjJ
 QwOzuXDH//Ajc+uiqVaB8TNe8ZfprSRp4B/2S7JLikuss7hY2TGbGHwh30liqMDoFrQ6DHyyQtF
 b7KMWqsOGlwPiHaB1jkX1+ecq0Ecj02YsPEKCPlJHkL9vr3WP1hIOUqiwCFnI2BtOI5GxVmCAKN
 NJWpkza6/b0rKtM7fQz+TeQlpqIPMDPfoRdcLBaebmpxqK6Y
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

It is pretty easy to miss a call to usb_acknowledge_command() in
the error handling inside ucsi_exec_command(). For example
UCSI_CCI_ERROR had this call hidden inside ucsi_read_error().

Move this call and add a comment to make the rules regarding
usb_acknowledge_command() calls more obvious.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index bde4f03b9aa2..05a44e346e85 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -92,11 +92,6 @@ static int ucsi_read_error(struct ucsi *ucsi)
 	u16 error;
 	int ret;
 
-	/* Acknowledge the command that failed */
-	ret = ucsi_acknowledge_command(ucsi);
-	if (ret)
-		return ret;
-
 	ret = ucsi_exec_command(ucsi, UCSI_GET_ERROR_STATUS);
 	if (ret < 0)
 		return ret;
@@ -167,14 +162,27 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
 	if (!(cci & UCSI_CCI_COMMAND_COMPLETE))
 		return -EIO;
 
+	/*
+	 * All error cases below must acknowledge the command completion,
+	 * otherwise PPM will be stuck and won't process commands anymore.
+	 *
+	 * In non-error case the command is acknowledged after reading Data
+	 * from the controller.
+	 */
+
 	if (cci & UCSI_CCI_NOT_SUPPORTED) {
 		ret = ucsi_acknowledge_command(ucsi);
 		return ret ? ret : -EOPNOTSUPP;
 	}
 
 	if (cci & UCSI_CCI_ERROR) {
+		ret = ucsi_acknowledge_command(ucsi);
+		if (ret)
+			return ret;
+
 		if (cmd == UCSI_GET_ERROR_STATUS)
 			return -EIO;
+
 		return ucsi_read_error(ucsi);
 	}
 

-- 
2.39.2


