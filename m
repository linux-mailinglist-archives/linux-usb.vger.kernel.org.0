Return-Path: <linux-usb+bounces-17248-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E3B9BF6C6
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 20:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A948A282DB7
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 19:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2958820CCC8;
	Wed,  6 Nov 2024 19:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OukaqggG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F65920BB37;
	Wed,  6 Nov 2024 19:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730921689; cv=none; b=nTG7lAwsp1/fchti0jkHvS+HGyzdc95iZGenuCEfZ/IQ3zp78SmSE23owRHai/nWOAhG4PNNEqVvbjnkIYa+Iw9d3vKf9QicNjkpTeECaWezvJt3NN9eq2NslN/SlsWEjMDJNZLJUUYgJ28XblAef2hIzmNS58VrlPIBBw9k6I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730921689; c=relaxed/simple;
	bh=/wBzgNv6xpUz/ZLA8rVS+q7l1axYPeT0H+wezZ9yKCs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qxz/085xWdG5SmKqnlo0bpG4I8oqhS3blC7Ha1eqHCqg4P2fQwzA0Da8IxoGCXBv8K2vmmS96g5aWqkhmTreO7VqYBXksZceZ5xNjaFUjwKhKf9H4Fnw2+yE8ICWOSORXHWcuWfqyLpCX+xvHYr9lEoYjjXWpws4nnjox+X+kH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OukaqggG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6FqxDr013161;
	Wed, 6 Nov 2024 19:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ZBgdaXJKUel4LEa/FHlUzUIMGn+EiQHJKj2di1CAuA=; b=OukaqggGmnkeWLyO
	HKh1rNRB4AjvttlbPwpCwedecdyi3ESq88UjlCwgw8pczIJ8WtLkMDT5htP+S/eJ
	0npnWZBhssv3TnQgLBy6zl5YuyE1HnGXvWUaT1n/onygItE890w/piCtETOjERQO
	UB4i8wOb6suUXalCwZkOBo3II/nG9ocZ/9npSk2XXMQfypj0JdX5fUpeuJn3sdUf
	3CZzaRlEdc4fVrLNFnOxehsyz0q32QvR/IpJUxBbOY+CAe6cmGKFcUSmyfawI4Bn
	qAnfc/Hy8iBp/omKi8a2wQVGZp5OEI/8MOAG2rAAhnTicgSWoMVCjmwal9J9ELmq
	f3qkEg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qp2rv2br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 19:34:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A6JYVbl003987
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 19:34:31 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 6 Nov 2024 11:34:30 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v30 07/30] ALSA: Add USB audio device jack type
Date: Wed, 6 Nov 2024 11:33:50 -0800
Message-ID: <20241106193413.1730413-8-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: 8in5fH2d5MpNwkvHxOn2RO-k_Su1baPz
X-Proofpoint-ORIG-GUID: 8in5fH2d5MpNwkvHxOn2RO-k_Su1baPz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060149

Add an USB jack type, in order to support notifying of a valid USB audio
device.  Since USB audio devices can have a slew of different
configurations that reach beyond the basic headset and headphone use cases,
classify these devices differently.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/linux/mod_devicetable.h        | 2 +-
 include/sound/jack.h                   | 4 +++-
 include/uapi/linux/input-event-codes.h | 3 ++-
 sound/core/jack.c                      | 6 ++++--
 4 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 4338b1b4ac44..82826f5a3741 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -340,7 +340,7 @@ struct pcmcia_device_id {
 #define INPUT_DEVICE_ID_LED_MAX		0x0f
 #define INPUT_DEVICE_ID_SND_MAX		0x07
 #define INPUT_DEVICE_ID_FF_MAX		0x7f
-#define INPUT_DEVICE_ID_SW_MAX		0x10
+#define INPUT_DEVICE_ID_SW_MAX		0x11
 #define INPUT_DEVICE_ID_PROP_MAX	0x1f
 
 #define INPUT_DEVICE_ID_MATCH_BUS	1
diff --git a/include/sound/jack.h b/include/sound/jack.h
index 1ed90e2109e9..bd3f62281c97 100644
--- a/include/sound/jack.h
+++ b/include/sound/jack.h
@@ -22,6 +22,7 @@ struct input_dev;
  * @SND_JACK_VIDEOOUT: Video out
  * @SND_JACK_AVOUT: AV (Audio Video) out
  * @SND_JACK_LINEIN:  Line in
+ * @SND_JACK_USB: USB audio device
  * @SND_JACK_BTN_0: Button 0
  * @SND_JACK_BTN_1: Button 1
  * @SND_JACK_BTN_2: Button 2
@@ -43,6 +44,7 @@ enum snd_jack_types {
 	SND_JACK_VIDEOOUT	= 0x0010,
 	SND_JACK_AVOUT		= SND_JACK_LINEOUT | SND_JACK_VIDEOOUT,
 	SND_JACK_LINEIN		= 0x0020,
+	SND_JACK_USB		= 0x0040,
 
 	/* Kept separate from switches to facilitate implementation */
 	SND_JACK_BTN_0		= 0x4000,
@@ -54,7 +56,7 @@ enum snd_jack_types {
 };
 
 /* Keep in sync with definitions above */
-#define SND_JACK_SWITCH_TYPES 6
+#define SND_JACK_SWITCH_TYPES 7
 
 struct snd_jack {
 	struct list_head kctl_list;
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index a4206723f503..f44b9f41d26f 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -924,7 +924,8 @@
 #define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
 #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
 #define SW_MACHINE_COVER	0x10  /* set = cover closed */
-#define SW_MAX			0x10
+#define SW_USB_INSERT		0x11  /* set = USB audio device connected */
+#define SW_MAX			0x11
 #define SW_CNT			(SW_MAX+1)
 
 /*
diff --git a/sound/core/jack.c b/sound/core/jack.c
index e4bcecdf89b7..de7c603e92b7 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -34,6 +34,7 @@ static const int jack_switch_types[SND_JACK_SWITCH_TYPES] = {
 	SW_JACK_PHYSICAL_INSERT,
 	SW_VIDEOOUT_INSERT,
 	SW_LINEIN_INSERT,
+	SW_USB_INSERT,
 };
 #endif /* CONFIG_SND_JACK_INPUT_DEV */
 
@@ -241,8 +242,9 @@ static ssize_t jack_kctl_id_read(struct file *file,
 static const char * const jack_events_name[] = {
 	"HEADPHONE(0x0001)", "MICROPHONE(0x0002)", "LINEOUT(0x0004)",
 	"MECHANICAL(0x0008)", "VIDEOOUT(0x0010)", "LINEIN(0x0020)",
-	"", "", "", "BTN_5(0x0200)", "BTN_4(0x0400)", "BTN_3(0x0800)",
-	"BTN_2(0x1000)", "BTN_1(0x2000)", "BTN_0(0x4000)", "",
+	"USB(0x0040)", "", "", "BTN_5(0x0200)", "BTN_4(0x0400)",
+	"BTN_3(0x0800)", "BTN_2(0x1000)", "BTN_1(0x2000)", "BTN_0(0x4000)",
+	"",
 };
 
 /* the recommended buffer size is 256 */

