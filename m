Return-Path: <linux-usb+bounces-15542-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E54988837
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2024 17:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 010DD282D36
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2024 15:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504091C1736;
	Fri, 27 Sep 2024 15:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a0wBAZkC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C15149C6D;
	Fri, 27 Sep 2024 15:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727450556; cv=none; b=ti2gFCrdl3JYgXCgULEoDEVtdeP1TercXKvdcPn2/GTJRkscGQaPWmxQuqRW8Z2QjiIgi8mmRmH0rBXaHibPxUL4uYJ9XD8EdlEsuTm2MXwx14hzNf1cQa5B0EecrdngkIygZnC11sntZG8QcBJQx+PuQ5KaraVe+jmki0N5yM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727450556; c=relaxed/simple;
	bh=Z23+G7mPee2zuA9JCRsVSEWFoggcyeK/wonPDXsB49Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bvtzQ6jR8sJsOcVe2LZk+JWQT6SSLl4N+FT5ThIm0zKzhC0O3laORBlEu+hCV9fWLHEa1pHgS9D33bZKX+ECPTlLYgkmCC7vHmto/8MzJV56fN4KFQ+tZxyKrnQDdRkE9oLXurX4uuS+V6sd/gvz2fLifiKHwJZZEphm/nmsJ20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a0wBAZkC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48RFDuPL026381;
	Fri, 27 Sep 2024 15:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=xnFW1svEdvEpYi0CJlDfQ6zH263RrZetg070gOA/tbk=; b=a0
	wBAZkCrBTx8d4m8RO3ssIACboKrDPEUT9sWKopKCOa721LBGfCvoJYwb6cseutRB
	XW1Ce2ol5UC24C6v9XWObebwMRsN59oSq3WtgE/r/UkaRVV1QYs3pvWk0fs3L8zx
	QpEALi9t4OPF4bEqrZuPfTug3I4MsQOGEkHbyUL01udIj4Xm2UVNb3WKVQJlqmuy
	8A1JOayHBYHWlXftLSjW0ivjCok2ekt5IkPfGLb683liX6voncDbLQ2e9pC3PgyQ
	tZhm+1uSguPz6sacU83/hZGYz6GOedaPZCsEO/zPglQOeS7E/297vyj342HoM5QZ
	JIvXXnRDIhai1/nJ4Q2w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snfhbmqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 15:22:25 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48RFMO9Z000487
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 15:22:24 GMT
Received: from hu-akakum-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Sep 2024 08:22:17 -0700
From: Akash Kumar <quic_akakum@quicinc.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, Jack Pham
	<quic_jackp@quicinc.com>,
        <kernel@quicinc.com>, Wesley Cheng
	<quic_wcheng@quicinc.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Daniel Scally
	<dan.scally@ideasonboard.com>
CC: Vijayavardhan Vennapusa <quic_vvreddy@quicinc.com>,
        Krishna Kurapati
	<quic_kriskura@quicinc.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Akash Kumar <quic_akakum@quicinc.com>
Subject: [PATCH v3] usb: gadget: uvc: configfs: Add frame-based frame format support
Date: Fri, 27 Sep 2024 20:51:38 +0530
Message-ID: <20240927152138.31416-1-quic_akakum@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JcLVtBATsMH0XueYreBty6jf2D9pJQtL
X-Proofpoint-GUID: JcLVtBATsMH0XueYreBty6jf2D9pJQtL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270110

Add support for frame-based frame format, which can be used to support
multiple formats like H264 or H265, in addition to MJPEG and YUV frames.

The frame-based format is set to H264 by default, but it can be updated
to other formats by modifying the GUID through the guid configfs
attribute. Different structures are used for all three formats, as
H264 has a different structure compared to MJPEG and uncompressed
formats. These structures will be passed to the frame make function
based on the active format, using a common frame structure with
additional parameters needed only for frame-based formats. These
parameters are handled at runtime in the UVC driver.

Signed-off-by: Akash Kumar <quic_akakum@quicinc.com>
---
Changes for v3:
Added framebased format support without impacting existing formats
and used same frame structure and handled the different paramters
within the uvc driver code so userspace libraries not need to
change.

Changes for v2:
https://lore.kernel.org/all/20240711082304.1363-1-quic_akakum@quicinc.com/
Added Documentation for new format details.

