Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD49F2D4211
	for <lists+linux-usb@lfdr.de>; Wed,  9 Dec 2020 13:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731286AbgLIMU6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Dec 2020 07:20:58 -0500
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:57460 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731429AbgLIMUw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Dec 2020 07:20:52 -0500
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B9CJRAI010233;
        Wed, 9 Dec 2020 04:19:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=rsFR/jaK51xe+gZ0HA09DWYYvaPAyWV23bPnfmAkgs4=;
 b=dlAdQ0piJIzyJ4OShhtULSiDQgskTti04hK+cVsUD4MadhOGqUUMtvvl8OJRMNEupgUl
 fS0Z7QsW8fkZKHEK1bcIZP//0PRnbzMLW7IHJjqMzMPcDcUN21RKNNN6ylZboJEz/cEm
 4Qb7flfRRw2F+hxjUbfGQi90Fapd7cHtwY8NRpUKJoyasNacBjIzMsoM1brROlx2H2jS
 RqQkQHDbTMovrO8oevxHGZ/xQTLU0s6dP3EXVw9ZgB5HxKT2B+qyAif9Idu0sXvA/oBe
 ZbdjSN3hHJDbWXS7ioQ9V42YOrPGcsVBYjUxDJgKBFn2AHQfka4SN05Ibg0PQjq6UTBj Vw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
        by mx0b-0014ca01.pphosted.com with ESMTP id 3586p44xtm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Dec 2020 04:19:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5RysH/rMbxaqP9c2ENq8xAz35Bi/7lEZN1SEnPZqa9ifzAVwK+SxB1a6xfBtLnFlgiLkybiowLgo2u2llgJYv/8D8zzA/VoxP1n7McLmfepmerBivM5qZmmZbgL9YSLDy/FW4uUUkoALffEbH/NIgibWEM1M3lDPx8ChrjHNsQ5H8MywW6eTOT3Yr5bOVBHDC0mOMHd94qiBtptYnDwyorXLVYTQjPk3Wnu3BURVbvffsGgP2Kdg4rdgd9E16iPt3e3v1j7HXvjGUx9GLtMVWHaHWto6BLKdXnsRt4FWgB5hU3KvfgIfGVi9gER2Cbmn1VC1pU7/IgobKV3LWGQpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsFR/jaK51xe+gZ0HA09DWYYvaPAyWV23bPnfmAkgs4=;
 b=gucTpi8Tax41O10ceodn0aeoimI/j+iHrXO6TcPnJ3rNsD2lwKd3Qa4u3NUWc7T7wRnrBG8qXmGdtzKiwSjg6juAQfNrfvF6YintjRq2E+R+H5KaeVgOeNwmvNoyF0O/o4w+hF6dmSNltkxmYBS+RAczVdOYkpHJ99S7yJBO0dB8L3RLtDCQjn7PbtUePD/ulS1n5294h6qnRTIUy7C6FTB3rbiDiYt2vaiMnlNFErw3Rb0km2KfBfJOZVhxYxo0ivgIyVyDy+HAHc/ty9jAmu5DtpJZVHv/jZi459otUyOjH+OS6Rl/aybYRfII55Hx0KSfm24CxEbVxaPTB9TQXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.23) smtp.rcpttodomain=ti.com smtp.mailfrom=cadence.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=cadence.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsFR/jaK51xe+gZ0HA09DWYYvaPAyWV23bPnfmAkgs4=;
 b=RHejrOZnbU/seUxD8kIpK+k3HFvEvQjsXvqPDvji4CmJMcmemulr7vxezMkJ86VvOv3ClEtXGxk4EQt0WqihH+nGwgXFPI+InpJJ+QbpZUImNv0E9NyUv/ptI1qiWNx9pR0i/PO2GpnMlHSLMwhn1hSW1BFFk+PF5NvdJGvHIYQ=
