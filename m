Return-Path: <linux-usb+bounces-17589-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0009C87E9
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 11:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D34D4B2B4AF
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 10:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9756B1F8F07;
	Thu, 14 Nov 2024 10:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XyT4sS5T"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2052.outbound.protection.outlook.com [40.107.104.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D261C1F80CF;
	Thu, 14 Nov 2024 10:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731579876; cv=fail; b=HqSE0ctFlhzOhfuJzujZDyYv6ZpITRQ0FTtkVD6Fz9fuYKFI3OsBTIznJ//GknfGTRFUhNoJ39GIZfkhCd/iWQLMHAB5oA/AVA1P+8bEQvEu+wfGschpuGneM27do/SIjN5EXpCqPohSOGvnao816+XBJq+JXG25Ow7hNvhxHQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731579876; c=relaxed/simple;
	bh=gxkdRUlHrc9inojBfY3M4UFsysDz9cvlOTdv0Cifk8M=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=S2zQQrSSZByX/8VYf7E4LkXqmHVwa3bnwwLpXbSmXnkzwcs8rh6cQd4snlU7WlGsFxrsSfFpue6Qdo2jnZwEcVbZ2zjgL3BxauIDkiMRszcXj24NkcVLu/SzFyVkP24vn+QDeDgG/imhr7/PAyvTXXNoUmP7G/69xmRk61xsBf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XyT4sS5T; arc=fail smtp.client-ip=40.107.104.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXVEv3TCPV9eh9S4PWQiWE4kLz3bI6LQTMJzXkFz8hx8u0R24UfzXG6P80W4YUooM0FsCvKo7keYE+4n0HXDJNRH+oPLmuLCDJ0P0MckutojHzK+OexOS3MItP/zGAzoE8N5jcNqhFIRP7A1yxgJeJCn1WD5X7VEmEXk8xDvYgM2ZTQju3tZt4X4PTpmKErJ+I5lf9MTmXrrrfBbSC1IcIhVtWCgOG7SIjKQN3Uh7cPmoAej+J1lU9Lvnu5ZEA/Gy1yTtLe+UQ51e0dxviy4jzmKgHGYBkKaNjjWddn5tmwQZEbD2cl8z9vj8yDVmZi1Vty+uzR8/8kh2tErDDe71A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mH915HDQ43iZzhpWYMGi2IX6tO2EeWYjzyG7aY4Zulg=;
 b=trwJNPiUGJ3vXCC/yjHPICamE9vjHm9GES+EBy8xY09n/q0m2okPO3s0ICmh9FhNnM8UrOZlK2UucpD7/y7BcRPVRqpKkvj7eTP9z2PnB1Eo3jjSaids9056OFkVifOYAUxDjRhEDqRQdQYO+j5Gv4bueV/mDZ2gt84x+PqHp0J/LQyCLnElzwa4bi1gAHUF3t3UtyCOjlz/N4TMth0JJTFTt14NSZzSFOrlHkm60qniSLehwG+0HqvN+gaewaKnye9WJxXdtuyYNbGXzqQbKu9krioDTvpHjWQaXw63PTGL6cdBlybX3EIgJoX9ym2Ds2Jv73jRRx7hy7n9u/SDGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mH915HDQ43iZzhpWYMGi2IX6tO2EeWYjzyG7aY4Zulg=;
 b=XyT4sS5TfMcifY3u8ArEWW8FVdAYmVhg/G8wC3GUbSO6QVzUImAV5K+iykR2lF2LArWqZEQ7jyp9ulGYaQLhF+HDGu7u9+/Aaqw5/QmC5A6hTJFT7eVKI/LMHHSdMbFK8n5knJwRBb36xi9aBx/C1W+fsaUKUxsuMKbjcKJjyq7GMpy/u8d+E+3MQmkRspJgpmufdePwm1D81P/dSjMartBfdGt4pNVFzwim+Lw842JflHMJ3KsRNxZdGmxrp6VQg5/7DP1YaMozIkUWH/49aLrVutXlFPqjpJpgPvpxaGyAgQxAPgCfqm7bpuoeFaMaHSpfrNMg7yveTedLeMKDMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB8685.eurprd04.prod.outlook.com (2603:10a6:102:21c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 10:24:29 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 10:24:29 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	jun.li@nxp.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: imx8mq-usb: optionally refer to usb-switch.yaml
Date: Thu, 14 Nov 2024 18:22:03 +0800
Message-Id: <20241114102203.4065533-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAXPR04MB8685:EE_
X-MS-Office365-Filtering-Correlation-Id: ee022b8e-c35a-4b35-b6ef-08dd0496859a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LcgrFixKDkpZxZtH6xqIOkzcxFgON+r1DPei/SzUNrb7KtuIzwTcuGCfDxlP?=
 =?us-ascii?Q?3jTuMD+ZOD7Rm2F2QReUqgT+ZzE6/IDdknZrvk2nsg0XU9Pdb53NnGyBjaqz?=
 =?us-ascii?Q?F608Fd6qa/3ahjmrvThw7hjuUyKAWrkhJ4F5Ij8Rm09pXu1M2ZinGYhvLBDK?=
 =?us-ascii?Q?XnTF+kYFPiKtErqI0Zu8J4g+iuAC4UENGFPXVcPrzQgtf+P9oI0D2O39XKwj?=
 =?us-ascii?Q?D3Oll64U8lvTBWlhMNB7DSR2y8pV0uhWIQQ3mLzthC9snPga3IEWgjoBd4YD?=
 =?us-ascii?Q?zjKKb9zKhlEHrKs8ZWuuTk4Fo9iLudqrtyczv0ReW8If7T0sbXpK7Fg37kyP?=
 =?us-ascii?Q?lxByBAj1yLEhre3UAOikKH/Hj1G8+zqgdp9xfU6CP6KKmfP+RZQ27ZVUOygC?=
 =?us-ascii?Q?toJ+AeKwWRxFXbUuKaVtQOF0uXyiptYx6FevYM5wWnu1Frmefl4hr1o9mpWd?=
 =?us-ascii?Q?fsoY+JpeaHixSWQ8iJFUMJQY35TNGfPOIRD1+MlJtyJyOXnIkSUewJ8YD0MB?=
 =?us-ascii?Q?wRyAUiqGOy+M5hKOJBbXt5djbjj6hG8qvscWWQ5H7z97vcHc2cvF+B6r83ZQ?=
 =?us-ascii?Q?PZ+0h7c2gSWWREfWrg+5MQ1XtCTTbJ99cPNkpfW0yegbBxuxB/rheWNgf9Kw?=
 =?us-ascii?Q?2HdtzeMuZFXcpfbxjOFlxtZ+HM+GAusZpoSIPLBTigzj9oWy0oieRjSx9Ovi?=
 =?us-ascii?Q?OqOsFJLjn2xtBIrVZ5B2dLUHcxpUYVsAfGtDn11F6imATuqKMwlGDUmalDZO?=
 =?us-ascii?Q?4xDwjmd2RaxYGCZ2dXoYFfC1uvGcMgbOXE5UNKpGG9SEyupwjTS6UKYr3bm5?=
 =?us-ascii?Q?OcWXIe6/YXZiEgGdfAN4pOF5/DcAV8NgbwvKxuAeyPhce8Y2wOhGEI7K8UNF?=
 =?us-ascii?Q?L/qnp6ZiCZq2mF62EC21cvRmDb8k0PB9tt7H5Fzq12jqFFaMtXfp3r1tI/ZC?=
 =?us-ascii?Q?nYCye+jxibrukrsVw3JP5sF28DlEp1yQQoVTp88pEJi5wQeFrvmmre/TzKEs?=
 =?us-ascii?Q?1ejOHIQMx8yJ+Jd9N0eYmbHqCXWwW+MC820YCxQ+q2UskHMD+OoKGLIvVQSJ?=
 =?us-ascii?Q?Zcb41FBvDKGWEzSGK+mTW1s8AGU5D/r9KBMdT5wrcsqhLTFlYVG+RSsN6ZHz?=
 =?us-ascii?Q?kSjuhZUcH4Nxb9fXd94j7iueTJyhmL6vr6csbTFMLcwtgsZXAVhLtbs+GlZL?=
 =?us-ascii?Q?a74BLsvbwoWhtytXXAfCwc5Y/G8rz9R3Bh7Efxr46UFs7VOPQf433eoRDz9C?=
 =?us-ascii?Q?Mm5qbBawhR8NSdbAr1ibkIt4rAN940tlySKXzedN/EzkuHS89vGuFgA7No05?=
 =?us-ascii?Q?tRttgGBKPwJJB0gdzKUxnmXt89eiuWNHuPZVLH7aSkjP1Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s2H0Q3UZSGAwVPQu6tXM5VdigjE6PhT4Ljbj+hR5lUZjdK32M1ov6j12iEFJ?=
 =?us-ascii?Q?lPHjNunWtMCsi6OKnFIOeL2Qffzjv6QHgih652r/9nYV5U51oFFupOWRWQ7U?=
 =?us-ascii?Q?8ZAyXQOnHerqz7U8/6EGy7yc0SOtxuDCfuZWyuxx+KwxKMGagprKA0AVKyzS?=
 =?us-ascii?Q?NCWhXEGjb3yijoU+n0PVUZKSEETNRA1Gdj3o3LffeWa8Jj0YUbMS+lJdiPJC?=
 =?us-ascii?Q?Tn+86tIxzZkbdnis0lsR4i4btgIow3afje6P+AHtTXkohYiOcBarJydnsHqs?=
 =?us-ascii?Q?EICbrVs5JmNeYJavM5kWdNSd/XcLojN3MSeLxh3A+cqqe2golT+gSGQbmbRX?=
 =?us-ascii?Q?ySQZpmTEd7L7xz0lN+we03Bm7zVQpQ3juiqPAm6j+JaXXXuZct5hKKAaM7H1?=
 =?us-ascii?Q?fMsLqUIT9m7vnSalsqfSLvdScUAwIf2H08Ae1VJ1mZYBJa+shgN3g4dqT63c?=
 =?us-ascii?Q?JEwzcffwURmCO301oNsv4PNmD3p0jHXI/oWSkxtXTpc7xbCEA/duy0BwXZPZ?=
 =?us-ascii?Q?2LJltyznBL19JxplIDwH5qD71yvj/idxvmApAWVLZgz3Y2piEJVmSP6tIUfX?=
 =?us-ascii?Q?V4MtQ9gOaWVqOEgtDVo+0p/mnEvuVJDXVlFxPzid4d0NIVTeot41uMJ5csNK?=
 =?us-ascii?Q?t8vbQmsFmWRIBHx0EzFuZ4v6qy7M7FUYA5O0ucUZyXygoJ5a3f1KTTj2ULBu?=
 =?us-ascii?Q?WJssTbZB/rj1r+Au4AEttRBcRJg5MozzwzuXO1jpdTo2N0J4Pks8iONvBNjB?=
 =?us-ascii?Q?OSJmH34wOsxX0077W597FlBYvHg1rkaq7PMeaUa06JnAEKnOmlWLllxMgY8d?=
 =?us-ascii?Q?5GC1Ftovg4Oo1pJ9zF+0D3CpUs6yjJA+Wd/BST3KcjrY0u+H6zHki1pmSEo7?=
 =?us-ascii?Q?zgAV28jH7BV2FnPAddNbFQ6jCPwgFghgqRxxKd36lelh5R3PmGpyW+/y97tW?=
 =?us-ascii?Q?tfYFLzQhAH3meJKhDIKi/LLX7U6BRQxL6PDD53AHH1OhB+rXmRtBZsKjeaBt?=
 =?us-ascii?Q?Ya7hsFmj0NpXJER3W8BWGi8kWm30u8+kR53DxBKF79eii7ukfdr2Y02waohH?=
 =?us-ascii?Q?6JPqBG1Zn08LzvG4gKuJQxab9jHsE1Ei2Qt1whD+YuyX5uQQtD6oesq+OJwf?=
 =?us-ascii?Q?TrgyjhXdJdJLdBJ4yUV6KiThJR8K/gRztygK6URICKDG/YYZbXXGvBsK6Ov2?=
 =?us-ascii?Q?RBF1oYWzRXrz0U0DbiJL7OFNXx4a7lwOUcSdduI6OANTQ3rTu9ZnbAT3OQx3?=
 =?us-ascii?Q?owCNngEqj8J0RorMbpqL1qXOWCSwIa4L6q3QY4einolHVo6e7XERc1Tq3Ryu?=
 =?us-ascii?Q?goRTVsXHRfwW1kaEltBFgvWkTdX2Rt5UXOSNsTe2HkZovQ8JMexozR0CM/+D?=
 =?us-ascii?Q?QO+M/b46LeLOQ24h1OSaZWd492NTy0CJNvtFBWLFBAS6vPIpMObXaSJHsQHM?=
 =?us-ascii?Q?/srxUzmH6Oh/PLhP18slnO182hwwQXlgBmOsw/fq+2qzAcRBoqnBp3lzOthZ?=
 =?us-ascii?Q?KwAZwvgDyBw8fF4vLfGxqF9f9L8g3+W+HFYFHq6MogVfts8blfxCng2qQsME?=
 =?us-ascii?Q?PHLnWuOKHYgacRT7degQLw6T5w8Ux47TehlI9mj+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee022b8e-c35a-4b35-b6ef-08dd0496859a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 10:24:29.3733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BU6i9t6Q8UcR2glL7tYF2F+41zwecwz/7bp0jrutogMDqeUY+rIez3uZtxrY3XmEn76XTvCdLwDRwgUEjj/nMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8685

The i.MX95 usb-phy can work with or without orientation-switch. With
current setting, if usb-phy works without orientation-switch, the
dt-schema check will show below error:

phy@4c1f0040: 'oneOf' conditional failed, one must be fixed:
        'port' is a required property
        'ports' is a required property
        from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#

This will add a condition to optionally refer to usb-switch.yaml.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
index 6d6d211883ae..1238792157f8 100644
--- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
@@ -118,6 +118,8 @@ allOf:
           contains:
             enum:
               - fsl,imx95-usb-phy
+      required:
+        - orientation-switch
     then:
       $ref: /schemas/usb/usb-switch.yaml#
 
-- 
2.34.1


