Return-Path: <linux-usb+bounces-16051-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC15999792
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 02:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2768F282A23
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 00:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B7D1FAC53;
	Fri, 11 Oct 2024 00:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m+OKEOHN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7F723CE;
	Fri, 11 Oct 2024 00:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728605274; cv=none; b=OFss6mo2ycEcVnz6MtDVCN4WAMS16MfXb3WGQ2hS+CY+vzrzQmRRvlgUPpgtOvtHhHkMvI/dBntzUJpUzQMOi5e651TFzWAZZkxGEy6rhKSD847M1FSYYd3P4iV/d4VzDKlU4yUE0VYQ3Yr3+icVDegMyZSOPGZDPLT+4XQ5ItI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728605274; c=relaxed/simple;
	bh=Y5/uxZlOWMk5KNNRmzXgFDLOWfc/MymPO5Jt8+HOqrU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cs+AOooihoxzQLA3Xn9dezvdjrN23XHh51V//IBrY7/Jlp2ECx7Meiq2mxoH2USgJGn1iyw/GJgUhcJv1w0koVZ9K623sDt9sOCM02fYmabfMgT6VM10z9DwWjwqbhyFilFh/QsDGqxASD6d/uhWcfD2rdI/XVnmBOgNmiMMNVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m+OKEOHN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AD9A7r027275;
	Fri, 11 Oct 2024 00:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zf07zDWjnx7aQXd5TW1MIzOkUgL2dLXZMLqynSgsPCA=; b=m+OKEOHNuLz/QMaI
	QMoki1b2256evCQwUI2avtnUmDE8u8rkhoaOFVPGFq0Xdw4RwQQKvDpD3OjOj8B+
	emADDZ9uJ3LKAgOpFGoHvlfAX4BRK3ZG3mcYXlHrlVK4IezcjGtDnVHsM/GxBuW9
	2aMt8+eAj9CUmhwoj9l4PasF9XLY6IZ2AV3ehcKPwBN52bPphURVRYq0pPVJa5AZ
	+sWnUgxeFh4GiA/LU/I7CtLwQEOlfbh8PYMfvCRKraMiZy2vud4fzAr7pVBr2281
	RUmAOBAVcN5sMPcTYwl84T+gbH9XZp3HAfzFvjCO0OTeRfjsRP8A/l42bojYOs7+
	i2Cfkg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426fj6sf5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B07JlV009361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:19 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 17:07:19 -0700
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
Subject: [PATCH v28 30/32] ALSA: usb-audio: Add USB offload route kcontrol
Date: Thu, 10 Oct 2024 17:06:44 -0700
Message-ID: <20241011000650.2585600-60-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011000650.2585600-1-quic_wcheng@quicinc.com>
References: <20241011000650.2585600-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xcX7rSymsndNBwWMDeOJDaf802Hijmsh
X-Proofpoint-ORIG-GUID: xcX7rSymsndNBwWMDeOJDaf802Hijmsh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410100159

In order to allow userspace/applications know about USB offloading status,
expose a sound kcontrol that fetches information about which sound card
and PCM index the USB device is mapped to for supporting offloading.  In
the USB audio offloading framework, the ASoC BE DAI link is the entity
responsible for registering to the SOC USB layer.

It is expected for the USB SND offloading driver to add the kcontrol to the
sound card associated with the USB audio device.  An example output would
look like:

tinymix -D 1 get 'USB Offload Playback Route PCM#0'
-1, -1 (range -1->255)

This example signifies that there is no mapped ASoC path available for the
USB SND device.

tinymix -D 1 get 'USB Offload Playback Route PCM#0'
0, 0 (range -1->255)

This example signifies that the offload path is available over ASoC sound
card index#0 and PCM device#0.

The USB offload kcontrol will be added in addition to the existing
kcontrols identified by the USB SND mixer.  The kcontrols used to modify
the USB audio device specific parameters are still valid and expected to be
used.  These parameters are not mirrored to the ASoC subsystem.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/Kconfig                 |  10 +++
 sound/usb/Makefile                |   2 +
 sound/usb/mixer_usb_offload.c     | 102 ++++++++++++++++++++++++++++++
 sound/usb/mixer_usb_offload.h     |  17 +++++
 sound/usb/qcom/Makefile           |   2 +-
 sound/usb/qcom/qc_audio_offload.c |   2 +
 6 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 sound/usb/mixer_usb_offload.c
 create mode 100644 sound/usb/mixer_usb_offload.h

diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
index 5cc3eaf53e6b..e3fbf9541d0b 100644
--- a/sound/usb/Kconfig
+++ b/sound/usb/Kconfig
@@ -176,10 +176,20 @@ config SND_BCD2000
 	  To compile this driver as a module, choose M here: the module
 	  will be called snd-bcd2000.
 
+config SND_USB_OFFLOAD_MIXER
+	tristate "USB Audio Offload mixer control"
+	help
+	 Say Y to enable the USB audio offloading mixer controls.  This
+	 exposes an USB offload capable kcontrol to signal to applications
+	 about which platform sound card can support USB audio offload.
+	 The returning values specify the mapped ASoC card and PCM device
+	 the USB audio device is associated to.
+
 config SND_USB_AUDIO_QMI
 	tristate "Qualcomm Audio Offload driver"
 	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND && SND_SOC_USB
 	select SND_PCM
+	select SND_USB_OFFLOAD_MIXER
 	help
 	  Say Y here to enable the Qualcomm USB audio offloading feature.
 
