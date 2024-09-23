Return-Path: <linux-usb+bounces-15301-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E14CF97E749
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2024 10:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F7021C21088
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2024 08:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126BC6E2BE;
	Mon, 23 Sep 2024 08:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gI/rG8T2"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012016.outbound.protection.outlook.com [52.101.66.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE062C9D
	for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2024 08:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727079069; cv=fail; b=rhIf2Ner5Gmx3QJeiDLr3FObSzT+YyPWLGW4EsJVWnZ7894PddlqAR87s4Tjgxpp3FXIoewwmTS6dIShIts8Qe28JGe1/2GgOcA32lL5HAENRQGnE6PwuZ/CR0nWFQqsV/KT4AxoYPW5PRa9rPfYiKxOFguEBXkXoK2fe14aV4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727079069; c=relaxed/simple;
	bh=eGXYF/Mvb3FCExUJeiCYcoTGUnGyX8YzOEh42vD0R80=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jdbvAwarwliPdvHBCTG+QcRn2PYkFtDbADVYkOnjnWfWSR2D4Y7XACusPbnOA6rF+9bLXpeIBrClpDEMChewxQP3YCWcUOXO8GfZpHq+PM6l/tKkSwsqppm3RjduxqXZWnHJdBjFhS6dHfMAvByvVUQXkI4TBbqCbc0H0NbGvEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gI/rG8T2; arc=fail smtp.client-ip=52.101.66.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CsoNmb3+yK1beInPYy2mPnPuvbqESgNjbEpmGpdXJ1l67o56wUwdN5phHUSTfYzjEQLaBVO7BxlebftrqntR7K621m8in8iAYeyMdvKTT76yF72S7QgZf0TIDw45zj7QMDyqnKZvuTlPiweeXgp0BKK4JuTjYfL40z2tITSX6e+ukkps2uKsIZJAzD507s7uIGjVHRXaPP68UPdHnVso1PL0iZyj/9/SGfv/WPPg/nhXgiMMHP2WTAZsA7RH7aOIUpKgwLVzQzzuQcw3vTyOJNaifZzMBagaLJ4gLgRavUtL/MmTF1Yxk96lZsHYaSHLyOvqTZ7X9v9wsECyP/C4ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ye8NjMJz6I7mT07gigiSOXZpMY+iI5gH2ci3E0dBxs=;
 b=NkSIhQscBE9Pro54U8jdABhNJJVXm6MQLPvJpG0tgsBuESUr5yfLzdcUfHUXGvsMN5Kn3HkVYnMQPVhVc4rmOvsPUOe3fgpM54CzRPVkGY4kRExqySgqeaA5rg7qwpZhT8yuDAULKz58ZQBQtJLE8Ghu8boMbARx32UVQ3W/0SwWg5f7VbQJBi/2HMXtIGorp24tymOE1V9lwONOHm4pYm8lP+RyJy5fMI0yPhj1CRS71KzaWA9I70Nx9meQwgOeaZDkPNbQb82a21lyhym9+i7oY5NNPkBYTMCgIKDMWRH5ssSuioltDxSOoS0rqzkvHDpBgjgeoJXXIPNSR0dH5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ye8NjMJz6I7mT07gigiSOXZpMY+iI5gH2ci3E0dBxs=;
 b=gI/rG8T25SOh1Bj4Kr+cx/xh3XQHYJzfS2GYFY+KNzyuQXrVDNPE/IeB4pK5zDQxh4ePnn8uCtYvmBVr+wLyu4zKTjoPpN3sMmQprlHNiy/YRIJlinEEg5Oquscg+dDeSI8pZtfzteWG9xs1JQYsGn+sJ+uUtUwTcc3JG4r/idttReZxHE7wYw4JoyidYINlPkuoW3AxPlpgQgTi6EbahhpvnJxQmNX/cXcKSY+/n+cK2zQ36IIIK/YLb906kixxrAq7j8VNpqkIEyJn9Y8EjoyJusM6ziNIjyvGYy0TsHOyp5D8XEAQ0Vu3DHuLAdT+QkZilIJloavJWtoz4YDB5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PR3PR04MB7244.eurprd04.prod.outlook.com (2603:10a6:102:8e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Mon, 23 Sep
 2024 08:11:03 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Mon, 23 Sep 2024
 08:11:02 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2 1/3] usb: chipidea: add CI_HDRC_HAS_SHORT_PKT_LIMIT flag
