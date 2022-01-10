Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D95AF48A0DE
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 21:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343521AbiAJUUE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 15:20:04 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:39896 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241448AbiAJUUD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 15:20:03 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20AI5rmQ001632;
        Mon, 10 Jan 2022 15:19:58 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2057.outbound.protection.outlook.com [104.47.61.57])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dgp68r80y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jan 2022 15:19:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWfPpQujziuLg/81fvo57ZaPbNxZ1q+dHYu8jRH1VSm74Z1hnebi8ZM5xUqoVxUJKQ8Au9T/eEFpiZ57cpGpj6EafJj1oZGAFu/ILtBXoCWZxjNz/KKZkV7UhSSEJ9V/xAcLNG3OB6j18nIX7daHn3MiNCEvHgyuNfF/T2Cm0PbjLlPxpKXSojCzeqLmZHsdiP+APe1XOVfZnzmatHRhZ4dCJDfeZT2hczTa484C1+whORurvsUiof36e+St6aGHiS6TlOgDDvEYZWV5qGeFGgw5kgkglw/99HiLqF7sE4/UIfHEg7+Tz81DjKUQ5go3SmQ3XslgB8+CQzFkFykcHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2oSdv8ZwMs+Yx8qie9OGhqE7xAfK9vyzTGeqvD5adI=;
 b=FEpCN6DSGjmqfoLbMl8Rjkhwa7XwOEFCoW+2qj/h5UX+OAyM8Go4Gf3GOHfWwef/CjCUaJ1OkKW+qDPIxyKxEutT5cdYdo+CeGuYQPeuAuoa/vkAC20q7KqEY0C7T4EnGc0CRyrqIlAKLjaZA0qJvLixRrCzj6oq8kyUaifh3IJumdjORX1GTWcptvCAOpc5M606tG6IXZAfDO+UNqFhf3uPlmNlCxB3hsNvBD74TmXrYADdtxYV4n1gA5pcYfnEGUbIiLMqD6l7FHXVrEoGC9uLtC1sXOinJP4z2zz+9gdxHRzVlNq+Bl+oldgwBYF82tbtLhq1ZoalJN3hGSmKTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2oSdv8ZwMs+Yx8qie9OGhqE7xAfK9vyzTGeqvD5adI=;
 b=Dl5xhOCLOJUA5XRCl51dDjaJlriH27soLJdLSUJ3rQoLT13cKbAzL4zdoFOkh/nIrIrC5evpiHa6GYT5hyRcwTbv0YlIIZR3g2HPKK8YwXVT/SnkK+4X7dp0dIkh6xYk1HMRuLpllZPBcWw1Nw6CxWeb0XyO/QXVj2TY25YpxCc=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YT1PR01MB8505.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:c4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 20:19:56 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec%9]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 20:19:56 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, michal.simek@xilinx.com,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        mounika.grace.akula@xilinx.com, manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v3 4/5] usb: dwc3: add reference clock FLADJ configuration
