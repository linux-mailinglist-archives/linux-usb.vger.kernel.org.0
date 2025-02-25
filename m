Return-Path: <linux-usb+bounces-20992-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA2EA432E5
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 03:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACFBD189E2F1
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 02:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C134C6AA7;
	Tue, 25 Feb 2025 02:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bxRLD1Nu"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011030.outbound.protection.outlook.com [52.101.65.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95461C27;
	Tue, 25 Feb 2025 02:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740449784; cv=fail; b=ugCwXn7ozdgp5XvZ44sA4W8mFZ1edryOPxSdaPo07JddJ3uhFrgYCBphla0IZCFjKY8e7sPWTT2gJuHD4eK+83aokHKGOjqbLRrK7kmPnXJw4LNIeWH6MRO7sI8O4KTxZq/oc7luH4CMQeANljaVvWNWs6LNTajHjHtWybJ4jTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740449784; c=relaxed/simple;
	bh=RU45pBCvXcCZQyJlMJmBl/3Or/bqNf6QHXt7p0A3WDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fVYMHZCyHIyaTfZcqb7IbI/gPeR1rbfCHD4LQD399730LKqszeej40PhveUcRs9KpIUKWKvTvOo1ip4qtk7SN34Ly02WTdfZXTQzjlrBFQ52L9LCr2FkooOPUnSoB59ar7rwFZLsbDwvD9VRd7v1sxmcFsqhZLEsnKjvVSfGDG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bxRLD1Nu; arc=fail smtp.client-ip=52.101.65.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdSfWz1IIbpOPeTawiCfOz1xNwAjkMuR5qMXtQ4OAfJcCd1bsyrLP5K4bKDVe+b7NICafYcifhItZBsoP6nJwhhOKP/9q1o0GjeNkveQboVZjQ+b6qG+OAZxtjsPh5Nl4BaehmO3X2DMsAMA2mduqeNrqrYDgxL9I7+Q1CvJzs4r8ypOHGH45sx8EzMWLLcoseTpGV0ySofJkQu/1RkgxE9rbrRN8eKOzjMHLwW8JxIOb+ePp5I/RsNENoeRim7V6+J4rBQxvi+6Gdx/EAkuqy6UKFbPpzkljCVcigUcqeqAOMmKebEOj7o7kT8xTRXEGsVkTWO7e9zz3YPSwmD4BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTX+r5mv5sBKWZpVufQNhNSmTowtdICzVcb316drOj8=;
 b=b6Y6jKmSpW6AZngALTDAuXKhLV3qgTBw5pRKoI3PWAKBGeDfn0Pykov6PC1l61pMb+kl9abPy4giUVtf1miG2v7Hey8+fX7PFNZc6Dw0hYpMxqMOUqw1TtgWh62SuU3MnVrv9jNWs9edB9kYwV1VdchOg7ROLP3UC9kwRsjkBNECeqMxNPfZkThAamFupkr5W/eT1Mb1Yy49mC2FUg5gTiHvajvYC5mY2AFT8WXDmXBFbtdKhnlEWmFFnDSpr+jU6uxNO9OiGRF2hDehLKqeUMpVbtuMKgDAa0lBb/CsyZbEl5WcnKBWBzM3q5u6HMejcnPWP8jlIgF8XDx8cn6KQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTX+r5mv5sBKWZpVufQNhNSmTowtdICzVcb316drOj8=;
 b=bxRLD1NuEutOXuf04fNcr20HOZFkdHJGhgjzDO+rbni5maLU7ydOZQ7tz3bxDpDL+qBUR2OpyMfahu8hGnd4tfMEqOSiBRcGpp0yoefj0R4zvO2B26bFOCVZQJIdwzp8piIXOvKRzCzxxS9kPDrVzKnCfpp5DiuA1eIob5coBiwUifrvYFveWwu1aaDyJyl1CM7kVqnOH+Oy8FQm/1ZRzSE9hneC/7zUgBtMlSchCq0AQ75NuXkBkQPrQoZWnxo3jrPFb2bFIx4zpOHK0aZ6NKYywf9F10N0wV1vTm8qBm2T8qffUCHVs4yCGk0eCxrrdkq5Ywe62OWThRFDa0fEkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB11071.eurprd04.prod.outlook.com (2603:10a6:800:262::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 02:16:18 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 02:16:18 +0000
Date: Tue, 25 Feb 2025 10:12:54 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 3/6] usb: chipidea: imx: add wakeup interrupt handling
Message-ID: <20250225021254.f4el33a2sh5gsmir@hippo>
References: <20250219093104.2589449-1-xu.yang_2@nxp.com>
 <20250219093104.2589449-4-xu.yang_2@nxp.com>
 <Z7Y+gqu75xJyjy6n@lizhi-Precision-Tower-5810>
 <20250221032348.sncjhnldj6ecgeou@hippo>
 <Z7iabsMl4ilQqrXN@lizhi-Precision-Tower-5810>
 <20250224110751.7666zcafbyakvfb2@hippo>
 <Z7yXGgrX6FVQjy2M@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7yXGgrX6FVQjy2M@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: AM0PR03CA0023.eurprd03.prod.outlook.com
 (2603:10a6:208:14::36) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB11071:EE_
