Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B4A448E35F
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jan 2022 05:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbiANEnf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 23:43:35 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:47232 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229628AbiANEnd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jan 2022 23:43:33 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20E4hQMh005072;
        Thu, 13 Jan 2022 23:43:28 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2050.outbound.protection.outlook.com [104.47.61.50])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dj2j2gvtd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Jan 2022 23:43:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyej3qhieHf3xBwWxUDo6VvM9NKpnsn0Xh93uJysCC7lvHQlzRHNL6leBs5Ux7i1a8PTiOK8jntSXKvhcEiNpkX7b3e41boRhnrSjsy+sZoxDy+kgAXJHLyn+9+ibzDBa05D0NBN1RVK2HE5ftL9sQ8s1yQkazI1q0ECrfgwDbQ9IZcz2eP0jYvm8ODI3aN5/Dz0ifizTLs3XoX/QL/MEU6v/7PH8lroZnr3y2JTCoQRdU1Rb/4ysGSlj/SQFfQ+WT7cFIyuPyyhgcHMvdRSep3FDO4RKKP8mn41ielq/11+QwiTD3ISJxASS32r3VTjxuc9ckyQYCafpk/MPYZQVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKNqoDCoSOvgmBQFp9M090KUxj/iw9Th5LFC0AkrUtc=;
 b=kPEOFjxPspfi9maM0PebpDBQpQFKeOLc3iURYIAkq7uGmc+S2Awj7WUOEkgrQpvovOv3aUKH1uexwmWsf7bUOHFZE4JMGAAYbL9U+sXwJOsxTFtCDI2axrzvrA2AIWKNYjWARrrELcJHXJ9LLEUJc+XHGOS1HEwL67R4juKEbOf97RcE7/OO4MeOgEvF1Ik3L4nWvGMxf+NrEhK4extqu3rCB/ta4CxtRisZ67G+2aMe/QnKgQ+okNDoF5mhXj5PEUASNgWw2kIjfxy8byj5RQHNZzfgy7vvkB0oZS9wQ1SoExI0Qs7ucu0BHz9vuAEy07g62QUKFdYyJQCwKw9VVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKNqoDCoSOvgmBQFp9M090KUxj/iw9Th5LFC0AkrUtc=;
 b=r3aK6Jzrp6aPGhqXwZE6u7XbRxp8eSrg1hpanLtYE+v8CUiL3Qx0zdVZl98IuCwwEENxDTdIRBEobWF1IZxRFCqNeEoybp/0GCzmsRXvqPboqq1G3oEFy/aXl4cWbnF4eWQjbUbJbMpQacicNrtl/g858iyB50gGYT6sS1/s8CY=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YQBPR0101MB6341.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:38::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Fri, 14 Jan
 2022 04:43:27 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d51:8098:30cc:5bb6]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d51:8098:30cc:5bb6%3]) with mapi id 15.20.4888.011; Fri, 14 Jan 2022
 04:43:27 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, michal.simek@xilinx.com,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        mounika.grace.akula@xilinx.com, manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v4 3/5] dt-bindings: usb: dwc3: add reference clock period fractional adjustment
