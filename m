Return-Path: <linux-usb+bounces-1394-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD13A7C4606
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 02:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE3901C20C47
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 00:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F4738F;
	Wed, 11 Oct 2023 00:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WuYaY5Ch"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C147B369;
	Wed, 11 Oct 2023 00:23:06 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4FF39D;
	Tue, 10 Oct 2023 17:23:04 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39B0MYYk007935;
	Wed, 11 Oct 2023 00:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=yFEcFuGRN84lI6Aon2p6t/mqpx7vwIPFvRi0lRjtoKU=;
 b=WuYaY5ChyISCjqiR29CGPyuk3aDGuCh6/TDZCns04x6s+X2fNQMKuacdqZFghg1850/c
 8xhfhX1VVy5k0wcmvmr3QXaHDcpDFav6eTAi8Q2wyc8QPVNMZETEG58gfiP1te3vh9D3
 abH/o2AjhIsiCaL4CaJksYwNlMeWHrPgZC8EFYD7+Eyjkk9tQ/rCGqc0pxNv+P5Z+Wa0
 MAvHqTazk2Wf+tTzB+ifLXCpK7wylt5gUIk8pcT+yEoGP6ZoezPLiJJQ+SuAYWGpNAkn
 7r3ZIwvEo+gHmpIW5pQSp4cpBG+3BUA4QSZvz3eiy37wUDqe6jfQVFT7iWw8JLkHJHDc 8g== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tn492stc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 00:22:33 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39B0MXC3002160
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 00:22:33 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 10 Oct 2023 17:22:32 -0700
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
Subject: [PATCH v8 13/34] ALSA: usb-audio: Export USB SND APIs for modules
Date: Tue, 10 Oct 2023 17:21:25 -0700
Message-ID: <20231011002146.1821-14-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: GGfk8H3knOM3F7h7knYsjDb20RaFl-r8
X-Proofpoint-ORIG-GUID: GGfk8H3knOM3F7h7knYsjDb20RaFl-r8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_19,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110001
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Some vendor modules will utilize useful parsing and endpoint management
APIs to start audio playback/capture.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/card.c     |  4 +++
 sound/usb/endpoint.c |  1 +
 sound/usb/helper.c   |  1 +
 sound/usb/pcm.c      | 75 +++++++++++++++++++++++++++++++-------------
 sound/usb/pcm.h      | 11 +++++++
 5 files changed, 71 insertions(+), 21 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 1ef6d144aa51..c0b312e264bf 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -1068,6 +1068,7 @@ int snd_usb_lock_shutdown(struct snd_usb_audio *chip)
 		wake_up(&chip->shutdown_wait);
 	return err;
 }
+EXPORT_SYMBOL_GPL(snd_usb_lock_shutdown);
 
 /* autosuspend and unlock the shutdown */
 void snd_usb_unlock_shutdown(struct snd_usb_audio *chip)
@@ -1076,6 +1077,7 @@ void snd_usb_unlock_shutdown(struct snd_usb_audio *chip)
 	if (atomic_dec_and_test(&chip->usage_count))
 		wake_up(&chip->shutdown_wait);
 }
+EXPORT_SYMBOL_GPL(snd_usb_unlock_shutdown);
 
 int snd_usb_autoresume(struct snd_usb_audio *chip)
 {
@@ -1098,6 +1100,7 @@ int snd_usb_autoresume(struct snd_usb_audio *chip)
 	}
 	return 0;
 }
+EXPORT_SYMBOL_GPL(snd_usb_autoresume);
 
 void snd_usb_autosuspend(struct snd_usb_audio *chip)
 {
@@ -1111,6 +1114,7 @@ void snd_usb_autosuspend(struct snd_usb_audio *chip)
 	for (i = 0; i < chip->num_interfaces; i++)
 		usb_autopm_put_interface(chip->intf[i]);
 }
