Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64BC333AB8
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 11:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbhCJKxD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 05:53:03 -0500
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:3556 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229706AbhCJKwn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 05:52:43 -0500
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12AAoJuq006494;
        Wed, 10 Mar 2021 02:52:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=MCeDRjJ1Uvh2bQA5BpC+W37iNnOIRtfkfn81AJO4K80=;
 b=krrMzQ18wEusQHnMlt5QkBL6MTBM1aqJFkakfbkgRf2om2UTEnVx1hpCAsIRgqT7VZPz
 rHkqIDTD9QOZVaYJ0w5OX6O+rzReUA91+O0WuE1V5+zMPJrSTW3ZK2T1CvlNYUWl8Ql4
 BVWMbd79x6XrAvrCCRrEfHt7IHtpRThaobc5tFfgVqOtUc1G5sALzAH6wPmrxMFDwlyM
 3Q2/JzK0XUF4e8nL4kwGA3eDU7fm3k3s0KK1eKHbtBMMjf5CAuAzFxgv2Bhr9k5HIlCl
 5NLe6FcBUz0tjuBQsC5OE1jjbHxAwfCZaosWCJFShjQjENaUkCMwYDirVWxiKYpjD7bC MQ== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2043.outbound.protection.outlook.com [104.47.56.43])
        by mx0b-0014ca01.pphosted.com with ESMTP id 3746754cxe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 Mar 2021 02:52:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYg+4NhHZSoE1QnX5NBfafoUXQ5FxsHlqXHL96b+PyxKTweFeNCWoZwmVzcB39NX5NqkVDhUogjeeEypCZvIuY78zuEeqMUy9lp/1oz1zeBjqk59ZNSDV8mZiTrCGNf3293hdKUJDnhEpI78XNGsTCn47AJvls7GSGDM7YSvOGqVNoe51FoKvl3EwgASfDpYsf3vw05ErPX8wfdjGAc22JNiTX91+uBN85DHZjdm2UN1gGhyLJwf8fI/h53hghhY93MdeUAbsKWnmG1T1BoIpdNRLikTmpb0n7cSTJ6l8n57V7ZqXXcGamjcRt4rWpjm0tm5YI+IESOl9Ma0MPwVEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCeDRjJ1Uvh2bQA5BpC+W37iNnOIRtfkfn81AJO4K80=;
 b=hF1q2DTp+lWVbrjD5+Pt15AQc2QwVglgEpknILPibjIke2k1Vy2NTOxzMVp4yy2pq/xJpazRmUInshQeFZzASKZP7+Sr85VNQTzICu0AJHbxI3Qgt6SZNZ7vtOiasWFwyl2CFEolJ09ARny/0e/UUa947MUKe6TZjAfR3yPVb/iOmfeGyzc0Ja29Rs0hmq9B7+TdCqDmkNIgvmk6z9/7GQpFZ6QTasUbT5mCsK2v4eAcKPFFv6h/iOngwn32oGD+K+KTjP8AdRb3NkQAicoZzM753Nb467cLd+2wa0NKyLMLfui556IJcVu1BhcI12N05D++z4cmf2zXlPPCj/GVGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.23) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCeDRjJ1Uvh2bQA5BpC+W37iNnOIRtfkfn81AJO4K80=;
 b=6AIS1aQ7XRh+KDXDy1A0F2sgfPixprJqcmQJVXI59HoA9AgWIltPvOJxn1hfx+oORQ23NtCdTIlN+63zrLg8fVTxGF6J3a4oz5qrii4T6xlByzVxTGqEnsx59/30mjNlku4y4UVtepc1Zm7ZTYCy8g/Xo1tluGH/OT3nXzgLg2Y=
