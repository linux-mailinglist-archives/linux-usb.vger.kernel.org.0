Return-Path: <linux-usb+bounces-11117-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4FB902D4C
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 02:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3DA01F220F7
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 00:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C0715B56C;
	Mon, 10 Jun 2024 23:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B2DWNH4W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59486158D69;
	Mon, 10 Jun 2024 23:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718063932; cv=none; b=hm1Xfd5/1Cz/OmukdOSxqe7mMIrTKPerSQXsXDOiGOulNFjrJq6z2as7qgBvFoyE3PxBNuJcQt2pt0TXTh0qf4x/4W+Hfm9wcv7IUD4vJxtfkQKk2tNbHvZ2Po7ru0sB5IF5fbGCiqmj4ocqPUsSz2kdXoHGoB7Vw8X1BvHQ6A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718063932; c=relaxed/simple;
	bh=eMS1NYlWBx4Xr+jDx9r6ZlaT5PUaCkyEkKtgaXZKm/U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t9QthCEBWBO7HSBV42jPrBZztZKl0BWh1EU4zXH/vzXQA3Rci17JUPgmqhQpTmOD3zAZgq/o5Nu4qiRI2V4/ZTZV9YcB6pYy5OkqdN+EK7S9oxNyI3NSdfwgmKlr3ZaTbl8Hzba0rd9C6xk7hZnjTWb9DdVsWypYa4kpNu+NUF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B2DWNH4W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45AE3tIq029643;
	Mon, 10 Jun 2024 23:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IXJO7yXzSLsMU/g4w222/gEb
	HXiu6OkBLpbLYr8D3Hs=; b=B2DWNH4WYg4ULJDJlQx3y3rrI0i3SUdgOmYn06nT
	4AzmaZ02VMVdBF7RAr/6imFs8ZASpv0QWEhPASU1A3A4/n1HoVowuEBrEzEHNDgq
	B+LRXSapXGsTNgG/0yMMwRNfeQuWNBK4um8j0Zfbg37hCSD6elDDUI9g8qyZeQ1m
	ox9IAAK+DHWNu3Ld948zAXPaPtYZvdFQuqbvVQylJ4N3NAGejbgBvwWsoJej7+vp
	F9xoB0LiZglnAn9fWw6tECqbdAvp+7O7u0nS0EK12xmIGBAO92YPnhureseogcbe
	Bw4f6Bv3OBFUG+GNlTykH08qwcBDcgzY9wC1IxP2znAR5w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymgk8w0ga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 23:58:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45ANwPrr001526
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 23:58:25 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Jun 2024 16:58:25 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <robh@kernel.org>, <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v23 23/32] ASoC: Introduce SND kcontrols to track USB offloading state
Date: Mon, 10 Jun 2024 16:57:59 -0700
Message-ID: <20240610235808.22173-24-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240610235808.22173-1-quic_wcheng@quicinc.com>
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: SxRtTX52gQLQPXXw9eQ6395FhIt_VetD
X-Proofpoint-ORIG-GUID: SxRtTX52gQLQPXXw9eQ6395FhIt_VetD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_07,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100177

Expose helpers in the SoC USB layer so components can update and keep track
of the offloading sessions.  This exposes a kcontrol to userspace, so that
applications can be aware of what the current USB offloading status is.
An example output using tinymix is:

USB offloading idle:
tinymix -D 0 get 'USB Offload Playback Route Card Status'
-->-1 (range -1->32)
tinymix -D 0 get 'USB Offload Playback Route PCM Status'
-->-1 (range -1->255)

