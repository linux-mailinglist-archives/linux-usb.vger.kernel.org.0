Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 996785F79A3
	for <lists+linux-usb@lfdr.de>; Fri,  7 Oct 2022 16:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbiJGOVI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Oct 2022 10:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbiJGOVE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Oct 2022 10:21:04 -0400
Received: from AUS01-SY4-obe.outbound.protection.outlook.com (mail-sy4aus01olkn2171.outbound.protection.outlook.com [40.92.62.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985911217C3
        for <linux-usb@vger.kernel.org>; Fri,  7 Oct 2022 07:21:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfO2o57pW5eylJ+XsCNYDsdcrYHCxKk5TR8V5bZup3k2b/YZPp7ydlJIG9AjGk02bDrit2OzjI7mSzziZHJWof4nxKDNrkEXmI4SSkqkVaPgOui00rOIEqzcmk1JrjvXtIQY9+uCK9gjK8qIBD+dsZzqJLpoqG7YcypYsO+42m2H5leKL3kDisNyj0mh/MyBnRlladU4wuapowrOdTsdWBm6V8FRjjIVrSYIZQg7dbgNCVSIWnPBeAlK7kyl//rlZrseupseA2qRyTU7TdgOu0RvqDpc/41F9h1IaJba5ZG7l1IweGbLlEYSqECQGe+6CKyCnmA8A3uqTnOKQYrFyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIdBAdu5ytZ67B9JZB/nneJXLg81xKaa0qhv+CktaRQ=;
 b=fMOiyvl6UE8wOe6L3aa3/BYHIe5okZa8cFPXRsOy17Tsg3r7iIsgmp9qo6GK9XBjk2SxxBYnLo0i25IPHIfE9sHhqMFj1a3kkXMqBbirj9E81PKXmWJc47b7UZnyF3O+Jdf8H+rFh7Zf+Obo6zlWArmdTAZ4Lsl8vVzVDNue+xSNfuh0ktuvSmi2MP1rW5UosoDjaPrRc1ymc/NegkfcHOV8w4JLOHLB9u1gKf+XY7TsNJ/wV2eOQKKFzcNrLaeyB7GUyvbXfOIb7V6I8L2DsEvrcpw5hZoz50snhUxcwZWmmjnFCuIn9RbS54KJD/a/j2dzGP62GRSqTMEK926MnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIdBAdu5ytZ67B9JZB/nneJXLg81xKaa0qhv+CktaRQ=;
 b=CX/I3nKnCYLwc6guUv++XIgsUKYqLIPvzRWhMRff3DUumPWUv15KGRY06ZElcBRx4EgCDLAo5bjjtpHayqyGGDfB9CESnbS1qPMocih37n5MFmkAgXdV0RrXs+nXDXMMbEbejmMhbihcyNDzJRAZGdtCS77DO1SRFlDW2M20HIvBx6gw3ojV01EWWJlddCAIdTeUvwGhj0GBW9JGEHx4hUs4Yazn1OQ9R81xmTCdm9FqLZTVdNuKoWdK0nn0fq2MXAmuof9KsEu/e7UK0OjMXXVhZMTYbFl951X+j3z1wuifjf72epAQlh/SR84WP2L7cFjI0mh/fobn+Lor6aKqRA==
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:13c::13)
 by MEYP282MB3181.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:160::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 7 Oct
 2022 14:20:54 +0000
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d403:bdaa:515:ae06]) by ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d403:bdaa:515:ae06%8]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 14:20:53 +0000
From:   Chun-Chao Yen <nothingstopsme@hotmail.com>
To:     davem@davemloft.net
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 3/3] net: usb: ax88179_178a: Allow live update of devices' mac address
Date:   Fri,  7 Oct 2022 22:20:38 +0800
Message-ID: <ME3P282MB2827F9C56A588D9794DC0750D15F9@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221007142038.2814378-1-nothingstopsme@hotmail.com>
References: <20221007142038.2814378-1-nothingstopsme@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [KaqZ3Mpimn6qfqugNfaqMqF1WIHzKmmh]
X-ClientProxiedBy: PUZP153CA0016.APCP153.PROD.OUTLOOK.COM
 (2603:1096:301:c2::18) To ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:13c::13)