Received: from MW4PR03CA0287.namprd03.prod.outlook.com (2603:10b6:303:b5::22)
 by BYAPR07MB5638.namprd07.prod.outlook.com (2603:10b6:a03:a5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 10 Mar
 2021 10:52:38 +0000
Received: from MW2NAM12FT031.eop-nam12.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::29) by MW4PR03CA0287.outlook.office365.com
 (2603:10b6:303:b5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Wed, 10 Mar 2021 10:52:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 199.43.4.23)
 smtp.mailfrom=cadence.com; linuxfoundation.org; dkim=none (message not
 signed) header.d=none;linuxfoundation.org; dmarc=pass action=none
 header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.23 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.23; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.23) by
 MW2NAM12FT031.mail.protection.outlook.com (10.13.181.126) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.16 via Frontend Transport; Wed, 10 Mar 2021 10:52:37 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id 12AAqY9n017618
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 10 Mar 2021 05:52:35 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 11:52:33 +0100
Received: from gli-login.cadence.com (10.187.128.100) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Wed, 10 Mar 2021 11:52:33 +0100
Received: from gli-login.cadence.com (localhost [127.0.0.1])
        by gli-login.cadence.com (8.14.4/8.14.4) with ESMTP id 12AAqXik038911;
        Wed, 10 Mar 2021 11:52:33 +0100
Received: (from pawell@localhost)
        by gli-login.cadence.com (8.14.4/8.14.4/Submit) id 12AAqWxD038910;
        Wed, 10 Mar 2021 11:52:32 +0100
From:   Pawel Laszczak <pawell@cadence.com>
To:     <balbi@kernel.org>
CC:     <gregkh@linuxfoundation.org>, <ruslan.bilovol@gmail.com>,
        <jbrunet@baylibre.com>, <linux-usb@vger.kernel.org>,
        <kurahul@cadence.com>, Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH] usb: f_uac2: adds support for SS and SSP
Date:   Wed, 10 Mar 2021 11:52:16 +0100
Message-ID: <20210310105216.38202-1-pawell@gli-login.cadence.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a8a4874-bf83-41ae-bdcf-08d8e3b29e96
X-MS-TrafficTypeDiagnostic: BYAPR07MB5638:
X-Microsoft-Antispam-PRVS: <BYAPR07MB56383DC78FD51C579CA3ED41DD919@BYAPR07MB5638.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:313;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A3FyZlsyO6Spm9ItBk2JwrFBzjN/Mqe2DhzUs3oZ5IBv3kEYA5Q+YgM3kBXN+9oi84NEVbx8gWJS0/5HXBBmgzouioJxlYilDOyfE8828w0CukWncBzIn5/bbpZwUWI/oGfvEqI01l1QYgyJR46ufznL9NJBHZq+bBgfy9hpRmgp/408VAt6zFYyRphakzCtBYKX1bZ9bjFRzq3zidXkm/8C5dpobpiCcojFtdGnEZK/VsZ9IBIhCFaiby4KKZaAYPdvIoLmFU+pBXgd7SBbwFlh8clfdNprx5pKh/pj+X8t7o/kbaheBLCCGO8NiwDVqd532aXIjqgMy007NsuC8atz36/KsjCtS9lZq4brFjksPt0O2KNCWwQ+/cJtHC078z+U+NywNiR3U8vkDnMvD+BToj3wZfUjKE0BQNg3+saovRoMHxtpgU0dR8t4Y+VQ1an0zv7oyRHKbe1MFyX26I+2RW5aPiuutEd6KPkGE1VdcPaOzvJlFRMS52zgtEKqgMHoCq6vjJXZ7MBLsNQD8bwto9HowGNPwH46VoObIQhcDSKHhUbpeTMYqO2JNshLutJxNMkPJhXvHzi3Jdz/cxwjkbTBMSBLo0O2X50ef1b/Nt/vrL9u50D1WwOQPQ6VG5rExjNohXAbu1pn/y3ahI+lqLXTNF5tm3+9NX7U+cKcdrfBGwhl0WLnRz2a7UYZYNMvM95NNfiXwpUrOCe7lA==
X-Forefront-Antispam-Report: CIP:199.43.4.23;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:rmmaillnx1.cadence.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(376002)(396003)(36092001)(36840700001)(46966006)(6916009)(36860700001)(82310400003)(26005)(82740400003)(36906005)(316002)(81166007)(70586007)(356005)(478600001)(6666004)(54906003)(1076003)(107886003)(47076005)(4326008)(2906002)(5660300002)(336012)(86362001)(83380400001)(8676002)(42186006)(70206006)(8936002)(186003)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 10:52:37.5839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a8a4874-bf83-41ae-bdcf-08d8e3b29e96
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[199.43.4.23];Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT031.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB5638
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-10_07:2021-03-10,2021-03-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 suspectscore=0
 phishscore=0 clxscore=1011 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=946 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103100052
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Pawel Laszczak <pawell@cadence.com>

