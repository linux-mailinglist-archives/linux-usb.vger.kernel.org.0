Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E18C6C47C4
	for <lists+linux-usb@lfdr.de>; Wed, 22 Mar 2023 11:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbjCVKg2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Mar 2023 06:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbjCVKg1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Mar 2023 06:36:27 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C9BF52F57
        for <linux-usb@vger.kernel.org>; Wed, 22 Mar 2023 03:36:23 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32MAD8dh031159;
        Wed, 22 Mar 2023 10:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=Rvof6eBCeCAPAzO0oPiB9cmcl8cYYU00HfriHifhBLI=;
 b=GbH7EPqhrPK80NHGYvaKrB8rz44b1rNVh69HaCsG4CyjMrrxfNplnMZrlorlUvLjUsQM
 4sSKIy+MJEN0K5USlnZk300k45tWs5b+YNtP+GwS9UanD+iQ6w/lvdfTSFLPi4K953Xt
 Zf36wGgRn+59UFSEuKNw5evY911k4yTClsVNkDQl4K5Dn/Is4ZF1OEFFx/5yDFrdDOwO
 +tYHFB187yxJTax2GjngUKHIi0noZEz5ScIQ5VaiGgj9ipgLh6NcPnGrar9C0CXzvFrG
 f7tXbJyMuZLiXh8Rujtw0+6BVrRSgB69GY9pO0w7dcJaKS+oSSTG/qKmX1+LjAgQg5zZ kQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pfc2pu30g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 22 Mar 2023 10:36:21 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32MAaK6d026255
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 22 Mar 2023 10:36:20 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 22 Mar 2023 03:36:18 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH] usb: gadget: f_fs: show device name in debug message
Date:   Wed, 22 Mar 2023 18:36:09 +0800
Message-ID: <1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yUJGVYPB5H5fsJAJK7yfr1Gd3WniJ6BH
X-Proofpoint-GUID: yUJGVYPB5H5fsJAJK7yfr1Gd3WniJ6BH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_07,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1011 mlxlogscore=952 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220075
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

when multiple instances in use, the debug message is hard to understand
as there is no instance name show.

this change will show each instance name for all most all debug messsage.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/function/f_fs.c | 406 +++++++++++++++++++------------------
 drivers/usb/gadget/function/u_fs.h |   2 +
 2 files changed, 215 insertions(+), 193 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index a277c70..5abeb18 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -231,13 +231,13 @@ struct ffs_io_data {
 };
 
 struct ffs_desc_helper {
-	struct ffs_data *ffs;
-	unsigned interfaces_count;
-	unsigned eps_count;
+	unsigned int interfaces_count;
+	unsigned int eps_count;
 };
 
 static int  __must_check ffs_epfiles_create(struct ffs_data *ffs);
-static void ffs_epfiles_destroy(struct ffs_epfile *epfiles, unsigned count);
+static void ffs_epfiles_destroy(struct ffs_data *ffs, struct ffs_epfile *epfiles,
+				unsigned int count);
 
 static struct dentry *
 ffs_sb_create_file(struct super_block *sb, const char *name, void *data,
@@ -258,9 +258,9 @@ static void ffs_closed(struct ffs_data *ffs);
 
 /* Misc helper functions ****************************************************/
 
-static int ffs_mutex_lock(struct mutex *mutex, unsigned nonblock)
+static int ffs_mutex_lock(struct mutex *mutex, unsigned int nonblock)
 	__attribute__((warn_unused_result, nonnull));
-static char *ffs_prepare_buffer(const char __user *buf, size_t len)
+static char *ffs_prepare_buffer(struct ffs_data *ffs, const char __user *buf, size_t len)
 	__attribute__((warn_unused_result, nonnull));
 
 
@@ -318,12 +318,12 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
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
@@ -335,7 +335,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
 	ssize_t ret;
 	char *data;
 
-	ENTER();
+	ENTER_FFS();
 
 	/* Fast check if setup was canceled */
 	if (ffs_setup_state_clear_cancelled(ffs) == FFS_SETUP_CANCELLED)
@@ -356,7 +356,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
 			break;
 		}
 
