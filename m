Return-Path: <linux-usb+bounces-11169-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59731904B08
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 07:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 553501C23357
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 05:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB853374C3;
	Wed, 12 Jun 2024 05:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="VjSS7hHl"
X-Original-To: linux-usb@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2128.outbound.protection.outlook.com [40.107.255.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB2B2D60C
	for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 05:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718171321; cv=fail; b=RT1hKleyI0Gq4Lap3lyCh78xp2ANf9L6CZb0ENFezxeHefsy/xYdmdLtYR5VayY6H6u8WCmo+qApu9lHbfv2KKADw/6Kv2A5b5mKdfMtpwFyrgkV34oNkwq/NMC9waPbfYDEWbPFN5AfV3mRkuNPyRgFvoDea1YJ6k1q+0nVdDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718171321; c=relaxed/simple;
	bh=+8XVA16YgeB1SWuNnE27ydus3ORZ3YMPMDYgf/ji1gE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kgd8gXehU/N6pV3O7oW9o16J+ERe0zHAqxHdCzKeZbVhVUeKC04vNi1FNGiL3OBc8y3hB9muTneK9m/zgqSiwl8QO/yIfrqFC9q/cbSshUeMV6g40eLEMUCCRvxIcNcqOKAH0YM8+iYKOUNblRW0V+Omsl3fD+CYaTtkiH45nWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=VjSS7hHl; arc=fail smtp.client-ip=40.107.255.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DokF6f7mCIl65LssD7+ihLgVoiGvWtdrZ03pf1FPYVg4oHBkbsUtBD2PjZOFpZr487acvO3eAiwpeagXaL+1Ju6PyYAGoEju25/mA7RXGINdPJNc0kLFbY7uA/ZSMLXYEeODivkaliFkWHlkpdW/tA2QO7lFdudyrB+XXZ0rjnZoisa9ZCYg0nln0I413Z60IdZbBfyPQVVRSlnIiiWUW2KWvNB+sdKxKtHX0ZJgK0u6XUgGdjLqXSlcl2ktj9XeP2h8fiK5bxX2vREOB8iINyj9/n8yTLxMtFp+TOdrAuguv9Ns21iFlmNjQTTtPEihCLu7DR2+j4kkAcHD6HaAfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8XVA16YgeB1SWuNnE27ydus3ORZ3YMPMDYgf/ji1gE=;
 b=AsQwqjYr+qYVDvriAJ6NDMbIcxRGP1/fJcXKikpmMHJa2CdRjEYzPh3Eggu6f2GqfjTU0uGn1uVVpvMLxZjnV0REIFPizm/JJ5/bJJIynHahjz7CGQx8O6RCRvgl/dw0tXjtlB3ULkh2BSFrcUyEfH1tqLlHz11mropAIAurq/L4kGoFWFBrEr/gvpfoF7k+SX2tSqvY2gbrQLRY+/xi7bqdee1m+TS4H3ZOq8GW58lwM5pw0WTgvAMwhl488Ax+ezS9CX24JdEX9tYkcFk83z/KE7FXW4LMRCOg+fhmh7pw6APHZ3xLOL+wVRRIYFNfGcZeE+9jdQ+28+dnAGz3VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8XVA16YgeB1SWuNnE27ydus3ORZ3YMPMDYgf/ji1gE=;
 b=VjSS7hHlb71SiM5pcWY68fq0EOVhtHaCY6+eXHtNEv5yi3C5nmuIgTDR3z8yX4KhD7LHv7go9nTIjl9MfpkTWSbCfK1ytQGJiUwAmX1xhREnY6xFYUTtHUqo1lqUGTfsPVnqyEwfqAjl7B1PpcHAOZXSWax6aoB2rh/fhLMkqi/pJHfn0WznVPgugF3PaIvy3uEqd5EyVcd2/brjOwSew1ZhBZZB6+rtwqYcu1rGnLRqr7Yb6eKGiYMzYkClZHxTCByLkcJMV1wS4NOmYnlruBbWotc9rQZPdnMA9Ivky3TIkzbcJgLg7Swu+sg8rL4KNip+UxC1mTBlou4kJw0UzQ==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by SEYPR06MB6540.apcprd06.prod.outlook.com (2603:1096:101:175::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 05:48:31 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%7]) with mapi id 15.20.7633.036; Wed, 12 Jun 2024
 05:48:31 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Neal Liu <neal_liu@aspeedtech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Subject: RE: [PATCH] usb: gadget: aspeed_udc: fix device address configuration
