Return-Path: <linux-usb+bounces-8751-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FF3895475
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 15:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 028301F25549
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 13:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8431486120;
	Tue,  2 Apr 2024 13:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ufCrynyD"
X-Original-To: linux-usb@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B760823DD;
	Tue,  2 Apr 2024 13:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712063240; cv=none; b=S10ZWM8jZoVdCgudh7J9MJE6qddpM5lzxm4bcP+x5AqPqMuwJSXTZsoaGPP+5YGy6tAdk/m7IljGF377YGevonVrzI4UNYgGMjWHqJhkcM4ixUbntU+26GyWoqGNA+VuBwNzBbGOTjwapRPvjsqQkVGWLpEX6gBaO2/+eWbZKWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712063240; c=relaxed/simple;
	bh=fGDKkC162ikejtIBRPP7rHnOhmOwFQ/gx3dEo1r3X/M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RPpYhTlDPdseCs/BHVWxKpCL8wbUlXxdRCtksCBiFyF3A7nMjT5ZFJAF6YGKnxVZdBdEZbrWauorugwGKwleFRBoFQmJxkUOYF6DiG1jHkxbJYdeCm1Qoy8qIRQ1STvlfnHPR7dL7/jEyI4y7oOcMKjXFo7aRNUziim1xuvp3Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ufCrynyD; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=VBIBUFaO97zUF6G+3A0cb49irSQcCE/7QvWr+MjaeWk=; b=ufCrynyDnmBkg4qmSV9Jmm68OA
	YqxLw32QOMM8bkBpBEjqXBdtY+jM0oASCdjro1GSVKJxklduypxJVfoNmWwyLZIHw8hX2fDS8jYcs
	Op7prGhuCqRGeODzwhl0DjzcQX6aTF1QOirH16iX5Ep8nJ3Nl9tipUsRtPoiQVIfXyAwxML0854V6
	69ULLjg99pVIhyhhFciTAagnee/vVDb2dN7zI60W3wSC6wPCeAuXP9zQ7oL9JpDAqRJeYORLYeM5K
	LGhv7ZRv6hq2Q0UB2p5uQEuzw2KygR9b/Kho5Ul+7gCYln+iCRA0UyuuoH6m1R+WI5CxUqTXFAMW2
	MSsn2wfg==;
Received: from [2001:4bb8:199:60a5:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrdr0-0000000BFQY-2RNZ;
	Tue, 02 Apr 2024 13:07:07 +0000
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
Subject: [PATCH 07/23] scsi: add a dma_alignment field to the host and host template
Date: Tue,  2 Apr 2024 15:06:29 +0200
Message-Id: <20240402130645.653507-8-hch@lst.de>
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

Get drivers out of the business of having to call the block layer
dma alignment limits helpers themselves.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: John Garry <john.g.garry@oracle.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/firewire/sbp2.c           |  6 ------
 drivers/message/fusion/mptfc.c    |  1 +
 drivers/message/fusion/mptsas.c   |  1 +
 drivers/message/fusion/mptscsih.c |  2 --
 drivers/message/fusion/mptspi.c   |  1 +
 drivers/scsi/hosts.c              |  6 ++++++
 drivers/scsi/iscsi_tcp.c          |  2 +-
 drivers/scsi/qla2xxx/qla_os.c     |  6 +++---
 drivers/scsi/scsi_lib.c           | 11 ++---------
 drivers/staging/rts5208/rtsx.c    | 24 ++++++++++++------------
 drivers/usb/image/microtek.c      |  8 +-------
 drivers/usb/storage/scsiglue.c    | 11 +++++------
 drivers/usb/storage/uas.c         | 13 ++++++-------
 include/scsi/scsi_host.h          |  3 +++
 14 files changed, 42 insertions(+), 53 deletions(-)

diff --git a/drivers/firewire/sbp2.c b/drivers/firewire/sbp2.c
index e779d866022b9f..8f7810b2a4c10f 100644
--- a/drivers/firewire/sbp2.c
+++ b/drivers/firewire/sbp2.c
@@ -1500,12 +1500,6 @@ static int sbp2_scsi_slave_alloc(struct scsi_device *sdev)
 
 	sdev->allow_restart = 1;
 
-	/*
-	 * SBP-2 does not require any alignment, but we set it anyway
-	 * for compatibility with earlier versions of this driver.
-	 */
-	blk_queue_update_dma_alignment(sdev->request_queue, 4 - 1);
-
 	if (lu->tgt->workarounds & SBP2_WORKAROUND_INQUIRY_36)
 		sdev->inquiry_len = 36;
 
diff --git a/drivers/message/fusion/mptfc.c b/drivers/message/fusion/mptfc.c
index c459f709107b7c..a3c17c4fe69c54 100644
--- a/drivers/message/fusion/mptfc.c
+++ b/drivers/message/fusion/mptfc.c
@@ -129,6 +129,7 @@ static const struct scsi_host_template mptfc_driver_template = {
 	.sg_tablesize			= MPT_SCSI_SG_DEPTH,
 	.max_sectors			= 8192,
 	.cmd_per_lun			= 7,
+	.dma_alignment			= 511,
 	.shost_groups			= mptscsih_host_attr_groups,
 };
 
diff --git a/drivers/message/fusion/mptsas.c b/drivers/message/fusion/mptsas.c
index 300f8e955a5319..30cb4f64e77047 100644
--- a/drivers/message/fusion/mptsas.c
+++ b/drivers/message/fusion/mptsas.c
@@ -2020,6 +2020,7 @@ static const struct scsi_host_template mptsas_driver_template = {
 	.sg_tablesize			= MPT_SCSI_SG_DEPTH,
 	.max_sectors			= 8192,
 	.cmd_per_lun			= 7,
+	.dma_alignment			= 511,
 	.shost_groups			= mptscsih_host_attr_groups,
 	.no_write_same			= 1,
 };
diff --git a/drivers/message/fusion/mptscsih.c b/drivers/message/fusion/mptscsih.c
index 9080a73b4ea64a..6c3f25cc33ff99 100644
--- a/drivers/message/fusion/mptscsih.c
+++ b/drivers/message/fusion/mptscsih.c
@@ -2438,8 +2438,6 @@ mptscsih_slave_configure(struct scsi_device *sdev)
 		"tagged %d, simple %d\n",
 		ioc->name,sdev->tagged_supported, sdev->simple_tags));
 
