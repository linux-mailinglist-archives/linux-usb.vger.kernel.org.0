Return-Path: <linux-usb+bounces-31071-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FEAC97C09
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 14:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8CCE94E1992
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 13:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7488C314D2F;
	Mon,  1 Dec 2025 13:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b="bvyRcNTC"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012017.outbound.protection.outlook.com [52.101.126.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411D130EF7B
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 13:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764597572; cv=fail; b=Wk+yRWn7f+mskgHNJ1oy8ZYaK4bsOWcf+QhP1EFuWmH7A9I3IFd4S9OJYeqclrmwsXZrgLo6BH0wVJwcMWEWcxGYYKb2brjyIq2aCNsDX4HgdE3HT9cA8pURCbGMMwLjaRskVy8dhSEWqgM7Yp5WqncAKJUBn5DyVZeiVJ+VnaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764597572; c=relaxed/simple;
	bh=8qvTGmVWJzc0633cx9sYyh+s7uXhQZycI6NTUE9M4Hc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kX1V+FhL0G3BdXuivWgmFVw9TcjxKL8k/h1Qv17NemASA5fyrwdAL8BxL+IaEVuStTNJDDsGmwx0SHtA7ABNR1QkR657ahjEqUTp3B8fuokFT/zWZDY0+qeDLOunm3j7B5ZrVO+BKaEko/Ra0Omzm1ZpjdGwlKP626BsdqWOX4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com; spf=pass smtp.mailfrom=nuvoton.com; dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b=bvyRcNTC; arc=fail smtp.client-ip=52.101.126.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4E+svef5jeh9GdISuzA//m23qFPXnIn8U9CO7LmCTvARbJMfQ1SDdakayrbsq4sxDihxnmqFGsX8AjMn+tW59Rx2Z4aERdAsaJitezsHUmmR77zPR6DNfrBdmgDaJZ7zSfHhtovwkpiNsGDCZpuVvmxk0Niq04AMzry23nz5fxtq5Q3wDo6mMecf7oZ9O4VPLVhkV2px2Tm+FNa0qppMvN3hEQm816VZ1lJZVKvr1/+zboom/9ID7q3pzpSg4ZaHgf4jZYltFJeuT/voOOvhivQYWSS9qLtBhOPCEqRbXz6r+i6vZAZCw3/c1R9wYt/lCL8Wo5xA6QOxPxT4GgUew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJiNYKlws7qW3t6M6ykVzsA1HckQ1unCDalO1zwm1Ow=;
 b=StBlPuCcrmFeCqQt+7JmV5rOf6MRzKO8r0nDEFosQGNxIk/hCucOL/OzUImRbGKmrBr7Gm1i819JxHbQvLzce7VPU3OHHRYyeHhU0boGjZgpVLD6x/tRy6lFVC/i2KgWHkVvtjBFXm/yg0lE/ZsftCn7hUvJVxEFmiVKoQqoUHZC9JR7D3dTBVRefiGhHptmZt/hLJlCBZPuawZaAeqAOryf/QJMSjplVme3LNtoWiUIhsp7veNcwAebHrzXgoqZy+h+zWJQG98u8PwGFScFN7BC1mgt7Phb3EbU/N2JlNVnfnvj27mKOH5+bicrxPkxIpJiplKZgzLl21UAm4gyjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJiNYKlws7qW3t6M6ykVzsA1HckQ1unCDalO1zwm1Ow=;
 b=bvyRcNTCEgkQFmwadQPayCRjWVdFOZpGZ1cWunIOAEtA7k6IveV9HRBa+3Hxmgh/NurudX5XPJUP+Az2yl9bcN3kNlrmsxTmTbEqwNuAZIXETUPzygy40YAanvZJwYaPJvbzeWVwtkcRF7G2rQTvDvt1ktoeZLuz2ueTEt9MfRkvMT4VcqBy7j4zE5S85GwsM5XHhXYqKfK6o5e0XNu8QuPSEEtF1H3D2d9ItKHCijjAIL5I/453ReFmzTX0dp0L8EIt1+09B/rvg8nvbipjdCDm0JELvxklele40q3x6SHB1levjE6WiBHpAEE/aFexr6LjZNYZL/Z01rHGTnHGeg==
Received: from JH0PR03MB7634.apcprd03.prod.outlook.com (2603:1096:990:8::14)
 by TYZPR03MB8689.apcprd03.prod.outlook.com (2603:1096:405:b9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:59:22 +0000
Received: from JH0PR03MB7634.apcprd03.prod.outlook.com
 ([fe80::221a:b055:59f4:ed0a]) by JH0PR03MB7634.apcprd03.prod.outlook.com
 ([fe80::221a:b055:59f4:ed0a%3]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:59:22 +0000
From: "tomer.maimon@nuvoton.com" <tomer.maimon@nuvoton.com>
To: "Peter Chen (CIX)" <peter.chen@kernel.org>
CC: "Uri.Trichter@nuvoton.com" <Uri.Trichter@nuvoton.com>,
	"Avi.Fishman@nuvoton.com" <Avi.Fishman@nuvoton.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "xu.yang_2@nxp.com"
	<xu.yang_2@nxp.com>
Subject: RE: Maintainer of ChipID
Thread-Topic: Maintainer of ChipID
Thread-Index: Adxeq9gKMn5kCObJQcGNQJKpxf3jKgAAPcRgACbKyQAAHOV6IAARwv8AALEyCUA=
Date: Mon, 1 Dec 2025 13:59:21 +0000
Message-ID:
 <JH0PR03MB7634A61D0EA6628BB0F98DBD84DBA@JH0PR03MB7634.apcprd03.prod.outlook.com>
References:
 <KL1PR03MB7053BF80E52FB7C409F5AD3C85DEA@KL1PR03MB7053.apcprd03.prod.outlook.com>
 <KL1PR03MB70537F6998668F54F407E29985DEA@KL1PR03MB7053.apcprd03.prod.outlook.com>
 <aSe7brbIyYtsO5Ir@nchen-desktop>
 <JH0PR03MB7634B9AA3CA0F0525E37EE7E84DFA@JH0PR03MB7634.apcprd03.prod.outlook.com>
 <20251128010204.GA2702998@nchen-desktop>
In-Reply-To: <20251128010204.GA2702998@nchen-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB7634:EE_|TYZPR03MB8689:EE_
x-ms-office365-filtering-correlation-id: 24ab4bf3-c33f-4d54-e0b1-08de30e1d448
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?MlCiKouz0BU4I3idzt1441Tv/tB0wfDG3ctjVfaUFJAUY1xYec8Z/7GHnGOe?=
 =?us-ascii?Q?q7Kecb7S1fN8YcMBnNoRPymjU5UfxGJyHHwaBj0ZGXCvpfvIe/ShrrgfKArw?=
 =?us-ascii?Q?jdbZ5GBsy6gnwgQ0LE6+o0MJb00BfLYZ5TMOvyenjearbrcQWgkg43uNWN4x?=
 =?us-ascii?Q?6XUZpSOqnhoOnkBbms0VSrpdd6/vhKsFkxZzGCLE4Q442SNgkxNSn8aty0UZ?=
 =?us-ascii?Q?1G1oPqJLEruu9SXt+E9df+MCE+K3bP97kTu8+8MCeGpDSIENjEdjqM1m18yA?=
 =?us-ascii?Q?Hwq09xLZV201RuDYoz99axbsAQaMB1FpCdtk7yPdhn89qseIxkJe0uRaRdDW?=
 =?us-ascii?Q?ACxLSARDtOcuaYbNsyXZ2m/D4Yi8P+KXcoN6cOB2T5ijVPbp4cquTvhMlgxt?=
 =?us-ascii?Q?c3NzcoHK/vBEHxdfSkjxQGkc/yd+rvpOWNeeoQs0zy5UTdJKX7qOuApX0EkZ?=
 =?us-ascii?Q?rNnOvqIYeBOGts6LuCqrRXKTCfOi54v4J1qM97mseZNEbENZmTgd0oAf4fyt?=
 =?us-ascii?Q?rp78Nu7MCgn5KfnRySEEEGuBQMmt8cVhxfKLU1ymtIvcU1szkqz8hyspXtvi?=
 =?us-ascii?Q?QnHqCYfKgrKswz21Snn7J0T0lCfiyM958ctBGxz3/h62RfKn5pVeorUhgWZw?=
 =?us-ascii?Q?u6x4JiBSp2SwxKd9swAo1kRSkaDywhaLIumE3ozbDIG7HOAdjYqfKFLt6PRv?=
 =?us-ascii?Q?iZXfWFvGX2rOovwwB1Ibw0AgwMN5gotL5z1yQwE2o0btfF+Jb2Iw+S5rrc4h?=
 =?us-ascii?Q?SOwCYXWNgpfhUYd2BZOl5pb/L8wYvYKC/nazlQgeg3/tM0H/Arb/B/316NIk?=
 =?us-ascii?Q?/ZmqF+0FuhG9ZSIrU7ppgFA3gBvJbGfm7mRhU/NyrQXp9s6Awd5XJTqBs8nW?=
 =?us-ascii?Q?TDJdEdutrH7pO6on8TyYJAvAy0XaynkiStUxciA4Pn0dC+8FAUs1KVLVFtFM?=
 =?us-ascii?Q?jpGDZzzLV+864uWsmbPt/VMHNlwyJrKKLEdcjG6UzBXmDy7yEM1hqBxmmzeP?=
 =?us-ascii?Q?CLT5t78SF8hEV80/7POMw76KWea3nXsPQiOKIOcRXYijtjzMgMxKqle1/RGC?=
 =?us-ascii?Q?qQDhjFArnmZutzFxawiGDcj4wo0doLSSzWyFCOYkj4arjnVfzg16gCjv623X?=
 =?us-ascii?Q?s+s2ptI+TF9+M51AI0jYQGSzlzgAmHfKNRVBcg1PvnXLkhpYRYv58rlytoG/?=
 =?us-ascii?Q?cJEsRPviNDT8v3aDu7shTrh7obzRHK0M/9SE9F2iwrBw7xPAIbxN6cSp7k0u?=
 =?us-ascii?Q?6O10EEvm3NOstAP1dHDZ09DidE5HoLetiRjVxvWYRnn1W49E7oTQ2zSfTeIu?=
 =?us-ascii?Q?EFbSBs/1ZKD2LU9ib7lEJ70GLSNQtWfTmJK46pvV7gNe32tp5gCtLiDLXl1L?=
 =?us-ascii?Q?so82rCrOD2QfJuxfSU9eha0xYAnyrFZUXn3oy/QpyFvdVBymwjLwZoGJBajQ?=
 =?us-ascii?Q?WdAqgzyJmJHXxwbftnoDjErXBJ5s4XNRZSMhQd1Qzebb2k+SJ0rRkhc/CdcT?=
 =?us-ascii?Q?at87FhB4Gqn+9+UZL4B49hD6Sl5EBNLvmuv9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB7634.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6l02VMWxStN6PhiEI/iALwdrrC2ino8b0nSUt4YKhnaPWOeIBvCwzUA05mVq?=
 =?us-ascii?Q?GTjRKxSZ8ZyzpYO+8Vlfk4CPtlUqbHZJ/jZVPVT1OooekSfoVLz93OsJwwDd?=
 =?us-ascii?Q?lZfgMWrWvqebJ7QXGljiKdgfpoZGcODpACn0spTwg5QPhXMWUaqbx/5NZ5ZQ?=
 =?us-ascii?Q?sQYwNITqrpOOrycm4O5PT1kFQK/cafqCZwCN6ZU21tNGXM6CNatA5muoh6pr?=
 =?us-ascii?Q?3BwP9nB1CYiHqBt9jChI7F8HYv8ny+NojrvsESFmE0pmSEi/s/4EbvXKQRR+?=
 =?us-ascii?Q?/jGCF4L43h66k19u2Vk2BOqkCvScghgRV2NA5ITKX4bdTOsucoz6wbQoUZBQ?=
 =?us-ascii?Q?BXg22VZxZ576aed9YJiZjD3VWCzjYgMCSIYU8jLwh0M/TmjFxWwmPufUF9Gb?=
 =?us-ascii?Q?0mRnHQ6pZ8RHM3CM2HBkRnLwLjtzWFC8nU71pqtTV81drnG4ZlHy5WP1OmLV?=
 =?us-ascii?Q?KBMCAgm/dePEnxWZOOnV4Tx3gF0q1NudL7WrGNRff70FAu4nQpSsXnqtuvKv?=
 =?us-ascii?Q?9a17nixnZmPbf7o6KfPZ1+sFRI916G5pFlALF0PYGsddXEXR4Inw79fM9zf6?=
 =?us-ascii?Q?z42sDTN73KH0acVaTBIY13Z+xX8No2CRfsQB6kLZo9XGvu6xUcCmdI9TL2h5?=
 =?us-ascii?Q?opR0ayEoHE5WlJMjLEzM+UuXFpCW+gMAKwAFAt0kUGIOs0TNIfwBxIFxnGD6?=
 =?us-ascii?Q?f+zo6dByYtLFOr/bcHYBIaDgS5kkEMO2DriJ1eqeBVOlQFeygR7qbjwNhQ4s?=
 =?us-ascii?Q?AH6hWYZbw7u2Z1sHDG3eqZKzTIzCFPmlfQYRp+EAo4VGSvpwg5B8py2Jb3G7?=
 =?us-ascii?Q?zV0GzIqP9p6OPZlVxsTMDgWZMcF8Uf3NiCgtIxwtDIXw4hg0hXlZskEqA6yd?=
 =?us-ascii?Q?oaS88QKDhQ93inD/+Q4/0xvr4Hqnx4wxtHAlbn45/FwVm7+yyKB/31ivUq5o?=
 =?us-ascii?Q?QPH1tEX2mtCPYlOcXVbAEqFFN/keMuN9gZkXcPAAIhqEJCr9Ws48BY10TUBL?=
 =?us-ascii?Q?jGBK3HjiA5gvVFdC/L0rz/iK73zj/kCGr4MVO+K+4Yy/YkuadZ0w0M7X7DtA?=
 =?us-ascii?Q?9bUcAVV29ae49byo5rMxwqUvTQ6wEHfvPxnrFiyD4khSwNI5to4rYN50yCje?=
 =?us-ascii?Q?48f71i4LT7dxOTxc3NTBjNyo57+T1YYlfBHuMEqGtSlC+ygxaH3/W4eA9CZL?=
 =?us-ascii?Q?NpJo2NFnnVZJjru5vLGgErbCDSdUppYeTqBJJzy/l7rLqFG0WS8CNq/nR+G0?=
 =?us-ascii?Q?n4ydn+iwVFfRtQsrcww8njVcx5fmqKR1tTzbLYggMt1qx7KgJt7+Xk9I8GTN?=
 =?us-ascii?Q?Rt/ZRwWf+EcZRmitPNS45eRt+sF4pJvg2ei+RwezOPAQolfULyrhuWWS3Frt?=
 =?us-ascii?Q?DYHjtQfRpXd389GEOw0tWAHrhYpVhMmkVK7P4n15OJMkkspbIbraLxY1/q8C?=
 =?us-ascii?Q?2HtUoTqZCXDkTk6Sj0hqYsGTQQwr4UWDp8bPKj3hW7mSLkvq1xhsv0c8bE/C?=
 =?us-ascii?Q?9hlG28Pk5yzU2ihrS68InY4qtTe/gCA0g+N9AGxm+C/qYFVsRE1FPHRRQ3wY?=
 =?us-ascii?Q?lxm6YzB/alotHihWRD6ekDumT+qHXdGKTCDEQmWd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7634.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ab4bf3-c33f-4d54-e0b1-08de30e1d448
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 13:59:22.0364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ppd/9AagN1gzhs1nLulmBVEYsLGaJuhL4dunbTSJgIeKE9QFIjJrd8M0avpF+fT/spQFa4Ak+JUiR5bVv4f+QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8689

Hi Peter,

Thanks for your prompt reply.

In rare cases, during RX transactions, the UDC driver receives an interrupt=
 that is supposed to indicate the completion of a DMA receive operation and=
 that the data is now available in memory. However, the ACTION (or ACTIVE) =
bit still indicates that the DMA transfer is ongoing.
If the driver enters a loop waiting for this Active bit become zero and ind=
icate the DAM action finish to the handler becomes stuck indefinitely..
Are you familiar with this behavior?

Besides the ACTIVE bit, are there any other status bits that reliably indic=
ate the actual end of a DMA receive transaction?

Thanks,

Tomer

-----Original Message-----
From: Peter Chen (CIX) <peter.chen@kernel.org>
Sent: Friday, 28 November 2025 3:02
To: IS20 Tomer Maimon <tomer.maimon@nuvoton.com>
Cc: IV00 Uri Trichter <Uri.Trichter@nuvoton.com>; IS20 Avi Fishman <Avi.Fis=
hman@nuvoton.com>; linux-usb@vger.kernel.org; xu.yang_2@nxp.com
Subject: Re: Maintainer of ChipID

CAUTION - External Email: Do not click links or open attachments unless you=
 acknowledge the sender and content.


On 25-11-27 17:13:40, tomer.maimon@nuvoton.com wrote:
> Hi Peter,
>
> Thanks for your prompt reply and appreciate your assistance.
>
> We are using UDC Chipidea driver version 25 (ci_hdrc_npcm) in NPCM BMC
> SoC and we are facing UDC DMA synchronization issue In the UDC
> Chipidea driver there is WA for version 22 and 24 that running
> reprime_dtd, not sure why
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Felix
> ir.bootlin.com%2Flinux%2Fv6.18-rc7%2Fsource%2Fdrivers%2Fusb%2Fchipidea
> %2Fudc.c%23L840&data=3D05%7C02%7Ctomer.maimon%40nuvoton.com%7Cfdcb3d6e98
> 844998ee2d08de2e19c219%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C63
> 8998885355834139%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiO
> iIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C
> %7C%7C&sdata=3DXVY3UIT%2B2ffESLp6Oor090sKjcTgYFRJBaNTqCAOCCs%3D&reserved
> =3D0
>
> Do you know if there are any errata list for in UDC Chipidea version25?
> Does the UDC Chipidea driver covering version 25 as well?

Add Yang Xu who may use chipidea IP currently, and describes your problems =
in detail please, we may has some ideas.

I think current chipidea driver has covered version 25, and Synopsys acquir=
ed Chipidea IP more than 10 years ago, you may get errata list from Synopsy=
s.

Peter
>
> -----Original Message-----
> From: Peter Chen (CIX) <peter.chen@kernel.org>
> Sent: Thursday, 27 November 2025 4:46
> To: IV00 Uri Trichter <Uri.Trichter@nuvoton.com>
> Cc: IS20 Tomer Maimon <tomer.maimon@nuvoton.com>; IS20 Avi Fishman
> <Avi.Fishman@nuvoton.com>; linux-usb@vger.kernel.org
> Subject: Re: Maintainer of ChipID
>
> CAUTION - External Email: Do not click links or open attachments unless y=
ou acknowledge the sender and content.
>
>
> On 25-11-26 08:15:50, Uri.Trichter@nuvoton.com wrote:
> > Hi Peter
> >
> > Are you the maintainer for ChipID USB device driver ?
> > If so, we would like a quick help from you
>
> Hi Uri,
>
> You could send your question, and see if we could help you.
>
> --
>
> Best regards,
> Peter
> ________________________________
> ________________________________
>  The privileged confidential information contained in this email is inten=
ded for use only by the addressees as indicated by the original sender of t=
his email. If you are not the addressee indicated in this email or are not =
responsible for delivery of the email to such a person, please kindly reply=
 to the sender indicating this fact and delete all copies of it from your c=
omputer and network server immediately. Your cooperation is highly apprecia=
ted. It is advised that any unauthorized use of confidential information of=
 Nuvoton is strictly prohibited; and any information in this email irreleva=
nt to the official business of Nuvoton shall be deemed as neither given nor=
 endorsed by Nuvoton.

--

Best regards,
Peter
________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.

