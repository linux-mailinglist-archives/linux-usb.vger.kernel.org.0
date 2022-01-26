Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3F149BFD5
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 01:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235094AbiAZAFS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jan 2022 19:05:18 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:64533 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235091AbiAZAFR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jan 2022 19:05:17 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20PMWGMO019211;
        Tue, 25 Jan 2022 19:05:12 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2056.outbound.protection.outlook.com [104.47.60.56])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dsyrhrssf-3
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Jan 2022 19:05:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPstjHYf9qW5c4hclkAK5bz7NlGZ82WjzNc1dNs/BudB7UYjjiJ2dwC8C5WQyuTsI/TZni+bICz/dsGNX8+EuJ8PuoNnW6GrEMzRcem9n9JixIsTdDpNLRnv+/rfEgK1evQ2CC3NLvW/CGFT/cRKx1ouFaDdEjSj0G3Up5cPvRnYNOCxcaHNMRMgw/vIRur5fDH4bAjtp/x12WXa0URlB6P0+OX0KhRGtA+VFxirQtwwQHqqUyZ0QrOjIWszZlhNJm0vAJvja0ILR7kB06cpeXn/mad6Jtlm9jKN9ppxxuhqtTJgvyLykv/gzvZriw9/rnlcSz4U5HyMb36DRbpJSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mwq2Gm/DfxYNkLivgHsuOWf652GunozTKLRE7iW0p7c=;
 b=cWr2qc4TJUAvEUL7PO/tBTq42AqbQKaf/j+wyvE5LD0H3fUVdFRdCe8pkmLxLDDQMQLpgRPM54CQEpdBGdNNKsoUU1FO5GUdmlySsEEisLrW95v5zx+VB0XOSBWAdTCqxMH1p3KJ72BGOMaOa2N+yIocVI03Lw/aPAfJK75bRnjFZE+eiimGCf/bfpsI9xBrfk/nFXyKzu13zBKlhCcChLJHQRAapVN97+1WZsZZNrtsHFDElVX6WKhffDHZgfUrSlbEzCEokIA22VOW61GCQVPepZyv7MxTy0hWDiKPvMrIu8/+P5ZgvDSIyodk6otKe76BbRVCoXRef7x5XT8TzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mwq2Gm/DfxYNkLivgHsuOWf652GunozTKLRE7iW0p7c=;
 b=IyZZ9H/bguxCU4UyK55dg0TirEL8Yr7ntbVLtXLhrpOkGahnnQ0OQE75DxJ43oQbyniJqqNNTtNcHkJl9BgujNkVoLBKmqLX3R7HkQ48eyj4YSu1NUcKiStyrYURZOv/o2SKm+reu0ASxwXz308RR/jeqsjeYgCwn/14Kev0wYo=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT1PR01MB4172.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:28::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Wed, 26 Jan
 2022 00:05:11 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.020; Wed, 26 Jan 2022
 00:05:11 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, manish.narani@xilinx.com,
        sean.anderson@seco.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, piyush.mehta@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v7 2/4] usb: dwc3: xilinx: Fix error handling when getting USB3 PHY
