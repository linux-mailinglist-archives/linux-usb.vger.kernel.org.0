Return-Path: <linux-usb+bounces-18580-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D1A9F4806
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 10:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 860407A35CD
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60CB1DDA33;
	Tue, 17 Dec 2024 09:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XEUQpZon"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012037.outbound.protection.outlook.com [52.101.66.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384B712C80C
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 09:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734429129; cv=fail; b=As2jJ/sudMkRl2YaWPMHxGzjPztJGmYBTgBP2pLpdiFZCEBMXif6qLgNHeEsX8rMFIMZ16YBNBHiTwkyAAW00SlLR0AyySmg2WYeWBYf2yqbLV7XeQK98odqqvXqeLrYSwr9E4BFzW4s/gxgWw4SliRzDQmFgy2gnkIsiAg7xMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734429129; c=relaxed/simple;
	bh=FSBIxuThruGaqqSl06V14vOl9uJtN3rypeZ0IjWrRmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O+b94QcF6GrlEv+YbbV7HjuZ3UJr4o8oow38Lab9dodyDoNF4C0utcvY5I5Ye+PyOjGomaOvicH0d6csC2Th69lcaKRiIu102ZqoDglg1zrvuOJSMBbNWtr+XcZgb1ZTiMSF76xNoY+ajtYM8ZdiYy7nWkCdbRJ67Xel2poQhEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XEUQpZon; arc=fail smtp.client-ip=52.101.66.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RbDCBjPMfOdbp95E3TkJeKBaxeLiHBDdC7xEYTjE+PN8CEGMVp4xQSo9d1XN9D4Rsz4G8/GDQNOB/Ei84bOdwfLNHC6CRGy8B3Q03Dw5lq1uorYV7CeySqou7zdFFIk7JQZjVtVU8emK824YnTX6+q34VNXh+sEece87B/TpYe6clbXXWpepi/npjwKsXbUGUrwqUaCEpP3ManzC1R06md6SC7FA8jx2KcppJpDF6uVJBKaagYAbqjReo2qlbxmxX9nlv6FEZCq7IW6DdgNT8URBRUDIfL+SfGdG130oHOqeDxbe8vhlPpWaumSDe2fI3LPz5K1p8wWiwCvf7DWl9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZ+sjrqMu9D7AVvnHUpxNQD8W/2zbLzKFXcGsWm52RQ=;
 b=Jwf0qaFCwcC1LDS3eU7qLHovNZuVNzRcvk85tUGuyEkgczy06q4hIJhJDCrnmcyWi7HorUd5U/9GfDTTXIVGtc72+jF6xEtb1TEAfaPfbzh95SbCOoFE99lLD3fQASDCJKdGk0slUHwhuLf/99b9WoGwm06GGTQwqx3k7tuHDNH+GxZsMmsZxL5Fs+HTnaT9EZDbbiAVlt8U9DiU1/s1eQlhkZ1fqqIGgvXMbJQy05f3MbaervwiiWETIx/WuEAoyktN0iHmL5Et1PHwPQis5OMLYemfFx+qhnNaPhKsncwvv0ZjkZnHkyocXZd4lM6jWSwVToDX/9dT/4b1hi+WhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZ+sjrqMu9D7AVvnHUpxNQD8W/2zbLzKFXcGsWm52RQ=;
 b=XEUQpZonz3pfwqFPa4wbgNYI5bcsy3uSkiAmKRYZ+IhUCEqJvsgcv563PpxSn6eDrAmILMD8D3a0+ez/YNvxUPyB1vSIyp7HB3kM5y6XREu/vpyWFEa/MPDnXryEHWvse7AbRa0+07RHdLLUjzjJaaAYIOphPWJwgySB/pTxxaYNMs4oMG/Vy3VorfTvHncwsn9Q4gr2L/eBkU1QHu5M9tr/At5PVs/2qYHng6719xQunzjUDu+QaYfGjr5OE4n1vS+un7KdbM/MObimr2sO525hiH79YBCVndXmdq9pc9gWskLzfil9xv9vui8UzVaU+2cO6ljfcG3Y3CdLreoxjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU2PR04MB8631.eurprd04.prod.outlook.com (2603:10a6:10:2de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Tue, 17 Dec
 2024 09:52:04 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 09:52:04 +0000
Date: Tue, 17 Dec 2024 17:49:17 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, dan.carpenter@linaro.org,
	emanuele.ghidoli@toradex.com, parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com, u.kleine-koenig@baylibre.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 2/2] usb: typec: tcpci: set ALERT_MASK register after
 devm_request_threaded_irq()
