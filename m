Return-Path: <linux-usb+bounces-34830-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GwZLXTWtmkDJgEAu9opvQ
	(envelope-from <linux-usb+bounces-34830-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 16:55:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 376FB2914B6
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 16:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1141A302A2C9
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 15:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350B1371869;
	Sun, 15 Mar 2026 15:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=surban.net header.i=@surban.net header.b="jIud+Yil"
X-Original-To: linux-usb@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021073.outbound.protection.outlook.com [40.107.130.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843F636E462;
	Sun, 15 Mar 2026 15:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773590108; cv=fail; b=jtTAr5hiQl5GSk0VsfAIUwil92PpjVOA90oeGpogF51jmeQdQTZpV/ERCElLb7vL4z6qcZdleGCUbtrmVRYUNP3K8xMHPRVXp5s4VqmrBqSZF6/A5bKEm88/1vDzdFgiORe0Oc5QT+/w1TkpSiu2ouGUIskBrCDMCUhb/KoYhvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773590108; c=relaxed/simple;
	bh=rXIyu2Q6hMOpWbKYmT8Z9WqGySUfQ+rWa2uDEf9YURI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZrE7UqShUijU5LvZCRGikcRbe180Rq6S1MrXnEGMXU2QNEcrkQVu+CggeILQRbBEMB9tp58NNSaztimxLDeZ4fvB/PY9MP88gsPw/9si0DCFoEqKniS4lcTFANQ7LvHaZyLjeeLgeqTyMv7/vEm4QX/OvX+pRwig6MIRuUh/NGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surban.net; spf=pass smtp.mailfrom=surban.net; dkim=pass (1024-bit key) header.d=surban.net header.i=@surban.net header.b=jIud+Yil; arc=fail smtp.client-ip=40.107.130.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surban.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surban.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXbX8DPKvJ9ZYa7hcuq+kVvoJwrso7tMg5fbT7RnXjic06qqIqtvO8vj/OTSv1T1S/uk8or1tSgKmn8B/3YFIIEQD/dVrm7uJROiXjEaPWNQKFMucYvDEL5NVI5sxLphh8WhcCNyrFj8Qx8SVB0GFbeo7RH+pvlg4EzkXthhWSOp5s3hJku1kASHhGbJPbLS0CUTr48PIOAXp72GiSDbKoUJX5eLYBv8r0bq4mdhuw5nIOe8CBRUMwoAChTOIdpYs66SbLt0XI4t9TTgVVWGUOshMSm1M3djRZ/blxon1hWUT3gJqxCMblh2hJcJjlXxBRmllqqXgba4JIq2IOi6/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXIyu2Q6hMOpWbKYmT8Z9WqGySUfQ+rWa2uDEf9YURI=;
 b=aj0hDR4EONUmnQJigRwYZfuDR+LqururHeW1UKZdjuVc9ivhm3e/toP4/5g3P6SG2guX994veLR9TrdxEQS91d0ezlxN7q9K+TCVnjne2qxZGRz1ra6x9sWZbYigadHdZMs3/hQwjn835wx0lRa+IpGlpjKUy+DbXlUYa6XhBEKgnGApqdq4gJjvBuVONWFUbzCBFTooZCXf7VB63tRLPLkQQoP9jrt/B2SBClEV3HSdRfV+58EvSn/sJ9jUkD1mZ5aFRHNobnH14ImBF/n20WMIOEZ69jeSrAZmP+yvT7kkvnxpR+KrEaxbOTKQUaZQBx5uyrEpaFU5GmgqXtBYUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=surban.net; dmarc=pass action=none header.from=surban.net;
 dkim=pass header.d=surban.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=surban.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXIyu2Q6hMOpWbKYmT8Z9WqGySUfQ+rWa2uDEf9YURI=;
 b=jIud+Yil9omrR8ZWX0ReWrwDqaY3ZctZorEZRGOWrb6hOJe/4+yGk6wEtWn8KA2qqa20LxBKxqoQn37jMuEEvOIps8fYO18rzzv/76qgEYDMdlCsaT2XLLtI30xukYqEFu3IrfKW00RmQNI6PspUMML7kPxuEps5uNd1ztA3cEs=
Received: from GV1P189MB2668.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1a2::10)
 by DU2PPFB830855DA.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a9f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Sun, 15 Mar
 2026 15:55:03 +0000
Received: from GV1P189MB2668.EURP189.PROD.OUTLOOK.COM
 ([fe80::ff2b:8780:d726:86e8]) by GV1P189MB2668.EURP189.PROD.OUTLOOK.COM
 ([fe80::ff2b:8780:d726:86e8%6]) with mapi id 15.20.9700.021; Sun, 15 Mar 2026
 15:55:03 +0000
From: Sebastian Urban <surban@surban.net>
To: Alan Stern <stern@rowland.harvard.edu>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: dummy_hcd: fix data corruption with queued
 requests
Thread-Topic: [PATCH] usb: gadget: dummy_hcd: fix data corruption with queued
 requests
Thread-Index: AQHctFqR8+bVsOEbDE2oaRN5MT0em7Wvq8GAgAAGGQCAAAQ4AIAAAdgAgAAHiwA=
Date: Sun, 15 Mar 2026 15:55:03 +0000
Message-ID: <ad638a92-6951-49d7-a809-cedbfd303353@surban.net>
References: <20260315090307.304644-1-surban@surban.net>
 <9f2c403b-5955-4e6b-a356-330cebead7ed@rowland.harvard.edu>
 <2131664a-9730-4934-9acd-8da72afb6ba5@surban.net>
 <68a2906f-0a3b-4543-9c56-795ae9d2ee98@rowland.harvard.edu>
 <c8cfe974-7158-4e51-964b-13c4b41e3df5@rowland.harvard.edu>
In-Reply-To: <c8cfe974-7158-4e51-964b-13c4b41e3df5@rowland.harvard.edu>
Accept-Language: en-US, en-DE, de-DE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=surban.net;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1P189MB2668:EE_|DU2PPFB830855DA:EE_
x-ms-office365-filtering-correlation-id: 60a13d6b-b8b7-4530-ba33-08de82ab3871
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|56012099003|18002099003|22082099003|7055299006|38070700021;
x-microsoft-antispam-message-info:
 Dtdh7m8NI410ikgk/WzhbcKgxW01nbqjOE1vTuZ12jfyGwjS6K/zQH3ZVTwklLCy5AcIM9dqBVxu98/8bL4106bJvZmb5fJZGQWpMDycsjy0DsUQZ1XZOEePzloZfgetTgfnLlVrQl5YpZ4QBttBLvWbuJmjOeW5VKudzkSDiSLJ5Z7YQa11rQo0nBk8ROwaiBBl18GPxUrjt42oi4gNhu0DY8eoPWApuIyl1DA+brIiI+6bl5sCcQiruK84gx7YH0LMY8aCcw6FcldlD4STSa8Zv7N/Z3qeTFw97NaJbLFxUDUGxb2dtcC16jud88ICbgCqTqLj2BhMJmuYctxvzp9CFINrl3enfvHvFTsq1oGAnfZe7Lv1yjDGXMNJDhC+mbEMq9RjbEd57i88OrZndTRoOTcfM7QCO7Q+y8REaMA0kPDJhgQndyahDN9TterGWbvtSOuMXLIWC4t+il14norgmsGFtfYPoE1xTek+5VprBIC49LBQJhiw44Mn25hi44TYjKxPZeGNDZWv0LXCr9tqZxOBKYZVQBRaguXEH3CBCsuGuUUgQ67iVC7QnBnnidVdlvfddBEUd2SggDJBk6Rn9YgGyqA96wwq+K3sgTJQzyibxGKZI1A5xC/fLZks6Lpd6oWV9n4SxwrykQ2B3Z1myeNNjAtP6UpfWBlhZo8lvoQkLS6gSnmRieBeNaokAB8r+0GxE/5tUjJMGYHbk3EPjKVLrJbnQZdlK4pyLvuRR4h6gmEEye7387kmiG13omQf31P/RSTNxwkCVZLxlAI1ZMqIuV4wGmUzeZLUPfnZ7wvggWjvP/cb1QFOmLi4
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1P189MB2668.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(56012099003)(18002099003)(22082099003)(7055299006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RjM5dTdSL3lJejZHQWUvWTc5TDhwL1Z6alA5cFVXb2x5YW0xVnJrYVJBQWNi?=
 =?utf-8?B?MSt1aXZwdnlWYVp0a0lTc0VmRTUveDl0K0tWRnZqZnR2eGFCRWxNV1JaMUJP?=
 =?utf-8?B?YlVCdldhZU9NZEpoUXRra3ZNck1vc0V4aG1MdnR0VVJ0N2lQOGRNTE1wemdC?=
 =?utf-8?B?VVpLVTBzZkV0TFF6TStrMDNGOGkzbFI3ZldPNGxjaHZlaHZ5czA4bDFOakJX?=
 =?utf-8?B?eTF0eXc5RFRKQ0x0MFRQWmxpYVFtQkF0S3B6c2ZwdWdDL2g4SXYxQkFsZWZy?=
 =?utf-8?B?YUE4c1BPUk55dXRDNnhlWHRDZ0VVR3gzZVFRdERJR0J3QklCTkdRaE5tN282?=
 =?utf-8?B?UzNxL25iaGN0bll6RjhEbEZYKzNUWFY5dmF5TmhpaFIrMmZ6RC85QXF3amxC?=
 =?utf-8?B?c29qSGZURXBoeHlOVG4ybkJuM2FFNWNWT211Zm5rZDYyUGk4cXZYZnBuSCtx?=
 =?utf-8?B?R2htb3BhelZvdXQxNnF3VUNXcUpGN1V3QWZpOGVZWGV4UmRZbnExTlR1bTBv?=
 =?utf-8?B?Q0xJK0VxYng5YlZUZGxQdTZUZkt5cDROWVBydnl5Q3B2THY5TTE3ajAxZ3o1?=
 =?utf-8?B?TDljZ1ZTL1dSa0hVUFBkL3lyR0dxbzg0MitjWHZ5RDEzRlI5Sm1yR2dXbXNq?=
 =?utf-8?B?SVZicytseHZUbW9xK0xIaENqKzVSWnNNRDVSN1pIc0thYzEydUVoZDJicFBZ?=
 =?utf-8?B?amVVd2hxdUdoWTlsNVNJeEJCVjVYSnlQVGZOaFR1NkJsTGR3SmtHUis3UjVO?=
 =?utf-8?B?dEVsUFE2L21ScGt4ZXdIWmJQU0NOQlNIMmRGbndiUXhUNXlueGFERFhSZkVn?=
 =?utf-8?B?c2V3amJVR0JqT0EvMFZoS2JacVd1bzF5Q0Q4ejBjTjZtajdpMndrcURsTXA5?=
 =?utf-8?B?RzV3S2Y0cXN1T3VWZElSdlBKUWdsT1QrRk9OOFhQVVc5c3JjWExsN1Mzdml0?=
 =?utf-8?B?bTIzNkdWSU1ZS3pGTWtqSmxISFYrL1ptbHNJTmZESkNVUHpsdU81bG4vQ0tI?=
 =?utf-8?B?WDFCWnpjZnc4aGsvb2puLzZuZG1ZMDNCVWJCclhFTDI2WnpQQ21SRWFyakMw?=
 =?utf-8?B?U0dVeXc3UVNrQ1d1S2tyZnU1YlMweFM0Y0p1ZmhkVXd6MXVjT0g4OTlPdld1?=
 =?utf-8?B?SE5oRTZySHBTQmQrS0hXcnJXK2lRZmY3aGxkNWlYTFNDb3hjMDhXYjArWUdZ?=
 =?utf-8?B?aWJFOXk5QXl5MU80M3FIb1o4NDlENVMxNHJuS2NoR01IUWg2M1h5VEMreXFR?=
 =?utf-8?B?N2VSSE5jTThtUjJxWGlIUHMzQUxyK3k3dnpUZk5wZ0MvZG5RdU9wMXowbkc2?=
 =?utf-8?B?Zlc4MVFPL3lZbERFaFFqazFCSHI3L3N0akFNOHhpTERmRG1aWUtlWDB6Y3pG?=
 =?utf-8?B?NXBKT3lzWW5UWU16dWlXMG1EV29JVU9sVjZ2eENQOWp5a2x3QzFZRUlGVXk5?=
 =?utf-8?B?U0QzMko2RlVUb0Zuc1hmUHQ5di9LcVRxS3ZUM1RZL3h6UmROaVIwMkw1SGRa?=
 =?utf-8?B?ajdBUVNCY1BoQVNwcGYwNW9MVUJBNVZvaVdWZW5iaU44OXdTZFRKTUp2SWVX?=
 =?utf-8?B?WStiR1puMEhRazZTbHUxOTIvdENZSUVHM3VPcTNMdGo5Y1pVdjJHckQ4QW5z?=
 =?utf-8?B?WWtGcEdTUUdSamJvR2ViRGxrWEJmZkh5Y1dGbCtLYVlQQmRYZkRGbGVqNEVE?=
 =?utf-8?B?Y25XRXVGdjFOSWdESXo1YW9Dem9UdG4yYVZyeTVGN3hqd2lYZUxtYlNkL05L?=
 =?utf-8?B?Wm5MSVFkdkl1SzVGR0gyU2RoaFJ2bXI5d1pQS1hvOW00UXhPNzhRZU9PRW1p?=
 =?utf-8?B?K3grMHRkM1owSlg5T0NpajZoVkJidENuTHR0U082S0hIVXo4c1pETDVPV0Vq?=
 =?utf-8?B?Tm9XVmxJenVlVmVtWWMyU3Y4aHVpWlE3STc3U1pHNUdNOWY2UTQvQ3JxdmRM?=
 =?utf-8?B?OWttTkh0RWgvcUxacVFQNlBPeHpGUWtUNitMN1h3YWFnWUxqU1hYeEROc0g5?=
 =?utf-8?B?ek42UnJONi9ITFVpYm14VExmM0c3ZWVHQitxdTJZT3J0dmZWWU1rR0VveHlm?=
 =?utf-8?B?YmNnSWFKY2Nrc3NlbkJDRHRRYnp2ZndXaWdkTk56QnB5aVJvV2IwNEtRemNU?=
 =?utf-8?B?b2ZiWEhBT3NDMFp1MHhzWG1BVldzSnluWGNUaFdpWVArV2ZWelF3NHVWNk5G?=
 =?utf-8?B?UTBLVWFOUzNpbjhXVEFOZTdBbTg0cWh1U0NydkRWNS9FY3hZV0Q5L0hLdkdk?=
 =?utf-8?B?aXJoY1F0K3l5Um82bnJlVEVLdzJpd2h2UzlldUd5UlBCNEFGSE8wbGE1ZzEx?=
 =?utf-8?B?MVBCMzYzVDBpYmFDbWtoK1V1a3d0eGsrN1h0U3dzRlI2YlRsdlJzUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8CC48DA71E9A4847973F9BCBCC4C846A@EURP189.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a13d6b-b8b7-4530-ba33-08de82ab3871
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2026 15:55:03.1157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a27af4ff-c4b3-4dec-be8d-845345d2ab67
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IbNw+UPbSo2RjkGu5TLPx36cOHd+aqSXl4u1tuO9V+bkJdIz6ToFa80YJt2skLoHTJUBCqwkTNI6kRKAcGU/CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPFB830855DA
X-Spamd-Result: default: False [1.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_DKIM_ALLOW(-0.20)[surban.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34830-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 376FB2914B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8xNS8yNiAxNjoyOCwgQWxhbiBTdGVybiB3cm90ZToNCj4gT24gU3VuLCBNYXIgMTUsIDIw
MjYgYXQgMTE6MjE6MjZBTSAtMDQwMCwgQWxhbiBTdGVybiB3cm90ZToNCj4+IE9uIFN1biwgTWFy
IDE1LCAyMDI2IGF0IDAzOjA2OjIxUE0gKzAwMDAsIFNlYmFzdGlhbiBVcmJhbiB3cm90ZToNCj4+
PiBPbiAzLzE1LzI2IDE1OjQ0LCBBbGFuIFN0ZXJuIHdyb3RlOg0KPj4+PiAJCWlmICh1bmxpa2Vs
eShsZW4gPT0gMCkpDQo+Pj4+IAkJCWlzX3Nob3J0ID0gMTsNCj4+Pj4gCQllbHNlIHsNCj4+Pj4g
CQkJLyogbm90IGVub3VnaCBiYW5kd2lkdGggbGVmdD8gKi8NCj4+Pj4gCQkJaWYgKGxpbWl0IDwg
ZXAtPmVwLm1heHBhY2tldCAmJiBsaW1pdCA8IGxlbikNCj4+Pj4gCQkJCWJyZWFrOw0KPj4+Pg0K
Pj4+PiBJdCBkb2VzIGJyZWFrIG91dCBvZiB0aGUgbG9vcCB3aGVuIHRoZXJlIGlzIG5vdCBlbm91
Z2ggc3BhY2UgcmVtYWluaW5nDQo+Pj4+IGluIHRoZSBiYW5kd2lkdGggYnVkZ2V0IGZvciBhbm90
aGVyIHRyYW5zYWN0aW9uLiAgQnV0IGl0IGRvZXMgc28gYXQgdGhlDQo+Pj4+IHN0YXJ0IG9mIHRo
ZSBpdGVyYXRpb24gZm9sbG93aW5nIHRoZSBsYXN0IGFsbG93ZWQgdHJhbnNmZXIsIHJhdGhlciB0
aGFuDQo+Pj4+IGF0IHRoZSBlbmQgb2YgbGFzdCB0cmFuc2ZlcidzIGl0ZXJhdGlvbiAoYXMgeW91
ciBwYXRjaCBkb2VzKS4NCj4+Pj4NCj4+PiBZb3UncmUgcmlnaHQgdGhhdCB0aGUgZXhpc3Rpbmcg
YmFuZHdpZHRoIGNoZWNrIGF0IGxpbmUgMTQ0NCBoYW5kbGVzIHRoZQ0KPj4+IGdlbmVyYWwgY2Fz
ZSBvZiBhIG5vbi16ZXJvIHJlcXVlc3QgZm9sbG93aW5nIGEgcGFydGlhbCB0cmFuc2Zlci4NCj4+
Pg0KPj4+IEhvd2V2ZXIsIGlmIGEgWkxQIGZvbGxvd3MgYSBwYXJ0aWFsbHktdHJhbnNmZXJyZWQg
cmVxdWVzdCwgdGhlIGNoZWNrIGlzDQo+Pj4gc2tpcHBlZCBiZWNhdXNlIG9mIHRoZSB1bmxpa2Vs
eShsZW4gPT0gMCkgYnJhbmNoLCBsZWFkaW5nIHRvIGEgZmFsc2UNCj4+PiBjb21wbGV0ZSBvZiB0
aGUgdHJhbnNmZXIgd2l0aCBhIHNob3J0ZW5lZCBsZW5ndGguDQo+Pg0KPj4gSG93IGNhbiBhIFpM
UCBmb2xsb3cgYSBwYXJ0aWFsbHkgdHJhbnNmZXJyZWQgcmVxdWVzdD8gIFdoYXQgZm9sbG93cyBh
DQo+PiBwYXJ0aWFsbHkgdHJhbnNmZXJyZWQgcmVxdWVzdCBpcyBhbHdheXMgdGhlIHJlbWFpbmRl
ciBvZiB0aGF0IHJlcXVlc3QsDQo+PiB3aGljaCBieSBkZWZpbml0aW9uIG11c3QgaGF2ZSBsZW5n
dGggPiAwLg0KPiANCj4gT2gsIEkgc2VlIG5vdyB3aGF0IHlvdSBtZWFuLiAgVGhlIHdob2xlIHRo
aW5nIHVzZXMNCj4gbG9vcF9mb3JfZWFjaF9lbnRyeSgpLCBzbyBpdCBhbHdheXMgcHJvY2VlZHMg
dG8gdGhlIG5leHQgcmVxdWVzdCBpbiB0aGUNCj4gcXVldWUgZXZlbiBpZiB0aGUgY3VycmVudCBy
ZXF1ZXN0IGlzbid0IGZpbmlzaGVkLiAgSW5zdGVhZCBvZiBkb2luZw0KPiB0aGF0LCBpdCBzaG91
bGQgYWx3YXlzIGhhbmRsZSB0aGUgZmlyc3QgcmVxdWVzdCBpbiB0aGUgcXVldWUuDQo+IA0KPiBU
aGUgbG9vcCBzaG91bGQgYmUgcmV3cml0dGVuOyBpdCBzaG91bGQgYmUgbW9yZSBsaWtlDQo+IA0K
PiAJd2hpbGUgKCFsaXN0X2VtcHR5KCZlcC0+cXVldWUpKSB7DQo+IAkJcmVxID0gbGlzdF9maXJz
dF9lbnRyeSgmZXAtPnF1ZXVlKTsNCj4gCQkuLi4NCj4gDQo+IFRoZW4gaXQgd291bGQgYmVoYXZl
IGFzIGV4cGVjdGVkLg0KPiANCkkgYWdyZWUgdGhhdCB0aGUgbG9vcCBzaG91bGQgb25seSBldmVy
IHByb2Nlc3MgdGhlIGZpcnN0IG1hdGNoaW5nIGVudHJ5LiANClRoZSBicmVhayBJIGFkZGVkIGF0
IHRoZSBlbmQgb2YgdGhlIGxvb3AgYm9keSBhY2hpZXZlcyBleGFjdGx5IHRoYXQuIA0KICANCiAg
DQoNCg0KSSBrZXB0IGxpc3RfZm9yX2VhY2hfZW50cnkgcmF0aGVyIHRoYW4gcmV3cml0aW5nIHRv
IHdoaWxlICsgDQpsaXN0X2ZpcnN0X2VudHJ5IGJlY2F1c2UgdGhlIHN0cmVhbSBJRCBmaWx0ZXJp
bmcgYXQgbGluZSAxNDIxIHVzZXMgDQpjb250aW51ZSB0byBza2lwIG5vbi1tYXRjaGluZyByZXF1
ZXN0czoNCg0KICAgICAgIGlmIChkdW1teV9lcF9zdHJlYW1fZW4oZHVtX2hjZCwgdXJiKSkgew0K
ICAgICAgICAgICBpZiAoKHVyYi0+c3RyZWFtX2lkICE9IHJlcS0+cmVxLnN0cmVhbV9pZCkpDQog
ICAgICAgICAgICAgICBjb250aW51ZTsNCiAgICAgICB9DQoNClRoaXMgd291bGRuJ3Qgd29yayB3
aXRoIGxpc3RfZmlyc3RfZW50cnkuIEEgc3RydWN0dXJhbCByZXdyaXRlIHdvdWxkIA0KbmVlZCBh
IHNlcGFyYXRlIHNjYW4gdG8gZmluZCB0aGUgZmlyc3QgbWF0Y2hpbmcgcmVxdWVzdCwgd2hpY2gg
c2VlbXMgDQpyaXNreSBmb3IgYSBidWcgZml4LiBJZiB5b3UnZCBwcmVmZXIgdGhhdCBhcHByb2Fj
aCBJJ20gaGFwcHkgdG8gZG8gaXQgYXMgDQphIGZvbGxvdy11cCBwYXRjaC4NCg0KU2ViYXN0aWFu
DQoNCg==

