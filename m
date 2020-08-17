Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6115B2463B0
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 11:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgHQJqq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 05:46:46 -0400
Received: from mail-am6eur05on2050.outbound.protection.outlook.com ([40.107.22.50]:21473
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726424AbgHQJqm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 05:46:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjdFpegxMBKk4m9RostACyAypNqtSL7RLi7xOcWjD1Y2pXvyp8HVGGs2h0mtF/H6PKe7ERUdNSMk1aDSUtmBkfVxhhYT6jPHKa7e22sHAATQV0Zwc3VDXk1ISN8wI8ywGkHKVrLeiiPuIv9hnUOVi+Q6DuI3drpqtb/bVMFoubNgHeJYix3K1lsC9AolKvn8iNWsTLpJzB6m3lgZsScOLoZ3jDWtLVdLqMC5aUjtnNTjNkYmjyFCVNgZXkPlLmmmmqrVqoNPFoBbVcO9sdXhU2lFECAq2dfyDIu/mJI+e8mx2x7RYcSBL5npEJ8fraC4/Q+vZnIGoWj6FS5B48Lcfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgcZaYgbuwiFbGdaBEIDLaAnrZSORHj5FtQlfngPczQ=;
 b=C+T14CBUZ8BxCx526bkiAI1yUCnrNlLnIOT4az/tAMGIw9rAciO6axViwtNs6klV4ZzY5T+e9EAH6fiM2VK8GPv9oNlC75ABJicbbQYtWVycBCRvPJyZqpliCBOK7QPtjgBty56Er81VYOV8NR/Qp3vthou3HT5TPadRGEztLb0AAzyURqDGrbzYhHY2XW0DyH1W59BLbltw/tw0WU7htjvh8CtlJe599rG0emSG226uWyZJHlJFWdKMfDFNLV0rtDmTmPHC4p9tLjWS2LIBbMue3KFjTEUlXp7j6Nz9cZn+89rFQHALRliFilpVAv+NcUHbTk8Mf+6NWP4PuY26xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgcZaYgbuwiFbGdaBEIDLaAnrZSORHj5FtQlfngPczQ=;
 b=mEEbQzIHKtVgHW9law60UVn73hrqOEAk3lfc5Es11jCgfYx86D59TZgZXhvkct0Zfmf2nxChEMQBXcVp5dgluxjPj3l8+kdM8TSEzLaPYTyum2pGAb4ZE+K49RCK+8zCj5quMX/dl+cyT61mmC8di5NR1GqaMdHt+97wB6X22EU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.26; Mon, 17 Aug
 2020 09:46:02 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3283.028; Mon, 17 Aug 2020
 09:46:02 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 5/7] usb: host: xhci-plat: add wakeup entry at sysfs
Date:   Mon, 17 Aug 2020 17:44:38 +0800
Message-Id: <20200817094440.23202-6-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817094440.23202-1-peter.chen@nxp.com>
References: <20200817094440.23202-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0094.apcprd02.prod.outlook.com
 (2603:1096:4:90::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0094.apcprd02.prod.outlook.com (2603:1096:4:90::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Mon, 17 Aug 2020 09:46:00 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e1f033fb-cb0f-496a-fd95-08d842925a2a
X-MS-TrafficTypeDiagnostic: AM7PR04MB7160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB7160FC9A438F1C69F1755F548B5F0@AM7PR04MB7160.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 28dZFsL2tKYeVIWhfNIvn1pa1PSDElgRjNgG4wLaKwYuTSvMSWPArAQLIFiDukH0Z+NF3QzH1QOd9kXs+km6MwTbbPZquys09gdV5fPeXt9IvuwCjRZUDJm3BjA+obpAbxuyYEYz1xbcDDI3/Pw1OLNkA4XWZPy33jgddnL0+atE0XkOCCpCKy9qJUNvbTcC35itMQvPWkuLAKZQZ96dMLQEx2l39phsm63DbKQem90+hwusG1WrI3ahNtuAzzsn6ezqzyXS/UNw1gZRSbgshHfpzHLtx+O995ghmvtgJcFs2z+waW9RuN3b4WY5/aSR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(6506007)(6666004)(4326008)(66946007)(1076003)(2906002)(16526019)(5660300002)(4744005)(66476007)(52116002)(6512007)(6486002)(66556008)(26005)(186003)(478600001)(83380400001)(8676002)(2616005)(8936002)(956004)(44832011)(316002)(6916009)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: imH/dUSAGtxmzyXFQYOosdJc/iXazu/2sdXt5JLKET7WkmuJ/JjTyv1BejWTsMZ/cSfhyR6GMUA6Sea8NI4LxcECh7Dp9Stk2qeiVvW6j/hyYXhJ5gMjhlEQKbVs1Qwtf1jLHuF+a/AmcqGcFCLc5tJyDnvqYOO27r3SZSF6oqISZJJ+sJaOmORx6dtxszEQ+xvxLrgl5SHK06blwuk56iVPApQ6mWPyzIp/Rqwi+/F87xRVDOBzU3+uSIALxcqUyl0+JH5q45GDs5SkLhiFMjNQ3wsdC5ssnrDlNYivZOIr77f1lbiersbrfpfFv13zS+chu5joZaYSOOFAT6rT9IdPEgkYyJG7cujUAGX68tZzZ4sVwEfRRyupq0OOsZBELQzyU2H/r/NUOK39iipJamVYCSLR7EGhJ9s4Ay5d1yesOAzSWKC60Tl+yX0VEhVMB6ckhkvcRyVeZRQ8EvdpiGJoyqUAQHTCvNGse0Qj97qYkdIRnxk9Ea4QF/8cgkd+mpAYoj3elMBPkC6Pg8gWUbECh01/PGwNXvEQ66rk1+kuxhBxq6uUP06bhcbuMEpJNr5D5Z90USdQ2WK86T7fzHmF0Y+4YqnuupIWumyY81C+SQtDw37h17W4nnFhZRsaszhKzZuFJkc4SX59lHHfUA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f033fb-cb0f-496a-fd95-08d842925a2a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2020 09:46:02.1964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ji7JCv3o1XY3pL7i+TMB+zgPkfSfv329V4szoSu3DfjqPnU/eyPx89T2lLNaEwC+QYzFESowIYp0lQyBgHnkUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With this change, there will be a wakeup entry at /sys/../power/wakeup,
and the user could use this entry to choose whether enable xhci wakeup
features (wake up system from suspend) or not.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 14ff65a387e8..cfca6fc8947c 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -287,7 +287,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		*priv = *priv_match;
 	}
 
-	device_wakeup_enable(hcd->self.controller);
+	device_set_wakeup_capable(&pdev->dev, true);
 
 	xhci->main_hcd = hcd;
 	xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
-- 
2.17.1

