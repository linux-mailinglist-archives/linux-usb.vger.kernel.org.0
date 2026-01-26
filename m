Return-Path: <linux-usb+bounces-32704-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCFFHjQgd2ntcQEAu9opvQ
	(envelope-from <linux-usb+bounces-32704-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 09:05:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E55188540E
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 09:05:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D18DA3009F37
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 08:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4EB2F6181;
	Mon, 26 Jan 2026 08:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="TqcbS14c"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021097.outbound.protection.outlook.com [52.101.65.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D6B2C08D5;
	Mon, 26 Jan 2026 08:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769414705; cv=fail; b=A2z/NOFYhpuHZ5BEbooUEulFpIszwQSn0hqOYDX5jbhOTB7aEZOu/M/osXdgT93fDZI0RxujV1EplRM/BGnpP5W6kSi3GZnfLT5kvV2rc2Wq53fpSUSUaqchDUDOFZwNJdpRedUhRlSdsapkXeAmSviZZAH2t5Ws53jyn+bW3Z8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769414705; c=relaxed/simple;
	bh=TEVBtPrH9H4W/zrat6VUVNkXiab1ClbcDsJpVLA/mVE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NGdaTauS0GsdhtkMxTQVpn0oBaYT5+KK2+crDZTZqkMUBB4RT7iHCT/zCNj6kxrcmuQqo8PgtOH132xU8FS27kuJoXqHj0idYeg3S0KUvZofC0TZNxMIisoG1kFm5UDSTNUyEcU2otoXSX8FlhOPv/nbMGh3kxfC2igAPMeE4pY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=TqcbS14c; arc=fail smtp.client-ip=52.101.65.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxhHKuxkgf3WOhywhsQcs4N4H+fid/twfwFMLpfu8VBVsfRg0NS8k1EoYxjLvmm/b4ltz5TI0XD8meQSeQDw3rxiceXPuH134IIELrk314n68zOQjZ2+9/tuVxdCEeVbYtqwQEuywBWcg6X+r0mhVKCvBOTOBmx6BTWh8EYg0CZBBMYTgYZxoA4MQzJnX/eWDpTmNjCFHjr1hHATFwEUX0dlF9NN82zLqNE6wux7JLjx9jf47WbUPX273S3DdDbHAmFV0QVOt0mymQIBJZyS4IrzvSLYz3KpAdKIpTis5wAWs5VGIcP6+/WIPl4z8Poci/2u5RzLYr7/7Tm3BFwGLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEVBtPrH9H4W/zrat6VUVNkXiab1ClbcDsJpVLA/mVE=;
 b=vgdIt+PBFaQrUDMY4EDFDOXLxaTQlAbGUwJgar88222ZAqyVeKxZLAKNaX9PQYm5AUkvXYXxCdEefVetiQyTCUJx70XwZLLARDzboOXtaEzHivYgcth0CSpT6b21uwAu6K870zEM4ZRpqWnklLGMjrWntK26Ouk5yX4RFljQ2qkDNcFXte/uPCrawWM6CsTrXZPD5h18lcNDgCztNxkqd1TNzVgwBhVve6QXBl4DQDUWzR1IgO6RUc6nTFHtCaK6ZCP0gKHWFZjar5ly+4U5YKTLaeXIIhViKKgn/oJf+NofBsDeP9vM/NDB3EvhDmozqBvJ2JFY9byF7mPpT85txQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEVBtPrH9H4W/zrat6VUVNkXiab1ClbcDsJpVLA/mVE=;
 b=TqcbS14cci9PUa7HPESI7Kq1Lg55xdFy7D7aEP5TUzO4ko9CXUyosWUisG/s2a6tvDl8J5Xo3O/WAKgSfbPbvIqcp4tlhhANSmRuFeBIMwy4XDRwbDyhBYzeKDUTVXk5vU/3F2W7QmEnfwyT8e1fXg1IcJbeNO5r6+zKi2rqNbmN2aVtZBbN2wC4CHtyiomTtu2qc+LG0ozXt/FsKcpvcQQVZ47/pWGKyLfoMFfSVBEX2z5Mbm31n0kg94v7p76NA8+POPuNbuOwvmuoMU+GHWw9nPm0lzIWc3hgY48iNd1roHf+uMKYIt+DktG+6GBEcUnz+Awv6ZFE9IF0i9KQZA==
Received: from DU0P195MB2325.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:425::22)
 by AM0P195MB0675.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:168::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 08:04:58 +0000
Received: from DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
 ([fe80::a5a9:5513:e1a:f50f]) by DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
 ([fe80::a5a9:5513:e1a:f50f%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 08:04:58 +0000
From: Jan Remmet <J.Remmet@phytec.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [PATCH v2] usb: typec: hd3ss3220: Enable VBUS based on role state
Thread-Topic: [PATCH v2] usb: typec: hd3ss3220: Enable VBUS based on role
 state
Thread-Index: AQHcjIQD4/HxHZiKCk+ldDwHVKR9w7VkG+UA
Date: Mon, 26 Jan 2026 08:04:58 +0000
Message-ID: <4d1e6908-daa2-4322-8c00-055b4c1022bc@phytec.de>
References: <20260123-wip-jremmet-hd3ss3220_vbus-v2-1-bcad313ce92b@phytec.de>
 <2026012343-rockfish-candle-d3d9@gregkh>
In-Reply-To: <2026012343-rockfish-candle-d3d9@gregkh>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P195MB2325:EE_|AM0P195MB0675:EE_
x-ms-office365-filtering-correlation-id: eb109561-6586-4fb4-8389-08de5cb19981
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NUNVcWxRRy9CU05id2ZpMnNoYTZDdnVMbHBSWWllNkRITFN6U2xVaUl1cFJO?=
 =?utf-8?B?a0xiOHN0aHpEYnV4ejVmVkZJK0ZDYW9vaEJiRTJ6YnN4cytoSlhLQk1DTDlQ?=
 =?utf-8?B?MVJXSUVDVkNFSnJTSlczNjhlMXYwbk1wSDZKYVJRN3ZSMG5kQ3U1M0h1WTNO?=
 =?utf-8?B?U2hCUGVCRDh2VU5VSENZS2t0RE43c2s0MnlpdGkwaDdxVndpSUlNYksxbHFy?=
 =?utf-8?B?M1FscktzZEtPUGFWUFdVKzFBRmZ5SGRvZ21Sc3hMOXdZczZMN2Z4enQ3ak1Y?=
 =?utf-8?B?c3dLRHpUdEtTRjkrLy9uQlhZQklyUUE3QzFMeUEwemljeDZ6NjFpYmkxczdn?=
 =?utf-8?B?UFcxOTV6TzUvNytaZ1BGL1d4S2V4MFVIcFg2cGJpVEcrL29xOTdOTCtLbnZv?=
 =?utf-8?B?TGdSdmxWdDlpOGJWWWc2cWpwUzZrQThiNFZqaGZMNU9hZG1jdFNpc2p0cFVZ?=
 =?utf-8?B?VWtLb0Q4V1hZZGMwbi9XaHUxaDdMRDVLMFNpc29scWdFdjIyM0Z3Tm5nVFpM?=
 =?utf-8?B?SE55WDlKN0wrRXdkWitUejYyek1DRmc2NlpVVUlRa0dDTWtiMzh3UHd6a2pu?=
 =?utf-8?B?VVpWa0ZUZ0k2NXZrakFPQ1Mra2IyVTRtMDNyaWdTMlc5c3VQdzF0bWRWeVRr?=
 =?utf-8?B?KzBUQ00rK2hHSG5xelExSGJpK3ZWYXk5Z3BmZC85OGl1anc5NjY5N2tqZ0xk?=
 =?utf-8?B?Mnh1T25hbWtDVWhmZlhRemkwMTdCSlNwOWFXc09iNVo5aC81cDU2b0Z2REtm?=
 =?utf-8?B?VUdMNE1hTEYrc3BWenpOczZYc2g4QmwzV1ZXWEdXNlBGREhvL3d4NjZiczFy?=
 =?utf-8?B?Y0Y4WWdKY001Njk1dzFQNzFSRlhSNW5wenVSZEhPOEtORzRqbjlrTDBHRm53?=
 =?utf-8?B?ZU1tdjkxTHRXZGJjb3JRZThqdWFyY0dBTERXQzBYbnNDdXhKMko2RHU4SUJU?=
 =?utf-8?B?eGtEbHF5dHdOQmF3N29XblhERElsYWdWeThKVFBjVk5SNTlaeG01dTRrK2RI?=
 =?utf-8?B?bUpVU0E0WExYZ3FkOUZTU202Zko2YjZ6cmE4UkkyejFwMytlTFZXWXdzajh3?=
 =?utf-8?B?ZkJrL2k4NURSTWxscEwyWHZtZllwd20zeS9kOHJIL3FpdFdPN0hObEdPclBG?=
 =?utf-8?B?SnB4MDNKSThRaStUcGgybHVLNHF3VmlqTEVZMWNzOXJoYUFlTlB5ZmZQSEQy?=
 =?utf-8?B?cUVsbUpPclV2MUttbXdHaGI5aUkzbmFGRUFDNTNJbzN3M3RNdUg4YlFnUTR2?=
 =?utf-8?B?N0tQaEZBK1VNWDBRSlZEZ2YyNFlnWXNuNVEyNXBJYTR3TkhvRW5UZXlCZ3hC?=
 =?utf-8?B?bTV2Y0dNTGIyQnFneTMxMWZZMUNvQWF4MDY3Y1ZYMHpLTEU5SmQxNFloOXJE?=
 =?utf-8?B?WlZkMStyQWNLZUhaSC9wb1B2RWtyeXhiYUJ0NFU1VExrUXRYbDVMV0s1Wmw0?=
 =?utf-8?B?Z3VsN0VNTXlod3JaRlNhNGJnVUYyWnp2N25zMFlkUWtxNDVRUnlhdnlraGdI?=
 =?utf-8?B?dUVac0dTbldIL09sZ3FFVGg2NjBLd1BvODdZbTJzNEFWMlZERHhXYStRMWVh?=
 =?utf-8?B?RXdZQzQ1TkhqVTh4bmR3NytwNS9kMWNqdFNVZUVHcEZ0NDVoSzJXd3dqUzcx?=
 =?utf-8?B?TVFZYzdIUEw4eTN0RGVyTGNrYlNHa3V3cWRna29rdFF0Yzc0RzllQ2QzcHlD?=
 =?utf-8?B?N094cFdMSEVkT1hYcTZhWjhneDViZjJ6ZUNBdk9MR0JYY3JGSFhTYzFFU0lI?=
 =?utf-8?B?UVBxMThVUDhkOHNSU0U2Kyt6MnJWN0Z6TlhxYmdvbVJZM3hhN3B0dUN2b2hK?=
 =?utf-8?B?eXhPOUF1UDhIQVRmQzQ5M2hoSXRsSkdCaXZ4Y2FSNTJxZ1dMaUFEUlE1Y0Vy?=
 =?utf-8?B?MTlRR3gzcW9QYjlRemQweG9oTlBQR2pGc3FETUdqMTNzdlZZUHR3YzRlenE5?=
 =?utf-8?B?b2FqVnUyRGhubUxreWcxNGVuSTROYVRnSGxpaFZGRWd3c1JNNmNqQmQxM2tU?=
 =?utf-8?B?Tmc3aTNpbkZybWhDQ0gvcHFNNW1SbUo5ZjNzQjJOWHhqd2NHa2ZXUWMxRW1I?=
 =?utf-8?B?YzQ0cG1pL0xuT09obktqRXFERkRmYmxMNkoyM3g0MDlQcHp0aWZJM1RpTXhE?=
 =?utf-8?B?Ymd2RHFkNlBOMnAxVld6QUhlTGx0T2MwWDhJWEVkYWlvM0d6ZUpKTE5nU1Y1?=
 =?utf-8?Q?vJnp5d+lz6caIuocPjJe5f0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P195MB2325.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dmxWMjdDeU0vOUhrZURmUnVqV0xhSllFeVhjYkJPWmV4eGdOOFhhZ3FOWTd1?=
 =?utf-8?B?alFJUExYZ0l1OFBYU3Fsd251c1Y3K1VUdE5penBvb00yZ2dhM0lpSnBxd1Vo?=
 =?utf-8?B?eDhTZkNGNUxhM2Zma2Q1K3duV0VCbEloNlpyY1BZM1g1STlDTjZJMzEzb3lx?=
 =?utf-8?B?UDRzL0VqV0FQYk16bFFoMlNsYzR6ZzRhM3VPaHVmMEVuQ3g1UXFUK0ZHalBW?=
 =?utf-8?B?MEEvR3NkRlY2N3lEZFN6VGpiTGFVNHBiQXdMMktGMFNreUhKSHBqVndsQjN1?=
 =?utf-8?B?eGJjcGd4eHB2MnM2WlBTUWtuQ0tOcGlRTjVsT1h5UmlEM0MrWExCelZGVUh5?=
 =?utf-8?B?c1pRSTM0ZGZPNk5MVDd1bXM5ZHFxald4djQzWHVQTFdqd3ZlWUxqNWF6UVNR?=
 =?utf-8?B?amNPQkpsbWRPeDdsYmM3QkJ4WXpRTlFNRHFaNjh0d1pON0dEWTI0d1VnTkQw?=
 =?utf-8?B?Uk5BZEdVUlFrL056N2JtSmZpczZrOW1jWUUwYmJHQXY4NkJYOXg3N1RBRTBk?=
 =?utf-8?B?cHhua3NCWDZycytzUUpZRUM2dDZ2R2JMQ1pSclJmU1h1WXdxa1pLTTI4VFRj?=
 =?utf-8?B?MENlbXJCbzhXWFkybnZEK1NWK2U0b0V0QkFIZzJUTi80aENKSFJDZVlDVUV3?=
 =?utf-8?B?RkFabzZma1NJSExTemNucmZTc3krOGtSM0NRZjYvaldlbXR4S3NJaHFVemVR?=
 =?utf-8?B?Yjc2bkxzV1l5UlVRSXFRQnkwUHh6VnlDSFJ5ckJ4NWl5UUtoRXdPUFdwMFRq?=
 =?utf-8?B?WHpVT1FKZFFyNitnZHBLM0xleVNHNjJlcnZkWVgwZWpTbVREVVdYQWhIQVJ5?=
 =?utf-8?B?YjNqME9ZeUhvR2VVWGw0alZoaitqMGxmRzVXM3BXbmpEYTJySEtwa2dyblVS?=
 =?utf-8?B?Mi9KcGN4MytubGNFMWtSOGkxakpFeHZBQ2pFTFVkZzBLaUlaR21YR25lM2JU?=
 =?utf-8?B?dE5UL05QWm5wa1gxM1IwS0pZZVpsd3BHa3RRenNqb2ZnRzlET1FyWjRqOXpi?=
 =?utf-8?B?dWtCZDdRZEtOdFdCUS9CSVFRcng0V2l4SlRuQVg5bk9yeDZ1QytkREc5c0Er?=
 =?utf-8?B?S2JpK2p6eGpjc004dGEwc3Z0eWg5STBNZ2lNZXZqNzBqNkkzTHlYcmZPbC8v?=
 =?utf-8?B?TEMrRGo4RUwzVU4rdG5jU3orL3BCaGdEZFV5MlpYSHZOK25QS2JYL2s0QWF1?=
 =?utf-8?B?QkFjWmM0cGdrSWRLaklxdHB6cXdZamMxUHVPUCtoNUxzYVN5WTBPYWlrcWRM?=
 =?utf-8?B?UXVLNVlTdEhQWXB4M0VlV1dzNGpOdHNiT1NLd1VkWDIrSnNjeVpwbkFCMHYv?=
 =?utf-8?B?VEZ5VEE1c2t6aEFjemE3Y1U3S2VWbFBIZ3krVFBjbVkzc09ZRzZha0JrSzl3?=
 =?utf-8?B?Z2ErenJQcWlLbG5tTW5OZ2JKMXVuYlkyaElXRjVNcVN1Nm1qREVyNUdkMGVz?=
 =?utf-8?B?YzQ3Z0xRVWtSOVFDVjk1aFdOMjZOODh6ek9SMHhQcS9FSStRL0lzcjBEd0ZX?=
 =?utf-8?B?ekRZMWFEVFBUcHlTbUFFTExXbWx3TkV5MVZqNmZvLzRyNUo4bDJqenNzanZR?=
 =?utf-8?B?KzNnMjQyb3g3cmFxOWFHaTBEQXU5RCt1VTlYM21vUmJ6RjVlS3NYWEM5TG50?=
 =?utf-8?B?ZjJFdDdLVFg4WVVFSjJnZEtGa2lJTGZ4VXZCalNRTk9KT1BXNURTTkVsZ1Q1?=
 =?utf-8?B?dktBbS91KzQwSmJJS0ZVNjBsb0NlTFBMdDY3TEx1TEN4MTdIWEFYeTlWUzlX?=
 =?utf-8?B?USs1cGUrcTRHMUgxMUxKUXMwZWpvSm50dXZ2WXZzZlhKVE1DcnpZNTZ0Si85?=
 =?utf-8?B?T2lHYll1UWJmZEJxdTBseGg0aG9STC9adWtPdVlsR1Zvbzg2bytYMy9sckQw?=
 =?utf-8?B?clpYa2V1VGFGSUtTNW9VOTZveHBDT3gxUUE3Z3pvQWE3MTQ3alRDNVNwNldZ?=
 =?utf-8?B?NlNaZUJDbkduVkhUZ2psM1hzR3lTYmhjY2dYczB4amxtaE5OVjRPRXVRS3N2?=
 =?utf-8?B?S3dKMkozOExWc2lScUtoM21pY1hzQkdBcS9ZbVZtbTdrdk9aR3JjZU1DajFM?=
 =?utf-8?B?elZFS1ByS0J3dWs4eGR5ckZOYXJQQlVsaXM5Y2xKaUNXZllYT0RENUM4dVhF?=
 =?utf-8?B?MVQxRzNvNU05ZTVKd04xRENEV2R3Vm9mOVVCYW8vclNERHBjRGlhT0VPUzJE?=
 =?utf-8?B?REprMTFjSCt5QTloUjREdDMzd1UvTkQ0Q2swZXgrWXJZYjlBQUdHOEpTeElr?=
 =?utf-8?B?NVMwL0QvcFI1eFVmb2hDSVFIV1gwaEdETTc2RGhXUjY1NHhxOEF0NkhNVHdV?=
 =?utf-8?B?ME5yajM3VCt3dy9BVFJtaFhmQUE3eUk0VEJSY1ZtZjFWNXdVQkNsQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BCFCFE9DE055724F8B49398A3D310551@EURP195.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: eb109561-6586-4fb4-8389-08de5cb19981
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2026 08:04:58.7287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1poGhk/DQJ5vvctedxFXiLuG4MB6ld1Am7bRK5NOCyNSHY7m4dQlEPpGy4T+7RDuZ9gCjDFdzUIR8wyM/n8X3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P195MB0675
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
	TAGGED_FROM(0.00)[bounces-32704-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E55188540E
X-Rspamd-Action: no action

QW0gMjMuMDEuMjYgdW0gMTc6MTkgc2NocmllYiBHcmVnIEtyb2FoLUhhcnRtYW46DQo+IERvZXMg
bm90IGFwcGx5IGFnYWluc3QgbXkgdHJlZSwgd2hhdCBkaWQgeW91IG1ha2UgaXQgYWdhaW5zdD8g
IENhbiB5b3UNCj4gcmVkbyB0aGlzIGFnYWluc3QgbGludXgtbmV4dCBhbmQgcmVzZW5kPw0KDQpU
aGlzIGlzIHN0cmFuZ2UuIEkgY3JlYXRlZCBpdCBhZ2FpbnN0IDk0NGFhY2I2OGJhZiAoc29tZXRo
aW5nIGFmdGVyIA0KdjYuMTktcmM1KS4gSSBjYW4gY2xlYW5seSByZWJhc2UgaXQgdG8gbmV4dC0y
MDI2MDEyMyB3aXRob3V0IGNoYW5nZXMuDQpEbyBJIG1pc3Mgc29tZXRoaW5nPw0KDQpKYW4NCj4g
DQo+IHRoYW5rcywNCj4gDQo+IGdyZWcgay1oDQoNCg0K

