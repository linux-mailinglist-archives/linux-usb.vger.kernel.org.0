Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52AD26CA0FC
	for <lists+linux-usb@lfdr.de>; Mon, 27 Mar 2023 12:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233344AbjC0KMj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Mar 2023 06:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233494AbjC0KMe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Mar 2023 06:12:34 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 405E14C3E
        for <linux-usb@vger.kernel.org>; Mon, 27 Mar 2023 03:12:33 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32RA8dVX021181;
        Mon, 27 Mar 2023 10:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=JSqrMjS14S2i4GlHYQHMHK+M0qIxVljIqmjrq9ZgpMA=;
 b=U27lypUQr2dF8lArqUQWididJpDijAKXT4pbYH3jLih531C7wZIBgss0WruOC31A6vlM
 LHtzFaXYxK6J95VYB3qo2PpSnmuTbD3fqN/q8k+xkoUnGcfXZppwjlq2MhM8bKT3CplA
 bGtUTBtXW5MHk0oeYpO8KhWP36ep+6o8GtCe70I1NoDEiUh+CA9zRuFevJ3GxZeMSOqq
 MdRUY71d6+r7t3aI6EKE8dd974xWIsyQatzgL3nrsuOcatg1cRp04MLjg6QC76/nkBbJ
 /lIAFC3B41zfcScezO5CprhU38fELeLb2iJtIzPiWkFI+Zw67goZPMKc+QYoXMvgkcYO Hg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pk83t05qv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Mar 2023 10:12:31 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32RACUSJ007002
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Mar 2023 10:12:30 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 27 Mar 2023 03:12:29 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v3 2/6] usb: gadget: f_fs: add more function with struct ffs_data *ffs parameter
Date:   Mon, 27 Mar 2023 18:12:16 +0800
Message-ID: <1679911940-4727-2-git-send-email-quic_linyyuan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: mz9k78vnFaVZsGmDLlilg27XpcMYHdAX
X-Proofpoint-GUID: mz9k78vnFaVZsGmDLlilg27XpcMYHdAX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=950 spamscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270081
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In order to show ffs->dev_name in debug message which is more readable
when multiple f_fs instance exist, it need to add struct ffs_data *ffs
parameter for several functions.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v3: fix review comment, move struct ffs_desc_helper change to single patch
v2: split to several changes according to v1 comments
v1: https://lore.kernel.org/linux-usb/1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com/

 drivers/usb/gadget/function/f_fs.c | 66 +++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 8830847..32e66f01 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -260,7 +260,7 @@ static void ffs_closed(struct ffs_data *ffs);
 
 static int ffs_mutex_lock(struct mutex *mutex, unsigned nonblock)
 	__attribute__((warn_unused_result, nonnull));
-static char *ffs_prepare_buffer(const char __user *buf, size_t len)
+static char *ffs_prepare_buffer(struct ffs_data *ffs, const char __user *buf, size_t len)
 	__attribute__((warn_unused_result, nonnull));
 
 
@@ -354,7 +354,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
 			break;
 		}
 
