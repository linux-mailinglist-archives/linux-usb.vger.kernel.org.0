Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD2D2463A8
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 11:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgHQJpy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 05:45:54 -0400
Received: from mail-am6eur05on2075.outbound.protection.outlook.com ([40.107.22.75]:62688
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726324AbgHQJpy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 05:45:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHUFtewxjrjflxy2pbHshJAyxFTJLlHHrq5ZpqhJBs3w39dUKq4skrddEVKIqx/5JVx53h2bLzlNGyZePIpowB5YUN8jscN3e6zRil5M+4hMY3u8cpKhVBEOZ4jEkVj4GmXc3Tmqex1LmSK82joTTjMx5S6L7TikkiImTQoxEhnZmbbHPrQs7CjMtDIo3823zD96bhmJF50aZxIAPGj2EGEhxBdL8ubUSD4sxnNIAZRrncrM1HDkfV+hvgfAe4/O93JE+i0J7OQfQGi4IMcAcV9d72i1da+wAOT2o0Wv3AxJIj9fd8tOVHqeUAmXnhp8Px2p4tDuiWH5Ep+dpaK2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMEmzB/sv8JEEap8oM703iSqvTtdSOCCllEaO4TZtdI=;
 b=cJaEn1A25wuckQi7yT5lhj2/LUu67hbBVL6aeEC4gL2uPy+91/bKvKoI6go1sr59U3aA/CDq9zwOOnlYgbHlBLH4qzWAF1vT9j9oD+FL4fPoXHLGlkjGI2dq76SITqdXfiFDQE5QT2qv8i6S/2aI6HToTMD97IRYQHXP81X/rcxuvCB2gNEoiT1wsyavbbSpJBJ/P1AmGpfGii4PhkgIg/9byBNp4L63xCpPfmMYCHccUY+lipstl7BfABVyCfUJanjhKaXlbgnWsvzGUc76rZS3wN/PoSLvxaFXE4ZrFq+WemNsUyCHgX9w4bxG8XX4pIgtJ2Qt8FyBDEOYUzBfOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMEmzB/sv8JEEap8oM703iSqvTtdSOCCllEaO4TZtdI=;
 b=n66n+tyLi2x/5WGwIYO98kivARb0/6eW/GLDdg+7TBuLsIXvK19k6YB0xSG4+tCYpE8XVF1k91Q2nNU0wSm3/xJtvCt9A/O+1LviAlDGqWsbqg6z9GdRCodRwuxI7vOT/QC9p07fS5P2tpfjA/Ra3FW7qmZ31OZzWlo/rAXDlxU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.26; Mon, 17 Aug
 2020 09:45:50 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3283.028; Mon, 17 Aug 2020
 09:45:50 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 0/7] usb: host: xhci: some changes for xhci-plat.c
