Return-Path: <linux-usb+bounces-7072-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64119867199
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 11:42:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5771D1C268E3
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 10:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5FD3A1C3;
	Mon, 26 Feb 2024 10:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="VTQJL0/r"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2044.outbound.protection.outlook.com [40.107.21.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BE98C05
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 10:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708943562; cv=fail; b=I7BTjGxI7HI0wK4UsHNE/LU7c0mnrcXHJWq6KQu69298aCr/M1QMhAfsgiym2SVyTO2qHXtT/8IQ5VQAvL+FtNQBdInEiJ6DBDyxpX85HWEcBuQtau5v2gX7Icb8g6loTCXzofTHbJXwxmHjzGHWbyMAZRVmBRfUB5Hh9thtLqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708943562; c=relaxed/simple;
	bh=3Lg36E7JzyMdmNM4b1hurtxSVcVYa11fxngDyWd1EXE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h5ftqJ0oD2gnXr7N12NphPPRNjAsHPrHZhoc8rF0H9PfaFw7F2clNwLeY1NILeayx6pX4T8fwDtHEGPGpZlUZWk5WQNT2qAZs3OGM1vJMBjGFa2dGeR5ScTwMkrre0FHjgJrJHHjfaZnGiDaaH5zKczMQg6UMaalIrUUJaVrHd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=VTQJL0/r; arc=fail smtp.client-ip=40.107.21.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJD1rAcQQop/CaF69V66JCWv/j+ih+9M5Nfj2LmcRkiXJipbl9xJynLGUNbkmfTHZwMukWOFicDZx0DgfNTmANPKezKrxt4iXpTC7P7gCGuDnB6Ji2yXcZzAP+wPIyrw/8J6bPpj87uVi+HmDpTVAtrvaD9IbYNOf1zxTd49PUp5rk3b7UULI8n+9w/O/r7BYpJ/MO9SGPppHB2GXsCn3rUR97v0RbNqpbpTxouWF3iBSa8FOEcRzY7Ghj/UrO6mpVBMvKPUIMwETOx+r6nu/cZsgZHFSTS1tmKcQko+eAgP12hXraNG6hz4rGVSY6YmLc+oHnDjKfIcqf5NDKV7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GO4aq+DxvekVs9xujgNkQFkCf4jjufqZKZEb4QK3ms4=;
 b=AmDJSAPkHpKoJ5eiDZAl+z8r4ItYxoJI2OvGANy4nZ4Q5FolUu/POnvtUC1rcPB2q2L8+GgDochP9HsB2EcyMxiulM8W/Ggp98Z/vj/45wjXyY6VoXYG56x4YHz9fqmSWjE0B2mz2+CYi+XRoUZQHG2LwegSkWra1A6dh3AMOwTiPuAfcc7kUPBH5IiPVQdEUU1GLZDSYCLPh6xiZe8EYCkVPExm5y7pbdWKbxMpiDvfIfvROf7a1LIpEPgFEvFDjnNtIfumYSf3Zs5ubFklxtjWmhWel2ZuCEWyoVkYghIsEX0Yz2kRKGqSi1NWUAeuwqX7V7BTU19QM9Re9ERUbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GO4aq+DxvekVs9xujgNkQFkCf4jjufqZKZEb4QK3ms4=;
 b=VTQJL0/ruMJIeDDyI0Xpe6abwX9mxxstgILbRxUcryE/FckMNmrbWud/EvyqQlLhEZoP4neUhhsVaUuqMYZ+YzSUH9RTSGhjsXCGYvBvFEcVYLlqmlMeyxRDNj+qLEj0OBaRzXHYGHm7jqYaosXE5c/tkQH1w5q1p0UuMtYGsJk=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM0PR04MB7139.eurprd04.prod.outlook.com (2603:10a6:208:19d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 10:32:36 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7316.034; Mon, 26 Feb 2024
 10:32:36 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: =?iso-8859-2?Q?Ond=F8ej_Jirman?= <megi@xff.cz>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Jun Li
	<jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: typec: tcpm: reset counter when enter into
 unattached state after try role
Thread-Topic: [EXT] Re: [PATCH] usb: typec: tcpm: reset counter when enter
 into unattached state after try role
Thread-Index:
 AQHZ03iJxTdCLidINECJvoMPDcTmKrEE5imAgA1nOGCAB7KhgIADCWCAgACE0ACAAAescA==
Date: Mon, 26 Feb 2024 10:32:35 +0000
Message-ID:
 <DU2PR04MB88223D98658B6EAEDC4B4EB38C5A2@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <20230820151518.1403006-1-xu.yang_2@nxp.com>
 <odggrbbgjpardze76qiv57mw6tllisyu5sbrta37iadjzwamcv@qr3ubwnlzqqt>
 <DU2PR04MB8822C9D65EBDE43845D369E48C512@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <fgrfpifljfg64uz6vck6viooqy4zhd2f5xi6e52m6jsh6vt3wi@6c4nlklkgbe7>
 <DU2PR04MB8822D2EFFD69F1D57872D5428C5A2@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <xcph2eiyvhlljd275ljhxcrzefmq32qzcens7teqrjqi2euvgg@bhlsgc3o3qfj>
In-Reply-To: <xcph2eiyvhlljd275ljhxcrzefmq32qzcens7teqrjqi2euvgg@bhlsgc3o3qfj>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|AM0PR04MB7139:EE_
x-ms-office365-filtering-correlation-id: ccc1b36e-5e7d-4204-1d49-08dc36b63fad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 UNBj92xrPj7lL5zNQdL5/dRLAVPyd+Idqvxqkbx1krLYhJMwlwTwQX+A3nWRrKXup8dywo/7lgv5gxUYPUVE/wnjxFfxs/rHC7w8gDSpE8FqCnsoaWaezHhmaqAw2lr/0NHgHVsG/eYLVdQ/SZQ9vewUCYBbOUD7XV2/Mw3UHsMfV5uhzp6Mm8zYAA9a1spM4M4SJ/NtLyK7z7iXRMh8gGmmdz70kTP39EbpnrxR650QTJZrJg36L0gvzNf1Gzhghztalr1D16qhiqq7NjJhNSPqRU5AA5vZHDsf6X5KSWb9JqkZgW8Hh7siAGQBGUfpJC159kZ8441h29l7+g08ILa9xDi2lkGXLAvrkzYgT4ERqOoa2JxJM1Csht7DYRb5JrT1NAwImbPQtIX0NWusnn+JM1O7bfW+oECzn1ngILbYwzPOGxlPQjRbwDIij7TC01TDVOCG5gaEj67BwLv6M5z3UZLOK9zqboR5ldkrCWjElpcV6jdqDJleA77AjLeKAwJiMnTw1HQqSPf2EqWpTN/32gw8v1KaKJPK8yeTiQZCAGAlZap2/+rhtlojJ9xtWSD2wvk2M4tA8EeTNoSKCtMX5ixrATggQp6G7ioYrDB23KZ1T6mKGpe7/9pL/1FKoGsTgNVGHpfUYHAv2kkFwQeiCRLIrIvo8MbQ5h94C13cCR9w/9VHzOHRTl8MI+Casf/1fvFYIPT+6AHWV/H4mg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?WB1uPY3S9MdFP6GPV5hL4yzZWnIwQ7lEgv20zbmkcpaC4LkhAtpNztA+8Y?=
 =?iso-8859-2?Q?BtV00G1HJANgmi7BDe7wJ+zoggIXdn902F2jgGYJ6FBxudWX7xItnSCy1+?=
 =?iso-8859-2?Q?pfsQx77IUNo0MWRba4mgH8yNRx0YSIr0PdEEStbs3QBBpm5KvzpZ9OzYlq?=
 =?iso-8859-2?Q?U2fOonTIvzH31ConbVDJirPLaVzbGzWEze4sUdD9VEfXq8qyuea7rvCfub?=
 =?iso-8859-2?Q?bghfyymZQz8Mh2C3ClrqLjCWukjs/+N8oxubhbmtDvvDjcfwqJftB8j7Ch?=
 =?iso-8859-2?Q?yGWXVjNQ+Fw5WScJmiCv6x0HxdRmmUPgWStoT2X4pb9IwaGCjhBXcCOE5w?=
 =?iso-8859-2?Q?zMZfSPrY0UMSlUfmn8MXwwqd0qYjeMrccWwwAkL+JUM7iU9HLr01wideJI?=
 =?iso-8859-2?Q?h+M0xgCVsawXOKDwJtDBsKJ2lwEyLICBH7pY16T9MdrjARQW4fbGXaY64W?=
 =?iso-8859-2?Q?CbVYReWcVV7C8lUEyEsVOpntAW5ZO2E2S6FW/8p4OuI/rvpj6xhgNh27y6?=
 =?iso-8859-2?Q?Al7iZwXQ929Ga0h/yTR9uE44s/e6cLHBZ12X4sJ8+qXS+nWMaR81/yUr5l?=
 =?iso-8859-2?Q?GmIsC3lpZWa1Pa4Lo6DqLrviTWvfKsWFpvZRf+vw5O7Ho+EwPaqeKxukS9?=
 =?iso-8859-2?Q?voOGMc6lkTrdjUzLK87AJtKQCU3Bp/TB7bQed8O/dlWdfbE7yC2g5AapEQ?=
 =?iso-8859-2?Q?2pdvysLeXvtIN/leBn3fEJPOPAIp34VCdp+00+tzONgZ1YB/rOny52G0Mf?=
 =?iso-8859-2?Q?I47T04YmzmRAhjedvQoahByt4AEoE+YQe5kpQnxC4Q1ym3hkjDBNYllmMs?=
 =?iso-8859-2?Q?Uyxyqw6DI/rQCbpfmaY+l6M9yr8SP//Ks1dEQDnK+PoTERBiDXHUNSN4Es?=
 =?iso-8859-2?Q?ztpiXXjzdXNn8p+XxIJCkCNY4mY1ZZomyLPcTwvxayVj63xMO31NypkJEX?=
 =?iso-8859-2?Q?xffRUUTOA/JA9qWen2nXXZKLPCM3LHobzWQ7YeH11/SFMdvhGVvVIQwDKO?=
 =?iso-8859-2?Q?k6cCCxIpMs5wx9O8z5b32r1SWjs6z2s0JGgi945rql1ShcGolxZUYeuP1M?=
 =?iso-8859-2?Q?Ps8dsclyFfeGyLKrdlCBu+jYJmu5tEXp0gQkZ4w1euE0Dn2n8t7f8+LLtf?=
 =?iso-8859-2?Q?zIUrib8R2NdZeCPlP68/+O1ryEy0Qsn7BACTUemKyIFK+uBepCrGRVETDn?=
 =?iso-8859-2?Q?g3AVB+WF5SnlpyhDSsZUlsKiFkP1gc/1PN9+PY5zHXkCdqzEvwCNCg2a8z?=
 =?iso-8859-2?Q?207rGhE8gphlna7XAJrEGsYUK6Yg1QMe23avRploo3NQ94ARLJBKm8W6ql?=
 =?iso-8859-2?Q?2qdXSWWXHSMsXK5Jupys/p47WU7PjjlJy0HBelhqsuR6GDvdZhxbWXDzc4?=
 =?iso-8859-2?Q?rKG6911aN9hSQxTlRCVKmewRD96nBJC7YmzG80aJ0Y13coZZqBBN4Vz5VS?=
 =?iso-8859-2?Q?aB1+tyxaAstqANs3EXxDTp8EHDGQyN9G/TxxlGbrqVjUiuOITtRK/wxsVq?=
 =?iso-8859-2?Q?XD0zLU7tAhN2+DeIkNxvVpdyo1IdPqbUVw+UwG0vZ2xdkOZM0J+fbZri3D?=
 =?iso-8859-2?Q?3S72+D1fo3CtVKI6tOSfZNvD83fBF4Bw/ZRCVJvTXiseR9Fi7+x5m6o/cL?=
 =?iso-8859-2?Q?Fo22NGq2950Uo=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc1b36e-5e7d-4204-1d49-08dc36b63fad
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 10:32:35.9606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZS7zfihNTZCmfCktXMHoG5B7qcB0gXJXfBcr9hiDFVIr8H9vLYr5sSFKiR5U3R0olV6Np4aywFFjjX80tLvJIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7139


> -----Original Message-----
> From: Ond=F8ej Jirman <megi@xff.cz>
>=20
> On Mon, Feb 26, 2024 at 02:44:21AM +0000, Xu Yang wrote:
> > [...]
> >
> > >
> > > But there is no change. Your log has:
> > >
> > >   CC1: 0 -> 0, CC2: 2 -> 2 [state SRC_TRYWAIT, polarity 0, connected]
> > >
> > > How to interpret this? This is with fusb302 driver. The driver has bu=
nch of
> >
> > When try sink fails (note: cc:=3D2 in this period), the tcpm will chang=
e to SRC_TRYWAIT
> > state and it will pull up CC to Rp-default (cc:=3D3). Since the partner=
 is a sink-only port,
> > I think the type-c chip will sense a connection is established. Therefo=
re, a CC change
> > event is reported by type-c chip. I'm not sure the behaviors of fusb302=
 chip when set
> > cc:=3D3. If it does not generate interrupt for this change, then tcpm m=
ay think the partner
> > has been disconnected and move the state to SRC_TRYWAIT_UNATTACHED. May=
be it's a
> > real hw issue or the event is masked by sw.
> >
> > Is this dock also failed to connect other sink-only devices?
>=20
> The hub is sink-only. It is connected to a DRP phone Type-C port (which i=
s using
> fusb302), which is where my log is from.
>=20
> I also have a board with husb311 Type-C chip and DRP port, which I can us=
e for
> comparison (with/without your patch), I guess. It's TCPCI based (husb311)=
, so
> that should eliminate bug in fusb302 driver as a possibility, I think.

Yeah, it's a good idea. Looking forward to your results.

Thanks,
Xu Yang

>=20
> Kind regards,
>         o.
>=20


