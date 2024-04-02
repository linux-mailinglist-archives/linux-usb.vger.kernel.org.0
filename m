Return-Path: <linux-usb+bounces-8748-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C00895466
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 15:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26231286D97
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 13:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C4585274;
	Tue,  2 Apr 2024 13:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VZhnyOE1"
X-Original-To: linux-usb@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74ED84FAE;
	Tue,  2 Apr 2024 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712063230; cv=none; b=D3jQjaUs5xpCpXjSkj3yQa3k5zVbAAuE8O4LIci9B4pLSnfHRHzutTkp1FVNM1eeyARlSTPPBSSEwc7h1CDbyUfZDwcNGMUDZJ2YR44ezOfrbbT7SeJHsbidOtk60YvD46qLEptRYeNG57LBqUlpJlNs5S+fiorsyX+AL6kSVt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712063230; c=relaxed/simple;
	bh=OtY079l4DkqZMOXLihZpfSLt0xRK1Em980Xq0ajWLMI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PJmMa6v0wsA++VGTH/YERaF8OiQroL6RbpOgTi/XT7N+kcg0ZE10eGcTLJHvNhHUrmtsVvau1CYaySOVyaYVoPMVjf5uiSvUiphsLKqr/AF+MgKgV0RkICWfZkxf+zoKEpxOnpiXL+LkfZ20lh5BkAD1y1XPPgLXSNntbEqPApk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VZhnyOE1; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=nFVtEH8kjrXq58VeMsY4DusbYHlTaq2Q83bR9XbKjL8=; b=VZhnyOE1e9rNqdT9X8uThTcuAY
	XXlNso+Z2MJllZnMdgydxbduhmwJXK+DO2fPIVEb28D4z39IgTt7ayfBvZQ3NqsqVKvHqMuVQUklA
	3UcbyQ/JCrmhYM9vFbzRYI+0CJF76J2GHXMj4SAIVTz7gaT7u1i8zsVxbTnCYM/yAQGNd6X/viRle
	IQ+GsuYaswQaaJgvUFK79IleAuOSb6+bYgFXXhTPbBxqY203PjRus6wMe7r+rpiZaRAyC1ni0+iP4
	bm/YvGp6KbXGBRVyPJeB0WTR+1Kffk1yk0sgWcQ2v11xt/D1iA7JRYNv5UL24zYj42waYom6N7KNV
	+eLegk0w==;
Received: from [2001:4bb8:199:60a5:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrdqs-0000000BFMU-2NnW;
	Tue, 02 Apr 2024 13:06:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Sathya Prakash <sathya.prakash@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	"Juergen E. Fischer" <fischer@norbit.de>,
	Xiang Chen <chenxiang66@hisilicon.com>,
	HighPoint Linux Team <linux@highpoint-tech.com>,
	Tyrel Datwyler <tyreld@linux.ibm.com>,
	Brian King <brking@us.ibm.com>,
	Lee Duncan <lduncan@suse.com>,
	Chris Leech <cleech@redhat.com>,
	Mike Christie <michael.christie@oracle.com>,
	John Garry <john.g.garry@oracle.com>,
	Jason Yan <yanaijie@huawei.com>,
	Kashyap Desai <kashyap.desai@broadcom.com>,
	Sumit Saxena <sumit.saxena@broadcom.com>,
	Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
	Chandrakanth patil <chandrakanth.patil@broadcom.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Nilesh Javali <njavali@marvell.com>,
	GR-QLogic-Storage-Upstream@marvell.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-block@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net,
	MPT-FusionLinux.pdl@broadcom.com,
	linux-scsi@vger.kernel.org,
	megaraidlinux.pdl@broadcom.com,
	mpi3mr-linuxdrv.pdl@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Subject: [PATCH 04/23] scsi: initialize scsi midlayer limits before allocating the queue
Date: Tue,  2 Apr 2024 15:06:26 +0200
Message-Id: <20240402130645.653507-5-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240402130645.653507-1-hch@lst.de>
References: <20240402130645.653507-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Turn __scsi_init_queue into scsi_init_limits which initializes
queue_limits structure that can be passed to blk_mq_alloc_queue.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: John Garry <john.g.garry@oracle.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/scsi/scsi_lib.c             | 32 ++++++++++++++---------------
 drivers/scsi/scsi_scan.c            |  5 +++--
 drivers/scsi/scsi_transport_fc.c    | 11 +++++-----
 drivers/scsi/scsi_transport_iscsi.c |  5 +++--
 include/scsi/scsi_transport.h       |  2 +-
 5 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 2e28e2360c8574..1deca84914e87a 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -32,7 +32,7 @@
 #include <scsi/scsi_driver.h>
 #include <scsi/scsi_eh.h>
 #include <scsi/scsi_host.h>
-#include <scsi/scsi_transport.h> /* __scsi_init_queue() */
+#include <scsi/scsi_transport.h> /* scsi_init_limits() */
 #include <scsi/scsi_dh.h>
 
 #include <trace/events/scsi.h>
@@ -1965,31 +1965,26 @@ static void scsi_map_queues(struct blk_mq_tag_set *set)
 	blk_mq_map_queues(&set->map[HCTX_TYPE_DEFAULT]);
 }
 
