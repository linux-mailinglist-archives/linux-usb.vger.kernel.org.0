Return-Path: <linux-usb+bounces-1403-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C96C7C4638
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 02:23:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47F471C213FC
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 00:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99101A41;
	Wed, 11 Oct 2023 00:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Nkln1NNe"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFF3138A;
	Wed, 11 Oct 2023 00:23:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B71B0;
	Tue, 10 Oct 2023 17:23:10 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39B06Co5031125;
	Wed, 11 Oct 2023 00:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=LBxkFDyqOnh2+G6P+KTcb0gzdJn618PndBANwN/CVtk=;
 b=Nkln1NNe99pQa2qL2zIZl4fwVnAbpXr7DXDbKOCkLUAsLhWvOicMvUPsok9whH9cC6ez
 WYine+Tna1E8swLwEFahGN3Te4sbwMe4hBGzz4q4MfRf/39v6wtfMJBA+0/YkCSeqmWf
 O1tRSkeEoggBm6KVw0N7vegXp8Mz16JNaUK4j5cP33nlqdv5qE7Qc0bvk2m7Haf+UR6F
 MV8suc6cev6CKjbc/BAUXevM1dUwpfgctYhhsBf4Abkz3NRJqkGOTDcBKJTtn+3EviuT
 xjOHxnB9bK37JHRqovJZkPFX4C8gHd8L+25cSJ4Pgi+2GdmEDY/7TItdH0tWErfUGrTW hA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tnfu903qs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 00:22:39 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39B0MdoZ002203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 00:22:39 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 10 Oct 2023 17:22:38 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v8 30/34] ASoC: qcom: qdsp6: Add SND kcontrol for fetching offload status
