Return-Path: <linux-usb+bounces-32186-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BC4D12FD6
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 15:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61EEA3020CC7
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 14:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6951435C1BD;
	Mon, 12 Jan 2026 14:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="C4aFOvta"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012038.outbound.protection.outlook.com [52.101.66.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337283563F6;
	Mon, 12 Jan 2026 14:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768226480; cv=fail; b=u/5jya6cAlYL4I3LH7BF7QK1L89Kbqg2NltZLNVj8XrMVMBghxWPuY5pM1mop+w40jg2j/9l8wY7FZ6fOkU6ttmcjfTOwcre/EY7aPWnghsogKPZNhFMS23zzEQX8cKedA1NYoVsKWcHJAzp3+NfeAxfHDqhmAMo7rnWxKcYKio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768226480; c=relaxed/simple;
	bh=EOJ0dL41gxUO6BjeAwzlwY3LUOGLiHnnileQdH5eDRk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WbMB2AY4GAYfdXtZ5nPkIUfIxur+Tiq6ASy1n433wzhsbeqHW+UG9o/lxJxLMTo7CN2p47YEZH4fXbA6REpdzTybveucuCv0tsaxpw1bIiyJZO9UnLSAaJiPdvVh6lUb+8ZEW7Q82xtr2HLarp4mBxBBNpZQexFUgD57b2isnws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=C4aFOvta; arc=fail smtp.client-ip=52.101.66.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eje1Hs7jtK18nexg+qTf3beovAkzDqxwhJXRBFNY0eYScm45mLWa3HmfWyynwWV02sTLQ94I+GuZMSNOMiNw8fZ8vw3fa0ay+7u9rwAzptxQ3V8jOfFrSYLQaWFk7YPB3wjGA+3OfskJK2T3I9wp1WniPiQ75HDfSpnkJhUFeEqFM1hzDCrowT/YvRnA2Ee/uSTcYKG0i9K56MyMlQ5cKSNSW7N4lCps6wsiTZYAmMAUvbey3Vp7MC/zzu6jqiHyunTfDxKf+B6yeM5e+oM6nW5x9HR7ydRuy8C5sOWWwD+hkttNGXhEMD9/C/IWQck3ucRt329QHAdAzimhzzatGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1my+Qz+0ZYYIk6yGQZoYxXTd4Rnkazjgd8h4IPnn+fY=;
 b=fIx54YGhD8zAmKm+7F0Ei6WseeLWeKNvsYAGdrl759U3IY+O+03eBTqBl1becp2wfClfsorFqTe5j24MLyxDkzI7B3Kpw6I3DuYWj0pQDUYcSW3N9pJDaO/Zb7YlHQuguEpDQwaPcJaryUXR4ICe05X/xUwqPATxiZMfQfp1eArncVbi1HtmoZ9cEBtpUId9pITrLU33n0dvHYUrSzMGyEQg4lnLUEndOW0hFDJ0ni+Tga7zr7pMt9WlD+YYlvVc7xBX4OOHZYCKbiBNVO8VVn+gAZ/g5TOQkzZG3+yluNmK8AH+IEAlYyQ/NaoeLTDw+SF2lQXL/ng+7y29tgzZQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1my+Qz+0ZYYIk6yGQZoYxXTd4Rnkazjgd8h4IPnn+fY=;
 b=C4aFOvtarrGTai+u7hF/LpzCF8rytRo+8H9aThJZhxKSeue/yeNKDAA9EkKTQbEohFxhBceSfHMNh/D9waAA3U6uGdXEF4Zf1hol9Mrheeop+x4y6Y5gqKNt7opMVFc1FyYOGylugm3P8LA5Sz+SOrCzxmbCI0/rmnOSRARMevU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU2PR04MB8664.eurprd04.prod.outlook.com (2603:10a6:10:2df::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 14:01:13 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 14:01:13 +0000
Message-ID: <07ce7c4e-7fc7-40f8-9c46-4977e3ce2458@cherry.de>
Date: Mon, 12 Jan 2026 15:00:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: Add binding for WCH CH334/CH335
 hub controller
To: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Hsun Lai <i@chainsx.cn>, John Clark <inindev@gmail.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Michael Riesch <michael.riesch@collabora.com>,
 Peter Robinson <pbrobinson@gmail.com>, Alexey Charkov <alchark@gmail.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20260112022823.91-1-kernel@airkyi.com>
 <20260112022823.91-2-kernel@airkyi.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260112022823.91-2-kernel@airkyi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::8) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU2PR04MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: 236af86e-a9f5-41f1-ca08-08de51e30bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlhySHZsUFpZYS94dGFZVHA0YVhsbkNROVpZQUZYRjRUeE1vSEFRbEpVWjFp?=
 =?utf-8?B?RExtV3lmY2liRlYrZ25yQVVCWno2WXFZTjZkKytmSTdyekFleVM0dlFTMUxt?=
 =?utf-8?B?Q1hFZTBJNVYrbmQ0Y2ZCTlZ2bmcxemt2TXA1a0Z3UWd6L0RTb1hyQW5MUHBm?=
 =?utf-8?B?ZkxhdW8xSEdWM1B0RERrcDQ5bFVQaUNBRWd6NzZGZCt0NytWS1Q4OGQ2U3ho?=
 =?utf-8?B?UDUvOWVqbWJZU2tWMkl2RVRtYjdMTW5KekFwbWZWMmJSV0NvU090cDRQSWM2?=
 =?utf-8?B?bFZNNVFCOFQ1djlwamZBWkNaL0Q5dHVxZUxOYlAwSFpyZS9mS1hKUEt0YjBm?=
 =?utf-8?B?bWZWVWhXcGFYek1INTZCYk1MMHZIYXp6bVluTmVQZFRJTktDTmN3cUtlYjYy?=
 =?utf-8?B?ZjZrQ0c3cVlDZkZzNU1nNTQwMElMaXp0MFd2TGY0ci9iTk1WZldZaDJPQUxJ?=
 =?utf-8?B?ZklYWVY4cnFXTkprSzBsMzJOaExKYmswZzlWWnhVS2l4MXNsUlBvbERlQXFr?=
 =?utf-8?B?bVVYeEVpY3kxb29zaFF4TmY4MXlNb0VacXBoV2lrWlpiL2MvRGZCQUtmUkw1?=
 =?utf-8?B?TkFBZWtzaldJTGg0eUJiZVZOaVZhK2tkSkx3d3BndThraXUvUkFLRXArUEZY?=
 =?utf-8?B?WEdmMEhsTURyQVNIUnY2T0NGelJ4TnBwQVRmZmI5Mm9zOUVDVjJXR3RuS2FS?=
 =?utf-8?B?VWRBUWlQRStNR2xlV05YOElmUmlTTW8zdkkwTnZwbUU2UDF2SXN2ZzRtYVZG?=
 =?utf-8?B?Nk0xZVFWaUZsVmRyd0dzSzIvb00yMVpDVFhvNlNLSFZIc1ZVUDFwc3Mxd1Bn?=
 =?utf-8?B?NkU0dnArZkdLQ29uR0dsL1hPRTM4MGpyRmN6TlR5d21hQ2hkVG1vYzhldU4r?=
 =?utf-8?B?Y1hYMFNKY05HaUgxKzVmQzg0Sk9JNmNuOE8yR25rRmV3QzJJTkw1dS9aMFpY?=
 =?utf-8?B?Q0t5R0hBWkFHV3J4RXVTbVA2d05mcXo3Q1BSYjJ3V0J0R3B2Z0QydTFiU2Vp?=
 =?utf-8?B?eDR2SG1zeFB1ZnRMNUhoaXd5ekJhdkNjemUwVDVPaEg2cmtzZE15eGlNbWpJ?=
 =?utf-8?B?YU9CcXJSRkl2U3Jkc253cXZwSkI4SER2Q09QT2NSdnN3SUx3c0YwMzZoQ0pV?=
 =?utf-8?B?WEdPZ3liTE5ZbjJrdXpGMWpXeERNSFBtUFRJZnBLSjFzQ0wxMkFYUzhycGsx?=
 =?utf-8?B?T3FZaTNrcFhodnA5RWlHblhnaU1SL1h1MWQ0VHJpM0FEOTJnQjVtc05XdXBG?=
 =?utf-8?B?ZGdlNFA1L0wwckFTM2hkbGFIWkxiRmtnUzByQ1VWem55alU4cGx6VVNVUktx?=
 =?utf-8?B?L0RjWU50c2RiWHRWTGV4SlcxY08yNEs1T3FSTDFoYWh2SE5KSXlFaHJycTJS?=
 =?utf-8?B?bDFERXZUdWNDdmxFb2tMZ2JCWndkTm5mMys1bUdZcVJXaEFDSjM0OEc2Wi9G?=
 =?utf-8?B?SllKQmFncnBzWmdhcXhFaVg2R0ZwZXNEcHphVVFUVFBBbkdaL2NHbVM5KzZP?=
 =?utf-8?B?VVlBaW9qR0t3enNSUERlOUVoWXRUNEZ3WFBKRHo1OER1T1RPcUlhR01ITEVG?=
 =?utf-8?B?Yzk4N0pzSGV6MEhrVmRmUWZYUGJha3pwZ3dPdzVQN1ZNQnM5bUdRbTJzQ1I2?=
 =?utf-8?B?RVVEaEtvM1ZPSWo5SEU3bnNmbW4zaklzVjVEL1M5RVZoQ1JCM0RDa2g4L0FR?=
 =?utf-8?B?R2JvdDlZTk9XWlFGK01ETXA4NkloNHFNaUF0clJ3Y0lrNEJESXk2Tm50RG5l?=
 =?utf-8?B?YTViNzVNVm5WSmNzdllubm9Ld2lqbkMzSTZsc3FUYWYwQ0lZT1lxNkU1MzBT?=
 =?utf-8?B?eVBsbXIzSUlSTWo4UjlsTUhrU0hGMUhLUFpnQ0l5cEs0T1lEUTgzcDZjRmR2?=
 =?utf-8?B?WVQ0YWU3NTdUWTZuMGhkSWFlUmV0SVNYMVhMRzlEbGVLVGFNY0pRWTFMY09o?=
 =?utf-8?Q?X3u54sReosmP5hcFjw9sl3N06x8jn+nQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGpLZXIzc25iV2lLT0FZVit1SElwejFYMFJzeHdSVE1VamcraG12NmVmdGI1?=
 =?utf-8?B?N1BPOWdQamdMc21xYzJDcFFrNE40UWdtTk5EZ0EwZlNOTzN0a2NJbVplZ092?=
 =?utf-8?B?bHBueHZ1Y0w1Ylkwamg4UDJtcm9wWlhHV0RvcmpqRzNIMXplVUxFVmx3REUy?=
 =?utf-8?B?ZTU2RjB6T2w1dXFESnYycjJEYmc4aG1SOGNPL2pzNXQ4aHZIZjdZdEFJY2FC?=
 =?utf-8?B?KzRQNUQ2WEFTLzF5N3NhTUdBNHUrWWNBTHBNYXg0VWlwS2IwUTc1VUpzWUJl?=
 =?utf-8?B?T2ZUVmRWQ3ZLUzlhWkxBMjY3S3l6TXhFeWErMk9BS2VYakpGR2R6SzEwTEI5?=
 =?utf-8?B?anZmT2RTWkQ3QjU4MXY3ZWdleUFJbjFrekJqMGFJb3dILzFjc3U2YlB0ZDVR?=
 =?utf-8?B?UTd6UW9GNWdjNWhPaXNaZ0l2eWgyV2RxRTkrUUVMWjk5cHdZOFJWV3ZEOHE2?=
 =?utf-8?B?SnR4Zzd1dFJzVnRwb0IvZEoyblVMWG8xQXJZTGtLemIyYTBuNVhpRDRHelFa?=
 =?utf-8?B?cWlUYkdGUzIzaEE3eWs5UUpYSEJkSlBBT1BnQWFDWHFUY3lvVHhYU2dkM1ht?=
 =?utf-8?B?WUs1ZU9xaWRxa1RucTJncC9YY3diMFhtM29zQklCTlMwcGxZTXBEMDlUNmtF?=
 =?utf-8?B?RGZHTkNuaFptTlk3OHhRa0w3MllDVDJKUzZDclErM1dqMWxEei9nRXQ2b3hm?=
 =?utf-8?B?S2kzSEgwQWJEVDNiWWsxYWxZdmxtV1lqcFRHZXlIYVozK2ZjT3F6OUlXR0lV?=
 =?utf-8?B?RW1uU1RNNUxlenA4SVpCUklIc1J2WkI3YzNDMDMwYWxwSm9wczRyMHFQNkNQ?=
 =?utf-8?B?MUNsaVArZVl4T0pRTDJrOU1ncC9lMk1WNFdycWU1MDUrQXFocW9WOWQvR25q?=
 =?utf-8?B?YWlqdmpTQnBjRDF0RmhoWWJYM09rUzU4elNQeGh1aTd1cUlXVDlKTEwvQXhW?=
 =?utf-8?B?VGhNZGpNVkhLZDZNQlVGL2N1UWd5Wkd6WWhhTlNROVJiMDZzWGhKNTVVSitK?=
 =?utf-8?B?Ym8yQ3dZbkwxUndOS1VhTGF5YXA0YXo4R2RsdkJIa0s5QkVPM29vUnE1TUR2?=
 =?utf-8?B?UTVzV0s1eWE5WXNkc0t6NUJoNEhHVXJLWkZZbWRZSG9JdDF0Zm5DUG51a3VP?=
 =?utf-8?B?T1lzN094MlRKNEpqa3FVVTFpMWNqRXpDN1RpaG16alY3YWx2cWhROEIydUpz?=
 =?utf-8?B?YVVXMjFES3hHMlM0SWoxUXZtVEg1TkdYZWpVK1pPR01WRWNqdVIrditBUXoz?=
 =?utf-8?B?dTVONitWWDg1RnJpVFRHVUtvVGdPWW1qcXVyTm4xemM0eHZmYnJ4T2ptWVBU?=
 =?utf-8?B?OWFRNThwVFlmSFBXUGFOanhyVTBQWXJWci9jalR4TUVyZnMzL3ZFL01iazFF?=
 =?utf-8?B?VXAxUDdyMzZrWng5SUVhOXBVUlpqOTd6aUs3QlppeDRIc2FjNlludWtEMUd3?=
 =?utf-8?B?Mk5BUVU4TU1HczdTUUJ6YTV5ZjZCaWtyaE9kQzRmLytxMXd3ZkFVSG0yY3VB?=
 =?utf-8?B?YlEyeTZid0FFMktVeXMyNDJmVUhsdHpFcWwxeEtoNGlvSXZUbGg3MDFxRWhX?=
 =?utf-8?B?ejlvVUpYZG1UMEc0dFMrZnhkYmRQRXZta21ZNXpCN2lmeHlYV0JhNTNDUVcx?=
 =?utf-8?B?eFZFWVJFcWY4elZFNlpTZzBVMkFyMGdZQUJxelVXam5SSmFFYk1XZVc2YnM4?=
 =?utf-8?B?dktONmptVWNWY2Z3dG10VFl6YUYvaXFUZ3pvL3dOMWVaR1VYSnA1VUtKbjRE?=
 =?utf-8?B?dmM0a0E0aW56dmlDQVFsVXdnWXB2NFdPK2IvVkp3ektiU0pnZHRtcjB5ZDJV?=
 =?utf-8?B?UnRlU1Z1cWdaY2YvV1lDVEQ1b25GWFBqanNnd3R2Ylc4ZE0vTG1zWWIzUWU5?=
 =?utf-8?B?SG5aMTZPdlppRHMvaEU4K0tDb0lkNW51SmZUaW10OVZGcjRBcW9RQjNVRW1U?=
 =?utf-8?B?anoycjZRU0lKZ3ptYU9VNEFRcnpjUlNlQTduck9xdFFWZmJqb0lEbHgrMTZP?=
 =?utf-8?B?WU9rM0JScDJmL2VDQUk3RW1EZU5lTHY4T1RnTUoyc0J4WFFKSklsanRwTkc0?=
 =?utf-8?B?K3pJZDFtMW1Qd3g3U1V0bll3NXZ0UWozUTE2Wk1VZDRWSENxQkdkNlRpY2pk?=
 =?utf-8?B?SUgvNlR3ZmdSSHBCNFQzOFFqSElSaW81ckUweXRId0U2WnU4OU1xVUlwck04?=
 =?utf-8?B?OGc5ZmlHeHlrbWx3YTZ2YnQzdlhuMW1kTlp3cFFneGYzZ0VaQXB0VHNHMmhE?=
 =?utf-8?B?bUNwcVZMQzQ4b3c0ajRXSm1DVWMxN0pkT2RzckRyWElIanl3eERBbFRKcCtq?=
 =?utf-8?B?bDZDYjR5WndwZzYyNUFZQWdPZGxFdGtzVFNlaTZuSkRZbEp5c0NWZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 236af86e-a9f5-41f1-ca08-08de51e30bdb
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 14:01:13.2389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O7SQyAHgicw1K/HhjSSYx7Jh0uZ9GrCojFMJvCJaswl9C1PpLSQV0rTigRjYjB9ZFv9fUrUUwm0jGTfAWmGNfu7QitWL2v1zcpZOvv19w8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8664

Hi Chaoyi,

On 1/12/26 3:28 AM, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The WCH CH334/CH335[0] are USB2.0 protocol compliant 4-port USB HUB
> controller chips, supporting USB2.0 high-speed and full-speed for
> upstream ports, and USB2.0 high-speed 480Mbps, full-speed 12Mbps and
> low-speed 1.5Mbps for downstream ports, supporting not only low-cost STT
> mode (single TT schedules 4 downstream ports in time share), but also
> supports high performance MTT mode (4 TTs each corresponding to 1 port,
> concurrent processing).
> 
> Add a device tree binding for it.
> 
> [0]: https://www.wch-ic.com/downloads/CH334DS1_PDF.html
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>   .../devicetree/bindings/usb/wch,ch334.yaml    | 65 +++++++++++++++++++
>   1 file changed, 65 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/usb/wch,ch334.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/wch,ch334.yaml b/Documentation/devicetree/bindings/usb/wch,ch334.yaml
> new file mode 100644
> index 000000000000..2eeb92f25b4c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/wch,ch334.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/wch,ch334.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: WCH CH334/CH335 USB 2.0 Hub Controller
> +
> +maintainers:
> +  - Chaoyi Chen <kernel@airkyi.com>
> +
> +allOf:
> +  - $ref: usb-hub.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - usb1a86,8091
> +

Which driver does this node bind to? I couldn't quickly find a driver 
which would match this compatible?

> +  reg: true
> +
> +  reset-gpios:
> +    description: GPIO controlling the RESET# pin.
> +
> +  vdd-supply:
> +    description:
> +      The regulator that provides 3.3V core power to the hub.
> +
> +  vdd2-supply:
> +    description:
> +      The regulator that provides 3.3V or 5V power to the hub.
> +

There's v5 and vdd33 as power input, shouldn't we maybe use those names 
instead? How did you come up with vdd/vdd2?

There's also a timing that needs to be respected after a power-on event 
so that the reset has enough time to be performed, c.f. 3.2.1 Power-on 
Reset in the datasheet you linked to in the commit log. How are you 
making sure we wait those (apparently, the wording in the datasheet is 
confusing) 14ms?

Cheers,
Quentin

