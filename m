Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46DCA49D64C
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 00:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231744AbiAZXkm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 18:40:42 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:60350 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231365AbiAZXkl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 18:40:41 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20QIucbk025547;
        Wed, 26 Jan 2022 18:40:34 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2053.outbound.protection.outlook.com [104.47.60.53])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3duc16g6fe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Jan 2022 18:40:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2MbTJL7nInF49MoL6dJC8hzXIzIE6JzMLEFOLQIHvzg4Wz3H21mb/LSz0ZVc6x09qQIcpT8FtoutWiRAB3Ya2SihLz5hxLLEm3lNd2+gP/8ISZby2TIuCRaiVEs7HNjlOfT3adUgulPgmVMwqcG/ju0SyWPfuuz0Iv31yzd66sKh9teGSwCZDWBJaAKnB7ekUOd4XkukUAXN/WxbN8/KiXl2VMROgp2GUQwammmni6N/YMKWADNCuL3PohQ6Mj+hcWuSk3K/yyEjFbXyZnEtUlp4mElr4iq3P4PclMUUqJPD9ZxPCQQGlCxdXBk9JB1nNdkIpMxpBToZsBC/NCeQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nk4YKrBUjAobpcfo9WQwgs4vHFcwx7kzFaItAmdvfs8=;
 b=YPXfrnhx7JYscuuzYI6gDIYLZwz1RiJB3u394AIb7U7+k84kFjDLKqdVzM/eANI1bAY+w4EIU2JSbWN9hjQjrwzQXsFAhPB0nRTaPv9MetblJo9DMKr7k1NoV34qVFxoaTaYbRbfJt0xPKidsEbcLWVomKUXd25WzLU+4sM6R5YWGS4xbi6Ihxl17qTYY5Ki+pXVvLpW3X0JAzHoOWa8tPzDsrFkUc8GnDuoqM5ouYQsrBXeFkHgokgzHeLXxEagapg/Z9ooZDs7gtLCcUzoQsb9jGbY3qUUYtkQwhlFKaqRgInezShXdF9VnZ8f8FSQEH4PbVd/r/5u8ph+gpjIpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nk4YKrBUjAobpcfo9WQwgs4vHFcwx7kzFaItAmdvfs8=;
 b=Tml2UeQVmoYtZLDI/mDLXrzeWqIlgplUbqt0bjFaEfXzG/hnLOQi4Bf3oyW4WHEwJ/BAWglTcIr8EsSMTXLlgKgvSfnVHmC8JWaH7LZEJVU1yGhYArfo5/rRE4Jpa/aPcbB8oT8hQ0GY3ITlEvWAI35QMK4IKmWFnbsSVhIfIvY=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YQBPR0101MB6363.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:4a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 23:40:31 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.020; Wed, 26 Jan 2022
 23:40:31 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, manish.narani@xilinx.com,
        sean.anderson@seco.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, piyush.mehta@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v8 1/3] usb: dwc3: xilinx: fix uninitialized return value
Date:   Wed, 26 Jan 2022 17:40:15 -0600
Message-Id: <20220126234017.3619108-2-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220126234017.3619108-1-robert.hancock@calian.com>
References: <20220126234017.3619108-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR14CA0023.namprd14.prod.outlook.com
 (2603:10b6:610:60::33) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4001ff93-4a54-4c8e-0bfe-08d9e1253d63
