Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3867B6CA0FE
	for <lists+linux-usb@lfdr.de>; Mon, 27 Mar 2023 12:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbjC0KMn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Mar 2023 06:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233518AbjC0KMj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Mar 2023 06:12:39 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4DAE5FD6
        for <linux-usb@vger.kernel.org>; Mon, 27 Mar 2023 03:12:37 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32RA75WL022215;
        Mon, 27 Mar 2023 10:12:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=krKaVu3QcI+Y6wiN5XlIpCpcTGg1TUH2FiIbZaNu7Ts=;
 b=ObD/mXLk0Peu62iseX+8iHIaJYbd9TaLpffdhO2M7emBEmi8dRM87wxsTruJiitQqbkX
 5CoU8JO89145clI/jlx7Hqx1SnMN+jV3y8ZvyAv5JEBroM6HEYGAVZCZyDVgDsre8CoR
 mLuhO8f/LacKbMcYHP3X8Kh3GANOsTRynL5E5TdhMfvFpYcSWJadB3t2fHDEshUCkkbP
 vE/k6ox6OADRsX18znynxgaq6cE1+zoVO0RTSl2OeELmTnfFN8xxgfQgw52ctv4XcPeB
 6E5xW/H4CB4l9kLpDckrIjP1zCnu+YM9M+q/0K9raE+qHSQpXl8/UzWXlIBoOeot0I6K Hg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pk7h8r8ss-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Mar 2023 10:12:36 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32RACYZm021074
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Mar 2023 10:12:34 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 27 Mar 2023 03:12:33 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v3 5/6] usb: gadget: f_fs: replace private pr_vdebug() with dev_vdbg
Date:   Mon, 27 Mar 2023 18:12:19 +0800
Message-ID: <1679911940-4727-5-git-send-email-quic_linyyuan@quicinc.com>
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
X-Proofpoint-GUID: a3LVD0sJdYESAH5Gq0S4PJz47BLGeRm6
X-Proofpoint-ORIG-GUID: a3LVD0sJdYESAH5Gq0S4PJz47BLGeRm6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=867 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270082
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use command dev_vdbg() macro to show some debug message.

Also replace some pr_debug/err/warn/info() to dev_dbg/err/warn/info().

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v3: new patch in this version

 drivers/usb/gadget/function/f_fs.c | 98 +++++++++++++++++++-------------------
 drivers/usb/gadget/function/u_fs.h |  6 ---
 2 files changed, 49 insertions(+), 55 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 25461f1..0761eaa 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -317,12 +317,12 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
 static int __ffs_ep0_stall(struct ffs_data *ffs)
 {
 	if (ffs->ev.can_stall) {
-		pr_vdebug("ep0 stall\n");
+		dev_vdbg(ffs->dev, "ep0 stall\n");
 		usb_ep_set_halt(ffs->gadget->ep0);
 		ffs->setup_state = FFS_NO_SETUP;
 		return -EL2HLT;
 	} else {
-		pr_debug("bogus ep0 stall!\n");
+		dev_dbg(ffs->dev, "bogus ep0 stall!\n");
 		return -ESRCH;
 	}
 }
