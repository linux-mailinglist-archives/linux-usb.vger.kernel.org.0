Return-Path: <linux-usb+bounces-13067-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 649A89473F1
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 05:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86F431C20C3A
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 03:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67BC13CF9E;
	Mon,  5 Aug 2024 03:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J9H+Fltg"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011049.outbound.protection.outlook.com [52.101.65.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18A263A;
	Mon,  5 Aug 2024 03:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722829064; cv=fail; b=HdVkH/nGgBL2No1faV3LJKEFOimrg1THu4zNa3s7XKuxVFMn24wdH2PlzDD5WhNC3lzPXoXmUAnSV4NEIuzAoSPylKPJxA1+QLHtkIoHQXwdBWV4adCPp7Dx3lYvYlSoS3lZhq9w1WI6SSWLxe52C2bKzLHoukfvSZAIDAkIRj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722829064; c=relaxed/simple;
	bh=jAi5w/tkhrB7xgY17EMogqqMNo77/Zx/R6ToaYbOJ20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=E1p5bfBqpwTcYgn1fXmeq8ZiB8tIBlCIeyRtZkvsAV10knfCrvx5HUojQ9vswXLdH8IYN9axz9wrNAKef3PFsd6oSZLc48M63PmlCsZuW7FZ4mj3zPu4TvIxDSb+ExMdAU8phro2eueHyfuTLB10clY6YLAOkE1ECRT2mxNbRrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J9H+Fltg; arc=fail smtp.client-ip=52.101.65.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtvA0GE1T2pJB82V3uMFk/alN7E7RNo085vZBVZChjAO2oC4uI+/3EKXBl1biZsTSywcDS88ZF+eN7w85jA3sZqmvcNZf5gZCA/WNSsesrKt6uI3LcGgbFDEsw0GVNqVX/jYiOvoSY1wcJhDlA+CfWgNWUb192o9u+PJkEiDLS+PG08TTPPCj3ezcxQmEhovKOLDGEy/ThRzhP269vE87eXNcYhYLcyOENXwEFA01k5FSLLLlBpxE5tRUCgLcoO4as6G7uYggGeiCJFRr0DfJSGdrWAXokE0B8p523wg8sPdzzDwxGdMypv6KtM5t11Sj73+ZKwb9xwugcA4AEI7Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTlx87LZb6ouEOy5TI6yNDLqHGmyWNiC4rDWmsDlpg4=;
 b=yT2k5S4+KklcDonW2KKQnmHBWN2tNys0kTR9MZ0p/xwNVEdG6ZFZUouhT+Edeoc+MzpqaK7w7KdZKbgP0ri19Yn4Jclbf5p8cFhdQS1Oes5aubhDdHrqc2GP8abQDWtx6ogLUeYwmtOHQxD6gOviz5C5ZZTCjQ/maIj0BgvMBfxoMb7569WP2IStkUje4A4RHAAh3/c+XqFPGHHMnW3UUnENIqup7fGy5pzEb9TegCLIRz5ln0q/7vOROuKpArKtZVqYqYsMUpjLWfKC9KU6iS5ZbkcTvuLsk89Eaix+cIVKZ+Ry7RbRLYlKCZAKx2VbIDPjGxP6OXVTjwsNeuyzaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTlx87LZb6ouEOy5TI6yNDLqHGmyWNiC4rDWmsDlpg4=;
 b=J9H+Fltg1giukeD3KX8GTuWPgGcDcXZTBRDvN64M6HKmGARcrEUV8GXJQtAuL4g6tisqky3aKZnUHL9cvZ8lFPrd7PaYyRyt/vr0luB0P4dFGat76WUPBUbLbW9gqlghtbWDknOM9GLunN3PEtdPh8qEOloWu/2RDay6DowKTOnRu8eCWgc/yGseUDMuENYG72dHilt/kBRewVBh3e/4bxe/tqERXYCd7aVBud3J4In9JlVDXTrZtasYvB5kIc9zBpmxA7Dyyn9FzidjIOUp5EaDDpdHYPdoxx5Yme66IxaVbHDimIkqoafrwWNoRNaglkENi/Ce+MGq1LNWwlq2kA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 03:37:37 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7828.024; Mon, 5 Aug 2024
 03:37:37 +0000
Date: Mon, 5 Aug 2024 11:36:58 +0800
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
Message-ID: <20240805033658.s36ouzjienvf72p2@hippo>
References: <20240802091702.2057294-1-xu.yang_2@nxp.com>
 <21557eac-44f0-451d-a194-c5d545cacbee@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21557eac-44f0-451d-a194-c5d545cacbee@kernel.org>
