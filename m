Return-Path: <linux-usb+bounces-33237-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JiiM6P0imn2OwAAu9opvQ
	(envelope-from <linux-usb+bounces-33237-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 10:04:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D191187FF
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 10:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91666304C7FD
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 09:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A7633DEE3;
	Tue, 10 Feb 2026 09:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jcQJTchk"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011052.outbound.protection.outlook.com [52.101.70.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2495D2D8364
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 09:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714236; cv=fail; b=iNTeo657eLfDG1rfS3WMDuS6Wp+DtLl1hoSMejtzPxL5DZAAAoraYN6i3YMRV1Gcwa0Gb0sMxQcozU8Qj6kb7bezZhsBTI8C08QPFaYbWdcdkNVE2+/KrZSQNWTrP6hJZMfzbA7NV6NJsCH8JCNy3b+tBpb2PLsD8A4jpxfarLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714236; c=relaxed/simple;
	bh=Q5MnDUUHgPWxIjYeWzcRRpWLDUGDaA7zPJodvJrmkGM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LQwc2V190ZT16oXXqNGIeCyMt7HSLWmk/JacZzyDdBgP8LNxm+x0FSqNuuiToVRKJYH//oLJ1CUL2qQxgP+lFiqjIQsg9dZcw5UDtx/YQWJxgTxn39QvAYzBcS9YVmYVNvsv9tYjNZKuvB5+1n+VFRB9WkWqfsxIIxPFL3BLdRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jcQJTchk; arc=fail smtp.client-ip=52.101.70.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5sZy2C6ky+YD2jyn6ax7XbblbQ3/e/eXR4C3gMvucUtdFzK4gPJy9yPDiXKMCIxCHcvnVio7JwxWmiWcxIIVnlrxPusYKDPelwjSyOnxntmcY97PhXATs93g3Si4kqjVLrwrFw5oohIucAOoyyXMWZPSrUiEl2ZqawYy81uZ2ygykWw5M5YIKfbNt3bPj6Ik80Fwgg73vYgcAR7DiHtNStY5TXhpy+hPpdgSD7GbA1n4qs+SBBoAAAw0BC14m4VV67kc6BwoXNImoSeh1WiF8eIDb9caZluh+YU4WW8noUETXM6yM2vq46lEbHp0Mom3BPBih/bMHDG6syvp8sb3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5MnDUUHgPWxIjYeWzcRRpWLDUGDaA7zPJodvJrmkGM=;
 b=de6+issrEPMKL/zx8JlHlODYdhIUJpe1m4zHg+l4wtddm5fHELbhDyOTGyegD5Ey9h5G/ysRmuHGGCz4gtvhkgrdEyPUcAwmTSnUDhZ62QH5KUZv89hvYpdvocRzDQZYnJ5n6C2QqirJrbhHq+Ttq4Ii9pwCEqkwocrD7HZpKhqXr97CR9vNIvGw1czVhet32ZkxQujQG6l7UqIJ6utWK2VdvBIAK0Z+m0Hc+o4TF9uZ4wRcRZW33XVpj5gsm7U+brG0GJ11I35DHEh2+vam+eI5UklwVdITQlq6AzE+o1RFnFY0yD328ZKXL2nqfC1pBjP/5NJGwIYneQhaAakDEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5MnDUUHgPWxIjYeWzcRRpWLDUGDaA7zPJodvJrmkGM=;
 b=jcQJTchkJBVD54FmnEXSXbe0FSKtQgDTngmnwdUb4WxetZg7EdyE2MM08yGpGeeQMEmRJ22O9wxzdxIVVHJWtKAhFF9xIWdfBaOOOV192HrIo3bDliAm7b7RSsH+CfeyZgPB4NFP6VwbwP6S0wTxZvg5ZQEk3ny3hD5VgEHuWB0xluzYBEDbJ56DuvrFxVdUvCz+xM3Ae02x5QBHr2MAI++hUS63kPGhC2D1cmoHorSDCfy+cTFUS/5D7lHLHb/Nx/jdyI/Hrb511Qd2WJc+J/5KQHWkCW/l/DgnSYtV7QbjSn4nDZ8eBCCXr5bQTBRs7INkcycxPeLQiVgkZ1aCow==
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by PAXPR04MB9253.eurprd04.prod.outlook.com (2603:10a6:102:2bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 09:03:51 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 09:03:51 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Fabio Estevam <festevam@gmail.com>, Peter Chen <peter.chen@kernel.org>,
	Frank Li <frank.li@nxp.com>
CC: USB list <linux-usb@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [EXT] Re: i.MX6 chipidea: USB port does not power off
Thread-Topic: [EXT] Re: i.MX6 chipidea: USB port does not power off
Thread-Index: AQHcmc6yPSkMKCR5MkalgCWnXH9S5rV7o1hQ
Date: Tue, 10 Feb 2026 09:03:50 +0000
Message-ID:
 <PAXPR04MB8829F3B7736C63C5527AB7468C62A@PAXPR04MB8829.eurprd04.prod.outlook.com>
References:
 <CAOMZO5DuiHWpu9px2-FDWwBnq-W-jEQj1GMSUpTKvncw4OBF-g@mail.gmail.com>
 <CAOMZO5CVcLRBhXByZRT=dNGFWZuQm7r-ALXnWUgC1wu8tXxHfg@mail.gmail.com>
In-Reply-To:
 <CAOMZO5CVcLRBhXByZRT=dNGFWZuQm7r-ALXnWUgC1wu8tXxHfg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8829:EE_|PAXPR04MB9253:EE_
x-ms-office365-filtering-correlation-id: 4bcfc3c9-efb9-41dc-f754-08de68834f22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?L21HR1R5WWozT1F1eDkvbHc1RjRMQjJpSTkweXdLWWFhajQxVGdENmo1dUlF?=
 =?utf-8?B?L1RWaDk0cW5GNGRwYnVWaWpKN2lxbW9iNVg4clRYNktWMFZVblVZR3BmYmVl?=
 =?utf-8?B?VThMenpaQnUySzAzU1hlL2tkUkVab1lnemJUaHE5VGZMT1JncUhDYzNuMUpS?=
 =?utf-8?B?NnhxVk80cTdJdWxpRWExUlNFMGt1dUVDVEpJNEthSG9ERC81WjBWakNoQUly?=
 =?utf-8?B?enFUN3ZvOUo1MW5EajQ5N1pRMFM1dVZpSjRwTXA0b1N4OU9oeXk3VE5VT3Zm?=
 =?utf-8?B?K3JLK1pRMHo0bE9KNlFYSFJPYnhMWnFDbk1CSjlFc0xiekM4UThMN0Y3SnE4?=
 =?utf-8?B?SXBJaWxpQlpVQ09ySE5UamNKYTNySDM3OFQzNFgzQWhmd1ppN1RITEphTEs4?=
 =?utf-8?B?WjBjOG9KYmw3QUczNEgrOCtUZmQ0WmZvN2Z0WllDRjdxR2FPT1pxRGVISG9u?=
 =?utf-8?B?K3Ruc1FYMTFMcFZjWFhNZ05JL0haNG1jUW9obmdZREVRNy9pbE94THVmRWZF?=
 =?utf-8?B?b2t6ZTA5cVB2djgzcG5mRnpGNjllS3VYUkRHeG9xTDlCVXVScnhsVkxqbzYz?=
 =?utf-8?B?R1A4bGFGcHdVQUZ2S3puYURxdmJ5bEhsanRIcWNqci9aUXVnQUpEckR2Y09n?=
 =?utf-8?B?NzM2QXI1d2Mxa0N3L1BPWG44S3Nyd0NLK0dQUXlCeXpycXpuT1o5cmZXeGQ0?=
 =?utf-8?B?KzRMMzBSN1ZhMXpDLytra3ZpN040czBSRXZyZENzU3FqM2tNK1ZwRVU2TE5Q?=
 =?utf-8?B?SCtxQklURzhhL3FSRm9LUlUvVGNSUkFYcWNqdll6Q0trNklzYSt3ZW45K1hX?=
 =?utf-8?B?TlUyUmtHdmFGcllVRTBEVjNwYXl4ODNWQU16N1VwaXBWYWZodWFuV3l5ckNl?=
 =?utf-8?B?d2xJQk1ERnE1SnA4VFdlOEpCYnRCNU5RM1ZlWEpPbHJLME1zeFlqajlscUlE?=
 =?utf-8?B?RXNheHBReHd1RkYwRXYzK1dEbVZjTUVud1VpR2wrMS94aWQ2U3JTSEVZMStu?=
 =?utf-8?B?QkFYR2JVL2RaZmp5dXoxRFNpbmYzd3lHK2lNT0R3QnpEZHg4TytvNytaSlk2?=
 =?utf-8?B?eUtJQUdYWXFsV2RsQkphU3dVQ0RHQkhvcGEvdjdyWnhpVEY0UnM4enJmU0E0?=
 =?utf-8?B?aEx6OWZLMjVuenhwOUljKysvd3ZQUW9Td1E5MjVBWGNwMitCQzFqMTA3cm5G?=
 =?utf-8?B?SmloZ0pDd0s2OVg3ZDgwd1Z4N2V6VHgvYmxwNVVmYWM4UlNOMlZjSHkzRnB5?=
 =?utf-8?B?WXd6TTdZcCtBNkVvcFQxR0d6b2xScUROMGlTRkN3ak9tdUtTa3JoMHg4T0FJ?=
 =?utf-8?B?bXA2Wjc3R3RHcHdUa1hOR1JmTlhDSEVXQnFpbWxTQVFKQzQ5LzJPWUpEKzVk?=
 =?utf-8?B?Si9LY2FBOVFhUjlIMmpnTHFvM3F6S3VyekttajlGV3pLcWxPOWZXSXQ3d3Fm?=
 =?utf-8?B?NHRUQUdBdFNNbmlRbE1FZE1xT2tTUXcweXl2VjI3OUV5UWVaZVZVcEFHNEt5?=
 =?utf-8?B?MElXQXpPczNqOGxLZURNRjJReHVqWkxGaFp4M3RocGJBbUNNZnpGc1Yva3pT?=
 =?utf-8?B?aHB2SGhHZldwUTY4dlhMWWdwcGNlVUc1ZnBvTzF0empBUDB4RUZmczhXUEIy?=
 =?utf-8?B?N0xycjZzZnhxWXlqM3lrUjFhek1OeEVnSUJQM2VZSGpaeUZ5TXc4NSt6RENj?=
 =?utf-8?B?WUFJUHBGdlZOZ1FiOHFmR3dvVWloNkRhcUtUNU9oR20zRUlWMURQTW1mMUht?=
 =?utf-8?B?SlNORkJkZkhYVTYxbUtoaDBmaTQ4eVBmbUhrQjdSZ2Jva3VvTUIwVjIxWmdz?=
 =?utf-8?B?ZEVyZ1F1eUtYMTFobkl1Ry9wYUZrUENKaGF2VkZqbnJLRkNIeWlWWHdHUUti?=
 =?utf-8?B?aDVPM1ZINGtwaUpMOEI1NTc3aHZJZGVWT0VzYWEyUFFNdm1tWGhEYmlMUTJ6?=
 =?utf-8?B?V3NOYmw0WFFILzgwYjkwY3ZNbCtLN2JsN0M3Z0JKZmxyVVRlYmZDbEJ5ZEtO?=
 =?utf-8?B?WHF6b0s4Rld6NkRaeXRjNXlWK0JkVDMrSFRCbTVTNEhNTjJQcFIwTzBFS1N3?=
 =?utf-8?B?WS85SGNwbDhid3hSOG9ZMmRhMkh3KzdleWh1aG9hNUhMZzdkcWpLV1ZsK2Q4?=
 =?utf-8?Q?0aoM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cXdsTVExcUphWUIxSDJTWlRjazhUS3E4WWgxZEh4OWFWcjNVb1lXejlWRVlK?=
 =?utf-8?B?akczem5IUFNhdzhLbnZGcll3OUI3V05hSE5raXhFR1ZTQ0VEN3FKY2tLYlUr?=
 =?utf-8?B?SHlpdWZaNDN6K0l6QkNrZGV4Tk0vcUR2R0tZNGYvRHZDdW04Ymp1SzZNUDZR?=
 =?utf-8?B?VTkvNHAwS2N6Vy9vVXcyd3YrMDlkaVFpVERWQVVCM05pcXZPM0Y3RVFVRnpC?=
 =?utf-8?B?b2FqODU2MllBNU43RjJRaFM1TjZiRE90UTVOSE9Ya2VseElRSHd0Q3pxTHpR?=
 =?utf-8?B?eXRkK1JOQjNpNkg2OElWbUU5Um9pWVF0aGpqa0FoUFF0RWVqVzJGQWNQT1Jq?=
 =?utf-8?B?MXh2L0J2QXJGQldWNEg3YkpmQVNQOGltb3JKTE1RVFBTSnR2Ry9YKzJQYVor?=
 =?utf-8?B?OFhJNVZJSjJVZHlQcFZZMkZjaDlZMkNUcVV2R09mMUgvN3lKUUVrLzFYbFI5?=
 =?utf-8?B?NnVxcnVTN2c1aU5sbmNSdXN2R0dYclBFL3lOQUVLZ3Z6YnZoN2ZaS2thaTgw?=
 =?utf-8?B?NVc4b1lnMS9ia01TK25Zekt4NW45WmRQTVBGQ3F4RE82MDBScUh2eHhTWndl?=
 =?utf-8?B?Y3VMeUc2RmlVZStPK3c4SmVoU1pLMHlJZmxzUXVFR0VNNHN3MzFhcVVEQ2Ji?=
 =?utf-8?B?VnY2RmdGWEpYT1V5cUR0enBOazJ6QmttY3RNOVRYaG1HdEVjVS9zcjhaczJH?=
 =?utf-8?B?R3U0ZHBXTHI2OFNoNHd2ZGpsUW14dnc3MHJLTUhHWUxXanJlUDcveGk4c1V0?=
 =?utf-8?B?NnR0TVM3cU5MeHpraDNEY3JFaDlKc0NzNGF6Y0lOc0J6SUZ6WFAwKy8xRWZO?=
 =?utf-8?B?bUI4S0ljK1RHeXBsWURQWlpwZXpnZ3AwRlpUZnJNSTZWS3pyaWM4THNBVmxw?=
 =?utf-8?B?ZzdRdDlXbFpXN253ei9rRDY2QWh2WGRidG44TlNuS2hDdWsvamR4RGFrNnRQ?=
 =?utf-8?B?VlI1bGJwdGd3OXRMU3pUQlZCdlNqMTlpYXpPWWErNUlnQ0xCT2tZcjJGQ3hZ?=
 =?utf-8?B?VHd2U2JaN2Q1d2tWOVRzVGUrUndjQmVsKzlvZXNhVWxqazVYN3FzSlVFZFo3?=
 =?utf-8?B?WlFaOWp3ZjN3UGhxYXNyd1grNjBROWNzbWdaU1RMNjhvem5QNkpxRVRpc3lY?=
 =?utf-8?B?RDRtVTNjOHVSMXdkMVVFWDdJL1dFSGoxdXJCZVJtYVlOTEVMblJRLzdvV0Q2?=
 =?utf-8?B?RmsvYlBBeDRFcWNjNGkrTlNTUGtKaHJFUjJpT3ZyeE1vWlJVQ0VXQXhYdmZU?=
 =?utf-8?B?ZWp1bDZIcUJhUmh5alE0LzFDWFBkeUN1cVdXcmpINTRMNkc2T294TEtMU3pH?=
 =?utf-8?B?b3RISHpCU1RnZGx1cjByVFl1cVA2VXByT0w4MmQxUmFIYjRNK0ZnSzdlZjhV?=
 =?utf-8?B?NFVjVG1sNERWcmRYUXBwcmtCd0lVYUZkS0c4OElaSHc4TmNveCswcXN2ZTls?=
 =?utf-8?B?NFRHT1VTNjBmUWhpOG1qeXBaQW1pMm00dTRSem0vdE41SHNuRjZJL2lQN1JE?=
 =?utf-8?B?RW1SL1pGRDVHY1Q0MnYrVWNYTndzWlFaaHZMY2xaNms0Z3o0azdnWVQ1WVF0?=
 =?utf-8?B?ejdhM1lock53aHlHQktOM2JYYytuME5McitwZDZUaWZSbjhFUUUzVWJ1Yk5s?=
 =?utf-8?B?czA3aFVhb24rQmJHYkRmREFaaVNFK29oTitGcTQxSnoyRnNqV3NnSEVuUDBy?=
 =?utf-8?B?QmJ5NEZUV2dEdkRxVzFnc1Q5MkEzYTRQdVBtcS84UEpsbGNsUWdoblcvbjZn?=
 =?utf-8?B?YjJxcDJjV1p6TnI0c0pEb0pTYnRjdDYrVE1jbmxaMkNuSEJmMlkwRFpSQWtP?=
 =?utf-8?B?azBLNUVOcFpVQlByWmVuSkg5MmVTcnR3eUtoZktwUURpWjEvNmRkWGZsTHor?=
 =?utf-8?B?eUgyeWtEZ0E1UzFHaTAxY3ZPM2k2ZFpDRG5wZ2V1K081ajFVeGVQUmVVcGgv?=
 =?utf-8?B?ellrdndJYk1uTTh0KzRaNWRyOXZBZ3l2Z1Jwc1BmNDhZY1dCT25sUytOUVo1?=
 =?utf-8?B?a2JiOFR2dTJhNDdBTW8zeXA4bXYxdVcrUDVvRzd1L2tYNTFhTmdNQ0ZGd2Fw?=
 =?utf-8?B?dE9jK25mSkdMejRSSENLVlNXcXphTWdRUWFDdWR5ckduQlJSSVRNTi9EODlF?=
 =?utf-8?B?RHJiaCtRWlZSc002QXF6WUk4YUZMZkVrM1JTV0lNbkJhRnIzVERJaytFa2o5?=
 =?utf-8?B?T3Z2MVBaSXNzQTJzcSt3WkNQT1dPTDhlU2FnbXBYN09VWXJtWkRBR2JYdHFH?=
 =?utf-8?B?T1FJVDlXSXhWajBkTlR2MXNUQWxSUDNtQ3prYTRMOWhRaWdNanNQUElGNVRB?=
 =?utf-8?Q?44KmUMG+nuLJJ2Gg/a?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bcfc3c9-efb9-41dc-f754-08de68834f22
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 09:03:51.0726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9LQ431Ro63aslyslrLdHpgdAlWRXXtFAhi0gSrUxXUgR9dmNGaub5McJeDhf7zqKcZro2Uuz/B1p1Y9ROybmqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9253
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,nxp.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33237-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim,PAXPR04MB8829.eurprd04.prod.outlook.com:mid]
X-Rspamd-Queue-Id: F3D191187FF
X-Rspamd-Action: no action

SGkgRmFiaW8sDQoNCj4gU2VudCBwb3dlciBvbiByZXF1ZXN0DQo+IE5ldyBzdGF0dXMgZm9yIGh1
YiAxIFsxWyAgMTE3LjEyMjkyM10gbXhzX3BoeSAyMGM5MDAwLnVzYnBoeTogdmJ1cyBpcyBub3Qg
dmFsaWQNCj4gZDZiOjAwMDIgTGludXggNi4xOS4wLXJjOC0wMDAxMy1nOWJiZTcxZWQwYzZhLWRp
cnR5IGVoY2lfaGNkIEVIQ0kgSG9zdA0KPiBDb250cm9sbGVyIGNpX2hkcmMuMSwgVVNCIDIuMDAs
IDEgcG9ydHMsIHBwcHNdDQo+ICAgUG9ydCAxOiAwMTAwIHBvd2VyDQo+ICMgWyAgMTE4LjMzMzY5
N10gdXNiIHVzYjEtcG9ydDE6IENhbm5vdCBlbmFibGUuIE1heWJlIHRoZSBVU0IgY2FibGUgaXMg
YmFkPw0KPiBbICAxMTkuMjQzNzkwXSB1c2IgdXNiMS1wb3J0MTogQ2Fubm90IGVuYWJsZS4gTWF5
YmUgdGhlIFVTQiBjYWJsZSBpcyBiYWQ/DQo+IFsgIDExOS4yNTA4MjVdIHVzYiB1c2IxLXBvcnQx
OiBhdHRlbXB0IHBvd2VyIGN5Y2xlDQo+IFsgIDExOS4yNTY1ODRdICoqKioqKiogRGlzYWJsaW5n
IHJlZ3VsYXRvcg0KPiBbICAxMTkuMzAzODAzXSAqKioqKioqIEVuYWJsaW5nIHJlZ3VsYXRvcg0K
PiBbICAxMjAuNTIzNzc1XSB1c2IgdXNiMS1wb3J0MTogQ2Fubm90IGVuYWJsZS4gTWF5YmUgdGhl
IFVTQiBjYWJsZSBpcyBiYWQ/DQo+IFsgIDEyMS40MzM3NjJdIHVzYiB1c2IxLXBvcnQxOiBDYW5u
b3QgZW5hYmxlLiBNYXliZSB0aGUgVVNCIGNhYmxlIGlzIGJhZD8NCj4gWyAgMTIxLjQ0MDc5M10g
dXNiIHVzYjEtcG9ydDE6IHVuYWJsZSB0byBlbnVtZXJhdGUgVVNCIGRldmljZQ0KPiANCj4gQW55
IGlkZWFzPw0KDQpDSV9IRFJDX1RVUk5fVkJVU19FQVJMWV9PTiBpcyBzZXQgZm9yIGlteDZzeF91
c2JfZGF0YS4NCmh0dHA6Ly8xMC4xOTMuMTAyLjE0OS9jZ2l0L3VzYi9jb21taXQvZHJpdmVycy91
c2IvY2hpcGlkZWEvY2lfaGRyY19pbXguYz9pZD02YWRiOWI3YjVmYjY0YmUzYzNlNGQ1NzU3OGVh
MTQ0NmRhOTFhOGY5DQoNClNvIFZCVVMgd29uJ3QgYmUgb2ZmIGV2ZW4geW91IGRpc2FibGUgdGhl
IHBvcnQuIE90aGVyd2lzZSwgVVNCIFBIWSB3b24ndCB3b3JrIHdlbGwgaWYgeW91IGZvcmNlIG9m
Zi9vbiBpdC4NCg0KVGhhbmtzLA0KWHUgWWFuZw0K