Patch adds support of SS and SSP speed.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 drivers/usb/gadget/function/f_uac2.c | 228 +++++++++++++++++++--------
 1 file changed, 161 insertions(+), 67 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 5d960b6603b6..9cc5c512a5cd 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -284,6 +284,24 @@ static struct usb_endpoint_descriptor hs_epout_desc = {
 	.bInterval = 4,
 };
 
+static struct usb_endpoint_descriptor ss_epout_desc = {
+	.bLength = USB_DT_ENDPOINT_SIZE,
+	.bDescriptorType = USB_DT_ENDPOINT,
+
+	.bEndpointAddress = USB_DIR_OUT,
+	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
+	/* .wMaxPacketSize = DYNAMIC */
+	.bInterval = 4,
+};
+
+static struct usb_ss_ep_comp_descriptor ss_epout_desc_comp = {
+	.bLength		= sizeof(ss_epout_desc_comp),
+	.bDescriptorType	= USB_DT_SS_ENDPOINT_COMP,
+	.bMaxBurst		= 0,
+	.bmAttributes		= 0,
+	/* wBytesPerInterval = DYNAMIC */
+};
+
 /* CS AS ISO OUT Endpoint */
 static struct uac2_iso_endpoint_descriptor as_iso_out_desc = {
 	.bLength = sizeof as_iso_out_desc,
@@ -361,6 +379,24 @@ static struct usb_endpoint_descriptor hs_epin_desc = {
 	.bInterval = 4,
 };
 
+static struct usb_endpoint_descriptor ss_epin_desc = {
+	.bLength = USB_DT_ENDPOINT_SIZE,
+	.bDescriptorType = USB_DT_ENDPOINT,
+
+	.bEndpointAddress = USB_DIR_IN,
+	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
+	/* .wMaxPacketSize = DYNAMIC */
+	.bInterval = 4,
+};
+
+static struct usb_ss_ep_comp_descriptor ss_epin_desc_comp = {
+	.bLength		= sizeof(ss_epin_desc_comp),
+	.bDescriptorType	= USB_DT_SS_ENDPOINT_COMP,
+	.bMaxBurst		= 0,
+	.bmAttributes		= 0,
+	/* wBytesPerInterval = DYNAMIC */
+};
+
 /* CS AS ISO IN Endpoint */
 static struct uac2_iso_endpoint_descriptor as_iso_in_desc = {
 	.bLength = sizeof as_iso_in_desc,
@@ -433,6 +469,38 @@ static struct usb_descriptor_header *hs_audio_desc[] = {
 	NULL,
 };
 
+static struct usb_descriptor_header *ss_audio_desc[] = {
+	(struct usb_descriptor_header *)&iad_desc,
+	(struct usb_descriptor_header *)&std_ac_if_desc,
+
+	(struct usb_descriptor_header *)&ac_hdr_desc,
+	(struct usb_descriptor_header *)&in_clk_src_desc,
+	(struct usb_descriptor_header *)&out_clk_src_desc,
+	(struct usb_descriptor_header *)&usb_out_it_desc,
+	(struct usb_descriptor_header *)&io_in_it_desc,
+	(struct usb_descriptor_header *)&usb_in_ot_desc,
+	(struct usb_descriptor_header *)&io_out_ot_desc,
+
+	(struct usb_descriptor_header *)&std_as_out_if0_desc,
+	(struct usb_descriptor_header *)&std_as_out_if1_desc,
+
+	(struct usb_descriptor_header *)&as_out_hdr_desc,
+	(struct usb_descriptor_header *)&as_out_fmt1_desc,
+	(struct usb_descriptor_header *)&ss_epout_desc,
+	(struct usb_descriptor_header *)&ss_epout_desc_comp,
+	(struct usb_descriptor_header *)&as_iso_out_desc,
+
+	(struct usb_descriptor_header *)&std_as_in_if0_desc,
+	(struct usb_descriptor_header *)&std_as_in_if1_desc,
+
+	(struct usb_descriptor_header *)&as_in_hdr_desc,
+	(struct usb_descriptor_header *)&as_in_fmt1_desc,
+	(struct usb_descriptor_header *)&ss_epin_desc,
+	(struct usb_descriptor_header *)&ss_epin_desc_comp,
+	(struct usb_descriptor_header *)&as_iso_in_desc,
+	NULL,
+};
+
 struct cntrl_cur_lay3 {
 	__le32	dCUR;
 };
@@ -459,6 +527,7 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
 		break;
 
 	case USB_SPEED_HIGH:
+	case USB_SPEED_SUPER:
 		max_size_ep = 1024;
 		factor = 8000;
 		break;
@@ -488,6 +557,72 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
 /* Use macro to overcome line length limitation */
 #define USBDHDR(p) (struct usb_descriptor_header *)(p)
 
+static void setup_headers(struct f_uac2_opts *opts,
+			  struct usb_descriptor_header **headers,
+			  enum usb_device_speed speed)
+{
+	struct usb_ss_ep_comp_descriptor *epout_desc_comp = NULL;
+	struct usb_ss_ep_comp_descriptor *epin_desc_comp = NULL;
+	struct usb_endpoint_descriptor *epout_desc;
+	struct usb_endpoint_descriptor *epin_desc;
+	int i;
+
+	switch (speed) {
+	case USB_SPEED_FULL:
+		epout_desc = &fs_epout_desc;
+		epin_desc = &fs_epin_desc;
+		break;
+	case USB_SPEED_HIGH:
+		epout_desc = &hs_epout_desc;
+		epin_desc = &hs_epin_desc;
+		break;
+	default:
+		epout_desc = &ss_epout_desc;
+		epin_desc = &ss_epin_desc;
+		epout_desc_comp = &ss_epout_desc_comp;
+		epin_desc_comp = &ss_epin_desc_comp;
+	}
+
+	i = 0;
+	headers[i++] = USBDHDR(&iad_desc);
+	headers[i++] = USBDHDR(&std_ac_if_desc);
+	headers[i++] = USBDHDR(&ac_hdr_desc);
+	if (EPIN_EN(opts))
+		headers[i++] = USBDHDR(&in_clk_src_desc);
+	if (EPOUT_EN(opts)) {
+		headers[i++] = USBDHDR(&out_clk_src_desc);
+		headers[i++] = USBDHDR(&usb_out_it_desc);
+	}
+	if (EPIN_EN(opts)) {
+		headers[i++] = USBDHDR(&io_in_it_desc);
+		headers[i++] = USBDHDR(&usb_in_ot_desc);
+	}
+	if (EPOUT_EN(opts)) {
+		headers[i++] = USBDHDR(&io_out_ot_desc);
+		headers[i++] = USBDHDR(&std_as_out_if0_desc);
+		headers[i++] = USBDHDR(&std_as_out_if1_desc);
+		headers[i++] = USBDHDR(&as_out_hdr_desc);
+		headers[i++] = USBDHDR(&as_out_fmt1_desc);
+		headers[i++] = USBDHDR(epout_desc);
+		if (epout_desc_comp)
+			headers[i++] = USBDHDR(epout_desc_comp);
+
+		headers[i++] = USBDHDR(&as_iso_out_desc);
+	}
+	if (EPIN_EN(opts)) {
+		headers[i++] = USBDHDR(&std_as_in_if0_desc);
+		headers[i++] = USBDHDR(&std_as_in_if1_desc);
+		headers[i++] = USBDHDR(&as_in_hdr_desc);
+		headers[i++] = USBDHDR(&as_in_fmt1_desc);
+		headers[i++] = USBDHDR(epin_desc);
+		if (epin_desc_comp)
+			headers[i++] = USBDHDR(epin_desc_comp);
+
+		headers[i++] = USBDHDR(&as_iso_in_desc);
+	}
+	headers[i] = NULL;
+}
+
 static void setup_descriptor(struct f_uac2_opts *opts)
 {
 	/* patch descriptors */
@@ -537,71 +672,9 @@ static void setup_descriptor(struct f_uac2_opts *opts)
 		iad_desc.bInterfaceCount++;
 	}
 
-	i = 0;
-	fs_audio_desc[i++] = USBDHDR(&iad_desc);
-	fs_audio_desc[i++] = USBDHDR(&std_ac_if_desc);
-	fs_audio_desc[i++] = USBDHDR(&ac_hdr_desc);
-	if (EPIN_EN(opts))
-		fs_audio_desc[i++] = USBDHDR(&in_clk_src_desc);
-	if (EPOUT_EN(opts)) {
-		fs_audio_desc[i++] = USBDHDR(&out_clk_src_desc);
-		fs_audio_desc[i++] = USBDHDR(&usb_out_it_desc);
-	}
-	if (EPIN_EN(opts)) {
-		fs_audio_desc[i++] = USBDHDR(&io_in_it_desc);
-		fs_audio_desc[i++] = USBDHDR(&usb_in_ot_desc);
-	}
-	if (EPOUT_EN(opts)) {
-		fs_audio_desc[i++] = USBDHDR(&io_out_ot_desc);
-		fs_audio_desc[i++] = USBDHDR(&std_as_out_if0_desc);
-		fs_audio_desc[i++] = USBDHDR(&std_as_out_if1_desc);
-		fs_audio_desc[i++] = USBDHDR(&as_out_hdr_desc);
-		fs_audio_desc[i++] = USBDHDR(&as_out_fmt1_desc);
-		fs_audio_desc[i++] = USBDHDR(&fs_epout_desc);
-		fs_audio_desc[i++] = USBDHDR(&as_iso_out_desc);
-	}
-	if (EPIN_EN(opts)) {
-		fs_audio_desc[i++] = USBDHDR(&std_as_in_if0_desc);
-		fs_audio_desc[i++] = USBDHDR(&std_as_in_if1_desc);
-		fs_audio_desc[i++] = USBDHDR(&as_in_hdr_desc);
-		fs_audio_desc[i++] = USBDHDR(&as_in_fmt1_desc);
-		fs_audio_desc[i++] = USBDHDR(&fs_epin_desc);
-		fs_audio_desc[i++] = USBDHDR(&as_iso_in_desc);
-	}
-	fs_audio_desc[i] = NULL;
-
-	i = 0;
-	hs_audio_desc[i++] = USBDHDR(&iad_desc);
-	hs_audio_desc[i++] = USBDHDR(&std_ac_if_desc);
-	hs_audio_desc[i++] = USBDHDR(&ac_hdr_desc);
-	if (EPIN_EN(opts))
-		hs_audio_desc[i++] = USBDHDR(&in_clk_src_desc);
-	if (EPOUT_EN(opts)) {
-		hs_audio_desc[i++] = USBDHDR(&out_clk_src_desc);
-		hs_audio_desc[i++] = USBDHDR(&usb_out_it_desc);
-	}
-	if (EPIN_EN(opts)) {
-		hs_audio_desc[i++] = USBDHDR(&io_in_it_desc);
-		hs_audio_desc[i++] = USBDHDR(&usb_in_ot_desc);
-	}
-	if (EPOUT_EN(opts)) {
-		hs_audio_desc[i++] = USBDHDR(&io_out_ot_desc);
-		hs_audio_desc[i++] = USBDHDR(&std_as_out_if0_desc);
-		hs_audio_desc[i++] = USBDHDR(&std_as_out_if1_desc);
-		hs_audio_desc[i++] = USBDHDR(&as_out_hdr_desc);
-		hs_audio_desc[i++] = USBDHDR(&as_out_fmt1_desc);
-		hs_audio_desc[i++] = USBDHDR(&hs_epout_desc);
-		hs_audio_desc[i++] = USBDHDR(&as_iso_out_desc);
-	}
-	if (EPIN_EN(opts)) {
-		hs_audio_desc[i++] = USBDHDR(&std_as_in_if0_desc);
-		hs_audio_desc[i++] = USBDHDR(&std_as_in_if1_desc);
-		hs_audio_desc[i++] = USBDHDR(&as_in_hdr_desc);
-		hs_audio_desc[i++] = USBDHDR(&as_in_fmt1_desc);
-		hs_audio_desc[i++] = USBDHDR(&hs_epin_desc);
-		hs_audio_desc[i++] = USBDHDR(&as_iso_in_desc);
-	}
-	hs_audio_desc[i] = NULL;
+	setup_headers(opts, fs_audio_desc, USB_SPEED_FULL);
+	setup_headers(opts, hs_audio_desc, USB_SPEED_HIGH);
+	setup_headers(opts, ss_audio_desc, USB_SPEED_SUPER);
 }
 
 static int
@@ -716,6 +789,20 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 		return ret;
 	}
 