X-Microsoft-Original-Message-ID: <20221007142038.2814378-3-nothingstopsme@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ME3P282MB2827:EE_|MEYP282MB3181:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d209bfa-5b03-4f6a-155e-08daa86f24a8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c0LDWWhHfkZQRcI72qCiQ+QVfdzRRshYkZhrFuHvEmlummBBkE/q71ff7QaTYVBMpkla8aM6yqslAMZSk5lB/VoRHdT08LKm2Ni9gantGiaMe7gRifMqnJ5pCe4f37iUrvV6yOPqU344izcssuVIqyxab7J5GVgptK0lQT1HWrks0kCoq6HVKPGY67FK9iieXEkex7P7ZWh3+s1LC8aXFJfq8CKLEs7z5agg+UvJb2bVGJLwac4rBjxl8HXmq/f1PhCpALOUdyiEKiqgkf5QPY2BWGVH6CNE3h843agfq0AhYyV+WQMOy0VmQYNGrj09Oyq2LipxKSW475hEDjBqzVxRwJLRMmUWwnwBgp6Vmy1ILEXR0wE8ahkeeqULhEyuAskkAtmtfB52cIfV/SlZnaQHxv71+aGeqFnxLT/lbgfJz1nUnzHkgH5psvmmxwC/hsa7i8fnR54Iqq1I8qrDOEMRqjuC5lTC5NcyVgu+KiG0gSwYWwvbpNsggyP7M5i4q5ozDitO6eQnPf+Vz8MrwGOv+4grzMmvGTHWj+A2cGo32qx0cxrSWWYoZRfLfEEKgeB7WoV0p4EHMqugrl4KcBZxBbf3NEhJbuUzQyKwb6jUn/wjQnM7KzcK7L+vypj/1jMISs+FhflsTTrARBODxw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VpBrNrakKWeKEuppXJtai6cJJ1ew0/pBVlZfxu2d1Du5D26/F2thHtifLWtj?=
 =?us-ascii?Q?mzMBBWZLeeFjMKkUlzyuEa/KYJ/0kSFa+/IL5kJNvkvNvORRD7TC3egJ0evq?=
 =?us-ascii?Q?a/eECAW4WVHwLpH+zwIMWAuVzpcYsqbpDDEpYgNe7EQO1P6nXntVsbaiDmq0?=
 =?us-ascii?Q?to2GoN533jdajoNmRk16cjl4qauAfx+N4EVOzGNQ2Qx5YlaR7ByVbaRIHMPz?=
 =?us-ascii?Q?V6cQuLjQhwo0Gk4pGo8orVeOhcdYIxOhCRxqar/yPeqlcNIpQL3qPopurP1V?=
 =?us-ascii?Q?rbNgRQHTRD2RnN+DLbNVX2/LM19nJMSZivjd84BJYJs9ajmjplOsSxDkvhzP?=
 =?us-ascii?Q?dZSC0ztRjIS8YQqYInVznAYiu8JcGO0PGyFgcDx3hKPYQLX9ujsXKCEaXKVP?=
 =?us-ascii?Q?aJ92yTkxng85ZaTbFnY+krHZZP/cCzZNCi1waLzLb/R08Lrk2K/Q+7tqTxMX?=
 =?us-ascii?Q?+HXnHy4nyVG9pOlcuZdE06O12nrUQ7LgA9g0wRigANEXMlzN/Q51fedRId8s?=
 =?us-ascii?Q?TVu3WmwqqLcZyRXK+r2vPheOBk1z+oOxwVxvsbsYu+bMWoPpTjpaAAYzHtCi?=
 =?us-ascii?Q?mWtzXrAzGVj1BDrlRVv4z6HMb1gsTisWQVAGclqCWx2jdEDVdafL+lY1M9OJ?=
 =?us-ascii?Q?lIdFwiavC72SdrLKD7WV7ueQY0/erHCDJ1Qa2jchnk/hUiQpVzrD2A/RLsi5?=
 =?us-ascii?Q?0hI2T+pCoIQdMaKKXArBnItTH9A+rJ8LCYy4+ZjI/oV4fAYko39rulhlGX9n?=
 =?us-ascii?Q?F/07lLW+HCvKUC54sILYgWvK7zSbt1Hz063vv5xNV3SFcTfZZukeQRvfodUx?=
 =?us-ascii?Q?Wl8mDsCC2Bk2PP8EF8tlFo6tESONWhmJcjWjByglJ6jUOcVIKnqs1uHnvOfD?=
 =?us-ascii?Q?aBgv3HS5JQBBj1LbuYZzaKSmv9fANzSpttZKc80OAM0N5PbDLxggsD3P5OG7?=
 =?us-ascii?Q?bGqb75Pswgr7zUieSwVp8PjcyYmTquIMO/bj7c6bKKgMm9BW5BAHDqbWMnDo?=
 =?us-ascii?Q?Z6RVhLlg0Nu5e2R4RoFCCsa7ST2rsnn0L5vuR7k4VtQT2LMbimNl/Iujb+Rm?=
 =?us-ascii?Q?wzdtykAyad3/ZsqcIwYTLYdn9X1SgyuF7ZmchSl1PU9q1/96dzHMvjke8BMM?=
 =?us-ascii?Q?4CAKvZBPaDap/l/zgYQxRQFpc5DXaeeHJtQ38RHwJ5pDh9UEUFO0BFLwY0Bb?=
 =?us-ascii?Q?FqwsXwQpti5aOujz+WiJ8flTTxZMo26koEDJlpacMbOnSUs8YCFxIf/nXVvb?=
 =?us-ascii?Q?gX9vDgNf/gVZBkrwqL0vUgYr5gGFswaf5v+LPzSmpfeNzvPqBR6NSvTmTWL7?=
 =?us-ascii?Q?m4Y=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d209bfa-5b03-4f6a-155e-08daa86f24a8
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 14:20:53.9457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEYP282MB3181
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Problem Description:
Live update of devices' mac address is currently blocked by this driver, as
it requires the evaluation of netif_running() given the corresponding
device being false. While appearing a harmless check, it can be disruptive
in some networking configurations, such as "Link Aggregation" operated in
active-backup mode with fail_over_mac=follow, where the mac address of a
device will be updated dynamically even when it is already up and running.

Solution:
Remove the check of netif_running() in ax88179_set_mac_addr(), so that the
update procedure can proceed irrespective of the boolean status returned by
netif_running().

Verification:
Only tested with this device:
0b95:1790 ASIX Electronics Corp. AX88179 Gigabit Ethernet

Signed-off-by: Chun-Chao Yen <nothingstopsme@hotmail.com>
---
 drivers/net/usb/ax88179_178a.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
index 96ede3a131d4..84016e0567d4 100644
--- a/drivers/net/usb/ax88179_178a.c
+++ b/drivers/net/usb/ax88179_178a.c
@@ -958,8 +958,6 @@ static int ax88179_set_mac_addr(struct net_device *net, void *p)
 	struct sockaddr *addr = p;
 	int ret;
 
-	if (netif_running(net))
-		return -EBUSY;
 	if (!is_valid_ether_addr(addr->sa_data))
 		return -EADDRNOTAVAIL;
 
-- 
2.32.0

