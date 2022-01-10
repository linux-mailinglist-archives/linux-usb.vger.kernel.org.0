Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0E648A043
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 20:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243289AbiAJThM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 14:37:12 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:41008 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241122AbiAJThL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 14:37:11 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20AI6USW002276;
        Mon, 10 Jan 2022 14:37:04 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2051.outbound.protection.outlook.com [104.47.61.51])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dgp68r76m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jan 2022 14:37:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUTeONUu8onWEV8SAPtyDb2HKYrsQECg9JUoY+8kc+CjKKxYlKoprWyu50zGfiseTCQ/mKzyBHYvD9Lp59mmqzI/6TKYBfCS5vQ20rkyjawabiIdaFSmX5WZWCQetj6sK4gf93Fm90g/Gtp6GCCjxw6IHNPORJXySYwlwLh7ArsQp7zC/TyTtWp4uWXz041ZcBfT2F4uTJa6Q9rnSCcSf185UjWA4awyyL8Jstf4oar1LYxJfYZC1if5V7IeATpSOglvbm9K25vkspGyoHkljuqEgkvMz8Ewo0bUfyGTBCdQ58phA2k0s0uDwj5DH2svVLvJNsj9VYPC9DpjIKSASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/I/22Z2oVsG1IyKTu+TUts7zPyN/ZLXHjCb4USg+lXs=;
 b=XN3je8sj1Kqt3YyBKjRglwDzNTXjUQ1XW/iKhuy/hZ9pyBDdyDOjA5LHlzYH4CH3BTnh9SUYxZzq4Pyxqwlfz3ecEgaDzHA92fsrF9D+3ZFVdXORzn/XpD/Y2UKa6wL33d/eCmWzoJ/ZpJi8yX2Ksb5jGImkhEH2bL8xsLXFL8EG2Cxv4bg68/5wxfFIDByMd9OG8KMXW1yHGNaeUAVKfQbNikb8K1laCo/T3aZGmHskNordCelIOHGB9NCneT6jtQ2r1KTNVxXLpr+Ce8QUcCjcH/u1Tjc/C48NAdTqluYd8p2xb73T4UP5YxlVX/KTY+1dlkiebqrYeHHGeR3hVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/I/22Z2oVsG1IyKTu+TUts7zPyN/ZLXHjCb4USg+lXs=;
 b=ge0U03nRaZGzy/tdDG8mCHtAeGus8ywCfmCc4Yr0rb8ziEw7pyacw7d8tGW8MdTEFviZ5Vyjn+mPna68bUWnvIrhbvYyozd+rBVQABsGIjjIPu8ZG5thOQUbgl0jDeWm3bAMcgBjU+fqDqDbjo0qAmgrXIA/n/Q0WNL8hZwyXl8=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YTOPR0101MB2236.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:22::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 19:37:03 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec%9]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 19:37:03 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, michal.simek@xilinx.com,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        mounika.grace.akula@xilinx.com, manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v2 2/5] usb: dwc3: xilinx: Fix error handling when getting USB3 PHY
Date:   Mon, 10 Jan 2022 13:36:38 -0600
Message-Id: <20220110193641.1368350-3-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220110193641.1368350-1-robert.hancock@calian.com>
References: <20220110193641.1368350-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR12CA0025.namprd12.prod.outlook.com
 (2603:10b6:301:2::11) To YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:4d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64a9f084-0213-431e-2cde-08d9d47093f8