Date: Tue, 10 Oct 2023 17:21:42 -0700
Message-ID: <20231011002146.1821-31-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231011002146.1821-1-quic_wcheng@quicinc.com>
References: <20231011002146.1821-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: g3o-fSrLCEcxpy-IlzC61Pk66Cr9N7qZ
X-Proofpoint-GUID: g3o-fSrLCEcxpy-IlzC61Pk66Cr9N7qZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_19,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110001
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Add a kcontrol to the platform sound card to fetch the current offload
status.  This can allow for userspace to ensure/check which USB SND
resources are actually busy versus having to attempt opening the USB SND
devices, which will result in an error if offloading is active.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/qdsp6/q6usb.c | 104 ++++++++++++++++++++++++++++++++++-
 1 file changed, 101 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index a95276b7d91d..d2f60ce66cf3 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -30,6 +30,8 @@ struct q6usb_status {
 	unsigned int num_pcm;
 	unsigned int chip_index;
 	unsigned int pcm_index;
+	bool prepared;
+	bool running;
 };
 
 struct q6usb_port_data {
@@ -52,6 +54,17 @@ static const struct snd_soc_dapm_route q6usb_dapm_routes[] = {
 	{"USB Playback", NULL, "USB_RX_BE"},
 };
 
+static int q6usb_find_running(struct q6usb_port_data *data)
+{
+	int i;
+
+	for (i = 0; i < SNDRV_CARDS; i++) {
+		if (data->status[i].running)
+			return i;
+	}
+	return -ENODEV;
+}
+
 static int q6usb_hw_params(struct snd_pcm_substream *substream,
 			   struct snd_pcm_hw_params *params,
 			   struct snd_soc_dai *dai)
@@ -81,14 +94,40 @@ static int q6usb_hw_params(struct snd_pcm_substream *substream,
 		goto out;
 
 	data->status[data->sel_card_idx].pcm_index = data->sel_pcm_idx;
+	data->status[data->sel_card_idx].prepared = true;
 out:
 	mutex_unlock(&data->mutex);
 
 	return ret;
 }
 
+static int q6usb_prepare(struct snd_pcm_substream *substream,
+		struct snd_soc_dai *dai)
+{
+	struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
+
+	mutex_lock(&data->mutex);
+	data->status[data->sel_card_idx].running = true;
+	mutex_unlock(&data->mutex);
+
+	return 0;
+}
+
+static void q6usb_shutdown(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
+
+	mutex_lock(&data->mutex);
+	data->status[data->sel_card_idx].running = false;
+	data->status[data->sel_card_idx].prepared = false;
+	mutex_unlock(&data->mutex);
+}
+
 static const struct snd_soc_dai_ops q6usb_ops = {
 	.hw_params = q6usb_hw_params,
+	.prepare = q6usb_prepare,
+	.shutdown = q6usb_shutdown,
 };
 
 static struct snd_soc_dai_driver q6usb_be_dais[] = {
@@ -148,10 +187,15 @@ static int q6usb_put_offload_dev(struct snd_kcontrol *kcontrol,
 	int pcmidx;
 	int cardidx;
 
+	mutex_lock(&data->mutex);
+
+	/* Don't allow changes to the offloading devices if session is busy */
+	if (data->sel_card_idx >= 0 && data->status[data->sel_card_idx].prepared)
+		goto out;
+
 	cardidx = ucontrol->value.integer.value[0];
 	pcmidx = ucontrol->value.integer.value[1];
 
-	mutex_lock(&data->mutex);
 	if ((cardidx >= 0 && test_bit(cardidx, &data->available_card_slot))) {
 		data->sel_card_idx = cardidx;
 		changed = 1;
@@ -162,6 +206,8 @@ static int q6usb_put_offload_dev(struct snd_kcontrol *kcontrol,
 		data->idx_valid = true;
 		changed = 1;
 	}
+
+out:
 	mutex_unlock(&data->mutex);
 
 	return changed;
@@ -187,11 +233,59 @@ static const struct snd_kcontrol_new q6usb_offload_dev_ctrl = {
 	.put = q6usb_put_offload_dev,
 };
 
+static int q6usb_mixer_get_offload_status(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
+	int running;
+	int card_idx;
+	int pcm_idx;
+
+	running = q6usb_find_running(data);
+	if (running < 0) {
+		card_idx = -1;
+		pcm_idx = -1;
+	} else {
+		card_idx = running;
+		pcm_idx = data->status[running].pcm_index;
+	}
+
+	ucontrol->value.integer.value[0] = card_idx;
+	ucontrol->value.integer.value[1] = pcm_idx;
+	return 0;
+}
+
+static int q6usb_offload_ctl_info(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 2;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = SNDRV_CARDS;
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new q6usb_offload_control = {
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.access = SNDRV_CTL_ELEM_ACCESS_READ,
+	.name = "Q6USB offload status",
+	.info = q6usb_offload_ctl_info,
+	.get = q6usb_mixer_get_offload_status,
+	.put = NULL,
+};
+
 /* Build a mixer control for a UAC connector control (jack-detect) */
 static void q6usb_connector_control_init(struct snd_soc_component *component)
 {
 	int ret;
 
+	ret = snd_ctl_add(component->card->snd_card,
+				snd_ctl_new1(&q6usb_offload_control, component));
+	if (ret < 0)
+		return;
+
 	ret = snd_ctl_add(component->card->snd_card,
 				snd_ctl_new1(&q6usb_offload_dev_ctrl, component));
 	if (ret < 0)
@@ -229,8 +323,12 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 
 	mutex_lock(&data->mutex);
 	if (connected) {
-		/* We only track the latest USB headset plugged in */
-		if (!data->idx_valid || data->sel_card_idx < 0)
+		/*
+		 * Update the latest USB headset plugged in, if session is
+		 * idle.
+		 */
+		if ((!data->idx_valid || data->sel_card_idx < 0) &&
+			!data->status[data->sel_card_idx].prepared)
 			data->sel_card_idx = sdev->card_idx;
 
 		set_bit(sdev->card_idx, &data->available_card_slot);

