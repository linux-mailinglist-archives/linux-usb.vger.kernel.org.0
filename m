Return-Path: <linux-usb+bounces-10087-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DE68BED14
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2024 21:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B912281643
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2024 19:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E631C2332;
	Tue,  7 May 2024 19:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d537swkr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C9418131D;
	Tue,  7 May 2024 19:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715111519; cv=none; b=Jn2hhU6gUX+aBKdc9qdEPUIBky/KCeIZbMMvesaY+SA9AfMXwbdLSBmgxJBi53ZNLsgtP5BqhTnTrz4jnBuneSidDFEr0P5fJhNKkj0nQbljRe/DCbjq3b1n7eElqQcnt7z2FO2ClAw3bmgLPIQfSiRMqz8DeEIeJi6efrEcW2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715111519; c=relaxed/simple;
	bh=j8uqa323X0SWZFrf1/F1dffZ7+8TjdozIx6/9lKjbsU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aa8CKNdnH5MYvFZOmEUTaaA657zCBavvQDKqBdUlOUfI/g3LcDFxaBjtZqnZzW95C2ucAn+Jryp2LjqwnI/hZeAYux12+5XKm/yGOs12heTLt1VYu5M1DLzXWJLUzIDjTNemHl6wbs1bD/rCGa7VESj2lnqZXXh3sWx8PBYPlzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d537swkr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 447Jc9ST032382;
	Tue, 7 May 2024 19:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=cn3lRU7DeUAVTe7MB3CW
	dDx1hLNU6DOE38BsCG0hsSs=; b=d537swkroMLTBOjXZ4pdVDw0mGdusZzF5Pb7
	1mIc79qGmcQCqYKPafXRA9BGTWQtZNuzMEbZucq9B7CAyR1PRMPHai/OCLDvzEnO
	ZletPXc9+wMxydbzyjeeiqrjh2Ai09AqEKUM2hbhmC5mpkOjqrweZTZ40erTO87s
	atCa40qogT7QX3xQxTG+6mgMbmbQAvZECQAG3b6bQ4nOdD4CZroePhL4/XMNqk5K
	DyN9eAc4s53wQh+dlLpe6KnjRWATvNylkU0WY4wGF1y+1/8s2ixVqHRyKC2hC8Mk
	MnyL6pclaGrlWEaqXoWpdIzS/JkcZ6JwQFCk8iypNMq9TD4p1w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xyspr04fj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 19:51:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 447JpaQB008962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 19:51:36 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 May 2024 12:51:36 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <bagasdotme@gmail.com>, <robh@kernel.org>, <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v21 32/39] ASoC: qcom: qdsp6: Add headphone jack for offload connection status
Date: Tue, 7 May 2024 12:51:09 -0700
Message-ID: <20240507195116.9464-33-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240507195116.9464-1-quic_wcheng@quicinc.com>
References: <20240507195116.9464-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IaZFSs4nX3HqxWh-RcIGUYdjFGel6wXW
X-Proofpoint-GUID: IaZFSs4nX3HqxWh-RcIGUYdjFGel6wXW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_12,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405070138

The headphone jack framework has a well defined infrastructure for
notifying userspace entities through input devices.  Expose a jack device
that carries information about if an offload capable device is connected.
Applications can further identify specific offloading information through
other SND kcontrols.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/Kconfig             |  5 +++
 sound/soc/qcom/Makefile            |  2 ++
 sound/soc/qcom/qdsp6/q6usb.c       | 40 ++++++++++++++++++++++
 sound/soc/qcom/sm8250.c            | 23 ++++++++++++-
 sound/soc/qcom/usb_offload_utils.c | 55 ++++++++++++++++++++++++++++++
 sound/soc/qcom/usb_offload_utils.h | 29 ++++++++++++++++
 6 files changed, 153 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/qcom/usb_offload_utils.c
 create mode 100644 sound/soc/qcom/usb_offload_utils.h

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index a1beafe2b1dd..e5284a93cf9a 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -118,9 +118,14 @@ config SND_SOC_QDSP6_PRM
 	tristate
 	select SND_SOC_QDSP6_PRM_LPASS_CLOCKS
 
