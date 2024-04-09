Return-Path: <linux-usb+bounces-9184-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 575B089DF37
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 17:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C28D41F2A708
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 15:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C82413E033;
	Tue,  9 Apr 2024 15:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SuRiQqa9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314AA13BC28
	for <linux-usb@vger.kernel.org>; Tue,  9 Apr 2024 15:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712676566; cv=none; b=ZZxDMMRzFo00fGlor9xol7M5NSVrirja4Yn7r34SgSIop9RKizauw2bX8nNniHnOiKeaewsFGyR8ErmTJrx/iSfToKtiI//XSt9UdQzpCb8ulAvEksjDfa1MhPjD7y70OwAlnCc7KVs1EzARB0bElR0aeFiLb3vsiPwrbl/BMEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712676566; c=relaxed/simple;
	bh=oepvaY2/VOteNy8Xi3leUDDFpbyZF3Ik3OJOE9wvk9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EIgq02Kp1OIPneIzw8zBHsxGSaEVKiWpx736K2g8TsoY2xP5XdyP/kL9IqCeyEDQ+TKKYbTEh7aRzLSW4+EJrzmCYgMQW3cbe40P/hFDS+O44BYHdNJE1BUG/vqXBthJ2qJx0MPIxSX3q3qe0LcreROefdDOVR2/U8LzMpqUNk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SuRiQqa9; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-516d0162fa1so6867580e87.3
        for <linux-usb@vger.kernel.org>; Tue, 09 Apr 2024 08:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712676562; x=1713281362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFHcZaaVDW076N+4Kkfs0Y536W5JnS9HZUoI18BuVEQ=;
        b=SuRiQqa95RRH/pWHHHoUC42pIZH90G6SDAT4Y2FiQDSMnHhGZjHkFkrqVNwna+zUOJ
         /EW6LdZpiKtPaCaPhtz7g02BAtieoFeBRenHX6TGiXA/s/HBkzdQFultp/eG+E9HgreN
         OgkTPtm+0s19gQE49pAAZiRh/YzkMNBB+XyZa6+pZcxV54gc7xeCpu2js/MKHx+LwnG5
         Nh1j77FCNRUjFVd66PU87ww998QI4R4H2Zp5vo8gdotv0sCw24x5hQIKNcmF2jPGBwYq
         snZP4sWRzVQkII6fpfBKDc0uesYQXy02BNH1NDyIuv6v+ZwH/BwXEtG5MLSRft5e9Krl
         vlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712676562; x=1713281362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFHcZaaVDW076N+4Kkfs0Y536W5JnS9HZUoI18BuVEQ=;
        b=arW5za3DN6x/hAxK/ZDRvPGNR6cC7FN5GW2eqgISAoSL2mCZlxMfxEGC19GGCeWe4D
         7ZW6vxDpQOYGL+udrLnfELwrF7J6w3NHBdBFoEMrWMdVh4USPI/TkmP0gXuLZpuuYHYR
         fZW654vSxZNU1n1AU7mRc6+Fl/gPfgpvD/psH6jD7oMA26seRma54JHaqme5YiNdRABS
         lXpyiQ9CE3H1NA1/tNLoIwumf6x1sm/BtpuRPoQpm2+eMRtlfrPLkviHq61P2wX/hyj/
         ytYb4g0FOKcbWdz+rIU638NuqpFeK4bm9aQKLh5tZIBr99j1EJKdqo80Jr/zYW1zaG7R
         yWXg==
X-Forwarded-Encrypted: i=1; AJvYcCWBbCgcouCtlsKMUjuiFnKX4i1FntWRDyAm3XrDxwUfuYQaNSbK047kv5Pk4lKVQuOd6ct3gHdgFy/FNTKKKJ6bZPxeqhgfj+Ny
X-Gm-Message-State: AOJu0Yx6aMQRV0zVtECWv+tnJqayep/uPZRVKHprNRG9yU8tAdiEfQLX
	9p7JdaGZRUCpMpac6gJxbFfYTm2qXOPyog3ojRz/amU5ZyiUIO5UkO1w2gk9b7ffFoEyBdv5zlj
	y