Date:   Mon, 10 Jan 2022 14:19:35 -0600
Message-Id: <20220110201936.1371891-5-robert.hancock@calian.com>
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
X-MS-Office365-Filtering-Correlation-Id: af6ec7d8-47f4-438c-ef12-08d9d47691cd
X-MS-TrafficTypeDiagnostic: YT1PR01MB8505:EE_
X-Microsoft-Antispam-PRVS: <YT1PR01MB85050C2C9B9C41E216D42D59EC509@YT1PR01MB8505.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zfm5FicDiroVw/6R0I70f7FeEr406uZU3Ge3H0Rb5/86s8NTQxdt2sOgNUtvEREJ6NTUrEfGS/ZHdZLYPqWwVoQtMsPVC/SpgmFoWSkTvwQ2h2TT7HpW6vPP/Q0GYZ5Q0btMiQhdFOd1RGVi8BaL5+owDQT0UigiTV3ysO5PIwMa0G9vAHOMAeFCbXDbzlgipGYc/E+tc+Gu83Zfb5wvLWHVJMOBR3/75PVTB9rE9aAhDDmAttaHJmjtbIrT1dZeApNDCtCGNpHjPyhQuYApv4eB4ZHbSy/vC32IejuUqiJQT86v5Xw56ofXb0ejOboZAKgXFMSphetgREwQBQc9J3JERxLlZpwgMiaQ4VFR36ik8DVf/ZWq78cbPuF5iTStzzpTAkrtwr75ubRBK81GtIHrKg7lRBHWXmommwnIU+cXMHspjLgu2FnBXDkvAIi7IbPaY2E9mgZPlSqDKjDPlaMEoch9E4w3KoQpAhkU+pG9Tjnxd8x9tpAfLF8Sm6hFW6PS1a5DCTk9cgxk53EdE7xEaCf2zFyRVGqvwvcyrD3F1J/c4JVDKjt8x2r7g0w0VB+loqXtPQANTaNLZN32Mu2BiJdyE7eUrwYEG4mFs9hgyVFGQFTYOeffhr3GVjji+0Pcl13CZ4cKzP+KZEo7v8rO4ZdKJPtAros6RvPOYb0VVT/jr7jyAh1EiJ4EA37SLdrfUOirFaWFDvKOdeBhrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(1076003)(5660300002)(6506007)(2906002)(6666004)(316002)(2616005)(4326008)(6916009)(86362001)(83380400001)(107886003)(186003)(52116002)(66556008)(66476007)(36756003)(66946007)(44832011)(6512007)(8936002)(6486002)(8676002)(38100700002)(38350700002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gl6k3XMy06Pb4NRw/gEM4T4Jb9aX3v5UNyF6CnLyEEDhAskMjWhLyURtBc8l?=
 =?us-ascii?Q?vLcXgvnXLpnK+urBkfwvkgggAjq6EWcN55J0Lk65l/xukPFme59kUxdGD1d5?=
 =?us-ascii?Q?CfCUcQm/rb5bYOKlSPsVrDtPZ2rh2WawYQ+QnMugjaMcVrWB4ICK3xN69Mtl?=
 =?us-ascii?Q?AyPHxNHJhnfW5WjOouUegM80Qk5A/AzV4hzLpOv5GoXu6P0XQuw7Xz6lnedZ?=
 =?us-ascii?Q?LRJ1ZBHkR9Y0HmGwHplL4AhWTaIcOp1D/gxl5W4VwKOBcYld7i5X8jBmfco6?=
 =?us-ascii?Q?BPE06kMeNBxJZEeX/gSXrldr6RZPG3X2dB5oH71p+rjc5DC9/CC4W+O4TIWs?=
 =?us-ascii?Q?CwmfP40QOw6sxS+HANo0cu/wWn1OXgBqU0KG2S1tk8DE4UgulRObHghGFbV8?=
 =?us-ascii?Q?w/haAWEb/tAJE0OxM8W362oAM8nrebprvleP6Fl1iBy20XpiN1KG2Bgvat4s?=
 =?us-ascii?Q?Y5RgxGI5RzDYFXh29666R8RV+CcQCGIwijF+8BnJZV9ffhIsAsAVnb/ELwfg?=
 =?us-ascii?Q?szNXfBFeNqutIvzhzAUVs9P2vqYfpTax387vZZ4KghU1ERJ+K7cWxUVgLx1x?=
 =?us-ascii?Q?AhIFsoXGl8QE5dDGFScJhVr7gwYxNzWYQ2q3MAuDaL5g+2Jl7ABnkYTEYf0C?=
 =?us-ascii?Q?DCthCzkWJ5kuZxfyZB+Q95hzMb/oyCaWuoE/g7tV61ygD/K0PXj7TKIlMVlL?=
 =?us-ascii?Q?o+QXD3GeFIIE+1Q062c9l79+xWTJ/wOJQCm/VmHjTeJ0Igvvak8nOrB4D3Er?=
 =?us-ascii?Q?/K50Cf8PEKHL+BSEP9+tDzxe2LeMkqs0+hqa+dhV0OioxL5QU30N7JlYiX9J?=
 =?us-ascii?Q?x2fk9ziJt7VJQO7Oo+RelyM6rb+9kVrPLL+86WqrILzgU2V729GIRwB2fYqL?=
 =?us-ascii?Q?ZSSLjuzqu+srxozKu3mxBTFYwSECemMjRPypRA/6lMDlD4JW3QUksXA+iNG4?=
 =?us-ascii?Q?i4YMJdUsyPY8vKLl+cYM4XlsFG8mMhg5gu2WUVSQhS1Gh0SAczwf2kP4uXFH?=
 =?us-ascii?Q?MC4ZoHPxu3/fTr2d4lgZZ2ON9LInmR3Y4YHbAa0AjAzq/BjVmcWqdXsJABGZ?=
 =?us-ascii?Q?nF2sGB+ug6xpygUdcsnpnCQwri74CslMnx3JpmhCnY/NQMRDqZLn8hJa/Jbs?=
 =?us-ascii?Q?kOjGxcIlW8BTnw2y//6Abo/5K60IWrgkbVjZRf6IZksSWgvEb2AKLFjwobof?=
 =?us-ascii?Q?uFyp6z03Qp+SbZ+MVCKABMqKCWgNABEYqou0l+g4q5gl9FjjaJzr+HkPUSdo?=
 =?us-ascii?Q?UI9gO/LqPebV+mZZS/DQknYjBnsqWD2TcBOc/YfYbcpzJrzG5qLNw0vbF5tt?=
 =?us-ascii?Q?FbA6xdvSXjK1r2czAljSTExMYAf+VavsHndRt3wlwUw1Gy7EQ3fcnyO+/e0+?=
 =?us-ascii?Q?yZmXZr3qEJZxlmmBmrnvG8uHtSCYRwe17UJCl1Ep17hagEpX3I5QpLckqp66?=
 =?us-ascii?Q?7TaKW5WGOvADcH6h9WDjmHvXNid42TK7UMkUJf9D6llPqu7Awbm+3X9dPkfp?=
 =?us-ascii?Q?jjBYnTyeSbuLFQLa3Jd07AUUyBm+stYd1qwDT6bXf+VWIDd2BAc7uM8ZOwS2?=
 =?us-ascii?Q?a9Za5g2tG6D4RE5hNxtlyx+PrHGkE8HOMvPNOC3bsi1hcujeZGYTdl86DUbZ?=
 =?us-ascii?Q?zZ+ex4veg3wLiHP8wUuv8kn4rNc1DIvI3WC7r9DzgTdaOcRR84L8s42iQcYu?=
 =?us-ascii?Q?ymMYQtDJZgIt2DMqxew6MW+Uf5o=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af6ec7d8-47f4-438c-ef12-08d9d47691cd
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 20:19:56.8151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5hEjG1lCctsAT4L7apmusuWfRT2CGz7JjPtkMAtKYwy0bQiSrJ6dph725aINZlJpX/QhVa/J5V8EtkyzkTLgHPukMN51F0WX3yuO/wsRYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB8505
X-Proofpoint-GUID: LYONNuSYh8XL-f8rvyjSEN9at-3Z6_sn
X-Proofpoint-ORIG-GUID: LYONNuSYh8XL-f8rvyjSEN9at-3Z6_sn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_09,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 clxscore=1015 mlxscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100138
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

Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/usb/dwc3/core.c | 35 +++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h |  5 +++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index f4c09951b517..ad224fb8088e 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -359,6 +359,37 @@ static void dwc3_ref_clk_period(struct dwc3 *dwc)
 }
 
 