-void __scsi_init_queue(struct Scsi_Host *shost, struct request_queue *q)
+void scsi_init_limits(struct Scsi_Host *shost, struct queue_limits *lim)
 {
 	struct device *dev = shost->dma_dev;
 
-	/*
-	 * this limit is imposed by hardware restrictions
-	 */
-	blk_queue_max_segments(q, min_t(unsigned short, shost->sg_tablesize,
-					SG_MAX_SEGMENTS));
+	memset(lim, 0, sizeof(*lim));
+	lim->max_segments =
+		min_t(unsigned short, shost->sg_tablesize, SG_MAX_SEGMENTS);
 
 	if (scsi_host_prot_dma(shost)) {
 		shost->sg_prot_tablesize =
 			min_not_zero(shost->sg_prot_tablesize,
 				     (unsigned short)SCSI_MAX_PROT_SG_SEGMENTS);
 		BUG_ON(shost->sg_prot_tablesize < shost->sg_tablesize);
-		blk_queue_max_integrity_segments(q, shost->sg_prot_tablesize);
+		lim->max_integrity_segments = shost->sg_prot_tablesize;
 	}
 
-	blk_queue_max_hw_sectors(q, shost->max_sectors);
-	blk_queue_segment_boundary(q, shost->dma_boundary);
-	dma_set_seg_boundary(dev, shost->dma_boundary);
-
-	blk_queue_max_segment_size(q, shost->max_segment_size);
-	blk_queue_virt_boundary(q, shost->virt_boundary_mask);
-	dma_set_max_seg_size(dev, queue_max_segment_size(q));
+	lim->max_hw_sectors = shost->max_sectors;
+	lim->seg_boundary_mask = shost->dma_boundary;
+	lim->max_segment_size = shost->max_segment_size;
+	lim->virt_boundary_mask = shost->virt_boundary_mask;
 
 	/*
 	 * Set a reasonable default alignment:  The larger of 32-byte (dword),
@@ -1998,9 +1993,12 @@ void __scsi_init_queue(struct Scsi_Host *shost, struct request_queue *q)
 	 *
 	 * Devices that require a bigger alignment can increase it later.
 	 */
-	blk_queue_dma_alignment(q, max(4, dma_get_cache_alignment()) - 1);
+	lim->dma_alignment = max(4, dma_get_cache_alignment()) - 1;
+
+	dma_set_seg_boundary(dev, shost->dma_boundary);
+	dma_set_max_seg_size(dev, shost->max_segment_size);
 }
