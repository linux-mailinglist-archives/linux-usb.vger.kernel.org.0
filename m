Return-Path: <linux-usb+bounces-14922-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 530849747CD
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 03:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA519B21538
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 01:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08032231C;
	Wed, 11 Sep 2024 01:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hidglobal.com header.i=@hidglobal.com header.b="nK5FEBal"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B08D5680
	for <linux-usb@vger.kernel.org>; Wed, 11 Sep 2024 01:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726018362; cv=fail; b=GavxTKsk7sPzWBRF7skzpCtDuC8i3k3OP+ORww49kbM2pZUZ5A5GQx9j9R34sfji51ouZYI9kTGONy4JCIytnHTYBICw0N1CrQj3EYXJGXaVEPO64+t6EWUznGFtyv20r5tVptg+25iwHkN9qd09ZMS+CyPssRrsP+LXsNybl8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726018362; c=relaxed/simple;
	bh=NZ6lbPnKMxb3/GtrciFm0Fb5jrqI4ZBeQ6+bHzN2s9E=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dcfl2u+KW6PunB2g3dAkxSnoqcKjfZgiIDdDvbgkpI/HwgewaWtBgPte1QwPG4yVCTU2zaTHWGFxn8Ck/gKMUd05lQou4thuuHwpuu5aYckdU26bO4eTQgDtA+LChFsOefv+25vYS+i8qt5g2NyxNaESlWubVHBpCRrRh2eIBbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hidglobal.com; spf=pass smtp.mailfrom=hidglobal.com; dkim=pass (2048-bit key) header.d=hidglobal.com header.i=@hidglobal.com header.b=nK5FEBal; arc=fail smtp.client-ip=52.101.70.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hidglobal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hidglobal.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kaqya2X7tz/CyoKFLTm5m9D+LlWjtBUtQfJSBIvldOUzypBnsT6o7BEiDb8cfz6VKiwfMWgFZLNEFiGpUiQJcmzSAEYsGgGDSx7Gvkwmo0mQ0z50LHOosDuvfcdftd+RvQkbI6IRe26tYiEKtG8CmwC4N1GGH1smA4mHNAMvvPB3qAaOR447VZTnrXmlbbTYzLtzQCLFtRJeTkAX9i7W7ZH3jHi43X4LNWg7AFJsW0Bqupy4YeUaBefVywBe0fScEcakygJFHEoNx/H/XybfZt5C3yFIH4rEcBykWmB30VVHpsB/3swwm8313A+wsSE3u68TNOSRt51YM7eMpHVsPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvCVH3ltUPgkyfjnkMFbMJ5nuugpGXmxDRIJylLvdF0=;
 b=cXMq+MXkEPfsNACMxDe5Zhl2xzicmig8I5XDWbudbwS2EDEhdrdAHjuWHC3h201Vd5YMVcIpaCk+f3lXZNU/bXE+tCqQUfFfj4kfpNLrKfpivGH21LTVwdbDHTUXZpeFeW88nGIf1tmtJaUuwt7R5TctkzkA+LOUN9TAoigGZerSkZlC1wJ2lKC79p14jZBVjp4BhbMvpbhmQnrEqzWN8Sj8calGyXvYI3mYIR/aqtyEw4K+0uEA+rpiKhr204hsmucm45OuvN2Ixl41koTtKSsdu/3HfyxxgMD/4iuWmGlFKBNe9Oh/d8dR/FAm0l7VD1thzA/HUV1ucrU5/71oZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hidglobal.com; dmarc=pass action=none
 header.from=hidglobal.com; dkim=pass header.d=hidglobal.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hidglobal.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvCVH3ltUPgkyfjnkMFbMJ5nuugpGXmxDRIJylLvdF0=;
 b=nK5FEBal0uf8BdX1JsjlC41yq040ser9fAAxFb06J2Goybs9ZCd1EYLZP0PLivbjnXUi67OrE9PouZMc2q03/387K+I0famyunfjuIG286vbQnLrS/IF2v5hTLFjndaTQx2RwqP6V6z8YdY1RlmvQomvbjM4RXRrANFoSjGRe+i39ujrn2zqTNWUtStWWdNa7qa2f6pljMp2kUdqvxwBUQSeLsEmo8vuRdu9pLalfYCS2HLnjXuYjDhxmBzJNNMlQs2trHs+r3SjSk8YIouxAnfNaeP98zJ1d6g17fK93MIwz8eHREmO9KWlfiDryjQxdNQqrdJ+H3vkLVugHXa09g==
