Return-Path: <linux-usb+bounces-33126-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2D+7J4zxhGnR6wMAu9opvQ
	(envelope-from <linux-usb+bounces-33126-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 20:37:48 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDF0F6E4B
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 20:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA1F9302E7DA
	for <lists+linux-usb@lfdr.de>; Thu,  5 Feb 2026 19:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A13A329C7D;
	Thu,  5 Feb 2026 19:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="UyZocNZ6"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023098.outbound.protection.outlook.com [40.107.159.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7A12264AB;
	Thu,  5 Feb 2026 19:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770320254; cv=fail; b=pqzNaiGIkxFG0BWQQ21DE8eY5euhtNCbCgHC0cX1/ooyNmsuETVaSBniCwwjY0F92joA2893j9V/Z9a+jW6Vrqt4FhXZMcvsfe9AFciuuRPWMba6tr7qkyXou6YrT26c8DhAGIAz7mKyUe8Ug9lz8aALKlHMSdkOAk86tN9o25g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770320254; c=relaxed/simple;
	bh=B6h351SAypSKOzyOxiL3kdredFnqgo0qagO3SI/H/F8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ah2e+ZVCCyKNC8xwLaIKxlVx1O5ThctSxlY++8tacHH6aHbJID+oZoAaSfzO8Wd16nVgTNjdvjt7g09EKG9xEWYtTzhDCZq8u79UZzzlGl9kmGm+XA7O4yzj5MyrDPNHbc5N+W9KTbcgW8IT50obQc8cplKQGjqXMor6bjCWFV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=UyZocNZ6; arc=fail smtp.client-ip=40.107.159.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VsSOz6BjqIIW2GY+5e9hKgmStWTh0/Dy7sGhMpIE4VYm4pD7Oys1KvheKADgjqysNLiSQWbgVisMobDOmosjicLt5Y/RQ2t7icBJa9BEROJ+CQ2Kd6kbYev0jQW3XNxkyXSca9n9pyjV7nk8BQjh3MVUJboDL/U7wZ6FypzxSUHog8x+uxVSYWCGZ99MGEMyzcezqVPskr4tLB1L4PvTLFbPfOWT7mzpGAhXQsoqZUMmhzE51/3N9ffXgX5kX3cYCslog/p9a+MEwASUKp5eSRPYKb/f1O1jBNbiAcoPKEnr4PgmIiWHyxl3+Nvl5PXQYpgecOAOCloUwBU/dbE3UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6h351SAypSKOzyOxiL3kdredFnqgo0qagO3SI/H/F8=;
 b=W6wrtChxEB0GJlNdRPkw39IehiHlHDqb4XCXdO7KVtPo0y7Ovr7uIMPicR/EP0gpm+wsi04SIQZfDWGqsNPw1LtANM851qXEjQuZJn0Rya3mvxO8qk0ZCYOsc443aYXyq6xBpzakmDUmKwFHAZAPWxdidAIlD1N9VmOJPKSWavF1ml8IhaqKUjlYuikCKb2GPN5O+a1U1UyKrR5I8dmc2n74WJnSFk5E7xvVnMnCV0BRI0pr+o/Jxfyk1ckDsy3g+InBHS6G6N0q6nksaI+ZjAfxcC78InuR7Z5jDMCkorprsOk09P5Cw+/njSk4TKfW3tsaCgsH92MQBJRKh9uLnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6h351SAypSKOzyOxiL3kdredFnqgo0qagO3SI/H/F8=;
 b=UyZocNZ6uUUU4rZQPQ/LqavJZ48BZiHRPD703hfZ8ModocF7SwAgQQMfhO4f+rAGUsz2zksHbGp7KNN4rFAJ7CT9H5LelCS2K1J3HiKR6Fx9PtmFI1y9dj12zbiacrZxRI7hn2gkxXqMLv+X0HwMn9Rl8gPk/qGdAgx6iLMVI9B0fgL14RiWXgoq40YZ5nta/kbNjpccfmuetF6BwZHfHzJAVhArCWfzVz/7S226kDio1sMY76vyuh1EY1QllsC29BAvsjmOI4Y8pw04/MXTkm+5RmbiKlCqCOA+WJcyriltxzBHTes/TiMt4z6xXfLCbGJKrWdcWJ76e139A8PFQw==
Received: from DU0P195MB2325.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:425::22)
 by AMBP195MB2780.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:6ab::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 19:37:30 +0000
Received: from DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
 ([fe80::a5a9:5513:e1a:f50f]) by DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
 ([fe80::a5a9:5513:e1a:f50f%6]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 19:37:29 +0000
From: Jan Remmet <J.Remmet@phytec.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [PATCH v2] usb: typec: hd3ss3220: Check if regulator needs to be
 switched
Thread-Topic: [PATCH v2] usb: typec: hd3ss3220: Check if regulator needs to be
 switched
Thread-Index: AQHclrsMlX+wCY1kvEGX2wij2IjsnbV0gESA
Date: Thu, 5 Feb 2026 19:37:29 +0000
Message-ID: <0424ffd8-4872-4c2f-8315-2d9064a0a477@phytec.de>
References:
 <20260127-wip-jremmet-hd3ss3220_vbus_split-v2-1-f615d4e88634@phytec.de>
 <2026020520-confider-selector-0b67@gregkh>
In-Reply-To: <2026020520-confider-selector-0b67@gregkh>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P195MB2325:EE_|AMBP195MB2780:EE_
x-ms-office365-filtering-correlation-id: beac2be5-dd37-42cd-302e-08de64edfff5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?LzVLY0FIVS9zNFR1b1BoVlUrR3JObDNYU2JGNVFuaEQ3MEhHa3VTd2FSL0xq?=
 =?utf-8?B?UW5QU24xajl4NVUyOU9yaUZnczNtbmcvTVVsRy90QndVdUxBdy9zYnNqN3I2?=
 =?utf-8?B?WnhwUENTMjdKVEc1NVdoNnBORzh4dVMxaTFDa29zRkIyNmY5RHF1cTlWL0w0?=
 =?utf-8?B?NkRRZkYxWjZSamxuc2FIakVaQjdSRzNRNUZ0V0xqbTRCejFuSTJFeVhrV25a?=
 =?utf-8?B?Y1JEMThkbzhYVGZPdEVpVE5CZDNCNWhtRGJkdUFIVEhsc1JWbzlDNXN1Mkoy?=
 =?utf-8?B?cWVvVnBReUZvSUtKbUo3NnZCeVVKWnVQL2hFMXlYbExQeXdENUJmWFJwWjRK?=
 =?utf-8?B?MkRRUzJKQ1kyaFYzWllXdHlTYVFCL3VRREhlRVZOeEV5dDgva3FnRDIrYTU0?=
 =?utf-8?B?cFJtazhYU3psbWtEWHl0UmRYcUZQcG1GUGdLdVdHcXhuOWJWUkxodTEzWnZw?=
 =?utf-8?B?d3R5Nnpwc0hOU25PdGo2bTkwNHc3cFE4ZU5uVW03QlNTLzVwWDBJMVh0NDRN?=
 =?utf-8?B?aXZNbjZjNzB0SG9IeVB5SmlzaE04RUFheVZRbEFFR0FQSFNzOXczbzVGWmF6?=
 =?utf-8?B?c0NEaC9LKzlzWm5mUnBwSW8zLzVkbmNhL1Rpd3dVOTM3ZlNYSUVpVjZOU0la?=
 =?utf-8?B?bjdnTnB5NEIvWUFnTGswUVM1UVpja3JwcmFmbEJVTjFha1NCVktNUkF4TUJI?=
 =?utf-8?B?R0gzQVVodmRHb0JwWktoSHN0cDZwYVVMeVpEZmpFRDBZbTl1d3NGUEFOaElN?=
 =?utf-8?B?U0ZrcDQ4T0tBZ3R5SmJVb2xYRkFtSXljQlpva0JWTkM4TmUyRkVXMkdSOVhF?=
 =?utf-8?B?Sld6elVnbHBza3loeFBEa0hoQldIank0SmNOanVxaWdIOE1tcmRYcllWb0V1?=
 =?utf-8?B?TlIxVE5HSTNKSnB1WndhZTVFV0V3TGhhdGttUXNMdDVZS0V1Ris3dUJvWkxQ?=
 =?utf-8?B?c3ZqT2pNNVBrdTBxckhFbkUybHNaQUpSTzB4bDFISHBLSEhVRDVYUW9QM3Nj?=
 =?utf-8?B?bHdCeWlWMXJJUGtyMTU4UXllaXFiRXlEWmhRVEQ0dXlJTzRSRTdKaVhiOWFl?=
 =?utf-8?B?T0NGREd2MTAzL0tXOG4xblFoeUlhVGpKd2Jra2JOb243ck42ajFsTldwNkV5?=
 =?utf-8?B?VkJFd3JncVMyYjZSZjJpU1hCY2N1SmVGM01qU0hNMW1aeEpMQUtQTE02cElW?=
 =?utf-8?B?UnVaRG0razh4d3pTNERRRTRaaXFFT3NhRTVrVTUrWDNZd0pVREt3Unk5ZmJI?=
 =?utf-8?B?YlhYa0RLUHFYbndDdU12MDRzOUdQNDVIaDh1R2p6YmVsam5oNitZUVdxc0xE?=
 =?utf-8?B?RTVYeUVQVVNHRUdNMW5CRGN6YitERlgyZ29KcUJ2TkNwbmllVWpxTHgxVlBO?=
 =?utf-8?B?QTZzdlJTd1hXeStJaEV4Q252MGpxdE5FeUVsdGFZeDl2TUl3cjlpYlF5Wk80?=
 =?utf-8?B?WmVwMUJCOTRpa0Z5czRBTDNzS0JYL2cvQW9PRS96YTcyTHZzY2RZVzc0YStt?=
 =?utf-8?B?TEFKVnVzbksrVmpQOGJ3THU1RnBBRjVIczNmcDd6RnJtcEtndVpTQi9EbERl?=
 =?utf-8?B?QWdDeW9xeDZoQmV0NlRSdDEwaVVWeE91TnNKTkZpcUU4elp0SHBST1hLSUlD?=
 =?utf-8?B?Y2wrUGtyaG44dXFqeXlPSk1TczFCYkZOb3JlQm82NGJlYjE0NmJnVWFHczhM?=
 =?utf-8?B?NElOaHpqeFhlaUVBL1c2QWw5UEh6YmZodFl5aGQ3bUJUUStuWklrblR0SlpQ?=
 =?utf-8?B?SHRxMFZYSjJkdjNMK1JKenpUb1BTT1VidUUrTXFYY3ViOWpVWVRSVUhIeU0x?=
 =?utf-8?B?Y3VaYVRZWEd1dHMwRnFQTlJRVDJVREk5RytEQ1VjeTBlQjkwTzBXVFJ0aWNh?=
 =?utf-8?B?cjR3dFpZYkQxeStGMU5tbStWZ0p4YXZoSmdUN0QxZi84ZFFqdTdrVGh4VXgx?=
 =?utf-8?B?ZjhDaEV1UTFKWnR0SHdPSjBYMXdUcUVDRkhtZU5VZjhJNlFyR1NjNXF6VTND?=
 =?utf-8?B?dHptdmpweXBQVXFoZ0NnWk9LWTBTQ1UxSVdhQ3pFcTZrNUxDRkEzbkRjUlpF?=
 =?utf-8?B?Z0FJSlpQQ2FYZi9ZRzJMSXA3bHVQcDJlck5mVTdNSUxsTTlKb0hxNHNZckht?=
 =?utf-8?B?RTU3T01mUDdpd3VkNGtWT3UrSHU2dS9OeTVBM2JqcFkzdHZqZ0FIMjF6Sm5U?=
 =?utf-8?Q?7UvOiIg+0uLe4RMw3Vom/8I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P195MB2325.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YU1CRWN6TGREWnRwN2JZV0VvZ3hWclJjdXlaQi9NSHMwaVJVTzRGNG1HREhU?=
 =?utf-8?B?RzFzVUFrQmNrdm9LV3MrNHN3Q1A3Vk8xYW43azM2U0V5L3FEZmhBdjZERXpn?=
 =?utf-8?B?Ryt5b3BxWGpFTlNMdnZiVmY2QURJVjdmZlZPM0dDbUk2ajNIMWZUZUo1cVox?=
 =?utf-8?B?WnlVQTgxZFpyeFE3OWJuc2NqVlBSa2kzZWlGTk5xRWxIMFpzaVVjWkxScXkz?=
 =?utf-8?B?eGJIL1BBQmdjVEZxZ1JWYUxXSkNqbXNORXZrOGx1NjBEdHg5WE1ZWTlHWTVt?=
 =?utf-8?B?UVVNYWRFMkJHcmx2SEt6SHhKRkZjOWVYMjBVY1FwcTBuMVl6dTU2M0lFdkJO?=
 =?utf-8?B?VVlCRmd1c1l0RlRXQk1zakxDWUFEZVZwQzJqTDJhQ2dlVWZ2SjFIQ0d4SERx?=
 =?utf-8?B?NmV2UVN4R0phazhZUDc1U2hmSFJzKzF6Q2t0RXBodjNYM0NTSS9OUFNhZldR?=
 =?utf-8?B?aFBBRHVJZE9IcWJBa2I3VzJ0WXk3S0lTbmFPSXErbEoreHRXUi9vZkozZkdT?=
 =?utf-8?B?NXUwZmQ5bXJNQWpCV1F6UGdIZ3Y0b2hIb3RxWnYvblRSY2dEelVsZFBLdnVt?=
 =?utf-8?B?SVcrNks0K2hZWVdiZ2w5dDRjVVpoeFBROVUrN2p1aUR3SDdaZXpJV1A2cmxV?=
 =?utf-8?B?b0ttM3V0b1prcU0yNkZsa21jWjhFbmhTZVdVNWdTZm1iMmtuNWZ0M1Jtbm5C?=
 =?utf-8?B?L0U0d1BKdEJ4WXNwczNPV0svZi9PS3NqOWV1UGxjWXR4dW5kYkpXWmVudlI5?=
 =?utf-8?B?SHJ5QWxZUEZyYUtNYjNJV0E4eCtENXdlYnRVMWtRWjV1K2UxSG11djZwamNr?=
 =?utf-8?B?UzF4UjYwcDQxcWs5dVdTSTRhY0JEcWJyeW54UThZSHVPREZWck5vQlB1dWwr?=
 =?utf-8?B?Ni9VK3N1S3hweVNBV1lReUsreEJ0OFNaSkpyK3dZa3dDOGpLd0FGeTNyR1h5?=
 =?utf-8?B?UUVSNzhScnVWWm4zZkZ5VGtCQ0xrMW14SE1JSVZ4Y2ppM3J6ekxGaUgxeU5l?=
 =?utf-8?B?UHRrbVlGcGdrdkw1MHJPUGdLTGpaOE00MUQxSmZOK2FvSjcwWHZ0NHZsYTdQ?=
 =?utf-8?B?R3U4SCtacVgrZC9UTHVWa292bGd1YU93STVYcElPTk1kK0lpR2V0OVNjcTFi?=
 =?utf-8?B?M1ZpNUlnbFRYcGZDMkI0UUxhTkhOdjJvSzR0NytVVmFQRkhmbUE5NlBsTmo1?=
 =?utf-8?B?djY1a3NWZHk3Q3orM1hZSkJlUGlDTW0yNG9FUExwVjFkZ0JCKys5enVpMGRV?=
 =?utf-8?B?SmovMCtYblVDOEFOMXNDWWhZVVkwekNUZkJVS0NITUwwMU0wWXcrMmxEY0Y1?=
 =?utf-8?B?K2l6QSthL1R6KzFsczhHMlF5b1ExNVhyQmtKWE9kT3h4UWoxUkhiNFhNeWRY?=
 =?utf-8?B?QXZac0hEbEEzNmM1bDVudkdaY0JLYlNESy9TbVdta1l1N1IrZVJlQlMrb3dl?=
 =?utf-8?B?ZUh2bi9acS9Kc1Z4ZEFrRFlrcWtzNUh2cVdLeDF0enV1SWdLZ2NiV29Pc1k1?=
 =?utf-8?B?YXZobW4zTmZGNThDUjFjWXdWQ3piT2ZoYzhxK3FDdjA5dEhDYjVMcTkxeVBn?=
 =?utf-8?B?aGdqYjB1SlhFUWpVanlsckpWU1hITTRmVDJDSDNWV01odUk5ZDk2VmVqSklT?=
 =?utf-8?B?eS9PRER2djdaTFpsdVVLMmptRnFZb1J0eTlkMVNvajNyejIvTElGVkdwRGYv?=
 =?utf-8?B?RkZvdW91dExIa1R4TE5XNm0rTlRKdSt0d3VQUVBhM2wrWlEwblJpenFERWRU?=
 =?utf-8?B?ZmkvT2NqanZ3V1J5d0dDTG9JM2tTMFcvSm5DQkpHbTJXOXBVU1dKdTdJTzZn?=
 =?utf-8?B?VWI2WkRFQ3R4akJmZkJBMDdCRGpUS3BXKzNVU082Sm03OXVjK2RYeFVXV29t?=
 =?utf-8?B?ODJTeDhQRUNNdWpDeEpJQ01OazJENGl5R21QNUlvbUxNMjFTWVRzRm0xVGJj?=
 =?utf-8?B?TnY2UWw1Wm80MDA3NGo0bTNhYmNIVDhJSk1IY3FUbnB4ZnFMKzYwZEtOVWRQ?=
 =?utf-8?B?dmZtbS9qY0Myd2lnVnVOSFovaXZpQUkwcTU1dW1kemZQMllFZndNbWVPTjUz?=
 =?utf-8?B?S2xmM3RER1Q0RVFyV3VjcG9SWDltZ3l5UnB6a3BpMlNBM2szd3BQdTRqaVBV?=
 =?utf-8?B?Q0h6MjJuRWU1Q3RjYVc0RU5PUUtmSTR5d2FEMVpoY1c5QTY5YmYzR3dOeWNR?=
 =?utf-8?B?bkI2YzRpRXdxZ2UycWdRU0JPYlphemJMVzVlVkszVWZkNk1oM0ttRnV0b1hY?=
 =?utf-8?B?V1M3L0NuZU80YXMzODVnMnJlTGNGSzEweFJhSGVIdmJnSm1HVE10c1dqNTFs?=
 =?utf-8?B?d2x4dXoyUm1zNFArRDRudHpaNXJvR1NaVURjZC9SbDFqcC9qNnljUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FDB73EAC512914CBFED8ABBB91B3686@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: beac2be5-dd37-42cd-302e-08de64edfff5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 19:37:29.6638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IwucsnWyMfvteRTHaaMD4WUSoQISmXnhN3uuIL9j9bqU81aEeHmuhbhEgshyUpgV3ORGIS/GGGJLJixidAj8Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP195MB2780
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[phytec.de,quarantine];
	R_DKIM_ALLOW(-0.20)[phytec.de:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33126-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[J.Remmet@phytec.de,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[phytec.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[phytec.de:mid,phytec.de:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5DDF0F6E4B
X-Rspamd-Action: no action

QW0gMDUuMDIuMjYgdW0gMTc6MTggc2NocmllYiBHcmVnIEtyb2FoLUhhcnRtYW46DQo+IE9uIFR1
ZSwgSmFuIDI3LCAyMDI2IGF0IDAzOjQyOjE1UE0gKzAxMDAsIEphbiBSZW1tZXQgd3JvdGU6DQo+
PiBDaGVjayByZWd1bGF0b3Igc3RhdGUgYXMgcGVyaXBoZXJhbCBhbmQgZGV0YWNoIGNhbiBkaXNh
YmxlIHZidXMuDQo+PiBXaXRob3V0IHRoaXMgY2hlY2sgd2Ugd2lsbCB0cnkgdG8gZGlzYWJsZSB0
aGUgcmVndWxhdG9yIHR3aWNlIGlmDQo+PiB3ZSBkaXNjb25uZWN0IGhvc3QgYW5kIHRoZW4gY29u
bmVjdCBhcyBkZXZpY2UuDQo+Pg0KPj4gRml4ZXM6IDdlNzAyNTgxMTU3OSAoInVzYjogdHlwZWM6
IGhkM3NzMzIyMDogQ2hlY2sgaWYgcmVndWxhdG9yIG5lZWRzIHRvIGJlIHN3aXRjaGVkIikNCj4g
DQo+IFRoaXMgaXMgbm90IGEgZ2l0IGlkIGluIHRoZSB0cmVlIDooDQo+IA0KPiBBbmQgaG93IGNh
biB0aGlzICJmaXgiIHRoZSBzYW1lIGNvbW1pdCB0aGF0IHRoaXMgb25lIGlzPw0KPiANCj4gVG90
YWxseSBjb25mdXNlZC4uLg0KU29ycnksIEkgbWl4ZWQgaXQgdXAgOigNCkkgYWNjaWRlbnRhbGx5
IHRvb2sgdGhlIGxhc3QgcmVmZXJlbmNlLCB3aGljaCB3YXMgdGhlIGFjdHVhbCBjb21taXQuLi4N
Cj4gDQo+IEhvdyBhYm91dCBzdGFydGluZyBvdmVyIGFuZCBwaWNraW5nIHRoZSBjb21taXQgaWQs
IGluIHRoZSB0cmVlLCB0aGF0DQo+IHRoaXMgaXMgZml4aW5nIGFuZCBzZW5kaW5nIHRoYXQ/DQoN
ClllcywgSSBhbHJlYWR5IHNlbmQgdjMgd2l0aCBmaXhlZCByZWZlcmVuY2UuDQoNCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDEyNy13aXAtanJlbW1ldC1oZDNzczMyMjBfdmJ1c19z
cGxpdC12My0xLTAwOTc3MmYzODI2NUBwaHl0ZWMuZGUvDQoNCkphbg0KPiANCj4gdGhhbmtzLA0K
PiANCj4gZ3JlZyBrLWgNCg==

