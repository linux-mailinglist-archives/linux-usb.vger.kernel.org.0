Return-Path: <linux-usb+bounces-18572-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B06C39F469F
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53D381887B95
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 08:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFD71DDA16;
	Tue, 17 Dec 2024 08:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AxCYV+7d"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013013.outbound.protection.outlook.com [40.107.159.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49E7335C0
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 08:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734425823; cv=fail; b=Ge16Yk5t708+UXv6rQA/UHEGcfto4uzdf30eICYVi7coWqHvFgDgX9xO4y7jakq8bZlJTpsY5qQRuI9xFRZbT0LnVfkTmDgeupqaqzd53d48GqUNakjSc8pJtkMrVGCx1bRIHbjugjYIFBfVrsGYBj6rM0lEkeV08nyEkbhlfD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734425823; c=relaxed/simple;
	bh=zn1GvaIi69SnT7LCZZtrST7fK7XtuUBXqF8T+7wrEwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SIZWq5bch+vdugnKLiyiQJlU3Lb1pDnDutdWr6i2+WCRozyFrAlyU6envHIZ7bzof3LYCTS0c6t9EsQtqm1Q3uBI3WnRou6q/J87S+ZDgzLDDxeaWbcVqPZdgFF5aghO8M89+esYswTUw/aiq5qTE0L+pIU5eD3kfSSRnxZYfuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AxCYV+7d; arc=fail smtp.client-ip=40.107.159.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0BeG3idf4uk4s396WroLQs3SftSgRkOccpLwwLxAhBpEsgo4VyXFS0Z74eBGiQEqBEJ8BWTSBCsPLooBGQbNvCZcBTvzAMa2Wmb1Lsoo0Auuu48Lkm/LICRigPohp78vcK/7Q3v0KX1eQtO63j/bucUsvEOcDBNr5DJeWU/8fYeM4/25R7OQ11P9eT8J8pT0oGN9wUuEqg8nTHmvaAq4zHNbuGNrDJALbwqZjNn4sx9wo+n7129S4qpCrLwYcEFcfr2oJbUqXgNU9hmmEHd08B4V7iV61Tqdz2YtL8xps7AVKUB++MN1vW3EPpcJn4PGZYDSvjA49Rga+QOFX/zVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FK+JABarzVxQhPNGDbz18Wwq5ByCqA3fSqbQnwSC7eE=;
 b=wOHwEC9+YRtp2PZwQB5IjGQgDx657EwULW7pu/vy3rFQ0wwopy1yflPiU/J1p5KM2+g/0gMd/Zu3PD9jbEme2EOKacUETtj8r8vknsdJl6TYJ58Y9fUovL5HbRl4mhyNK2aUTIp1Cro1ScrAmGKwj1UnQgu9Gh3W1X3mIeWYZyWIxI9PTv2G84YRML+kZ7mj/CHwj8zIfVVqJc/1g9QjLX7j0ap/6Y5M45TyePObF0EYEVQOVODI8c5ttxICrj2f7PgGlEyS2B/v67xyaiFzniwEfNrok5/4Ov211h5DJkHi5pIYl1qTE0Zj9+KMzrXYmiDX08OoSA/vKvJKoK1Esg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FK+JABarzVxQhPNGDbz18Wwq5ByCqA3fSqbQnwSC7eE=;
 b=AxCYV+7din45iYE+0dPkcZlvXS+VT4fiKWWuW1NPK5EEGLoqLf6PQKqvIahlF7frqwAvxP6wrnpIuxbGPPRgxevqjlWinkgAap8+3C7KyPxco5e5TLxiuNalNusAhSGyqBJdck83HhuL2EdDZ6fqzLJ8QFIv9Ef6IDpr0jtyaU9CVttPQP5eKgtWkjNkiNvWqXdt11ihGkOVfJt4F5wBDfVeM2OjLVTGtUzKIRrNbk64Cv2LeT4nyZhB1QTHWFxUDXVJY3+bja5EtYf0dOSECs6K0CAdnU/nzzfPadQDu9CmEhTXs/822WEO3ix19pC0gVO5bW24wivw9EKzuVPSqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PR3PR04MB7258.eurprd04.prod.outlook.com (2603:10a6:102:80::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 08:56:58 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 08:56:58 +0000
Date: Tue, 17 Dec 2024 16:54:07 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, dan.carpenter@linaro.org,
	emanuele.ghidoli@toradex.com, parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com, u.kleine-koenig@baylibre.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 2/2] usb: typec: tcpci: write ALERT_MASK after
 devm_request_threaded_irq()
