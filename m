Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1BFF3734D0
	for <lists+linux-usb@lfdr.de>; Wed,  5 May 2021 07:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbhEEGAZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 May 2021 02:00:25 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:52956 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229592AbhEEGAW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 May 2021 02:00:22 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1455nUa7028461;
        Tue, 4 May 2021 22:59:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=Uj9KpWmYhwsg1xOBz1n1RqtDRgGWzpi71GHLc9QFKgs=;
 b=dLpZVF8N531t6xFmgQac/v7nm0gz2ll2t+Duz8/shxeZuOb1pKVwIfF+j7wA3K8qucgV
 zNmKDDmUJD0jlrOF6wtNz44a48HpULLj4vkaE18xc6YIPPCWW2UXxhd1yblRE5QPSAXN
 S6Gbk//dPYkjx0lwH5Rh9A8h8tSaSfkNZZoIg3Eykdt7sZ+dZhcJx1nwBARoF2XTM5GA
 7kJwuZ+DL0xN+ih1gUMzH5FK+s2HHbV7FyUuZnFExpDgr4n+R4Zx30voPKF7bRxOs3GK
 SDWgFlrMQFZVZJv8X9Lxo1Mksjk5fAKVxz+KzKCXV025T+CoBHMOYJgus2I8K+HqvjSQ JQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
        by mx0b-0014ca01.pphosted.com with ESMTP id 38bec493jd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 May 2021 22:59:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T223f9S2n3eukEfHgVzR7GUPIzAYoOZnHW4MfRfiWNjMwV6YUVV7cF9CgZR5RVqyRxOhkHG8Z2tlzoYXjyS5QZvOoYg8Mj3jWyNKdiGqHnpo6U01sLJGL6ZBGFfrIZdej8DdnUPi9dwxvyFBcEkbZKwHBt6gduhG9CLpX2oCHSVGhFWaMueMAJi2PcrKIo/ms9/sjoNz4Hel72466irK7H1wqKuzQvX6YlpYwNNCrmJotKd2cGig3agU3tlAdxesCcLC5EY7ZacIDyzOsufpbZu7klPIsd7qgTQ6AXLeiyuLRYiVtt2i26tli33vvRL/JnQUk2RU2/XwJpv/tQ6oSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uj9KpWmYhwsg1xOBz1n1RqtDRgGWzpi71GHLc9QFKgs=;
 b=VrlwbSF+sCIa1rHIEjRRaFIaQNAXQijbN1KKtS3J7R78KR8vVPoLV39sK+oxDgEjNaFWEvGbX3P5Vdp/IrFr6IsPZwG5M9+vWoJwgmqfn8nAx9uiMpf8xAJXQwzferbl6+veWW+xJ4yveMBGeDzdDOFULyzGPEmNeshl9oxkTnAWbszKEx9WARz7vMmMvzRdWV2WXvQGBUwt9ZzC/+lCSM9W7w35o6AtpMJT30F8qJb+a++wchfghchW19KKpDqXlOzxcad6tfsPwN9uUksIz5Z/08hZC33gRdykav7bPqaSh8JvsBq3qlBbKRdCyshv8au2lzsiudxjKMOam1S8TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.23) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uj9KpWmYhwsg1xOBz1n1RqtDRgGWzpi71GHLc9QFKgs=;
 b=cbAfCtHITdRmFiCcPLP/44pwXkXeaAfQkWxyFMMjWPoGPbI+IhXyc3tTF5LG8qmLmVJDzkbJd4Ub5A8qXviCupyhsHa07v3DHNVwnhiTSElGI4AhOkuEIVX7aztBL8J6C4LpDBFYqM/qd7rK5rD3nftQ7HTueohmbGRLOX9izNs=
Received: from BN6PR1201CA0006.namprd12.prod.outlook.com
 (2603:10b6:405:4c::16) by DM6PR07MB6491.namprd07.prod.outlook.com
 (2603:10b6:5:1c2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Wed, 5 May
 2021 05:59:18 +0000
Received: from BN8NAM12FT046.eop-nam12.prod.protection.outlook.com
 (2603:10b6:405:4c:cafe::e7) by BN6PR1201CA0006.outlook.office365.com
 (2603:10b6:405:4c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.29 via Frontend
 Transport; Wed, 5 May 2021 05:59:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 199.43.4.23)
 smtp.mailfrom=cadence.com; linuxfoundation.org; dkim=none (message not
 signed) header.d=none;linuxfoundation.org; dmarc=pass action=none
 header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.23 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.23; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.23) by
 BN8NAM12FT046.mail.protection.outlook.com (10.13.183.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.8 via Frontend Transport; Wed, 5 May 2021 05:59:18 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id 1455xGkb020669
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 5 May 2021 01:59:17 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 07:59:16 +0200
Received: from gli-login.cadence.com (10.187.128.100) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Wed, 5 May 2021 07:59:16 +0200
Received: from gli-login.cadence.com (localhost [127.0.0.1])
        by gli-login.cadence.com (8.14.4/8.14.4) with ESMTP id 1455xFEB040939;
        Wed, 5 May 2021 07:59:15 +0200
Received: (from pawell@localhost)
        by gli-login.cadence.com (8.14.4/8.14.4/Submit) id 1455xFcN040896;
        Wed, 5 May 2021 07:59:15 +0200
From:   Pawel Laszczak <pawell@cadence.com>
To:     <peter.chen@kernel.org>
CC:     <gregkh@linuxfoundation.org>, <dan.carpenter@oracle.com>,
        <linux-usb@vger.kernel.org>, <kurahul@cadence.com>,
        Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH v2] usb: cdnsp: Useless condition has been removed
