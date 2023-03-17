Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 645D36BE573
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 10:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbjCQJXR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 05:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjCQJXQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 05:23:16 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2067.outbound.protection.outlook.com [40.107.20.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22B07977F
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 02:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXvpZ57UINBQwQGX/D4zuZ15vfP7RxGVX5a+95i9T5MYHRro5LyOmkIHO3Mva7StCCSpiooHj1XrHvtvA4ERBL2OE2BJW/M/IYFAEvtDavc33AszgfAEVaH09x3mlh4CJlsoVWwcwfIgVW3q2ZWZxAisdN1SaW282GFxOxiOTkfVtnpCbD5AfKMFvi1NhAYJWwmiZQDrL0KlK1rN7ToHE1WR8ZQwfz3cDWuLp6CIIGvJvhlijBkUHiizKu5hxXf2+ebrfaw932WCbrNBsEzUTuE8XxdioOSIHrD4Z0ChOVgArzqXSJkOFU/9OxXPcZlr6v+BT7TdJHARu7iPrGPDOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/K3eRXLZU95mCwWMdEKsL0yUWFc/9TvZZQLXl+aoeR8=;
 b=hAllg5c/Do3VEPDMN39eg2bPrPwDhcHhtvSgixS0HX8pLMciSf00ByFd94Huu57gxefuJ5ScrhpBrVzRCDfXRIky83rrCmu88xyxA/D0cFvFjvTjTBQp2CfAziRxGwX3H4wytiqkddKgbtNh7oM9o7pCQWoY8AopvV6Rvi5+T/CXHtfwzxEAE0tbPlwUfhFSDP7LEXPyIg+Uyted7tA3YiuRvOHrEhpUEYy/lJQ5g4E7sGWsL8ftuAWhXd6mjPUnoixYoZeZsIhwtPnaSJ2p29KT5BNblgFr9AeiXNzEEifJdSTfaLlFdL+Kl6G60bw9/6/q+thvvFYPDB3DaWlcXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/K3eRXLZU95mCwWMdEKsL0yUWFc/9TvZZQLXl+aoeR8=;
 b=TJvSb0qSVsGFRNr/hfPhQql5zzuYzB3kIDNXHlhdrpwCtWDtnfnpWzwDb93dRRxbQ3VWC8PB3b+0lliMiISfBBPU4SghVgiLZRzQFLKX6pgB2gLysXXH2ksXGIfMDHIIHenrnzxANwDZr8kWPZPNDSbFFuNsbWUcUlRDOIdmNwI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by VI1PR04MB7086.eurprd04.prod.outlook.com (2603:10a6:800:121::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 09:23:12 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::5b9d:2097:31d0:c3a]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::5b9d:2097:31d0:c3a%8]) with mapi id 15.20.6178.031; Fri, 17 Mar 2023
 09:23:12 +0000
