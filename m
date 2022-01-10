Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6003448A0DA
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 21:20:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245703AbiAJUUB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 15:20:01 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:7359 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241448AbiAJUUA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 15:20:00 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20AI5tUU001644;
        Mon, 10 Jan 2022 15:19:55 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2054.outbound.protection.outlook.com [104.47.61.54])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dgp68r80w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jan 2022 15:19:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G76aQhm8FEg5oqzdc7xB3O2bESTWd7S94TFRyhzrQTTX/DTVQ4XAK64waWVJvBBXSGxu+b4n4XgRJxy5L3hoAqrehfBpYqG2tc9T07pPL+99Wz6o6mHmx4SLi8+c34OOH1zXcGWvZfyVXVrq8QQKjM9Yttwmto4AW/OXrrr6B/8VaRe5zUpBppf3qP3eFWAb4HwtOswsbzDFIdihDTcMEPdjfP6Q0IKsp+ZyfU+kXsqZcucEyxKYQTjRyblObaZJztwDQ2+ByHIPYP7wVRynQMlCB8iNg0QiDZNmUI9pYrpqYNZxmiZHIeYZgIo0oyFqdzPlRoObzjLavFqyy7T5WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/I/22Z2oVsG1IyKTu+TUts7zPyN/ZLXHjCb4USg+lXs=;
 b=g78ALffMRmGlVgf8yDYN/wgHUcYT3bok+ZtfpFDheeEv6UNnKAJfQrHQNLRhqbCnemmBHabHKzqm+mv7hN/OnlvpwElE3HKj9Yl9U78uuUkTKo+D0jKBDWexm4K99twErF721cTCtWzyhKSTvqHT91PH27LuOSDfFWObjwFCoFpsYUSW9b9+tKH/aq082nUkS4mrVadMnXu1mmbAnpMOgmIoujokJzArcfx5mgu7OTA6nra9lgWpkAUlEaeuvXQfsl69QKQGc1M0GIrPi7tilEpucO3Kp7BOr+MU6tHvZcQhdYWVXsQSuginemPD3xx4NcdO+4aWFlGMo8GSuDbUrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/I/22Z2oVsG1IyKTu+TUts7zPyN/ZLXHjCb4USg+lXs=;
 b=3sxCX4sZlqrFjWVYohVUMw+n7Y26CIfH+9tIl4mT5hfFUjIJYiPGH+SEpi7I5Y3qRbBVP4EZCjIYQd0wi8ICgoRG7faGKy6EHGlwWiEiEm9x490rw3QDxxm3mgCH9VBzthGNHqS6TJHKIOU33K7OYulg/9By/C6kE9zyFHpi+QM=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YTBPR01MB3981.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:1a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 20:19:53 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec%9]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 20:19:53 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, michal.simek@xilinx.com,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        mounika.grace.akula@xilinx.com, manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v3 2/5] usb: dwc3: xilinx: Fix error handling when getting USB3 PHY
Date:   Mon, 10 Jan 2022 14:19:33 -0600
Message-Id: <20220110201936.1371891-3-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220110201936.1371891-1-robert.hancock@calian.com>
References: <20220110201936.1371891-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR1201CA0002.namprd12.prod.outlook.com
 (2603:10b6:301:4a::12) To YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:4d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fe5a3c2-09f0-40b6-8a10-08d9d4768ffc
