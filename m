Return-Path: <linux-usb+bounces-4952-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A49BB82BF05
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 12:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A972F1C211EF
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 11:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC47651BD;
	Fri, 12 Jan 2024 11:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="RvYPkZ4G"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2043.outbound.protection.outlook.com [40.107.7.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B045F63510;
	Fri, 12 Jan 2024 11:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJCliqBSB8tF9XfEhIVtX3/wMX+05Tl6Fz8QFRQrd8krR5ex35cJ7wJ2n1dQjHfM/y1JIFthoHscEJjSWEYl0b5za28g6SRxaSofJSLm0PD3uBqUCPBXNY6Qke7wLkkjFaJ5PY9ut0usCSmETdWy8GxiEcKNpuxKyaPVrMySoSUgMr0uWbQSNIRNodMJjmhptbPBO9LLUlEAEFzCMtVzWC4lq9akIISD/goLyMgSAKhnrPXqEtnuiYWpDNHEeKe9gFtoilnErVlaS6FIcb7Jbr/jXPHxAEg0zQwPN2uC5nPpBGT7fGWyvKwtok7dhPbEOfqOhFsm2aefff55yNniCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9q4+e285CENj80xGLmDBkvIsMLy7R5BI9ZByU8M582c=;
 b=Kum9yX7+rhGsBeJGpRBBysz39lQI8zr9EEmFIduvZMNTzjjM6U4xh8dV7duPKFyH3FgPyjdRCIyX0WIza0q/ZTjTS0xmS2/iPYMdJubIUaXKD2tZNgVF4YXaoxA5HDNDHinEJqnHELOhLPbA7qlq/DoCJpg4fwE3O6yEywMHJ4lcUTYFSw6rQwWZy2Z4TWN5IdILkTxdq0FF47yiUKGPYjYUIBm9kuF9iiUqIbKwMfB+6o2cy9np2K6FyTgOM4YslnnSBJAzJZ2IubXp7VRGyLfuv3mq0QuYJT5X0yoN6nXNFiA1VcBEIFFx+ldlEsOposAu5uR6qIcMe2qsy2xexw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9q4+e285CENj80xGLmDBkvIsMLy7R5BI9ZByU8M582c=;
 b=RvYPkZ4G2Kc9mfkQxolMi8ir/+f96SIRE5Z8EygtIlETjB9A6OpI60eiO9rEiQUpXSVz7Ud2z7gMnjJydxqTu07Ui3zrhsXmezHxGozuXOi/fqWSvfeCqoDoYp0dgdrJRjXyuvrFuU86d87SmChZQQ6E1D0q+KUhvwYHeRuSK+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PR3PR04MB7227.eurprd04.prod.outlook.com (2603:10a6:102:82::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 11:11:37 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 11:11:37 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-imx@nxp.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 1/6] dt-bindings: usb: usbmisc-imx: add fsl,imx8ulp-usbmisc compatible
Date: Fri, 12 Jan 2024 19:17:42 +0800
Message-Id: <20240112111747.1250915-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0020.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PR3PR04MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: 24b2b5e6-2ea5-4f55-e5b3-08dc135f3e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LSHR4KfaZjmpCw5TzYHEk9e2Ndk//+G86NjANoQjNdj7c0BQhUeKh3ab4ojXk2NY0zcC5SFqjfwyS0LZVG3QhG49/P5dV6I2R27waCO6+gvb+TX+l9N5bCifacWepCONY06Gti3lBZVpVBn3tdc/d3iclh9YQ7kw7mhvKjfBiX7A8Mwn9VEgW2TGNswVbpPuM4AxpgN3qweG0Yh0gcCYZiVZhbsrV7TnR97daBYh+0UcysvLElos2+tMhXNmsbLfp1lyzvh5RXqTBrYJn1ryZ9HFi3pB/DFXLIWkn0upVGEJDwjhekQJLLeRRZohAMjhMw0TKFfG9SChZtEIKviwUxovoMtl0RtUbv8d+bAis95Rss02/sk/exe5iUtbZYg6HaLUexETguAst9A1325jXbOJZC5pDOwtOn+O6wYjFnG7St2huTG2h6gDzg1rbYgqUNpt2bVzWyFEB2PYw4n9ptDCWg6siTmL/Zmc1QALLC2/9sj8LqpMIdavggM8mkqik5VgG7fZS4ulWrxGt8cFtAXmIPrQWxvBv9dCBYTp+AjzJAuDuqCDOqPp3VggucsNSzuo9hroN+5NSGtjk8JzbuI+i9gx8z58Q44oWJnceKocAdJSH8BA+fsBckc1jyPk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(136003)(39860400002)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38100700002)(6506007)(66946007)(478600001)(66476007)(316002)(66556008)(86362001)(8936002)(4326008)(8676002)(52116002)(6486002)(2616005)(5660300002)(6666004)(6512007)(4744005)(7416002)(2906002)(1076003)(36756003)(41300700001)(26005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ifXJiQC4CiCBzNJrf6q4dazcB9QvwZ66V0u5jnnJc9QcaC++tn81XUe14gSL?=
 =?us-ascii?Q?wkAcnIrwCQJgE/8mAhDaWZa5XX6bc7RdMcKXY5NFSXdGjwNNwY7ljeID9dmY?=
 =?us-ascii?Q?FNpFKgSGMAAuTJPgGjNgxEPa8l0rSuH+d5A2sjDkDiZ4wtHdIeE4f3eE7/Ih?=
 =?us-ascii?Q?E0mevzb48glhmyCiVpLpAE5f8NAmofitEUEkYyDPU0jJr5UVC3E5jRE50uTu?=
 =?us-ascii?Q?g915kvsZ5m6++Z3RaqVw/jqEBn000ITwwwXnRHaDI8G98xK6SeY7fINFjKrw?=
 =?us-ascii?Q?hptrye9wMVUqTQVLYpczF/n9v6c+YntTIA7pQHKXTGPt1He3Rku9tHmHdpsz?=
 =?us-ascii?Q?7tMRr9LBAlv2njeRBSudq7++fh5NPGDcb1zUF98krenWJBK6mJ18wCt3+F0M?=
 =?us-ascii?Q?tRs+fqOUqqC50jH6ms4+cC8EaLjb5URhgufRPw1obMxM5tanxNvHCXK7K1yK?=
 =?us-ascii?Q?0egpL2xzR6MI2zsA8iN7JFVxfze0rP997ZT5RdOxYEB1zpv/OtZkwq38sIX+?=
 =?us-ascii?Q?qANAMtczd0FqnN9C+ca+vaEqJ1yVrMhj9vvWqmmo7kbZoXtjArWrf6pqoekl?=
 =?us-ascii?Q?mXkJeJuTueixxvuBs/5JeZ2Rd6E/vJCAVNvQlmjvMGxL3jgXTMeeJr4xn8Sk?=
 =?us-ascii?Q?KOoP7Mhlk3d6u+jRawK33u8RzHOABMow0Xp37oXctby7juXjqbzhHnIKp9Hh?=
 =?us-ascii?Q?GeT/ST+7zQPaHUb1WZOWjIxTufA4VLkb7/0iYcxaVlYUA0opqrOEjE4aG0SS?=
 =?us-ascii?Q?28Jsn8LFioBmbAz99crRA2sj4VU9ABK60cZ9y/72mE0Og7s6pgFDErNxwEc6?=
 =?us-ascii?Q?+CEdoML47xkceYdDQ/16fD+MA3++XoWeX5JhqzcDlWSNJeTRXaU9WtM6PgdB?=
 =?us-ascii?Q?HktmmCiE7NJu5YkFeeQ+lUiwARMCNFmvaQ7F/oTxYjsUwLmKsI/0wLIAQDmY?=
 =?us-ascii?Q?WZim1FEoaISWCbGHPs5DutesJ79jon0d+TqbHpQCMamCn1RoFoD5h8tQlL/r?=
 =?us-ascii?Q?rr5opuD6YlZF0F3eMMUIFlX87FTQxAyGX56YKQp7rsv6I89YbDOqowIK1g+A?=
 =?us-ascii?Q?NYKyQrLqP/29aR/l42m15VO3JqxmvGnra6JGJFdlUmJpj/uIx6xLH49wUady?=
 =?us-ascii?Q?YbUgrW6/Cj1VHNZGm/Qdjp9vqwQk3Hy9ocA7fGA6ggWwNjNniCnSbqWtG824?=
 =?us-ascii?Q?TosDI5eyops/nW0szzdo9IuswQ55M8LSSW3sLPeoNQPXixkYzzyucnBwXpcc?=
 =?us-ascii?Q?sB3NG7mVBAXJQ6Bs7n26J6P+04FT4y6XrdjJTHOl5EZV4HNW9ADNypfRLKyp?=
 =?us-ascii?Q?6xxOrV5Dv8jHHi2H9STITBeeHqP4gTCQcSWEOuC7ZOYXygBrm1Fyvc+dBkf+?=
 =?us-ascii?Q?ggWOOtRpKakNvpJ6Kst3Rcwa5r5olNHxJKzLf9TLRSo00AEw0ZdgYNJWYhSS?=
 =?us-ascii?Q?5nW8P8raUskA8ZY9mNMNtqPmerjVHUsDYKI7xoD2Mp5qaUyFeK0zl7Exk51a?=
 =?us-ascii?Q?V9bRRAivXSJEK8Jn4GjOQR5PG8k17uB+2FwjkT80+pzATPKd62HgFYK4J6y3?=
 =?us-ascii?Q?kXhGP3Jx8o5mbCmiODuD+sZsYFUe/n7VHCqm2M/I?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b2b5e6-2ea5-4f55-e5b3-08dc135f3e92
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 11:11:37.5643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BjV/5SldhZY2Xj7JtphK6zfBuZj67ujNTyybHcgSdf2iUVjlVtjjzTKOqtt/exQkzAkXQvxkC2Edx8Y0nEyz0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7227

Add "fsl,imx8ulp-usbmisc" compatible.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - new patch due to missed this little one
---
 Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
index 2d3589d284b2..0a6e7ac1b37e 100644
--- a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
+++ b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
@@ -33,6 +33,7 @@ properties:
               - fsl,imx7ulp-usbmisc
               - fsl,imx8mm-usbmisc
               - fsl,imx8mn-usbmisc
+              - fsl,imx8ulp-usbmisc
           - const: fsl,imx7d-usbmisc
           - const: fsl,imx6q-usbmisc
       - items:
-- 
2.34.1


