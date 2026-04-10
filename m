Return-Path: <linux-usb+bounces-36136-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOHwA7jj2GnHjAgAu9opvQ
	(envelope-from <linux-usb+bounces-36136-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 13:49:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBEF3D65A7
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 13:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D39B3031CD6
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 11:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2898E3B7B98;
	Fri, 10 Apr 2026 11:44:25 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2100.outbound.protection.partner.outlook.cn [139.219.17.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F16312832;
	Fri, 10 Apr 2026 11:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775821464; cv=fail; b=F2LjOuGv+e1C4I4SkbPP6hUlbS03xXNVCgb7SoRvumRoyUIxx6aV7ut2r9MDtIEPI6lqxgxUlA3v86Ui0Q7YrG3a2L9M1tsGrat52zXlcD5tQQn5PbqlpTh4OO5bCTqSvnCvfxxXNwn1o+NDU0Bnw8WZA8rttrxGmCBZaAfelek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775821464; c=relaxed/simple;
	bh=0Iommhc7s48M2UIahn6thS7osufhNJgSPFiwvD8et1Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lK6RmMYUseeabgl4NC4AlQaR/mO127SOJhD5sSwZtoIr6Srg1JCEiWflpG7sNWa0BIEpkv3SLzRd2F0R1BiJwrOisA4p1onlPRIDG+GychnATotWkuhByv7B1byg8f+Oj+TSw3T3NraC3P278iFcdTPOaON/7UW5jYGIGhyT9E0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEJmiNA3h9vdl5OOnWBvwVB8ma4DgEwFfVo7Y69UjiXf7KnPpouZ8Sb+e1ncjePROgeFIWNCLEzJmomhTVCn02IG9MFtlU+4O29/aN0Q5npV95LQIirgs36+XsIF6638CP48k3CrHhZ99RBtv/nU9hbR+o0X1W7TlUtmQJKjZGlCrbWD33NE72BrYvIwuJ+4BPcQVt0jA4P4vmGfgW+raGCuTFGLAvV0Gl7oPA8BfZ3L1IxqAjQNOs6aRnrK48+f2dxYaVud/9i1LINR4K4+YXyNDb9SF3suzQOAXooWaD0CmFGKVXl6R1vCR0WXufA60/5k5ii4MRCLA+ahdPxFXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Iommhc7s48M2UIahn6thS7osufhNJgSPFiwvD8et1Y=;
 b=N/sCwidT+GtbBpV7QBW10Bwc+mGx5GfRmnSKEFc3XHeOAQ/p1Hb7/zocSdxwoH/Lcxj78bsZDLVlkask3HWnAw8L09zEZPn74k+ugUAG16xTrGAtyxdA4xD6IUHNDdwxRd2DVNm8IBZ1QTrQlMaNwbYkMDTMex06MUs1EXakAdPm/45SkwkN4Q33nmGL46PoFYpoerZ6Qu+16I/nZQpQjbNveo73u25i+p1F8fpmWPvsaS/Ttnqp0DB2I8PTfSqn0D5yX5dMy3ulZWqdLZhuf6l0sNLkHQgA9W9LU0WsB8IKBPQSJ2zZuHtPAkfg8ROvT753BSYAUTVlnHLecsqquQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0573.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.42; Fri, 10 Apr
 2026 11:28:31 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%6])
 with mapi id 15.20.9723.018; Fri, 10 Apr 2026 11:28:31 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Conor Dooley <conor@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: dwc3: add support for StarFive
 JHB100
Thread-Topic: [PATCH v1 1/2] dt-bindings: usb: dwc3: add support for StarFive
 JHB100
Thread-Index: AQHcyAljByRVcrc3I0ydToR7hyWek7XW3XUAgAFMyJA=
Date: Fri, 10 Apr 2026 11:28:31 +0000
Message-ID:
 <SHXPR01MB08631832A55ABCB54FE77273E6592@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
References: <20260409101227.39417-1-minda.chen@starfivetech.com>
 <20260409101227.39417-2-minda.chen@starfivetech.com>
 <20260409-perish-speckled-1da7daabca31@spud>
