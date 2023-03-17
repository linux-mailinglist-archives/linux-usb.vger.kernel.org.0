Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E58196BE0C4
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 06:50:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbjCQFuP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 01:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjCQFuM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 01:50:12 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2079.outbound.protection.outlook.com [40.107.8.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0AFC1ADE1
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 22:50:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=luRYPZ3zcrA9WTkRNlEFiBib82TxYw/E54kc4nXxg0LZXkAHlPjPTVVUipmnuJfVLBemOGBo2UQdvhrCYbPKGG3QdiWNYnVceqrHCyz5o1IT/D9zcv3HkXc/onlzmRlLrfKMU3o37eU7lnPs1Wz0JzXA0VIe4t09+uLpl8l5xy4jje25eHwmKtfjaseDq7zKsqUlDV0cIm8G0eZpNNT3MDHHtggfTye8JNCKhGlJzp8BbL7tsV57bnAt/H+OzzF5MFI6Gz9dyM4iiTrWpvIjGhKsCb4JC83S/ZXHAadmPyNmU7CF80I99gz3nbRb7pQdW3909jVcBa6UantzVEDh1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aa0jrAlIfFnp1eQHifxu8upj210L829UF6/5n83kDOc=;
 b=oOl/0loz+QGCSWkWQxNDNyc0eEvqUDmuwxygr+x4D2P9ZtDepHIqvb9eh68uOstTrexRrccozeTVvZFzVLMAvqt3uajrvNhhv/NOJC483e5j1Kj/Y/c58/YdIMzuPf08hqO6F2Ym7pzAUoJhaku7h6+zIo0XuLJbwnwXkjuhGli8QYh1xuL8Y5bmYVtsmbzZODjnghzUsIBXcQ1GuPutAM/41sqJa+jm2fjQqDC6o4ValW0ysoPnqbMjlDjXcy2e10px6Epr2p01GCEZblvz6ft7JuitehF7qxDBMWxwD4ytPEPxH0zlwJvNHj7d+YePOSzKovqQ6UsmbLp2EXY4Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aa0jrAlIfFnp1eQHifxu8upj210L829UF6/5n83kDOc=;
 b=Qqx82XPaezyXYoSxGo8fk6+NU9mfnu80pc3QFeqCFf0m9CbjEKBO1XwgXZh9aO6XDwn5HzEVS1wkCrNOt3009MtTBRGp9a/L38PKruQ8KCoFWiX4E7FNzl8gqIuevIYNo9O7cvETQScjIrQbkPEC5PVYgvONlMUihjXq4LEcpas=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 VI1PR04MB7088.eurprd04.prod.outlook.com (2603:10a6:800:11d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 05:50:01 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6%3]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 05:50:01 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH RESEND v2 1/2] usb: chipdea: core: fix return -EINVAL if request role is the same with current role