X-MS-TrafficTypeDiagnostic: YTBPR01MB3981:EE_
X-Microsoft-Antispam-PRVS: <YTBPR01MB3981D826D4D15B9A747FA42BEC509@YTBPR01MB3981.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c4VavcQaTb0tpE0EQPYDsTTrEn+4CmFzcJO/ABOzmnkv6BJ5CIKorEZVIcWIOELs8sld5ZSI/24AxMXLHl/IUrfeIsdTAEw5iTh1yjeeiEU2df/Y317U9PeBeUXoBZxkLbSfWXenKWzs7yMRfy0zTOt5zpZkwmTSwz6YbqcjfJ1jwA800CZoTmrwgOiHeIZazxC5kV9g5UoPKPQtAUCzBocfFnGovtqttooFIQ+MrhPeNDBEF2vUZJrPPat2TwTElEduw/9jTLKMDnqNp7MLaL8OuIEsLziItjVJjK4v85hjYwYigxOkVmOiXKUnhj6LVVeULvQy5OvO9xjZCUeJ1oFqhmYkEWNYwF5VKp9kvCuE2VKDGwjCqOZweuu7xNUflEaoEp1n1RBtEXeuVkZia848zvbnUbc4Ynr9FBAnPwZoTH24rOxnVwpKiP7Wv5AxXh6Hjb2d9HUcwLlJfL+ihE/VxizqpvsFP0xoqT03a5hZ29NPp6spbSYHYTOFTWaC4E76WnxogkOiuikOQxDr/gFW2Q5CUQRaro+2orJc2mbkFewMQqbuIaASGE9YGkZbRy2AbQqTvV31zMyk40sQf2mthdTFM+u+ko0N5q0R9ohVrzw31EYc23usWk4XQFJE3IcFUKrHMrHYQ9s2MqB+K97zbyiZ05Fpq9wpURar+Og+HwAJ6f9eUmh+P/YteNPVCqZajvrAdwmdsApjWGaxxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(1076003)(508600001)(44832011)(6512007)(8676002)(36756003)(83380400001)(4326008)(2616005)(86362001)(107886003)(26005)(2906002)(66556008)(6666004)(316002)(66946007)(8936002)(6486002)(52116002)(66476007)(5660300002)(6916009)(38350700002)(38100700002)(6506007)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8laL9Rjr/xo3rggzg196FujVcfzFrgWwp0NSmWgvdqltZ1JXOr6APi8DMN/5?=
 =?us-ascii?Q?TC7lehJcKiSBomonr7J4Qtrc2uLYMtMxDN0x007NKzETq1EGjB1dsGniU+Ra?=
 =?us-ascii?Q?9z6Kk7NM9CtdPyqsR7WUN/rwOxt0gGQhPsYVxs5Zzr/oyBtzkDJn8bDemnRF?=
 =?us-ascii?Q?h1gchfZjLxp4mP67bQaXDaqAvEGudCKKC5+jRhyc0/0KJ/oU1P+9zvty8yQ7?=
 =?us-ascii?Q?PJdDHEhmEDbTQsilI2rJL7Kf/+pAqVHN66LLMXIfvH1XUy2waLY8xT1FO5lz?=
 =?us-ascii?Q?vBdaCwkqj9PYZsP4XUOQO+MIWBTxspzHTZkWfn+Xq3qPnt15ykFNZtyZdsvs?=
 =?us-ascii?Q?DdYsS2USth1SV36TAIg2AA47Jo+nQSV/XRn+OEPC9xWbbvOPD6NhzjI5r8L9?=
 =?us-ascii?Q?gb7HA8ixRGsKB0HVFxFU+dV2dkomba2eJJDHUOGMrtowB+a5HmHUAB6v3dQc?=
 =?us-ascii?Q?MBIzeZXi67cm6S4AW6Rkpna/rBZ8Tp6JgZa4dmJKB5eWUs+wkvPzLjGOGbXk?=
 =?us-ascii?Q?Q69eJ0iBboCKU93GXOc1zc5un1R9ujL9Inudz/fstw5D8lydF9vP8e0b3Mmb?=
 =?us-ascii?Q?/zXJkBT9dMel1tOMmGI80LLPxNDdDJN8CKvHp79cCWTGWrkt12FX0cKwplTj?=
 =?us-ascii?Q?ZTl/E5cVLsDVniLTnsnrToCVhqMgkgD3cFoOLIPvZE0pGF9SnE8RF19sooIE?=
 =?us-ascii?Q?zZVCGFdrNIGSoFjJSqTyLhpD0tzJSLDpC/I2kA9uITfZSAMvrO673TjLLFxg?=
 =?us-ascii?Q?L8PsTxsTv93AUkj5behbzlZfAKBgLT2xal3ZL2Pcm2qJVOw/zM8yFc+t89Gk?=
 =?us-ascii?Q?AiuHwNUIvZkQTNGowSV0IZQpAAZlcmqVr+9Cjur2A11yR2wscw9V+lfx33Aw?=
 =?us-ascii?Q?e3yULsLnWL1OW1BijSnCFWTmd3B9BlkwS4vgkBDnugPgguazEBEbtbYlqpGl?=
 =?us-ascii?Q?tMGUaJRzihnkFnGePVC148KP7gFEghESeKZzZ9o1rSGwv4tFhJn/DnQJ9Ey+?=
 =?us-ascii?Q?kgQ/Z4b9QWVQM8vWe9L6V0/2Uua2tDW7Tr5Bko18y0DNY3DyykDWIOt8pSI9?=
 =?us-ascii?Q?JkY0apPoa0NENDahxWYsTenmHh6wwMul+3ZrYX27MnQHqKnxcrviGnug979T?=
 =?us-ascii?Q?EW2OSIcj0raRmyk8UaEDewGXdq2zMtjSP/vXYE3g+5nt+NSjiov+OwgvuY7I?=
 =?us-ascii?Q?o0GlMel24tZKi2npXKldEf4ZntIUHUx0tMJ9agZTJlOWCGuoTeIrnkNyg0uR?=
 =?us-ascii?Q?+Wk0cjDOoE97PJKH9Gr+x8V9J0P+Ch5sct2wJWLIpFpKVdo3WFvN1EImbm2K?=
 =?us-ascii?Q?mRfTl4Z7QYZKb7B4zhBZsqzUIeKM0EmHohUYnZhuqrf/xmoGbC4a92i9Erip?=
 =?us-ascii?Q?zn1pvZlZb+FZX1zAPdFAMxCBL+FDvPWwUD2sNQGofoEN+7XTXRiP06QJ6RH6?=
 =?us-ascii?Q?Jb6bGICrAkbLTVyfxy+/I+Idi4NYmoFNvBsdMQKGZr2VGrbbfW/8ZeJmQonn?=
 =?us-ascii?Q?SlSd4f4SBZtA4PuMzbzhyiLM9A5kURf+GOM41ABNErvlR8MpCgQGxjntKAaW?=
 =?us-ascii?Q?VRpp6EOlS3GGbOWcX0DynDkvwqkBUFSLVPEs6QWDlr6KeQCIQeatuYqrVV8p?=
 =?us-ascii?Q?1Zjbok6w2yG+Pv2OBOe/7FEZ9oqXUnB4uhPgzGcfHqBnaqVqlX6BOo5An4Qu?=
 =?us-ascii?Q?uEFgIA3nvQQnGVR7iFyZnuA0NiI=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe5a3c2-09f0-40b6-8a10-08d9d4768ffc
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 20:19:53.8588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lxAsBmKxY9a9+gPv02Kj0qYGyzSZkq90bcVK5y9UZFSh9EhDoOxjEKakYqIM6MGzRD+NFcJhGG7b17f+e237iwHzmwUN8OIz/Y+16evkJ0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTBPR01MB3981
X-Proofpoint-GUID: NJbIXIQHQfEtu0k6T7dETJRattyDQIB9
X-Proofpoint-ORIG-GUID: NJbIXIQHQfEtu0k6T7dETJRattyDQIB9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_09,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 clxscore=1015 mlxscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=603 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100138
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

