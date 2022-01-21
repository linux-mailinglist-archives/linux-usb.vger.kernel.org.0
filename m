Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4334964E6
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jan 2022 19:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382032AbiAUSTF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jan 2022 13:19:05 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:34012 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1381873AbiAUSTF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jan 2022 13:19:05 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20LCs50K028142;
        Fri, 21 Jan 2022 13:18:57 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2051.outbound.protection.outlook.com [104.47.60.51])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dqjeurge0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Jan 2022 13:18:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+AANWBLDo6BPCaPYcGT5SPWT4D30hmnsI3fprC9EB6EKm85GFVIGk6Uft1WP24smQhAQ37lUsCX/jrPAbcuXuhwxnBNgouqL7Zu4vbuBNNrlWi+Gn2BJKLDAXqbpDRTaiwyVDqS9fywSgi8zPB0OCEY48DxAIoRZbB9qxss1+LPqHR9zsLftrGV9ZtK+LnxSokEn7VbwJUzcGqE63ASmcoOp/7nofyHMtursfN7UWo44OIe6I7hqEra/VTSz65dHCHljPxbtjvR6njGudgShNwbZAbP0m9PNFElV9G7mOcBU4Wuc3G5WbWao07wHUpw1V0s3ULKV0iS6icP64DmVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoAU3LSSzutzhTofXJHC0/smgMIGYE7qwwOkdgO6FzE=;
 b=Map7F6ASXtb8ubzu+UMxjx9P5blooNPMmwH/AOp1maxUStmhq1rUxtnwpfLthdGKHdWgezxZbeLZAI/wEeqRinQF+R1xIJEtgYwY/csL06ChV7xjaB5gMoGTjOhExZj5zNUIElEpnLMdRHI09OnBp+Mh14qb9srYtk0Uf3IWXelUfbtq2rlZJ82S6z6oSErWnyoRpvRbMLc7h6YKDJXJA26H9/JKY+RYV83Vn25QTebvdO5mkS9nADp/KWKoTbmurz8qtZIFNw0XlYDc35qwhd5GqYw8ltCNvM2XUiHgYuKZHtTWjqJiFIVNPWRxIfDfWMBz+OHdF79epLUDiSgUrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoAU3LSSzutzhTofXJHC0/smgMIGYE7qwwOkdgO6FzE=;
 b=YWavFleIuaAEZ9hOP8kAcbmhF07cFDDsTOxh7tsLi+8QYa0AAdbGgPGJRdeTK/5gRP7TJfmpz6bJ7isNd/6vhJCujt9Dhbq6uv0whoW/LxL4LCZc9OwcfaZXlwmMrIPBm0nkSLQfzmJU6Z/BZ3I+xN02v4z3dAfmGOVu8PagjHU=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT2PR01MB4400.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:34::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Fri, 21 Jan
 2022 18:18:55 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.014; Fri, 21 Jan 2022
 18:18:55 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, manish.narani@xilinx.com,
        sean.anderson@seco.com, Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v6 0/2] Xilinx ZynqMP USB fixes
Date:   Fri, 21 Jan 2022 12:18:39 -0600
Message-Id: <20220121181841.2331225-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0067.namprd04.prod.outlook.com
 (2603:10b6:303:6b::12) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28e31385-24dd-4931-9404-08d9dd0a7be1
