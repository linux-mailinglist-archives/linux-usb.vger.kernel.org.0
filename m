Return-Path: <linux-usb+bounces-21836-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 858F1A66B96
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 08:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98906189A21A
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 07:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716201EF365;
	Tue, 18 Mar 2025 07:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Br376tF8"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFFD1EB5CE;
	Tue, 18 Mar 2025 07:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742282875; cv=fail; b=a2PbKmDd9Wa/pYode+s5P0K95N0PP0lCCBtN9L4wDGT4b6YaarH3M1C1oCsgO4EQkggZ9AE/0Wfc66+NLwDtdjqrFwwG0v1t3RjrD0WLtTCOYh6J6LLt0qEzItXrrHtwSDTOcujZlZNFa2UqtQxjdgAlezYjFzmAV5nSue1wT7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742282875; c=relaxed/simple;
	bh=rKMLeF2T2sIbgc0XCUev/Nx5Geh1/dYdDtuwrGhzr2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VLhWXs/ikhgE60UvbmY4YU+CDEq14SzHNSxS2zAz7HwXZ9SK8drK29EV0rRUFfapRSMYhThMtGpUdLEjz5QAZHbItvqjXWb5kWoQS/YVTtrZ80vk6SGZpNLRMDuNalM7L19f+uiYtkS6AgQScrzY+gh0cNEf6o1VesKPMZZB6j8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Br376tF8; arc=fail smtp.client-ip=40.107.20.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r4Yu/lDwwyVrNCl0epV+eYp5jFRtnXmYbgsLJt3qdzMihpywSXVTztOV9LzCbasZavyGp3x9z5EnkP2T1pdF05EcbTj2JAFKmr8Bbh4+Wssg3CFbDH8ArcYv2CxL2CiOtQ05g5FLixzi4Hqxd+V/1X+6kr47FPw6kuntHY03RFGSs21fBALyn27V5eymys/NDs7tYHDsApmJqgFN5IgOfEXT2qQhdsfoHaROExNVd6VAdSGcpXQJ54PBdcQvL8oSrDw6KF7UkgiTxbYaiYYUfCEi3LUChZBrr0FaqYmxlgVijE2RN/LkNPkU2Wjeq/J/AYjCf1wwsZEEp8thuPgP+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJ2DwVCsKiclxSYfq1UfwLgEW5b6kB5j0p2pojiOLCg=;
 b=HIs0MVyxZTFrSnv7QSq3up6IMSIYNpo2kQdk4vepjEY8s5p2UTtz4jHp0/wKYjEa0hmJjQBaLxwGYOz4WIC2bEKCH2m+Uh1ao4EzBiT/NYakvHPQ4wBh8saCC+zRuHOP3tXPHfoFpnP1JUlgQZMkLT2lzwQcO9vilKj/EMWTgtjFgEt6w2BDCrqOYx7+cCg2g6m8As1WCccPgVroLM3JC8+48RV1a70zwaRNfKapGps3GLgl19/bR33NH7PdxkSJ2cS97hl3mHGoWUeBe+Vr9tQqT/cc0YvpqCaxR3//bIJVfm/PA3ajVG5WQx4lML8XF7ZF1DWIS2c5Tm+NdJwG0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJ2DwVCsKiclxSYfq1UfwLgEW5b6kB5j0p2pojiOLCg=;
 b=Br376tF8GvzsfCIKfH3Ks4vRUV+idN0O2wcDD2i24WYki96L4zdnhLDQavmlqwLPjKui9lESzbR8nrdXfaVhzJLcC7eIQjLKEqlsGixefs5xDszVb+seLfOKWOqZBLj8k+RpewTkyoOG4xLAs5/R6//6/deNPZzCIo/JlzbH7qt7H8zg0CgnQ6v9XYMhgKzs+LlK+6XfDmV8GZByNmPp+E3231sGmv8KRCLthj2LXv6aWbdXaUNBr+UPAlr4OedGNEcGl2wp7f8U47aEMfFMKFOzXc7epwVvVfesPTTNumxnQmIt+0imzvf+BXZJHRLFy5wkI4AsRXPGLnYdV6jzDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB8106.eurprd04.prod.outlook.com (2603:10a6:10:24b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 07:27:51 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%7]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 07:27:51 +0000