+/**
+ * dwc3_ref_clk_fladj - Reference clock period adjustment configuration
+ * @dwc: Pointer to our controller context structure
+ *
+ * GFLADJ_REFCLK_FLADJ should be set based on the fractional portion of the
+ * reference clock period, where the integer portion is set in GUCTL_REFCLKPER.
+ * Calculated as: ((125000/ref_clk_period_integer)-(125000/ref_clk_period)) * ref_clk_period
+ * where ref_clk_period_integer is the period specified in GUCTL_REFCLKPER and
+ * ref_clk_period is the period including fractional value.
+ * This value can be specified in the device tree if the default value is incorrect.
+ * Note that 0 is a valid value.
+ */
+static void dwc3_ref_clk_fladj(struct dwc3 *dwc)
+{
+	u32 reg;
+	u32 reg_new;
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
@@ -1033,6 +1064,7 @@ static int dwc3_core_init(struct dwc3 *dwc)
 
 	/* Adjust Reference Clock Period */
 	dwc3_ref_clk_period(dwc);
+	dwc3_ref_clk_fladj(dwc);
 
 	dwc3_set_incr_burst_type(dwc);
 
@@ -1418,6 +1450,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				 &dwc->fladj);
 	device_property_read_u32(dev, "snps,ref-clock-period-ns",
 				 &dwc->ref_clk_per);
+	if (!device_property_read_u32(dev, "snps,ref-clock-fladj",
+				      &dwc->ref_clk_fladj))
+		dwc->ref_clk_fladj_set = true;
 
 	dwc->dis_metastability_quirk = device_property_read_bool(dev,
 				"snps,dis_metastability_quirk");
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index e1cc3f7398fb..5011296786de 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -388,6 +388,7 @@
 /* Global Frame Length Adjustment Register */
 #define DWC3_GFLADJ_30MHZ_SDBND_SEL		BIT(7)
 #define DWC3_GFLADJ_30MHZ_MASK			0x3f
+#define DWC3_GFLADJ_REFCLK_FLADJ_MASK		0x3fff00
 
 /* Global User Control Register*/
 #define DWC3_GUCTL_REFCLKPER_MASK		0xffc00000
@@ -985,6 +986,8 @@ struct dwc3_scratchpad_array {
  * @regs_size: address space size
  * @fladj: frame length adjustment
  * @ref_clk_per: reference clock period configuration
+ * @ref_clk_fladj_set: whether ref_clk_fladj value is set/valid
+ * @ref_clk_fladj: reference clock period fractional adjustment
  * @irq_gadget: peripheral controller's IRQ number
  * @otg_irq: IRQ number for OTG IRQs
  * @current_otg_role: current role of operation while using the OTG block
@@ -1166,6 +1169,8 @@ struct dwc3 {
 
 	u32			fladj;
 	u32			ref_clk_per;
+	bool			ref_clk_fladj_set;
+	u32			ref_clk_fladj;
 	u32			irq_gadget;
 	u32			otg_irq;
 	u32			current_otg_role;
-- 
2.31.1

