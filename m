Return-Path: <linux-usb+bounces-9144-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1942789DCCF
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 16:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 657BCB2687F
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 14:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBF1134723;
	Tue,  9 Apr 2024 14:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IRg989Q7"
X-Original-To: linux-usb@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C96132484;
	Tue,  9 Apr 2024 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712673515; cv=none; b=Z148Yg3AoAbjjhgxZaaqD9NuvMZH8sdnj9QbgAo+4muzqHNAAfloLUnDBIFd65xY4zzRIEAMhH4WoOvLgQrNtDRa5FSYmzaaR4ZMd0qdIQyjpv5b+l2L1EmxOiG7KDMr6NUkLZNJm5ieub+V4SmiJ87I5Un44WZ+uqjZ9VeZv8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712673515; c=relaxed/simple;
	bh=44g3jDlFH/3SPykaFJ6rckB4bNcLGg7wPQjuHZRqtNI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YX/hxvs4xwtaeHpWQGbrGUT93n64FvCEnKrVfgkMGYBikcCBgwntq3hU3R9BMwin8zMEad59bxDOiOH8Z5a4xHSyQqBvV4ECy15xfayndZIcpRyiW3Z8uvNDRWi5nrX+E1rpYrJwVEcXVL7+oVdCD8k4T6+oOpwDSei1tdFqVjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IRg989Q7; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Blsk0lPHJJT2lojxMt5YmkBIVokYvdvmYbsM34r6dhs=; b=IRg989Q7+HtWvGW4I1pbbeXtk9
	AttcGOrtVindRUEvGeoL19wosY6BUzOyvBmsYezGNzolR0FJrBYcfZJOecf00tP4gYDSJxB+XFy+Z
	nGvLRsVlQvbwwyv8C8GKk0dj5kgysQSWboagDwX+EZg1vOeaKYBZDCCcvsFm+WUpYALFvp+MA1Ppy
	EDttzTg8r9FjMWqDKj1qurkaMn/bHucEkjAMEG0Dwdn9sNUCv4h+XE7st4GBMZ6ATuoBPG936hYKV
	xpC+n6SQARJ1CP1ng/eMuqMxLc05aI5pANfcYTPdXIzNj5ujsocUgQ2s8kXLhHYuXw3orTSCfZ/K6
	o46oNyXA==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruCcC-00000002S4b-16Ek;
	Tue, 09 Apr 2024 14:38:24 +0000
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
Subject: [PATCH 12/23] mpt3sas: switch to using ->device_configure
Date: Tue,  9 Apr 2024 16:37:37 +0200
Message-Id: <20240409143748.980206-13-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240409143748.980206-1-hch@lst.de>
References: <20240409143748.980206-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Switch to the ->device_configure method instead of ->slave_configure
and update the block limits on the passed in queue_limits instead
of using the per-limit accessors.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/scsi/mpt3sas/mpt3sas_scsih.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/scsi/mpt3sas/mpt3sas_scsih.c b/drivers/scsi/mpt3sas/mpt3sas_scsih.c
index ef8ee93005eae6..89ef43a5ef862d 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_scsih.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_scsih.c
@@ -2497,14 +2497,15 @@ _scsih_enable_tlr(struct MPT3SAS_ADAPTER *ioc, struct scsi_device *sdev)
 }
 
 /**
- * scsih_slave_configure - device configure routine.
+ * scsih_device_configure - device configure routine.
  * @sdev: scsi device struct
+ * @lim: queue limits
  *
  * Return: 0 if ok. Any other return is assumed to be an error and
  * the device is ignored.
  */
 static int
-scsih_slave_configure(struct scsi_device *sdev)
+scsih_device_configure(struct scsi_device *sdev, struct queue_limits *lim)
 {
 	struct Scsi_Host *shost = sdev->host;
 	struct MPT3SAS_ADAPTER *ioc = shost_priv(shost);
@@ -2609,8 +2610,7 @@ scsih_slave_configure(struct scsi_device *sdev)
 			    raid_device->num_pds, ds);
 
 		if (shost->max_sectors > MPT3SAS_RAID_MAX_SECTORS) {
-			blk_queue_max_hw_sectors(sdev->request_queue,
-						MPT3SAS_RAID_MAX_SECTORS);
+			lim->max_hw_sectors = MPT3SAS_RAID_MAX_SECTORS;
 			sdev_printk(KERN_INFO, sdev,
 					"Set queue's max_sector to: %u\n",
 						MPT3SAS_RAID_MAX_SECTORS);
@@ -2675,8 +2675,7 @@ scsih_slave_configure(struct scsi_device *sdev)
 				pcie_device->connector_name);
 
 		if (pcie_device->nvme_mdts)
-			blk_queue_max_hw_sectors(sdev->request_queue,
-					pcie_device->nvme_mdts/512);
+			lim->max_hw_sectors = pcie_device->nvme_mdts / 512;
 
 		pcie_device_put(pcie_device);
 		spin_unlock_irqrestore(&ioc->pcie_device_lock, flags);
@@ -2687,8 +2686,7 @@ scsih_slave_configure(struct scsi_device *sdev)
 		 **/
 		blk_queue_flag_set(QUEUE_FLAG_NOMERGES,
 				sdev->request_queue);
-		blk_queue_virt_boundary(sdev->request_queue,
-				ioc->page_size - 1);
+		lim->virt_boundary_mask = ioc->page_size - 1;
 		return 0;
 	}
 
@@ -11914,7 +11912,7 @@ static const struct scsi_host_template mpt2sas_driver_template = {
 	.queuecommand			= scsih_qcmd,
 	.target_alloc			= scsih_target_alloc,
 	.slave_alloc			= scsih_slave_alloc,
-	.slave_configure		= scsih_slave_configure,
+	.device_configure		= scsih_device_configure,
 	.target_destroy			= scsih_target_destroy,
 	.slave_destroy			= scsih_slave_destroy,
 	.scan_finished			= scsih_scan_finished,
@@ -11952,7 +11950,7 @@ static const struct scsi_host_template mpt3sas_driver_template = {
 	.queuecommand			= scsih_qcmd,
 	.target_alloc			= scsih_target_alloc,
 	.slave_alloc			= scsih_slave_alloc,
-	.slave_configure		= scsih_slave_configure,
+	.device_configure		= scsih_device_configure,
 	.target_destroy			= scsih_target_destroy,
 	.slave_destroy			= scsih_slave_destroy,
 	.scan_finished			= scsih_scan_finished,
-- 
2.39.2