+config SND_SOC_QCOM_OFFLOAD_UTILS
+	tristate
+
 config SND_SOC_QDSP6_USB
     tristate "SoC ALSA USB offloading backing for QDSP6"
     depends on SND_SOC_USB
+    select SND_SOC_QCOM_OFFLOAD_UTILS
+
     help
       Adds support for USB offloading for QDSP6 ASoC
       based platform sound cards.  This will enable the
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 34f3fcb8ee9a..001c287df777 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -30,6 +30,7 @@ snd-soc-sc8280xp-objs := sc8280xp.o
 snd-soc-qcom-common-objs := common.o
 snd-soc-qcom-sdw-objs := sdw.o
 snd-soc-x1e80100-objs := x1e80100.o
+snd-soc-qcom-offload-utils-objs := usb_offload_utils.o
 
 obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
 obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
@@ -42,6 +43,7 @@ obj-$(CONFIG_SND_SOC_SM8250) += snd-soc-sm8250.o
 obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
 obj-$(CONFIG_SND_SOC_QCOM_SDW) += snd-soc-qcom-sdw.o
 obj-$(CONFIG_SND_SOC_X1E80100) += snd-soc-x1e80100.o
+obj-$(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS) += snd-soc-qcom-offload-utils.o
 
 #DSP lib
 obj-$(CONFIG_SND_SOC_QDSP6) += qdsp6/
diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index 394b20b6de82..ba988b47ffd5 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 
 #include <sound/asound.h>
