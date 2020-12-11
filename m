Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C22532D731A
	for <lists+linux-usb@lfdr.de>; Fri, 11 Dec 2020 10:53:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405697AbgLKJwb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Dec 2020 04:52:31 -0500
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:61336 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2405709AbgLKJwL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Dec 2020 04:52:11 -0500
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BB9neax001781;
        Fri, 11 Dec 2020 01:51:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=0IHikRb0E8QgTECaU8nr85rjya3q7kbPeMXhfv0S2W0=;
 b=JKNEtxh+gKOZZuh+L61YbAqbAQIdV/WnvQuLlnDlUt9A94QcCpCdad5P/HZ813Wa74b+
 TPMq9MZDSdmse7dPV+Azo//VwnREEBS1CQV4NAzQsD9bV0cx9A2O9XZiy2/6EdoGaWQt
 TT+9QxD6jJXvrrA+BcXP8zcyebk7xgV4TMGhRFeE2rklgrWRwCMYANZURsLbhqVvOr3b
 jR5MHv4+qcbcrz3isQfnxNL0H8i8v/8bjGJrqlu1VOZOZjSqNDUK5AHKY64e6zWra9HP
 mGk5mRBvexFyXaEXXGKnyTvQk8hvqw5XJYh8IXTWgColkFKxfWY5CBBZDxiwomo0YErX Ng== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
        by mx0b-0014ca01.pphosted.com with ESMTP id 3586p4d9t3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 11 Dec 2020 01:51:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wb6wdBpNOXYqamB6Kv3ZnYUc75YqKt+f5/6oJAF68RG+gLu7rSppJW+avdRVLuq3VD9Fq/VViK5c5+oUiBC+4/Yvs+t1XedJraWqVU8uaMn2gXdlaF/N3m5rCiHgRo/AGYvkMIBMppNGqgCvUC4eQ6hKwYPO5kB/CiyP8M2l7kgENIIgrlhJfF/otkTojbgIudknTtT+mtEIfc5GXbakvj8ww/7EsegT2q8RRKuPZLOWh9VRuH0canfA3fl788BLWlTC5IEeNhUlALCNLTgr+XzVUHpSEXWTbJrKjIKg8vf4ypJWieN8n2A9Yj0cf0njniWbjTma1LVcr9qfANU31A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IHikRb0E8QgTECaU8nr85rjya3q7kbPeMXhfv0S2W0=;
 b=llQGCwJ3JPX0OVTq11VpxzJBH2flRTM88ZRSZVlyYE/3lg6E52dz9U2Vq6hMrgyHkE8uLtEs2pZ1UNT80WqrmGUlhCG5fE+cMxfH4tR6xn8JVq9PxSLzRflcLLLloDIIMANUJlgrFE1IdRJm8GHbWWIs2jqYKbHQJgMn+W6DEZ5gu1ADPVaj/cGbzTuNsCjqNhPGpKPjI5VGtePy0JJEtAvk8xPCLxY7jJ5YLr5Tdq2t7cHyWbBVkGY8Xl4DI+tOJaNpCeeGDlLZSziCxWPs1z6CvIOfjqpnNXTJ/ETbgsuKvN1PdGfdhypKNtP7ifU6gMtYQ8EROWkiWHzlALj4HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.23) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IHikRb0E8QgTECaU8nr85rjya3q7kbPeMXhfv0S2W0=;
 b=MPDhqE5GVKmNTpieu0KcGlliWpfzxx8fsQpIywJy+fZfxPJIag2O7LcaaQnvgQm5QcrdObwSBoercqtq7YCEVwOiojVMYEqtWuFOScWpVC7ReXTAYIhL100WaW8opjhJ4OxqLIlnLYzQXm68A4vtU7M6jrefYi4NLQ+5upIfi7s=
Received: from DM5PR07CA0090.namprd07.prod.outlook.com (2603:10b6:4:ae::19) by
 MWHPR07MB3151.namprd07.prod.outlook.com (2603:10b6:300:de::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12; Fri, 11 Dec 2020 09:51:15 +0000
Received: from DM6NAM12FT026.eop-nam12.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::f7) by DM5PR07CA0090.outlook.office365.com
 (2603:10b6:4:ae::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Fri, 11 Dec 2020 09:51:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 199.43.4.23)
 smtp.mailfrom=cadence.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none
 header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.23 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.23; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.23) by
 DM6NAM12FT026.mail.protection.outlook.com (10.13.179.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.10 via Frontend Transport; Fri, 11 Dec 2020 09:51:15 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id 0BB9pBJr027665
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Fri, 11 Dec 2020 04:51:12 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Fri, 11 Dec 2020 10:51:10 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Fri, 11 Dec 2020 10:51:10 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
        by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0BB9pAfr002066;
        Fri, 11 Dec 2020 10:51:10 +0100
Received: (from pawell@localhost)
        by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0BB9pAds002060;
        Fri, 11 Dec 2020 10:51:10 +0100
From:   Pawel Laszczak <pawell@cadence.com>
To:     <peter.chen@nxp.com>
CC:     <linux-usb@vger.kernel.org>, <gregkh@linuxfoundation.org>,
        <kurahul@cadence.com>, <dan.carpenter@oracle.com>,
        Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH] usb: cdnsp: fix error handling in cdnsp_mem_init()