+	ret = set_ep_max_packet_size(uac2_opts, &ss_epin_desc, USB_SPEED_SUPER,
+				     true);
+	if (ret < 0) {
+		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
+		return ret;
+	}
+
+	ret = set_ep_max_packet_size(uac2_opts, &ss_epout_desc, USB_SPEED_SUPER,
+				     false);
+	if (ret < 0) {
+		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
+		return ret;
+	}
+
 	if (EPOUT_EN(uac2_opts)) {
 		agdev->out_ep = usb_ep_autoconfig(gadget, &fs_epout_desc);
 		if (!agdev->out_ep) {
@@ -739,13 +826,20 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 				le16_to_cpu(fs_epout_desc.wMaxPacketSize),
 				le16_to_cpu(hs_epout_desc.wMaxPacketSize));
 
+	agdev->in_ep_maxpsize = max_t(u16, agdev->in_ep_maxpsize,
+				le16_to_cpu(ss_epin_desc.wMaxPacketSize));
+	agdev->out_ep_maxpsize = max_t(u16, agdev->out_ep_maxpsize,
+				le16_to_cpu(ss_epout_desc.wMaxPacketSize));
+
 	hs_epout_desc.bEndpointAddress = fs_epout_desc.bEndpointAddress;
 	hs_epin_desc.bEndpointAddress = fs_epin_desc.bEndpointAddress;
+	ss_epout_desc.bEndpointAddress = fs_epout_desc.bEndpointAddress;
+	ss_epin_desc.bEndpointAddress = fs_epin_desc.bEndpointAddress;
 
 	setup_descriptor(uac2_opts);
 
-	ret = usb_assign_descriptors(fn, fs_audio_desc, hs_audio_desc, NULL,
-				     NULL);
+	ret = usb_assign_descriptors(fn, fs_audio_desc, hs_audio_desc, ss_audio_desc,
+				     ss_audio_desc);
 	if (ret)
 		return ret;
 
-- 
2.25.1

