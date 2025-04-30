Return-Path: <linux-usb+bounces-23579-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A325EAA4C2B
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 15:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 574501C02C27
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 12:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9040125D1F8;
	Wed, 30 Apr 2025 12:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aimvalleyaimit.onmicrosoft.com header.i=@aimvalleyaimit.onmicrosoft.com header.b="eO/ivYT9"
X-Original-To: linux-usb@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021072.outbound.protection.outlook.com [40.107.130.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815A325A2D9
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 12:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017806; cv=fail; b=Tet8qkXG+3Nm4U3gDuj1T6Tl2NLr6QC6vmwzyf87VKC9ghMVka0ldV+nZ5FCC1k7yy2rxrkDOsBv4NfZWC7luc6KlyAanNok3Ig0cf8/6tk1WZUdyfArMeQ4NxR84mXxk1j/qEcyFDZK0871e8wfbV5S4ksTyJIhqcd07GRF8XE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017806; c=relaxed/simple;
	bh=4gU6rD/XsZ16/HHfFTpABiYxeNPjl0zTcBYNgvVr1b0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a/oH+OYNrk4jdLiYWZ/vTcTnVWZj4KRpKm5ZTXwtmWAnvHUvG3Wk9FYQIJvq0HB3gc812xThKGGd8hr3PK14L5Ma3p8NlZYCHhh/nhLpOH09L8a/8PeNAgHAFVSVgfXZHlfSKF03GHoxmD/RtG7WoPIghfsEt0ubfwYjOlJebo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aimvalley.com; spf=fail smtp.mailfrom=aimvalley.com; dkim=pass (1024-bit key) header.d=aimvalleyaimit.onmicrosoft.com header.i=@aimvalleyaimit.onmicrosoft.com header.b=eO/ivYT9; arc=fail smtp.client-ip=40.107.130.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aimvalley.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=aimvalley.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5U/IUXL67jLoNERCtZS64ro3DegAmCv7hM5ZvyX5Wj1EnndlIek62CVplyUJxLko0BLuN9bkVceEGiFCzFocskJ/lzcGIe58ey+GtTbEBdzLLbOl2s26cqs1G609375qtxFTUTKT3+NNYqW0tHlmZMZyDf009w4Y39Ysz3jLMT+/D+hJ/YGG7Fmj8jjDB+y8OoHSV8Mru/ziBHu/4Vuvb/o8C1JV5+KcvsPMjtXDkS/FTRwTo0+ZYaHNLTzLC1HRhDwAPwJRqhodDQ5Jfu/0nUdPt6xF1NTQLW+ed+pT7lmdOCV/hV5oEMoOS/DEklyhZcUdk0CffAjAVwA04nf9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4gU6rD/XsZ16/HHfFTpABiYxeNPjl0zTcBYNgvVr1b0=;
 b=AHtPAprasWjbq7NPnMm/HD7gCcbYBcokd9yGfMZPt45LNKmDC5a9rcbZDVzmBo+rAHEBQgu+XBIOdSFw2cnUnwLCn0bWcW6PNzqj0A0ofOIaNlzTcVwcLMua58gNPBpw1My5kCQGIVHm9b/CQNbKXtAxP+PwdLco6SLyvIUAFB3Xdq4TcuXIEFq5CHf27FTA3aISYNuqZKrYJDL7EjfJx6U5NNmVxPh0cLH2Z3rwhbzOxFU6hOtgzS+oYlf4uNUccJAAWbjCQJ8Haw5WT2Sgej8OZ49DPTJrWAmGDuQRXBgnXa/BWI3FUHscp/sq2ZEqdxfHEEj6kmTNxL0aJuSUTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aimvalley.com; dmarc=pass action=none
 header.from=aimvalley.com; dkim=pass header.d=aimvalley.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aimvalleyaimit.onmicrosoft.com; s=selector1-aimvalleyaimit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gU6rD/XsZ16/HHfFTpABiYxeNPjl0zTcBYNgvVr1b0=;
 b=eO/ivYT9slSlupc1FcaNyC41rsnvsOKNC+IIbxir3eL0l+brYRNvOZp9MQTqXx8jt90at07AJtcp1qHQEKLO8xyh3LFSGjGgTNv+1jvywQMuW7Gh5m4KyitmpCHjhyhX3cX4qiDke8sCQ3yg3vRaelGIq3gNCpo6vkgTIe7e7EM=
Received: from VI0PR03MB10202.eurprd03.prod.outlook.com
 (2603:10a6:800:20f::16) by DB4PR03MB8659.eurprd03.prod.outlook.com
 (2603:10a6:10:385::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 12:56:39 +0000
Received: from VI0PR03MB10202.eurprd03.prod.outlook.com
 ([fe80::4f2e:6373:283:331c]) by VI0PR03MB10202.eurprd03.prod.outlook.com
 ([fe80::4f2e:6373:283:331c%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 12:56:39 +0000
From: Ben Maan <ben.maan@aimvalley.com>
To: Greg KH <gregkh@linuxfoundation.org>, "bugzilla-daemon@kernel.org"
	<bugzilla-daemon@kernel.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [Bug 220052] New: The usb/cdc-acm driver uses memory after it is
 freed
Thread-Topic: [Bug 220052] New: The usb/cdc-acm driver uses memory after it is
 freed
Thread-Index: AQHbucL3UPxwduIA9EefQi3V6DArBrO8Kq1S
Date: Wed, 30 Apr 2025 12:56:39 +0000
Message-ID:
 <VI0PR03MB10202A10F714CECCCEA5A8DE69F832@VI0PR03MB10202.eurprd03.prod.outlook.com>
References: <bug-220052-208809@https.bugzilla.kernel.org/>
 <2025042449-occupier-waggle-1c7e@gregkh>
In-Reply-To: <2025042449-occupier-waggle-1c7e@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aimvalley.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR03MB10202:EE_|DB4PR03MB8659:EE_
x-ms-office365-filtering-correlation-id: 7425f981-734a-4f69-8794-08dd87e672dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Eoakv7aGw6wUSSv5TYsuao7LvhVz7QS0AJiBIXm5Joa3e01YEAUAevDGxk?=
 =?iso-8859-1?Q?nuE9F9pNl6eM+M2kOqtbROzZYyfoIoZVSfitpSFxT8PhsyTcPWk/t1e21g?=
 =?iso-8859-1?Q?dI/WPQXrwwUteuDvrDDX43tv44Yub5m8Y92Drg4QZy7B7H/jad0aE2kXD3?=
 =?iso-8859-1?Q?T2Fi4pdXYN9VQGh7zYMqdofWnMvl4yWgdMb6NbzwJS+i2nGpOg8kiLgfYA?=
 =?iso-8859-1?Q?u3HCWsu460HLmZIldpdnjkcBNUAFh5rVxENMHbVJgZquOYnh0Zjghex4mt?=
 =?iso-8859-1?Q?BuACx5hCDengCzgI4tVwoMHfkj0lmkZx75eeriEzDT1IqodtRfybsJFtid?=
 =?iso-8859-1?Q?rh68qXYe2EyxPAdW8/oEDMfnBY3HDP5+W+pMIlkVaFZAWwMhwhjYHo/zUF?=
 =?iso-8859-1?Q?Ti8ZglL7LuA8kHnR0X7AEpdfThHYLSWpBDPOZ0KOtgIFSqYS+ni6fMoCFY?=
 =?iso-8859-1?Q?tjUdNmS0YgWKzBvfhV9R5ZH1B935QQRjwdioqRmTQXI88r/WUWSh2/ADyt?=
 =?iso-8859-1?Q?vLhsIyfjrSujX6xb2y5u6yTmJELiqMoIni7pUHZUDR0Md3KQZ3qwQz1mOl?=
 =?iso-8859-1?Q?XzwKl0p1ljqxkRMA05huxJIxsPuJtmXAfdEYTsY0Pa2vi8GA87TVW7+cnf?=
 =?iso-8859-1?Q?pk2lCS5FpqeaFiIK6DwFn+9pq+cqwzBSHiMzGT5R9S1GeAEvzJoQeyC62X?=
 =?iso-8859-1?Q?AR3ANkUZsNcyCf3U53gvIL8huHhmYYE6ckF9A629Ga2DPPvLHLzINSKMzU?=
 =?iso-8859-1?Q?zF5YhPrVwrBMPVvMbok0GWIe8Ti5fU0xPYZe1QoieE9GVyHaZcdUiMwwD4?=
 =?iso-8859-1?Q?wKsL6mHyDMdWfMnEe720ZECdnBSmBbJqsJFyuj5/YNkbrWZcjG+q0XJv+W?=
 =?iso-8859-1?Q?Og79uFagkICgemzP+y9212MyVadHFRrNKwWw7BcgXOYFnUwOFz/+pQYp16?=
 =?iso-8859-1?Q?aOeYb3bcoO99r2d8y14PNtm0b0cnROYBVzfkYY2FzcsEa2fXgkcF92UqsL?=
 =?iso-8859-1?Q?iarVdXXZn2P7FiUgcCQ7PlQnaTloirDq14a4V9qc6+vB6ICRfO+ruzh6U2?=
 =?iso-8859-1?Q?L1eoVpx9N8x+sm5tLqhwT2QzGhcwJYu/jgpvCriNsA4exbE7fMpcajfJ6f?=
 =?iso-8859-1?Q?J8LzDR+LJtd3lEaBnTvstDGJaxp8vkeEvb9o4RUzwNOQK/2iumqG4ZX2El?=
 =?iso-8859-1?Q?0SD8Q9LEsWi3ollWk4yx3mJfve3ETjEIwOf/9bcFKbblgV4vTBpfDdrhRj?=
 =?iso-8859-1?Q?v26+7dSlHvUSchYSsSIGGBUDgnyesyvNKII+cukuCVsub+69qdh0KJB8+M?=
 =?iso-8859-1?Q?WOC6V6yNrQxzqiw3kFjydwoh4JAC6JMhW78TGoHk4h3jPr8PfjBDBLcCX5?=
 =?iso-8859-1?Q?LTPMgL9XAD7ifJa6pVlhfPbaGtdKfvLD+uwj10pv22Kn7/2pXsIM3GOXYc?=
 =?iso-8859-1?Q?yKCEPT1NOZKCKJpbHh73uPuDnECps/AgRTQUpEs1xAix9glDy1VWhTc6CW?=
 =?iso-8859-1?Q?qPvW95Okad5GfLjpF7y+Ed6Ds6+Q41D4Bxyl2FQuTcBQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR03MB10202.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JHnLZmDjdx03bOQG86lBYfUL0HGAuX3BWjcqae6Xh5OAEVTyLK0YJRCWta?=
 =?iso-8859-1?Q?ZBZe5y2+t+gMuZr6yYoUzwVGcTDWGnvVaBBXvsRGG/xTBzwlNIbFdOG3mm?=
 =?iso-8859-1?Q?oJgfvKZBpPTzGTe30kB05dIf1dZENebfajVu9/3TrACtFjnKVG0ZB3I/jN?=
 =?iso-8859-1?Q?PEhvRZ+eKhoqo+bNILHONKyw4twVPraUU3opWfdTyM7ie4Zl5M3Ddjqd/R?=
 =?iso-8859-1?Q?7/8veSQ6b8q8Mqzh2bs87LjTTLSDqdiKVjRbVEGm5J64s/lEb2HM5KuSPk?=
 =?iso-8859-1?Q?MGLRpLZ5CShbeYJ8feSpynZc3keEIAP9g1suj/KYPRkhS7iskX2B0t4xXA?=
 =?iso-8859-1?Q?k8U21mzvSx9F3Y+3xrQ/NJpBhhjaRp3gENuBdVAB2rJW9jy2/Xax+RhnFo?=
 =?iso-8859-1?Q?fr0heP/9i+yx/5p5f1GZMxxSK2i0rm+xXiVws2y6MwaAvQDiz9oLDI3IpF?=
 =?iso-8859-1?Q?BtNJ7ZnKivzHl3Lr9Kw4PxwfmexaeVn+mkmVE1mRr4e2fgVSMbl6uu0TM9?=
 =?iso-8859-1?Q?Lz/v8aVtKDZoh5GTUj4JkmPCheL11TdyxLznBW0VSkQH4rxmV0SloPaq+g?=
 =?iso-8859-1?Q?ixSumFkfEKnn45X7PGW8n02FkvT7lvc2fjBOHcvnrqMEddeeyEO5CwwZxJ?=
 =?iso-8859-1?Q?f6na845DlFyx4T2PpzAHBd+Zf2jhkOhWJdB6d1CTLOMcbBtcmRRTDWbvLy?=
 =?iso-8859-1?Q?J2LkKISU1GlgWcGSsaKmh4tupJEdR4HABb1/S/2IMv8Tog4rbk7Sgcq80n?=
 =?iso-8859-1?Q?fkvb8UJdRwCHVzELIVVwms+s/DsG1aoXoboSoR5IUv+0WJJ7yBZeYJbe4A?=
 =?iso-8859-1?Q?ZIngcgyGYYJldv7wL1HPIrkScz94yRnqfjUjG8K27/x6A3j1Q5LbHaZfFO?=
 =?iso-8859-1?Q?LUykN+PWsqNRtuGugoN9QMId864Pb7t8/6JDmm45S3Yckv6+9cxFZYGuzZ?=
 =?iso-8859-1?Q?xZUUIcMeyLFUBNDBJVtn2pqW/JIpvoH0Pcg/p+1U9HN9ZhyxrhZcNisEra?=
 =?iso-8859-1?Q?O18HJIVssOazWkfQ0uyzLSrbpBsFhrxHWKlkSeHKjCJpMdkvJjHMxQ2tWv?=
 =?iso-8859-1?Q?xD+zYANMEHsXw6JIY+5AOXMzZhtY8pjyp9S536GWADZDtcp4fRzNl3/3Us?=
 =?iso-8859-1?Q?mMLb5HgAksAUl5XF+1mevD8GecI1C/l61m1Olmf81Rj+FXU5wSM/tbTiJU?=
 =?iso-8859-1?Q?975Z+NeZRZePwCGvIUINYKrpLtdlZRnX5LuZQ2r2656USEI0oM4B7oXT93?=
 =?iso-8859-1?Q?XBdbUudkl6M9DrQdfJ7rbb6Ek76t0CGPkD/D0sEu9hU5PPg2NZgFDTKnL7?=
 =?iso-8859-1?Q?qAudIdZB4QD2aQxJf+r2uzltPPy8Cy0gM8VgTM66aNpvg9lGWZbd2Si9iQ?=
 =?iso-8859-1?Q?sN1V2jv91RGYO9GJRPfti8dv6IhXQqHy+4JPYvu30r8OplU10KG6bKKTuA?=
 =?iso-8859-1?Q?X1EcK2NZzMEg64PyCP9WQyw5XKSOSIiHbCB68olrX3EKP6AqFWqmIT1Oe8?=
 =?iso-8859-1?Q?1mMC8ObS+HGo9HPHBLZH46Y+hrgrNyAgiFJi+Uwmm3Z1GHawsR1nz4DgpQ?=
 =?iso-8859-1?Q?SLWkcpbh5HPWDcE3nHhsOvC1sUyzY8exl2VY9bgYozsCoybB9BjEvAdxsr?=
 =?iso-8859-1?Q?IlUHXJ4OTYiXJl+mngFpnchkZs17DQR5SX?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aimvalley.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR03MB10202.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7425f981-734a-4f69-8794-08dd87e672dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 12:56:39.5612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: abbf3d32-22fe-4e29-9294-ec86735efef6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TPE66zvewIs1OuTBgohdl+NHf4hrucxq0pc9wRuuWr5SYwCIEpIyRk+IES9Nhg0cbWP68x8vd4K9wzcFN35PSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB8659

One of our customers complained about a kernel panic that occurs now and th=
an after disconnecting a usb-cable. However, most of the disconnects are wi=
thout a panic. After some investigation the panic shows up between 1 and 10=
0 disconnect attempts. From the panic output can be seen that the acm_softi=
nt is one of the last functions on the stack . This function is first calli=
ng a usb_kill_urb that frees the urb memory but 2 lines further the allocat=
ed urb memory is still used in the acm_submit_read_urbs->acm_submit_read_ur=
b.=0A=
=0A=
Exchanging the 2 lines as indicated in the patch solves the problem complet=
ely and the kernel panic is not seen anymore. This is proved by 7000 'virtu=
al' disconnects.=0A=
=0A=