-	blk_queue_dma_alignment (sdev->request_queue, 512 - 1);
-
 	return 0;
 }
 
diff --git a/drivers/message/fusion/mptspi.c b/drivers/message/fusion/mptspi.c
index 6c5920db1e9dc5..574b882c9a8540 100644
--- a/drivers/message/fusion/mptspi.c
+++ b/drivers/message/fusion/mptspi.c
@@ -843,6 +843,7 @@ static const struct scsi_host_template mptspi_driver_template = {
 	.sg_tablesize			= MPT_SCSI_SG_DEPTH,
 	.max_sectors			= 8192,
 	.cmd_per_lun			= 7,
+	.dma_alignment			= 511,
 	.shost_groups			= mptscsih_host_attr_groups,
 };
 
diff --git a/drivers/scsi/hosts.c b/drivers/scsi/hosts.c
index 2d92549e524319..7f987335b44c1a 100644
--- a/drivers/scsi/hosts.c
+++ b/drivers/scsi/hosts.c
@@ -479,6 +479,12 @@ struct Scsi_Host *scsi_host_alloc(const struct scsi_host_template *sht, int priv
 	else
 		shost->max_segment_size = BLK_MAX_SEGMENT_SIZE;
 
+	/* 32-byte (dword) is a common minimum for HBAs. */
+	if (sht->dma_alignment)
+		shost->dma_alignment = sht->dma_alignment;
+	else
+		shost->dma_alignment = 3;
+
 	/*
 	 * assume a 4GB boundary, if not set
 	 */
diff --git a/drivers/scsi/iscsi_tcp.c b/drivers/scsi/iscsi_tcp.c
index 8e14cea15f9808..60688f18fac6f7 100644
--- a/drivers/scsi/iscsi_tcp.c
+++ b/drivers/scsi/iscsi_tcp.c
@@ -943,6 +943,7 @@ iscsi_sw_tcp_session_create(struct iscsi_endpoint *ep, uint16_t cmds_max,
 	shost->max_id = 0;
 	shost->max_channel = 0;
 	shost->max_cmd_len = SCSI_MAX_VARLEN_CDB_SIZE;
+	shost->dma_alignment = 0;
 
 	rc = iscsi_host_get_max_scsi_cmds(shost, cmds_max);
 	if (rc < 0)
@@ -1065,7 +1066,6 @@ static int iscsi_sw_tcp_slave_configure(struct scsi_device *sdev)
 	if (conn->datadgst_en)
 		blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES,
 				   sdev->request_queue);
-	blk_queue_dma_alignment(sdev->request_queue, 0);
 	return 0;
 }
 
