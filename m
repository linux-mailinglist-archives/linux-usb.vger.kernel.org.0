Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11BC049D648
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 00:40:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231250AbiAZXkk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 18:40:40 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:31011 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229764AbiAZXkj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 18:40:39 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20QK9pqp002638;
        Wed, 26 Jan 2022 18:40:34 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2058.outbound.protection.outlook.com [104.47.61.58])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dud3cr390-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Jan 2022 18:40:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgPrVrvsw1DGMICsmI7zqT7cJcJ9kwshK5ijP5lNff3NEm2i5G4rX9vBiH8ZizPkJ9GFGgCmU4S1joFf4YP26IOxn4Sr0tDm4Lu9hsXpCZCxC+MO/dwm6j5C7MO1AEI3/+yS/XOCLSYtqFXpwmQFQFyCcdFMsh5fDIdmhbqUkea2AIM8qmiNWEOsVHVmALbRX5/2WmLzA3tXYnbQzMqiRxx/+m9IFd+81ik1qoJJJVUMJaqv/zCQWMYqauOcX2e2U+AEOBqFsyHvAaTKgrKLiL/Xl+RJUuvhlaM/eE+xmLxrSSjH6oAdn24Kq0e1/donsKT0p+hZ2gBbcQSgUkZ9fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghBXjrKj4h07yKXjMO/OAnSWqzE9kD4yknqRBRLKyFU=;
 b=EVr3JzXlazfZM8E6Cqv6Zz68TnqiWqhhz6IzTwF20jADT6BRg/WND35Hzg++xsNvrVBN8YOxsS91aG1WBp739mjJC6zPTuxVrrNjuPg/PFRrdJiEsLXRttkjMsPO3I1gtlA1t262kYTXmsMet9GeoXewFYsXzhKVJ0F3g02aL9i7Wu/rYGLg3GBnf7O4pj1CHv8rei2X2bvQOldQMOX8CwTGQpoGSfzB8FskiXoH5rdbPtzlIayGenSnuinBLlULVztVTdvoQbZFGugDUkhE8ooWQNMh6BKmVvPO8MgH2A52LCtayk+PJgAGFOgjdCE6NRSY1eHzzdsxq8xqzxtEGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghBXjrKj4h07yKXjMO/OAnSWqzE9kD4yknqRBRLKyFU=;
 b=TM/No4DwV7vwwyxn0IcX0JZD2Yw4saDBMBnSjvakOvEqbRDxMu8VPq6eWGY6rswr1nWgd7l4vnYjAdiR/cjOpNX/Lg0a9nL1DG7VFQNUsjTVdj8hHQ0SRCgINJAVJ6Om9/3Ct+4OCoe2V73LxnXjgzHhIO71jAlV4FMMpGV/3zo=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YQXPR0101MB0853.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:24::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Wed, 26 Jan
 2022 23:40:32 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.020; Wed, 26 Jan 2022
 23:40:32 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, manish.narani@xilinx.com,
        sean.anderson@seco.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, piyush.mehta@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v8 2/3] dt-bindings: usb: dwc3-xilinx: Added reset-gpios
