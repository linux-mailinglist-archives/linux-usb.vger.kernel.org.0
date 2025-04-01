Return-Path: <linux-usb+bounces-22431-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C2BA77939
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 13:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A24A188EADC
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 11:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081CC1F1517;
	Tue,  1 Apr 2025 11:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gw2/WHfi"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2076.outbound.protection.outlook.com [40.107.20.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFF01EDA11;
	Tue,  1 Apr 2025 11:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743505292; cv=fail; b=EfIiQpSwu7Tsrnz8dv/a0XlVN+DrZzQFWJqCyKl3IT3w8icTerNpwkNEUvdo5uV6hDezXt79I/n/YDSNrzNaHTzzCv3zC362zZF24HN9IN9woCVeC/q05ham+FnjaUfRRN61impYRggusN0iKaOGEjCX57OwB8i8xwI1To5IcWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743505292; c=relaxed/simple;
	bh=z8hzSQMGv+fYdXo8jiZ8NADFtO/1YImBe6NczXeL4iE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EDFAJFyAWlSJWMzxxSRGDIe6eHFZZiNlfHG0EhvjT+0i2luqAcKoyudGP/xkuanMKrIWMCgjh+jA9E77knBWY1sMPxTdLd8WUhlgz4kbVgj3D4z6+JXHhsxbQd6R1RXVi+xmYosyFHhVz/hWyLuqtM8c1CZknV2jvL+RHEuBTJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gw2/WHfi; arc=fail smtp.client-ip=40.107.20.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXzAARBSHAOZXjyhTyxoWJrwy/8uMS7vTy2MBhJA2a0mDLA19/odLMDMQNuZewjUe/bQVqhPI0+wfM1YUIrrDdlp2sIviEYb/JIjr2ayzbFpmhKAWw0L22dlaw2F7nCcEVUNn/Z0rl9EJJQ3jx2k96pL4b0dOVYNmwU124JDIRIZElgGTYkINxrjmK4K7f93cDfHL+BpKxrLKQxwozldvnyJNO2jE8OMImsHFYW5Mi+dbbmnYM6DTVsmMq0BYjErxvg4BK70qO+CYlAlZBxk54tR9gATdrXVJ4Px51n1aK3C3zqixSQbG0JqhNQXKS2zTSE/ZbyBzn8d7IKPDrlJbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbUAc8CWAo+HvDbCkFicFNDmzZ4l9BA+p3bRIfDW2vw=;
 b=gvhPGWVuCvBPVkOKa0stbH9X166f0IEzdrSLXvs0gAjtrxxxh2qnnBIFlzSupBDdnnXjsCHIU0ESsImqK3V4Gj2pZZ4koEV3KYxl5vwnrlJWRKz6Wmnj1g6S2KuSXIUo8sEFYTVgst9c46nQNRIB3Lfekmzo/57rMOUoHWSA/tEKrhzHv4WyjrW8zKR0VtLq3hr0+CKBRJ+mYTEwEa5K9WdfGsgE0vAGpo43L7qIWaNzizNskCX822tH75H9LCU1OWimCHrbgfKIqcPP/ibHeJT7d1ouWlY7jm6eYpWzNu29YWQ5iZ7ikkVwExHZuxNg2uJnaHPe62pGywoofHHX2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbUAc8CWAo+HvDbCkFicFNDmzZ4l9BA+p3bRIfDW2vw=;
 b=gw2/WHfiAZdOa8EXnxoola+nDszjKqd2bBfRLjNzYXKKhK+Fom3KZj6tM/2GjglIiS2gKuVlbPDK+3JJ3K9qDL2UMV8hULl2lx6njbOvmR/v2sdWdG4a4t3zOi7jSQ7cUjJ/5xUe2e+lohlNiuTz79qN2ugAPYajLiVvnnGIx9lPoOHy+/+2mdN+/Zv7DIE5Dye994e3BA6SMboVcksXiXCetwaDyE4dwnRA1LIjjb+7ShN4i1LTMfT7xSdQRN8OI/puYTR/PSn3RNWCjzsRp4eiJQUAi8/cakDBCOyVxFVM+l2HaXi6a6SL2ovgZDJthO/RVbUmN+RzYamvbQIfJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB9593.eurprd04.prod.outlook.com (2603:10a6:102:24f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 11:01:26 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.8534.052; Tue, 1 Apr 2025
 11:01:26 +0000
Date: Tue, 1 Apr 2025 18:57:40 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v6 1/4] dt-bindings: usb: chipidea: Add i.MX95 compatible
 string 'fsl,imx95-usb'
