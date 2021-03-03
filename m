Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFB7E32C5FB
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 02:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239221AbhCDA1J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 19:27:09 -0500
Received: from mail-eopbgr30078.outbound.protection.outlook.com ([40.107.3.78]:44421
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1442131AbhCCKvB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Mar 2021 05:51:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QhhhdAPOyOTLAhIwKBb7ar6Vx/yvdHsaJaGzLY0fQfzdM7+WNSld3AEHr+wpX6Qce02f32ZZN6Z1TvWf2lcZ+CNPCN4hxXmnzyfzKuMEsCCx84qY1Iv+/UA2ThuhzPOGBYw6QitDZ033g7iD0jLAJtl/FbGx+olDUaAzDndpcG7GUww2c1rIWuoCckbDtUMT1CmBoYCNacrwooY6nGa3PLJMHwBM5mKvC5dIGX4tlHXff2MtKyGW4EjSMvarBDg0THgGAiTBhswSXWnoQ3d2KU1TbQI0ROlFmo9kYhzKAYTTSiRzkxS4yl/S/2CsaMVGT+JQQXH1cNviNGQM313Y7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCpO7DjICBo+IrHLinm9PtH4xiqElS+szSikFTsVHKo=;
 b=Ch9kDyONrAbuCO3b/UrOfdHQ1KEM/QM2zSCgyq7SRpEL7aFW2WBdIM0Bij8tPQ64lKVXliIlT84rah0+YDgutkQt3wwlzm3DQfIqal76RGBlLD4J22D5xY7heaFkzkYXasrMY75Y5d4VZxJE3zGkYY5EmIH1m+3BFG/28JnrVNrx5ol5Y4H9ZF1X0n3OTTXK95bwTEHpX25vn9Qwn0wmZ+s4yrJ8e3Q5wLuCIZ80ocTbMTwNDyfLwBwGYfyDwzC1qUZfDOLDNKV2UItdvkOwApHJTL6SphSXXL1AAkQZTJAkEdad8RYADntCwz4pY6wb3JtjR8tFyFtvm9Sax6jqgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCpO7DjICBo+IrHLinm9PtH4xiqElS+szSikFTsVHKo=;
 b=XOrRbbRGC41ya+X4pV818jVtiwRAHbOVIMKZYS7CErvm2FsY0BDpuZRsAWb50jwqUEutWGYmqrh1UoZcfqWofkn7PEl4S72XWU/ugiVJTsEOS/740/jmEXFH9Fw71zTeQA54uOocoTTGSqekC1RWrem+rHGOfPhjQYXOMGd3vck=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0402MB3520.eurprd04.prod.outlook.com (2603:10a6:803:6::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Wed, 3 Mar
 2021 10:50:11 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::80f4:b88a:e331:c1b9]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::80f4:b88a:e331:c1b9%7]) with mapi id 15.20.3890.029; Wed, 3 Mar 2021
 10:50:11 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, jun.li@nxp.com