Received: from DM5PR21CA0049.namprd21.prod.outlook.com (2603:10b6:3:129::11)
 by BL0PR07MB4116.namprd07.prod.outlook.com (2603:10b6:207:45::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Wed, 9 Dec
 2020 12:19:43 +0000
Received: from DM6NAM12FT048.eop-nam12.prod.protection.outlook.com
 (2603:10b6:3:129:cafe::cc) by DM5PR21CA0049.outlook.office365.com
 (2603:10b6:3:129::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.6 via Frontend
 Transport; Wed, 9 Dec 2020 12:19:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 199.43.4.23)
 smtp.mailfrom=cadence.com; ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.23 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.23; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.23) by
 DM6NAM12FT048.mail.protection.outlook.com (10.13.178.173) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.10 via Frontend Transport; Wed, 9 Dec 2020 12:19:43 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id 0B9CJeHX011599
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Wed, 9 Dec 2020 07:19:41 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Wed, 9 Dec 2020 13:19:39 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 9 Dec 2020 13:19:39 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
        by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0B9CJdvU023853;
        Wed, 9 Dec 2020 13:19:39 +0100
Received: (from pawell@localhost)
        by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0B9CJdAH023852;
        Wed, 9 Dec 2020 13:19:39 +0100
From:   Pawel Laszczak <pawell@cadence.com>
To:     <peter.chen@nxp.com>
CC:     <rogerq@ti.com>, <linux-usb@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <dan.carpenter@oracle.com>,
        <kurahul@cadence.com>, Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH -next] usb: cdnsp: Removes some not useful function arguments
Date:   Wed, 9 Dec 2020 13:18:58 +0100
Message-ID: <20201209121858.23792-1-pawell@cadence.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 897b3cd1-064e-4ce5-58b7-08d89c3cb59f
X-MS-TrafficTypeDiagnostic: BL0PR07MB4116:
X-Microsoft-Antispam-PRVS: <BL0PR07MB41166D0D25E9AF3DABA2AAB8DDCC0@BL0PR07MB4116.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oGJiaz9WVHhivOR9TI3fZf9rID746SnVyrzceU4lNGnJpJ79ZMdflE+iPBCWd6YQtXB3Ia/vcOvg6J7JXxkRjt2VEORYTZ7hcBsgPAkLeqMrfsEx+2b2X8XKEAYT4UxTXcd2vBOz2Azp/aDuMWmLp4pzn5j8iOVGinKYrFMoX8GI0CUgIVlsxFQFPG10gLoNm2EYlr7Hy/6Mk8Twz2L6oXqQuDt8AwQ2MC0farhZ2YL1VfdsNGleuXx9MK9UhuoZoOj4lv9dB53b89Y1adErJr9it6qyB+QJbhatkqItgAmkkcabeFwHfRe32G42LFA0vE3a2950kH6KTHrr38pSwyfrfzqPKIHg3OF7P1KixWLb7mnLWdYDWKZK5EjeAIvKBFFIPUtfFtkMAUFTTUrgOX4SmO1JPCskWKPSO+LBwGphGb2qjWyDV8VBFAVadj9empIrRSkYhpNLRxBMRnxVBhjtdYobx+bLyJl5TNd9wxw=
X-Forefront-Antispam-Report: CIP:199.43.4.23;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:rmmaillnx1.cadence.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(36092001)(46966005)(8676002)(81166007)(83380400001)(36906005)(86362001)(4326008)(6916009)(336012)(356005)(54906003)(6666004)(26005)(5660300002)(36756003)(426003)(47076004)(107886003)(508600001)(42186006)(34020700004)(2906002)(70586007)(82310400003)(8936002)(186003)(1076003)(2616005)(70206006)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 12:19:43.1215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 897b3cd1-064e-4ce5-58b7-08d89c3cb59f
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[199.43.4.23];Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT048.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR07MB4116
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-09_10:2020-12-09,2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 mlxscore=0
 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=3
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012090087
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch removes 'flags' argument from some functions and use
indirect the correct GFP_XXX flag to fix the following warning:

