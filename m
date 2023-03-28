Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB406CB9D4
	for <lists+linux-usb@lfdr.de>; Tue, 28 Mar 2023 10:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232202AbjC1Iv0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Mar 2023 04:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232126AbjC1IvY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Mar 2023 04:51:24 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2041.outbound.protection.outlook.com [40.107.8.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B24E210C1
        for <linux-usb@vger.kernel.org>; Tue, 28 Mar 2023 01:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsMaSxCLwkQqsxNOxDpYvYlUFM/MDcna6PflAG+Bx9irYWnhRkZQGPNkWHqcVCq//sr628pGt3wfKD+8d63iP5VYRBJqmNClC3IB4KnFn/ORehuCCmdlDNqubjGeJdijzGvPTIInNMnuFAf/cSTFMklEclhBfMgTh3E10ruZs/pWnmaTOWxNa+2M+tmvC/tBqwe+2rqrwNrgwJo0r5KHhaJoF2ld63weyKN98vp6jjWl32SRjYltIFpW1TlluwjdPwIR5OtUyhr82zvKtkWBmj/indEdY6EpPYDCShxVDTvTLPP08H3B+V0eh3dx4umKXASrsSQDYMspgd8dWFPqiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1PCASJqQo/RrpS91AwO3eB8ud6KNH/UAmlESZiPHcw=;
 b=k+waYkbuLnG45LqJ0NAX9RbYL0Q/oy6aBzHMuime6RgORxqMMs+eifNli/nOcDJze3ysnLxfnxKB84pLllJ5JAjXiJGinwG6LsrYzmvhU/aNy0fqVjmnUhwJWVJ84kVN5c+tmOMopxJZerChLcJseLRS8jG6W4hVa64LG7FlojKyDl77rD/1RA4LGz65kGm2SjoTDVHhr2/VeSA2RyTz0SUO8ko72HygXsyP73i3Kifxyd8PEIIhX+dLy7NSc9608kaDfEqJY3s/NYf28tx2wXDp1X/0w4EjsvnpdHSQPZTaIrGILxN/0VrEAqBePsObtMoXOr88CUJeJNowLT/hdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1PCASJqQo/RrpS91AwO3eB8ud6KNH/UAmlESZiPHcw=;
 b=D80IGBDHN7b/5q9eIJdh2mfg88pxIf1by1YdzSS+bxHdbJo9iR+OGKBZH0lo5q2mpegxq34vyGHMsK1mOe95O4wLFBasGz99y8fP1GvvaHR/+Cf+ILa+X59Nww4suW1vmZ4IlVwSG0zTiNO9eaw6zAzXBzwefjtRe8arTsdM4bg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by GVXPR04MB9949.eurprd04.prod.outlook.com (2603:10a6:150:112::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Tue, 28 Mar
 2023 08:51:17 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::5c99:52d9:e4c3:3318]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::5c99:52d9:e4c3:3318%5]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 08:51:17 +0000
From:   Li Jun <jun.li@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        xu.yang_2@nxp.com, Li Jun <jun.li@nxp.com>
Subject: [PATCH] usb: typec: tcpm: try to get role switch from tcpc fwnode
Date:   Tue, 28 Mar 2023 16:23:04 +0800
Message-Id: <1679991784-25500-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::22)
 To PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9640:EE_|GVXPR04MB9949:EE_
