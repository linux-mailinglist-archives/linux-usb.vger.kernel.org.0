Return-Path: <linux-usb+bounces-6304-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CA485265B
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 02:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C49528B12F
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 01:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926635EE88;
	Tue, 13 Feb 2024 00:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eLv4tN54"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541B35A4E3;
	Tue, 13 Feb 2024 00:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707785710; cv=none; b=KFtlpzp2JKJUaNPk2qq98nT/TSO6e8Nj79SmMAimG9nnmt5N09z/OkV8aCH5/5aDfdlsbPEtwkNCtXPGwnatHsr6cgX/9UOPU4hWcxZ/boj9V2w9eZevFWP4GEY+WpV5H4aeZqYgRNnp/E4c5zYIkPSRGdGxAp3mnntA0vNLzy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707785710; c=relaxed/simple;
	bh=wsGUkyBZclzL2+9+SE74fiQ0D0EfvGGVI1EZE+VZW5A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AP0mWrdd1LyA15bUCF+I4sWlGhwwfW+vGa8MRZmM9+2p9LPok7TMPhfdk7qb8pISyWTl9yiKY2DskdfUzP41UOr8X3eMx6GggTk63NNBfiodprfXeRDYzGECJ3PCP5AdL/N14SiJcXHyAEz9aJ+C82g8RoVPEXTOktAADu58vBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eLv4tN54; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41D0G6Jn031577;
	Tue, 13 Feb 2024 00:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=3cOijoiixp7wjp7+zUCd
	Farig6ypy0C1SI0w7WKRj0Y=; b=eLv4tN54crEkF0eRBpP7xpzACQ6YiNf01ejB
	FOTy2X17FpEj+5c5qk2qkJgjhukHgEbb3Mbwi+eVYpZepH9SVxDnk33lP7XHdlIp
	6aC3CgqC1yhPBbVrrHzeMgHRxyRokeprrDVwI1r2yraHkqe60xID/H9AgqFdZGw5
	5oJTIMwwtMcwB+Wv2NcT1kDUJV/ljnCbnc9Bj1dotY/zzrEvKbeOk+IVJV7X8AIO
	NDw/15Anith3aIKddligYEwIBAuCfSjO2E/gFiZvQntdi359WVLH6jN3enxSu4UI
	eRmT92PZPJ2Qw22yf8SBlsDT+yI7RQ8W0lhHHFub6Aflh2gqCg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w7hew9rvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 00:54:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41D0sjJF031164
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 00:54:45 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 12 Feb 2024 16:54:44 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v15 44/50] ASoC: qcom: qdsp6: Add headphone jack for offload connection status
Date: Mon, 12 Feb 2024 16:54:16 -0800
Message-ID: <20240213005422.3121-45-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240213005422.3121-1-quic_wcheng@quicinc.com>
References: <20240213005422.3121-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1_DN4oLW9AQvWzW40ohXmEeOdBS2W8rR
X-Proofpoint-ORIG-GUID: 1_DN4oLW9AQvWzW40ohXmEeOdBS2W8rR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_20,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 malwarescore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402130005

The headphone jack framework has a well defined infrastructure for
notifying userspace entities through input devices.  Expose a jack device
that carries information about if an offload capable device is connected.
Applications can further identify specific offloading information through
other SND kcontrols.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/common.c      | 19 +++++++++++++++++++
 sound/soc/qcom/common.h      |  3 ++-
 sound/soc/qcom/qdsp6/q6usb.c | 20 ++++++++++++++++++++
 sound/soc/qcom/sm8250.c      | 11 ++++++++++-
 4 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 756706d5b493..c81a52f64ef8 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -5,6 +5,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
 #include <sound/jack.h>
+#include <sound/soc-usb.h>
 #include <linux/input-event-codes.h>
 #include "common.h"
 
@@ -239,4 +240,22 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_wcd_jack_setup);
+
+int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_jack *jack, bool *jack_setup)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+
+	if (cpu_dai->id != USB_RX)
+		return 0;
+
+	if (!*jack_setup)
+		snd_soc_usb_setup_offload_jack(codec_dai->component, jack);
+
+	*jack_setup = true;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_usb_offload_jack_setup);
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index d7f80ee5ae26..fca3046c8674 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -9,5 +9,6 @@
 int qcom_snd_parse_of(struct snd_soc_card *card);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
-
+int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_jack *jack, bool *jack_setup);
 #endif
diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index 84543b34f2b7..f7b0a9f4310e 100644
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
@@ -245,6 +247,9 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 
 	mutex_lock(&data->mutex);
 	if (connected) {
+		if (!data->available_card_slot)
+			snd_jack_report(data->hs_jack->jack, 1);
+
 		/*
 		 * Update the latest USB headset plugged in, if session is
 		 * idle.
@@ -267,12 +272,26 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
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
 
+static int q6usb_component_set_jack(struct snd_soc_component *component,
+			struct snd_soc_jack *jack, void *data)
+{
+	struct q6usb_port_data *priv = dev_get_drvdata(component->dev);
+
+	priv->hs_jack = jack;
+	snd_jack_report(jack->jack, priv->available_card_slot ? 1 : 0);
+
+	return 0;
+}
+
 static int q6usb_component_probe(struct snd_soc_component *component)
 {
 	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
@@ -313,6 +332,7 @@ static void q6usb_component_remove(struct snd_soc_component *component)
 
 static const struct snd_soc_component_driver q6usb_dai_component = {
 	.probe = q6usb_component_probe,
+	.set_jack = q6usb_component_set_jack,
 	.remove = q6usb_component_remove,
 	.name = "q6usb-dai-component",
 	.dapm_widgets = q6usb_dai_widgets,
diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index d70df72c0160..52136897cc92 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -22,14 +22,23 @@ struct sm8250_snd_data {
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
 
-	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+	if (cpu_dai->id == USB_RX)
+		ret = qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
+						&data->usb_offload_jack_setup);
+	else
+		ret = qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+	return ret;
 }
 
 static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,

