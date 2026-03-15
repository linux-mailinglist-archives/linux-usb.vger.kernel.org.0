Return-Path: <linux-usb+bounces-34826-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCQNGvvKtmlyIwEAu9opvQ
	(envelope-from <linux-usb+bounces-34826-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 16:06:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0512291205
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 16:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EFB93018AF0
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 15:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B3E366569;
	Sun, 15 Mar 2026 15:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=surban.net header.i=@surban.net header.b="j98n5eVK"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023076.outbound.protection.outlook.com [40.107.159.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC49155C82;
	Sun, 15 Mar 2026 15:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773587189; cv=fail; b=kPWk9/x2LmkGeGYBffYBh8F7NIuof8R3QAiA45nNs20WFatS3FoekhMTOikGvIaj9r1zzgaXO/NkpyAWm4tPMbXc+vDpwsyp5XaDMdeMAewQM9DXuKqHZ/zM2kBf9UrD1xfJoH0OJBfJ9FhZ6ysL+iIq/7Zg626aBIXPj1UuoZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773587189; c=relaxed/simple;
	bh=BVMPxhsI/yW59sQ1WFk41EqRw7/OPQVWvrTIITtL9eQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RdBIOmYUZxYnC+LAcwRIGF/Qwan3+xZjumk+y667txeAP3Ucwibxyvtcf3cftsiKmqSkuHFhH9/Rs+DTjDo98RshGSiKK5+ny1JrUBBIOiV4MoWh7ofIEk+dgGh1ND8dRhFjHYGu8GcfUFC9vrmQ+4bosEZ+OQZBuKGuf4fNgyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surban.net; spf=pass smtp.mailfrom=surban.net; dkim=pass (1024-bit key) header.d=surban.net header.i=@surban.net header.b=j98n5eVK; arc=fail smtp.client-ip=40.107.159.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surban.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surban.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TRuTbaRFXEb4ZJJXVaL+REoIBEueAE0St4gGaxweP2NJ5/S6yNGx7A2xeJvOFxj8CsDfNVfruZt0m+YCK+tq5G2Ywo968hyABTLcdT9om/l/6HJXEhNbGMDhwSr2PtoRgltu3ktfTXmn6jbjoemqgAtjkOpsTGm5ybTHeY1UX2+5hvkZWtofymbjBrWkB+TgRFbC+LOnqmoWJekywKZ2xf7iiPYisEUiCmeQqsN5UKBtiBhOkkpFv+MLfuOhrqeu1+6hr4H04p5x3izVVHdLz62KkaEJTmHdcAdv69bXo327Vx8WP3S6gaUEQ3dk0gaJG+MGbxCanrrIjdYFSabODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVMPxhsI/yW59sQ1WFk41EqRw7/OPQVWvrTIITtL9eQ=;
 b=sQMLiE3Ms77gcvxDOGhAgP7s+SsjoxNRUi2J7PbEWFmHSm5BKg6/8ZNyqo02FcpakzNseG0AAMlsK9QHrfTq2/0ou8BnlqZPiCtsg500KoJZ9OvYSssrO3wHBOYuDsOkMihRd2fuLRSrC/XI3S7AyiiY0Xo7Nq3hjcSgN2CwUhVXbSaIvg8m+s1pBmrT6P6lkk1hySPuYoZq/2AuPswvAHWxpKtEW5ykCMgueIruu5mus7+RnBDFtp4y4CDRBMK98gIet8O6eszIOK3Aeg2YnskITxwRrqG5VEHej7UkdOMqMtJXxZQLO7Pcy+MEahOwY9kDxgFQ6nslfl3qyvJHXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=surban.net; dmarc=pass action=none header.from=surban.net;
 dkim=pass header.d=surban.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=surban.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVMPxhsI/yW59sQ1WFk41EqRw7/OPQVWvrTIITtL9eQ=;
 b=j98n5eVKDGMIeS78iUsX4CzkWKAcBINERa35fz1ABeGwE+Ttj8HKcorlAUyPgNrvnHOKBjlUe3Bgi1L1sgqjoeuIAhecb03jZoVTYJgwjo9h36lyV0voPeHFBQGIeZsaRodxeQM+YRjSBkT3caWr7Xjf//SKGmbmTBH7Wg42rXo=
Received: from GV1P189MB2668.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1a2::10)
 by DU2PPFBEB675582.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::aa3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Sun, 15 Mar
 2026 15:06:23 +0000
Received: from GV1P189MB2668.EURP189.PROD.OUTLOOK.COM
 ([fe80::ff2b:8780:d726:86e8]) by GV1P189MB2668.EURP189.PROD.OUTLOOK.COM
 ([fe80::ff2b:8780:d726:86e8%6]) with mapi id 15.20.9700.021; Sun, 15 Mar 2026
 15:06:21 +0000
From: Sebastian Urban <surban@surban.net>
To: Alan Stern <stern@rowland.harvard.edu>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: dummy_hcd: fix data corruption with queued
 requests
Thread-Topic: [PATCH] usb: gadget: dummy_hcd: fix data corruption with queued
 requests
Thread-Index: AQHctFqR8+bVsOEbDE2oaRN5MT0em7Wvq8GAgAAGGQA=
Date: Sun, 15 Mar 2026 15:06:21 +0000
Message-ID: <2131664a-9730-4934-9acd-8da72afb6ba5@surban.net>
References: <20260315090307.304644-1-surban@surban.net>
 <9f2c403b-5955-4e6b-a356-330cebead7ed@rowland.harvard.edu>
In-Reply-To: <9f2c403b-5955-4e6b-a356-330cebead7ed@rowland.harvard.edu>
Accept-Language: en-US, en-DE, de-DE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=surban.net;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1P189MB2668:EE_|DU2PPFBEB675582:EE_
x-ms-office365-filtering-correlation-id: bf64325c-497b-42cd-db55-08de82a46ae9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|22082099003|18002099003|56012099003|7055299006|38070700021;
x-microsoft-antispam-message-info:
 RIPMmxZF3xehGSm5dnE2kxQeKsUgWmgIZzD8+KRYwBETZJp7NwR6EQ6XdxNdBr0KaGb/+mLTC6/mnxtlkTlz+uZlYgrEm4kY25bIwVsepNXu9/WScS8O4Ldw6fa6l2VO3otaLZ8FVW80gUZ2M/k0rqhmgZGrTPJ5V0nhHjsEukrJmsX48iIEUYOrwObHEh1XT/j38WPLW9mrXrH8arPddix5ytA0D8vlhhTIqZONLFvnkT3AHV7B+JicIzkddewkkJd8JxRO8FAm8MJxmreGpDI8ycY7RTrMMr7/mg+XAf1OVWaH6umvOnp252DmHt6bZMhLQgmHtDHwHAtHv8BLVG6WOcQ69nTVlyDBmoxPRbndzKi7r6gv4qKWF/LWK6PZwa1SqJm04vhDOV7zZBaNpz5ygFmnNFjxvssYlDNGqs0Rgf36zafbZKr5LU4V1274+fxJVrSSgCXvfKaJRjdeJcLeWThpwGNazbAgDhnvjFeGmLrBO0o6NU+3Yzs6VYIMikqzQQR1wPREJWUgAJR+hUKOwDJvLeFJsOncGkIB1PbmwM6LEzOsDH4hi/3Oh1wCotNfvkG8o5p2iIHdAc7jBx1NQ4Db4DOLG8nE/D3UXhWhHoovaId9yNmSrV+LFb+2OqcQOLEjj2gJuJAJklzV2CYr3xEvhFSIkecfv33/GO2oqzcGiWrnowEyVPGPwHkj7y8NSEz35uCUcv0XhoMOJ7JUxmAR6AAUs2KTTwUUeSsW6zLaipWq6bSyYQkX7grENySJ+CTsV922V+DzM0RH5XhqJ3JAa1hiKtQixMjGpjJzz0u9nyrkZq2FeNXXHNSo
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1P189MB2668.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(22082099003)(18002099003)(56012099003)(7055299006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N2pUNXlYMmZYM0l3czZhYVhlQmIwMjAzemdnTWNsb3RnSTZ1SzBFOHZoWi8w?=
 =?utf-8?B?MjBxTWFPaGpJank2QUNGTUV6L3MrMXNza0FSd3QrOFFFYUl4SUtXVXhlWjFX?=
 =?utf-8?B?VVZhT01PbDNlU3d2VTMxYzZwV0pPZklwOHNyVzFPRWRRTU9KR1BtNnIyZW45?=
 =?utf-8?B?MEgwWC9ZSW51RnNIUUZEZW5GVnpyNGVRN2JURVpHT0x0YWFIeVFoajgzYmw3?=
 =?utf-8?B?R2FhTkFucFFYdUppV2VMalo0ZlJZY0ZlakE2bCsyQjJDNFVFb2RaTGlsdzBE?=
 =?utf-8?B?N1l6SUg3MkY3Rk5oWE5RbGVDemQ0M0MvNjNwRndmU0xObVBLUjZ2T2w5OTBk?=
 =?utf-8?B?VUFrR3YybmVqcEJnc0xtTWw3d2hJeVhiOEw4TEhIdGdPTTNvN0RkdjR0c1g3?=
 =?utf-8?B?dy9YMHdoZkhud0hraFA2OFhCaHRUOUpVOS8zQTRiS1VDY1NvMUxMMENNdWU1?=
 =?utf-8?B?N1BSbU5QOVczeXZha0Zvc2pVTWhrOWxaeTR4SzBhRTBpeWF4dUs2UHhTWWhu?=
 =?utf-8?B?eCtwL2RIMVVMbGsrbEVMNHVUbUR4NmZqM0J6cXBTVE54eDI4ZWFPL2lwV2JW?=
 =?utf-8?B?dExabGU0TTMyR0tUTFE0b0pMT2NJb1NqUWNtTmFnM0dNelFrTXNmb0xvU1VG?=
 =?utf-8?B?SmpYcDcwNTRYakZFNmY0NENQUEdML0FHT2R6NWV1NU1RalJNQjVTVjBTSlJ4?=
 =?utf-8?B?aVdrbWx2aWhOOEpnYkNFRFBSTms1M2hlQnJsRDN5RkFHU2RydmhEU0ZDRS9q?=
 =?utf-8?B?djdCdkhmVUd5YjMzQjV2SzNBZjZ6UlI4QjVzWEk1aFNhc2l4Rm05VkpWeXFl?=
 =?utf-8?B?b2l6RC96QTBlakpleGlvUm55eFlLcHh3dXdYNlYzbU1sZlJQd0RkaEJ6RjRL?=
 =?utf-8?B?bjNtMHRHaDQ4bjh2VWFDangzSG1UTEhKbnAxMEtyOUJGbEk0dzd4bjF1c3VG?=
 =?utf-8?B?bnZHZk1Gb0Z1SzA2ajBwNDJnTHk2SGQ4NlorWU92VE1hd0RnUDRVVldyV1p5?=
 =?utf-8?B?QUFZcVpQbkRTZnpmLzhOdThZZklGeElFZkE2b3JWQzFTRkd4ZTdtMHlpK015?=
 =?utf-8?B?SVUweUJROXU5S1B0amdoQjhBWjNZNE5KYUZiTHhxRVh4bzdFRUErMktkMDJ5?=
 =?utf-8?B?TTF0ajR6ZXNLUks3K3Y0VEVaaWhORE5DU2xvTDRYOTdyVi9tRHZRV3ZXNFh1?=
 =?utf-8?B?cFI5SEpqejJpaDN4M3FNTThJWFJwTnJQN0lHSmhvYWFJdUM0R0t2dGZvaVNh?=
 =?utf-8?B?M2pWWkdPV3lkaUNVYjBhV0NqTUg3dk1vWGFXNnJuZjdJZGFJNGp0dTZtUUpk?=
 =?utf-8?B?elRZUjJIbU9UMFh2UUN4eXlZR0NJd0FKOXBGa2NsRFVsRDhSdHAyU0lzRG1a?=
 =?utf-8?B?N09ocFkxMGcxU3dhVkcvckszNk8zek1mQk1DR1M2R0k3VzZWYlg2Wmp1cmc5?=
 =?utf-8?B?bEhOY0RRK0txNkh6cjFpNXJXZThUZldULzBjelUxdXFsWWlkMlkxd2ZaK21t?=
 =?utf-8?B?Lzh1SnRnS2p5TFNPdFNPcGhOZndiQ0t0aWhZZ1BDb2U0SnZzcklJcm95YzBt?=
 =?utf-8?B?emdZbTNnVTVDbFlEVzZYVTNTdytuQnBERklhYUFBSGMyYkJsdVh4YlVGYUtC?=
 =?utf-8?B?VWJ4SnNOeng1cTIzdmJRS1pwRnBFSDdPeHlWY2JrZlArblNWakxiYS9PcTFu?=
 =?utf-8?B?cG9PRzNCVGRkTjNudndkOWpYN0JuSXlhdnpZc2gwLzV5VFloYzI1ZnVwSmFu?=
 =?utf-8?B?ZTg3bXgxbHJ0UUpKdjA5NExCcXhaZDFjd3JYcWJWMHQ3N2hPV3ZaTmRzNVRN?=
 =?utf-8?B?M2lYY0NQS3pEUEF5Mld1Y2NBdTFZdk8zbzZhdCtubFVmdUZzeEdCVmNSMm9h?=
 =?utf-8?B?bEJZbkxxWXA5cUtDak1zVDJNcmxoSGF0MTg1NHZWcERXa1lCK3czd2dZY1ox?=
 =?utf-8?B?c2M2bVpncDd0bTdTT0RJcDd5Z1A5WW0vd21BMndidmRHRCs3cEl6bE9wU2dC?=
 =?utf-8?B?YkQ1ZWE4bVVZU3AwNGpkT21xUWlGN1p4WFFqWXJyYXVyZ1hNaWFJVk1UR0tl?=
 =?utf-8?B?bDRMdENPQ1grZEhlSEwrWWE2YisyZEQ3aEVDY2gzTUxxTTA0R1VpdjNhYmN2?=
 =?utf-8?B?d0VoMmlpdExQb0VLM2J2a09ieC9xZ2FlNWJhR0dCbTBYRlRlcFlhMzE0UjNs?=
 =?utf-8?B?SGMraHVGWU5BU094YlpaV1o1YVpqclF2ME4rc0pab0xoSUhYS0cvUEJENHJ5?=
 =?utf-8?B?bzMxOExJSVdvRlMzYnZKVmVJd2phbmZXZU45Yk12enF3VW8xSXpHakY4OXhR?=
 =?utf-8?B?L1ZKZWY0Q0o1dmJ3Z3lJSUdZVFJlN1hYdnFMN3U0RGVrVHRxeGdvZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E124B57839513547817357FDF039BF29@EURP189.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: surban.net
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1P189MB2668.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bf64325c-497b-42cd-db55-08de82a46ae9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2026 15:06:21.3013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a27af4ff-c4b3-4dec-be8d-845345d2ab67
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +iI1RuD+yobi/08j+1K9b52gKkUZvpGIiEuCPfMo9jbgZx17D5GCz/5J6CXDqKvfA1jPN/5ho7pTFVMvbp07AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPFBEB675582
X-Spamd-Result: default: False [1.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[surban.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34826-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[surban.net];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surban@surban.net,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[surban.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,surban.net:dkim,surban.net:mid]
X-Rspamd-Queue-Id: B0512291205
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8xNS8yNiAxNTo0NCwgQWxhbiBTdGVybiB3cm90ZToNCj4gT24gU3VuLCBNYXIgMTUsIDIw
MjYgYXQgMTA6MDM6MDdBTSArMDEwMCwgU2ViYXN0aWFuIFVyYmFuIHdyb3RlOg0KPj4gVGhlIHRy
YW5zZmVyKCkgZnVuY3Rpb24gaW4gZHVtbXlfaGNkIGl0ZXJhdGVzIG92ZXIgYWxsIHF1ZXVlZCBn
YWRnZXQNCj4+IHJlcXVlc3RzIGZvciBhIGdpdmVuIGVuZHBvaW50IHZpYSBsaXN0X2Zvcl9lYWNo
X2VudHJ5KCkuIFdoZW4gdGhlDQo+PiBwZXItZnJhbWUgYmFuZHdpZHRoIGJ1ZGdldCBpcyBleGhh
dXN0ZWQgbWlkLXJlcXVlc3QsIGxlYXZpbmcgYQ0KPj4gcGFydGlhbGx5LXRyYW5zZmVycmVkIGdh
ZGdldCByZXF1ZXN0LCB0aGUgbG9vcCBjb250aW51ZXMgdG8gdGhlIG5leHQNCj4+IHF1ZXVlZCBy
ZXF1ZXN0IGluc3RlYWQgb2Ygc3RvcHBpbmcuDQo+IA0KPiBXaHkgZG8geW91IHNheSB0aGlzPyAg
RGlkIHlvdSBub3Qgc2VlIHRoZSBjb2RlIChhdCBsaW5lIDE0NDUNCj4gYXBwcm94aW1hdGVseSk6
DQo+IA0KPiAJCWlmICh1bmxpa2VseShsZW4gPT0gMCkpDQo+IAkJCWlzX3Nob3J0ID0gMTsNCj4g
CQllbHNlIHsNCj4gCQkJLyogbm90IGVub3VnaCBiYW5kd2lkdGggbGVmdD8gKi8NCj4gCQkJaWYg
KGxpbWl0IDwgZXAtPmVwLm1heHBhY2tldCAmJiBsaW1pdCA8IGxlbikNCj4gCQkJCWJyZWFrOw0K
PiANCj4gSXQgZG9lcyBicmVhayBvdXQgb2YgdGhlIGxvb3Agd2hlbiB0aGVyZSBpcyBub3QgZW5v
dWdoIHNwYWNlIHJlbWFpbmluZw0KPiBpbiB0aGUgYmFuZHdpZHRoIGJ1ZGdldCBmb3IgYW5vdGhl
ciB0cmFuc2FjdGlvbi4gIEJ1dCBpdCBkb2VzIHNvIGF0IHRoZQ0KPiBzdGFydCBvZiB0aGUgaXRl
cmF0aW9uIGZvbGxvd2luZyB0aGUgbGFzdCBhbGxvd2VkIHRyYW5zZmVyLCByYXRoZXIgdGhhbg0K
PiBhdCB0aGUgZW5kIG9mIGxhc3QgdHJhbnNmZXIncyBpdGVyYXRpb24gKGFzIHlvdXIgcGF0Y2gg
ZG9lcykuDQo+IA0KWW91J3JlIHJpZ2h0IHRoYXQgdGhlIGV4aXN0aW5nIGJhbmR3aWR0aCBjaGVj
ayBhdCBsaW5lIDE0NDQgaGFuZGxlcyB0aGUgDQpnZW5lcmFsIGNhc2Ugb2YgYSBub24temVybyBy
ZXF1ZXN0IGZvbGxvd2luZyBhIHBhcnRpYWwgdHJhbnNmZXIuDQoNCkhvd2V2ZXIsIGlmIGEgWkxQ
IGZvbGxvd3MgYSBwYXJ0aWFsbHktdHJhbnNmZXJyZWQgcmVxdWVzdCwgdGhlIGNoZWNrIGlzIA0K
c2tpcHBlZCBiZWNhdXNlIG9mIHRoZSB1bmxpa2VseShsZW4gPT0gMCkgYnJhbmNoLCBsZWFkaW5n
IHRvIGEgZmFsc2UgDQpjb21wbGV0ZSBvZiB0aGUgdHJhbnNmZXIgd2l0aCBhIHNob3J0ZW5lZCBs
ZW5ndGguDQoNClRodXMgdGhlIGJ1ZyBjYW4gb25seSBiZSB0cmlnZ2VyZWQgYnkgYSBaTFAuIEkg
d2lsbCByZXN1Ym1pdCB0aGUgcGF0Y2ggDQp3aXRoIGFuIHVwZGF0ZWQgY29tbWl0IG1lc3NhZ2Uu
DQoNCg0K

