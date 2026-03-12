Return-Path: <linux-usb+bounces-34712-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNynIY0ns2ksSwAAu9opvQ
	(envelope-from <linux-usb+bounces-34712-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 21:52:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0614F27992B
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 21:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6223304DEA1
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 20:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED5D391E5C;
	Thu, 12 Mar 2026 20:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d/736U/x"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010024.outbound.protection.outlook.com [52.101.84.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424C7375F98;
	Thu, 12 Mar 2026 20:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773348627; cv=fail; b=ava6D7zxNe6nEm218t6Ys/c9oYYMqm3JIfKuodCtzWOyaMrLfhFEIo98j66wqwiHSuhC7/Zu2cuna1ZRJfi+hD1wYcTqSFoXG5eBBp9vsPG/p2wzRLegMnanm39PtxigGaOFbmhk+kjkUYJCWIiL2DodUtTxqDX2ij7ZGoYTFhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773348627; c=relaxed/simple;
	bh=ygLxw1REM1sLS6fpWfgnGbQ23euYM2BOvM+zpl9GaNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DMJSF1TrxkE26YKcvg1Dca+jk+Es0vJv2CQhE/0qh0n1Y2U1OLITncr4uZjKlP6o3MKWbi/lgW2oWBx++7zLO9EreoUmLHxRs3LctXNV4SvZHn+0YVkROS9Qo10eP2SohKZjzinPt23qzLBKMIJpOG/Zghl2TGolZCiHtZmAmu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d/736U/x; arc=fail smtp.client-ip=52.101.84.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALWTppLwHQ/7IjnlNCW0eGYna9LA6IQT911HBxp1ToGLrtfHNH69O6PEHWr3iwiBEx6zgTTtHcnp1hWuzih1OXri7Yrx82cp05way52lu5DYnTKT91Nbm/JMclkLeGJo5t6mpn/4xdazJdfWwtHRZ7/1E97PDoHbpTYLU2LuLMhOup05AHRwLS2Aoyxd+wXhKSh0M0oglg/g7nFIP+lwN6Q30KIlFogplrlwt0TBsGCXfpLawDWG1/HgXflO4Y7HikPrQwTTt8TcAz5knryOtVk1TTA2vawsQJmYA0gQhM03sint1ZQknq73x+z3h21QJQnRjpykz+gJvJ/rhxquPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8izCy9V5gct7gUw8eJ3SW4FjmBFftYqk01PgmByGMM=;
 b=PSUFTEN6r3IUqp9CfDQ+gKXk0kG4aekc6/IeqMsS9pmVjy6MhcDHbPhA/sNVn887/9Iv5F2y34cYMUJ/Ll0b6lDpa9J6l4gWLlg3Lq0JYyYLHlIvccxlJnOXdcMR+hqciJrAsHBkhMKAb096QEDejNum0IWgID5+stTfCpasduYX9fiAwHE86YYswacJqb9Q54o2upYZHQiZZtjAlc0b26GLukZl+oKUnQzNFZvzh8qd2Ypc6DDj4rFai6/hkpgWmfQ0zHBe1ZqGHwmpdqDzzn4K/8TMK20a1gjZhl6paDeMiH6ptZzMYtdtWJ0HzauC4halORFWqdQmE7XiFeH7eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8izCy9V5gct7gUw8eJ3SW4FjmBFftYqk01PgmByGMM=;
 b=d/736U/x4BfApDC08NCKqT0+K+ydj5cbHS1X6RlV9HpWGnUc6P9s/2+lA/lqOVa63uM45dVLQ7hwpdx80N/9Ch2taYelOXbTLzz5A69ttL7aN+aRzeiZC9eDrQk3/0IuY7Q03Gt657hZplBRfGWzsyvqzhR1PBgyRNoQ/dLPkaoK9ekgu/mOHPK65SPyitSxl9/KmK0m9i7GY/kb/SehrtZq8g2qk+OwkiOqTnVPgBRyybVnbEs/fU9J3p+5JPMuO2sEY4J6Tmn40ZFPBWPVCGYMqr9UcIkpL0tOhqun4Zec9wWw0CVmNpN4nDAB9nXi37qFncpV7XgHUqU+wdk9iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB12390.eurprd04.prod.outlook.com (2603:10a6:150:342::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 20:50:20 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 20:50:19 +0000
Date: Thu, 12 Mar 2026 16:50:13 -0400
From: Frank Li <Frank.li@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Li Jun <jun.li@nxp.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v2 2/2] usb: typec: tcpci: support setting orientation
 via GPIO
Message-ID: <abMnBYDni37G0OER@lizhi-Precision-Tower-5810>
References: <20260312-support-setting-orientation-use-gpio-v2-2-59c523a09f12@nxp.com>
 <20260312191243.3479247-1-Frank.Li@nxp.com>
 <2026031239-icky-volumes-f4f3@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026031239-icky-volumes-f4f3@gregkh>
X-ClientProxiedBy: SJ0PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:a03:333::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB12390:EE_
X-MS-Office365-Filtering-Correlation-Id: ec18aa15-d8b3-4a91-6c9b-08de8078f8f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|19092799006|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	KaYPh0E+B97zU+rXCpl1VcyfrJkKlZobVuLvMrCtD6vkfeA/U+nG8PzLVotF7dy2NCxKzuqb4IpJ4GF+R1FhrSWFkWpBFw0HgCqTlix74N0iAz0STWjfhNBPS6iD5fHDN7sJUz47SiGiJ/tNoXIhDARralqzxJQIg3aek3FRyfxOmTm++7vRmP/fR/MK/xgJzAuZlAjxHbt51vXO9OjCgtSM1Ea5Xqy/2UxELov58Bbf3vw+OoEGgeNsK4QieKA60D1WoO5q+uV2DBxFmBDF5kM5cEU7DXt5f3yldSS9aK+9RlLKkE/sZxXcaQGCZ+xIOd+TKpwkGeC8Umh4fvaGUmUEMq5KXG9FIYDIe2vneDgbAoMj9ylKJU+CPL5a3NqSAkYyCav3KRbDSOOAgVVtDp3zgdeAagi3RepiD3zma0bBdaSFYUGx+Biau1ZjDsj7VQ2QkJPxU8FtcOiE+5lLyHeQ4aYka2frPbumFU2F8KhIlpCtLcAridBszlJEtdsXLFFizYR0BVe1DHj/exBnzB9FeqH/lmC5dsP1JioACbJhqUo7hcuIMFwr1yxsA350uF/cXTurqIGM4lUvZIF7rNcS7zS01fjwX2V4colmBilsNmLAq/lqySxTAyHCMtn+CsoTGbMH8j/oDG3JvmmjpCh2SueB6WcTPfr6Q38mkzXhzRYeONWQz1hcGW8dBiIbpaxNuZIVxk2BKENHCgqCen7PXIfwYnqmgNJy82nogMo8OlhpSd5rdUPAnvHfONI93Zkxpn2mYqWEadvWzumaW/lofSx60oUFkTwOWGmC3yA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(19092799006)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LEjt0XbJUua4NXh3NlKmVF/OKeK5XV0u/nwFscDIn3mHCJwN8xe9aEvjKzRX?=
 =?us-ascii?Q?GVlzgIXYUfMYgr+Undzz+v1P7otWrctQRijP5nDS5+s88eVU5J66nkN16hCZ?=
 =?us-ascii?Q?WHqQtCjFXOZwuU8B/Rc6RIighLNleJhu2RkEJTjr5AXRmA69M7Os62+zsAhq?=
 =?us-ascii?Q?/nwsaq8B2LlmbV32CMLhmDwPVYNVxikqN83RCJ3TlkpfHPxJG+c8Km0MAXF7?=
 =?us-ascii?Q?n8cRJsxBW78OPbYo2cap/KqG0wWWA4tgaSbjlz3LY7qTqdWoFexQKfggj7p8?=
 =?us-ascii?Q?rJuWTwKbVAzrIGwWHcctrzqY61dr5ln7HbDiY4yupeSHg28Ce47Le2pG4pd/?=
 =?us-ascii?Q?P7UgDOQN33MzA7UbUNCUM+8yiNjA9dbWdQBjDXIGbWnCkxl5oPj0Pu0uaXZI?=
 =?us-ascii?Q?R9LtQXzyESF6J/Pg366Up6E21oByIAnx8WROlO2U/1uBdJHOKlUK9P7UwWB3?=
 =?us-ascii?Q?WqNxu4gQt7hEaGGvELAjOGILJsgRS/miZLVUWyrAMPt4kLo1XxywXh59w0Xz?=
 =?us-ascii?Q?eTAlPTYCyEn6s863bEITsx/2yhUiDwXhZVCzsn3lF1EoZZJXeX79mdUF2jy8?=
 =?us-ascii?Q?1EkBWr4VzHCfBQ4CbowS8JQ9wN9tIPOuUhjwu3hwaFeNdtyS9uZT4BqRI09t?=
 =?us-ascii?Q?PIF6F0+jaPb8tZS4eTu9w5LCDKChvFCKvyCA1sPReustdJqNlMwX1ArvSuIa?=
 =?us-ascii?Q?VU53cIiOYigbJt0f/xVpC6CtaIw2Z21pL3Kfe0yEvoMeTr75Mmo/hpAGdVbY?=
 =?us-ascii?Q?dzDCJCKUHR/Occ3bcIhBbZGdBOXkzcBSl1GsGmATNqEeVUgdsMTHjq0LPkEI?=
 =?us-ascii?Q?mgeEb4O4Uwc0ujPZMVlf2NTK4kNNpHei6/jqVvF2cazyKFzBQBb2hkFMpRtk?=
 =?us-ascii?Q?mlgwKU7UPcCsj5WHfrR/0bLhYeWFqhRHMdIaTQyVJ5gH+CIbJbhT3M5+AtJg?=
 =?us-ascii?Q?UnTyXrLSpuExue9yTqbqc8ffWbZvrvAWfA7WeXvY5qXJ6oF/Xjg2y0H7oZon?=
 =?us-ascii?Q?35Aj4sVW8rtrcf8bJksMrv7y93s8nKBdNTC8c4Pz49BBfMaelgXJwnAnxumn?=
 =?us-ascii?Q?lx5Dp4pRX3lEn0vRFa2uQE2mElFKIR4KLhy/N4An4KfKIS67VTBrbmqImrvc?=
 =?us-ascii?Q?WVgR68N/KqSokXGwNM9I05wa7Q/WVlisqnTOT66FT6/UUzY69O/yHrQjGNP2?=
 =?us-ascii?Q?mc42YESsevRiFinLAJMv147iaWgFOIusaWpyycKb89q63Fi3uaKqXuwjijE8?=
 =?us-ascii?Q?reZJAlsfp6e9Gvrn+wpnAlzyJIOmvRxAhy3zby24GHlszjYgHawNErxLveTe?=
 =?us-ascii?Q?4n+gj29WQyv6uaKMbC5DD7XP+qtRthOq8MQPTR8URRdYb1dFwL4FidMOkaPR?=
 =?us-ascii?Q?tZkCPgZEIbisewosL9x4Lfp4h3CxpC/0bfNO6pw9uCUPO6RP60Y73edFjwEI?=
 =?us-ascii?Q?ndhV+x63rKkyJwlXBN1YoSoCE90TupiQWbhhJ5v/+NaQQZbthcb8x+3wUWZO?=
 =?us-ascii?Q?ZSaOrPpvJWLxdxkQPLyCvY/k+5CAVtWIeYtRCrtIPL7zvdqyugAkJuWf3N8a?=
 =?us-ascii?Q?fOIoTUNb+PNT0sjPjFSvxw6bjb/JDFk2vLYLcM6Y3UjamkQFuglSVAx1BQ9s?=
 =?us-ascii?Q?Nuy572Y4iVqDazCD9lyrVzYUVfcJC1iXCde/ey+p8Qlo/lHOj1OHDh23pM+S?=
 =?us-ascii?Q?dOLoqBB8tpTWWiK1fxN8LGSNqYdXM+Ooepu4JA3cRK84TdDs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec18aa15-d8b3-4a91-6c9b-08de8078f8f1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 20:50:19.6156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2S8mGbAn1SoLyeBvq1LZxKx85otRCwE5x0zXX5fTgBJZ/JrRMSrwCMEu0sRlgP3vdjHQW7jIg5zdcFsIqd7jDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12390
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34712-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 0614F27992B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 09:27:09PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Mar 12, 2026 at 03:12:41PM -0400, Frank Li wrote:
> > From: Frank Li (AI-BOT) <frank.li@nxp.com>
> >
> >
> > > +		err = orient_gpio ? 1 : 0;
> >
> > AI: Redundant ternary. Use `err = !!orient_gpio;` or `err = orient_gpio != NULL;`
> > for clarity.
>
> Better yet, never use ? :, just spell it out with a real if statement.
> And ick, do NOT do that last option, go kick your AI bot, that's horrid.

last option is bad, I have not remove it when I review AI's result because
I think first one look good. I generally just remove whole sentense from AI.

Frank
>
> thanks,
>
> greg k-h

