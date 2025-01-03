Return-Path: <linux-usb+bounces-18963-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C80F0A01114
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2025 00:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85C5A1635C0
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2025 23:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494271BD9DC;
	Fri,  3 Jan 2025 23:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P1bV2oAA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F325CA6F
	for <linux-usb@vger.kernel.org>; Fri,  3 Jan 2025 23:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735947257; cv=none; b=RPT3yPZzea/qtLG1LbzfQPO9d/UNHil/d8ujMefihFBSJoO3qcv4gPBcKmz4PrsAEg3JKaxRIpBeqOcyil14yM3a/4TWIllsQLeyCpw1z8wcDANWNXqvRZs+jRXXcRRtmQDq8kzR+/JfFYGdhrUB84Ip87EzWDfLWXRY2QOsPO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735947257; c=relaxed/simple;
	bh=fMQS0lpTVfYzVgsBO0JvCdXFBOEN9z/TrDtHPW6krbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oUJSYSEj008/mdJs6m8pLHTrRjs8BvtOUs1FxS3WGec66D9qobD/+4+PjsEs7I1nnwWlk/h1wV/dB+vypJPOdIMhTgRFH4v0mqGeCOzJ3zh98tpqVSA7otSfV7On45LTbOw+BYi19UcfBr0GthfEDVzMqSLrCG8yO5Q7xegaM68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P1bV2oAA; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-216395e151bso129684685ad.0
        for <linux-usb@vger.kernel.org>; Fri, 03 Jan 2025 15:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735947255; x=1736552055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyfQlF7S/J2q6dkyqD+eoiIOw9yZsS9G60jHXIIn6L4=;
        b=P1bV2oAAswMJlGR1awEJjibRc3QW7laPAs/jjX1Lhc5Qhi/tC+j3u8R1fMhTNYDJI2
         9c8gfclCvgdw5sGE6hB3M77z64C0wQiFnfpzuCuNA6g++fSf6Byt9DGwHXXtl+0PAOQJ
         6Dv8foCM7fswBa2YTlgD33JePOPvYCr1teX4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735947255; x=1736552055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyfQlF7S/J2q6dkyqD+eoiIOw9yZsS9G60jHXIIn6L4=;
        b=OMUD5Cz7CqrJXiwb+1t4bKGkAn96phifQWNhLk2DbXxkEYbb/lz22oS3eLN5x1GX+h
         RkTqjzA7mIopDFUDLWfJ4yg7YtWvijn3+qzdgHJnOEE9mrhbgCzrpyyDeVCA/kG5BtPl
         CLtSUqf6x25jstwEDzXA1l195V4lBCJLZ57D3dOav09mvknLaXGQmKx96XLHSYkr7bqK
         qnQ2inHkItHZUY4NfGEb9IHBzKxJ1wmVGN95PMyo0jHs6A/CRw2dOnKUkHSn2k/s2DxL
         gPbD2ojs+ebl4j7f2JNqc1r1MuxTS759DkSZ7DFyPf/M/4VN+1OJG6KJzSkTy1564bCT
         izjA==
X-Forwarded-Encrypted: i=1; AJvYcCX3VXWyJO1T9u2l7WDOYieoQ++aLXwPvdEFg0CRonzVCM84VJtqTnyb9Eo4L8CEdYYWZfXXNs2V36M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2PO0sPQQEb5YmCZvtKGbJnnvnsPSons/8lmBlLSQEvKx7WYT3
	4+TpoSlLvZU2v2SEybGSshrcoblLG1Ev6AcFYB9h5txTOJ0RMXjEX7aHboL/Pw==
X-Gm-Gg: ASbGncv554YWZf5R/lNGHgPOKcL/1f7i5pG1Cl2lYyoBBGe7rQUHaRnp9CH7BRtTC67
	qKOjRM/rZuXwS2XzgH0zYkp9KX7tQ4it/zoPrsIo7l+/xDa6X0AEtioogivlmRZXu+veTwglCrF
	n8cDdpIjyo2IvjZ9pC4yYFw1sIc/1FdzJOhEE5HMHwbYd5kKWPYraocEBqXuz+VgpTzQiWNo2Ur
	7+Uwb+Sv6t98CxDCZ+Z5znyDIGf2rlmka/Hrj2CTgRwgZG4lmiBj8gq
X-Google-Smtp-Source: AGHT+IGjqxAGJxD6BblVJKULcJXgs9BUWAfbs2PDu0zF614ZdOtQh7BRpcdUVumVougD6FWH1TIBUg==
X-Received: by 2002:a17:902:da8f:b0:215:98e7:9b1 with SMTP id d9443c01a7336-219e6ca6e4amr654541915ad.5.1735947254875;
        Fri, 03 Jan 2025 15:34:14 -0800 (PST)
Received: from localhost ([100.107.238.250])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dc9d447fsm242793995ad.128.2025.01.03.15.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 15:34:14 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
To: ukaszb@chromium.org
Cc: abhishekpandit@chromium.org,
	bleung@chromium.org,
	chrome-platform@lists.linux.dev,
	dmitry.baryshkov@linaro.org,
	gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	jthies@google.com,
	linux-usb@vger.kernel.org,
	pholla@chromium.org,
	tzungbi@kernel.org,
	Gwendal Grignou <gwendal@chromium.org>
Subject: [PATCH] driver/platform/chrome: Update cros_ec_trace with new USCI commands
Date: Fri,  3 Jan 2025 15:34:07 -0800
Message-ID: <20250103233407.4001046-1-gwendal@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241231131047.1757434-2-ukaszb@chromium.org>
References: <20241231131047.1757434-2-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add this patch to "platform/chrome: Update ChromeOS EC header for UCSI"
to add the new commands form cros_ec_commands.h in the tracer so that
they are nicely decoded. Enable the tracer with:
cd /sys/kernel/debug/tracing
echo 1 > events/cros_ec/enable
echo 1 > tracing_on
cat trace_pipe

Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 drivers/platform/chrome/cros_ec_trace.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_trace.c b/drivers/platform/chrome/cros_ec_trace.c
index 425e9441b7ca5..ddc6adfb3897a 100644
--- a/drivers/platform/chrome/cros_ec_trace.c
+++ b/drivers/platform/chrome/cros_ec_trace.c
@@ -166,6 +166,8 @@
 	TRACE_SYMBOL(EC_CMD_REGULATOR_IS_ENABLED), \
 	TRACE_SYMBOL(EC_CMD_REGULATOR_SET_VOLTAGE), \
 	TRACE_SYMBOL(EC_CMD_REGULATOR_GET_VOLTAGE), \
+	TRACE_SYMBOL(EC_CMD_UCSI_PPM_SET), \
+	TRACE_SYMBOL(EC_CMD_UCSI_PPM_GET), \
 	TRACE_SYMBOL(EC_CMD_CR51_BASE), \
 	TRACE_SYMBOL(EC_CMD_CR51_LAST), \
 	TRACE_SYMBOL(EC_CMD_FP_PASSTHRU), \
-- 
2.47.1.613.gc27f4b7a9f-goog


