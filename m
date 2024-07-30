Return-Path: <linux-usb+bounces-12636-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3976941071
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 13:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3BF4285012
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 11:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969C519DF78;
	Tue, 30 Jul 2024 11:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="doswjICO"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2079.outbound.protection.outlook.com [40.107.104.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FA618C336;
	Tue, 30 Jul 2024 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722338742; cv=fail; b=IIgDfsNUP2noAdw7GH6j1LYHHVz+OkZ9dZbHX0O50GZsZdVyRNTBmQSs9y5ekHWYIsAWJ+mpExA+m0PAfdG+TU64ebk13rQ0vOV7ULI64G9tXUA+txVzSeOMkRK4v6A+I7210cITOFv372WUR/WT8ug3FpIJ4b6CfmK1wew44sU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722338742; c=relaxed/simple;
	bh=oKUivYmYosnkr59067Xo3SYhsDAQeg18GPhaFs6dlL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pHMIS+Kz8uinarO28K9W9/b7+6hyKNjF4jismKswLtP524nVxuLW+U4N4xo6ZfdOTgnSvCkhKS0rme4AmisHnlwef+XJAzRt3jnqEZextIwymAe07S15ac1dx5e+8aFs81phfomQx/X+3lyz0RQEATrDYc/5z+N6J8q2wXe1oEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=doswjICO; arc=fail smtp.client-ip=40.107.104.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBQfrUdxIqUcNHKq8Ja5MH5Iyj4yjysOL4RHNj8yWR5AXAP+Mu6G9g0AY2veBbQlwDSGetC6n70zLqlGWLU7G7AsE8YtFPGcgMSPB+SkjAvfQSVUXk7zKvhEs94syc+qdRlMulcZy5QhKDqD/tFPVpfdEqJ4K7koO+Bsy6MNqYUa4ZBms6axrtiwbQmn7fQqpehYDznM9t6AzJFvTEjDeUiLv/2ZAqKcwIvlvcAhL+yHu/vDOkyyMTBUKxgx0wgssPxvzh305HavjmAaPcwCOaQQFsXZeTD6E4halJkwnGFNKDew7tCqXNZyfaSHI7KQLpjObEZU84C/WJjaSbWfQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kV0gHTrkJiQbxN5VNbKoH5cR6sohTHfba51bqpKB/kk=;
 b=FV8GHibEQJ6outHJ9ZptYWE/YYXLpblaFLhIGhb/d+rhtlDKk66maaNmazcrNCJq/hm3VoEB9vF55JJACi/HxfxOqmbxOM+J4JNq/A+uajH/4o6CE2CvNYkAsps3+4Ewo1PrWts/6C1NVKN0wr2FnhoC8TVXqOqHmpYG+9Y+/qrohSwmyxYVISjWnvN+fXxXtGfWpoHZ1bid7xfWZA8PCKBPTWl3sDoZw4dvw3yJTtwZNrmMrfC2kvML7mrqIz2fKvbQZgLTO1wBIC5jnBAFGJ2ONbGMHU0qAaz5m+9tHnLqL1mVixWuYgos7xAt3bPqb7ql9NIHKWXnSkei+dnueQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kV0gHTrkJiQbxN5VNbKoH5cR6sohTHfba51bqpKB/kk=;
 b=doswjICOKtI8xTYPB2YPMmfFmYzu9USq00WPcGOth8zpJPonDXiLEdboexGPgFni652eey/wQlviW+RQhIsqyaVe4f4qZccdFwSY1TxK3g8V7zEPYlHFpD0z46xdWX4pj/b1rCvRthH7OhstwOtfoPPUJ0r/ZwVgI0ljKZB/OTeRaQewRyUXdi5K6vZq1KXvnEeCU+aI9aIvkoEc/37SadapofSW1b0MBXcANiy8xeqPCCXQnbMYILwV67qQiw6L7pCLZG16+ERhghQ51WKqWfDoS9DCtSqP1Ugjqc5a4e+Rsr3MUaUPTIYhzO35+lwPwE+MiJmL8l8T5hpRchO6mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB9023.eurprd04.prod.outlook.com (2603:10a6:102:212::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Tue, 30 Jul
 2024 11:25:36 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Tue, 30 Jul 2024
 11:25:36 +0000
Date: Tue, 30 Jul 2024 19:23:02 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, andersson@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com
Subject: Re: [PATCH 1/3] dt-bindings: usb: gpio-sbu-mux: Add an entry for
 PTN36043
Message-ID: <20240730112302.7l3h5blafioghmyq@hippo>
References: <20240729081039.3904797-1-xu.yang_2@nxp.com>
 <a3trxkx2fue2oahscjkc4silnfhesrws5xn7brjefjmke5emci@dn3cbb7yzmux>
 <20240730025844.b647xuoolg6zq6f5@hippo>
 <7gojzjkcpq753x2eb67osvvwfzxytqkm6sxm5qyank4qpdmdnb@mdunl7yq5wd6>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7gojzjkcpq753x2eb67osvvwfzxytqkm6sxm5qyank4qpdmdnb@mdunl7yq5wd6>
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAXPR04MB9023:EE_
X-MS-Office365-Filtering-Correlation-Id: cf6dfd59-bf15-4659-127d-08dcb08a554d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G+O0cRZINalllPASt1GMQj1tSt4Wh7qTNmzM9uJzUNdpSFuoD2hLW9yaz98l?=
 =?us-ascii?Q?x/EhUDYRv5kB+geXSjwaLL00MS6FJXsRxa5Tqp6/NgaP+WzB9WFmm/aUZFd/?=
 =?us-ascii?Q?MK8iwzVrxs1xIaZ6UZYyGrqFy9tnLx4U9ZcJ9XPLwOQE4pFCRAr8SDSF12+T?=
 =?us-ascii?Q?lsDdjQLu+49DKQ+9lP6gcXx+JE18xoczEkLInBGSw77jkiHldVrtfjisDrzt?=
 =?us-ascii?Q?MbDQr6WrHMBRUOTeCZe4Sy8mnZrafF56yXKcoPhar2/eMbYFNEhi1G2F2g/z?=
 =?us-ascii?Q?S17B7j7ThV92vw0OLxTU8WP9wk6pJQkxM5UdStNcLMM1XuGyaDgSdfOy+wCT?=
 =?us-ascii?Q?kPj7xU2G9ZB4d24aYu1Sp3NLdqttYWdmvczUMIrvzsUjOSbeGGhUG0GJURrc?=
 =?us-ascii?Q?wOKRIqd9Nl0oizNv3Iis4WPzka1WT6Vh5LiI2jg0zRiu7zk3KzS3RQUnSIhY?=
 =?us-ascii?Q?GlnuCBS640hH4djBpRkAvmQm+w+5X7xn5YHZRa5Li2ySWd+2Gjpq/Pc4jhZ+?=
 =?us-ascii?Q?nb7Wn8Emyi0f2OKyKzJF2BFRcwI2cn4KNEJpY8jcfXl0TVRDBOHqwlqbdjdI?=
 =?us-ascii?Q?jTDpO84WQlakA/7F0liyntv2VPfTs6reBWGxOO14474D8iyKO1A+Mlvoe8Ic?=
 =?us-ascii?Q?6TSXDntsT6OYTd5b53M3yoAJTWpTDGp2yUUnU62mw5hZaJjKALvoLgCtgPLF?=
 =?us-ascii?Q?n7PRnS1RvAb9nXkmw5c8EIWXNHu4Aw+fbhQWfII0Mb8rvC0EZ8kKNJvSIoLk?=
 =?us-ascii?Q?ijn9hdTUBMAln+dbbM/3ogNChHsXr4LDZ9pdDPhtzDA/npfMzJ+mQ8BJhJ9f?=
 =?us-ascii?Q?1VdXoDeQXVRMaic26y4kNyxWy3pYQM5oC3t27XNZrAhzvSnnwdgOgBGjQAMC?=
 =?us-ascii?Q?fD5IzPuaPQi2GJyoqzd4Y1Wh6bmpv7Dhhv8iqA1rCRqf2Ka3ZAUCLg/ufCBg?=
 =?us-ascii?Q?y+nv92A2aHnPBwWYK+5NU+pAPiPGUmzxfIHVNMDFt+7cJxCEhDWaJZplqizY?=
 =?us-ascii?Q?kSoTOykBZNBHGZcJYO10OiNg/G825bXfTHJwKL0zKhexw3yd1K04zhxHXB1+?=
 =?us-ascii?Q?6NYXZdzZN6C2zAYpH+GE4QubSectbluGeZF52G+CuuXNJmphxmFw57RJqOal?=
 =?us-ascii?Q?78WTTB3ZZ8UGSSuuxw3AYNlhn9H3AYI5qhYFR0bheD1seF+3UpxbdL/Em4W+?=
 =?us-ascii?Q?jkZrkjl1xicN2HMOwYp5+Lh3rus/8kL9TlCuWKqkxwifMC3Kamrc2wWQvojn?=
 =?us-ascii?Q?GtYL74hlAhCe+fcgQ4AuKmtqpY3pGm4uPwPc8GYD2lG7a0gpF8HUMRbjscxg?=
 =?us-ascii?Q?Y1XP7UelkEB3ghHbbgh6V7SgApuYiNfPAchORxjJZ+PigySpPXFnh6VsBuvr?=
 =?us-ascii?Q?0+uOLKY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y1youCS5IjfDMxO4v3N62zbWdhrZf+gccG4Zru/lUoAeAd/GwQgFdZC6tVjF?=
 =?us-ascii?Q?PF7pXhx6sXPegn6od+U/8uAYrfhxT37e1BzcJ7gd5jkCKxpZvwXRotK7gR3U?=
 =?us-ascii?Q?yVGe6cHSaKNtInyOxjdQLZEeBxp4rFxmdGpoeLLo1DvC0C8sSK/y7DSZ8xUx?=
 =?us-ascii?Q?IgqetakuogcwO8nocmLA5Yi4EywEV2oIzrCDrHHfIBAItQkHCb8ztFnI5XMs?=
 =?us-ascii?Q?wtIF78KA83t0dlnkFvDavcJlxi9nTcwMgi9SJVWj86y8kyBpXVBBBl0ZJhVb?=
 =?us-ascii?Q?XqrEPgPC+a/ZpMGtHedk6kyj3Q2BYpU4a2d0ON3Ve5p+Br3De2MVPxGz7swR?=
 =?us-ascii?Q?3sxsZc7n2KTvthimhmdk7T1F97PNLyS+ricXYVsjr4aaMdmvJr9hFD2mAmiP?=
 =?us-ascii?Q?O5hGhxFcaRFkRShnwcuOABFrOgitKTfFot122hB+q8YtyEFkLKVFonsJF3ia?=
 =?us-ascii?Q?/sU0U8DvFFssJnwzOzyrL4gkq7W4yp7eXGgM4NeBCyWvY6ouz2lduacoh5kb?=
 =?us-ascii?Q?0BcGgQQr4qq6Hc6YXVGLR5CyFYfTUFaNVIVy53Fdg7w+sY1s96a1/+VU/p0h?=
 =?us-ascii?Q?UfWZ4nHf8bBtsohdqvQwBWT8dbaXa7NbeHO/NsjJAcqLRruOr93sh5lohcup?=
 =?us-ascii?Q?fVi+wto2S5wKNn3E2ERmrSAIebuCjbHigl5ljAlbnKrO8txGk+3MwhNGhhxI?=
 =?us-ascii?Q?ton6HdyhhfF9uRaH5j20n/yttK56s6RdIytgrPceNbnNyanryhBjn9Ou1CHa?=
 =?us-ascii?Q?LaEm5Sz5f7027fAWyTSaPvAdyJc3WhlQgji3WE3ndbaE3LIOpdAeIBEOO8TS?=
 =?us-ascii?Q?yehQyDlTI0qjDv9BSIcEDM8gK5mxP+p/bo2VAIHa/FMSPDH3qmjWX1GFNGlK?=
 =?us-ascii?Q?Ib7oawaF9EfPY57rzjDdeoPmqkG6F/rj0wPBi0xFCa/uVlQS6KjvgzmTtstA?=
 =?us-ascii?Q?W2v7giCT+by3IlDw9c17wEtCdAtHC2k3XGp7FHowD/yHxVobl/X0jQ8PzsPs?=
 =?us-ascii?Q?ZdDUULZUrlX5Dq2ITj3alkUuWxXILxq2yosr63LtXskPHJk456/OG5Hsnujh?=
 =?us-ascii?Q?iENDH/T+pil27wUk9heKetpyowJvMKq/1zHjA+s5X9GCH+8FX7vl2jsFTyDo?=
 =?us-ascii?Q?Qyub+V+9spuDgC/Dn26ID4D5xxBa3SWjup+/PeVN1uA5+YQYrlAfIqM+Izhc?=
 =?us-ascii?Q?hPFy6jkkr9TzDiPyI6dkwNDDq4oufvhRXaDUetG4SZTYKqvexb8A8U4ZQ+YD?=
 =?us-ascii?Q?Iot5eh67grOnjmF2VZ3m8sx3u3d0U8SOcCRsvA3ub/RDFDh5FnuASMfOPg43?=
 =?us-ascii?Q?1UpHdm1bchKuvz3zm0odZ2TkIuK4POabLle9HQk9ghv/PyoEm+Ogx1HqSBwQ?=
 =?us-ascii?Q?hOH9XvhD2Ya/mIFiNCRIEOeqdNfbwUAovek+C5dVaQJY2IjPNjizP+3IMJFK?=
 =?us-ascii?Q?ch0w9D3g5amlp+OMn2gRhmqnfahfEzdivrdWsB5HolnKIdut/hpuDI38TCQg?=
 =?us-ascii?Q?gwwes72x3Ol+Pmth2GlO2u81iw6joRQA8NNeeYjhbbEiKwJB2SiBZPxGj3qX?=
 =?us-ascii?Q?6gzRvTrebaNvcPlbuWw/Z83KghRYeqGOPDE8pjb1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6dfd59-bf15-4659-127d-08dcb08a554d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 11:25:36.3909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PO3Tfe5ADjT6GXW9CZj3pPDo08JTFOAzuZCMgOyTbdZsUj99wj4CLIt/nilkvJeAUUdTfdDX49q1BAqYXmTpFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9023

On Tue, Jul 30, 2024 at 02:12:32PM +0300, Dmitry Baryshkov wrote:
> On Tue, Jul 30, 2024 at 10:58:44AM GMT, Xu Yang wrote:
> > On Mon, Jul 29, 2024 at 10:57:33PM +0300, Dmitry Baryshkov wrote:
> > > On Mon, Jul 29, 2024 at 04:10:37PM GMT, Xu Yang wrote:
> > > > Add a compatible entry for the NXP PTN36043 GPIO-based mux hardware
> > > > used for connecting, disconnecting and switching orientation of
> > > > the SBU lines in USB Type-C applications.
> > > 
> > > NAK, this is not correct. PTN36043 switchies SuperSpeed lines and not
> > > SBU.
> > 
> > Yes. Since this gpio mux is able to switch both sbu line and ss line,
> > I will change SBU to SuperSpeed in next version in commit message to avoid
> > confusion.
> 
> Ack. This needs new compatible and probably more schema (and driver)
> changes. I think you can't just terminate SS lanes in the mux, they
> should go to the actual SoC part (like the SS controller or PHY).

Thanks for your remainder. The SS signals already go to i.MX8MP soc (USB PHY)
on my board.

Thanks,
Xu Yang

> 
> > 
> > Thanks,
> > Xu Yang
> > 
> > > 
> > > > 
> > > > PTN36043 datasheet: https://www.nxp.com/docs/en/data-sheet/PTN36043A.pdf
> > > > 
> > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > > > index 8a5f837eff94..152849f744c1 100644
> > > > --- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > > > +++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > > > @@ -20,6 +20,7 @@ properties:
> > > >      items:
> > > >        - enum:
> > > >            - nxp,cbdtu02043
> > > > +          - nxp,ptn36043
> > > >            - onnn,fsusb43l10x
> > > >            - pericom,pi3usb102
> > > >            - ti,tmuxhs4212
> > > > -- 
> > > > 2.34.1
> > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry

