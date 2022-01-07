Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76851486EE1
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jan 2022 01:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344167AbiAGAcw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jan 2022 19:32:52 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:28971 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343899AbiAGAcv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jan 2022 19:32:51 -0500
X-Greylist: delayed 1121 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 Jan 2022 19:32:51 EST
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 206HU9vq023113;
        Thu, 6 Jan 2022 19:14:07 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2059.outbound.protection.outlook.com [104.47.61.59])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3de4vqg6jn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 06 Jan 2022 19:14:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVtS7XiB7Oz0w3hTQio5Cv/xhlbZl9W+DS1C1pU/W8aIdpBBsyT5xm12xyqivfo0xg+qcylwslE9N3T7yvcDfz2ijAwSECF9+9q9ZaW5xCj1plQv3uwvqIYRd6c5D2XNSSxUmfwkrx6MqVfQfRbKMNhbWdLN/Mk8qfN9aCNENaO1cZfIPsd0B6whQjn9OdWfkz1Wi4g9XVDrpjKXp8Gapd222VFDgvgvqCoR0/bi5F+4Ohv25PNJJdVHtb+JqXz1VGy0PIiZweYE423JMLB5xYj76Rp88IUo/6jKLukdk7BMdXa9NNAtqEs+yz676MzpHK9IJep7D/IFQoyuGtipSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4s6GOkLZA/SUTJGlybjh1EMHyTyn830gYhvlYTnIMo=;
 b=epT+UYT/sSd9V++8tutBwe/RjcJTS3KigashGWoZ5jxFeRJLQeQJxLh7QYCzpybx73jNOhvxp47v7t0RKbGfDECPJ4NqybsIUUbmzgNdhHbtBhrYhZ4G9l4IUYLTS/Q7PyIQWy3VPZlNMk2tf6HrwlUy+zLrwHOvhXWlME0nu6k6n6C01oRx360K9JcooGRgaH08xchuHHM1zc9vnj1hst9QWHhellPJlRMdA0pimfJh5OdCF+SUlOKBweyGIq6BBNNPLsaFPaadr0VZdw9IV/EQJI3Kq50aQlxpk1qW4TnUY18WjhW39aAERhZ9QcKCuc/G+cKlNRWRrrC1cNjgpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4s6GOkLZA/SUTJGlybjh1EMHyTyn830gYhvlYTnIMo=;
 b=zGw61o8md5k9yhOzWon9llneya37auaUjkX5BWBBfwCT4Hsxw9NOX7/3PYJi0mEKq5MSGYeuQyHHnsCO0Q4CGUx7WPZ8DrPSA3+yI+X918ZTt2qfYGeNV6Y4PssF6NwtnZN2+zpLuVFwUpLMqz/3A8H2bE3eK8SHs0pbL+vHdO0=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT2PR01MB5488.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:53::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Fri, 7 Jan
 2022 00:14:06 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76%5]) with mapi id 15.20.4844.016; Fri, 7 Jan 2022
 00:14:06 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     michal.simek@xilinx.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, mounika.grace.akula@xilinx.com,
        manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH 3/4] usb: dwc3: add reference clock FLADJ configuration
Date:   Thu,  6 Jan 2022 18:13:33 -0600
Message-Id: <20220107001334.991614-4-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220107001334.991614-1-robert.hancock@calian.com>
References: <20220107001334.991614-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CO2PR06CA0066.namprd06.prod.outlook.com
 (2603:10b6:104:3::24) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 017213eb-0893-47ea-d1b6-08d9d1729e63