diff --git a/drivers/scsi/qla2xxx/qla_os.c b/drivers/scsi/qla2xxx/qla_os.c
index 1e2f52210f6050..5bf7aec217c826 100644
--- a/drivers/scsi/qla2xxx/qla_os.c
+++ b/drivers/scsi/qla2xxx/qla_os.c
@@ -1957,9 +1957,6 @@ qla2xxx_slave_configure(struct scsi_device *sdev)
 	scsi_qla_host_t *vha = shost_priv(sdev->host);
 	struct req_que *req = vha->req;
 
-	if (IS_T10_PI_CAPABLE(vha->hw))
-		blk_queue_update_dma_alignment(sdev->request_queue, 0x7);
-
 	scsi_change_queue_depth(sdev, req->max_q_depth);
 	return 0;
 }
@@ -3575,6 +3572,9 @@ qla2x00_probe_one(struct pci_dev *pdev, const struct pci_device_id *id)
 		    QLA_SG_ALL : 128;
 	}
 
+	if (IS_T10_PI_CAPABLE(base_vha->hw))
+		host->dma_alignment = 0x7;
+
 	ret = scsi_add_host(host, &pdev->dev);
 	if (ret)
 		goto probe_failed;
diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index f1936f98abe3e2..26b51406c477e3 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -1985,15 +1985,8 @@ void scsi_init_limits(struct Scsi_Host *shost, struct queue_limits *lim)
 	lim->seg_boundary_mask = shost->dma_boundary;
 	lim->max_segment_size = shost->max_segment_size;
 	lim->virt_boundary_mask = shost->virt_boundary_mask;
-
-	/*
-	 * Set a reasonable default alignment:  The larger of 32-byte (dword),
-	 * which is a common minimum for HBAs, and the minimum DMA alignment,
-	 * which is set by the platform.
-	 *
-	 * Devices that require a bigger alignment can increase it later.
-	 */
-	lim->dma_alignment = max(4, dma_get_cache_alignment()) - 1;
+	lim->dma_alignment = max_t(unsigned int,
+		shost->dma_alignment, dma_get_cache_alignment() - 1);
 
 	if (shost->no_highmem)
 		lim->bounce = BLK_BOUNCE_HIGH;
diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
index 86d32e3b3282a5..c4f54c311d0549 100644
--- a/drivers/staging/rts5208/rtsx.c
+++ b/drivers/staging/rts5208/rtsx.c
@@ -70,18 +70,6 @@ static int slave_alloc(struct scsi_device *sdev)
 
 static int slave_configure(struct scsi_device *sdev)
 {
-	/*
-	 * Scatter-gather buffers (all but the last) must have a length
-	 * divisible by the bulk maxpacket size.  Otherwise a data packet
-	 * would end up being short, causing a premature end to the data
-	 * transfer.  Since high-speed bulk pipes have a maxpacket size
-	 * of 512, we'll use that as the scsi device queue's DMA alignment
-	 * mask.  Guaranteeing proper alignment of the first buffer will
-	 * have the desired effect because, except at the beginning and
-	 * the end, scatter-gather buffers follow page boundaries.
-	 */
-	blk_queue_dma_alignment(sdev->request_queue, (512 - 1));
-
 	/* Set the SCSI level to at least 2.  We'll leave it at 3 if that's
 	 * what is originally reported.  We need this to avoid confusing
 	 * the SCSI layer with devices that report 0 or 1, but need 10-byte
@@ -219,6 +207,18 @@ static const struct scsi_host_template rtsx_host_template = {
 	/* limit the total size of a transfer to 120 KB */
 	.max_sectors =                  240,
 
+	/*
+	 * Scatter-gather buffers (all but the last) must have a length
+	 * divisible by the bulk maxpacket size.  Otherwise a data packet
+	 * would end up being short, causing a premature end to the data
+	 * transfer.  Since high-speed bulk pipes have a maxpacket size
+	 * of 512, we'll use that as the scsi device queue's DMA alignment
+	 * mask.  Guaranteeing proper alignment of the first buffer will
+	 * have the desired effect because, except at the beginning and
+	 * the end, scatter-gather buffers follow page boundaries.
+	 */
+	.dma_alignment =		511,
+
 	/* emulated HBA */
 	.emulated =			1,
 
diff --git a/drivers/usb/image/microtek.c b/drivers/usb/image/microtek.c
index 8c8fa71c69c411..9f758241d9d376 100644
--- a/drivers/usb/image/microtek.c
+++ b/drivers/usb/image/microtek.c
@@ -328,12 +328,6 @@ static int mts_slave_alloc (struct scsi_device *s)
 	return 0;
 }
 