From:   Li Jun <jun.li@nxp.com>
To:     Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Li Jun <jun.li@nxp.com>
Subject: [PATCH v2] usb: dwc3: add several registers dump for debugfs
Date:   Fri, 17 Mar 2023 16:55:28 +0800
Message-Id: <1679043328-13425-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To PA4PR04MB9640.eurprd04.prod.outlook.com
 (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9640:EE_|VI1PR04MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b3bb88-9e60-4e65-221d-08db26c93b06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v4HiBB3KCr+Ff557LK9Iu/AVBnx6zNkHLqMZLNynkLK9iH7j98UEb/aW7K+ciOIpZCC8GP0WZ+p0csrYG/gmeZkUkXEfeoCN+XRQp3Zc8Dk/R8scrVV+9N0guTMHDvJ6rWkOVpd846ex11uiMFh1EwIWQBLgN64theoebmj9LaLgXTjCohym3KsZjQeELutIzCgzHKWWEcxO0p/kbDDsA1NcQtAQzkollBsTjCUifOsGhxAIr1fxtAfl9KfHuEPnqGkQZ5wVJblGJbhldl4DTPg+UKAx4H3N1zLdsAx1ChAfKIT0iNmgnPKhQY+KnFR1pmn8QUGhK4sajsMg5kcQswvkuWcWXnc1OFOUTzpGt9wsU44WD3cp21zI2uOeCdJlJLCABLFcLISrrlNqMOekZbQFADJNnXl26S5ZDScWrDe0gwlX26J58xF+Ar00EXV4y9UrbMsq4EdhMCf+WKi9JyGkfR2zOTHOJuj4AkJHaUT6R3p+gQwZkCX5Jq0uil30k/CtI7TysrOVOT9Nr0qGL+LFKzXaVJ2RUrxK9ka5cbOtf4QfoRRhNpHV55ss/pQGORDPaCzt8HdXPzcDXhADou1f2HMc01V5U40K9z24669cHsJauFxSUZOsnMYlUvMlfsgQZV8W9KstP+zTHaP2kzyCAlBBQVEWVuhcb08Xh8dVgqG0UPFGC8jWPLJUavjpBAXhLenhhRp+ocaYb+9yeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199018)(478600001)(2616005)(186003)(6486002)(6666004)(316002)(26005)(6512007)(6506007)(66946007)(66556008)(66476007)(41300700001)(8936002)(5660300002)(4744005)(4326008)(8676002)(38350700002)(38100700002)(2906002)(52116002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6E3MvMUtUajdJ4ALx7Lj7EIOdT67Qru+RRuSDVrj6EdS0MZdlTvONN2/fKaV?=
 =?us-ascii?Q?IGTfOzoNr49J6Nq2aQvPTm7oDaa6OhwiZg22SdWDxJwGLJE59wxfG8SaX02Y?=
 =?us-ascii?Q?+t1aAzsEEtF6ZNujifUhjBXs7absVjBxttu+tl5sUdn8TKljBKmZL5TjcFyy?=
 =?us-ascii?Q?6/OZnm4YWfRCyfZK0gxfT/Pj4XFKtYWgiHvo+IR8xARDbszHd3/3FbiKwkFZ?=
 =?us-ascii?Q?2Ib9SkTWM5h0FZ22w5cVvmBMRqYOFjAbyboMcRpj641i5Tco28JSSi0x6z8z?=
 =?us-ascii?Q?eh6yy/HcnC3q48WlwfbTvvtKSPj78UbLAHWetI0NcTlmJhwD1QtZleflyCtq?=
 =?us-ascii?Q?h+aUwsgZVQ3GLvAgZlTv+Cau6F69EyXotP5Wf9vqkMUCFphfOjOdjX8veykN?=
 =?us-ascii?Q?IBONREp98jCFwRcZB3a9BvNQXQe71FzEMg0NNsPFZnHqWkx+qC8NLWPQcE5d?=
 =?us-ascii?Q?WHARBCFHrPMYuOcVg+h5H7gFE3d4U8uuXkAC18Pv6LNfRwOD6LgiGubwFDXJ?=
 =?us-ascii?Q?rKFP3lg8SXfuq0Z64nbhunWw5bFTQ9Pm83dCgFZ/Wo65c/BqhCvyGIGHbgzy?=
 =?us-ascii?Q?zl0JQER1JH1H3VGO7wIid78n0MfU1MUjl/XkVCZx6iBR17NTuzglGV/PVP4d?=
 =?us-ascii?Q?HZWm2XOPwFqRczOSdVvf2gBMDRau053xzatUEQiaoRGmnK3kfp9jNjIpNv+c?=
 =?us-ascii?Q?l1SsvqeocaysZAcSA9ak01UjYxustx3PquiTIPa8kpi5ikqhJfvhAfNJfbfH?=
 =?us-ascii?Q?KNfCi+wwsAw29RhvbArahZR3wdYM9VmyjgpR3LjAMsI5aBQf67UzzOeXSFOV?=
 =?us-ascii?Q?3kP4axE4Q06DI1D6nXr8yTHzExefRl5QNRYMb2GdxwL8b7ModhSDSLtRw/qr?=
 =?us-ascii?Q?KJe7kEdQ8puC6kvgwbT8YA86XcCsoC8aPLb/qD8sgeEj4CAG78JgiVSblO1B?=
 =?us-ascii?Q?kaHW0bYaF7qQVGyG2SGCzbJsvdKXUAdny9rebtG+WnmNHf6OdnxMMd9oE36j?=
 =?us-ascii?Q?cmSXPrw4TfRsLIYvfTl7NHw2mpI/ZwhVjM5B6vDH9qKPdJUvdniN2P2Q2drA?=
 =?us-ascii?Q?ypASj0nKYMsO2TkceNDHWzlfEcu0cyalyNfp2tmtek7TFXZsoWOgi51eNpPR?=
 =?us-ascii?Q?mk4VBWCOVd3nVuQpReohwxliw4m3HmamFULXRUpU2O9zOwD/RoeFp2duqYaD?=
 =?us-ascii?Q?JMNBX//+L5poTjGfX0s2d3jcDQ+GKZvxSk4WSf2p+hRz6b23HqW7byrdMFkt?=
 =?us-ascii?Q?qS1xnOVvrVkf+Mf/D1TxtpfFoso4AX29dvWbsoxe7kDKavT3Okb1l/HOMg0Q?=
 =?us-ascii?Q?VOO2mNAnQ4r0wlD+HgGN5zPINW8z1WYkmdfxCmfqFMjwZ+aXG970blKIP5EX?=
 =?us-ascii?Q?Sl5NGriAxU8nGa3v6clKO00y5HNYpb2bIPdcRfirLmkFzBYo6IPKfnVgeDeh?=
 =?us-ascii?Q?1NMkBwTvI/BWm+YV3izKeDNdRlNXOKkCWHaC7Dl7XacL4UNQWvOc3AbBBJS4?=
 =?us-ascii?Q?ViNm/44LL30Z2wH8gMH4vSDdzkxZlFblncBN+Gv4gRQB+Eaa8jIiQZgQIyjf?=
 =?us-ascii?Q?Yw+F8WEbiwc0HH3qsUp87XJfn7RCMLuF/cZ7UmNX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b3bb88-9e60-4e65-221d-08db26c93b06
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 09:23:12.7189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbxFWO4RaGDVseqrdSqKj5nvtCvP1d2PFICVTkQxP9YqT91bsMZukEW9NeEsobxr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7086
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add 5 missing register dump for debugfs as they are in use now.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
Change for v2:
- Add 3 more registers dump for debugfs: GUCTL2, VER_NUMBER, VER_TYPE.

 drivers/usb/dwc3/debugfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 850df0e6bcab..e4a2560b9dc0 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -88,6 +88,9 @@ static const struct debugfs_reg32 dwc3_regs[] = {
 	dump_register(GPRTBIMAP_HS1),
 	dump_register(GPRTBIMAP_FS0),
 	dump_register(GPRTBIMAP_FS1),
+	dump_register(GUCTL2),
+	dump_register(VER_NUMBER),
+	dump_register(VER_TYPE),
 
 	dump_register(GUSB2PHYCFG(0)),
 	dump_register(GUSB2PHYCFG(1)),
@@ -229,6 +232,8 @@ static const struct debugfs_reg32 dwc3_regs[] = {
 	dump_register(GEVNTCOUNT(0)),
 
 	dump_register(GHWPARAMS8),
+	dump_register(GUCTL3),
+	dump_register(GFLADJ),
 	dump_register(DCFG),
 	dump_register(DCTL),
 	dump_register(DEVTEN),
-- 
2.34.1