-EXPORT_SYMBOL_GPL(__scsi_init_queue);
+EXPORT_SYMBOL_GPL(scsi_init_limits);
 
 static const struct blk_mq_ops scsi_mq_ops_no_commit = {
 	.get_budget	= scsi_mq_get_budget,
diff --git a/drivers/scsi/scsi_scan.c b/drivers/scsi/scsi_scan.c
index ffd7e7e72933c5..ff3778f7009ebf 100644
--- a/drivers/scsi/scsi_scan.c
+++ b/drivers/scsi/scsi_scan.c
@@ -283,6 +283,7 @@ static struct scsi_device *scsi_alloc_sdev(struct scsi_target *starget,
 	struct request_queue *q;
 	int display_failure_msg = 1, ret;
 	struct Scsi_Host *shost = dev_to_shost(starget->dev.parent);
+	struct queue_limits lim;
 
 	sdev = kzalloc(sizeof(*sdev) + shost->transportt->device_size,
 		       GFP_KERNEL);
@@ -332,7 +333,8 @@ static struct scsi_device *scsi_alloc_sdev(struct scsi_target *starget,
 
 	sdev->sg_reserved_size = INT_MAX;
 
-	q = blk_mq_alloc_queue(&sdev->host->tag_set, NULL, NULL);
+	scsi_init_limits(shost, &lim);
+	q = blk_mq_alloc_queue(&sdev->host->tag_set, &lim, NULL);
 	if (IS_ERR(q)) {
 		/* release fn is set up in scsi_sysfs_device_initialise, so
 		 * have to free and put manually here */
@@ -343,7 +345,6 @@ static struct scsi_device *scsi_alloc_sdev(struct scsi_target *starget,
 	kref_get(&sdev->host->tagset_refcnt);
 	sdev->request_queue = q;
 	q->queuedata = sdev;
-	__scsi_init_queue(sdev->host, q);
 
 	depth = sdev->host->cmd_per_lun ?: 1;
 
diff --git a/drivers/scsi/scsi_transport_fc.c b/drivers/scsi/scsi_transport_fc.c
index 87b2235b8ece45..0799700b0fca77 100644
--- a/drivers/scsi/scsi_transport_fc.c
+++ b/drivers/scsi/scsi_transport_fc.c
@@ -4276,6 +4276,7 @@ fc_bsg_hostadd(struct Scsi_Host *shost, struct fc_host_attrs *fc_host)
 {
 	struct device *dev = &shost->shost_gendev;
 	struct fc_internal *i = to_fc_internal(shost->transportt);
+	struct queue_limits lim;
 	struct request_queue *q;
 	char bsg_name[20];
 
@@ -4286,8 +4287,8 @@ fc_bsg_hostadd(struct Scsi_Host *shost, struct fc_host_attrs *fc_host)
 
 	snprintf(bsg_name, sizeof(bsg_name),
 		 "fc_host%d", shost->host_no);
-
-	q = bsg_setup_queue(dev, bsg_name, NULL, fc_bsg_dispatch,
+	scsi_init_limits(shost, &lim);
+	q = bsg_setup_queue(dev, bsg_name, &lim, fc_bsg_dispatch,
 			fc_bsg_job_timeout, i->f->dd_bsg_size);
 	if (IS_ERR(q)) {
 		dev_err(dev,
@@ -4295,7 +4296,6 @@ fc_bsg_hostadd(struct Scsi_Host *shost, struct fc_host_attrs *fc_host)
 			shost->host_no);
 		return PTR_ERR(q);
 	}
-	__scsi_init_queue(shost, q);
 	blk_queue_rq_timeout(q, FC_DEFAULT_BSG_TIMEOUT);
 	fc_host->rqst_q = q;
 	return 0;
@@ -4311,6 +4311,7 @@ fc_bsg_rportadd(struct Scsi_Host *shost, struct fc_rport *rport)
 {
 	struct device *dev = &rport->dev;
 	struct fc_internal *i = to_fc_internal(shost->transportt);
+	struct queue_limits lim;
 	struct request_queue *q;
 
 	rport->rqst_q = NULL;
@@ -4318,13 +4319,13 @@ fc_bsg_rportadd(struct Scsi_Host *shost, struct fc_rport *rport)
 	if (!i->f->bsg_request)
 		return -ENOTSUPP;
 
-	q = bsg_setup_queue(dev, dev_name(dev), NULL, fc_bsg_dispatch_prep,
+	scsi_init_limits(shost, &lim);
+	q = bsg_setup_queue(dev, dev_name(dev), &lim, fc_bsg_dispatch_prep,
 				fc_bsg_job_timeout, i->f->dd_bsg_size);
 	if (IS_ERR(q)) {
 		dev_err(dev, "failed to setup bsg queue\n");
 		return PTR_ERR(q);
 	}
-	__scsi_init_queue(shost, q);
 	blk_queue_rq_timeout(q, BLK_DEFAULT_SG_TIMEOUT);
 	rport->rqst_q = q;
 	return 0;
diff --git a/drivers/scsi/scsi_transport_iscsi.c b/drivers/scsi/scsi_transport_iscsi.c
index c131746bf20777..5e1bb488da15c0 100644
--- a/drivers/scsi/scsi_transport_iscsi.c
+++ b/drivers/scsi/scsi_transport_iscsi.c
@@ -1535,6 +1535,7 @@ iscsi_bsg_host_add(struct Scsi_Host *shost, struct iscsi_cls_host *ihost)
 {
 	struct device *dev = &shost->shost_gendev;
 	struct iscsi_internal *i = to_iscsi_internal(shost->transportt);
+	struct queue_limits lim;
 	struct request_queue *q;
 	char bsg_name[20];
 
@@ -1542,14 +1543,14 @@ iscsi_bsg_host_add(struct Scsi_Host *shost, struct iscsi_cls_host *ihost)
 		return -ENOTSUPP;
 
 	snprintf(bsg_name, sizeof(bsg_name), "iscsi_host%d", shost->host_no);
-	q = bsg_setup_queue(dev, bsg_name, NULL, iscsi_bsg_host_dispatch, NULL,
+	scsi_init_limits(shost, &lim);
+	q = bsg_setup_queue(dev, bsg_name, &lim, iscsi_bsg_host_dispatch, NULL,
 			0);
 	if (IS_ERR(q)) {
 		shost_printk(KERN_ERR, shost, "bsg interface failed to "
 			     "initialize - no request queue\n");
 		return PTR_ERR(q);
 	}
-	__scsi_init_queue(shost, q);
 
 	ihost->bsg_q = q;
 	return 0;
diff --git a/include/scsi/scsi_transport.h b/include/scsi/scsi_transport.h
index a0458bda314872..1394cf313bb37c 100644
--- a/include/scsi/scsi_transport.h
+++ b/include/scsi/scsi_transport.h
@@ -83,6 +83,6 @@ scsi_transport_device_data(struct scsi_device *sdev)
 		+ shost->transportt->device_private_offset;
 }
 
-void __scsi_init_queue(struct Scsi_Host *shost, struct request_queue *q);
+void scsi_init_limits(struct Scsi_Host *shost, struct queue_limits *lim);
 
 #endif /* SCSI_TRANSPORT_H */
-- 
2.39.2