'The patch d40a169aab24: "usb: cdnsp: cdns3 Add main part of Cadence
USBSSP DRD Driver" from Dec 7, 2020, leads to the following static
checker warning:

	drivers/usb/cdns3/cdnsp-mem.c:1229 cdnsp_mem_init()
	warn: use 'flags' here instead of GFP_XXX?

drivers/usb/cdns3/cdnsp-mem.c
  1206  int cdnsp_mem_init(struct cdnsp_device *pdev, gfp_t flags);'
                                                      ^^^^^^^^^^^
Signed-off-by: Pawel Laszczak <pawell@cadence.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/cdns3/cdnsp-gadget.c |  2 +-
 drivers/usb/cdns3/cdnsp-gadget.h |  2 +-
 drivers/usb/cdns3/cdnsp-mem.c    | 23 +++++++++++------------
 3 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-gadget.c
index c7c5d0a29f4d..1668f72fdf30 100644
--- a/drivers/usb/cdns3/cdnsp-gadget.c
+++ b/drivers/usb/cdns3/cdnsp-gadget.c
@@ -1824,7 +1824,7 @@ static int cdnsp_gen_setup(struct cdnsp_device *pdev)
 
 	spin_lock_init(&pdev->lock);
 
-	ret = cdnsp_mem_init(pdev, GFP_KERNEL);
+	ret = cdnsp_mem_init(pdev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/usb/cdns3/cdnsp-gadget.h b/drivers/usb/cdns3/cdnsp-gadget.h
index 5f8629eae41f..8eb1b85a08b4 100644
--- a/drivers/usb/cdns3/cdnsp-gadget.h
+++ b/drivers/usb/cdns3/cdnsp-gadget.h
@@ -1480,7 +1480,7 @@ static inline void cdnsp_write_64(const u64 val, __le64 __iomem *regs)
 
 /* CDNSP memory management functions. */
 void cdnsp_mem_cleanup(struct cdnsp_device *pdev);
-int cdnsp_mem_init(struct cdnsp_device *pdev, gfp_t flags);
+int cdnsp_mem_init(struct cdnsp_device *pdev);
 int cdnsp_setup_addressable_priv_dev(struct cdnsp_device *pdev);
 void cdnsp_copy_ep0_dequeue_into_input_ctx(struct cdnsp_device *pdev);
 void cdnsp_endpoint_zero(struct cdnsp_device *pdev, struct cdnsp_ep *ep);
diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem.c
index 6a0a12e1f54c..980047b7e416 100644
--- a/drivers/usb/cdns3/cdnsp-mem.c
+++ b/drivers/usb/cdns3/cdnsp-mem.c
@@ -684,7 +684,7 @@ static void cdnsp_free_priv_device(struct cdnsp_device *pdev)
 	pdev->out_ctx.bytes = NULL;
 }
 
