Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 797B46C77A1
	for <lists+linux-usb@lfdr.de>; Fri, 24 Mar 2023 07:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbjCXGLC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Mar 2023 02:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjCXGLA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Mar 2023 02:11:00 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D1CB15147
        for <linux-usb@vger.kernel.org>; Thu, 23 Mar 2023 23:10:52 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32O5VG4m030817;
        Fri, 24 Mar 2023 06:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=vd3SBQO14nlxlymOSLfBSbloKUaUJ2fbs9gJDKHNJGg=;
 b=eBv7xZ4i2g5Y/fKInronEdjjAV0mzw4FdtcJl2n495+ejrlfiTTakKOl0jODZQabCAtr
 gtskNFSiVhjIN+ErvPmtMYnmOm1jHU1SL7MVA3rKA3+m8icGdKVJR7X4EtJkkDdOta4w
 +1jx8urO4XqpV8do7UMkyZrZXdUU9QNNJreeFgJd2iahFEQjMdOHcfxqyVXP08p/hAqg
 iCNvjXWaQFi8bR/dDF9mMtGG86q5uoOBMWYun9omgaYg1/TMVx37QOeJ5uXGr+v6LoBP
 TK4uf7rwJiONzwk3cw56Ixsr1ZNBNmjfpvvFIFfRT0HLM+UEWF99DzAYHMyKbXZMyCkt 6g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pgy190w3w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Mar 2023 06:10:51 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32O6AbBf002214
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Mar 2023 06:10:37 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 23 Mar 2023 23:10:35 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 3/3] usb: gadget: f_fs: add dev name as prefix for pr_vdebug()
Date:   Fri, 24 Mar 2023 14:10:27 +0800
Message-ID: <1679638227-20496-3-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1679638227-20496-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1679638227-20496-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OeWIqTbfa_2zLvYF0mekTb9UYKHbuTO_
X-Proofpoint-ORIG-GUID: OeWIqTbfa_2zLvYF0mekTb9UYKHbuTO_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_02,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303240049
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

when multiple instances in use, the debug message is hard to understand
as there is no instance name show.

this change will show each instance name for debug messages.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: split to several changes according to v1 comments
v1: https://lore.kernel.org/linux-usb/1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com/

 drivers/usb/gadget/function/f_fs.c | 136 +++++++++++++++++++------------------
 1 file changed, 69 insertions(+), 67 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index a4051c8..df67ab5 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -317,12 +317,12 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
 static int __ffs_ep0_stall(struct ffs_data *ffs)
 {
 	if (ffs->ev.can_stall) {
-		pr_vdebug("ep0 stall\n");
+		pr_vdebug("%s: ep0 stall\n", ffs->dev_name);
 		usb_ep_set_halt(ffs->gadget->ep0);
 		ffs->setup_state = FFS_NO_SETUP;
 		return -EL2HLT;
 	} else {
-		pr_debug("bogus ep0 stall!\n");
+		pr_debug("%s: bogus ep0 stall!\n", ffs->dev_name);
 		return -ESRCH;
 	}
 }