X-MS-TrafficTypeDiagnostic: YT2PR01MB5488:EE_
X-Microsoft-Antispam-PRVS: <YT2PR01MB548896BE4A3C2B308AB73809EC4D9@YT2PR01MB5488.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2vYnuzIMQiim+7JPy9WiPXPyGWYmUFvnsnl1/F4Zv2zDRNhV2cMDsJkfwssFe0e6Iq+gVz/oemCtxiuXiqZH2sC/WTCVx6P3Z5nBGSBT6WClkrmqsmRpZjG5y0IR3Nc6tED33oV/aPmi4PIj6T88U+2cH30Y3pxR37RRTOo4VL+IflXBo86jLW9A8AnrtWlDjqg1L0gqDMkSHnQDnbgzlcfdbPjIgOtJppSIINhl5qWFOPp9ZqGURLpzrkOhoWtIiqMyPE+/yRnUnsmin4iKS6OY7RiLX5rbG8gM/FHRWOzFjtZrY2EJkrSYQ/uC+jTtwqv02a1KAgQnLrhg/lJX2SXkXJtAWi9aam5fvTrofOvfTzMCU7Pdrl5oXVRacom14LkX8xLw5xBm5dwMY1B8PSDk1GE/f/K6JNA5RnLL6q+zl43pY3UlH5OM8t7QFolLP1NFIpzOTndqHBxNT6HIWSfx0VI9XiQFy/noAm9eJjuvX/2PQ0DlW1XbY2Q0Bzn3EozqSe1g/X5L9fHHUlBcoD2k6Gqad6Jg+OViVCgvzvV/kxN/GIl6xNnEcRq9DB2oI4E9DQ8COAQ/L4KfrHZqKGJS8YhKlXFUO8fhhXOyyBmIUtOUr+bEYUwz/qNDSu8pnqiweOLGc2XasVudDZa/GompgrFVID9Sd3Za0TqwOvenWcT1v+SVwEH7MdADiGQ5z/5n8h7fmUOaf9taM+DCCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(6916009)(38100700002)(508600001)(2616005)(26005)(316002)(6506007)(107886003)(44832011)(66556008)(66476007)(66946007)(6666004)(186003)(86362001)(6486002)(6512007)(4326008)(8936002)(8676002)(36756003)(1076003)(2906002)(52116002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9X+HLgFfarrS0svrJb8WMV28akW4Ln1GwQkK+3Qf84IiimiliI09ip0TCXKw?=
 =?us-ascii?Q?8BFobXfep9Y7shijUZn0Y+BDZR2mOi/zEOuZKByQ2aOOGiGqehuiXjLrl+xm?=
 =?us-ascii?Q?XoiMQ7snfp7XrVWj1luhS6YIGZO+YACOijWNQ6A+3uyqHHT2p7wOa/Ykxfd8?=
 =?us-ascii?Q?PfS+uN68+BPPSaIsLT6bXcU3Q/58eEzge2qdTYg6c/kd09p7Pwb7XXjqPK0t?=
 =?us-ascii?Q?IugKFFA4yKObZ8D0zFGG2wLrEVz5DTi4yJLwcdy8I7/hIjTV02AhdQs9CGa3?=
 =?us-ascii?Q?GaQTKWZk/waydtkiJ1G2Ljsh8hzgJaMZDwobMrK95WFqhKQBQv7FPTUK3JPC?=
 =?us-ascii?Q?/CwWb9QnHMrn/8gc9uZKe0485QR1sqFP1JzPrksrV8KMidkVNUMYWct15unq?=
 =?us-ascii?Q?4XKPYHnkQ8IcLkVqIDs7VHdoa+SQ3cnmWcOHi0iZV2SpRTfz49n9dXYEgm4R?=
 =?us-ascii?Q?cMjTUFLCSO4oNePBosWXL/9LGwyG/VXtfWQbjtdDbmw6fGVwSpWTuSDshmTm?=
 =?us-ascii?Q?X1N5fAzgshvyauJGuyQp5cjTui2RKMrEg2pFtj10HJosLeicxX2A77gTME92?=
 =?us-ascii?Q?EDm/ki+fdFVWyzd3/WPTasI3bzoHmVYakdHMuCKShsZ+RHGTSWRHX+u3RmU/?=
 =?us-ascii?Q?8NsNWlxp9jEVi4OXVmQ8OVIg5gTFON8yE0YB/h2eGZvLZL+l06hwgxu0qMME?=
 =?us-ascii?Q?HLVPJ7GNa/8RFbQqIr5Ois7ENRTytD2aEPX71c2VLKMErHBKjzfUIiDQStx2?=
 =?us-ascii?Q?pUy4PZg6O53LsJgZfHpCWkuDC9f2uJlfWfsH+WeO+4fRcrk2XCLwGCrpHSID?=
 =?us-ascii?Q?4UsWVOUL0zCECgfnqJMFsEYtcQWgaWoRlwT815BUps0bwlQMgA074+7EYksq?=
 =?us-ascii?Q?xoiZT3P3g0UXZy+1v0PkCVfrO2+g0nACBMgwyyAPawWXwmRwC+xgtWuQYfbA?=
 =?us-ascii?Q?3eYYf6DvNEhwfpmVu2vA1NKwQPzVjsKtnQFPK4l3k9c57sb6y5MrN060Svmo?=
 =?us-ascii?Q?YHDFlzhl9eSiJO+mX7XWDGAuRE5Dn8swSiP0QrN2Ee7u2cFGbYNtvuYaw6tI?=
 =?us-ascii?Q?fclZ4Xc/xfJWTbrdZF2RTTtRPdSdYV0yf5KXEXzJzYKHBP4m+0ZlFv6PK42Y?=
 =?us-ascii?Q?gzxQOUN8S6ifpmUnHmTSijflRFW49Df2bsNWo9bx3uk8Wd0KCsyMhuaxyfFl?=
 =?us-ascii?Q?3HoA6cRhN0oySTgsuaCH+JnEYjeoccQgm05EH0ZTVTHRzS2T7Gv1/xhUYICI?=
 =?us-ascii?Q?SYMvoxlQK6RFFBp8llMPsFRCVPVbk1oTs+AMAivU36f3/tqx+iqlRmSrnUgD?=
 =?us-ascii?Q?KKnqace1Y9RxePbMbbHwrbTHVVQ7iYiKVY+7jG6AwqwwMWPxlraIW7+HOSv0?=
 =?us-ascii?Q?HQh5fQaqr0RnN1xMw6Fg4AmSEfq6A5jrs6Ml11fc/NkG6In8JofhKO+WcQyZ?=
 =?us-ascii?Q?1QoAAoex/2GbH1y88fVgjdxmkFkNpF6QJPgbA5YrAKQEJkrjA3XT0PBp5uBW?=
 =?us-ascii?Q?IZ/J/Kx+CSOjPyo7IBwK77q6m1r9LVMl+SkvxqNLwCd39vu+/Z+FXaWjt791?=
 =?us-ascii?Q?lJs13eCWYVf4JTDPRlcHiLJ2PZA8GRUtpWZ0LUnZgq/vAPxPN5Fb8JYDf9ye?=
 =?us-ascii?Q?1MGyVUTi78cXJj+mJttmJ9f7YwCsfWDlcbt8ps7ubBoWUlFeEClRpffPZSdc?=
 =?us-ascii?Q?nmCrRR/V8rg9BUK+545Ly9TlisM=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 017213eb-0893-47ea-d1b6-08d9d1729e63
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 00:14:06.5497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikbwDCpGb5LuvF6JjCSn40pgajdnbAmSXRWc9v2xVvkaLGOkupdZyzgVU9NnAzpRzwHdUxuIuQL4gin/tOIvw/M2z3kKcSWgk2VtKHnkEKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB5488
X-Proofpoint-GUID: j5JQBHPFF4o12TkkwlKmUGzrJ7pQFsCh
X-Proofpoint-ORIG-GUID: j5JQBHPFF4o12TkkwlKmUGzrJ7pQFsCh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_10,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070000
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Previously a device tree property was added to allow overriding the
reference clock period parameter if the default value used was incorrect.
However, there is another register field, GFLADJ_REFCLK_FLADJ, which
reflects the fractional nanosecond portion of the reference clock
period. Add a snps,ref-clock-fladj property to allow configuring this
as well.

On the Xilinx ZynqMP platform, the reference clock appears to always
be 20 MHz, giving a clock period of 50 ns. However, the default value
of GFLADJ_REFCLK_FLADJ was 1008 rather than 0 as it should have been,
which prevented many USB devices from functioning properly. The
psu_init code run by the Xilinx first-stage boot loader sets this
value to 0, however when the controller is reset by the dwc3-xilinx
layer, the incorrect default value is restored. This configuration
property allows ensuring that the correct value is always used.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/usb/dwc3/core.c | 32 ++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h |  3 +++
 2 files changed, 35 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index f4c09951b517..6289fbcbad45 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -359,6 +359,34 @@ static void dwc3_ref_clk_period(struct dwc3 *dwc)
 }
 
 
