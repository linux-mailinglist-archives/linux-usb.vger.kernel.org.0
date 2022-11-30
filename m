Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D49663CF8B
	for <lists+linux-usb@lfdr.de>; Wed, 30 Nov 2022 08:06:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbiK3HGF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Nov 2022 02:06:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233563AbiK3HFx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Nov 2022 02:05:53 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2068.outbound.protection.outlook.com [40.107.21.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19982554D1
        for <linux-usb@vger.kernel.org>; Tue, 29 Nov 2022 23:05:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFrHIf6fBg40I0lrqYTEPMx6DA35OgdRNXMwHoSBgNVQy3obMWMvW5MUs2VfXFlR+ObfZ4oHr5CJQK7KmknMwEx6MrgdHrlDIAqNe90nkzNaeJbbjJXXVEPRR8Y1BmQ3DgReGOMSBpmpgVw5odObU8ca/Mzntz4oqWvV4ur+OBlNRrAvLzvu0T7PvgGxx+TLwaJ/8//j97yciEiQqPoYVqJMQY9OmbaQ28QuPUoQdkViNBEfqxhjduLNovGB7cEwUPMqhpwMqF//vw/g+OKdRLsaHJECuP4iPLEID3QxY5M2uOAKlQja5FYGHOuWVhYwPqlLgXd/IN6tWfStQgHGHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukIur6+kjO6oVRpE+csVTTfyXZ9y1Wp5LanX0+o/Aos=;
 b=l5pio9sC3UgLwbMXNADHHBe3dDcDPwpM++Kw5UUvjrFEqrRhEZ13pz5bU9qQYXgCJMkbTLZeurCyy7TzEYa0mGBOH4YIWif/DAb/NfN5xHhym1dauaK9MglEd69nv2CiAC0W0W54G3t6iuTSdearz2OMs2frqDO8ZfzEii0KXKYq9gd1jWiaAWtnhRJwhQ4cYpWQ4gL7M0DRafs4B0zgSFJTbje+w9+zbDuTfZbfVTQ1ccbK+MwbLdAd+YPNPx4Fxfurm4Ax7dVaEhfGfbb1K6bzhsg3F4tP8Xv6KpYPpFrkAA5R8ULxo5qDps7RjyC/XMiteQNaW2GOzRp8x6at6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukIur6+kjO6oVRpE+csVTTfyXZ9y1Wp5LanX0+o/Aos=;
 b=Z7YzJaWiC3eLlMvk69AXy7dx45sqPLOcS/tZWoLKp9hv6o9Hkv6eOduDUuWZOvb9Op1Ae8ASJ4jkOz7RWQEQzbI0TCY5+3MCsvexTbT9MWaMeQfxKcnkL+HIivAsdo8SKctfMzxbVEcO7TUBKefZxh43gti5YZeYwafsLqYmlAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com (2603:10a6:102:270::18)
 by PR3PR04MB7227.eurprd04.prod.outlook.com (2603:10a6:102:82::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 07:05:49 +0000
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493]) by PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493%6]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 07:05:49 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH 1/3] usb: chipdea: core: don't return -EINVAL if request role is the same with current role
Date:   Wed, 30 Nov 2022 15:06:04 +0800
Message-Id: <20221130070604.2439061-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To PA4PR04MB9591.eurprd04.prod.outlook.com
 (2603:10a6:102:270::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9591:EE_|PR3PR04MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: 730e14b6-9f68-4cba-015e-08dad2a14ea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4McSsH5RD9woCwIgvvM366AjcNf/vNLf29g3ibBESDV6aIabC/8IRzKcnvym/yxG9wXkfg5i/Gbuw60M/MwVuKK8OlxUlxYInCXgPvhxN6m5mSXT/Xx48LNU5mdNfwbNCDqTl2WQxgSJjvGcE+Ia0ayVG0vGu3U68PtlP7yPPigZ7mK+Kml0NsYthprElqIW8SeKKXqZui7yRw0o0/CalrsrliH9f2+CDVN8eSbcVBGV/fIW5+dbK5ORwhfczUf7/pKeWg4CDVVK49VXSgCgP1U0XoHY2Ljt6XYAgeYQtNFEo8iqAxagkIpMZAdDoVcxSPAGD49mTCbZaLmyBAN1q8OZx17iHTvUZ7+r1RgKEWDD79HzDs/Gm/pTHrNuCOmzjVKa2DzC+FcdagBfoBgJd96kW2f2zJxdrGb9oG6HZySvDdwHctxBGrxTDwt6T4wFl2iApsyIv5T9FHoGlinL0KeDSz8IaI1oJctciB/TMR14KTdIE7akUiNo1ge5BTDFu9o6Q341SBPd0fIp5YJpLuCARe4n35E0sircuVn3HLzqQrho1BeZMhyH+X24a2wc5NdACl8qv2Ac2z5YT80yHqkKzgRTUnPPCwTOFK/swuVJWwMA+Qj2yM8SPTSIYjmI/syGbRgyZRxCA81ZRQItjoD4q3IizVciHGBXXh1X+hFxph8yu/xYEvlLwc9D2CkR0qdiwXPZu1kacYAPt4kzhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9591.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199015)(8936002)(5660300002)(36756003)(186003)(66476007)(6916009)(41300700001)(4326008)(66556008)(316002)(8676002)(38100700002)(83380400001)(2616005)(26005)(6512007)(86362001)(478600001)(6486002)(66946007)(52116002)(1076003)(38350700002)(6666004)(6506007)(2906002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yHMEfq45urgdim3A/W+xgWX1BMGH3MYT9F546mo7F1HOuc6m9k4AT72tnGNO?=
 =?us-ascii?Q?S/FaNYW7kL2Iuqqg38+epgTebPqhOVJaiCJd/qqp2wK0hdhwQq9hEHAbP4Br?=
 =?us-ascii?Q?/iuraeQSsY00hAcVWaDJHgKPMxp4SchYJEBuBX3IYaDs1WAfkzMDF4n8c/8z?=
 =?us-ascii?Q?BXebp0zoqAFku10H/1vZYHNy6MyVCQU/SNV8ugcz15GyKJiu86OXusZyuLpi?=
 =?us-ascii?Q?Kj6KR9XwgrHm/CAN1HbLW+xRlhtmvmHA9Gs8BOCMvk7pwg0gDgvIxX2YjaB/?=
 =?us-ascii?Q?tXtKrw9VbwYBVKO2qi9kNtJqCEAPIBHlVrPAz/NdfD8ksFfm/36W0HR+T2od?=
 =?us-ascii?Q?/1A44aoZmfKlyBeHhA7fE/Vzb/L3b4kkQJqsyzEW1Vvu63EWqzC2cKtIOvth?=
 =?us-ascii?Q?8GbjxVKHhewS86QNqyBnhujcYlDoCv5uvjggvlcWg729TZGEY0c74R7k2RL8?=
 =?us-ascii?Q?1otObshDwSpzT1/+jxg7tFYmPpOViNAMtqQQ1mcdXcmx53isGJ1P3akOd483?=
 =?us-ascii?Q?TgYL5cyCVZQrwUhTUZQE5AN3YBikQM4UrsOGz8y8UcRgnL/fDRsUAzxe+wyC?=
 =?us-ascii?Q?Gi4QUJBxGOx+lcWZ4g+7d5DI4lRxWOY6Yl9imdMtvuu0PALLTA/ZCHO/yQRi?=
 =?us-ascii?Q?00PoGQY8qbcg3E1Hc6Ix7hHLawXQ1J28E+yvfL+g5qlw8L+8ZsJK6/KPIMuw?=
 =?us-ascii?Q?qhqK0ppR8NreV0xdgR6up25VKMU3YUcHqSMheeL6szEpw58il77fZS3+B2xg?=
 =?us-ascii?Q?zeQU3nZoALPxfAdzdDXJE+P2RfWWXZLyhauhb6vDZcXDxgOO7agYrG2Hv+ca?=
 =?us-ascii?Q?9BRICPn7YHaRn2cqf8ktIhm2iUJFwM3oC/FtAzLhfqsGuTkxx6VLQzgdjBCi?=
 =?us-ascii?Q?vNwRnVkZPida2yMlKkF+zWHVtqnv15K4oszHcBVXdGuFcYD2msB0ITeLhF9a?=
 =?us-ascii?Q?gL/JUw/97NZSTpPtrjNPXaBIBNmtJKtww1zWjWo2XcQCDv/qyBbpW9FYTard?=
 =?us-ascii?Q?sAuaNOzXLhr52ecuCva7fbQy8a3KUIiCRYorzQApzf0R0EFfmocrZcC70Ygi?=
 =?us-ascii?Q?b6dFhPDs64l5+W/wcX6OI1N4KWV1xyXKwk3WFY6qRCL7L1f9BHBmCQNN2wqq?=
 =?us-ascii?Q?+m23I78zykPsF5/5oUwhYGrEDDtn20rFlzrtnJ2kIrN6FC6+3Ejl+VdT+CUA?=
 =?us-ascii?Q?61017XNIMZdn62vrDuqKo6M+6edVdmPJ70MYw41UjGi6wx201szvLV+Jusq7?=
 =?us-ascii?Q?D3JS2PVJaxcpdbzcvqbEhiGYXrPrrNxSSGhehS+UhEZgNxCduFUr/F3V6zxM?=
 =?us-ascii?Q?ZerXzoSvsfQ/FUxKUIKCUaWnoKLjRufr5rhNHyTtY91Ve/QCLsNv/SZ8+9m4?=
 =?us-ascii?Q?f7Z/6WcJzwjbeWuiHFTzt/k1xZ8VcmNqnio5uxH+l+3iLhb1Hmh9h5V0SFS8?=
 =?us-ascii?Q?j+PmQakO9onyn84fV2xiAYpCRsWK2pKLMx49KL4k256uJxDj8f4nnRIAI+TV?=
 =?us-ascii?Q?X1Ya1xl3Kg8Y3P83ugpDJkhxxZW8zNwgbrxz31exshhlWiv4DJbcm8acIqA1?=
 =?us-ascii?Q?v6+S2iOPERo1KT47gNIf+POi6cfp8otXF3zrFY/+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730e14b6-9f68-4cba-015e-08dad2a14ea3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9591.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 07:05:49.5510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKv47zkL0BObJrK9Mpx7YSimFQ4L7wwW6zEF52YDGYzvjv5uQ135nBOjFVkBCk4NhZmRhQao6DnZ/9BIDuRYjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7227
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
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
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 484b1cd23431..fcb175b22188 100644
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