Date:   Fri, 11 Dec 2020 10:50:53 +0100
Message-ID: <20201211095053.1948-1-pawell@cadence.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c989ed9-081c-4d9d-72fe-08d89dba4d01
X-MS-TrafficTypeDiagnostic: MWHPR07MB3151:
X-Microsoft-Antispam-PRVS: <MWHPR07MB31516BA3FD92D398CA49A0B1DDCA0@MWHPR07MB3151.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bh8td9jT5iDrS/rMZLgNJ8TrWILu3Vva9lHBflJWhcaR+kU1PUiQFnSBpRbCsGz6VcAaYySPhIMQf+M3Q4+aqBFxslz7iEslMldanpu2B1Q0+zfDMYASoB5ejL2XxudrXedyVq2wC+kZrR0m06/hm6eV+YP0qT977UkJX1BYuXfc3U2qQFMPQIBvlrpz7PSiaBK9OhbR8sVcwh75EAB3/N93NItbJOUEQ21ua70Dzf9aurUDLh/yFIaqpkR5rzfOr52nxc4PmMzWZJ1A9f+XB3wB26azAayanix8bWcOLY4QC7e/mwKJxw7w8rUtXB61iJ/YFGYjB1Pi/xHroB0k2EC6mkI/FxaY5e/fE2PzlN945W/rbtEUIH5oL0jzFO9KQJ+2RYlquL518cC89Ux3oWPVXIOWb6d6zPRJEYEUQ9NTLrAwYgY5bUOPUfX/M3gUlVGg+YJduETvY9hwA5IV6g==
X-Forefront-Antispam-Report: CIP:199.43.4.23;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:rmmaillnx1.cadence.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(36092001)(46966005)(4326008)(6916009)(1076003)(8936002)(34020700004)(508600001)(2906002)(107886003)(6666004)(42186006)(36756003)(54906003)(2616005)(5660300002)(70206006)(426003)(356005)(47076004)(336012)(186003)(82310400003)(86362001)(8676002)(70586007)(36906005)(26005)(83380400001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 09:51:15.3354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c989ed9-081c-4d9d-72fe-08d89dba4d01
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[199.43.4.23];Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT026.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR07MB3151
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-11_01:2020-12-09,2020-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 mlxscore=0
 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=3
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012110060
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This function uses "One Function Cleans up Everything" style and that's
basically impossible to do correctly. It's cleaner to write it with
"clean up the most recent allocation".

Patch fixes two isues:
1. If pdev->dcbaa = dma_alloc_coherent() fails then that leads to a NULL
   dereference inside the cdnsp_free_priv_device() function.
2. if cdnsp_alloc_priv_device() fails that leads to a double free because
   we free pdev->out_ctx.bytes in several places.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Pawel Laszczak <pawell@cadence.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Tested-by: Pawel Laszczak <pawell@cadence.com>
---
 drivers/usb/cdns3/cdnsp-mem.c | 36 +++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem.c
index 980047b7e416..4c7d77fb097e 100644
--- a/drivers/usb/cdns3/cdnsp-mem.c
+++ b/drivers/usb/cdns3/cdnsp-mem.c
@@ -1228,7 +1228,7 @@ int cdnsp_mem_init(struct cdnsp_device *pdev)
 	pdev->dcbaa = dma_alloc_coherent(dev, sizeof(*pdev->dcbaa),
 					 &dma, GFP_KERNEL);
 	if (!pdev->dcbaa)
-		goto mem_init_fail;
+		return -ENOMEM;
 
 	memset(pdev->dcbaa, 0, sizeof(*pdev->dcbaa));
 	pdev->dcbaa->dma = dma;
@@ -1246,17 +1246,19 @@ int cdnsp_mem_init(struct cdnsp_device *pdev)
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
 	pdev->cmd_ring = cdnsp_ring_alloc(pdev, 1, TYPE_COMMAND, 0, GFP_KERNEL);
 	if (!pdev->cmd_ring)
-		goto mem_init_fail;
+		goto destroy_device_pool;
 
 	/* Set the address in the Command Ring Control register */
 	val_64 = cdnsp_read_64(&pdev->op_regs->cmd_ring);
@@ -1279,11 +1281,11 @@ int cdnsp_mem_init(struct cdnsp_device *pdev)
 	pdev->event_ring = cdnsp_ring_alloc(pdev, ERST_NUM_SEGS, TYPE_EVENT,
 					    0, GFP_KERNEL);
 	if (!pdev->event_ring)
-		goto mem_init_fail;
+		goto free_cmd_ring;
 
 	ret = cdnsp_alloc_erst(pdev, pdev->event_ring, &pdev->erst);
 	if (ret)
-		goto mem_init_fail;
+		goto free_event_ring;
 
 	/* Set ERST count with the number of entries in the segment table. */
 	val = readl(&pdev->ir_set->erst_size);
@@ -1302,22 +1304,32 @@ int cdnsp_mem_init(struct cdnsp_device *pdev)
 
 	ret = cdnsp_setup_port_arrays(pdev);
 	if (ret)
-		goto mem_init_fail;
+		goto free_erst;
 
 	ret = cdnsp_alloc_priv_device(pdev);
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
+
 	cdnsp_reset(pdev);
-	cdnsp_mem_cleanup(pdev);
 
 	return ret;
 }
-- 
2.17.1