diff --git a/sound/usb/Makefile b/sound/usb/Makefile
index 54a06a2f73ca..2f19f854944c 100644
--- a/sound/usb/Makefile
+++ b/sound/usb/Makefile
@@ -36,3 +36,5 @@ obj-$(CONFIG_SND_USB_US122L) += snd-usbmidi-lib.o
 
 obj-$(CONFIG_SND) += misc/ usx2y/ caiaq/ 6fire/ hiface/ bcd2000/ qcom/
 obj-$(CONFIG_SND_USB_LINE6)	+= line6/
+
+obj-$(CONFIG_SND_USB_OFFLOAD_MIXER) += mixer_usb_offload.o
diff --git a/sound/usb/mixer_usb_offload.c b/sound/usb/mixer_usb_offload.c
new file mode 100644
index 000000000000..16e2fd634684
--- /dev/null
+++ b/sound/usb/mixer_usb_offload.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/usb.h>
+
+#include <sound/core.h>
+#include <sound/control.h>
+#include <sound/soc-usb.h>
+
+#include "usbaudio.h"
+#include "card.h"
+#include "helper.h"
+#include "mixer.h"
+
+#include "mixer_usb_offload.h"
+
+#define PCM_IDX(n)  ((n) & 0xffff)
+#define CARD_IDX(n) ((n) >> 16)
+
+static int
+snd_usb_offload_route_get(struct snd_kcontrol *kcontrol,
+			  struct snd_ctl_elem_value *ucontrol)
+{
+	struct device *sysdev = snd_kcontrol_chip(kcontrol);
+	int ret;
+
+	ret = snd_soc_usb_update_offload_route(sysdev,
+					       CARD_IDX(kcontrol->private_value),
+					       PCM_IDX(kcontrol->private_value),
+					       SNDRV_PCM_STREAM_PLAYBACK,
+					       ucontrol->value.integer.value);
+	if (ret < 0) {
+		ucontrol->value.integer.value[0] = -1;
+		ucontrol->value.integer.value[1] = -1;
+	}
+
+	return 0;
+}
+
+static int snd_usb_offload_route_info(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 2;
+	uinfo->value.integer.min = -1;
+	/* Arbitrary max value, as there is no 'limit' on number of PCM devices */
+	uinfo->value.integer.max = 0xff;
+
+	return 0;
+}
+
+static struct snd_kcontrol_new snd_usb_offload_mapped_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.access = SNDRV_CTL_ELEM_ACCESS_READ,
+	.info = snd_usb_offload_route_info,
+	.get = snd_usb_offload_route_get,
+};
+
+/**
+ * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
+ * @chip - USB SND chip device
+ *
+ * Creates a sound control for a USB audio device, so that applications can
+ * query for if there is an available USB audio offload path, and which
+ * card is managing it.
+ */
+int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
+{
+	struct usb_device *udev = chip->dev;
+	struct snd_kcontrol_new *chip_kctl;
+	struct snd_usb_substream *subs;
+	struct snd_usb_stream *as;
+	char ctl_name[37];
+	int ret;
+
+	list_for_each_entry(as, &chip->pcm_list, list) {
+		subs = &as->substream[SNDRV_PCM_STREAM_PLAYBACK];
+		if (!subs->ep_num)
+			continue;
+
+		chip_kctl = &snd_usb_offload_mapped_ctl;
+		chip_kctl->count = 1;
+		/*
+		 * Store the associated USB SND card number and PCM index for
+		 * the kctl.
+		 */
+		chip_kctl->private_value = as->pcm_index |
+					  chip->card->number << 16;
+		sprintf(ctl_name, "USB Offload Playback Route PCM#%d",
+			as->pcm_index);
+		chip_kctl->name = ctl_name;
+		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl,
+				  udev->bus->sysdev));
+		if (ret < 0)
+			break;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_usb_offload_create_ctl);
diff --git a/sound/usb/mixer_usb_offload.h b/sound/usb/mixer_usb_offload.h
new file mode 100644
index 000000000000..3f6e2a8b19c8
--- /dev/null
+++ b/sound/usb/mixer_usb_offload.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __USB_OFFLOAD_MIXER_H
+#define __USB_OFFLOAD_MIXER_H
+
+#if IS_ENABLED(CONFIG_SND_USB_OFFLOAD_MIXER)
+int snd_usb_offload_create_ctl(struct snd_usb_audio *chip);
+#else
+static inline int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
+{
+	return 0;
+}
+#endif
+#endif /* __USB_OFFLOAD_MIXER_H */
diff --git a/sound/usb/qcom/Makefile b/sound/usb/qcom/Makefile
index a81c9b28d484..4005e8391ab9 100644
--- a/sound/usb/qcom/Makefile
+++ b/sound/usb/qcom/Makefile
@@ -1,2 +1,2 @@
 snd-usb-audio-qmi-objs := usb_audio_qmi_v01.o qc_audio_offload.o
-obj-$(CONFIG_SND_USB_AUDIO_QMI) += snd-usb-audio-qmi.o
\ No newline at end of file
+obj-$(CONFIG_SND_USB_AUDIO_QMI) += snd-usb-audio-qmi.o
diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index a7ad15404fd1..5b9262a116be 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -36,6 +36,7 @@
 #include "../helper.h"
 #include "../pcm.h"
 #include "../power.h"
+#include "../mixer_usb_offload.h"
 
 #include "usb_audio_qmi_v01.h"
 
@@ -1703,6 +1704,7 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 		sdev->card_idx = chip->card->number;
 		sdev->chip_idx = chip->index;
 
+		snd_usb_offload_create_ctl(chip);
 		snd_soc_usb_connect(usb_get_usb_backend(udev), sdev);
 	}
 

