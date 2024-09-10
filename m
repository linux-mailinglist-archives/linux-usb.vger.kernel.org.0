Return-Path: <linux-usb+bounces-14890-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 147DE97324B
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 12:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBF83289B6C
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 10:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8620E1552FD;
	Tue, 10 Sep 2024 10:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ix/COoD0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8C31917C6
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725963341; cv=none; b=HZF6mKDRuj1Pp6JhP4Hb0NkdPuCEKhdV6Fiq+e+z9YGll+OSi6AgZrTicHpZBmPiMMUwyHkA6znd6inU5GXD7ye+VX905QhDuTJnmutI0+FPwaF1JVuz+Hjkjp6SajzcpPR0yejJN4LaiseWZy0ECQ3fyB/BpNYGMuwkMKhEzP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725963341; c=relaxed/simple;
	bh=+8hk+kJmR2SsDvw10WpS8DsYjndB+0n7l87NsIhLzJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=URjv+6Mddqp8VBSjZHAln0SSwDZ5cFViBmgMQ8DLVDxlbpvFfhRVyR8fxMVbEWp8Cv+AxaBicNV0qXPb+ZZH5+0Y/XGva45XAR2bLeC2niOC8BVRH/F24ePRjTSAxVdyZO79aZyX/uFu9wMZ2sRSKNL0xG57pMRKsy53bzM3MTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ix/COoD0; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a8a837cec81so244027466b.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 03:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725963338; x=1726568138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83DCmEuq7JrWTmbULmBpjHQMPEO/K0lZCYAd0BrN8Kc=;
        b=Ix/COoD0Rqg4/KMfMJ3VpNZyCT2MR9Ltu1xFXYXBPp98oe5MzJFAIRPPzNNtpKrHs5
         iz6rkfx0F6/QKCV7Id4x40w41wPaFrx8nhVUq1dpFNpaBSTs64DibouEO47WsmsA58jZ
         r9R2D9jdmTflW95rwvzLr3gE2U9LcyWYzLPvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725963338; x=1726568138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83DCmEuq7JrWTmbULmBpjHQMPEO/K0lZCYAd0BrN8Kc=;
        b=pZPMT+Ax6F7gL2xnBhTkiFEKOFwwPhgu+UJU6Ip1WZgAPDlgA2SAcLAVk6eJihIRtD
         bo08Mjp/I0NnyboC+NYyiXhizt8bmB9SnvKfTcoXTet7CCLYPz5wM5lO0mJTN1lgh5gE
         SZfQf3Lb/qPCWcFzVtCrbBZWp4Lh8Nn/6ClZfABOPN+RRgxvaAF0+LogRPsKxhb13MKj
         uK4+Z+rYp9IxbCpgMEruULuXwjO3Cf2wZOAwQaHYzeao/6WWHKrvfQi6BDOiV1Q1Wpu4
         VTPSuMlEcA7cqO9cOy9qFHMo/moEh1rb6fcc1wZuseOjRjr+pH/Atcevp7/0a6g3BNEo
         kv0w==
X-Forwarded-Encrypted: i=1; AJvYcCUiVPg3EtCP7T6OnYl0xQFBYahGVbEQaugMabS8N18biR2Xn9zdNT3gr3dMGgoID18fih0AyTfaFLU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH++V8rWcfVLyLONUpj0lqhMh2olX45owWH3RadBTK5tNMNg0X
	/+8NFCYnWVA/bh3K5dXJgRfCWIlaIE9tafpD1MW3xbdw8g+RouCxeMLLBHQR
X-Google-Smtp-Source: AGHT+IHE4rrZXnsK6QRB1ACp9FxoMImuTXf20860U02c9qcu6cfe7aWIFZs39uplA7VdzTCrQ45ZPg==
X-Received: by 2002:a05:6402:360a:b0:5c2:6a73:d13b with SMTP id 4fb4d7f45d1cf-5c3dc7c02d8mr12419030a12.34.1725963336780;
        Tue, 10 Sep 2024 03:15:36 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd424f0sm4075401a12.7.2024.09.10.03.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 03:15:36 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v6 2/8] platform/chrome: Update EC feature flags
Date: Tue, 10 Sep 2024 10:15:21 +0000
Message-ID: <20240910101527.603452-3-ukaszb@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240910101527.603452-1-ukaszb@chromium.org>
References: <20240910101527.603452-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pavan Holla <pholla@chromium.org>

Define EC_FEATURE_UCSI_PPM to enable usage of the cros_ec_ucsi
driver. Also, add any feature flags that are implemented by the EC
but are missing in the kernel header.

Signed-off-by: Pavan Holla <pholla@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 .../linux/platform_data/cros_ec_commands.h    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 8dbb6a769e4f..ecf290a0c98f 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -1312,6 +1312,38 @@ enum ec_feature_code {
 	 * The EC supports the AP composing VDMs for us to send.
 	 */
 	EC_FEATURE_TYPEC_AP_VDM_SEND = 46,
+	/*
+	 * The EC supports system safe mode panic recovery.
+	 */
+	EC_FEATURE_SYSTEM_SAFE_MODE = 47,
+	/*
+	 * The EC will reboot on runtime assertion failures.
+	 */
+	EC_FEATURE_ASSERT_REBOOTS = 48,
+	/*
+	 * The EC image is built with tokenized logging enabled.
+	 */
+	EC_FEATURE_TOKENIZED_LOGGING = 49,
+	/*
+	 * The EC supports triggering an STB dump.
+	 */
+	EC_FEATURE_AMD_STB_DUMP = 50,
+	/*
+	 * The EC supports memory dump commands.
+	 */
+	EC_FEATURE_MEMORY_DUMP = 51,
+	/*
+	 * The EC supports DP2.1 capability
+	 */
+	EC_FEATURE_TYPEC_DP2_1 = 52,
+	/*
+	 * The MCU is System Companion Processor Core 1
+	 */
+	EC_FEATURE_SCP_C1 = 53,
+	/*
+	 * The EC supports UCSI PPM.
+	 */
+	EC_FEATURE_UCSI_PPM = 54,
 };
 
 #define EC_FEATURE_MASK_0(event_code) BIT(event_code % 32)
-- 
2.46.0.598.g6f2099f65c-goog


