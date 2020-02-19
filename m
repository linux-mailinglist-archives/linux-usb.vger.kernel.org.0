Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE19B1646A3
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2020 15:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727786AbgBSOPP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Feb 2020 09:15:15 -0500
Received: from mail-eopbgr130057.outbound.protection.outlook.com ([40.107.13.57]:46766
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726736AbgBSOPO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Feb 2020 09:15:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mq7SxRIkJj4oNkGeQMOuIPTGJi7FSandv0QT0vkFO8fvQKuMSmkNzo3AsZTKreXEWBNSDyyhGmklZbkrFBBZeFQwqierDJKCnUPudF7Kb1tgFDlIM1KNlVxgMuudQ2R0+vX8ZeZ+G3N4omgpB6oxd91lr/jlOSLzWBX73wunMecjXbhY9VZAzA4rCpG1yoBIsa5iEo2Vgl6cLgD/afUKPDkrAKSKiXJU/QKAJmGgMrVIXvqAuajmvn1GW1yWr9BEQI90DdbW4ZPkE8DSfBunt1lnrirfA865cCPgguJM5cC4BWEsvcidA1e0AGkqs8Qu47EPcO3DTU+s6CXFosFIFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lx7wQvLAm2YDoPEfWzLvqGHnGPe2HER098zxpTzuaYg=;
 b=JQmC6D0b90JwUSnYwhIaurRF0jgdY4mmOQd8fvO1jzUaVLHmswjKuvtpVzaEYDubHw0uc/eIo7Xo3QuzBUG8DFjHgQrmQJD3cmGClY12KcJiVhIYSUE0c7RzTrGVCGUtH9sZAsx7AXy6M/zEQ7ABmfbxZwUlNpWVOYCdAlbcQXSilprDslZeQ6Bpj3rS+5ONOC+pDk4W7MG5L6jmR16e/cfqXJqCV0KQZ5dXb+qjCR22y46I7RFXLIQtI1DgF4oQ02C0D1E5hzH3l5n25V6K/NEm4mHSwli7OO7orXm3Dk8rbflY1e2CgbBrpHEAy4Wbx3Z8Z/ugXvajK99UdX4CdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lx7wQvLAm2YDoPEfWzLvqGHnGPe2HER098zxpTzuaYg=;
 b=HQ2aVUidBE8vMAAtlmpqcEr9oe+UaYA0c9rySUcx/3WKdBoR393Ina5jARr7DOsrzvcVizVkD8BwQRqbzEeTjGwqgmaaT6X8kZP4TLFuOp2MpywiNMkYvZ9n7oYoADe41Jn8GVO1PB+n0/nAbGz3Ny49ljVGL6t3Zk2rH+hRA40=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4112.eurprd04.prod.outlook.com (52.133.14.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18; Wed, 19 Feb 2020 14:15:11 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2729.032; Wed, 19 Feb 2020
 14:15:10 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 0/2] usb: cdns3: two fixes for gadget
Date:   Wed, 19 Feb 2020 22:14:53 +0800
Message-Id: <20200219141455.23257-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0062.apcprd03.prod.outlook.com
 (2603:1096:202:17::32) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:5c::23)
MIME-Version: 1.0
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by HK2PR03CA0062.apcprd03.prod.outlook.com (2603:1096:202:17::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.9 via Frontend Transport; Wed, 19 Feb 2020 14:15:08 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 685e35dc-7ac3-431c-37f9-08d7b546212c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4112:|VI1PR04MB4112:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4112AEC4E1871EC47F9CA5818B100@VI1PR04MB4112.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0318501FAE
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(199004)(189003)(52116002)(8936002)(16526019)(186003)(8676002)(81166006)(81156014)(26005)(44832011)(6666004)(6916009)(6486002)(1076003)(6512007)(4326008)(86362001)(5660300002)(6506007)(956004)(4744005)(2906002)(66556008)(478600001)(2616005)(66476007)(36756003)(316002)(66946007);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4112;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qaYOXy7SkYwpNvu0T1ouDfRAudfaCquoJVTCuDYdkpQqAEY6r0b6syJ+4T2qyzHq6yakvCvsboeJCPJRFtKkK6+qeDTQvPpZ8bChp+nIIUyp9CcMzKgxRVOJ6RS+K8hwVtfsiOu13waVCyHt3hfpcPTmhK7L+DOKUh+qlKKwIm2RDWFgI5jW6JV0dHetnMMpeHOABBNOUeT2fos6MeIreslv4wpC73SIUUw3hPA3WQeEjoo97lUsPcrTlyBT24FZ+3niGWwRYG6Og4t4TR6WIx554Dzg+7RuISLX5tZLuXWxLCAvYqxXeDRYGsUIDnJ/Bt6L9qpbwkrk9rnWsucwkQcvoyTmpmbzceLI57iXyRaNByo0rybXH3qX0QRv3ewXiC8IuDvcGPBTFI7jZcIzi6MsztQc55jW91A5uojTHBJBV6xCrTOIVaGIhgCeiw+B
X-MS-Exchange-AntiSpam-MessageData: LK2jQIEhY5u3kgRL2L4f8tqHsmdhKlt8dIwRwtDx9XazwHQbBT1PQwacFkAEWbSVvl1PYE6zf641qXn0X24Pf3izIE+dcNS1FPaPUApghKLX2ul9AavV2kOyH/VJfpARMR+lhLcYWQyEuIj9U/g5Gw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 685e35dc-7ac3-431c-37f9-08d7b546212c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2020 14:15:10.9166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ViZFnHcBcXtD84CB2DOUiQl3WqFlQMqXINpQtmYKgRrsRiRHFoludmfPfmX2O/6TcPnYNH/gEdcZ4ezWNLJgbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4112
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

These two issues are found during run "Error Recovery Test"
for the latest USB CV MSC test, the TRB doesn't advance correctly
after dequeue and clear halt. With these two fixes, the test
can be passed.

Peter Chen (2):
  usb: cdns3: gadget: link trb should point to next request
  usb: cdns3: gadget: toggle cycle bit before reset endpoint

 drivers/usb/cdns3/gadget.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

-- 
2.17.1

