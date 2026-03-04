Return-Path: <linux-usb+bounces-33967-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EHpHUoDqGkRnQAAu9opvQ
	(envelope-from <linux-usb+bounces-33967-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 11:02:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 186D81FE0A1
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 11:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D50D304B11C
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 10:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A30737418E;
	Wed,  4 Mar 2026 10:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="ccJHxxtG";
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="R9LclucM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com [208.86.201.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032DC39479F;
	Wed,  4 Mar 2026 10:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=208.86.201.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772618554; cv=fail; b=ZaMBWmP2wSEWpbIftvIoYz+SBbtTWIMKe7UJe650xugfNJdo3N/6CgO52EgFaZ8E3KNdr2dptMqfDJ1kU8EczwwsCP2K+B7gbttvsPqdQpNdi/KSdYlptOZnKOmZkjhpAs4zzXTzQwr/vKisg++h+26ZGCq1uKQ/xFT0qkk1puo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772618554; c=relaxed/simple;
	bh=PQrfR+3vcus1vvOdSl23+17ZeGlCjFYiocVcVvAM8D8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=inOX42ggIwpK0Eqbe2WvYB3l2NsGX4LQWdHJTX+hWj9bDhRDsXsv0HukWyG4GyrXBH7bkWC5jFkAPjcNQd0iateZeAm+anYKr5UUjLJdLalll98/cnN8z+x6kFqNqdtIEKnY2bCHrl9GQcE3Z6PU+XVo3ZBNDwTMF6LrT7DZ31I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com; spf=pass smtp.mailfrom=cadence.com; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=ccJHxxtG; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=R9LclucM; arc=fail smtp.client-ip=208.86.201.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cadence.com
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
	by mx0b-0014ca01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6247dIGl940256;
	Wed, 4 Mar 2026 02:02:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=proofpoint;
	 bh=PQrfR+3vcus1vvOdSl23+17ZeGlCjFYiocVcVvAM8D8=; b=ccJHxxtG1gP8
	CngtRu01ihx2CbgnsKw4ApIx3FN6vuJyv6DvVwp6v1xULuQzEvd7sjOw/isqkGM3
	LeX97PifJLCSRtjGhZrojQNtpzOLi560sSv50EXbAm1dHjCgT7K99ThVEHl+/AZb
	8iRVXQGEPhT8SsX1famcx9CUFkLuMe6mn+z1HA2EdnPGK9O+H0xJWLWe2eXvb0lG
	+7OmpcXGafxmgEYAXD6ro4zatzPPWeKAh2FyfrUEKOU5PhidYpKrQB0MVPLo84eM
	KmpV8jpj6dxcwxtadtqOdUdMAw0sLLDbkvixnTRwnSTRrGaX9rYt06mg3+Gjp2Ap
	7GLfy1kzvw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012068.outbound.protection.outlook.com [52.101.43.68])
	by mx0b-0014ca01.pphosted.com (PPS) with ESMTPS id 4cp8ksadak-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 02:02:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIBqtGyfQgqfm8JXJ40CsZDycn36rimdyg8Jx27tdZjX+Tp2fZPwkaf25lrgqN90irsHC0RSzyZpR7WeT0AV+nN6sqTYF/lP3MetqKd6ZpFEpgckliBgFa9LB7fB06hJxgBTFQXGlryTBrqhH4GXqt4v3zsk4XBe8BJYB1xSpl+LCyeyMYUeY3qalro0EHJWwN+TRXuiEqCyOct9ZTa3HmRvHrBniBcDiU/bFh0W+HX6W0ozL/zdyZroJgXLEIUhXZ3Fk9IjlpN2wEz82tp8MY+3X416nSrql65K8gwo/WzZNdc+9Rgstfxc0qUr2b80CUsSdQ38ZSV7FzzqBHEnAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQrfR+3vcus1vvOdSl23+17ZeGlCjFYiocVcVvAM8D8=;
 b=LGVJnsFAeAT/wpbMu01KjvqiVTgoc7xn56uzGywqlESTwVXYuedQz6vHLcZEi1hsjnhaDURwC84omaxl40aQXiBD4L5NNskK+ZRWaFN0OkXd7KFldVd4rzRnL7ko5YFSlTAWxmvW118HEn3n/NQdne2K6iATD4kwRqFxtwc0/WeuhAD9vOskETY9CJETcdttT8EyjgvxXOCHjuyMIleUaQIQPiazECPV5z6nJ59yXvMy2muftPrmuapBjfHwPsu4UOSw3hgJo5zciqYamUUhUwBX1K7hDOnvkcAUPXPHp0zfS5LyQcWAJvEccDaJs7phy4B8dcv3wiAW4YmnKiW91w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQrfR+3vcus1vvOdSl23+17ZeGlCjFYiocVcVvAM8D8=;
 b=R9LclucM8whUYMavXkH9ZzgyJzFFDR9ZP6mbU96RK6SrycXVJUuCymHalAbmY4SwXsAk2zWEh5nc4jRH0Fi9r2aJ7NGQq85RaVkSwatcEbcZOo7d9OgZImPYbXk+7mqmLpnF7gPpmirK5fghUg2e43vDm6xjtFCT2+4s8rBZA6R0qvwOVevkKUZ9jieMdVlxZIpoELj56/l9NCchyETJD44UvGXx2CJ2Mn3KugsC14HnwoDiVLI2knB1Jeh9v9p+Tj0tAYk4q11VkBJF77lDhZBgV0V8UwS5i6gizWKVyCASsq0N2ovNBoZDOHkQ6B3oc5xQmtHT0MW+oO80EPw7jw==
