Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 182D96C77A2
	for <lists+linux-usb@lfdr.de>; Fri, 24 Mar 2023 07:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbjCXGLF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Mar 2023 02:11:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbjCXGLE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Mar 2023 02:11:04 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD4031554F
        for <linux-usb@vger.kernel.org>; Thu, 23 Mar 2023 23:10:55 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32O3aZVW025798;
        Fri, 24 Mar 2023 06:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=AsTrj/0luxEWyMEXzyPiNi8ty5bDHWaOMn4CRDE8BCM=;
 b=hNl9oZVqRhupTp8L/fgQLtr/wsYizXef3xFLKAlDnHvrh8L8EGcoBcU+t/8W28oelAjI
 4LTiJ1CdLIQoeXPZuAk8DLi8p4fss04zjcFrDBpdyaetlmK0Dy9/0OFT7aztApWMRV2v
 5Oo16dQFCVdA/ya7Mz+l/vvbEkjZ/39q5iKL6siLjsGvG2VcFD3gVIa880oHSsTjn3jz
 Y08caFP2AGlj/4xXrUVS4mgP9m9M3tAPh5rSQ4mSALC2HnRzwCu5NjBjLpVBdSZPrdF8
 opd3i/h2GrbKIVTcNO+3LyEP6l7p2EFwIXow0CGsPv0reoThX2Xqu0595HaSO8L4GOCH ow== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pgydugvjg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Mar 2023 06:10:54 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32O6AZVi002206
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Mar 2023 06:10:35 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 23 Mar 2023 23:10:34 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 2/3] usb: gadget: f_fs: add more function with struct ffs_data *ffs parameter
Date:   Fri, 24 Mar 2023 14:10:26 +0800
Message-ID: <1679638227-20496-2-git-send-email-quic_linyyuan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: i1a6Bd7r0_2py7tz6W9NBcotaVVFJdyR
X-Proofpoint-GUID: i1a6Bd7r0_2py7tz6W9NBcotaVVFJdyR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_02,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0
 mlxlogscore=952 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2303240049
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It prepare to improve pr_vdebug() which will show dev_name when multiple
f_fs instance exist.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: split to several changes according to v1 comments
v1: https://lore.kernel.org/linux-usb/1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com/

 drivers/usb/gadget/function/f_fs.c | 78 +++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 40 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 8830847..a4051c8 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -231,7 +231,6 @@ struct ffs_io_data {
 };
 
 struct ffs_desc_helper {
-	struct ffs_data *ffs;
 	unsigned interfaces_count;
 	unsigned eps_count;
 };
@@ -260,7 +259,7 @@ static void ffs_closed(struct ffs_data *ffs);
 
 static int ffs_mutex_lock(struct mutex *mutex, unsigned nonblock)
 	__attribute__((warn_unused_result, nonnull));
-static char *ffs_prepare_buffer(const char __user *buf, size_t len)
+static char *ffs_prepare_buffer(struct ffs_data *ffs, const char __user *buf, size_t len)
 	__attribute__((warn_unused_result, nonnull));
 
 
@@ -354,7 +353,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
 			break;
 		}
 
