Return-Path: <linux-usb+bounces-37480-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGZ3MwrjBmoGowIAu9opvQ
	(envelope-from <linux-usb+bounces-37480-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:10:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7840A54C171
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8015230A58BA
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585BC42B757;
	Fri, 15 May 2026 09:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="liyPZIAL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C2842B72C
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 09:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835733; cv=none; b=ORxO/CMRunYYcAotv1H97jGiW2SIU4Z6lFDWu++IfCdVNu5AgP/n9H54jSgDKfK3vmNfWrxjrbUN1lsFHtOk2i3F7fNvVE8ZfJWecER4xjxyKxNQoiP3q3d3VkuIcSIZ+ibGFuBIn3+8JlNXFXGeiWECA51ccxLxqQNmJn3VNIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835733; c=relaxed/simple;
	bh=aAFwJQgIt7xDHMJ5j64aG3AQ7uDImuBxz1E2PHKbomw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XFFJ6ccIrR+f+AtJBBd9eOmKLKu+hJd+WFk6kiKJrBShdbar1+VDLTQHedmHwR6uaOaxpAt+kMkByiRjmtuXfRXx1BDWqdoW9oTyLfwLzoAviU0uUNG90QviCIqYi6zprh5QZdZtqzZGMNjXXQWhcTxkSPUerEkyZ8gw/nmyjYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=liyPZIAL; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-365e20fe3b8so5374720a91.3
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 02:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835731; x=1779440531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXZt6qBmARZ13tXsBdYUa2P85z9cDemCtuWb0vwC4yk=;
        b=liyPZIALxM6+z9ZGu5nXZEUgIre9qgeNd9WxG3qRseUNupPzCzh+tPk/eKHRVXJlHd
         1j2ITUUxG+UAMVEnnFt66KZw4NDq+aIjgrVwO3uGt8stuh9cz6LBvbMMFXi9TJxexRNy
         PzUZfQwRC9d2U1vVBxXvikdtfcfu/xMIDAa1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835731; x=1779440531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VXZt6qBmARZ13tXsBdYUa2P85z9cDemCtuWb0vwC4yk=;
        b=PSvrzt33/5qRo7hzcbTUQn184FBGBYln4YNezUPEeXjaQeXyZq8PcchcsUocO0bOdY
         NPdYUQqJnk9Zpyt2cfme7SGRaa6CJuh9COBnD6nHjgKCzZm2X4hjt6PYbo1jlq4vD7I3
         UW7B3/itIeWt6MiTnSyqaB5hu3C+hnPEW5zl1C636g5Dzz3NtXPyQUy2DBE0ZgmIAFav
         qlSpWka2n7LISq6XYzLRuZcFTj/vHtw0Yv7AhjfIxZFZZ9Y5jBpJIVFdJ98uE8zWSwjR
         rme2dgCUXVS+EEyccVEL0GC4UdmhyJaVbanuun2jeU0/Ce9T6V7sR0+KnkmE2jKnJWRg
         kvuA==
X-Forwarded-Encrypted: i=1; AFNElJ/WSVgBzLUSfynoHl6B/kRugSW/dJJxXJoWVxLX3N1vfezRkWzua+Of1/9MmCsiWK6ZTq5GK6A1ghA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZGk12iMAyV8HMeH6kEMrQvLsrMMxKGTa/T4mwwySqRk+3Ql2p
	1dvJyaO7hzQx6i5jbumN8+8vjCsFUa3D+R6WdrxvcGX2WvZXj4Mr1n67JTGqSwknAw==
X-Gm-Gg: Acq92OF75sB+C7WLbSZGRCZb07VNWRuM3oObEN/tgPqoPBhjvUa6Hz+/kmYxcVMf3+v
	Ema9l1qMvhuHFskUlpp6QHyeHaqtTDg1f03nWV4yO4MKIT33adxRcVE9aLXedykSwPku4BOhMvp
	MhRtF3TaE09a+hEx01ZjL08m69bZavA5BhqtfZT4lOD70y4a26kT9D0QqNgQrmWTZ5hyGPKN1i1
	ChZLT8PZJbc3EdmukuZsgixyp9jzoWN9hVh9JBCG9XZM1IHPdigJTus0nFJq9BHObGGK54Ln7RE
	UhD8nB/ZnQkpkFnT93Zi5Iuh3y0O/w/ntEwkqc8VVxrjG6Ujg2H2P+uigdOgHsYCuW4PEia93ej
	Q3Wcl71R9AL7JTLSo6Ljy9rtJ97ZsdokoYL0sCWlxOVTkrkipLMicN4WcqFMzS31XaigeVM16su
	SDPvvmodclLpzx6ezkREhBKeF3NFC3qqxkjbuGYsWyX3Upn+VpCbN3J3MiJEOlT4r/rflQifsOU
	eaJkFwQ
X-Received: by 2002:a17:90b:548b:b0:366:2668:b5b6 with SMTP id 98e67ed59e1d1-36951b9e004mr3400112a91.22.1778835731362;
        Fri, 15 May 2026 02:02:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:10 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 01/12] power: sequencing: Add index parameter for getting power sequencer
