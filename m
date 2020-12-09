Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED682D3F34
	for <lists+linux-usb@lfdr.de>; Wed,  9 Dec 2020 10:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729296AbgLIJx0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Dec 2020 04:53:26 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:47432 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728981AbgLIJxZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Dec 2020 04:53:25 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B99qBwc044968;
        Wed, 9 Dec 2020 09:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=QTB6vd20ly8VA0XLEGgCrxdLjuRD4qRMHw3PFcvpG3E=;
 b=XMEFj1f6H16lCPWcAdOL/qTONiLS4jb28jqlDMu9nCwvtIvUtlocsL2XbcH3TUKNP3M/
 cTE3roZS2MextjeIW0f0vwI+g9G6xoHXg6+2SyFViqbKmeN1tkv5VkDJUuB/f7JRubs2
 z7d4URi2XSD+Ddn6M3E77QnMorjKZEGZrpntYBFwM5H9gShfMqViAXJtlB9GSkYsgfx0
 fudmwRVUFCr8NKG6aDYF6TBPHHordaaiKij9KwQOLXoQK/+U2j0W00EqsYVPLDOMVcHb
 Czg9YhI5aOOnQfJFtmb4g1rJxGdwKE0xlCgVFttiNovD/nYfyItDY6BQw2rJibPZ7vaT fw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 3581mqy5ph-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 09 Dec 2020 09:52:42 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B99oX7Z033037;
        Wed, 9 Dec 2020 09:50:41 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 358m400r9h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Dec 2020 09:50:41 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B99oeAn032265;
        Wed, 9 Dec 2020 09:50:41 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 09 Dec 2020 01:50:40 -0800
Date:   Wed, 9 Dec 2020 12:50:33 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Pawel Laszczak <pawell@cadence.com>
Cc:     linux-usb@vger.kernel.org
Subject: [RFC] usb: cdnsp: fix error handling in cdnsp_mem_init()
Message-ID: <X9Cd6VGllTSlZtvV@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=2 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090067
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 mlxlogscore=999
 clxscore=1011 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090066
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is just an RFC patch because I couldn't figure out why we were
calling halt and reset so I just deleted that.

	cdnsp_halt(pdev);
	cdnsp_reset(pdev);

This function uses "One Function Cleans up Everything" style and that's
basically impossible to do correctly.  It's cleaner to write it with
"clean up the most recent allocation".  It's simple to review because
you only have to remember the most recent successful allocation and
verify that the goto matches.  You never free anything that wasn't
allocated so if avoids a lot of bugs.  Also you can copy and paste the
error handling from here, remove the labels, and add a call to
cdnsp_free_priv_device(pdev) and it auto generates the cdnsp_mem_cleanup()
function.

There are two problems that I see with the original code.  If
pdev->dcbaa = dma_alloc_coherent() fails then that leads to a NULL
dereference inside the cdnsp_free_priv_device() function.  And if
cdnsp_alloc_priv_device() fails that leads to a double free because
we free pdev->out_ctx.bytes in several places.

---
 drivers/usb/cdns3/cdnsp-mem.c | 36 ++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem.c
index 6a0a12e1f54c..6d3fe72e920e 100644
--- a/drivers/usb/cdns3/cdnsp-mem.c
+++ b/drivers/usb/cdns3/cdnsp-mem.c
@@ -1229,7 +1229,7 @@ int cdnsp_mem_init(struct cdnsp_device *pdev, gfp_t flags)
 	pdev->dcbaa = dma_alloc_coherent(dev, sizeof(*pdev->dcbaa),
 					 &dma, GFP_KERNEL);
 	if (!pdev->dcbaa)
-		goto mem_init_fail;
+		return -ENOMEM;
 
 	memset(pdev->dcbaa, 0, sizeof(*pdev->dcbaa));
 	pdev->dcbaa->dma = dma;
@@ -1247,17 +1247,19 @@ int cdnsp_mem_init(struct cdnsp_device *pdev, gfp_t flags)
 	pdev->segment_pool = dma_pool_create("CDNSP ring segments", dev,
 					     TRB_SEGMENT_SIZE, TRB_SEGMENT_SIZE,
 					     page_size);
+	if (!pdev->segment_pool)
+		goto release_dcbaa;
 
 	pdev->device_pool = dma_pool_create("CDNSP input/output contexts", dev,
 					    CDNSP_CTX_SIZE, 64, page_size);
+	if (!pdev->device_pool)
+		goto destroy_segment_pool;
 
-	if (!pdev->segment_pool || !pdev->device_pool)
-		goto mem_init_fail;
 
 	/* Set up the command ring to have one segments for now. */
 	pdev->cmd_ring = cdnsp_ring_alloc(pdev, 1, TYPE_COMMAND, 0, flags);
 	if (!pdev->cmd_ring)
-		goto mem_init_fail;
+		goto destroy_device_pool;
 
 	/* Set the address in the Command Ring Control register */
 	val_64 = cdnsp_read_64(&pdev->op_regs->cmd_ring);
@@ -1280,11 +1282,11 @@ int cdnsp_mem_init(struct cdnsp_device *pdev, gfp_t flags)
 	pdev->event_ring = cdnsp_ring_alloc(pdev, ERST_NUM_SEGS, TYPE_EVENT,
 					    0, flags);
 	if (!pdev->event_ring)
-		goto mem_init_fail;
+		goto free_cmd_ring;
 
 	ret = cdnsp_alloc_erst(pdev, pdev->event_ring, &pdev->erst, flags);
 	if (ret)
-		goto mem_init_fail;
+		goto free_event_ring;
 
 	/* Set ERST count with the number of entries in the segment table. */
 	val = readl(&pdev->ir_set->erst_size);
@@ -1303,22 +1305,30 @@ int cdnsp_mem_init(struct cdnsp_device *pdev, gfp_t flags)
 
 	ret = cdnsp_setup_port_arrays(pdev, flags);
 	if (ret)
-		goto mem_init_fail;
+		goto free_erst;
 
 	ret = cdnsp_alloc_priv_device(pdev, GFP_ATOMIC);
 	if (ret) {
 		dev_err(pdev->dev,
 			"Could not allocate cdnsp_device data structures\n");
-		goto mem_init_fail;
+		goto free_erst;
 	}
 
 	return 0;
 
-mem_init_fail:
-	dev_err(pdev->dev, "Couldn't initialize memory\n");
-	cdnsp_halt(pdev);
-	cdnsp_reset(pdev);
-	cdnsp_mem_cleanup(pdev);
+free_erst:
+	cdnsp_free_erst(pdev, &pdev->erst);
+free_event_ring:
+	cdnsp_ring_free(pdev, pdev->event_ring);
+free_cmd_ring:
+	cdnsp_ring_free(pdev, pdev->cmd_ring);
+destroy_device_pool:
+	dma_pool_destroy(pdev->device_pool);
+destroy_segment_pool:
+	dma_pool_destroy(pdev->segment_pool);
+release_dcbaa:
+	dma_free_coherent(dev, sizeof(*pdev->dcbaa), pdev->dcbaa,
+			  pdev->dcbaa->dma);
 
 	return ret;
 }
-- 
2.29.2

