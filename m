Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE76036E758
	for <lists+linux-usb@lfdr.de>; Thu, 29 Apr 2021 10:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232455AbhD2IvA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Apr 2021 04:51:00 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:61358 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230071AbhD2IvA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Apr 2021 04:51:00 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13T8ccXW010746;
        Thu, 29 Apr 2021 01:50:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=6ojQBabNu4bMYOA5wVyVeH1bZCK3PqN1N9hfT/L0rRM=;
 b=qLvcCO6Rmu0FE5xad/56V+OQ9ZHJ3E6aseyXKnPZebkbu0gRdqB4nnNU59eDtzgc7Ycz
 yOS+/O9quAVYgfjfYhv9AxZvT94QZj0Uq/LZ5StATZq4h7p8jUnlH/WP/dXtDyiTeSWc
 ISGmt3zdAHAtuqPpxH19Z8MskhdwD/N6ykscyMS04L2ItPZ6GKfJHbAjJPZuqdYRLVGE
 vGy9nj7J2hqpudCTnSHdxubulRnhRS3zRCZV1BPtGh4/PY9qnncVqyXq2J/KC4EdgJLI
 Ee6B8dj3H8OABrazR18oVbNaP5QqFsetuen47pQpt98XHL7jNnD+p3OTIhjw5uZS9TPR Tw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
        by mx0a-0014ca01.pphosted.com with ESMTP id 3873emcbws-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 01:50:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZmitOAtbeZkMC0QLovvUow1g0AwWBmR4yoZQghHQXdnNtnenrmhZ7XAtnTneU4jVTMP+kYrk5XMjAHoXaSUqUKh1qwtl6urede/BPTXNEJaZgaeny3gwOcbnNq67Q20xOkfMcXGWOf/Tz4USiWcY7N+BBhzkBB5NSeh0QYu3KXwXpPJqXPXpOk3rTru+ERPQ2uzda1NAXkqaEfEUVlD4XSupyLOX1Y+dFzyJZ+v8l7C70jEZPxiK5XZh1zLZWl18M3WFx7zulSehJ01UHsRKMeurH0sn6Cb+3HGyJ2n752b7hii0d+5i76XKjpArrjq0lS64aDvkje56OpfsTa32g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ojQBabNu4bMYOA5wVyVeH1bZCK3PqN1N9hfT/L0rRM=;
 b=VxIkQJSkABilrI42XXlTLW9my6FHo/WdcfmxNUB+/ZqREoERjbWwOPeDR6Y0S9xfcA1ckbEn8q6sTgG5lrvGGa+uqwrHKR748XGVJTuhI0PRIKtz6MetgPPU3riIfZnfekB8GEX2MXcexatkQaKFwivlXvS1LUD9ee95jeyrzfN0GmSgd1+/xgpAulR4HjHYzMRsgun2Z/3zzDsNb3230MXBaYEJlg0ZEKiqWigzPn67zM263rpj4yn+Pe2l2za+7JcS+h5HnPOz23o0/1NfdgP2PWafmy1yeeKFDiUX4LnB8mgM27BSQTj9Exb8NqF5vHOZ/h26GRTR9GFS3sLAjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.244) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=cadence.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=cadence.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ojQBabNu4bMYOA5wVyVeH1bZCK3PqN1N9hfT/L0rRM=;
 b=mcDn+Yp8HLXsA9Usb6c6fKW+a9agj2LzkpkJZWcTHSbfPAg31+Gh/bAduneUEtDv7hfkovZOINAK74PwUofRDNaUtoBZ//03xOdfvyKw0KLqBoyCBU5pXJn8CF965UHG09TyU/2T/ZKWlDlYP+7jzkyFxswpBQGb72irpacsDvw=
Received: from CO2PR07CA0052.namprd07.prod.outlook.com (2603:10b6:100::20) by
 BN7PR07MB4657.namprd07.prod.outlook.com (2603:10b6:406:f1::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21; Thu, 29 Apr 2021 08:50:05 +0000
Received: from MW2NAM12FT045.eop-nam12.prod.protection.outlook.com
 (2603:10b6:100:0:cafe::3a) by CO2PR07CA0052.outlook.office365.com
 (2603:10b6:100::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Thu, 29 Apr 2021 08:50:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 64.207.220.244)
 smtp.mailfrom=cadence.com; linuxfoundation.org; dkim=none (message not
 signed) header.d=none;linuxfoundation.org; dmarc=pass action=none
 header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.244; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.244) by
 MW2NAM12FT045.mail.protection.outlook.com (10.13.181.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.16 via Frontend Transport; Thu, 29 Apr 2021 08:50:04 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id 13T8o26r099131
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 01:50:03 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Apr 2021 10:49:49 +0200
Received: from gli-login.cadence.com (10.187.128.100) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Thu, 29 Apr 2021 10:49:49 +0200
Received: from gli-login.cadence.com (localhost [127.0.0.1])
        by gli-login.cadence.com (8.14.4/8.14.4) with ESMTP id 13T8nmqV013584;
        Thu, 29 Apr 2021 10:49:48 +0200
Received: (from pawell@localhost)
        by gli-login.cadence.com (8.14.4/8.14.4/Submit) id 13T8nmNg013514;
        Thu, 29 Apr 2021 10:49:48 +0200
From:   Pawel Laszczak <pawell@cadence.com>
To:     <peter.chen@kernel.org>
CC:     <gregkh@linuxfoundation.org>, <dan.carpenter@oracle.com>,
        <linux-usb@vger.kernel.org>, <kurahul@cadence.com>,
        Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH] usb: cdnsp: Useless condition has been removed
