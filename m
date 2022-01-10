Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB71F48A042
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 20:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242779AbiAJThJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 14:37:09 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:47039 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241122AbiAJThI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 14:37:08 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20AI5tQE001644;
        Mon, 10 Jan 2022 14:37:03 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2051.outbound.protection.outlook.com [104.47.61.51])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dgp68r76k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jan 2022 14:37:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f91VlaAdrR0P4RbZRkA0SJVI9AuWdrDIQVMSZjm+Xn4TG9EBeTd9fWK+dUmHGiywJ2U8yqd0tGdVbLuYROAEDh3xp/nlWe/+izzqdY1ZfNBS8Rd0uJCwHIYs+hT/OCCFsJckQ7KIcdEs7VXugc0VEflCwLncqUuSbZ+5o62ssLrQB1Zc2xucHZoVu0rD/oC3mJoP1zuOMxbJfT98MfbbnIltIKDeDRbHo9scNOLJuWJAFGVeVn77Yw8YfJcv+7wZhXyfxeVV90hRYfDy6sqW3v6qfBvhQqBEFI/MimyR7Z+ZrGGtT1rd5x8UokNsR6GiK5GbFvzKS12BRiEY/G3pyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+D3fgwE77//+LJ/u59LDGJ6v9aP+LrJdh8IqVspVkwI=;
 b=C24wk+7QmY4dIBxGeQgNixUu4bCB6CkKSF0ykAyvHnBouUiAG2mo94BUnDUuSy+io06vHd9X8nWSn/xFft6PJjWlfHjam0jnMBzzqUcMV3l3wsgDjhmG5B9ivmAstDCODZIG83nKD2PnHx1b9DFxyPeCid5+6pK8PY/W6WDgyzE3id70Gvlp4NkXyxJOpQdgf8y/pQGeE5ZYiC3py5xWTq5jvHrd0QTqs17+sKCcr62YaoOQSIQI3VdhVezQU8nH5j+gC8nPI18Z5T+Xhc289nG6NEi0pptToJpV2nW5ZuN9xM/t3hKLIo1UtzrLadwp99Rp4QkM/foDRXmtbnd9ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+D3fgwE77//+LJ/u59LDGJ6v9aP+LrJdh8IqVspVkwI=;
 b=w2lBZLYARE187cQEQ0vf/Vr75VDw3KXl04mRP3TpUYcTubPI+LtJG4a3UkyIDetxIzwtJ+atmJjixvemvl1+OuPOFSwvEXny4yxE/arpgzQR7djXxL7Y8USMmdC+s3sSbf9xJKsjirZ+nMTqJLvxSRHqYjsUsuYxGZEilB6/SmI=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YTOPR0101MB2236.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:22::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 19:37:02 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec%9]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 19:37:02 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, michal.simek@xilinx.com,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        mounika.grace.akula@xilinx.com, manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v2 1/5] usb: dwc3: xilinx: Fix PIPE clock selection for USB2.0 mode