Received: from AS8PR05MB10129.eurprd05.prod.outlook.com
 (2603:10a6:20b:613::16) by AS1PR05MB9625.eurprd05.prod.outlook.com
 (2603:10a6:20b:474::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Wed, 11 Sep
 2024 01:32:35 +0000
Received: from AS8PR05MB10129.eurprd05.prod.outlook.com
 ([fe80::5e4b:699c:6250:8022]) by AS8PR05MB10129.eurprd05.prod.outlook.com
 ([fe80::5e4b:699c:6250:8022%6]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 01:32:34 +0000
From: "Vodicka, Michal" <michal.vodicka@hidglobal.com>
To: "peter@korsgaard.com" <peter@korsgaard.com>
CC: "balbi@kernel.org" <balbi@kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "Vrastil, Michal"
	<michal.vrastil@hidglobal.com>, "stable@kernel.org" <stable@kernel.org>
Subject: Re: [PATCH] Revert "usb: gadget: composite: fix OS descriptors
 w_value
Thread-Topic: [PATCH] Revert "usb: gadget: composite: fix OS descriptors
 w_value
Thread-Index: AQHbA+aNCId6JjTJskmVJ1TZT1+Wng==
Date: Wed, 11 Sep 2024 01:32:34 +0000
Message-ID:
 <AS8PR05MB10129E57ED13CF18746FC4BE18A9B2@AS8PR05MB10129.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hidglobal.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR05MB10129:EE_|AS1PR05MB9625:EE_
x-ms-office365-filtering-correlation-id: fe731697-605e-4442-25f6-08dcd2019ce5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?V178hfaxAH4GAfb/XypTEw7adSY3Vmu6HF8yuwx5OvDnh2u2KN0g47t+Vo?=
 =?iso-8859-1?Q?C7Dy8fjkdu9f4fD7mEC3CrEGiyHx8Ae4j6K+rr7Mdpcis0s5ctFa1DxJhk?=
 =?iso-8859-1?Q?i8tHxjINKR8n+8nCBFZByySyWEkx3ODbw3+xD9ey5kEh6mfjJg21lo9d9/?=
 =?iso-8859-1?Q?6iwatV6jYDRIHIWN5qwPC3hKRIzKufyW7pYd14mr6f2Hna+maDd0guSgtc?=
 =?iso-8859-1?Q?d99CUs6ws7C9XrqggH2mGti5S3LpJgLQlW0Iytj1/Th3JRprQSZbq3eyk2?=
 =?iso-8859-1?Q?EtxMc35PpiEWSD4XGCXvTt/aGbSD+CllfDQJ8S/73OqMKsUfGJdWhfQIXV?=
 =?iso-8859-1?Q?CgfEXp38AzKuX+pNC2GVAGbNcsXPaA6vrFCjwOGTX6BYeDbGQEEBYUz+2T?=
 =?iso-8859-1?Q?bgoG1U6/EWaOxiGMtj0uw2e0NyudO0t6UaZTQXB96oQiJPg77PxqLwy56q?=
 =?iso-8859-1?Q?hybx853H+GHE5ZR6oygl1EkUXPb/S4Jq3CD/FQ6RqEERLm07Q0z69SO+mK?=
 =?iso-8859-1?Q?lBj7mbwLSXkht94qwHW54tfCFLVTAtq7tOWv4NYfXYm/5KXZVjKW6tKA36?=
 =?iso-8859-1?Q?QKJZDJ+XdPfgH+O0BDL9oeUZ6XJoMFMa3xkVpdG/+bsKnmfBzToCrZxXuA?=
 =?iso-8859-1?Q?Zbz23AwUkRP9v7Tp4MEi62vNfLKTJ22jGEWHBUYbtoiOhN2J3S/OhK05D4?=
 =?iso-8859-1?Q?4F3CLbu9xpLA4M0elrs3I1bgK3JdP+/Em76iq8UWexbwIiKl9rhthzfQg4?=
 =?iso-8859-1?Q?N9qYicXqIHjZ1Iwku6HYWAxaflDhJn9Rgt3xhrCy/NCbO/b1pJjunEpQ47?=
 =?iso-8859-1?Q?8YHk26P34rSMkbFZ4FvRTrAGdoDXF59GxnoluyGWXhMgbqrmG2CX6BoD7R?=
 =?iso-8859-1?Q?sVboj/Y/MqC8iJbfoiH2JCq3uvLsogPCcKZtak+VkEVDAMMyHezoTD+FTU?=
 =?iso-8859-1?Q?qe4j7DVY8OiT9kf8EMqStBvbAhTsuzP4IpxgNXckarJg7d3qZpLTVRLk6i?=
 =?iso-8859-1?Q?+rkCdZI3JxvI8fPH2FNF9FEJkuazX0SRqpZUMKrKt+IqRJPmHONmZI3z9q?=
 =?iso-8859-1?Q?w9b/07u0MJVKKEJEAudP9WoCytX34kQWmfnV9CpsrUrVPlcVOvzFAlC5N0?=
 =?iso-8859-1?Q?HNBgBhwRirBbXk0WZLB4oHi7WxBMTjtxE+/2jlQtU9iH+w5cirA1+7Pxyn?=
 =?iso-8859-1?Q?64yQ5luWbwPXwcODMKe4jqgdCGyvLSO2jS86vUznduqaDuBZsK1eymh+jJ?=
 =?iso-8859-1?Q?nTr9kyaC0NFN0IdBd5GRUAsdLAUKphhXlOgbEYqdtsUe9PForgehTQ44bs?=
 =?iso-8859-1?Q?HvPeUR63zjlr14ZS8OY+Hh5USL7yuuZfVW7kFA+M6cV6Sn+QdWzx6B5E/r?=
 =?iso-8859-1?Q?D018zxcuWfGT6Rxi8rFn6Tecg6lfSF3EK4fQ7m0lVV/NatiVrNfxSi96je?=
 =?iso-8859-1?Q?4hj+0BLFX86wlJ4lbw0XwcXruVuIR+zTaH6Jxw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR05MB10129.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?FTTR+IXLbAg+wnQCxaCQbHn0W+MJEXEJ2v6RZBTqFDD83hbbABKVo8Ofde?=
 =?iso-8859-1?Q?goGn0NqQ6yc1SHLOOAHs756TmJeO1Fg5UKzu/mh0JqsRsQYP9r7OZSec2X?=
 =?iso-8859-1?Q?zXNo5wZ7FraZxOO+aOalij1x8S0Yuk42ibzLNyCxYxlIoi2GjRWaqOdNZt?=
 =?iso-8859-1?Q?us1Wh3QTOB8ddkLfPtS1kSzkgZl4rZ/L8oC/mdOSvQa06DGLuqK5Bte+eZ?=
 =?iso-8859-1?Q?mvu2lMH6cfBmU49EYpQfHHBq6kJGLDuhxiUcqhmvgWkspY4BnoAI1BtlbK?=
 =?iso-8859-1?Q?fMg/oOAn9VJIpIbMIboZVPu4ru4StFDWsh2x9piQ4Do4PRbCbMiKgXNtHQ?=
 =?iso-8859-1?Q?LJa7i6i3DzBcb3VtMhfADFInkE0wPOd3eSdLKsrkV8pbAAyHFtYeXg1iMp?=
 =?iso-8859-1?Q?1IyzGRm/Npk/m60xcgvszThzOZa/tn69ZgZKo8Xgz32UcTUFYHBDtdzuew?=
 =?iso-8859-1?Q?APD2HaFHM0Dcf/JvH0m3sIEGE1j6ncFzRcAd+znad8/KUhgjmJRHNnuzis?=
 =?iso-8859-1?Q?Si3sutcslBVaA//kP3l8xNlsqgW2hwZmJzn0Ue+PdkX/leuEynsfJ7FSrf?=
 =?iso-8859-1?Q?GdWFaD/zJSMvxjbIv8uj3hUEjhRkiVOjBwMwFLcQsPbYgHtt+72Jdi81EE?=
 =?iso-8859-1?Q?iKtsPWvBpUxwIUI5+OBXku2z8eNKE27qReBpeop3RqnQ0D6+mui1GSVcu2?=
 =?iso-8859-1?Q?jboUQSBznOeNXCxXHQz6DDhfn8gDVZTJtAlZV4Ga3Ju3eLkoBW7g5KQAha?=
 =?iso-8859-1?Q?q0xz69YrN8lHFFqwlzEuxtbOelzb4HmIZbRdneME93++6ehp8L3eKcZ1nu?=
 =?iso-8859-1?Q?dMcDJk6UUeNzeQk4b+ptP336OLHED2PC6fa9krThCHbF+cXqiDTndGnE9l?=
 =?iso-8859-1?Q?itpgWmi4P5q0pnH0qJ0HX2OEtKVzmtxOmIippGd1byYUGBBYE7Gwg7OPz/?=
 =?iso-8859-1?Q?VZ58jGwt3uxxs7PwfjLlMVHmAxy19WlT4bqjbCgOcvKZEPYtALCGPN7V8T?=
 =?iso-8859-1?Q?nUsfq3UXvOj2VA4q0UchxgcSfIkmiBZfIbaT3/o/89FuhV5JJHocL1XxsK?=
 =?iso-8859-1?Q?V9rMcgCg1jpKInQCH5eseYsJw/ND1ef+A35upHAVwSRyHwnFni3oHp6ZhN?=
 =?iso-8859-1?Q?XFhpYiD7Tr3STN6kipdsFqY8daz975fxaRtnMyh6RJEM4sNvuGtnDS4uvA?=
 =?iso-8859-1?Q?BJAiy1+1cqkkup74/49sz7xcRlYaBrQOmSCh3xcpdFcpfuPnzm/XjiRqiB?=
 =?iso-8859-1?Q?VQTzD0qBgeAXt6u3qsNHs8sZvMUHap5Q8eKnfZCb1CDTEApiDtSXok17Xp?=
 =?iso-8859-1?Q?RDgdMfVqBc+m1IoFowEEJIhw0aGLiOvKuADHcsQhqG1UA3se9eLpHC//q1?=
 =?iso-8859-1?Q?vN43jGacFPO3V345DYIpy9uY/zBt+n3GBkX+cSzUYIDweUuT35+cP7LJ8B?=
 =?iso-8859-1?Q?zApZESNxMEdtUT3yW7lw7NJb3SnRoqYzllUV9jm/MRsdGQ3sib9fX3r9LT?=
 =?iso-8859-1?Q?YyvKo9tjhiHzzuhOuPL6b3l/IEVAB1bBCH+IGdYmt2BbrPJuxyTtM2JIBH?=
 =?iso-8859-1?Q?xWBzO+zZk1j0SPb1o2tYpWZiYhPeiKqreblXcaTAn8BsKbDaTgPsWKjEcc?=
 =?iso-8859-1?Q?FdcqBfikF1qWkx8oESBGPmU//Dz4QqvyST?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: hidglobal.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR05MB10129.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe731697-605e-4442-25f6-08dcd2019ce5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 01:32:34.8560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f0bdc1c9-5148-4f86-ac40-edd976e1814c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DXn7acXvoeLvtzQhwbC27gaoXEf2mZ+OI6CXi+jjtQCw8EQlDaiyWnvnl70NUoYXQsMZ118YP2brpJHqIZsD01CWbqN11n+8TZVSQDUWDaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR05MB9625

> Hmm, very odd. How are you testing this on the host side?=0A=
=0A=
We just attach the device and check the registry values created by OS=0A=
for our device. As=0A=
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_XXXX&PID_YYYY&MI_N=
N\<device_instance>\Device Parameters.=0A=
When it works our extended properties are created there.=0A=
=0A=
We check the communication using USB analyzer which clearly shows=0A=
wValue bytes are in opposite order than documented. This is SETUP=0A=
packet captured:=0A=
=0A=
Offset  0   1   2   3   4   5   6   7=0A=
0x000   C1  A1  02  00  05  00  0A  00=0A=
=0A=
As you can see, this is interface request and out interface number was=0A=
2 which is in the low byte of wValue.=0A=
=0A=
> Could it be that you are running into the WinUSB bug described here:=0A=
=0A=
No. The mentioned bug is in wIndex and out problem is wValue. Also,=0A=
MSOS descriptors are read before WinUsb is even run.=0A=
=0A=
Background: we have a composite device which uses MSOS descriptors with=0A=
extended properties. It worked well on all tested Win10 and Win11=0A=
installations for two years until we applied your original fix which=0A=
switches wValue bytes. Then extended properties stopped work. We looked=0A=
for the culprit and found this. I understand MS documentation says=0A=
interface number is in high byte of wValue but the real implementation=0A=
uses low byte for it as was verified using USB analyzer.=0A=
=0A=
Question for you:=0A=
=0A=
> I had issues with getting Windows to accept the OS descriptors when=0A=
> the function I wanted to use with WinUSB was not the first (=3D=0A=
> interface 0) function in a composite device together with HID and=0A=
> mass storage.=0A=
=0A=
What Windows version were you using and have you used USB analyzer to=0A=
check the communication?=0A=
=0A=
Michal=