X-ClientProxiedBy: SG2P153CA0032.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::19)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA4PR04MB9224:EE_
X-MS-Office365-Filtering-Correlation-Id: 26adceca-2242-44cc-2c13-08dcb4fff368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nn1iR9azFpZViUhV+87KcRWlfo5ijjJg1rEZ2LAQ0yOtblfUrsdzqRPYIUsY?=
 =?us-ascii?Q?nqovf2/PLVOqjPzU8mE5RZ6W8pQL5BWI68wEoEyxNTzlISCzBbv+NQlW3shB?=
 =?us-ascii?Q?P0XNS9+8VzVB+1xFxoRmSU0fwRRurfmyLRh05xnT0RwevYFuAWWtng3Zm5au?=
 =?us-ascii?Q?RvoDDn3pMdS5OYRSgkaSnlCo6lH7EXSNYmzWyoqhiFVovtUdz0or8g2JDPjf?=
 =?us-ascii?Q?zXePAiDdfR7aFL7KmrhatFOhOqz2UED6je5YlpjCxsCZPt4WS2JHz74rWWGv?=
 =?us-ascii?Q?qzqIqPhi1johsEFPjTxbni4np+ma9xarfwjEXAQ9pgDqfxMPs6hLtZBlyoC5?=
 =?us-ascii?Q?IRtsJxSbYPeuGWezBKnevcVR6LAhKi9QOFwuv/EEay7vwf2AvcclYrdsVXh6?=
 =?us-ascii?Q?O4yn8TuRYhm3db+T0g0lIUfH75Sc9hjZzaVDidEJWWK+ywoLn4yu5ZtS6tuY?=
 =?us-ascii?Q?uNH9hFkPcn9bDHP1A8W4ylX7+7g9vnb5U1z0xjrRKj6fOQG5KeynBtVkKEc5?=
 =?us-ascii?Q?P4fqE15fLZqb4pGL/nm/4dcG/F3BGh7HwFdf3MkkYk+6t9gsv9jyO36LmEae?=
 =?us-ascii?Q?C9V49Fdn0fsvsa8AW7Ge4X3A20zF5pa6Z0oCbaATipmPWmiORqhQ17t6Dlc2?=
 =?us-ascii?Q?9MgjzlvNICym4YJLxvV0RzOSpLG0VOSuVLPGeH7XGSyp2+1EQomoJbOelZrq?=
 =?us-ascii?Q?FIDtcTA8GlPwXUh73o8wuv7PJE8RWC8+YDU1Mg+SXjIU+tG/Ugx5tLclFtk5?=
 =?us-ascii?Q?IwJIS9PV7gh5oGmN09Nwi4Ju7Y1mjdUqXIzJIzeUcIxOTwW06Xiw5Or4Vz1l?=
 =?us-ascii?Q?MipJ+xe0CQReLUpEEKqc1yB0iD8EhXwC08KOwe0S48FIBECBE5YpI6Zq5pUH?=
 =?us-ascii?Q?xpl498s7fk5HbW+OGHhHn0+CrNYq6Fob5GffpbZqO5lqWQ28juJTJimvoMCU?=
 =?us-ascii?Q?5fs1xVAD/Efs5sWBmUjveaSjLPFFLOYvUYCqxf0i2jhs3uQPKlTv/tsCLO+Y?=
 =?us-ascii?Q?Y5zIxzWnLffT5FY0ZLm7Re0VHeJvJ8hvYGh0lJsI7+MOaUYM7k8TiKbJellc?=
 =?us-ascii?Q?6y9OaEjg69D/HbMm+BBy0mYyqmZT6VeQyi4lsbcuMR+RaenrdHcd4Se9nIPu?=
 =?us-ascii?Q?wDtatqxEz/kAs7z5pyS/MCrcM1xacuLNC/K0TMSYk0WG7LrTkIScrVAjzscY?=
 =?us-ascii?Q?R8JqfUENN91gv4CufSIj4Y2FgqzsnWIM3xRz1xeJTzRYiqHyIgh0X5XuNGDe?=
 =?us-ascii?Q?HYOfvlSLb7RMhvm0BqzXdzudq2Vj9ENAF3zcHB49bFLEpEecsN1U7sy6v9go?=
 =?us-ascii?Q?Bes8Zx3jWCPgU5R9lUnA9UKX6eQEziy8Toj5Zbp+HmsGGzKgDaXMPtnJNlhB?=
 =?us-ascii?Q?TBOir/fhHtIPvQcZTr140Oz9Qp60OIjxhrlbQOuQMhrbTosN+Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9vzMSMd4VVWUoEzKNH8UNEnYtT7ug/KjFTvy66mOwQvp7cawvSvY6f8DZf3s?=
 =?us-ascii?Q?/zmcxn+L4sDp97h2x4fMnD4a1MtIzLzAVtwsD3U0MXw2UyCsc/cHJ+rr824G?=
 =?us-ascii?Q?5IuBRfhPUnOwykkH0gFe15AM4gfkxqnLg0LpQIOjI/7mMCEywELDyaGkpFkX?=
 =?us-ascii?Q?NE9OaqzDg8Pj0R6R0gIEgCFU2xlllKME3MyeLybaDd0ZpI3IBIOpsD5i/G69?=
 =?us-ascii?Q?/afvlMsjHiq58Vsokv2BP01IiibtAAJR32UXqsuov0u2BtuITdDlukl9zOdF?=
 =?us-ascii?Q?ppes6IujEjILf8K4HV4IS6qOXHzR1H9N/HaK8JyfNndw8KyTMA7+sPt0BZhq?=
 =?us-ascii?Q?ngF2XrqaJvbVX2xdZjlvPya2BNB+4ZbHb3lVQFV8jgon3wWMPt3f1Mqsleyi?=
 =?us-ascii?Q?2H6iOMOUmRww8f1XovQF8ofGyb5wWTv5dJ3s251cOJrTbFKUboz+sd3PZiJQ?=
 =?us-ascii?Q?CjPQi9lpq/eiBzLvZiYClgxYVLm+7ihjOFhvgCPCLUwp0Be78x4IamLhj5W0?=
 =?us-ascii?Q?V4KdV+6JF2hpiF3lsp9WVAWa/b+7lgt652SmJLab4RUhxuRYvxNxyXcGQRzF?=
 =?us-ascii?Q?gpCv/9bxVM/AXdUzQdFlO6WmREN4CKI0sRwX2UMZK9oanJUab5HidBEACDbF?=
 =?us-ascii?Q?XPROA0AR1hvoOpjWB4GVOfGTf1cnX62POkFmOkal3jKGLC7rCYVSP4y2VJDa?=
 =?us-ascii?Q?DXj6ikmKmtHLjERi1WBPC6KwL020l6mmuseczrgdzplpHHxC5ixADt2hgasQ?=
 =?us-ascii?Q?HnyHEE8w/rYn/02jVm6qxkcjrDrw+NTAuJLYVR5FJmQgiS4IQJzeKShT3uO3?=
 =?us-ascii?Q?9zQVjxdqYbpRVKK0HK5ZCaX6d4ALWzigtkuXuosapo3w0y9T5TuVAx25vmQr?=
 =?us-ascii?Q?kSpdbHc+SVwr6PhwjAnrs0y44tqgS5yodK5ZErEIq2U1B/Sxt72812y1gu1U?=
 =?us-ascii?Q?0mLa957yHtTzxLvf5uCy9RNMsN3x5qwVS4WW4kakL5DwHRTpNbSKMKvQSQLa?=
 =?us-ascii?Q?BHggHnf6bXl19bZus55XjSo8oajuTJQukLwSkEduK1ACXi9uLCaPnsnsUsCA?=
 =?us-ascii?Q?rNDgRl5puvkivoVYvkgrllzs8WDr/WCCHOh7P/MyCxrs7siW7/wtZQcV9Kzm?=
 =?us-ascii?Q?xj2e0GC3Xt067Pxd2b8Xbek24hYPWEL4q5lvLMfqhhxmzFQrMFbxyf8jTr3X?=
 =?us-ascii?Q?+3WMdE/UHpi0WO685x1ljngX9lQE2tkCMfdwI/7Hf+9cZQHLh8bTaaqNA3cY?=
 =?us-ascii?Q?W74dTcFlHFRq6XJMw7LSUixvd+iRaRNaG408wszM/nbPb9KxvrOT3HCLdpnR?=
 =?us-ascii?Q?IYxy7wK2gzOptAy3wwPQPvRj3XTKSftiKVRVD5WJqeN/12tRc7Zqw4i06yTH?=
 =?us-ascii?Q?v8vHHxbXzszC8lc7eR7yaLgdW4cD1pYGl5PNIRdgdQ248hSc3jM12EwGjCxO?=
 =?us-ascii?Q?7yqq6LA1Q5AEVyu74HWzPxgMzuBeNbfv9vdujLG6mo6Xge2KiIttFPRKi/y9?=
 =?us-ascii?Q?5G+IMP0FBRJDM0qvSw7JppZe/UeJFcMBYkglHaIG0Gr3a4DU7skscCW9ashh?=
 =?us-ascii?Q?P30zA2zVp7NcwiaPSBw8/iOUKHLFw8/qM49F5oRu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26adceca-2242-44cc-2c13-08dcb4fff368
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 03:37:37.4554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9aZAGQTCU3eN2QE5f/iMp9wDntRS8E/CTWUOdft9IhDjH2iCiIYtL73GslEbW8Mvn8z1bVOIfZJdtLlZ2nGHUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9224

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

Okay. I need to use usb-switch.

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

Okay.

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

Okay.

Thanks,
Xu Yang

> 
> 
> Krzysztof
> 