X-MS-Office365-Filtering-Correlation-Id: 004bcba6-3919-4221-6aaa-08db2f6997ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zWqxn9rXRjPxRRS2suqtG1E7K/1fU1yBBQc/WW2iU7j8LAGmv6UehtZQBs6ptKo0j7BPinw/zZmywBK73womiX9m8uCpBhkaMyeZD2KruuXAGe8L88GEz50BqA8gF6DzJYdwGWd0KhoOcaWDQGGQ21nryrLDgJIWJd7hXIPFW2jWB9ongtG9sfD+kn2NlGD1P9qwvYPlainpOMwPcfhfwQ9Ewtt6p1vZeKxLFWvnjqNUYe8CAvbCZeYkhVZLp6PTxrlSUFbhAjf4ZPWezNM8lefITfP25Bi9c9YakTGWDKARd316MV2fbU+/AyTiDojOCkPb5KTlm3anWztyLl81AwjgvViDVNzqzrWDwb+Wdsx1WvjvoRp5eD6728DkR8gR3vwVEWRKFdioQ1y4T+PSwXfxvVhzu1MYeHTAOXcT4h9Fk/sbV2hGCVKFuQRrQQBrf3pLjKzzOfGN/Z6jsc6dMSc1MB6sjsc3WBk8fMAK3FYUzGTFjowWeh9z3Zwsx9He+R0mo+lXAtX0RXydVPt65ME2HlqNoLfF9XfxNISBsfuuzCcWciGsrdgILbmkOJpQH13iMkTitVY1K4tklYn3+++wEO2VOCJLC+dLwtJBuzhpU0Gcz/ibRnlQP8bg3HHQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199021)(2906002)(38100700002)(38350700002)(186003)(52116002)(36756003)(8936002)(316002)(6486002)(478600001)(26005)(41300700001)(6512007)(6506007)(2616005)(86362001)(66946007)(5660300002)(4326008)(6666004)(8676002)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MQDdxsvQv+EqG/VU0e0YTRMngYQesx3l9SnVfHsCyM+KJNQdXWNLLPXGslUN?=
 =?us-ascii?Q?Kz4Wed3iiILzI6SAXl2/xp3qvX1RBdU/Pxr1yTQ4WFVK06OyR4NFAULy2PVV?=
 =?us-ascii?Q?pQQfUiJVOIEUmTkGNfFnZoMBgtUUVkCjYUpArPd6DDyKjYizOF/S2oZJpHWL?=
 =?us-ascii?Q?pjeG/dFIgckAuea5HEB4anpbRNZf3VX6MXN2q38fyu+2fGky+iSMlUxywV3h?=
 =?us-ascii?Q?1T91ongtzbJ5EGEv3dBS0xXTE8FP/0EQ9svdJ3f2y73uVuwAg/btKMCHVnNT?=
 =?us-ascii?Q?jgyEzgV5+QUuwG+NHxAJctzCjPmqoXQqwKDrmziCtN3nuDtR/XgJPsMjs0ok?=
 =?us-ascii?Q?3eyanEqEkkqiZXiMdYTT94h1GE0VvbaAahq6rtSZjMflUA0qgCZo6KlwF1uq?=
 =?us-ascii?Q?b4mMazpgVVM6RIEYLtZk2ghljF+ERHo25BprChfS7iEv/lISucrQuNKPDHPR?=
 =?us-ascii?Q?Tk+hn2MXEyj3RD+LytxiWZJQJ4ilwspCP16wIl4UFxvMPFVIFOW/I/FOW8oZ?=
 =?us-ascii?Q?zy0Wf+HFxV9Lc0PPXlpXSdZ+d8MCv0ulA8uA85wwev+ns3btDYs7ZtUvCg3r?=
 =?us-ascii?Q?Z3XTpCp5dxAb5rBM7E7sXMGfFFXFwoXIdLHD6svfZozUvJk3/JsVRhxFN0U5?=
 =?us-ascii?Q?mM6MZmGcHJn7b+zWNABosSTgyXnK5+Z5/xpnL+IX3NyoDc0tIrUFNzeLRYGL?=
 =?us-ascii?Q?zvtWyAebr3K1Z929hHvla70fk3+smpI5ZtRZG1AGsp+Q+o2/mdEiZMRDIOHl?=
 =?us-ascii?Q?10EYyz3ijIxyYw5tFE9h+imTOnOOCemkL6mFSAkafMLdx9Vx+GwmXzsgItQT?=
 =?us-ascii?Q?G55EwCde1a+/ebqICrLosjGGennFw+k4lpt+hZkMew1LpoCAVI4+Zq6ia4vQ?=
 =?us-ascii?Q?AiBSRp6KN5dsRMo1wb5jxSPsLiCAE5kky83q/Qmi9IsgkcHcbT72+d0ssE2E?=
 =?us-ascii?Q?UOfRa0GaRXeEi4Le4mtjtQBFS/ApfM/sMhrNdvF1c/2I8nPSsHNpnOYVJWkw?=
 =?us-ascii?Q?84VBCXs7V+MI87a2u/lQONTURksxV09Aaj5Pf/cBe2/BAaGmBls7U1zDRAZP?=
 =?us-ascii?Q?BS6J/gVaQa6lNKssnBAaGpi9CbVU15Wh+bg365Rpfl1gLzJLcYuKJ25Ab1EK?=
 =?us-ascii?Q?5N09e/lixi0e0XgBJK/4/E1gtDVXuyJeOBcyZwKF82890eEKS8lFzkbh5zo3?=
 =?us-ascii?Q?LYSln0A4kehU9mt02K2jVX6AuogglyMRl0KDm/d/qcwyzs7tBlyLm1dcUB0D?=
 =?us-ascii?Q?WIhiUy2EB2tgoscCzEf3m74gYijx11hJUFs/RzdJ4HGnk5AaKwUacPK2HxMi?=
 =?us-ascii?Q?83PtVz8fmnckp6plIJJVreD+wm7+3HLl3ben7h56ajdcQ7Yjb2oGvfzGjWtO?=
 =?us-ascii?Q?OEplVn4Vy/uZlJyS/4JOvS+j7cWWvWkdZQT9hfXUfIRb2N+QiN4vONjScamy?=
 =?us-ascii?Q?DtXaZA3+fW1SnkkHlsUEF0n8Hm2Bpt4+/xk94gXRHXEnAaSr3s8k1CxTDxoL?=
 =?us-ascii?Q?KcRMoYxvHg5GAEzHOt/a7L8KSHvOZ1mYnh3z8pZBdJwleHdc3VGt8eiZm616?=
 =?us-ascii?Q?L0b74jpyDBmRYdKdAGlg2ALlT6T9ZVdfd8IzfEqH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 004bcba6-3919-4221-6aaa-08db2f6997ea
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 08:51:17.4196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXK2LBFGApOBTM0wmjmmL4h1Hsg5A7Kw5wcU6ev54Ri0BYIiSDHtAtudPk6/LNIy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9949
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Try to get usb role switch from tcpc fwnode if failed to
get role switch from port dev, this is for case the port
for role switch endpoint is located in connector node,
as per connector binding doc, port@0 for HS is required.

ptn5110: tcpc@50 {
	compatible = "nxp,ptn5110";
	...
	status = "okay";

	connector {
		compatible = "usb-c-connector";
		label = "USB-C";
		...

		ports {
			#address-cells = <1>;
			#size-cells = <0>;

			port@0 {
				reg = <0>;

				typec_conn: endpoint {
					remote-endpoint = <&usb2_controller>;
				};
			};
		};
	};
};

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index a0d943d78580..f0534bdb4462 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6557,6 +6557,8 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	port->port_type = port->typec_caps.type;
 
 	port->role_sw = usb_role_switch_get(port->dev);
+	if (!port->role_sw)
+		port->role_sw = fwnode_usb_role_switch_get(tcpc->fwnode);
 	if (IS_ERR(port->role_sw)) {
 		err = PTR_ERR(port->role_sw);
 		goto out_destroy_wq;
-- 
2.34.1