Date:   Mon, 10 Jan 2022 13:36:37 -0600
Message-Id: <20220110193641.1368350-2-robert.hancock@calian.com>
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
X-MS-Office365-Filtering-Correlation-Id: 38e06f63-c275-4bbb-1a31-08d9d4709318
X-MS-TrafficTypeDiagnostic: YTOPR0101MB2236:EE_
X-Microsoft-Antispam-PRVS: <YTOPR0101MB223637D361B008D6DCBF4F59EC509@YTOPR0101MB2236.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yVYb+t1QkEjL95fKj+HC1IudAUoO85ZJmBJ5M0cmP7nyxsWJSEBbpvBcMzUX2pWl24JrrRUNDF4GgNscZOFG8gc/iFo/QibT65AKp0L65N7r/XxpkmL09xyILhR6TULd+EBVH+FpHi5zcU22JRv9B1PUGGVSOqyUyPtz2npRXNaLqBOzsu8D70UbECkl225M1KPpPw5/39sqyfxmc/u2PXf+XWKERfLHAH+ojQuhsVa/1dS+GZ7oY0ELavRr4pad0O/F+wSMaHivcRmZfZw80kF2NHiyLrHqb4724pm4uI22cTcKmO2XqOXDuouK9yaFyaWX3Y0BGqTaw4znJvMB/Cao5PR/YQmhEz5V7axHx9f6RIh5fpGD5KS+bG5JuN/eWmSHtxeCNZBLpUX/JhqetjzeYO9AZFz3neAIfUl4WIieWboiDrKViW/Vfk7pqJ/3suqcpJia2bI7qd04NDLfmXVyBMNNYkeuqeyfetSlGuKZUWvHB97cxEWQKfkdzF9lZBu1VhKm0zHwsDJMEPhSoM2eJ81xvzWbn+DbMVKqXatX6kCgffry/7sWhOf5t1/XGGXgVM3ZXV+2BVg37ia2CI0fqd5DY5EBVo94mpJMuC2vOpKCARXbvcJPp9l7H5X582s5eg848Q8s3GWcNiKfbZuFsOc5YRbM21/DbmvZ9lawfEF2pQhIbWDSfSGOFwn47gjBYxYnn9dbFEqhztkTCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(6512007)(5660300002)(83380400001)(2616005)(44832011)(508600001)(8936002)(8676002)(6486002)(2906002)(38350700002)(38100700002)(36756003)(6916009)(316002)(66476007)(66556008)(26005)(66946007)(1076003)(4326008)(6506007)(52116002)(186003)(107886003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xIcW/JeoLoc78nPXkG+NnSgKD9wjquYVTwYvAivfzAZsYn+YdiFbH76v3i4B?=
 =?us-ascii?Q?Zu3Dqxcb/OabfYqh3bHe76sSLlovIUebizf6AO81bSMDhbI2FMfZCfBqVtmM?=
 =?us-ascii?Q?OaA9phes7cVJE+ZjM5ifJj7hKLR0VotrTRJW8svTit74jVL1UDhl4pyE7yMD?=
 =?us-ascii?Q?YE2qrm+Nmx5jAMh6CrZC/Oc13XhmKsoXHHxckI9f1Fs+T8l3UNS17E6GNKQD?=
 =?us-ascii?Q?+ciedODkduXq3Rr9SYsoclYNsgOLI72/ScYOxfBN3GLn1aGoPA+ZMPzEEM0Q?=
 =?us-ascii?Q?51OLe7aqqI98sufu2heagUJsFHom2D77PjA9468iEDkb+HA9gVCW5+ODMzEa?=
 =?us-ascii?Q?DhGMt0cdqU/fFQdpU7/AlgjoNeVjf5UB9IQ8mGpY48nX8sR8IQNJ+wNb3QUd?=
 =?us-ascii?Q?4BQriRvV8HKCNyO3+sY21hMsAa9ZvGHh2nlvcd12EyQfuiJvMNU/bXLe9ydU?=
 =?us-ascii?Q?U0M0wD94yW611XbIiaLCQOoLgnFUBp05VPGo7+KvZImT/r078T6v2w1Uvv0Z?=
 =?us-ascii?Q?FEwIIDFyuLcc8hianLtbw+UJ+9RUTtuAU/O7YcUuS5EsBwNGwLCNA7s8gbk5?=
 =?us-ascii?Q?UQDxOyd0lYI1ePH2NP1RVYnj3l4LotL5Y7cyUG6pjTx7Yle4hq5GCiH2kZ3p?=
 =?us-ascii?Q?0W3/Z6HH2AMuOeac3pdE1IWhS4RhXx8WjA7ZukKPrnPo5UDVz7XvkedxC8zI?=
 =?us-ascii?Q?WZZncG4OSoO0I1+7Y0LXofK7wpClay/FqMtr6N4JqMZygT6eoKbSkRXUGCyB?=
 =?us-ascii?Q?XzHWLPBrQXJeyKnrDAMV9PTF0GVKd5P5V0v6V3eXCbOSrZP9BIJr2LVE3qcU?=
 =?us-ascii?Q?38fZAq4fPYUgxnE43t0mcXt3mubu5LsDjPZpK17I+0y4AdnY+5gv3Aly/aRh?=
 =?us-ascii?Q?TGaNeuS+4V0oGjDJ+cDeHlTO2f8pgpSfE5UmsBXbkrhVgf7BtFLjGYxKDvSl?=
 =?us-ascii?Q?N38U6OvjM9PAOFsdMaYzR7Zdr1y3LW+BqxpaThchd4ihiXYi86LVSfSy35YW?=
 =?us-ascii?Q?BbdhUtnnwyu5RUYBvWGXsc2ahVbV69I0cM2QT8CM6QWgMi2OzWer3HpOYixU?=
 =?us-ascii?Q?GdYU3Cu27IYCCLeI8to2MJ/ko5QoXMdfyQu9Ad9aEyK7bEEL8qMxR1InjA/l?=
 =?us-ascii?Q?cWcXYgqnui3jDOcOGpWDhioUivA78lWwqtkqb0CzGXVf5BYgXyOM+IyQdbmL?=
 =?us-ascii?Q?J+QJ0Mb10lnDyhlsXWlen9x/YT0yp8anEW/9FcM/KD2o5GL26gjOzMIrOJIq?=
 =?us-ascii?Q?I+sOj9kjKMURFGICFylnzAK5xuEWQy+pHH9IA86lDZGkZdivn+H0JE9jaQIB?=
 =?us-ascii?Q?oPptCl0EtaFFxXqWzcMJxN04CDNRCnbG/f9lZkBPqU1sAepfOdP0RNWVA5Hq?=
 =?us-ascii?Q?CNeNuLQKCOyVZtuG8lKruaoaAyNNYb+YIfEAn8OrKYrVQV+ucctcS3YFgar1?=
 =?us-ascii?Q?bINpirpLn7GJZgNzHrJODlRBeg+oaU0AgAr66/yIKre1TaiAfM1V81et4f/R?=
 =?us-ascii?Q?8bfzY8p4YIQCrk+vZeuWpd261ncRBzJlqciQnpbs7I6pgSUzyNqRptezlRL9?=
 =?us-ascii?Q?S0NaCDWXpAh5NuiAiVAj6PyqWAJ2ZfbNFlZxEOL6ddcmzhYd3q/K+PQATO7s?=
 =?us-ascii?Q?jdvGPWlXqMi2O6t4WycYz5uo1TZFt4Ix+qHU84H4taKsW2z1uo69TKWWcHC7?=
 =?us-ascii?Q?JOJLCQ=3D=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e06f63-c275-4bbb-1a31-08d9d4709318
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 19:37:02.0610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIYO7bK7EgiV1vCVDG+oViP8P7quZq6f+U1t8k/SXltjxMhNxnsVf7t+u4/znzjIs4gK9SUU8qPo4SMfSUFMs18fpBleWZyjHoy6OBauMMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTOPR0101MB2236
X-Proofpoint-GUID: OvcYLqMfoqeO-yosytxTCJTOJB14mX_5
X-Proofpoint-ORIG-GUID: OvcYLqMfoqeO-yosytxTCJTOJB14mX_5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_08,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 clxscore=1015 mlxscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=881 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100133
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It appears that the PIPE clock should not be selected when only USB 2.0
is being used in the design and no USB 3.0 reference clock is used. Fix
to set the correct value depending on whether a USB3 PHY is present.

Fixes: 84770f028fab ("usb: dwc3: Add driver for Xilinx platforms")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 9cc3ad701a29..3bc035376394 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -167,8 +167,11 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	/* Set PIPE Power Present signal in FPD Power Present Register*/
 	writel(FPD_POWER_PRSNT_OPTION, priv_data->regs + XLNX_USB_FPD_POWER_PRSNT);
 
-	/* Set the PIPE Clock Select bit in FPD PIPE Clock register */
-	writel(PIPE_CLK_SELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
+	/* Set the PIPE Clock Select bit in FPD PIPE Clock register if a USB3
+	 * PHY is in use, deselect otherwise
+	 */
+	writel(usb3_phy ? PIPE_CLK_SELECT : PIPE_CLK_DESELECT,
+	       priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
 
 	ret = reset_control_deassert(crst);
 	if (ret < 0) {
-- 
2.31.1

