Return-Path: <linux-usb+bounces-36494-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNniKyba7mkPygAAu9opvQ
	(envelope-from <linux-usb+bounces-36494-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 05:38:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 236F246C715
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 05:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B478300B3C6
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 03:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2FA35FF66;
	Mon, 27 Apr 2026 03:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="Zq6NlZ4w"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012071.outbound.protection.outlook.com [52.101.126.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D566135E92B;
	Mon, 27 Apr 2026 03:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261087; cv=fail; b=NChSSqaXKTL5VyP/wR9rLI//p+b9TvdJz5rgeM5cXwjO29mwrEaSCKaKNVENkeQYkHkn+Qr32BCGKL2HMeBIEUCMxsUXc9OTiJNCWMgbhUuGEysj7Mbx6bBC9hpRLLYN4uBmZi4XAeBU2C72beNwxolce2kVjYbFAlIQhDN1Y1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261087; c=relaxed/simple;
	bh=QAiiLZD7ufO96ekpzThzJfXMa0GImoT/mSmFm2OaXxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qxsk5WhlcOUAhqnwzPi4iNCLhforW73ipYYFyPTGnfYpE0BeYVnfqQ2O5bWfM7M2TRlnkxZKzzOzTlkNncaqCv43xb4AYDfzpSfvDfhg90u1/yqzxm51LgzTr7E3v9FevIqtWWPOHoTAcJLacIGxzlyB5f8hn14Z6bgFw5WmjLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=Zq6NlZ4w; arc=fail smtp.client-ip=52.101.126.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3mXffNF51FKVqY51VGDjCvdFegPnhwwSTrJ/IQeE3SDQJfHVtGyjtkET0rH4giWdEBt8ps3MQcInAQUSFdFaAyM1qVM5+6CVsIFSaDbMiZWQ1ZXNET36mxZRC6g+bEWUosyFdP6jwVOy8QdbMe2CpcymujdVHOuj9upYICxWkHK4oVjwSS+QPtYHq1CWb6V5FtejRlKC59Cn3VGkUzOBZm6+Hvrv114DaVWRSYLjNHrpWqLMzH5IkA9IiaHsZXgIfrGwnHTZpK5nr8fKR2bwbJfo3lfM9TsoAZb4oNbU/slyO+NL+PDwJLdgu51Fqg++zav7gZkxJ9kLDPP057Veg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAiiLZD7ufO96ekpzThzJfXMa0GImoT/mSmFm2OaXxw=;
 b=U9HpApVeyjZWUbwhoi3+0pFssChebF6STqe9xgIkJ13f9V8CMZub3n0F1aGe5y5KgiY5QIm0aZVXybbv5THg0tzb8NJ0fDGhP+umtCFIUM3noWuz3gE33yXsG7oRf14lJu5OK2xqldQySCuCwhlOgezsF6uNqgRKXSLSU30C0DGCq2FjvzuELDNMlr9Pe461tdwLgmIBi3ofJG7BjwhFhu5/TFcE1CcAIMlLJDfqJnbdGjExawf5akwbKv+zQp3S2dxCCpeco3wyqtZoKtZAv+hCEyxa+9G/uuKcWJJQokT+StHj+WuvfrhIGJnef+DKmrJwdx8WGnVoYoABdG8bAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAiiLZD7ufO96ekpzThzJfXMa0GImoT/mSmFm2OaXxw=;
 b=Zq6NlZ4wR/VccJOzcW4eJ6nb2Ssk5JiOjpCWWkPgBwgHn1qPcVxQap6FIsGdBJ6CEuN1EyL1VtIH8UaJWPonrCJTx5MROBUdSWyfcXk+WixwwIIVmi8DZ6nXUOr8XrsP+7pBo9PjMPWzn+Lj1oLmCT1f1cTxcFu5wd/AEKddpZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TYZPR01MB4762.apcprd01.prod.exchangelabs.com
 (2603:1096:400:288::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 03:38:02 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.20.9846.016; Mon, 27 Apr 2026
 03:38:02 +0000
Date: Mon, 27 Apr 2026 11:37:59 +0800
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/4] usb: serial: mxuport: extend MXU50U support and
 runtime controls
Message-ID: <ae7aF6CjtEEOe6Dq@moxa-ThinkCentre-M90t>
References: <20260324035041.352190-1-crescentcy.hsieh@moxa.com>
 <acolFoqcYDuxwmPX@moxa-ThinkCentre-M90t>
 <acosTjk_TV6r_uz4@hovoldconsulting.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acosTjk_TV6r_uz4@hovoldconsulting.com>
X-ClientProxiedBy: TPYP295CA0016.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::8)
 To PUZPR01MB5405.apcprd01.prod.exchangelabs.com (2603:1096:301:115::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|TYZPR01MB4762:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b2657f-a5f3-44dd-d3a1-08dea40e627d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	lmxdt3eOoIw6NvGFhGCGMVOxLQw7PAJHUWGalce0/XazgKmn7EqjpqG2dlIF5x/Vz6VNmpHSI5TTANpwEDxv9TFliCvccbJ4rgaadWAN1G2ytY4UdsELUR/vW7OuHR7RWh0drwDm6Vo4fLuv9//FhM5/v3ZKJjf0YUal8CIyKRsHhMJZ9eD1osf+oQjib787h6lOGt8cYAAOvCJNgPw9kWjSX8nloAOJ4x7sgzd9vasewrY29zXHmFzcNLX2jqVASUjTFQQi3XkQp2rxb/ErdwKoBJsbvSCY/bn+d5mNCky3WMfyB939JhHiVaXfV4A9SbwIO9b6rh3Drf88FscRGRTfZqblnHINiiN2rbz1phRKOu5wmSplkFXheyj6N+Kne0iOcEQMFX5VrkyMb3faQFw9IuVlw8gHKNLH4hdJDSOnKI3KQsJOiZP7QOuM0Oh64J8JiWLvHy+wAS3Ncexuk5KHLkDdPpfysM3rTXN/LiIoMMEIAJFA8SkWYVwe58PHah+IANoDSTcijEbAvQiwaHxMnpBG8NFgerFB9MWoEHSVXUAQs+zZrsqXVwa7Bv0Co1cU70ybXK8gOK2Ol6YVe+8eh1wIY3GwSAGCvemCfYg3SDGvHXP+ippNzU9gTff/oLyFcyLvXaBRavWE+sqNFhFuREiPC0RSY0Jp0KpCn1cdMKwK47sAFrMe6O6u3X/CDsAJHh2lnaMzhlo+eQUvpsZzfB7r3BT9++UDUZo6cEg4nw+znBBrQzmrhfpso5fRhY8NlxKnYb5/cRzEB2UuBog/okZygPLtKZnEBMjm3wg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?StMie+T+GiMLy/uEPcmK5Ldc4oQQFAd4Gb3zRDKembaeZrHFBoslVaRUUUoh?=
 =?us-ascii?Q?Lc3uXaC13pjSd1dAVzGm/V7UF4aG61ImsX904b/iITrUqMmnMB5hCxxkEx0t?=
 =?us-ascii?Q?BEwXAYt+PtKxKJ8lBA4etREKe1KxMNEvdS5ss0XYiVQ73qnL49en2sDts8Qp?=
 =?us-ascii?Q?eF7fKJTSWqMNKnxEAuM9H1kCl9+a2mSxutHXcLLKD3CmVjMdLZT6GO3l666V?=
 =?us-ascii?Q?oUXz801C1BNojfid/X11Uv3kbAsPwIulX2yEaO2gzS9d0nHSXatUl/al8v9S?=
 =?us-ascii?Q?tqkedpaj8fqOxdPf5biV0C04VF53ljlpyAIl1kZboKDpjgiuMYrGfxF3jx+w?=
 =?us-ascii?Q?owy5tsFkVx862cLFiEwSvl34J0KoHIWaZeMYf3Ke4tWLFIdFHNfkImbtNerG?=
 =?us-ascii?Q?a3kd4CMfuJ3wt05wy83nFdkFbbqeEZaPvIax6pFI7CCmVqVWKYmabhLiJFl9?=
 =?us-ascii?Q?bxBrtcXYPepTWPayDsxjxEXghKsP/FrmjfPKOt56A3XfHx70wLqWSKqTn2hk?=
 =?us-ascii?Q?D8x5DNBPPS67XHWdS1BcIGrfyvJM6AIf6+PF7PX58RjfXt26Kzzn5mwCxIw+?=
 =?us-ascii?Q?kiTmmfdV8BnTQ0ilVtcOI/LB2VUABj4882dPg88h5+8a3w5qgqtiRf1jsf+p?=
 =?us-ascii?Q?fpQEprOritGdOW7Qavz7uiR9Nt+ciPtf1saQ4DpWfsCJ3hsvyzhCGjE8xKWf?=
 =?us-ascii?Q?AdlXfQUM1I+E5s0Hg7igFsL+AOzBHdD+MFGL4zx0CBPJBVA5MZ68bTXnG+2O?=
 =?us-ascii?Q?SMF0MvctSZTzCP4f5TXZr7djG9iX6lTP93NIZI8imb1jHIIb9JFzkWN7AeHg?=
 =?us-ascii?Q?Y22/nYUbysrnj/1mWO3OHXEu+7rfFPChwhpDxo5AuUGT5No5mayoj0T+kIK3?=
 =?us-ascii?Q?czY55WYadbbok+W/6odcf/D/5otYxV1JjBnyS3RyNE0tufJiGaPkw198DN+M?=
 =?us-ascii?Q?HxpiqpVvQs1/UmqFt3RH6tyYo/5LjirIiUFcXw+Xx2Ef6j7ZoyGhjNYTJQpr?=
 =?us-ascii?Q?9ey8R0CJfXx2Kb+x65e56IESfJdFx35WuHHzpxpqkiXIKb7HG46jzoj+9YNe?=
 =?us-ascii?Q?3BSZlKoPni0AeQIQxjGifwNujyMW9dlD2gDpMpQchNE3y4lUn9jLKPGx+0+i?=
 =?us-ascii?Q?6nP1gk/0dNawqDYWSPn2xEqc+scolbAhDyf+aKdEq8GS/rpBwUmSyZsHeqwc?=
 =?us-ascii?Q?BQhMHyahwARs6NXPxot4UTdmPkMVqdXwc69AfPeQkRqmDvQyIhwdGIzaa8sr?=
 =?us-ascii?Q?sGUwJ3+rmVIbgpJKNtiXXfI7pEF7c2uywrKPt1ByhUDFtl16wTP3uaF4yXl5?=
 =?us-ascii?Q?fIHeH5QNb5HvB3Z4s+PRJQ/cRN5Nbbz0PJ3zfiJ00iRyWvZ0WAsNQK/jYaP8?=
 =?us-ascii?Q?yvPor9i/aa3Zo+9GjFD/3QjMFy2xlnxHWQZIBNO+zSe5ST0kqmMTqhoObumC?=
 =?us-ascii?Q?rRJIgcAx5e8LZtmJvQX2UUotK5CDeFQsPvs+g66TU2BtEPWryeMJTL03OvNp?=
 =?us-ascii?Q?MSaLHJ8NxcZdlSGj3r8HAVCBPytkOOgRRHKBOo4DgAhVEE3ja+oYbXiFtpbJ?=
 =?us-ascii?Q?EoWWDw0i8AKZk6V9Q3UYbe/iZFVKNSUMeVb/ID7+gJQ1m1h1owsuDK6uvYi3?=
 =?us-ascii?Q?LTMf3eXyA/gVJDKDQBTvNazBygQG9VqL2NUy7BngIDzkBJ5ZUTHF7PmlCh48?=
 =?us-ascii?Q?bNf4ShfrzTtWrhSutd8ZpOVSFBaUn3DYiv4M+4Tuf0/TK5KaNUUdQz1qhjlD?=
 =?us-ascii?Q?mnbEpil+HPYi/KNMbIazSGB+nAbMZJM=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b2657f-a5f3-44dd-d3a1-08dea40e627d
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 03:38:02.5205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RA7KfgJi15K0SrefWuuPFv0roYmOmy6hFr2QbBKettITtv8wrFzuL5hYyS/ToxuVlgfWx0znAT0TCvZ0arzZc3F4FOvhzJIhzga1j19WVow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB4762
X-Rspamd-Queue-Id: 236F246C715
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[moxa.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[moxa.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36494-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[crescentcy.hsieh@moxa.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[moxa.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Johan,

Gentle ping on this series.

It's been about a month since v1 was posted, so I just wanted to check
whether you've had a chance to review it, or if I should resend or
split anything.

Thanks for your time.

Thanks,
Crescent Hsieh