Message-ID: <20250401105740.5xtkityygeucvv26@hippo>
References: <20250318150908.1583652-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318150908.1583652-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: SG2P153CA0030.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::17)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAXPR04MB9593:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c322caa-b14e-44ad-1dd7-08dd710c8c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+Wr2F9TXy55Zgec9P2nmFfY01C0wAyZ7FkYmWQ11adfAv2tFNwTeB8u18jbs?=
 =?us-ascii?Q?FBw8P4W7DmCB2ETWfTHV3FxzXF0x/qwE1FR0gdeujlT/I/qDMQcq8UB7no91?=
 =?us-ascii?Q?jPHzHbPp5K450NkHEr5N54c5WOlDkfia/WTkkkrMgWK/Klj+gc4syPDaNuqw?=
 =?us-ascii?Q?Y9Sq3Kv3c43U+S2bh01gShW59wedc+CJtWmsHsc4WwEz6ucnCiz5s7RqHm+H?=
 =?us-ascii?Q?0qrxUq4T3KXBfiBPCfZFeH9LWEMlwNH58CtyssElTipkg/tz2+ZjOuqpiS9u?=
 =?us-ascii?Q?EVlsRg5+p7TeSjoMeF0utGYBVHN34f45vIHGlU7SCqnRW6KkA0vCWDhA9cqK?=
 =?us-ascii?Q?2eSXYyWDG2EZXkudU33VlYXkTXzZHYk7PwObMDXWwNuggFktDC4MUP4u5NWp?=
 =?us-ascii?Q?HrmUneXjp7TznZCfKiG1I7eeGfFWQw5tjJ+sinvvQe5ROvNdkn+esiCpOF7E?=
 =?us-ascii?Q?8I4w1HBavOiJhwXJ9qrllYtnyw7jHN20GENkTayrNrX1Vff/p4l1ErBwSl8/?=
 =?us-ascii?Q?eGbGJbnqNAFW4JgVOCjjcflVqn3EoKIwQhl6TL34cLNsOg8G2UpZw+hOjuIE?=
 =?us-ascii?Q?cNRNCmGbtGJC0mJ66OBFxtrUWuGEW6IjdahuFGivIU72HE33Mr80z95Sl9uZ?=
 =?us-ascii?Q?MRinzkkpzyX+VAvjJJbWl055oI7dnG1BkSn7NC7I3YNH5FY5t5D0m9ACFA4J?=
 =?us-ascii?Q?iVJ7eMLon9GUAErPVOQVOO0OlL04X5uBB8jsFhsGlvWNQnY7t83qgSdivig9?=
 =?us-ascii?Q?dFgaT6DPIbcXx+GAX/M9CIe8g4qMtTKIpxo1KEbhJqEO0uPFcXpj9e2WmTci?=
 =?us-ascii?Q?9dxDNxphLxut5gIymsy/HyFVp+mewtDkABKWvKku6OtzwXPBltKfcpV/S83D?=
 =?us-ascii?Q?amsTMFyPANP9f9L2cJouEm12vNFpS6H+QbvF36zPc78joCjVAD3yQZ8p/T79?=
 =?us-ascii?Q?CPomAfqa1dOD5qChab93B/Pkro2fST/kHEthYD8131E7hn/6nG7EkuTs1Wg7?=
 =?us-ascii?Q?7DWfvKZtGaoWTNLjVHEKZwXM8UPigGRFMoeZ9UR8v7b9tzLpHfW5jvJu/JYl?=
 =?us-ascii?Q?5S6vlPKXKbZhLPp8uMYkYtUD9deGtwuJAnUR92qeR5cPQFxBLIzPDDSXPLJE?=
 =?us-ascii?Q?RvNupay+1RKRtYUW0AFfsA9CxONHtNwky54Q0dBq4qxwH9IRcjTm/3AefZHB?=
 =?us-ascii?Q?mVJZcmvtUwePwf2H6CGxCPdBMKBA6InJla5C7D8Go4lHHbYqq5bH1hJVi/ki?=
 =?us-ascii?Q?9Egj2+DoH+agDh+v8KxxOrakXG+ZgskEN5T1O6Za+viP3CYncldRcKodtP8j?=
 =?us-ascii?Q?eXncZSFHGmKIsX9QQSJR7UuGPEydFwy3DHH1h97h9m6QE90tkuDU1kqMYCgI?=
 =?us-ascii?Q?9fJ8AQYYU2B1yJqr+pdTA7wmTJpaQJ38rjFJ0LsDAzpQGTts6Bc28zTzfygs?=
 =?us-ascii?Q?ntDxvjQnxiPrDhxARtnJxUUM53Rj8/pp/Buv9HpJiq4s1Jb3/n25EQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kqFa+yvM4Ryt+QYxRvUWI2UVmtjY1TI0+VXJbXl017Lqz2MxMzmd4kMluydQ?=
 =?us-ascii?Q?O1bqFgU20zOj6Ckvxxz/60LaUTHQfrWJUVtqdFmIpF5WWiq4HtJ8K28h/+PO?=
 =?us-ascii?Q?3JO0dg4Jf3vITGq4rKynDcMzbtUsEgGMkvhs5Cvs460dtEDzBOoKMfukv3Jg?=
 =?us-ascii?Q?zHawkmK66x4nM004C4+HlrB6dnfx5mbvAMgPI/+yekkibdeoajWmXP5irABM?=
 =?us-ascii?Q?xbiR686/ddl1UsqRlFwPHdHyjJumYw2OL1Xha2bUNk7Y4mX/hO5CbQShSDgS?=
 =?us-ascii?Q?k1iwQu+jJQFLgchBp/VZI1PpCRuEKKWS+A6nwhY8WX7YWWMR2f/l/BRQznkH?=
 =?us-ascii?Q?XDSbXdhQQikHUc+8ASTmtH8+HesBkkah003gviDzDWsBTfgLEJNSxqfHm+qA?=
 =?us-ascii?Q?myBGumSSgPF64tvFoJxfLmbnQW3fp7qKQRDuEWYQZ1WZSRqdCTZyu2pwR8+G?=
 =?us-ascii?Q?/ufo4gKGTI8EBnS2k2v+ntc9jM7FoxX2IVcqVbVIfnF5WWrV2bk7GyBc4MvB?=
 =?us-ascii?Q?O3M4UVrkVXl3WymYuohzsILgz1jhCREHx2F6T+kWvbCoHuAX9LU3QFs6thv8?=
 =?us-ascii?Q?4R1avaZoQljl+jRfekIO2n/R5XFJz6si6PwMi6gqmFobwxIdoH6v6i6qVWlR?=
 =?us-ascii?Q?qP1S8RSYe6m4uxkhgzNDjCAdGfEWedcSd4LTChG8dm4tPKFOVhhGO3/QOT1u?=
 =?us-ascii?Q?JEAz+juh0IU9dACZ1wlX0zlAMDaRtmoouQyRaN+Ev8Ab10HvJxiF0p+0Esm4?=
 =?us-ascii?Q?19OrN7NRaldKrA5okrvZoku02vm8rqgOSHzgIgl2x5Kg+f/gJwPTjpQp2Bmk?=
 =?us-ascii?Q?l9ITFtHLjrRXen5o+F7Mu1C+Cz5aM33uZtqFjW/aZ8n+1KkYjioLUlM4nLuT?=
 =?us-ascii?Q?Nex/j1y8081Om+5YASuhsfg4/hLa+ECn3LfzJP3HKZD2ddpK0hQKNLeutFNY?=
 =?us-ascii?Q?ITH4oSxEVglXhluS2DQTbRjwgO2wNE/m1+xCQ/QOUlMbsH8UoNzLlkKtT3ye?=
 =?us-ascii?Q?R9Pm6FAaOsSS3So7qpXvOAjuCTeaS5+N1BfgzgnM+m2FSPSXLvU73FmO5BzE?=
 =?us-ascii?Q?2MB0aQ6MynS88P4c2Z2YvbBrZBFvoP5bIdBvWe+P0eJQcQE/p+hWD0sDXlCg?=
 =?us-ascii?Q?grJXRmSSodKVrE7s2ziiUg6s9XpqDLQrYjhLMCOYqf36NGPOTNE5n6X23/zX?=
 =?us-ascii?Q?bEGNb5vKwhlcyX7DwxnKhVSB2OFrA7lJ5A6IyHE+BntqIAnlwddKqtK0qXPZ?=
 =?us-ascii?Q?nFD/+xU/zt25kVwYdf46L0iMCVcO9O5jpI44HyKjHVSRUbQL7jq+kpW3iT0w?=
 =?us-ascii?Q?ti+X1xPlJoCnpgDJsXZqNvLg06Wr4MqmwqTuADtcY4EUbCHZgV/hsdNmN28u?=
 =?us-ascii?Q?LOh5dNKC0giEKsS7ZklPfaUEkNuHIJXBx1uGnUyH8TNTkd4XjVHGp09lOqPq?=
 =?us-ascii?Q?Kp7jDCwMSMGO0PMQhgk+pUAmtwzLXVs2vSOrmsOU8gvTRtdRKaZLZGKldAza?=
 =?us-ascii?Q?FqdXgB/6eRjgXB33nLd4W86VrEEtK868EjiMlM/HeWhlXyKFosKLUyhUKMMQ?=
 =?us-ascii?Q?k/EVnAcx//kWessVtWhmBAiy2TFUSj9toLDDqQJX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c322caa-b14e-44ad-1dd7-08dd710c8c16
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 11:01:26.2375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /p1tnnGd1udfOnEV61AF+CjPXmA3bC9XqBILGPI2i7QWmj5BT6khUA0Colt8Xvsds1wBIA8GQXRt8NuAtJakOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9593

