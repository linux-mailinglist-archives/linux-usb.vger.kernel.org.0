Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEE3264132
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 11:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730077AbgIJJPa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 05:15:30 -0400
Received: from mail-eopbgr130043.outbound.protection.outlook.com ([40.107.13.43]:44418
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730136AbgIJJOM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Sep 2020 05:14:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i42lLiKkIOmBs/0BjmxBSJaROz2MIfUNzCDOlWLeulNftCSnfBsKjuohE3cOoLOIeppMV/rXOmiv7o1wobXClbNvlHaaCh6TIgtSKlIvvLQR/LcptpVMykWEbk5jC3QTSYjJCAz3+cBB0HDudM/zCXpLSFi2eGAFfMBS59frEfcCRis9poXM1VoduyBWKUr7A4OuhAXZKNFW+t9XHppFQxT8n1sbQ2+Baf9MX1SJijrVzLnhscQ0pfTxT81DCouCclrLRVkJ59aQxerUYjOFcf32+XIQVYUpFiLDQr/XNhpRyGIsYdZ4XTsf63+Xu7zsPjuPoPdDEp4KIm/ZO76ycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpZdgKq9DZl2AjKkEUrsMJ2D2ENEjCvSEhJf02WL91M=;
 b=DngewARLgZKl6U10iKpmmrzM+pq00I06fbVDY3EQ5HapNwTZ0ocZMezPf16b61MK2LwaFnM6fnAgU3saeSuhzDwJcWj3jnru06U+z+5RRNTT+mMfzI+J2ieUEzqIxYnQnit8cI7yXjPe9cVwcVWv/dmFI6w7rmaZx1TRcup/JeWbGLwYsj/H+l4rQ8+yqRYzgcnKfFgJfSc3ESL7XfsDgssGF34Wk1KgovhMDBtoRXEXsiqSsLbHDpVTBv5eVy1qrSQ9W9qbhHZVADY87cbRDT21Foe8Kbz4HeR926N6qC1gERci+yG4W948yVHE9QK2o3dDgTg7jLaef0K+wcCZug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpZdgKq9DZl2AjKkEUrsMJ2D2ENEjCvSEhJf02WL91M=;
 b=BBPhLKRRqKQCiB/+Ue0pAjn0lNARQ5Kba/w7WzkaBv9aGqR85g7Y/i+0KylxdgfDkQNoVcbkOhkRVJmkDkQkYZFtop1DKqzgXXWw18fKCjnUzLw3OqVlmhrI1BzpqK6I2cehvKCOyq67OlLirrJjv77nJQ8BI/SosJIkzlyB9JM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4168.eurprd04.prod.outlook.com (2603:10a6:209:43::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Thu, 10 Sep
 2020 09:12:36 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 09:12:36 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 8/8] usb: cdns3: gadget: enlarge the TRB ring length
Date:   Thu, 10 Sep 2020 17:11:30 +0800
Message-Id: <20200910091130.20937-9-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910091130.20937-1-peter.chen@nxp.com>
References: <20200910091130.20937-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0134.apcprd06.prod.outlook.com
 (2603:1096:1:1f::12) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0134.apcprd06.prod.outlook.com (2603:1096:1:1f::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 09:12:34 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ee0cd50d-963c-436f-c04c-08d85569a8c4
X-MS-TrafficTypeDiagnostic: AM6PR04MB4168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4168B2F32EA45FC00618C76A8B270@AM6PR04MB4168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vFPgQW5a5m0GovzM6uN9aTBgoxVdrEp5E0n0X8xlIdQ23E01NypWLZ94ylmYdT32MIEh5FTrP24iard4WCXaKcVpGP2YjcjxH3bUoBmU51VS5PsRTaCrDXxV3odRd4YCMBauEpUZwMaGngxcE3jtlFysoDhBGbpDlTLaWpoXN2ZGIToTcL5DvCpFrTOdphjz7YD0bgs+LEC/vlHw6xQ0n8acGzhmcQFTrlR+HCKoKA1y8pwqThWXceo3ZWfwk3Oh3wF698mJ/D1VaVNX5zTz2Vj5aaD+egvd9lgHpd7cPmpg1Sgr3U/goEb1hAeXhpq0d5AsWC17RkpUqZIDKFvm4KPDFWhgwEcRWHFOeZ6stMiXtGa2I9t0prLchyNpGqJcJwehjNBP4Ce+YA8LHHKTZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(4326008)(6512007)(83380400001)(186003)(6486002)(16526019)(36756003)(66946007)(66556008)(1076003)(8936002)(66476007)(52116002)(26005)(478600001)(44832011)(6666004)(316002)(2616005)(2906002)(8676002)(956004)(5660300002)(6916009)(6506007)(86362001)(161623001)(147533002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: WRKA/O4gcxXeTRCJBWFLw50z+V4f36F3X1ioNL0ha/EqpjJ1O8tvpng4s+m6k87EmPBeWvIsyNK3fUNnezjqQqC9WJt5E1F4Px0v8ABuLKCLpOmkfA0bKskBWbiZCpNvrsvZczsxSg74nUcIXP3TUB3xB3QJXv3o7bRifk2Zub0DHewa4qfZw3fDy72pFlpiVLfH2qaWqGyOYEEk7vNe2KdnVL3DOHbO80+uQ6QL88wuqM2G2WxwsLQ27sbftGXtprGrDkkpNOARNIwxE70iwi5qCzEA3IdETeCBiE6XZoEXbhfG/uu0HYcaqs0HcA+boTTQQTqPj1hKUSNOD+OgV0FVTRFz1IhKCu4U2uk61dKQ0iz24AdomOrgPmifZww4GYk3El1NYmHE7IkaZRWVe1q+1+sjLdVbF23JXzEVvkdOuIt9iEYVAWvlYIYrkrVPzxHOO+/CTyLPoln3I+4LMMhIIDiDmJFgTcjBd+0O7Kq8TktxQrV+KgFxzpTZIeLcqCfauPTXR5TReDOKu0jQpSP9zmdgzvNEV5w2VgbWiVTk8JK8CB0UGIH7kcQWkzjCY1G97/QecV1xMPu1sBji5kSmAJoGBENeNakN1WzDWCjTGq+gt1CCibo8JQxKg2EbC+APwwdhmgZyHQ//IEJ2ZQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0cd50d-963c-436f-c04c-08d85569a8c4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 09:12:36.7206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7abVB0rFuW29LxrFB8xXtdxzKdFn0LDSb6xUrDxmVjmnTuCj6/aXHqYtHqI5iFsOJzWBlc1MocRXF8ipmiHQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4168
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

At Android ADB and MTP use case, it uses f_fs which supports scatter list,
it means one request may need several TRBs for it. Besides, TRB consumes
very fast compared to TRB has prepared for above use case, there are at
most 120 pending requests, the date size is 16KB for each request, so four
TRBs (4KB per TRB) per sg entry at worst case. so we need to enlarge the
TRB ring length to avoid "no free TRB error". Since each TRB only consumes
12 bytes (3 * 32 bits), we enlarge the TRB length to 600, it leaves some
buffers for potential "no free TRB error", and only increases a little
memory cost.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/gadget.h b/drivers/usb/cdns3/gadget.h
index 9f8bd452847e..1ccecd237530 100644
--- a/drivers/usb/cdns3/gadget.h
+++ b/drivers/usb/cdns3/gadget.h
@@ -966,7 +966,7 @@ struct cdns3_usb_regs {
 /*
  * USBSS-DEV DMA interface.
  */
-#define TRBS_PER_SEGMENT	40
+#define TRBS_PER_SEGMENT	600
 
 #define ISO_MAX_INTERVAL	10
 
-- 
2.17.1

