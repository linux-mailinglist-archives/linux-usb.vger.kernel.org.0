Return-Path: <linux-usb+bounces-13079-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E65F9475B7
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 09:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A23C51C20D8F
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 07:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4E71494C4;
	Mon,  5 Aug 2024 07:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GzbHQ0vL"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF18C149002;
	Mon,  5 Aug 2024 07:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722841515; cv=fail; b=rYtb2/wFJP4yOq3ZuwG1Toj4r5qitIW+v7MMInSNEBYuETKT7Vej10DFN49SIG/YTZXP0q91Ouzmn43cqkEFF46z+BZphLF/vCt3jou2wfdXBrT+JpHypF69Xi2f/krnfvQhLuV8XTgfSScNQOCAF9OEJ1QrYo3Opp5p13K22kU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722841515; c=relaxed/simple;
	bh=6fhEmsWgtUGP0o0hMyTFlLe/4cotFROLyUoL38KnPXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jlnS2ghpfsKHVjs8F/G9/BwEvyKJL8MUKl89RlxM+pOMZtqjxDTOkBqstDR2phWeYyusPnS1M1aK8IHGvP7l9geqaDTlOSgnJsqrkXj7EymanOLsgBqWRCvoQY/CbNqas8DZFCJj77VW/sqPqXCcj+eO9OttgQQJJDeOzAqrFW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GzbHQ0vL; arc=fail smtp.client-ip=40.107.21.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4pZMFt8J2HJjUrYWN1wAqx3NWQR3BF97Ds/mWHKlJoL9ZJyl9pasHRXccNUnqQ5PvRHJBhAcmqjtt4oRVUjUqgIAJRiZAlEsCBUYjN4+djHORJuo2rKu+NvSIYHgRq3uta1l9FTkfQCS62A1+99iA+Gs/zmcBO+hMea3wlkMfaGRsDmYH3og80EXMs5I8hgNaHzMCBqIzjVT8fGKiGuQGwDw+Me9iC0B2q0w57pFgxv2iQXCbXrJIu7WH8Vw8utAUNHqx4JmJXKXrq8H1e8KtYGfdc0WOaRxvd7Jwl7yyMi4xkPLY4cC0t8L9DhMq33eWkWJueBNwfQsesY3P1ilQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxPgtEScUnYcXde+J4IB9st15xQit8HI15ognSduwe0=;
 b=ShEvo774HG94B5qrFsLgybcA+QCtGaFftnDWVhgHiHlufgn4PuqdP7vcg7EYWKb58nZNZjWD5t4gH3G0gj3jugAWkv4eRw0jFMYJ6LGrk4pOR4pGRiRYrePWo6QgnCExRegHXGk/3Gzw9YaR6k4wjVfMnoRpFe4gVOMB5O/QnhxU9u4vbKnq7Fj7l/XHO1Oi8AsBbrfLdHgrBN4md6A4jGKNJ8SkluK1pszK5iUUIH9yYdvqoFEWK6gNtzBsQOH5DrP/4xf36yQqbmahuZ/Hx0g6e8plq6uq7vlajBF5SZXop6G7Cmemah3isJhqRPL++5k3dpZuWXFpK/7o/DdCZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxPgtEScUnYcXde+J4IB9st15xQit8HI15ognSduwe0=;
 b=GzbHQ0vL6VdjVyvEb+V40YNpEl2C9XNjhSSQQSkkFDS0Ej8Itj0Cl8UmxcbZ93EKz4aQxaeX4jaftoNQErdsG309CN8+INzs6GXMC7kMd7iyvVQMy5H3EX0ltPYMsvnQtBcf+m9FOfbRXclXAUoNNCxdlSDyWODyQoc5iVgAc0EfXGV5GuBz+1vj/PPNbTc+BKrRq4q+lgjhXCpt6S1oawhbxA2yHScby1iWClIo4sBLavhglvWCjywelZnlzFMafnsLoYDcm19e/rs+UR1wT1TFGewFC4rwrq/qTrqiWhKZKbXPBm7ErLEQMWwuDnz9c4KGa43qKF4qYi4hiZN2oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB8690.eurprd04.prod.outlook.com (2603:10a6:20b:429::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 07:05:10 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7828.024; Mon, 5 Aug 2024
 07:05:09 +0000
Date: Mon, 5 Aug 2024 15:04:29 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, Frank.Li@nxp.com, jun.li@nxp.com,
	l.stach@pengutronix.de, aford173@gmail.com, hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: phy: imx8mq-usb: add compatible
 "fsl,imx95-usb-phy"
Message-ID: <20240805070429.rqykjd3ap5swd5vl@hippo>
References: <20240802091702.2057294-1-xu.yang_2@nxp.com>
 <21557eac-44f0-451d-a194-c5d545cacbee@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21557eac-44f0-451d-a194-c5d545cacbee@kernel.org>
X-ClientProxiedBy: SI1PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::11) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f38549-4429-4e74-42a9-08dcb51cf193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q0VP5+85Kk5XMXNJyix9ABOx51tbbQ+9V6pooXXM5upl3HVeeuRecNl2nDb/?=
 =?us-ascii?Q?w9qJTqFS2bj/SfTknjDvISNwzEN1L+rBe54H0OCnO84LU2LpDeLV5eyzGonq?=
 =?us-ascii?Q?zdOh5b6QBvAYU3FtpmV1ltcWjPSdLyYzqVe8XbXHUN/3IyLSQXL6DY+gykkM?=
 =?us-ascii?Q?AUdbDe2+FrBy2A4gfmInXeeOkgeGNGR/Uei5Zv2eXosX+nJkBXmXWHp9wSZ8?=
 =?us-ascii?Q?bOosb1z3WyuZ6yaXyF2lpRRufFbm5Sxz37qMygy40jXObgr7bJV16/blMB4p?=
 =?us-ascii?Q?PQXVosYea/zF1NJVCbOaMbgwR3gY9+Rrq3xTtQEWA8ixfDGoIesfdT2SZRLv?=
 =?us-ascii?Q?1TDwdQexq/NVEMVTrbkPQBrCdLqcwy4tYflBThJ/R9uQa5gBOsuIuIBy1o6e?=
 =?us-ascii?Q?2zHxaaXp/r+WP2xr43dSEyDi6UQGBZdkRrt9vBadm0VCaNQ0lAo5iSajDiEr?=
 =?us-ascii?Q?qz3GLC2B2E9mfPbshF26D9/vw0j4SblJqQJFsB1o113dkJ4giM9upFIgESkH?=
 =?us-ascii?Q?3DiJtQY1IqppA9ILCKg8jS+0vqS046I5IYg3yZ75Vjqa/GpS4SC+hB8h0zKy?=
 =?us-ascii?Q?cbPdWykwlwrSX2w7WHBsQyQzOQfLrHIPScW53r7rDX/5r4zOOnDxURDUQLnH?=
 =?us-ascii?Q?uDLXoH2/XWDYy6dA4st4hhHduQP88Q5Pjw7VgjaP7zHGu3u+dcxaFWMczTVp?=
 =?us-ascii?Q?2sUMhfJrwr4ZuRYIylxxRp7vrTAzkRcvpq0BmsxTOufgpHJ5Aw/HqYeoXnsW?=
 =?us-ascii?Q?xKqhgzwzXTQM/ot2gn1JS71CiDDkLIJfhkLIewIZ/2mN8n1aqVt/WRhD/8Pb?=
 =?us-ascii?Q?+Ru7w3XEVmaTUct5wBfruAJXi9s1ZCAi72R00wY+Q4qypFWguqgekTgLyNlJ?=
 =?us-ascii?Q?oJF3RW/dpQwuJGWHCmfZPEBzwM3Yx03opesY3P+HZiZBFqEV/GygjiTvLZbt?=
 =?us-ascii?Q?0UNWhz0EXZBlyCa0z71Bxh9SROt/WVpmF1ee555ZltmgaFe7rJBUymGoU/Bd?=
 =?us-ascii?Q?7BnTTPhk0W+Go2cJW1ojKJXIytYeiBasLcDyrvqpde1PkArJEnaCNVZTNnLr?=
 =?us-ascii?Q?U7ePZrubk9X/aFtisoiv+4gPef2RVTVOG5bc7B0jMZy4lGvKTwzVcsNefq+O?=
 =?us-ascii?Q?IJYsOBVcECZas1XCwErsiHlULgSFSIZqJrJzkMODriBxIZeOUlJn/N2ElD5T?=
 =?us-ascii?Q?GQtU76AEaviwvHYChes9zzftj+pPKwNrjft6S1YVvZkeJEd1ROJWZzq24whc?=
 =?us-ascii?Q?WbvD9h4UMEvP4tr2EpiMyEnNnjYKiGEpC5QVj3U5WlhImkTCO2RNmBlCitAF?=
 =?us-ascii?Q?IXqCOt+ZakLzpvFcQ8M21kjjIRcZHE5UXI5V+OY0nwtuIojUKfBqzLGaG0uj?=
 =?us-ascii?Q?sw8OIR+0Olweb9Wi/liewdyXr9Cl0+8P6TNlmghAGbIiPeYz9w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XutqoMVe3DsfGb5GggVT6VjkVm0ldCh3jNiOZtTojKWSaV5hp7dHkTqLuedb?=
 =?us-ascii?Q?xX5smZRzX4fuBt3dunvtmlUgjSct+5d5O3WTWw7oRHkslL88IO4XvSeKG3/9?=
 =?us-ascii?Q?mk20hiEE1WYZd8n8W0JLU8WWGIPXp0mij0ETQmKcH7j6B8m33YKwE9k0iNAP?=
 =?us-ascii?Q?cD6flL8cckxKcdao7/fWfqtlR6cviThGfmJNS3uw4sWV+vWGxhOJkD3qQhLh?=
 =?us-ascii?Q?EYqzJmbrmYKLpMu5LVc/K4HCkPQlOQUQhF1ka2M7wbkgfVkhvTbEhHMuIN4C?=
 =?us-ascii?Q?SxP7T6htmV8N7WfZ0EdvLCE/g2scDpFC0/evCsfZW4qzGJ4Ih0W//dY3DHgo?=
 =?us-ascii?Q?egXqrR2Fy2OPicn1jtWyvwe+WcxiwY2NYOBG3QdcW+auk8Z+PtpD5I9hprUY?=
 =?us-ascii?Q?mJNV4yO2jXixJm9aSAPHQE8GiB9LzHMI/aPhVTRH5n+a/l2CTQA3DQVV93Vy?=
 =?us-ascii?Q?LC9WJ/A4zKlf+ZpaqknbnxrG8U6WdSknplf6dsBuajKkitCEGR3EckjCoVxB?=
 =?us-ascii?Q?HxXvbzQaoDoK3q3W7DeoscySZGwrhQODhsTszwIe02RoYSsl1e0e1pHJh4tM?=
 =?us-ascii?Q?fOPvgFXq9ZwBzjUAP+u8cdw6/kAuJ3XK84FP4X/OLp2dzVTMlj06Fhvgoysw?=
 =?us-ascii?Q?Uo2FSpptIrOqmuz67mv9X1P/osuxJUVk97DvGb0cBNDHiMVxyD2ueZzQpfQr?=
 =?us-ascii?Q?nooFV8cuAfXgl6UqEeRYdrqn5x43D7Y0ECdiSffxeZgeTe5DrTcJLZpVG8bE?=
 =?us-ascii?Q?h0L969gX47WXx7ma2krWwHmcMRPKrNJEV5MYaiEHd02qkNOyfN5bMW2gObIl?=
 =?us-ascii?Q?1eTTcWnQd75rlUmxoXqpdORhcv1L4zFYJRje0/Xuo7Q4NRoZyJOo54If5USZ?=
 =?us-ascii?Q?zx+/t+SotmIe+DGRbt8dfdgmQxVdKctAfSioFGC8FqT2fdOEFUQDJN8FtGUF?=
 =?us-ascii?Q?nne3ReDU5mgU+66MA/uikOVVc/5fR3QpsomMzUzmVgONn9huLonzz9brJTgb?=
 =?us-ascii?Q?IfHUUv6tomFMvYx/CwD+0mCMgekNLp/YJCvJst7XEgZBahYwcTAKx5WNa7dT?=
 =?us-ascii?Q?7zeu3uJpmTqGxjIWLF34+0xGVZooHlpO1WrJl1AgDt6gIn2rtyeI5pfEgJTK?=
 =?us-ascii?Q?GDog6ehnUg/X6zNoSrx29bn11vmPqxqLvcnA/ia/pERxQN0gB0Y4yj49SDol?=
 =?us-ascii?Q?IVJhe7S+QpEzqC3fH17dhdYqOyYgf7eRuy/1qANgHlvplIJxRZGbSn3NgHs6?=
 =?us-ascii?Q?eJg4osbE0Off7xEZMGNaNGW6yrtlgp7sgQ3DRz6bvZXkMARjIaF1HtRRat5R?=
 =?us-ascii?Q?IBtd+pzS4848ksSAfTHqA2abj7FvYOKQ/EkzC2pT/GpkM88w8DQVq/aCAKzr?=
 =?us-ascii?Q?N2Uihb+OvSuUEmIWwLuh7qhjqr4sDDqK0Weowjaea1RUi/g+fcjuBzsWDYWx?=
 =?us-ascii?Q?H36Y7sGvsGw25UJx9sdLMkE6mGPBNvn72dZSxVB3ryeHEHWn2XIsXf2Ld5Qg?=
 =?us-ascii?Q?A8LkCQ6Te4NRdq2in7zvLAeniHdl0JxmwDZfjECm5AgLMdy7K4etGxix1NZj?=
 =?us-ascii?Q?yiDZEoywpEB3RC5agHom1lYRNYEHBqp1qSqHaK05?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f38549-4429-4e74-42a9-08dcb51cf193
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 07:05:09.8233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/9jzcA9LYoqDG/0+W2fALAXADYGgg36co8wBIviM5+SkFrTocnth7+lGf844jYbP/zELOCOtCD2onaFgxUVTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8690

