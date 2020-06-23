Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7D22047D5
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jun 2020 05:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731663AbgFWDKD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jun 2020 23:10:03 -0400
Received: from mail-eopbgr20065.outbound.protection.outlook.com ([40.107.2.65]:24290
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731577AbgFWDKD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jun 2020 23:10:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/mvZe/70gIr4pTgN7qd1NgbhHwBZiYHRgP8Ec61XmUxaNXBKHocDXBzLdwZX72lWJIdL7hh5ywNUw/UbzDkd5kroEPvJBYrC4LC3K1TYPKFsjTf0NenWpkOWRbBJ7jgEUSNkHDVEXYqIbjuBm7xHNibusBFFS+JhF7AzUe/TlvJdcEB/CwFMT1wapxxzmpjkUDcLCFjTQKkLz2SROxb0bSsn1gwqL8CO7EwoxcEfNvwdd7PC67N1kIf5zHsLE47R5BSbcUg/Go1YM+zMGpm+AEcLC3AN9gUZW8bGThT/Y4EDmgnLiDlr9riUjiI7LqgcyYXTxFs62ghk8iR935nKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98DvoY04b1kLY7SCtg8HEMMGNMVxaIBn0yg26/pUsSU=;
 b=DIk6/JbxOQqxHERNEqMEYnyrT1G+l0zd++20CmsPuiwodtnmdqVetM64DmUs6ZP85afZ6TLYhY/vVslwwb6K/hNSS3vz5dnzNo3N6rUxClwFhzPz3JppqN5rRBdk4JXqIoi+LBmohFboPlQSI45OWnR0nfXQoMGlzXgLCMFNzIrTjX2MluOh1Kzdd4cYU4b8qFPMMibt+qtq/eRdzGT1wF8XpS5nJHnxbQQwcAcFbhB4LUtlWJGDdrJhOvQ84C/2Jj3rMaasiDg1eE4DWsRQS1kajhkDNTofwb9xUs3b/o2+ttDubNjYagtDaKzvmSJnxGjJYEOpoAZasmOqWajqeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98DvoY04b1kLY7SCtg8HEMMGNMVxaIBn0yg26/pUsSU=;
 b=pRTOXIYU/QmNbdliGFwsqSW7teWGiGcPcd7IuLA84WgLN6giJbAeGLvaIxnA+vwYSW5CXw5ndyIzJJHAwbBFACzProCgWUkDtlr0OOJpBWFNlaAnonzZp8dygE3WmjH6wFVspS11SjHRPT4iw/TCj9ZEK/+H6avw2YDQE87Gw2I=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6854.eurprd04.prod.outlook.com (2603:10a6:20b:10c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Tue, 23 Jun
 2020 03:09:59 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 03:09:59 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 3/3] usb: cdns3: gadget: use unsigned int for 32-bit number
Date:   Tue, 23 Jun 2020 11:10:01 +0800
Message-Id: <20200623031001.8469-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623031001.8469-1-peter.chen@nxp.com>
References: <20200623031001.8469-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0401CA0015.apcprd04.prod.outlook.com
 (2603:1096:3:1::25) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR0401CA0015.apcprd04.prod.outlook.com (2603:1096:3:1::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Tue, 23 Jun 2020 03:09:57 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b287ab7f-0cc5-4152-77b1-08d81722ea0a
X-MS-TrafficTypeDiagnostic: AM7PR04MB6854:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6854E25D6F83F0A941DC08C18B940@AM7PR04MB6854.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 04433051BF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aTO1fv3fidyqEhG1k9FZPctknxNsrarJSW7iElE+cjz7OxJZjO08gJvkU4vPr+vhM0UUxd4qAe78n9x9KCN8SsMn6At4CpYN1b6p19EPgeEFRSdABMdqNQiBSw9EoaJNH9jhDmR3S15Y1hxN9PquCCfeiSQ1PmlIIR65x7KhVn/nxus5vitmFP1DnPuXBkwV8Jpln6WWRa1bnOpmrsSyj1pCITwcAJkjCkBf7Io0ukzv1FErXlQql7Jf82sXIASV0uBaYjKkauUzYRD490dFwbA7gpsMbxlj945TPxqjUfX5/1nfBLcj/enONT+yPkmoePWDRvxw/D35kIo0L9JC3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(86362001)(6512007)(1076003)(4744005)(316002)(2906002)(66476007)(66556008)(66946007)(6486002)(44832011)(956004)(5660300002)(2616005)(478600001)(6666004)(26005)(16526019)(186003)(6506007)(8936002)(8676002)(52116002)(4326008)(83380400001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: YNn9MiBNs5iMm0ghFstfmV0FpClrMviERpyNClH/oAK6BQOqd/T85fwaym3gvO7IAb9ZWVm8sxUvNEQ2wsi0mOvxOqd+ZCirk5oELNYMH07wNxmyQHM0v9NzYGO03T+8QxJu7QpEoRMACyLYa60BPQlEsTaQ4e0oLZKZ+MWO5yNs4ovlJC1CIxgQ5aqTrQI6+cps86iRxfCR55K30qy//PH67NMfDMvMuLg6vRbdvQukbCoAtt3sTHHdMCCX5E1O4hrXkVYxsmrmSYIKn7JibMq6nfNyp08ckE0NosRjPvz0YG2d96rROH0/Yc957O23t5mMM1h4DGomEotXJuiqtt654iBFxocuNNFmDEG/xOFFYTZzJADFizxD9h5/r6PyRxzJC8/GnlF3l0KF4iepnY6I4SM+6ZVsLQ3+TDOPZ0Am/vSzEfy6fvdyhGihgOgUKTE7h3T/Pcx4+qdaAkgfcYrqcZ1p/xVa0GR29atf5KziLu3P1QsLHsN85jME0If9
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b287ab7f-0cc5-4152-77b1-08d81722ea0a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2020 03:09:59.8753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XUUiPGJ9hU4H2W1tNnCdL8sf9yvLBuhgwzgZUqnvnajUGESHM59Y2qmRiqli7LJ43IjIUs9K+5QvuxMpPCPDaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6854
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If it is 'int', it can't stands for the highest bit for 32-bit
number, since the largest 'int' is 0x7fffffff.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 2362faf7efeb..ecd395397e2c 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -1812,7 +1812,7 @@ static irqreturn_t cdns3_device_thread_irq_handler(int irq, void *data)
 	struct cdns3_device *priv_dev = data;
 	irqreturn_t ret = IRQ_NONE;
 	unsigned long flags;
-	int bit;
+	unsigned int bit;
 	unsigned long reg;
 
 	spin_lock_irqsave(&priv_dev->lock, flags);
-- 
2.17.1