Received: from PH7PR07MB9538.namprd07.prod.outlook.com (2603:10b6:510:203::19)
 by PH7PR07MB9676.namprd07.prod.outlook.com (2603:10b6:510:2b3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 10:02:08 +0000
Received: from PH7PR07MB9538.namprd07.prod.outlook.com
 ([fe80::9088:4354:91a3:3bbe]) by PH7PR07MB9538.namprd07.prod.outlook.com
 ([fe80::9088:4354:91a3:3bbe%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 10:02:08 +0000
From: Pawel Laszczak <pawell@cadence.com>
To: Peter Chen <peter.chen@cixtech.com>, Krzysztof Kozlowski <krzk@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "rogerq@kernel.org" <rogerq@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>,
        "cix-kernel-upstream@cixtech.com"
	<cix-kernel-upstream@cixtech.com>
Subject: RE: [PATCH 2/2] dt-bindings: usb: cdns,usb3: Add support for USBSSP
Thread-Topic: [PATCH 2/2] dt-bindings: usb: cdns,usb3: Add support for USBSSP
Thread-Index: AQHcqfEzqq3AzishPkyu47OHwJ3jnrWa2FeAgAAfqICAAAGdgIAAGbMAgAMTr8A=
Date: Wed, 4 Mar 2026 10:02:07 +0000
Message-ID:
 <PH7PR07MB9538DCBF95C0C77D150E2D4BDD7CA@PH7PR07MB9538.namprd07.prod.outlook.com>
References: <20260302030339.324196-1-peter.chen@cixtech.com>
 <20260302030339.324196-3-peter.chen@cixtech.com>
 <20260302-vengeful-delicate-macaw-e8dc8c@quoll>
 <aaVWlfMPSZgy55Cc@nchen-desktop>
 <81c86ce7-0c55-4c2b-8956-cea4c63351cb@kernel.org>
 <aaVtfpY1waI8yQOf@nchen-desktop>
In-Reply-To: <aaVtfpY1waI8yQOf@nchen-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR07MB9538:EE_|PH7PR07MB9676:EE_
x-ms-office365-filtering-correlation-id: 3c86d555-8e0a-48be-2a40-08de79d518b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 B4tKU9NLACCwP4Za6sMFJhoBPVbCqRlf69Tno9aAMIGSATkVjDqtOlDGr76HtOuQ04IZQP2ColHSvNYKPSakEYJScFvVS7ta+kYUqnld3eYnxm21SLopUevpJMt7O/TSAEyHElxeewC9xw45ZrR+INKLxIsKsb3jy/RZQvIZDi/shypcbmS09VVcQBwYsfuF+F6gavluG5C6i6ZBz31eziS1gWNctOZoKJHpQVxWnzih7byhZ5t+M8af8i5rwm6Na0KBvxa2SujzQzoNTNVm7xge8ZVYEMNZU4TZe5Anb/t41aIBse+SGnEfQ+ZCU0vY8UcaEHNeFoY3HO2WnJ7lFCKYxVPEUEvLLVk/lSL19l7MOu+oBRhBWo9mB8eMB2CnPsKy8anboJOCXayNiZE9Txd9ZZOI3wtsZ+wN8lWwHwf1hu7I8L30KtYmR48YcOCtl/7FZfRdneoI0tGdNFy+kPg6S03Awixt1aaZ4aSOYbHfEZ5EB/jsPrVwP8itPLjzaGThzg/ZZivOTpkFNdmVufbpG4KMNOKGIvnwrASUC4jHPYujKnIezEBRf7uVN2bHK31hDMnKR5joqRoNah6bPTJfu15JRLGqlDh8pQHbYtQFJB+neqIcmEY7H/cmAI7USJzexa6Li82eeUltrg3uZSUk56FrcTpAT3r7r7Nes8nNOOi6G9m9JA3g1RiM/Yqxm6uzjRcp5UJ8wK2OfPYjfvuXKabGHpIgiUFTTrwo1Ot4a2TCDrRAFSrGxGEMEm3pocM5G2SEmJkflv0Ux00SGZMguD89vPikxuyK3BJ4KeA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR07MB9538.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UTBnYkI5ajJiQ29hNndiUk03eitiVWpZa0xPaTBiTEZYcy9VbFBoWkVTa3pH?=
 =?utf-8?B?WnRVQ2pIdlFYV3orQTNzZVZqT1N0RzBJS0MzMXA1emh0a0oxR0VFYXcvMjd4?=
 =?utf-8?B?aDhQMXFxeHRiYXNYSmR3WkUrb0FENEsrWGlsV1lXd3lFMGgwNmNlZmNvRnNG?=
 =?utf-8?B?QVprNVdXUm5mOEJJWDJ4OWN5QVF6N0ZWVHZMZjdNaUtwR2xNQjBSZmZJUEhp?=
 =?utf-8?B?dnJwUXdaYmQzNkJxNFB3ZW0zczMrUkNJQjVqSktQRk9PSm01d3RGekY1a21V?=
 =?utf-8?B?S1BnT1BaaEQ1dUhyT2h5OFg5TGc4dzNZK21yQVJlQVRTUExtWnE2eWNBMmE3?=
 =?utf-8?B?QWU0MjYzQU9nZk5CeGYrTnhhQjJZeE0zVExpZTVlQVZkcXk1UHRWZit0K0Nh?=
 =?utf-8?B?bjZqYnU1OXNLTTE1OE1CUzJTblRjWGE2cFdVTUh2U0tMc2J0bTBKaU1EUnAw?=
 =?utf-8?B?R0gzbGZ5SXd0NVh0QWgxanBCNmFWU25qTUl6Yk04dFNTUWZiQjZlVHZNTlhH?=
 =?utf-8?B?M21YTTYzQ2ZuVkhFUmdNdHdMYVJMQVR6ME9mVTZoaXlHQlUzWERROUVRV0pB?=
 =?utf-8?B?WkpUckJGaFVtZTNYUHozVHhEM2dQWEw4c28zZy9ZMHROY3pHbHJzVGxrUDFC?=
 =?utf-8?B?VkVqTVdSUzFHY201TXlUUU4vdUhNcGU3MzFES1prMU02a0dRNlFVb3FSekhu?=
 =?utf-8?B?V3hDMkE5ZjljcDhwY1pxYjFqWjMvWlRTWjdxTkZvVk1ackttK2NHcUh4amIr?=
 =?utf-8?B?eTVsRGZyc3hTRTlBZ1FZRi8rWGVIZkFLYTVSSmV6L1RDemFBMTV5Y3pzVHlz?=
 =?utf-8?B?MUJPN3JXL2x5MlpLa29kNU5XVlJkWU5iRG9FWlE4M2RuemV5N2lKbVRtSTVi?=
 =?utf-8?B?cldZakFvMGZVZ1lNa0MwK3VwNzY3NDU1TldWNXJvaWRoTCt0eUJPRmQ5a0JU?=
 =?utf-8?B?YmdsREFpRm5rQm8wWnBsYzVuWHBGQ29rQTlKcnhBQlFKYytMWkhtbmlpM1JG?=
 =?utf-8?B?MktRNlJlNktXMzhIeTZ5MFd0d0F6WCt4VzhCbzEwT1ZYWTYzQjR0ZEZhV25T?=
 =?utf-8?B?S1J1bkZCd2l5WlpqaDdUM29sbGNTdTNESXZaQmlvTHVYQ3RvbUtZRWFDdzdT?=
 =?utf-8?B?cUlJdzJSWXRGekg1VHhsa012bnFvTTRrY1dFKzZhcW5hYWpQL0E5KzJJQzZK?=
 =?utf-8?B?OWkyOWNqV1dUc2lkdVJIUkI1ZG5JaDBRNkZhWmZ5YjBjMisreVJXdk5jb1A4?=
 =?utf-8?B?RW9LVzBOdHQ1WlBqWFZ6V0NQZnpjUXpZTFN1NXRzWTZwTm1VVGpWQklXbW1v?=
 =?utf-8?B?bFh1eTNzV0VHNjBTU0l0Y2FLRVNYajUwcUJFd290Y1prVlI5NzU2UTJMVDBi?=
 =?utf-8?B?RTE0SWtIRzRza2R4SGxNanA0cEtRRzMvTGdPWTB2c3EydEJuVEhVUElhNEZn?=
 =?utf-8?B?eFNyc2ZxbVdSUUE3dFhTZWQ4S3lSRHlWb2h6dmNZejc0MnBKcG0yRldyeDMw?=
 =?utf-8?B?eDBtZmFJL3BmSzJBNk5oMjFEQm1GTDdJRHhidk41Q1ZySWZHM1NDZXV0ZGVI?=
 =?utf-8?B?L2F4dXg2UnZ5bjNxUTBhVFQreHFYeURzcmdXZGdUNjJScFcrTDhMVFV3M3NJ?=
 =?utf-8?B?VnBQTUdyVDVtMmhCaHRQc2RZZXJtRlpaOTl6RkFTUElNekV6WkdLVkRKM3hE?=
 =?utf-8?B?WlVOSWt3THVNd2gzU0hnRkV6ZnNpRStVOXNmNHdwNWJBKzIzWndWVEhicGRZ?=
 =?utf-8?B?TDNnTVhzN1pPbU5rS1lCaWFXa3hrbCtwSTBNaHllTnYxT3Q0ME4vSHUyUE9q?=
 =?utf-8?B?MUxhdnpwNmltWVkyVmtkb3JHVjFoT3ZmaXdRLzhDUjhlSzVPL2lnU3hqVHZl?=
 =?utf-8?B?Q2dFSEhuR0wyQm1wZ1dxWUFOOGhVY1grYlBmZ2Fsa2dRTHRTb21rTmlGeGZP?=
 =?utf-8?B?azN3T09ScDUwSHRSUVk5QUZOT01rdHBOK1hkNGRPZE9BVXdER2hyTlZ0WjVB?=
 =?utf-8?B?TlBjTlc0cUVHYTBPL2VPa1FsOFJ1ZUFjYmZTU1dLWjdzaG9FbWtqb1Z1WkM0?=
 =?utf-8?B?VlRnR2tUY3U4emgwcFZjekpzRXo3OFAyekwvWXY1Y2JWbFZNenRuY0VxUzdN?=
 =?utf-8?B?K0lxWGxsMjlCRHlNeWpoUWw4RW9GMWRzWkRTTU1SN3dZVFhBclh4K1FqNHdU?=
 =?utf-8?B?VUd4MVU0eVdrc1NQdXAyM0VmWDl4RHBCRGZBRWdMZm5IdnMvaC9oTkdyZVlx?=
 =?utf-8?B?MGRzWEgwdGZDa2R2YmJhVm9UNSsyV0ovdU9FZkZxYktkMzdXTWl5dTNhSmtP?=
 =?utf-8?B?RWpCelhuOEFWem51algzenVZNExWR1plcWFrSHBveTJWczRCdk8vQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR07MB9538.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c86d555-8e0a-48be-2a40-08de79d518b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 10:02:08.1447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UfDKPJxp3j2jVqMjO0oPnTfa5kT1ryov8LqLEBk92NkgCSPzxWgM7DDwFQ5JWNCS12QlH8DktP+r+bO8DutoHOtP58IonvKVA/ATXwOKfw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR07MB9676
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA3NiBTYWx0ZWRfX/Y3qqitQ9SDA
 9RjGrqSECS+/iy6jvdVe9Frg+tDOwIb0fr06OWYkPYH04Mw/6yddCytxuK/LPhGRjbXXp7QuP3g
 ntLrKrvt9pKmNFxwrrbwbnVZn7xcuq+wMN2nD3aHktotMeVA/th6Rex+w4Eh6g4W4mBO/XF8DKU
 j9gpKLUanp6wXnsCdzC82JywJUTH+EIQpRBTcsFtJsHCmzU3HndDyfVRrtfOK9aDX3ov7l/Fbm5
 kTpjGE8lAqSQWDaY4DIhcyh1/eiJWW+yYphkolT8to39XmdGy1SypsRGN3usv9pH+q9rark7kaL
 XEcRcb06FyrjAcMYTCIZxwD8uo0xvPgPvZy6CQzjHD6FRjdsw2sU9go+F+0NI7BjjhqGgt/uZPi
 VJYKRdzI+nv8e6TCLv7oEF98UdIH5Z5ag2jzqmiDd3Vxg+ASbbLPLGQYCJQdojJiE5l0LVGjhcI
 vCZdxvOBtKl756s6A/w==
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=69a80323 cx=c_pps
 a=PeFxPTU/9IdxQzUa63kYNg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=Zpq2whiEiuAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=W8fx6O4W8wtO2w6lYej3:22 a=tuMieXAyK57eGGFK7xkD:22 a=Br2UW1UjAAAA:8
 a=qIqyTwgw9_R7z1ascTMA:9 a=QEXdDO2ut3YA:10 a=WmXOPjafLNExVIMTj843:22
X-Proofpoint-ORIG-GUID: WJr1HzJkQ33bpbx0GHwVPAeaJsdo1_6f
X-Proofpoint-GUID: WJr1HzJkQ33bpbx0GHwVPAeaJsdo1_6f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 clxscore=1011 suspectscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2603040076
X-Rspamd-Queue-Id: 186D81FE0A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cadence.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[cadence.com:s=proofpoint,cadence.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33967-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cadence.com:dkim,cadence.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pawell@cadence.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cadence.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Pg0KPk9uIDI2LTAzLTAyIDEwOjI3OjExLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPj4g
Pj4+ICBtYWludGFpbmVyczoNCj4+ID4+PiAgICAtIFBhd2VsIExhc3pjemFrIDxwYXdlbGxAY2Fk
ZW5jZS5jb20+DQo+PiA+Pj4NCj4+ID4+PiArZGVzY3JpcHRpb246DQo+PiA+Pj4gKyAgQ2FkZW5j
ZSBVU0IgZHVhbC1yb2xlIGNvbnRyb2xsZXJzLiBVU0JTUyAoY2Rucyx1c2IzKSBzdXBwb3J0cw0K
Pj4gPj4+ICt1cCB0bw0KPj4gPj4+ICsgIFN1cGVyU3BlZWQgKFVTQiAzLjApLiBVU0JTU1AgKGNk
bnMsdXNic3NwKSBpcyB0aGUgbmV4dA0KPj4gPj4+ICtnZW5lcmF0aW9uIHdpdGgNCj4+ID4+PiAr
ICBTdXBlclNwZWVkIFBsdXMgKFVTQiAzLjEgZ2VuMngxKSBhbmQgWEhDSS1iYXNlZCBkZXZpY2UN
Cj4+ID4+PiArY29udHJvbGxlci4gQm90aA0KPj4gPj4+ICsgIHNoYXJlIHRoZSBzYW1lIHJlZ2lz
dGVyIGxheW91dCBhbmQgcmVzb3VyY2UgbW9kZWwuDQo+PiA+Pg0KPj4gPj4gU28gYXJlIGNvbXBh
dGlibGUgb3Igbm90Pw0KPj4gPj4NCj4+ID4NCj4+ID4gU29ycnkgZm9yIHRoZSBtaXNsZWFkaW5n
IGRlc2NyaXB0aW9uLiBUaGV5IGFyZSBOT1QgZnVsbHkgY29tcGF0aWJsZS4NCj4+ID4gVGhlIHJl
Z2lzdGVyIGxheW91dCAoT1RHL1hIQ0kvRGV2aWNlKSBhbmQgaW50ZXJydXB0cw0KPj4gPiAoT1RH
L1hIQ0kvRGV2aWNlL1dha2V1cCkgYXJlIHRoZSBzYW1lLCBidXQgcmVnaXN0ZXIgY29udGVudHMg
YXJlDQo+Pg0KPj4gTGF5b3V0IGNhbm5vdCBiZSB0aGUgc2FtZSBpZiBjb250ZW50cyBpcyBkaWZm
ZXJlbnQuIFNhbWUgbGF5b3V0IG1lYW5zDQo+PiBzYW1lIHJlZ2lzdGVyIGlzIGF0IHRoZSBzYW1l
IHBsYWNlLiBJZiB5b3UgaGF2ZSBkaWZmZXJlbnQgcmVnaXN0ZXINCj4+IHdpdGggZGlmZmVyZW50
IGNvbnRlbnRzIGF0IGdpdmVuIHBsYWNlLCBob3cgaXMgaXQgInNhbWUgbGF5b3V0Ij8NCj4NCj5T
b3JyeS4gSSBtZWFuIHRoZSBVU0JTUyBhbmQgVVNCU1NQIHNoYXJlIHRoZSBzYW1lIHJlc291cmNl
IG1vZGVsICh0aHJlZQ0KPm1lbW9yeSByZWdpb25zIGZvciBPVEcsIFhIQ0kgYW5kIERldmljZSwg
cGx1cyB0aHJlZSB0byBmb3VyIGludGVycnVwdHMpLiBCdXQgaW4NCj5lYWNoIHJlZ2lvbiwgZWcg
aW4gT1RHIHJlZ2lvbiwgdGhlIGxheW91dCBmb3IgZWFjaCByZWdpc3RlciBhcmUgZGlmZmVyZW50
IGZvciBib3RoDQo+Y29udHJvbGxlcnMuDQo+DQo+UGF3ZWwsIEkgdGhpbmsgd2UgY291bGQgdHJ5
IEtyenlzenRvZidzIHN1Z2dlc3Rpb24gYW5kIGRpZmZlcmVudGlhdGluZyBVU0JTUyBJUCBhbmQN
Cj5VU0JTU1AgSVAgYXQgcnVudGltZSwgd2UgY291bGQgdXNlIERJRCByZWdpc3RlciAoY2Rucy0+
dmVyc2lvbikgdG8gZG8gdGhhdCBhbmQNCj5hdm9pZCBhZGRpbmcgbmV3IElQIGdlbmVyYWwgYmlu
ZGluZyBkb2MuIFdoYXQgZG8geW91IHRoaW5rIHNvPw0KPg0KPlBldGVyDQo+DQo+Pg0KPj4gPiBk
aWZmZXJlbnQsIGVzcCwgdGhlIGRldmljZSAoZ2FkZ2V0KSBjb250cm9sbGVycyBhcmUgYXJjaGl0
ZWN0dXJhbGx5IGRpZmZlcmVudDoNCj4+ID4NCj4+ID4gLSBVU0JTUyB1c2VzIGEgY3VzdG9tIGdh
ZGdldCBjb250cm9sbGVyIChjZG5zM19nYWRnZXRfaW5pdCkNCj4+ID4gLSBVU0JTU1AgdXNlcyBh
biBYSENJLWJhc2VkIGdhZGdldCBjb250cm9sbGVyIChjZG5zcF9nYWRnZXRfaW5pdCkNCj4+DQo+
PiBZb3UganVzdCBkZXNjcmliZWQgZHJpdmVycywgc28gdGhpcyBkb2VzIG5vdCBjb252aW5jZSBt
ZSBhdCBhbGwuDQo+Pg0KPj4gPg0KPj4gPiBJIHdpbGwgZml4IHRoZSBkZXNjcmlwdGlvbiBpbiB2
MiB0byBjbGVhcmx5IHN0YXRlIHRoaXMgZGlmZmVyZW5jZS4NCj4+ID4NCj4+ID4+PiArDQo+PiA+
Pj4gIHByb3BlcnRpZXM6DQo+PiA+Pj4gICAgY29tcGF0aWJsZToNCj4+ID4+PiAtICAgIGNvbnN0
OiBjZG5zLHVzYjMNCj4+ID4+PiArICAgIGVudW06DQo+PiA+Pj4gKyAgICAgIC0gY2Rucyx1c2Iz
DQo+PiA+Pj4gKyAgICAgIC0gY2Rucyx1c2Jzc3ANCj4+ID4+DQo+PiA+PiBXaHkgZG8gd2UgbmVl
ZCBhbm90aGVyIGdlbmVyaWMgY29tcGF0aWJsZT8NCj4+ID4+DQo+PiA+PiBBbmQgd2h5IGRvIHlv
dSBhZGQgaXQgbm93IHRvIGVhY2ggb2YgZGV2aWNlIHNjaGVtYXMgdXNpbmcgdGhpcyBvbmU/DQo+
Pg0KPj4gWW91IGRpZCBub3QgcmVzcG9uZCB0byB0aGlzIG9uZS4gTG9vayBob3cgdGhpcyBzY2hl
bWEgaXMgdXNlZC4NCj4+DQo+PiA+DQo+PiA+IExpa2UgZXhwbGFpbiBhYm92ZSwgdGhlIFVTQlNT
UCBoYXMgYSBkaWZmZXJlbnQgZGV2aWNlL2dhZGdldA0KPj4gPiBjb250cm9sbGVyIGFyY2hpdGVj
dHVyZSBmcm9tIFVTQlNTLiBUaGUgcGxhdGZvcm0gZHJpdmVyIHVzZXMgdGhlDQo+PiA+IGNvbXBh
dGlibGUgc3RyaW5nIHRvIHNlbGVjdCB0aGUgY29ycmVjdCBnYWRnZXQgaW5pdCBmdW5jdGlvbjoN
Cj4+DQo+PiBBZ2FpbiwgZHJpdmVyIHN0dWZmLg0KPj4NCj4+ID4NCj4+ID4gICBpZiAoZGV2aWNl
X2dldF9tYXRjaF9kYXRhKGRldikgPT0gJmNkbnNwX3BsYXQpDQo+PiA+ICAgICAgIGNkbnMtPmdh
ZGdldF9pbml0ID0gY2Ruc3BfZ2FkZ2V0X2luaXQ7DQo+PiA+ICAgZWxzZQ0KPj4gPiAgICAgICBj
ZG5zLT5nYWRnZXRfaW5pdCA9IGNkbnMzX2dhZGdldF9pbml0Ow0KPj4gPg0KPj4gPiBXaXRob3V0
IGEgZGlzdGluY3QgY29tcGF0aWJsZSwgdGhlIGRyaXZlciBjYW5ub3Qga25vdyB3aGljaCBnYWRn
ZXQNCj4+ID4gY29udHJvbGxlciBpcyBwcmVzZW50LiBUaGlzIGlzIGEgQ2FkZW5jZSBJUC1sZXZl
bCBkaXN0aW5jdGlvbiAobm90DQo+PiA+IFNvQy1zcGVjaWZpYyksIHNvIGEgZ2VuZXJpYyBjb21w
YXRpYmxlIHNlZW1zIGFwcHJvcHJpYXRlIGhlcmUuIEJ1dA0KPj4gPiBwbGVhc2UgbGV0IG1lIGtu
b3cgaWYgeW91J2QgcHJlZmVyIGEgZGlmZmVyZW50IGFwcHJvYWNoLg0KPj4NCj4+IEdlbmVyaWMg
Y29tcGF0aWJsZXMgYXJlIGFsbW9zdCBuZXZlciBhcHByb3ByaWF0ZSBhbmQgZHJpdmVyIGNvZGUN
Cj4+IHJhcmVseSBjb252aW5jZXMuDQo+Pg0KPj4gQmVzdCByZWdhcmRzLA0KPj4gS3J6eXN6dG9m
DQoNClRoZSBEZXZpY2UgKFBlcmlwaGVyYWwpIGNvbnRyb2xsZXIgaW4gVVNCU1NQIGlzIG5vdCBq
dXN0IGFuIGV2b2x1dGlvbg0Kb2YgVVNCU1M7IGl0IGlzIGEgY29tcGxldGVseSBkaWZmZXJlbnQg
SVAgY29yZSB3aXRoIGEgZGlzdGluY3QgcmVnaXN0ZXINCm1hcC4NCldoaWxlIHRoZSBIb3N0IChY
SENJKSBhbmQgT1RHL0RSRCBwb3J0aW9ucyBvdmVybGFwIHNpZ25pZmljYW50bHksIHRoZQ0KRGV2
aWNlIHJlZ2lzdGVyIHNwYWNlIGluIFVTQlNTUCBpcyBhcmNoaXRlY3R1cmFsbHkgaW5jb21wYXRp
YmxlIHdpdGggVVNCU1MuIA0KVGhleSBhcmUgZGlmZmVyZW50IElQIGNvcmVzIGludGVncmF0ZWQg
aW50byB0aGUgc2FtZSBzdWJzeXN0ZW06DQoNClRoZSByZWdpc3RlciBtYXAgZm9yIHRoZSBEZXZp
Y2UgY29udHJvbGxlciBpbiBVU0JTU1AgaXMgZW50aXJlbHkNCmRpZmZlcmVudC4gT2Zmc2V0cyB0
aGF0IGFyZSB2YWxpZCBmb3Igb25lIGNvbnRyb2xsZXIgcG9pbnQgdG8gZGlmZmVyZW50DQpmdW5j
dGlvbnMgb3IgcmVzZXJ2ZWQgc3BhY2UgaW4gdGhlIG90aGVyLiBVc2luZyBhIHNpbmdsZSBjb21w
YXRpYmxlIHN0cmluZw0Kd291bGQgaW1wbHkgcmVnaXN0ZXItbGV2ZWwgY29tcGF0aWJpbGl0eSB0
aGF0IGRvZXMgbm90IGV4aXN0Lg0KVVNCU1MgdXNlcyBhIGN1c3RvbSBETUEtYmFzZWQgcGVyaXBo
ZXJhbCBjb250cm9sbGVyLCB3aGVyZWFzIFVTQlNTUCB1c2VzDQphbiBlbnRpcmVseSBkaWZmZXJl
bnQgWEhDSS1iYXNlZCBhcmNoaXRlY3R1cmUgZm9yIHRoZSBkZXZpY2Ugc2lkZS4NCg0KVGhlc2Ug
dHdvIGNvbnRyb2xsZXJzIGRvIG5vdCBwcm92aWRlIGEgcmVsaWFibGUgd2F5IChlLmcuLCB2aWEg
cmVnaXN0ZXJzKQ0KdG8gZGlzdGluZ3Vpc2ggYmV0d2VlbiB0aGVtIGluIGV2ZXJ5IGNhc2UuDQpX
ZSBzaG91bGQgdHJlYXQgdGhlbSBhcyB0d28gc2VwYXJhdGUgY29udHJvbGxlcnMgdGhhdCBoYXBw
ZW4gdG8gc2hhcmUNCnNvbWUgY29tbW9uIGNvZGUsIHJhdGhlciB0aGFuIHZpZXdpbmcgVVNCU1NQ
IHNpbXBseSBhcyBhIG5ld2VyDQp2ZXJzaW9uIG9mIFVTQlNTLg0KDQpJIGJlbGlldmUgUGV0ZXIn
cyBpbnRlbnRpb24gd2FzIHRvIHVzZSBhIGNvbW1vbiBEVCBiaW5kaW5nIGFuZCBhIHNpbmdsZQ0K
cGxhdGZvcm0gZHJpdmVyLCBhcyB0aGUgcmVzb3VyY2UgbW9kZWwgYW5kIHBhcnRzIG9mIHRoZSBj
b2RlIGFyZSBuZWFybHkNCmlkZW50aWNhbC4NCkhvd2V2ZXIsIGdpdmVuIHRoZSBhcmNoaXRlY3R1
cmFsIGRpZmZlcmVuY2VzIG9uIHRoZSBkZXZpY2Ugc2lkZSwNCkkgYmVsaWV2ZSBoYXZpbmcgZGlz
dGluY3QgY29tcGF0aWJsZSBzdHJpbmdzIGlzIHRoZSBtb3N0IGFjY3VyYXRlIHdheSB0bw0KZGVz
Y3JpYmUgdGhlIGhhcmR3YXJlLiBJdCBwcmV2ZW50cyB0aGUgZHJpdmVyIGZyb20gbWFraW5nICJi
bGluZCIgYWNjZXNzZXMNCnRvIHJlZ2lzdGVycyB0aGF0IGhhdmUgZGlmZmVyZW50IG1lYW5pbmdz
IGRlcGVuZGluZyBvbiB0aGUgdW5kZXJseWluZyBJUC4NCg0KTWF5YmUgdG8gcmVzb2x2ZSB0aGlz
LCB3ZSBzaG91bGQgaGF2ZSBzZXBhcmF0ZSBEVCBiaW5kaW5nIGRvY3VtZW50YXRpb24NCmFuZCBw
b3RlbnRpYWxseSBzZXBhcmF0ZSBwbGF0Zm9ybSBkcml2ZXJzIHRvIHJlZmxlY3QgdGhpcyBhcmNo
aXRlY3R1cmFsDQpzcGxpdD8NCg0KS3J6eXN6dG9mLCB3aGF0IGRvIHlvdSB0aGluayBhYm91dCB0
aGlzIGFwcHJvYWNoPw0KDQo+DQo+LS0NCj4NCj5CZXN0IHJlZ2FyZHMsDQo+UGV0ZXINCg==