Message-ID: <20241217094917.qwbguhm7woz4mo4g@hippo>
References: <20241217091208.2416971-1-xu.yang_2@nxp.com>
 <20241217091208.2416971-2-xu.yang_2@nxp.com>
 <20241217092905.GA27489@francesco-nb>
 <20241217094117.xb27iww4dmq2ehvl@hippo>
 <20241217094553.GB25802@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217094553.GB25802@francesco-nb>
X-ClientProxiedBy: SI2PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::22) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU2PR04MB8631:EE_
X-MS-Office365-Filtering-Correlation-Id: 41f0c8dd-6dec-404e-9cb4-08dd1e807637
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?jSSDrIfUvERbnZZColloSzKA7rDAegMRWXvRoR11MBiN//ttXO7OpDbvK38N?=
 =?us-ascii?Q?vnIRzJS5PNc5+Smo4HAnygTOfgnG5SXKjsSMAx2wAHmHRdj+pTwsiwFbA5AP?=
 =?us-ascii?Q?7r0ZF1Pu9l/m5J1MXWMsBEccFHefOSCAi5tQSx/i7EzYpkxbcc6Y5Ysy23GT?=
 =?us-ascii?Q?fMlYsVBm9hwZllot6z0L9gYi8u+tnuF0QmorD7N4197XEmIntLkL20NyGoYB?=
 =?us-ascii?Q?jsxyp+VHkUN3jjAbtAT0mmRhFZhumRr47NTEZJ6nxCld5VfhNlBzObeiKM/X?=
 =?us-ascii?Q?84TwVHumiI4y0O1wBqYdpi0Md4SEA8YwMntN1tJKO/YFA96uAigdcNm50FJ0?=
 =?us-ascii?Q?2jTJPbH+QpE/QYQ02B3Yvv0NlXyf87IppHnl/yqzQSPkNPDvLM963BXaNVMI?=
 =?us-ascii?Q?M6mmLyrjB+RzTgMIGpu+tBra6K5WpLjaJS5HztYfACR1pXn26yI8N2FABOca?=
 =?us-ascii?Q?5hoIveI49wHaCqjcKjeOyioQIkhbMilNcBz/F0fGiwr32O1QKdbXIqZi4SRl?=
 =?us-ascii?Q?IIi0HxExaubm8aoPa1kNrYCAEuuV8fXKtnUIA16u096+fY4pGxVMelWpoYs9?=
 =?us-ascii?Q?tXTTDUHsJ0ghl4HdtGJ9sDB03e4CV5H8xAe+eXUTNLX/XzfLbKqPGfju+zSn?=
 =?us-ascii?Q?2pS2tOCPRXFzbqvzzcm1MmrisjTl1xCkAgcUa5a2nxXdEw4kbJtG2khX7304?=
 =?us-ascii?Q?h3eNuauWUxZN4bk0PeJcqa4SuClUTL/K7BFml78zb+2SAZJpMvkIY0SG9NIk?=
 =?us-ascii?Q?2Vqck3DDYHoUfyZIEjNo0hx8jLVHn0eqzkgyx595numHN6/2+cvFhtdVem/n?=
 =?us-ascii?Q?VuA5ME09WwQ0JBkv6Jy1vOyHyeYtnflA4ybR2eyLzYLciu22kpHYo9QyOKVr?=
 =?us-ascii?Q?wENyh5z9xZmaeETtE+AMHbDacBouCDqZbNFd2bRVHnQSeXVwIcl6hCe7iLBF?=
 =?us-ascii?Q?1iNWKWezzjtCm9R54+9BP1OU7hHnJxpWAyb9jZtknZlpVPGCiSrmhLvxuMvm?=
 =?us-ascii?Q?BRoQCirXwJd9oDsOjBw0V2ObIf80JRhBbp5z8956JRvGNJdAB+awSXBkzK4u?=
 =?us-ascii?Q?tDFbbdQ8p+uvCSiXPwy1gA0ax5ZIWc7qJXNjBlP3sR5ZbgDpeWBtgdA8zzLO?=
 =?us-ascii?Q?ZDcyklqj1HaeK8E185gT1n1tqwQbjLngFeSr5AQnFb0DrHx6sJmRng+BKcbo?=
 =?us-ascii?Q?G12N/ebsWJTn7/1dMlBTeS/JycZuFLoJIcOqYWzU7xwZEBJVtn2rOVeSxR4+?=
 =?us-ascii?Q?S2UDo+PROusydkbf3cAdi9Hv9RcTkxCarq4XWJwCv2NyM1UJWhPRL1IY/bWg?=
 =?us-ascii?Q?kEGMbnc2lG3JQS3J2jSFQVCbm/Y5d7F+dP6Sn2P52yKhy8p5hv7rjEtU+d71?=
 =?us-ascii?Q?uYY3NtlmOnMuYfimYGEoFCKXDrgC1w7gppUNaj8dugkMHD7sfa5kemeNjVZ5?=
 =?us-ascii?Q?FhtEEAMOZhjDM725wqPmhMseCA6OWzAU?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Yy0+Do4v6af4Vt8/pfpz7XAKSpOSWBfcpYQhFm6DsTLKxxNL8qY6php1aO/4?=
 =?us-ascii?Q?a8qVMCeUeS6GaGWqzWFiBmeIA4tRocEYZxxgS8RF2DyekkI8cvQggyyISxiC?=
 =?us-ascii?Q?BhCPVe2AJa1yBQyj85NgMgR1+2ifWyOCP7dQFYe8BLsE4fx/Bl3fWJtL/COH?=
 =?us-ascii?Q?w0KImulSC4GuI5e7T/oC3pxBKHBvjd/5KQI/ynmS+edFMhvNxiQO62Lmve4Q?=
 =?us-ascii?Q?Snnemf82+L7eAVgNfH0Il85oln/Y4eJa4lhzaMHD8C2HULvm4LOYvpSnsdLO?=
 =?us-ascii?Q?g5cdlP2p2cXYbhirWF18tTBE0UBxiCGkw6F3PG7f4AIGpz0nEg5ieCeAfXqO?=
 =?us-ascii?Q?qc5FyB15jFL8rv9LVgG7ZUZ4yyeVexYOHFzLTFu5hQjpOLbEwK5eCPlK3fMl?=
 =?us-ascii?Q?zJjlgyX2wPblas8DRTqvgf7WORyTenmlyjAHKLx+PJm7e9oZ7YFn1feovmLJ?=
 =?us-ascii?Q?bKMvZI1PDWVygMS134vS4+rulVrwfEZ3DDhwPB09a9ZP/Igl9MoHpcf/tKC0?=
 =?us-ascii?Q?BUtkcFZ4b1bAoGj3fmjDQQxUPcxmgut1gQcsWb1nKWOCvBxmjjIyUzlt2EG8?=
 =?us-ascii?Q?WCw+U2Mw7jI8Oaj2jlt9JtjAONRL/tJH1obnhlaVq8ost24YxjuEcB1xpg20?=
 =?us-ascii?Q?AAZVfJAa8+biLqvjn8YCTtQzCSG3AURaYfGnhN/i8PHcV0v9Zvg+fkYiD9Z0?=
 =?us-ascii?Q?3dzon4nci0gtpFLus+tY55g8YR7C2fVb0LCXDfuPRnso36WYWc1lBOGKk91J?=
 =?us-ascii?Q?pLwS6qdPipIaLAv4AEEuJtlHpvmAwuA8Y+6ClgvJczrBd+3zdh9UUs/nkkVO?=
 =?us-ascii?Q?8OheyjQkRbN49XWTfunzYnT4w8KN0Rcj8I/Y7GuFFpJLJxZ7ovXeE+UeQ4NM?=
 =?us-ascii?Q?pK3fjIbD3FTSSpGOgCAn6TvGErEtT5iyC+Q5suaKcDqeZaj91NObpfgRQATh?=
 =?us-ascii?Q?W4AnG6Ap+Agdk1lHV/QT8BTSkWd4WcZAhaV7gWhSOs+otp0G4dazKa/zP+24?=
 =?us-ascii?Q?yEw+8Ine+VvSATJ6Yab4Co5gXRyoDhxrKhCJSVrTLvhYVkRXjr5c8Jkuqmj6?=
 =?us-ascii?Q?dBZLiGL9oipoUEI3XUmhEf0MPvt08UKREEES2i5v3xD+yEHl9THkznOD1ceW?=
 =?us-ascii?Q?fto7LT+uNmYwiDcs34ZnFIOhFOZ2aKRjXr9qcrHvdBoA/8jfXWYnHipOYXrf?=
 =?us-ascii?Q?C13OKPhAsPx/THhS0ohuE5mu3M5akfjon4hWTqdkGx/yPrhUTACxvQNJdJko?=
 =?us-ascii?Q?CE4POae4ng2VfF4SdDVi7dYb9QGcyoS4acBE83sErUkv/eZjYwvVfDvW1Nfe?=
 =?us-ascii?Q?x+dCdNkD1LDjoIxpLBbEkwxgxf3/IvO10ZcjfNnTY4NBSsiKVGkuwUZNS0N8?=
 =?us-ascii?Q?iLq1xnZuAbsBDnkT6JsLQNeKK5/DueZLf7p/DrFK9ecbRKq3xpMN6Xbn1CF0?=
 =?us-ascii?Q?P+Gt28QEkGdcesXnmAM5JknmeiBEFM8AHM1pfNYHcajJK7l3ZMWtlnXZnBD7?=
 =?us-ascii?Q?feL9jUM9LcOFYRtB6TqXInLyea3YPUlDQfUHnq1j11b0fjHfJPPTSFagP2aA?=
 =?us-ascii?Q?8dzMBbQ9bQMKMFlMP+dYkwpN4MS4DNjuo6S/WzYj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f0c8dd-6dec-404e-9cb4-08dd1e807637
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 09:52:04.5766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Au8Q6V3us7J3Y55baHHUTLFhPZJioiSJhkuN3ThEg4P/lyFaa1FsM6c/1FKXLf0zaU2VI+5J6E0/vyChZLQ6ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8631

