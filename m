Return-Path: <linux-usb+bounces-31012-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D38CAC8F9E9
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 18:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9C7FA4E19B3
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 17:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8C02DFA3A;
	Thu, 27 Nov 2025 17:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b="RfsR+N8u"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012068.outbound.protection.outlook.com [52.101.126.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EA07082D
	for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 17:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764263632; cv=fail; b=pLHA74v51LgR1RtpZ1w1dvlBbaQ2DZ3JOE7ueD35W4TWQWPlSJ8ZC8TLBwea7K4HN6J4bdjM/eVdWYz5GfTDgI/u1r0BJSpuGIcVGfFUOy37TxrZfXbrJeiDTEn3PWPHzpYmr0cFcuV/KynOaUCJYY+xQ2xYch+EdqASILA/z20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764263632; c=relaxed/simple;
	bh=L12RFipcTkkDo6jZs4T+S7NaFZ3H6R9lOwH6WbOnHTM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jGJx1nVMeKyPG/C2Fq0f0PVfumcTkRY+s3nad/WAWqpkOSO3BT53G1w9qovulRqaSszXkNOViVSTjNRuTlNZ8caGK1e8nPEElmwaO7KRzrIvyMKTh/F4hIlMm8y5v5Tl5ByOSjnKuy2S6MushmR1myi6kzMT+N5CuuRqUrl1XtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com; spf=pass smtp.mailfrom=nuvoton.com; dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b=RfsR+N8u; arc=fail smtp.client-ip=52.101.126.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=expILHqZ8ueEd1h1HD4erocJiGQKwlT3WrVJmrtQ9kYasu+KY4+/w5qithzU/DmK3H20DusLaf2WcusMJoLxF0W4H2jjNorOixKLTaB/claISRn3NB81uL3ziRVK9S8cFl7kT69+S5JGYghyEUpo0BWKtVbwImENwJRmcx9lDa3J9JqZSAiYz+kI7/wUjaMSdeBnBKqIvY2OPeJ+7nQIXCpM5r2l73SM35NYPYtZCd80tQio/Tq3ixNIvFoiL/3vNZqNNuA++OHZeFRlpvHmF1BHM/YJZivZh1dePUNno6uI+c99krIug5iYY/7v0lQMBNJhcdUfxmHSC5debG6+tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L12RFipcTkkDo6jZs4T+S7NaFZ3H6R9lOwH6WbOnHTM=;
 b=Gdg+jZ9LLU/DoDfoqt2HEv5p4358fZBkwgg5p5rJjtVpdeRo0fq1rO2CDnIo65qzCltZ7yLQTJ0kC7Y/mNANd/gLTo+kPCQlQ+ACK4ijMuJQyhvhHetYVPkVueWomFLV86E2tS1J594vZw548onpkLsvDthZ4Hit3vxgwjFCGpLggVYs5hjq91QSX10biJXaociOaJ9IWcHM5Bw4vB8JllxDS4NeoNZtfdmm3lUsIo5Crn/6RJ8oH9LojQunNSdcofgzRwDDzc9NpllWU9ycw8SodBfZqVop7wKHl9Z9hegnc5ulwUwOQ/OBMOmqqJVdUIbKpZzC2X40dxCl1niuTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L12RFipcTkkDo6jZs4T+S7NaFZ3H6R9lOwH6WbOnHTM=;
 b=RfsR+N8u6R1bupTMwZ7Imxz6MRXkzLitLzzBxjD4V25Djl7a2oaCX5wjBCpEyGaWWHc2/Ef62VhZMOdG3Hsp/UTRQMoFOwRx4lsD+8Ny+E6uMowvH+3lfQyodm/RHD0jBt/Q04/K9aEqkMeafWGc9Oby75aZ3aGMpSQqYiC9ZYoFWUQFGBM93cssDf9koGp6LoW0jDGVU93blot++3n/ccvSJa9lS/JVKnGwcMvNp95NT0qKr6foyYI8j7uAKRPFvt3cYfogjmU6h1r3BP9cbL7nmlE9mNTO8FPZ0KKkkTl+gGZrJRaKP5fhLEDfxuSz3ivpBSzGMzyl8bODuIih5Q==
Received: from JH0PR03MB7634.apcprd03.prod.outlook.com (2603:1096:990:8::14)
 by SEYPR03MB8108.apcprd03.prod.outlook.com (2603:1096:101:16d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 17:13:40 +0000
Received: from JH0PR03MB7634.apcprd03.prod.outlook.com
 ([fe80::221a:b055:59f4:ed0a]) by JH0PR03MB7634.apcprd03.prod.outlook.com
 ([fe80::221a:b055:59f4:ed0a%3]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 17:13:40 +0000
From: "tomer.maimon@nuvoton.com" <tomer.maimon@nuvoton.com>
To: "Peter Chen (CIX)" <peter.chen@kernel.org>, "Uri.Trichter@nuvoton.com"
	<Uri.Trichter@nuvoton.com>
CC: "Avi.Fishman@nuvoton.com" <Avi.Fishman@nuvoton.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: Maintainer of ChipID
Thread-Topic: Maintainer of ChipID
Thread-Index: Adxeq9gKMn5kCObJQcGNQJKpxf3jKgAAPcRgACbKyQAAHOV6IA==
Date: Thu, 27 Nov 2025 17:13:40 +0000
Message-ID:
 <JH0PR03MB7634B9AA3CA0F0525E37EE7E84DFA@JH0PR03MB7634.apcprd03.prod.outlook.com>
References:
 <KL1PR03MB7053BF80E52FB7C409F5AD3C85DEA@KL1PR03MB7053.apcprd03.prod.outlook.com>
 <KL1PR03MB70537F6998668F54F407E29985DEA@KL1PR03MB7053.apcprd03.prod.outlook.com>
 <aSe7brbIyYtsO5Ir@nchen-desktop>
In-Reply-To: <aSe7brbIyYtsO5Ir@nchen-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB7634:EE_|SEYPR03MB8108:EE_
x-ms-office365-filtering-correlation-id: 69fd8934-394d-422e-4425-08de2dd84fb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?TlwqD6/cggIpMUWPCTy81TzB5zw7t3XLyo3H4dQoMhACCrDuWgYaOBWd4cDy?=
 =?us-ascii?Q?EkgnCAl+fpZdeaI0zs12hcePGtRGvCpwrWjT8UNTwcews5SmZljjBFI5SK3P?=
 =?us-ascii?Q?Zm7mpJ1H2b1ATRvkNFrNdXJU0cPL+gorHd2r9bpLUnW+qYeRyjqq3aJkaAR+?=
 =?us-ascii?Q?COcU7SC3kraP201kV3NVOvsLUrCwZd89v+J1/4MpeGB0oYxdpohDTJOb7O04?=
 =?us-ascii?Q?fajOCiIVaQ128LTMNY0QwRtP4Ujz0eTNRsdxuX/FOuHRqBB9CNQZ7tcHpiAM?=
 =?us-ascii?Q?EejWdAk8vuSZbgDe3rY04C3lOFxIhF8qONW6iwEvxtm8P1Q2maQF4NwTBaWE?=
 =?us-ascii?Q?VQSwBSXg5MQthE2NTUAo07+BEjAoH1ImGOINElSakX9Iw3G28j2Fvhcaw9sz?=
 =?us-ascii?Q?sW1dsvD4XMOEvtVCDnA2q4pH2Lv9zgZzvzqGYtL63UFYdVvcimqHhdmnsRnQ?=
 =?us-ascii?Q?S4NiCQU9Yq0S4M0etdz0Vt8ZWGi4XKMQtJLg26FEPeFmuoUM5DPGDwV6J/j0?=
 =?us-ascii?Q?1VJAIXF13TnMocFAFvXVXcCMPANP5PcoUGzZ1d2SWUZIsiRp1Rv07XJPD9z9?=
 =?us-ascii?Q?xgFb0g0k4Bmjsz5aCJUJpzMLqFBTLqU+rwDfDXCpGrCQ30/+O6M07ci+NYSq?=
 =?us-ascii?Q?o0zZ73oxH5zuayMGgPuVM8rOwRmditoDB64HYgwECuV3Fd45Aaofc9aXjTpv?=
 =?us-ascii?Q?wzMP2r0VtvJ8yQgOZFf6WNMBO2hl15XSYMDL/+1Ul/72ziu8xNkaoydrd9A1?=
 =?us-ascii?Q?wZlYtvV8ENsg/LnTSTccLrdCI+P/dndT7JwAKNGG+0O4Osl1E5EVBgpzQzuH?=
 =?us-ascii?Q?s/BlhkL6Rxfv0lK2qdRgeWxcRGLtmVE+ZZT0C13K8iqJkb79zis1Y/7Qyd0k?=
 =?us-ascii?Q?2gYejhnvpGbwPLn1wMYDGw7dZplSLoeMt60Jr4RC5369lLjolPtFnV6EZ8Zt?=
 =?us-ascii?Q?l+f6vlaHtoVwsfFWmL1Zd4mKRNnlL9YUJTkiuNWWiq0B1kbhgyqkZPB2lB7N?=
 =?us-ascii?Q?djMSVEX0jn2ePzi/asDS//k5JsCXKlpCZ2UzK/3Z3K/z9Y9WWYauuPqAD6TP?=
 =?us-ascii?Q?XPyFKI1j3GDvPMw/JAA1pIM+2Ur4FBaGjlcCuCW5IYlqLhVsWplPPDJkuqw4?=
 =?us-ascii?Q?AyUGBhF0QPVkk1IPVCyMHi8b/7fL2ggJRNj9Rdk9s5qI8tGAysggf2dZ8371?=
 =?us-ascii?Q?3FmrCmXkzfV4NEkbZEvUF9/jy+QdwLqXnlBDlaoT7bC8qAsvckgwpnzIa6e5?=
 =?us-ascii?Q?TpXDCH98dqorfMUtG3ppVnzjEpz8HoufPA36qzbVngepMuBy7Py5HkvMYLaD?=
 =?us-ascii?Q?DQmzvmf/42FsoGbnftPZDoiP0ag+l7oJHclALY7DXo7lx4giMi4yTS9ECH54?=
 =?us-ascii?Q?c8GJ4iEXud4hddx7Sj9t6GVGSwyIUIJsSeZkRiavKoRLs8vqElrasiM1pPED?=
 =?us-ascii?Q?zbfXWEEq7FKOHKGEvEPuQGdWQlyJUOyJ7kJHMTVGRfirJoWU1h7J2A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB7634.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PKsRSfgfRMMSsQ0iDeNBC5xjYEPQmoX1zzOXkZyH6qMJIOV1pinyhdlLK7Mo?=
 =?us-ascii?Q?TSULi+7tLn2qmvq1X534RG2EubpgzbDVaLj5J2BCggIDOwRM4ST/HwA7ijWI?=
 =?us-ascii?Q?KHRTs7eMCcr4m1+Tx1hWzMF4Ewof+a81qR5rV2SKjRLIx32RFsPgZUjOZXke?=
 =?us-ascii?Q?dOXytHhjQ3dGbmIHOoMHkp51e9A+tAJuH6FCw8k3LyhcBiPkA97RWfgMt/Vj?=
 =?us-ascii?Q?Hj3Zmq2ynqOVmZwRU8SjRw0Gc825LP+VSz0qodQXzstzR+KaREk5A4hJKX22?=
 =?us-ascii?Q?BiVto00oNpDWlksNPCqMfKaTUPrTqlAlyFk6Wwg5RWbNdO8l+RAEialCzbEd?=
 =?us-ascii?Q?l8D4AlR1AijubQHYsA0/3k1swMHHOLduRZbbQ4MYpxdVP4gwWkVJl8HQRACe?=
 =?us-ascii?Q?hv8KutDXJ1Y3eorR0csnD6FfC4kV9xK/qhPnjH8h/FbiA/F4aPYxK6Gwy/F2?=
 =?us-ascii?Q?TkQLez/eqjalGa4yGaLZe8hrG5ojn/D3IzJaovULbaUWZUVEAmKusOB2+ENf?=
 =?us-ascii?Q?jq2swEOt4dwFBwUIjqxi33yQU3cdVJDzOwnk78L/7lgSho1RFADUgDeH9bBa?=
 =?us-ascii?Q?I+tvRJ4H0+qcPGKL2HNQzmp8sttgJNws/1K0lyQGD4ngRrRQNkqKhB8ZBfIu?=
 =?us-ascii?Q?249dBF0zxBvh5uuemcRjgw+wPgFokEh+yq1GD2iEPnKosmLJWXnO3K2KtsT7?=
 =?us-ascii?Q?dhV4SHY4DxSpe0WIVqPjUj1YlNPsGJRQk9eZ8nVXAlhx8yvMTcOJipGWad0B?=
 =?us-ascii?Q?eQ8UhhijlLxPjZ0nqYcxWpG/itzUGEqDgka6aQtHxnE8JO88Rg+ngiP8Foj0?=
 =?us-ascii?Q?EgECrb5ZpNQ4m8vQw0S9COrYMn4ys3TDtETQVceijal+jo9WJK1NVSym11AD?=
 =?us-ascii?Q?kHf/xMbdmV1gOoM26kaeiOJ3WVuUrYUB94rb5kRxtlB9J9lpgsKegVL+ydzJ?=
 =?us-ascii?Q?el1GCHnwreK9c6jS0mbSl2vLD1Lm1Q1KyzIyTdFE8kVGfzBGT7LtKx+cSBGl?=
 =?us-ascii?Q?siQ46VO+W0jYbsaFC3zof8dmaKrLmgRXkx7Fbh0OkfZ6FUovtTWNi6ZXIl5j?=
 =?us-ascii?Q?nggahzXdsx5r+DyQIMXI396drgUhMpXNOFSd7hhkJMx7861pnA3tKjIE2Ntl?=
 =?us-ascii?Q?EZh1KUvX1h+6tzf/YoB1qEzQqMfXh6NqzaKMmWm/E99MZg1vS4xozEOntf0J?=
 =?us-ascii?Q?mFk++hiYjQgCPo2UqIoJlmornxDqWve9ujpazkV245abl2e7/73X9bdge48n?=
 =?us-ascii?Q?437YbNeOrcRq2P3MEv9yj3ejHVka/+aJiEKdkauLcL1Ctygvm2bxyYE68s4m?=
 =?us-ascii?Q?sU2MfpcRd0IMNDVsxkUaGJXWIBAcJYbp9K56lLCiAFC3u/eCQmXlCet8t9pd?=
 =?us-ascii?Q?is2xQQJdcQA0OkjSlj1n4f49H27llG7GMuMW+kHROK6aanzfR5BNiZjQN2Bc?=
 =?us-ascii?Q?NfM++omxJsOb0JQZ9q9jOSso48Enkn4vWzAD8vJLCcoddFA7hT1DWaE0yRke?=
 =?us-ascii?Q?wcY+s9sD+GqlHdCvBQXJVyw4H1dgBinq/lxNqNWSN21de8FCi7JoS/jT0J4t?=
 =?us-ascii?Q?3zVJQYJl/Y0NKzvmS/RzAFF6G+sAGk1mYsShXc9K?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 69fd8934-394d-422e-4425-08de2dd84fb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2025 17:13:40.5991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SABmVveG8If/9On6G797Jdc+9urbanzNEURQC7TwJY48UVpv/Y+rP6chpqClDmdyj4hxaiYbC88W0fbHc+8baA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8108

Hi Peter,

Thanks for your prompt reply and appreciate your assistance.

We are using UDC Chipidea driver version 25 (ci_hdrc_npcm) in NPCM BMC SoC =
and we are facing UDC DMA synchronization issue
In the UDC Chipidea driver there is WA for version 22 and 24 that running r=
eprime_dtd, not sure why
https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/usb/chipidea/udc.=
c#L840

Do you know if there are any errata list for in UDC Chipidea version25?
Does the UDC Chipidea driver covering version 25 as well?

Thanks,

Tomer

-----Original Message-----
From: Peter Chen (CIX) <peter.chen@kernel.org>
Sent: Thursday, 27 November 2025 4:46
To: IV00 Uri Trichter <Uri.Trichter@nuvoton.com>
Cc: IS20 Tomer Maimon <tomer.maimon@nuvoton.com>; IS20 Avi Fishman <Avi.Fis=
hman@nuvoton.com>; linux-usb@vger.kernel.org
Subject: Re: Maintainer of ChipID

CAUTION - External Email: Do not click links or open attachments unless you=
 acknowledge the sender and content.


On 25-11-26 08:15:50, Uri.Trichter@nuvoton.com wrote:
> Hi Peter
>
> Are you the maintainer for ChipID USB device driver ?
> If so, we would like a quick help from you

Hi Uri,

You could send your question, and see if we could help you.

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