X-MS-Office365-Filtering-Correlation-Id: 314c8d48-9ed2-49d1-c98d-08dd5542631a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BUMErnojFubxlt472rBR8qQYMs//JCI0s9YB+FTA5OR49lbxq3zdTZE847Re?=
 =?us-ascii?Q?Gtf6z7gXIOKxZuWKjn8AXTbOr0mg+DG7bFNytGoGfeoM9bUNAgxKphMIZze2?=
 =?us-ascii?Q?xTaooCtIwQzJUqMRr+ROYLkCJW92jm2r+uC9dSrqd4szeQvsRuMdbXjrS18p?=
 =?us-ascii?Q?nqkJwxh2WcC81VrP0XZqBUngZZNIJ1aJ/SL5xKXUtB0vOF9gsHG/asBSgb2T?=
 =?us-ascii?Q?DKEE8CRHRwUlXv5WSOijJ+62RiPPHGnqqQ6P2I5zhyKK/jPJCZnFbJAjhRPn?=
 =?us-ascii?Q?DSMyCejn9zVXNxYKHi02Z4xa4kl7wXpW+MdRlL2OlfRO4r+rTJ7Y7Mj9rct0?=
 =?us-ascii?Q?5OO+7an8m8ufAYrQQydqHdBBx4Lx4JrRkDHYeu9rvheiiuBVLU6XO9TcXKrN?=
 =?us-ascii?Q?Q+kUhu8eZ6IOYHH1AyTioAZEMwUBFw3O1HOXJsLZGY5mXv02WPyNFX8DvFQ9?=
 =?us-ascii?Q?srSCQyl4xBqwkB9t91h8D5aCPxibkA9FVyRrAIxL6EP5KH/ktAczBn7vLRVH?=
 =?us-ascii?Q?eeT0x8yTZ4Let2m3dkngMoilfGjwYnS5uIj7Hzo7MgPU3BIsCL97TBvZzeUq?=
 =?us-ascii?Q?kYqDsSQRGxycVv3oW7W2ndz6i51Ab8u2hBnIK5/xPwwohyis6C7tJRsbLLW4?=
 =?us-ascii?Q?sQz2uzciOM4uTEcGEPmTx62Q1sd+X1xN1smld1+MA2UFiHjSo9TEAcr4eZo8?=
 =?us-ascii?Q?WCnKeM5NN0eWCrVfpUiQI0Q67k9WqublM4th5UKQCa0UVr1y/yoiRJGTs4l1?=
 =?us-ascii?Q?zL8peZL4EvD4wzo1S6QZlGlHRCcvyRHh9jvRDCGSKPXX5LIs3fZDLWbYZco+?=
 =?us-ascii?Q?qSvnvlShN/nHiFRGV32ieAZDlBBe4ncWp27321m07RwN/6Upw5If0bAzAJtw?=
 =?us-ascii?Q?96sIYiICnYBt08xKABOez+aF6Mjkaxd0z/QF5l2W/P9w+Uy0GHhgJ5Op0s9C?=
 =?us-ascii?Q?rgeZ9xT7AK4QeAxvedfDVFo7ZmpzkNYoN8Ls/deCOr5lAhhgYxGuuqhm4ISZ?=
 =?us-ascii?Q?XkLADe0y2t9JMl3WYTEDX73/KAAYH18I5V6F2EsM2IsiI4T0YUFjNgmpIHIY?=
 =?us-ascii?Q?2WCNZBqy4NSMm1e8IBPQ5i+EU/gC2lgnFsMlkKPU5leWEYixSUOO/xkpeWWO?=
 =?us-ascii?Q?V7vrMpWfhePSUClJWGOMT+ap4VBXDpdI5bMUT/oqS06YZG3X50X4JXwkxNvk?=
 =?us-ascii?Q?1Vs98hkRXj+hVq40sQi/Q1Zm0k+oYR+8AKv+fouc/qa8XTD2wsZ59q/V0iwy?=
 =?us-ascii?Q?T5kfsxLGkmo5WOn7OndWjHA4QFYKm5TAAH2hz42y4Eal5NxgUEUVtuGDQYWv?=
 =?us-ascii?Q?+8Urdl9yUwXa6qWfO+CMgCyiKRIUWjl8TRGhKleidUKXqD/XbirauqN6fj3Q?=
 =?us-ascii?Q?iG+5YEN8mc4bH+4LoFZRBaYrRBx3FcMZrkp8EgO2yaIubz1wSJogMQ4p+HhE?=
 =?us-ascii?Q?XeSZLcdLj7emJVQJ5pkFIPCoSf6ujpBK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wlhYrUnvSno6hLpw1hrpFpFRN2YqrdemLh04sCiCWRqvZCZ/9RjlcZo/Dn82?=
 =?us-ascii?Q?bIu6wiDv8Z9JM8U5CzpXJxG8b1MMdvUJ1ZuJO/0pzCPRPLCQVT5tVAgXj4ze?=
 =?us-ascii?Q?Pl7ruGb4akIKth6BJnA2SXdCijHrfv9DpI9gEUgyEBsyncMJnUaBEGCyUDeT?=
 =?us-ascii?Q?0f1TTQfpBR+B4AnqV6VdRnxxUGve4wyrb+8UsasmT39+2QoHEOx9MuImSmwv?=
 =?us-ascii?Q?/RrexJLYx1MmGWxfN6fk1GujvYTRjQW9keZx0iN6/Jdhfz2YR1TOVxQX/4/1?=
 =?us-ascii?Q?bgcT14A+B5S9SB4uJs9u/8R/kD55NFxQ+FGQnwlwHdflGlbsNBxREJPWsn/K?=
 =?us-ascii?Q?lDhdpz/XeNZ3XzQcoIM/czcCrumJD7UheU6KAahOaG0etuTZVOa9oq1YJ6Gm?=
 =?us-ascii?Q?IuHG7QZ8E0LGLmR22aZHxz8A4UFw6S+eA5yXpy35ekt66qz1SZ+L/qqu48VS?=
 =?us-ascii?Q?NkFSEG1qUdvkx6Ys/lMx9HwFO4A/ve/wZKeAMKG/nGCXcMjCLOpo0gYCDFVE?=
 =?us-ascii?Q?kkA9z7GE/9QAjnpB+TIlJjrJyXnxESfFKoSdLOWzd72FEx2SZ/QmSfhitlX+?=
 =?us-ascii?Q?wq3Np0CEwslZevyLXinVW4gkihGVCV9i8RNT09mXzmsa1/8THKXEOHrnbyYx?=
 =?us-ascii?Q?DcOgZYx1IXams9mGTrYlvEM+lypQBPRMFe0/5BgtNt1QvowrAFQaZrV8zlOG?=
 =?us-ascii?Q?xTKeBscP/qJvpSZfMTVIJ3e3ejTATrmq2oLXJ3eEFHnN/5yW2kPIPVt6Rq0V?=
 =?us-ascii?Q?JtQ5GQrJyaLD4R2EagM4Izjm/bU7RDS3mpypprizRinQ7bB2r0WF4nvjKzeY?=
 =?us-ascii?Q?v8CBod8xCp8dWK74lbSRyCoBmZS1d2proOmPv8YYOC2PtR+EVgCac/+PO9ke?=
 =?us-ascii?Q?Vh/JMC1E49wLtPtHU7GU7rXnWoLmqov/yIZhT0+Ep9SL5Sv+kmEAinPky+z3?=
 =?us-ascii?Q?0i3XFQz6hQ9NQqHTSPpyA92+/sj1KdSYTzFba+JDt20q1JYUAL8tyW+MTPDO?=
 =?us-ascii?Q?9ajH5z/dxvJeZSlI2Q3xax7byP4kp5IC+9gDhyeXvgeq+d4n1YbXVH8m7ZL+?=
 =?us-ascii?Q?Agvg3/gB+13bkVyzEU5pVzLTjBuTzBCQNM5w5cgWn9ymPSVHyk4xX0rVsvKy?=
 =?us-ascii?Q?yXwtP3B4YkT+6Ix6xZPlsAQnUA3XdqnovxQXrlpBHBlf97I+z+rrR3CaF1v0?=
 =?us-ascii?Q?K537htoWi27YzWvLhQe8BcxfC56rlRrjFKSrw2KhDL8HZe9pZIWtLLBSMmZ7?=
 =?us-ascii?Q?ACmjyRTQJo7EwxXlW3iOA3CkxjFfrL0dyJ4pruDkyj/jElCkJqTAy4gmp81/?=
 =?us-ascii?Q?KeT1lmdjZ4MdYdGK7UjBdT24gkbduzbyZvzWImc4yapuRKHT9R7wFEHCfyVd?=
 =?us-ascii?Q?soKC0hzz1awobDgwTCAF+rI4gzl2jA85bdcWTRvRAVwEj3Q1mtkrlOnBnD3z?=
 =?us-ascii?Q?7aughGAV04cxbFVRRl67YULWw7PRvGluhaqic0lZ1pC+HqNiW8Ytl64mVQd1?=
 =?us-ascii?Q?n2G9gfSQSFStXWkauiild+qzGA2oRU2yHOHZJhlv/J6QjD+0toYF1vKXQMgP?=
 =?us-ascii?Q?DXUnSmZO/WtyG4h8RSWCry3/53b1u+RUD89mlM3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314c8d48-9ed2-49d1-c98d-08dd5542631a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 02:16:18.0205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7uRj1rEDOHqYXBZWPVq2heN0li3uO1KPdMuYDz5kPVLeb0YSu39qg6+WNhJemMxB5rwBlL/nLgreWO1XSRinuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11071

