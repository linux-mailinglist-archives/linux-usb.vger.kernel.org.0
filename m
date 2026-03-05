Return-Path: <linux-usb+bounces-34054-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLmOC6dRqWmd4gAAu9opvQ
	(envelope-from <linux-usb+bounces-34054-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 10:49:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B695F20EEBA
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 10:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7634130405DC
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 09:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF66372EF3;
	Thu,  5 Mar 2026 09:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iPx2Kl/3"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010021.outbound.protection.outlook.com [52.101.84.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ACA36606E;
	Thu,  5 Mar 2026 09:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704109; cv=fail; b=qQfvWo4A98clda4uZQlj/Q5a+r51QYcHHEFocV0R7o7KYlK4ghDzg0PdYfyc8SVIPeGm5BIEKrbXnEinf2Bb3SzGbb21HVTo4B2OKhq8mio10xlGY8/TxhsliEN9o0TU5LXr3I3P0LYElGy6frxrRonyONSWPJdeOjyXDsbAlEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704109; c=relaxed/simple;
	bh=fctHOjWnse8gW+pL3R3JIzwW62tMon0zWpVQQJqCLok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YFBqx0UGQPj9wIRDURa9/kdOpqdcd8LJBWOEdfCgACIlNN3qUI/Ua+mfXP0wTOiyjkek5cSsMJnn71l7k1c+SDXdDDQ7ddiUF2JCc1CFkM07SCoiRUylVHpF6J7RpJZOLAfTBfGv7Js98quecl7KumMSLjUndwO6uT2tcx1NJSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iPx2Kl/3; arc=fail smtp.client-ip=52.101.84.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cms1w2ftdo6P8zrzPqOvbRKMoPJ9Ny+talYH2N3hTt/54Yvbcp4eR4uIZrzqc0HSRcryZckUm0zq2L5+UlGcfACIhGrW8imp1ivoTl7SJInvOnzEfjW3NxyN9nZ3ZDOvJG3gEVXpU07f1e0xR9iCc8TyVqDTdKlUXpdyIL8tXFH7/6fZz2UmUBDSuDifBh3MB2siox3gnVTHmTKL7lSTBTxp4EE6c/QrbtSjywgVTVFBJRluuuLbO1g7PYpOfda0o4xmY3zQa3a9XUsh1n8GoapnuQ2jx939vraXXeN2AGgegWTDq3vCA8u3KrDE4Q3fFz9b7M/1xHQa7V9ifjdW7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seVM4N2niixjYCzqoR/hfheb7oWtBZuR5MPpA122L0g=;
 b=dhoh6Cxl1R+jHXvGAeRsyzZT12gfYMjj8fZ0+6ODrZAeN3vnWWjGFjBYCFC9mXDrDKMmNBuOCTa1rNQ431kVC/VhlO8VD1fDm5ctsdrWVcgySpr+TmV/jdPNIzufawpF1/t73AyHxp8y0ym8ndjt2YtpT5UH79vldGUmf8VxSy2u9/RsCunvCBxLiRJQb+GdQJcMZ0M8O1pBTg/IlpIiUV9arR51AD1TuV8oebLxBKlZDgBQT+9BpN6GkCsUcg+2XVHzBp+lbGxjF6ArZwzEQqLWo/XhMgUI4EvaqyiJAkRwk318GN/hmuw2MDnFxAU8H+OOaRMSQO26Fn72zW2Lwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=seVM4N2niixjYCzqoR/hfheb7oWtBZuR5MPpA122L0g=;
 b=iPx2Kl/3mOa0ZxdWJLYn+Oul5srzUrFwRUOTP+NSRReV2kyWnLKtn+KppTSwVlYHJXU8X38bom300HumxJ7wPZtyZrpBRwS7TUGZECHdtOSYXcgnCnfO8TMOa3/HutnhRP3Orc4Kb2MZ8ibHy2wZBms+CFHC0NfGXZQUawVzC2b4qPSwSMGYu/LGFv+k9JtDBWxqZU/C0q8Bwgy09biNj+GfNbozPSnjlNrUX4w4RXF+7CZO6SzNi4apBdcnUegWz9NfQ1cBX1Vbi5wLjZoHe8D6JybmYmmqM5PXI4N/3wiRanC+oJx81tcXb3jw+tgN4AuVeNgAuyIUfhB31/GO4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AS8PR04MB9208.eurprd04.prod.outlook.com (2603:10a6:20b:44f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 09:48:23 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 09:48:23 +0000
Date: Thu, 5 Mar 2026 17:40:43 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Cc: badhri@google.com, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, dsimic@manjaro.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] Revert "tcpm: allow looking for role_sw device in the
 main node"
Message-ID: <xcfp6d2ma2j2xnsmifpvufofovqixwije7ld6332hg3zeeyxip@mocrjvsmjlqh>
References: <20260224110139.3812757-1-xu.yang_2@nxp.com>
 <30bc5aeb-382b-49e0-824a-303230110313@collabora.com>
 <im3nnajzv2hdu3kv2hknxi3jaz3oam5pujdoapva4hs5rzguky@t45ryche6n5k>
 <073cbeb3-04a8-4b26-a7b6-ef0b7654c34c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <073cbeb3-04a8-4b26-a7b6-ef0b7654c34c@collabora.com>
X-ClientProxiedBy: AM0P309CA0028.EURP309.PROD.OUTLOOK.COM
 (2603:10a6:20b:28f::6) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AS8PR04MB9208:EE_
X-MS-Office365-Filtering-Correlation-Id: 4401b49f-bc2d-41a6-d9c9-08de7a9c56dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|19092799006|38350700014|27256017;
X-Microsoft-Antispam-Message-Info:
	T+IThJnyihPA0mHPZ2pjBSjy1JoXwwEUijPm4L7ey0Q6J4e3lTTEwUgUAYKeJ9cJdk16hDk8v9nxo8l8G1C72Yoy8OGIYC9m762kmcjTj2V3p8CDD3cRZe8EXsAUHmpufWVjkwDiOioRR6X8yNaPVZGs95jzTa1ku8gnSvIv2KceQQ2ocSCJ3APMI95KGidJXNwmtEh2DRMhn4qXJANToupNOmFkcvInj0skiomllv9+miPnr9+3UoCgma0VZIjQ5r+pYv1mjchv3aFmbqEGOc5MkNinuCGiaPsAY0tgaCeYZvTR62OA5DEcmDbRfI5XkmRPcGFxwd0LMZwn8UlkRuXlP/ic5bbpifiKjazBHIW9W2fl/EnD8nwQKUI/tUhLIkSPwCrHFKTTCTQXGaVnH/Xi7Ow3yQRDXQlwycrHMVn259hu0JTqgPmm0C4gn0p5l4K+8qhURE5aZCABBk5ZdN81k/wTpogau3aKsPnWb9YBlGalH6CxPoewnrQAqf80nbstC/cqNczAb2jyCr3FD1ESeKz5vvArf88/IyfLbB27RsKFi0a0sOnZKh0hZJO89fFeqt9wNmhoQQEEvj4tjkOTNXGli1izK03DgmSTNUni2kzIeYM/TbdOre8USuYFIqqCyFW4yIrpOG4ZjcfGkY0VQ/fIx0rufcPbLgSlMKuorc6+y2ZkequPACenJ3c2REGxNmtDmDpCx+4nKF6FkyiH+rmvcAHNk5sZqaB6pGh0552HUQp8k+BSQrGnYHcupcr4xm5qELjDOcFtujEAFrckOrq+DbUGoE6ehzjA5C2U/ikfnMWJMvZR19VB8Qnd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(38350700014)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVQzZTc5U2tjUytYc0hHZ01RRkVDS3RVSjhDVWVDUFNXUjN2YU1PeklQTHov?=
 =?utf-8?B?dHlFQzlPbzhZcTBLNFE1SjRWUnRTbEVENjI5WlBlRmNIVUpyNEFCTUZ6T0dF?=
 =?utf-8?B?cWdScjdZNFR1SjV2dElXZVV5TU0xNXNKT3RiQjRMVGZZN2l6eElvUm9rdXBw?=
 =?utf-8?B?ZVMzc041VzlOR3JYaXBzSGxRVTc5aTdjaHgwTzB1aFkreEJ3dzVyUG0vUGh1?=
 =?utf-8?B?VDdDOE5GRDR2MldUSnhWNENpRVFXQmpkUzBMbThqQXJiaEwrRHZBd1FJZmc3?=
 =?utf-8?B?WkdQd3liOEZqNDExUGFzYXA2ZXR6T2F5OWxyajVjNGlTVWVHU21rdDlUMEc5?=
 =?utf-8?B?YjBkVUJremFRN0g2QnRKeEl0S1JYbmtpSFp3SURJcm9INm1ObXRZa3ZhMTlT?=
 =?utf-8?B?OXQxWDNORGFTKy80a0RTL3FyUG9ySytsN2l4bEkzV1NGWFBHbjhZS0NtalNr?=
 =?utf-8?B?c2FCVXZlVkdBL3hKcXFYNGVmbWx6dkJldDlHU0NsbnQwQnVUKzlQdzlaZ1Vs?=
 =?utf-8?B?S0ZVU3BGdldyT0V0WGcyOWpBcHkzL0ZDWlpNd2hzT0d2UE14b08xRmwwRWlr?=
 =?utf-8?B?YjNmSkpWbEZPRHZwUmtQNWJnRFVrMVhNWTJaMlRDV3ArQmpHUFZVbzJDb3Vj?=
 =?utf-8?B?dGI5a1cycjlTRFhoUlY5YUJRUHdVSzRUWDNhWkRxR0U1VE9GcjZHR3Jka3h3?=
 =?utf-8?B?ZW9nR2dHK0JvV1Y5eWYrTXVHQzd3bUVaZCtxYmpmOGhvZHlaNE50MEZjWFNi?=
 =?utf-8?B?UFYxTnpSUlB0QUZJZzFDTDh1c2wrbHBEOWR4VEw2WEs5WWtXYTRuTnEyT20v?=
 =?utf-8?B?SitYSUgvaGZ5SW8yWEZhdWhCN0dhZldmSEdZRGhhRS8yZUlqNDV6Z2dwaU5D?=
 =?utf-8?B?TDVXd0tUQ3lBWjVtb1NRUVE0dTlSM1pJTWlmK3UzWWNJT2hkT3dGQlltQmdv?=
 =?utf-8?B?cTg1MWRQS1dheVNWYllYRnk4UEVKK1Y4c0VPelhWZDY1L1d1SWVtL2ZteTJQ?=
 =?utf-8?B?M1RRRE5Tc2EydXptcEF5TFk3M2dQbkhlbHNJeGV3QnppNGNMeHpMZHVZWm5h?=
 =?utf-8?B?NXBtMU5hUDdpTWU5L3IvTVFNUjd6czFDNHRpK1krWVh1dzdLaXc3OHdtUDVW?=
 =?utf-8?B?TjdiMHlrOVlFMzhPZXZoMlBPelgwYzJuY1gzS010UXdrQ2ZHWDdHZy9VUFZD?=
 =?utf-8?B?WGRKUzZvTkFha1hiUmhKZDhIQ3hZRWsrVElaNGxPVlo3ZWswaWo4VkNSc2Vm?=
 =?utf-8?B?Qm1MK3hFbVFlSXRLUVNYRFRrRzk2OG8xejNZemJyOWgzZVNPd1F0aW5pNlFI?=
 =?utf-8?B?QkdVN2dHeFhMVlZZZWV6ckhoazdFZFNxcVV0SWJwRVJ6RlVvR0tUdWZYeElo?=
 =?utf-8?B?cjQyUlpaa1B2QlRGVjB5U0Q5ZUtkb3VGeXZEa3VOT1Rmb21MRm1kWEZPdU1t?=
 =?utf-8?B?cE00ZFNxQ25VWWtKWk9tYnVTaUtKNEZKMGpIT0NKNUQ4SjlnbTJiRDhPaFln?=
 =?utf-8?B?QTIzUzBGc3JaZjJISG12VVNHalZXd2FiZDRsYzh2OTJuVjRKQUV3Y2NSZjZy?=
 =?utf-8?B?Tjdmb1VCUFRHb3lmRUlFb2pKVmE5eDNuamM1c1ppUzErWmQ2T2oxVWhpREVy?=
 =?utf-8?B?RWdydExjRHJWNXFSdVU1VzMvNytDZW9OcDhMdXBpeFNtUnJRNjhmcjY5QXlY?=
 =?utf-8?B?VVlLL3NPcFpHRFR1WERrK2NhbUpkNFZDQlJ3a3NlVHZDWUJJRU5GQ1Mwckhp?=
 =?utf-8?B?UUFPdkFhaUFETXRVQnFBcjlmNXNrOVhXU2crZWdCYnJQNlk0OG1MU3g5NSt6?=
 =?utf-8?B?UXVIRldHR0lPaGZkVmIxTm8rMHBCT2JCYjBhc2RTNU5tL2NJUXJEM1gwbE52?=
 =?utf-8?B?TG5tK3BwNWJjVjF0eWY2TWNaQ01reHVnajZ4SStrS2x2T3J1UG8vL2JvOVdS?=
 =?utf-8?B?UTBMOGZFS3NhTSt1TFJyVnlGNGs4WFBiVVVtUEJCRjFGMFNwS1pwZFRWZVZU?=
 =?utf-8?B?aGhFMWM5UHpteWtwbGdTa3kvbjhaVDdqMXdBTktkTExMajNTZ01oVTZ5SVBU?=
 =?utf-8?B?MWlOaStSZ2pqU2UvV0t4VHZXaWdvS3g5YlozSUh2YzhSZXlCVUxFOU5vbjJ3?=
 =?utf-8?B?YUlrY1JMZ1Q4NTBJY1NJa21aU28vS0xnUmEwbWoyWFVIa2hBbjh2SVdNRUV5?=
 =?utf-8?B?ZVdmc0VwejN3MC8wVFZrSzFPMFlnUmpBZzNQR3EvaTc0RUNTTEdaaHhicFNZ?=
 =?utf-8?B?U0d0dUdhaUJTeFNZZGlSdTVQYVI5YlI4SzN5L1lVem1YdEhWbldqczBtZFo5?=
 =?utf-8?B?YzdyNHR0cEU2SWw0b2tsZDBkZGZKWElOMGY4QitRSG9SUlFZQTk1QT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4401b49f-bc2d-41a6-d9c9-08de7a9c56dc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 09:48:22.8814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gTJ4GrZaZ7FRjzDM067tpORotSvODe3E4iiyLhHzas9G0o3TvdRNAvrUYssP2+NsUcTFcK1vd8iqmh59pnH/7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9208
X-Rspamd-Queue-Id: B695F20EEBA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34054-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 04:45:30PM +0100, Arnaud Ferraris wrote:
> Hi Xu,
> 
> Le 25/02/2026 à 03:57, Xu Yang a écrit :
> > Hi Arnaud,
> > 
> > On Tue, Feb 24, 2026 at 12:33:33PM +0100, Arnaud Ferraris wrote:
> > > Hi,
> > > 
> > > Le 24/02/2026 à 12:01, Xu Yang a écrit :
> > > > This reverts commit 1366cd228b0c67b60a2c0c26ef37fe9f7cfedb7f.
> > > 
> > > I believe a plain revert isn't the right solution here, as we'll get to the
> > > same point as we were before 1366cd228b0c, where some devices stopped
> > > working properly with newer kernels.
> > 
> > I don't think 1366cd228b0c fix the real root problem because the description
> > should be wrong in the commit message. If -EPROBE_DEFER is returned by
> > fwnode_usb_role_switch_get(), the ports node should be in connector node
> > instead of tcpc node. However, you get the error when ports in tcpc node.
> > 
> > Could you double check the issue, so we can find a proper solution and avoid
> > the further regression?
> 
> Sure, I'll come up with more details asap, either tomorrow or early next
> week.

Do you have any updates about this?

Thanks,
Xu Yang