Date: Mon, 23 Sep 2024 16:12:01 +0800
Message-Id: <20240923081203.2851768-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0237.apcprd06.prod.outlook.com
 (2603:1096:4:ac::21) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PR3PR04MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: de474912-7b66-450e-29c2-08dcdba743bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7yOw0SDxKgkXxXAIk13SEwiNPnGHdVz/XrQt5rBFBSOekSkM+K9Nk8xNxaz1?=
 =?us-ascii?Q?4AO0Slw+Z5antHQPP5dR4ICi1aPI6D0BHcG/CdjM6CmXJJPzxZFv88+0Vqo0?=
 =?us-ascii?Q?e639Lrg8m3bKiaro3H7fUHEmRi8rR888hJDe9Sp3acIqwZvsoXY6uLE55H9p?=
 =?us-ascii?Q?EuPTN/8OA9osk7cW1t7vAeCLexm3ibnIZgiF11XBdoM+MdMpKT/dW9M9UvRt?=
 =?us-ascii?Q?B6r3lHI9Fh59Luj6PcYMhhFrMugopI/TtTSNal4QN4NXnxrTpFkpZB2lyQfg?=
 =?us-ascii?Q?IFPWiufpf59Onei1nn20mUAIKCIM6v8oM9u7PZaSkg7dfUj1Zxn3a0q8a+fw?=
 =?us-ascii?Q?y2pPElkbRGwNMMgpY8T990Bg5vqIjTO2gp1Yek1n67Q0iC+fM3Mq9TnfTQeB?=
 =?us-ascii?Q?szI0JbI+vgNrG+7PdRWHUTMRuCtkMoSqeCsGUOUElX/tswwl6rxpVR2g+RAP?=
 =?us-ascii?Q?1HyqkX45oSk3OSzMHapS1XVHRqhvBbgVNjDzqMVVXPDct0Im8n0/3s9eKj+e?=
 =?us-ascii?Q?5uO1Gn3oCQ+O2ITQDWimCv3Pe7xzJYMePJ+CRjlFx6s9eu2IW71bN04k2TUT?=
 =?us-ascii?Q?VldCg6CJd/EHnn11DqsyWaxuV0Ylbd358/C+rgAF/2cWqCDQHVhHEFI03Lg4?=
 =?us-ascii?Q?hZVWUVZ16orQLYq93QUEKNXMiwUIOgmOEMT9XC3QTlTiG/8NCSbOuugr/Byb?=
 =?us-ascii?Q?O6VtVC5MkyFn0TgIDcLy9d+15n2GVvOMpbVR6DRZi6wbK+2pva2YOould8KV?=
 =?us-ascii?Q?03PLUK4KxCqm38SXbkVA908tsXVJWNpQze49wXCE5xzRUepKuE+UeJ91FRxl?=
 =?us-ascii?Q?9Mkx4G2R+H3eCd0/FIHMDE4V7qyqsjLOU/TXhqVlTtHMYNEabmdxMJMNe7sV?=
 =?us-ascii?Q?DmbAg3J0n5No8qqczBb66ug3Tp3DVId2PqDrdZPDsxzxH6aidx0L9G/SLgc7?=
 =?us-ascii?Q?fCfJHQWu+qNEVDtrG9XHbR+lJ6mJMpbcoCFTmBl1jS71FeM2Zo9qZpZ0aXLt?=
 =?us-ascii?Q?/6NUguObQWN4tDSNdWxebzyR7txDEtJHMvOjbC1eBUJ6fh1a0MNNSLV7pWVw?=
 =?us-ascii?Q?TPjpY9JzfcQ88mltfRPyVKSYS6MiVkqXU5StJnsXTI5wCBI048YjP/NXjqB2?=
 =?us-ascii?Q?Rr+r2CQXys+Npf/mx0TjrX+ZNNYtQSkHCqo2HqDe/Xn88PxQDcfyeqc0a4cM?=
 =?us-ascii?Q?8x6GhAhDNsSyvbj5E+Yqlk63Qu00DpCwisW6qNd1H0MRZzE8L5GAK+zxG8Ks?=
 =?us-ascii?Q?1FHAsPOk1ZIUCXXCyBXEUp41YE8RRcnvpECO1WHsoeZc3z89jarkcVlv8bRU?=
 =?us-ascii?Q?45RLJiQPMeW1+NoKmEfGR3rDMbNtKsTGf6nz9Ps+f4lq6g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1MTs21Y5mZ+H+1JRMmnBGefTFEPX/eD/RbS1fo8VJpNv1uFllkWWYIH26YFw?=
 =?us-ascii?Q?1FU+RE/oPYqZC6i+cvKxtHeuKqfQ0ObUr1DhHhKaeuxp+2G3w+GjNKU2gSpw?=
 =?us-ascii?Q?fTvsiw6x8RzEwrF3qxgdLhMVrAtqUJj2hb8TUMxyxzI3n9V+n1J5QdVpIQNY?=
 =?us-ascii?Q?9rYROvpoMM7cdq5eLjm7yp6ygzC6K31fYf2+KmP5ekmP/FX4XT8Yw9eTO9Bx?=
 =?us-ascii?Q?1AtCuwl05dew0q/pHsnXhcxjKP8sgTAP17qPbAWKjgYCMfAfLQWCv0XT5Nb3?=
 =?us-ascii?Q?s3O0M+nO9zCP5S2mkXJehl+Yr7eBA5UvdYosz3tZk3I2nRoao8jgl9pmLId1?=
 =?us-ascii?Q?aFT2JO6/UbI0boAbTkYKMsd4jiVejwyVPMnk0brgQVrZgcfVDr0rkwl+UmCy?=
 =?us-ascii?Q?YIDvgpNY9m3tXok/GX3SCmHfJTiooBd541B9T7RbCcH73EO/XyPDSVdoPb8Z?=
 =?us-ascii?Q?oaRxO2OOyF/O6csl4JyQVFNLJBCNv6PFZZ0ZKCkqBlUZtH5aFtin4nQzPeh3?=
 =?us-ascii?Q?+jnWm/PvhkZfGjLz2yli0/m01XqYv+1a6ktuSN8khTRv2UuR13TgBPbbSxOO?=
 =?us-ascii?Q?p/YXPd0WAZtqHP2viUGbE+lOjzBbba/jytfSiCjcj/g5t6kGgjRZF11swOok?=
 =?us-ascii?Q?CrhgjaUepdPTownBanWNPdOlre2LeFLDZ9u0B9oNnIAxU9PYqm5UAtcgo2er?=
 =?us-ascii?Q?OiksKuuaxPPOLtk1bu99pubdfv7nI5PYyEnOwZk9Vz6RflDA5EsJXL5+16Cy?=
 =?us-ascii?Q?1ar2JNZCp2x/liGTb0WJahYoTvMof8nz01UvJX4gRmgbDv/DYsdV8Go0PeXe?=
 =?us-ascii?Q?vMRBvsRluO8cqfMgTv00TgCbdBzJ5vF55ZX/BORvNWd7ihbm7Dn1/saP6XuR?=
 =?us-ascii?Q?QIYF795iRk5Vzy3Faiw1sbL3YNtTaOdVbRj70t+j9IDxH+IGsHFB56W4Q3X3?=
 =?us-ascii?Q?qQBCnCS3S4vQtE1MP83yVUt7AlzQa0ozkb6nq/ziqjEftyHiXmB7ELCRcxXe?=
 =?us-ascii?Q?2vFoSXmln/JQrUA10dqDcExw58r9eRsfVtci7I6sveMtzP9HTDD4U7SBC1H5?=
 =?us-ascii?Q?mVxbdMOrnPvvW3JgWaxRQ//ddElk4FV0GsqS7cuJvERRBpV0jDEdNDqFjOa9?=
 =?us-ascii?Q?W79V1BdUbdFuIOq0nUjXeV1y7F4a7fKgfyt3JNhdfki+E+Z0LQAAsirG45Cu?=
 =?us-ascii?Q?GXdLu7zVFVmqkWYAJksZ3D4lyscfkQLuj9siIWjd6GlGpwW3j4rrASXfz2Bb?=
 =?us-ascii?Q?B9gYyiqp++UpbxDvwUEdBVh10tQNIPWMU9Q1J/UDJg2G9xVq8kCCJ7/7kPF6?=
 =?us-ascii?Q?zVO/A5oGiJTYRYKkNSwp0/J3CXNsg535PY4sftFWJDFHcSFhF8gbYZ7EIKKy?=
 =?us-ascii?Q?7CQXcCql9aPoTE/1MZul46RtKUWk/54ty7GMe6kE1pTjN5Nxx8ozdFTxYfkQ?=
 =?us-ascii?Q?HLYAPUkGk8Sy+EHCorMD0gvTz/g3QXhlXjxDpKbJoECSUxbZZi+Kl0erx1Lt?=
 =?us-ascii?Q?/0w/ooSrkMVGAfMHOkJfE9dDVgbLlw/olvj+TmsuuUOQC2eWE3RW2PqwN5yH?=
 =?us-ascii?Q?Iun77mGPVIMLMfQee9VT7PWXbqowSNZAoNAm4Sfz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de474912-7b66-450e-29c2-08dcdba743bb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 08:11:02.4150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQ0pZLe8l9c8WgIYEN3K/yyQvZzgstUVNKQsq5u+5Fhr5BK0xMeQtka6CZU8hqr1+j3LZly3rRKZYbydxeeIXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7244

