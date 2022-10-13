Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC725FD56D
	for <lists+linux-usb@lfdr.de>; Thu, 13 Oct 2022 09:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbiJMHMs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Oct 2022 03:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbiJMHMq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Oct 2022 03:12:46 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2049.outbound.protection.outlook.com [40.107.105.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC8B6FFF9E
        for <linux-usb@vger.kernel.org>; Thu, 13 Oct 2022 00:12:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j61Kr2WLGU6F2IAWFqh1KSKmoWdgPIEUph+nBRnsKWq4gvdnyzw8g38JZWNtOedeK51GG0pZiw3TRbF9oj7p4y5oGWbpieTP0Q6C4gy9RmnCykZsiZjV4L/cpg58OeAvVTPkQBXq3t02dob4NBVB5WcTYm12HdtrnXSrMLlx8036SRzk314byO8kPxmpxhKecU9oWZ/YcZDVwiSwj4+NAw6ijJdVnt/iJv1EX5qLn7w7nQqir3xfd508bWq/x6o02VuoPhDZzKV5kuBzGiC9su2Q4NVRX998rj08M/mKpNGnE2pW4vfocvu8QbzjkXdl4UGxm5CFvjPirDiMsHt36g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WM5HCoDBRq2Rdwg53v786EuELZBcN932DmTQ25bUfxk=;
 b=UDimFJjXF95LqL+koKSGd2mP3iIBtn1d/N0g9UVsV0r8rCRhkK2S6RQLYtXqJmOszBAgR90k83FrBRzP6b0vry3L+4FtwSjzj6SJSalV9oWlcPfSJw3ny5iQU6Pcnr285SXhxayLTHwh3XoMXbD0KLyGPvNCa4SZ5rRU0hh3Vxy/a58vOGHGfTyUf7icTW6RYsnD7kuG0wF+GgZgE3wl7M1iBJTGO78Sj7kyhy2Ekw6rVGFESbbNgZxUkmIw++nXTMsUv4gGiWby1vXbJ6KvZ3t3qh8+KajKxCMfYMKuz/ws9l78aAnt/N8huQmlWoP+ViHQD8leAtPFEC8i+8viWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WM5HCoDBRq2Rdwg53v786EuELZBcN932DmTQ25bUfxk=;
 b=CC3EZ/H1YrsdYfd2lG67VpVEbac6IzggInQInW3q3Yk/lAGXdT8Cyjo7ZiGkWGOoIC/EUBAW6pVo3mhAZad2/8xCfPjF0mODORykGGq0iWHzx2SehTGEtYLBZ4ZLWzCYadwE9XRIqOKYLvnRIeSol5Ao+CPQNzuIT9dy+VgFI0E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by GV1PR04MB9151.eurprd04.prod.outlook.com (2603:10a6:150:26::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 07:12:43 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::855c:7884:639:f875]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::855c:7884:639:f875%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 07:12:43 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, jun.li@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH v2 2/8] usb: chipidea: core: handle suspend/resume for each role
Date:   Thu, 13 Oct 2022 23:14:36 +0800
Message-Id: <20221013151442.3262951-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013151442.3262951-1-xu.yang_2@nxp.com>
References: <20221013151442.3262951-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0091.apcprd02.prod.outlook.com
 (2603:1096:4:90::31) To AM9PR04MB8777.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8784:EE_|GV1PR04MB9151:EE_