Date:   Thu, 13 Jan 2022 22:42:28 -0600
Message-Id: <20220114044230.2677283-4-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220114044230.2677283-1-robert.hancock@calian.com>
References: <20220114044230.2677283-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:300:4b::26) To YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:4d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5a78aa2-bac2-46dc-7626-08d9d718681b
X-MS-TrafficTypeDiagnostic: YQBPR0101MB6341:EE_
X-Microsoft-Antispam-PRVS: <YQBPR0101MB63414F26FC22064DA998EA17EC549@YQBPR0101MB6341.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yEd7EsOwqltyBVtIuhSFzZ/qqMPzXwKtFbwTQm/pQyAJy5Leq72CGWU8dStJWAfojKUKavzOhw8kAjslWZowS6uUVbxUYPKf8BSfI6sk6Y4wLFDe8KZz2mFc3SxbkRsK09i/zcThXX62sVWo/+mvvrg3XTBfy74ynKsTQdRvCxqoxrUJRUW4hiHAT8F1WONQftCaPb2SsglwaJnMsv5PRsXXzvbliHbi8CaHpmpvJmMFlFy7mULWUwu4Hmge3yyxhQ1zQpwCP+chDUxx1F62x02eIIp69U5SPGauhIMtRgDgZFx1bbcuh/6uPatFwn0gToLWWpxNsMv4cQyFtOSAk4Gb3TEGR7ioHzqwu3Vrfi5VEXJ/A+12gMqQqzrw2/guB1ncAfU2Dt+S6UwSsVebieuvUOysdj5Ts9t+FaCVFSyWgt4/9x0BXV2jUywFRgGTkxG+Wfq0cG48rwD7/cdP5V/orvW/gb1iyD/uO5nnT2gJhOqSomHRKOBAH+2J/gCNN9BZmXppaqq8LRnyRbkQPASCxG5MNcXq3EzyqOqFGum70k+KzepqFnD1lusMEXNo+v46wlbGClnKNa32gq9jBynSYBL9FdWXU7Lvl9KKtoXeXq3iK6tR+6uqLlMGY3TlKpu6qwJvZvF3+RGMmXRrACvnSDQ/CX/ec5dYsyS9/f92bSxm7uAiy2LS86eVS5VSnfOu9ZFQr4sIUV72jGN3zQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(2906002)(6486002)(107886003)(8676002)(4326008)(2616005)(44832011)(5660300002)(1076003)(83380400001)(8936002)(86362001)(38350700002)(6916009)(36756003)(6506007)(6512007)(508600001)(66476007)(316002)(26005)(66556008)(52116002)(66946007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H+ZvSwCTD77isLfTdywwfwQj+tq7u0qpMGgsK7pYqepsSqFyXRpb1/IpSwgO?=
 =?us-ascii?Q?YIbIAbteYZ4ptGCxXZtIaDbMZjmD3035Xfjna9KfnVdJlq4cNlv5xlHG8Dbj?=
 =?us-ascii?Q?Q4Gj8T7UIVRqYJ/rz8vLwBwyoA3Gy2nNTE5V8ZQWdBAl7jykSgUf7BZKn72C?=
 =?us-ascii?Q?oadsbVNFuxADf+x0mNPlpfuF3XI5m2iLixvqvrg7+mrynMbrrpaY53QFAKbe?=
 =?us-ascii?Q?6khrLnmDJOwI91qxSp53Ls6TIpyIK/iiv8BxMqRKlxKPyxV12jP4CuguaAEp?=
 =?us-ascii?Q?PkCWPRHRu0pYOr5gBLETs8Kzz9y3Tbo6dvZzEs+tpuH+Eg0tUsDrNjwbSSzw?=
 =?us-ascii?Q?CABUsfNBJCUJ+Tjy0hStuWZPgFBgLf7T5Sv1ibc2bLThohtpaWR1sQuHAI3a?=
 =?us-ascii?Q?nfIIKfhymkiSKa7sT0uG+sRIAd6SrgrC6X3SpQj4B8Cs9rUbZ3w663XCL1c2?=
 =?us-ascii?Q?3tpeuf3l3XXrEcYsnSozw79sOlI8JHB5leCUBtDaTFZZeji/fxn1qL7v0X9D?=
 =?us-ascii?Q?zC743VxjDcaJiLZoE6sf4+8e1dYFMUCcx9e4DFelZ1XIIAJmdBrsB3POg3YZ?=
 =?us-ascii?Q?bT1jkTTukCY0nWaLAtcz8bY+u8md+yxr0Pl0Rnddb1XHjtuo49mxyU+3egLn?=
 =?us-ascii?Q?PMwajbdQBuE3aIm+3nncJfwzyxfGzely8sUMQqvhXUWrvjfzR2Cx+1HOqHKu?=
 =?us-ascii?Q?HKKpLKm3jjDyky8ru9VpHxBxRwvpz3le5whQaH20uAZoqzmgIfkkUWyByNqE?=
 =?us-ascii?Q?all4VDr3yIop1oiD+CpSvkby3RIjiqCrsHnWKnZdgJvyEaCM/oiirfp6FqrI?=
 =?us-ascii?Q?rjnUr4up/vbf5KNQwGVoIRGKVpzKT4TAviodCHiYGnX1wjd9DLPDbH8F7qzG?=
 =?us-ascii?Q?bGcg9nByQemdmPG867TM48gS0kvJ5jCrutaYOdu8CQWb0xacaUjcONTn6d86?=
 =?us-ascii?Q?UJq4KTmQ5sXNDSc6hM88lOLgj1u3xHV9oIM3I6+d8qEVYWoMcGKp6qX3KNmU?=
 =?us-ascii?Q?NeFzw7HBdTkmBUDmCJHyy+GxQ379BGLOtolFjMS165u+05+pE+JkOEGgyrPF?=
 =?us-ascii?Q?m03XxF7CiPu9oWSdgUYD8BIzq/Uwj5xcOwAWxdf6D+J6FGWKQ7CxuAhvZp6x?=
 =?us-ascii?Q?E7b/3pRLm8f9kXhce3vZKx2kCVJnoa1CEcBmoW/SvBTSDAFfcetkE8mrgNjr?=
 =?us-ascii?Q?Tf20DcSfDWZvMQ6sRFnbWIUug9+mrV9HE8bzjuennUVXjvF01XO/kedNOYG1?=
 =?us-ascii?Q?xn4FbKMZuL0ZYEVO5dp7M6udWzOYYCEhotJF4EJuBl4tCOe0lc1erm5FA3/X?=
 =?us-ascii?Q?WQActVSXGrnP1cNMxxUrpI7rADZkhrORlVVqqgMA0C6aJ23bMreuyohbtbug?=
 =?us-ascii?Q?/u9fqtesmFUQtevNc4sv72NAqQxmpnad0Vkx6e1lQFShM1/vu6zUnm3TPLxY?=
 =?us-ascii?Q?u8RZbjxwIc84Y39c09ktg48UjUCnlU9Aw1i4wrmI+art8qu4nvmL1VIy19Xj?=
 =?us-ascii?Q?QAC/Kk/LJk4ZCCKnbo3U8Rh7NzcaNzpLie+vgMCM/NIyD0tl3ugIl92ujSkF?=
 =?us-ascii?Q?w3NXXPzFx+CYMeQOPJRv7cZK/DTW3qZbMKsw0XV4dqNx/2U/7vLkJ6sXTitm?=
 =?us-ascii?Q?z1tuPOGNGo/r00DMP/QaUJsEj8ZfwtuD7xHg5QMl3LRmWBBpRhRhlLtvRApg?=
 =?us-ascii?Q?iII9NtZa7B0N+sEJ27yJSK9YTkc=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a78aa2-bac2-46dc-7626-08d9d718681b
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 04:43:27.6390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ip1wp4yl3Ah/F46v722lo9Rb8jF5WyDjJD+e0fiQ+Av0CC379Zne/RyxyWSeu81rqZcYg++utGlEkLyw9+vRYI4a4BFtEfXRvICuOC61SU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB6341
X-Proofpoint-GUID: VLBFIBDbAiC6A3XUqHWouPW8orQO1CHo
X-Proofpoint-ORIG-GUID: VLBFIBDbAiC6A3XUqHWouPW8orQO1CHo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_01,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxlogscore=753
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140030
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Document the new snps,ref-clock-fladj property which can be used to set
the fractional portion of the reference clock period.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 .../devicetree/bindings/usb/snps,dwc3.yaml          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index d29ffcd27472..5872a4470b16 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -266,6 +266,19 @@ properties:
     minimum: 1
     maximum: 0x3ff
 
+  snps,ref-clock-fladj:
+    description:
+      Value for GFLADJ_REFCLK_FLADJ field of GFLADJ register for the
+      fractional portion of the reference clock period in nanoseconds,
+      when the hardware set default does not match the actual
+      clock. Calculated via
+      ((125000/ref_clk_period_integer)-(125000/ref_clk_period)) * ref_clk_period
+      where ref_clk_period_integer is the period specified in GUCTL_REFCLKPER and
+      ref_clk_period is the period including fractional value.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 124999
+
   snps,rx-thr-num-pkt-prd:
     description:
       Periodic ESS RX packet threshold count (host mode only). Set this and
-- 
2.31.1

