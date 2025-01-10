Return-Path: <linux-usb+bounces-19182-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACB8A08893
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 07:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CA70168C4B
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 06:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297A32063F3;
	Fri, 10 Jan 2025 06:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mVv49nxH"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2079.outbound.protection.outlook.com [40.107.20.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35591E507;
	Fri, 10 Jan 2025 06:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736492045; cv=fail; b=el7OrYCBSXoCN3bsuplsoOLa78L9XkJmdmvm0DPCXb4G0F6UXfx4bsQqq/bZeDUPCpQFg/uyGwcgahLy9hJyOMR7SjK9NPXIqEX1/D/R1clbBj9/FALHsoZV/wPjecyQYMZagblSe5t/gedm12qu5D1aEz56V6/yaW4Z1OFZ/Rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736492045; c=relaxed/simple;
	bh=exRS5WVas4yQZ+J/eWil8JVPS4xKJq0kix9TtBdfqx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iOlcBcqkodXViLPadv+Ky2wiFDlotyID1S90aTF6a4U3ZPCpviE0BLKKX7RpxW0MThB3s1s3pGgNSwZGV0Oehp+By8pVgk23ORCV3CylhA669kF5OayntP6GvXWUOTF+BKdTT71WaTPH2SFT9+RXymlIcbVgDTgPKRqJcVIUyWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mVv49nxH; arc=fail smtp.client-ip=40.107.20.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9l1Sf6VFPihHgBnsQmL6jvEFX0wy8pNLSeD2Hk54q7p2ktaaiexU4dRiqG1Re2+bCq3Wdror6JQ77eBzyOM4G9fo2z+rSzYAJbVaDiCfMfXOMKdDOTgVMvX8MECu9UCvM2dRZbsOf8NrnB32YuMl4+MvF9hGLB15lrEBzlRUheGLxu+3LOzhVoPm7+zJY2+S3orGZzrEWOvykaFHhFvp3yVh33WGZWkiwLFt7JeMlYlAWEkByIX0TQKgj/6iWi54GZj/1LQS2Stt9v3ZiAb3O7J3HSNIS7gIz7HiRsykK+rrPjpAPODU4yc57k4UO8y9UEfBJ+VnhfwajfKKTwblw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hj83D0w/qlpTY/VH4zQvx+QJSu3Iia8iUYc8uQxeBgA=;
 b=phfOconnRGR4aE7nr15WGFwySEEecqnBnhBsu/AgWyQGKOzuJmmu38o1EjtjXBjvNL6o2TrM0elIyD87nAxBV6l+ooW+xdN61M+wtvPxT07yuR9LZANQ+wN0Lsd9OTyUf0XKLoInckLXrPfHooKaKVBj08vRMAXATIMLhC+Px20nPZADkStYMTC04zfrlruaE+7P8Dq9BC2qpwSqbK4y25C5uMur2KDGLrxtF2q3dJqHK9TuxCUXBFGHlSByn+Ip8qd440L2VdLOEUTu2bTo6PBG70mBqfISZLamdPupUFm2R7hA0CzagrhiSK8WOLAA1zEXdUzhlFUrL3+Y1mu2Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hj83D0w/qlpTY/VH4zQvx+QJSu3Iia8iUYc8uQxeBgA=;
 b=mVv49nxHny5VY1O3oTQx+bVcSKki8lFKohD1mPr9C94lU57eO1rQ7sfxgxUrjuUh2hbuV7oKiKt4dohd+kuIiOz5rmXGuEOeVbgREMF3SdOpcwvFzHfJzb0X0BJ+49epMtrq/w/a1lhuYQ/M5mSFy+gPZkYo1aKJLoIlrzi0Vaio4uEYFYvMx0hfe+bqHfohBtXJNaKfdUopgxNrtcPcU7kwcwW4L+sLJpJW4Ir0m4i0Nbj4C6cFH3JFfaunlLm2lUqEC1PT/TvFmQTqyzzSgk6Bu+i8v6/sGcE6l1nOc/LDJcuKuW7Ivcl4vI4zJVmdT/kSsxY99yEYDV9ybm8N9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBBPR04MB7689.eurprd04.prod.outlook.com (2603:10a6:10:206::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 06:54:01 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%7]) with mapi id 15.20.8335.012; Fri, 10 Jan 2025
 06:54:01 +0000