Date:   Wed, 26 Jan 2022 17:40:16 -0600
Message-Id: <20220126234017.3619108-3-robert.hancock@calian.com>
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
X-MS-Office365-Filtering-Correlation-Id: b6dec747-cfab-47eb-ec28-08d9e1253e5f
X-MS-TrafficTypeDiagnostic: YQXPR0101MB0853:EE_
X-Microsoft-Antispam-PRVS: <YQXPR0101MB0853B06324FE1074F0810833EC209@YQXPR0101MB0853.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eqe/3D7n4p1bke8tcA/u3GyJfTKfmUk3Wl4RPi46ZKaL4wJ8aKclDvEJbesD/VcpvtBdEAGdHt7CLJHn8I6JM36A0hdS8ifJlXqDop+Av248Mcw4UFJ9JuBezHezw1ij6bG4EBi9l25Xb+Q+4yD+ruMjxGbZB/97gqIwmwwOUi4jIZfy7gqBv/iMDXsmbUE1czqG0VEPpf3s85OumZO9sbNJw2uKE328UZpGslNKj1WF7vUQ3XPfmDHbVSWYpb0HKhVNbX7gSSi4dBLL8MRSxCpWLkQo6dYF0OrrQm+1tcgzYpJLu8iV0qFNf3ltU6jl2lF4bSN+A8QO/XDa6KmyteNpE6zpV5pordqr9DZ+NTKrbgGnIb5Cz763UHVyBJySW8C6Ln9YWeRYP3hnMbxj89kU/uEgd8zA+Np4+8vW7i9I9r/cB99Nh7TryHtUJWDp4yLvbw2rxrMMHwn2doIpW/3WOPL/V67C7yII2GlTgEj0BrhaWmsVlUQGyIKNQhwwJFeMPROjnxpaFjO32jCdxoS8a6ECEjHrHvjyG22mcfE0oddjEbHKeKk2nlnKB38Ibsh6SoEPqgDB/RlE1nLRkEIU/jKKIGz7RGRTuj6ojtYnvt09Lz8Ce6nvv6+rJMN6m+2jRh0+hHFdyVLYPzB0OTYzQr5xWmtNvudn1tVd+McDoJwWZoYNVIeK1aQ8girvAPTY2DXvCISMVzYDAPN5xA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(6512007)(38100700002)(8936002)(44832011)(6506007)(36756003)(4326008)(5660300002)(1076003)(186003)(508600001)(8676002)(83380400001)(38350700002)(316002)(2906002)(4744005)(6486002)(52116002)(26005)(66946007)(107886003)(66556008)(86362001)(6916009)(2616005)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fBRq7KVZWnhaynpIsSOxw+xryM0JHX3R7nR9YSOm6jnRQc93fRWvb8v30J5G?=
 =?us-ascii?Q?WQjkAinYLcNKI0cAQJgcRYmFiU/EkYHlSn/ix76YdnGySyBuP/knG4oOo1xP?=
 =?us-ascii?Q?7twpcL1dNriW7CUglXzcZGup2SVrUEuQlrj0i5KCK0ffSoJMuILfqFMvSkoX?=
 =?us-ascii?Q?10zrLIQbeZ5EhB1nbU0fxqtJcTRESMyglhlH8p5lp17fYIsiHTJGJNPsmn6J?=
 =?us-ascii?Q?S7pg+Kt9fXZdaaK1usxPCnJbOYo/9bRUJVTv317DtqNCKdDa86hbwdNbANiH?=
 =?us-ascii?Q?ULLTGM2LQqL9YYQx2i4A0K4ePpDS2d1qFP1aUzaJZizvt6OKOtkSpn0Bd/UJ?=
 =?us-ascii?Q?w0BBbrvgASm8q/VPGIClzRRWSdqs3ixno31ZlUAE/ovZ8hcR8HodjO8dE5oA?=
 =?us-ascii?Q?EvXWXJ6j35MveTD6qwG1adTNnzqkIqwEboZY/SkPrEjqXJ7CUZdzhSo6PJot?=
 =?us-ascii?Q?DA2Et2suajGU1u8n8ykIE8Mh7PvyxI9Jdw/YAghSDiGyAuTmzANtlpC4Va/v?=
 =?us-ascii?Q?Fb6TFTfwGmc8equxWfMXOfEHV5AyxTC9PiYNVBlH4KAwHhKi1uc84pm8jde5?=
 =?us-ascii?Q?WEyJRXNCs/lk4xHx2TgeTB612WbryHZCOiLpKyy2FAu+4pNSFNZQmcoakFPJ?=
 =?us-ascii?Q?uKdSiD1Gh31wKbUgzhpEho5GfFsvm29a1OTZYIUUz9WVA5HwogGNz9hS4k/F?=
 =?us-ascii?Q?izZm0i4u7UQTpzVwwVT4FuTr2vIYztLki16wkvfzlchBs1l24Ak181kIJcd9?=
 =?us-ascii?Q?CPPQanp/nRkAro9+suqipOln+7Zvn3rzkerraU45gDmvgJ1Pg0ZuNwLOZBg1?=
 =?us-ascii?Q?mnbSwHYWVI6gTUCfP3bh2y577to5nWj+suSkVw65ma2ipxJN61PStOZ09e+z?=
 =?us-ascii?Q?4bRtiOyVunt5UskCOUIhAFqzBTQ+SVuJAvVhfByrejuLn7GY7l8PPTDCYI8C?=
 =?us-ascii?Q?gNkjrmv4vgNbb9uqBbfW3ffLYlljZsBxpbAY/JQP4LDLMoiPLAIKO8WxcNbI?=
 =?us-ascii?Q?rBgQCpYCSpEVJzwsqc0+xe3QTsKMHpLSEUre4H946o/SczpqIXnmrUWpadcg?=
 =?us-ascii?Q?EjbqT8AIwQblAg/z/0a215Iu+F00EFm7CxBuF/6J57VIcOzbCbSizH4Z58W3?=
 =?us-ascii?Q?DzLOM3ww5wWrvOXI+euQrhqGTh/IWZS60WabMdDk/dY0yHhHVXA071ZwY5pT?=
 =?us-ascii?Q?Cw9x8A+xPNc4pRDQWN8UioxHcA0Xt/nuWubz2CRqzQgeFleMnnOlh48Rhk+2?=
 =?us-ascii?Q?+qxt5U4Ad+GqNKszj+KRrFDXZ0Q9RjmNebUl598AoQT96C8VsOLwHpXXz/im?=
 =?us-ascii?Q?kSpN9LD6wN8XsCJdoznjO3R6Ci9Zm0VisP4xN+mFqsPpz9/A9lhJeJQCJ350?=
 =?us-ascii?Q?lnUL4ny0pzfd8jU8zyjAzeziEhJdyD9PIenm2AYgJUmFcQSe4crHl9psXerE?=
 =?us-ascii?Q?tocp5U1w56gjqcOW+7feVMtpF3gP6UGfWl7/BJXUG/QCCaSMfMfgijgiSiyl?=
 =?us-ascii?Q?rgY7l6BNxjbm1HRhGLHnuW2CwJh/5DUeKn+hoCa035EBz6q5+ZqQNr5ylrk0?=
 =?us-ascii?Q?/PHBmkPrJnDUIeevu0H41xUqhp3zqtpKloEvWbrORuzCy2+TrZJ6mBhdnZwR?=
 =?us-ascii?Q?dnjY7DPLVWaOlfebrOcoVpa3pDC14Jh/LJncXUcLz02TNYNRHrPVcY+ocjFz?=
 =?us-ascii?Q?XB6UyT1F+FFfUoochyvaM1x8xeY=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6dec747-cfab-47eb-ec28-08d9e1253e5f
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 23:40:32.7711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVYFCOxYsZ2ykEiICWDD7z9DAdbYTljuPPyCZfO/QE8bUGT/ZpfMZ72uSTZtH2ghR3UfgXthepC9dXTbpOfpjTkcdeMF1aYKqavj7CbrteU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR0101MB0853
X-Proofpoint-ORIG-GUID: VzzybRko_hs6Jnn1H1g1HPdVtprp1Rhy
X-Proofpoint-GUID: VzzybRko_hs6Jnn1H1g1HPdVtprp1Rhy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_09,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=725 spamscore=0 lowpriorityscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260133
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Update DT binding to reflect new reset-gpios property.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
index f77c16e203d5..823ce731e95f 100644
--- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
@@ -59,6 +59,10 @@ properties:
       - const: usb_hibrst
       - const: usb_apbrst
 
+  reset-gpios:
+    description: Optional GPIO connected to ULPI PHY reset line.
+    maxItems: 1
+
   phys:
     minItems: 1
     maxItems: 2
-- 
2.31.1