Date: Tue, 18 Mar 2025 15:24:14 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v5 0/6] add USB2.0 support for i.MX95-19x19 EVK board
Message-ID: <20250318072414.x5y4kbe2ahl24uzg@hippo>
References: <20250312082700.260260-1-xu.yang_2@nxp.com>
 <2025031443-rounding-subject-1f60@gregkh>
 <20250314092137.6m3gmj4irxqwpy22@hippo>
 <2025031404-elite-critter-05b7@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025031404-elite-critter-05b7@gregkh>
X-ClientProxiedBy: SI2PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:194::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ae68570-96a8-4c87-fe42-08dd65ee6424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v2B7ZruI5l6eTk/ZtH+eLo7cd/2NYpwiBOkdiNYh2Lrkv3INg2fNmAI0AZgS?=
 =?us-ascii?Q?M/sGZADXkQmAbQVlrV4JoxfnMzC5a7kSpXWzBvqoz3bkQ0GcfPZ5KAxc8Ved?=
 =?us-ascii?Q?QOLr/SxZihb3csELluuLRRq6hGmHNllUdS4CmZ1rNTEbp1E3z4YBS4H5S0vX?=
 =?us-ascii?Q?lKvjnU0Y8W90A+YyTx62DgGOpd1e+Jom9ibkAhya5nDAm5I+T5xt03D78tXj?=
 =?us-ascii?Q?dH+/P8WwY9nQkqoh3E/NPWNK8eHKtn0ymSQ1m+OtDzBM6wKwhyNhdDVMPIBp?=
 =?us-ascii?Q?62i3/B/c/f16r3kaWhmRBNzW5yrlW03EcZ95HBiRJBxfvctMZtfYN4yDAVfp?=
 =?us-ascii?Q?tYVhMtI+ZFcoKqDa/7alQgS16X/eW537qmQcvgRzvtpnVM2jCh+d1shA+isk?=
 =?us-ascii?Q?uIIMeTuwTt7uaIxl+bHb5pLjRFtLAOB5Zv1lG4zi8qSzJ8Vq0SCDDtNnBfNx?=
 =?us-ascii?Q?/xZLPJyUpD8s/w5+AbD4iQ0NFA6NrqyRvYWy1wF4i8ywg86Kn0TlFrMIFlZr?=
 =?us-ascii?Q?o4MNNXkR4Eq1K5w5QLpCuzrzUN7EkiPM7ENWwiApGgyrsYJ8p7qZFvZQMnXf?=
 =?us-ascii?Q?bvvJa2A0QxfHsam5qsVo0frjKw6s50XshLmAUiwrVx/NOoReyN1BVRqxQt3c?=
 =?us-ascii?Q?zF6g25ievMLpVlubOz7rP7ZUDo+Qes7UTKJMkN9mW2rHHY7mvm2zYqRIIPBH?=
 =?us-ascii?Q?7ZJ5bivJQVVYRhqmXOwI8V0ePfZXgO3kxUcx30lBpU8EMK9BMQF0mxbidfIF?=
 =?us-ascii?Q?YcVc1TAuarvX7j/jXehyY8V4C/LqUCO5PgCrMWdgsSM7rVZ+i58xZkk4Hkbt?=
 =?us-ascii?Q?Tr/pTZ4yLpZxalnXh99jIpgqzOwkiXQ8wnQ85PFuj27q56FNlqYTndkKiDH3?=
 =?us-ascii?Q?VebT5NU243XNYc4ll5+j0xg8l8V/OW6Z306hFB8XcJG9M+KFZ6k/msL7Hirw?=
 =?us-ascii?Q?CuP9jNnZkwLaI6i2FLAtSNWYzcUu3U7r1Ib+ZiTIcWNaH+Q/LsYa74nspgXO?=
 =?us-ascii?Q?JDZF+SjJ/DY8ikUBEtOPGToWAiWKfnQ8tQ9Xx4ie+i+pVAiMQ4QkV/Q7pwiu?=
 =?us-ascii?Q?LoBJ/pqTJC81Y1q+NAMNt/G6wAiiBMgn2B1pNQMkHk8YXsrSZGRThmYx5Pbk?=
 =?us-ascii?Q?VTkPh/7m01iobylnHHutBHWtnGY5nOjax4o2B5RXcyIFCk4q3iwT9faejAu2?=
 =?us-ascii?Q?pg1BHkMBKF4RXFWr82gF9WaqB0bug8ZliPcsyFdG9lwVIfz7OgGEGBKYKV66?=
 =?us-ascii?Q?mtcUavMI0K+RxEolh+VDGYuaeTGdTS20lv3rRGBkbLtzAFX4TBAAKmANLxBb?=
 =?us-ascii?Q?C4bpPsWW+UbXT85ZYmfE484i+FKjs4C0wIzNhiPMuDSuyVZrhfhIU0IIo2Mb?=
 =?us-ascii?Q?7H2G4Lzcl/SPRQRwNYRYUJrS2LGeyjUqJlg+npsfpH0442kK5LHLCx1n45Ig?=
 =?us-ascii?Q?gEqweCYAgCD6efN7UMWUHsjouw9PFLgI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vUkgMEv5GwT6QH8YRMIq/IJb6nQjOIrYuYiAgothiSbVglT0TW78D7p+2Pt7?=
 =?us-ascii?Q?2wUpcdkZVqxrI5jVRNvKGs3FpKGZhHoRVvbgdig0LCrAPplaHeFzF0DZ4fqO?=
 =?us-ascii?Q?JoRilB9TosocRxscatt3ptVcHiTZaAFohdlQjxOgZszOMe9KplCvCEmVrpxZ?=
 =?us-ascii?Q?6rG7Q90uc8bbbXChkxvH8DPrYUsF5dURu4CLdyZ8L6/3NydfnhED5yVaFgDz?=
 =?us-ascii?Q?zuvGM9RlyOxY+qVWhedIiOD6KdNUmMW7LB7h6S7xTbIZsZ1O2GDtL7Xo34Py?=
 =?us-ascii?Q?hTiyLpXoIp4cEMuXN+c21wkxfizqleGJpinp4jt4vKiTlJejPKesPPys48fp?=
 =?us-ascii?Q?rRKK8i13DWHvqBasuyneA3puPNPEKH/Ww5H7mitg9ilqqAnU/F+kXqF7PIKG?=
 =?us-ascii?Q?eT9Cp3exwlZIxp5xOhY+RQ3xXee4AncfO6iu+9XMmhaaM5T1GMP3/lvywm5X?=
 =?us-ascii?Q?j+vMoNJiLF8umCdB8Zm1CQU6WKJJkD9HjDsFm7vuUHn7yVrT0wOdhk0qr6TX?=
 =?us-ascii?Q?tJP4CP+ZB/xUnK+Rek4W0xnCkGwhpOeaQsD7eLnRDDidZWHmwo2KwET6bt0U?=
 =?us-ascii?Q?Ri+LRWAk51r+W39dku6UHSF30IvXIeQ6EX1ysvWIGgAn1vrK/0oTgLm/hOZ0?=
 =?us-ascii?Q?xil4TcWWHpGNGiXn+5orWGNmSIqCen9R/ZtshrHgdF3lLb+cO3OzZGnyiMYs?=
 =?us-ascii?Q?cfdepw1ng2Hjd+d5XKiovl+F2A5SHMUMTAaKJsukrKhyNpQCZ4EcCmaFB1sl?=
 =?us-ascii?Q?zYbHCO5zpkMxYkuccXvs1Z8txwuok7iDnsUUXN5/IZqu9pahyogAyRm4nbT9?=
 =?us-ascii?Q?xrwbiNQGqje2jjWskR9v5zzb0WFb6wTACYFhHC2XTUpOXcXTjuVlx6pBDu9+?=
 =?us-ascii?Q?opVHLJ9Cm1KkPTnuQU/8A/rnPl+jfjHRy+Zq3DXLi9XZQRSAu530F65lBs4+?=
 =?us-ascii?Q?c9fqsYYNyNX8SPCp02bvWPH8BlSKYEQSOPYho6mk+QNtqB49xulOKg7wyiZg?=
 =?us-ascii?Q?mAEyS0h0Ov7HO8Me2p5KLoqJMNJ5sG1VaDMJxTeZoF6N68kbD78S9aLaYMsF?=
 =?us-ascii?Q?lFPN2LJlQz/s+FN47O1V0nP6HT2hOb2bNRUHTdol+P1KExqrBPAeAyRWQjXH?=
 =?us-ascii?Q?cvy3XCdM1WTxvKC9+o7B0wjIJ9fnxhLIGPfs/fDOClXAbRxywQrKYGQAmyqA?=
 =?us-ascii?Q?fRa1nFgV91wFX4UVxEnYHrTixk5fej23iYkf9v7JxT8RK1z/0drpJpJX/RmB?=
 =?us-ascii?Q?uNuLDttChlQLYUnf3Rx92oroaIn8R8+R7ikniNmhnwelhjAuvxpCbRZut0AS?=
 =?us-ascii?Q?jhKjJi98y9+LxUYHkgZmOo0U1Pq8Zjry1X79SI69sCbFlFgu4u5CNcO86TgT?=
 =?us-ascii?Q?RSYbc4B7NBlDLCWdQjnZqqk0FI8Z8dz4GrsjINi69rTgubLVBg7mnoTyY6P4?=
 =?us-ascii?Q?yLmDcYTurN/HPKzm70/DnEB2P6QWxtThl/Jn8n4bZZnh5S7/KyxhlRs6WqnP?=
 =?us-ascii?Q?vNywcEI8uarynYN2z36preMEn1+3RnDouQQZLvwbw7NriRpfxwxfnO9+Tqyf?=
 =?us-ascii?Q?io6aLaLLt+RUUtDSVaPo9jS4U+POL1x2SBBPCV6V?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae68570-96a8-4c87-fe42-08dd65ee6424
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 07:27:51.4634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mR8L+bhRCmDRogA6vrjnRvQbH4/P+YVO8E2vocWPpqC50xmc/6pCknubgSs/jUsy8egZhy5O3qeXhLjM/WOKwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8106