On Tue, Dec 17, 2024 at 10:45:53AM +0100, Francesco Dolcini wrote:
> On Tue, Dec 17, 2024 at 05:41:17PM +0800, Xu Yang wrote:
> > On Tue, Dec 17, 2024 at 10:29:05AM +0100, Francesco Dolcini wrote:
> > > On Tue, Dec 17, 2024 at 05:12:08PM +0800, Xu Yang wrote:
> > > > With edge irq support, the ALERT event may be missed currently. The reason
> > > > is that ALERT_MASK register is written before devm_request_threaded_irq().
> > > > If ALERT event happens in this time gap, it will be missed and ALERT line
> > > > will not recover to high level. However, we don't meet this issue with
> > > > level irq. To avoid the issue, this will set ALERT_MASK register after
> > > > devm_request_threaded_irq() return.
> > > > 
> > > > Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > 
> > > > ---
> > > > Changes in v3:
> > > >  - remove set_alert_mask flag
> > > > Changes in v2:
> > > >  - new patch
> > > > ---
> > > >  drivers/usb/typec/tcpm/tcpci.c | 17 ++++++++++++-----
> > > >  1 file changed, 12 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> > > > index db42f4bf3632..48762508cc86 100644
> > > > --- a/drivers/usb/typec/tcpm/tcpci.c
> > > > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > > > @@ -700,7 +700,7 @@ static int tcpci_init(struct tcpc_dev *tcpc)
> > > >  
> > > >  	tcpci->alert_mask = reg;
> > > >  
> > > > -	return tcpci_write16(tcpci, TCPC_ALERT_MASK, reg);
> > > > +	return 0;
> > > 
> > > Should we set the alert mask to 0 at the beginning of tcpci_init() ?
> > > 
> > > Just wondering if some bind/unbind or module reload use case would need
> > > it.
> > 
> > Maybe not needed.
> > 
> > tcpci = devm_kzalloc(dev, sizeof(*tcpci), GFP_KERNEL);
> > 
> > tcpci will be reset to all 0 when allocate the memory. So alert_mask is 0
> > by default.
> 
> I meant
> 
>   tcpci_write16(tcpci, TCPC_ALERT_MASK, 0);
> 
> in tcpci_init().
> 

Still seems not needed.

  err = regmap_raw_write(chip->data.regmap, TCPC_ALERT_MASK, &val, sizeof(u16));

ALERT_MASK will be set to 0 at the start of tcpci_probe()

Thanks,
Xu Yang