-		data = ffs_prepare_buffer(buf, len);
+		data = ffs_prepare_buffer(ffs, buf, len);
 		if (IS_ERR(data)) {
 			ret = PTR_ERR(data);
 			break;
@@ -364,7 +364,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
 
 		/* Handle data */
 		if (ffs->state == FFS_READ_DESCRIPTORS) {
-			pr_info("read descriptors\n");
+			pr_info("%s: read descriptors\n", ffs->dev_name);
 			ret = __ffs_data_got_descs(ffs, data, len);
 			if (ret < 0)
 				break;
@@ -372,7 +372,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
 			ffs->state = FFS_READ_STRINGS;
 			ret = len;
 		} else {
-			pr_info("read strings\n");
+			pr_info("%s: read strings\n", ffs->dev_name);
 			ret = __ffs_data_got_strings(ffs, data, len);
 			if (ret < 0)
 				break;
@@ -428,7 +428,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
 
 		spin_unlock_irq(&ffs->ev.waitq.lock);
 
-		data = ffs_prepare_buffer(buf, len);
+		data = ffs_prepare_buffer(ffs, buf, len);
 		if (IS_ERR(data)) {
 			ret = PTR_ERR(data);
 			break;
@@ -512,7 +512,7 @@ static ssize_t ffs_ep0_read(struct file *file, char __user *buf,
 	size_t n;
 	int ret;
 
-	ENTER();
+	ENTER_FFS();
 
 	/* Fast check if setup was canceled */
 	if (ffs_setup_state_clear_cancelled(ffs) == FFS_SETUP_CANCELLED)
@@ -612,7 +612,7 @@ static int ffs_ep0_open(struct inode *inode, struct file *file)
 {
 	struct ffs_data *ffs = inode->i_private;
 
-	ENTER();
+	ENTER_FFS();
 
 	if (ffs->state == FFS_CLOSING)
 		return -EBUSY;
@@ -627,20 +627,20 @@ static int ffs_ep0_release(struct inode *inode, struct file *file)
 {
 	struct ffs_data *ffs = file->private_data;
 
-	ENTER();
+	ENTER_FFS();
 
 	ffs_data_closed(ffs);
 
 	return 0;
 }
 
-static long ffs_ep0_ioctl(struct file *file, unsigned code, unsigned long value)
+static long ffs_ep0_ioctl(struct file *file, unsigned int code, unsigned long value)
 {
 	struct ffs_data *ffs = file->private_data;
 	struct usb_gadget *gadget = ffs->gadget;
 	long ret;
 
-	ENTER();
+	ENTER_FFS();
 
 	if (code == FUNCTIONFS_INTERFACE_REVMAP) {
 		struct ffs_function *func = ffs->func;
@@ -714,8 +714,9 @@ static const struct file_operations ffs_ep0_operations = {
 static void ffs_epfile_io_complete(struct usb_ep *_ep, struct usb_request *req)
 {
 	struct ffs_io_data *io_data = req->context;
+	struct ffs_data * __maybe_unused ffs = io_data->ffs;
 
-	ENTER();
+	ENTER_FFS();
 	if (req->status)
 		io_data->status = req->status;
 	else
@@ -724,7 +725,8 @@ static void ffs_epfile_io_complete(struct usb_ep *_ep, struct usb_request *req)
 	complete(&io_data->done);
 }
 
-static ssize_t ffs_copy_to_iter(void *data, int data_len, struct iov_iter *iter)
+static ssize_t ffs_copy_to_iter(struct ffs_data *ffs, void *data, int data_len,
+				struct iov_iter *iter)
 {
 	ssize_t ret = copy_to_iter(data, data_len, iter);
 	if (ret == data_len)
@@ -760,9 +762,9 @@ static ssize_t ffs_copy_to_iter(void *data, int data_len, struct iov_iter *iter)
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
@@ -835,7 +837,7 @@ static void ffs_user_copy_worker(struct work_struct *work)
 
 	if (io_data->read && ret > 0) {
 		kthread_use_mm(io_data->mm);
-		ret = ffs_copy_to_iter(io_data->buf, ret, &io_data->data);
+		ret = ffs_copy_to_iter(io_data->ffs, io_data->buf, ret, &io_data->data);
 		kthread_unuse_mm(io_data->mm);
 	}
 
@@ -856,7 +858,7 @@ static void ffs_epfile_async_io_complete(struct usb_ep *_ep,
 	struct ffs_io_data *io_data = req->context;
 	struct ffs_data *ffs = io_data->ffs;
 
-	ENTER();
+	ENTER_FFS();
 
 	io_data->status = req->status ? req->status : req->actual;
 	usb_ep_free_request(_ep, req);
@@ -915,6 +917,7 @@ static ssize_t __ffs_epfile_read_data(struct ffs_epfile *epfile,
 				      struct iov_iter *iter)
 {
 	struct ffs_buffer *buf;
+	struct ffs_data *ffs = epfile->ffs;
 
 	ssize_t ret = copy_to_iter(data, data_len, iter);
 	if (data_len == ret)
@@ -924,8 +927,8 @@ static ssize_t __ffs_epfile_read_data(struct ffs_epfile *epfile,
 		return -EFAULT;
 
 	/* See ffs_copy_to_iter for more context. */
-	pr_warn("functionfs read size %d > requested size %zd, splitting request into multiple reads.",
-		data_len, ret);
+	pr_warn("%s: functionfs read size %d > requested size %zd, splitting request into multiple reads.",
+		ffs->dev_name, data_len, ret);
 
 	data_len -= ret;
 	buf = kmalloc(struct_size(buf, storage, data_len), GFP_KERNEL);
@@ -1073,6 +1076,7 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 		req->length = data_len;
 
 		io_data->buf = data;
+		io_data->ffs = epfile->ffs;
 
 		init_completion(&io_data->done);
 		req->context  = io_data;
@@ -1160,14 +1164,15 @@ static int
 ffs_epfile_open(struct inode *inode, struct file *file)
 {
 	struct ffs_epfile *epfile = inode->i_private;
+	struct ffs_data *ffs = epfile->ffs;
 
-	ENTER();
+	ENTER_FFS();
 
-	if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
+	if (WARN_ON(ffs->state != FFS_ACTIVE))
 		return -ENODEV;
 
 	file->private_data = epfile;
-	ffs_data_opened(epfile->ffs);
+	ffs_data_opened(ffs);
 
 	return stream_open(inode, file);
 }
@@ -1176,29 +1181,32 @@ static int ffs_aio_cancel(struct kiocb *kiocb)
 {
 	struct ffs_io_data *io_data = kiocb->private;
 	struct ffs_epfile *epfile = kiocb->ki_filp->private_data;
+	struct ffs_data *ffs = epfile->ffs;
 	unsigned long flags;
 	int value;
 
-	ENTER();
+	ENTER_FFS();
 
-	spin_lock_irqsave(&epfile->ffs->eps_lock, flags);
+	spin_lock_irqsave(&ffs->eps_lock, flags);
 
 	if (io_data && io_data->ep && io_data->req)
 		value = usb_ep_dequeue(io_data->ep, io_data->req);
 	else
 		value = -EINVAL;
 
-	spin_unlock_irqrestore(&epfile->ffs->eps_lock, flags);
+	spin_unlock_irqrestore(&ffs->eps_lock, flags);
 
 	return value;
 }
 
 static ssize_t ffs_epfile_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 {
+	struct ffs_epfile *epfile = kiocb->ki_filp->private_data;
+	struct ffs_data * __maybe_unused ffs = epfile->ffs;
 	struct ffs_io_data io_data, *p = &io_data;
 	ssize_t res;
 
-	ENTER();
+	ENTER_FFS();
 
 	if (!is_sync_kiocb(kiocb)) {
 		p = kzalloc(sizeof(io_data), GFP_KERNEL);
@@ -1232,10 +1240,12 @@ static ssize_t ffs_epfile_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 
 static ssize_t ffs_epfile_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 {
+	struct ffs_epfile *epfile = kiocb->ki_filp->private_data;
+	struct ffs_data * __maybe_unused ffs = epfile->ffs;
 	struct ffs_io_data io_data, *p = &io_data;
 	ssize_t res;
 
-	ENTER();
+	ENTER_FFS();
 
 	if (!is_sync_kiocb(kiocb)) {
 		p = kzalloc(sizeof(io_data), GFP_KERNEL);
@@ -1283,25 +1293,27 @@ static int
 ffs_epfile_release(struct inode *inode, struct file *file)
 {
 	struct ffs_epfile *epfile = inode->i_private;
+	struct ffs_data *ffs = epfile->ffs;
 
-	ENTER();
+	ENTER_FFS();
 
 	__ffs_epfile_read_buffer_free(epfile);
-	ffs_data_closed(epfile->ffs);
+	ffs_data_closed(ffs);
 
 	return 0;
 }
 
-static long ffs_epfile_ioctl(struct file *file, unsigned code,
+static long ffs_epfile_ioctl(struct file *file, unsigned int code,
 			     unsigned long value)
 {
 	struct ffs_epfile *epfile = file->private_data;
+	struct ffs_data *ffs = epfile->ffs;
 	struct ffs_ep *ep;
 	int ret;
 
-	ENTER();
+	ENTER_FFS();
 
-	if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
+	if (WARN_ON(ffs->state != FFS_ACTIVE))
 		return -ENODEV;
 
 	/* Wait for endpoint to be enabled */
@@ -1311,16 +1323,16 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 			return -EAGAIN;
 
 		ret = wait_event_interruptible(
-				epfile->ffs->wait, (ep = epfile->ep));
+				ffs->wait, (ep = epfile->ep));
 		if (ret)
 			return -EINTR;
 	}
 
-	spin_lock_irq(&epfile->ffs->eps_lock);
+	spin_lock_irq(&ffs->eps_lock);
 
 	/* In the meantime, endpoint got disabled or changed. */
 	if (epfile->ep != ep) {
-		spin_unlock_irq(&epfile->ffs->eps_lock);
+		spin_unlock_irq(&ffs->eps_lock);
 		return -ESHUTDOWN;
 	}
 
@@ -1343,7 +1355,7 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 		int desc_idx;
 		struct usb_endpoint_descriptor desc1, *desc;
 
-		switch (epfile->ffs->gadget->speed) {
+		switch (ffs->gadget->speed) {
 		case USB_SPEED_SUPER:
 		case USB_SPEED_SUPER_PLUS:
 			desc_idx = 2;
@@ -1358,7 +1370,7 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 		desc = epfile->ep->descs[desc_idx];
 		memcpy(&desc1, desc, desc->bLength);
 
-		spin_unlock_irq(&epfile->ffs->eps_lock);
+		spin_unlock_irq(&ffs->eps_lock);
 		ret = copy_to_user((void __user *)value, &desc1, desc1.bLength);
 		if (ret)
 			ret = -EFAULT;
@@ -1367,7 +1379,7 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 	default:
 		ret = -ENOTTY;
 	}
-	spin_unlock_irq(&epfile->ffs->eps_lock);
+	spin_unlock_irq(&ffs->eps_lock);
 
 	return ret;
 }
@@ -1397,9 +1409,10 @@ ffs_sb_make_inode(struct super_block *sb, void *data,
 		  const struct inode_operations *iops,
 		  struct ffs_file_perms *perms)
 {
+	struct ffs_data	*ffs = sb->s_fs_info;
 	struct inode *inode;
 
-	ENTER();
+	ENTER_FFS();
 
 	inode = new_inode(sb);
 
@@ -1432,7 +1445,7 @@ static struct dentry *ffs_sb_create_file(struct super_block *sb,
 	struct dentry	*dentry;
 	struct inode	*inode;
 
-	ENTER();
+	ENTER_FFS();
 
 	dentry = d_alloc_name(sb->s_root, name);
 	if (!dentry)
@@ -1468,7 +1481,7 @@ static int ffs_sb_fill(struct super_block *sb, struct fs_context *fc)
 	struct inode	*inode;
 	struct ffs_data	*ffs = data->ffs_data;
 
-	ENTER();
+	ENTER_FFS();
 
 	ffs->sb              = sb;
 	data->ffs_data       = NULL;
@@ -1690,14 +1703,14 @@ static void ffs_data_reset(struct ffs_data *ffs);
 
 static void ffs_data_get(struct ffs_data *ffs)
 {
-	ENTER();
+	ENTER_FFS();
 
 	refcount_inc(&ffs->ref);
 }
 
 static void ffs_data_opened(struct ffs_data *ffs)
 {
-	ENTER();
+	ENTER_FFS();
 
 	refcount_inc(&ffs->ref);
 	if (atomic_add_return(1, &ffs->opened) == 1 &&
@@ -1709,10 +1722,10 @@ static void ffs_data_opened(struct ffs_data *ffs)
 
 static void ffs_data_put(struct ffs_data *ffs)
 {
-	ENTER();
+	ENTER_FFS();
 
 	if (refcount_dec_and_test(&ffs->ref)) {
-		pr_info("%s(): freeing\n", __func__);
+		pr_info("%s(): %s: freeing\n", __func__, ffs->dev_name);
 		ffs_data_clear(ffs);
 		ffs_release_dev(ffs->private_data);
 		BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
@@ -1729,7 +1742,7 @@ static void ffs_data_closed(struct ffs_data *ffs)
 	struct ffs_epfile *epfiles;
 	unsigned long flags;
 
-	ENTER();
+	ENTER_FFS();
 
 	if (atomic_dec_and_test(&ffs->opened)) {
 		if (ffs->no_disconnect) {
@@ -1741,7 +1754,7 @@ static void ffs_data_closed(struct ffs_data *ffs)
 							flags);
 
 			if (epfiles)
-				ffs_epfiles_destroy(epfiles,
+				ffs_epfiles_destroy(ffs, epfiles,
 						 ffs->eps_count);
 
 			if (ffs->setup_state == FFS_SETUP_PENDING)
@@ -1793,7 +1806,7 @@ static void ffs_data_clear(struct ffs_data *ffs)
 	struct ffs_epfile *epfiles;
 	unsigned long flags;
 
-	ENTER();
+	ENTER_FFS();
 
 	ffs_closed(ffs);
 
@@ -1810,7 +1823,7 @@ static void ffs_data_clear(struct ffs_data *ffs)
 	 * copy of epfile will save us from use-after-free.
 	 */
 	if (epfiles) {
-		ffs_epfiles_destroy(epfiles, ffs->eps_count);
+		ffs_epfiles_destroy(ffs, epfiles, ffs->eps_count);
 		ffs->epfiles = NULL;
 	}
 
@@ -1826,7 +1839,7 @@ static void ffs_data_clear(struct ffs_data *ffs)
 
 static void ffs_data_reset(struct ffs_data *ffs)
 {
-	ENTER();
+	ENTER_FFS();
 
 	ffs_data_clear(ffs);
 
@@ -1861,7 +1874,7 @@ static int functionfs_bind(struct ffs_data *ffs, struct usb_composite_dev *cdev)
 	struct usb_gadget_strings **lang;
 	int first_id;
 
-	ENTER();
+	ENTER_FFS();
 
 	if (WARN_ON(ffs->state != FFS_ACTIVE
 		 || test_and_set_bit(FFS_FL_BOUND, &ffs->flags)))
@@ -1894,7 +1907,7 @@ static int functionfs_bind(struct ffs_data *ffs, struct usb_composite_dev *cdev)
 
 static void functionfs_unbind(struct ffs_data *ffs)
 {
-	ENTER();
+	ENTER_FFS();
 
 	if (!WARN_ON(!ffs->gadget)) {
 		/* dequeue before freeing ep0req */
@@ -1912,9 +1925,9 @@ static void functionfs_unbind(struct ffs_data *ffs)
 static int ffs_epfiles_create(struct ffs_data *ffs)
 {
 	struct ffs_epfile *epfile, *epfiles;
-	unsigned i, count;
+	unsigned int i, count;
 
-	ENTER();
+	ENTER_FFS();
 
 	count = ffs->eps_count;
 	epfiles = kcalloc(count, sizeof(*epfiles), GFP_KERNEL);
@@ -1933,7 +1946,7 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
 						 epfile,
 						 &ffs_epfile_operations);
 		if (!epfile->dentry) {
-			ffs_epfiles_destroy(epfiles, i - 1);
+			ffs_epfiles_destroy(ffs, epfiles, i - 1);
 			return -ENOMEM;
 		}
 	}
@@ -1942,11 +1955,12 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
 	return 0;
 }
 
-static void ffs_epfiles_destroy(struct ffs_epfile *epfiles, unsigned count)
+static void ffs_epfiles_destroy(struct ffs_data *ffs, struct ffs_epfile *epfiles,
+				unsigned int count)
 {
 	struct ffs_epfile *epfile = epfiles;
 
-	ENTER();
+	ENTER_FFS();
 
 	for (; count; --count, ++epfile) {
 		BUG_ON(mutex_is_locked(&epfile->mutex));
@@ -2005,8 +2019,8 @@ static int ffs_func_eps_enable(struct ffs_function *func)
 
 		ret = config_ep_by_speed(func->gadget, &func->function, ep->ep);
 		if (ret) {
-			pr_err("%s: config_ep_by_speed(%s) returned %d\n",
-					__func__, ep->ep->name, ret);
+			pr_err("%s: %s(): config_ep_by_speed(%s) returned %d\n",
+					ffs->dev_name, __func__, ep->ep->name, ret);
 			break;
 		}
 
@@ -2047,16 +2061,16 @@ enum ffs_os_desc_type {
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
-				    unsigned len, void *priv);
+				    unsigned int len, void *priv);
 
-static int __must_check ffs_do_single_desc(char *data, unsigned len,
+static int __must_check ffs_do_single_desc(struct ffs_data *ffs, char *data, unsigned int len,
 					   ffs_entity_callback entity,
 					   void *priv, int *current_class)
 {
@@ -2064,18 +2078,18 @@ static int __must_check ffs_do_single_desc(char *data, unsigned len,
 	u8 length;
 	int ret;
 
-	ENTER();
+	ENTER_FFS();
 
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
 
@@ -2083,15 +2097,15 @@ static int __must_check ffs_do_single_desc(char *data, unsigned len,
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
-		ret = entity(FFS_ ##type, &val, _ds, priv);		\
+		ret = entity(ffs, FFS_ ##type, &val, _ds, priv);	\
 		if (ret < 0) {						\
-			pr_debug("entity " #type "(%02x); ret = %d\n",	\
-				 (val), ret);				\
+			pr_debug("%s: entity " #type "(%02x); ret = %d\n",	\
+				 ffs->dev_name, (val), ret);		\
 			return ret;					\
 		}							\
 	} while (0)
@@ -2103,13 +2117,13 @@ static int __must_check ffs_do_single_desc(char *data, unsigned len,
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
 
@@ -2122,7 +2136,7 @@ static int __must_check ffs_do_single_desc(char *data, unsigned len,
 
 	case USB_DT_ENDPOINT: {
 		struct usb_endpoint_descriptor *ds = (void *)_ds;
-		pr_vdebug("endpoint descriptor\n");
+		pr_vdebug("%s: endpoint descriptor\n", ffs->dev_name);
 		if (length != USB_DT_ENDPOINT_SIZE &&
 		    length != USB_DT_ENDPOINT_AUDIO_SIZE)
 			goto inv_length;
@@ -2132,18 +2146,18 @@ static int __must_check ffs_do_single_desc(char *data, unsigned len,
 
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
 
@@ -2154,7 +2168,7 @@ static int __must_check ffs_do_single_desc(char *data, unsigned len,
 
 	case USB_DT_INTERFACE_ASSOCIATION: {
 		struct usb_interface_assoc_descriptor *ds = (void *)_ds;
-		pr_vdebug("interface association descriptor\n");
+		pr_vdebug("%s: interface association descriptor\n", ffs->dev_name);
 		if (length != sizeof *ds)
 			goto inv_length;
 		if (ds->iFunction)
@@ -2163,7 +2177,7 @@ static int __must_check ffs_do_single_desc(char *data, unsigned len,
 		break;
 
 	case USB_DT_SS_ENDPOINT_COMP:
-		pr_vdebug("EP SS companion descriptor\n");
+		pr_vdebug("%s: EP SS companion descriptor\n", ffs->dev_name);
 		if (length != sizeof(struct usb_ss_ep_comp_descriptor))
 			goto inv_length;
 		break;
@@ -2174,17 +2188,18 @@ static int __must_check ffs_do_single_desc(char *data, unsigned len,
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
 
@@ -2197,14 +2212,14 @@ static int __must_check ffs_do_single_desc(char *data, unsigned len,
 	return length;
 }
 
-static int __must_check ffs_do_descs(unsigned count, char *data, unsigned len,
-				     ffs_entity_callback entity, void *priv)
+static int __must_check ffs_do_descs(struct ffs_data *ffs, unsigned int count, char *data,
+				unsigned int len, ffs_entity_callback entity, void *priv)
 {
-	const unsigned _len = len;
+	const unsigned int _len = len;
 	unsigned long num = 0;
 	int current_class = -1;
 
-	ENTER();
+	ENTER_FFS();
 
 	for (;;) {
 		int ret;
@@ -2213,20 +2228,20 @@ static int __must_check ffs_do_descs(unsigned count, char *data, unsigned len,
 			data = NULL;
 
 		/* Record "descriptor" entity */
-		ret = entity(FFS_DESCRIPTOR, (u8 *)num, (void *)data, priv);
+		ret = entity(ffs, FFS_DESCRIPTOR, (u8 *)num, (void *)data, priv);
 		if (ret < 0) {
-			pr_debug("entity DESCRIPTOR(%02lx); ret = %d\n",
-				 num, ret);
+			pr_debug("%s: entity DESCRIPTOR(%02lx); ret = %d\n",
+				 ffs->dev_name, num, ret);
 			return ret;
 		}
 
 		if (!data)
 			return _len - len;
 
-		ret = ffs_do_single_desc(data, len, entity, priv,
+		ret = ffs_do_single_desc(ffs, data, len, entity, priv,
 			&current_class);
 		if (ret < 0) {
-			pr_debug("%s returns %d\n", __func__, ret);
+			pr_debug("%s() %s: returns %d\n", __func__, ffs->dev_name, ret);
 			return ret;
 		}
 
@@ -2236,14 +2251,14 @@ static int __must_check ffs_do_descs(unsigned count, char *data, unsigned len,
 	}
 }
 
-static int __ffs_data_do_entity(enum ffs_entity_type type,
+static int __ffs_data_do_entity(struct ffs_data *ffs, enum ffs_entity_type type,
 				u8 *valuep, struct usb_descriptor_header *desc,
 				void *priv)
 {
 	struct ffs_desc_helper *helper = priv;
 	struct usb_endpoint_descriptor *d;
 
-	ENTER();
+	ENTER_FFS();
 
 	switch (type) {
 	case FFS_DESCRIPTOR:
@@ -2264,8 +2279,8 @@ static int __ffs_data_do_entity(enum ffs_entity_type type,
 		 * Strings are indexed from 1 (0 is reserved
 		 * for languages list)
 		 */
-		if (*valuep > helper->ffs->strings_count)
-			helper->ffs->strings_count = *valuep;
+		if (*valuep > ffs->strings_count)
+			ffs->strings_count = *valuep;
 		break;
 
 	case FFS_ENDPOINT:
@@ -2274,10 +2289,10 @@ static int __ffs_data_do_entity(enum ffs_entity_type type,
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
@@ -2286,18 +2301,18 @@ static int __ffs_data_do_entity(enum ffs_entity_type type,
 	return 0;
 }
 
-static int __ffs_do_os_desc_header(enum ffs_os_desc_type *next_type,
+static int __ffs_do_os_desc_header(struct ffs_data *ffs, enum ffs_os_desc_type *next_type,
 				   struct usb_os_desc_header *desc)
 {
 	u16 bcd_version = le16_to_cpu(desc->bcdVersion);
 	u16 w_index = le16_to_cpu(desc->wIndex);
 
 	if (bcd_version == 0x1) {
-		pr_warn("bcdVersion must be 0x0100, stored in Little Endian order. "
-			"Userspace driver should be fixed, accepting 0x0001 for compatibility.\n");
+		pr_warn("%s: bcdVersion must be 0x0100, stored in Little Endian order. Userspace driver should be fixed, accepting 0x0001 for compatibility.\n",
+			ffs->dev_name);
 	} else if (bcd_version != 0x100) {
-		pr_vdebug("unsupported os descriptors version: 0x%x\n",
-			  bcd_version);
+		pr_vdebug("%s: unsupported os descriptors version: 0x%x\n",
+			  ffs->dev_name, bcd_version);
 		return -EINVAL;
 	}
 	switch (w_index) {
@@ -2308,7 +2323,7 @@ static int __ffs_do_os_desc_header(enum ffs_os_desc_type *next_type,
 		*next_type = FFS_OS_DESC_EXT_PROP;
 		break;
 	default:
-		pr_vdebug("unsupported os descriptor type: %d", w_index);
+		pr_vdebug("%s: unsupported os descriptor type: %d", ffs->dev_name, w_index);
 		return -EINVAL;
 	}
 
@@ -2319,7 +2334,7 @@ static int __ffs_do_os_desc_header(enum ffs_os_desc_type *next_type,
  * Process all extended compatibility/extended property descriptors
  * of a feature descriptor
  */
-static int __must_check ffs_do_single_os_desc(char *data, unsigned len,
+static int __must_check ffs_do_single_os_desc(struct ffs_data *ffs, char *data, unsigned int len,
 					      enum ffs_os_desc_type type,
 					      u16 feature_count,
 					      ffs_os_desc_callback entity,
@@ -2327,15 +2342,15 @@ static int __must_check ffs_do_single_os_desc(char *data, unsigned len,
 					      struct usb_os_desc_header *h)
 {
 	int ret;
-	const unsigned _len = len;
+	const unsigned int _len = len;
 
-	ENTER();
+	ENTER_FFS();
 
 	/* loop over all ext compat/ext prop descriptors */
 	while (feature_count--) {
-		ret = entity(type, h, data, len, priv);
+		ret = entity(ffs, type, h, data, len, priv);
 		if (ret < 0) {
-			pr_debug("bad OS descriptor, type: %d\n", type);
+			pr_debug("%s: bad OS descriptor, type: %d\n", ffs->dev_name, type);
 			return ret;
 		}
 		data += ret;
@@ -2345,14 +2360,14 @@ static int __must_check ffs_do_single_os_desc(char *data, unsigned len,
 }
 
 /* Process a number of complete Feature Descriptors (Ext Compat or Ext Prop) */
-static int __must_check ffs_do_os_descs(unsigned count,
-					char *data, unsigned len,
+static int __must_check ffs_do_os_descs(struct ffs_data *ffs, unsigned int count,
+					char *data, unsigned int len,
 					ffs_os_desc_callback entity, void *priv)
 {
-	const unsigned _len = len;
+	const unsigned int _len = len;
 	unsigned long num = 0;
 
-	ENTER();
+	ENTER_FFS();
 
 	for (num = 0; num < count; ++num) {
 		int ret;
@@ -2373,7 +2388,7 @@ static int __must_check ffs_do_os_descs(unsigned count,
 		if (le32_to_cpu(desc->dwLength) > len)
 			return -EINVAL;
 
-		ret = __ffs_do_os_desc_header(&type, desc);
+		ret = __ffs_do_os_desc_header(ffs, &type, desc);
 		if (ret < 0) {
 			pr_debug("entity OS_DESCRIPTOR(%02lx); ret = %d\n",
 				 num, ret);
@@ -2393,10 +2408,10 @@ static int __must_check ffs_do_os_descs(unsigned count,
 		 * Process all function/property descriptors
 		 * of this Feature Descriptor
 		 */
-		ret = ffs_do_single_os_desc(data, len, type,
+		ret = ffs_do_single_os_desc(ffs, data, len, type,
 					    feature_count, entity, priv, desc);
 		if (ret < 0) {
-			pr_debug("%s returns %d\n", __func__, ret);
+			pr_debug("%s: %s() returns %d\n", ffs->dev_name, __func__, ret);
 			return ret;
 		}
 
@@ -2409,14 +2424,13 @@ static int __must_check ffs_do_os_descs(unsigned count,
 /*
  * Validate contents of the buffer from userspace related to OS descriptors.
  */
-static int __ffs_data_do_os_desc(enum ffs_os_desc_type type,
+static int __ffs_data_do_os_desc(struct ffs_data *ffs, enum ffs_os_desc_type type,
 				 struct usb_os_desc_header *h, void *data,
-				 unsigned len, void *priv)
+				 unsigned int len, void *priv)
 {
-	struct ffs_data *ffs = priv;
 	u8 length;
 
-	ENTER();
+	ENTER_FFS();
 
 	switch (type) {
 	case FFS_OS_DESC_EXT_COMPAT: {
@@ -2433,7 +2447,7 @@ static int __ffs_data_do_os_desc(enum ffs_os_desc_type type,
 			 * values.  We fix it here to avoid returning EINVAL
 			 * in response to values we used to accept.
 			 */
-			pr_debug("usb_ext_compat_desc::Reserved1 forced to 1\n");
+			pr_debug("%s: usb_ext_compat_desc::Reserved1 forced to 1\n", ffs->dev_name);
 			d->Reserved1 = 1;
 		}
 		for (i = 0; i < ARRAY_SIZE(d->Reserved2); ++i)
@@ -2456,20 +2470,20 @@ static int __ffs_data_do_os_desc(enum ffs_os_desc_type type,
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
@@ -2479,7 +2493,7 @@ static int __ffs_data_do_os_desc(enum ffs_os_desc_type type,
 	}
 		break;
 	default:
-		pr_vdebug("unknown descriptor: %d\n", type);
+		pr_vdebug("%s: unknown descriptor: %d\n", ffs->dev_name, type);
 		return -EINVAL;
 	}
 	return length;
@@ -2489,11 +2503,11 @@ static int __ffs_data_got_descs(struct ffs_data *ffs,
 				char *const _data, size_t len)
 {
 	char *data = _data, *raw_descs;
-	unsigned os_descs_count = 0, counts[3], flags;
+	unsigned int os_descs_count = 0, counts[3], flags;
 	int ret = -EINVAL, i;
 	struct ffs_desc_helper helper;
 
-	ENTER();
+	ENTER_FFS();
 
 	if (get_unaligned_le32(data + 4) != len)
 		goto error;
@@ -2562,13 +2576,12 @@ static int __ffs_data_got_descs(struct ffs_data *ffs,
 
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
@@ -2589,8 +2602,8 @@ static int __ffs_data_got_descs(struct ffs_data *ffs,
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
@@ -2625,7 +2638,7 @@ static int __ffs_data_got_strings(struct ffs_data *ffs,
 	const char *data = _data;
 	struct usb_string *s;
 
-	ENTER();
+	ENTER_FFS();
 
 	if (len < 16 ||
 	    get_unaligned_le32(data) != FUNCTIONFS_STRINGS_MAGIC ||
@@ -2654,7 +2667,7 @@ static int __ffs_data_got_strings(struct ffs_data *ffs,
 
 	/* Allocate everything in one chunk so there's less maintenance. */
 	{
-		unsigned i = 0;
+		unsigned int i = 0;
 		vla_group(d);
 		vla_item(d, struct usb_gadget_strings *, stringtabs,
 			size_add(lang_count, 1));
@@ -2689,7 +2702,7 @@ static int __ffs_data_got_strings(struct ffs_data *ffs,
 	len -= 16;
 
 	do { /* lang_count > 0 so we can use do-while */
-		unsigned needed = needed_count;
+		unsigned int needed = needed_count;
 		u32 str_per_lang = str_count;
 
 		if (len < 3)
@@ -2799,22 +2812,22 @@ static void __ffs_event_add(struct ffs_data *ffs,
 		break;
 
 	default:
-		WARN(1, "%d: unknown event, this should not happen\n", type);
+		WARN(1, "%s: %d: unknown event, this should not happen\n", ffs->dev_name, type);
 		return;
 	}
 
 	{
 		u8 *ev  = ffs->ev.types, *out = ev;
-		unsigned n = ffs->ev.count;
+		unsigned int n = ffs->ev.count;
 		for (; n; --n, ++ev)
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
@@ -2842,14 +2855,14 @@ static int ffs_ep_addr2idx(struct ffs_data *ffs, u8 endpoint_address)
 	return -ENOENT;
 }
 
-static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
+static int __ffs_func_bind_do_descs(struct ffs_data *ffs, enum ffs_entity_type type, u8 *valuep,
 				    struct usb_descriptor_header *desc,
 				    void *priv)
 {
 	struct usb_endpoint_descriptor *ds = (void *)desc;
 	struct ffs_function *func = priv;
 	struct ffs_ep *ffs_ep;
-	unsigned ep_desc_id;
+	unsigned int ep_desc_id;
 	int idx;
 	static const char *speed_names[] = { "full", "high", "super" };
 
@@ -2883,8 +2896,8 @@ static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
 	ffs_ep = func->eps + idx;
 
 	if (ffs_ep->descs[ep_desc_id]) {
-		pr_err("two %sspeed descriptors for EP %d\n",
-			  speed_names[ep_desc_id],
+		pr_err("%s: two %sspeed descriptors for EP %d\n",
+			  ffs->dev_name, speed_names[ep_desc_id],
 			  ds->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK);
 		return -EINVAL;
 	}
@@ -2911,7 +2924,7 @@ static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
 		 * endpoint descriptors as if they were full speed.
 		 */
 		wMaxPacketSize = ds->wMaxPacketSize;
-		pr_vdebug("autoconfig\n");
+		pr_vdebug("%s: autoconfig\n", ffs->dev_name);
 		ep = usb_ep_autoconfig(func->gadget, ds);
 		if (!ep)
 			return -ENOTSUPP;
@@ -2942,12 +2955,12 @@ static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
 	return 0;
 }
 
-static int __ffs_func_bind_do_nums(enum ffs_entity_type type, u8 *valuep,
+static int __ffs_func_bind_do_nums(struct ffs_data *ffs, enum ffs_entity_type type, u8 *valuep,
 				   struct usb_descriptor_header *desc,
 				   void *priv)
 {
 	struct ffs_function *func = priv;
-	unsigned idx;
+	unsigned int idx;
 	u8 newValue;
 
 	switch (type) {
@@ -2992,14 +3005,14 @@ static int __ffs_func_bind_do_nums(enum ffs_entity_type type, u8 *valuep,
 		break;
 	}
 
-	pr_vdebug("%02x -> %02x\n", *valuep, newValue);
+	pr_vdebug("%s: %02x -> %02x\n", ffs->dev_name, *valuep, newValue);
 	*valuep = newValue;
 	return 0;
 }
 
-static int __ffs_func_bind_do_os_desc(enum ffs_os_desc_type type,
+static int __ffs_func_bind_do_os_desc(struct ffs_data *ffs, enum ffs_os_desc_type type,
 				      struct usb_os_desc_header *h, void *data,
-				      unsigned len, void *priv)
+				      unsigned int len, void *priv)
 {
 	struct ffs_function *func = priv;
 	u8 length = 0;
@@ -3070,7 +3083,7 @@ static int __ffs_func_bind_do_os_desc(enum ffs_os_desc_type type,
 	}
 		break;
 	default:
-		pr_vdebug("unknown descriptor: %d\n", type);
+		pr_vdebug("%s: unknown descriptor: %d\n", ffs->dev_name, type);
 	}
 
 	return length;
@@ -3082,10 +3095,11 @@ static inline struct f_fs_opts *ffs_do_functionfs_bind(struct usb_function *f,
 	struct ffs_function *func = ffs_func_from_usb(f);
 	struct f_fs_opts *ffs_opts =
 		container_of(f->fi, struct f_fs_opts, func_inst);
+	struct ffs_dev * __maybe_unused ffs_dev = ffs_opts->dev;
 	struct ffs_data *ffs_data;
 	int ret;
 
-	ENTER();
+	ENTER_DEV();
 
 	/*
 	 * Legacy gadget triggers binding in functionfs_ready_callback,
@@ -3163,7 +3177,7 @@ static int _ffs_func_bind(struct usb_configuration *c,
 	vla_item_with_sz(d, char, raw_descs, ffs->raw_descs_length);
 	char *vlabuf;
 
-	ENTER();
+	ENTER_FFS();
 
 	/* Has descriptors only for speeds gadget does not support */
 	if (!(full | high | super))
@@ -3202,7 +3216,7 @@ static int _ffs_func_bind(struct usb_configuration *c,
 	 */
 	if (full) {
 		func->function.fs_descriptors = vla_ptr(vlabuf, d, fs_descs);
-		fs_len = ffs_do_descs(ffs->fs_descs_count,
+		fs_len = ffs_do_descs(ffs, ffs->fs_descs_count,
 				      vla_ptr(vlabuf, d, raw_descs),
 				      d_raw_descs__sz,
 				      __ffs_func_bind_do_descs, func);
@@ -3216,7 +3230,7 @@ static int _ffs_func_bind(struct usb_configuration *c,
 
 	if (high) {
 		func->function.hs_descriptors = vla_ptr(vlabuf, d, hs_descs);
-		hs_len = ffs_do_descs(ffs->hs_descs_count,
+		hs_len = ffs_do_descs(ffs, ffs->hs_descs_count,
 				      vla_ptr(vlabuf, d, raw_descs) + fs_len,
 				      d_raw_descs__sz - fs_len,
 				      __ffs_func_bind_do_descs, func);
@@ -3231,7 +3245,7 @@ static int _ffs_func_bind(struct usb_configuration *c,
 	if (super) {
 		func->function.ss_descriptors = func->function.ssp_descriptors =
 			vla_ptr(vlabuf, d, ss_descs);
-		ss_len = ffs_do_descs(ffs->ss_descs_count,
+		ss_len = ffs_do_descs(ffs, ffs->ss_descs_count,
 				vla_ptr(vlabuf, d, raw_descs) + fs_len + hs_len,
 				d_raw_descs__sz - fs_len - hs_len,
 				__ffs_func_bind_do_descs, func);
@@ -3248,7 +3262,7 @@ static int _ffs_func_bind(struct usb_configuration *c,
 	 * endpoint numbers rewriting.  We can do that in one go
 	 * now.
 	 */
-	ret = ffs_do_descs(ffs->fs_descs_count +
+	ret = ffs_do_descs(ffs, ffs->fs_descs_count +
 			   (high ? ffs->hs_descs_count : 0) +
 			   (super ? ffs->ss_descs_count : 0),
 			   vla_ptr(vlabuf, d, raw_descs), d_raw_descs__sz,
@@ -3268,7 +3282,7 @@ static int _ffs_func_bind(struct usb_configuration *c,
 				vla_ptr(vlabuf, d, ext_compat) + i * 16;
 			INIT_LIST_HEAD(&desc->ext_prop);
 		}
-		ret = ffs_do_os_descs(ffs->ms_os_descs_count,
+		ret = ffs_do_os_descs(ffs, ffs->ms_os_descs_count,
 				      vla_ptr(vlabuf, d, raw_descs) +
 				      fs_len + hs_len + ss_len,
 				      d_raw_descs__sz - fs_len - hs_len -
@@ -3317,13 +3331,13 @@ static void ffs_reset_work(struct work_struct *work)
 }
 
 static int ffs_func_set_alt(struct usb_function *f,
-			    unsigned interface, unsigned alt)
+			    unsigned int interface, unsigned int alt)
 {
 	struct ffs_function *func = ffs_func_from_usb(f);
 	struct ffs_data *ffs = func->ffs;
 	int ret = 0, intf;
 
-	if (alt != (unsigned)-1) {
+	if (alt != (unsigned int)-1) {
 		intf = ffs_func_revmap_intf(func, interface);
 		if (intf < 0)
 			return intf;
@@ -3342,7 +3356,7 @@ static int ffs_func_set_alt(struct usb_function *f,
 	if (ffs->state != FFS_ACTIVE)
 		return -ENODEV;
 
-	if (alt == (unsigned)-1) {
+	if (alt == (unsigned int)-1) {
 		ffs->func = NULL;
 		ffs_event_add(ffs, FUNCTIONFS_DISABLE);
 		return 0;
@@ -3357,7 +3371,7 @@ static int ffs_func_set_alt(struct usb_function *f,
 
 static void ffs_func_disable(struct usb_function *f)
 {
-	ffs_func_set_alt(f, 0, (unsigned)-1);
+	ffs_func_set_alt(f, 0, (unsigned int)-1);
 }
 
 static int ffs_func_setup(struct usb_function *f,
@@ -3368,13 +3382,13 @@ static int ffs_func_setup(struct usb_function *f,
 	unsigned long flags;
 	int ret;
 
-	ENTER();
+	ENTER_FFS();
 
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
@@ -3444,14 +3458,18 @@ static bool ffs_func_req_match(struct usb_function *f,
 
 static void ffs_func_suspend(struct usb_function *f)
 {
-	ENTER();
-	ffs_event_add(ffs_func_from_usb(f)->ffs, FUNCTIONFS_SUSPEND);
+	struct ffs_data *ffs = ffs_func_from_usb(f)->ffs;
+
+	ENTER_FFS();
+	ffs_event_add(ffs, FUNCTIONFS_SUSPEND);
 }
 
 static void ffs_func_resume(struct usb_function *f)
 {
-	ENTER();
-	ffs_event_add(ffs_func_from_usb(f)->ffs, FUNCTIONFS_RESUME);
+	struct ffs_data *ffs = ffs_func_from_usb(f)->ffs;
+
+	ENTER_FFS();
+	ffs_event_add(ffs, FUNCTIONFS_RESUME);
 }
 
 
@@ -3466,7 +3484,7 @@ static int ffs_func_revmap_ep(struct ffs_function *func, u8 num)
 static int ffs_func_revmap_intf(struct ffs_function *func, u8 intf)
 {
 	short *nums = func->interfaces_nums;
-	unsigned count = func->ffs->interfaces_count;
+	unsigned int count = func->ffs->interfaces_count;
 
 	for (; count; --count, ++nums) {
 		if (*nums >= 0 && *nums == intf)
@@ -3611,10 +3629,10 @@ static void ffs_func_unbind(struct usb_configuration *c,
 	struct f_fs_opts *opts =
 		container_of(f->fi, struct f_fs_opts, func_inst);
 	struct ffs_ep *ep = func->eps;
-	unsigned count = ffs->eps_count;
+	unsigned int count = ffs->eps_count;
 	unsigned long flags;
 
-	ENTER();
+	ENTER_FFS();
 	if (ffs->func == func) {
 		ffs_func_eps_disable(func);
 		ffs->func = NULL;
@@ -3652,9 +3670,11 @@ static void ffs_func_unbind(struct usb_configuration *c,
 
 static struct usb_function *ffs_alloc(struct usb_function_instance *fi)
 {
+	struct f_fs_opts *opts = to_f_fs_opts(fi);
+	struct ffs_dev *__maybe_unused ffs_dev = opts->dev;
 	struct ffs_function *func;
 
-	ENTER();
+	ENTER_DEV();
 
 	func = kzalloc(sizeof(*func), GFP_KERNEL);
 	if (!func)
@@ -3779,7 +3799,7 @@ static int ffs_acquire_dev(const char *dev_name, struct ffs_data *ffs_data)
 
 static void ffs_release_dev(struct ffs_dev *ffs_dev)
 {
-	ENTER();
+	ENTER_DEV();
 	ffs_dev_lock();
 
 	if (ffs_dev && ffs_dev->mounted) {
@@ -3801,7 +3821,7 @@ static int ffs_ready(struct ffs_data *ffs)
 	struct ffs_dev *ffs_obj;
 	int ret = 0;
 
-	ENTER();
+	ENTER_FFS();
 	ffs_dev_lock();
 
 	ffs_obj = ffs->private_data;
@@ -3834,7 +3854,7 @@ static void ffs_closed(struct ffs_data *ffs)
 	struct f_fs_opts *opts;
 	struct config_item *ci;
 
-	ENTER();
+	ENTER_FFS();
 	ffs_dev_lock();
 
 	ffs_obj = ffs->private_data;
@@ -3868,14 +3888,14 @@ static void ffs_closed(struct ffs_data *ffs)
 
 /* Misc helper functions ****************************************************/
 
-static int ffs_mutex_lock(struct mutex *mutex, unsigned nonblock)
+static int ffs_mutex_lock(struct mutex *mutex, unsigned int nonblock)
 {
 	return nonblock
 		? mutex_trylock(mutex) ? 0 : -EAGAIN
 		: mutex_lock_interruptible(mutex);
 }
 
-static char *ffs_prepare_buffer(const char __user *buf, size_t len)
+static char *ffs_prepare_buffer(struct ffs_data *ffs, const char __user *buf, size_t len)
 {
 	char *data;
 
@@ -3886,7 +3906,7 @@ static char *ffs_prepare_buffer(const char __user *buf, size_t len)
 	if (IS_ERR(data))
 		return data;
 
-	pr_vdebug("Buffer from user space:\n");
+	pr_vdebug("%s: Buffer from user space:\n", ffs->dev_name);
 	ffs_dump_mem("", data, len);
 
 	return data;
diff --git a/drivers/usb/gadget/function/u_fs.h b/drivers/usb/gadget/function/u_fs.h
index f102ec2..44b18ef 100644
--- a/drivers/usb/gadget/function/u_fs.h
+++ b/drivers/usb/gadget/function/u_fs.h
@@ -33,6 +33,8 @@
 #endif /* VERBOSE_DEBUG */
 
 #define ENTER()    pr_vdebug("%s()\n", __func__)
+#define ENTER_FFS()    pr_vdebug("%s: %s()\n", ffs->dev_name, __func__)
+#define ENTER_DEV()    pr_vdebug("%s: %s()\n", ffs_dev->name, __func__)
 
 struct f_fs_opts;
 
-- 
2.7.4