+EXPORT_SYMBOL_GPL(snd_usb_autosuspend);
 
 static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
 {
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 8f65349a06d3..9876abb80853 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1513,6 +1513,7 @@ int snd_usb_endpoint_prepare(struct snd_usb_audio *chip,
 	mutex_unlock(&chip->mutex);
 	return err;
 }
+EXPORT_SYMBOL_GPL(snd_usb_endpoint_prepare);
 
 /* get the current rate set to the given clock by any endpoint */
 int snd_usb_endpoint_get_clock_rate(struct snd_usb_audio *chip, int clock)
diff --git a/sound/usb/helper.c b/sound/usb/helper.c
index bf80e55d013a..4322ae3738e6 100644
--- a/sound/usb/helper.c
+++ b/sound/usb/helper.c
@@ -62,6 +62,7 @@ void *snd_usb_find_csint_desc(void *buffer, int buflen, void *after, u8 dsubtype
 	}
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(snd_usb_find_csint_desc);
 
 /*
  * Wrapper for usb_control_msg().
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 08bf535ed163..3adb09ce1702 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -148,6 +148,16 @@ find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
 	return found;
 }
 
+const struct audioformat *
+snd_usb_find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
+	    unsigned int rate, unsigned int channels, bool strict_match,
+	    struct snd_usb_substream *subs)
+{
+	return find_format(fmt_list_head, format, rate, channels, strict_match,
+			subs);
+}
+EXPORT_SYMBOL_GPL(snd_usb_find_format);
+
 static const struct audioformat *
 find_substream_format(struct snd_usb_substream *subs,
 		      const struct snd_pcm_hw_params *params)
@@ -157,6 +167,14 @@ find_substream_format(struct snd_usb_substream *subs,
 			   true, subs);
 }
 
+const struct audioformat *
+snd_usb_find_substream_format(struct snd_usb_substream *subs,
+		      const struct snd_pcm_hw_params *params)
+{
+	return find_substream_format(subs, params);
+}
+EXPORT_SYMBOL_GPL(snd_usb_find_substream_format);
+
 bool snd_usb_pcm_has_fixed_rate(struct snd_usb_substream *subs)
 {
 	const struct audioformat *fp;
@@ -461,20 +479,9 @@ static void close_endpoints(struct snd_usb_audio *chip,
 	}
 }
 
-/*
- * hw_params callback
- *
- * allocate a buffer and set the given audio format.
- *
- * so far we use a physically linear buffer although packetize transfer
- * doesn't need a continuous area.
- * if sg buffer is supported on the later version of alsa, we'll follow
- * that.
- */
-static int snd_usb_hw_params(struct snd_pcm_substream *substream,
-			     struct snd_pcm_hw_params *hw_params)
+int snd_usb_hw_params(struct snd_usb_substream *subs,
+				struct snd_pcm_hw_params *hw_params)
 {
-	struct snd_usb_substream *subs = substream->runtime->private_data;
 	struct snd_usb_audio *chip = subs->stream->chip;
 	const struct audioformat *fmt;
 	const struct audioformat *sync_fmt;
@@ -499,7 +506,7 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 	if (fmt->implicit_fb) {
 		sync_fmt = snd_usb_find_implicit_fb_sync_format(chip, fmt,
 								hw_params,
-								!substream->stream,
+								!subs->direction,
 								&sync_fixed_rate);
 		if (!sync_fmt) {
 			usb_audio_dbg(chip,
@@ -579,15 +586,28 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(snd_usb_hw_params);
 
 /*
- * hw_free callback
+ * hw_params callback
  *
- * reset the audio format and release the buffer
+ * allocate a buffer and set the given audio format.
+ *
+ * so far we use a physically linear buffer although packetize transfer
+ * doesn't need a continuous area.
+ * if sg buffer is supported on the later version of alsa, we'll follow
+ * that.
  */
-static int snd_usb_hw_free(struct snd_pcm_substream *substream)
+static int snd_usb_pcm_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_usb_substream *subs = substream->runtime->private_data;
+
+	return snd_usb_hw_params(subs, hw_params);
+}
+
+int snd_usb_hw_free(struct snd_usb_substream *subs)
+{
 	struct snd_usb_audio *chip = subs->stream->chip;
 
 	snd_media_stop_pipeline(subs);
@@ -603,6 +623,19 @@ static int snd_usb_hw_free(struct snd_pcm_substream *substream)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(snd_usb_hw_free);
+
+/*
+ * hw_free callback
+ *
+ * reset the audio format and release the buffer
+ */
+static int snd_usb_pcm_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_usb_substream *subs = substream->runtime->private_data;
+
+	return snd_usb_hw_free(subs);
+}
 
 /* free-wheeling mode? (e.g. dmix) */
 static int in_free_wheeling_mode(struct snd_pcm_runtime *runtime)
@@ -1746,8 +1779,8 @@ static int snd_usb_substream_capture_trigger(struct snd_pcm_substream *substream
 static const struct snd_pcm_ops snd_usb_playback_ops = {
 	.open =		snd_usb_pcm_open,
 	.close =	snd_usb_pcm_close,
-	.hw_params =	snd_usb_hw_params,
-	.hw_free =	snd_usb_hw_free,
+	.hw_params =	snd_usb_pcm_hw_params,
+	.hw_free =	snd_usb_pcm_hw_free,
 	.prepare =	snd_usb_pcm_prepare,
 	.trigger =	snd_usb_substream_playback_trigger,
 	.sync_stop =	snd_usb_pcm_sync_stop,
@@ -1758,8 +1791,8 @@ static const struct snd_pcm_ops snd_usb_playback_ops = {
 static const struct snd_pcm_ops snd_usb_capture_ops = {
 	.open =		snd_usb_pcm_open,
 	.close =	snd_usb_pcm_close,
-	.hw_params =	snd_usb_hw_params,
-	.hw_free =	snd_usb_hw_free,
+	.hw_params =	snd_usb_pcm_hw_params,
+	.hw_free =	snd_usb_pcm_hw_free,
 	.prepare =	snd_usb_pcm_prepare,
 	.trigger =	snd_usb_substream_capture_trigger,
 	.sync_stop =	snd_usb_pcm_sync_stop,
diff --git a/sound/usb/pcm.h b/sound/usb/pcm.h
index 388fe2ba346d..be2dd9478982 100644
--- a/sound/usb/pcm.h
+++ b/sound/usb/pcm.h
@@ -15,4 +15,15 @@ void snd_usb_preallocate_buffer(struct snd_usb_substream *subs);
 int snd_usb_audioformat_set_sync_ep(struct snd_usb_audio *chip,
 				    struct audioformat *fmt);
 
+const struct audioformat *
+snd_usb_find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
+	    unsigned int rate, unsigned int channels, bool strict_match,
+	    struct snd_usb_substream *subs);
+const struct audioformat *
+snd_usb_find_substream_format(struct snd_usb_substream *subs,
+		      const struct snd_pcm_hw_params *params);
+
+int snd_usb_hw_params(struct snd_usb_substream *subs,
+				struct snd_pcm_hw_params *hw_params);
+int snd_usb_hw_free(struct snd_usb_substream *subs);
 #endif /* __USBAUDIO_PCM_H */