Date:   Thu, 29 Apr 2021 10:49:14 +0200
Message-ID: <20210429084914.12003-1-pawell@gli-login.cadence.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c925ae14-1849-4adc-ad6a-08d90aebc844
X-MS-TrafficTypeDiagnostic: BN7PR07MB4657:
X-Microsoft-Antispam-PRVS: <BN7PR07MB4657A79E89635963915CA0F9DD5F9@BN7PR07MB4657.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:62;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bjxwl/haorTM2F/huzf2wcTV0ElC+aaus+b0c/LhUOcr1CflZ7K1mJXU+4rFdKStYIJN8gCTzusOp5QaIcNDC1Xexpxa29Z7R+Pz8pyhhMnvZ9yEUqjAIVWqzcQHa3Zb0hTSWLQGaGc9HOL7L/7So5vC/e2vFwzS/XMIw2hER/4hb/7OsOlhMeUpy3v/1LtmSHoCPlopJOGQESccvdfNKNUu6taca6axE36i2gFFRf/hMVrgCU9+lu8L82Iy4mWoL8zNGHABgyvWSItqGy2BiY/UB5m8/N18wvnrKhCoFN67JhZzTfclI1XaKjzyRMvsjPVzAHTGQEUdXSbw2Em80aT6FUOp7b3rC4HMg0XwtxM6H5wgQvmgZY2IEQcqCa8bjjMO89+hwwNeptyE9Qzr7kYChgU0qZkNnZ3zgZMP/pvz7vQnn52f3TPWenlThUL6nHppse2+VIScqv9n6vlhajkb5UbkU7jrBDaaBpm7cZZE+yS4OUsrEM+Bi8g37W64BzXRsBOODA2HoJjqvSlJ+WIjJfU7YRUAFHMviipTn2iz4RY8H6+oI6OB2pz2l0NBhbQRyWKutZ2O/jdk/Vta+QI+ZyBFTw4hd5klt89/Qoq41BYLNj7BRneQnfvSXJ99ScaH4za0Fty6M23VKLf8kG/t7lecm3yXShrrFlKKI6uewYpSeFst7PXE32K/uU7/7dfQKc2ZgBb/+uvDdHR07g==
X-Forefront-Antispam-Report: CIP:64.207.220.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:wcmailrelayl01.cadence.com;PTR:ErrorRetry;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(36092001)(36840700001)(46966006)(42186006)(107886003)(81166007)(336012)(6666004)(316002)(82310400003)(426003)(26005)(186003)(83380400001)(6916009)(4326008)(47076005)(36906005)(82740400003)(2906002)(8676002)(54906003)(5660300002)(478600001)(4744005)(1076003)(86362001)(70206006)(70586007)(36860700001)(8936002)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 08:50:04.2662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c925ae14-1849-4adc-ad6a-08d90aebc844
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[64.207.220.244];Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT045.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR07MB4657
X-Proofpoint-ORIG-GUID: D5OyCaUTsb6OlDgZ4I5PnepRZAU86aXq
X-Proofpoint-GUID: D5OyCaUTsb6OlDgZ4I5PnepRZAU86aXq
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-29_05:2021-04-28,2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 bulkscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 mlxlogscore=712 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104290062
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Pawel Laszczak <pawell@cadence.com>

Patch removes the warning "variable dereferenced before
check 'pdev->dcbaa'" from cdnsp_mem_cleanup.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 drivers/usb/cdns3/cdnsp-mem.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem.c
index 5d4c4bfe15b7..a47948a1623f 100644
--- a/drivers/usb/cdns3/cdnsp-mem.c
+++ b/drivers/usb/cdns3/cdnsp-mem.c
@@ -1082,9 +1082,8 @@ void cdnsp_mem_cleanup(struct cdnsp_device *pdev)
 	dma_pool_destroy(pdev->device_pool);
 	pdev->device_pool = NULL;
 
-	if (pdev->dcbaa)
-		dma_free_coherent(dev, sizeof(*pdev->dcbaa),
-				  pdev->dcbaa, pdev->dcbaa->dma);
+	dma_free_coherent(dev, sizeof(*pdev->dcbaa),
+			  pdev->dcbaa, pdev->dcbaa->dma);
 
 	pdev->dcbaa = NULL;
 
-- 
2.25.1

