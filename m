Return-Path: <linux-usb+bounces-7329-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4666486C975
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 13:49:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFD9A2859B9
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 12:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC647D091;
	Thu, 29 Feb 2024 12:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="PSCWqjjU"
X-Original-To: linux-usb@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2066.outbound.protection.outlook.com [40.107.117.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7354863513
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 12:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709210935; cv=fail; b=EJ+gCFl8Fg6s0zjhQlX6pV4hRMN48b3yaPMeyeL0MjxkycYyALC5UVy33uNra5M1kAxIyQKyCRzxTJ4sgd1NE/v+sLajWGFOT1vC1bKGQoyGuZ+As3YbiX8elgGZG2AfCbfnx+CwWN7bcXZcE2ftxnEFSfJXC+NH6HuSHIKLhVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709210935; c=relaxed/simple;
	bh=JZU9vYfvwrHChog0B77gIVIFiTSlCN0DOq5OgZFhXBk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GYYyY9Jpv7gDXKK5A4oUAVi0Xfc1aS4x3E+Q9uC8iJDlPITLsFjvC26chwEKRrYZ0CQh3My5nGL3ChkIHH300rHsV7XrKnnQg2kOoy+4fFZBV7wW/iWwAolctXnlfDIPTILMRixrII3LprMeWS5Fc9+OA4nRAm2EqZQpyAfF1wA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=PSCWqjjU; arc=fail smtp.client-ip=40.107.117.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+fV/Z9EQcsrzx1+c5fb2uCeTOaeY6ua44+A/kyTrXYu9TrSaXStIR3UpQfViU25Gk6ADOJU4ShfsjQobVu7eNvQdWBKSTb97lDArZS2/zmTR/X9349T0NBgNH8F11nnSP5ap+KPIigrTrKKKw3vXaDy9YcCwLDf7e+2qBUmnEa+l7siFlPQyrH1tq6WvmbdQM4j/V3YhxGJb0p436bT6lYQFA9WRYgh6loXB0ruGTxQxePepgyw2fXSt8CY/oYjJGsXFNCb+45jwAobWAVZ3lKRHzgOZtFfJDFELGs2bQBugrRyrdOs0WJ0ZWU0PoIoefu7Axodv0W/tZ3XS3IRIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sKGtGxJTWxWJG6I5NG9ORL4yYJ27S8jOcDMDiR4gWQ=;
 b=PyMeOtoMvB9+8vS07jvK6lamYGf2IEJJP0mW/EqOtH10JB3FTos53fLxPkNxdd+5JCiVDizA/IP1SbyCoDs1GCJpqd04ip/mWcRq4lSsQPzZMm63EL2awlvL30c25k9hC8FrMbcND8W8HqIBw4DU8DtjzvSoEvxjwptdcUfcPjsg31n3xDraqoPaIgL456iVlXk8Ng53zaqBejlqqxy/l3QRN3e0G/c4kKhLCq636l7xCD+FiiXProG0/gGmwcHGeWfinj07ktb2HwXH5t4GzXKMF5i5uohvZ2CTqsRUp1ANQZV3gCU4XEztFYNreYQPLBxskLHyyJADccnZK7Al7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sKGtGxJTWxWJG6I5NG9ORL4yYJ27S8jOcDMDiR4gWQ=;
 b=PSCWqjjU38al+KTsHxXFwjL5oxvFerHl8hwLrxVlhCNH1/V/tpgAhyeFKDLF1QWwmDiWF94+6IqudaffFbJGKliWK2VI79JoDpAk6vDtjviWD9uuxH9w6XdJANmVgngWNX6Hc4s0gREBGZyt53HBh+2EfFgqPzf0EDL/dBw+sJaleydX6XDdB9gFRhRGeoN3FN5o4WGqCXh1CYBKxf2ZONfzStAjKA01gSO8+/rGhLODEtufLJIUNykO3Z6SAKbb7pItw6Qrl59T4SoyUHc1+jPBQyFWiRy3U/tH0aYLiSN07nBP9ntZ8TsB44R1qpnGtCWqwlnhrwKu1S56cOPo7w==
Received: from SEZPR06MB5439.apcprd06.prod.outlook.com (2603:1096:101:cf::14)
 by SEYPR06MB6614.apcprd06.prod.outlook.com (2603:1096:101:177::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 12:48:47 +0000
Received: from SEZPR06MB5439.apcprd06.prod.outlook.com
 ([fe80::dd15:1091:7bca:2bfa]) by SEZPR06MB5439.apcprd06.prod.outlook.com
 ([fe80::dd15:1091:7bca:2bfa%6]) with mapi id 15.20.7316.039; Thu, 29 Feb 2024
 12:48:47 +0000
From: "mohamed.rayan@siemens.com" <mohamed.rayan@siemens.com>
To: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
CC: "andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"michael.jamet@intel.com" <michael.jamet@intel.com>, "YehezkelShB@gmail.com"
	<YehezkelShB@gmail.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "mohamed.samy@siemens.com"
	<mohamed.samy@siemens.com>, "mohamed.el_nahas@siemens.com"
	<mohamed.el_nahas@siemens.com>, "ahmed_mohammed@siemens.com"
	<ahmed_mohammed@siemens.com>
Subject: RE: Inquiry about tb/usb4 driver
Thread-Topic: Inquiry about tb/usb4 driver
Thread-Index: AdprCRmGtqXIwnjnQTi2H+/Zl7qFWwAAgKAAAABtamA=
Date: Thu, 29 Feb 2024 12:48:46 +0000
Message-ID:
 <SEZPR06MB5439B1EDA735894215D6263BF35F2@SEZPR06MB5439.apcprd06.prod.outlook.com>
References:
 <SEZPR06MB5439E9D11593D4550BDCA4AFF35F2@SEZPR06MB5439.apcprd06.prod.outlook.com>
 <20240229123042.GH8454@black.fi.intel.com>
In-Reply-To: <20240229123042.GH8454@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ef387459-08bd-445a-aba2-515feaf95c0e;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-02-29T12:42:56Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5439:EE_|SEYPR06MB6614:EE_
x-ms-office365-filtering-correlation-id: 7fc3ec89-9fcd-409a-d9fb-08dc3924c527
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 C+E75ZQ5pwrRnxZDips3tzfvbK4O9lnS+GqlVGvt+Y2MgdZ2UaCrfWnJCpotZtcfUz2uQjj5dgGW2N/o/akNKl6mNGsbiRtU5CEYTY/jwlHDFj+kOpA1KnDIW2R8dJDidgyL7j8G/SBRcbX/Vu6OZ2MpmNg3p1Ffs9AFu3MTAIUBquRCTihHbl78VrCUvHlGuGcx0/mRBGcMjoDMdduGo6WOmPtXPGc8karBsqIXCS1VlgVhjes067keWY/de/vqa7vO6uxf92NiLjTfBVWzWqpogxnDeIS4+seh2cCqu/8uaE+Dk7BvMNtq2TGROKsp5aB5qBc4sI1wxvVQqBF5oGqn7+zpXb2ZbKRKbI5c+fCt2mUX2MJ+xwL90Enp1p3Gmy1nmbgOljA/3pf9O+3GBT4Z2dm7Cn7XS6I/LL/chzQjzo6iQk97UwxoVWuFIpRI7PzA6qVf0qI+/f7i7TcXvbl8QDkJbhEwcbrfbh46nPD9S1iCKO7FPk9VNO5wZBHTY235XA4Vxu0ISRk9rT9K9ZLs13dRXIQbwbnTD5ljnzfnM4UQBw6o8GXYDMcEaP5C9u05Q0cJxdSXZ9egSizWlzIkmHM46UCryUN+BorT1eBk9Kj5C2A8odkNYyrkJ0AmIKs5hHiC0h9AhrRa22fLbw/6Zgi4lNOAg8535ZBuncH7N1CqurKBR5eJwUv8GhBRwQAdzz8kP86AB5pTeo+sIh1B1Sv38VpV/m20a8OnpwfsHxvOrJQ1IW5peAfI9oiF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5439.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009)(3613699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pbY3ktEpVToKV779HwlzDBf6Gcr9fvviuRXj/FCnLx5L//O1kNxJLxHxjW?=
 =?iso-8859-1?Q?2c11zFHo3FghDAyJ/CkrhuRFl63j1cNlBNv2vmUBQzOHHmw0Y1IyRhU2Pj?=
 =?iso-8859-1?Q?6K+whOuTVqgt2QfSZBc96TRhjEPvyxG7NfrqAO4et9ZrBSwVT0efAHMg9Y?=
 =?iso-8859-1?Q?sbN6zbGgb4c9Z93Ntay6dKXzV367nYSTE7bjHeFZZHdP3AAIE7d3K5WEmO?=
 =?iso-8859-1?Q?pCtePOOudTuiU0UcljEJvfUmTiwxC/XLaYgGLqh0SNexo12NvA62XAWPWf?=
 =?iso-8859-1?Q?NVpuv+TB5Cj5+EvYH9sJFPXVPFho2JzG7ETOimdOBt9yUaPs8e0PQqVTtq?=
 =?iso-8859-1?Q?ThynJKzsIW5sBCRvGZ2eGv7z0WLYI7rLMDha8Dt1mK2MGJBW+t5V80fYEm?=
 =?iso-8859-1?Q?06i/fd87W20kI2tEjGXsZi8I9T0nmAyB3yhpyqb8oF6LOtvR6qeFqXeqZl?=
 =?iso-8859-1?Q?wEoIoJI9j2yuyfSa8AfuoLalZVrP+fVEIag09rds11BnnQ7Nmy8mT+HzUq?=
 =?iso-8859-1?Q?HntTw+ClRDe5/0FodqlxABA04oUXr8scUHpwceym5moyVMse1tcoizA+uK?=
 =?iso-8859-1?Q?Lgbi3nha55Y8yfSCFGYAwkpnj0wlyWST624lf7G1jM/kO0Bo9IX9vaOKj4?=
 =?iso-8859-1?Q?aoqv2DyFgxG6sLBGHwhzt3M6jXe8gupwgdCNdHFqHHqlJ6/wAqqAJePqXP?=
 =?iso-8859-1?Q?IKi+9fGenY1gj2obhFTxut69fayH3CZ3nkTx8HEDJfMpExL42Zcl4YfGie?=
 =?iso-8859-1?Q?3hTrhtQOG96RIMsgyr3gVfWNKEXmcvlSz6SkEvDi84fU0FJdshgtoPt0Tv?=
 =?iso-8859-1?Q?wM0G/GiL6XSYg7dh3vA4X2bCKRbckELytUHemJGtgHGT9dcJCodos/gAA3?=
 =?iso-8859-1?Q?qqFjqnvInTKJoAIU3b8k9IxZpo8vB1xR9+lBMBF/rHzWmm1c6O+Pa4+nKg?=
 =?iso-8859-1?Q?K/fsachiRrUWtFPMRflciW0+0htobMCHItskscs26zgEw3FXwYZ41+em/P?=
 =?iso-8859-1?Q?KWEgWpkgdyE9xlASdPl7ln6fPYmegtbm4ldLSR+V/W2X5Kx1Z031L/2FKK?=
 =?iso-8859-1?Q?84TmGqLnsNa4e1JkKwjnXJfCKCe23jrsIXxwZ/nagGgWbMxWFLiMWK02Xm?=
 =?iso-8859-1?Q?CJhyZrakrPQc9K4Owx1eQxOW/elahEq6EzS93irWqUXK0VhajIdVlg775k?=
 =?iso-8859-1?Q?KkOlIQq7aj9a1T07hZAdnKhpwJpfPV/xnx4hwvQ9mt/3Dk6MjvFREOFnAo?=
 =?iso-8859-1?Q?D6A17PSnHnFRGb+lvhQ/yKIMb86cjRZuuwhKY5m1flS3wo7aNuWithIPzN?=
 =?iso-8859-1?Q?ywoCpUt3XzA6EoTAk+J0KrtbI2MDw1+fkSmXzGoYbRUrZMFhr3mY4qc2ta?=
 =?iso-8859-1?Q?s5pSPeu3AMaPPffdGO7HmnYTbDW7BnLqe6beJcI6IR+IhXSWh0I/XwnHQk?=
 =?iso-8859-1?Q?0X3dLZw8uQ8qUqwlye2ZbDm+Gd+F0VMNigIJW6cSDcqwvXO2Fp1mL61R5u?=
 =?iso-8859-1?Q?8FKfKNL13KOHGrTw94NBLz1AHNwdm61j1U6a6T/6AUu8gdxpzkU3ID7JmZ?=
 =?iso-8859-1?Q?HJ0wWSbC48RcSzb8BebcC4VRJrVPM1BM1d+pOLOxKMbzCz18p8PtrQb+rf?=
 =?iso-8859-1?Q?v1bJCqGrfC7uWEaFvcq7CRKgzXHP/N53dL?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5439.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc3ec89-9fcd-409a-d9fb-08dc3924c527
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2024 12:48:46.8518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6IrIB7Slf3zbv5S/LI7q7NaobFI5xPm8NhQ4Ud9R3fqqhgqRB5dLsrOKaDmWgENProuWqzIYm/rU9vgnZ+9k0agnvn4IR1jLhSZQG0RgUpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6614

Hello Mike,

Thanks for your reply,

Yes, I see a problem in my case, because When " tb_cfg_get_upstream_port", =
" upstream_port" variable gets updated with wrong value not the actual "ups=
tream port" corresponding value in the Router configuration space of the US=
B4 host controller.


Regards,
Mohamed

-----Original Message-----
From: mika.westerberg@linux.intel.com <mika.westerberg@linux.intel.com>=20
Sent: Thursday, February 29, 2024 2:31 PM
To: Rayan, Mohamed (DI SW ICS MNA RD HAV4 VER) <mohamed.rayan@siemens.com>
Cc: andreas.noever@gmail.com; michael.jamet@intel.com; YehezkelShB@gmail.co=
m; linux-usb@vger.kernel.org; Samy, Mohamed (DI SW ICS MNA RD HAV4) <mohame=
d.samy@siemens.com>; El Nahas, Mohamed (DI SW ICS MNA RD HAV4) <mohamed.el_=
nahas@siemens.com>; Hassan, Ahmed (DI SW ICS MNA RD HAV4 HW) <ahmed_mohamme=
d@siemens.com>
Subject: Re: Inquiry about tb/usb4 driver

Hi,

On Thu, Feb 29, 2024 at 12:18:31PM +0000, mohamed.rayan@siemens.com wrote:
>    Hello,
>=20
>    =A0
>=20
>    Hope this mail finds you well,

It does but sending HTML has some issues if the receiver such as me uses te=
xt based mail client ;-)

>    I am sending this mail asking you for some help in the usage of tb/usb=
4
>    driver,
>=20
>    I have downloaded this driver for kernel v6.5 to install it with a cer=
tain
>    USB4 host controller, Here is the driver link:
>   =20
> [1]https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fe
> lixir.bootlin.com%2Flinux%2Fv6.5%2Fsource%2Fdrivers%2Fthunderbol&data=3D
> 05%7C02%7Cmohamed.rayan%40siemens.com%7C1c2fa047920349b1524608dc392243
> 2f%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C638448066550189604%7CU
> nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> WwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3Dd1OOH9C3dVRNlwo%2FEEXyKDvQ2s4xboR
> 1TMiBV2m9MbU%3D&reserved=3D0
>=20
>    =A0
>=20
>    I have found something not clear to me in "switch.c", and exactly at l=
ine
>    #2260: "[2]tb_switch_alloc", which is responsible for allocating and
>    initialization a switch:
>=20
>  1-=A0=A0=A0 This function has a local variable called "upstream_port"
>=20
>  2-=A0=A0=A0 A "tb_cfg_get_upstream_port" is first called to get the valu=
e=20
> of "upstream_port" from Switch config space
>=20
>  3-=A0=A0=A0 When I checked "tb_cfg_get_upstream_port" function, I found=
=20
> that it reads first DW (DW#0) of the router configuration space
>=20
>  4-=A0=A0=A0 In USB4 standard specifications, the first DW of the router=
=20
> config space is Vendor/Product IDs, not the Upstream Adapter, please=20
> check the below snapshot from USB4 standard
>=20
>  5-=A0=A0=A0 Later in the code of the "[3]tb_switch_alloc" function, at l=
ine#2297, this value of "upstream_port" =A0is used to overwrite another var=
iable in the struct as follow:
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
>=20
>  =A0
>=20
>  =A0
>=20
>  =A0
>=20
>  6-=A0=A0=A0 So at the end, "sw->config.upstream_port_number" will get up=
dated with incorrect settings, So I am wondering if this is an expected beh=
avior, Am I missing something?

This is historic to support Thunderbolt 1-3 devices where the upstream port=
 could change. In USB4 routers it is read-only. Do you see any real issue w=
ith this?