-		data = ffs_prepare_buffer(buf, len);
+		data = ffs_prepare_buffer(ffs, buf, len);
 		if (IS_ERR(data)) {
 			ret = PTR_ERR(data);
 			break;
@@ -426,7 +426,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
 
 		spin_unlock_irq(&ffs->ev.waitq.lock);
 
-		data = ffs_prepare_buffer(buf, len);
+		data = ffs_prepare_buffer(ffs, buf, len);
 		if (IS_ERR(data)) {
 			ret = PTR_ERR(data);
 			break;
@@ -713,7 +713,8 @@ static void ffs_epfile_io_complete(struct usb_ep *_ep, struct usb_request *req)
 	complete(&io_data->done);
 }
 
-static ssize_t ffs_copy_to_iter(void *data, int data_len, struct iov_iter *iter)
+static ssize_t ffs_copy_to_iter(struct ffs_data *ffs, void *data, int data_len,
+				struct iov_iter *iter)
 {
 	ssize_t ret = copy_to_iter(data, data_len, iter);
 	if (ret == data_len)
@@ -824,7 +825,7 @@ static void ffs_user_copy_worker(struct work_struct *work)
 
 	if (io_data->read && ret > 0) {
 		kthread_use_mm(io_data->mm);
-		ret = ffs_copy_to_iter(io_data->buf, ret, &io_data->data);
+		ret = ffs_copy_to_iter(io_data->ffs, io_data->buf, ret, &io_data->data);
 		kthread_unuse_mm(io_data->mm);
 	}
 
@@ -1984,16 +1985,16 @@ enum ffs_os_desc_type {
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
@@ -2023,7 +2024,7 @@ static int __must_check ffs_do_single_desc(char *data, unsigned len,
 			pr_vdebug("invalid entity's value\n");		\
 			return -EINVAL;					\
 		}							\
-		ret = entity(FFS_ ##type, &val, _ds, priv);		\
+		ret = entity(ffs, FFS_ ##type, &val, _ds, priv);		\
 		if (ret < 0) {						\
 			pr_debug("entity " #type "(%02x); ret = %d\n",	\
 				 (val), ret);				\
@@ -2132,7 +2133,7 @@ static int __must_check ffs_do_single_desc(char *data, unsigned len,
 	return length;
 }
 
-static int __must_check ffs_do_descs(unsigned count, char *data, unsigned len,
+static int __must_check ffs_do_descs(struct ffs_data *ffs, unsigned count, char *data, unsigned len,
 				     ffs_entity_callback entity, void *priv)
 {
 	const unsigned _len = len;
@@ -2146,7 +2147,7 @@ static int __must_check ffs_do_descs(unsigned count, char *data, unsigned len,
 			data = NULL;
 
 		/* Record "descriptor" entity */
-		ret = entity(FFS_DESCRIPTOR, (u8 *)num, (void *)data, priv);
+		ret = entity(ffs, FFS_DESCRIPTOR, (u8 *)num, (void *)data, priv);
 		if (ret < 0) {
 			pr_debug("entity DESCRIPTOR(%02lx); ret = %d\n",
 				 num, ret);
@@ -2156,7 +2157,7 @@ static int __must_check ffs_do_descs(unsigned count, char *data, unsigned len,
 		if (!data)
 			return _len - len;
 
-		ret = ffs_do_single_desc(data, len, entity, priv,
+		ret = ffs_do_single_desc(ffs, data, len, entity, priv,
 			&current_class);
 		if (ret < 0) {
 			pr_debug("%s returns %d\n", __func__, ret);
@@ -2169,7 +2170,7 @@ static int __must_check ffs_do_descs(unsigned count, char *data, unsigned len,
 	}
 }
 
-static int __ffs_data_do_entity(enum ffs_entity_type type,
+static int __ffs_data_do_entity(struct ffs_data *ffs, enum ffs_entity_type type,
 				u8 *valuep, struct usb_descriptor_header *desc,
 				void *priv)
 {
@@ -2217,7 +2218,7 @@ static int __ffs_data_do_entity(enum ffs_entity_type type,
 	return 0;
 }
 
-static int __ffs_do_os_desc_header(enum ffs_os_desc_type *next_type,
+static int __ffs_do_os_desc_header(struct ffs_data *ffs, enum ffs_os_desc_type *next_type,
 				   struct usb_os_desc_header *desc)
 {
 	u16 bcd_version = le16_to_cpu(desc->bcdVersion);
@@ -2250,7 +2251,7 @@ static int __ffs_do_os_desc_header(enum ffs_os_desc_type *next_type,
  * Process all extended compatibility/extended property descriptors
  * of a feature descriptor
  */
-static int __must_check ffs_do_single_os_desc(char *data, unsigned len,
+static int __must_check ffs_do_single_os_desc(struct ffs_data *ffs, char *data, unsigned len,
 					      enum ffs_os_desc_type type,
 					      u16 feature_count,
 					      ffs_os_desc_callback entity,
@@ -2262,7 +2263,7 @@ static int __must_check ffs_do_single_os_desc(char *data, unsigned len,
 
 	/* loop over all ext compat/ext prop descriptors */
 	while (feature_count--) {
-		ret = entity(type, h, data, len, priv);
+		ret = entity(ffs, type, h, data, len, priv);
 		if (ret < 0) {
 			pr_debug("bad OS descriptor, type: %d\n", type);
 			return ret;
@@ -2274,7 +2275,7 @@ static int __must_check ffs_do_single_os_desc(char *data, unsigned len,
 }
 
 /* Process a number of complete Feature Descriptors (Ext Compat or Ext Prop) */
-static int __must_check ffs_do_os_descs(unsigned count,
+static int __must_check ffs_do_os_descs(struct ffs_data *ffs, unsigned count,
 					char *data, unsigned len,
 					ffs_os_desc_callback entity, void *priv)
 {
@@ -2300,7 +2301,7 @@ static int __must_check ffs_do_os_descs(unsigned count,
 		if (le32_to_cpu(desc->dwLength) > len)
 			return -EINVAL;
 
-		ret = __ffs_do_os_desc_header(&type, desc);
+		ret = __ffs_do_os_desc_header(ffs, &type, desc);
 		if (ret < 0) {
 			pr_debug("entity OS_DESCRIPTOR(%02lx); ret = %d\n",
 				 num, ret);
@@ -2320,7 +2321,7 @@ static int __must_check ffs_do_os_descs(unsigned count,
 		 * Process all function/property descriptors
 		 * of this Feature Descriptor
 		 */
-		ret = ffs_do_single_os_desc(data, len, type,
+		ret = ffs_do_single_os_desc(ffs, data, len, type,
 					    feature_count, entity, priv, desc);
 		if (ret < 0) {
 			pr_debug("%s returns %d\n", __func__, ret);
@@ -2336,11 +2337,10 @@ static int __must_check ffs_do_os_descs(unsigned count,
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
@@ -2491,7 +2491,7 @@ static int __ffs_data_got_descs(struct ffs_data *ffs,
 			continue;
 		helper.interfaces_count = 0;
 		helper.eps_count = 0;
-		ret = ffs_do_descs(counts[i], data, len,
+		ret = ffs_do_descs(ffs, counts[i], data, len,
 				   __ffs_data_do_entity, &helper);
 		if (ret < 0)
 			goto error;
@@ -2512,8 +2512,8 @@ static int __ffs_data_got_descs(struct ffs_data *ffs,
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
@@ -2763,7 +2763,7 @@ static int ffs_ep_addr2idx(struct ffs_data *ffs, u8 endpoint_address)
 	return -ENOENT;
 }
 
-static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
+static int __ffs_func_bind_do_descs(struct ffs_data *ffs, enum ffs_entity_type type, u8 *valuep,
 				    struct usb_descriptor_header *desc,
 				    void *priv)
 {
@@ -2863,7 +2863,7 @@ static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
 	return 0;
 }
 
-static int __ffs_func_bind_do_nums(enum ffs_entity_type type, u8 *valuep,
+static int __ffs_func_bind_do_nums(struct ffs_data *ffs, enum ffs_entity_type type, u8 *valuep,
 				   struct usb_descriptor_header *desc,
 				   void *priv)
 {
@@ -2918,7 +2918,7 @@ static int __ffs_func_bind_do_nums(enum ffs_entity_type type, u8 *valuep,
 	return 0;
 }
 
-static int __ffs_func_bind_do_os_desc(enum ffs_os_desc_type type,
+static int __ffs_func_bind_do_os_desc(struct ffs_data *ffs, enum ffs_os_desc_type type,
 				      struct usb_os_desc_header *h, void *data,
 				      unsigned len, void *priv)
 {
@@ -3119,7 +3119,7 @@ static int _ffs_func_bind(struct usb_configuration *c,
 	 */
 	if (full) {
 		func->function.fs_descriptors = vla_ptr(vlabuf, d, fs_descs);
-		fs_len = ffs_do_descs(ffs->fs_descs_count,
+		fs_len = ffs_do_descs(ffs, ffs->fs_descs_count,
 				      vla_ptr(vlabuf, d, raw_descs),
 				      d_raw_descs__sz,
 				      __ffs_func_bind_do_descs, func);
@@ -3133,7 +3133,7 @@ static int _ffs_func_bind(struct usb_configuration *c,
 
 	if (high) {
 		func->function.hs_descriptors = vla_ptr(vlabuf, d, hs_descs);
-		hs_len = ffs_do_descs(ffs->hs_descs_count,
+		hs_len = ffs_do_descs(ffs, ffs->hs_descs_count,
 				      vla_ptr(vlabuf, d, raw_descs) + fs_len,
 				      d_raw_descs__sz - fs_len,
 				      __ffs_func_bind_do_descs, func);
@@ -3148,7 +3148,7 @@ static int _ffs_func_bind(struct usb_configuration *c,
 	if (super) {
 		func->function.ss_descriptors = func->function.ssp_descriptors =
 			vla_ptr(vlabuf, d, ss_descs);
-		ss_len = ffs_do_descs(ffs->ss_descs_count,
+		ss_len = ffs_do_descs(ffs, ffs->ss_descs_count,
 				vla_ptr(vlabuf, d, raw_descs) + fs_len + hs_len,
 				d_raw_descs__sz - fs_len - hs_len,
 				__ffs_func_bind_do_descs, func);
@@ -3165,7 +3165,7 @@ static int _ffs_func_bind(struct usb_configuration *c,
 	 * endpoint numbers rewriting.  We can do that in one go
 	 * now.
 	 */
-	ret = ffs_do_descs(ffs->fs_descs_count +
+	ret = ffs_do_descs(ffs, ffs->fs_descs_count +
 			   (high ? ffs->hs_descs_count : 0) +
 			   (super ? ffs->ss_descs_count : 0),
 			   vla_ptr(vlabuf, d, raw_descs), d_raw_descs__sz,
@@ -3185,7 +3185,7 @@ static int _ffs_func_bind(struct usb_configuration *c,
 				vla_ptr(vlabuf, d, ext_compat) + i * 16;
 			INIT_LIST_HEAD(&desc->ext_prop);
 		}
-		ret = ffs_do_os_descs(ffs->ms_os_descs_count,
+		ret = ffs_do_os_descs(ffs, ffs->ms_os_descs_count,
 				      vla_ptr(vlabuf, d, raw_descs) +
 				      fs_len + hs_len + ss_len,
 				      d_raw_descs__sz - fs_len - hs_len -
@@ -3781,7 +3781,7 @@ static int ffs_mutex_lock(struct mutex *mutex, unsigned nonblock)
 		: mutex_lock_interruptible(mutex);
 }
 
-static char *ffs_prepare_buffer(const char __user *buf, size_t len)
+static char *ffs_prepare_buffer(struct ffs_data *ffs, const char __user *buf, size_t len)
 {
 	char *data;
 
-- 
2.7.4

