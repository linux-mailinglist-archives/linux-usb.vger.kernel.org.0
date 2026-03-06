Return-Path: <linux-usb+bounces-34145-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFsaO8mlqml6UwEAu9opvQ
	(envelope-from <linux-usb+bounces-34145-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 11:00:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCC521E580
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 11:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0949B30330D5
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 10:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03206358393;
	Fri,  6 Mar 2026 10:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bLhUMUZs"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010033.outbound.protection.outlook.com [52.101.84.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141C6358398;
	Fri,  6 Mar 2026 10:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772791237; cv=fail; b=QuSakobZLzSHiIL17ey99zROrMk6jRk8mQVFindPofH34sJpN2x+/9gWJt1DwCvKi6kwALJ5nRhgtMDHU4+LB2Re0gyhR3XBXf0gsfiJx63fiXjUylhkxFBmQVmQ1Vr3VkN2OFvgYDM83Td4Gnodk6b1R9H79vy1qkAQUo1L58o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772791237; c=relaxed/simple;
	bh=5kEcMMAqq3wk9UbHMmLpXT0EaZhBLZlhqsPNnSjlfHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AF57ZjBlpqez4+LYo9iC3rCg+EeCHgzsXuR29eZw5V0ASIPjDItnNDu7vYNh0Cro11M6Xjhf0rQZojUGOME918+5BA8kW31F2BPgRkk5VVXbu5KE0Bgj7uJGhj7vMGGGglg5bdWRmsHsx36DQAXqWXVeZMiomoqxi4IFbQkLAhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bLhUMUZs; arc=fail smtp.client-ip=52.101.84.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zT+5EhdJ44W89YtXfqy7YLm2P9ZtPVt1GVrZIVshfDHUcQ9o68ox7ngjX7EdPtyzmP5cS+TXJm4zMG1j/7CvEcVi6NgNDgGOJwVG0MYagNHODTCSsxcHWlWu898JFi5xETXPUA3WoQSqAnekHlamptlJeuzRhdmiAlFtUDw0nzf5VXJBuffQSKcdYpIVDa25671mgC8HYlnZPetHzJaX2HVBY7itFrAbD2fIu/EeJFUHfWxkCM/9mbuSHXbGlia43Lmpf5MIVKZKDobPJxrK7glX5Jc74BOIhwuqTztCvC/M8J1uE9d6l1OZYKqgR4Mb8MH+SdQ/ad71oTwz6fGFPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpZgsZPq+V/3lvQMNBzsU1cq7jWqPV3L+GL/vXywgns=;
 b=tLAFZLZ9tmLPXaR9FZdUwwtOoXA3Wx2Nmc8NAoY2ZVMHyjFw8X182YisiPECoPMmCzf+PjPwQz7Ey5eRW5Zv37H5rkvqImI0ZJB5DRKrAcsWoN3XiPLaBMosmRBG6DmIbWGpZN4i2sMiAE+9tj06bTd3SfejHVmly500A9yzIifk8cq1fWQn0X5kdf/NLxo+HGC+t+apKXU2XAVwmhfpaV7IxSWFy8T1Bf3KVxMq8L+4XjVdKajBX1SBTRJiHOncoeUmr8b4vElTnnmO8iIx7+Ag7p2JDSPvxY9+gYhY/ktF0Xdstt25RG4PUKSlKq2yDU6Jqng7aC3osO0Gs6miXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpZgsZPq+V/3lvQMNBzsU1cq7jWqPV3L+GL/vXywgns=;
 b=bLhUMUZsood/7bKj05FA7y49eGEyO82kAEUGVHNtZRQWPMM88CC1Ugm0za4yuKBklei4OquE2zag/JRvg84jXci7QV3aOQ8pyd04ltIdDzZoSZYTAtfXMb2Rx5/IcmUcKGat5iMZZCbvfNH5TNLQ1A9PaLL/hNC8ajvf/2II7w5arpo1uJityFM2t1L639XVT3w/zXk0qFyFY8N8EGT6qqnRLpSzL+Cu+EGgbOc1Xy8MjtnyHKen5zdEdvMyAXqZckY4yMDB0ef0XmIF1jK4Xxg7VvfzHl/JcK8Ornz4a8qJ/6DkQqsgPWyM+pA5kPpEwi0NYoi0xZ/zYX1TeicM2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by PAXPR04MB8160.eurprd04.prod.outlook.com (2603:10a6:102:1cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 10:00:31 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 10:00:30 +0000
Date: Fri, 6 Mar 2026 17:52:47 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Cc: badhri@google.com, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, dsimic@manjaro.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] Revert "tcpm: allow looking for role_sw device in the
 main node"
Message-ID: <46zvnvkhnoa5w27o72tkex2rw6ha3fuisyeomhmsl5s5453x7b@fib4tezyywke>
References: <20260224110139.3812757-1-xu.yang_2@nxp.com>
 <30bc5aeb-382b-49e0-824a-303230110313@collabora.com>
 <im3nnajzv2hdu3kv2hknxi3jaz3oam5pujdoapva4hs5rzguky@t45ryche6n5k>
 <073cbeb3-04a8-4b26-a7b6-ef0b7654c34c@collabora.com>
 <xcfp6d2ma2j2xnsmifpvufofovqixwije7ld6332hg3zeeyxip@mocrjvsmjlqh>
 <cb73e1ac-649e-45cb-be5e-3fdd73dce7a0@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb73e1ac-649e-45cb-be5e-3fdd73dce7a0@collabora.com>
X-ClientProxiedBy: AS4P250CA0013.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::15) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|PAXPR04MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e3507d8-5e24-46f6-e706-08de7b67331f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	II31d0MNSnl1kwskNUPLY17RkVbMiJKuyjh0pAOEOEBs2n1eUh6F49QjRXQZQiz1zisb0r5iDwFVeSE8MYcFnE5OVGd7cf7OVMfHf/LifEFp5c957Eb2KPyiVueXZBEuKdfsU/Tdx+1tf4L7L9vbf3Yj3gkfcNE7bfOKSyzw6KegcanAbb96mie1OfLqejLGYQkNjzAS5AFrDIOQ6wTTjczEM7pejnMuCEIiJJXk+ncX7jSiu0vBW65TYJpC8YWMxsd9Kjm+tICqUDVAUSFNX+BR8vEr/BvCiO4EzjJ5fBJY6oD8+8O8MhBZzYexRZefcpO40x6GWzPp8RpaDMdgA0ayLWpMMN9b8iNwSvWOaFDbdscj4W1gIabBrEPYLhvkilrv2VV04ZuZoFP5xXnQ2zwaSu8poYrU5LIO1NSmUfCDrqTQ/w2yacFFW6obp++6HREELtdxJQps2RFKnEIa3IBLzI7yJw4SNgoKaX/bke15L1PVEdh8Nfac++hL2E7mEhhGz3G38BZRU3O4wB/4HsjAJw9zQso9FwHYakC9bws0P5QmvyXQhgSAYvNoWPkBn4B6WPDnyqM3Ek9mK98ZxA56cfLaMAVdVeQE5AYjyLge2nBHEHFLyXQ+ukPK+BoHvp2m/yqgxLcuWDuqw0gfbkBDLI6K69vbzXSonmnE8yIQzjO4TGn6OmOneGjl2sMPdTgM4EmyhItT3btT+7ieVsRKCfOw1ERv1DI6K/fb5Rg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTN6cFRNRTg0V2xWdWFDWmh6NWdocnBaUml4NG1wcENNRXJydTlMN25SWDQ3?=
 =?utf-8?B?MDVnL0h6cUJUS3B3aDN4UzlPcTFqVmVVdU01VVJzamFxN2RFYkozcWJBUmVE?=
 =?utf-8?B?dkp4MU5JYnVBbEEyT0JndWNWTWpNbGFQWTA5c3ROVUk3OG9mcmpSMVdTcW5R?=
 =?utf-8?B?YUlDQWFMUUxHeWJnUXBPbmZVZW9KWEo4bytFRjR0a1pjdDRRRWFkcDMxcE9k?=
 =?utf-8?B?MUxEbjBraytua0ZqSldVcUJtYTlNODVoanYxK1h0bXVQd3ZqTzlPZzdIbWNi?=
 =?utf-8?B?K1JFbmZKTG54RjJNcjBSQXBOL25zYThRN1krdVRRcVd4YUJRTE1oYUdvV01t?=
 =?utf-8?B?QmlJQm9XcFd5WFVySjAvSlRlcS9VZFljb0lWNnhyVkhZb21tbzNLeWsxWWZO?=
 =?utf-8?B?ZXpBenpBWmN1dmpHVFlxUUR0ZjRJMmNNYTBhdWlkU3owY1lMZHFGVXRjdzlh?=
 =?utf-8?B?enpuS0poNzkya2NtZW5ablFUWmNWU2FCZDNVZ21ZOGNpVC9qK2Q4MEZKUC9o?=
 =?utf-8?B?T3JPa0Fkb1lhdVhxeVlMRGhsRjhlVXo5cFRZM094YUZwYU14YTR4WjNQZ3hj?=
 =?utf-8?B?Y3g3MDBEUjdLdDQ5M3d4TXNDODQvTS9vWWZTSXdhaVpEQmhzYktYY3QvM0t5?=
 =?utf-8?B?ekp3WUdCMkhUL3phY2Z6KzREWHhXTzZ4aFFtMElEQTZZRVZwaTdIZExQK0FG?=
 =?utf-8?B?UnFNbHNNc0dmRTgyVUIvRmlrSmRLNU9XazZKRG5oa2lnWlhTQWhsM0RPK0Ny?=
 =?utf-8?B?R2F3WHVwM3d4Nm1CNHFpZW83YmltdThBVHArNzBIN3BVVmJMYXhuS205Z1lz?=
 =?utf-8?B?WU1GKytVbVJrSDRsU0NoUnorajY3bXpMR1pkeHFuQnVRSHRBbEMvdjVveW9J?=
 =?utf-8?B?UmR0MWplWmthY0Ywd3YxR0VBL09SdHlObG5GZklXM2wyQlhsRWp2K3BXMzJZ?=
 =?utf-8?B?QXZLZll5WXp5aFNGZEYxMDk4RWxpSEU0UFN0TXgyUDFlMkxGQ3dSM2YyYkI4?=
 =?utf-8?B?a1pCTTBGOXBnRW5xellHY1E1MmsyNFNYeGYrNzQ4TFYzQlRqK0hIanNVVW9P?=
 =?utf-8?B?QlZKZkQzQ2xaTklnWUxuYkFVeEVOS1VsUjhodktqbmxCNGpRT0hMYVpsS1U4?=
 =?utf-8?B?Rjk0RWdpbTNBZXljREpXalYwL3VFT2hzWUYyeGxVWEZJUStkZEJubW56RHNO?=
 =?utf-8?B?Z0VXWG8yOUZMcWhoRUFTakE3U2JkVmZvWWpOaDBuZFlOdUJUVFRuMms4TlpU?=
 =?utf-8?B?Zi80ekc1MjVSTHpMc3NwcG50a1dlSDZRSUh4ZlpMemNvNXR0UlVOZlloeWMv?=
 =?utf-8?B?bHVvRUJNQ1dzY2UxUTZUdE1jdXZKY3JXTFREbGxseFVZWmpjSEdnazlPamJM?=
 =?utf-8?B?cGhWeWEzaEdGbHY2LzVGWU9hU3NzaHhxU2pQMjhDR0N4S2hCSXRkNzVzZ1ZK?=
 =?utf-8?B?dlZFRHVSOXRwOXI2RnVUQkZPMFJsVWl5UUhzVU95ZnUrQkowcTg5ZjhEcSs0?=
 =?utf-8?B?R2ZNSjRNYlo3NHU2aWVweHQ3eHpqcHhLamNLTHNzeXIxaSs4QUh4Uy9Mc09i?=
 =?utf-8?B?czJuYjBwZERyMzAwMUVaNHlReFNicFZqWDEzY2g3OHFWdFJjdFFMM2Z3RS9h?=
 =?utf-8?B?M29XNkJLalRrSVpyRXRGd2xzWXliRjhvYUtPL0hDY3RsTDU2VnFtQm5GeTVL?=
 =?utf-8?B?SHJpUVUrT1pJK0I3RFpMdkd5dDlZMnNDT0NzNm81WmliaU9lanQvcFN3cmtT?=
 =?utf-8?B?aFMzZ1JjU1Z6ME51ZjZqeXc2cFQrdjM2Um1pVld6c2pZSDc0UFBJVW1GYUJT?=
 =?utf-8?B?dFVobU5PeHF0cVQrT2hVVStScjZtejNJV0IrY2NBN0hPbFhVelBUVHRGMGhq?=
 =?utf-8?B?aTZZUzZIWmo4VmxSc3ZRd2VlWXZhMFdFUGtpVVBxWDZFTlV1WURYT0N4bUVs?=
 =?utf-8?B?enVWUzBmenRCb08xVm0zeFYwaTFtMm1pS3g4TTU1aVJYNEZvblZoWHhqQVl2?=
 =?utf-8?B?aGl3eFZWUVhPYVJCT0Y4eGdyNnRBZVcvRUtrWlRPNTQ2UHZ0UjlHM3g1K3dF?=
 =?utf-8?B?dGR2b1k5Q2s5VVpMUVd2bjhUSjVISWx6ZG43ZVRlbWExM1JYYUJuS0hBTllM?=
 =?utf-8?B?RW9JU3lkUE1DZGJnbi82clB6TFlkVGxQalBsbVA5N0lQNnlCQmJ3bmo4MUlW?=
 =?utf-8?B?S1MxNUVOelBKUGI1VHplb0Znd0dyRm9zNlNiZk53R1krQ1BXMENSZndkOWwx?=
 =?utf-8?B?M0R5ejRuY1BFOVNXdHdNWDNmY1ViVjVkemEzd0hCMWJ6RTREUkVPNXM2dzhQ?=
 =?utf-8?B?bFArRkNDYUJUc0dTb3B2bmZnTkVvZUdBbnhhTlV0aXo4bnVUbjBrdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3507d8-5e24-46f6-e706-08de7b67331f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 10:00:30.9090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMFAEPLpTqIf7+atJnEB9XO+S6AkaiIR7Dlng8ERVJDPMxGix/AwwhJLLkvR7oMqlsTEe0XUQFs+QV1WWFO0zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8160