+/*
+ * dwc3_ref_clk_fladj - Reference clock period (fractional portion) configuration
+ * GFLADJ_REFCLK_FLADJ contains the fractional portion of the reference clock
+ * period set in GUCTL_REFCLKPER.
+ * Calculated as: ((125000/ref_clk_period_integer)-(125000/ref_clk_period)) * ref_clk_period
+ * This value can be specified in the device tree if the default value is incorrect.
+ * Note that 0 is a valid value.
+ *
+ * @dwc3: Pointer to our controller context structure
+ */
+static void dwc3_ref_clk_fladj(struct dwc3 *dwc)
+{
+	u32 reg, reg_new;
+
+	if (DWC3_VER_IS_PRIOR(DWC3, 250A))
+		return;
+
+	if (!dwc->ref_clk_fladj_set)
+		return;
+
+	reg = dwc3_readl(dwc->regs, DWC3_GFLADJ);
+	reg_new = reg & ~DWC3_GFLADJ_REFCLK_FLADJ_MASK;
+	reg_new |= FIELD_PREP(DWC3_GFLADJ_REFCLK_FLADJ_MASK, dwc->ref_clk_fladj);
+	if (reg_new != reg)
+		dwc3_writel(dwc->regs, DWC3_GFLADJ, reg_new);
+}
+
+
 /**
  * dwc3_free_one_event_buffer - Frees one event buffer
  * @dwc: Pointer to our controller context structure
@@ -1033,6 +1061,7 @@ static int dwc3_core_init(struct dwc3 *dwc)
 
 	/* Adjust Reference Clock Period */
 	dwc3_ref_clk_period(dwc);