X-MS-Office365-Filtering-Correlation-Id: 73694c24-0272-470b-41a1-08daacea523f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NBZwvxMzlSVEW2242QrMdtu16w9uoRiNeqFOJ+XSaHKUezXm2kz8spbUMB2IefSCjT3zFkn8qa0aSKB5dYwP04OKDvT3PERn/QhqOgfpWYJdHpbug0DilxPY60ZGCC596cVaZHZuXTWFN0NWIBwcrkft69/T5GbPKPtxQa2GBozIupYpSqUUZTpKivPlfMmlJqPWk4Y0unJdr36fgbWY4lGmIYgZbatuZiuS1rplYJFHdPG36wyug77rXcTYz6FtFdA75p5e3ufy8Eg7Xx2OGNqMZyzFCMXUQw4lr+dzLGQ5NYRcfxrv/VJVzsTa8+wLc1nrqV4h3CPBC22yirl4Cc/xq+aDmAy6kX/emzjiV0/ueRnFRKQjZOszzNyyCrjc+AfYRRUQqm8rZop8gYmJSaTQN5e73yM5j2hIPi+1ahYW0d02q8YZg7oGbHh2ZLxnGeCCb9/JBHQztfJ8XSeIfN5gGvPu3FBsscbVhOJgUuL5UrovfCDkwtRbIpyVSSNZvIfVWBtiSGe7h4JYvAj7o8Ro6oiQxIkrpf2+IHC++3ERvp72hvgGLnrJNCg5sydYhbzhuEk7NwDqZhgac63KjxbtuKN6m7YYcv+M1YMqKONKz9S7u1Vaj8Mkgne/04fxyY7qnBQ7l5bBpSXxE3MF5dIyhOS64kQKgO9MbDgnw/djVTMFo20h19Gjpv12l0Ya0JiIWAaDDBBpLnIzaArkA7yB857YU0vT7pLoBmpXw6Fo3t8HuME6KL8BwSZkmbKSPKPXwJ3QyWA72igldLolyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199015)(6636002)(316002)(38350700002)(66946007)(8936002)(38100700002)(15650500001)(2906002)(41300700001)(4326008)(66476007)(66556008)(8676002)(5660300002)(6512007)(186003)(6506007)(52116002)(6666004)(26005)(1076003)(2616005)(83380400001)(478600001)(6486002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qb3kLtaWKHL3Kd7xnHy+RGn7BDDDhcuvr83RVOvOV8sK4IjdufZomRDz4kau?=
 =?us-ascii?Q?0hB7+21fxy/R66eaWRbPwgaJQDZ6qdbvkrOx++X4xZRHTlDRYoOP2e/FtJlO?=
 =?us-ascii?Q?F7UJaKtRF/9j0NG3MdD3KQ+5ygnBW8abEYsBhGyoNjcbsmWXedBKiV7g4GzJ?=
 =?us-ascii?Q?HlphlzMqhRk/aFrXLz6F5N9pNMe/nBi5Wtpyb4MffZ/PzSzB4csaYRI8pFwb?=
 =?us-ascii?Q?KxSUVg9THEzm4ANyFZipxZVS6PhI7bj/JUL9e57Vw+jeBpGxGOqsQkPt9uKn?=
 =?us-ascii?Q?k9HjG29HfLbpZzPf6Sfrts8r1WzgYA8RBoIC7qNJeRERYo/4fTSpXL/efP10?=
 =?us-ascii?Q?qZWqibgtV4vTCfAMbSSUnzPFf69/Su4UOGmIQRdpUF2Vkry7lIv7/pVxEN/S?=
 =?us-ascii?Q?M/YyMFKgwjhb45Z9DLjPX+kQubZ/Z1yGgxYN4X/CaQstoIjbRWoujyeViPz0?=
 =?us-ascii?Q?b/KaXmleoJFkKMXQpgWtofeKscxDFRzBSwFzLeYFUEqu0L3ePa64b4YbzASO?=
 =?us-ascii?Q?y8PueeDLnpOUK+zq6M5zxdPpwELVYXXT8x4XCf0juiYM4UTjvEX73/GOPRvL?=
 =?us-ascii?Q?GJBlooCt3H9IU8i4azVgP8dIV7LptzdbOxk2KOlwjSO3p24Pf6hx0L1rHCJR?=
 =?us-ascii?Q?LOA5rhxTcpUdcuDkdKq2onmwfJSI+6nCnlanf0EUq/ju5AqlKJnM/ACAW8Nh?=
 =?us-ascii?Q?HKmucMzd5eRZMTMB1xiHt3/Y83sWLS1kXMqazOB6Gkmkm8TztU0toiPXADtX?=
 =?us-ascii?Q?xp4BnyJLPwbFn9npCoeOrBJ5spyOYR7cRC+QqfI2qcpGONdX713YtPJZdSq/?=
 =?us-ascii?Q?aVNb4dc3xslEnDcKf+UBXNurqT1axzKiPqwXgzWU56XUrc0yJzmzIUCyCwDb?=
 =?us-ascii?Q?nSvvgY0lfVT2JAX7C3AVPa3Q5kfzwHpNtGbCkKYmJByx2HxLK0q7IWYDyV/A?=
 =?us-ascii?Q?WsQkABhiOKJK5x1HO48qhU3cya3GJQQ88o6w6JtkF68doSbZftLjpoa6hquB?=
 =?us-ascii?Q?Mma+Oa9IPWL0Y2N7F6HkpyjQoNhVmK86KtbwrbPrZz+RcNOGfuQEjX6gMhDw?=
 =?us-ascii?Q?cVgNd84DNnCRvcim7QGqOpDqBeshf9a3nHNP1+Q12oLvUuDiSNEzFDnBge7P?=
 =?us-ascii?Q?noK+hDagGgdcd3Z7p865IxzbdS3JMiQP4evzuLygdz3MjpsIJbrXwhJ/O8S6?=
 =?us-ascii?Q?MUSBTaQ7XcWb33ZvpBRxprSseS5GDdVTh6FFaoKeYcL2Y7F1icjcWNZStF2h?=
 =?us-ascii?Q?yP11pkPRfh7x8FBJlfRGGHonYgNWlyrCUn4aoZpem53l49ockHIaSWwj6gbu?=
 =?us-ascii?Q?f3nCiJPo9oMnWiQ2DYZgxtKrsHt6ionD7p1+Aa9ou56Gg+TecZdPxuwpicmP?=
 =?us-ascii?Q?Dk+yBZrbuvmQwwneImMvoaxKAj/q6cbCfXhwSgQjszZp49JkpL4hoLwpLUO7?=
 =?us-ascii?Q?iq6iBtLd84I1MSlXkhBiPka1kCzIDljZv+4DFY57weZcEDtWeCL97ToOg0FK?=
 =?us-ascii?Q?g7byhMEf2Hn282RHbD0cKYxbQObpjfOBLfyCotNIdssOWAqFYwK1Hgrel8ux?=
 =?us-ascii?Q?TK7wXjsyGpMgMzYj7Rv+/lIZZnun5VmZZ5PfRkdP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73694c24-0272-470b-41a1-08daacea523f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8777.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 07:12:43.3725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: puipm1PtxEEKDYhyaCav/WMYPaDWXJzz5wj7jzMCrr0xmKQYvWqynTFDImEwvuTt/rUfTAalwHNfzjOWVkvCng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9151
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There may be a need to handle suspend/resume per role. This patch
will add this support.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes since v1:
- No changes.
---
 drivers/usb/chipidea/ci.h   | 4 ++++
 drivers/usb/chipidea/core.c | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index a4a3be049910..005c67cb3afb 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -127,12 +127,16 @@ enum ci_revision {
  * struct ci_role_driver - host/gadget role driver
  * @start: start this role
  * @stop: stop this role
+ * @suspend: system suspend handler for this role
+ * @resume: system resume handler for this role
  * @irq: irq handler for this role
  * @name: role name string (host/gadget)
  */
 struct ci_role_driver {
 	int		(*start)(struct ci_hdrc *);
 	void		(*stop)(struct ci_hdrc *);
+	void		(*suspend)(struct ci_hdrc *ci);
+	void		(*resume)(struct ci_hdrc *ci, bool power_lost);
 	irqreturn_t	(*irq)(struct ci_hdrc *);
 	const char	*name;
 };
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 80267b973c26..2b170b434d01 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1383,6 +1383,10 @@ static int ci_suspend(struct device *dev)
 		return 0;
 	}
 
+	/* Extra routine per role before system suspend */
+	if (ci->role != CI_ROLE_END && ci_role(ci)->suspend)
+		ci_role(ci)->suspend(ci);
+
 	if (device_may_wakeup(dev)) {
 		if (ci_otg_is_fsm_mode(ci))
 			ci_otg_fsm_suspend_for_srp(ci);
@@ -1422,6 +1426,10 @@ static int ci_resume(struct device *dev)
 		ci_usb_phy_init(ci);
 	}
 
+	/* Extra routine per role after system resume */
+	if (ci->role != CI_ROLE_END && ci_role(ci)->resume)
+		ci_role(ci)->resume(ci, power_lost);
+
 	if (power_lost)
 		ci_handle_power_lost(ci);
 
-- 
2.34.1