Date:   Fri, 17 Mar 2023 13:52:01 +0800
Message-Id: <20230317055203.2366868-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0109.apcprd02.prod.outlook.com
 (2603:1096:4:92::25) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|VI1PR04MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: b9bd702c-5306-4acd-c7ba-08db26ab730d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oujnVhEaAA2rpRdSrTPesmFKw+wHiPAcQ34VeJqJdhDdKrGjzStnLi8WtEtcoYCEe5B6TFDo6PcF1bmXeke10QFSnsvgip2qafwz8QXGpOB3Kzdjv2rppE/yFAtsr3YZCG1pcvhsGxp5FGPCgePk/Srp0cDPeqZ6iuTH9Si2tFSV/Sum1loqC7wBR166w/6f9+IIeJBsJgU04azX6zRojQH1pboZMzV1gTcF1qK3V6ISKea6+gn4yViODhueYk6qwizySUNgt5gzDbE2f7/4JdcvPN4Jul2PDnDMXuxLl6GK6FXuRGh4dm8ckAniu7/oEtKFj3XH4Aq6lAKg5HcpMCViKZZy8eixOM8DeH/K9wesZAvh2yi5Rn6I8YUCCSFxuAs7VVvPMFz7i8nj7j/suFG83Ho2/1yEvQpTQiGBNwJW2BEN8A9iRRmjXcHYWCekn6gvwvJsdLRlLl17dlTQQqLaroiXVWRnYjLtwdM88C45aurhND1aoWVy6Y/8Nc61Fun+MBSgQOm+rLhrPPoFPABprOKkfNdtKLH80xsMOmeox/vOitos0F4SkmYjUSZ243Spuy8fBLX2Q57zdkuykX7Ae03AudELQbuaSkiTuLrP0gGhiL6hlGD4dkc5QUclIhZWhEergCuIoessdspqz4Ybrmm/K2OTMs/7A3YXjhXJ37UBG3phmX9wwUOSKJjqvLOXb1Ci6N+Zg/rUP90nqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199018)(8936002)(6486002)(52116002)(66946007)(8676002)(66476007)(66556008)(4326008)(6916009)(186003)(41300700001)(1076003)(6506007)(6512007)(2616005)(36756003)(26005)(2906002)(4744005)(86362001)(478600001)(316002)(38100700002)(38350700002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UYrpW70yYH6lguvTC10EEPxYYnAHcAhYaN27Jx//BdBD9ZrhLzULUO/C93Yq?=
 =?us-ascii?Q?TZgE3RglKdGHtlFo1MgVM1IgD7/X7NCHThxD4g3bc7C2jMM1EwtO0lANz9GE?=
 =?us-ascii?Q?tk4u+93js+c3XGuo89GvLjBx2jAytuxFnTbAqRPxPv8Q8Cp14DaFAPhRKBjt?=
 =?us-ascii?Q?BEAiXTC1CPvLtmJChcs65QX+XG1x6l8PUfAjAJLczcD3JrzO26pLjHVzT+tF?=
 =?us-ascii?Q?6WuEnf7ug0rGR9YhqWYnOcEMzwdjti20rdm5CvxatsrnUG0Tu7XkNw0feYuT?=
 =?us-ascii?Q?y9qbFZb55wNsuw6ZLTZAzIWqLvXH+DtJtvn8EmZwIBe28C7NYZOrLgm/WlS/?=
 =?us-ascii?Q?BAGj/irg5CBNkWS/mfzvz4vwzFAXqZtIB3hHAB06jpexxgOL+r1qOY/rMD0n?=
 =?us-ascii?Q?qv/J0PET/pcOOjHoV/q7XydVVHz+oVTGYe1aTp/i5emM8f0EjZofc425imQN?=
 =?us-ascii?Q?BnHZ5dabQ9iSVknCxChIrk+RR5khSAyTMdNgml3lLJbNj5RR6pz2KSRjEA5P?=
 =?us-ascii?Q?f1aUZJ9F9C6u87r+YT4t+yqXIr9wV6C5Wm1/V8SGfY9a4wG4mzmUWuTffcdC?=
 =?us-ascii?Q?qgc7yerI8hgkmdd2tfRda6XVL0jK9eYjsu7LPuJbwluCOeh+jq2I5CAOzqGr?=
 =?us-ascii?Q?yqY7h0opCteKudxbtoE2WZy+hOKU+2TAZ0UIFmbGWF4fwTCI+dKxlMB9TXff?=
 =?us-ascii?Q?68WpPnTDlEm8NC5/b7B7idogDS2ih6nh1BWIWl4nFlQ11L/QCxBpIbwTQxNl?=
 =?us-ascii?Q?ZfQkrk+5aR1gXx+M2W4cGtS8DkpmxpqyMgkPWHL7Pn5XzUATB8bPwKwAticb?=
 =?us-ascii?Q?gFWXwk1sFV1y8276MAO1MpOCJYfk/2TirWpA+HdSrH+TjpBqcoD/6Cd7Pwbg?=
 =?us-ascii?Q?vpzlzKw4YOgpgrwXgz0ORpW0KG1ez+S4lPTbiLvVKj/kQIOUHTFkyJIVOm4x?=
 =?us-ascii?Q?P1f0KI2QtGRRomz9Ot/katP17UP8RKdG+BjnGco5AdmQN+oumTM6wFMnp5wO?=
 =?us-ascii?Q?RAcqSp4RH1MRheFZw2CBNsTXEnEPkIjQU/wdKNyMH8ph3nAd76i6d6xZcZmZ?=
 =?us-ascii?Q?fPJFCRvqo4Gp7/BNvpgG5W5H7RpVwWdClO9WsZPLp3krEjIM6yt7S+qE/KCB?=
 =?us-ascii?Q?0frcdUh5PAPVE1G26Cs/skMIyo3OQRdB7ekM6LBBWjVAw4Ch8WSlIj0cXrDU?=
 =?us-ascii?Q?t5O7SPulTKMxfvNg61YEkneySqy8ewIS7BPVH4R4+z70qFyB3uL+/LyZYj9L?=
 =?us-ascii?Q?LOTHMMMj+YKq+4b/ghNb5RqfvAO1+8yOB1Tg/0y6zPYWcwl1fS+7H73ES4kg?=
 =?us-ascii?Q?DGDsvQcRWEJuJrY6Fn7HVm6TqRSy7G4yTl/1kDirdA3yOaWGS5BTf0Py/8Rp?=
 =?us-ascii?Q?qDPC/lTGvmUG0uq0lbjKMLoobprgCPH6qfF6npw2xYI7DjgejJO8S+dS+sKX?=
 =?us-ascii?Q?761IB3bg6ribNVvMxXMieRBEzvz5xgUUc7ujWbQq1fAuHxczk55W7gbAbbL2?=
 =?us-ascii?Q?1t4co+B3DY4V3XgCBqEYRCkxqT5bsUpRfVv+IMB6U7VuUMCDPBBF5ja1Rrfp?=
 =?us-ascii?Q?7hxwlrGqAiSNlWyx8KMg9W8zwc1TMIGoAKLUN1OT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9bd702c-5306-4acd-c7ba-08db26ab730d
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 05:50:01.8040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8zbR+12+Oc4/3CgyiAYehZ2MONFqfLZ9cTGCm/s1ff17ye0EPWNCrMAV0HljUkFVWL2v9ujWRcWnrFXehQC7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7088
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It should not return -EINVAL if the request role is the same with current
role, return non-error and without do anything instead.

Fixes: a932a8041ff9 ("usb: chipidea: core: add sysfs group")
cc: <stable@vger.kernel.org>
Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
changes since v1:
- no change
---
 drivers/usb/chipidea/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 7ccb223ed53c..eae4bf865a8e 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -984,9 +984,12 @@ static ssize_t role_store(struct device *dev,
 			     strlen(ci->roles[role]->name)))
 			break;
 
-	if (role == CI_ROLE_END || role == ci->role)
+	if (role == CI_ROLE_END)
 		return -EINVAL;
 
+	if (role == ci->role)
+		return n;
+
 	pm_runtime_get_sync(dev);
 	disable_irq(ci->irq);
 	ci_role_stop(ci);
-- 
2.34.1