+	dwc3_ref_clk_fladj(dwc);
 
 	dwc3_set_incr_burst_type(dwc);
 
@@ -1418,6 +1447,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				 &dwc->fladj);
 	device_property_read_u32(dev, "snps,ref-clock-period-ns",
 				 &dwc->ref_clk_per);
+	if (!device_property_read_u32(dev, "snps,ref-clock-fladj",
+				      &dwc->ref_clk_fladj))
+		dwc->ref_clk_fladj_set = true;
 
 	dwc->dis_metastability_quirk = device_property_read_bool(dev,
 				"snps,dis_metastability_quirk");
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index e1cc3f7398fb..650d4c2e7a67 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -388,6 +388,7 @@
 /* Global Frame Length Adjustment Register */
 #define DWC3_GFLADJ_30MHZ_SDBND_SEL		BIT(7)
 #define DWC3_GFLADJ_30MHZ_MASK			0x3f
+#define DWC3_GFLADJ_REFCLK_FLADJ_MASK		0x3fff00
 
 /* Global User Control Register*/
 #define DWC3_GUCTL_REFCLKPER_MASK		0xffc00000
@@ -1166,6 +1167,8 @@ struct dwc3 {
 
 	u32			fladj;
 	u32			ref_clk_per;
+	bool			ref_clk_fladj_set;
+	u32			ref_clk_fladj;
 	u32			irq_gadget;
 	u32			otg_irq;
 	u32			current_otg_role;
-- 
2.31.1