@@ -361,7 +361,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
 
 		/* Handle data */
 		if (ffs->state == FFS_READ_DESCRIPTORS) {
-			pr_info("read descriptors\n");
+			dev_info(ffs->dev, "read descriptors\n");
 			ret = __ffs_data_got_descs(ffs, data, len);
 			if (ret < 0)
 				break;
@@ -369,7 +369,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
 			ffs->state = FFS_READ_STRINGS;
 			ret = len;
 		} else {
-			pr_info("read strings\n");
+			dev_info(ffs->dev, "read strings\n");
 			ret = __ffs_data_got_strings(ffs, data, len);
 			if (ret < 0)
 				break;
@@ -749,7 +749,7 @@ static ssize_t ffs_copy_to_iter(struct ffs_data *ffs, void *data, int data_len,
 	 * aio_read(2) etc. system calls.  Writing data to an IN endpoint is not
 	 * affected.
 	 */
-	pr_err("functionfs read size %d > requested size %zd, dropping excess data. "
+	dev_err(ffs->dev, "functionfs read size %d > requested size %zd, dropping excess data. "
 	       "Align read buffer size to max packet size to avoid the problem.\n",
 	       data_len, ret);
 
@@ -911,7 +911,7 @@ static ssize_t __ffs_epfile_read_data(struct ffs_epfile *epfile,
 		return -EFAULT;
 
 	/* See ffs_copy_to_iter for more context. */
-	pr_warn("functionfs read size %d > requested size %zd, splitting request into multiple reads.",
+	dev_warn(epfile->ffs->dev, "functionfs read size %d > requested size %zd, splitting request into multiple reads.",
 		data_len, ret);
 
 	data_len -= ret;
@@ -1665,7 +1665,7 @@ static void ffs_data_opened(struct ffs_data *ffs)
 static void ffs_data_put(struct ffs_data *ffs)
 {
 	if (refcount_dec_and_test(&ffs->ref)) {
-		pr_info("%s(): freeing\n", __func__);
+		dev_info(ffs->dev, "%s(): freeing\n", __func__);
 		ffs_data_clear(ffs);
 		ffs_release_dev(ffs->private_data);
 		BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
@@ -1945,7 +1945,7 @@ static int ffs_func_eps_enable(struct ffs_function *func)
 
 		ret = config_ep_by_speed(func->gadget, &func->function, ep->ep);
 		if (ret) {
-			pr_err("%s: config_ep_by_speed(%s) returned %d\n",
+			dev_err(ffs->dev, "%s: config_ep_by_speed(%s) returned %d\n",
 					__func__, ep->ep->name, ret);
 			break;
 		}
@@ -2006,14 +2006,14 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 
 	/* At least two bytes are required: length and type */
 	if (len < 2) {
-		pr_vdebug("descriptor too short\n");
+		dev_vdbg(ffs->dev, "descriptor too short\n");
 		return -EINVAL;
 	}
 
 	/* If we have at least as many bytes as the descriptor takes? */
 	length = _ds->bLength;
 	if (len < length) {
-		pr_vdebug("descriptor longer then available data\n");
+		dev_vdbg(ffs->dev, "descriptor longer then available data\n");
 		return -EINVAL;
 	}
 
@@ -2021,14 +2021,14 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 #define __entity_check_STRING(val)     (val)
 #define __entity_check_ENDPOINT(val)   ((val) & USB_ENDPOINT_NUMBER_MASK)
 #define __entity(type, val) do {					\
-		pr_vdebug("entity " #type "(%02x)\n", (val));		\
+		dev_vdbg(ffs->dev, "entity " #type "(%02x)\n", (val));		\
 		if (!__entity_check_ ##type(val)) {			\
-			pr_vdebug("invalid entity's value\n");		\
+			dev_vdbg(ffs->dev, "invalid entity's value\n");		\
 			return -EINVAL;					\
 		}							\
 		ret = entity(ffs, FFS_ ##type, &val, _ds, priv);		\
 		if (ret < 0) {						\
-			pr_debug("entity " #type "(%02x); ret = %d\n",	\
+			dev_dbg(ffs->dev, "entity " #type "(%02x); ret = %d\n",	\
 				 (val), ret);				\
 			return ret;					\
 		}							\
@@ -2041,13 +2041,13 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 	case USB_DT_STRING:
 	case USB_DT_DEVICE_QUALIFIER:
 		/* function can't have any of those */
-		pr_vdebug("descriptor reserved for gadget: %d\n",
+		dev_vdbg(ffs->dev, "descriptor reserved for gadget: %d\n",
 		      _ds->bDescriptorType);
 		return -EINVAL;
 
 	case USB_DT_INTERFACE: {
 		struct usb_interface_descriptor *ds = (void *)_ds;
-		pr_vdebug("interface descriptor\n");
+		dev_vdbg(ffs->dev, "interface descriptor\n");
 		if (length != sizeof *ds)
 			goto inv_length;
 
@@ -2060,7 +2060,7 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 
 	case USB_DT_ENDPOINT: {
 		struct usb_endpoint_descriptor *ds = (void *)_ds;
-		pr_vdebug("endpoint descriptor\n");
+		dev_vdbg(ffs->dev, "endpoint descriptor\n");
 		if (length != USB_DT_ENDPOINT_SIZE &&
 		    length != USB_DT_ENDPOINT_AUDIO_SIZE)
 			goto inv_length;
@@ -2070,17 +2070,17 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 
 	case USB_TYPE_CLASS | 0x01:
 		if (*current_class == USB_INTERFACE_CLASS_HID) {
-			pr_vdebug("hid descriptor\n");
+			dev_vdbg(ffs->dev, "hid descriptor\n");
 			if (length != sizeof(struct hid_descriptor))
 				goto inv_length;
 			break;
 		} else if (*current_class == USB_INTERFACE_CLASS_CCID) {
-			pr_vdebug("ccid descriptor\n");
+			dev_vdbg(ffs->dev, "ccid descriptor\n");
 			if (length != sizeof(struct ccid_descriptor))
 				goto inv_length;
 			break;
 		} else {
-			pr_vdebug("unknown descriptor: %d for class %d\n",
+			dev_vdbg(ffs->dev, "unknown descriptor: %d for class %d\n",
 			      _ds->bDescriptorType, *current_class);
 			return -EINVAL;
 		}
@@ -2092,7 +2092,7 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 
 	case USB_DT_INTERFACE_ASSOCIATION: {
 		struct usb_interface_assoc_descriptor *ds = (void *)_ds;
-		pr_vdebug("interface association descriptor\n");
+		dev_vdbg(ffs->dev, "interface association descriptor\n");
 		if (length != sizeof *ds)
 			goto inv_length;
 		if (ds->iFunction)
@@ -2101,7 +2101,7 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 		break;
 
 	case USB_DT_SS_ENDPOINT_COMP:
-		pr_vdebug("EP SS companion descriptor\n");
+		dev_vdbg(ffs->dev, "EP SS companion descriptor\n");
 		if (length != sizeof(struct usb_ss_ep_comp_descriptor))
 			goto inv_length;
 		break;
@@ -2112,16 +2112,16 @@ static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, uns
 	case USB_DT_SECURITY:
 	case USB_DT_CS_RADIO_CONTROL:
 		/* TODO */
-		pr_vdebug("unimplemented descriptor: %d\n", _ds->bDescriptorType);
+		dev_vdbg(ffs->dev, "unimplemented descriptor: %d\n", _ds->bDescriptorType);
 		return -EINVAL;
 
 	default:
 		/* We should never be here */
-		pr_vdebug("unknown descriptor: %d\n", _ds->bDescriptorType);
+		dev_vdbg(ffs->dev, "unknown descriptor: %d\n", _ds->bDescriptorType);
 		return -EINVAL;
 
 inv_length:
-		pr_vdebug("invalid length: %d (descriptor %d)\n",
+		dev_vdbg(ffs->dev, "invalid length: %d (descriptor %d)\n",
 			  _ds->bLength, _ds->bDescriptorType);
 		return -EINVAL;
 	}
@@ -2151,7 +2151,7 @@ static int __must_check ffs_do_descs(struct ffs_data *ffs, unsigned count, char
 		/* Record "descriptor" entity */
 		ret = entity(ffs, FFS_DESCRIPTOR, (u8 *)num, (void *)data, priv);
 		if (ret < 0) {
-			pr_debug("entity DESCRIPTOR(%02lx); ret = %d\n",
+			dev_dbg(ffs->dev, "entity DESCRIPTOR(%02lx); ret = %d\n",
 				 num, ret);
 			return ret;
 		}
@@ -2162,7 +2162,7 @@ static int __must_check ffs_do_descs(struct ffs_data *ffs, unsigned count, char
 		ret = ffs_do_single_desc(ffs, data, len, entity, priv,
 			&current_class);
 		if (ret < 0) {
-			pr_debug("%s returns %d\n", __func__, ret);
+			dev_dbg(ffs->dev, "%s returns %d\n", __func__, ret);
 			return ret;
 		}
 
@@ -2227,10 +2227,10 @@ static int __ffs_do_os_desc_header(struct ffs_data *ffs, enum ffs_os_desc_type *
 	u16 w_index = le16_to_cpu(desc->wIndex);
 
 	if (bcd_version == 0x1) {
-		pr_warn("bcdVersion must be 0x0100, stored in Little Endian order. "
+		dev_warn(ffs->dev, "bcdVersion must be 0x0100, stored in Little Endian order. "
 			"Userspace driver should be fixed, accepting 0x0001 for compatibility.\n");
 	} else if (bcd_version != 0x100) {
-		pr_vdebug("unsupported os descriptors version: 0x%x\n",
+		dev_vdbg(ffs->dev, "unsupported os descriptors version: 0x%x\n",
 			  bcd_version);
 		return -EINVAL;
 	}
@@ -2242,7 +2242,7 @@ static int __ffs_do_os_desc_header(struct ffs_data *ffs, enum ffs_os_desc_type *
 		*next_type = FFS_OS_DESC_EXT_PROP;
 		break;
 	default:
-		pr_vdebug("unsupported os descriptor type: %d", w_index);
+		dev_vdbg(ffs->dev, "unsupported os descriptor type: %d", w_index);
 		return -EINVAL;
 	}
 
@@ -2267,7 +2267,7 @@ static int __must_check ffs_do_single_os_desc(struct ffs_data *ffs, char *data,
 	while (feature_count--) {
 		ret = entity(ffs, type, h, data, len, priv);
 		if (ret < 0) {
-			pr_debug("bad OS descriptor, type: %d\n", type);
+			dev_dbg(ffs->dev, "bad OS descriptor, type: %d\n", type);
 			return ret;
 		}
 		data += ret;
@@ -2305,7 +2305,7 @@ static int __must_check ffs_do_os_descs(struct ffs_data *ffs, unsigned count,
 
 		ret = __ffs_do_os_desc_header(ffs, &type, desc);
 		if (ret < 0) {
-			pr_debug("entity OS_DESCRIPTOR(%02lx); ret = %d\n",
+			dev_dbg(ffs->dev, "entity OS_DESCRIPTOR(%02lx); ret = %d\n",
 				 num, ret);
 			return ret;
 		}
@@ -2326,7 +2326,7 @@ static int __must_check ffs_do_os_descs(struct ffs_data *ffs, unsigned count,
 		ret = ffs_do_single_os_desc(ffs, data, len, type,
 					    feature_count, entity, priv, desc);
 		if (ret < 0) {
-			pr_debug("%s returns %d\n", __func__, ret);
+			dev_dbg(ffs->dev, "%s returns %d\n", __func__, ret);
 			return ret;
 		}
 
@@ -2360,7 +2360,7 @@ static int __ffs_data_do_os_desc(struct ffs_data *ffs, enum ffs_os_desc_type typ
 			 * values.  We fix it here to avoid returning EINVAL
 			 * in response to values we used to accept.
 			 */
-			pr_debug("usb_ext_compat_desc::Reserved1 forced to 1\n");
+			dev_dbg(ffs->dev, "usb_ext_compat_desc::Reserved1 forced to 1\n");
 			d->Reserved1 = 1;
 		}
 		for (i = 0; i < ARRAY_SIZE(d->Reserved2); ++i)
@@ -2383,19 +2383,19 @@ static int __ffs_data_do_os_desc(struct ffs_data *ffs, enum ffs_os_desc_type typ
 		type = le32_to_cpu(d->dwPropertyDataType);
 		if (type < USB_EXT_PROP_UNICODE ||
 		    type > USB_EXT_PROP_UNICODE_MULTI) {
-			pr_vdebug("unsupported os descriptor property type: %d",
+			dev_vdbg(ffs->dev, "unsupported os descriptor property type: %d",
 				  type);
 			return -EINVAL;
 		}
 		pnl = le16_to_cpu(d->wPropertyNameLength);
 		if (length < 14 + pnl) {
-			pr_vdebug("invalid os descriptor length: %d pnl:%d (descriptor %d)\n",
+			dev_vdbg(ffs->dev, "invalid os descriptor length: %d pnl:%d (descriptor %d)\n",
 				  length, pnl, type);
 			return -EINVAL;
 		}
 		pdl = le32_to_cpu(*(__le32 *)((u8 *)data + 10 + pnl));
 		if (length != 14 + pnl + pdl) {
-			pr_vdebug("invalid os descriptor length: %d pnl:%d pdl:%d (descriptor %d)\n",
+			dev_vdbg(ffs->dev, "invalid os descriptor length: %d pnl:%d pdl:%d (descriptor %d)\n",
 				  length, pnl, pdl, type);
 			return -EINVAL;
 		}
@@ -2406,7 +2406,7 @@ static int __ffs_data_do_os_desc(struct ffs_data *ffs, enum ffs_os_desc_type typ
 	}
 		break;
 	default:
-		pr_vdebug("unknown descriptor: %d\n", type);
+		dev_vdbg(ffs->dev, "unknown descriptor: %d\n", type);
 		return -EINVAL;
 	}
 	return length;
@@ -2732,11 +2732,11 @@ static void __ffs_event_add(struct ffs_data *ffs,
 			if ((*ev == rem_type1 || *ev == rem_type2) == neg)
 				*out++ = *ev;
 			else
-				pr_vdebug("purging event %d\n", *ev);
+				dev_vdbg(ffs->dev, "purging event %d\n", *ev);
 		ffs->ev.count = out - ffs->ev.types;
 	}
 
-	pr_vdebug("adding event %d\n", type);
+	dev_vdbg(ffs->dev, "adding event %d\n", type);
 	ffs->ev.types[ffs->ev.count++] = type;
 	wake_up_locked(&ffs->ev.waitq);
 	if (ffs->ffs_eventfd)
@@ -2805,7 +2805,7 @@ static int __ffs_func_bind_do_descs(struct ffs_data *ffs, enum ffs_entity_type t
 	ffs_ep = func->eps + idx;
 
 	if (ffs_ep->descs[ep_desc_id]) {
-		pr_err("two %sspeed descriptors for EP %d\n",
+		dev_err(ffs->dev, "two %sspeed descriptors for EP %d\n",
 			  speed_names[ep_desc_id],
 			  ds->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK);
 		return -EINVAL;
@@ -2833,7 +2833,7 @@ static int __ffs_func_bind_do_descs(struct ffs_data *ffs, enum ffs_entity_type t
 		 * endpoint descriptors as if they were full speed.
 		 */
 		wMaxPacketSize = ds->wMaxPacketSize;
-		pr_vdebug("autoconfig\n");
+		dev_vdbg(ffs->dev, "autoconfig\n");
 		ep = usb_ep_autoconfig(func->gadget, ds);
 		if (!ep)
 			return -ENOTSUPP;
@@ -2914,7 +2914,7 @@ static int __ffs_func_bind_do_nums(struct ffs_data *ffs, enum ffs_entity_type ty
 		break;
 	}
 
-	pr_vdebug("%02x -> %02x\n", *valuep, newValue);
+	dev_vdbg(ffs->dev, "%02x -> %02x\n", *valuep, newValue);
 	*valuep = newValue;
 	return 0;
 }
@@ -2992,7 +2992,7 @@ static int __ffs_func_bind_do_os_desc(struct ffs_data *ffs, enum ffs_os_desc_typ
 	}
 		break;
 	default:
-		pr_vdebug("unknown descriptor: %d\n", type);
+		dev_vdbg(ffs->dev, "unknown descriptor: %d\n", type);
 	}
 
 	return length;
@@ -3286,11 +3286,11 @@ static int ffs_func_setup(struct usb_function *f,
 	unsigned long flags;
 	int ret;
 
-	pr_vdebug("creq->bRequestType = %02x\n", creq->bRequestType);
-	pr_vdebug("creq->bRequest     = %02x\n", creq->bRequest);
-	pr_vdebug("creq->wValue       = %04x\n", le16_to_cpu(creq->wValue));
-	pr_vdebug("creq->wIndex       = %04x\n", le16_to_cpu(creq->wIndex));
-	pr_vdebug("creq->wLength      = %04x\n", le16_to_cpu(creq->wLength));
+	dev_vdbg(ffs->dev, "creq->bRequestType = %02x\n", creq->bRequestType);
+	dev_vdbg(ffs->dev, "creq->bRequest     = %02x\n", creq->bRequest);
+	dev_vdbg(ffs->dev, "creq->wValue       = %04x\n", le16_to_cpu(creq->wValue));
+	dev_vdbg(ffs->dev, "creq->wIndex       = %04x\n", le16_to_cpu(creq->wIndex));
+	dev_vdbg(ffs->dev, "creq->wLength      = %04x\n", le16_to_cpu(creq->wLength));
 
 	/*
 	 * Most requests directed to interface go through here
@@ -3793,7 +3793,7 @@ static char *ffs_prepare_buffer(struct ffs_data *ffs, const char __user *buf, si
 	if (IS_ERR(data))
 		return data;
 
-	pr_vdebug("Buffer from user space:\n");
+	dev_vdbg(ffs->dev, "Buffer from user space:\n");
 	ffs_dump_mem("", data, len);
 
 	return data;
diff --git a/drivers/usb/gadget/function/u_fs.h b/drivers/usb/gadget/function/u_fs.h
index c5f6167..1b70bd7 100644
--- a/drivers/usb/gadget/function/u_fs.h
+++ b/drivers/usb/gadget/function/u_fs.h
@@ -20,15 +20,9 @@
 #include <linux/refcount.h>
 
 #ifdef VERBOSE_DEBUG
-#ifndef pr_vdebug
-#  define pr_vdebug pr_debug
-#endif /* pr_vdebug */
 #  define ffs_dump_mem(prefix, ptr, len) \
 	print_hex_dump_bytes(pr_fmt(prefix ": "), DUMP_PREFIX_NONE, ptr, len)
 #else
-#ifndef pr_vdebug
-#  define pr_vdebug(...)                 do { } while (0)
-#endif /* pr_vdebug */
 #  define ffs_dump_mem(prefix, ptr, len) do { } while (0)
 #endif /* VERBOSE_DEBUG */
 
-- 
2.7.4