-static int mts_slave_configure (struct scsi_device *s)
-{
-	blk_queue_dma_alignment(s->request_queue, (512 - 1));
-	return 0;
-}
-
 static int mts_scsi_abort(struct scsi_cmnd *srb)
 {
 	struct mts_desc* desc = (struct mts_desc*)(srb->device->host->hostdata[0]);
@@ -631,8 +625,8 @@ static const struct scsi_host_template mts_scsi_host_template = {
 	.can_queue =		1,
 	.this_id =		-1,
 	.emulated =		1,
+	.dma_alignment =	511,
 	.slave_alloc =		mts_slave_alloc,
-	.slave_configure =	mts_slave_configure,
 	.max_sectors=		256, /* 128 K */
 };
 
diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index 1d14c678f3d3e3..eb4ba03e082d89 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -75,12 +75,6 @@ static int slave_alloc (struct scsi_device *sdev)
 	 */
 	sdev->inquiry_len = 36;
 
-	/*
-	 * Some host controllers may have alignment requirements.
-	 * We'll play it safe by requiring 512-byte alignment always.
-	 */
-	blk_queue_update_dma_alignment(sdev->request_queue, (512 - 1));
-
 	/* Tell the SCSI layer if we know there is more than one LUN */
 	if (us->protocol == USB_PR_BULK && us->max_lun > 0)
 		sdev->sdev_bflags |= BLIST_FORCELUN;
@@ -638,6 +632,11 @@ static const struct scsi_host_template usb_stor_host_template = {
 	/* lots of sg segments can be handled */
 	.sg_tablesize =			SG_MAX_SEGMENTS,
 
+	/*
+	 * Some host controllers may have alignment requirements.
+	 * We'll play it safe by requiring 512-byte alignment always.
+	 */
+	.dma_alignment =		511,
 
 	/*
 	 * Limit the total size of a transfer to 120 KB.
diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 08953f0d4532aa..ca6d01fc4b9456 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -822,13 +822,6 @@ static int uas_slave_alloc(struct scsi_device *sdev)
 
 	sdev->hostdata = devinfo;
 
-	/*
-	 * The protocol has no requirements on alignment in the strict sense.
-	 * Controllers may or may not have alignment restrictions.
-	 * As this is not exported, we use an extremely conservative guess.
-	 */
-	blk_queue_update_dma_alignment(sdev->request_queue, (512 - 1));
-
 	if (devinfo->flags & US_FL_MAX_SECTORS_64)
 		blk_queue_max_hw_sectors(sdev->request_queue, 64);
 	else if (devinfo->flags & US_FL_MAX_SECTORS_240)
@@ -910,6 +903,12 @@ static const struct scsi_host_template uas_host_template = {
 	.eh_device_reset_handler = uas_eh_device_reset_handler,
 	.this_id = -1,
 	.skip_settle_delay = 1,
+	/*
+	 * The protocol has no requirements on alignment in the strict sense.
+	 * Controllers may or may not have alignment restrictions.
+	 * As this is not exported, we use an extremely conservative guess.
+	 */
+	.dma_alignment = 511,
 	.dma_boundary = PAGE_SIZE - 1,
 	.cmd_size = sizeof(struct uas_cmd_info),
 };
diff --git a/include/scsi/scsi_host.h b/include/scsi/scsi_host.h
index 878840c9b5b99a..09d769a371ca06 100644
--- a/include/scsi/scsi_host.h
+++ b/include/scsi/scsi_host.h
@@ -405,6 +405,8 @@ struct scsi_host_template {
 	 */
 	unsigned int max_segment_size;
 
+	unsigned int dma_alignment;
+
 	/*
 	 * DMA scatter gather segment boundary limit. A segment crossing this
 	 * boundary will be split in two.
@@ -614,6 +616,7 @@ struct Scsi_Host {
 	unsigned int max_sectors;
 	unsigned int opt_sectors;
 	unsigned int max_segment_size;
+	unsigned int dma_alignment;
 	unsigned long dma_boundary;
 	unsigned long virt_boundary_mask;
 	/*
-- 
2.39.2