Date: Fri, 15 May 2026 17:01:37 +0800
Message-ID: <20260515090149.3169406-2-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7840A54C171
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-37480-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

In some cases more than one sequencer could be associated with a
particular device. For example, a USB hub has multiple downstream ports,
and each port could be connected to a different M.2 E-key slot. In this
case the index would be the port number. The index tells power
sequencers for different slots (connected to different hub ports) apart.

For the consumer API, add a new pwrseq_get_index() for new users. The
original pwrseq_get() now calls pwrseq_get_index() with index = -1.

For the provider API, add the index parameter to the .match function
signature, and tweak all existing providers to match. Actual use of
the new index parameter will be introduced in the next change.

Other than the API change, no functional changes are intended.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/power/sequencing/core.c             | 12 ++++++++----
 drivers/power/sequencing/pwrseq-pcie-m2.c   |  2 +-
 drivers/power/sequencing/pwrseq-qcom-wcn.c  |  6 +++---
 drivers/power/sequencing/pwrseq-thead-gpu.c |  2 +-
 include/linux/pwrseq/consumer.h             |  6 ++++--
 include/linux/pwrseq/provider.h             |  2 +-
 6 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 14335c4f813e..1a91ee6d416f 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -612,6 +612,7 @@ struct pwrseq_match_data {
 	struct pwrseq_desc *desc;
 	struct device *dev;
 	const char *target;
+	int index;
 };
 
 static int pwrseq_match_device(struct device *pwrseq_dev, void *data)
@@ -627,7 +628,7 @@ static int pwrseq_match_device(struct device *pwrseq_dev, void *data)
 	if (!device_is_registered(&pwrseq->dev))
 		return 0;
 
-	ret = pwrseq->match(pwrseq, match_data->dev);
+	ret = pwrseq->match(pwrseq, match_data->dev, match_data->index);
 	if (ret == PWRSEQ_NO_MATCH || ret < 0)
 		return ret;
 
@@ -655,16 +656,18 @@ static int pwrseq_match_device(struct device *pwrseq_dev, void *data)
 }
 
 /**
- * pwrseq_get() - Get the power sequencer associated with this device.
+ * pwrseq_get_index() - Get the power sequencer associated with this device.
  * @dev: Device for which to get the sequencer.
  * @target: Name of the target exposed by the sequencer this device wants to
  *          reach.
+ * @index: Index of the sequencer associated with the device.
  *
  * Returns:
  * New power sequencer descriptor for use by the consumer driver or ERR_PTR()
  * on failure.
  */
-struct pwrseq_desc *pwrseq_get(struct device *dev, const char *target)
+struct pwrseq_desc *pwrseq_get_index(struct device *dev, const char *target,
+				     int index)
 {
 	struct pwrseq_match_data match_data;
 	int ret;
@@ -676,6 +679,7 @@ struct pwrseq_desc *pwrseq_get(struct device *dev, const char *target)
 	match_data.desc = desc;
 	match_data.dev = dev;
 	match_data.target = target;
+	match_data.index = index;
 
 	guard(rwsem_read)(&pwrseq_sem);
 
@@ -689,7 +693,7 @@ struct pwrseq_desc *pwrseq_get(struct device *dev, const char *target)
 
 	return_ptr(desc);
 }