X-MS-TrafficTypeDiagnostic: YTOPR0101MB2236:EE_
X-Microsoft-Antispam-PRVS: <YTOPR0101MB2236E39AEE4B837F055709ECEC509@YTOPR0101MB2236.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jXeXHqPc2KND9RJcrnH9jPDAcdvLTFqYjxS1jMEePjM13F/DgHZxpp54hhmWeNqa/AJuH49oRKq8tDcjwDRdT2eQ/jyBPWY4eKldkYYhvLmgbdJME/joqfIUwGtVhtNH1UDh1zjRXzka9CQHBpvY5x2jOJcZcQ9xMsiMtWLX45vhSfZs6wUR9lbHRNMgrFYzr702kHeBw/JiCezC+EXrfKrMm1GJj1hz/eIKz7g29dEfyWFy5mJYXgraHOQgZZO+imw51fVtao/f6quIdOPI1FRDK/bTTwM45PNw3snb6aq+VPH41Ig1eF+P44qk2J1lDnzf+8iJRFmlEY6HcA2J9TJ2tslo8W1lNSNbc59whtldT4ohiubCL0fPMFEOK1EoJ1InqfWG1YBkXKEyBKMM8WnC6KIykcQwJBbA2bjAfo1qAM6Tl8BhqcZJIzVOqvg9iE9U3ubk3AHfOD0P2VggKOPicRpg9G4j9he5FQNcWNvamnvVOljGXlpLuzwcIKhkJ8S5c7gSvNoHDvfLeAhNl877/5ecpqyv46iTkcEEL1JYISJB1f+gfLwscb+LJ+Wdq5XV0Ckda4UbUWGwCMJAc1A1/2p8nfFlfUYXUlSXzVX+jljzhzGffcochZdpS0G6PEsE8D88LqS4IkEg8ZnsL+R0ugo+pFwHZGoHthx5rvbrdXGEgpc7ttFQObIuub2ERPz9yHC2Yvfh1CJu/wfvJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(6512007)(5660300002)(83380400001)(2616005)(44832011)(508600001)(8936002)(8676002)(6486002)(2906002)(38350700002)(38100700002)(36756003)(6916009)(316002)(66476007)(66556008)(26005)(66946007)(1076003)(4326008)(6506007)(52116002)(186003)(107886003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tFttdxCudqmP/Thu/9FuaWRAMbt4qHYXzdm99MXxFDmQ4ZCTo9pjfv5iHiWp?=
 =?us-ascii?Q?DRzABzQ8oK//fK1aovGHrTkXjl8L35tFLo5Tpd2OR3ZxJGeNekkFFkDuLAkT?=
 =?us-ascii?Q?xDEOX32tf4oX5kGMo3RXVByp68scblq+qPuQoyST5IxXtpgCfhXn+6UGZcow?=
 =?us-ascii?Q?RQZMxWMmWpey6RZwSL2xDeaEgao5R2eDzYKoS8Kpq3H7geega7KVXBHLFtSQ?=
 =?us-ascii?Q?oBLNU1Sfazlk10tZd5A+R43pNOtAdSIPchoBTUzC0vBaOnXVhUvSFShUzPrE?=
 =?us-ascii?Q?MTmjPHGxOfNUPkJc5jiY5HiVNId9czBWIpGSF5cTYImty11I5tg+svO6U32X?=
 =?us-ascii?Q?zBiuOx+pOhGXAKkafwd+h2MFa2FqJlp6p+d+aBHnPBsDBk+NhuP4MUa50VOf?=
 =?us-ascii?Q?By1+a0Fxmk0OfSXmlsefwCLUwN75eeeF4oBXe/f3WQ2vyjJZDt8j+hJZhoSU?=
 =?us-ascii?Q?tmAD0SJ2lEFbtdvRz1G8Om0Xv2dX6WCaUCMUiZZiAQzM04dt4CnKjAKSUoM1?=
 =?us-ascii?Q?XIH505vO84Ae/EKtD/kNU2jxNZDiRmICRIPzaktMvu4Gqdu30uJbTydF+gpO?=
 =?us-ascii?Q?X7IirMHof6UEfHS9Gdj8EPg3bbThhGF253VTvmM/V84H1tMrLBD7nntPONvx?=
 =?us-ascii?Q?3s3MhTAqn8wcEAU8ByXj8cyoDo1QxXX2TcR1MOZ58EniC3coo/Px6DqMOMph?=
 =?us-ascii?Q?YAbvm0tgA0C0OeHWxH1xJiBjWilbHen2qAFZ/HeEmE3I4eH3RnbiWFJ8CuQ2?=
 =?us-ascii?Q?hJWl3TP7AoXmXIr28N5q+b2yk8Oth49YlRbKz62XntJUNqHq+PiDjxC2bqPk?=
 =?us-ascii?Q?vW88CstYJBQAYFjzhuerfM1150xxJ4ktUATggQhFv0Wuh0lRTPkhMrAdvW5j?=
 =?us-ascii?Q?iEbPAPPilWpiXTHUgsRj9g/sgxg28ULhBZGrh+YWMZq2gFo9FzB+INg8RGdf?=
 =?us-ascii?Q?wrsDFUV+gq4HFM0UVQ9Rbg1jYy504NxBQo4dFTDTgXf73rh5QAXn6z1LAqRX?=
 =?us-ascii?Q?PkV8yEmLRpW7unpwGRDHz6L6l3Sb5+pFY/8BwvCVyK2uOPmT64RTnG5AtDn2?=
 =?us-ascii?Q?CldaVmCHfop0wWigGQrP1SYb9HlBydKfnn86tqljtUxPodAcjtovg1QCUj7h?=
 =?us-ascii?Q?npf04XfznJBx16a6Eb8TQCMfhDKcba2yfpcFJd9qe/dV8MB0LASsWk0gyYoD?=
 =?us-ascii?Q?8CoOCmuwbLNK8XgpNfTW1WZjk/Fm5Nmlenv8RTYDIfdGyBVyz0THrJr1ib2s?=
 =?us-ascii?Q?jTOdcUzt0BE+XiXEnKP6bTriMQQ3wuuaPAyiOAaK47Abe97eLPlV+YGpRYao?=
 =?us-ascii?Q?ZIizS6FSkFTFdGHAj8EeQe50du13hW3tfLvsmoyEaRGZcdyhfWGYhIt7dQHa?=
 =?us-ascii?Q?VEq2NC4DvQdq28/YJ9Urj18ealorVAGdy0bxYFBB4aqVG3LPG/xhx82tenkt?=
 =?us-ascii?Q?VDMhwrQMyS/MadjxO6W7ye1vyQWK0Vk8YpDHNPJ5cDmfLmkiIKz3/oVf4Gge?=
 =?us-ascii?Q?hjqO+V6FH+IGETuo4hjyJJNtbdKpCVzhUMhAElconTbvR831UIm592dzyHlf?=
 =?us-ascii?Q?u9wxjlhb6byL1GmfVZiYNEbIZtSCaW7sDUSr49nFNJcGe2OC5bHp+tyQrIQC?=
 =?us-ascii?Q?iNafQWk45LdxXZTTGzQOufWO+gWyi3pW298AtXAOKD2Jw7iyuXfewRbCjAxp?=
 =?us-ascii?Q?/xDPeQ=3D=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a9f084-0213-431e-2cde-08d9d47093f8
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 19:37:03.5920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZrBsKVO6Fw+xnv/aZ9z2T1Bqy28M4qhOpbC+r0YxK1sXkKvf6c6+bvnhh5x3zhdZpVqydQjHB6I0ucPGfBfztd6h9ypaJxFVI/xNZU/peHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTOPR0101MB2236
X-Proofpoint-GUID: -sEW3KvxPyCtHq1fjGCzNcW6YJgjyR3v
X-Proofpoint-ORIG-GUID: -sEW3KvxPyCtHq1fjGCzNcW6YJgjyR3v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_08,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 clxscore=1015 mlxscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=603 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100133
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
index 3bc035376394..3b16e7610009 100644
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
 
 	crst = devm_reset_control_get_exclusive(dev, "usb_crst");
-- 
2.31.1