In-Reply-To: <20260409-perish-speckled-1da7daabca31@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0863:EE_|SHXPR01MB0573:EE_
x-ms-office365-filtering-correlation-id: 572ec0a7-c313-4e3d-eee9-08de96f44ba4
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 bfUwj0p4Z32kmUKL9ZoHDictQYcUKM5ZjupRwDmd2rueFRwixnwK/I4BB51Q0MA1Jp5Cs+/jIjoJIy3Bd3cYyXcKQNeyxIH3JqvlFfDzSoTFzOBp+pnmWJSZvK2EHMuYEAXY2KXX5amrEqZeAwihb5EIUbalV5mTbw/jOHf4gRap14oILoaQRK7MlbsNtgLEfTT353lp0AdR0+KkhaP9UqVz532Sca3m2n6XBIA4nGxRI0FJfyaWzu9w4c5gvI32T30GaUGgyX7ZwxHHpLUUdRjltNyXLr5HOXCbe5Pl7rII27mjwBQ6514IeGg8kDh3XJVX/oAJZS72h4KUEmVMArrVKF4VxboVxDkPnc62iP07aJGCIS6Ed+lh0i7g/UT9bOwtL6KwnXa9vtGP7YKFy44AO/X3afmhr6zZxX5aozsizo2lDLbivqXR6Izjs7QGE0IhyDvuBo2LjXzBRpiwcNONV4i8zdSa9fsOEErUqf83MQ2Znn7mbC0b5nGnvaydHj3ggd1ITucdDe9M6DoZyI6nxGGyGLxJx9E+AwUxPDsCyVom1qWUfhFNQCG0FqMW+LmuZrH5/I4Suz5g75XjhSFyuZg69r5IaO1LAFu2nNM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?K2VIZVRhbE9aR0lyZjRLUXFMazR3RGZKbmlGT01aaFpFVHVGa3ByMFlUeW9u?=
 =?gb2312?B?Z1YvSnl1U2tzZzBBK2NUL2tHOEtqbXBMZlBUdkZUYjcrMVJQcXZVVUhta3kv?=
 =?gb2312?B?MU8rUW9jeFB5M0VlZnhQK3NTM0s1UzQ0VlN5Z2x4VnF4LzhkR0xnbTYwcHFU?=
 =?gb2312?B?bW1ua29UU2U1MVYybE1QVXpvM2dydVRXZWFOSDdBZllqeElreW1rbDFyWkVF?=
 =?gb2312?B?bVVyWUpFa2Vhem91c1ZsS2dxWCtydHNGOGhCOWVwRTlodHRmNG93NU5xUEx5?=
 =?gb2312?B?a0hoQm45V1QxdlNXZ2xWLzV4eWdjUGNNb3dreS9zekx2VVM2M3k3eVhreXhI?=
 =?gb2312?B?YnBjaFBEN3ZEMWVjVXNrc1R3elR0KzJ1enU0MHE5Wk1YdFBLZ3p1SzlJWlU2?=
 =?gb2312?B?eUdLTnQ4Z2NreTdUZ0JLMW5oVVBQY3Z3RU92MytRU2tXRG92TlJaa1JjRjdr?=
 =?gb2312?B?SVhRWGpuSVZwRjVnQ1pMdURzU0x3QVJMN3RxMGlpeDZ1YU1sYTVqOVJ6bnla?=
 =?gb2312?B?M3pCbGZvVWdXZjI1YWlPYk9keVBSUEpxMDJNakR3YXdGcG13dzRBaGNXQ2Iy?=
 =?gb2312?B?OStsTXFjaTViVUNSQmNjeHVuenhTODJwdHE5Ylh1YTVPZ1VXTmxUMWxWbU1Y?=
 =?gb2312?B?aXRIQnpVOWxBekpDNlZrTVlrWlBTZmxBVFNzRnZmWWJyekRNc0VSNzBHUHl0?=
 =?gb2312?B?MWdiOFVzaXBtYmc0Zmp4V0xnWlRsa0p4bXAzUHE1YTRzN0FzaG0vQVdvV0dk?=
 =?gb2312?B?MmtIOVBwLyt4TytXTUZnb2VOdCtXSjV0akZnRlhIUmNzWHkxWGpwS0t5Ykc2?=
 =?gb2312?B?THFUV0orT2hsamZDMkpXenQ3cmtIdnowYlE5VDJPdGVRRFIrOTZQTGZadmRk?=
 =?gb2312?B?elBNdElrTVpUdWE5MklFWHBaSGFVZUVhUDNUb2lXZFZmSDZ0Vm9mU2VVUEQ1?=
 =?gb2312?B?dDdydHlzNElzeFd0WXhSMXltZEhBNkZxNFMyN2FGUFU1SVNWSlF2T1pndC82?=
 =?gb2312?B?L2ZMTnBRWGErdnhtS1NPbGNZZFhhMUVVSjYxUUhSQi8rWmRxMGRGT3FiOVRo?=
 =?gb2312?B?b3lCSzk3VkltbmNmUG8ydlM2OGZnZVZ3Q25BdFRwUFhGQ1hnMXhrem9oaFZX?=
 =?gb2312?B?UVl1bElRR2NoZkdCbGF2L2JidlUvNTJvZ0xzRUJTdmhXam9wZ3A1QWkvVWJq?=
 =?gb2312?B?WTZOMk9kVUtBMTJtT1k0ZU0rTXlUMkZ3eTRxb1huRVpXdC9hR1JTbCtSRk1p?=
 =?gb2312?B?M1dla29SNmsxUVdjU1ZFbWhtWHI2WVV2U2ZxOEYvU0JBN29OUENxNlVPakJt?=
 =?gb2312?B?QlpZNWkxTjJ2TnA2NEV0TXJSNnRDOXFWNzlxY0JMN2Q2Y0Y0OEpFd3hMVjNW?=
 =?gb2312?B?dENOd05ETUtVRkpVb0NGTFA5MnNtOGtLRGJXUExzRmF0NUJJeUoxd2V3WlNx?=
 =?gb2312?B?SHNSME1PM0FzQmt1alFHckViQVFlNmdJSENZcnlXME5taVBJUEEvYU12cTlB?=
 =?gb2312?B?SkUycVdrN2oxWmlDWjFJTEg3V0V2YUJ5QS9oMnFyRjZnYnA4dzZwTFNzL0Zi?=
 =?gb2312?B?TUdvcFh2N05acTRkQXZtMVk4d3RPWmZXTEMvYjlGa1dPVWx5VUFDSmlReGtC?=
 =?gb2312?B?cEVhYTZMTEwrS29vbWJKV1Z3Q3ZzY3VuOVNRdEZsMnhYdGZqOTRzbEN3eHhi?=
 =?gb2312?B?K0tnamo0M2hqMTI3NDlBRDRGeVpSc2ZOQnhiT1BpaXpMTmEreUZYM2JuOW5Q?=
 =?gb2312?B?Z2lkQnRHdkRuVys3em55WEVRNmhIem13d29uVFBHV1UrbWVUOHR4TFBIV1Q5?=
 =?gb2312?B?M2JSY3FabFlYVDNCRnpHc3pwVkhiS2h4Yi9YcW1xN2lVdjFGR3FLUVhSV0dX?=
 =?gb2312?B?TGtlaGdrb2NMRnVVZlpKMmVnK2VtTWNtSk9YNVhDaVozQnl2dHJKM1orTmJ4?=
 =?gb2312?B?Q0hHazVyQXRYelhSVU50a3FxMmNKaGRtMmc4STNNTGdYVmhwTUF0UWhrQVgx?=
 =?gb2312?B?ekN6UzkrcmhOSWl3NXpERHhmR21YUHE5ZXdXc0c1TU1QaTlvQ3BlTkRQWlg2?=
 =?gb2312?B?WlZJckI4dk5nSUcwWXk1TktFbmZqaXd6SVlRdktKeEJnQjZaelJqNDNYemxj?=
 =?gb2312?B?ejI1R2RVK2oxdnhjSThDSWl5S0NXZ3lIWEZvVDdaQWxRN0RTWmlGUnJ2MzQ3?=
 =?gb2312?B?bXRBZ1czWnhDSU9sTlhaM2RXTG1pNk0vV25QQWpjN296YjN0V0krZEIrTzJs?=
 =?gb2312?B?NzZFdzh2bnY3d1dYZGR6UWpGYWVkTWNjRnkzU3J0RlNWYUd3NFZHVFM1OUsz?=
 =?gb2312?B?TlJQNnBlYmZDaGxGTzVQWEd5TUVKVzFVZ21MZHgzclBKbmlUNFhEQT09?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 572ec0a7-c313-4e3d-eee9-08de96f44ba4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2026 11:28:31.7687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 05Cg1j9WAbj1kGIks8yeAZ3CzukegHbsYj6uYYGz0seApnT94gmjy+4Tfm9MoXxmtlSxd9yfitdmeHZhYE87IT+jl4UeLgM6QcDa4Zz7YLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0573
X-Spamd-Result: default: False [3.64 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36136-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: 4FBEF3D65A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCj4g1vfM4jogUmU6IFtQQVRDSCB2MSAxLzJdIGR0LWJpbmRpbmdzOiB1c2I6IGR3YzM6IGFk
ZCBzdXBwb3J0IGZvciBTdGFyRml2ZSBKSEIxMDANCj4gDQo+IEFja2VkLWJ5OiBDb25vciBEb29s
ZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPiBwdy1ib3Q6IG5vdC1hcHBsaWNhYmxl
DQoNClRoYW5rcyBDb25vcg0KDQpIaSBUaGluaA0KICAgQ291bGQgeW91IHJldmlldyBwYXRjaDI/
IEp1c3QgYWRkIGEgY29tcGF0aWJsZSB0byBnZW5lcmljIHBsYXRmb3JtIGRyaXZlci4gVGhhbmtz
DQoNCkhpIEdyZWcNCiAgIENhbiB0aGlzIHBhdGNoLXNldCBiZSBtZXJnZWQgaW4gdjcuMT8gVGhh
bmtzDQo=