Hi Greg,

On Tue, Mar 18, 2025 at 11:09:05PM +0800, Xu Yang wrote:
> The i.MX95 USB2.0 controller is mostly compatible with i.MX7D, except it
> requires a second interrupt for wakeup handling. Add the compatible string
> for the i.MX95 platform, add the iommus property, and enforce the
> interrupt property restriction. Keep the same restriction for existing
> compatible strings.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v6:
>  - no changes
> Changes in v5:
>  - no changes
> Changes in v4:
>  - no changes
> Changes in v3:
>  - add Rb tag
> Changes in v2:
>  - improve interrupts description
>  - improve subject and commit message
> ---
>  .../bindings/usb/chipidea,usb2-common.yaml    |  3 +++
>  .../bindings/usb/chipidea,usb2-imx.yaml       | 24 ++++++++++++++++++-
>  2 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
> index d2a7d2ecf48a..10020af15afc 100644
> --- a/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
> @@ -42,6 +42,9 @@ properties:
>  
>    phy_type: true
>  
> +  iommus:
> +    maxItems: 1
> +
>    itc-setting:
>      description:
>        interrupt threshold control register control, the setting should be
> diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml
> index 8f6136f5d72e..51014955ab3c 100644
> --- a/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml
> +++ b/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml
> @@ -41,6 +41,7 @@ properties:
>                - fsl,imx8mm-usb
>                - fsl,imx8mn-usb
>                - fsl,imx93-usb
> +              - fsl,imx95-usb
>            - const: fsl,imx7d-usb
>            - const: fsl,imx27-usb
>        - items:
> @@ -54,7 +55,11 @@ properties:
>      maxItems: 1
>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: USB controller interrupt or combine USB controller
> +                     and wakeup interrupts.
> +      - description: Wakeup interrupt
>  
>    clocks:
>      minItems: 1
> @@ -191,6 +196,7 @@ allOf:
>            contains:
>              enum:
>                - fsl,imx93-usb
> +              - fsl,imx95-usb
>      then:
>        properties:
>          clocks:
> @@ -238,6 +244,22 @@ allOf:
>            maxItems: 1
>          clock-names: false
>  
> +  # imx95 soc use two interrupts
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx95-usb
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 2
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +
>  unevaluatedProperties: false

Will you pick up these patches?

Thanks,
Xu Yang

>  
>  examples:
> -- 
> 2.34.1
> 