USB offloading active(USB card#1 pcm#0):
tinymix -D 0 get 'USB Offload Playback Route Card Status'
-->1 (range -1->32)
tinymix -D 0 get 'USB Offload Playback Route PCM Status'
-->0 (range -1->255)

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h |  46 ++++++++++
 sound/soc/soc-usb.c     | 193 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 239 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index 495de5143db8..c5aecdd0b006 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -9,9 +9,29 @@
 enum snd_soc_usb_kctl {
 	SND_SOC_USB_KCTL_CARD_ROUTE,
 	SND_SOC_USB_KCTL_PCM_ROUTE,
+	SND_SOC_USB_KCTL_CARD_STATUS,
+	SND_SOC_USB_KCTL_PCM_STATUS,
 	SND_SOC_USB_KCTL_MAX,
 };
 
+enum snd_soc_usb_dai_state {
+	SND_SOC_USB_IDLE,
+	SND_SOC_USB_PREPARED,
+	SND_SOC_USB_RUNNING,
+};
+
+/**
+ * struct snd_soc_usb_session
+ * @active_card_idx - active offloaded sound card
+ * @active_pcm_idx - active offloaded PCM device
+ * @state - USB BE DAI link PCM state
+ */
+struct snd_soc_usb_session {
+	int active_card_idx;
+	int active_pcm_idx;
+	enum snd_soc_usb_dai_state state;
+};
+
 /**
  * struct snd_soc_usb_device
  * @card_idx - sound card index associated with USB device
@@ -31,6 +51,7 @@ struct snd_soc_usb_device {
  * @list - list head for SND SOC struct list
  * @component - reference to ASoC component
  * @kctl - list of kcontrols created
+ * @active_list - active sessions
  * @num_supported_streams - number of supported concurrent sessions
  * @connection_status_cb - callback to notify connection events
  * @put_offload_dev - callback to select USB sound card/PCM device
@@ -41,6 +62,7 @@ struct snd_soc_usb {
 	struct list_head list;
 	struct snd_soc_component *component;
 	struct snd_kcontrol *kctl[SND_SOC_USB_KCTL_MAX];
+	struct snd_soc_usb_session *active_list;
 	unsigned int num_supported_streams;
 	int (*connection_status_cb)(struct snd_soc_usb *usb,
 			struct snd_soc_usb_device *sdev, bool connected);
@@ -62,6 +84,11 @@ int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 void *snd_soc_usb_find_priv_data(struct device *dev);
 
+int snd_soc_usb_prepare_session(struct snd_soc_usb *usb, int card_idx, int pcm_idx);
+int snd_soc_usb_shutdown_session(struct snd_soc_usb *usb, int session_id);
+int snd_soc_usb_set_session_state(struct snd_soc_usb *usb, int session_id,
+				  enum snd_soc_usb_dai_state state);
+
 struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
 					      int num_streams, void *data);
 void snd_soc_usb_free_port(struct snd_soc_usb *usb);
@@ -97,6 +124,25 @@ static inline void *snd_soc_usb_find_priv_data(struct device *dev)
 	return NULL;
 }
 
+static inline int snd_soc_usb_prepare_session(struct snd_soc_usb *usb, int card_idx,
+						int pcm_idx)
+{
+	return -EINVAL;
+}
+
+static inline int snd_soc_usb_shutdown_session(struct snd_soc_usb *usb,
+						int session_id)
+{
+	return -EINVAL;
+}
+
+static inline int snd_soc_usb_set_session_state(struct snd_soc_usb *usb,
+						int session_id,
+						enum snd_soc_usb_dai_state state)
+{
+	return -EINVAL;
+}
+
 static inline struct snd_soc_usb *snd_soc_usb_allocate_port(
 					      struct snd_soc_component *component,
 					      int num_streams, void *data)
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index ef84957014dd..faacae8a6a5c 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -61,6 +61,79 @@ static struct snd_soc_usb *snd_soc_find_usb_ctx(struct device *dev)
 }
 
 /* SOC USB sound kcontrols */
+static int snd_soc_usb_get_offload_card_status(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_usb_ctx_lookup(component->dev->of_node);
+	int control_idx = 0;
+	int card_idx;
+	int i;
+
+	for (i = 0; i < ctx->num_supported_streams; i++) {
+		card_idx = -1;
+
+		if (ctx->active_list[i].state == SND_SOC_USB_RUNNING)
+			card_idx = ctx->active_list[i].active_card_idx;
+
+		ucontrol->value.integer.value[control_idx] = card_idx;
+		control_idx++;
+	}
+
+	return 0;
+}
+
+static int snd_soc_usb_offload_card_status_info(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_info *uinfo)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_usb_ctx_lookup(component->dev->of_node);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = ctx->num_supported_streams;
+	uinfo->value.integer.min = -1;
+	uinfo->value.integer.max = SNDRV_CARDS;
+
+	return 0;
+}
+
+static int snd_soc_usb_get_offload_pcm_status(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_usb_ctx_lookup(component->dev->of_node);
+	int control_idx = 0;
+	int pcm_idx;
+	int i;
+
+	for (i = 0; i < ctx->num_supported_streams; i++) {
+		pcm_idx = -1;
+
+		if (ctx->active_list[i].state == SND_SOC_USB_RUNNING)
+			pcm_idx = ctx->active_list[i].active_pcm_idx;
+
+		ucontrol->value.integer.value[control_idx] = pcm_idx;
+		control_idx++;
+	}
+
+	return 0;
+}
+
+static int snd_soc_usb_offload_pcm_status_info(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_info *uinfo)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_usb_ctx_lookup(component->dev->of_node);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = ctx->num_supported_streams;
+	uinfo->value.integer.min = -1;
+	/* Arbitrary max value, as there is no 'limit' on number of PCM devices */
+	uinfo->value.integer.max = 0xff;
+
+	return 0;
+}
+
 static int soc_usb_put_offload_pcm_dev(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
@@ -181,6 +254,22 @@ static const struct snd_kcontrol_new soc_usb_kcontrols[] = {
 		.get = soc_usb_get_offload_pcm_dev,
 		.put = soc_usb_put_offload_pcm_dev,
 	},
+	[SND_SOC_USB_KCTL_CARD_STATUS] = {
+		.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.name = "USB Offload Playback Route Card Status",
+		.info = snd_soc_usb_offload_card_status_info,
+		.get = snd_soc_usb_get_offload_card_status,
+		.put = NULL,
+	},
+	[SND_SOC_USB_KCTL_PCM_STATUS] = {
+		.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.name = "USB Offload Playback Route PCM Status",
+		.info = snd_soc_usb_offload_pcm_status_info,
+		.get = snd_soc_usb_get_offload_pcm_status,
+		.put = NULL,
+	},
 };
 
 static int snd_soc_usb_control_remove(struct snd_soc_usb *usb)