Message-ID: <20241217085407.myhb6tvbchvlsruj@hippo>
References: <20241212122409.1420962-1-xu.yang_2@nxp.com>
 <20241212122409.1420962-2-xu.yang_2@nxp.com>
 <20241216185540.GA53932@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216185540.GA53932@francesco-nb>
X-ClientProxiedBy: SI2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:194::14) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PR3PR04MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: aa5c04fd-c5c9-4680-b466-08dd1e78c355
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?J9XrGuIrX6qtsGD/R4n6IV1k8MgiHMy0wfyJ3dAHlcfoP2b9XoSS9FSiXfvG?=
 =?us-ascii?Q?ihXeza0f9CJDsnnEXJTjfURN7lOcjG/aWKbLMLQiGqlWw5LaXQoXOXXGgALb?=
 =?us-ascii?Q?56qosfXAQOtv8FiKys4twxJQhRpZfjujlmmBtdzV9ElpEk4cfI7aLT5uEWKb?=
 =?us-ascii?Q?pL8UzFWyLY87S1Un1LYISqhUGYHGZ52age2yhfHwDV6ebf965f8cqaRXNz9D?=
 =?us-ascii?Q?z/VWStFcgI3Mz0pOD37HKOqMkbb9HdpEGD/Wp1GPl7M6MzFxcTd5mSe9Gtyu?=
 =?us-ascii?Q?BvFfsx37pjEwcW7hi5Sgm57satXVXHuDXNClvdnVxiFzAupXYGXg/3cLULcY?=
 =?us-ascii?Q?M7bci9B5Q8hCbxb+13jujer2u2zdwfpOjov1eKzJW1F43VdqSfLZwk0hG+Ib?=
 =?us-ascii?Q?l5j5VaUWWGhfmqpTw0ezCfOzwstPyz4FCK5WAI3D6+mGF9xOLI3/5FKUHEnJ?=
 =?us-ascii?Q?uPeB8TpPKrUciLyBmGsww6beXy10+0LcyAAmlcBvfZeCsoFd2pxL5/WWfNiY?=
 =?us-ascii?Q?rKvyW0aiAwkUcExZ20MVPLYiKIsRp9BWDnojo2k7SsQe6kPfKcM4LeITjalu?=
 =?us-ascii?Q?JY+fHGnWpmpwT6WWQmf8FEVy4uyBorZUUzG+7EaZiz68m+5yoBd0IgZKEFtZ?=
 =?us-ascii?Q?sr2bbve4Mnnporo2XRaBkqb+yVpEaR2MtWas9jzajVic1Ex96PXviNty74+v?=
 =?us-ascii?Q?TDa1zjXOWsPlTE8r9qRy/8Atq/D9joi2DiQgbJa3g4EXiC6SoEDoyNBUDfRz?=
 =?us-ascii?Q?d6W18/qDpTM5FOvQ/Q80z6XGXz6RC32aYqukT+b3byvrKTzNwfr514kPydmd?=
 =?us-ascii?Q?IbeBdABkufcS06ZTdwMuHGznr6KLjkqL+cpIpd7D9a8nSKMqt5pff2mG1s1g?=
 =?us-ascii?Q?K8Pbb7HalhN2cGXtpKfclksCA3BmjMgMEF5YaWGF5dSjcSS27PKVJeO3jvyG?=
 =?us-ascii?Q?ZnNoiE4jeUz7sRVAjwIR0CoDEvcUfHGgnRzy6ja/eaUW/fqDOBwxHr8hv/+0?=
 =?us-ascii?Q?ASTbp6mHWsENqzZETBSMBejYTxA2qMLAyATOEcs/EvsHNTcNPDFSBZMPp6Km?=
 =?us-ascii?Q?LBnAVDeDtrJgZh9ZpZtu7RsnUGtAoTJlxh+k5een+73ITTHyNapu6ATfkDvc?=
 =?us-ascii?Q?NHpCRJjsYr6FRGgaqp/zOOD5Wbuuq8gDvjF+uO0c9U2rqQVxws6CE8hwC8BS?=
 =?us-ascii?Q?W2V3JYcwgZRnOUe5NzuwN48GBehFbKUGRe6LE23uMduG+PYvS7j+ZvDvBGsp?=
 =?us-ascii?Q?p4GUlU7lsjtJmTzr58iWWGjdC7+q2CaC3JRU8aSqBmEUgeAhtFOh3nejt6qA?=
 =?us-ascii?Q?Qx47U3bPzPOP+yMgCEjKToCjeua8/JW2QPOA2Ua93gfQOLVABjH8bnxr5lVL?=
 =?us-ascii?Q?eDwV/gFyeHnizbxiiIPqcMynHJo/ayoIM7Oaqqk52OKUo2Urq48v7mp/H5jo?=
 =?us-ascii?Q?dTT6uYWcxFSKm2KBaPXJnLLknCkandRc?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ET9oXHjU039nZXhkVXFb3Ei9gSVNV0rOYJcI27rI1M+NmlHwNlq5B+BTWYt/?=
 =?us-ascii?Q?pwn7CDBuKt97AJgDGXvOhTwTlIg7n3yw94+lZEWT9SYaruUIsgZK8+YYSdjF?=
 =?us-ascii?Q?zbqNV0XHml9vcfWWU0rDKs+2ecJQUIVkvl8nzteAvxjLFTFcryWAIHkfyZow?=
 =?us-ascii?Q?87IjRWFu70kyr2n7XNtt4pVkyXOOtD0A+N+zVNqgUwJXl3riLRWjG1o0nUQ0?=
 =?us-ascii?Q?KjKK/PmrCc2Sk0aBVl7waOberV2xuyxL4cfToeJ8C1+mfRpr1VhlL3aZDUmT?=
 =?us-ascii?Q?DCnzrImeoB346j9tNcg8golmwV+o0blBE2wF/70VPXdosvZKXasKmSQspnqx?=
 =?us-ascii?Q?us7bVYRCeQ8UM+vXsq6ic4abh4ScPl8RcfgpuiZLI0VQqWOcv19J+HJmbMuQ?=
 =?us-ascii?Q?W++XEEsa2vhMySVEj9t7sW+yMhBaR/IhoIZQqwg4tt2Rs1GVUCM1zQdvnJRP?=
 =?us-ascii?Q?OR6XDsLy7ifci0lGOFTSPAhKs9IPvMPtsgXcl1btq5lrNhEcvzJ5BoU3lk4U?=
 =?us-ascii?Q?JVf2OYnJsgo+b16gjg2YgKGI25bwXSQJzDDES3cYSZrXGBDOvSI/4ny0UoBV?=
 =?us-ascii?Q?KzRQCHIL+CH49uDf1LXiX2dQOLqJLDVMPCQisp6hNeSaqGZUrOGYhF3PMZzx?=
 =?us-ascii?Q?y+pwX3frPv0CvyL9GuAKMBONiu1XjdjOKORRcCIswptHZm8UtLHXeLLkJjAy?=
 =?us-ascii?Q?205ZHqGgMI/R+SnGXCohpwvO+j6z4bm+mN86lQwaN+XHRJP06hJ01tya7i8Z?=
 =?us-ascii?Q?vfT7Ue2oEXvn3HGkT0l5XF4Q+eg5g7YK+K03Ihm3KnpkobBtITVk4Fc6zNkF?=
 =?us-ascii?Q?Qd7ErYphH189byaBN9lqIMMJ4mnK0i8dBc+HfMffSie0uWsTO/8WlHWPzkan?=
 =?us-ascii?Q?trAhpj+SydS83ztHVWZ0Vra8Ik3KuTyCvC6IYspSOvM6nAJIRwIwEpyGD5bu?=
 =?us-ascii?Q?+YZlgwH3oDq2qOb0OKdZJ9OKko5bW3myh9cLOkMR9FB/cAu3RqsiQm2bQbk8?=
 =?us-ascii?Q?GMR6OTvsGMaGTN09PxDm6kwmY0cvr67rmRF8FLdAfdQ8jy+NB/TwAuZLGj8b?=
 =?us-ascii?Q?aLjy+pTnibG9TFKEcXM/fRNYC0C6pXo2DFTzxak5iGGZ3QH3J8A++xzOrof5?=
 =?us-ascii?Q?pgWd0fHGmk5HuPEujajcSbq4lOPpssFcFr4Oqw5iNspOyhGPL6XwbEL9dr+S?=
 =?us-ascii?Q?lFChHdreEqQfxgOCyz0ZAmhWo2mAScCvQnrAvMSTKikB3TgxuWjgntrTbjOY?=
 =?us-ascii?Q?WFpBqdrWykt32YWal2Rh9hFcZovH28hBLpoQfHthjyq7nm34t5yX79iAZTyJ?=
 =?us-ascii?Q?Dz4S82u1jkccN9yZGM+ihsAxe7Y3zWio+cpr2bsZ5YZIkF06c5szDRJI7P/z?=
 =?us-ascii?Q?lkqX81ppLIleCDKVzd3FF8oqoTMn+GhpoENb34cE/toLhxj1mq8n7Xz2jgqS?=
 =?us-ascii?Q?ncqbWCQ8PDQW7oNI2wziAkTGKGJsE63bcmK6x+qHWEcBBzYDentS9hdFs2kN?=
 =?us-ascii?Q?0VltZ9vDXgrBjf0BfTHcv3OLOjLoRycit/Z3gcSPlbZDovJWwWF3vjgypIz8?=
 =?us-ascii?Q?fqzBuqBDsIYtdMZfHvtxtYezywjE6q1AkS92vUi9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5c04fd-c5c9-4680-b466-08dd1e78c355
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 08:56:58.2863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mua6OPvX2OGbQsovDY/2FuTlOuNsn5Cu0C0i3blZ/Rg0SaHHwIBylYKYW4pctzPKZTQOgcDu24cW1hxIwY2mgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7258