Thread-Topic: [PATCH] usb: gadget: aspeed_udc: fix device address
 configuration
Thread-Index: AQHavG6mQz76LN84vk2D73DjxbU1NbHDnsOw
Date: Wed, 12 Jun 2024 05:48:31 +0000
Message-ID:
 <OS8PR06MB7541C6D06FEC637644BEC5D2F2C02@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20240612-aspeed-udc-v1-1-d277b553aecf@codeconstruct.com.au>
In-Reply-To: <20240612-aspeed-udc-v1-1-d277b553aecf@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|SEYPR06MB6540:EE_
x-ms-office365-filtering-correlation-id: 553b31f0-5413-4c7a-e782-08dc8aa34a66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230032|376006|366008|1800799016|38070700010;
x-microsoft-antispam-message-info:
 =?utf-8?B?cVl5UkpyenE1L09mVDdZNzhzVmNDMjBtbVdiUTc5NWpYSTJ5bVRKWEMwaVBk?=
 =?utf-8?B?ZERkVG11Q0VIeWdUWXdHQlNmcFlGcUYyR29NVnVCMEdIK1I5WnBDaE1OcnZH?=
 =?utf-8?B?SjNTM2NmcEhlOWd6ejZsRkpjVllqMXp5WktxOFAxa2VZaUFVZCtHRzJERGt5?=
 =?utf-8?B?MzlGbGp1VHlCOU1sR0RDSlpBNnI1VUVmeHJEMitPaHlXRWFMdTBaRkduSFNz?=
 =?utf-8?B?VnJlQWtvT2tQcFM3ZjRyQVN4SE5ST01JOVpiT0xTanQxTEc0TU5oMHlzV3Vk?=
 =?utf-8?B?Nk54L1ZHWHN1clRTZEMrOVRuZlRQWmVoYnl5VU5rd3lZcGE2c3VoZHpPd1Ju?=
 =?utf-8?B?T3dzUlp5Z2hmQVBod3A0YmVxRWsyS2VKWS9VVlBkcEVqZVlTc1RnY0VpdkFn?=
 =?utf-8?B?RDk4QjVBRzY0Q2pWOExkcnFRYW5kMndMVVRiNStVVUgzNEFsUmw0U0x0TmdH?=
 =?utf-8?B?d0hkWW5WZjFyeEtSV3FHcHRkVUJVeElSNHg2cjNkRmZNOGRXcEZaWFlWRXhB?=
 =?utf-8?B?cmpBd3piV3lTVHhmc1ZFb3Q2eEZJTVdHZkhHOTFoV3BCYkptWkR4OGRIUUho?=
 =?utf-8?B?bk91WVVsTWdVemt3eEJDTXFzMVo3YnZINDF2WkxtcEdpc2VJU2wrcVIxY05C?=
 =?utf-8?B?dCsrMWthZm0zVWFEcGJaUTdZZHp4cWZhbTRFclNZQzlGcHBEQ0ZFWEtwSkNT?=
 =?utf-8?B?ZUozR1hjQUE1SWpKa2N0MnorNWRla3FQV1BrRnpiTlBud1lMcVJYRGU3ZWFp?=
 =?utf-8?B?aGYyRFFUaEZLODZacUpBYW5JWGx0a2VuVXZSaHdSelhzR0pvckdLaW44Nk54?=
 =?utf-8?B?Q3p5Zk9GOU5Lb2JQTEV0MHVaYnYxMUpJdU0zYjJjOVBCZWgwbmwwOXRGb3NP?=
 =?utf-8?B?Q0d3V0xTN3h5SHQraENNc1JtZ0g0b3Y5VUhuUlBPYUNTRUE5QU9TK2IrVWpr?=
 =?utf-8?B?MmdwbjUxZXlDWUdDS010V1A0NFNHS3hUVG9zWUszeENaYXBqYnJJcEpKNDJR?=
 =?utf-8?B?Q2l2eXJudVhYTll2S2t2emdaMmxQbTUxUHpnekRBTnplZFdBYTdNUUk5WTNy?=
 =?utf-8?B?VWFBT2F2c1VkZkRraHkzQU5VeUNjUElUNjkvY1VVRzdPeEpBRGNmS3R5c0hH?=
 =?utf-8?B?Q3Q4RlM5bm5lTm9nODdneDloZGE1SURSSms1MkdUOVB2aEZhVElQZFpPVFpa?=
 =?utf-8?B?dGRTZytiaGhTZXNaczRObGlPcHpZRUxxc04vOXlCMjFZbWJPRFZ5WU5YTW5T?=
 =?utf-8?B?YjE1UXk2S0pnbnE4VHk2R2tMLytjMy9ZSVQ3d25jc1hYYlplUTNhMWtjT1Av?=
 =?utf-8?B?dk5ONlI0Vm5VRXNoamR4NUZqQUdwa2MxQ2s3YXVhUk9PaEdGVGVaR3JiU2lx?=
 =?utf-8?B?V2lXQVRtRXAyUnVoVWQvZDVjeUVKMVBZcjJCSkxoakdzYXpEazgyUUVJUmha?=
 =?utf-8?B?a29vbWNXZXN0VEl5dUtER2Z4c3lKcmlkT1ZWTHU5VkMzekdWZEFoSG55L1lL?=
 =?utf-8?B?T2lDR2FYdWJoclNnOW5KbnQwMFFMTnRDbDVGbVYwdURxWFRqb3IrWFhDdTRZ?=
 =?utf-8?B?K2M2SnllSkdmY0tCMXRuWFZYRG9aRHIvbVZSSlI2VTlzNnJjMVd6cVk1S2VO?=
 =?utf-8?B?MWZkVWJhMWM5SFlYM3N4NVRMdWEzWWZTRlBNdzhMNmo4bmVRQ0FWZlhGSHlK?=
 =?utf-8?B?ZEpxeFo2dmtTdlhMaFA4Rytrak9iczJKeGdlSVBrZTBXMU1sVDM2elo4WTlT?=
 =?utf-8?B?bW5RSFRBYUFlN2JxNmU1NVZ5NUR5c21MQUVTcHdJQ0Y1YnhUWDZvcGRjTmtU?=
 =?utf-8?Q?FnsvFQdCGSi5UyL27t/QEkmGNbxcAAG+LeyTI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(366008)(1800799016)(38070700010);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eGNYeGlUME0ydE04TTB4aHpNeUNVUU5XRWlQdE1CZ0tJcmNUYTd0QXBBZnJx?=
 =?utf-8?B?ZjQ3Z1YzaGpOSzhYcm5iT2lIY3o4UzdSeGhnMjY5R3oycnU3a1d6cFV1Tlh5?=
 =?utf-8?B?SHh3SmRucTVCdE5Hcno0OFpmUHpPZHEzaDhRdUJuWUdmb1c3K29JQWNEL2lL?=
 =?utf-8?B?WDV6WG1aaHk5SERzZit4NWFuL2I1dmdIOWlvYzBlcWhFOW1Db2pMUVltZTAv?=
 =?utf-8?B?WjdKTnYyYjJBNExPSUFJdk44Q2VhRHJnOTR6UFNRZWNQbDI0RjQ4cGRFMXNj?=
 =?utf-8?B?Vll2c0luNHpnVHJzaVpiOXdjK2RPTWxSaUhqd1k0WEtWZlJ3VjVBNEUzVjI3?=
 =?utf-8?B?OFhmZ2pKVnpOSHNybU5GbHpQV2ErbWhSa1QvZWFrVHhZeVJza0p1bVkxMEhj?=
 =?utf-8?B?MEhPdzl0UUdqVFpGR0xsTEZodXFJc0Q2d3liUmNxUnhTNXNyZHJRSzBteHE1?=
 =?utf-8?B?VldyaTJGa3NFVTh4YmxSZC85T2Z4NGUxMjJ6THdOczF2aVdWV2JXMExCTHA2?=
 =?utf-8?B?Z3ZlTE5rUWQrYURacmdpaTJ5UW9rSzJxaUtlT1lHVjlRWWJEa09XZTRMMG1s?=
 =?utf-8?B?R2lFN0R5dW5qbTVndXBDWnpqZFdMQnF5OWt6bG1scHZVZGlIMjYxR2NxUEtw?=
 =?utf-8?B?a29EZmdHbUN4RDIyVzVDdEhJcXliek0wbldNNTQ0SjNiVXREd0xkclFzc29Y?=
 =?utf-8?B?cUNRdE5iOU9DR25FOXM3SVAvKzJzZWpRa3NFa25ldE9rSHlWOERIZlloUVNO?=
 =?utf-8?B?NytCWSt1NFU3MVU1VXVQL3p5MEYzZUFuQ05xTzFtTFdLZFBwMlRzTzZqS2Jy?=
 =?utf-8?B?bjJSdmphU1dFa2N3RWtRV1FQZVl2S21rMFdHeWNXVE5Rbncvb1NlOEgvWUR4?=
 =?utf-8?B?SHJzNEE0UEhWMFhhNzZud2xJZmZtdC9jK0dIZXJnN1RhM2FWLy9iRjdFZlRB?=
 =?utf-8?B?OXpreTFwUHBJdFluSW5jWk95V2NYNFpCdm12M3gxa0k3RElJUzNKUGo4dE1S?=
 =?utf-8?B?RXJYT1JIZlpMMGlGcEw0RFRJdFhFT2tBYlhwRVYxam5nQjJRSnkzVjJVWndp?=
 =?utf-8?B?MWtuU0U1bnBPS1JJaFF3bTNabTEzaGU1V3cyb2pPWkt0RG5nQnZRRnlKdDlQ?=
 =?utf-8?B?MkhxL3crYmhBTXAyZmJSUms0YWJUWFA3cFcrNTlBZWpYVmFzVHZZZk8yTm5m?=
 =?utf-8?B?MEp5UVIxc2F6NmxyNFhxZTNBbEh1NkZZeUlGdUtGVjhhS0d6QzBjQXA3K2VP?=
 =?utf-8?B?S1YrQkFJQTB3M0JQZFhYOGs4RjVoamhiTjNoSWxWRjBENFFZNm91Y0JQQ25p?=
 =?utf-8?B?NkF1TG1IQzhhOGJCUFhBK3R5K1lLdjV2cm1xa3BHc2xXV2taa3dMbm1UN1Ju?=
 =?utf-8?B?SWJzWHNDL1d2Y3NvTXgvYTJzUDJQdTJkc3h3cW04MHl2MU1wcnlMeUJsUUc1?=
 =?utf-8?B?aWFVRGxFOW5oQ3MzbkRoMklQRDVnSC8zNlltZzUxM1V2NWpFRWVWQzQwRGUz?=
 =?utf-8?B?MjVDQWJtQkZGZzVDZ0dCTDU0cW1JMkhXTGdVR0NhdHpCdFFmTjNxK2owZnpT?=
 =?utf-8?B?Yk9vdHVxVVZjVHZZNDhaNE96eE9MMEdiZEJGcUNiWGx4UysraUJLc01hTmNE?=
 =?utf-8?B?WnYyVDBOcDdCaUFQM3Nhc0pjN0pxYXp5SEtoK0NWNngvR0d3TTA5S1FGd3F4?=
 =?utf-8?B?cU5LYXgrZXBmK05kOEhGMUpQV2RzYXgzVUpGTk1DSEFnYitIaVoveTZ5ZWxL?=
 =?utf-8?B?L0lScGZjUDBEc3E0STVLYTRXc2l2NjFVQkxSMzFoVVRTTW84dG1XRUc0MEtF?=
 =?utf-8?B?NFk5eVpabWFYczFxeHpQdjVFR0JXUUtxemFXcGMyYzByd29ocWpQcnkrdnRL?=
 =?utf-8?B?enRhZElIbTBxZldCWlVWL3NZYmtMKytXUUZTKzlGMzRBdXNhZGJJRmYvd0JS?=
 =?utf-8?B?T0FvWUJxVTZYRnFRY2NVdWNvSUx3Wmh6b0ZOSWJkY3J4N0IvTTVDS2NCSHhv?=
 =?utf-8?B?WWVqSGRTMHpLWUtVbTEvdTA3aXJndk5sUGxQTUs4SXVvRUFxK2ZkUlZPWFZ0?=
 =?utf-8?B?YUFYeStqZVE2VW5JS1VnMTZvejVZNkd6ZmVCc3drZjAvZi84b0RiWVBrNXkz?=
 =?utf-8?Q?rhGFPP+15myYdXyYlDccB8ini?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 553b31f0-5413-4c7a-e782-08dc8aa34a66
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 05:48:31.1796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JNw2W/YDRDkSYS6fH7IIppRPC9b/Ayg5vlAvfTNnCVwKu7Q0luxwg77jVlhPC375h5xCdwZ+n2eM4Jv3Neimy6gsiAWjbE/SizVpA4LTjIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6540

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExpbnV4LWFzcGVlZA0KPiA8
bGludXgtYXNwZWVkLWJvdW5jZXMrcnlhbl9jaGVuPWFzcGVlZHRlY2guY29tQGxpc3RzLm96bGFi
cy5vcmc+IE9uDQo+IEJlaGFsZiBPZiBKZXJlbXkgS2Vycg0KPiBTZW50OiBXZWRuZXNkYXksIEp1
bmUgMTIsIDIwMjQgMTA6MDggQU0NCj4gVG86IE5lYWwgTGl1IDxuZWFsX2xpdUBhc3BlZWR0ZWNo
LmNvbT47IEdyZWcgS3JvYWgtSGFydG1hbg0KPiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
OyBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PjsgQW5kcmV3IEplZmZlcnkNCj4gPGFuZHJl
d0Bjb2RlY29uc3RydWN0LmNvbS5hdT4NCj4gQ2M6IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnDQo+IFN1YmplY3Q6IFtQQVRDSF0gdXNiOiBn
YWRnZXQ6IGFzcGVlZF91ZGM6IGZpeCBkZXZpY2UgYWRkcmVzcyBjb25maWd1cmF0aW9uDQo+IA0K
PiBJbiB0aGUgYXNwZWVkIFVEQyBzZXR1cCwgd2UgY29uZmlndXJlIHRoZSBVREMgaGFyZHdhcmUg
d2l0aCB0aGUgYXNzaWduZWQNCj4gVVNCIGRldmljZSBhZGRyZXNzLg0KPiANCj4gSG93ZXZlciwg
d2UgaGF2ZSBhbiBvZmYtYnktb25lIGluIHRoZSBiaXRtYXNrLCBzbyB3ZSdyZSBvbmx5IHNldHRp
bmcgdGhlDQo+IGxvd2VyIDYgYml0cyBvZiB0aGUgYWRkcmVzcyAoVVNCIGFkZHJlc3NlcyBiZWlu
ZyA3IGJpdHMsIGFuZCB0aGUgaGFyZHdhcmUNCj4gYml0bWFzayBiZWluZyBiaXRzIDA6NikuDQo+
IA0KPiBUaGlzIG1lYW5zIHRoYXQgZGV2aWNlIGVudW1lcmF0aW9uIGZhaWxzIGlmIHRoZSBhc3Np
Z25lZCBhZGRyZXNzIGlzIGdyZWF0ZXINCj4gdGhhbiA2NDoNCj4gDQo+IFsgIDM0NC42MDcyNTVd
IHVzYiAxLTE6IG5ldyBoaWdoLXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDYzIHVzaW5nDQo+IGVo
Y2ktcGxhdGZvcm0gWyAgMzQ0LjgwODQ1OV0gdXNiIDEtMTogTmV3IFVTQiBkZXZpY2UgZm91bmQs
IGlkVmVuZG9yPWNjMDAsDQo+IGlkUHJvZHVjdD1jYzAwLCBiY2REZXZpY2U9IDYuMTAgWyAgMzQ0
LjgxNzY4NF0gdXNiIDEtMTogTmV3IFVTQiBkZXZpY2UNCj4gc3RyaW5nczogTWZyPTEsIFByb2R1
Y3Q9MiwgU2VyaWFsTnVtYmVyPTMgWyAgMzQ0LjgyNTY3MV0gdXNiIDEtMTogUHJvZHVjdDoNCj4g
VGVzdCBkZXZpY2UgWyAgMzQ0LjgzMTA3NV0gdXNiIDEtMTogTWFudWZhY3R1cmVyOiBUZXN0IHZl
bmRvcg0KPiBbICAzNDQuODM2MzM1XSB1c2IgMS0xOiBTZXJpYWxOdW1iZXI6IDAwIFsgIDM0OS45
MTcxODFdIHVzYiAxLTE6IFVTQg0KPiBkaXNjb25uZWN0LCBkZXZpY2UgbnVtYmVyIDYzIFsgIDM1
Mi4wMzY3NzVdIHVzYiAxLTE6IG5ldyBoaWdoLXNwZWVkIFVTQg0KPiBkZXZpY2UgbnVtYmVyIDY0
IHVzaW5nIGVoY2ktcGxhdGZvcm0gWyAgMzUyLjI0OTQzMl0gdXNiIDEtMTogZGV2aWNlDQo+IGRl
c2NyaXB0b3IgcmVhZC9hbGwsIGVycm9yIC03MSBbICAzNTIuNjk2NzQwXSB1c2IgMS0xOiBuZXcg
aGlnaC1zcGVlZCBVU0INCj4gZGV2aWNlIG51bWJlciA2NSB1c2luZyBlaGNpLXBsYXRmb3JtIFsg
IDM1Mi45MDk0MzFdIHVzYiAxLTE6IGRldmljZQ0KPiBkZXNjcmlwdG9yIHJlYWQvYWxsLCBlcnJv
ciAtNzENCj4gDQo+IFVzZSB0aGUgY29ycmVjdCBtYXNrIG9mIDB4N2YgKHJhdGhlciB0aGFuIDB4
M2YpLCBhbmQgZ2VuZXJhdGUgdGhpcyB0aHJvdWdoIHRoZQ0KPiBHRU5NQVNLIG1hY3JvLCBzbyB3
ZSBoYXZlIG51bWJlcnMgdGhhdCBjb3JyZXNwb25kIGV4YWN0bHkgdG8gdGhlDQo+IGhhcmR3YXJl
IHJlZ2lzdGVyIGRlZmluaXRpb24uDQo+IA0KPiBGaXhlczogMDU1Mjc2YzEzMjA1ICgidXNiOiBn
YWRnZXQ6IGFkZCBBc3BlZWQgYXN0MjYwMCB1ZGMgZHJpdmVyIikNCj4gU2lnbmVkLW9mZi1ieTog
SmVyZW15IEtlcnIgPGprQGNvZGVjb25zdHJ1Y3QuY29tLmF1Pg0KPiAtLS0NCj4gIGRyaXZlcnMv
dXNiL2dhZGdldC91ZGMvYXNwZWVkX3VkYy5jIHwgNCArKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdXNiL2dhZGdldC91ZGMvYXNwZWVkX3VkYy5jDQo+IGIvZHJpdmVycy91c2IvZ2FkZ2V0L3Vk
Yy9hc3BlZWRfdWRjLmMNCj4gaW5kZXggMzkxNmM4ZTJiYTAxLi44MjFhNmFiNWRhNTYgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvYXNwZWVkX3VkYy5jDQo+ICsrKyBiL2Ry
aXZlcnMvdXNiL2dhZGdldC91ZGMvYXNwZWVkX3VkYy5jDQo+IEBAIC02Niw4ICs2Niw4IEBADQo+
ICAjZGVmaW5lIFVTQl9VUFNUUkVBTV9FTgkJCUJJVCgwKQ0KPiANCj4gIC8qIE1haW4gY29uZmln
IHJlZyAqLw0KPiAtI2RlZmluZSBVRENfQ0ZHX1NFVF9BRERSKHgpCQkoKHgpICYgMHgzZikNCj4g
LSNkZWZpbmUgVURDX0NGR19BRERSX01BU0sJCSgweDNmKQ0KPiArI2RlZmluZSBVRENfQ0ZHX1NF
VF9BRERSKHgpCQkoKHgpICYgVURDX0NGR19BRERSX01BU0spDQo+ICsjZGVmaW5lIFVEQ19DRkdf
QUREUl9NQVNLCQlHRU5NQVNLKDYsIDApDQo+IA0KDQpJdCBzaG91bGQgYmUgR0VOTUFTSyg1LDAp
LCBub3QgR0VOTUFTSyg2LCAwKSwgYW0gSSAgcmlnaHQ/DQoNClJ5YW4NCgkNCj4gIC8qIEludGVy
cnVwdCBjdHJsICYgc3RhdHVzIHJlZyAqLw0KPiAgI2RlZmluZSBVRENfSVJRX0VQX1BPT0xfTkFL
CQlCSVQoMTcpDQo+IA0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IDMyZjg4ZDY1ZjAxYmY2ZjQ1NDc2
ZDdlZGJlNjc1ZTQ0ZmI5ZTFkNTgNCj4gY2hhbmdlLWlkOiAyMDI0MDYxMS1hc3BlZWQtdWRjLTA3
ZGNkZTA2MmNjZg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0KPiBKZXJlbXkgS2VyciA8amtA
Y29kZWNvbnN0cnVjdC5jb20uYXU+DQoNCg==