X-MS-TrafficTypeDiagnostic: YQBPR0101MB6363:EE_
X-Microsoft-Antispam-PRVS: <YQBPR0101MB63631974BCA77B0401AC8361EC209@YQBPR0101MB6363.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qIoZDVDyW3YjSgmpacuuxFIm+zIOBhscMYET+pr+VZkOAKqMaCEDARXdIaNTa1QEDtWt6NVVoJE6OJ8EfjP/I4lfy8abC2VJeIiZixHNOgybtDTlc1KMnmRdJo6OjDixqiYd341Kx9ogpZxtgqbTUVFNxa4r5YXZ+k0OUzbZBXe57phNyZbBrTCpTK3IiniWG2S32/kATqpeLRZj700A+8/CkPtRpQ3Ijzkv0PF/uJmzjpmU6J8D3af+8ZynjyyIEtLOCgx8tOJiB5NyHPPFlHr56C8EBzKP74r3adAHLnmrGFjt225/QqLRBaP3EYa/8PrGoFYJ2YXkSZdFs4U23JDH7anzL5gticUm7yYL0nsG+hrA5+/6ZwX+mgekb67inKIphgSy1exP6cPGGW4njJev4Vd71zCh/bvX2oVGnGN2Yme7Ig4lBtcPfT1KAM1+J0dxH2pZ49kWb34mV4Haq1tF62fai2ykY9ohHy1ybOCezeQyMHj8tj97qbfZvMJhwjjdCxxTNFyWpDTXqVS6ZONeJG0vRRh5flzBOit4s/OF1+zyEaT6EAlD/N7Ii5p/dHRFcD4nJsv7uqU9gYrIFUdVb5tVHWWifB8GMhFmhHxOFt0kt+N7EiLWk+ZHAKcE9LpgJgI4EVeTIlWPZ+/mxBogS+Br6P9d9Uthf4FRCpAxRSAJuA+3RiltQsP90BqW3qceB1PFxSIUQtStTfHoiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(4744005)(5660300002)(6916009)(2906002)(316002)(44832011)(66946007)(66556008)(38350700002)(66476007)(8676002)(8936002)(86362001)(4326008)(6666004)(6512007)(107886003)(1076003)(2616005)(508600001)(52116002)(83380400001)(6486002)(26005)(36756003)(6506007)(186003)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?py/P2iqF6SdD8HeCj6/qCZcxSAxMhvGEGl8Ganv61XQIMAFMb4E/z1QmPXlm?=
 =?us-ascii?Q?csozAX3LsiUH4xzfW1dqx5mRdC3N7aqb7giMObjZe+kZ7hu0Ed8bGQAA/v82?=
 =?us-ascii?Q?qTRLPPAOWRgoQRmSdb09z5+K2+XPwWMJusI75e+CQ10yKH0XtCdVpTQ/wU47?=
 =?us-ascii?Q?Yn5XbJz3YsYbxA/qHWak0BvCY0hiHFRGrWN3l+FtmvkMl37IeOVA0kIMe5a6?=
 =?us-ascii?Q?xn6+479B3uEBsq7qDxdRHdXtr/huhvGvGI56xMrYYSEoNys7TQr/c1YGWHac?=
 =?us-ascii?Q?urQe9LUJ1Lw9P69tInNMHuZ+tulFfAuKjBU4b5iqu/o7H4wvJTVcGW4zujW6?=
 =?us-ascii?Q?4mWnY5Hc4lqLCN6Yl3sbRJD0FC0T/hLihCbIFvVcooDEAOnC2mDvETawOKlX?=
 =?us-ascii?Q?q7o9/sq+PinwYyOKG8A34z9uctaaaPWr/ERdzKxqgkXQpQGkaV0+DasFs6DX?=
 =?us-ascii?Q?ipTVk0UmuTC60zOnM3qibpkIhefZ3IqT4hbRGfes4fQEFa9wFvhBHfZx4xJj?=
 =?us-ascii?Q?DOl7eBENctAAZWtLUgk5h8T9gKVEnL79CV5VMu1C/mmJRcMCJ3E+P4iEElvH?=
 =?us-ascii?Q?7VFp4XrtNIBqBWE534vH4Kr8I9PjlqTSuNKH2+IJlc2X5kytBWhYuBImYm0c?=
 =?us-ascii?Q?L275/pqncP47BgNG/cf0EfaOQ/PN9ylOH47r48TkxATVQg8tjqo2pQQW+fZF?=
 =?us-ascii?Q?CWbbGZtC5BWiQqNYLLMGfysBoBwgvkVqrCIc8M6QGL22O8iJkOBOy7QlRsic?=
 =?us-ascii?Q?8iIRmYZVCResCY8t3MX5m9Cpi+xmbn2YdbiYlUkw+qFNmk7JzSzUvZLl0wtx?=
 =?us-ascii?Q?HTrzLNU82KvregWR5mNVWExJGWJZQs7+uYqOz5XonzHjvhtdmnbSJRnLaMI4?=
 =?us-ascii?Q?o7yr6eYwtIks//pqSA5x5wsQwrxPdpk6vN8NnmCLqFOzAgSfMFzXbiKofTyH?=
 =?us-ascii?Q?KWyaH1536GZJ4Rc+vBqpyuDldhPsIdgxFXAVrUG7iMelHwM0zHI7LFIpJqR1?=
 =?us-ascii?Q?1RTVOozqPx9ULRlifhRbk3Mcp61Ll9eawr8OBlrMBVE5RF3nQxwdBvLuBf5i?=
 =?us-ascii?Q?OHOXuH+UIlOT7fZV+06pvCM2U11fIge1eheZpEx3esF6JbQ8TzI2sD7MCrsQ?=
 =?us-ascii?Q?S0ZXuAeE92p6Kj4MdRCeKH1+Uh9Bgw8afN4mt891OkEnoA6mWFGAZA9P557k?=
 =?us-ascii?Q?dYTM8CrqeZqwVM5Rj+N7YctzvMyKTSK2A75piYlgwLjkuLP245NoBubRpDlv?=
 =?us-ascii?Q?9ZVeHrQtHx2diPHg5To8A9fkMzAvInOKStrbT5HJOeLt88w4gvtue9nyVHSq?=
 =?us-ascii?Q?h9dA4JiUJcGCpwIVuOfjrk6Fkj+pWCJlKghZF2/mWsytK05/ZdwBFyNYgg3G?=
 =?us-ascii?Q?Erurn7qytkN88d8EyJ4zHlr/TN+3EJHCfTi/bwmYtuKSkIr1RRakUhbY/g5N?=
 =?us-ascii?Q?v03eGiY93RNlHFRRVz6KbMC1WW1hAPs6QV6rFRkuZ2ceJJ09yrefew8L8h+/?=
 =?us-ascii?Q?30msf05ahvH39xGmSsbue9ZSEgGN2+GidJokWRfbODBsAB6psMKStORQoClQ?=
 =?us-ascii?Q?2RaLwIJ5IOPKDvkTn4M4V1hxo9zjubL31bKTzMnnn6t25uvpgjuRab+T5R6t?=
 =?us-ascii?Q?N0AJZMIJ5HPZBGIOe4Kxc5RlS2DKwbQylJ5lKZJUXNpkthIE2fGMbrAKI4CH?=
 =?us-ascii?Q?JBM5824KS9MJ49Rjk35u+8IDuFw=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4001ff93-4a54-4c8e-0bfe-08d9e1253d63
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 23:40:31.4732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1ZbQdcesVkMp99AMoHeWIE7MThp2UjbcN2T5aHiYb09NBm3+rKIv3TAQ3wVrBQac0dvbUm++XLL92Aesv0f5YnKyl0TT17tyf3o9PUxMVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB6363
X-Proofpoint-GUID: Jr2hgU7pfJehw8_GdXP93LL6aCNfJlJ2
X-Proofpoint-ORIG-GUID: Jr2hgU7pfJehw8_GdXP93LL6aCNfJlJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_09,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=530
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201260133
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A previous patch to skip part of the initialization when a USB3 PHY was
not present could result in the return value being uninitialized in that
case, causing spurious probe failures. Initialize ret to 0 to avoid this.

Fixes: 9678f3361afc ("usb: dwc3: xilinx: Skip resets and USB3 register settings for USB2.0 mode")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index e14ac15e24c3..a6f3a9b38789 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -99,7 +99,7 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	struct device		*dev = priv_data->dev;
 	struct reset_control	*crst, *hibrst, *apbrst;
 	struct phy		*usb3_phy;
-	int			ret;
+	int			ret = 0;
 	u32			reg;
 
 	usb3_phy = devm_phy_optional_get(dev, "usb3-phy");
-- 
2.31.1