On Mon, Dec 16, 2024 at 07:55:40PM +0100, Francesco Dolcini wrote:
> On Thu, Dec 12, 2024 at 08:24:09PM +0800, Xu Yang wrote:
> > With edge irq support, the ALERT event may be missed currently. The reason
> > is that ALERT_MASK register is written before devm_request_threaded_irq().
> > If ALERT event happens in this time gap, it will be missed and ALERT line
> > will not recover to high level. However, we can't meet this issue with
> > level irq. To avoid the issue, this will add a flag set_alert_mask. So
> > ALERT_MASK can be written after devm_request_threaded_irq() is called. The
> > behavior of tcpm_init() keeps unchanged.
> > 
> > Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> I wonder if this should be squashed together with the first commit,
> given you re-introduce an issue with the previous commit.

No. One patch normally should do one thing. To support edge irq, commit
77e85107a771 cause NULL ponter issue so path 1 fix it, it also didn't
handle irq or alert_mask correctly, then patch 2 is needed.

> 
>  
> > 
> > ---
> > Changes in v2:
> >  - new patch
> > ---
> >  drivers/usb/typec/tcpm/tcpci.c | 22 +++++++++++++++++-----
> >  1 file changed, 17 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> > index db42f4bf3632..836f6d54d267 100644
> > --- a/drivers/usb/typec/tcpm/tcpci.c
> > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > @@ -37,6 +37,7 @@ struct tcpci {
> >  	unsigned int alert_mask;
> >  
> >  	bool controls_vbus;
> > +	bool set_alert_mask;
> >  
> >  	struct tcpc_dev tcpc;
> >  	struct tcpci_data *data;
> > @@ -700,7 +701,10 @@ static int tcpci_init(struct tcpc_dev *tcpc)
> >  
> >  	tcpci->alert_mask = reg;
> >  
> > -	return tcpci_write16(tcpci, TCPC_ALERT_MASK, reg);
> > +	if (tcpci->set_alert_mask)
> > +		ret = tcpci_write16(tcpci, TCPC_ALERT_MASK, reg);
> > +
> > +	return ret;
> >  }
> >  
> >  irqreturn_t tcpci_irq(struct tcpci *tcpci)
> > @@ -931,12 +935,20 @@ static int tcpci_probe(struct i2c_client *client)
> >  					_tcpci_irq,
> >  					IRQF_SHARED | IRQF_ONESHOT,
> >  					dev_name(&client->dev), chip);
> > -	if (err < 0) {
> > -		tcpci_unregister_port(chip->tcpci);
> > -		return err;
> > -	}
> > +	if (err < 0)
> > +		goto unregister_port;
> >  
> > +	/* Enable the interrupt on chip at last */
> > +	err = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, chip->tcpci->alert_mask);
> what's the content of alert_mask here? 

  tcpci_register_port()
    tcpm_register_port()
      tcpm_init()
        tcpci_init()
          tcpci->alert_mask = reg;

After tcpci_register_port() completed, alert_mask is assigned a specific value.
For example:

  reg = TCPC_ALERT_TX_SUCCESS | TCPC_ALERT_TX_FAILED |
	TCPC_ALERT_TX_DISCARDED | TCPC_ALERT_RX_STATUS |
	TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_CC_STATUS;

> 
> I am not fully understanding why this flag is needed, can't we just ensure
> that within probe the alert mask is set to 0, after probe return with
> success we have the interrupt handler enabled and we can just write the
> alert mask unconditionally.

I wrongly thought ALERT_MASK is firstly reset and set again in tcpci_init().
Actually it's not reset, so the flag is not needed. I'll change it later.

Thanks,
Xu Yang

