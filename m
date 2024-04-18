Return-Path: <linux-usb+bounces-9459-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 535BA8A9E23
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 17:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6A8C1F22357
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 15:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371FD16C68D;
	Thu, 18 Apr 2024 15:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="GVvgJpPK";
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="D6//4Nt8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0068d901.pphosted.com (mx0b-0068d901.pphosted.com [205.220.180.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20E46FC3
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 15:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.180.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713453523; cv=fail; b=d9y/879tG1K6Jh3+o0+BQOu/mj0HiFUmyI3HS2U067yFKqMg0h6uzeaXVwnhGXG9n+/gCdwV6XX1widqm5KrzK1pq3OhfyjzjC6m/SJhYGhyotGAGep/rfZ2MQSh+8+4iQ3Tt6CZH+Bb92GWk1xi2cwgaOMFcFPoCrzwSXdKIc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713453523; c=relaxed/simple;
	bh=TYkt0GyR2XYJYRvQLdfsecGxirOEGXXarymB/iwkbWA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Cprv8POeHJouguSwDqxmz1ypuAqqaOz7Qgmhn8/pVjx7r3WphhmnbTGtqRKW6SIHboiag6PuTzU132hkYW1b73sV7QpZrYHbb7Q46kPb2tPMGAaUJsPBjadoipjP+2qbUWy7/1TcqiAMTJ2jI/jZIFGNZLOV9Z40coaer8Gm4eI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com; spf=pass smtp.mailfrom=biamp.com; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=GVvgJpPK; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=D6//4Nt8; arc=fail smtp.client-ip=205.220.180.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=biamp.com
Received: from pps.filterd (m0278265.ppops.net [127.0.0.1])
	by mx0b-0068d901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43IA02PJ001470;
	Thu, 18 Apr 2024 08:18:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	proofpoint; bh=TYkt0GyR2XYJYRvQLdfsecGxirOEGXXarymB/iwkbWA=; b=G
	VvgJpPKSvjposQ+Npeu1+SwV5jeovXySXlgXWnd+30Sg56vWx5hzJKVvia3UCCF/
	FFJEI91tiS0hzBTb76cNIiX1inEI9LMYMDDw2Om0SqJc6xLYkBBnPMg312RwaM4w
	EHuqvAiA9x9xVtiUS/WwGhgIUY1lBT0xqaL+a76P2v3w1Opd9OoECXpv4MAVFSBS
	zxnIMKnLmf2vhcLk8YU2KEccGKsllzw4ds6V95B10Hh2HsHc/mJhD7IFbVS/uPmv
	PJvIQc8uf/X+bFLV0RcaJ1xUOQ8Od7tNXVyrSpiJxAMLAkxE0g6djPsAsx66K/J3
	eE86EVjOI0+d/9yk2AA7Q==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0b-0068d901.pphosted.com (PPS) with ESMTPS id 3xg40v3aw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 08:18:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nymbjsuMC+lFudRjQao0e97Ao0mxfV4Ssdv+NUTZKUqDS5LPdo4e6akr9cI+Jec66+dwipiyBM712xYhTAz0jgp/8GkiJ3o6Www1cKA3oyjG6Y1JThJC86POrjb/7TwhGcr+ScveIMyPQ3AzeQKp8ImPLryYS5w5udJ++wfIhmfMYv5/ecZAZ0DFJkRl9DhbFBcdcMIy+T3HNsBBN0WU7A+w96ZS48xKskbCDD622zIdUNeC3ZUOmaqTsmmF1HgDH6F/byZ0JYkHhuenuN1tRWdMRADFph8Ddm5ee40EY/9ronY3kM6AzV9fyvQvVLx5OrElMsxyhV7pbXJrZ4evkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYkt0GyR2XYJYRvQLdfsecGxirOEGXXarymB/iwkbWA=;
 b=d1irREQat2qzvPlB4MMMl45hkPG/DDaMN1XJnG1HdMP6qCDx5JrfFPm0RVpLJFVyHFLn3M1Ps8LfeA0M9Nd3oRGscnQxPvFDPkZE2bnCeAlWxRJA4vT8QoWeyKTqWMZa62uqYAO9JUnQAZoQoBsXZniK/2NicaNfeBqcRV2+gQOcOIEM58wRpi+Do/3Oi1s8QBnxdaNbZub1vPkYF4raJogcb2HxBhOtaN1QkbVY6ShJpY/fXf6RRSKE1avQNRt3eyJycgbcPtqapNDs4SCabIZpWNLD4YgulNgMfwGFvq1w8fHeC5tpohL0J6++e08UcGz7zV/dWK7CnSg2/BjO8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=biamp.com; dmarc=pass action=none header.from=biamp.com;
 dkim=pass header.d=biamp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYkt0GyR2XYJYRvQLdfsecGxirOEGXXarymB/iwkbWA=;
 b=D6//4Nt8YAeTlQngNsAm+gErIv4ee1JbbiTbCaNomXWgkPVquGrxy3DzzXU71U3RGn/PNUzmp+DZ83j5xjbFrYR3G9UT53pzxi136bdElQQy7vafSugyzl/EPLYnB/LAiYyox5kFKiKMdrb4lfm6j2WA7M8bYtGL+bX1wxRiV+yVgbx6lcXmDG6RjcBfXiYCa3rMbo+XpvHcyNSy4qVNuW17F8Fs3T45JU9xib3O4K9H49Lkl/s0gBdaE1YocoLy0TyAbN637G8xV2oodGKfU5bVbkbdUkNrkFgZOK3Xkqnk74/8bjn1fUIxZbOqekLQYxGWaFulxQOmX6s+4RQRpw==
