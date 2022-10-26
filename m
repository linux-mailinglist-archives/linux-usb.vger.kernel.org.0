Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2F060DB59
	for <lists+linux-usb@lfdr.de>; Wed, 26 Oct 2022 08:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233170AbiJZGdf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Oct 2022 02:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233181AbiJZGdb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Oct 2022 02:33:31 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60079.outbound.protection.outlook.com [40.107.6.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91098AC3A0;
        Tue, 25 Oct 2022 23:33:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJGA9TEObVP+9jfC4Hfdv5JDcgoQW/X+KxlfyrZOezDvyY2C4eC38LSKGqg3w9XpSo+yjT+SiE+m2lw4ui6fkR3tKVY6Tz7c00aoqMni8/oX2C4roZkEtNONIC3JBg0283Q1NmMAhwBLc+koxJ3ylcNKsxPRNBAR0VBXTfuOA6CY7NQgEeOW4tJVtLymgL+FD0Omvxs9TX2U38tjGnOmuZ5yOoVq7f+XY92cE3rVpnJ0vYpphVgrUoDVt5uQOi7QcNmWNG9GnvKElwdXxz6FKAihKUcgI/Mw/H5xVVjz6DcdT35cKrPSDJikKHjbWPj43GfVnrb6XxeD+1kUrK8OvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daT8jiD13HyFZbUY1k1LuqglIJN2jfWzXCVPebGlPx4=;
 b=OXaudbY6G8hpvARlU+fMdsuIXXtzsgqMYoSUogsxIi1yU+1HMB7ktTZh/96kvmY14i0Atys6Y4dVUXeyKPu0g28bhNlN9YHSh6UOPyezumBcavlxItiqNfEZwkFC8xjENo+zywf/uwIk45MEETtVRMKX9ukdWIC3e7r9OiSXg1pBMNQwEL1yCyyZQdTvP5rmBT3a8ggCQjW7FtEO7tzOlGMXgeoj873iYCz0u+P0A0+5ehZwv0/oxwOHNZW11diX9BVm//tGUmlIz6mjZAlflUUkDcaJ6+nQyx67qKBiCF9+3SEiqsROYEjbamcUj6ojJ7/UVzxjJai1yaOa6ZToJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daT8jiD13HyFZbUY1k1LuqglIJN2jfWzXCVPebGlPx4=;
 b=QmGfuSOswDJHbMX+iMlXKqgRjTHtUQvPk+zhs+7kmv8sJK0MWpheyez5WenuVfAbaAKVz5IpqG9J1QtAG2GP6H2WI71Edsos6YWt986ooWA4QHdoUG9Qaj6FT4n1Z7oEVjoiBna13dwNZPLlgobzdDAmFYSUuYRJ9dRRtdFHt5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by PAXPR04MB9232.eurprd04.prod.outlook.com (2603:10a6:102:2ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 26 Oct
 2022 06:33:18 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313%7]) with mapi id 15.20.5746.026; Wed, 26 Oct 2022
 06:33:18 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, xu.yang_2@nxp.com, jun.li@nxp.com
