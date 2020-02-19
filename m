Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44B76164054
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2020 10:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbgBSJ0I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Feb 2020 04:26:08 -0500
Received: from mail-am6eur05on2069.outbound.protection.outlook.com ([40.107.22.69]:16618
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726195AbgBSJ0H (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Feb 2020 04:26:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AL8YboKTZKLHxty1r87dH5BDf/xqlNbudUuQ7oLaDUDXCkCxA0FNRC/D3Z6xRYTopAvOkMR2F96K7m5xsI/u7/zeELAMfGQJMlbOMp6YTbZMEI4eUQTPDnvyvDAKYBcuWlktRLfPzoiXBPhIPQstXUGoudnyLz3mb+NbVA7RXDwNrMKsP37g9Ei0ayrOin5+qcpB2ead/mXflrKHoh1mU2fmjEviXTrDFNEmqCtSe7y72/Ey0nZt249r3csWq/6OMyV10c/Oit3rRVl06h73OvW/Gj/X88qvauQXywvdM/FU9gFvCdW/gUABxl1OTSo9Lv3rRHhY6Xh5Y+poI/wHcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hD8681N61eeHhrrgpfuQkrbknwXEwdPxv9fyHefv0D0=;
 b=b1Gf1yB2O6DeDG2IhyXVXIMQFcTSEx+CAI0vk2WonbS0jR0hMWNZlNWxWOkH9PhWwbX1mWoSWCIB5ZhN15N9Ck60nqo+IczMz4VGJS99e8sMjgaPWRhAdp8qkxD8bPYcvW+6K3kh+vZ3899bB+lRhdMjNlFfHnXgWHn/ySNvW9aZHbngGN+FDtgS7hKh1f9EugrfIWylXwok7wWyS3C4qIUXcrnuN4DlH6eYr7+aCw7b328a4Kol8+Wz0hKt0bkR0a+CULaUSyjC7lQJT77vDc1CUjDMPLNgRW4EHtFHW0mpVUEV5zcMA/8s4ZvnESYyitjWF+7z0yEuFvcTDFDWHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hD8681N61eeHhrrgpfuQkrbknwXEwdPxv9fyHefv0D0=;
 b=IN6jeryDGmbakHZtts3yyXyVohPJ7wJfBogRAEtCZyWijWgEQAVx0fmny+LCIHMqAwG7O1pLf4LdWtXk179tNbD+aRmZf0Kqefjp7+IMi/RrO8uTPbM4+3dV1lhApkStO4pJvycf95ypdtvqemHgloeAR/qkturFVioXbOuPd1c=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4909.eurprd04.prod.outlook.com (20.177.48.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.31; Wed, 19 Feb 2020 09:26:04 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2729.032; Wed, 19 Feb 2020
 09:26:03 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     linux-usb@vger.kernel.org
Cc:     linux-imx@nxp.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] usb: chipidea: otg: handling vbus disconnect event occurred during system suspend
Date:   Wed, 19 Feb 2020 17:25:48 +0800
Message-Id: <20200219092548.13313-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0401CA0005.apcprd04.prod.outlook.com
 (2603:1096:202:2::15) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:5c::23)
MIME-Version: 1.0
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by HK2PR0401CA0005.apcprd04.prod.outlook.com (2603:1096:202:2::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.24 via Frontend Transport; Wed, 19 Feb 2020 09:26:02 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 81c15d4d-af21-43a6-93fd-08d7b51dbd86
X-MS-TrafficTypeDiagnostic: VI1PR04MB4909:|VI1PR04MB4909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB490968632A65BA7B8EBFE68C8B100@VI1PR04MB4909.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:121;
X-Forefront-PRVS: 0318501FAE
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(189003)(199004)(6666004)(2906002)(4326008)(15650500001)(52116002)(6506007)(26005)(6916009)(1076003)(478600001)(16526019)(316002)(5660300002)(44832011)(4744005)(66946007)(66476007)(6512007)(81166006)(81156014)(956004)(2616005)(8676002)(86362001)(6486002)(186003)(8936002)(66556008)(36756003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4909;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HV+KKtcH1NzIB4z1bqEkTMx3Y5NAIigl1KDTlffFae3YzCXvdO0V7btkwzWyNHl7r10lIjj1jB5SrUmaw07Hjr3KrnaTPUMOnQSjtFq+8BY02Nv4gsPKYD8enZM54CXg0HUOA8w9z6qKNvLRtcvgkCLxahiJAIg2R5ucqfZa9f4Pd6xaJ/OJ+xZsxCfrXyvjjsTchODoB+o33ax2w2Av+uOw+6QMNx0EQP0BZjtFqOxh9pw0y9K9vEweldzSP60Eq1sIwWVI3C3SDiE5YLK7QzNC1yJ8JxJxik45xLKHLNq5AQiohRGedVRCOhBZ+ZW4Le1EVvEcymaPUsda+T6DtB4Dc8qZVYiMGpPRC5/3QUxBfS2L/ER/ognUg+68T1HhcfwXc3wraKbTypDndPHgwqstB5+HxZXIuV7iL22ISfP2I+Y0bKAlNJbLkDwmgs+8
X-MS-Exchange-AntiSpam-MessageData: ofJ+Ij1Y25HRe39CuHL33TTKjKDkVyUu0z8uLkPZG46MSwDdgAsJkpXIQt3Md5Z+/eUhps/kt/BGPhmcHwV0y7Ej+HLuJBY9xUNqJ0idx18xl8Zd/JaegHTf+RZm6TCnAz+bOTISamY3RZw5/IVwRw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c15d4d-af21-43a6-93fd-08d7b51dbd86
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2020 09:26:03.8674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmrTIneLc6J6mcLa/lZZWhaLmIPa6Pov1TUqj5Avo3ekCVundgL0XH1/twcb+zmQOUzZ4phwqoCvKz0Npq+vbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4909
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

During system suspend, the role switch may occur, eg, from gadget->host.
In this case, the vbus disconnect event is lost, we add this handling
in role switch routine in this commit.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/otg.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
index fbfb02e05c97..be63924ea82e 100644
--- a/drivers/usb/chipidea/otg.c
+++ b/drivers/usb/chipidea/otg.c
@@ -170,6 +170,13 @@ static void ci_handle_id_switch(struct ci_hdrc *ci)
 		dev_dbg(ci->dev, "switching from %s to %s\n",
 			ci_role(ci)->name, ci->roles[role]->name);
 
+		if (ci->vbus_active && ci->role == CI_ROLE_GADGET)
+			/*
+			 * vbus disconnect event is lost due to role
+			 * switch occurs during system suspend.
+			 */
+			usb_gadget_vbus_disconnect(&ci->gadget);
+
 		ci_role_stop(ci);
 
 		if (role == CI_ROLE_GADGET &&
-- 
2.17.1

