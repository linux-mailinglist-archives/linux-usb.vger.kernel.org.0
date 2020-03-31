Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74049198DFD
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 10:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729624AbgCaIKJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 04:10:09 -0400
Received: from mail-eopbgr20080.outbound.protection.outlook.com ([40.107.2.80]:8974
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726528AbgCaIKJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 31 Mar 2020 04:10:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eK27NVIA6j9CGE0pUTWvQXv83VsiN21yOSBBcBu+s5HuduYLTCX0twMRXnTlSqo3uyPHMesgK3waJ2cD1/pGNtZvPA7/y1Uj91D7fShjGRmK08RjL0wWV/xni9HNFpJsb83eY2TzKmC9CLUKegkVCO+q9MrCLxKvpV4AjeYOD8RQ5BlY3Xj10AKXYE5NBUlBqa+Hr3HUTHhpuz0jMr3msKg0nfaORs4K+eTNb5s91d15B0BxohAd2Qn1fyPU23vfvR442BTWUMaYhF15bzrR+gg3we7zvGsqSdxD8FZ0345eOagZpy0jDAmYbWXO+3K8XVjSnivmGm/0EuHEom3adw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Q/DEjEzALQNbuFVugb2ybCWOvxFq+KU9Mv12z3EFfA=;
 b=gEIYmHEPo8zhNMiaOo5Yn353ZJTJU7bmORXTy4kZHcQWULqw4jECxTLyPlfYwEIEnxJn6NdXveWPe18NlsRJAoRZxKQUkfSSR88jPMIHLfI+4M2Oo3RuPIUKXzxbGy8nMdKNTxrWd8m8lD4CrW/EvACRi1bO6o9nu+hFW4P+fkypeZgmofTvn3YWiau0O9tp3hjYNaA9DaF+X2PrQedLJSmd/1z1uS/Ml9W5wmq42CUiLExMCZKgeZtWVQXTk0zVYST6SK6L73vUqVIN/xwaVYEruQCAylv2GXwIHiJFxr9FkARX9axQNEpO5nkNIzlSWmAEN5SeFIbFHNZVfvO7QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Q/DEjEzALQNbuFVugb2ybCWOvxFq+KU9Mv12z3EFfA=;
 b=hc2co1l6yk4IIAJ2q9QG0XUpcc3kAgDSZTnlGeH2G5E2ZHWBwLYEAprspxpvfGk+aGI6x8b+TebYYW6YmqbCn9FlhXM76dij+qqJsEFQDc3Gzelc4w9JMj2gNpTmfXHHktHOc+RFiKbdvLnnPJraM0rwyQ9rQkBGZA/hFbVL6k0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (52.135.57.84) by
 AM7PR04MB6934.eurprd04.prod.outlook.com (10.141.173.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Tue, 31 Mar 2020 08:10:02 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273%5]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 08:10:02 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/4] usb: cdns3: core: get role switch node from firmware
Date:   Tue, 31 Mar 2020 16:10:02 +0800
Message-Id: <20200331081005.32752-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0123.apcprd03.prod.outlook.com
 (2603:1096:4:91::27) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR03CA0123.apcprd03.prod.outlook.com (2603:1096:4:91::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.9 via Frontend Transport; Tue, 31 Mar 2020 08:09:59 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4e7832a2-081c-4124-1796-08d7d54ae9b5
X-MS-TrafficTypeDiagnostic: AM7PR04MB6934:|AM7PR04MB6934:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6934F86792340B56B2DF94838BC80@AM7PR04MB6934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-Forefront-PRVS: 0359162B6D
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(66476007)(5660300002)(6916009)(16526019)(186003)(4744005)(6506007)(52116002)(26005)(6486002)(6512007)(44832011)(8936002)(956004)(4326008)(81166006)(66556008)(8676002)(36756003)(2616005)(81156014)(316002)(478600001)(6666004)(2906002)(86362001)(66946007)(1076003);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yDlFy4l+p7fuURa/ESe5Zh6k8JkrmAoLqPXdOnxY7qSmrQMX/uaCUmY6UGyTgL1wzBgxq7Z41Yn+unGmG2zz7Uu1lwvF4MuDl3etowJZJBv2LLPkc4BV3mBw3zF37a1Obs5OENj5ZeF2keuLpA1mHyP4fveFW5B7QxcrP4jE/EGDD4kTfdDoV4uSwIokjI6oR/v33P+aV08cuZQRxnu9EtycPXw2SfKKYloHBoyMsjfj9gfr9PKbVZPi8iwEgLLsiWszJWARObRPHr3aNGCCRakTCgU2ttWkuyyk5veab+KGYDpQDkHV9OdTFgMz3A7IsRrVVRjCF3WowsNUCdt1aljILZA0ryxkj2hrHMVZo7quD0oeH/5jxrhw3PfBNc5q5Suw/SIPTg8okSXMC0T8t/6R0GhCSZtfJ6ioq9MvFmX2x0N7VoXXfzlv9eVdHmGc
X-MS-Exchange-AntiSpam-MessageData: WVNqOpipbT2BRR3nC8UTh3ZOWTB+Czm+Qc2eblSALamI/qvCs/hFG2NO6qgEzspKU50xbKWkzrmWgsRvomm71FLkE/S8PYWsPzrKFMLKC0wijrOTsXhYdjNBHyMDWgM95vondacmQyHhr7zSpPONog==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7832a2-081c-4124-1796-08d7d54ae9b5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2020 08:10:02.5412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZP8HVYInOIQ5q/c0/n/H3z0HeNxFPkXfYhjPlPqb7DCYmp/lFVyR6NcVPiBDIqUTV8CA3qV+n6GLF38jl/drMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6934
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

After that, the role switch device (eg, Type-C device) could call
cdns3_role_set to finish the role switch.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index 4aafba20f450..704c679a0c5d 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -528,6 +528,8 @@ static int cdns3_probe(struct platform_device *pdev)
 	sw_desc.get = cdns3_role_get;
 	sw_desc.allow_userspace_control = true;
 	sw_desc.driver_data = cdns;
+	if (device_property_read_bool(dev, "usb-role-switch"))
+		sw_desc.fwnode = dev->fwnode;
 
 	cdns->role_sw = usb_role_switch_register(dev, &sw_desc);
 	if (IS_ERR(cdns->role_sw)) {
-- 
2.17.1