X-Rspamd-Queue-Id: 1CCC521E580
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34145-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Arnaud,

On Thu, Mar 05, 2026 at 05:36:08PM +0100, Arnaud Ferraris wrote:
> Hi Xu,
> 
> Le 05/03/2026 à 10:40, Xu Yang a écrit :
> > On Fri, Feb 27, 2026 at 04:45:30PM +0100, Arnaud Ferraris wrote:
> > > Hi Xu,
> > > 
> > > Le 25/02/2026 à 03:57, Xu Yang a écrit :
> > > > Hi Arnaud,
> > > > 
> > > > On Tue, Feb 24, 2026 at 12:33:33PM +0100, Arnaud Ferraris wrote:
> > > > > Hi,
> > > > > 
> > > > > Le 24/02/2026 à 12:01, Xu Yang a écrit :
> > > > > > This reverts commit 1366cd228b0c67b60a2c0c26ef37fe9f7cfedb7f.
> > > > > 
> > > > > I believe a plain revert isn't the right solution here, as we'll get to the
> > > > > same point as we were before 1366cd228b0c, where some devices stopped
> > > > > working properly with newer kernels.
> > > > 
> > > > I don't think 1366cd228b0c fix the real root problem because the description
> > > > should be wrong in the commit message. If -EPROBE_DEFER is returned by
> > > > fwnode_usb_role_switch_get(), the ports node should be in connector node
> > > > instead of tcpc node. However, you get the error when ports in tcpc node.
> > > > 
> > > > Could you double check the issue, so we can find a proper solution and avoid
> > > > the further regression?
> > > 
> > > Sure, I'll come up with more details asap, either tomorrow or early next
> > > week.
> > 
> > Do you have any updates about this?
> 
> I do, sorry it took so long...
> 
> So fwnode_usb_role_switch_get() does indeed return -EPROBE_DEFER, then
> keeps doing so on later attempts if I revert my patch. However,
> usb_role_switch_get() succeeds on first try.
> 
> Please note that:
> 1. I don't understand much (if any) of the Linux typec stack, and only
>    noticed 2d8713f807 broke my device, hence my attempted fix
> 2. said device is the PinePhone Pro, using an out-of-tree dts (and many
>    drivers) from https://codeberg.org/megi/linux
> 
> The proper solution likely lies somewhere in the "get proper drivers
> and upstream dts for this device" land, although I definitely can't
> commit to this.
> 
> I think saving the fwnode_usb_role_switch_get() return value and
> restoring it if usb_role_switch_get() fails would be a decent
> workaround, although I'm definitely open to suggestions.
> 
> Feel free to let me know if there's any other test I could run, I'll do
> my best at replying promptly.

