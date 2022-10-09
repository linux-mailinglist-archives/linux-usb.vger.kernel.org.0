Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C04CD5F8A14
	for <lists+linux-usb@lfdr.de>; Sun,  9 Oct 2022 10:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbiJIIG3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Oct 2022 04:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbiJIIG2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Oct 2022 04:06:28 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2081.outbound.protection.outlook.com [40.107.22.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D56832A88
        for <linux-usb@vger.kernel.org>; Sun,  9 Oct 2022 01:06:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2hGnSZlAyO9xJJo471Yn3NqchH8gAlu3BfKL0F504djG8XnunemtJYYks9MoklpQp74LywCdNjn0j6eLSdT44OuH65gOfGoWf0fSmlOLjTNNQXi+3zNGylgM7Gn7PXd6aU9o4dGbwLADdMS+Jp96Zp/BAQr/syTR9RSsdiMwECuQgsBE9NOfgVZFfV7qaucgdT1z0nE8u0rz7Rf8kYxaYw8mrFhEQngN0gCyLv37icY0ZoNWVOMWYTJrlQTyturD+9JpcW322j2lExWyZtLI0SkmcRg5MH4L28EIypK4zEFApioNkYZJGF2iZ64udxqQXIjx7IlzcS2z+vT4n2sbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Incriz4fj+Nh6xHEml6rB851kOLelZnvOqxnJrfqoT8=;
 b=KBChHbyziRlO3wfiv7pkpfbphf7Tl0fdzCHxXouvqwa+FAYfJo2QK54u0i+7xMgQCficR7Y7SerI1QXQmL1loN6mbpj3ETbTkv9siIImy1p9yeR3BybqNeHHm5dmq/daRjcLoehh3Sqv/ewqNiKHh7RLqY9APkmjUgKMdpES7rgXz13hHMHqiPVjg9UBhJlDcqmR6aaFZX7Spp4ZGCt6z/4ftF4qyRbFOsrVTnrazKoLtC0Xx/VvKYBuPvZzJYlWolKWw/ygK3VugNgoC2r+kW3mG4DLdz5np5Ajo6NGVJnDKtEzhsLF5Gky1CAIOumRxnR2GPYkPeGl1yLKK4gMZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Incriz4fj+Nh6xHEml6rB851kOLelZnvOqxnJrfqoT8=;
 b=MAq0HE3B1pJtQRoLBHhWq+YyGPgqi6QoiKUuQrvx9r3+29h6dRahH6A2cg3LFi9um9yCLxdwGYC8bMlySBxdRWMNxe2mWQd0ulGa16Ic7Xw4wdNQEfILmogXmUwNRPQ/8SaMw6FAm066KXmpuGzGNm8hZds9F8ptlf7aYouKDX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by PAXPR04MB9230.eurprd04.prod.outlook.com (2603:10a6:102:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Sun, 9 Oct
 2022 08:06:23 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be%5]) with mapi id 15.20.5676.038; Sun, 9 Oct 2022
 08:06:23 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, jun.li@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 8/8] usb: chipidea: usbmisc: add power lost check for imx7ulp