Subject: [PATCH v2 2/2] usb: phy: generic: Add wakeup capability
Date:   Wed, 26 Oct 2022 14:12:22 +0800
Message-Id: <1666764742-4201-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1666764742-4201-1-git-send-email-jun.li@nxp.com>
References: <1666764742-4201-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0238.apcprd06.prod.outlook.com
 (2603:1096:4:ac::22) To PA4PR04MB9640.eurprd04.prod.outlook.com
 (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9640:EE_|PAXPR04MB9232:EE_
X-MS-Office365-Filtering-Correlation-Id: b1120e01-ca4f-4f12-eb83-08dab71bf810
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n0a1/5wkKxvBb5oevZRCxuymu636qzlo4JRlOLZoirJ7aIGkDW48U4C2BhcbI37olCrLYjLg0hgpgmAnbxmNETqf0SdTstDCCJvN+SSq1jGUbkhftozVIjg+0SF2r3RRxf+oHYeifvWKG/Lw5Jnihzja0KRFLKSnYcCwnmE7mzSBEMaJeAUkYFWMI2Wd5qrgjsL2/PTbKwmZeKX3FWofy76FpHV7alXyGVFX1mvZllt43Tnyt71VmK4qIUbbbV6p7mLXHQOBSwAxVY2UlzhbW3FBhyOr3ADS9HDuTv2qapL8jylsYJEqP7EHc0GK4MW6FbuI9AQ3OChVeo0Eo1mVHFpEzr0bdQalUqHJVhfDPJWt4mNSuSz5cEDwY914WTtZsKJF0XP4Ix2AZ2Ncckc0yBrreD5hUBngZycLftlTiO8znIpZGznql8XLCR9fN0tk4Yo31dcsRz51NwKvUmXF4ag3XmGRmSGeuJg9OsOw4IAs0Qx8X1sEp5zAfbkIYg9sp751WFD+my1Zryfe2pgNrr2yHjOU9SIo8wlZXLv4YaUS4smjQ5BenZSrBFc7Ixw4zXWShktVkWbktrPC7h0NFtCahYzhQHhevRP5P5OIvMdJJyq2xgSAYrVpTGy7HdwkAvhIkTbxkdnZXMP0S9uOjd7aZyKboyx9rBZj2722ls83YTtU4C8a07H3Ti0aoRLBvLOtGGTIH+DEbdv2X1QK8Mz+/rQP7EDCYWgRvlkmchNk3BQqeSZ3ejVjgqdLS4IO4I6+Uyhwh4a1WQBjNsgbsmMN9bExMlm2rUEYj7dNwVI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199015)(86362001)(6506007)(26005)(52116002)(36756003)(4326008)(41300700001)(66556008)(66946007)(6512007)(8676002)(66476007)(5660300002)(6666004)(8936002)(316002)(4744005)(2906002)(6486002)(186003)(38100700002)(38350700002)(2616005)(478600001)(41533002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iT0JIlcaTnO1vLZ57LIp5tA10rVBUO1jct9aok4teyKE174YPYJCON1hqmY7?=
 =?us-ascii?Q?sAtHYkp1Ar9aU1GttahG673MFpXGGu/7CYlWsZYTVBuFDjYT7xPlvZEMsomC?=
 =?us-ascii?Q?Rf9fj93QT1TIrXrG3CBRaqzjDQ0Iq2bY9bgPE8+YZ4T0cM4O2t636MPpbPu/?=
 =?us-ascii?Q?pt2Iml+te6awK1sMgv431tEfm0BQETgiigPbJHpI9PCc5aIU621MFXvsmca+?=
 =?us-ascii?Q?Z/QZ0rka+MHm8sZOXHZG7UO017h+hpmZJdxS0NXRMNEH9kr5JI8wv1Z6Nueq?=
 =?us-ascii?Q?is1wUcVZwQtxiXACqQQiVEAC+aeh+jDXBet2pFUVVpK7zIkIrVZOqKiWJ5qT?=
 =?us-ascii?Q?eirZ+Dxr0c9qgAmOxdbPXWVGLWRt1pCfYM7azHiiE8VKlNv5jq0Xl42apT2s?=
 =?us-ascii?Q?yz2OWKfajht6yBlf/DyRdMj97blF2m0AEbcVQa+GVkB7/iJ9A4BZS9I451lB?=
 =?us-ascii?Q?A9weJUkHzfCjgJm8dgXbRCUUkTweTGtsbgkZZrdhZQRNFvSAywdPoh30qOxX?=
 =?us-ascii?Q?TYxmR9xczn/fF+kRcCkRFvsOAFK3a1ebrJW6pXNkkBZo3NGUQU7fVbXjxd7z?=
 =?us-ascii?Q?72PW82KnSrC319zFRHYSFyn2ODeGvWhm6ETY4HCya1mtR+1iV8drJVVxyRpr?=
 =?us-ascii?Q?AZjnlklJZYJgZS3KDKSugSM2t5RLU3wBp+/4mGPGeBIv9TXUGuMO70FeqnIX?=
 =?us-ascii?Q?/T0xS0527qbzLAJCb+p0ka47OlZOg06edwtJqenwzm42yvpcgqH+RmP1SZIX?=
 =?us-ascii?Q?8D+vfb3hdS5jFvWyd1YjuJsNpLekVPw8tJD7GLqN9l9LE+twCqcjr1feZ5z9?=
 =?us-ascii?Q?4vn2Y8jD4piFSQBpypu8YcHeTH1RAF+IDaqRrf5yIRH/EQ9IQmpA3tqxJmba?=
 =?us-ascii?Q?XZAdLWStpOPuS4mhmTzVTwAO/N33E36pT/WbskdMCifpHIYrH1Bk8CoRmoZc?=
 =?us-ascii?Q?psgtydMwXsvumppDTcezmUm1b39iS+7cjX8vr4vkUoMxTbOjPUo/fCIckyXn?=
 =?us-ascii?Q?3rBaCC/wa0ljElEmyKm6nxrFoUOK+EOWzjvXxe2UL5s7KZo9h2hWqjNW0plV?=
 =?us-ascii?Q?UHvZZSLCkbYizpx8VFW/QE4+2jjVGZpOlRBs78NAMW6JWdQ8qTRXvfMahchL?=
 =?us-ascii?Q?cG/Su0nkcmCBURi1LcOdwazg0M/fdMdTTjJwMq7kHA+Cni94wzKGljtcJLpu?=
 =?us-ascii?Q?pqC5lJHP2dT5SzD/DJwbtoaD54+nAEqu+jaFu7T88HDWWE5R1/ud1/XvULj+?=
 =?us-ascii?Q?AA9uZLF/st61sJ7aNPwQaMll+4gpqwn38Eywi1fXzeiJr0GUD8FalIVYmNI2?=
 =?us-ascii?Q?epurNzEs5UNeUVgQVS9RMRiYJ0t1aQu281yjUxZgcRGCw4BDedLT+c2kYsFt?=
 =?us-ascii?Q?Mt4R1PcAV8aDLJhnP0dxXHIkS6VfbAcp3FtqsIIi10GK+5UmDJbeH+67QGmV?=
 =?us-ascii?Q?/2YzqmKuKM8Aw3ccIpM6Y+BekrJ9ALv29xE/MscMYqXYDwn1X5UlvE/y5NZl?=
 =?us-ascii?Q?nQ5hxC+i2QvXdRz8jbB6e0T7y28bKk2KS4c6pcHvEIW0cr32LZPkBNV/G2xJ?=
 =?us-ascii?Q?2j9QlyBRHlUm6bBa0pG3JhODvYO5decNvmx1e1rJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1120e01-ca4f-4f12-eb83-08dab71bf810
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 06:33:18.3653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mxS0nC94cKroZQwncMmEF6pfSibK9HETqZoGhHukffej8eELT44LaeEK599X0Yib
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9232
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In case USB phy is the wakeup source, enable its wakeup
capability.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
No change for v2.

 drivers/usb/phy/phy-generic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
index 8ed9327cc4a5..c1309ea24a52 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -286,6 +286,7 @@ EXPORT_SYMBOL_GPL(usb_phy_gen_create_phy);
 static int usb_phy_generic_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *dn = dev->of_node;
 	struct usb_phy_generic	*nop;
 	int err;
 
@@ -323,6 +324,9 @@ static int usb_phy_generic_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, nop);
 
+	device_set_wakeup_capable(&pdev->dev,
+				  of_property_read_bool(dn, "wakeup-source"));
+
 	return 0;
 }
 
-- 
2.34.1

