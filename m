Return-Path: <linux-usb+bounces-12137-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8B992E208
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jul 2024 10:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C30711C212AA
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jul 2024 08:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047C31509AC;
	Thu, 11 Jul 2024 08:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nCZ42Qid"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C4284DFF;
	Thu, 11 Jul 2024 08:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686221; cv=none; b=SRFXNeUMuYcMG21hVZSToHCySEaf5OI+Z40F28AVGhPdnobAMUVJHpvrHADKSUpg/zIrALNC+mx/n9LppP00rvvnmr5rvHj8rdblS8rHfni2cbdG+yx+/XQ8MGq2FaLHYSo8j74s/hjGOw53rtFS37aF9fEP5MAD3/XvIzAGlWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686221; c=relaxed/simple;
	bh=tmnExaRH/6kccmB4UqShAB+NsfeMuu6fd+2Aq/GeQeY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dO9INf6h41QzmqdS70wNYuAuuHHcPpZT/wrJzhpiHaAwm06bzZ3zA/3inrD2aVF7ABPwEF6/c6ksmpb1TNBUOJfz56BmipiCQdQg7y6AfUg4hXL0xHf+7Dz3uwt7DZmv03jYb3obAhroR6zHSX/RVJacsR8kd02ScGRxInMDKWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nCZ42Qid; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B4mtl5024165;
	Thu, 11 Jul 2024 08:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=J/uxEhDpKtUL0qIevPBmjVvGAJ+Ip//7tk0YrhG/e/Y=; b=nC
	Z42QidGfGzguLFKIkjJx/49FCfVk4Of784S6P3U4y7NJfUERV3Mx6Ct6HD6YmJO0
	xsyU5TxAhQ1A8esVm6MWyBTKZ9dycq3ONyLeC/tytKZ7Rmgj8cT597VynYQMHIL2
	9NWd+2qIdKgBNsM3W1Oas9Jfs1WrzLYv/Tsb7FO0zPZ2jNpJH0GwZbJkwRBvK71j
	Ke7H6Bc3f1voDq0Z+2YdjIfdoKN7eiH/BGAT156jtjwnM1wlJOxEzCBWzrAHZTGa
	6HNkQWqV5ehzZhVZOrsAEg5z1Y0pPNo98r7SNCCl8uTL/nMRmHSQNfUggMbR0EsF
	EkUBZAL6VUZTlR4T00TA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406xpdudmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 08:23:28 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46B8NRJJ024263
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 08:23:27 GMT
Received: from hu-akakum-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 11 Jul 2024 01:23:17 -0700
From: Akash Kumar <quic_akakum@quicinc.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jing Leng <jleng@ambarella.com>, Felipe Balbi
	<balbi@kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>, <kernel@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Daniel Scally
	<dan.scally@ideasonboard.com>
CC: Vijayavardhan Vennapusa <quic_vvreddy@quicinc.com>,
        Krishna Kurapati
	<quic_kriskura@quicinc.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Akash Kumar <quic_akakum@quicinc.com>
Subject: [PATCH v2] usb: gadget: uvc: Add H264 frame format support
Date: Thu, 11 Jul 2024 13:53:04 +0530
Message-ID: <20240711082304.1363-1-quic_akakum@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tF8sUUahL6bl4EeOB1OCWUKBj-s9-fOx
X-Proofpoint-ORIG-GUID: tF8sUUahL6bl4EeOB1OCWUKBj-s9-fOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_04,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=924 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110058

Add support for framebased frame format which can be used to support
multiple formats like H264 or H265 other than mjpeg and YUV frames.

Framebased format is set to H264 by default, which can be updated to
other formats by updating the GUID through guid configfs attribute.
Using Different structures for all 3 formats as H264 has different
structure than mjpeg and uncompressed which will be paased to
frame make func based on active format instead of common frame
structure, have updated all apis in driver accordingly.
h264 is not recognized by hosts machine during enumeration
with common frame structure, so we need to pass h264 frame
structure separately.

Signed-off-by: Akash Kumar <quic_akakum@quicinc.com>
---
 .../ABI/testing/configfs-usb-gadget-uvc       |  88 ++-
 drivers/usb/gadget/function/uvc_configfs.c    | 570 +++++++++++++++---
 drivers/usb/gadget/function/uvc_configfs.h    |  34 +-
 drivers/usb/gadget/function/uvc_v4l2.c        |  80 ++-
 include/uapi/linux/usb/video.h                |  62 ++
 5 files changed, 714 insertions(+), 120 deletions(-)

Changes for v2:
- Added H264 frame format Details in Documentation/ABI/
  and new configsfs attribute path for mjpeg and
  uncompresseed formats.

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
index 4feb692c4c1d..2580083cdcc5 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
@@ -224,13 +224,13 @@ Description:	Additional color matching descriptors
 					  white
 		========================  ======================================
 
-What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/mjpeg
-Date:		Dec 2014
+What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/mjpeg/name
+Date:		July 2024
 KernelVersion:	4.0
 Description:	MJPEG format descriptors
 
-What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/mjpeg/name
-Date:		Dec 2014
+What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/mjpeg/name/name
+Date:		July 2024
 KernelVersion:	4.0
 Description:	Specific MJPEG format descriptors
 
@@ -255,8 +255,8 @@ Description:	Specific MJPEG format descriptors
 		bDefaultFrameIndex	optimum frame index for this stream
 		===================	=====================================
 
-What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/mjpeg/name/name
-Date:		Dec 2014
+What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/mjpeg/name/name/name
+Date:		July 2024
 KernelVersion:	4.0
 Description:	Specific MJPEG frame descriptors
 
@@ -283,13 +283,13 @@ Description:	Specific MJPEG frame descriptors
 					   support
 		=========================  =====================================
 
-What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/uncompressed
-Date:		Dec 2014
+What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/uncompressed/name
+Date:		July 2024
 KernelVersion:	4.0
 Description:	Uncompressed format descriptors
 
-What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/uncompressed/name
-Date:		Dec 2014
+What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/uncompressed/name/name
+Date:		July 2024
 KernelVersion:	4.0
 Description:	Specific uncompressed format descriptors
 
@@ -314,8 +314,8 @@ Description:	Specific uncompressed format descriptors
 					stream-encoding format
 		==================	=======================================
 
-What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/uncompressed/name/name
-Date:		Dec 2014
+What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/uncompressed/name/name/name
+Date:		July 2024
 KernelVersion:	4.0
 Description:	Specific uncompressed frame descriptors
 
@@ -342,6 +342,70 @@ Description:	Specific uncompressed frame descriptors
 					   support
 		=========================  =====================================
 