-static int cdnsp_alloc_priv_device(struct cdnsp_device *pdev, gfp_t flags)
+static int cdnsp_alloc_priv_device(struct cdnsp_device *pdev)
 {
 	int ret = -ENOMEM;
 
@@ -693,7 +693,7 @@ static int cdnsp_alloc_priv_device(struct cdnsp_device *pdev, gfp_t flags)
 		return ret;
 
 	/* Allocate endpoint 0 ring. */
-	pdev->eps[0].ring = cdnsp_ring_alloc(pdev, 2, TYPE_CTRL, 0, flags);
+	pdev->eps[0].ring = cdnsp_ring_alloc(pdev, 2, TYPE_CTRL, 0, GFP_ATOMIC);
 	if (!pdev->eps[0].ring)
 		goto fail;
 
@@ -1020,8 +1020,7 @@ void cdnsp_endpoint_zero(struct cdnsp_device *pdev, struct cdnsp_ep *pep)
 
 static int cdnsp_alloc_erst(struct cdnsp_device *pdev,
 			    struct cdnsp_ring *evt_ring,
-			    struct cdnsp_erst *erst,
-			    gfp_t flags)
+			    struct cdnsp_erst *erst)
 {
 	struct cdnsp_erst_entry *entry;
 	struct cdnsp_segment *seg;
@@ -1030,7 +1029,7 @@ static int cdnsp_alloc_erst(struct cdnsp_device *pdev,
 
 	size = sizeof(struct cdnsp_erst_entry) * evt_ring->num_segs;
 	erst->entries = dma_alloc_coherent(pdev->dev, size,
-					   &erst->erst_dma_addr, flags);
+					   &erst->erst_dma_addr, GFP_KERNEL);
 	if (!erst->entries)
 		return -ENOMEM;
 
@@ -1142,7 +1141,7 @@ static void cdnsp_add_in_port(struct cdnsp_device *pdev,
  * Scan the Extended Capabilities for the "Supported Protocol Capabilities" that
  * specify what speeds each port is supposed to be.
  */
-static int cdnsp_setup_port_arrays(struct cdnsp_device *pdev, gfp_t flags)
+static int cdnsp_setup_port_arrays(struct cdnsp_device *pdev)
 {
 	void __iomem *base;
 	u32 offset;
@@ -1203,7 +1202,7 @@ static int cdnsp_setup_port_arrays(struct cdnsp_device *pdev, gfp_t flags)
  * device contexts, set up a command ring segment, create event
  * ring (one for now).
  */
-int cdnsp_mem_init(struct cdnsp_device *pdev, gfp_t flags)
+int cdnsp_mem_init(struct cdnsp_device *pdev)
 {
 	struct device *dev = pdev->dev;
 	int ret = -ENOMEM;
@@ -1255,7 +1254,7 @@ int cdnsp_mem_init(struct cdnsp_device *pdev, gfp_t flags)
 		goto mem_init_fail;
 
 	/* Set up the command ring to have one segments for now. */
-	pdev->cmd_ring = cdnsp_ring_alloc(pdev, 1, TYPE_COMMAND, 0, flags);
+	pdev->cmd_ring = cdnsp_ring_alloc(pdev, 1, TYPE_COMMAND, 0, GFP_KERNEL);
 	if (!pdev->cmd_ring)
 		goto mem_init_fail;
 
@@ -1278,11 +1277,11 @@ int cdnsp_mem_init(struct cdnsp_device *pdev, gfp_t flags)
 	 * the event ring segment table (ERST).
 	 */
 	pdev->event_ring = cdnsp_ring_alloc(pdev, ERST_NUM_SEGS, TYPE_EVENT,
-					    0, flags);
+					    0, GFP_KERNEL);
 	if (!pdev->event_ring)
 		goto mem_init_fail;
 
-	ret = cdnsp_alloc_erst(pdev, pdev->event_ring, &pdev->erst, flags);
+	ret = cdnsp_alloc_erst(pdev, pdev->event_ring, &pdev->erst);
 	if (ret)
 		goto mem_init_fail;
 
@@ -1301,11 +1300,11 @@ int cdnsp_mem_init(struct cdnsp_device *pdev, gfp_t flags)
 	/* Set the event ring dequeue address. */
 	cdnsp_set_event_deq(pdev);
 
-	ret = cdnsp_setup_port_arrays(pdev, flags);
+	ret = cdnsp_setup_port_arrays(pdev);
 	if (ret)
 		goto mem_init_fail;
 
-	ret = cdnsp_alloc_priv_device(pdev, GFP_ATOMIC);
+	ret = cdnsp_alloc_priv_device(pdev);
 	if (ret) {
 		dev_err(pdev->dev,
 			"Could not allocate cdnsp_device data structures\n");
-- 
2.17.1