-EXPORT_SYMBOL_GPL(pwrseq_get);
+EXPORT_SYMBOL_GPL(pwrseq_get_index);
 
 /**
  * pwrseq_put() - Release the power sequencer descriptor.
diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index ef69ae268059..16a332f9da7d 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -158,7 +158,7 @@ static const struct pwrseq_pcie_m2_pdata pwrseq_pcie_m2_m_of_data = {
 };
 
 static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
-				 struct device *dev)
+				 struct device *dev, int index)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 	struct device_node *endpoint __free(device_node) = NULL;
diff --git a/drivers/power/sequencing/pwrseq-qcom-wcn.c b/drivers/power/sequencing/pwrseq-qcom-wcn.c
index b55b4317e21b..ac6b34e01c51 100644
--- a/drivers/power/sequencing/pwrseq-qcom-wcn.c
+++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c
@@ -335,7 +335,7 @@ static const char *const pwrseq_wcn3990_vregs[] = {
 };
 
 static int pwrseq_qcom_wcn3990_match(struct pwrseq_device *pwrseq,
-				     struct device *dev);
+				     struct device *dev, int index);
 
 static const struct pwrseq_qcom_wcn_pdata pwrseq_wcn3990_of_data = {
 	.vregs = pwrseq_wcn3990_vregs,
@@ -436,13 +436,13 @@ static int pwrseq_qcom_wcn_match_regulator(struct pwrseq_device *pwrseq,
 }
 
 static int pwrseq_qcom_wcn_match(struct pwrseq_device *pwrseq,
-				 struct device *dev)
+				 struct device *dev, int index)
 {
 	return pwrseq_qcom_wcn_match_regulator(pwrseq, dev, "vddaon-supply");
 }
 
 static int pwrseq_qcom_wcn3990_match(struct pwrseq_device *pwrseq,
-				     struct device *dev)
+				     struct device *dev, int index)
 {
 	int ret;
 
diff --git a/drivers/power/sequencing/pwrseq-thead-gpu.c b/drivers/power/sequencing/pwrseq-thead-gpu.c
index a45318b4b2c1..cb7a6ea66c4b 100644
--- a/drivers/power/sequencing/pwrseq-thead-gpu.c
+++ b/drivers/power/sequencing/pwrseq-thead-gpu.c
@@ -115,7 +115,7 @@ static const struct pwrseq_target_data *pwrseq_thead_gpu_targets[] = {
 };
 
 static int pwrseq_thead_gpu_match(struct pwrseq_device *pwrseq,
-				  struct device *dev)
+				  struct device *dev, int index)
 {
 	struct pwrseq_thead_gpu_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 	static const char *const clk_names[] = { "core", "sys" };
diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index 7d583b4f266e..d5d57cdb0c8e 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -11,10 +11,12 @@
 struct device;
 struct pwrseq_desc;
 
+#define pwrseq_get(dev, target) pwrseq_get_index(dev, target, -1)
+
 #if IS_ENABLED(CONFIG_POWER_SEQUENCING)
 
 struct pwrseq_desc * __must_check
-pwrseq_get(struct device *dev, const char *target);
+pwrseq_get_index(struct device *dev, const char *target, int index);
 void pwrseq_put(struct pwrseq_desc *desc);
 
 struct pwrseq_desc * __must_check
@@ -26,7 +28,7 @@ int pwrseq_power_off(struct pwrseq_desc *desc);
 #else /* CONFIG_POWER_SEQUENCING */
 
 static inline struct pwrseq_desc * __must_check
-pwrseq_get(struct device *dev, const char *target)
+pwrseq_get_index(struct device *dev, const char *target, int index)
 {
 	return ERR_PTR(-ENOSYS);
 }
diff --git a/include/linux/pwrseq/provider.h b/include/linux/pwrseq/provider.h
index 33b3d2c2e39d..a2ec6c612c8b 100644
--- a/include/linux/pwrseq/provider.h
+++ b/include/linux/pwrseq/provider.h
@@ -11,7 +11,7 @@ struct module;
 struct pwrseq_device;
 
 typedef int (*pwrseq_power_state_func)(struct pwrseq_device *);
-typedef int (*pwrseq_match_func)(struct pwrseq_device *, struct device *);
+typedef int (*pwrseq_match_func)(struct pwrseq_device *, struct device *, int);
 
 #define PWRSEQ_NO_MATCH 0
 #define PWRSEQ_MATCH_OK 1
-- 
2.54.0.563.g4f69b47b94-goog