Changes for v1:
https://lore.kernel.org/all/20240708041328.1942-1-quic_akakum@quicinc.com/
Added framebased format support.
---
 .../ABI/testing/configfs-usb-gadget-uvc       |  64 ++++
 drivers/usb/gadget/function/uvc_configfs.c    | 348 +++++++++++++++++-
 drivers/usb/gadget/function/uvc_configfs.h    |  16 +
 drivers/usb/gadget/function/uvc_v4l2.c        |  11 +-
 include/uapi/linux/usb/video.h                |  58 +++
 5 files changed, 485 insertions(+), 12 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
index 4feb692c4c1d..b6720768d63d 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
@@ -342,6 +342,70 @@ Description:	Specific uncompressed frame descriptors
 					   support
 		=========================  =====================================
 
+What:           /config/usb-gadget/gadget/functions/uvc.name/streaming/framebased
+Date:           Sept 2024
+KernelVersion:  5.15
+Description:    Framebased format descriptors
+
+What:           /config/usb-gadget/gadget/functions/uvc.name/streaming/framebased/name
+Date:           Sept 2024
+KernelVersion:  5.15
+Description:    Specific framebased format descriptors
+
+                ==================      =======================================
+                bFormatIndex            unique id for this format descriptor;
+                                        only defined after parent header is
+                                        linked into the streaming class;
+                                        read-only
+                bmaControls             this format's data for bmaControls in
+                                        the streaming header
+                bmInterlaceFlags        specifies interlace information,
+                                        read-only
+                bAspectRatioY           the X dimension of the picture aspect
+                                        ratio, read-only
+                bAspectRatioX           the Y dimension of the picture aspect
+                                        ratio, read-only
+                bDefaultFrameIndex      optimum frame index for this stream
+                bBitsPerPixel           number of bits per pixel used to
+                                        specify color in the decoded video
+                                        frame
+                guidFormat              globally unique id used to identify
+                                        stream-encoding format
+                ==================      =======================================
+
+What:           /config/usb-gadget/gadget/functions/uvc.name/streaming/framebased/name/name
+Date:           Sept 2024
+KernelVersion:  5.15
+Description:    Specific framebased frame descriptors
+
+                =========================  =====================================
+                bFrameIndex                unique id for this framedescriptor;
+                                           only defined after parent format is
+                                           linked into the streaming header;
+                                           read-only
+                dwFrameInterval            indicates how frame interval can be
+                                           programmed; a number of values
+                                           separated by newline can be specified
+                dwDefaultFrameInterval     the frame interval the device would
+                                           like to use as default
+                dwBytesPerLine             Specifies the number of bytes per line
+                                           of video for packed fixed frame size
+                                           formats, allowing the receiver to
+                                           perform stride alignment of the video.
+                                           If the bVariableSize value (above) is
+                                           TRUE (1), or if the format does not
+                                           permit such alignment, this value shall
+                                           be set to zero (0).
+                dwMaxBitRate               the maximum bit rate at the shortest
+                                           frame interval in bps
+                dwMinBitRate               the minimum bit rate at the longest
+                                           frame interval in bps
+                wHeight                    height of decoded bitmap frame in px
+                wWidth                     width of decoded bitmam frame in px
+                bmCapabilities             still image support, fixed frame-rate
+                                           support
+                =========================  =====================================
+
 What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/header
 Date:		Dec 2014
 KernelVersion:	4.0
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 6fac696ea846..f131943254a4 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -1566,11 +1566,13 @@ static const struct uvcg_config_group_type uvcg_control_grp_type = {
 /* -----------------------------------------------------------------------------
  * streaming/uncompressed
  * streaming/mjpeg
+ * streaming/framebased
  */
 
 static const char * const uvcg_format_names[] = {
 	"uncompressed",
 	"mjpeg",
+	"framebased",
 };
 
 static struct uvcg_color_matching *
@@ -1777,6 +1779,9 @@ static int uvcg_streaming_header_allow_link(struct config_item *src,
 	target_fmt = container_of(to_config_group(target), struct uvcg_format,
 				  group);
 
+	if (!target_fmt)
+		goto out;
+
 	uvcg_format_set_indices(to_config_group(target));
 
 	format_ptr = kzalloc(sizeof(*format_ptr), GFP_KERNEL);
@@ -1816,6 +1821,9 @@ static void uvcg_streaming_header_drop_link(struct config_item *src,
 	target_fmt = container_of(to_config_group(target), struct uvcg_format,
 				  group);
 
+	if (!target_fmt)
+		goto out;
+
 	list_for_each_entry_safe(format_ptr, tmp, &src_hdr->formats, entry)
 		if (format_ptr->fmt == target_fmt) {
 			list_del(&format_ptr->entry);
@@ -1826,6 +1834,7 @@ static void uvcg_streaming_header_drop_link(struct config_item *src,
 
 	--target_fmt->linked;
 
+out:
 	mutex_unlock(&opts->lock);
 	mutex_unlock(su_mutex);
 }
@@ -2022,6 +2031,7 @@ UVCG_FRAME_ATTR(dw_min_bit_rate, dwMinBitRate, 32);
 UVCG_FRAME_ATTR(dw_max_bit_rate, dwMaxBitRate, 32);
 UVCG_FRAME_ATTR(dw_max_video_frame_buffer_size, dwMaxVideoFrameBufferSize, 32);
 UVCG_FRAME_ATTR(dw_default_frame_interval, dwDefaultFrameInterval, 32);
+UVCG_FRAME_ATTR(dw_bytes_perline, dwBytesPerLine, 32);
 
 #undef UVCG_FRAME_ATTR
 
@@ -2035,7 +2045,7 @@ static ssize_t uvcg_frame_dw_frame_interval_show(struct config_item *item,
 	int result, i;
 	char *pg = page;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
+	mutex_lock(su_mutex);	/* for navigating configfs hierarchy */
 
 	opts_item = frm->item.ci_parent->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -2105,7 +2115,7 @@ static ssize_t uvcg_frame_dw_frame_interval_store(struct config_item *item,
 
 UVC_ATTR(uvcg_frame_, dw_frame_interval, dwFrameInterval);
 
-static struct configfs_attribute *uvcg_frame_attrs[] = {
+static struct configfs_attribute *uvcg_frame_attrs1[] = {
 	&uvcg_frame_attr_b_frame_index,
 	&uvcg_frame_attr_bm_capabilities,
 	&uvcg_frame_attr_w_width,
@@ -2118,12 +2128,31 @@ static struct configfs_attribute *uvcg_frame_attrs[] = {
 	NULL,
 };
 
-static const struct config_item_type uvcg_frame_type = {
+static struct configfs_attribute *uvcg_frame_attrs2[] = {
+	&uvcg_frame_attr_b_frame_index,
+	&uvcg_frame_attr_bm_capabilities,
+	&uvcg_frame_attr_w_width,
+	&uvcg_frame_attr_w_height,
+	&uvcg_frame_attr_dw_min_bit_rate,
+	&uvcg_frame_attr_dw_max_bit_rate,
+	&uvcg_frame_attr_dw_default_frame_interval,
+	&uvcg_frame_attr_dw_frame_interval,
+	&uvcg_frame_attr_dw_bytes_perline,
+	NULL,
+};
+
+static const struct config_item_type uvcg_frame_type1 = {
 	.ct_item_ops	= &uvcg_config_item_ops,
-	.ct_attrs	= uvcg_frame_attrs,
+	.ct_attrs	= uvcg_frame_attrs1,
 	.ct_owner	= THIS_MODULE,
 };
 
+static const struct config_item_type uvcg_frame_type2 = {
+	.ct_item_ops    = &uvcg_config_item_ops,
+	.ct_attrs       = uvcg_frame_attrs2,
+	.ct_owner       = THIS_MODULE,
+};
+
 static struct config_item *uvcg_frame_make(struct config_group *group,
 					   const char *name)
 {
@@ -2145,6 +2174,7 @@ static struct config_item *uvcg_frame_make(struct config_group *group,
 	h->frame.dw_max_bit_rate		= 55296000;
 	h->frame.dw_max_video_frame_buffer_size	= 460800;
 	h->frame.dw_default_frame_interval	= 666666;
+	h->frame.dw_bytes_perline		= 0;
 
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -2157,6 +2187,9 @@ static struct config_item *uvcg_frame_make(struct config_group *group,
 	} else if (fmt->type == UVCG_MJPEG) {
 		h->frame.b_descriptor_subtype = UVC_VS_FRAME_MJPEG;
 		h->fmt_type = UVCG_MJPEG;
+	} else if (fmt->type == UVCG_FRAMEBASED) {
+		h->frame.b_descriptor_subtype = UVC_VS_FRAME_FRAME_BASED;
+		h->fmt_type = UVCG_FRAMEBASED;
 	} else {
 		mutex_unlock(&opts->lock);
 		kfree(h);
@@ -2175,7 +2208,10 @@ static struct config_item *uvcg_frame_make(struct config_group *group,
 	++fmt->num_frames;
 	mutex_unlock(&opts->lock);
 
-	config_item_init_type_name(&h->item, name, &uvcg_frame_type);
+	if (fmt->type == UVCG_FRAMEBASED)
+		config_item_init_type_name(&h->item, name, &uvcg_frame_type2);
+	else
+		config_item_init_type_name(&h->item, name, &uvcg_frame_type1);
 
 	return &h->item;
 }
@@ -2215,9 +2251,6 @@ static void uvcg_format_set_indices(struct config_group *fmt)
 	list_for_each_entry(ci, &fmt->cg_children, ci_entry) {
 		struct uvcg_frame *frm;
 
-		if (ci->ci_type != &uvcg_frame_type)
-			continue;
-
 		frm = to_uvcg_frame(ci);
 		frm->frame.b_frame_index = i++;
 	}
@@ -2677,6 +2710,251 @@ static const struct uvcg_config_group_type uvcg_mjpeg_grp_type = {
 	.name = "mjpeg",
 };
 
+/* -----------------------------------------------------------------------------
+ * streaming/framebased/<NAME>
+ */
+
+static struct configfs_group_operations uvcg_framebased_group_ops = {
+	.make_item              = uvcg_frame_make,
+	.drop_item              = uvcg_frame_drop,
+};
+
+#define UVCG_FRAMEBASED_ATTR_RO(cname, aname, bits)			\
+static ssize_t uvcg_framebased_##cname##_show(struct config_item *item,	\
+		char *page)						\
+{									\
+	struct uvcg_framebased *u = to_uvcg_framebased(item);		\
+	struct f_uvc_opts *opts;					\
+	struct config_item *opts_item;					\
+	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
+	int result;							\
+									\
+	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
+									\
+	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
+	opts = to_f_uvc_opts(opts_item);				\
+									\
+	mutex_lock(&opts->lock);					\
+	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
+	mutex_unlock(&opts->lock);					\
+									\
+	mutex_unlock(su_mutex);						\
+	return result;							\
+}									\
+									\
+UVC_ATTR_RO(uvcg_framebased_, cname, aname)
+
+#define UVCG_FRAMEBASED_ATTR(cname, aname, bits)			\
+static ssize_t uvcg_framebased_##cname##_show(struct config_item *item,	\
+		char *page)						\
+{									\
+	struct uvcg_framebased *u = to_uvcg_framebased(item);		\
+	struct f_uvc_opts *opts;					\
+	struct config_item *opts_item;					\
+	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
+	int result;							\
+									\
+	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
+									\
+	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
+	opts = to_f_uvc_opts(opts_item);				\
+									\
+	mutex_lock(&opts->lock);					\
+	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
+	mutex_unlock(&opts->lock);					\
+									\
+	mutex_unlock(su_mutex);						\
+	return result;							\
+}									\
+									\
+static ssize_t								\
+uvcg_framebased_##cname##_store(struct config_item *item,		\
+		const char *page, size_t len)				\
+{									\
+	struct uvcg_framebased *u = to_uvcg_framebased(item);		\
+	struct f_uvc_opts *opts;					\
+	struct config_item *opts_item;					\
+	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
+	int ret;							\
+	u8 num;								\
+									\
+	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
+									\
+	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
+	opts = to_f_uvc_opts(opts_item);				\
+									\
+	mutex_lock(&opts->lock);					\
+	if (u->fmt.linked || opts->refcnt) {				\
+		ret = -EBUSY;						\
+		goto end;						\
+	}								\
+									\
+	ret = kstrtou8(page, 0, &num);					\
+	if (ret)							\
+		goto end;						\
+									\
+	if (num > 255) {						\
+		ret = -EINVAL;						\
+		goto end;						\
+	}								\
+	u->desc.aname = num;						\
+	ret = len;							\
+end:									\
+	mutex_unlock(&opts->lock);					\
+	mutex_unlock(su_mutex);						\
+	return ret;							\
+}									\
+									\
+UVC_ATTR(uvcg_framebased_, cname, aname)
+
+UVCG_FRAMEBASED_ATTR_RO(b_format_index, bFormatIndex, 8);
+UVCG_FRAMEBASED_ATTR_RO(b_bits_per_pixel, bBitsPerPixel, 8);
+UVCG_FRAMEBASED_ATTR(b_default_frame_index, bDefaultFrameIndex, 8);
+UVCG_FRAMEBASED_ATTR_RO(b_aspect_ratio_x, bAspectRatioX, 8);
+UVCG_FRAMEBASED_ATTR_RO(b_aspect_ratio_y, bAspectRatioY, 8);
+UVCG_FRAMEBASED_ATTR_RO(bm_interface_flags, bmInterfaceFlags, 8);
+
+#undef UVCG_FRAMEBASED_ATTR
+#undef UVCG_FRAMEBASED_ATTR_RO
+
+static ssize_t uvcg_framebased_guid_format_show(struct config_item *item,
+						char *page)
+{
+	struct uvcg_framebased *ch = to_uvcg_framebased(item);
+	struct f_uvc_opts *opts;
+	struct config_item *opts_item;
+	struct mutex *su_mutex = &ch->fmt.group.cg_subsys->su_mutex;
+
+	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
+
+	opts_item = ch->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+	memcpy(page, ch->desc.guidFormat, sizeof(ch->desc.guidFormat));
+	mutex_unlock(&opts->lock);
+
+	mutex_unlock(su_mutex);
+
+	return sizeof(ch->desc.guidFormat);
+}
+
+static ssize_t uvcg_framebased_guid_format_store(struct config_item *item,
+						 const char *page, size_t len)
+{
+	struct uvcg_framebased *ch = to_uvcg_framebased(item);
+	struct f_uvc_opts *opts;
+	struct config_item *opts_item;
+	struct mutex *su_mutex = &ch->fmt.group.cg_subsys->su_mutex;
+	int ret;
+
+	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
+
+	opts_item = ch->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+	if (ch->fmt.linked || opts->refcnt) {
+		ret = -EBUSY;
+		goto end;
+	}
+
+	memcpy(ch->desc.guidFormat, page,
+	       min(sizeof(ch->desc.guidFormat), len));
+	ret = sizeof(ch->desc.guidFormat);
+
+end:
+	mutex_unlock(&opts->lock);
+	mutex_unlock(su_mutex);
+	return ret;
+}
+
+UVC_ATTR(uvcg_framebased_, guid_format, guidFormat);
+
+static inline ssize_t
+uvcg_framebased_bma_controls_show(struct config_item *item, char *page)
+{
+	struct uvcg_framebased *u = to_uvcg_framebased(item);
+
+	return uvcg_format_bma_controls_show(&u->fmt, page);
+}
+
+static inline ssize_t
+uvcg_framebased_bma_controls_store(struct config_item *item,
+				   const char *page, size_t len)
+{
+	struct uvcg_framebased *u = to_uvcg_framebased(item);
+
+	return uvcg_format_bma_controls_store(&u->fmt, page, len);
+}
+
+UVC_ATTR(uvcg_framebased_, bma_controls, bmaControls);
+
+static struct configfs_attribute *uvcg_framebased_attrs[] = {
+	&uvcg_framebased_attr_b_format_index,
+	&uvcg_framebased_attr_b_default_frame_index,
+	&uvcg_framebased_attr_b_bits_per_pixel,
+	&uvcg_framebased_attr_b_aspect_ratio_x,
+	&uvcg_framebased_attr_b_aspect_ratio_y,
+	&uvcg_framebased_attr_bm_interface_flags,
+	&uvcg_framebased_attr_bma_controls,
+	&uvcg_framebased_attr_guid_format,
+	NULL,
+};
+
+static const struct config_item_type uvcg_framebased_type = {
+	.ct_item_ops    = &uvcg_config_item_ops,
+	.ct_group_ops   = &uvcg_framebased_group_ops,
+	.ct_attrs       = uvcg_framebased_attrs,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct config_group *uvcg_framebased_make(struct config_group *group,
+						 const char *name)
+{
+	static char guid[] = { /*Declear frame based as H264 format*/
+		'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00,
+		0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71
+	};
+	struct uvcg_framebased *h;
+
+	h = kzalloc(sizeof(*h), GFP_KERNEL);
+	if (!h)
+		return ERR_PTR(-ENOMEM);
+
+	h->desc.bLength                 = UVC_DT_FORMAT_FRAMEBASED_SIZE;
+	h->desc.bDescriptorType         = USB_DT_CS_INTERFACE;
+	h->desc.bDescriptorSubType      = UVC_VS_FORMAT_FRAME_BASED;
+	memcpy(h->desc.guidFormat, guid, sizeof(guid));
+	h->desc.bBitsPerPixel           = 0;
+	h->desc.bDefaultFrameIndex      = 1;
+	h->desc.bAspectRatioX           = 0;
+	h->desc.bAspectRatioY           = 0;
+	h->desc.bmInterfaceFlags        = 0;
+	h->desc.bCopyProtect            = 0;
+	h->desc.bVariableSize           = 1;
+
+	INIT_LIST_HEAD(&h->fmt.frames);
+	h->fmt.type = UVCG_FRAMEBASED;
+	config_group_init_type_name(&h->fmt.group, name,
+				    &uvcg_framebased_type);
+
+	return &h->fmt.group;
+}
+
+static struct configfs_group_operations uvcg_framebased_grp_ops = {
+	.make_group             = uvcg_framebased_make,
+};
+
+static const struct uvcg_config_group_type uvcg_framebased_grp_type = {
+	.type = {
+		.ct_item_ops    = &uvcg_config_item_ops,
+		.ct_group_ops   = &uvcg_framebased_grp_ops,
+		.ct_owner       = THIS_MODULE,
+	},
+	.name = "framebased",
+};
+
 /* -----------------------------------------------------------------------------
  * streaming/color_matching/default
  */
@@ -2912,6 +3190,7 @@ static int __uvcg_iter_strm_cls(struct uvcg_streaming_header *h,
 		if (ret)
 			return ret;
 		grp = &f->fmt->group;
+		j = 0;
 		list_for_each_entry(item, &grp->cg_children, ci_entry) {
 			frm = to_uvcg_frame(item);
 			ret = fun(frm, priv2, priv3, j++, UVCG_FRAME);
@@ -2965,6 +3244,11 @@ static int __uvcg_cnt_strm(void *priv1, void *priv2, void *priv3, int n,
 				container_of(fmt, struct uvcg_mjpeg, fmt);
 
 			*size += sizeof(m->desc);
+		} else if (fmt->type == UVCG_FRAMEBASED) {
+			struct uvcg_framebased *f =
+				container_of(fmt, struct uvcg_framebased, fmt);
+
+			*size += sizeof(f->desc);
 		} else {
 			return -EINVAL;
 		}
@@ -2975,6 +3259,11 @@ static int __uvcg_cnt_strm(void *priv1, void *priv2, void *priv3, int n,
 		int sz = sizeof(frm->dw_frame_interval);
 
 		*size += sizeof(frm->frame);
+		/*
+		 * framebased has duplicate member with uncompressed and
+		 * mjpeg, so minus it
+		 */
+		*size -= sizeof(u32);
 		*size += frm->frame.b_frame_interval_type * sz;
 	}
 	break;
@@ -2991,6 +3280,27 @@ static int __uvcg_cnt_strm(void *priv1, void *priv2, void *priv3, int n,
 	return 0;
 }
 
+static int __uvcg_copy_framebased_desc(void *dest, struct uvcg_frame *frm,
+				       int sz)
+{
+	struct uvc_frame_framebased *desc = dest;
+
+	desc->bLength = frm->frame.b_length;
+	desc->bDescriptorType = frm->frame.b_descriptor_type;
+	desc->bDescriptorSubType = frm->frame.b_descriptor_subtype;
+	desc->bFrameIndex = frm->frame.b_frame_index;
+	desc->bmCapabilities = frm->frame.bm_capabilities;
+	desc->wWidth = frm->frame.w_width;
+	desc->wHeight = frm->frame.w_height;
+	desc->dwMinBitRate = frm->frame.dw_min_bit_rate;
+	desc->dwMaxBitRate = frm->frame.dw_max_bit_rate;
+	desc->dwDefaultFrameInterval = frm->frame.dw_default_frame_interval;
+	desc->bFrameIntervalType = frm->frame.b_frame_interval_type;
+	desc->dwBytesPerLine = frm->frame.dw_bytes_perline;
+
+	return 0;
+}
+
 /*
  * Fill an array of streaming descriptors.
  *
@@ -3045,6 +3355,15 @@ static int __uvcg_fill_strm(void *priv1, void *priv2, void *priv3, int n,
 			m->desc.bNumFrameDescriptors = fmt->num_frames;
 			memcpy(*dest, &m->desc, sizeof(m->desc));
 			*dest += sizeof(m->desc);
+		} else if (fmt->type == UVCG_FRAMEBASED) {
+			struct uvcg_framebased *f =
+				container_of(fmt, struct uvcg_framebased,
+					     fmt);
+
+			f->desc.bFormatIndex = n + 1;
+			f->desc.bNumFrameDescriptors = fmt->num_frames;
+			memcpy(*dest, &f->desc, sizeof(f->desc));
+			*dest += sizeof(f->desc);
 		} else {
 			return -EINVAL;
 		}
@@ -3054,8 +3373,11 @@ static int __uvcg_fill_strm(void *priv1, void *priv2, void *priv3, int n,
 		struct uvcg_frame *frm = priv1;
 		struct uvc_descriptor_header *h = *dest;
 
-		sz = sizeof(frm->frame);
-		memcpy(*dest, &frm->frame, sz);
+		sz = sizeof(frm->frame) - 4;
+		if (frm->fmt_type != UVCG_FRAMEBASED)
+			memcpy(*dest, &frm->frame, sz);
+		else
+			__uvcg_copy_framebased_desc(*dest, frm, sz);
 		*dest += sz;
 		sz = frm->frame.b_frame_interval_type *
 			sizeof(*frm->dw_frame_interval);
@@ -3066,7 +3388,10 @@ static int __uvcg_fill_strm(void *priv1, void *priv2, void *priv3, int n,
 				frm->frame.b_frame_interval_type);
 		else if (frm->fmt_type == UVCG_MJPEG)
 			h->bLength = UVC_DT_FRAME_MJPEG_SIZE(
-				frm->frame.b_frame_interval_type);
+					frm->frame.b_frame_interval_type);
+		else if (frm->fmt_type == UVCG_FRAMEBASED)
+			h->bLength = UVC_DT_FRAME_FRAMEBASED_SIZE(
+					frm->frame.b_frame_interval_type);
 	}
 	break;
 	case UVCG_COLOR_MATCHING: {
@@ -3285,6 +3610,7 @@ static const struct uvcg_config_group_type uvcg_streaming_grp_type = {
 		&uvcg_streaming_header_grp_type,
 		&uvcg_uncompressed_grp_type,
 		&uvcg_mjpeg_grp_type,
+		&uvcg_framebased_grp_type,
 		&uvcg_color_matching_grp_type,
 		&uvcg_streaming_class_grp_type,
 		NULL,
diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gadget/function/uvc_configfs.h
index c6a690158138..2f78cd4f396f 100644
--- a/drivers/usb/gadget/function/uvc_configfs.h
+++ b/drivers/usb/gadget/function/uvc_configfs.h
@@ -49,6 +49,7 @@ container_of(group_ptr, struct uvcg_color_matching, group)
 enum uvcg_format_type {
 	UVCG_UNCOMPRESSED = 0,
 	UVCG_MJPEG,
+	UVCG_FRAMEBASED,
 };
 
 struct uvcg_format {
@@ -105,6 +106,7 @@ struct uvcg_frame {
 		u32	dw_max_video_frame_buffer_size;
 		u32	dw_default_frame_interval;
 		u8	b_frame_interval_type;
+		u32     dw_bytes_perline;
 	} __attribute__((packed)) frame;
 	u32 *dw_frame_interval;
 };
@@ -142,6 +144,20 @@ static inline struct uvcg_mjpeg *to_uvcg_mjpeg(struct config_item *item)
 	return container_of(to_uvcg_format(item), struct uvcg_mjpeg, fmt);
 }
 
+/* -----------------------------------------------------------------------------
+ * streaming/framebased/<NAME>
+ */
+
+struct uvcg_framebased {
+	struct uvcg_format              fmt;
+	struct uvc_format_framebased    desc;
+};
+
+static inline struct uvcg_framebased *to_uvcg_framebased(struct config_item *item)
+{
+	return container_of(to_uvcg_format(item), struct uvcg_framebased, fmt);
+}
+
 /* -----------------------------------------------------------------------------
  * control/extensions/<NAME>
  */
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index de1736f834e6..836b91c73f18 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -31,13 +31,22 @@ static const struct uvc_format_desc *to_uvc_format(struct uvcg_format *uformat)
 {
 	char guid[16] = UVC_GUID_FORMAT_MJPEG;
 	const struct uvc_format_desc *format;
-	struct uvcg_uncompressed *unc;
 
 	if (uformat->type == UVCG_UNCOMPRESSED) {
+		struct uvcg_uncompressed *unc;
+
 		unc = to_uvcg_uncompressed(&uformat->group.cg_item);
 		if (!unc)
 			return ERR_PTR(-EINVAL);
 
+		memcpy(guid, unc->desc.guidFormat, sizeof(guid));
+	} else if (uformat->type == UVCG_FRAMEBASED) {
+		struct uvcg_framebased *unc;
+
+		unc = to_uvcg_framebased(&uformat->group.cg_item);
+		if (!unc)
+			return ERR_PTR(-EINVAL);
+
 		memcpy(guid, unc->desc.guidFormat, sizeof(guid));
 	}
 
diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
index 2ff0e8a3a683..526b5155e23c 100644
--- a/include/uapi/linux/usb/video.h
+++ b/include/uapi/linux/usb/video.h
@@ -597,5 +597,63 @@ struct UVC_FRAME_MJPEG(n) {				\
 	__le32 dwFrameInterval[n];			\
 } __attribute__ ((packed))
 
+/* Frame Based Payload - 3.1.1. Frame Based Video Format Descriptor */
+struct uvc_format_framebased {
+	__u8  bLength;
+	__u8  bDescriptorType;
+	__u8  bDescriptorSubType;
+	__u8  bFormatIndex;
+	__u8  bNumFrameDescriptors;
+	__u8  guidFormat[16];
+	__u8  bBitsPerPixel;
+	__u8  bDefaultFrameIndex;
+	__u8  bAspectRatioX;
+	__u8  bAspectRatioY;
+	__u8  bmInterfaceFlags;
+	__u8  bCopyProtect;
+	__u8  bVariableSize;
+} __attribute__((__packed__));
+
+#define UVC_DT_FORMAT_FRAMEBASED_SIZE                  28
+
+/* Frame Based Payload - 3.1.2. Frame Based Video Frame Descriptor */
+struct uvc_frame_framebased {
+	__u8  bLength;
+	__u8  bDescriptorType;
+	__u8  bDescriptorSubType;
+	__u8  bFrameIndex;
+	__u8  bmCapabilities;
+	__u16 wWidth;
+	__u16 wHeight;
+	__u32 dwMinBitRate;
+	__u32 dwMaxBitRate;
+	__u32 dwDefaultFrameInterval;
+	__u8  bFrameIntervalType;
+	__u32 dwBytesPerLine;
+	__u32 dwFrameInterval[];
+} __attribute__((__packed__));
+
+#define UVC_DT_FRAME_FRAMEBASED_SIZE(n)                        (26+4*(n))
+
+#define UVC_FRAME_FRAMEBASED(n) \
+	uvc_frame_framebased_##n
+
+#define DECLARE_UVC_FRAME_FRAMEBASED(n)			\
+struct UVC_FRAME_FRAMEBASED(n) {			\
+	__u8  bLength;					\
+	__u8  bDescriptorType;				\
+	__u8  bDescriptorSubType;                       \
+	__u8  bFrameIndex;                              \
+	__u8  bmCapabilities;                           \
+	__u16 wWidth;                                   \
+	__u16 wHeight;                                  \
+	__u32 dwMinBitRate;                             \
+	__u32 dwMaxBitRate;                             \
+	__u32 dwDefaultFrameInterval;                   \
+	__u8  bFrameIntervalType;                       \
+	__u32 dwBytesPerLine;                           \
+	__u32 dwFrameInterval[n];                       \
+} __attribute__ ((packed))
+
 #endif /* __LINUX_USB_VIDEO_H */
 
-- 
2.17.1


