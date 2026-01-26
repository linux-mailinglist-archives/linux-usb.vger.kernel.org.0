Return-Path: <linux-usb+bounces-32739-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CE9JKMCGd2m9hgEAu9opvQ
	(envelope-from <linux-usb+bounces-32739-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 16:22:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B24F68A129
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 16:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 547DB300B280
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 15:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45F833EAEC;
	Mon, 26 Jan 2026 15:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="pVUeVCAU"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020087.outbound.protection.outlook.com [52.101.84.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EB633C1BD;
	Mon, 26 Jan 2026 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769440928; cv=fail; b=uku6BuKr8tEGUPTC0Ti9bJCIPszuRRBL5BMhAvEZU7dTJiSrKpy6OMu+ws6HAZPfqZGQM1t8hQ/lpCmRVjS+6Yn9+KJuMAz8F9LyC/jJfv3nA1AwYIodwWI7xHAmT5cwTPTor4NWc54lyPzgPQRBPP/FakyJ+vIHt+hjbsZY/zE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769440928; c=relaxed/simple;
	bh=Cf0G4K3NZkOKfzgyfaSajvk70Dz19i3N+dSBs7OnZyo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BXm1e65uOS3/hYEKdWR7+EbgAxHEJ2ZMnH3f8piSgsTz4zngBCzv+rOb9L5aJFFbUBr8h5TIi9IVkuH2SIHUlcuFrNLrFaVhAIyAcpnINmVngDoT0pOUd1LCAB0wx6F1EiQnGxmd3gNErZA1pO+q2qWWukAThbql8RjFp5fQq/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=pVUeVCAU; arc=fail smtp.client-ip=52.101.84.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/SZyJX+Z7RNJ+O23cp5jhyHlUa7jdQFLlcU8X8Bo+w0s/qgW7Rh01a/cd0Tt10LwQI4SpF2OWi9wzd3t8LI6GZZoGYe+SlkTmmbX8UkcTD3Gy5ik426FARP5hAG8kUo3gCQLxlLKUkBoRQEk6pFsDTRMtLW1ndbcMXTmjQHwbTNsbkq98H2pwR5tVFKEQhhctxavmtJ31fHNvRPcqjIRGWh9DyK/qomtSnfE4BK3RuGGGE+jEQOTpbaXJG0LkQNC2Lp3lYbX9cTpgxz8LZD0gyvjdJgM7lP/u2voJZ6M1ds1otsl+4Da3DYEazSCXGSft8mvvKWKskuZo4Jwr8qFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cf0G4K3NZkOKfzgyfaSajvk70Dz19i3N+dSBs7OnZyo=;
 b=a/zl7M8rx3TbuWygjwEViit2leKmd/T0MCsBC3NC35bXYLRhO34D9637ywQuVff/h6cbPVruH8C9SAz22WWYPDRJMEoc110MFrWlg5lMDBlDQTwK2NNzPQmpNFns4j8XQPGLSC2e6qisuit6yCgnRLQl1zEoq5VIWBj3FLJH9+f7L7l0vGldUcdJnQjwg0Uadrx1l8GlmGTSXQrs/ZLeRrmfTgFBk1Ao2IRU3SQYf79vc1BtLu82vfBmhWA5HZogBB+v8i1Cr5gv7rxmsqsO53gL0uDMZ7+83dLUoBE+QYN0a2i1/QNcvvqESaVwZ3WLsM4frdg/7O5IYy65JUPz9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cf0G4K3NZkOKfzgyfaSajvk70Dz19i3N+dSBs7OnZyo=;
 b=pVUeVCAU3/zm30H/Gqve+HESg2hudCOvQylDvAxjsTVV1yMwOooehQXRPom2To7YQMU6t0GEE+88t/NW7W8NlBe6EW6EREQFLlkzfCZmAez9vXJmJ69wHpIOKBcPGBhN0vshK61Q4NqgQryPxc1ZoT6PbMN+o3CiqRQKwnz8VAaBS0w45vJeUrkP89Y96IcU9eHunGJySAfbdbtyvMXmM+MbBUJ2Ms1Pks83yAhhiYBDeeoTknNGLd/TF5MMtZVBZYPH400+7akQGiKkJr/9Mmv6XyfGgBOyk4CzbE6FgX31Z3RInJo9SqUdiOomMcdEZ2L7ITr5W28KNc+JICylWA==
Received: from DU0P195MB2325.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:425::22)
 by DU0P195MB2253.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:419::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 15:22:01 +0000
Received: from DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
 ([fe80::a5a9:5513:e1a:f50f]) by DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
 ([fe80::a5a9:5513:e1a:f50f%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 15:22:01 +0000
From: Jan Remmet <J.Remmet@phytec.de>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [PATCH] usb: typec: hd3ss3220: Check if regulator needs to be
 switched
Thread-Topic: [PATCH] usb: typec: hd3ss3220: Check if regulator needs to be
 switched
Thread-Index: AQHcjtC7nuacumOGTkiDqR7gmT+FWLVkkWeA
Date: Mon, 26 Jan 2026 15:22:01 +0000
Message-ID: <1c36ebc4-9a37-4e88-a39f-e6472c0df11b@phytec.de>
References:
 <20260126-wip-jremmet-hd3ss3220_vbus_split-v1-1-b2f946f1a4ae@phytec.de>
 <aXd7EN9KAmtEHODq@kuha>
In-Reply-To: <aXd7EN9KAmtEHODq@kuha>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P195MB2325:EE_|DU0P195MB2253:EE_
x-ms-office365-filtering-correlation-id: 9175f1c0-681d-4d25-6939-08de5ceea7a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UWdrUkFNUzd4WnhnUmZlTTN1OW5mcmNIRldJOG5abkhNZTEzaDRDOHZmbWJW?=
 =?utf-8?B?M3RFLzJBdVpiVFkvL0lBNEJ6b2RhU0txU05iOHorMVlVTlovNTNZYTRtQnho?=
 =?utf-8?B?dTNwNThsT2o2S2crdVNoaE80dEFYOU95VTUxOXFqK0JXaHZrMnZNUHIxdzh6?=
 =?utf-8?B?azFkSGtLNnh2OEFUNUkyV2pCMlN6K1U1aURneFU3aU83b04vSVhna2hMcGJ0?=
 =?utf-8?B?N1pHK21iTzJXb1grcG8rZWhiUFFCcXZYT0VYZ2FOR2hoMWp5Rzdwck5jcnBL?=
 =?utf-8?B?d1BMNXVJNkkrOU1UeWZzMHlVUVk1NXAvWFUxaXNmTm9INjRoVkRpVFgzNnpl?=
 =?utf-8?B?YXRibGVVdStpS1VQdVBUZ0w1VmRZdmMrRjFacTE5TFN3dllLZEh1VjI2V1h6?=
 =?utf-8?B?UlY1ekd6WUlsVXVCTFVFVjJIWFA4R1lHSnhmQUY0ZmRwaUU1VmtXbGFLY29y?=
 =?utf-8?B?bHR4QzZNUW1YbDhiQUlTbTRERHVYSjBJNWtiVXRlSGtrZGEwaWVmdUY4bGRj?=
 =?utf-8?B?YjczS3Z3OXVLRUxpK0tWVGtrRWdQLzJPME9DVTJobUsrdWdQOEx2Y1lQSVMy?=
 =?utf-8?B?Rm8rb3NMWHpsTFhoaDFmd1QrcThBLythcld5dGNjK3BRUS9oalM1MXZiQ2hR?=
 =?utf-8?B?NUpUTTJjVXh1NDNMSVoxczNoRXppUlkyYUExT0ZtbGp6U21FVkVOeTZXdzg0?=
 =?utf-8?B?WjdlWVRMUGZyMHAvdW5EWDQva3BXRVNUWGFWWmNsSVNxcEFhKzl0NjlzUGRm?=
 =?utf-8?B?V0xkRERQODZrZ250SFVUaUFRaU5IbGVQUVhjc3NySE1DNmY3cWI2cWEwSjUv?=
 =?utf-8?B?RlZRWVVFNDI1VEVDdzJJbEtUNDRNTjZNR0xIQ3Q0TXY3QkdObE53THFOM3c4?=
 =?utf-8?B?UHdnVnIvUmZVMGZVWlU3YjBXTXlJeDU3VE14N3ZBVDZmY1NMbE9XM01BM3NL?=
 =?utf-8?B?alhBS0xCQXZya3Zjb3JaU3ppNGRpZ3VxMGI1bkFhVjVIdk5RSUJqVm9ra0dC?=
 =?utf-8?B?Y0IxU0J4ZVBPbTVKbXZQQ0ZDdlh5RjVSVjA4RVZJUTZRMEpuWVY3VWpWcnN4?=
 =?utf-8?B?cnhyM3llRGs2bWE3em5KOHd2ek9vOG95U0lGMVZCWDlCL2tvTG50dlFPTXdU?=
 =?utf-8?B?VjBkNERoRVJ4OCtVK3gyUEtZYi9lR2pMZnJ1SG1uMVp3eWxWSDNMWkI2UGd6?=
 =?utf-8?B?aWpibVRpWmVzYTBBMjdNMU1QQW9uMEMxTkxKN1NsOVc2cDZPS3d1SVpFam5n?=
 =?utf-8?B?VmJIRzJtdFNZalRWNlJtVkZGQXlCK1AvcFAvR1J0TE1QbmIxdTVtTXVPMC9q?=
 =?utf-8?B?aHMydGRGNXpUUW9KTGl6c0pYQi9nOHZjcUs2UDZvVzZHVDU4MEt2WEdIMjhD?=
 =?utf-8?B?TW04RXRlZCtCdWpZdlZaSlBjVno5a01BUkduTXV1MFlFMFg0TXBKZ2EyMmJW?=
 =?utf-8?B?MTV0M0xHZklZaDBuYUhlM3BUdml3bHBiUEY5Z3BZTDZ2bmprc0cweVhESDRH?=
 =?utf-8?B?aFVZYkxPb2dhd3kwU3hTd28xOWFldW1zV1F4d3FSN1p3Rkp6QWRWQktua01v?=
 =?utf-8?B?Z21uek9Ba0IzNWlPazA4akZiSHdkYnhrSTFnS3BmTVNnMXlURUdPdGJXZy9N?=
 =?utf-8?B?NlAzWnN5UklkVUNGQ1djY2k3UE4yNmpFdG5weC92NExvRlhBQ1dwQm5Oc1Vl?=
 =?utf-8?B?YkFKVkI0U0VtTGpPaWRKQzgxUnFJMTZNR0RwK1JEUlRTdGNCTVNHR0FoVnAr?=
 =?utf-8?B?VTJ2RGhnRnU3ZUJaZXpPU25HL1BSYWx5aVdrZyt4RlhCRHF6ZDAxSnNJZnhG?=
 =?utf-8?B?Zlp4N1VqQVRzb09EbzB2TUF3VjhEMWVWaDZibW1hMXN1TVVsR21UdGtCYWdR?=
 =?utf-8?B?RVlRVHNpQ08vOElwZEVkUGdPeWlkOVJHR09aVVRvTnpwa0RsT3B4ZGJmNngr?=
 =?utf-8?B?bHdTS294cFh0cmhGWVlnTnBwcUJTaEhFQzd6L1Y3NXZJQWRvUFN4SjJXeGd2?=
 =?utf-8?B?c3hnOHp6TWdTZUtUbkNWQXo3YmNZMmlEOG80WEp5bmFtdU1YSXNadFZISERo?=
 =?utf-8?B?UDl2NysrcjJ0d3dWZ1VVTlNKMXk3MEw1OGN5eVVjdFcwYVUvSGF6LzhOT3pI?=
 =?utf-8?Q?qryRzD2TtH0JmDJV65OIbIwTJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P195MB2325.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UFJkSmluaDJKeTN3QkxOeHpKQlZOUnA0bURqVTBzMzJCeDdyOUkvSG1vL0dz?=
 =?utf-8?B?UmxHL1BhbCtwMlh5S0tJMHV5K1VSSnNBME0zSjlMaUtBYzhzcGdzQnRQSGo2?=
 =?utf-8?B?T1M1V0xKTVY0c0FmYXBQcFcwWFVJSmZ2VDlSOUtuQ3AxRHovblF4WFgzR1Y5?=
 =?utf-8?B?cGVqcjhuZGtORjFxbHhMUjlTRFg3WjRzbjhUZ0hOQ255M2JZVngrSy9tanM2?=
 =?utf-8?B?TmVTbDZ0L2llZVhXSDlIR3B2WDVSY2VuM0RhNWswL2ZTTW1MdEVjRW1QaThy?=
 =?utf-8?B?ZWo1R3RrQ3NvSU1pVUR0djBxNThXYWR1bnl2b1B2R1dDelJlS3o5M1hZQ0t6?=
 =?utf-8?B?QVE1eFd2blZhdHdIUU9Qdnl0VDRxL2ZFQ2ZtVFQ5MTkwZ0g1c2lDRlZpYWtl?=
 =?utf-8?B?TzU3Z1JUREhjNUl1dG9UWGk1Q0F0a3l4Y1hNRHhUUTV6dmVHN2o0Sm5OSFdy?=
 =?utf-8?B?N1hBUVhXam5rcnhBOVRZSkZEMVREMmdQTWNNN3JhRVdUTi9rSVJua3ZBQTdQ?=
 =?utf-8?B?RG9teGI2VVhpLytZU3Z6c0swd1JaNzdtV3pFM0ZzT08vdFJDMjF6SFFnWmdY?=
 =?utf-8?B?eCswcDBYOTN0Tk12aGFFOU5VRGFFeFp1N1VFR3Y0TEw4YXByMk9SSmdaSmxk?=
 =?utf-8?B?T0dVa3J1MVJQUktTRmJGbTNlaWlRZU5BVFFteXNnRXdQdHE1aVV6Y3dxazUx?=
 =?utf-8?B?N1IyaDNSL3JGS0RuUC95R2NDTjVVMllSazdLN0NXd2I0NXQ0Z1pvU2FPTlUw?=
 =?utf-8?B?VlIwak1PNGd0Ty9HM3RCbXN1K2J4MlNsMFppNG1yeHk2em9tNEVZNjdJd3Rp?=
 =?utf-8?B?K1FvZ2l4bHZUWEt2ZTFmdlFOb05IdTdLeXZZNlBtaTNDN3YwOHg2SnpoeEE2?=
 =?utf-8?B?Ymt0dldybVB6K094d2RaQW5RZGNyRGZWanJDTEJaemM4MUtLbk45OS83SDll?=
 =?utf-8?B?NFVheWRVdUVCMUZlUEpsU1oxZzZZMjBFVlRYVmJSQ2JJYUdyMm9EdW43TnAz?=
 =?utf-8?B?NjFYcDBSb1NEdzVaOTdqZWEyejFhSkV3VmtJUGw0S0dCVmttMHc0M3docTZY?=
 =?utf-8?B?QmducERKQ3RhMHpneTZUM0NSWUwxWGFCZGp5a3dieVdWZ09QWk95dkt6akF6?=
 =?utf-8?B?UWlqejBjRVFpUmlFc1VvS0JZNFFrMjhJY0FMQ0lCMlNIbUl1aXhPWFM5L2VD?=
 =?utf-8?B?T2lOaE9Yc2ZzdVJlU28vVm91clBzWWZhODBXRVlOa3FOV21EMDRsNFBhSk4r?=
 =?utf-8?B?a0U5RlNBU0R2U0ZaMnRrZ0d2SG5vaEtRWjU2RWhWWjdzbnMzUVVwaXhoaG9m?=
 =?utf-8?B?Rzdsb3ExV2ZpSEkrWWdmWUFBd3JQYkhlbmNKUTZYaFllWVU3OUplVEVCZW95?=
 =?utf-8?B?SnFlaTAvVGFRMFJRRlpNN3hIcjBrdkh4REpveElsOUlGMHlFeitocGRZMlZV?=
 =?utf-8?B?SXBaZEwxZ09tOGt1TkEwekJMMGlTWmVzeFhnMFA5clp0K2ZIQjdhNFVCZlhF?=
 =?utf-8?B?S1lYZldxbjlheWhXRVdYbHpQMlFCanIrTUFrd2ZJU3hWQ2I4c3BFYUhramFC?=
 =?utf-8?B?ZXp5Lzc2MVY4RzRlYS94L0tPeUQ0RVhEUGtmdXg4U3BObkVLb2hHamtYR0U1?=
 =?utf-8?B?M1hwMXJ1cFJBT3pWZlI1alhqMEo5R0prMzRtdEl1YmIxVzFwalJMYUFmQWtu?=
 =?utf-8?B?b21NSjNZRDhMamxLOTNwUkV5U3c3eVFMR3AzZ0tJdmhDOTJuaVVJVjFSeHYw?=
 =?utf-8?B?Vjg1Yk1PUXVJOFg3NEZzZ1RKNWZmSlVBWWJudUdhOWVDRUNSbHdIZEo5QVUx?=
 =?utf-8?B?d2prUldmOEFKTyt1RklvQlZOUldaV3owLy9JOEl0SWRkVXhZRlU4MFdmN3lt?=
 =?utf-8?B?aTlaRHZZY3Q1dTZ2Zi9yd1h3aFlSMDBFaUJsK21uOHJOVG9wYnpWUDNZdUJI?=
 =?utf-8?B?emFKS2ExM2ZVRzNJdlVWOVgxbCtUc2hCczB5NGswYXZOYUd0aXpLN29ZZFI4?=
 =?utf-8?B?N1JTa3NkWHJUZU9lZzNOakg4TXhFNmEzTlhnUU0rS0FoWm13QjEwM01mem5V?=
 =?utf-8?B?NFpTSFJyUGJZOTlnYUxtVnhsNlNJSFNKTHZCeGFubk9jb0Z3SVhld25tb2p3?=
 =?utf-8?B?eTdLUVh5TzNWU2VNdXduMXFkeEkxY1k2TkpiZTFRMHpnNVZGVEY5SkVGQmhR?=
 =?utf-8?B?YVNpd3c2VlEwcmpPbHpHczJ6SkxHeHN6L3pIWlhyVGxqdXMzT3FyU290ak8w?=
 =?utf-8?B?YXV5Yll6dVNOUlZ1WHNtSW9iZmk3bUhnM1BnelRZSGRVdW9wa1lIeHkvWXcx?=
 =?utf-8?B?M3l1MXJCcGw5M3BkNlowanBKbk9kdHFEemlQbDdjVkZCYWJsMGZ4Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CE59CAAD3CCAF4F9450E4BCB4B54C3B@EURP195.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9175f1c0-681d-4d25-6939-08de5ceea7a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2026 15:22:01.7119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kWLsA+0NtsjX17PGsiBTseMJuVlpr0LfKr8iwyCsGr6OyKg84c4q3ZuuXQvLjGytrgybnKbL5HQWdGUTqT3P7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB2253
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[phytec.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[phytec.de:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32739-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pyhtec.de:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B24F68A129
X-Rspamd-Action: no action

QW0gMjYuMDEuMjYgdW0gMTU6MzIgc2NocmllYiBIZWlra2kgS3JvZ2VydXM6DQo+IE1vbiwgSmFu
IDI2LCAyMDI2IGF0IDAxOjA2OjM2UE0gKzAxMDAsIEphbiBSZW1tZXQga2lyam9pdHRpOg0KPj4g
Q2hlY2sgcmVndWxhdG9yIHN0YXRlIGFzIHBlcmlwaGVyYWwgYW5kIGRldGFjaCBjYW4gZGlzYWJs
ZSB2YnVzLg0KPj4gV2l0aG91dCB0aGlzIGNoZWNrIHdlIHdpbGwgdHJ5IHRvIGRpc2FibGUgdGhl
IHJlZ3VsYXRvciB0d2ljZSBpZg0KPj4gd2UgZGlzY29ubmVjdCBob3N0IGFuZCB0aGVuIGNvbm5l
Y3QgYXMgZGV2aWNlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEphbiBSZW1tZXQgPGoucmVtbWV0
QHBoeXRlYy5kZT4NCj4+IC0tLQ0KPj4gVGhpcyBpcyBhIGZpeHVwIGZyb20NCj4+IC0gTGluayB0
byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDExNS13aXAtanJlbW1ldC1oZDNz
czMyMjBfdmJ1cy12MS0xLWI3ZDlhZGZiZTM0NkBwaHl0ZWMuZGUNCj4+IFRvDQo+PiAtIExpbmsg
dG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjAxMjMtd2lwLWpyZW1tZXQtaGQz
c3MzMjIwX3ZidXMtdjItMS1iY2FkMzEzY2U5MmJAcGh5dGVjLmRlDQo+IA0KPiBJIGRvbid0IHVu
ZGVyc3RhbmQgdGhhdCwgYnV0IEkgdGhpbmsgeW91IGFyZSBmaXhpbmcgYSBjb21taXQgaW4gR3Jl
ZydzDQo+IHRyZWUsIHJpZ2h0Pw0KWWVzDQo+IA0KPiBJZiB0aGF0J3MgdGhlIGNhc2UsIHRoZW4g
eW91IG5lZWQgdGhlIEZpeGVzIHRhZy4NCg0KU29ycnksIEknbSBub3QgZmFtaWxhciB3aXRoIHRo
ZSB3b3JrZmxvdyBoZXJlLiBTaG91bGQgaXQgYmUgYSAiLS1maXh1cCIgDQpnaXQgY29tbWl0IGFn
YWluc3QgdGhlIHVzYi1uZXh0IGNvbW1pdCBpZD8NCg0KT3INCkZpeGVzOiA3ZTcwMjU4MTE1Nzkg
KCJ1c2I6IHR5cGVjOiBoZDNzczMyMjA6IENoZWNrIGlmIHJlZ3VsYXRvciBuZWVkcyB0byANCmJl
IHN3aXRjaGVkIikNCg0KSW4gdGhlIGNvbW1pdCBtZXNzYWdlIChhZ2FpbiB3aXRoIGNvbW1pdCBz
aGEgZnJvbSBHcmVnJ3MgdXNiLW5leHQNCg0KSmFuDQoNCj4gDQo+IHRoYW5rcywNCj4gDQo+PiAt
LS0NCj4+ICAgZHJpdmVycy91c2IvdHlwZWMvaGQzc3MzMjIwLmMgfCAzICsrKw0KPj4gICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dXNiL3R5cGVjL2hkM3NzMzIyMC5jIGIvZHJpdmVycy91c2IvdHlwZWMvaGQzc3MzMjIwLmMNCj4+
IGluZGV4IGE3YzU0YWE4NjM1ZjcwZDY5NzlkOThjOTVmODBkNGRhYzI3N2ZlZjIuLjNlMzliODAw
ZTZiNWY0ZDBjYmJhOTU3YzBkZDY2YzE4Zjc4MWZmMzggMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJz
L3VzYi90eXBlYy9oZDNzczMyMjAuYw0KPj4gKysrIGIvZHJpdmVycy91c2IvdHlwZWMvaGQzc3Mz
MjIwLmMNCj4+IEBAIC0yMDgsNiArMjA4LDkgQEAgc3RhdGljIHZvaWQgaGQzc3MzMjIwX3JlZ3Vs
YXRvcl9jb250cm9sKHN0cnVjdCBoZDNzczMyMjAgKmhkM3NzMzIyMCwgYm9vbCBvbikNCj4+ICAg
ew0KPj4gICAJaW50IHJldDsNCj4+ICAgDQo+PiArCWlmIChyZWd1bGF0b3JfaXNfZW5hYmxlZCho
ZDNzczMyMjAtPnZidXMpID09IG9uKQ0KPj4gKwkJcmV0dXJuOw0KPj4gKw0KPj4gICAJaWYgKG9u
KQ0KPj4gICAJCXJldCA9IHJlZ3VsYXRvcl9lbmFibGUoaGQzc3MzMjIwLT52YnVzKTsNCj4+ICAg
CWVsc2UNCj4+DQo+PiAtLS0NCj4+IGJhc2UtY29tbWl0OiA4YWNjMzc5YjY2NGVjOTg3ZGNjN2Vj
YTI1YTVmNWM0YTlhNGViOWM0DQo+PiBjaGFuZ2UtaWQ6IDIwMjYwMTI2LXdpcC1qcmVtbWV0LWhk
M3NzMzIyMF92YnVzX3NwbGl0LTk0NjgwMjQ3OWU4OQ0KPj4NCj4+IEJlc3QgcmVnYXJkcywNCj4+
IC0tIA0KPj4gSmFuIFJlbW1ldCA8ai5yZW1tZXRAcGh5dGVjLmRlPg0KPiANCg0KDQotLSANCk1p
dCBmcmV1bmRsaWNoZW4gR3LDvMOfZW4gLyBiZXN0IHJlZ2FyZHMNCkphbiBSZW1tZXQNCg0KLSBT
b2Z0d2FyZSBEZXZlbG9wbWVudCAtDQpQSFlURUMgTWVzc3RlY2huaWsgR21iSA0KQmFyY2Vsb25h
LUFsbGVlIDENCjU1MTI5IE1haW56DQpHZXJtYW55DQpUZWwuOiArNDkgKDApNjEzMSA5MjIxLTUz
DQpNYWlsOiBqLnJlbW1ldEBweWh0ZWMuZGUNCldlYjogd3d3LnBoeXRlYy5kZQ0KDQpTaWUgZmlu
ZGVuIHVucyBhdWNoIGF1ZjogRmFjZWJvb2ssIExpbmtlZEluLCBYaW5nLCBZb3VUdWJlDQoNClBI
WVRFQyBNZXNzdGVjaG5payBHbWJIIHwgQmFyY2Vsb25hLUFsbGVlIDEgfCA1NTEyOSBNYWlueiwg
R2VybWFueQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IERpcGwuLUluZy4gTWljaGFlbCBNaXRlemtpLCBE
aXBsLi1JbmcuIEJvZG8gSHViZXIsIA0KRGlwbC4tSW5nLiAoRkgpIE1hcmN1cyBMaWNrZXMgfCBI
YW5kZWxzcmVnaXN0ZXIgTWFpbnogSFJCIDQ2NTYgfCANCkZpbmFuemFtdCBNYWlueiB8IFN0Li1O
ci46IDI2LzY2NS8wMDYwOCwgVVN0LUlEOiBERSAxNDkwNTk4NTUNClRoaXMgRS1NYWlsIG1heSBj
b250YWluIGNvbmZpZGVudGlhbCBvciBwcml2aWxlZ2VkIGluZm9ybWF0aW9uLiBJZiB5b3UgDQph
cmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQgKG9yIGhhdmUgcmVjZWl2ZWQgdGhpcyBFLU1h
aWwgaW4gZXJyb3IpIA0KcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBk
ZXN0cm95IHRoaXMgRS1NYWlsLiBBbnkgDQp1bmF1dGhvcml6ZWQgY29weWluZywgZGlzY2xvc3Vy
ZSBvciBkaXN0cmlidXRpb24gb2YgdGhlIG1hdGVyaWFsIGluIHRoaXMgDQpFLU1haWwgaXMgc3Ry
aWN0bHkgZm9yYmlkZGVuLg0K