On Mon, Feb 24, 2025 at 10:58:18AM -0500, Frank Li wrote:
> On Mon, Feb 24, 2025 at 07:07:51PM +0800, Xu Yang wrote:
> > On Fri, Feb 21, 2025 at 10:23:26AM -0500, Frank Li wrote:
> > > On Fri, Feb 21, 2025 at 11:23:48AM +0800, Xu Yang wrote:
> > > > On Wed, Feb 19, 2025 at 03:26:42PM -0500, Frank Li wrote:
> > > > > On Wed, Feb 19, 2025 at 05:31:01PM +0800, Xu Yang wrote:
> > > > > > In previous imx platform, normal USB controller interrupt and wakeup
> > > > > > interrupt are bound to one irq line. However, it changes on latest
> > > > > > i.MX95 platform since it has a dedicated irq line for wakeup interrupt.
> > > > > > This will add wakup interrupt handling for i.MX95 to support various
> > > > > > wakeup events.
> > > > > >
> > > > > > Reviewed-by: Jun Li <jun.li@nxp.com>
> > > > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > > > ---
> > > > > >  drivers/usb/chipidea/ci_hdrc_imx.c | 42 ++++++++++++++++++++++++++++++
> > > > > >  1 file changed, 42 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> > > > > > index 1a7fc638213e..5779568ebcf6 100644
> > > > > > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > > > > > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > > > > > @@ -98,9 +98,12 @@ struct ci_hdrc_imx_data {
> > > > > >  	struct clk *clk;
> > > > > >  	struct clk *clk_wakeup;
> > > > > >  	struct imx_usbmisc_data *usbmisc_data;
> > > > > > +	/* wakeup interrupt*/
> > > > > > +	int irq;
> > > > >
> > > > > use "wakeup_irq" to avoid confuse with normal controller irq?
> > > >
> > > > It doesn't matter. It can't be confused since the driver is different. The
> > > > controller driver is core.c. This glue driver is ci_hdrc_imx.c.
> > > >
> > > > >
> > > > > >  	bool supports_runtime_pm;
> > > > > >  	bool override_phy_control;
> > > > > >  	bool in_lpm;
> > > > > > +	bool wakeup_pending;
> > > > > >  	struct pinctrl *pinctrl;
> > > > > >  	struct pinctrl_state *pinctrl_hsic_active;
> > > > > >  	struct regulator *hsic_pad_regulator;
> > > > > > @@ -336,6 +339,24 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
> > > > > >  	return ret;
> > > > > >  }
> > > > > >
> > > > > > +static irqreturn_t ci_wakeup_irq_handler(int irq, void *data)
> > > > > > +{
> > > > > > +	struct ci_hdrc_imx_data *imx_data = data;
> > > > > > +
> > > > > > +	if (imx_data->in_lpm) {
> > > > > > +		if (imx_data->wakeup_pending)
> > > > > > +			return IRQ_HANDLED;
> > > > > > +
> > > > > > +		disable_irq_nosync(irq);
> > > > > > +		imx_data->wakeup_pending = true;
> > > > > > +		pm_runtime_resume(&imx_data->ci_pdev->dev);
> > > > >
> > > > > Not sure why need pm_runtime_resume here? There are not access register
> > > > > here.
> > > >
> > > > It's needed for runtime resume case.
> > > > When wakeup event happens, wakeup irq will be triggered. To let controller
> > > > resume back, we need enable USB controller clock to trigger controller
> > > > irq. So we call pm_runtime_resume() to resume controller's parent back
> > > > and the parent device will enable clocks.
> > >
> > > Please add comment here. why need in_lpm if we can make sure irq only
> > > enable during suspend/resume pharse?
> >
> > I have checked again, in_lpm checking is not needed. I will remove the
> > if condition later.
> >
> > >
> > > >
> > > > >
> > > > > > +
> > > > > > +		return IRQ_HANDLED;
> > > > > > +	}
> > > > > > +
> > > > > > +	return IRQ_NONE;
> > > > > > +}
> > > > > > +
> > > > > >  static int ci_hdrc_imx_probe(struct platform_device *pdev)
> > > > > >  {
> > > > > >  	struct ci_hdrc_imx_data *data;
> > > > > > @@ -476,6 +497,15 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
> > > > > >  	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
> > > > > >  		data->supports_runtime_pm = true;
> > > > > >
> > > > > > +	data->irq = platform_get_irq_optional(pdev, 1);
> > > > > > +	if (data->irq > 0) {
> > > > > > +		ret = devm_request_threaded_irq(dev, data->irq,
> > > > > > +				NULL, ci_wakeup_irq_handler,
> > > > > > +				IRQF_ONESHOT, pdata.name, data);
> > > > > > +		if (ret)
> > > > > > +			goto err_clk;
> > > > > > +	}
> > > > > > +
> > > > > >  	ret = imx_usbmisc_init(data->usbmisc_data);
> > > > > >  	if (ret) {
> > > > > >  		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
> > > > > > @@ -621,6 +651,11 @@ static int imx_controller_resume(struct device *dev,
> > > > > >  		goto clk_disable;
> > > > > >  	}
> > > > > >
> > > > > > +	if (data->wakeup_pending) {
> > > > > > +		data->wakeup_pending = false;
> > > > > > +		enable_irq(data->irq);
> > > > > > +	}
> > > > > > +
> > > > > >  	return 0;
> > > > > >
> > > > > >  clk_disable:
> > > > > > @@ -643,6 +678,10 @@ static int ci_hdrc_imx_suspend(struct device *dev)
> > > > > >  		return ret;
> > > > > >
> > > > > >  	pinctrl_pm_select_sleep_state(dev);
> > > > > > +
> > > > > > +	if (device_may_wakeup(dev))
> > > > > > +		enable_irq_wake(data->irq);
> > > > > > +
> > > > > >  	return ret;
> > > > > >  }
> > > > > >
> > > > > > @@ -651,6 +690,9 @@ static int ci_hdrc_imx_resume(struct device *dev)
> > > > > >  	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
> > > > > >  	int ret;
> > > > > >
> > > > > > +	if (device_may_wakeup(dev))
> > > > > > +		disable_irq_wake(data->irq);
> > > > > > +
> > > > >
> > > > > Look like only want enable wakeup irq between suspend and resume. There are
> > > > > some questions to understand hehavor.
> > > > >
> > > > > 1 driver probe --> 2. hdrc suspend -->3 hdrc resume --> 4 controller resume
> > > > >
> > > > > 1--2,  look like wakeup irq is enabled. maybe controller have some bit to
> > > > > disable issue wakeup irq, otherwise flood irq will happen because you check
> > > > > lpm in irq handler.
> > > >
> > > > It's not true.
> > > >
> > > > We has a bit WAKE_ENABLE to enable/disable wakeup irq. This bit will only be
> > > > enabled when do suspend() and disabled when do resume(). So before suspend()
> > > > called, the wakeup irq can't be triggered. No flood irq too.
> > > >
> > > > >
> > > > > after 2. wakeup irq enable,  if wakeup irq happen, system resume.
> > > > > ci_hdrc_imx_resume() only clear a flags, not any sync problem.
> > > > >
> > > > > But sequence imx_controller_resume() and ci_wakeup_irq_handler() may not
> > > > > guaranteed.
> > > > >
> > > > > If ci_wakeup_irq_handler() call first, ci_wakeup_irq_handler() disable
> > > > > itself. imx_controller_resume() will enable wakeup irq, which will be same
> > > > > state 1--2. but if imx_controller_resume() run firstly,
> > > >
> > > > It's not true too. Because WAKE_ENABLE is disabled after resume().
> > > >
> > > > > ci_wakeup_irq_handler() will disable wakeup irq, which difference state
> > > > > with 1--2.
> > > > >
> > > > > If there are a bit(WAKEUP_EN) in controller can control wakeup irq
> > > > > enable/disable,
> > > >
> > > > Yes, WAKE_ENABLE bit. It's already used:
> > > >
> > > > ci_hdrc_imx_suspend()
> > > >   imx_controller_suspend() -> enable WAKE_ENABLE
> > > >
> > > > ci_hdrc_imx_resume()
> > > >   imx_controller_resume() -> disable WAKE_ENABLE
> > >
> > > Okay,
> > >
> > > I think wakeup_pending is not neccesary. ci_wakeup_irq_handler() can
> > > simple disable WAKE_ENABLE.
> >
> > Right, wakeup_pending can be removed. However, it's not that simple to
> > control WAKE_ENABLE in ci_hdrc_imx.c due to imx_controller_susepnd/resume()
> > do more things expect enable/disable WAKE_ENABLE bit. And usbmisc.c doesn't
> > export a function to directly control WAKE_ENABLE. Therefore, I still need
> > to use enable/disable_irq() for simplicity.
> >
> > Due to this wakeup irq is only used in suspend case, I would like to add
> > IRQF_NO_AUTOEN flag to request_threaded_irq(), then enable irq in
> > ci_hdrc_imx_suspend() and disable irq in ci_hdrc_imx_resume().
> >
> > For example:
> >
> > ci_wakeup_irq_handler()
> > {
> > 	disable_irq_nosync(data->irq);
> > 	...
> > }
> >
> > ci_hdrc_imx_suspend()
> > {
> > 	...
> > 	enable_irq(data->irq);
> > }
> >
> > ci_hdrc_imx_resume()
> > {
> > 	if (irq disabled)
> > 		disable_irq_nosync(data->irq);
> > 	...
> > }
> >
> > Do you think if it's feasible and better than current patch?
> 
> look better. Does ci_wakeup_irq_handler() always happen before
> ci_hdrc_imx_resume()?

It depends on whether a wakeup event happens.
If wakeup event comes, then wakeup irq will be triggered and 
ci_wakeup_irq_handler() will be called before ci_hdrc_imx_resume().
If not, only ci_hdrc_imx_resume() will be called.

Thanks,
Xu Yang