Received: from CO1PR17MB5419.namprd17.prod.outlook.com (2603:10b6:303:ec::17)
 by CY8PR17MB6378.namprd17.prod.outlook.com (2603:10b6:930:85::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Thu, 18 Apr
 2024 15:18:31 +0000
Received: from CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555]) by CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555%4]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 15:18:31 +0000
From: Chris Wulff <Chris.Wulff@biamp.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: f_fs: add capability for dfu run-time
 descriptor
Thread-Topic: [PATCH] usb: gadget: f_fs: add capability for dfu run-time
 descriptor
Thread-Index: AQHakDpo6LKkehmJcE+I+KBBFalSurFuHK2AgAAIqgQ=
Date: Thu, 18 Apr 2024 15:18:30 +0000
Message-ID: 
 <CO1PR17MB5419DFDED866D65B3715AC31E10E2@CO1PR17MB5419.namprd17.prod.outlook.com>
References: 
 <CO1PR17MB5419AC3907C74E28D80C5021E1082@CO1PR17MB5419.namprd17.prod.outlook.com>
 <2024041850-atom-spirited-3369@gregkh>
In-Reply-To: <2024041850-atom-spirited-3369@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR17MB5419:EE_|CY8PR17MB6378:EE_
x-ms-office365-filtering-correlation-id: 4fd64707-6c4f-4571-46dd-08dc5fbace50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mfax2o06qjc7l1cZjgaYyskY8P2gnVoSX/udDHBmBTrT864GSwl0JsowavjwRoYc+gnfnjCU7OWHkSEQN1PsqR5THF6yGNF7PHFVeORmg00dKXnASllmiAqm4UTnSRBrchr9rJcyQrI1EVr7lkn8Lgb+9x7GMBxkJwdXwn6cxuTEq0AsOzOtaawQQH3yiSNzedKKudc6FdexhONCr7s8NIQFl0KUSIFq/kFkx0PokM5dS/v31s8/bXuZeG8CaqckYMOD4KLmcShHmt4mcmYfoLoslr6b2xE8hk7z6E+7IaM1E4XamDD27WKOZnA7hfa8n76vZ3LXxYJveLa7hcASMXiz3SfZyUw2gBUTCKJ2B3DIydbS0VwoOBXwj42lKVmMJpXFwDLqMIfjdR5vqXO0koXoaa9upUqFDeH3uKhLIOmiAg7CI/jEA4p0kJqZx0s4M/lkXkGJhTfjc2nwP6NkbhkwXoBCkZYYNFvMsjmnAOzq5rtW4rk8qdswuN09Z0bElUYHqbsbAPkNRTWuQUAnLZSx0Qmsaio2JxEDMiUr5pgxb2Qb1kTCaG7gLI3ysKXbVkDVlDHzUaDktrskQ7+xf/Xo7VXy3qv4y5rgPwHiYRDN4G9AYoLjnvOpSlrG1Gy15meOQ3PKHzOL74Jb7C5DD++AByb/Pw0H6iYakdiCR3K9Ccz8hSWquvwFHrh3rm7cVhKlMvmEVbsMld/wtnkmww==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR17MB5419.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?+eknmNOXAEH04DRdx2GKHPnGYLvXMFtIIkOyCCz5wz9hIovbjs186/JQmh?=
 =?iso-8859-1?Q?1wKgLCHVfFVCi1bXcK37tWv1yDJH2EXYN6VJvUFFyNx+KocG5ZHFRzt9Ig?=
 =?iso-8859-1?Q?THJzLFyDnfyU7XDNtAaZuf5pjOdf5lxtoIfaR6BYUVQF0XRurlYux8baYn?=
 =?iso-8859-1?Q?WScO2U3ahngg0fgRAgcYYGTIMrmqn5zo8qjHKN7OiqDaoxjkiKozqJ7VFE?=
 =?iso-8859-1?Q?LVdEjnzLn6artbdyygrKLUe5MkSVcBhHPhdt44vciCBtTZMrUqku2acUjb?=
 =?iso-8859-1?Q?eiIK3zqZJ7eHgfVkZ4gUWMnxH+0nQS0vDvg0iPD2HRYV1Tdy8pUY0naHnb?=
 =?iso-8859-1?Q?ZkbRD/Atac7R0cb6pRoZ1r3XMzWQbI9AB6PbTFbPNopMkWiFpc6LtL979s?=
 =?iso-8859-1?Q?c+v1PnkWdtiDr6WnfPfy2f/EW9eM7s+0ruon8VipKz4yZkk8gndTlfTQrm?=
 =?iso-8859-1?Q?VwdznkAgJgcKnyReXihrC+T5xHVtrv8n0UPCKr/EGRWle+UxgNd24lHUrW?=
 =?iso-8859-1?Q?yB+pQKMJSaxA2hAkdModJtcPvyUVETu+6+oNAv8ynseotS3dktB4ATxyqx?=
 =?iso-8859-1?Q?Aj9b9tyKN+/bzNH2jRPp6b04PkKyaNwoB1pxgLwuV2Vr1MFlIf2VgrpXp8?=
 =?iso-8859-1?Q?S1S787NHgDGpVnTnEAGrZLzrxSD+0bBupPX8TstGznOWeY5QyvxSDWy8Vd?=
 =?iso-8859-1?Q?VN9bltHIcf378BjurGxpiWpYok/EobA0Z6U+Hj/qhQpGLrv2BoudFUtzDX?=
 =?iso-8859-1?Q?sn+sydfnMRVCUVLgnUMZrwNNmIRdoM1Roj+78SbmAd64TkbexDPdzzo+uG?=
 =?iso-8859-1?Q?jwxGVNiCL3u1XKWQCtaKZlWXRD+AnxxpL8KWrCwuB4/lPzkjiV7KI+aPBF?=
 =?iso-8859-1?Q?5C3aBSxnC3MYR/a0zFP0CXjBhXNXdYP7dIjz03KotNSPK/mOHb2hiUX/De?=
 =?iso-8859-1?Q?sN/X4klCLZ4QYCCGsF5zRkrzhxyDNukcLogv38PVYKOAXiUWQ/SCcULg2e?=
 =?iso-8859-1?Q?PstD5grv9uqTbFAcUtrqU+0sMRAdp0cBdZ8wiHRQ11f+RTnmX8n1u5tfpL?=
 =?iso-8859-1?Q?cETHRE6/SvlbmyBV9sFoTmxvkXKnWufjNSRLzktM+xXHMSJxBnCpooxqVg?=
 =?iso-8859-1?Q?kOlWtc9mOF8LYCfNos2QLEKsPW7Ngd1HqcpgpEwO3LndJ/+HG9MB7an2BK?=
 =?iso-8859-1?Q?UBWEWKVwuC5M22bs5PxkzkJv2Su50OW7cjRESGBYeVhULr3oUPdqH9zWi+?=
 =?iso-8859-1?Q?/7BcAOV/fRHn6ZKLKDcongV/HuxsA1wFkateTXjcg+Zi+vjInH4IoWPIJs?=
 =?iso-8859-1?Q?xyTy0fli5474XPUw9+RHmUlaZmen0FnMBKwj8ujulX/P7C+j+qstE/BmD+?=
 =?iso-8859-1?Q?q6DHmjfN5gKj/UciUUYfi/sDWTIaMQkiBEZxjYfGi/wFBOyOEGzb6sjriJ?=
 =?iso-8859-1?Q?/3OPaHWV3pwCRxuej3yMOjjWh/zn/L+NnJrKkBSpqCrldZiHPIT7YXaXSp?=
 =?iso-8859-1?Q?28wnucMuZWMxOFsh6JBkwj8h2aEavvs2XRiKTFDevVrNBTEPr9tY/nXpdc?=
 =?iso-8859-1?Q?y4TqvdrJABXQ04ekSi0mkQMUKgk+WDqNFZ54uZ1+ggQqLhgNv2bFM67szz?=
 =?iso-8859-1?Q?olk+9RzC2qSETZ2twPO8pBaiS0bLsbK2tQ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: biamp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR17MB5419.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd64707-6c4f-4571-46dd-08dc5fbace50
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2024 15:18:30.9506
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 341ac572-066c-46f6-bf06-b2d0c7ddf1be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1ygKhVOnGbAUsM2u1roykyX2zFlS+Am3/MYHMt1Vt1+sRb4+cY2q4J2k1XYCQRo5vvFCWwOXGbiGGXFKjUoYdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR17MB6378
X-Proofpoint-GUID: TJR-6P8_yMgXukWcGCP5VoeSfSj1yzUR
X-Proofpoint-ORIG-GUID: TJR-6P8_yMgXukWcGCP5VoeSfSj1yzUR

=A0=0A=
> On Tue, Apr 16, 2024 at 08:15:03PM +0000, Chris Wulff wrote:=0A=
> >=0A=
> > Add the ability for FunctionFS driver to be able to create DFU Run-Time=
=0A=
> > descriptors.=0A=
> >=0A=
> > Signed-off-by: David Sands <david.sands@biamp.com>=0A=
> =0A=
> That's not you :(=0A=
=0A=
David was the original author (we work for the same company.) I am trying t=
o submit a number of patches with some additional fixes from me and I copie=
d his original patch text (which included his sign-off.)=0A=
=0A=
I assume I should remove those old sign-offs as I can attest to the suitabl=
e history?=0A=
=0A=
 -- Chris Wulff=