X-MS-TrafficTypeDiagnostic: YT2PR01MB4400:EE_
X-Microsoft-Antispam-PRVS: <YT2PR01MB4400C44560AED6572349B6AFEC5B9@YT2PR01MB4400.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 82OyvA/y4+VbbqrCWXdAmKT9FFZlgDWb3i+Hbfm79DKBu//1GzR9lw3Ow2F7FJnBAfwu3E8ZP0oHZWm8P3tU7zHBCyPyxBRA2aZUQBuFSl2XZMmOKMvFsyGW7DwRTgJFZTfjm1zKH7wIAMe2qdgB+iuH6k4ZqbcHKXj7019S7ppKoL94CS/H35Q+/8zs6ZykDlZuFlH4HCX1C02F8cB+bR0FgeJ+n/741Ca/A7vMVIcltPO6fb7YtynuhSXvHI2WJRtXRa70JEwGuonrfwHDkkmTj+8NASu+CmQhIv3fVXyWmaZ9CXIaN9UCulIfLFEY1okxa2yOpXBm6eQkbkly1JTihfK0VYr/gmu/QpxmpVnvAqNhj+GMq7NT8P7QQ4XpBsJ0Llce7heaMypGsjXUkJKlXJ7d3U1bJSnuZfj4XCdBjnha3c3fp4a+wx6CUC9SwnC0m/dSPOhCwOQUwyYy0TI1clijuh7hKwwC5vJDh7cp+IoN9Y36sdAiJN9/vT91fX83An/v3QuL78hiG7KptMtlgrRfb0eTmJsnPKNMeosFbvuR+5EjYnGhGfFnAv7sYlgrNErprRlcQqY+FY82V8jdWm3uk4eD51i0JV9W5AUjMulTxuUCC48spQU+e5D6MqYdl+9WX9F5446qK5AJ7z4PrD9ZvXcz8Pf6uKPgE48dcvqnL3T6vwdRbhlJYrT3cPr/uhtsdqCiNeaX1XUcbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(6666004)(1076003)(6506007)(2906002)(6512007)(8936002)(6916009)(6486002)(86362001)(4744005)(2616005)(83380400001)(107886003)(26005)(186003)(38100700002)(52116002)(36756003)(66946007)(44832011)(38350700002)(508600001)(5660300002)(8676002)(4326008)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XqQXK+QSRHJ8F8AUJB6ZgJtBtggRz+MnrvV36JiG0yjlj73a8dgdsgkCy5gC?=
 =?us-ascii?Q?+oo8pRjIjL3WUvQCxFSA7trniCVvocsGyF4FY3f4rFhSY4ZUeevTF9yWJko7?=
 =?us-ascii?Q?MB3mQYov82hJbVP3Jn/EB/61zwXDYoILKfwWRzcvSfXzmJjOlT3pqAeXBNs8?=
 =?us-ascii?Q?LL6pWP9yxfhIF29pR7VaoMrPih9qZMHc2Roede+lsFWngFEtZomv2ZbWzdth?=
 =?us-ascii?Q?UX5bnSEwXgFnYx+FSyw+1ger7wWUI1TjGjnaZ2iMjvXL5woV3JfD4xDgaM6E?=
 =?us-ascii?Q?nS3krHfGHaQus2LhLMQW5PerAQk/+XBD9dKbasGYWkvlnYBIqgSYyXKykUhz?=
 =?us-ascii?Q?N1M5a/vtORzjcLrEiCF4wywwbOcJwsNpFWb+OdQ9uxDW3D3isPH/Rq2JOV1W?=
 =?us-ascii?Q?vRpQU561xFM2rSXhDx/bIhi+FBozjEoAJSkIwgd37hHQvT2KS6Brpm1jh4Ga?=
 =?us-ascii?Q?ONhg+O1N7pb3UiLjVs2P1j4eNCPfkiUB6zfRqgLRSm1jBQ+6A72/BcguYAzR?=
 =?us-ascii?Q?pyitnpsMxLEvIHJbkPyekJxh1g9ZKDRNIaPqdzDU/Bc48v9Ndl25FfsoM2P3?=
 =?us-ascii?Q?Vq6PJOr4ME5gGJp1sXzX3guU6hf9M5yrGJArDY0SFvBWac7yzOnGiSMfAh2G?=
 =?us-ascii?Q?RFjWFuw5NsNyQTcxd/IH9B8a2JkWawnfIj4zAMlTKv2rfMs6gEPhKbFReqRP?=
 =?us-ascii?Q?YMR1oKo12tuq4uvH+F2ZXUkRCdXGaAgEary2aptz61L3qFNDiTJHFk2+nQbm?=
 =?us-ascii?Q?lPMgcALVCv33pK6ZYhl3iQRKMm0faCGbO7lPx6ZGgT4cVGz5mmQKmiuyLEru?=
 =?us-ascii?Q?fb/BEwtOZS/gc2L5dfF7CzOQnyjGaa6OVMGuHDeXAjshrZWScOQdL1A5vliI?=
 =?us-ascii?Q?HNbAHE8QSos7YBiOcocLL8ZPXwRWiamRCSDtlWmLcRv2mbhtfJa3Fbl2wLhu?=
 =?us-ascii?Q?BlsXEusN14fkjGiane/laN+nTABhzyv4YLVATox+mIKdYLrvzlnORCzNxS9z?=
 =?us-ascii?Q?szCSHh1+PxMIMYZg98nWf1a4d3i3KwJ5/28+TapXgfVzKXhT4XEVv19hqeKB?=
 =?us-ascii?Q?fLnexzsuL29Y92QNCygxyXIbsXAPaB0+xBEi+eXH4J2RZyyrOfHnS2cjGxtA?=
 =?us-ascii?Q?/LAOFBQqfZf5EgMekv+PtcZj9phbPevw31YXB67R2wxIfmV3YmwA28U7sIW1?=
 =?us-ascii?Q?7kB5WolDuYmWwdiZ/omxipun+2Ij768ANKykQAHoy14UEIYxndNHC8DqKLdQ?=
 =?us-ascii?Q?APb7TAet5PCle1/aJfkuc6BgP/AjJwPz69U36E5yzi5RZoTR8kLeoAyL/B/h?=
 =?us-ascii?Q?PFAT7y1NB4bWl6p5HFgWg98g3SMz98e81gModB4qJDa/lGCLldM7CyfR5/Wh?=
 =?us-ascii?Q?02/bMhLEBnc9l6YP7skqAaUQbfwUb/7a2Yo7EanQ7uKGmZAl2TCOVVKO2A4A?=
 =?us-ascii?Q?bgEeLBI0ZHMwFcdr/0DuUr/KwzB1uTZrR4+KTZbKgB52hhnt/RCvClJOhnQs?=
 =?us-ascii?Q?yteoBy/1KyhvH68D/75ww6Yle/4TWTJQAMie7kEYqd7rMiQ+Yg/264xS5hxD?=
 =?us-ascii?Q?zL5l0h9aaANlqSCrzR59RnULFQG8E3GdFSHyYupJ3KJ5bWFsEHfzRs1zs/ov?=
 =?us-ascii?Q?T0UyIF6S1+oG03jt2qKEW9HDLzMzjwaVQF6nQSDNBmNVmU6b52/MQBZNtk+V?=
 =?us-ascii?Q?Qd0tjJAWhTCO48SU08SI+DlZ4fo=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e31385-24dd-4931-9404-08d9dd0a7be1
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 18:18:54.9615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmRun3khcTZTU96KBnT48YMIQIdpChIV8XOgvsszMElZcD72KgQtuxR0EmjdTBm6a8BtvxfcDlYWxNSNlg4N0u8pPTQ/rtAHObFFJ7uoS58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB4400
X-Proofpoint-GUID: BWbs-UP9wGb9bFbDuauGaavz35HaZqtW
X-Proofpoint-ORIG-GUID: BWbs-UP9wGb9bFbDuauGaavz35HaZqtW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_09,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxlogscore=479 malwarescore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201210120
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some fixes related to the Xilinx ZynqMP DWC3 wrapper driver to allow
ZynqMP USB to work properly when the hardware is configured in USB
2.0-only mode.

Changes since v5:
-code formatting fixes, no functional change

Changes since v4:
-dropped DWC3 core patches as they are superseded by Sean Anderson's
patchset "usb: dwc3: Calculate REFCLKPER et. al. from reference clock",
ZynqMP-specific patches unchanged

Changes since v3:
-fixed DT schema dt-doc-validate error

Changes since v2:
-additional kerneldoc fixes

Changes since v1:
-added DT binding documentation for new attribute
-kerneldoc formatting and reworded comments


Robert Hancock (2):
  usb: dwc3: xilinx: Fix PIPE clock selection for USB2.0 mode
  usb: dwc3: xilinx: Fix error handling when getting USB3 PHY

 drivers/usb/dwc3/dwc3-xilinx.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

-- 
2.31.1

