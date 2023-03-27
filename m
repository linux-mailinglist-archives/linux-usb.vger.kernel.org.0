Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB1E26CA0FF
	for <lists+linux-usb@lfdr.de>; Mon, 27 Mar 2023 12:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233052AbjC0KMr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Mar 2023 06:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233526AbjC0KMo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Mar 2023 06:12:44 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75F6E5BBE
        for <linux-usb@vger.kernel.org>; Mon, 27 Mar 2023 03:12:39 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32RA6ksm015298;
        Mon, 27 Mar 2023 10:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=0q6OHVbkTME1GfwU1EMwE22Z2dAXEP8fWfK8+1mI1mc=;
 b=X1uH4+I1lb0pBY89sL2iM9OfLr29hJyejV2Lov1+m3TyPhuGEc7T5vnOv7qmPmG1PF89
 nmu0F74Em7xd+IA7lvS5ZRPb31rDwiEiCzxdTW0z+ek7dL+Tru9gf4t8xiMQdc5V2ThU
 j6A2ljpS3lzOV9LD88s3B3FWMzxU9q6gVZ9s7KCNiQYKc63adJsDhvhGK3Y0NYrV+48B
 dMSmymabglBZlnv+ioklxCkowRjl8Jyr7sZbswxtP0C8vejT5FpwWUcR/ygm7oiWPiVm
 ZOqaBeq5xVcv6wlOgb7rYVmkN+2xDuv4dXdwzvFAlcJkUsErD1vc7/8gB1tD2de3ugyn hg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3phsr343qq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Mar 2023 10:12:37 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32RACats010824
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Mar 2023 10:12:36 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 27 Mar 2023 03:12:35 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v3 6/6] usb: gadget: f_fs: show instance name in debug message
Date:   Mon, 27 Mar 2023 18:12:20 +0800
Message-ID: <1679911940-4727-6-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1679911940-4727-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1679911940-4727-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zVmK6NrywG7YLz7fdCp8qxaB3usC3jii
X-Proofpoint-ORIG-GUID: zVmK6NrywG7YLz7fdCp8qxaB3usC3jii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2303270081
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

show ffs->dev_name in all possible debug message.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v3: change according comments
v2: split to several changes according to v1 comments
v1: https://lore.kernel.org/linux-usb/1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com/

 drivers/usb/gadget/function/f_fs.c | 141 ++++++++++++++++++++-----------------
 1 file changed, 75 insertions(+), 66 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 0761eaa..383343d 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -317,12 +317,12 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
 static int __ffs_ep0_stall(struct ffs_data *ffs)
 {
 	if (ffs->ev.can_stall) {
-		dev_vdbg(ffs->dev, "ep0 stall\n");
+		dev_vdbg(ffs->dev, "%s: ep0 stall\n", ffs->dev_name);
 		usb_ep_set_halt(ffs->gadget->ep0);
 		ffs->setup_state = FFS_NO_SETUP;
 		return -EL2HLT;
 	} else {
-		dev_dbg(ffs->dev, "bogus ep0 stall!\n");
+		dev_dbg(ffs->dev, "%s: bogus ep0 stall!\n", ffs->dev_name);
 		return -ESRCH;
 	}
 }