Date:   Wed, 5 May 2021 07:58:54 +0200
Message-ID: <20210505055854.40240-1-pawell@gli-login.cadence.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a83689fa-00b8-412b-8d0d-08d90f8aebaa
X-MS-TrafficTypeDiagnostic: DM6PR07MB6491:
X-Microsoft-Antispam-PRVS: <DM6PR07MB64911FEA8FB9F55DBD376498DD599@DM6PR07MB6491.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:308;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p/gFiRkH4v1jBhW6TVphpAWJn/Ym415vBKvC5K7vvw1LGv8pZ3v8jULWO5fJ+VK1L+p+Tv9xqQp0UgjZbylsSglrg0uWcnxSUQVoJv5ODbd9Fp6AEUZfvj7WurbT93tTo0zCnwYSFSHRT4mJb5HwkcSXcthvCHQ0dAihPz4m1dqBo94g85HxVYY2hEKXqgOQllFV0NtZEMGSndeEs0p74Lzuk9Be+CgLGMlRaHJdqwq++5I/yU2qdzugzy57s3io8yMJIhJ5FpNz9OYoC5wV9RPIPUo0BPpi6wpvA1Tv98EtpHOj0kQG0+TIv1gNgg6Wqea/Q6gan2TkD/abzZxul3ql2CzYbeQUZGk56d2HC+yf2wOSFdzlV58rRHa0q814panjTUMOOsfcKM+4eiwgP31ZWONvzFN/ouwh8u2R3nFDAo1QyPxarTDImG/5z9sDaKUdG9Ubu673cSYN5/BCWAvwr5EJyfL1X1GBPhzP/XPp5Q1yV76zzefqXE/qAnjuaTZN5Y/7m5ZvcFRef02ECrB9g7DPyV9Z7ueU1bvvj0X6K+29BXnBCKpX85srBzelNHoj2bMFFuLND2/aJYEaDV2s3G7bctdHFBiJgf+C8E2krBi1qGuqNAdE/AHq93iNgVmk3uK0wAXKNBARqTyyK893pBxzRWkyZmzHpEsE2mFYHjS6GuAnJQ9iNCIRFzUCgM89MvtsPwGA6oXmczO7/Q==
X-Forefront-Antispam-Report: CIP:199.43.4.23;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:rmmaillnx1.cadence.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(36092001)(36840700001)(46966006)(70586007)(356005)(82310400003)(70206006)(36860700001)(478600001)(426003)(54906003)(47076005)(1076003)(8936002)(6666004)(5660300002)(6916009)(81166007)(4326008)(82740400003)(36906005)(2906002)(336012)(316002)(42186006)(83380400001)(86362001)(186003)(107886003)(26005)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 05:59:18.3122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a83689fa-00b8-412b-8d0d-08d90f8aebaa
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[199.43.4.23];Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT046.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6491
X-Proofpoint-ORIG-GUID: XAbCzX_2eR5TU596SBvRy1CNTVXDtU7t
X-Proofpoint-GUID: XAbCzX_2eR5TU596SBvRy1CNTVXDtU7t
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-05_02:2021-05-04,2021-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 mlxscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2105050042
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Pawel Laszczak <pawell@cadence.com>

This code generates a Smatch warning:

drivers/usb/cdns3/cdnsp-mem.c:1085 cdnsp_mem_cleanup()
warn: variable dereferenced before check 'pdev->dcbaa' (see line 1067)

The unchecked dereference happens inside the function when we call:

cdnsp_free_priv_device(pdev);

But fortunately, the "pdev->dcbaa" pointer can never be NULL so it
does not lead to a runtime issue. We can just remove the NULL check
which silences the warning and makes the code consistent.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Pawel Laszczak <pawell@cadence.com>

---
Changelog:
v2:
- updated commit message

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