-		data = ffs_prepare_buffer(buf, len);
+		data = ffs_prepare_buffer(ffs, buf, len);
 		if (IS_ERR(data)) {
 			ret = PTR_ERR(data);
 			break;
@@ -426,7 +425,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
 
 		spin_unlock_irq(&ffs->ev.waitq.lock);
 
-		data = ffs_prepare_buffer(buf, len);
+		data = ffs_prepare_buffer(ffs, buf, len);
 		if (IS_ERR(data)) {
 			ret = PTR_ERR(data);
 			break;
@@ -713,7 +712,8 @@ static void ffs_epfile_io_complete(struct usb_ep *_ep, struct usb_request *req)
 	complete(&io_data->done);
 }
 
-static ssize_t ffs_copy_to_iter(void *data, int data_len, struct iov_iter *iter)
+static ssize_t ffs_copy_to_iter(struct ffs_data *ffs, void *data, int data_len,
+				struct iov_iter *iter)
 {
 	ssize_t ret = copy_to_iter(data, data_len, iter);
 	if (ret == data_len)
@@ -824,7 +824,7 @@ static void ffs_user_copy_worker(struct work_struct *work)
 
 	if (io_data->read && ret > 0) {
 		kthread_use_mm(io_data->mm);
-		ret = ffs_copy_to_iter(io_data->buf, ret, &io_data->data);
+		ret = ffs_copy_to_iter(io_data->ffs, io_data->buf, ret, &io_data->data);
 		kthread_unuse_mm(io_data->mm);
 	}
 
@@ -1984,16 +1984,16 @@ enum ffs_os_desc_type {
 	FFS_OS_DESC, FFS_OS_DESC_EXT_COMPAT, FFS_OS_DESC_EXT_PROP
 };
 
-typedef int (*ffs_entity_callback)(enum ffs_entity_type entity,
+typedef int (*ffs_entity_callback)(struct ffs_data *ffs, enum ffs_entity_type entity,
 				   u8 *valuep,
 				   struct usb_descriptor_header *desc,
 				   void *priv);
 
-typedef int (*ffs_os_desc_callback)(enum ffs_os_desc_type entity,
+typedef int (*ffs_os_desc_callback)(struct ffs_data *ffs, enum ffs_os_desc_type entity,
 				    struct usb_os_desc_header *h, void *data,
 				    unsigned len, void *priv);
 
-static int __must_check ffs_do_single_desc(char *data, unsigned len,
+static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, unsigned len,
 					   ffs_entity_callback entity,
 					   void *priv, int *current_class)
 {
@@ -2023,7 +2023,7 @@ static int __must_check ffs_do_single_desc(char *data, unsigned len,
 			pr_vdebug("invalid entity's value\n");		\
 			return -EINVAL;					\
 		}							\
-		ret = entity(FFS_ ##type, &val, _ds, priv);		\
+		ret = entity(ffs, FFS_ ##type, &val, _ds, priv);		\
 		if (ret < 0) {						\
 			pr_debug("entity " #type "(%02x); ret = %d\n",	\
 				 (val), ret);				\
@@ -2132,7 +2132,7 @@ static int __must_check ffs_do_single_desc(char *data, unsigned len,
 	return length;
 }
 
-static int __must_check ffs_do_descs(unsigned count, char *data, unsigned len,
+static int __must_check ffs_do_descs(struct ffs_data *ffs, unsigned count, char *data, unsigned len,
 				     ffs_entity_callback entity, void *priv)
 {
 	const unsigned _len = len;
@@ -2146,7 +2146,7 @@ static int __must_check ffs_do_descs(unsigned count, char *data, unsigned len,
 			data = NULL;
 
 		/* Record "descriptor" entity */
-		ret = entity(FFS_DESCRIPTOR, (u8 *)num, (void *)data, priv);
+		ret = entity(ffs, FFS_DESCRIPTOR, (u8 *)num, (void *)data, priv);
 		if (ret < 0) {
 			pr_debug("entity DESCRIPTOR(%02lx); ret = %d\n",
 				 num, ret);
@@ -2156,7 +2156,7 @@ static int __must_check ffs_do_descs(unsigned count, char *data, unsigned len,
 		if (!data)
 			return _len - len;
 
-		ret = ffs_do_single_desc(data, len, entity, priv,
+		ret = ffs_do_single_desc(ffs, data, len, entity, priv,
 			&current_class);
 		if (ret < 0) {
 			pr_debug("%s returns %d\n", __func__, ret);
@@ -2169,7 +2169,7 @@ static int __must_check ffs_do_descs(unsigned count, char *data, unsigned len,
 	}
 }
 
-static int __ffs_data_do_entity(enum ffs_entity_type type,
+static int __ffs_data_do_entity(struct ffs_data *ffs, enum ffs_entity_type type,
 				u8 *valuep, struct usb_descriptor_header *desc,
 				void *priv)
 {
@@ -2195,8 +2195,8 @@ static int __ffs_data_do_entity(enum ffs_entity_type type,
 		 * Strings are indexed from 1 (0 is reserved
 		 * for languages list)
 		 */
-		if (*valuep > helper->ffs->strings_count)
-			helper->ffs->strings_count = *valuep;
+		if (*valuep > ffs->strings_count)
+			ffs->strings_count = *valuep;
 		break;
 
 	case FFS_ENDPOINT:
@@ -2205,10 +2205,10 @@ static int __ffs_data_do_entity(enum ffs_entity_type type,
 		if (helper->eps_count >= FFS_MAX_EPS_COUNT)
 			return -EINVAL;
 		/* Check if descriptors for any speed were already parsed */
-		if (!helper->ffs->eps_count && !helper->ffs->interfaces_count)
-			helper->ffs->eps_addrmap[helper->eps_count] =
+		if (!ffs->eps_count && !ffs->interfaces_count)
+			ffs->eps_addrmap[helper->eps_count] =
 				d->bEndpointAddress;
-		else if (helper->ffs->eps_addrmap[helper->eps_count] !=
+		else if (ffs->eps_addrmap[helper->eps_count] !=
 				d->bEndpointAddress)
 			return -EINVAL;
 		break;
@@ -2217,7 +2217,7 @@ static int __ffs_data_do_entity(enum ffs_entity_type type,
 	return 0;
 }
 
-static int __ffs_do_os_desc_header(enum ffs_os_desc_type *next_type,
+static int __ffs_do_os_desc_header(struct ffs_data *ffs, enum ffs_os_desc_type *next_type,
 				   struct usb_os_desc_header *desc)
 {
 	u16 bcd_version = le16_to_cpu(desc->bcdVersion);
@@ -2250,7 +2250,7 @@ static int __ffs_do_os_desc_header(enum ffs_os_desc_type *next_type,
  * Process all extended compatibility/extended property descriptors
  * of a feature descriptor
  */
-static int __must_check ffs_do_single_os_desc(char *data, unsigned len,
+static int __must_check ffs_do_single_os_desc(struct ffs_data *ffs, char *data, unsigned len,
 					      enum ffs_os_desc_type type,
 					      u16 feature_count,
 					      ffs_os_desc_callback entity,
@@ -2262,7 +2262,7 @@ static int __must_check ffs_do_single_os_desc(char *data, unsigned len,
 
 	/* loop over all ext compat/ext prop descriptors */
 	while (feature_count--) {
-		ret = entity(type, h, data, len, priv);
+		ret = entity(ffs, type, h, data, len, priv);
 		if (ret < 0) {
 			pr_debug("bad OS descriptor, type: %d\n", type);
 			return ret;
@@ -2274,7 +2274,7 @@ static int __must_check ffs_do_single_os_desc(char *data, unsigned len,
 }
 
 /* Process a number of complete Feature Descriptors (Ext Compat or Ext Prop) */
-static int __must_check ffs_do_os_descs(unsigned count,
+static int __must_check ffs_do_os_descs(struct ffs_data *ffs, unsigned count,
 					char *data, unsigned len,
 					ffs_os_desc_callback entity, void *priv)
 {
@@ -2300,7 +2300,7 @@ static int __must_check ffs_do_os_descs(unsigned count,
 		if (le32_to_cpu(desc->dwLength) > len)
 			return -EINVAL;
 
-		ret = __ffs_do_os_desc_header(&type, desc);
+		ret = __ffs_do_os_desc_header(ffs, &type, desc);
 		if (ret < 0) {
 			pr_debug("entity OS_DESCRIPTOR(%02lx); ret = %d\n",
 				 num, ret);
@@ -2320,7 +2320,7 @@ static int __must_check ffs_do_os_descs(unsigned count,
 		 * Process all function/property descriptors
 		 * of this Feature Descriptor
 		 */
-		ret = ffs_do_single_os_desc(data, len, type,
+		ret = ffs_do_single_os_desc(ffs, data, len, type,
 					    feature_count, entity, priv, desc);
 		if (ret < 0) {
 			pr_debug("%s returns %d\n", __func__, ret);
@@ -2336,11 +2336,10 @@ static int __must_check ffs_do_os_descs(unsigned count,
 /*
  * Validate contents of the buffer from userspace related to OS descriptors.
  */
-static int __ffs_data_do_os_desc(enum ffs_os_desc_type type,
+static int __ffs_data_do_os_desc(struct ffs_data *ffs, enum ffs_os_desc_type type,
 				 struct usb_os_desc_header *h, void *data,
 				 unsigned len, void *priv)
 {
-	struct ffs_data *ffs = priv;
 	u8 length;
 
 	switch (type) {
@@ -2485,13 +2484,12 @@ static int __ffs_data_got_descs(struct ffs_data *ffs,
 
 	/* Read descriptors */
 	raw_descs = data;
-	helper.ffs = ffs;
 	for (i = 0; i < 3; ++i) {
 		if (!counts[i])
 			continue;
 		helper.interfaces_count = 0;
 		helper.eps_count = 0;
-		ret = ffs_do_descs(counts[i], data, len,
+		ret = ffs_do_descs(ffs, counts[i], data, len,
 				   __ffs_data_do_entity, &helper);
 		if (ret < 0)
 			goto error;
@@ -2512,8 +2510,8 @@ static int __ffs_data_got_descs(struct ffs_data *ffs,
 		len  -= ret;
 	}
 	if (os_descs_count) {
-		ret = ffs_do_os_descs(os_descs_count, data, len,
-				      __ffs_data_do_os_desc, ffs);
+		ret = ffs_do_os_descs(ffs, os_descs_count, data, len,
+				      __ffs_data_do_os_desc, NULL);
 		if (ret < 0)
 			goto error;
 		data += ret;
@@ -2763,7 +2761,7 @@ static int ffs_ep_addr2idx(struct ffs_data *ffs, u8 endpoint_address)
 	return -ENOENT;
 }
 
-static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
+static int __ffs_func_bind_do_descs(struct ffs_data *ffs, enum ffs_entity_type type, u8 *valuep,
 				    struct usb_descriptor_header *desc,
 				    void *priv)
 {
@@ -2863,7 +2861,7 @@ static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
 	return 0;
 }
 
-static int __ffs_func_bind_do_nums(enum ffs_entity_type type, u8 *valuep,
+static int __ffs_func_bind_do_nums(struct ffs_data *ffs, enum ffs_entity_type type, u8 *valuep,
 				   struct usb_descriptor_header *desc,
 				   void *priv)
 {
@@ -2918,7 +2916,7 @@ static int __ffs_func_bind_do_nums(enum ffs_entity_type type, u8 *valuep,
 	return 0;
 }
 
-static int __ffs_func_bind_do_os_desc(enum ffs_os_desc_type type,
+static int __ffs_func_bind_do_os_desc(struct ffs_data *ffs, enum ffs_os_desc_type type,
 				      struct usb_os_desc_header *h, void *data,
 				      unsigned len, void *priv)
 {
@@ -3119,7 +3117,7 @@ static int _ffs_func_bind(struct usb_configuration *c,
 	 */
 	if (full) {
 		func->function.fs_descriptors = vla_ptr(vlabuf, d, fs_descs);
-		fs_len = ffs_do_descs(ffs->fs_descs_count,
+		fs_len = ffs_do_descs(ffs, ffs->fs_descs_count,
 				      vla_ptr(vlabuf, d, raw_descs),
 				      d_raw_descs__sz,
 				      __ffs_func_bind_do_descs, func);
@@ -3133,7 +3131,7 @@ static int _ffs_func_bind(struct usb_configuration *c,
 
 	if (high) {
 		func->function.hs_descriptors = vla_ptr(vlabuf, d, hs_descs);
-		hs_len = ffs_do_descs(ffs->hs_descs_count,
+		hs_len = ffs_do_descs(ffs, ffs->hs_descs_count,
 				      vla_ptr(vlabuf, d, raw_descs) + fs_len,
 				      d_raw_descs__sz - fs_len,
 				      __ffs_func_bind_do_descs, func);
@@ -3148,7 +3146,7 @@ static int _ffs_func_bind(struct usb_configuration *c,
 	if (super) {
 		func->function.ss_descriptors = func->function.ssp_descriptors =
 			vla_ptr(vlabuf, d, ss_descs);
-		ss_len = ffs_do_descs(ffs->ss_descs_count,
+		ss_len = ffs_do_descs(ffs, ffs->ss_descs_count,
 				vla_ptr(vlabuf, d, raw_descs) + fs_len + hs_len,
 				d_raw_descs__sz - fs_len - hs_len,
 				__ffs_func_bind_do_descs, func);
@@ -3165,7 +3163,7 @@ static int _ffs_func_bind(struct usb_configuration *c,
 	 * endpoint numbers rewriting.  We can do that in one go
 	 * now.
 	 */
-	ret = ffs_do_descs(ffs->fs_descs_count +
+	ret = ffs_do_descs(ffs, ffs->fs_descs_count +
 			   (high ? ffs->hs_descs_count : 0) +
 			   (super ? ffs->ss_descs_count : 0),
 			   vla_ptr(vlabuf, d, raw_descs), d_raw_descs__sz,
@@ -3185,7 +3183,7 @@ static int _ffs_func_bind(struct usb_configuration *c,
 				vla_ptr(vlabuf, d, ext_compat) + i * 16;
 			INIT_LIST_HEAD(&desc->ext_prop);
 		}
-		ret = ffs_do_os_descs(ffs->ms_os_descs_count,
+		ret = ffs_do_os_descs(ffs, ffs->ms_os_descs_count,
 				      vla_ptr(vlabuf, d, raw_descs) +
 				      fs_len + hs_len + ss_len,
 				      d_raw_descs__sz - fs_len - hs_len -
@@ -3781,7 +3779,7 @@ static int ffs_mutex_lock(struct mutex *mutex, unsigned nonblock)
 		: mutex_lock_interruptible(mutex);
 }
 
-static char *ffs_prepare_buffer(const char __user *buf, size_t len)
+static char *ffs_prepare_buffer(struct ffs_data *ffs, const char __user *buf, size_t len)
 {
 	char *data;
 
-- 
2.7.4