Date:   Mon, 17 Aug 2020 17:44:33 +0800
Message-Id: <20200817094440.23202-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0094.apcprd02.prod.outlook.com
 (2603:1096:4:90::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0094.apcprd02.prod.outlook.com (2603:1096:4:90::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Mon, 17 Aug 2020 09:45:48 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3686fdd9-8617-42ae-a458-08d842925358
X-MS-TrafficTypeDiagnostic: AM7PR04MB7160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB7160780A4010EC8F897F8C098B5F0@AM7PR04MB7160.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q76tZ0X/QkRy+khz1JI2hm0w8ADOa6ng6Li3PMDpVISJyGqGRlPNpGzblgs0ERGfxMkl7rLzD+zEbdh+bD7M15C+7MdUw+bs50soE4jYvoY6gmLefFKsKP6sEKE8S3BggmSPSDDXYFDZg83BSkaYfkNNXr2vehZmjtEX8yeCD0fCrviMGj8qvusWcfc+v+Eqjwee0CDLsNK126g0QSfwrxYCuOqu0hXoHwCZsGWkHILZsfuP7gHXoCVd5UQLoGIoG1jXSBUKKconM60GZY3zbq/pnK1bJeDXXdnUsTWLFK75H2QohJKOEMMbbcPoYBKx8H0cdyCFLkHE6Sih08d+lST3lRRv0tFwNje8ywCGskd7EUsfjtWIXg3Bv0CfiRPA9mhy3urmZA3+cnUjwNVtbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(6506007)(6666004)(4326008)(66946007)(1076003)(2906002)(16526019)(5660300002)(66476007)(52116002)(6512007)(6486002)(66556008)(26005)(186003)(478600001)(966005)(83380400001)(8676002)(2616005)(8936002)(956004)(44832011)(316002)(6916009)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: c//WznTDqBM4CmBD394dSZkKzs7tcgCk6YSgpeu7GmDoSM/HE6jB0Ouj8xq1+2IPfAgVAnf9V4+ep+FXA5/blg+Mqem5Ah3fhFVBYXJpBo2Q6WuGHVGMGyHlZf6Oj1drX6JPVASvLeT/jru2htnjLRa3+tx0vgT6yZ9UIckcVXg9/SUm9QNm8mJZDSNuxHKfQ1YkoCfNnTqX8reuUqLx0cYuY2uAzPDeAw9nOPypMjmcSf1MaiSnQqc1aObKQxXkGScNKbFZEsDX2aTrU1xHfBuX1Uvl4wymaRmbPFzgudyz/51zRjNFpQoJog4BJifUoon2EuBPDzO1fojoN/LMWYUC19lwe+N43Ar7EA8dLhUlyYowSonA3adY6Xr8MBKQZzmwb0yBdjEPD4mwaWyo+s4XwdRD5dHBJ1MxAKaVeLiSYfolr8PT5CodsxOEX/MsYYwaZuWvmQUBn1MfKPyCxNlx8ORl4CzzOH3mYdwVAmG4en7V4P9T7oqBxat/JniZE2PxXp7h6U3cgF4Qwh8HKpCq5Fhr2iNxgQmJaSl3/qb9s84bUMm0bliwDWtfNJuIJL77ceVkuCucw/S8TIShEbwtyaNSP6e8+S7SAHzX42nQSoH09vgAgSX3XhA1JP6YQJWP2/xj8hrX7eTlD53sgw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3686fdd9-8617-42ae-a458-08d842925358
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2020 09:45:50.8183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OXfzmrB1fiiwXhamtTsDvdZ+F6Rz6KIUFpSChvACa6KdGRXVgNAMaHuRH8A5bwShVT1V6X6MPq5i57V2LjLSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

This series mainly includes some changes for xhci-plat.c. Some of the
patches were reviewed by you, some were sent during your holiday. To
easy your review and save, I re-send them together. The patches are
already rebased with the lastest usb/next, thanks.

Changes for v2:
- Do not set wakeup defaulted enabled since the device's wakeup
enable will not turn off its power dowain. [Patch 5/7]
https://www.spinics.net/lists/linux-usb/msg199303.html
- Change the comments for this behavior accordingly [Patch 6/7]

Peter

Peter Chen (7):
  usb: host: xhci-plat: add platform data support
  usb: host: xhci-plat: add .suspend_quirk for struct xhci_plat_priv
  usb: host: xhci-plat: delete the unnecessary code
  usb: host: xhci-plat: add priv quirk for skip PHY initialization
  usb: host: xhci-plat: add wakeup entry at sysfs
  usb: host: xhci-plat: improve the comments for xhci_plat_suspend
  usb: host: xhci: avoid calling contineous two times for xhci_suspend

 drivers/usb/host/xhci-plat.c | 44 +++++++++++++++++++++++++++---------
 drivers/usb/host/xhci-plat.h |  1 +
 drivers/usb/host/xhci.c      |  7 ++++--
 drivers/usb/host/xhci.h      |  1 +
 4 files changed, 40 insertions(+), 13 deletions(-)

-- 
2.17.1

