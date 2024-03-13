Return-Path: <linux-usb+bounces-7907-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9512287A20C
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 04:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4ADFE1F23FCF
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 03:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679FB12E73;
	Wed, 13 Mar 2024 03:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N//dqGSF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7B410A2A
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 03:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710302068; cv=none; b=QJhP8DM/XUuXNQMS9DUllePoBIEROc/i7kUPgL5HdRF0a6wCDwcyq/EIeV+0yAptOwe8OXojkcF0e5UfhjWiZs7+grQKEeueGwYHLTixzfxM8u5K+uwjfa5pTxAimTgq0Vv4OizG5fXE3fLYcI76JYCXjnrCFs/mugMIUjYMG0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710302068; c=relaxed/simple;
	bh=b4TOdcAfpKP7c8TtSew/74QZD84OuH+/13I9UVvWj6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EEnyhp1rTn9jK8rvbXNkTrYb4chiL9g5JQGlSRxdBe306TLDZ4p/67+wNNSdbzwhJeOZ2Cbnmdri5DG1GmPCtvYg8nbuWEVBCLq3JSLOVu2bW9I+hzZK1KN1yo7GAp7mbRBDC7y+Z1/GjoB864CD1hnWZC9y7neqkrnFhdFxKYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N//dqGSF; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d09cf00214so71636561fa.0
        for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 20:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710302063; x=1710906863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFntvUmfQrQoD9JhHP4a9IiBrKarY81qZUG6+LdJaJU=;
        b=N//dqGSFTGZvAunpZjEUrPCDR0QAy+0xIvChTBMKfVysAt17fMBVWca1U/DE6hmJFo
         AZE7RnQOrdAiy1nfH43OuJBJ3loRlKATQS+f3JoY9Ct07oJQ6ACDV54vwx2Ql66uoNHM
         27t3+kD7wxgrwF4lL8emztXUM+CY8mnXeHuA3sWunwWVeNp5nR998/WaXMN7IHjPWd/b
         ACbQOG2tQVVLeBabOfoDjpLyb2du6+7d//2Ltzpw+/5ZPJcQZX3I+DaBfbBZBWm8i9mG
         iCsGjea1ADQWIO7ehcjkQ06irnS7aw3iQcw1mWKVKbinon62i2gXiyQNrhM7wJVoGfFd
         Ujrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710302063; x=1710906863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFntvUmfQrQoD9JhHP4a9IiBrKarY81qZUG6+LdJaJU=;
        b=abRxnT38MGjqKyzEpK5Wc36z3/g5KhxFfB0J0gUAQmpe0M6cqU7blanMWac6O26sQn
         OKelp1sBbR12+Hq/Efl2NtmfjADfnbJDVDN5UPSEH6aCN7t+QP742jIn5y4AwLIXx5OC
         Q6k2PLdrrROnEJdVBkNlzB/jhv4z0+nYTW/aINtZ0N/aN/7DKLGb8rhEbAZ434obg3sz
         9yk63HM1PXnwzc4ylpx+15ET2BB4lUnX52eXyLrfdRMzHBZ1xuSP437G5FMuUIjuI7V2
         kdO6frI8Cq9KlnSnb4+Qx+PObxQwda+aeyXy7PIezZs2H+LwdTT8x6WGtgiY1sQ3t3i0
         e/fw==
X-Forwarded-Encrypted: i=1; AJvYcCVW4U0hV0QBPi2CqCjsEzOJg+FCgBU01ZyjohV/SwT7km+NfmDIx+yiodLsbU5QXPVuwcNQdZzIGGMVAVJEkHSteTQSCQ53rGF2
X-Gm-Message-State: AOJu0YwUAh/6DE+TqdR0eFe2qgKikEyH9KouPuRuQJj2KOBgQ4+4QmBY
	PDFMg1MdhH3xi8cbAQVuuuYdzwBTijJUR0Nali3r7Y2Ex3Hy9cqF9NV7I0DrMjc=
X-Google-Smtp-Source: AGHT+IF7ZptzPxSTf58/lAJjw4Oo4QhbXQNkZBdrDCZziYkkXuk84yKwMDenXbJyp736hIssvaOTAQ==
X-Received: by 2002:a2e:8e3c:0:b0:2d3:fca:dae8 with SMTP id r28-20020a2e8e3c000000b002d30fcadae8mr1200502ljk.16.1710302063642;
        Tue, 12 Mar 2024 20:54:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f25-20020a05651c02d900b002d0acb57c89sm1854319ljo.64.2024.03.12.20.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 20:54:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Mar 2024 05:54:12 +0200
Subject: [PATCH 2/7] usb: typec: ucsi: acknowledge the
 UCSI_CCI_NOT_SUPPORTED
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-qcom-ucsi-fixes-v1-2-74d90cb48a00@linaro.org>
References: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
In-Reply-To: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=b4TOdcAfpKP7c8TtSew/74QZD84OuH+/13I9UVvWj6I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl8SNqeJcoJB/Iq7ScN3gQPd6nqFh0TtyF56Qo1
 NIzkt2f3CaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfEjagAKCRCLPIo+Aiko
 1a3NCACwe1UaBtfp8zYIFp97vnTMJ/Rftih1EHQpFoHrXfy+q8GjM7W55FJWQ0tAJYAHneww/11
 rW0r6zoOWO0hGH6L9wScIb2k5fsy8RgV7e5FOj/Yu8QMY/f0FYoQl15l8AUfhF8BWYhgWll8tf/
 ipldJqj9i7EgaY0Qr2FdwICG5H2Y2LePyZRb5HljYaW4ABjjn6ojloi0+4f9nExQG7K9bdOkYMb
 q3EwJ6XFQlbJCSnMjN2nAp+f5lYuWmFria6qyf/FXgkYqO0NJSZ+cETuzQ9B4MG7uYbNwehvcII
 vndULkoE+/G27inrpaRG3Q2Nyyn9uNwE75AcIJ4co7trqJew
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

When the PPM reports UCSI_CCI_NOT_SUPPORTED for the command, the flag
remains set and no further commands are allowed to be processed until
OPM acknowledges failed command completion using ACK_CC_CI. Add missing
call to ucsi_acknowledge_command().

Fixes: bdc62f2bae8f ("usb: typec: ucsi: Simplified registration and I/O API")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 4abb752c6806..bde4f03b9aa2 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -167,8 +167,10 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
 	if (!(cci & UCSI_CCI_COMMAND_COMPLETE))
 		return -EIO;
 
-	if (cci & UCSI_CCI_NOT_SUPPORTED)
-		return -EOPNOTSUPP;
+	if (cci & UCSI_CCI_NOT_SUPPORTED) {
+		ret = ucsi_acknowledge_command(ucsi);
+		return ret ? ret : -EOPNOTSUPP;
+	}
 
 	if (cci & UCSI_CCI_ERROR) {
 		if (cmd == UCSI_GET_ERROR_STATUS)

-- 
2.39.2