Date:   Mon, 10 Oct 2022 00:08:13 +0800
Message-Id: <20221009160813.776829-9-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221009160813.776829-1-xu.yang_2@nxp.com>
References: <20221009160813.776829-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To PAXPR04MB8784.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8784:EE_|PAXPR04MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: 1344ac0d-7c55-483c-60bd-08daa9cd2812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NqGSRmMpplJAKI0rT5RhCnEi/jjq3K/c4FzjAqeSziBr/7w5bTOIDLzehdSZt78/zuYEYa6H0y+2msRMRnwbv353+waFDBmhWtpCMK3aGyvjOy+hJxWcTziV+EkhX8VP5jGAGWS6Jtqgp38L0XA5zRUt35OxPIkKxrZnQb/GPrjBz6zq0LNpiNCjqZ2tLPSTA/TLUV24ct8c+zxDgtpJ9hTHcLr+tkCUAuUfMWo43RTDLoOiM/No+pmJZy8qXMgeHom5fr7hI8Nq4eieQzGWyxhJRuauJFOxn9GEyY+U23pBywsJnzA/9xcPRI4AMnfcCjrO8dd35bcmPmjDwpK/Dev5QnnBTT/+Jbbf4AiSkQMbqkAiThKzNMib4o6ujvfe9yYNIn7dcnN4mvpVvvDPKnET6nu3+SXW4TALAfDkLiveYpO1fG5PcG7weGov+qg3pMrO1ued0X8hgh/V/GrmFMiIEHsR9v/wSmM/NqijjbzalQ6dSoVtLvrGDBafvWz41oDj5CjnhgvjOmokb8hubXUNhnbYgzJYAJ/BVACxGGuLu2FerBbAOTQp1ARiNxKx/BYDIQC8L1EsXupBYoCcwgfwsU4Z9XFYFKmP6iPd3eGvJvOugVaTzdZGq3VsZGgVWMRY/8KZC+IX851C/UR2DxQSzZ58LflngICNkvwF6bVJZcYBIkVyV3UVmiWkuNQcN/HoVIY0yDPA6dvWGztLfRxfi4vU6NuzrgC+dEa3vnQrU5Ur1Qk2hdi3qx+YT6GvTrzDFkwFHZUs15z6RX90cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(6666004)(1076003)(186003)(2616005)(38100700002)(38350700002)(4744005)(2906002)(8936002)(41300700001)(6486002)(6636002)(26005)(6506007)(52116002)(478600001)(8676002)(66946007)(66556008)(4326008)(5660300002)(316002)(66476007)(36756003)(6512007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mlroBwRZaPYWvLgzU8yrkIlU34YXrGic2Gz4tRr1VjCFmwgMt7yfFdGqymd2?=
 =?us-ascii?Q?uHPKysWtWJ0PPh0IxhIkOYlXwjpwPJjezMNf3XTvmgUehedrV0RFFDNz80Rl?=
 =?us-ascii?Q?2xHdeO9LshwzsBcym2u3jzfqIMtQqPj/K/xCvPr0TRq0m/uIK2biLg5c3kFS?=
 =?us-ascii?Q?+hRUkYYM0DcXSfQ/ixZNox2pSiYLKNfwzAshlcAwWcVgDj4npg8geg6gFkW6?=
 =?us-ascii?Q?gbhzCYOQvcktbRlPVV3sHGHmkbuaT+BmFaLtU4O4KCVEQXx3UggttJTBn+Qc?=
 =?us-ascii?Q?GXWyfGft6hP1vpvbBqD4ZDv/Gb3dr4hs5rEgJf7lfKhuZLBXAo/9qI41gORh?=
 =?us-ascii?Q?Z5D0a3bpRNxDtNAHYdOulRq4/9yEZ0WhMwTqZF05hf0JPHayOCIwS97Ew6it?=
 =?us-ascii?Q?J6fviiM0UKMu+0xdYBqZP4PPXPS3dkzYWTVhwKkk5D8GjR8YxvzR67g4qLh3?=
 =?us-ascii?Q?2lHhiFi5hqITbKpUiPhKvHXMd8MRjKUeqZ0hNP/HJX/UEMrKgovdXyHFwCwj?=
 =?us-ascii?Q?6oz0yuUVgJXJKLvSNrjHCK3Wtq80IuYueXnSx3/1yQm9114P3eB09jnev9yQ?=
 =?us-ascii?Q?hRW76KIhOqqgkouU79SnW7ooPR4bkGTP6Knky1P25I0P0WyVFvUOi3/pcomb?=
 =?us-ascii?Q?HLor+d9wPrf/8FH1Dvp0PJ+f6Ak3dyHI+w0fgbYEqYXA9jm4zOENIni2BTGK?=
 =?us-ascii?Q?SMY5PXpVX8t+vrhg/tTNOKDrfb2jTe/ytSRRa6+RT6NPHoHI6rO2ikOqQ8tX?=
 =?us-ascii?Q?b4sZAMzrrcqwCEK0jWBuZjEAwMCZcQ8345/HSQbleEA4rHL8raUONu4ObDi7?=
 =?us-ascii?Q?ZCKIzWrB8PQY5xqYuF5bKrMf4CgwdhzVjrjAIprdZ/0UiN+e2WPAb/F1ry/4?=
 =?us-ascii?Q?/rveSCjTNfKJLUd5Yp4+jkpWuaOj/6a5EhYRIbdAP987dhdilebpG6gPNUL8?=
 =?us-ascii?Q?Zhj+g1JxOQev4YIOtHw8l+vsxBdRHKR/Qj+Rhsbnp3gYzg+0/G1K40YK75gj?=
 =?us-ascii?Q?F3DFWtNAEW95d3g591DHORQFvtzLcnTx8Wjb91v5z06oNzFllTVGMb8qdY5H?=
 =?us-ascii?Q?yPJU/ig8wxdrMq5ALe3VkP2t/uTwmEziMOMj0zUwxPaQtmRBXzqJZlndRyDk?=
 =?us-ascii?Q?lrHDz5Hd3WA8m+5nfXDrcmffBmZ/gbiNNf8JpZxJ56IS2pizpU/4vfQsdHrP?=
 =?us-ascii?Q?L46zqxFDra6hBvBfvCYrP6qCSMsjUQXppXfMqdPNKNTIAk2moVQPa6r1a+vs?=
 =?us-ascii?Q?AwXleGukGmOVwTphPRm8nRCzOTyWhmv9iOk0oF5fNOnve362jCU7VRWIHtWo?=
 =?us-ascii?Q?YIXmEsH/8bTa5QSaQWERX5s1dSUltgf+9EFLHhdHiXb9vGmq01FHzazeJcGH?=
 =?us-ascii?Q?+j+M4/5MFJwhAWxQUYTbkgSsuMsUhmgr8TFjDS5W9I7WHvXEUJurCUkzx4K2?=
 =?us-ascii?Q?rHn752k1q8r+f6pAhbQZCyEWnRwT8vW+URHQCYRUGY6FiytcJyUM3mInlB3Q?=
 =?us-ascii?Q?g8yVzbk8X9crLsIl3jT9dlhnGP/HZPOSCwQGBvvXaKIWbCY+d+68Ex3uID7u?=
 =?us-ascii?Q?15drSxztEEYqzP5yap9JHlag8cowl4AHAdUARrQP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1344ac0d-7c55-483c-60bd-08daa9cd2812
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2022 08:06:23.4528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2udRwFGDCBTxmk6fnVljvqbExF2GRJqDK7pOCmG2KO2zutYdB3iT2RGO0LnqS5v6HL5wTgP3imfyz+Jkvus6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9230
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

imx7ulp can shutdown domain power supply if none of peripheral in this
domain is registered as wakeup source, this patch add related power lost
check API.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/chipidea/usbmisc_imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index cc17dcd97856..acdb13316cd0 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -1025,6 +1025,7 @@ static const struct usbmisc_ops imx7ulp_usbmisc_ops = {
 	.set_wakeup = usbmisc_imx7d_set_wakeup,
 	.hsic_set_connect = usbmisc_imx6_hsic_set_connect,
 	.hsic_set_clk = usbmisc_imx6_hsic_set_clk,
+	.power_lost_check = usbmisc_imx7d_power_lost_check,
 };
 
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
-- 
2.34.1

