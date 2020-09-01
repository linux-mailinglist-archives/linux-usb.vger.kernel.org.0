Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC83258A98
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 10:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgIAIp1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 04:45:27 -0400
Received: from mail-eopbgr30042.outbound.protection.outlook.com ([40.107.3.42]:38273
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726078AbgIAIp0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 04:45:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CteBxelIlZI1EoPGCvR1jJmyFWAhalabiANyrQRzEcn6PvMnoux5Vuqyvf7xBjUHciFyMwBg4/eJcdn5j06qX0+s66VFdMIsOsOXalrwNqLyZp5UjnYh0AR731egOuy33GpyMRN+eDZKq1c8dDrVcK3k2DXPxxx05QsWDWF/ZdptOhzBdkd7O+8S7Lkd0Um3ExmiiMXPScBceOxU6n7KdnboSY+bZ2+BFX7MlpDDONThOVe/BYawCTIrj2KktEQy2OqZb7EqtNH64uMgpxtu+sbjLT1an2pk0WB4ts4IB5+1++dilfWa7lFGraeQTiqpwQmx1eVg2WsNci1D9yW0hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSs29mHk9hAVX/8v3VNFJdhhY5E03pr+RwjTIktMjpw=;
 b=QGTmpR89ORVEJjHYRm6woaUZZVbUR5EqRUc4hI13Pnf+mPbPN+nq4IxPZLfWnfsExzXyuW45MclxnISyK95iIo4+MJS5TP5YVkNrlwLnjpsy1EJM/m8SUmO2+BGSm0aHceoGVM9Zzs/OgOqkQG/8/WVfAvVB4za0RQImqCsEidbpIsbug85XRhpUD6LMJu+lTECJXveDZj7zfkYc38IzwwFLPSmbmDybn4yraEvcynFUkkpWFh3z5bn1LMT37WIMG4uJ1PRwRg4wr91yl3hvVP7NoYAZxkU6L/YrRVhn8SJRurK62pYvb0OCn+yc/lBub1WK9BKtm1j9xoyMmi8LVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSs29mHk9hAVX/8v3VNFJdhhY5E03pr+RwjTIktMjpw=;
 b=i9yBU7BOURmpL1EeGlmKleR0XbrhmND3PCc2l7EANjB9N5ZYw+MjGUapAjdGFcqR7I+Q/oJdavv6mlVCijY0L//QAWi5EdFaQ0gw0b9aYbYJ6tO64znWAH8nEl6od/1xIBk10SodfCrwTJMyyWcUWRtSdAr/aQkYbXxXgRtvy5c=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR0402MB3543.eurprd04.prod.outlook.com (2603:10a6:209:6::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Tue, 1 Sep
 2020 08:45:23 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 08:45:23 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/8] usb: cdns3: improve the sg use case
Date:   Tue,  1 Sep 2020 16:44:46 +0800
Message-Id: <20200901084454.28649-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0226.apcprd06.prod.outlook.com
 (2603:1096:4:68::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0226.apcprd06.prod.outlook.com (2603:1096:4:68::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 1 Sep 2020 08:45:20 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5126003c-1913-47d3-1f91-08d84e535d83
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3543:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3543B7DC36839FF06E1C5AB98B2E0@AM6PR0402MB3543.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v81KMWYp6KYp2HcOWzlta/oSSFP3jlJMNeuT6UdLw/1Nf4iscQU+ltQKIoNF7iivPAqq4fB4wdng75Nr5vYkaAZdcNZgsENj2FoT+Mmw8ZjviE4PscUNEr0DIGex0fT14WOkB5Xu5UfqatxshYtR4Gq+B2O2e7OlOxRR51QxfB04OSEAtV7GpLAqhzHo3ChyOHU4cn4RsEmTo9oAekf4Wn7a8YvPB014GXlxARLq7ZOr8hLy6nJuAAOR4ewSz6qb/U4zG4pEwhCoaR3LUBfsU5Vf4igBNJj7Z5+1PFVYNKjd2UmmrSMOthxcbF9JoJIUd7ZipiqNnHIJbJkPVx+uMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(36756003)(44832011)(6916009)(478600001)(16526019)(186003)(26005)(956004)(52116002)(2616005)(6506007)(4744005)(86362001)(83380400001)(4326008)(316002)(5660300002)(8936002)(66476007)(2906002)(1076003)(6486002)(66556008)(6512007)(6666004)(8676002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: DqNQv+uKYxMG8mm4sqZg1vTwW/tuF75UW5UXyI7g/IT2Rson7mzM5L4NIen8q3EQm2ahy00EH0D0Pr14CmcQAxOaZZu0UnJIJYoe4onSzuiC/gtQzecCUlSv86plbJpLyj9K0d2kKcrOWvTRM57gs9RDLYB125xcPlljbnEvfsiEzc52/WCAEDI3ZCqYkTQE9U3dTLsVaovFQDGPiuaCM0OKjpvtatyfdloW9XdsfW44/SFtx8gNLWHVxUlbKIuzujuNsSt9zrvg+bGOiOAU9HXZP24Bd9vg2IcnflVL6wKFHH0Xp5BufkbVVUSurLYyR+y0q83VSWo+fGS3sN5zUYHLaNWivlklieZe8Zgl/V7Ljw3QEIwJ6ry4zk88FZe6HsBpINSziNhThWlX6YXS5pILks5yTQSDJUl4x1+YTWYvgseoMADfMNel7nPCsQA0Yu3EUE9Y583Lt6fhw8S/o0p8lukhSf9KebYLTDiQkW2V52sNbeyTOcPBG0Z30NYK0uztI3j+AE9CxImWjAY1BIdRv3ZxkeZoe7xaBPz0VgSeXhLRVgv0MuMiXfFbZD2PtSZdlK8Emmo5Zu6vN1cnn3G2TEtII4NH+apevsEFJRdmzXvJTuQRIgLdknaJ1Uh1yydC/DZuxfQRjPsmKTCTew==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5126003c-1913-47d3-1f91-08d84e535d83
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2020 08:45:23.4197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMBh4jI5MSIVpRfEutJsAQc2gqu0wJfvGHvTzGJ5+JxKL/nnIXqY+AHpAgNQnS1cDBudxp809Mwvx8hQJ/TFBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3543
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For sg use cases, there will be serveral TRBs in TD, and the short transfer
may occur during the TD, current code doesn't handle it well, improve it
through this series. Tested by Android MTP and ADB use case.

Peter Chen (8):
  usb: cdns3: gadget: using correct sg operations
  usb: cdns3: gadget: improve the dump TRB operation at
    cdns3_ep_run_transfer
  usb: cdns3: gadget: calculate TDL correctly
  usb: cdns3: gadget: add CHAIN and ISP bit for sg list use case
  usb: cdns3: gadget: handle sg list use case at completion correctly
  usb: cdns3: gadget: need to handle sg case for WA2 case
  usb: cdns3: gadget: sg_support is only for DEV_VER_V2 or above
  usb: cdns3: gadget: enlarge the TRB ring length

 drivers/usb/cdns3/gadget.c | 205 +++++++++++++++++++++++++------------
 drivers/usb/cdns3/gadget.h |  11 +-
 2 files changed, 151 insertions(+), 65 deletions(-)

-- 
2.17.1