Date: Fri, 10 Jan 2025 14:51:01 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: linux-usb@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, ritesh.kumar@toradex.com
Subject: Re: USB EHCI chipidea regression on NXP i.MX7
Message-ID: <20250110065101.qxajjnu3fek4mmty@hippo>
References: <20250108093101.GA22448@francesco-nb>
 <20250109073500.45gge4abb4h6mmay@hippo>
 <Z3-U1DXdMQ0eZaW2@gaggiata.pivistrello.it>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3-U1DXdMQ0eZaW2@gaggiata.pivistrello.it>
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBBPR04MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: e8e77d77-1fd0-49fd-8ed2-08dd3143905f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1aVqnpkfspQJgIGTgGEbTSclumOq/HQFpfpQGRlTkDqj0fjYcj6DSsJC8UU2?=
 =?us-ascii?Q?lT94pSJd3VR78rQxC7B7U+yvcEmSvBE/4E+wLWFsCckIt1YGIKAWVhXp4jsL?=
 =?us-ascii?Q?M0m+gDrhzXHiF9+xTQ6ghxdBLUrGOOa+2cfB6QJbcHagzvB1MkpobQ61Zhz1?=
 =?us-ascii?Q?sHzs2jnb5f6cO46WJSIJ9mRqdOLE3M79ISGL5GijQ4kVehKSXF5yKVfqs3tp?=
 =?us-ascii?Q?m8n7G2r3pW3et/g3RS3c8fWWhR6SWmuOInHCeCdGNlC0Pc5PX2hfl7H2mY5o?=
 =?us-ascii?Q?NNbrdnyWsdWJBAnagF2uky+1NQwrHy5p422N2Pm15ApAXfZ6lIysIyl9BCEH?=
 =?us-ascii?Q?MsvoI96Ia1iZYUgjpj73StHm4P3YqJg0HGhKav0X2rn7X6CxC2cUqXxWiP80?=
 =?us-ascii?Q?44ilBpddoYu3UXnn6ZUMKr7p4MkdnI4LoYoUbCB771bqL8KZLl87xFoZhOvl?=
 =?us-ascii?Q?Z6kga7qHVMmMjQ5N5mu8FjzCdou0gDYOmal18GhfduEZogj631JVzjSwnZlz?=
 =?us-ascii?Q?dZjitgxS5Sv563lQvbm4Nawz/t6iuhLozx1UHFOUSC2ybfDO0/jD6sh7kvfa?=
 =?us-ascii?Q?FpP2Kgkt9XCXxgUyk0lbGVOvTvvPqlE/dhROHFHFG0M8ggp9KepxlO61xF7I?=
 =?us-ascii?Q?wmJYNgb/UcjESKzb/vJFYjBI65XyF7a309V4Mv1PDUSeuuAEcDi7q3PLdnn4?=
 =?us-ascii?Q?Ed7rU+ZVJcPvVrEv7bMLnWC9dMXcKJPVDaHQ7ira5gt9qYEkl0sY+G6Vr2YN?=
 =?us-ascii?Q?RwLPH1Q5azuNM/hEnPTNXsIV8hKiZ67ZFeOcSdaYaoWxwbhPi2kEBsBUm8NF?=
 =?us-ascii?Q?tXEtS/Aua7fXXawBvksI2PnclWKxaecglhqJ1QotAvZMw+FkXRviWpmZlmZT?=
 =?us-ascii?Q?ElY2r6/k0+Hy0DB0m2KoBy1NHhB96T6y4+LavEeW/hzKVVKCpPTqj6hPJHGS?=
 =?us-ascii?Q?hmIbEPZKlWyxC5My47s/lFNzl4kx4b8soXDHPgnO/wsIdX/lMQ3jVrVM5bOS?=
 =?us-ascii?Q?TSSQo4L32r8V0DUKlOGnI8G8cGIy2gpf0f1YLJzs037hYDsN4NyrNr93U9Jy?=
 =?us-ascii?Q?2h9x1HBgN+bpzeha370O0hPPbjUfYiSKmNHDSC4fvR8odfKc45eVW4DYkU0C?=
 =?us-ascii?Q?jlylBj/Qbjy2+SzU5RJrnC5IBvU16lhQguhVcZtcqZ/PjIudgpsYswMzPfdd?=
 =?us-ascii?Q?Msdx3df8hz4Sgv+IZoLznO5xejq6uMxTkrJrBxXj3c1AzCKn9kKQRiLnzYRW?=
 =?us-ascii?Q?bI+es6IZ3a308Gy4AyKQxjQJnu3ZIlh7COMzo3wQBgyrfVUvu9cKCPYacYib?=
 =?us-ascii?Q?iY9dBzlBRP0O2FCw5VNZct8vXco1jRS4nH6Yq0hRlDMEBycQt8JOK9VzltxL?=
 =?us-ascii?Q?lsSFLUPjbRmoy1noiCPW/3uuzbiE5BrWG6loSdI8EwAxHUGA8pIW1zNsBu1g?=
 =?us-ascii?Q?AhAXwSHQaka68c/zmKwJX1BE5hGaZHpH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NfcDWQsXlLEQ6dza9jdUpjYACfF4UmMtseDzUkSEPWSmFn1CVmVlviwd84D/?=
 =?us-ascii?Q?WyiV1nLkfQVXuaQadzNMf+PYsDt11vMdFs/tOP1TPhAWop/LJPHuFhBNUC3z?=
 =?us-ascii?Q?F4em8uobxeM2kszaZjcJ7ZKII3jdV5ONm1dl9eTKVbOpIWjlT7p6wfW0BBle?=
 =?us-ascii?Q?yoxh31ENIaVx9h8wGYl6rgnL3++uu43ctGo7Pr+ZtqXxmZkuqxmCEgQS/8E3?=
 =?us-ascii?Q?3V88wRDO9w3mQXSu6g/8/icbAUCgy9XnsOuzQd4JJdcb2oAag0Tcf5BHvgo/?=
 =?us-ascii?Q?HEtZjbrXJfquSUWS9sFoU1hTGPwn6HSWI1oc4XwPa5UiQmubG53WD91TwTss?=
 =?us-ascii?Q?QQrDpB8UZwJIsUKZ5JqBye/bmk3Oz5HLWu1LoM/Hnla6pCEgSGyVJVWZ5KGN?=
 =?us-ascii?Q?0TqrNGzR+8+kPpFk9znuBSH9fwRO7bQQ5To7fbf0NhYU+N5X45PLIcXNl6fM?=
 =?us-ascii?Q?3GfPhSpNYsC39bg3cVWBFIEDVF1eDuARWhJbyosnY4O/Ij0rZifFTVrmRCcd?=
 =?us-ascii?Q?/1gMTAYTEMzp2sMKMAeiqLWT/Jh39LUPGoxYSzYq/cZPHdB2NDWDIVYmqbrG?=
 =?us-ascii?Q?pLxTa5G97bvMEXMH/3MULKAVjRW9CLv3u13iLKOo19fcWvjJgrdYUwOz0Xyn?=
 =?us-ascii?Q?MJzN5cd5Cv4tgSha5HHhYNO/iKluT8h7iK2rYidSYy0fBhyGZ8x56uuPGdMc?=
 =?us-ascii?Q?XyY2wJTSpn3uY+0jsjz47LikdzFpQh0TkcX8kbnc8mgoCL01wazEWVHsVpIW?=
 =?us-ascii?Q?mqZ+f7eP7aKGyrChHoebwAg44fv6XJ+A/5jIAZ5+AKvpcyOgm5ueA02rwxt9?=
 =?us-ascii?Q?YkwCN7mk2UaBvcGv+CBWo/L6/iIMBjrlsnqa4S2KWDOTNkKANMiXymVA/90j?=
 =?us-ascii?Q?avq7BGS+JwCB3hm2puf4JVZ2SOcYka2PqVQSpIT6LWAISQZcDk61Cqv7UMY/?=
 =?us-ascii?Q?dGnaVjJT4cmhjDPn3zjEbvn4zsmJ/AbUBy7/JFPlIB0AJ9xQHFqkiOBCQc1h?=
 =?us-ascii?Q?hFlaAzWhttVrZyMCEVVhxZ+dJHPj1BjiiGk+7dvUvBq5MezHZSAXa6NR4kaG?=
 =?us-ascii?Q?fS1MJWRWAtQrH1PIcPQ9b2G8JBUR8lyfjnWEMuCiXurv97I/jrLjpAjG8/IB?=
 =?us-ascii?Q?hsCPcWAbmZc1A0kpqPbTKgk5xGtJfQaxWlZTzdIaFldHNit4zqGrs/1qkr4x?=
 =?us-ascii?Q?zaeWExWC3H04UpITzPwJovC9igiVGWFCBw8lX2J9GDlVJNPC0C/dST4LdZzO?=
 =?us-ascii?Q?OjHv+maIk5enCJoP77YNS1BXz1Ce1YCaYJZqYLGRLvGUXvVWiR9WEZNiroBp?=
 =?us-ascii?Q?gk3wB+kqDwrIhJ1/n/SaCtVH7NWtI8D1soF8Sa2IJvqOVdyJLJsVb9urZhff?=
 =?us-ascii?Q?BMGOfPwtk3tQrY6B0flNFOV3mbXL6lDVW4JbfK8RacWP9T3e4axc1ESKajhr?=
 =?us-ascii?Q?RRHvv7nDkHedjWkIab9J79Pec4LoO6WjE0wutlXcbMpKKKgU0Hy9appoH5Pp?=
 =?us-ascii?Q?gfePSqBy8mVizOE53eWFu4BI79kJhxTEO0HLgEfa21OX/MJMu1iaEuSdPDRf?=
 =?us-ascii?Q?Qhgg+pM8VZmt7S5ppOZq5HRyjH9Q2lolCU9LQuks?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e77d77-1fd0-49fd-8ed2-08dd3143905f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:54:01.3339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fa9P0OV3eG/5rvh+90S96TMHlnJ/YRcTk9LNwX8ZI5H3nIe3YiLK4OhdfXmIhx9YzpvK3gz3gfwDPSuOx8o2vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7689

On Thu, Jan 09, 2025 at 10:20:20AM +0100, Francesco Dolcini wrote:
> On Thu, Jan 09, 2025 at 03:35:00PM +0800, Xu Yang wrote:
> > > If the USB port is connected to a USB HUB, and a device is connected at
> > > boot time to such a hub, the following errors are printed and the USB
> > > port is not functional.
> > 
> > Does this happen 100%?
> > I tried many time on i.MX7ULP-EVK board, but I can't reproduce this issue.
> 
> The issue happens with i.MX7D.

Then I think this issue is not related to that commit.
I also tried on i.MX7D, but I still can't reproduce it.

Please firstly confirm few questions in last mail.

Thanks,
Xu Yang