+What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/h264/name
+Date:		July 2024
+KernelVersion:	4.0
+Description:	H264 format descriptors
+
+What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/h264/name/name
+Date:		July 2024
+KernelVersion:	4.0
+Description:	Specific H264 format descriptors
+
+		==================	=======================================
+		bFormatIndex		unique id for this format descriptor;
+					only defined after parent header is
+					linked into the streaming class;
+					read-only
+		bmaControls		this format's data for bmaControls in
+					the streaming header
+		bmInterlaceFlags	specifies interlace information,
+					read-only
+		bAspectRatioY		the X dimension of the picture aspect
+					ratio, read-only
+		bAspectRatioX		the Y dimension of the picture aspect
+					ratio, read-only
+		bDefaultFrameIndex	optimum frame index for this stream
+		bBitsPerPixel		number of bits per pixel used to
+					specify color in the decoded video
+					frame
+		guidFormat		globally unique id used to identify
+					stream-encoding format
+		==================	=======================================
+
+What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/h264/name/name/name
+Date:		July 2024
+KernelVersion:	4.0
+Description:	Specific uncompressed frame descriptors
+
+		=========================  =====================================
+		bFrameIndex		   unique id for this framedescriptor;
+					   only defined after parent format is
+					   linked into the streaming header;
+					   read-only
+		dwFrameInterval		   indicates how frame interval can be
+					   programmed; a number of values
+					   separated by newline can be specified
+		dwDefaultFrameInterval	   the frame interval the device would
+					   like to use as default
+		dwBytesPerLine	  	   Specifies the number of bytes per line
+					   of video for packed fixed frame size
+					   formats, allowing the receiver to
+					   perform stride alignment of the video.
+					   If the bVariableSize value (above) is
+					   TRUE (1), or if the format does not
+					   permit such alignment, this value shall
+					   be set to zero (0).
+		dwMaxBitRate		   the maximum bit rate at the shortest
+					   frame interval in bps
+		dwMinBitRate		   the minimum bit rate at the longest
+					   frame interval in bps
+		wHeight			   height of decoded bitmap frame in px
+		wWidth			   width of decoded bitmam frame in px
+		bmCapabilities		   still image support, fixed frame-rate
+					   support
+		=========================  =====================================
+
 What:		/config/usb-gadget/gadget/functions/uvc.name/streaming/header
 Date:		Dec 2014
 KernelVersion:	4.0
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 6fac696ea846..af292717b506 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -1571,6 +1571,7 @@ static const struct uvcg_config_group_type uvcg_control_grp_type = {
 static const char * const uvcg_format_names[] = {
 	"uncompressed",
 	"mjpeg",
+	"h264",
 };
 
 static struct uvcg_color_matching *
@@ -1776,6 +1777,8 @@ static int uvcg_streaming_header_allow_link(struct config_item *src,
 
 	target_fmt = container_of(to_config_group(target), struct uvcg_format,
 				  group);
+	if (!target_fmt)
+		goto out;
 
 	uvcg_format_set_indices(to_config_group(target));
 
@@ -1815,6 +1818,8 @@ static void uvcg_streaming_header_drop_link(struct config_item *src,
 	mutex_lock(&opts->lock);
 	target_fmt = container_of(to_config_group(target), struct uvcg_format,
 				  group);
+	if (!target_fmt)
+		goto out;
 
 	list_for_each_entry_safe(format_ptr, tmp, &src_hdr->formats, entry)
 		if (format_ptr->fmt == target_fmt) {
@@ -1825,7 +1830,7 @@ static void uvcg_streaming_header_drop_link(struct config_item *src,
 		}
 
 	--target_fmt->linked;
-
+out:
 	mutex_unlock(&opts->lock);
 	mutex_unlock(su_mutex);
 }
@@ -1921,8 +1926,8 @@ static const struct uvcg_config_group_type uvcg_streaming_header_grp_type = {
  * streaming/<mode>/<format>/<NAME>
  */
 
-#define UVCG_FRAME_ATTR(cname, aname, bits) \
-static ssize_t uvcg_frame_##cname##_show(struct config_item *item, char *page)\
+#define UVCG_FRAME_ATTR(cname, fname, bits) \
+static ssize_t uvcg_frame_##fname##_##cname##_show(struct config_item *item, char *page)\
 {									\
 	struct uvcg_frame *f = to_uvcg_frame(item);			\
 	struct f_uvc_opts *opts;					\
@@ -1936,14 +1941,14 @@ static ssize_t uvcg_frame_##cname##_show(struct config_item *item, char *page)\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
 	mutex_lock(&opts->lock);					\
-	result = sprintf(page, "%u\n", f->frame.cname);			\
+	result = scnprintf(page, PAGE_SIZE, "%u\n", f->frame.fname.cname);\
 	mutex_unlock(&opts->lock);					\
 									\
 	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
-static ssize_t  uvcg_frame_##cname##_store(struct config_item *item,	\
+static ssize_t  uvcg_frame_##fname##_##cname##_store(struct config_item *item,	\
 					   const char *page, size_t len)\
 {									\
 	struct uvcg_frame *f = to_uvcg_frame(item);			\
@@ -1951,7 +1956,7 @@ static ssize_t  uvcg_frame_##cname##_store(struct config_item *item,	\
 	struct config_item *opts_item;					\
 	struct uvcg_format *fmt;					\
 	struct mutex *su_mutex = &f->item.ci_group->cg_subsys->su_mutex;\
-	typeof(f->frame.cname) num;					\
+	typeof(f->frame.fname.cname) num;					\
 	int ret;							\
 									\
 	ret = kstrtou##bits(page, 0, &num);				\
@@ -1970,7 +1975,7 @@ static ssize_t  uvcg_frame_##cname##_store(struct config_item *item,	\
 		goto end;						\
 	}								\
 									\
-	f->frame.cname = num;						\
+	f->frame.fname.cname = num;					\
 	ret = len;							\
 end:									\
 	mutex_unlock(&opts->lock);					\
@@ -1978,7 +1983,7 @@ end:									\
 	return ret;							\
 }									\
 									\
-UVC_ATTR(uvcg_frame_, cname, aname);
+UVC_ATTR(uvcg_frame_, fname##_##cname, cname);
 
 static ssize_t uvcg_frame_b_frame_index_show(struct config_item *item,
 					     char *page)
@@ -1990,6 +1995,7 @@ static ssize_t uvcg_frame_b_frame_index_show(struct config_item *item,
 	struct config_item *fmt_item;
 	struct mutex *su_mutex = &f->item.ci_group->cg_subsys->su_mutex;
 	int result;
+	u8 frame_index = 0;
 
 	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
 
@@ -2005,7 +2011,13 @@ static ssize_t uvcg_frame_b_frame_index_show(struct config_item *item,
 	opts = to_f_uvc_opts(opts_item);
 
 	mutex_lock(&opts->lock);
-	result = sprintf(page, "%u\n", f->frame.b_frame_index);
+	if (f->fmt_type == UVCG_UNCOMPRESSED)
+		frame_index = f->frame.uf.bFrameIndex;
+	else if (f->fmt_type == UVCG_MJPEG)
+		frame_index = f->frame.mf.bFrameIndex;
+	else if (f->fmt_type == UVCG_H264)
+		frame_index = f->frame.hf.bFrameIndex;
+	result = scnprintf(page, PAGE_SIZE, "%u\n", frame_index);
 	mutex_unlock(&opts->lock);
 
 out:
@@ -2015,13 +2027,32 @@ static ssize_t uvcg_frame_b_frame_index_show(struct config_item *item,
 
 UVC_ATTR_RO(uvcg_frame_, b_frame_index, bFrameIndex);
 
-UVCG_FRAME_ATTR(bm_capabilities, bmCapabilities, 8);
-UVCG_FRAME_ATTR(w_width, wWidth, 16);
-UVCG_FRAME_ATTR(w_height, wHeight, 16);
-UVCG_FRAME_ATTR(dw_min_bit_rate, dwMinBitRate, 32);
-UVCG_FRAME_ATTR(dw_max_bit_rate, dwMaxBitRate, 32);
-UVCG_FRAME_ATTR(dw_max_video_frame_buffer_size, dwMaxVideoFrameBufferSize, 32);
-UVCG_FRAME_ATTR(dw_default_frame_interval, dwDefaultFrameInterval, 32);
+/* Declare configurable frame attributes for uncompressed format */
+UVCG_FRAME_ATTR(bmCapabilities, uf, 8);
+UVCG_FRAME_ATTR(wWidth, uf, 16);
+UVCG_FRAME_ATTR(wHeight, uf, 16);
+UVCG_FRAME_ATTR(dwMinBitRate, uf, 32);
+UVCG_FRAME_ATTR(dwMaxBitRate, uf, 32);
+UVCG_FRAME_ATTR(dwMaxVideoFrameBufferSize, uf, 32);
+UVCG_FRAME_ATTR(dwDefaultFrameInterval, uf, 32);
+
+/* Declare configurable frame attributes for mjpeg format */
+UVCG_FRAME_ATTR(bmCapabilities, mf, 8);
+UVCG_FRAME_ATTR(wWidth, mf, 16);
+UVCG_FRAME_ATTR(wHeight, mf, 16);
+UVCG_FRAME_ATTR(dwMinBitRate, mf, 32);
+UVCG_FRAME_ATTR(dwMaxBitRate, mf, 32);
+UVCG_FRAME_ATTR(dwMaxVideoFrameBufferSize, mf, 32);
+UVCG_FRAME_ATTR(dwDefaultFrameInterval, mf, 32);
+
+/* Declare configurable frame attributes for h264 format */
+UVCG_FRAME_ATTR(bmCapabilities, hf, 8);
+UVCG_FRAME_ATTR(wWidth, hf, 16);
+UVCG_FRAME_ATTR(wHeight, hf, 16);
+UVCG_FRAME_ATTR(dwMinBitRate, hf, 32);
+UVCG_FRAME_ATTR(dwMaxBitRate, hf, 32);
+UVCG_FRAME_ATTR(dwDefaultFrameInterval, hf, 32);
+UVCG_FRAME_ATTR(dwBytesPerLine, hf, 32);
 
 #undef UVCG_FRAME_ATTR
 
@@ -2032,7 +2063,7 @@ static ssize_t uvcg_frame_dw_frame_interval_show(struct config_item *item,
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
 	struct mutex *su_mutex = &frm->item.ci_group->cg_subsys->su_mutex;
-	int result, i;
+	int result, i, n;
 	char *pg = page;
 
 	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
@@ -2041,7 +2072,15 @@ static ssize_t uvcg_frame_dw_frame_interval_show(struct config_item *item,
 	opts = to_f_uvc_opts(opts_item);
 
 	mutex_lock(&opts->lock);
-	for (result = 0, i = 0; i < frm->frame.b_frame_interval_type; ++i) {
+	n = 0;
+	if (frm->fmt_type == UVCG_UNCOMPRESSED)
+		n = frm->frame.uf.bFrameIntervalType;
+	else if (frm->fmt_type == UVCG_MJPEG)
+		n = frm->frame.mf.bFrameIntervalType;
+	else if (frm->fmt_type == UVCG_H264)
+		n = frm->frame.hf.bNumFrameIntervals;
+
+	for (result = 0, i = 0; i < n; ++i) {
 		result += sprintf(pg, "%u\n", frm->dw_frame_interval[i]);
 		pg = page + result;
 	}
@@ -2092,7 +2131,13 @@ static ssize_t uvcg_frame_dw_frame_interval_store(struct config_item *item,
 
 	kfree(ch->dw_frame_interval);
 	ch->dw_frame_interval = frm_intrv;
-	ch->frame.b_frame_interval_type = n;
+	if (ch->fmt_type == UVCG_UNCOMPRESSED)
+		ch->frame.uf.bFrameIntervalType = n;
+	else if (ch->fmt_type == UVCG_MJPEG)
+		ch->frame.mf.bFrameIntervalType = n;
+	else if (ch->fmt_type == UVCG_H264)
+		ch->frame.hf.bNumFrameIntervals = n;
+
 	sort(ch->dw_frame_interval, n, sizeof(*ch->dw_frame_interval),
 	     uvcg_config_compare_u32, NULL);
 	ret = len;
@@ -2105,22 +2150,57 @@ static ssize_t uvcg_frame_dw_frame_interval_store(struct config_item *item,
 
 UVC_ATTR(uvcg_frame_, dw_frame_interval, dwFrameInterval);
 
-static struct configfs_attribute *uvcg_frame_attrs[] = {
+static struct configfs_attribute *uvcg_uncompressed_frame_attrs[] = {
 	&uvcg_frame_attr_b_frame_index,
-	&uvcg_frame_attr_bm_capabilities,
-	&uvcg_frame_attr_w_width,
-	&uvcg_frame_attr_w_height,
-	&uvcg_frame_attr_dw_min_bit_rate,
-	&uvcg_frame_attr_dw_max_bit_rate,
-	&uvcg_frame_attr_dw_max_video_frame_buffer_size,
-	&uvcg_frame_attr_dw_default_frame_interval,
+	&uvcg_frame_attr_uf_bmCapabilities,
+	&uvcg_frame_attr_uf_wWidth,
+	&uvcg_frame_attr_uf_wHeight,
+	&uvcg_frame_attr_uf_dwMinBitRate,
+	&uvcg_frame_attr_uf_dwMaxBitRate,
+	&uvcg_frame_attr_uf_dwMaxVideoFrameBufferSize,
+	&uvcg_frame_attr_uf_dwDefaultFrameInterval,
 	&uvcg_frame_attr_dw_frame_interval,
 	NULL,
 };
 
-static const struct config_item_type uvcg_frame_type = {
-	.ct_item_ops	= &uvcg_config_item_ops,
-	.ct_attrs	= uvcg_frame_attrs,
+static struct configfs_attribute *uvcg_mjpeg_frame_attrs[] = {
+	&uvcg_frame_attr_b_frame_index,
+	&uvcg_frame_attr_mf_bmCapabilities,
+	&uvcg_frame_attr_mf_wWidth,
+	&uvcg_frame_attr_mf_wHeight,
+	&uvcg_frame_attr_mf_dwMinBitRate,
+	&uvcg_frame_attr_mf_dwMaxBitRate,
+	&uvcg_frame_attr_mf_dwMaxVideoFrameBufferSize,
+	&uvcg_frame_attr_mf_dwDefaultFrameInterval,
+	&uvcg_frame_attr_dw_frame_interval,
+	NULL,
+};
+
+static struct configfs_attribute *uvcg_h264_frame_attrs[] = {
+	&uvcg_frame_attr_b_frame_index,
+	&uvcg_frame_attr_hf_bmCapabilities,
+	&uvcg_frame_attr_hf_wWidth,
+	&uvcg_frame_attr_hf_wHeight,
+	&uvcg_frame_attr_hf_dwMinBitRate,
+	&uvcg_frame_attr_hf_dwMaxBitRate,
+	&uvcg_frame_attr_hf_dwDefaultFrameInterval,
+	&uvcg_frame_attr_dw_frame_interval,
+	&uvcg_frame_attr_hf_dwBytesPerLine,
+	NULL,
+};
+
+static struct config_item_type uvcg_uncompressed_frame_type = {
+	.ct_attrs	= uvcg_uncompressed_frame_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_item_type uvcg_mjpeg_frame_type = {
+	.ct_attrs	= uvcg_mjpeg_frame_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_item_type uvcg_h264_frame_type = {
+	.ct_attrs	= uvcg_h264_frame_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -2131,20 +2211,17 @@ static struct config_item *uvcg_frame_make(struct config_group *group,
 	struct uvcg_format *fmt;
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct uvcg_frame_ptr *frame_ptr;
+	struct config_item_type *uvcg_frame_config_item;
+	struct uvc_frame_uncompressed *uf;
 
 	h = kzalloc(sizeof(*h), GFP_KERNEL);
 	if (!h)
 		return ERR_PTR(-ENOMEM);
 
-	h->frame.b_descriptor_type		= USB_DT_CS_INTERFACE;
-	h->frame.b_frame_index			= 1;
-	h->frame.w_width			= 640;
-	h->frame.w_height			= 360;
-	h->frame.dw_min_bit_rate		= 18432000;
-	h->frame.dw_max_bit_rate		= 55296000;
-	h->frame.dw_max_video_frame_buffer_size	= 460800;
-	h->frame.dw_default_frame_interval	= 666666;
+	uf = &h->frame.uf;
+
+	uf->bDescriptorType		= USB_DT_CS_INTERFACE;
+	uf->bFrameIndex			= 1;
 
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -2152,30 +2229,55 @@ static struct config_item *uvcg_frame_make(struct config_group *group,
 	mutex_lock(&opts->lock);
 	fmt = to_uvcg_format(&group->cg_item);
 	if (fmt->type == UVCG_UNCOMPRESSED) {
-		h->frame.b_descriptor_subtype = UVC_VS_FRAME_UNCOMPRESSED;
+		uf->bDescriptorSubType	= UVC_VS_FRAME_UNCOMPRESSED;
+		uf->wWidth			= cpu_to_le16(640);
+		uf->wHeight			= cpu_to_le16(360);
+		uf->dwMinBitRate		= cpu_to_le32(18432000);
+		uf->dwMaxBitRate		= cpu_to_le32(55296000);
+		uf->dwMaxVideoFrameBufferSize	= cpu_to_le32(460800);
+		uf->dwDefaultFrameInterval	= cpu_to_le32(666666);
+
 		h->fmt_type = UVCG_UNCOMPRESSED;
+		uvcg_frame_config_item = &uvcg_uncompressed_frame_type;
 	} else if (fmt->type == UVCG_MJPEG) {
-		h->frame.b_descriptor_subtype = UVC_VS_FRAME_MJPEG;
+		struct uvc_frame_mjpeg *mf = &h->frame.mf;
+
+		mf->bDescriptorType		= USB_DT_CS_INTERFACE;
+		mf->bFrameIndex			= 1;
+		mf->bDescriptorSubType	= UVC_VS_FRAME_MJPEG;
+		mf->wWidth			= cpu_to_le16(640);
+		mf->wHeight			= cpu_to_le16(360);
+		mf->dwMinBitRate		= cpu_to_le32(18432000);
+		mf->dwMaxBitRate		= cpu_to_le32(55296000);
+		mf->dwMaxVideoFrameBufferSize	= cpu_to_le32(460800);
+		mf->dwDefaultFrameInterval	= cpu_to_le32(666666);
+
 		h->fmt_type = UVCG_MJPEG;
+		uvcg_frame_config_item = &uvcg_mjpeg_frame_type;
+	} else if (fmt->type == UVCG_H264) {
+		struct uvc_frame_h264 *hf = &h->frame.hf;
+
+		hf->bDescriptorSubType	= UVC_VS_FRAME_FRAME_BASED;
+		hf->wWidth			= cpu_to_le16(1920);
+		hf->wHeight			= cpu_to_le16(1080);
+		hf->dwMinBitRate		= cpu_to_le32(29491200);
+		hf->dwMaxBitRate		= cpu_to_le32(100000000);
+		hf->dwDefaultFrameInterval	= cpu_to_le32(333667);
+		hf->bmCapabilities	= 0x00;
+		hf->dwBytesPerLine	= 0;
+
+		h->fmt_type = UVCG_H264;
+		uvcg_frame_config_item = &uvcg_h264_frame_type;
 	} else {
 		mutex_unlock(&opts->lock);
 		kfree(h);
 		return ERR_PTR(-EINVAL);
 	}
 
-	frame_ptr = kzalloc(sizeof(*frame_ptr), GFP_KERNEL);
-	if (!frame_ptr) {
-		mutex_unlock(&opts->lock);
-		kfree(h);
-		return ERR_PTR(-ENOMEM);
-	}
-
-	frame_ptr->frm = h;
-	list_add_tail(&frame_ptr->entry, &fmt->frames);
 	++fmt->num_frames;
 	mutex_unlock(&opts->lock);
 
-	config_item_init_type_name(&h->item, name, &uvcg_frame_type);
+	config_item_init_type_name(&h->item, name, uvcg_frame_config_item);
 
 	return &h->item;
 }
@@ -2185,23 +2287,14 @@ static void uvcg_frame_drop(struct config_group *group, struct config_item *item
 	struct uvcg_format *fmt;
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct uvcg_frame *target_frm = NULL;
-	struct uvcg_frame_ptr *frame_ptr, *tmp;
 
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
 	mutex_lock(&opts->lock);
-	target_frm = container_of(item, struct uvcg_frame, item);
 	fmt = to_uvcg_format(&group->cg_item);
 
-	list_for_each_entry_safe(frame_ptr, tmp, &fmt->frames, entry)
-		if (frame_ptr->frm == target_frm) {
-			list_del(&frame_ptr->entry);
-			kfree(frame_ptr);
-			--fmt->num_frames;
-			break;
-		}
+	--fmt->num_frames;
 	mutex_unlock(&opts->lock);
 
 	config_item_put(item);
@@ -2215,11 +2308,20 @@ static void uvcg_format_set_indices(struct config_group *fmt)
 	list_for_each_entry(ci, &fmt->cg_children, ci_entry) {
 		struct uvcg_frame *frm;
 
-		if (ci->ci_type != &uvcg_frame_type)
+		if ((ci->ci_type != &uvcg_uncompressed_frame_type) ||
+				(ci->ci_type != &uvcg_mjpeg_frame_type) ||
+				(ci->ci_type != &uvcg_h264_frame_type))
 			continue;
 
 		frm = to_uvcg_frame(ci);
-		frm->frame.b_frame_index = i++;
+		if (frm->fmt_type == UVCG_UNCOMPRESSED)
+			frm->frame.uf.bFrameIndex = i;
+		else if (frm->fmt_type == UVCG_MJPEG)
+			frm->frame.mf.bFrameIndex = i;
+		else if (frm->fmt_type == UVCG_H264)
+			frm->frame.hf.bFrameIndex = i;
+
+		i++;
 	}
 }
 
@@ -2464,7 +2566,6 @@ static struct config_group *uvcg_uncompressed_make(struct config_group *group,
 	h->desc.bmInterlaceFlags	= 0;
 	h->desc.bCopyProtect		= 0;
 
-	INIT_LIST_HEAD(&h->fmt.frames);
 	h->fmt.type = UVCG_UNCOMPRESSED;
 	h->fmt.color_matching = color_match;
 	color_match->refcnt++;
@@ -2654,7 +2755,6 @@ static struct config_group *uvcg_mjpeg_make(struct config_group *group,
 	h->desc.bmInterlaceFlags	= 0;
 	h->desc.bCopyProtect		= 0;
 
-	INIT_LIST_HEAD(&h->fmt.frames);
 	h->fmt.type = UVCG_MJPEG;
 	h->fmt.color_matching = color_match;
 	color_match->refcnt++;
@@ -2677,6 +2777,263 @@ static const struct uvcg_config_group_type uvcg_mjpeg_grp_type = {
 	.name = "mjpeg",
 };
 
+/* -----------------------------------------------------------------------------
+ * streaming/h264/<NAME>
+ */
+
+struct uvcg_h264 {
+	struct uvcg_format		fmt;
+	struct uvc_format_h264		desc;
+};
+
+static struct uvcg_h264 *to_uvcg_h264(struct config_item *item)
+{
+	return container_of(
+		container_of(to_config_group(item), struct uvcg_format, group),
+		struct uvcg_h264, fmt);
+}
+
+static struct configfs_group_operations uvcg_h264_group_ops = {
+	.make_item		= uvcg_frame_make,
+	.drop_item		= uvcg_frame_drop,
+};
+
+#define UVCG_H264_ATTR_RO(cname, aname, bits)				\
+static ssize_t uvcg_h264_##cname##_show(struct config_item *item, char *page)\
+{									\
+	struct uvcg_h264 *u = to_uvcg_h264(item);			\
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
+	result = scnprintf(page, PAGE_SIZE, "%u\n",			\
+			le##bits##_to_cpu(u->desc.aname));		\
+	mutex_unlock(&opts->lock);					\
+									\
+	mutex_unlock(su_mutex);						\
+	return result;							\
+}									\
+									\
+UVC_ATTR_RO(uvcg_h264_, cname, aname)
+
+#define UVCG_H264_ATTR(cname, aname, bits)				\
+static ssize_t uvcg_h264_##cname##_show(struct config_item *item, char *page)\
+{									\
+	struct uvcg_h264 *u = to_uvcg_h264(item);			\
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
+	result = scnprintf(page, PAGE_SIZE, "%u\n",			\
+			le##bits##_to_cpu(u->desc.aname));		\
+	mutex_unlock(&opts->lock);					\
+									\
+	mutex_unlock(su_mutex);						\
+	return result;							\
+}									\
+									\
+static ssize_t								\
+uvcg_h264_##cname##_store(struct config_item *item,			\
+			   const char *page, size_t len)		\
+{									\
+	struct uvcg_h264 *u = to_uvcg_h264(item);			\
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
+UVC_ATTR(uvcg_h264_, cname, aname)
+
+UVCG_H264_ATTR_RO(b_format_index, bFormatIndex, 8);
+UVCG_H264_ATTR_RO(b_bits_per_pixel, bBitsPerPixel, 8);
+UVCG_H264_ATTR(b_default_frame_index, bDefaultFrameIndex, 8);
+UVCG_H264_ATTR_RO(b_aspect_ratio_x, bAspectRatioX, 8);
+UVCG_H264_ATTR_RO(b_aspect_ratio_y, bAspectRatioY, 8);
+UVCG_H264_ATTR_RO(bm_interface_flags, bmInterfaceFlags, 8);
+
+#undef UVCG_H264_ATTR
+#undef UVCG_H264_ATTR_RO
+
+static ssize_t uvcg_h264_guid_format_show(struct config_item *item,
+		char *page)
+{
+	struct uvcg_h264 *u = to_uvcg_h264(item);
+	struct f_uvc_opts *opts;
+	struct config_item *opts_item;
+	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;
+
+	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
+
+	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+	memcpy(page, u->desc.guidFormat, sizeof(u->desc.guidFormat));
+	mutex_unlock(&opts->lock);
+
+	mutex_unlock(su_mutex);
+
+	return sizeof(u->desc.guidFormat);
+}
+
+static ssize_t uvcg_h264_guid_format_store(struct config_item *item,
+		const char *page, size_t len)
+{
+	struct uvcg_h264 *u = to_uvcg_h264(item);
+	struct f_uvc_opts *opts;
+	struct config_item *opts_item;
+	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;
+	int ret;
+
+	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
+
+	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+	if (u->fmt.linked || opts->refcnt) {
+		ret = -EBUSY;
+		goto end;
+	}
+
+	memcpy(u->desc.guidFormat, page,
+			min(sizeof(u->desc.guidFormat), len));
+	ret = sizeof(u->desc.guidFormat);
+
+end:
+	mutex_unlock(&opts->lock);
+	mutex_unlock(su_mutex);
+	return ret;
+}
+
+UVC_ATTR(uvcg_h264_, guid_format, guidFormat);
+
+static inline ssize_t
+uvcg_h264_bma_controls_show(struct config_item *item, char *page)
+{
+	struct uvcg_h264 *u = to_uvcg_h264(item);
+
+	return uvcg_format_bma_controls_show(&u->fmt, page);
+}
+
+static inline ssize_t
+uvcg_h264_bma_controls_store(struct config_item *item,
+				     const char *page, size_t len)
+{
+	struct uvcg_h264 *u = to_uvcg_h264(item);
+
+	return uvcg_format_bma_controls_store(&u->fmt, page, len);
+}
+
+UVC_ATTR(uvcg_h264_, bma_controls, bmaControls);
+
+static struct configfs_attribute *uvcg_h264_attrs[] = {
+	&uvcg_h264_attr_b_format_index,
+	&uvcg_h264_attr_b_default_frame_index,
+	&uvcg_h264_attr_b_bits_per_pixel,
+	&uvcg_h264_attr_b_aspect_ratio_x,
+	&uvcg_h264_attr_b_aspect_ratio_y,
+	&uvcg_h264_attr_bm_interface_flags,
+	&uvcg_h264_attr_bma_controls,
+	&uvcg_h264_attr_guid_format,
+	NULL,
+};
+
+static struct config_item_type uvcg_h264_type = {
+	.ct_item_ops	= &uvcg_config_item_ops,
+	.ct_group_ops	= &uvcg_h264_group_ops,
+	.ct_attrs	= uvcg_h264_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *uvcg_h264_make(struct config_group *group,
+						   const char *name)
+{
+	struct uvcg_h264 *h;
+	static char guid[] = { /*Declear frame framebased as H264*/
+		'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00,
+		0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71
+	};
+
+	h = kzalloc(sizeof(*h), GFP_KERNEL);
+	if (!h)
+		return ERR_PTR(-ENOMEM);
+
+	h->desc.bLength			= UVC_DT_FORMAT_FRAMEBASED_SIZE;
+	h->desc.bDescriptorType		= USB_DT_CS_INTERFACE;
+	h->desc.bDescriptorSubType	= UVC_VS_FORMAT_FRAME_BASED;
+	memcpy(h->desc.guidFormat, guid, sizeof(guid));
+	h->desc.bBitsPerPixel		= 16;
+	h->desc.bDefaultFrameIndex	= 1;
+	h->desc.bAspectRatioX		= 0;
+	h->desc.bAspectRatioY		= 0;
+	h->desc.bmInterfaceFlags	= 0;
+	h->desc.bCopyProtect		= 0;
+	h->desc.bVariableSize		= 1;
+
+	h->fmt.type = UVCG_H264;
+	config_group_init_type_name(&h->fmt.group, name,
+				    &uvcg_h264_type);
+
+	return &h->fmt.group;
+}
+
+static struct configfs_group_operations uvcg_h264_grp_ops = {
+	.make_group		= uvcg_h264_make,
+};
+
+static const struct uvcg_config_group_type uvcg_h264_grp_type = {
+	.type = {
+		.ct_item_ops	= &uvcg_config_item_ops,
+		.ct_group_ops	= &uvcg_h264_grp_ops,
+		.ct_owner	= THIS_MODULE,
+	},
+	.name = "h264",
+};
+
+
 /* -----------------------------------------------------------------------------
  * streaming/color_matching/default
  */
@@ -2912,6 +3269,7 @@ static int __uvcg_iter_strm_cls(struct uvcg_streaming_header *h,
 		if (ret)
 			return ret;
 		grp = &f->fmt->group;
+		j = 0;
 		list_for_each_entry(item, &grp->cg_children, ci_entry) {
 			frm = to_uvcg_frame(item);
 			ret = fun(frm, priv2, priv3, j++, UVCG_FRAME);
@@ -2965,6 +3323,11 @@ static int __uvcg_cnt_strm(void *priv1, void *priv2, void *priv3, int n,
 				container_of(fmt, struct uvcg_mjpeg, fmt);
 
 			*size += sizeof(m->desc);
+		} else if (fmt->type == UVCG_H264) {
+			struct uvcg_h264 *h =
+				container_of(fmt, struct uvcg_h264, fmt);
+
+			*size += sizeof(h->desc);
 		} else {
 			return -EINVAL;
 		}
@@ -2972,10 +3335,23 @@ static int __uvcg_cnt_strm(void *priv1, void *priv2, void *priv3, int n,
 	break;
 	case UVCG_FRAME: {
 		struct uvcg_frame *frm = priv1;
-		int sz = sizeof(frm->dw_frame_interval);
 
-		*size += sizeof(frm->frame);
-		*size += frm->frame.b_frame_interval_type * sz;
+		if (frm->fmt_type == UVCG_UNCOMPRESSED) {
+			struct uvc_frame_uncompressed uf =
+				frm->frame.uf;
+			*size +=
+			UVC_DT_FRAME_UNCOMPRESSED_SIZE(uf.bFrameIntervalType);
+		} else if (frm->fmt_type == UVCG_MJPEG) {
+			struct uvc_frame_mjpeg mf =
+				frm->frame.mf;
+			*size +=
+			UVC_DT_FRAME_MJPEG_SIZE(mf.bFrameIntervalType);
+		} else if (frm->fmt_type == UVCG_H264) {
+			struct uvc_frame_h264 hf =
+				frm->frame.hf;
+			*size +=
+			UVC_DT_FRAME_H264_SIZE(hf.bNumFrameIntervals);
+		}
 	}
 	break;
 	case UVCG_COLOR_MATCHING: {
@@ -3045,6 +3421,14 @@ static int __uvcg_fill_strm(void *priv1, void *priv2, void *priv3, int n,
 			m->desc.bNumFrameDescriptors = fmt->num_frames;
 			memcpy(*dest, &m->desc, sizeof(m->desc));
 			*dest += sizeof(m->desc);
+		} else if (fmt->type == UVCG_H264) {
+			struct uvcg_h264 *h =
+				container_of(fmt, struct uvcg_h264, fmt);
+
+			h->desc.bFormatIndex = n + 1;
+			h->desc.bNumFrameDescriptors = fmt->num_frames;
+			memcpy(*dest, &h->desc, sizeof(h->desc));
+			*dest += sizeof(h->desc);
 		} else {
 			return -EINVAL;
 		}
@@ -3052,21 +3436,46 @@ static int __uvcg_fill_strm(void *priv1, void *priv2, void *priv3, int n,
 	break;
 	case UVCG_FRAME: {
 		struct uvcg_frame *frm = priv1;
-		struct uvc_descriptor_header *h = *dest;
 
-		sz = sizeof(frm->frame);
-		memcpy(*dest, &frm->frame, sz);
-		*dest += sz;
-		sz = frm->frame.b_frame_interval_type *
-			sizeof(*frm->dw_frame_interval);
+		if (frm->fmt_type == UVCG_UNCOMPRESSED) {
+			struct uvc_frame_uncompressed *uf =
+				&frm->frame.uf;
+			uf->bLength = UVC_DT_FRAME_UNCOMPRESSED_SIZE(
+				uf->bFrameIntervalType);
+			uf->bFrameIndex = n+1;
+			sz = UVC_DT_FRAME_UNCOMPRESSED_SIZE(0);
+			memcpy(*dest, uf, sz);
+			*dest += sz;
+			sz = uf->bFrameIntervalType *
+				sizeof(*frm->dw_frame_interval);
+		} else if (frm->fmt_type == UVCG_MJPEG) {
+			struct uvc_frame_mjpeg *mf =
+				&frm->frame.mf;
+			mf->bLength = UVC_DT_FRAME_MJPEG_SIZE(
+				mf->bFrameIntervalType);
+			mf->bFrameIndex = n+1;
+			sz = UVC_DT_FRAME_MJPEG_SIZE(0);
+			memcpy(*dest, mf, sz);
+			*dest += sz;
+			sz = mf->bFrameIntervalType *
+				sizeof(*frm->dw_frame_interval);
+		} else if (frm->fmt_type == UVCG_H264) {
+			struct uvc_frame_h264 *hf =
+				&frm->frame.hf;
+			hf->bLength = UVC_DT_FRAME_H264_SIZE(
+				hf->bNumFrameIntervals);
+			hf->bFrameIndex = n+1;
+			sz = UVC_DT_FRAME_H264_SIZE(0);
+			memcpy(*dest, hf, sz);
+			*dest += sz;
+			sz = hf->bNumFrameIntervals *
+				sizeof(*frm->dw_frame_interval);
+		} else {
+			return -EINVAL;
+		}
+
 		memcpy(*dest, frm->dw_frame_interval, sz);
 		*dest += sz;
-		if (frm->fmt_type == UVCG_UNCOMPRESSED)
-			h->bLength = UVC_DT_FRAME_UNCOMPRESSED_SIZE(
-				frm->frame.b_frame_interval_type);
-		else if (frm->fmt_type == UVCG_MJPEG)
-			h->bLength = UVC_DT_FRAME_MJPEG_SIZE(
-				frm->frame.b_frame_interval_type);
 	}
 	break;
 	case UVCG_COLOR_MATCHING: {
@@ -3285,6 +3694,7 @@ static const struct uvcg_config_group_type uvcg_streaming_grp_type = {
 		&uvcg_streaming_header_grp_type,
 		&uvcg_uncompressed_grp_type,
 		&uvcg_mjpeg_grp_type,
+		&uvcg_h264_grp_type,
 		&uvcg_color_matching_grp_type,
 		&uvcg_streaming_class_grp_type,
 		NULL,
diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gadget/function/uvc_configfs.h
index c6a690158138..31d01a79dbac 100644
--- a/drivers/usb/gadget/function/uvc_configfs.h
+++ b/drivers/usb/gadget/function/uvc_configfs.h
@@ -49,6 +49,7 @@ container_of(group_ptr, struct uvcg_color_matching, group)
 enum uvcg_format_type {
 	UVCG_UNCOMPRESSED = 0,
 	UVCG_MJPEG,
+	UVCG_H264,
 };
 
 struct uvcg_format {
@@ -92,20 +93,11 @@ struct uvcg_frame_ptr {
 struct uvcg_frame {
 	struct config_item	item;
 	enum uvcg_format_type	fmt_type;
-	struct {
-		u8	b_length;
-		u8	b_descriptor_type;
-		u8	b_descriptor_subtype;
-		u8	b_frame_index;
-		u8	bm_capabilities;
-		u16	w_width;
-		u16	w_height;
-		u32	dw_min_bit_rate;
-		u32	dw_max_bit_rate;
-		u32	dw_max_video_frame_buffer_size;
-		u32	dw_default_frame_interval;
-		u8	b_frame_interval_type;
-	} __attribute__((packed)) frame;
+	union {
+		struct uvc_frame_uncompressed uf;
+		struct uvc_frame_mjpeg mf;
+		struct uvc_frame_h264 hf;
+	} frame;
 	u32 *dw_frame_interval;
 };
 
@@ -142,6 +134,20 @@ static inline struct uvcg_mjpeg *to_uvcg_mjpeg(struct config_item *item)
 	return container_of(to_uvcg_format(item), struct uvcg_mjpeg, fmt);
 }
 
+/* -----------------------------------------------------------------------------
+ * streaming/framebased/<NAME>
+ */
+
+struct uvcg_framebased {
+	struct uvcg_format              fmt;
+	struct uvc_format_h264          desc;
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
index a024aecb76dc..d9355be6cd34 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -31,14 +31,23 @@ static const struct uvc_format_desc *to_uvc_format(struct uvcg_format *uformat)
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
 
 		memcpy(guid, unc->desc.guidFormat, sizeof(guid));
+	} else if (uformat->type == UVCG_H264) {
+		struct uvcg_framebased *fb;
+
+		fb = to_uvcg_framebased(&uformat->group.cg_item);
+		if (!fb)
+			return ERR_PTR(-EINVAL);
+
+		memcpy(guid, fb->desc.guidFormat, sizeof(guid));
 	}
 
 	format = uvc_format_by_guid(guid);
@@ -58,19 +67,23 @@ static int uvc_v4l2_get_bytesperline(struct uvcg_format *uformat,
 		if (!u)
 			return 0;
 
-		return u->desc.bBitsPerPixel * uframe->frame.w_width / 8;
+		return u->desc.bBitsPerPixel * uframe->frame.uf.wWidth / 8;
 	}
 
 	return 0;
 }
 
 static int uvc_get_frame_size(struct uvcg_format *uformat,
-		       struct uvcg_frame *uframe)
+		struct uvcg_frame *uframe)
 {
 	unsigned int bpl = uvc_v4l2_get_bytesperline(uformat, uframe);
 
-	return bpl ? bpl * uframe->frame.w_height :
-		uframe->frame.dw_max_video_frame_buffer_size;
+	if (uformat->type == UVCG_MJPEG)
+		return uframe->frame.mf.dwMaxVideoFrameBufferSize;
+	else if (uformat->type == UVCG_H264)
+		return uframe->frame.hf.wWidth * uframe->frame.hf.wHeight;
+
+	return bpl ? bpl * uframe->frame.uf.wHeight : 0;
 }
 
 static struct uvcg_format *find_format_by_index(struct uvc_device *uvc, int index)
@@ -95,16 +108,37 @@ static struct uvcg_frame *find_frame_by_index(struct uvc_device *uvc,
 				       int index)
 {
 	struct uvcg_format_ptr *format;
-	struct uvcg_frame_ptr *frame;
+	struct uvcg_frame *frame;
 	struct uvcg_frame *uframe = NULL;
+	struct config_group *grp;
+	struct config_item *item;
+
 
 	list_for_each_entry(format, &uvc->header->formats, entry) {
 		if (format->fmt->type != uformat->type)
 			continue;
-		list_for_each_entry(frame, &format->fmt->frames, entry) {
-			if (index == frame->frm->frame.b_frame_index) {
-				uframe = frame->frm;
-				break;
+
+		grp = &format->fmt->group;
+		list_for_each_entry(item, &grp->cg_children, ci_entry) {
+			frame = to_uvcg_frame(item);
+			switch (frm->fmt_type) {
+			case UVCG_UNCOMPRESSED:
+				if (index == frame->frame.uf.bFrameIndex) {
+					uframe = frame->frame;
+					break;
+				}
+			case UVCG_MJPEG:
+				if (index == frame->frame.mf.bFrameIndex) {
+					uframe = frame->frame;
+					break;
+				}
+			case UVCG_H264:
+				if (index == frame->frame.hf.bFrameIndex) {
+					uframe = frame->frame;
+					break;
+				}
+			default:
+				continue;
 			}
 		}
 	}
@@ -136,8 +170,10 @@ static struct uvcg_frame *find_closest_frame_by_size(struct uvc_device *uvc,
 {
 	struct uvc_video *video = &uvc->video;
 	struct uvcg_format_ptr *format;
-	struct uvcg_frame_ptr *frame;
+	struct uvcg_frame *frame;
 	struct uvcg_frame *uframe = NULL;
+	struct config_group *grp;
+	struct config_item *item;
 	unsigned int d, maxd;
 
 	/* Find the closest image size. The distance between image sizes is
@@ -150,11 +186,27 @@ static struct uvcg_frame *find_closest_frame_by_size(struct uvc_device *uvc,
 		if (format->fmt->type != uformat->type)
 			continue;
 
-		list_for_each_entry(frame, &format->fmt->frames, entry) {
+		grp = &format->fmt->group;
+		list_for_each_entry(item, &grp->cg_children, ci_entry) {
 			u16 w, h;
 
-			w = frame->frm->frame.w_width;
-			h = frame->frm->frame.w_height;
+			frame = to_uvcg_frame(item);
+			switch (frame->fmt_type) {
+			case UVCG_UNCOMPRESSED:
+				w = frame->frame.uf.wWidth;
+				h = frame->frame.uf.wHeight;
+				break;
+			case UVCG_MJPEG:
+				w = frame->frame.mf.wWidth;
+				h = frame->frame.mf.wHeight;
+				break;
+			case UVCG_H264:
+				w = frame->frame.hf.wWidth;
+				h = frame->frame.hf.wHeight;
+				break;
+			default:
+				continue;
+			}
 
 			d = min(w, rw) * min(h, rh);
 			d = w*h + rw*rh - 2*d;
diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
index 2ff0e8a3a683..3d77703063c7 100644
--- a/include/uapi/linux/usb/video.h
+++ b/include/uapi/linux/usb/video.h
@@ -55,6 +55,8 @@
 #define UVC_VS_FORMAT_FRAME_BASED			0x10
 #define UVC_VS_FRAME_FRAME_BASED			0x11
 #define UVC_VS_FORMAT_STREAM_BASED			0x12
+#define UVC_VS_FORMAT_H264				0x13
+#define UVC_VS_FRAME_H264				0x14
 
 /* A.7. Video Class-Specific Endpoint Descriptor Subtypes */
 #define UVC_EP_UNDEFINED				0x00
@@ -597,5 +599,65 @@ struct UVC_FRAME_MJPEG(n) {				\
 	__le32 dwFrameInterval[n];			\
 } __attribute__ ((packed))
 
+/* H264 Payload - 3.1.1. H264 Video Format Descriptor */
+struct uvc_format_h264 {
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
+#define UVC_DT_FORMAT_H264_SIZE		52
+#define UVC_DT_FORMAT_FRAMEBASED_SIZE			28
+
+/* H264 Payload - 3.1.2. H264 Video Frame Descriptor */
+struct uvc_frame_h264 {
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
+	__u8  bNumFrameIntervals;
+	__u32 dwBytesPerLine;
+	__u32 dwFrameInterval[];
+} __attribute__((__packed__));
+
+#define UVC_DT_FRAME_H264_SIZE(n)			(26+4*(n))
+#define UVC_DT_FRAME_FRAMEBASED_SIZE(n)			(26+4*(n))
+
+#define UVC_FRAME_H264(n) \
+	uvc_frame_h264_##n
+
+#define DECLARE_UVC_FRAME_H264(n)			\
+struct UVC_FRAME_H264(n) {				\
+	__u8  bLength;					\
+	__u8  bDescriptorType;				\
+	__u8  bDescriptorSubType;			\
+	__u8  bFrameIndex;				\
+	__u8  bmCapabilities;				\
+	__u16 wWidth;					\
+	__u16 wHeight;					\
+	__u32 dwMinBitRate;				\
+	__u32 dwMaxBitRate;				\
+	__u32 dwDefaultFrameInterval;			\
+	__u8  bNumFrameIntervals;			\
+	__u32 dwBytesPerLine;				\
+	__u32 dwFrameInterval[n];			\
+} __attribute__ ((packed))
+
 #endif /* __LINUX_USB_VIDEO_H */
 
-- 
2.17.1


