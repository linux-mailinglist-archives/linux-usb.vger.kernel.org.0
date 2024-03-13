Return-Path: <linux-usb+bounces-7908-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A45187A20E
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 04:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 061682835A6
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 03:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2CC10965;
	Wed, 13 Mar 2024 03:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YZpLyrRt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C88DDD1
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 03:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710302069; cv=none; b=ZZU6xwRnKoZxdNjhqrMJCcxr4kM65qRoRknx7I08xakMMqZ2aN0SqYbwcAz6gonYaiivcG34oW4ueMgU40YTqh8bRvdoorSxMeo0NbpCu5uvuS1aowU3who/pClwRfRkHLezMTFQVOg6pGgFNT3LCElQgltnuqIC1JHRjSSA2dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710302069; c=relaxed/simple;
	bh=6EYmD69sWZmGoX6AKwzh0M4O6uXmEHRrEKh/yt0/KPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oKnQDzHSu4q6loEL1kPXLu4QM4UpKiMQw9Bek4UcdKtyJ+LWnXUTvc7yklmfueXuWXRUG/GOYvjCf8oABBXcbWtq4XWPvApvEQG62euByLvZiZ+tr+Os8LO2l1wNVjTCnCrAwOATsyaKcbrmqKuAxE6rjX7SRzga5grWBUYDQx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YZpLyrRt; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d09cf00214so71636771fa.0
        for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 20:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710302065; x=1710906865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fct0VZjsurRkzQqPpB3JaLxWY0P6FclFVQOW6mKz5w0=;
        b=YZpLyrRtNe2B1Z74VpEfjNExU+KV+xHRq721Jqup9DucYxpJqxzIFvh9avQ/qKPqDO
         h1Mz4ZvRom+vPWuVqmXnd3iQE0k7EOZXBKWaYyf9Kb1tr62civn1LRhJomfPYmjH3N38
         F/WphJ2ow9iYQ0T9FiGJ2CRVGlSSzVMfLUJmSSBSuTdXrsvHLtmuTVq5Oz3gaInMVfW3
         UbqY+KkAI7U5Q4cmBu7GpB7PCFmCT++FOT2B7ywqY/1NgHuaCpfCAQaRxEVWqik8H39w
         v4+kK+RYX6NbZpBoYBqq07Hsxi4za5v2YwP/p0r6i2nhpCZ4E1rMK3C31ap63M3PFwWq
         Cc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710302065; x=1710906865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fct0VZjsurRkzQqPpB3JaLxWY0P6FclFVQOW6mKz5w0=;
        b=OJX9THrtC31ElhbqtT7mUsr0f179E3NB/kDHCfu1lfv737lfd1JUBA45VZtFeqvRKQ
         qwgC/vJWpy1iQrh48+1rbA1fA6h9ZXe0j5pS//a2ZnPEXk6S7Tg5dCh691Plu8MiC6j4
         4iFmXWEHDyCeAS8v4Xr3cBDilvpLc6tBSi+mKxuBGZAbMrtHyzCcql6AYwvRygxpYTSq
         KDTeSY19/WkmIXIEhdnnVHUO6jxBLVHxnHNt8e8FpIuco3aPN3j1J+Oz3UZKFlW8cvJA
         J3sQqlS70u+0FuuCkJh7ZAvk3s9BCP0Rek2ZZOGIZ1HrWUNfHu+rAa12jieHmWdgyTOP
         lEiA==
X-Forwarded-Encrypted: i=1; AJvYcCVNpbKXXBHmv+vT26JT3iJmRlrJqGkUji1mILKs9L0/sQylFlOhVG897UPRRTD8WaKyJqg9rn5bYxgbTHHZdKrFn9aMNb8e/XmV
X-Gm-Message-State: AOJu0YwGv4NESz+2eNRfhWl5hf796+il9FkeDe3PD0Pb3EgL/xhVnEDz
	oGNhUUj5BzRNH5nfhLHTTtE/7Cy7EovN+DEZ/gOx3nWru9Od34EDYeaORmTY1go=
X-Google-Smtp-Source: AGHT+IGU1nKa9yZZSaZBVwxotiWxvgYGip66g5eNu2UPhAK4cjTwOilx3MCH81jbjbDHlShtOoBQOA==
X-Received: by 2002:a2e:350d:0:b0:2d4:16a5:b361 with SMTP id z13-20020a2e350d000000b002d416a5b361mr1431441ljz.25.1710302065397;
        Tue, 12 Mar 2024 20:54:25 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f25-20020a05651c02d900b002d0acb57c89sm1854319ljo.64.2024.03.12.20.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 20:54:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Mar 2024 05:54:14 +0200
Subject: [PATCH 4/7] usb: typec: ucsi: allow non-partner GET_PDOS for
 Qualcomm devices
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-qcom-ucsi-fixes-v1-4-74d90cb48a00@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6EYmD69sWZmGoX6AKwzh0M4O6uXmEHRrEKh/yt0/KPs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl8SNreDUqybYN8KU9iG18YedS4ZfehnlaTrZRv
 7/A8LzaOIeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfEjawAKCRCLPIo+Aiko
 1cz5B/9rl0hub4Z5WK6m/HRp2u0VhWm7/iLCPxfkgXFaarI7zCOiQf41D8H4NbEWJ6jgcecy/OU
 nl0B5nbBw52Ix4jTdCe5Gh3sTn6yDoTcxcsNln/T3ncQowxE6g7W8qudfBxEv5AJ5XosAtSWEP8
 KiSRh/6WUQOGnwYLtuZXPACSjnp5ObKVHCpiP7RjYov0fO8tmYDaTbzfhf1IuKYkYd6jKjMZGPs
 KfyunsuG/2tZ36zX8L2X7NVbqltjSEu6X8wuBZLXbOHpilZNv4r+wxTi5EYAHCDqFWuxI+smGY7
 0YEgHg2AnKgprVC9jqXv9diDMCum1RYwGNSZp+tQCdHSxmM4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The name and description of the USB_NO_PARTNER_PDOS quirk specifies that
only retrieving PDOS of the attached device is crashing. Retrieving PDOS
of the UCSI device works. Fix the condition to limit the workaround only
to is_partner cases.

Fixes: 1d103d6af241 ("usb: typec: ucsi: fix UCSI on buggy Qualcomm devices")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 05a44e346e85..011d52bf34f6 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -641,7 +641,8 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
 	u64 command;
 	int ret;
 
-	if (ucsi->quirks & UCSI_NO_PARTNER_PDOS)
+	if (is_partner &&
+	    ucsi->quirks & UCSI_NO_PARTNER_PDOS)
 		return 0;
 
 	command = UCSI_COMMAND(UCSI_GET_PDOS) | UCSI_CONNECTOR_NUMBER(con->num);

-- 
2.39.2


