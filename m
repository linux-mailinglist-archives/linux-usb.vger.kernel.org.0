Return-Path: <linux-usb+bounces-18195-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA229E6DF0
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2024 13:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FA9A2827B0
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2024 12:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9A620100D;
	Fri,  6 Dec 2024 12:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="woGS3ZOj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A324B1FECC6
	for <linux-usb@vger.kernel.org>; Fri,  6 Dec 2024 12:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733487591; cv=none; b=QbVHg6hqCfuFHb+bjG4gaVeqHicGieo5LIIVqyBJ+QHKzU+xlwWcyyHsqJ60Y0G5LW46f6Mq1sXB71UylVN1o2s3frUVkq68u/vyfIdoS0AfhSbH0vcYYklINkBtopdjyrRH5OZDokKQALC+ycQkvrHKgDqlH7vyiZ/M55e8GR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733487591; c=relaxed/simple;
	bh=thFV7LBxkJQUfZP0M1Yl6fEmqEUxZ85Tj1GZWMRA1ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ugkbrj7iJ67Sq4g6REsSIRfxt1J5/z0xQLaUhJvbCpV6gGAxQ0cREokC70EH31aGiIXbCAFdlortsjpa/TAqsAGaNtP9aGUo3O8jecgQ+dA5KBO8TXnQiZW5oJeUbcAtjuy92aWI2+Bjd7/VGsuJWZFYgJ2WKpQIRSjR/a4lKBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=woGS3ZOj; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa5325af6a0so310308066b.2
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2024 04:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733487588; x=1734092388; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qSCifDtkaWLlhiA+C6rx5IdqAlS5jx1eBvIpRLAtEMo=;
        b=woGS3ZOjIJWQCcWoqKoi4xAPHIAyPS6gv2SA5bJ1Zm+71ubaUnLSzKxFk02kE6kmUn
         BEmsbIhtnD8pmrxk4VfOzqketL7pR+POk/uGsWqOT8TL28d+XfRgasns6RtduD4dyaGm
         Vx8HQqWmGx39gs3RieghG9hR3YiTOiYpdadGwFLg6PSTkdaKm+LkjLE+LEC4z5xMgtLG
         P17ttr5km0i7VLtPQ6rXdlaMMFrVFYV8tDguQPE4NIsWToDD0u6uKQN6q4nd2DcIh7d9
         72Avy+AsUHPHaHxd1KrrK9sdova8NoT65odEEgDUGw4FzCUKQa9I/QfIXbRfvMCuH+z8
         q6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733487588; x=1734092388;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qSCifDtkaWLlhiA+C6rx5IdqAlS5jx1eBvIpRLAtEMo=;
        b=GwvRG6kIYsblfIlgTdrq8wn5uZb0jTnjaV8f4PU8uILjW3ap8yWZwHbUNsVYMFBVDO
         /zdV0RNnHWIt7ObU7RV7YH1cOqsl2w9drCswPR6/FefOj92a3NXkiYt28V6lbJPxoINq
         z1YIrSXBRkdfR+3oTkDKj8SUmbRmhc8e+kCU6Jxumfm4qWFZCzIJDxBqwsf+Fn9OhjnT
         OTbT5EZ7ZuSWOcgZYKYKJq6m6SuK2LRVwqvMlFtW1X2qGyLxJwo22QNsIRcItAKpJ6Zc
         bmq/LgdQTyD//FmJfFYiX3u+Uulr+3loKUmN13ySRW86vuJOXqcq8VL1wsjqq4xpdH4j
         pdfw==
X-Gm-Message-State: AOJu0Yz59RxnVGB5nHyW3RhwGd+MQoxVXuJKiWHdzhezAry2sXN+YT1p
	kiEmeZwU9KW6hcPjlY0OweVkR0H69yo7mNc8qDqaj8Hh9yiE8VpRD8C6L49m7rw=
X-Gm-Gg: ASbGncsee3oB6vdwJCsHITIpOEdIrhav6cQyWiW+SsBMkLi6crO0gku6T+EAtYIkIzl
	g8+oy4aJic2Blt6viOApNb88GhYpaQpavjpRLwbp2jj0IQpPRruGYuLJKDLFF/e6F1bupLFgviE
	FrPT/1wZUQP6ha6+vYvzE6sW5D+bM0GDTNKJJdJJSJCafWubTpL8nXuECZTzyXEXRzotVJlVDyU
	uktlcL4P1Ag+/+5rp6HBCXZTdgY6XDsQtOWRnMMapYbQ8ahjB4mM1n4JI7XJUVZZmwbkcWoaNag
	QIHtQlmjjvBNr49YEavA9KQlYO+1cbRzsg==
X-Google-Smtp-Source: AGHT+IG3wUHCeCtLSEd9ZYbvjU6RybecaVohOs0cXxkPW3wU9kse4Zc5thov3RTYg0Hdfn/4iK6HjQ==
X-Received: by 2002:a17:907:784b:b0:aa6:29a0:b650 with SMTP id a640c23a62f3a-aa63a005da1mr240377066b.17.1733487587837;
        Fri, 06 Dec 2024 04:19:47 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eb1ad6sm233624066b.82.2024.12.06.04.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 04:19:47 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Dec 2024 12:19:47 +0000
Subject: [PATCH] usb: dwc3: gadget: fix writing NYET threshold
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241206-dwc3-nyet-fix-v1-1-293bc74f644f@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOLrUmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIwMz3ZTyZGPdvMrUEt20zApdcwML0zSzFHPDFAMTJaCegqJUoDDYvOj
 Y2loAmjMGeV8AAAA=
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Before writing a new value to the register, the old value needs to be
masked out for the new value to be programmed as intended.

At the moment, the dwc3 core initialises the threshold to the maximum
value (0xf), with the option to override it via a DT. No upstream DTs
seem to override it, therefore this commit doesn't change behaviour for
any upstream platform. Nevertheless, the code should be fixed to have
the desired outcome.

Do so.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/dwc3/core.h   | 1 +
 drivers/usb/dwc3/gadget.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index ee73789326bc..9335fd095968 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -465,6 +465,7 @@
 
 /* These apply for core versions 1.94a and later */
 #define DWC3_DCTL_NYET_THRES(n)		(((n) & 0xf) << 20)
+#define DWC3_DCTL_NYET_THRES_MASK	DWC3_DCTL_NYET_THRES(0xf)
 
 #define DWC3_DCTL_KEEP_CONNECT		BIT(19)
 #define DWC3_DCTL_L1_HIBER_EN		BIT(18)
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 83dc7304d701..31a654c6f15b 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4195,8 +4195,10 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 		WARN_ONCE(DWC3_VER_IS_PRIOR(DWC3, 240A) && dwc->has_lpm_erratum,
 				"LPM Erratum not available on dwc3 revisions < 2.40a\n");
 
-		if (dwc->has_lpm_erratum && !DWC3_VER_IS_PRIOR(DWC3, 240A))
+		if (dwc->has_lpm_erratum && !DWC3_VER_IS_PRIOR(DWC3, 240A)) {
+			reg &= ~DWC3_DCTL_NYET_THRES_MASK;
 			reg |= DWC3_DCTL_NYET_THRES(dwc->lpm_nyet_threshold);
+		}
 
 		dwc3_gadget_dctl_write_safe(dwc, reg);
 	} else {

---
base-commit: c245a7a79602ccbee780c004c1e4abcda66aec32
change-id: 20241206-dwc3-nyet-fix-7085f6d71d04

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


