Return-Path: <linux-usb+bounces-8212-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96179889A7E
	for <lists+linux-usb@lfdr.de>; Mon, 25 Mar 2024 11:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B98091C33273
	for <lists+linux-usb@lfdr.de>; Mon, 25 Mar 2024 10:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F90F1CF8D0;
	Mon, 25 Mar 2024 01:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FgaYvL4R"
X-Original-To: linux-usb@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6C2189245;
	Sun, 24 Mar 2024 23:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711324582; cv=none; b=Apjt4bMBf2uNyAXMZvYkNWNBjc2NiFl5Ho4zSChyiZSbtgZXsb6RCIL0qDVJEhEhaYxIDGXUf5ch2y86G/g1GAQiwbTriVisboGVuO/qgVpTDCBz6GPTb4IK4O/Gbh17M/2SViwEF8nW0xKxJ6MLxEosyurbpKPgIA/o/avBd48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711324582; c=relaxed/simple;
	bh=Ke16FWK3CTx3hTqTxP13uL9Dp+Fdso3HRy3JBR8IfGw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j9QXA4fUs36E4fNa0s8gNgQ4cYLp607oAq3XO2EDYvCxqQcJs+w1R0Pi0t8NrLyDw3UWYmi+xF/FbQLxi57l7Y5Wcy7/kTbAx/YcjhzcU+drcCMuOaGTUPxvYUJdBraer+g666FfY/fbdZSAe+KIleEKbE7i+v1uguCg509hj4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FgaYvL4R; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=xL4EmOYh991KWZN2JoTWW1e6ishZxgC6oGRU+OrRqSA=; b=FgaYvL4RdJqJFw6XhIpv6cC9lt
	X0F6o3jLYU9cnkmfBPU1K+Ooha1uPPiw6jgGCDoByjB9ZgYQd1QCfbydiAMzRZiu3fLsTE0tAhITA
	KKl7Y1ZOTAUl9iIZ0DEpdsL7dY00EhlPvwRjfL8hXMG/fHIeJTqt2zlUeDknurrzL0iB/yb8DGhyZ
	d1+6I/540cU1x9/X28ChIO1vwE+jlL6wVj7DEm+1l7NzpiIDZne53L2+lGFEPBB568WKdEejXFu+F
	hdmPao7HNhm6bRRo4qLFOvT3P0ENmjvrZUkrGOjTmrYG4O3RhpZiX+em2KXbfLNROocbT4g9wxLEY
	J0XN5ewg==;
Received: from [210.13.83.2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roXhA-0000000Dzkd-1JEq;
	Sun, 24 Mar 2024 23:56:08 +0000
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
	open-iscsi@googlegroups.com,
	megaraidlinux.pdl@broadcom.com,
	mpi3mr-linuxdrv.pdl@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Subject: [PATCH 17/23] usb-storage: switch to using ->device_configure
Date: Mon, 25 Mar 2024 07:54:42 +0800
Message-Id: <20240324235448.2039074-18-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240324235448.2039074-1-hch@lst.de>
References: <20240324235448.2039074-1-hch@lst.de>
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

Also use the proper atomic queue limit update helpers and freeze the
queue when updating max_hw_sectors from sysfs.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/usb/storage/scsiglue.c | 36 ++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index eb4ba03e082d89..b31464740f6c86 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -82,7 +82,7 @@ static int slave_alloc (struct scsi_device *sdev)
 	return 0;
 }
 
-static int slave_configure(struct scsi_device *sdev)
+static int device_configure(struct scsi_device *sdev, struct queue_limits *lim)
 {
 	struct us_data *us = host_to_us(sdev->host);
 	struct device *dev = us->pusb_dev->bus->sysdev;
@@ -97,31 +97,28 @@ static int slave_configure(struct scsi_device *sdev)
 
 		if (us->fflags & US_FL_MAX_SECTORS_MIN)
 			max_sectors = PAGE_SIZE >> 9;
-		if (queue_max_hw_sectors(sdev->request_queue) > max_sectors)
-			blk_queue_max_hw_sectors(sdev->request_queue,
-					      max_sectors);
+		lim->max_hw_sectors = min(lim->max_hw_sectors, max_sectors);
 	} else if (sdev->type == TYPE_TAPE) {
 		/*
 		 * Tapes need much higher max_sector limits, so just
 		 * raise it to the maximum possible (4 GB / 512) and
 		 * let the queue segment size sort out the real limit.
 		 */
-		blk_queue_max_hw_sectors(sdev->request_queue, 0x7FFFFF);
+		lim->max_hw_sectors = 0x7FFFFF;
 	} else if (us->pusb_dev->speed >= USB_SPEED_SUPER) {
 		/*
 		 * USB3 devices will be limited to 2048 sectors. This gives us
 		 * better throughput on most devices.
 		 */
-		blk_queue_max_hw_sectors(sdev->request_queue, 2048);
+		lim->max_hw_sectors = 2048;
 	}
 
 	/*
 	 * The max_hw_sectors should be up to maximum size of a mapping for
 	 * the device. Otherwise, a DMA API might fail on swiotlb environment.
 	 */
-	blk_queue_max_hw_sectors(sdev->request_queue,
-		min_t(size_t, queue_max_hw_sectors(sdev->request_queue),
-		      dma_max_mapping_size(dev) >> SECTOR_SHIFT));
+	lim->max_hw_sectors = min_t(size_t,
+		lim->max_hw_sectors, dma_max_mapping_size(dev) >> SECTOR_SHIFT);
 
 	/*
 	 * We can't put these settings in slave_alloc() because that gets
@@ -582,13 +579,22 @@ static ssize_t max_sectors_store(struct device *dev, struct device_attribute *at
 		size_t count)
 {
 	struct scsi_device *sdev = to_scsi_device(dev);
+	struct queue_limits lim;
 	unsigned short ms;
+	int ret;
 
-	if (sscanf(buf, "%hu", &ms) > 0) {
-		blk_queue_max_hw_sectors(sdev->request_queue, ms);
-		return count;
-	}
-	return -EINVAL;
+	if (sscanf(buf, "%hu", &ms) <= 0)
+		return -EINVAL;
+
+	blk_mq_freeze_queue(sdev->request_queue);
+	lim = queue_limits_start_update(sdev->request_queue);
+	lim.max_hw_sectors = ms;
+	ret = queue_limits_commit_update(sdev->request_queue, &lim);
+	blk_mq_unfreeze_queue(sdev->request_queue);
+
+	if (ret)
+		return ret;
+	return count;
 }
 static DEVICE_ATTR_RW(max_sectors);
 
@@ -626,7 +632,7 @@ static const struct scsi_host_template usb_stor_host_template = {
 	.this_id =			-1,
 
 	.slave_alloc =			slave_alloc,
-	.slave_configure =		slave_configure,
+	.device_configure =		device_configure,
 	.target_alloc =			target_alloc,
 
 	/* lots of sg segments can be handled */
-- 
2.39.2


