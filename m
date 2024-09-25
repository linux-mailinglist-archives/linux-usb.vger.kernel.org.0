Return-Path: <linux-usb+bounces-15402-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1957A98506E
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 03:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF4EE284687
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 01:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22E818C34F;
	Wed, 25 Sep 2024 01:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Vr/BWohy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C826718C03A;
	Wed, 25 Sep 2024 01:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727226105; cv=none; b=IgWQsg9CNooiC6rAw1nYUuJk8bcjrDBwLNrjZWdP6Qw4yV510c/7sUUG7wznUkYNif0WSsbH61IS8VFIOJUYc4Cbmw2U5O+BNnendRhqbId0rS3SLXhuUBXwTMxbKIrp+6SozPL4KvUQrTMRRPwkhJAJBO2EJarCDmHxYCTod9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727226105; c=relaxed/simple;
	bh=ZXPbpHEzwKIgrv8Ky4uyBr9mDKAN3LmnyDxkuOBUr+s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bvUdA3jpY41LbXjC1UbD5MSs9/6MAoGnF6OmO9krQwmYEOUdhyQ3vvurpYNLjJtqJRhwUZ9OXn8uwR/r6zIDorsJjzSpeoSUQtlpUYTiIOZij3VrqPWcpKcOgjClsPZHQC+1cUqy5FMSfWPHEeXtucgKJAqlLMoVGAydQTR/MAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Vr/BWohy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OGxCiW032075;
	Wed, 25 Sep 2024 01:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sppKnQ9mP7I1PHGy+WP4+a8FkaLJq9uw25XgiNX7C7I=; b=Vr/BWohyBaMgz3Fd
	Vk+iL0lx3AMtEU58UeAqxx3a9jo2yvBuCywAvydPhv/mOI6cPQMTzAbttcUpaazG
	kLEiku9bV0awNTXcPwi8WLbuqdGAINNh2iZZc2nbEJma/TkH7MsO0bTFkTT5NgL6
	3RV5rXBo81YZ4wnL3Z7yCwFYFw26rCII/t1+q67km9BFjwKkgrgoyAzxpG1AKgS9
	mPxupTKh2vwnU6lsjidY/HZQl95gF2ax2SnaDBB527MbyhJ1QJscHmKWuku5xyn+
	UskK2M0CoUh3i5bgKkyc7xYixDPOIrx1P/VrJnALy/nIAXJ2y/zdMV87g4oay0TR
	N2wlNw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snfh2kuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 01:00:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48P10IjE006102
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 01:00:18 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 18:00:18 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v28 25/32] ASoC: qcom: qdsp6: Fetch USB offload mapped card and PCM device
Date: Tue, 24 Sep 2024 17:59:53 -0700
Message-ID: <20240925010000.2231406-26-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
References: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UNkx_vwT_hyGtRIpWR0nkaKtf6hJ64J0
X-Proofpoint-GUID: UNkx_vwT_hyGtRIpWR0nkaKtf6hJ64J0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250006

The USB SND path may need to know how the USB offload path is routed, so
that applications can open the proper sound card and PCM device.  The
implementation for the QC ASoC design has a "USB Mixer" kcontrol for each
possible FE (Q6ASM) DAI, which can be utilized to know which front end link
is enabled.

When an application/userspace queries for the mapped offload devices, the
logic will lookup the USB mixer status though the following path:

MultiMedia* <-> MM_DL* <-> USB Mixer*

The "USB Mixer" is a DAPM widget, and the q6routing entity will set the
DAPM connect status accordingly if the USB mixer is enabled.  If enabled,
the Q6USB backend link can fetch the PCM device number from the FE DAI
link (Multimedia*).  With respects to the card number, that is
straightforward, as the ASoC components have direct references to the ASoC
platform sound card.

An example output can be shown below:

Number of controls: 9
name                                    value
Capture Channel Map                     0, 0 (range 0->36)
Playback Channel Map                    0, 0 (range 0->36)
Headset Capture Switch                  On
Headset Capture Volume                  1 (range 0->4)
Sidetone Playback Switch                On
Sidetone Playback Volume                4096 (range 0->8192)
Headset Playback Switch                 On
Headset Playback Volume                 20, 20 (range 0->24)
USB Offload Playback Route PCM#0        0, 1 (range -1->255)