@@ -361,7 +361,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
 
 		/* Handle data */
 		if (ffs->state == FFS_READ_DESCRIPTORS) {
-			dev_info(ffs->dev, "read descriptors\n");
+			dev_info(ffs->dev, "%s: read descriptors\n", ffs->dev_name);
 			ret = __ffs_data_got_descs(ffs, data, len);
 			if (ret < 0)
 				break;
@@ -369,7 +369,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
 			ffs->state = FFS_READ_STRINGS;
 			ret = len;
 		} else {
-			dev_info(ffs->dev, "read strings\n");
+			dev_info(ffs->dev, "%s: read strings\n", ffs->dev_name);
 			ret = __ffs_data_got_strings(ffs, data, len);
 			if (ret < 0)
 				break;
@@ -749,9 +749,9 @@ static ssize_t ffs_copy_to_iter(struct ffs_data *ffs, void *data, int data_len,
 	 * aio_read(2) etc. system calls.  Writing data to an IN endpoint is not
 	 * affected.
 	 */
-	dev_err(ffs->dev, "functionfs read size %d > requested size %zd, dropping excess data. "
+	dev_err(ffs->dev, "%s: functionfs read size %d > requested size %zd, dropping excess data. "
 	       "Align read buffer size to max packet size to avoid the problem.\n",
-	       data_len, ret);
+	       ffs->dev_name, data_len, ret);
 
 	return ret;
 }
@@ -911,8 +911,8 @@ static ssize_t __ffs_epfile_read_data(struct ffs_epfile *epfile,
 		return -EFAULT;
 
 	/* See ffs_copy_to_iter for more context. */
-	dev_warn(epfile->ffs->dev, "functionfs read size %d > requested size %zd, splitting request into multiple reads.",
-		data_len, ret);
+	dev_warn(epfile->ffs->dev, "%s: functionfs read size %d > requested size %zd, splitting request into multiple reads.",
+		epfile->ffs->dev_name, data_len, ret);
 
 	data_len -= ret;
 	buf = kmalloc(struct_size(buf, storage, data_len), GFP_KERNEL);
@@ -1043,7 +1043,7 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 		 * For such reason, we're adding this redundant sanity check
 		 * here.
 		 */
-		WARN(1, "%s: data_len == -EINVAL\n", __func__);
+		WARN(1, "%s: %s(): data_len == -EINVAL\n", epfile->ffs->dev_name, __func__);
 		ret = -EINVAL;
 	} else if (!io_data->aio) {
 		bool interrupted = false;
@@ -1665,7 +1665,7 @@ static void ffs_data_opened(struct ffs_data *ffs)
 static void ffs_data_put(struct ffs_data *ffs)
 {
 	if (refcount_dec_and_test(&ffs->ref)) {
-		dev_info(ffs->dev, "%s(): freeing\n", __func__);
+		dev_info(ffs->dev, "%s: %s(): freeing\n", ffs->dev_name, __func__);
 		ffs_data_clear(ffs);
 		ffs_release_dev(ffs->private_data);
 		BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
@@ -1945,8 +1945,8 @@ static int ffs_func_eps_enable(struct ffs_function *func)
 
 		ret = config_ep_by_speed(func->gadget, &func->function, ep->ep);
 		if (ret) {
-			dev_err(ffs->dev, "%s: config_ep_by_speed(%s) returned %d\n",
-					__func__, ep->ep->name, ret);
+			dev_err(ffs->dev, "%s: %s(): config_ep_by_speed(%s) returned %d\n",
+					ffs->dev_name, __func__, ep->ep->name, ret);
 			break;
 		}
 
@@ -2006,14 +2006,14 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 
 	/* At least two bytes are required: length and type */
 	if (len < 2) {
-		dev_vdbg(ffs->dev, "descriptor too short\n");
+		dev_vdbg(ffs->dev, "%s: descriptor too short\n", ffs->dev_name);
 		return -EINVAL;
 	}
 
 	/* If we have at least as many bytes as the descriptor takes? */
 	length = _ds->bLength;
 	if (len < length) {
-		dev_vdbg(ffs->dev, "descriptor longer then available data\n");
+		dev_vdbg(ffs->dev, "%s: descriptor longer then available data\n", ffs->dev_name);
 		return -EINVAL;
 	}
 
@@ -2021,15 +2021,15 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 #define __entity_check_STRING(val)     (val)
 #define __entity_check_ENDPOINT(val)   ((val) & USB_ENDPOINT_NUMBER_MASK)
 #define __entity(type, val) do {					\
-		dev_vdbg(ffs->dev, "entity " #type "(%02x)\n", (val));		\
+		dev_vdbg(ffs->dev, "%s: entity " #type "(%02x)\n", ffs->dev_name, (val));	\
 		if (!__entity_check_ ##type(val)) {			\
-			dev_vdbg(ffs->dev, "invalid entity's value\n");		\
+			dev_vdbg(ffs->dev, "%s: invalid entity's value\n", ffs->dev_name);	\
 			return -EINVAL;					\
 		}							\
 		ret = entity(ffs, FFS_ ##type, &val, _ds, priv);		\
 		if (ret < 0) {						\
-			dev_dbg(ffs->dev, "entity " #type "(%02x); ret = %d\n",	\
-				 (val), ret);				\
+			dev_dbg(ffs->dev, "%s: entity " #type "(%02x); ret = %d\n",	\
+				 ffs->dev_name, (val), ret);		\
 			return ret;					\
 		}							\
 	} while (0)
@@ -2041,13 +2041,13 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 	case USB_DT_STRING:
 	case USB_DT_DEVICE_QUALIFIER:
 		/* function can't have any of those */
-		dev_vdbg(ffs->dev, "descriptor reserved for gadget: %d\n",
-		      _ds->bDescriptorType);
+		dev_vdbg(ffs->dev, "%s: descriptor reserved for gadget: %d\n",
+		      ffs->dev_name, _ds->bDescriptorType);
 		return -EINVAL;
 
 	case USB_DT_INTERFACE: {
 		struct usb_interface_descriptor *ds = (void *)_ds;
-		dev_vdbg(ffs->dev, "interface descriptor\n");
+		dev_vdbg(ffs->dev, "%s: interface descriptor\n", ffs->dev_name);
 		if (length != sizeof *ds)
 			goto inv_length;
 
@@ -2060,7 +2060,7 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 
 	case USB_DT_ENDPOINT: {
 		struct usb_endpoint_descriptor *ds = (void *)_ds;
-		dev_vdbg(ffs->dev, "endpoint descriptor\n");
+		dev_vdbg(ffs->dev, "%s: endpoint descriptor\n", ffs->dev_name);
 		if (length != USB_DT_ENDPOINT_SIZE &&
 		    length != USB_DT_ENDPOINT_AUDIO_SIZE)
 			goto inv_length;
@@ -2070,18 +2070,18 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 
 	case USB_TYPE_CLASS | 0x01:
 		if (*current_class == USB_INTERFACE_CLASS_HID) {
-			dev_vdbg(ffs->dev, "hid descriptor\n");
+			dev_vdbg(ffs->dev, "%s: hid descriptor\n", ffs->dev_name);
 			if (length != sizeof(struct hid_descriptor))
 				goto inv_length;
 			break;
 		} else if (*current_class == USB_INTERFACE_CLASS_CCID) {
-			dev_vdbg(ffs->dev, "ccid descriptor\n");
+			dev_vdbg(ffs->dev, "%s: ccid descriptor\n", ffs->dev_name);
 			if (length != sizeof(struct ccid_descriptor))
 				goto inv_length;
 			break;
 		} else {
-			dev_vdbg(ffs->dev, "unknown descriptor: %d for class %d\n",
-			      _ds->bDescriptorType, *current_class);
+			dev_vdbg(ffs->dev, "%s: unknown descriptor: %d for class %d\n",
+			      ffs->dev_name, _ds->bDescriptorType, *current_class);
 			return -EINVAL;
 		}
 
@@ -2092,7 +2092,7 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 
 	case USB_DT_INTERFACE_ASSOCIATION: {
 		struct usb_interface_assoc_descriptor *ds = (void *)_ds;
-		dev_vdbg(ffs->dev, "interface association descriptor\n");
+		dev_vdbg(ffs->dev, "%s: interface association descriptor\n", ffs->dev_name);
 		if (length != sizeof *ds)
 			goto inv_length;
 		if (ds->iFunction)
@@ -2101,7 +2101,7 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 		break;
 
 	case USB_DT_SS_ENDPOINT_COMP:
-		dev_vdbg(ffs->dev, "EP SS companion descriptor\n");
+		dev_vdbg(ffs->dev, "%s: EP SS companion descriptor\n", ffs->dev_name);
 		if (length != sizeof(struct usb_ss_ep_comp_descriptor))
 			goto inv_length;
 		break;
@@ -2112,17 +2112,19 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 	case USB_DT_SECURITY:
 	case USB_DT_CS_RADIO_CONTROL:
 		/* TODO */
-		dev_vdbg(ffs->dev, "unimplemented descriptor: %d\n", _ds->bDescriptorType);
+		dev_vdbg(ffs->dev, "%s: unimplemented descriptor: %d\n", ffs->dev_name,
+			_ds->bDescriptorType);
 		return -EINVAL;
 
 	default:
 		/* We should never be here */
-		dev_vdbg(ffs->dev, "unknown descriptor: %d\n", _ds->bDescriptorType);
+		dev_vdbg(ffs->dev, "%s: unknown descriptor: %d\n", ffs->dev_name,
+				_ds->bDescriptorType);
 		return -EINVAL;
 
 inv_length:
-		dev_vdbg(ffs->dev, "invalid length: %d (descriptor %d)\n",
-			  _ds->bLength, _ds->bDescriptorType);
+		dev_vdbg(ffs->dev, "%s: invalid length: %d (descriptor %d)\n",
+			  ffs->dev_name, _ds->bLength, _ds->bDescriptorType);
 		return -EINVAL;
 	}
 
@@ -2151,8 +2153,8 @@ static int __must_check ffs_do_descs(struct ffs_data *ffs, unsigned count, char
 		/* Record "descriptor" entity */
 		ret = entity(ffs, FFS_DESCRIPTOR, (u8 *)num, (void *)data, priv);
 		if (ret < 0) {
-			dev_dbg(ffs->dev, "entity DESCRIPTOR(%02lx); ret = %d\n",
-				 num, ret);
+			dev_dbg(ffs->dev, "%s: entity DESCRIPTOR(%02lx); ret = %d\n",
+				 ffs->dev_name, num, ret);
 			return ret;
 		}
 
@@ -2162,7 +2164,7 @@ static int __must_check ffs_do_descs(struct ffs_data *ffs, unsigned count, char
 		ret = ffs_do_single_desc(ffs, data, len, entity, priv,
 			&current_class);
 		if (ret < 0) {
-			dev_dbg(ffs->dev, "%s returns %d\n", __func__, ret);
+			dev_dbg(ffs->dev, "%s: %s(): returns %d\n", ffs->dev_name, __func__, ret);
 			return ret;
 		}
 
@@ -2227,11 +2229,12 @@ static int __ffs_do_os_desc_header(struct ffs_data *ffs, enum ffs_os_desc_type *
 	u16 w_index = le16_to_cpu(desc->wIndex);
 
 	if (bcd_version == 0x1) {
-		dev_warn(ffs->dev, "bcdVersion must be 0x0100, stored in Little Endian order. "
-			"Userspace driver should be fixed, accepting 0x0001 for compatibility.\n");
+		dev_warn(ffs->dev, "%s: bcdVersion must be 0x0100, stored in Little Endian order. "
+			"Userspace driver should be fixed, accepting 0x0001 for compatibility.\n",
+			ffs->dev_name);
 	} else if (bcd_version != 0x100) {
-		dev_vdbg(ffs->dev, "unsupported os descriptors version: 0x%x\n",
-			  bcd_version);
+		dev_vdbg(ffs->dev, "%s: unsupported os descriptors version: 0x%x\n",
+			  ffs->dev_name, bcd_version);
 		return -EINVAL;
 	}
 	switch (w_index) {
@@ -2242,7 +2245,7 @@ static int __ffs_do_os_desc_header(struct ffs_data *ffs, enum ffs_os_desc_type *
 		*next_type = FFS_OS_DESC_EXT_PROP;
 		break;
 	default:
-		dev_vdbg(ffs->dev, "unsupported os descriptor type: %d", w_index);
+		dev_vdbg(ffs->dev, "%s: unsupported os descriptor type: %d", ffs->dev_name, w_index);
 		return -EINVAL;
 	}
 
@@ -2267,7 +2270,8 @@ static int __must_check ffs_do_single_os_desc(struct ffs_data *ffs, char *data,
 	while (feature_count--) {
 		ret = entity(ffs, type, h, data, len, priv);
 		if (ret < 0) {
-			dev_dbg(ffs->dev, "bad OS descriptor, type: %d\n", type);
+			dev_dbg(ffs->dev, "%s: bad OS descriptor, type: %d\n",
+					ffs->dev_name, type);
 			return ret;
 		}
 		data += ret;
@@ -2305,8 +2309,8 @@ static int __must_check ffs_do_os_descs(struct ffs_data *ffs, unsigned count,
 
 		ret = __ffs_do_os_desc_header(ffs, &type, desc);
 		if (ret < 0) {
-			dev_dbg(ffs->dev, "entity OS_DESCRIPTOR(%02lx); ret = %d\n",
-				 num, ret);
+			dev_dbg(ffs->dev, "%s: entity OS_DESCRIPTOR(%02lx); ret = %d\n",
+				 ffs->dev_name, num, ret);
 			return ret;
 		}
 		/*
@@ -2326,7 +2330,7 @@ static int __must_check ffs_do_os_descs(struct ffs_data *ffs, unsigned count,
 		ret = ffs_do_single_os_desc(ffs, data, len, type,
 					    feature_count, entity, priv, desc);
 		if (ret < 0) {
-			dev_dbg(ffs->dev, "%s returns %d\n", __func__, ret);
+			dev_dbg(ffs->dev, "%s: %s() returns %d\n", ffs->dev_name, __func__, ret);
 			return ret;
 		}
 
@@ -2360,7 +2364,7 @@ static int __ffs_data_do_os_desc(struct ffs_data *ffs, enum ffs_os_desc_type typ
 			 * values.  We fix it here to avoid returning EINVAL
 			 * in response to values we used to accept.
 			 */
-			dev_dbg(ffs->dev, "usb_ext_compat_desc::Reserved1 forced to 1\n");
+			dev_dbg(ffs->dev, "%s: usb_ext_compat_desc::Reserved1 forced to 1\n", ffs->dev_name);
 			d->Reserved1 = 1;
 		}
 		for (i = 0; i < ARRAY_SIZE(d->Reserved2); ++i)
@@ -2383,20 +2387,20 @@ static int __ffs_data_do_os_desc(struct ffs_data *ffs, enum ffs_os_desc_type typ
 		type = le32_to_cpu(d->dwPropertyDataType);
 		if (type < USB_EXT_PROP_UNICODE ||
 		    type > USB_EXT_PROP_UNICODE_MULTI) {
-			dev_vdbg(ffs->dev, "unsupported os descriptor property type: %d",
-				  type);
+			dev_vdbg(ffs->dev, "%s: unsupported os descriptor property type: %d",
+				  ffs->dev_name, type);
 			return -EINVAL;
 		}
 		pnl = le16_to_cpu(d->wPropertyNameLength);
 		if (length < 14 + pnl) {
-			dev_vdbg(ffs->dev, "invalid os descriptor length: %d pnl:%d (descriptor %d)\n",
-				  length, pnl, type);
+			dev_vdbg(ffs->dev, "%s: invalid os descriptor length: %d pnl:%d (%d)\n",
+				  ffs->dev_name, length, pnl, type);
 			return -EINVAL;
 		}
 		pdl = le32_to_cpu(*(__le32 *)((u8 *)data + 10 + pnl));
 		if (length != 14 + pnl + pdl) {
-			dev_vdbg(ffs->dev, "invalid os descriptor length: %d pnl:%d pdl:%d (descriptor %d)\n",
-				  length, pnl, pdl, type);
+			dev_vdbg(ffs->dev, "%s: invalid os descriptor length: %d pnl:%d pdl:%d (%d)\n",
+				ffs->dev_name, length, pnl, pdl, type);
 			return -EINVAL;
 		}
 		++ffs->ms_os_descs_ext_prop_count;
@@ -2406,7 +2410,7 @@ static int __ffs_data_do_os_desc(struct ffs_data *ffs, enum ffs_os_desc_type typ
 	}
 		break;
 	default:
-		dev_vdbg(ffs->dev, "unknown descriptor: %d\n", type);
+		dev_vdbg(ffs->dev, "%s: unknown descriptor: %d\n", ffs->dev_name, type);
 		return -EINVAL;
 	}
 	return length;
@@ -2721,7 +2725,7 @@ static void __ffs_event_add(struct ffs_data *ffs,
 		break;
 
 	default:
-		WARN(1, "%d: unknown event, this should not happen\n", type);
+		WARN(1, "%s: %d: unknown event, this should not happen\n", ffs->dev_name, type);
 		return;
 	}
 
@@ -2732,11 +2736,11 @@ static void __ffs_event_add(struct ffs_data *ffs,
 			if ((*ev == rem_type1 || *ev == rem_type2) == neg)
 				*out++ = *ev;
 			else
-				dev_vdbg(ffs->dev, "purging event %d\n", *ev);
+				dev_vdbg(ffs->dev, "%s: purging event %d\n", ffs->dev_name, *ev);
 		ffs->ev.count = out - ffs->ev.types;
 	}
 
-	dev_vdbg(ffs->dev, "adding event %d\n", type);
+	dev_vdbg(ffs->dev, "%s: adding event %d\n", ffs->dev_name, type);
 	ffs->ev.types[ffs->ev.count++] = type;
 	wake_up_locked(&ffs->ev.waitq);
 	if (ffs->ffs_eventfd)
@@ -2805,8 +2809,8 @@ static int __ffs_func_bind_do_descs(struct ffs_data *ffs, enum ffs_entity_type t
 	ffs_ep = func->eps + idx;
 
 	if (ffs_ep->descs[ep_desc_id]) {
-		dev_err(ffs->dev, "two %sspeed descriptors for EP %d\n",
-			  speed_names[ep_desc_id],
+		dev_err(ffs->dev, "%s: two %sspeed descriptors for EP %d\n",
+			  ffs->dev_name, speed_names[ep_desc_id],
 			  ds->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK);
 		return -EINVAL;
 	}
@@ -2833,7 +2837,7 @@ static int __ffs_func_bind_do_descs(struct ffs_data *ffs, enum ffs_entity_type t
 		 * endpoint descriptors as if they were full speed.
 		 */
 		wMaxPacketSize = ds->wMaxPacketSize;
-		dev_vdbg(ffs->dev, "autoconfig\n");
+		dev_vdbg(ffs->dev, "%s: autoconfig\n", ffs->dev_name);
 		ep = usb_ep_autoconfig(func->gadget, ds);
 		if (!ep)
 			return -ENOTSUPP;
@@ -2914,7 +2918,7 @@ static int __ffs_func_bind_do_nums(struct ffs_data *ffs, enum ffs_entity_type ty
 		break;
 	}
 
-	dev_vdbg(ffs->dev, "%02x -> %02x\n", *valuep, newValue);
+	dev_vdbg(ffs->dev, "%s: %02x -> %02x\n", ffs->dev_name, *valuep, newValue);
 	*valuep = newValue;
 	return 0;
 }
@@ -2992,7 +2996,7 @@ static int __ffs_func_bind_do_os_desc(struct ffs_data *ffs, enum ffs_os_desc_typ
 	}
 		break;
 	default:
-		dev_vdbg(ffs->dev, "unknown descriptor: %d\n", type);
+		dev_vdbg(ffs->dev, "%s: unknown descriptor: %d\n", ffs->dev_name, type);
 	}
 
 	return length;
@@ -3286,11 +3290,16 @@ static int ffs_func_setup(struct usb_function *f,
 	unsigned long flags;
 	int ret;
 
-	dev_vdbg(ffs->dev, "creq->bRequestType = %02x\n", creq->bRequestType);
-	dev_vdbg(ffs->dev, "creq->bRequest     = %02x\n", creq->bRequest);
-	dev_vdbg(ffs->dev, "creq->wValue       = %04x\n", le16_to_cpu(creq->wValue));
-	dev_vdbg(ffs->dev, "creq->wIndex       = %04x\n", le16_to_cpu(creq->wIndex));
-	dev_vdbg(ffs->dev, "creq->wLength      = %04x\n", le16_to_cpu(creq->wLength));
+	dev_vdbg(ffs->dev, "%s: creq->bRequestType = %02x\n",
+			ffs->dev_name, creq->bRequestType);
+	dev_vdbg(ffs->dev, "%s: creq->bRequest     = %02x\n",
+			ffs->dev_name, creq->bRequest);
+	dev_vdbg(ffs->dev, "%s: creq->wValue       = %04x\n",
+			ffs->dev_name, le16_to_cpu(creq->wValue));
+	dev_vdbg(ffs->dev, "%s: creq->wIndex       = %04x\n",
+			ffs->dev_name, le16_to_cpu(creq->wIndex));
+	dev_vdbg(ffs->dev, "%s: creq->wLength      = %04x\n",
+			ffs->dev_name, le16_to_cpu(creq->wLength));
 
 	/*
 	 * Most requests directed to interface go through here
@@ -3793,7 +3802,7 @@ static char *ffs_prepare_buffer(struct ffs_data *ffs, const char __user *buf, si
 	if (IS_ERR(data))
 		return data;
 
-	dev_vdbg(ffs->dev, "Buffer from user space:\n");
+	dev_vdbg(ffs->dev, "%s: Buffer from user space:\n", ffs->dev_name);
 	ffs_dump_mem("", data, len);
 
 	return data;
-- 
2.7.4