Hi Greg,

On Fri, Mar 14, 2025 at 01:37:19PM +0100, Greg KH wrote:
> On Fri, Mar 14, 2025 at 05:21:37PM +0800, Xu Yang wrote:
> > Hi Greg,
> > 
> > On Fri, Mar 14, 2025 at 09:18:51AM +0100, Greg KH wrote:
> > > On Wed, Mar 12, 2025 at 04:26:54PM +0800, Xu Yang wrote:
> > > > The i.MX95-19x19 EVK board features a USB 2.0 Type-A port, with this
> > > > series primarily introducing USB 2.0 support. In the i.MX95 architecture,
> > > > the USB wake-up handling mechanism is integrated within the HSIO block
> > > > control module, utilizing a dedicated wake-up interrupt. Therefore, we
> > > > also implemented corresponding wake-up logic code to properly manage this
> > > > functionality.
> > > > 
> > > > For detailed changes can refer to patch commit log.
> > > 
> > > Does not apply to my tree :(
> > 
> > It'd due to below dts patch #2,3 not in usb tree. However, linux-next already
> > have them. I see Shawn just send pull request for 6.15. To make it easy,
> > let me ping you when usb tree have them, is it ok?
> > 
> > https://lore.kernel.org/linux-usb/20241204050907.1081781-1-xu.yang_2@nxp.com/#t
> 
> That will not be until after 6.15-rc1 is out.

In this series, patch #1-4 should go to usb tree and path #5,6 should go to Shawn
tree. You can't apply patch #5,6, right? However, you can ignore patch #5,6 and
pick up patch #1-4, am my understanding right? Shawn will pick patch #5,6 to his
tree.

Thanks,
Xu Yang

