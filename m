Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65F9229568E
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 05:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895256AbgJVDCU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 23:02:20 -0400
Received: from mail-eopbgr20052.outbound.protection.outlook.com ([40.107.2.52]:47251
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2895253AbgJVDCU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Oct 2020 23:02:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f296uJsrXglUfJ85unrKITaGVdvp/z2UxYKcqujagfOrMxpqAqiS238upMMb0axvaqqFvkJq6Z07eUk/VEsTGOVIue3espgGhhULriH8YmymQZtLshmtewKLD4/74ZIbOXIl6hl3Fd55bv09t7fVDXyf6io29q7Mt1WMPDDFdmE+xNvclwjlXM0C7K/vqSHCjslKdChoI92XA44jmu05rK1KkWbOK9vBzVe8G/194dSkft352jO2ZApRfZWtx1gKq4+WZtYMRVfAL1wII8dnXoOqd50RPxeh3clqwoxfFIyBu3+59AQOvro0VXhvOsGMpVmf/XldICqbQ4o3crrWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0c7LyxeugaguzQPQTgZv+USNz4ugPceaKBCObmFM8M=;
 b=YEbHUdzZ940STAaUrExkIRJ7R0NRvyndumkaQ+sbQOTQDwtVPtaYsQ50pzODnuL0JWPRqD3b1DaBWiA0A3CI56B2FlX+nMTCBdnmGYtfJrXgDBZP05iNrpM+IOZHN6kFMHF/yHKopogr4LI8Vx5Z7gJfeiCOx+7lsd/T/k298evgllCziEFJyTosP//oAp5o6G+JANRSiQZXan1GA87SyD56Xp6mV6q0Vuy6vqNic7nyjJvAnbSHu/rB6TjiZs1maT/pe8K4icHWHK9bW6qouqpJxE05IhJClvcp+Jr/HYlEAFBmGmpnMioU+c9WaB6zhuIOrZpcoMZWbgTjP4i8YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0c7LyxeugaguzQPQTgZv+USNz4ugPceaKBCObmFM8M=;
 b=F/3OKhtaLqvWWbmjtYReKQFHpwDZkN4UUhLifz6btuQ0650GVgBdjWlY2uXezgGyXHBSwTqB72W/sug2kwX3/ZcdPuDRW6SIJTbY8arIe+g+9LGq9FsBSyqistjnKf4VVx9LeiwY1yu9l6z3W5kV49Z0fjTRKcRV8tD56J81B8E=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR0402MB3857.eurprd04.prod.outlook.com (2603:10a6:208:b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Thu, 22 Oct
 2020 03:02:14 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 03:02:14 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/2] usb: host: xhci-plat: forbid runtime pm conditionally
Date:   Thu, 22 Oct 2020 11:01:33 +0800
Message-Id: <20201022030133.19528-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201022030133.19528-1-peter.chen@nxp.com>
References: <20201022030133.19528-1-peter.chen@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0224.apcprd06.prod.outlook.com
 (2603:1096:4:68::32) To AM8PR04MB7300.eurprd04.prod.outlook.com
 (2603:10a6:20b:1c7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0224.apcprd06.prod.outlook.com (2603:1096:4:68::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 03:02:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ba4ffb08-2284-43ff-5e7d-08d87636e0c1
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3857:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB38578221F36A1C7E51EE47B68B1D0@AM0PR0402MB3857.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gT/7tjSMwrFEPpxb3PrkF6mX8EJNRsw7Ia6vbTbbg4cYQ8FKvg+hEA6Ko1HNVUWt4jhyjuhJ81KkEDXSjaGIPeReIHSmYQedv7jhkIj1AqBxMdi/uMfSfZIyH2T2KgVz9T2sg9FIranA7G0Z/WoaRUQz0uacAYlYZRqQLGhkofncBhZXrVD3UBDXTAhMhVhVpdLpA9fW7dEgJR9Tz4LEFPp1RRxZt4R8i1cFkhwwyPiMKNN/MGD+YvFEKiW1t1+HWtCCFUFLpLWec1491ai+YHO2RmyQQTmJRsUYuPtZrX27vG9H8RnFZu1Gp+t/7G2rIJdlKWyIBAOO997ybMce0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(8676002)(6666004)(66476007)(5660300002)(6506007)(4326008)(6512007)(8936002)(66946007)(956004)(66556008)(2616005)(52116002)(36756003)(6916009)(26005)(44832011)(316002)(478600001)(4744005)(186003)(86362001)(1076003)(2906002)(16526019)(83380400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Ty6N5fdU37ZoIIGB+rU1Nf4m6aLFird/z42HOfPFnLTXh6OMjpHe3c9G6H1bK88kVy6gUqSCFbt4KkiIClDRfsqdE8RtFz1n6Cg6PNsIglGnrTfqNAbScUMa5vJKzylJw1uZLVlDt4vUqUup4ARPOG/4by8GFA2IiiZlQK6s7cw1IhY/uHYz5VGb3D7A+1ugv15R5XctPfgIO5dybvOWiyYbDod3Yxf+FoSlT1yagjV44lX/mbsIUIpokDikf2nOM09Djlp5Kb8GqQsT72djjLsUMCdvLEBLaoeyKnJso4pAKdJYDo3SRUwjncEhCcBAgHlcxa2Jq5LkD9Q4stZ6kxpXxIQntAURilej7upPmfHLjvZEZZ0KALI4sF/XRFfAUdnqVyCOW16gUFfGChyHm8bYNa/ASMloO8T2tb06tr/HTD5Yj6ZSRO/Sf6nkou35Ofn5VhSH5sxUIXkgtgwr9LPjYYBX7jzq/tgimU/Kr1nZ+9nP55qtijKG58Tb6QuHYUacYL6A5jbOpkqizQnUJUm2RclXABhIgvAAbVCc1xknUZDP03JT2SP5tY3zMfyFAGSDHWGoEb+D/V11Q3qVv/lYz9MUSQnT6jLF4f5HvZmzT33ykwtcykNRr4cmaFDvRcWZ1XIkxLLAt4Vhp4QBJQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4ffb08-2284-43ff-5e7d-08d87636e0c1
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 03:02:14.7868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFBQe+7le+oyf/FwZhmh6Ox6NOOMV+YcL0DBhU+GjcZqgyjN4KWwKhvhQvLz5sk/GszZ3u4/dAcXfL9U8qN0Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3857
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some users may want to enable runtime pm by default, using the quirk
to judge it.

Reviewed-by: Jun Li <jun.li@nxp.com>
Reviewed-by: Ran Wang <ran.wang_1@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index aa2d35f98200..effb4f0586ae 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -351,7 +351,8 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	 * Prevent runtime pm from being on as default, users should enable
 	 * runtime pm using power/control in sysfs.
 	 */
-	pm_runtime_forbid(&pdev->dev);
+	if (!(xhci->quirks & XHCI_DEFAULT_PM_RUNTIME_ALLOW))
+		pm_runtime_forbid(&pdev->dev);
 
 	return 0;
 
-- 
2.17.1

