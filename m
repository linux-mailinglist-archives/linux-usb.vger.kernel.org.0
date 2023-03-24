Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF9AE6C77A0
	for <lists+linux-usb@lfdr.de>; Fri, 24 Mar 2023 07:10:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbjCXGKs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Mar 2023 02:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231695AbjCXGKn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Mar 2023 02:10:43 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3EE28E7D
        for <linux-usb@vger.kernel.org>; Thu, 23 Mar 2023 23:10:36 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32NML4Rl031713;
        Fri, 24 Mar 2023 06:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=lvKwgopLNC9PRkmNS77loq2acotTB8H7pGhzZd1MBBA=;
 b=evsgCsCDXBleij3H9tvStM10CQ2QxTEyOy9iz3grdGqpSP1lXWtrVMK55JYPDXIMCNIp
 lUNX61OdBDWRJNuJf4fJrhnsXItPrf374YboudBAugSqI2EjM1w0YJfQ3oVA7bHRhmgZ
 9AM1I1rPHVR3ySW15wYtFn7KLKBko8BoPbO54+UsVhFmcbFBmdwDrnzt27eSyrNDt9lY
 GIb+pzJG+gSGwELOn1oVnzzsWESwCUiU2l6j+81rUoiPmHethnsJXdnS422N428DhNAs
 nW5t2UUXtWh1xHLv2B82DD6svS7yZeScotEEHSiPj4zqo1QxHYPIUibGCDrgXAHhqXyl cA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pgxrurx83-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Mar 2023 06:10:35 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32O6AYLl013830
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Mar 2023 06:10:34 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 23 Mar 2023 23:10:32 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 1/3] usb: gadget: f_fs: remove ENTER() macro
Date:   Fri, 24 Mar 2023 14:10:25 +0800
Message-ID: <1679638227-20496-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qTlBph_8dPqDlb-oqqKYnVwjOza9n37C
X-Proofpoint-GUID: qTlBph_8dPqDlb-oqqKYnVwjOza9n37C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_02,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303240048
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

ENTER() used to show function name which called during runtime, ftrace can
be used to get same information, let's remove it.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: split to several changes according to v1 comments
v1: https://lore.kernel.org/linux-usb/1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com/

 drivers/usb/gadget/function/f_fs.c | 94 --------------------------------------
 drivers/usb/gadget/function/u_fs.h |  2 -
 2 files changed, 96 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index a277c70..8830847 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -335,8 +335,6 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
 	ssize_t ret;
 	char *data;
 
-	ENTER();
-
 	/* Fast check if setup was canceled */
 	if (ffs_setup_state_clear_cancelled(ffs) == FFS_SETUP_CANCELLED)
 		return -EIDRM;