Date:   Tue, 25 Jan 2022 18:02:51 -0600
Message-Id: <20220126000253.1586760-3-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220126000253.1586760-1-robert.hancock@calian.com>
References: <20220126000253.1586760-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:610:32::21) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe7df729-f30d-4690-c10e-08d9e05f852e
X-MS-TrafficTypeDiagnostic: YT1PR01MB4172:EE_
X-Microsoft-Antispam-PRVS: <YT1PR01MB417294B9D66B0D184844CF50EC209@YT1PR01MB4172.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jYQxlUs+Eh7pKkMzkhq7eDTRVfSniOgJnV2bTyLcscTdSReBv+egKjkVVUbKQ5TH4XBkK//vsB/ngSVfRqXvzvKfPYCbB+GOcm+Aj6+UIqD2jfWcujVp8dqNUZeBjdXF68d9zDH6IIumDfhjekZEQqcE1B6wKF2Ks+lKqmLqaDeS279XynaO9Dom0HJCj2632NhkvbTmxXJkAgWG4qJzsU71WRIRot6pBmOHf8Xj2jGOiJW3zx8gv8G4dAZ42dy4CBDd2OOON+YThblyzhTxm4/Ft9jvNjwHoi7b2bsWaj9HanJJ3hOBRDM5HQ5eHP01yyUqQwDsHJ0lF5h8+XrviF59QuwK51vOmXakmHf4wCv6unyUKT9r1WiUTF/hujiudtJxxkLaS3yihLl3/dYmwnSR2216qzLDaZ97pt1S6KtadJbrae6VRwoVY8Yo7Vjyzlswu9EG07jYoCMglr1ChIg24NJosiutzm9WWGF1owl988cSNFuG3VIQp4y6sw7JnChr+DQ0Cb/xyOIgwyinbZK1S2vvPvlYFJx+LCpgg8DQT6S/PVUzhN6GUu0mh1Fu7vCqM+El4brZzXaKAlI8gijpC1r0BkjPfMLnoHh4WB4wv8ZWe3A0r7ZX4MgsbRxniMUuGYhRNY45NXesYL8yY+MCqkspFYEtC43En8w3bhOB8Vkdj43ef1XEd0uPspEqm05sBSSA2yDHsXOD2bUnwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(316002)(8936002)(52116002)(36756003)(6916009)(66476007)(83380400001)(186003)(2616005)(508600001)(66556008)(66946007)(5660300002)(26005)(6506007)(1076003)(38100700002)(44832011)(2906002)(38350700002)(6666004)(4326008)(6486002)(107886003)(86362001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5apsMSXUucgVIdoOa9R9/HFjXYcPAMzAhQa53n6sr2RlFYxgZyTmnp9phSMl?=
 =?us-ascii?Q?v2iXAQWoAIAeRNYKBlOximx3z8u0zNZS6WVCNUuBaw2OvEfikMFPSaYwmcxZ?=
 =?us-ascii?Q?k9qjcAhhgfr2WVlX+C7dNn+MaFZmQwkC0J7J2jZu00nJtEEXlbHf0Wk+if/D?=
 =?us-ascii?Q?sIHh3DnnqavSiWgMO15UTGrL/a2TFb0oXP5Rf6YeUQ/ZR4UmosEd7VwLoJkq?=
 =?us-ascii?Q?2WPJzQj+CntAwn5LRzHaKadgtesuyBaoCu97bN4RVUdGWUDNbb1mjz+kPNGo?=
 =?us-ascii?Q?SY9x2Z95YpAuywBkLhAQO4dPJL7Eg3nxS2BFKg6Vs9rwp0BmhSd/uSUQ9mN2?=
 =?us-ascii?Q?X0b087f8WiunusqHHhFsHcNlHUua3gkVPNp/z/SHNsTFk/5KE+0R5odNgXyj?=
 =?us-ascii?Q?yoWYRlcyIAivegiAYkLGIy7P31CEF13lEu/VE8C/Rv4ZdA8KhILVDdiqKf2U?=
 =?us-ascii?Q?e10qPYsqjzL+1ACGllejsajlSpLgDVFX5Svs2bifudv4ArwB72jQWD2JwPH6?=
 =?us-ascii?Q?8F8HbUKYG4CWm9BSaHrnkCx8B2NgeG3l3oMFJcX60ZnDobl4xO7okNxTDXfw?=
 =?us-ascii?Q?lLxcgTSx0GKXQMtMO2/GvzmARC21w4zYrMdpJf7YBMtkNTqNXxT7tHaHU/ZA?=
 =?us-ascii?Q?zgGudM9nLmXJlDBR94EWp//zi9KWddZBcLR/UluYDZJ11GDLYMBK9MhoTZ9O?=
 =?us-ascii?Q?dF3srsIckRQeQ7r0yf5Bukrndl6cK1vQAB26lT/Yfl7yyzuOdTPVVBkKbHP4?=
 =?us-ascii?Q?ZHgMUNJ0Bv9FvYlnb1On/UjHH3siCme7YtRILPhf8NaWJbrF/PUFSrF+ZBbQ?=
 =?us-ascii?Q?xps8m8mwxvUb8wQUhHxHnZQ69HtZFIOgbT6zjC1wrO5EADmE/uQYNWVCiO+O?=
 =?us-ascii?Q?RaaS6pJBnehBhTjin8u3v5W8zWStAYY1r4zAsePLHrwIWdh9WZGpfr8WYvDM?=
 =?us-ascii?Q?MpcNe15ZAb7B27Mw0rZTEZH+GcwVIZfdhJ7vYg/zQRuiI31tEYEosvlOiTur?=
 =?us-ascii?Q?FJHbjj0BDZt7qo035iixc3/TQccyXDip9Ugv0qPUBRCZKrML5XZTzx55yLEz?=
 =?us-ascii?Q?obNrHp3oZ5SsLs+fYJ1PJ2pwZU3nWPR4wqkZL2PXeDuRRfZpYOllMCCEIQdL?=
 =?us-ascii?Q?yt0szmcPKNd0hedlbH+wEl//LTqWFyv9gAwbxsvW+baK6sf32n5XbLOZHg3R?=
 =?us-ascii?Q?iLQdpUoj59gBKu5oYg/Z0d6iMVQyFpq611HYgqQ7WRm/zPSK7Klbn0Nk064r?=
 =?us-ascii?Q?mmuM0aPcO6yhyFcmLFlv7VKLMG/2hlLFajAcXfM2Av0JDTMzjeDZzakZHlrC?=
 =?us-ascii?Q?T9mkA+ZcLPNxYfsjtxi0atRfcOfta86OaENFsCj5IadbWxD/XUyLVDTkfJ4c?=
 =?us-ascii?Q?+zeiMEwTar62oMA+N2HgZU7PxPLuxhFHEBr72TfYWBgCVz6vguReM+DhhSc/?=
 =?us-ascii?Q?CV3VmBg9kDLloEueqjiMQwjEVzvppeMSDkVe9DyyIzp4VOGqB6PM7Hb6s6xG?=
 =?us-ascii?Q?1Ydyd02ikFh2D5tDchf1cuYZnY5ufa419Z5PmpRq0sDwbGpxAlQ0v0YTleBI?=
 =?us-ascii?Q?0LdLlOK6NbBOqwA4HU14/LzR0um76wyP0Gt18DoLuItxmxzsT7ep4/6KAWhl?=
 =?us-ascii?Q?skpBQCX5nNy2UFYNbPnwrgwJIsFYq5g7dPdQqtDfSAYXAP3cjzaSnxhK0vy4?=
 =?us-ascii?Q?30iVw5Mc+x00WOMNv1IKmY/PUPU=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7df729-f30d-4690-c10e-08d9e05f852e
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 00:05:11.1834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yGiRcJJRp5bbQbuyYFdQDVPiNgt7Wf6wS3sapa6aEKWnAEao8NqSSt/ZVVI5Q8NAdKp/H4HBOiSq9GmbZVO3vwP7gQPuwlDxrsiFlc+i9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB4172
X-Proofpoint-ORIG-GUID: 71TiUZaQqR0dmeS6YuUpt45dIfb7Xv6S
X-Proofpoint-GUID: 71TiUZaQqR0dmeS6YuUpt45dIfb7Xv6S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-25_06,2022-01-25_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=599 clxscore=1015
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201250145
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The code that looked up the USB3 PHY was ignoring all errors other than
EPROBE_DEFER in an attempt to handle the PHY not being present. Fix and
simplify the code by using devm_phy_optional_get and dev_err_probe so
that a missing PHY is not treated as an error and unexpected errors
are handled properly.

Fixes: 84770f028fab ("usb: dwc3: Add driver for Xilinx platforms")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 06b591b14b09..e14ac15e24c3 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -102,12 +102,12 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	int			ret;
 	u32			reg;
 
-	usb3_phy = devm_phy_get(dev, "usb3-phy");
-	if (PTR_ERR(usb3_phy) == -EPROBE_DEFER) {
-		ret = -EPROBE_DEFER;
+	usb3_phy = devm_phy_optional_get(dev, "usb3-phy");
+	if (IS_ERR(usb3_phy)) {
+		ret = PTR_ERR(usb3_phy);
+		dev_err_probe(dev, ret,
+			      "failed to get USB3 PHY\n");
 		goto err;
-	} else if (IS_ERR(usb3_phy)) {
-		usb3_phy = NULL;
 	}
 
 	/*
-- 
2.31.1