On Sun, Aug 04, 2024 at 04:16:34PM +0200, Krzysztof Kozlowski wrote:
> On 02/08/2024 11:16, Xu Yang wrote:
> > The usb phy in i.MX95 is compatible with i.MX8MP's, this will add a
> > compatible "fsl,imx95-usb-phy" for i.MX95. Also change reg maxItems
> > to 2 since i.MX95 needs another regmap to control Type-C Assist (TCA)
> > block. Since i.MX95 usb phy is able to switch SS lanes, this will also
> > add orientation-switch and port property to the file.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  .../bindings/phy/fsl,imx8mq-usb-phy.yaml      | 40 +++++++++++++++++--
> >  1 file changed, 36 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > index dc3a3f709fea..b0a614a9556d 100644
> > --- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > @@ -11,12 +11,17 @@ maintainers:
> >  
> >  properties:
> >    compatible:
> > -    enum:
> > -      - fsl,imx8mq-usb-phy
> > -      - fsl,imx8mp-usb-phy
> > +    oneOf:
> > +      - enum:
> > +          - fsl,imx8mq-usb-phy
> > +          - fsl,imx8mp-usb-phy
> > +      - items:
> > +          - const: fsl,imx95-usb-phy
> > +          - const: fsl,imx8mp-usb-phy
> >  
> >    reg:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> >  
> >    "#phy-cells":
> >      const: 0
> > @@ -28,6 +33,17 @@ properties:
> >      items:
> >        - const: phy
> >  
> > +  orientation-switch:
> > +    description:
> > +      Flag the PHY as possible handler of USB Type-C orientation switching
> 
> No need to duplicate definitions of properties.

I replace it with "orientation-switch: true".

> 
> > +    type: boolean
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description:
> > +      A port node to link the PHY to a TypeC controller for the purpose of
> > +      handling orientation switching.
> 
> Same here. You probably miss reference to usb-switch.

How about port? Should I replace it with "port: true" or

"port:"
"  $ref: /schemas/usb/usb-switch.yaml#/properties/port"

Thanks,
Xu Yang

> 
> > +
> >    power-domains:
> >      maxItems: 1
> >  
> > @@ -89,6 +105,22 @@ required:
> >    - clocks
> >    - clock-names
> >  
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx95-usb-phy
> > +    then:
> > +      properties:
> > +        reg:
> > +          minItems: 2
> 
> list and describe the items here, instead.
> 
> 
> Krzysztof
> 