@@ -512,8 +510,6 @@ static ssize_t ffs_ep0_read(struct file *file, char __user *buf,
 	size_t n;
 	int ret;
 
-	ENTER();
-
 	/* Fast check if setup was canceled */
 	if (ffs_setup_state_clear_cancelled(ffs) == FFS_SETUP_CANCELLED)
 		return -EIDRM;
@@ -612,8 +608,6 @@ static int ffs_ep0_open(struct inode *inode, struct file *file)
 {
 	struct ffs_data *ffs = inode->i_private;
 
-	ENTER();
-
 	if (ffs->state == FFS_CLOSING)
 		return -EBUSY;
 
@@ -627,8 +621,6 @@ static int ffs_ep0_release(struct inode *inode, struct file *file)
 {
 	struct ffs_data *ffs = file->private_data;
 
-	ENTER();
-
 	ffs_data_closed(ffs);
 
 	return 0;
@@ -640,8 +632,6 @@ static long ffs_ep0_ioctl(struct file *file, unsigned code, unsigned long value)
 	struct usb_gadget *gadget = ffs->gadget;
 	long ret;
 
-	ENTER();
-
 	if (code == FUNCTIONFS_INTERFACE_REVMAP) {
 		struct ffs_function *func = ffs->func;
 		ret = func ? ffs_func_revmap_intf(func, value) : -ENODEV;
@@ -715,7 +705,6 @@ static void ffs_epfile_io_complete(struct usb_ep *_ep, struct usb_request *req)
 {
 	struct ffs_io_data *io_data = req->context;
 
-	ENTER();
 	if (req->status)
 		io_data->status = req->status;
 	else
@@ -856,8 +845,6 @@ static void ffs_epfile_async_io_complete(struct usb_ep *_ep,
 	struct ffs_io_data *io_data = req->context;
 	struct ffs_data *ffs = io_data->ffs;
 
-	ENTER();
-
 	io_data->status = req->status ? req->status : req->actual;
 	usb_ep_free_request(_ep, req);
 
@@ -1161,8 +1148,6 @@ ffs_epfile_open(struct inode *inode, struct file *file)
 {
 	struct ffs_epfile *epfile = inode->i_private;
 
-	ENTER();
-
 	if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
 		return -ENODEV;
 
@@ -1179,8 +1164,6 @@ static int ffs_aio_cancel(struct kiocb *kiocb)
 	unsigned long flags;
 	int value;
 
-	ENTER();
-
 	spin_lock_irqsave(&epfile->ffs->eps_lock, flags);
 
 	if (io_data && io_data->ep && io_data->req)
@@ -1198,8 +1181,6 @@ static ssize_t ffs_epfile_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 	struct ffs_io_data io_data, *p = &io_data;
 	ssize_t res;
 
-	ENTER();
-
 	if (!is_sync_kiocb(kiocb)) {
 		p = kzalloc(sizeof(io_data), GFP_KERNEL);
 		if (!p)
@@ -1235,8 +1216,6 @@ static ssize_t ffs_epfile_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 	struct ffs_io_data io_data, *p = &io_data;
 	ssize_t res;
 
-	ENTER();
-
 	if (!is_sync_kiocb(kiocb)) {
 		p = kzalloc(sizeof(io_data), GFP_KERNEL);
 		if (!p)
@@ -1284,8 +1263,6 @@ ffs_epfile_release(struct inode *inode, struct file *file)
 {
 	struct ffs_epfile *epfile = inode->i_private;
 
-	ENTER();
-
 	__ffs_epfile_read_buffer_free(epfile);
 	ffs_data_closed(epfile->ffs);
 
@@ -1299,8 +1276,6 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 	struct ffs_ep *ep;
 	int ret;
 
-	ENTER();
-
 	if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
 		return -ENODEV;
 
@@ -1399,8 +1374,6 @@ ffs_sb_make_inode(struct super_block *sb, void *data,
 {
 	struct inode *inode;
 
-	ENTER();
-
 	inode = new_inode(sb);
 
 	if (inode) {
@@ -1432,8 +1405,6 @@ static struct dentry *ffs_sb_create_file(struct super_block *sb,
 	struct dentry	*dentry;
 	struct inode	*inode;
 
-	ENTER();
-
 	dentry = d_alloc_name(sb->s_root, name);
 	if (!dentry)
 		return NULL;
@@ -1468,8 +1439,6 @@ static int ffs_sb_fill(struct super_block *sb, struct fs_context *fc)
 	struct inode	*inode;
 	struct ffs_data	*ffs = data->ffs_data;
 
-	ENTER();
-
 	ffs->sb              = sb;
 	data->ffs_data       = NULL;
 	sb->s_fs_info        = ffs;
@@ -1521,8 +1490,6 @@ static int ffs_fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 	struct fs_parse_result result;
 	int opt;
 
-	ENTER();
-
 	opt = fs_parse(fc, ffs_fs_fs_parameters, param, &result);
 	if (opt < 0)
 		return opt;
@@ -1572,8 +1539,6 @@ static int ffs_fs_get_tree(struct fs_context *fc)
 	struct ffs_data	*ffs;
 	int ret;
 
-	ENTER();
-
 	if (!fc->source)
 		return invalf(fc, "No source specified");
 
@@ -1640,8 +1605,6 @@ static int ffs_fs_init_fs_context(struct fs_context *fc)
 static void
 ffs_fs_kill_sb(struct super_block *sb)
 {
-	ENTER();
-
 	kill_litter_super(sb);
 	if (sb->s_fs_info)
 		ffs_data_closed(sb->s_fs_info);
@@ -1663,8 +1626,6 @@ static int functionfs_init(void)
 {
 	int ret;
 
-	ENTER();
-
 	ret = register_filesystem(&ffs_fs_type);
 	if (!ret)
 		pr_info("file system registered\n");
@@ -1676,8 +1637,6 @@ static int functionfs_init(void)
 
 static void functionfs_cleanup(void)
 {
-	ENTER();
-
 	pr_info("unloading\n");
 	unregister_filesystem(&ffs_fs_type);
 }
@@ -1690,15 +1649,11 @@ static void ffs_data_reset(struct ffs_data *ffs);
 
 static void ffs_data_get(struct ffs_data *ffs)
 {
-	ENTER();
-
 	refcount_inc(&ffs->ref);
 }
 
 static void ffs_data_opened(struct ffs_data *ffs)
 {
-	ENTER();
-
 	refcount_inc(&ffs->ref);
 	if (atomic_add_return(1, &ffs->opened) == 1 &&
 			ffs->state == FFS_DEACTIVATED) {
@@ -1709,8 +1664,6 @@ static void ffs_data_opened(struct ffs_data *ffs)
 
 static void ffs_data_put(struct ffs_data *ffs)
 {
-	ENTER();
-
 	if (refcount_dec_and_test(&ffs->ref)) {
 		pr_info("%s(): freeing\n", __func__);
 		ffs_data_clear(ffs);
@@ -1729,8 +1682,6 @@ static void ffs_data_closed(struct ffs_data *ffs)
 	struct ffs_epfile *epfiles;
 	unsigned long flags;
 
-	ENTER();
-
 	if (atomic_dec_and_test(&ffs->opened)) {
 		if (ffs->no_disconnect) {
 			ffs->state = FFS_DEACTIVATED;
@@ -1765,8 +1716,6 @@ static struct ffs_data *ffs_data_new(const char *dev_name)
 	if (!ffs)
 		return NULL;
 
-	ENTER();
-
 	ffs->io_completion_wq = alloc_ordered_workqueue("%s", 0, dev_name);
 	if (!ffs->io_completion_wq) {
 		kfree(ffs);
@@ -1793,8 +1742,6 @@ static void ffs_data_clear(struct ffs_data *ffs)
 	struct ffs_epfile *epfiles;
 	unsigned long flags;
 
-	ENTER();
-
 	ffs_closed(ffs);
 
 	BUG_ON(ffs->gadget);
@@ -1826,8 +1773,6 @@ static void ffs_data_clear(struct ffs_data *ffs)
 
 static void ffs_data_reset(struct ffs_data *ffs)
 {
-	ENTER();
-
 	ffs_data_clear(ffs);
 
 	ffs->raw_descs_data = NULL;
@@ -1861,8 +1806,6 @@ static int functionfs_bind(struct ffs_data *ffs, struct usb_composite_dev *cdev)
 	struct usb_gadget_strings **lang;
 	int first_id;
 
-	ENTER();
-
 	if (WARN_ON(ffs->state != FFS_ACTIVE
 		 || test_and_set_bit(FFS_FL_BOUND, &ffs->flags)))
 		return -EBADFD;
@@ -1894,8 +1837,6 @@ static int functionfs_bind(struct ffs_data *ffs, struct usb_composite_dev *cdev)
 
 static void functionfs_unbind(struct ffs_data *ffs)
 {
-	ENTER();
-
 	if (!WARN_ON(!ffs->gadget)) {
 		/* dequeue before freeing ep0req */
 		usb_ep_dequeue(ffs->gadget->ep0, ffs->ep0req);
@@ -1914,8 +1855,6 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
 	struct ffs_epfile *epfile, *epfiles;
 	unsigned i, count;
 
-	ENTER();
-
 	count = ffs->eps_count;
 	epfiles = kcalloc(count, sizeof(*epfiles), GFP_KERNEL);
 	if (!epfiles)
@@ -1946,8 +1885,6 @@ static void ffs_epfiles_destroy(struct ffs_epfile *epfiles, unsigned count)
 {
 	struct ffs_epfile *epfile = epfiles;
 
-	ENTER();
-
 	for (; count; --count, ++epfile) {
 		BUG_ON(mutex_is_locked(&epfile->mutex));
 		if (epfile->dentry) {
@@ -2064,8 +2001,6 @@ static int __must_check ffs_do_single_desc(char *data, unsigned len,
 	u8 length;
 	int ret;
 
-	ENTER();
-
 	/* At least two bytes are required: length and type */
 	if (len < 2) {
 		pr_vdebug("descriptor too short\n");
@@ -2204,8 +2139,6 @@ static int __must_check ffs_do_descs(unsigned count, char *data, unsigned len,
 	unsigned long num = 0;
 	int current_class = -1;
 
-	ENTER();
-
 	for (;;) {
 		int ret;
 
@@ -2243,8 +2176,6 @@ static int __ffs_data_do_entity(enum ffs_entity_type type,
 	struct ffs_desc_helper *helper = priv;
 	struct usb_endpoint_descriptor *d;
 
-	ENTER();
-
 	switch (type) {
 	case FFS_DESCRIPTOR:
 		break;
@@ -2329,8 +2260,6 @@ static int __must_check ffs_do_single_os_desc(char *data, unsigned len,
 	int ret;
 	const unsigned _len = len;
 
-	ENTER();
-
 	/* loop over all ext compat/ext prop descriptors */
 	while (feature_count--) {
 		ret = entity(type, h, data, len, priv);
@@ -2352,8 +2281,6 @@ static int __must_check ffs_do_os_descs(unsigned count,
 	const unsigned _len = len;
 	unsigned long num = 0;
 
-	ENTER();
-
 	for (num = 0; num < count; ++num) {
 		int ret;
 		enum ffs_os_desc_type type;
@@ -2416,8 +2343,6 @@ static int __ffs_data_do_os_desc(enum ffs_os_desc_type type,
 	struct ffs_data *ffs = priv;
 	u8 length;
 
-	ENTER();
-
 	switch (type) {
 	case FFS_OS_DESC_EXT_COMPAT: {
 		struct usb_ext_compat_desc *d = data;
@@ -2493,8 +2418,6 @@ static int __ffs_data_got_descs(struct ffs_data *ffs,
 	int ret = -EINVAL, i;
 	struct ffs_desc_helper helper;
 
-	ENTER();
-
 	if (get_unaligned_le32(data + 4) != len)
 		goto error;
 
@@ -2625,8 +2548,6 @@ static int __ffs_data_got_strings(struct ffs_data *ffs,
 	const char *data = _data;
 	struct usb_string *s;
 
-	ENTER();
-
 	if (len < 16 ||
 	    get_unaligned_le32(data) != FUNCTIONFS_STRINGS_MAGIC ||
 	    get_unaligned_le32(data + 4) != len)
@@ -3085,8 +3006,6 @@ static inline struct f_fs_opts *ffs_do_functionfs_bind(struct usb_function *f,
 	struct ffs_data *ffs_data;
 	int ret;
 
-	ENTER();
-
 	/*
 	 * Legacy gadget triggers binding in functionfs_ready_callback,
 	 * which already uses locking; taking the same lock here would
@@ -3163,8 +3082,6 @@ static int _ffs_func_bind(struct usb_configuration *c,
 	vla_item_with_sz(d, char, raw_descs, ffs->raw_descs_length);
 	char *vlabuf;
 
-	ENTER();
-
 	/* Has descriptors only for speeds gadget does not support */
 	if (!(full | high | super))
 		return -ENOTSUPP;
@@ -3368,8 +3285,6 @@ static int ffs_func_setup(struct usb_function *f,
 	unsigned long flags;
 	int ret;
 
-	ENTER();
-
 	pr_vdebug("creq->bRequestType = %02x\n", creq->bRequestType);
 	pr_vdebug("creq->bRequest     = %02x\n", creq->bRequest);
 	pr_vdebug("creq->wValue       = %04x\n", le16_to_cpu(creq->wValue));
@@ -3444,13 +3359,11 @@ static bool ffs_func_req_match(struct usb_function *f,
 
 static void ffs_func_suspend(struct usb_function *f)
 {
-	ENTER();
 	ffs_event_add(ffs_func_from_usb(f)->ffs, FUNCTIONFS_SUSPEND);
 }
 
 static void ffs_func_resume(struct usb_function *f)
 {
-	ENTER();
 	ffs_event_add(ffs_func_from_usb(f)->ffs, FUNCTIONFS_RESUME);
 }
 
@@ -3614,7 +3527,6 @@ static void ffs_func_unbind(struct usb_configuration *c,
 	unsigned count = ffs->eps_count;
 	unsigned long flags;
 
-	ENTER();
 	if (ffs->func == func) {
 		ffs_func_eps_disable(func);
 		ffs->func = NULL;
@@ -3654,8 +3566,6 @@ static struct usb_function *ffs_alloc(struct usb_function_instance *fi)
 {
 	struct ffs_function *func;
 
-	ENTER();
-
 	func = kzalloc(sizeof(*func), GFP_KERNEL);
 	if (!func)
 		return ERR_PTR(-ENOMEM);
@@ -3756,7 +3666,6 @@ static int ffs_acquire_dev(const char *dev_name, struct ffs_data *ffs_data)
 	int ret = 0;
 	struct ffs_dev *ffs_dev;
 
-	ENTER();
 	ffs_dev_lock();
 
 	ffs_dev = _ffs_find_dev(dev_name);
@@ -3779,7 +3688,6 @@ static int ffs_acquire_dev(const char *dev_name, struct ffs_data *ffs_data)
 
 static void ffs_release_dev(struct ffs_dev *ffs_dev)
 {
-	ENTER();
 	ffs_dev_lock();
 
 	if (ffs_dev && ffs_dev->mounted) {
@@ -3801,7 +3709,6 @@ static int ffs_ready(struct ffs_data *ffs)
 	struct ffs_dev *ffs_obj;
 	int ret = 0;
 
-	ENTER();
 	ffs_dev_lock();
 
 	ffs_obj = ffs->private_data;
@@ -3834,7 +3741,6 @@ static void ffs_closed(struct ffs_data *ffs)
 	struct f_fs_opts *opts;
 	struct config_item *ci;
 
-	ENTER();
 	ffs_dev_lock();
 
 	ffs_obj = ffs->private_data;
diff --git a/drivers/usb/gadget/function/u_fs.h b/drivers/usb/gadget/function/u_fs.h
index f102ec2..4b3365f 100644
--- a/drivers/usb/gadget/function/u_fs.h
+++ b/drivers/usb/gadget/function/u_fs.h
@@ -32,8 +32,6 @@
 #  define ffs_dump_mem(prefix, ptr, len) do { } while (0)
 #endif /* VERBOSE_DEBUG */
 
-#define ENTER()    pr_vdebug("%s()\n", __func__)
-
 struct f_fs_opts;
 
 struct ffs_dev {
-- 
2.7.4