@@ -361,7 +361,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
 
 		/* Handle data */
 		if (ffs->state == FFS_READ_DESCRIPTORS) {
-			pr_info("read descriptors\n");
+			pr_info("%s: read descriptors\n", ffs->dev_name);
 			ret = __ffs_data_got_descs(ffs, data, len);
 			if (ret < 0)
 				break;
@@ -369,7 +369,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
 			ffs->state = FFS_READ_STRINGS;
 			ret = len;
 		} else {
-			pr_info("read strings\n");
+			pr_info("%s: read strings\n", ffs->dev_name);
 			ret = __ffs_data_got_strings(ffs, data, len);
 			if (ret < 0)
 				break;
@@ -749,9 +749,9 @@ static ssize_t ffs_copy_to_iter(struct ffs_data *ffs, void *data, int data_len,
 	 * aio_read(2) etc. system calls.  Writing data to an IN endpoint is not
 	 * affected.
 	 */
-	pr_err("functionfs read size %d > requested size %zd, dropping excess data. "
+	pr_err("%s: functionfs read size %d > requested size %zd, dropping excess data. "
 	       "Align read buffer size to max packet size to avoid the problem.\n",
-	       data_len, ret);
+	       ffs->dev_name, data_len, ret);
 
 	return ret;
 }
@@ -911,8 +911,8 @@ static ssize_t __ffs_epfile_read_data(struct ffs_epfile *epfile,
 		return -EFAULT;
 
 	/* See ffs_copy_to_iter for more context. */
-	pr_warn("functionfs read size %d > requested size %zd, splitting request into multiple reads.",
-		data_len, ret);
+	pr_warn("%s: functionfs read size %d > requested size %zd, splitting request into multiple reads.",
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
-		pr_info("%s(): freeing\n", __func__);
+		pr_info("%s: %s(): freeing\n", ffs->dev_name, __func__);
 		ffs_data_clear(ffs);
 		ffs_release_dev(ffs->private_data);
 		BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
@@ -1942,8 +1942,8 @@ static int ffs_func_eps_enable(struct ffs_function *func)
 
 		ret = config_ep_by_speed(func->gadget, &func->function, ep->ep);
 		if (ret) {
-			pr_err("%s: config_ep_by_speed(%s) returned %d\n",
-					__func__, ep->ep->name, ret);
+			pr_err("%s: %s(): config_ep_by_speed(%s) returned %d\n",
+					ffs->dev_name, __func__, ep->ep->name, ret);
 			break;
 		}
 
@@ -2003,14 +2003,14 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 
 	/* At least two bytes are required: length and type */
 	if (len < 2) {
-		pr_vdebug("descriptor too short\n");
+		pr_vdebug("%s: descriptor too short\n", ffs->dev_name);
 		return -EINVAL;
 	}
 
 	/* If we have at least as many bytes as the descriptor takes? */
 	length = _ds->bLength;
 	if (len < length) {
-		pr_vdebug("descriptor longer then available data\n");
+		pr_vdebug("%s: descriptor longer then available data\n", ffs->dev_name);
 		return -EINVAL;
 	}
 
@@ -2018,15 +2018,15 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 #define __entity_check_STRING(val)     (val)
 #define __entity_check_ENDPOINT(val)   ((val) & USB_ENDPOINT_NUMBER_MASK)
 #define __entity(type, val) do {					\
-		pr_vdebug("entity " #type "(%02x)\n", (val));		\
+		pr_vdebug("%s: entity " #type "(%02x)\n", ffs->dev_name, (val));	\
 		if (!__entity_check_ ##type(val)) {			\
-			pr_vdebug("invalid entity's value\n");		\
+			pr_vdebug("%s: invalid entity's value\n", ffs->dev_name);	\
 			return -EINVAL;					\
 		}							\
-		ret = entity(ffs, FFS_ ##type, &val, _ds, priv);		\
+		ret = entity(ffs, FFS_ ##type, &val, _ds, priv);	\
 		if (ret < 0) {						\
-			pr_debug("entity " #type "(%02x); ret = %d\n",	\
-				 (val), ret);				\
+			pr_debug("%s: entity " #type "(%02x); ret = %d\n",	\
+				 ffs->dev_name, (val), ret);		\
 			return ret;					\
 		}							\
 	} while (0)
@@ -2038,13 +2038,13 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 	case USB_DT_STRING:
 	case USB_DT_DEVICE_QUALIFIER:
 		/* function can't have any of those */
-		pr_vdebug("descriptor reserved for gadget: %d\n",
-		      _ds->bDescriptorType);
+		pr_vdebug("%s: descriptor reserved for gadget: %d\n",
+		      ffs->dev_name, _ds->bDescriptorType);
 		return -EINVAL;
 
 	case USB_DT_INTERFACE: {
 		struct usb_interface_descriptor *ds = (void *)_ds;
-		pr_vdebug("interface descriptor\n");
+		pr_vdebug("%s: interface descriptor\n", ffs->dev_name);
 		if (length != sizeof *ds)
 			goto inv_length;
 
@@ -2057,7 +2057,7 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 
 	case USB_DT_ENDPOINT: {
 		struct usb_endpoint_descriptor *ds = (void *)_ds;
-		pr_vdebug("endpoint descriptor\n");
+		pr_vdebug("%s: endpoint descriptor\n", ffs->dev_name);
 		if (length != USB_DT_ENDPOINT_SIZE &&
 		    length != USB_DT_ENDPOINT_AUDIO_SIZE)
 			goto inv_length;
@@ -2067,18 +2067,18 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 
 	case USB_TYPE_CLASS | 0x01:
 		if (*current_class == USB_INTERFACE_CLASS_HID) {
-			pr_vdebug("hid descriptor\n");
+			pr_vdebug("%s: hid descriptor\n", ffs->dev_name);
 			if (length != sizeof(struct hid_descriptor))
 				goto inv_length;
 			break;
 		} else if (*current_class == USB_INTERFACE_CLASS_CCID) {
-			pr_vdebug("ccid descriptor\n");
+			pr_vdebug("%s: ccid descriptor\n", ffs->dev_name);
 			if (length != sizeof(struct ccid_descriptor))
 				goto inv_length;
 			break;
 		} else {
-			pr_vdebug("unknown descriptor: %d for class %d\n",
-			      _ds->bDescriptorType, *current_class);
+			pr_vdebug("%s: unknown descriptor: %d for class %d\n",
+			      ffs->dev_name, _ds->bDescriptorType, *current_class);
 			return -EINVAL;
 		}
 
@@ -2089,7 +2089,7 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 
 	case USB_DT_INTERFACE_ASSOCIATION: {
 		struct usb_interface_assoc_descriptor *ds = (void *)_ds;
-		pr_vdebug("interface association descriptor\n");
+		pr_vdebug("%s: interface association descriptor\n", ffs->dev_name);
 		if (length != sizeof *ds)
 			goto inv_length;
 		if (ds->iFunction)
@@ -2098,7 +2098,7 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 		break;
 
 	case USB_DT_SS_ENDPOINT_COMP:
-		pr_vdebug("EP SS companion descriptor\n");
+		pr_vdebug("%s: EP SS companion descriptor\n", ffs->dev_name);
 		if (length != sizeof(struct usb_ss_ep_comp_descriptor))
 			goto inv_length;
 		break;
@@ -2109,17 +2109,18 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 	case USB_DT_SECURITY:
 	case USB_DT_CS_RADIO_CONTROL:
 		/* TODO */
-		pr_vdebug("unimplemented descriptor: %d\n", _ds->bDescriptorType);
+		pr_vdebug("%s: unimplemented descriptor: %d\n", ffs->dev_name,
+			_ds->bDescriptorType);
 		return -EINVAL;
 
 	default:
 		/* We should never be here */
-		pr_vdebug("unknown descriptor: %d\n", _ds->bDescriptorType);
+		pr_vdebug("%s: unknown descriptor: %d\n", ffs->dev_name, _ds->bDescriptorType);
 		return -EINVAL;
 
 inv_length:
-		pr_vdebug("invalid length: %d (descriptor %d)\n",
-			  _ds->bLength, _ds->bDescriptorType);
+		pr_vdebug("%s: invalid length: %d (descriptor %d)\n",
+			  ffs->dev_name, _ds->bLength, _ds->bDescriptorType);
 		return -EINVAL;
 	}
 
@@ -2148,8 +2149,8 @@ static int __must_check ffs_do_descs(struct ffs_data *ffs, unsigned count, char
 		/* Record "descriptor" entity */
 		ret = entity(ffs, FFS_DESCRIPTOR, (u8 *)num, (void *)data, priv);
 		if (ret < 0) {
-			pr_debug("entity DESCRIPTOR(%02lx); ret = %d\n",
-				 num, ret);
+			pr_debug("%s: entity DESCRIPTOR(%02lx); ret = %d\n",
+				 ffs->dev_name, num, ret);
 			return ret;
 		}
 
@@ -2159,7 +2160,7 @@ static int __must_check ffs_do_descs(struct ffs_data *ffs, unsigned count, char
 		ret = ffs_do_single_desc(ffs, data, len, entity, priv,
 			&current_class);
 		if (ret < 0) {
-			pr_debug("%s returns %d\n", __func__, ret);
+			pr_debug("%s: %s(): returns %d\n", ffs->dev_name, __func__, ret);
 			return ret;
 		}
 
@@ -2224,11 +2225,12 @@ static int __ffs_do_os_desc_header(struct ffs_data *ffs, enum ffs_os_desc_type *
 	u16 w_index = le16_to_cpu(desc->wIndex);
 
 	if (bcd_version == 0x1) {
-		pr_warn("bcdVersion must be 0x0100, stored in Little Endian order. "
-			"Userspace driver should be fixed, accepting 0x0001 for compatibility.\n");
+		pr_warn("%s: bcdVersion must be 0x0100, stored in Little Endian order. "
+			"Userspace driver should be fixed, accepting 0x0001 for compatibility.\n",
+			ffs->dev_name);
 	} else if (bcd_version != 0x100) {
-		pr_vdebug("unsupported os descriptors version: 0x%x\n",
-			  bcd_version);
+		pr_vdebug("%s: unsupported os descriptors version: 0x%x\n",
+			  ffs->dev_name, bcd_version);
 		return -EINVAL;
 	}
 	switch (w_index) {
@@ -2239,7 +2241,7 @@ static int __ffs_do_os_desc_header(struct ffs_data *ffs, enum ffs_os_desc_type *
 		*next_type = FFS_OS_DESC_EXT_PROP;
 		break;
 	default:
-		pr_vdebug("unsupported os descriptor type: %d", w_index);
+		pr_vdebug("%s: unsupported os descriptor type: %d", ffs->dev_name, w_index);
 		return -EINVAL;
 	}
 
@@ -2264,7 +2266,7 @@ static int __must_check ffs_do_single_os_desc(struct ffs_data *ffs, char *data,
 	while (feature_count--) {
 		ret = entity(ffs, type, h, data, len, priv);
 		if (ret < 0) {
-			pr_debug("bad OS descriptor, type: %d\n", type);
+			pr_debug("%s: bad OS descriptor, type: %d\n", ffs->dev_name, type);
 			return ret;
 		}
 		data += ret;
@@ -2302,8 +2304,8 @@ static int __must_check ffs_do_os_descs(struct ffs_data *ffs, unsigned count,
 
 		ret = __ffs_do_os_desc_header(ffs, &type, desc);
 		if (ret < 0) {
-			pr_debug("entity OS_DESCRIPTOR(%02lx); ret = %d\n",
-				 num, ret);
+			pr_debug("%s: entity OS_DESCRIPTOR(%02lx); ret = %d\n",
+				 ffs->dev_name, num, ret);
 			return ret;
 		}
 		/*
@@ -2323,7 +2325,7 @@ static int __must_check ffs_do_os_descs(struct ffs_data *ffs, unsigned count,
 		ret = ffs_do_single_os_desc(ffs, data, len, type,
 					    feature_count, entity, priv, desc);
 		if (ret < 0) {
-			pr_debug("%s returns %d\n", __func__, ret);
+			pr_debug("%s: %s() returns %d\n", ffs->dev_name, __func__, ret);
 			return ret;
 		}
 
@@ -2357,7 +2359,7 @@ static int __ffs_data_do_os_desc(struct ffs_data *ffs, enum ffs_os_desc_type typ
 			 * values.  We fix it here to avoid returning EINVAL
 			 * in response to values we used to accept.
 			 */
-			pr_debug("usb_ext_compat_desc::Reserved1 forced to 1\n");
+			pr_debug("%s: usb_ext_compat_desc::Reserved1 forced to 1\n", ffs->dev_name);
 			d->Reserved1 = 1;
 		}
 		for (i = 0; i < ARRAY_SIZE(d->Reserved2); ++i)
@@ -2380,20 +2382,20 @@ static int __ffs_data_do_os_desc(struct ffs_data *ffs, enum ffs_os_desc_type typ
 		type = le32_to_cpu(d->dwPropertyDataType);
 		if (type < USB_EXT_PROP_UNICODE ||
 		    type > USB_EXT_PROP_UNICODE_MULTI) {
-			pr_vdebug("unsupported os descriptor property type: %d",
-				  type);
+			pr_vdebug("%s: unsupported os descriptor property type: %d",
+				  ffs->dev_name, type);
 			return -EINVAL;
 		}
 		pnl = le16_to_cpu(d->wPropertyNameLength);
 		if (length < 14 + pnl) {
-			pr_vdebug("invalid os descriptor length: %d pnl:%d (descriptor %d)\n",
-				  length, pnl, type);
+			pr_vdebug("%s: invalid os descriptor length: %d pnl:%d (%d)\n",
+				  ffs->dev_name, length, pnl, type);
 			return -EINVAL;
 		}
 		pdl = le32_to_cpu(*(__le32 *)((u8 *)data + 10 + pnl));
 		if (length != 14 + pnl + pdl) {
-			pr_vdebug("invalid os descriptor length: %d pnl:%d pdl:%d (descriptor %d)\n",
-				  length, pnl, pdl, type);
+			pr_vdebug("%s: invalid os descriptor length: %d pnl:%d pdl:%d (%d)\n",
+				ffs->dev_name, length, pnl, pdl, type);
 			return -EINVAL;
 		}
 		++ffs->ms_os_descs_ext_prop_count;
@@ -2403,7 +2405,7 @@ static int __ffs_data_do_os_desc(struct ffs_data *ffs, enum ffs_os_desc_type typ
 	}
 		break;
 	default:
-		pr_vdebug("unknown descriptor: %d\n", type);
+		pr_vdebug("%s: unknown descriptor: %d\n", ffs->dev_name, type);
 		return -EINVAL;
 	}
 	return length;
@@ -2718,7 +2720,7 @@ static void __ffs_event_add(struct ffs_data *ffs,
 		break;
 
 	default:
-		WARN(1, "%d: unknown event, this should not happen\n", type);
+		WARN(1, "%s: %d: unknown event, this should not happen\n", ffs->dev_name, type);
 		return;
 	}
 
@@ -2729,11 +2731,11 @@ static void __ffs_event_add(struct ffs_data *ffs,
 			if ((*ev == rem_type1 || *ev == rem_type2) == neg)
 				*out++ = *ev;
 			else
-				pr_vdebug("purging event %d\n", *ev);
+				pr_vdebug("%s: purging event %d\n", ffs->dev_name, *ev);
 		ffs->ev.count = out - ffs->ev.types;
 	}
 
-	pr_vdebug("adding event %d\n", type);
+	pr_vdebug("%s: adding event %d\n", ffs->dev_name, type);
 	ffs->ev.types[ffs->ev.count++] = type;
 	wake_up_locked(&ffs->ev.waitq);
 	if (ffs->ffs_eventfd)
@@ -2802,8 +2804,8 @@ static int __ffs_func_bind_do_descs(struct ffs_data *ffs, enum ffs_entity_type t
 	ffs_ep = func->eps + idx;
 
 	if (ffs_ep->descs[ep_desc_id]) {
-		pr_err("two %sspeed descriptors for EP %d\n",
-			  speed_names[ep_desc_id],
+		pr_err("%s: two %sspeed descriptors for EP %d\n",
+			  ffs->dev_name, speed_names[ep_desc_id],
 			  ds->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK);
 		return -EINVAL;
 	}
@@ -2830,7 +2832,7 @@ static int __ffs_func_bind_do_descs(struct ffs_data *ffs, enum ffs_entity_type t
 		 * endpoint descriptors as if they were full speed.
 		 */
 		wMaxPacketSize = ds->wMaxPacketSize;
-		pr_vdebug("autoconfig\n");
+		pr_vdebug("%s: autoconfig\n", ffs->dev_name);
 		ep = usb_ep_autoconfig(func->gadget, ds);
 		if (!ep)
 			return -ENOTSUPP;
@@ -2911,7 +2913,7 @@ static int __ffs_func_bind_do_nums(struct ffs_data *ffs, enum ffs_entity_type ty
 		break;
 	}
 
-	pr_vdebug("%02x -> %02x\n", *valuep, newValue);
+	pr_vdebug("%s: %02x -> %02x\n", ffs->dev_name, *valuep, newValue);
 	*valuep = newValue;
 	return 0;
 }
@@ -2989,7 +2991,7 @@ static int __ffs_func_bind_do_os_desc(struct ffs_data *ffs, enum ffs_os_desc_typ
 	}
 		break;
 	default:
-		pr_vdebug("unknown descriptor: %d\n", type);
+		pr_vdebug("%s: unknown descriptor: %d\n", ffs->dev_name, type);
 	}
 
 	return length;
@@ -3283,11 +3285,11 @@ static int ffs_func_setup(struct usb_function *f,
 	unsigned long flags;
 	int ret;
 
-	pr_vdebug("creq->bRequestType = %02x\n", creq->bRequestType);
-	pr_vdebug("creq->bRequest     = %02x\n", creq->bRequest);
-	pr_vdebug("creq->wValue       = %04x\n", le16_to_cpu(creq->wValue));
-	pr_vdebug("creq->wIndex       = %04x\n", le16_to_cpu(creq->wIndex));
-	pr_vdebug("creq->wLength      = %04x\n", le16_to_cpu(creq->wLength));
+	pr_vdebug("%s: creq->bRequestType = %02x\n", ffs->dev_name, creq->bRequestType);
+	pr_vdebug("%s: creq->bRequest     = %02x\n", ffs->dev_name, creq->bRequest);
+	pr_vdebug("%s: creq->wValue       = %04x\n", ffs->dev_name, le16_to_cpu(creq->wValue));
+	pr_vdebug("%s: creq->wIndex       = %04x\n", ffs->dev_name, le16_to_cpu(creq->wIndex));
+	pr_vdebug("%s: creq->wLength      = %04x\n", ffs->dev_name, le16_to_cpu(creq->wLength));
 
 	/*
 	 * Most requests directed to interface go through here
@@ -3790,7 +3792,7 @@ static char *ffs_prepare_buffer(struct ffs_data *ffs, const char __user *buf, si
 	if (IS_ERR(data))
 		return data;
 
-	pr_vdebug("Buffer from user space:\n");
+	pr_vdebug("%s: Buffer from user space:\n", ffs->dev_name);
 	ffs_dump_mem("", data, len);
 
 	return data;
-- 
2.7.4