Subject: [PATCH] usb: dwc3: core: don't enable wakeup for runtime PM
Date:   Wed,  3 Mar 2021 18:37:37 +0800
Message-Id: <1614767857-12723-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:202:2e::26) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR06CA0014.apcprd06.prod.outlook.com (2603:1096:202:2e::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3912.17 via Frontend Transport; Wed, 3 Mar 2021 10:50:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 72deb60f-2a11-42f2-d01c-08d8de321e43
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3520:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3520FC475784AD0266E0277289989@VI1PR0402MB3520.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Jebopkojqy9cpcRPhCfcOt0Eu0Sz8BuYdZDXecuREEdIiQ5Z8PLTCRUhb1LQzHHJDGvWGdmM2Bp2LqAQ9/AbvF4HNAqMs4aDshw4bgtaysw9EMyZr7xX7qf0kH3Pf3OlPJ0gu4KrXTnmA2K/fjFJPXI9xqKv7Qem5R4icOnViM3d9QtM62/SIfnnfaJEN0kEdexsWic/y2V3K7VBBQIR6ZcI65G1A9sGI4C6PH/Yxjq3dSk0ycM5+kP9Xmk3GH0HR6Ba4KICsoUhzbG/xVcdbJHg9n6l5oSeQFJiT0bHcZ+UHOGHX72Cqp6ZAGTujW3wnHyafRRKs8tSVom08S2y4lSmwTMqIsxrpyk7+h+3CKxu1WUjaw037AmvxzXlCh350xsSWtM2X6J90LANO+xwdsQdrxp1NsgauQaxxyzKFZZc265pzE33yC6o+yrFbKwWO72EOMjG5xBOzkdBYBrvSafDfZ9M25uAl5aiBxUCEgJMoS/Yjhn7HZf5fEMeKFlt1QCMVIBiAzHHjLhaPGGdOW6tdQQ13xjSi4U5tD5+gIo+zKm1Hrn34WpLqV7xPJ039e60eA9wRV7kRy83kdD3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(5660300002)(6512007)(86362001)(316002)(4744005)(69590400012)(6486002)(6506007)(2616005)(8676002)(4326008)(478600001)(66946007)(26005)(52116002)(8936002)(36756003)(16526019)(956004)(186003)(66476007)(2906002)(66556008)(83380400001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?i6IK4ueMZp9yLTv4rdisOV8CtbiDpXSXREeL2igj69xsTaQ3OeWpuacwG+xy?=
 =?us-ascii?Q?/0w0gjW9V4h5LSymkRu+qFJBBeUcuXJGEqMcrvhuwXsFQxjjUNzmgr2oLp9K?=
 =?us-ascii?Q?snN8noGOb9cvY4UauugfYwmO6LDIKMtGh3fhBoHh088LoW3dQG5MhP0xZ8e7?=
 =?us-ascii?Q?BHoUrAsqb+DrwNeG7PsgxRm3g8/EGeM8ivDA+e4BhrkZw6A4BTVZ2xvBI8ee?=
 =?us-ascii?Q?6IlYow23h7YUh2aIm2uUV+WZR9mvV9ia55dt+aYIH/hdHcEBGw1GGERoZ91A?=
 =?us-ascii?Q?hSn6W2Q3r0ZibsRQRHA2cYHQThQbYN5/sdXhTK20qvdSPzxbjuxnPWGFjU7p?=
 =?us-ascii?Q?WklTw/DERyeAq0xTsN98zri8vr6hxKj2wp/EOND62SBpz7FpanCUNN69bXaU?=
 =?us-ascii?Q?lyZW9bJmkZqwv/BIrvEmLTEl3VbL4jj8t5FYrvWyjqYbaQ5vN1tyhdLcy4Rh?=
 =?us-ascii?Q?IBgi4dksm0FVvbjgtKXukFMCKrb1qw3ARPNlNNvtvvqKhQyOYNLgnV28Bhwb?=
 =?us-ascii?Q?qAnnJA7dZGvVHAd423tPQ/2e8Gq2FoM/dVPoa8wERncER/TudNxDylYz0Bt3?=
 =?us-ascii?Q?uJmST3LHkbXq7TDzPu+JPtfHijzO2KDwAjODg3oFruAneAGm0OjUFZKc5XDJ?=
 =?us-ascii?Q?sDi4NHM9jbmOg8XCySyTQcar46DiXxQ0UuGgPAU2btU1VmXD5kHolbF7c7yd?=
 =?us-ascii?Q?zVHZn4maLMlE0+CPjaRA4UbxnCKDkCbq3CAi3qTo0aiEqx3vg8hsS3bUiry/?=
 =?us-ascii?Q?NLtu+vsB/K/FUP6YHwY4WVg94rLDKTuUCLUGhRNbHzFolnnAFft0ax7YHRBi?=
 =?us-ascii?Q?E35t8x1DnguEeFzi2kUcUFyZzBdAu0SG+6WaL+rsaVoH/QMMlAWFpphVMEHj?=
 =?us-ascii?Q?hE5cXjHB6lUu04NMldCI3aCEzFWvcwPOWUiYpgwsSzjPEECZLWZYY+UbKi6B?=
 =?us-ascii?Q?AUyhjHEuaD24GXoS+oXr5OjG5aBX/ghA/45neEAaXF4wK7bbMWqJlG7xOtUW?=
 =?us-ascii?Q?KdEj6hcO+xrI6TBJNQCPTSHJl2cyA4CsB3KdGbLv3JRC+Ms/TsSzLh1eRsgM?=
 =?us-ascii?Q?8sebGrLmfdHFY5alEeqdhkkT0avM1k6583Kk+06R9bnGW8b++qVeUSFblTQx?=
 =?us-ascii?Q?VXcDFRbTk7sJxiqPkSG1UUfAXa+1e15qw92T64YljEEUwnJdvK7GVuYvbpOU?=
 =?us-ascii?Q?DK2AttcUciMGZ3a4GxAm6v2+iZRcXUHy/xLtoh7CSYUP3TRJn/A2sHGza/pu?=
 =?us-ascii?Q?9XhVW9tcXeWnZCTmfi+MBG4rlClDPJfDhnUM4pT5QATDXa9ytfQBxdbMMwhd?=
 =?us-ascii?Q?9iWzmMreuwId0vStvQHVvYWD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72deb60f-2a11-42f2-d01c-08d8de321e43
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 10:50:11.4434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8vywT9tsf1hSqKK4oI4iAS4KxUQix2KhDqxK2gm2k2B2PAps9t2tgnT6PI77DGy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3520
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Don't enable dwc3 core to wakeup system by default if runtime suspended,
this will make the power domain of dwc3 core or its parent device can't be
off while system sleep even system wakeup by usb is not required.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/dwc3/core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 6969196..a8466f6 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1788,8 +1788,6 @@ static int dwc3_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	device_init_wakeup(dev, true);
-
 	return 0;
 }
 
@@ -1798,8 +1796,6 @@ static int dwc3_runtime_resume(struct device *dev)
 	struct dwc3     *dwc = dev_get_drvdata(dev);
 	int		ret;
 
-	device_init_wakeup(dev, false);
-
 	ret = dwc3_resume_common(dwc, PMSG_AUTO_RESUME);
 	if (ret)
 		return ret;
-- 
2.7.4