Thanks for your update!

After review the dts file, I finally find you meet the issue with:

	usb-role-switch = <&typec_extcon_bridge>;

instead of using below device graph port node.

	fusb0: typec-portc@22 {
		compatible = "fcs,fusb302";
		...

		port {
			remote-endpoint = <&typec_extcon_bridge>;
		};

		connector {
			...
		};
	};

The commit 1366cd228b0 message "If ports are defined in the tcpc main node"
has confused me at the beginning.

Anyway, it should be another potential issue. Can you test whether below
patch fix your issue?

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index b8e28ceca51e..edec139b68b5 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -139,9 +139,14 @@ static void *usb_role_switch_match(const struct fwnode_handle *fwnode, const cha
 static struct usb_role_switch *
 usb_role_switch_is_parent(struct fwnode_handle *fwnode)
 {
-       struct fwnode_handle *parent = fwnode_get_parent(fwnode);
+       struct fwnode_handle *parent;
        struct device *dev;

+       if (!fwnode_device_is_compatible(fwnode, "usb-b-connector"))
+               return NULL;
+
+       parent = fwnode_get_parent(fwnode);
+
        if (!fwnode_property_present(parent, "usb-role-switch")) {
                fwnode_handle_put(parent);
                return NULL;

Thanks,
Xu Yang