The "USB Offload Playback Route PCM#*" kcontrol will signify the
corresponding card and pcm device it is offload to. (card#0 pcm - device#1)
If the USB SND device supports multiple audio interfaces, then it will
contain several PCM streams, hence in those situations, it is expected
that there will be multiple playback route kcontrols created.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/qdsp6/q6usb.c | 104 +++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index aacbe3bced99..b55e4c457128 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -132,6 +132,109 @@ static int q6usb_audio_ports_of_xlate_dai_name(struct snd_soc_component *compone
 	return ret;
 }
 
+static int q6usb_get_pcm_id_from_widget(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dai *dai;
+
+	for_each_card_rtds(w->dapm->card, rtd) {
+		dai = snd_soc_rtd_to_cpu(rtd, 0);
+		/*
+		 * Only look for playback widget. RTD number carries the assigned
+		 * PCM index.
+		 */
+		if (dai->stream[0].widget == w)
+			return rtd->num;
+	}
+
+	return -1;
+}
+
+static int q6usb_usb_mixer_enabled(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dapm_path *p;
+
+	/* Checks to ensure USB path is enabled/connected */
+	snd_soc_dapm_widget_for_each_sink_path(w, p)
+		if (!strcmp(p->sink->name, "USB Mixer") && p->connect)
+			return 1;
+
+	return 0;
+}
+
+static int q6usb_get_pcm_id(struct snd_soc_component *component)
+{
+	struct snd_soc_dapm_widget *w;
+	struct snd_soc_dapm_path *p;
+	int pidx;
+
+	/*
+	 * Traverse widgets to find corresponding FE widget.  The DAI links are
+	 * built like the following:
+	 *    MultiMedia* <-> MM_DL* <-> USB Mixer*
+	 */
+	for_each_card_widgets(component->card, w) {
+		if (!strncmp(w->name, "MultiMedia", 10)) {
+			/*
+			 * Look up all paths associated with the FE widget to see if
+			 * the USB BE is enabled.  The sink widget is responsible to
+			 * link with the USB mixers.
+			 */
+			snd_soc_dapm_widget_for_each_sink_path(w, p) {
+				if (q6usb_usb_mixer_enabled(p->sink)) {
+					pidx = q6usb_get_pcm_id_from_widget(w);
+					return pidx;
+				}
+			}
+		}
+	}
+
+	return -1;
+}
+
+static int q6usb_update_offload_route(struct snd_soc_component *component, int card,
+				      int pcm, int direction, long *route)
+{
+	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
+	struct snd_soc_usb_device *sdev;
+	int ret = 0;
+	int cidx = -1;
+	int pidx = -1;
+
+	mutex_lock(&data->mutex);
+
+	if (list_empty(&data->devices) ||
+	    direction == SNDRV_PCM_STREAM_CAPTURE) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
+
+	/*
+	 * Will always look for last PCM device discovered/probed as the
+	 * active offload index.
+	 */
+	if (card == sdev->card_idx &&
+	    pcm == sdev->ppcm_idx[sdev->num_playback - 1]) {
+		cidx = component->card->snd_card->number;
+		pidx = q6usb_get_pcm_id(component);
+	}
+
+	if (cidx < 0 || pidx < 0) {
+		cidx = -1;
+		pidx = -1;
+	}
+
+out:
+	route[0] = cidx;
+	route[1] = pidx;
+
+	mutex_unlock(&data->mutex);
+
+	return ret;
+}
+
 static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 				    struct snd_soc_usb_device *sdev, bool connected)
 {
@@ -202,6 +305,7 @@ static int q6usb_component_probe(struct snd_soc_component *component)
 		return -ENOMEM;
 
 	usb->connection_status_cb = q6usb_alsa_connection_cb;
+	usb->update_offload_route_info = q6usb_update_offload_route;
 
 	snd_soc_usb_add_port(usb);
 	data->usb = usb;