Currently, the imx deivice controller has below limitations:

1. can't generate short packet interrupt if IOC not set in dTD. So if one
   request span more than one dTDs and only the last dTD set IOC, the usb
   request will pending there if no more data comes.
2. the controller can't accurately deliver data to differtent usb requests
   in some cases due to short packet. For example: one usb request span 3
   dTDs, then if the controller received a short packet the next packet
   will go to 2nd dTD of current request rather than the first dTD of next
   request.
3. can't build a bus packet use multiple dTDs. For example: controller
   needs to send one packet of 512 bytes use dTD1 (200 bytes) + dTD2
   (312 bytes), actually the host side will see 200 bytes short packet.

Based on these limits, add CI_HDRC_HAS_SHORT_PKT_LIMIT flag and use it on
imx platforms.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - new patch
---
 drivers/usb/chipidea/ci.h          | 1 +
 drivers/usb/chipidea/ci_hdrc_imx.c | 1 +
 drivers/usb/chipidea/core.c        | 2 ++
 include/linux/usb/chipidea.h       | 1 +
 4 files changed, 5 insertions(+)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index 2a38e1eb6546..e4b003d060c2 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -260,6 +260,7 @@ struct ci_hdrc {
 	bool				b_sess_valid_event;
 	bool				imx28_write_fix;
 	bool				has_portsc_pec_bug;
+	bool				has_short_pkt_limit;
 	bool				supports_runtime_pm;
 	bool				in_lpm;
 	bool				wakeup_int;
diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index c64ab0e07ea0..17b3ac2ac8a1 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -342,6 +342,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	struct ci_hdrc_platform_data pdata = {
 		.name		= dev_name(&pdev->dev),
 		.capoffset	= DEF_CAPOFFSET,
+		.flags		= CI_HDRC_HAS_SHORT_PKT_LIMIT,
 		.notify_event	= ci_hdrc_imx_notify_event,
 	};
 	int ret;
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 835bf2428dc6..5aa16dbfc289 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1076,6 +1076,8 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 		CI_HDRC_SUPPORTS_RUNTIME_PM);
 	ci->has_portsc_pec_bug = !!(ci->platdata->flags &
 		CI_HDRC_HAS_PORTSC_PEC_MISSED);
+	ci->has_short_pkt_limit = !!(ci->platdata->flags &
+		CI_HDRC_HAS_SHORT_PKT_LIMIT);
 	platform_set_drvdata(pdev, ci);
 
 	ret = hw_device_init(ci, base);
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index 5a7f96684ea2..ebdfef124b2b 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -65,6 +65,7 @@ struct ci_hdrc_platform_data {
 #define CI_HDRC_PHY_VBUS_CONTROL	BIT(16)
 #define CI_HDRC_HAS_PORTSC_PEC_MISSED	BIT(17)
 #define CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS	BIT(18)
+#define	CI_HDRC_HAS_SHORT_PKT_LIMIT	BIT(19)
 	enum usb_dr_mode	dr_mode;
 #define CI_HDRC_CONTROLLER_RESET_EVENT		0
 #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
-- 
2.34.1