X-Google-Smtp-Source: AGHT+IG3J5+oTY8k82U26bGqhj0qhc6r1PMbTssB72gqdqfofcyL2lFLRihn120L0oVWy1CZVyRT/Q==
X-Received: by 2002:a19:8c09:0:b0:513:da24:19ff with SMTP id o9-20020a198c09000000b00513da2419ffmr8284672lfd.38.1712676562383;
        Tue, 09 Apr 2024 08:29:22 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a16-20020ac25e70000000b005159412ab81sm1579990lfr.216.2024.04.09.08.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 08:29:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 09 Apr 2024 18:29:18 +0300
Subject: [PATCH v2 3/3] usb: typec: ucsi_glink: drop special handling for
 CCI_BUSY
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-qcom-ucsi-fixes-bis-v2-3-6d3a09faec90@linaro.org>
References: <20240409-qcom-ucsi-fixes-bis-v2-0-6d3a09faec90@linaro.org>
In-Reply-To: <20240409-qcom-ucsi-fixes-bis-v2-0-6d3a09faec90@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oepvaY2/VOteNy8Xi3leUDDFpbyZF3Ik3OJOE9wvk9o=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5po3Fld0cp+TSFbtrecTsLtOenWejWJ81UPxTGpy2/+n
 RX1MqGT0ZiFgZGLQVZMkcWnoGVqzKbksA87ptbDDGJlApnCwMUpABNRm8T+m8XBodAtJUb5A5O3
 cGcAx7oD2oa33ir/fvL+8SEHPQO5po9T22MtmGz1Gy4/nqrflP1Cn91qznwvp8tTd1g9nqNTU1X
 iYV50ROjrzlkism26Wbu9P34RPlYxe3nzz1+9CzZPSdS9ejxAi39N4u6PKu51nvcT/Ng4rqjHb3
 dynLy+/fqWMyyyx3hYrr9/tdrKfFtJzhOzkwlm2/s82/+L9/26z21YdWm39P+9E624V/9dxujos
 Typ46NPcs2B+Q18gVvrVhVvYU+XTV/zWiUpPkQo01xK1rxNLvaSTez/D5IxzrXmPK1l4vPY2JQU
 t3+03fA2edZsP1G7yBVLD6RkhtbrSN99u+ZEnOzTbVMB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Newer Qualcomm platforms (sm8450+) successfully handle busy state and
send the Command Completion after sending the Busy state. Older devices
have firmware bug and can not continue after sending the CCI_BUSY state,
but the command that leads to CCI_BUSY is already forbidden by the
NO_PARTNER_PDOS quirk.

Follow other UCSI glue drivers and drop special handling for CCI_BUSY
event. Let the UCSI core properly handle this state.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 9ffea20020e7..fe9b951f5228 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -176,7 +176,8 @@ static int pmic_glink_ucsi_sync_write(struct ucsi *__ucsi, unsigned int offset,
 	left = wait_for_completion_timeout(&ucsi->sync_ack, 5 * HZ);
 	if (!left) {
 		dev_err(ucsi->dev, "timeout waiting for UCSI sync write response\n");
-		ret = -ETIMEDOUT;
+		/* return 0 here and let core UCSI code handle the CCI_BUSY */
+		ret = 0;
 	} else if (ucsi->sync_val) {
 		dev_err(ucsi->dev, "sync write returned: %d\n", ucsi->sync_val);
 	}
@@ -243,11 +244,8 @@ static void pmic_glink_ucsi_notify(struct work_struct *work)
 		ucsi_connector_change(ucsi->ucsi, con_num);
 	}
 
-	if (ucsi->sync_pending && cci & UCSI_CCI_BUSY) {
-		ucsi->sync_val = -EBUSY;
-		complete(&ucsi->sync_ack);
-	} else if (ucsi->sync_pending &&
-		   (cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))) {
+	if (ucsi->sync_pending &&
+	    (cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))) {
 		complete(&ucsi->sync_ack);
 	}
 }

-- 
2.39.2


