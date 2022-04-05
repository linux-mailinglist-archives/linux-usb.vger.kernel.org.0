Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 575EC4F2161
	for <lists+linux-usb@lfdr.de>; Tue,  5 Apr 2022 06:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbiDECu2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Apr 2022 22:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbiDECuP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Apr 2022 22:50:15 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 765B3B3DF8
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 19:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649125641; x=1680661641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hAhX+GN8fZqcF/CVXuSCa9Y1lttE3dpe1HuD51C76Nw=;
  b=QII3TdSN1NU9HGCXXcvGbkxiuV7JWtGDSHFkdRPwuwrOxUVPdUdL4Ue6
   OajIjSpjmgY6VtwkQlEGJfaF6fEWWE6JEnYbonhBP9DIuHLkyVy9xqb+6
   rncj5t8QyHKM+fSv1Xh15+50si2IcNIOCbnOKSVzSeriwWGt8lUykLFNc
   I=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 04 Apr 2022 19:27:21 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 19:27:21 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 4 Apr 2022 19:27:20 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 4 Apr 2022 19:27:18 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v5 5/5] usb: gadget: add trace event of configfs write attributes operation
Date:   Tue, 5 Apr 2022 10:27:05 +0800
Message-ID: <1649125625-7003-6-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1649125625-7003-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1649125625-7003-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add API trace_usb_configfs_write_attr() to trace user change gadget or
function attributes.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: no change
v3: add API in trace.c
v4: fix memory leak
v5: no change

 drivers/usb/gadget/configfs.c                  | 24 ++++++++++++++++++++++++
 drivers/usb/gadget/function/f_acm.c            |  1 +
 drivers/usb/gadget/function/f_hid.c            |  4 ++++
 drivers/usb/gadget/function/f_loopback.c       |  4 ++++
 drivers/usb/gadget/function/f_mass_storage.c   | 16 ++++++++++++++++
 drivers/usb/gadget/function/f_midi.c           |  6 ++++++
 drivers/usb/gadget/function/f_printer.c        |  4 ++++
 drivers/usb/gadget/function/f_serial.c         |  1 +
 drivers/usb/gadget/function/f_sourcesink.c     | 16 ++++++++++++++++
 drivers/usb/gadget/function/f_uac1.c           |  6 ++++++
 drivers/usb/gadget/function/f_uac1_legacy.c    |  4 ++++
 drivers/usb/gadget/function/f_uac2.c           |  8 ++++++++
 drivers/usb/gadget/function/u_ether_configfs.h | 10 ++++++++++
 drivers/usb/gadget/function/uvc_configfs.c     | 18 ++++++++++++++++++
 drivers/usb/gadget/trace.c                     | 26 ++++++++++++++++++++++++++
 include/linux/usb/composite.h                  |  3 +++
 include/linux/usb/gadget_configfs.h            |  2 ++
 17 files changed, 153 insertions(+)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index a304d29..a9ea331 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -146,6 +146,8 @@ static ssize_t gadget_dev_desc_##_name##_store(struct config_item *item, \
 {							\
 	u8 val;						\
 	int ret;					\
+							\
+	trace_usb_configfs_write_attr(item, #_name, page);	\
 	ret = kstrtou8(page, 0, &val);			\
 	if (ret)					\
 		return ret;				\
@@ -159,6 +161,8 @@ static ssize_t gadget_dev_desc_##_name##_store(struct config_item *item, \
 {							\
 	u16 val;					\
 	int ret;					\
+							\
+	trace_usb_configfs_write_attr(item, #_name, page);	\
 	ret = kstrtou16(page, 0, &val);			\
 	if (ret)					\
 		return ret;				\
@@ -198,6 +202,8 @@ static ssize_t gadget_dev_desc_bcdDevice_store(struct config_item *item,
 	u16 bcdDevice;
 	int ret;
 
+	trace_usb_configfs_write_attr(item, "bcdDevice", page);
+
 	ret = kstrtou16(page, 0, &bcdDevice);
 	if (ret)
 		return ret;
@@ -215,6 +221,8 @@ static ssize_t gadget_dev_desc_bcdUSB_store(struct config_item *item,
 	u16 bcdUSB;
 	int ret;
 
+	trace_usb_configfs_write_attr(item, "bcdUSB", page);
+
 	ret = kstrtou16(page, 0, &bcdUSB);
 	if (ret)
 		return ret;
@@ -262,6 +270,8 @@ static ssize_t gadget_dev_desc_UDC_store(struct config_item *item,
 	char *name;
 	int ret;
 
+	trace_usb_configfs_write_attr(item, "UDC", page);
+
 	if (strlen(page) < len)
 		return -EOVERFLOW;
 
@@ -311,6 +321,8 @@ static ssize_t gadget_dev_desc_max_speed_store(struct config_item *item,
 {
 	struct gadget_info *gi = to_gadget_info(item);
 
+	trace_usb_configfs_write_attr(item, "max_speed", page);
+
 	mutex_lock(&gi->lock);
 
 	/* Prevent changing of max_speed after the driver is binded */
@@ -519,6 +531,9 @@ static ssize_t gadget_config_desc_MaxPower_store(struct config_item *item,
 	struct config_usb_cfg *cfg = to_config_usb_cfg(item);
 	u16 val;
 	int ret;
+
+	trace_usb_configfs_write_attr(item, "MaxPower", page);
+
 	ret = kstrtou16(page, 0, &val);
 	if (ret)
 		return ret;
@@ -542,6 +557,9 @@ static ssize_t gadget_config_desc_bmAttributes_store(struct config_item *item,
 	struct config_usb_cfg *cfg = to_config_usb_cfg(item);
 	u8 val;
 	int ret;
+
+	trace_usb_configfs_write_attr(item, "bmAttributes", page);
+
 	ret = kstrtou8(page, 0, &val);
 	if (ret)
 		return ret;
@@ -809,6 +827,8 @@ static ssize_t os_desc_use_store(struct config_item *item, const char *page,
 	int ret;
 	bool use;
 
+	trace_usb_configfs_write_attr(item, "use", page);
+
 	mutex_lock(&gi->lock);
 	ret = strtobool(page, &use);
 	if (!ret) {
@@ -833,6 +853,8 @@ static ssize_t os_desc_b_vendor_code_store(struct config_item *item,
 	int ret;
 	u8 b_vendor_code;
 
+	trace_usb_configfs_write_attr(item, "b_vendor_code", page);
+
 	mutex_lock(&gi->lock);
 	ret = kstrtou8(page, 0, &b_vendor_code);
 	if (!ret) {
@@ -862,6 +884,8 @@ static ssize_t os_desc_qw_sign_store(struct config_item *item, const char *page,
 	struct gadget_info *gi = os_desc_item_to_gadget_info(item);
 	int res, l;
 
+	trace_usb_configfs_write_attr(item, "qw_sign", page);
+
 	l = min((int)len, OS_STRING_QW_SIGN_LEN >> 1);
 	if (page[l - 1] == '\n')
 		--l;
diff --git a/drivers/usb/gadget/function/f_acm.c b/drivers/usb/gadget/function/f_acm.c
index 349945e..d48f666 100644
--- a/drivers/usb/gadget/function/f_acm.c
+++ b/drivers/usb/gadget/function/f_acm.c
@@ -794,6 +794,7 @@ static struct configfs_item_operations acm_item_ops = {
 static ssize_t f_acm_console_store(struct config_item *item,
 		const char *page, size_t count)
 {
+	trace_usb_configfs_write_attr(item, "console", page);
 	return gserial_set_console(to_f_serial_opts(item)->port_num,
 				   page, count);
 }
diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index ca0a7d9..c54af8d 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -1074,6 +1074,8 @@ static ssize_t f_hid_opts_##name##_store(struct config_item *item,	\
 	int ret;							\
 	u##prec num;							\
 									\
+	trace_usb_configfs_write_attr(item, #name, page);		\
+									\
 	mutex_lock(&opts->lock);					\
 	if (opts->refcnt) {						\
 		ret = -EBUSY;						\
@@ -1123,6 +1125,8 @@ static ssize_t f_hid_opts_report_desc_store(struct config_item *item,
 	int ret = -EBUSY;
 	char *d;
 
+	trace_usb_configfs_write_attr(item, "report_desc", page);
+
 	mutex_lock(&opts->lock);
 
 	if (opts->refcnt)
diff --git a/drivers/usb/gadget/function/f_loopback.c b/drivers/usb/gadget/function/f_loopback.c
index ae41f55..42f6061 100644
--- a/drivers/usb/gadget/function/f_loopback.c
+++ b/drivers/usb/gadget/function/f_loopback.c
@@ -489,6 +489,8 @@ static ssize_t f_lb_opts_qlen_store(struct config_item *item,
 	int ret;
 	u32 num;
 
+	trace_usb_configfs_write_attr(item, "qlen", page);
+
 	mutex_lock(&opts->lock);
 	if (opts->refcnt) {
 		ret = -EBUSY;
@@ -527,6 +529,8 @@ static ssize_t f_lb_opts_bulk_buflen_store(struct config_item *item,
 	int ret;
 	u32 num;
 
+	trace_usb_configfs_write_attr(item, "bulk_buflen", page);
+
 	mutex_lock(&opts->lock);
 	if (opts->refcnt) {
 		ret = -EBUSY;
diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index a96eca9..295966b 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -3141,6 +3141,8 @@ static ssize_t fsg_lun_opts_file_store(struct config_item *item,
 	struct fsg_lun_opts *opts = to_fsg_lun_opts(item);
 	struct fsg_opts *fsg_opts = to_fsg_opts(opts->group.cg_item.ci_parent);
 
+	trace_usb_configfs_write_attr(item, "file", page);
+
 	return fsg_store_file(opts->lun, &fsg_opts->common->filesem, page, len);
 }
 
@@ -3157,6 +3159,8 @@ static ssize_t fsg_lun_opts_ro_store(struct config_item *item,
 	struct fsg_lun_opts *opts = to_fsg_lun_opts(item);
 	struct fsg_opts *fsg_opts = to_fsg_opts(opts->group.cg_item.ci_parent);
 
+	trace_usb_configfs_write_attr(item, "ro", page);
+
 	return fsg_store_ro(opts->lun, &fsg_opts->common->filesem, page, len);
 }
 
@@ -3171,6 +3175,8 @@ static ssize_t fsg_lun_opts_removable_show(struct config_item *item,
 static ssize_t fsg_lun_opts_removable_store(struct config_item *item,
 				       const char *page, size_t len)
 {
+	trace_usb_configfs_write_attr(item, "removable", page);
+
 	return fsg_store_removable(to_fsg_lun_opts(item)->lun, page, len);
 }
 
@@ -3187,6 +3193,8 @@ static ssize_t fsg_lun_opts_cdrom_store(struct config_item *item,
 	struct fsg_lun_opts *opts = to_fsg_lun_opts(item);
 	struct fsg_opts *fsg_opts = to_fsg_opts(opts->group.cg_item.ci_parent);
 
+	trace_usb_configfs_write_attr(item, "cdrom", page);
+
 	return fsg_store_cdrom(opts->lun, &fsg_opts->common->filesem, page,
 			       len);
 }
@@ -3201,6 +3209,8 @@ static ssize_t fsg_lun_opts_nofua_show(struct config_item *item, char *page)
 static ssize_t fsg_lun_opts_nofua_store(struct config_item *item,
 				       const char *page, size_t len)
 {
+	trace_usb_configfs_write_attr(item, "nofua", page);
+
 	return fsg_store_nofua(to_fsg_lun_opts(item)->lun, page, len);
 }
 
@@ -3215,6 +3225,8 @@ static ssize_t fsg_lun_opts_inquiry_string_show(struct config_item *item,
 static ssize_t fsg_lun_opts_inquiry_string_store(struct config_item *item,
 						 const char *page, size_t len)
 {
+	trace_usb_configfs_write_attr(item, "inquiry_string", page);
+
 	return fsg_store_inquiry_string(to_fsg_lun_opts(item)->lun, page, len);
 }
 
@@ -3353,6 +3365,8 @@ static ssize_t fsg_opts_stall_store(struct config_item *item, const char *page,
 	int ret;
 	bool stall;
 
+	trace_usb_configfs_write_attr(item, "stall", page);
+
 	mutex_lock(&opts->lock);
 
 	if (opts->refcnt) {
@@ -3393,6 +3407,8 @@ static ssize_t fsg_opts_num_buffers_store(struct config_item *item,
 	int ret;
 	u8 num;
 
+	trace_usb_configfs_write_attr(item, "num_buffers", page);
+
 	mutex_lock(&opts->lock);
 	if (opts->refcnt) {
 		ret = -EBUSY;
diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index fddf539..ebb2d7b 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -1110,6 +1110,8 @@ static ssize_t f_midi_opts_##name##_store(struct config_item *item,	\
 	int ret;							\
 	u32 num;							\
 									\
+	trace_usb_configfs_write_attr(item, #name, page);		\
+									\
 	mutex_lock(&opts->lock);					\
 	if (opts->refcnt > 1) {						\
 		ret = -EBUSY;						\
@@ -1154,6 +1156,8 @@ static ssize_t f_midi_opts_##name##_store(struct config_item *item,	\
 	int ret;							\
 	s32 num;							\
 									\
+	trace_usb_configfs_write_attr(item, #name, page);		\
+									\
 	mutex_lock(&opts->lock);					\
 	if (opts->refcnt > 1) {						\
 		ret = -EBUSY;						\
@@ -1209,6 +1213,8 @@ static ssize_t f_midi_opts_id_store(struct config_item *item,
 	int ret;
 	char *c;
 
+	trace_usb_configfs_write_attr(item, "id", page);
+
 	mutex_lock(&opts->lock);
 	if (opts->refcnt > 1) {
 		ret = -EBUSY;
diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index abec5c5..c071574 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -1239,6 +1239,8 @@ static ssize_t f_printer_opts_pnp_string_store(struct config_item *item,
 	char *new_pnp;
 	int result;
 
+	trace_usb_configfs_write_attr(item, "pnp_string", page);
+
 	mutex_lock(&opts->lock);
 
 	new_pnp = kstrndup(page, len, GFP_KERNEL);
@@ -1281,6 +1283,8 @@ static ssize_t f_printer_opts_q_len_store(struct config_item *item,
 	int ret;
 	u16 num;
 
+	trace_usb_configfs_write_attr(item, "q_len", page);
+
 	mutex_lock(&opts->lock);
 	if (opts->refcnt) {
 		ret = -EBUSY;
diff --git a/drivers/usb/gadget/function/f_serial.c b/drivers/usb/gadget/function/f_serial.c
index a9480b9..58f69a7 100644
--- a/drivers/usb/gadget/function/f_serial.c
+++ b/drivers/usb/gadget/function/f_serial.c
@@ -271,6 +271,7 @@ static struct configfs_item_operations serial_item_ops = {
 static ssize_t f_serial_console_store(struct config_item *item,
 		const char *page, size_t count)
 {
+	trace_usb_configfs_write_attr(item, "console", page);
 	return gserial_set_console(to_f_serial_opts(item)->port_num,
 				   page, count);
 }
diff --git a/drivers/usb/gadget/function/f_sourcesink.c b/drivers/usb/gadget/function/f_sourcesink.c
index 6803cd6..4e6acd7 100644
--- a/drivers/usb/gadget/function/f_sourcesink.c
+++ b/drivers/usb/gadget/function/f_sourcesink.c
@@ -907,6 +907,8 @@ static ssize_t f_ss_opts_pattern_store(struct config_item *item,
 	int ret;
 	u8 num;
 
+	trace_usb_configfs_write_attr(item, "pattern", page);
+
 	mutex_lock(&opts->lock);
 	if (opts->refcnt) {
 		ret = -EBUSY;
@@ -950,6 +952,8 @@ static ssize_t f_ss_opts_isoc_interval_store(struct config_item *item,
 	int ret;
 	u8 num;
 
+	trace_usb_configfs_write_attr(item, "isoc_interval", page);
+
 	mutex_lock(&opts->lock);
 	if (opts->refcnt) {
 		ret = -EBUSY;
@@ -993,6 +997,8 @@ static ssize_t f_ss_opts_isoc_maxpacket_store(struct config_item *item,
 	int ret;
 	u16 num;
 
+	trace_usb_configfs_write_attr(item, "isoc_maxpacket", page);
+
 	mutex_lock(&opts->lock);
 	if (opts->refcnt) {
 		ret = -EBUSY;
@@ -1036,6 +1042,8 @@ static ssize_t f_ss_opts_isoc_mult_store(struct config_item *item,
 	int ret;
 	u8 num;
 
+	trace_usb_configfs_write_attr(item, "isoc_mult", page);
+
 	mutex_lock(&opts->lock);
 	if (opts->refcnt) {
 		ret = -EBUSY;
@@ -1079,6 +1087,8 @@ static ssize_t f_ss_opts_isoc_maxburst_store(struct config_item *item,
 	int ret;
 	u8 num;
 
+	trace_usb_configfs_write_attr(item, "isoc_maxburst", page);
+
 	mutex_lock(&opts->lock);
 	if (opts->refcnt) {
 		ret = -EBUSY;
@@ -1122,6 +1132,8 @@ static ssize_t f_ss_opts_bulk_buflen_store(struct config_item *item,
 	int ret;
 	u32 num;
 
+	trace_usb_configfs_write_attr(item, "bulk_buflen", page);
+
 	mutex_lock(&opts->lock);
 	if (opts->refcnt) {
 		ret = -EBUSY;
@@ -1160,6 +1172,8 @@ static ssize_t f_ss_opts_bulk_qlen_store(struct config_item *item,
 	int ret;
 	u32 num;
 
+	trace_usb_configfs_write_attr(item, "bulk_qlen", page);
+
 	mutex_lock(&opts->lock);
 	if (opts->refcnt) {
 		ret = -EBUSY;
@@ -1198,6 +1212,8 @@ static ssize_t f_ss_opts_iso_qlen_store(struct config_item *item,
 	int ret;
 	u32 num;
 
+	trace_usb_configfs_write_attr(item, "iso_qlen", page);
+
 	mutex_lock(&opts->lock);
 	if (opts->refcnt) {
 		ret = -EBUSY;
diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 6f0e1d8..efbf45f 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -1474,6 +1474,8 @@ static ssize_t f_uac1_opts_##name##_store(				\
 	int ret;							\
 	type num;							\
 									\
+	trace_usb_configfs_write_attr(item, #name, page);		\
+									\
 	mutex_lock(&opts->lock);					\
 	if (opts->refcnt) {						\
 		ret = -EBUSY;						\
@@ -1527,6 +1529,8 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
 	u32 num;							\
 	int i;								\
 									\
+	trace_usb_configfs_write_attr(item, #name, page);		\
+									\
 	mutex_lock(&opts->lock);					\
 	if (opts->refcnt) {						\
 		ret = -EBUSY;						\
@@ -1573,6 +1577,8 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
 	struct f_uac1_opts *opts = to_f_uac1_opts(item);		\
 	int ret = 0;							\
 									\
+	trace_usb_configfs_write_attr(item, #name, page);		\
+									\
 	mutex_lock(&opts->lock);					\
 	if (opts->refcnt) {						\
 		ret = -EBUSY;						\
diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index e2d7f69..a65917b 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -837,6 +837,8 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,		\
 	int ret;							\
 	u32 num;							\
 									\
+	trace_usb_configfs_write_attr(item, #name, page);		\
+									\
 	mutex_lock(&opts->lock);					\
 	if (opts->refcnt) {						\
 		ret = -EBUSY;						\
@@ -882,6 +884,8 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
 	int ret = -EBUSY;						\
 	char *tmp;							\
 									\
+	trace_usb_configfs_write_attr(item, #name, page);		\
+									\
 	mutex_lock(&opts->lock);					\
 	if (opts->refcnt)						\
 		goto end;						\
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 1905a8d..1849f3b 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -1886,6 +1886,8 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 	int ret;							\
 	type num;							\
 									\
+	trace_usb_configfs_write_attr(item, #name, page);		\
+									\
 	mutex_lock(&opts->lock);					\
 	if (opts->refcnt) {						\
 		ret = -EBUSY;						\
@@ -1938,6 +1940,8 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 	struct f_uac2_opts *opts = to_f_uac2_opts(item);		\
 	int ret = 0;							\
 									\
+	trace_usb_configfs_write_attr(item, #name, page);		\
+									\
 	mutex_lock(&opts->lock);					\
 	if (opts->refcnt) {						\
 		ret = -EBUSY;						\
@@ -1995,6 +1999,8 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 	u32 num;							\
 	int i;								\
 									\
+	trace_usb_configfs_write_attr(item, #name, page);		\
+									\
 	mutex_lock(&opts->lock);					\
 	if (opts->refcnt) {						\
 		ret = -EBUSY;						\
@@ -2041,6 +2047,8 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 	struct f_uac2_opts *opts = to_f_uac2_opts(item);		\
 	int ret = 0;							\
 									\
+	trace_usb_configfs_write_attr(item, #name, page);		\
+									\
 	mutex_lock(&opts->lock);					\
 	if (opts->refcnt) {						\
 		ret = -EBUSY;						\
diff --git a/drivers/usb/gadget/function/u_ether_configfs.h b/drivers/usb/gadget/function/u_ether_configfs.h
index f558c31..05578be 100644
--- a/drivers/usb/gadget/function/u_ether_configfs.h
+++ b/drivers/usb/gadget/function/u_ether_configfs.h
@@ -45,6 +45,8 @@
 		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);	\
 		int ret;						\
 									\
+		trace_usb_configfs_write_attr(item, "dev_addr", page);	\
+									\
 		mutex_lock(&opts->lock);				\
 		if (opts->refcnt) {					\
 			mutex_unlock(&opts->lock);			\
@@ -80,6 +82,8 @@
 		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);	\
 		int ret;						\
 									\
+		trace_usb_configfs_write_attr(item, "host_addr", page);	\
+									\
 		mutex_lock(&opts->lock);				\
 		if (opts->refcnt) {					\
 			mutex_unlock(&opts->lock);			\
@@ -115,6 +119,8 @@
 		u8 val;							\
 		int ret;						\
 									\
+		trace_usb_configfs_write_attr(item, "qmult", page);	\
+									\
 		mutex_lock(&opts->lock);				\
 		if (opts->refcnt) {					\
 			ret = -EBUSY;					\
@@ -154,6 +160,8 @@ out:									\
 		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);	\
 		int ret = -EBUSY;					\
 									\
+		trace_usb_configfs_write_attr(item, "ifname", page);	\
+									\
 		mutex_lock(&opts->lock);				\
 		if (!opts->refcnt)					\
 			ret = gether_set_ifname(opts->net, page, len);	\
@@ -185,6 +193,8 @@ out:									\
 		int ret = -EINVAL;					\
 		u8 val;							\
 									\
+		trace_usb_configfs_write_attr(item, #_n_, page);		\
+									\
 		mutex_lock(&opts->lock);				\
 		if (sscanf(page, "%02hhx", &val) > 0) {			\
 			opts->_n_ = val;				\
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index fc139f3..6556e42 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -172,6 +172,8 @@ uvcg_control_header_##cname##_store(struct config_item *item,		\
 	int ret;							\
 	u##bits num;							\
 									\
+	trace_usb_configfs_write_attr(item, #cname, page);		\
+									\
 	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
 									\
 	opts_item = ch->item.ci_parent->ci_parent->ci_parent;		\
@@ -1129,6 +1131,8 @@ static ssize_t  uvcg_frame_##cname##_store(struct config_item *item,	\
 	typeof(f->frame.cname) num;					\
 	int ret;							\
 									\
+	trace_usb_configfs_write_attr(item, #aname, page);		\
+									\
 	ret = kstrtou##bits(page, 0, &num);				\
 	if (ret)							\
 		return ret;						\
@@ -1288,6 +1292,8 @@ static ssize_t uvcg_frame_dw_frame_interval_store(struct config_item *item,
 	int ret = 0, n = 0;
 	u32 *frm_intrv, *tmp;
 
+	trace_usb_configfs_write_attr(item, "dwFrameInterval", page);
+
 	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
 
 	opts_item = ch->item.ci_parent->ci_parent->ci_parent->ci_parent;
@@ -1484,6 +1490,8 @@ static ssize_t uvcg_uncompressed_guid_format_store(struct config_item *item,
 	struct mutex *su_mutex = &ch->fmt.group.cg_subsys->su_mutex;
 	int ret;
 
+	trace_usb_configfs_write_attr(item, "guidFormat", page);
+
 	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
 
 	opts_item = ch->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;
@@ -1566,6 +1574,8 @@ uvcg_uncompressed_##cname##_store(struct config_item *item,		\
 	int ret;							\
 	u8 num;								\
 									\
+	trace_usb_configfs_write_attr(item, #aname, page);		\
+									\
 	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
 									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
@@ -1613,6 +1623,8 @@ uvcg_uncompressed_bma_controls_store(struct config_item *item,
 				     const char *page, size_t len)
 {
 	struct uvcg_uncompressed *unc = to_uvcg_uncompressed(item);
+
+	trace_usb_configfs_write_attr(item, "bmaControls", page);
 	return uvcg_format_bma_controls_store(&unc->fmt, page, len);
 }
 
@@ -1761,6 +1773,8 @@ uvcg_mjpeg_##cname##_store(struct config_item *item,			\
 	int ret;							\
 	u8 num;								\
 									\
+	trace_usb_configfs_write_attr(item, #aname, page);		\
+									\
 	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
 									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
@@ -1808,6 +1822,8 @@ uvcg_mjpeg_bma_controls_store(struct config_item *item,
 				     const char *page, size_t len)
 {
 	struct uvcg_mjpeg *u = to_uvcg_mjpeg(item);
+
+	trace_usb_configfs_write_attr(item, "bmaControls", page);
 	return uvcg_format_bma_controls_store(&u->fmt, page, len);
 }
 
@@ -2420,6 +2436,8 @@ f_uvc_opts_##cname##_store(struct config_item *item,			\
 	unsigned int num;						\
 	int ret;							\
 									\
+	trace_usb_configfs_write_attr(item, #aname, page);		\
+									\
 	mutex_lock(&opts->lock);					\
 	if (opts->refcnt) {						\
 		ret = -EBUSY;						\
diff --git a/drivers/usb/gadget/trace.c b/drivers/usb/gadget/trace.c
index 93c5630..997e12e 100644
--- a/drivers/usb/gadget/trace.c
+++ b/drivers/usb/gadget/trace.c
@@ -134,4 +134,30 @@ void trace_usb_configfs_unlink_group(struct config_item *dest,
 	trace_usb_configfs_link_unlink_group(dest, src, "unlink");
 }
 EXPORT_SYMBOL(trace_usb_configfs_unlink_group);
+
+void trace_usb_configfs_write_attr(struct config_item *item,
+		const char *attr, const char *page)
+{
+	char *info, *group;
+	int ret;
+
+	info = kzalloc(2 * PAGE_SIZE, GFP_KERNEL);
+	if (!info)
+		return;
+
+	group = info + 2 * PAGE_SIZE - GROUP_LEN;
+	ret = gadget_configfs_group(group, item);
+	if (ret) {
+		kfree(info);
+		return;
+	}
+
+	snprintf(info, 2 * PAGE_SIZE - GROUP_LEN,
+			"echo %s/%s %s", group, attr, page);
+
+	trace_gadget_configfs(info);
+
+	kfree(info);
+}
+EXPORT_SYMBOL(trace_usb_configfs_write_attr);
 #endif
diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
index df74bd5..5326871 100644
--- a/include/linux/usb/composite.h
+++ b/include/linux/usb/composite.h
@@ -612,11 +612,14 @@ void trace_usb_configfs_link_group(struct config_item *dest,
 		struct config_item *src);
 void trace_usb_configfs_unlink_group(struct config_item *dest,
 		struct config_item *src);
+void trace_usb_configfs_write_attr(struct config_item *item,
+		const char *attr, const char *page);
 #else
 #define trace_usb_configfs_make_group(parent, item) do {} while(0)
 #define trace_usb_configfs_drop_group(parent, item) do {} while(0)
 #define trace_usb_configfs_link_group(dest, src) do {} while(0)
 #define trace_usb_configfs_unlink_group(dest, src) do {} while(0)
+#define trace_usb_configfs_write_attr(item, attr, page) do {} while(0)
 #endif
 
 struct usb_configuration *usb_get_config(struct usb_composite_dev *cdev,
diff --git a/include/linux/usb/gadget_configfs.h b/include/linux/usb/gadget_configfs.h
index a89f177..2c0663e 100644
--- a/include/linux/usb/gadget_configfs.h
+++ b/include/linux/usb/gadget_configfs.h
@@ -14,6 +14,8 @@ static ssize_t __struct##_##__name##_store(struct config_item *item, \
 	struct __struct *gs = to_##__struct(item);	\
 	int ret;					\
 							\
+	trace_usb_configfs_write_attr(item, #__name, page);	\
+							\
 	ret = usb_string_copy(page, &gs->__name);	\
 	if (ret)					\
 		return ret;				\
-- 
2.7.4