+#include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/q6usboffload.h>
@@ -38,6 +39,7 @@ struct q6usb_status {
 struct q6usb_port_data {
 	struct q6afe_usb_cfg usb_cfg;
 	struct snd_soc_usb *usb;
+	struct snd_soc_jack *hs_jack;
 	struct q6usb_offload priv;
 	struct mutex mutex;
 	unsigned long available_card_slot;
@@ -252,6 +254,9 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 
 	mutex_lock(&data->mutex);
 	if (connected) {
+		if (!data->available_card_slot)
+			snd_jack_report(data->hs_jack->jack, 1);
+
 		/*
 		 * Update the latest USB headset plugged in, if session is
 		 * idle.
@@ -274,11 +279,45 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 					ffs(data->available_card_slot) - 1 : 0;
 			data->sel_pcm_idx = 0;
 		}
+
+		if (!data->available_card_slot)
+			snd_jack_report(data->hs_jack->jack, 0);
 	}
 	mutex_unlock(&data->mutex);
 
 	return 0;
 }
+static void q6usb_component_disable_jack(struct q6usb_port_data *data)
+{
+	/* Offload jack has already been disabled */
+	if (!data->hs_jack)
+		return;
+
+	snd_jack_report(data->hs_jack->jack, 0);
+	data->hs_jack = NULL;
+}
+
+static void q6usb_component_enable_jack(struct q6usb_port_data *data,
+				struct snd_soc_jack *jack)
+{
+	snd_jack_report(jack->jack, data->available_card_slot ? 1 : 0);
+	data->hs_jack = jack;
+}
+
+static int q6usb_component_set_jack(struct snd_soc_component *component,
+			struct snd_soc_jack *jack, void *priv)
+{
+	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
+
+	mutex_lock(&data->mutex);
+	if (jack)
+		q6usb_component_enable_jack(data, jack);
+	else
+		q6usb_component_disable_jack(data);
+	mutex_unlock(&data->mutex);
+
+	return 0;
+}
 
 static int q6usb_component_probe(struct snd_soc_component *component)
 {
@@ -320,6 +359,7 @@ static void q6usb_component_remove(struct snd_soc_component *component)
 
 static const struct snd_soc_component_driver q6usb_dai_component = {
 	.probe = q6usb_component_probe,
+	.set_jack = q6usb_component_set_jack,
 	.remove = q6usb_component_remove,
 	.name = "q6usb-dai-component",
 	.dapm_widgets = q6usb_dai_widgets,
diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index d70df72c0160..6f156c94de01 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -12,6 +12,7 @@
 #include <linux/input-event-codes.h>
 #include "qdsp6/q6afe.h"
 #include "common.h"
+#include "usb_offload_utils.h"
 #include "sdw.h"
 
 #define DRIVER_NAME		"sm8250"
@@ -22,14 +23,33 @@ struct sm8250_snd_data {
 	struct snd_soc_card *card;
 	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
 	struct snd_soc_jack jack;
+	struct snd_soc_jack usb_offload_jack;
+	bool usb_offload_jack_setup;
 	bool jack_setup;
 };
 
 static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int ret;
+
+	if (cpu_dai->id == USB_RX)
+		ret = qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
+						&data->usb_offload_jack_setup);
+	else
+		ret = qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+	return ret;
+}
+
+static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+
+	if (cpu_dai->id == USB_RX)
+		qcom_snd_usb_offload_jack_remove(rtd, &data->usb_offload_jack_setup);
 
-	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
 static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
@@ -129,6 +149,7 @@ static void sm8250_add_be_ops(struct snd_soc_card *card)
 	for_each_card_prelinks(card, i, link) {
 		if (link->no_pcm == 1) {
 			link->init = sm8250_snd_init;
+			link->exit = sm8250_snd_exit;
 			link->be_hw_params_fixup = sm8250_be_hw_params_fixup;
 			link->ops = &sm8250_be_ops;
 		}
diff --git a/sound/soc/qcom/usb_offload_utils.c b/sound/soc/qcom/usb_offload_utils.c
new file mode 100644
index 000000000000..a84394a9b772
--- /dev/null
+++ b/sound/soc/qcom/usb_offload_utils.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <linux/module.h>
+#include <sound/jack.h>
+#include <sound/soc-usb.h>
+
+#include "usb_offload_utils.h"
+
+int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_jack *jack, bool *jack_setup)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	int ret = 0;
+
+	if (cpu_dai->id != USB_RX)
+		return -EINVAL;
+
+	if (!*jack_setup) {
+		ret = snd_soc_usb_setup_offload_jack(codec_dai->component, jack);
+		if (ret)
+			return ret;
+	}
+
+	*jack_setup = true;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_usb_offload_jack_setup);
+
+int qcom_snd_usb_offload_jack_remove(struct snd_soc_pcm_runtime *rtd,
+					bool *jack_setup)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	int ret = 0;
+
+	if (cpu_dai->id != USB_RX)
+		return -EINVAL;
+
+	if (*jack_setup) {
+		ret = snd_soc_usb_disable_offload_jack(codec_dai->component);
+		if (ret)
+			return ret;
+	}
+
+	*jack_setup = false;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_usb_offload_jack_remove);
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/usb_offload_utils.h b/sound/soc/qcom/usb_offload_utils.h
new file mode 100644
index 000000000000..d44f78569b47
--- /dev/null
+++ b/sound/soc/qcom/usb_offload_utils.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#ifndef __QCOM_SND_USB_OFFLOAD_UTILS_H__
+#define __QCOM_SND_USB_OFFLOAD_UTILS_H__
+
+#include <sound/soc.h>
+
+#if IS_ENABLED(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS)
+int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_jack *jack, bool *jack_setup);
+
+int qcom_snd_usb_offload_jack_remove(struct snd_soc_pcm_runtime *rtd,
+					bool *jack_setup);
+#else
+static inline int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_jack *jack, bool *jack_setup)
+{
+	return -ENODEV;
+}
+
+static inline int qcom_snd_usb_offload_jack_remove(struct snd_soc_pcm_runtime *rtd,
+							bool *jack_setup)
+{
+	return -ENODEV;
+}
+#endif /* IS_ENABLED(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS) */
+#endif /* __QCOM_SND_USB_OFFLOAD_UTILS_H__ */