@@ -216,6 +305,102 @@ static int snd_soc_usb_control_init(struct snd_soc_usb *usb)
 	return ret;
 }
 
+/**
+ * snd_soc_usb_set_session_state() - Set the session state for a session
+ * @usb: SOC USB device
+ * @session_id: index to active_list
+ * @state: USB PCM device index
+ *
+ * Set the session state for an entry in active_list.  This should be only
+ * called after snd_soc_usb_prepare_session.
+ *
+ * Returns 0 on success, negative on error.
+ *
+ */
+int snd_soc_usb_set_session_state(struct snd_soc_usb *usb, int session_id,
+				  enum snd_soc_usb_dai_state state)
+{
+	if (session_id < 0 || session_id >= usb->num_supported_streams)
+		return -EINVAL;
+
+	mutex_lock(&ctx_mutex);
+	if (usb->active_list[session_id].state == state) {
+		mutex_unlock(&ctx_mutex);
+		return 0;
+	}
+
+	usb->active_list[session_id].state = state;
+	mutex_unlock(&ctx_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_set_session_state);
+
+/**
+ * snd_soc_usb_prepare_session() - Find and prepare a session
+ * @usb: SOC USB device
+ * @card_idx: USB card index
+ * @pcm_idx: USB PCM device index
+ *
+ * Find an open active session slot on the SOC USB device.  If all slots
+ * are busy, return an error.  If not, claim the slot and place it into
+ * the SND_SOC_USB_PREPARED state.  This should be called first before
+ * calling snd_soc_usb_set_session_state or snd_soc_usb_shutdown_session.
+ *
+ * Returns the session id (index) to active_list, negative on error.
+ *
+ */
+int snd_soc_usb_prepare_session(struct snd_soc_usb *usb, int card_idx, int pcm_idx)
+{
+	int i;
+
+	mutex_lock(&ctx_mutex);
+	for (i = 0; i < usb->num_supported_streams; i++) {
+		if (usb->active_list[i].state == SND_SOC_USB_IDLE) {
+			usb->active_list[i].active_card_idx = card_idx;
+			usb->active_list[i].active_pcm_idx = pcm_idx;
+			usb->active_list[i].state = SND_SOC_USB_PREPARED;
+			mutex_unlock(&ctx_mutex);
+			return i;
+		}
+	}
+	mutex_unlock(&ctx_mutex);
+
+	return -EBUSY;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_prepare_session);
+
+/**
+ * snd_soc_usb_shutdown_session() - Set USB SOC to idle state
+ * @usb: SOC USB device
+ * @session_id: index to active_list
+ *
+ * Place the session specified by session_id into the idle/shutdown state.
+ *
+ */
+int snd_soc_usb_shutdown_session(struct snd_soc_usb *usb, int session_id)
+{
+	return snd_soc_usb_set_session_state(usb, session_id, SND_SOC_USB_IDLE);
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_shutdown_session);
+
+/**
+ * snd_soc_usb_get_components_tag() - Retrieve SOC USB component tag
+ * @playback: direction of audio stream
+ *
+ * Returns the USB offload component tag used in the ASoC components
+ * string.
+ *
+ */
+const char *snd_soc_usb_get_components_tag(bool playback)
+{
+	if (playback)
+		return "usbplaybackoffload: 1";
+	else
+		return "usbcaptureoffload : 1";
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_get_components_tag);
+
 /**
  * snd_soc_usb_find_priv_data() - Retrieve private data stored
  * @dev: device reference
@@ -277,6 +462,13 @@ struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *componen
 	if (!usb)
 		return ERR_PTR(-ENOMEM);
 
+	usb->active_list = kcalloc(num_streams, sizeof(struct snd_soc_usb_session),
+				   GFP_KERNEL);
+	if (!usb->active_list) {
+		kfree(usb);
+		return ERR_PTR(-ENOMEM);
+	}
+
 	usb->component = component;
 	usb->priv_data = data;
 	usb->num_supported_streams = num_streams;
@@ -295,6 +487,7 @@ EXPORT_SYMBOL_GPL(snd_soc_usb_allocate_port);
 void snd_soc_usb_free_port(struct snd_soc_usb *usb)
 {
 	snd_soc_usb_remove_port(usb);
+	kfree(usb->active_list);
 	kfree(usb);
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_free_port);

