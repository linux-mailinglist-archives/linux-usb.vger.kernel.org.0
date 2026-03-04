Return-Path: <linux-usb+bounces-33946-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKIIJnvsp2mWlwAAu9opvQ
	(envelope-from <linux-usb+bounces-33946-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 09:25:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 315E81FC8F8
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 09:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33F5130233DB
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 08:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B746390208;
	Wed,  4 Mar 2026 08:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="pl7mtPe/";
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="usgQeWjq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com [208.84.65.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6281A390211;
	Wed,  4 Mar 2026 08:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=208.84.65.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772612571; cv=fail; b=kRqp+rFz/EGj3p1opk4hBUcpB32hqlbiU61bMh7J76MvXOagBMEe6fURa1ZvESNNW3yw1uLkJXAMEXXo8UxWOYYcBrxRhforjU1PM+L9hna9JciIT2crPXMn6j2xJiJpzGr/Ur7RHLPxUWCOjQ9ODcaHQnz4A+lFFZlDGhKWS2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772612571; c=relaxed/simple;
	bh=GLyvrjokaMFHjR9cuzPtxhlSJLX/ddw0wkW7e1SZeog=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pP5PuuDhMGiLXONQCuKPKtQa9+4dRdd+8xxnP/giBlXL4QygVgfCr1713/8TZ/DCtROA8He/rasRUOlfKb53O2Sn957rTED2gVweU6KhzzeWtvpFfyB4P+IDxmY1IBr+YyhbEOyJet+0nULMGztIaxGbtplckpyrESHsAv7sJW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com; spf=pass smtp.mailfrom=cadence.com; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=pl7mtPe/; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=usgQeWjq; arc=fail smtp.client-ip=208.84.65.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cadence.com
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
	by mx0a-0014ca01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62410akQ260326;
	Wed, 4 Mar 2026 00:22:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=proofpoint;
	 bh=GLyvrjokaMFHjR9cuzPtxhlSJLX/ddw0wkW7e1SZeog=; b=pl7mtPe/Wg+F
	oYpeCx9y4n+z/k0TazsmqGeF6CG9dZODXKMvo/1Fft8BvPj5GkcT53pB/NxDrPFH
	zTEsP9qCY7uauVT9kI3r8fPTMtdI3SwgUn2TC1eoif3/Niyg90kC6rGhpx4yIfBy
	sbZZpW52pZZ8iQ49xqZNwKTR4JEYQk3BJvcGo/liJvy65RPgPCva972C5Qf8vMxy
	pKLbHIzpHdITRISUA5KpV2Z2QbhUvPhYDlzuiUIiIWgLIg8uDoE11AMopg+r9aoK
	RsAcDAS+dDFCI/7XKA74GhrfTB2sqO0qlsDfIKdiLXTcBs+Ip9WTdCobQg84MjQU
	OdQck25Pxg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
	by mx0a-0014ca01.pphosted.com (PPS) with ESMTPS id 4cp3nckhcb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 00:22:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4TBbtfZhvWpe5WGak6ULPDS0mTexfaNmnmYsrR3ZCkS0AsBDQthYscviIMSAQuM0GrTFshJ/e6MWxj9+WhVQLBt8thTgDSgYk/yy+p/2MPMpmk8qKb1IYWfGiXxMJPKLsp2doKN2473VR+ZsXv6iD6nFpo0asn6/zjPMULCr4jX/EwmDG4sncpa7B4yJ8nEcgpdRRtXs+B+NmO31tImLow/Dv1fT4YFELdQz39EiXXJpVJCsgK++YlGMKKtZjFGxhoaPHg4r+GH6o5r3xCZUnb7+zCr0KwyYeKFRCC4hENWJ3DQCpVo5GeCZh4XgsFy4w1h9xoQR/idooTcuXB80A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLyvrjokaMFHjR9cuzPtxhlSJLX/ddw0wkW7e1SZeog=;
 b=fdYmD4OzfWSBsvjw0JBK0izdWs4lH7QZ9GQRqyjdvXXpGwvvFIaJp24stnwPnKHTJ2nramqFuuJonDkf0EitZ2B6Dq1C8QK9ty92FyoCjrF85ngfjUJqkxbTt02kN+NvFjA5+jOUzo42iAn8+p/pTWR6Tij9JIHLJttIglGeMCmbp59f6osFKI/NpSMhb1w6eeP+OfBPPCWVXO/xnRMVqxgTtABl9slzWRwjWK1KP1oLuuo1DuP03y6PQheWxChl/x1dnrOEyIGBm5FgnfSN0JFeIIOcO7zQ5eoX+r9e6lN3gr3qGkj51FEV3P/TinoHtQi7RPKafQsk9o570gGdDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLyvrjokaMFHjR9cuzPtxhlSJLX/ddw0wkW7e1SZeog=;
 b=usgQeWjqtSOXdG3uNqfq77hyFPa8zPwqiVfGbcxCve9Tt4At/Z9o4tqzK3GnK9ue9SCvL7Udcx6erMfbpwPlZcUdaITc9Abyh1m9EVj5GJCBEaQYqlA/Pn4rvPuoTSLjwYM3agGXRgSwuTuYFZ+RyKOyysUn/57/Kjd1j+rg3T6xkKlfpAItP/6Fd/xRAsxo7v6c4nBvywvvIs0Hl2ug7Sqpo5j875wwHr5A5A/2POYlpwnsLjM8Pn4Jxg8Rp9aDlLOqysvPH7Ju0Qw2BprJ2MikKhG6ktawTr9O9+yD+/WN0hj2rJHtSbfcGCx7vfoI1WSHVApj9bRYEOIwsHjYfw==
Received: from PH7PR07MB9538.namprd07.prod.outlook.com (2603:10b6:510:203::19)
 by SA1PR07MB8387.namprd07.prod.outlook.com (2603:10b6:806:1ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 08:22:25 +0000
Received: from PH7PR07MB9538.namprd07.prod.outlook.com
 ([fe80::9088:4354:91a3:3bbe]) by PH7PR07MB9538.namprd07.prod.outlook.com
 ([fe80::9088:4354:91a3:3bbe%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 08:22:25 +0000
From: Pawel Laszczak <pawell@cadence.com>
To: Peter Chen <peter.chen@cixtech.com>
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
Subject: RE: [PATCH 0/2] usb: cdns3: USBSSP platform driver support
Thread-Topic: [PATCH 0/2] usb: cdns3: USBSSP platform driver support
Thread-Index: AQHcqfE1a3W1H1W0+kyrxldUiPBBWrWcabwAgAA6ooCAAWcOAA==
Date: Wed, 4 Mar 2026 08:22:25 +0000
Message-ID:
 <PH7PR07MB95386226F5CA1AD596699C66DD7CA@PH7PR07MB9538.namprd07.prod.outlook.com>
References: <20260302030339.324196-1-peter.chen@cixtech.com>
 <PH7PR07MB9538DF65B6E13761C630615ADD7FA@PH7PR07MB9538.namprd07.prod.outlook.com>
 <aaa97U38DByYYDcC@nchen-desktop>
In-Reply-To: <aaa97U38DByYYDcC@nchen-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR07MB9538:EE_|SA1PR07MB8387:EE_
x-ms-office365-filtering-correlation-id: 5b90108d-a319-4a12-42e5-08de79c72a9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 N37FY7zN0KWn3x6nrL3p62osr4rwSSLSLWJAmqs0tN08uQBkPNs5hVwRUPGeVrzRWanarpL+xnst8vquwdNtso983gsDQA/M7jGdolcQEESZxVcX4J/My2KjFR0c6++EU9xpC7jMmeOOxWpmBaDmjOfgcfUEIDfh/XCMRPkjesaH3a2G2SjmeGwEh/CjnMqyIBnz7aSAJPqkkcGsQ6IXr/OQwKSgv/3LRRBsXkAuEJFTZBbIjrNiVtOR5u0m1OOLLlgWUV7uekzMv0c2pYtv+k+bqgb+Sj1VrlfwTYQnh/9Wqk5n5+kiiPajkoohKgaCg8O+unl6TVgfkYym5WhK5cXyQpUxdDnt3Yi1Jh8mJIMBo/aPFQmacjc5/rL0YvhSuHVU+nUYmgRFaCfQpLu+NQeta4Eyev6oMCQxSCjKYQ75FV9nG50+UPzBGpiszwGE6QEmhMk2GIV8tCxIuwEdIgSV4vdVEfLvvNM0sIxvBWBZRnE+BfCQmourmLITXpRL8LkxfgcDpb1B7VsRRjbF5GHqxM+7HFS1SsRwLiGErNf7pP0mXCwPe4Fg+FzTvhIs0bENAuOlxU4Cfkl08Hq5RmWseCp4C2Rn1xD4In/4Uf0zFeZ0wXeOu0dK6IQflYBec/dN8/WYWcRnGMKcLmWuoI9roQCB4yyZgy3lhJjGvMtae/ehAuz6nk8AyH0S+ASNl1CADCPFbnGs8z8TRLbdfUxhYGokyUQ8DmgoYqghwv8hGGbZ8ZY8HPFpJsp56FY/
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR07MB9538.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dzdCV3YzbFVGTElQQnpXVk1QQmJWTDdManYvcjdZYXh5QUxjcWU1UUsyS1M3?=
 =?utf-8?B?S0VqYXV1NjYwN3J0Mit5L2dUWkQ5Z0R3VVcwaVI5ZGJPZldCZ0dWdGdjeVNr?=
 =?utf-8?B?eXNyVnVPbGFZNG9tVmdPaXJ5c25MOXBwRTNoV0hmZXZjSzk4Q1p5S0I0bzRq?=
 =?utf-8?B?MlhKRjM0MVlsd0VwSjJCY3JYSXdzL1A0Rkh6Y0o4SkQ2U095NVlHNDRrMTJC?=
 =?utf-8?B?NGlVcFFDRm0zbnpJd3ZqbGhXSC9PczU2VFFzb1VJcnVqZVMva2NBQWM0QmxI?=
 =?utf-8?B?RHNLMDQxQWhZdk05eG12K05UUTVkR1cxOU9vODJ2SWsyQlFhNVM2eW5Wcmpy?=
 =?utf-8?B?dmQwNko3QkJ0ZG9xM3c2c05FWHV6SEJ5b2UyTGFWQ0x5MUt2YjFmQkxwZHpG?=
 =?utf-8?B?SFNoUXgyQXMwY09zMGxUajBUdlFSOW5lTm1HN2dNYnVjU243RUtQeW41Skd5?=
 =?utf-8?B?clRIWXdXNmRYOUp6cXQ5dWprdjZydmtaeFM0RS9NdkNQcG5jTE5pWTA5RHE1?=
 =?utf-8?B?bHV1cnJiZ0FzYW5SdThFS2ZTZWhyMmRDQ2l6Mjc3cDdCeWdPQ3YrQUpIbHE5?=
 =?utf-8?B?TUlHTVdCWTJEakNJR0h5dVl0Ty9BWTdiTkdJT2tVeVBqUnBtdWwvSWFnZUMx?=
 =?utf-8?B?ZjZuRmtqRlUyR0xHajNyY0VOREdsaDZlVlQvUE1GWlpHWWVNS1NrSUovdlZp?=
 =?utf-8?B?a05FaGp1bGhPM1dxL3c4ay9aQXpPaEI5cC9lNTNSc0dyMDN3azA2dngrZDBE?=
 =?utf-8?B?bTdxZ3U2d2wyL3VCRUFFM293YmYyemgyYVd2aWNsaXBJTW1LRG5GbnZyVHpL?=
 =?utf-8?B?bVVtS3l2QWpIM0lPRjBGSEk1dncvNHprVVBTZFdsSG5sMGFtQXVjZk1GdHlP?=
 =?utf-8?B?T2FnY3d3Z1Z2UXZwODlOUXdaaEZNclNwbm5acVZYMG9PNEtReUJoZGJDMm1u?=
 =?utf-8?B?d01EaDRVVlc1a1pLbVpMbk81cmRoQUNCRWhiT2x5MGtnb2pGZnZiUGtsclAr?=
 =?utf-8?B?cHE2SlRzaGgrTVB0TFR4ZnBxRHg1NGxMWkRBVkZBYUVmSmx1TFVlOG9PaUxi?=
 =?utf-8?B?UmlCdUR3ekFlSjNHM0NsOXVlY00wL3IreGcyQnFSNU5OaCtpSExuckQ0Qkla?=
 =?utf-8?B?SnR0Q1M4ejZSSXREYmZBVHMrZFZTc1Iva256Z0pFOHgxVzh6cXZHVm1BTHNS?=
 =?utf-8?B?M0JLR0N5VXZNQ0xDVGxRVUxxRXRHdTNKTjIxeXJwTldrQXJrVzFoZ290cGFC?=
 =?utf-8?B?MlNSSGpwbVlqQ1RCRGJ2eEpZb0FBNTBzM2ZQNEpRdml3cDBKLzFPeDR3MUp4?=
 =?utf-8?B?alByQXNsY09OZ3laUjc4azRQbjN0RXZQMEt5YmYva1hyZzFmR2Vhc1F3cUJT?=
 =?utf-8?B?N0R1QkpqTFkzVzc0UGRUamk3SzQyZnhYWWdEeFJEalgrRVdZbGUwNTY5aUgw?=
 =?utf-8?B?QW1vdHMzdFM1Tm43NVErTDN2ZENrbWJETDU3L0s4TVdCUzE1WDBiZE9tUXNm?=
 =?utf-8?B?UmpPc0oxSDFmSUVESXVjVzloTHNQck52TWpNbWhMMHNkcFhLekdGcS9yeEUz?=
 =?utf-8?B?Sk9TYTVXMzR0c2IxOWFCeVRxd0x4dE9Cb0YrM01aTTVRcWxGSEhmZGovbm5p?=
 =?utf-8?B?MEtURzhvTk53eHlMUGJwMUQvM25wQUc4Tk1GK1ZVM3psc25zemxjd0NEMVhy?=
 =?utf-8?B?RGhucmFhd2tPaHgvNDlFOEpaeWp4S09lNzJ0NEFPZjhTQWw0QTJoNit1S1Ex?=
 =?utf-8?B?VDYzNCtjQUpQSENKaHNsZkxRenpDWWZJcGY0NmlVWGFUMzdhK2VuOFJlZ01T?=
 =?utf-8?B?dVRVbmM4OWg5d3FNWUtpUXU2dC8veTdRZDVnTnpVdFVkaGlyK2R1WG44Wnkx?=
 =?utf-8?B?NG1SNmpPdUlHRzRsTndydHhaV0Rac096TlJJOHBzd1dtU3ExSVc5YzJoN2t2?=
 =?utf-8?B?NFptajJnWUhxdkJmTHZRajlwOUFwSEx2aDYycXZ0SHZsQTh2NU0xNHUrWUFi?=
 =?utf-8?B?NWRvRkU0MHlGT1V2NHRwdXZ1VUx6L1FpUm5BY09CZldVQ0JRS0dpeWNrQndi?=
 =?utf-8?B?U2EwMkxKTFdMc3J0azRDYWg0TUpTU1hxTTM1Uld5NTczTS9tSFJTNkdkOUlR?=
 =?utf-8?B?VVBwak9OdjlWOVUyOW05K1paSm84N2xtUUFsRm1neW0yQ2UrSE95ck50ZDF0?=
 =?utf-8?B?a2dpanFUNlAvM2hRa3JLUnBEUWJzMHRHMzVhZUhtUDdIY0JOdlJlZE5tYk04?=
 =?utf-8?B?SDdXL253L1hkL21NTytyejl3NzErY21WVXMyNldmb1QzSm9hYnFoRFRpUVJL?=
 =?utf-8?B?Und6YWxCcmdHS0ZhWkM0dHA3OGJ5MDV4RktGRkw4Y1JMMEh4aytHQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	qB07eIR4xqXzhukIE/Un5d0GnvBTVmtpHICz/frW5aWDj7a8bd9V5MsKdfw7TWipTCe1OCk9jV/6kSWIxCTGmyNwABVTGsXbuE4zu40RMKIEkHJqoeejyI3C9cwvBj1E9AwypU1454N+WpWU/0zynDeGcFa3CrXUCJtw2nasqBk/vaFS0PetCqnjecKvkdDApN4ZmsBQXPyZD3hmRAAeOH1uTa84ARm+g7WglLgn6xyGMUSA73yj1TL+9llAeJNzJpygmquspjlZ5GYq3W0DlO1v1bciw3q12eouybE/E2xvzf4zpmgPTReF/ELg3Z6zP10yu2lXur/ZOymtn7Hl2Q==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR07MB9538.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b90108d-a319-4a12-42e5-08de79c72a9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 08:22:25.2510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZwiJ8KzykuMXuMykWsnvapmV0sd6rIwpR4e/cP4OS1wTnN091DSwsRr5sIKy24viLMOg7DXLQ3HguYw9SU7cK7BEBJYAKo5eVivgh8/4yfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR07MB8387
X-Proofpoint-GUID: 4QheJaJGqpAh7BzgHYHMlx0v4LiFLMTB
X-Proofpoint-ORIG-GUID: 4QheJaJGqpAh7BzgHYHMlx0v4LiFLMTB
X-Authority-Analysis: v=2.4 cv=JJg2csKb c=1 sm=1 tr=0 ts=69a7ebc4 cx=c_pps
 a=AKd2An130fSphkJyqL6rzg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=Zpq2whiEiuAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=W8fx6O4W8wtO2w6lYej3:22 a=jPItpJ3sizTKmla2ehJN:22 a=uherdBYGAAAA:8
 a=_EeEMxcBAAAA:8 a=OLL_FvSJAAAA:8 a=Br2UW1UjAAAA:8 a=qBPnistlM9Jsw9ESUJoA:9
 a=QEXdDO2ut3YA:10 a=oIrB72frpwYPwTMnlWqB:22 a=WmXOPjafLNExVIMTj843:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NCBTYWx0ZWRfX4Cr5KrLBmjh/
 jXSibXBPHwZj7rFZfK65PEYUPC2eiFpTCQthu3OMbX3HBBApSzhJU68dQ2sgnIj+KMA4Y6EJznG
 I9goy6Q4S152X0e7w0foi5p5wQ5ARgKscST621kjcePaStjIsAtAajnKARDU3RiO12xXL02XtWG
 tv2U+WSzutswfZf36sexvFcwVSBvpxBP8zIt7yohzxP61O7m1zS/I7XCX8ZbLFIgGbx9A4LIsfh
 EfRJeOeFr3IpAhLHD773+haD4laFodhyJcSh61ujFCJ/1Sexq7Kb+hu+6dAbtGkBHaU0T9seNfp
 KnI3J3dRC8y+rC2eDw1PIb85/5ekMECEDcjZXjRpydsmpE44wboicRgmcT/M+CZiE+0j142R2mr
 IK0d9KpZv9Rn90/9Dwi1zC7Jk3jV7i6BJQch0b1DSqmpal7MUT39HoXEpOxkKSfu+J/oZu+Lmg9
 jGDVUbBP7EBl7LHXwbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040064
X-Rspamd-Queue-Id: 315E81FC8F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cadence.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[cadence.com:s=proofpoint,cadence.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33946-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[urldefense.com:url,cadence.com:dkim,cadence.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[cadence.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pawell@cadence.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Pg0KPk9uIDI2LTAzLTAzIDA3OjM0OjU0LCBQYXdlbCBMYXN6Y3phayB3cm90ZToNCj4+IFtTb21l
IHBlb3BsZSB3aG8gcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGRvbid0IG9mdGVuIGdldCBlbWFpbCBm
cm9tDQo+cGF3ZWxsQGNhZGVuY2UuY29tLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQN
Cj5odHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNl
bmRlcklkZW50aWZpY2F0aW9uX187IQ0KPiFFSHNjbVMxeWdpVTFsQSFBTVhDb2tRb3B6aGU3ems2
a0tQRmVMTHAtDQo+eXVoMWlzNnhhVV9xZTU2aVhMWVY5ajViRVZfalVPVjIzaVUwN0oyVk12VVZm
ODlMaFI2MEFLUEhlcUIkICBdDQo+Pg0KPj4gRVhURVJOQUwgRU1BSUwNCj4+DQo+PiA+DQo+PiA+
SGkgUGF3ZWwsDQo+PiA+DQo+PiA+VGhlIENhZGVuY2UgVVNCU1NQIChDRE5TUCkgY29udHJvbGxl
ciB3YXMgcHJldmlvdXNseSBvbmx5IGFjY2Vzc2libGUNCj4+ID50aHJvdWdoIFBDSSwgY291cGxp
bmcgdGhlIGdhZGdldCBkcml2ZXIgd2l0aCB0aGUgUENJIGdsdWUgbGF5ZXIgaW50byBhIHNpbmds
ZQ0KPj4gPm1vbm9saXRoaWMgbW9kdWxlIChjZG5zcC11ZGMtcGNpKS4gVGhpcyBwcmV2ZW50ZWQg
dXNpbmcgdGhlIENETlNQIElQIG9uDQo+PiA+U29DL3BsYXRmb3JtIGRlc2lnbnMgdGhhdCBleHBv
c2UgdGhlIGNvbnRyb2xsZXIgdGhyb3VnaCBkZXZpY2UgdHJlZSwgZWcsIENJWA0KPj4gPlNreTEg
U29DLg0KPj4gPg0KPj4gPkluIHRoaXMgc2VyaWVzLCBpdCByZXN0cnVjdHVyZXMgdGhlIGRyaXZl
ciB0byBkZWNvdXBsZSB0aGUgQ0ROU1AgZ2FkZ2V0IGZyb20NCj4+ID5QQ0ksIGFuZCByZWZhY3Rv
ciBjZG5zcC1wY2kuYyBpbnRvIGEgdGhpbiBQQ0ktdG8tcGxhdGZvcm0gd3JhcHBlciAoc2ltaWxh
ciB0bw0KPj4gPmNkbnMzLXBjaS13cmFwLmMpIHRoYXQgcmVnaXN0ZXJzIGEgcGxhdGZvcm0gZGV2
aWNlIGFuZCBwYXNzZXMgUENJIHJlc291cmNlcw0KPj4gPmFuZCBwbGF0Zm9ybSBkYXRhIHRvIHRo
ZSBjb21tb24gcGxhdGZvcm0gZHJpdmVyLiBTbywgcGxlYXNlIGhlbHAgdGVzdCBpdCBpbg0KPj4g
PnlvdXIgcGxhdGZvcm0uDQo+PiA+DQo+PiA+VGhlIGNoYW5nZXMgYXJlIHRlc3RlZCB3aXRoIHJh
bmRvbSBjb25maWd1cmF0aW9uIGNvbWJpbmF0aW9uIHRlc3RzLg0KPj4gPg0KPj4gPj09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPj4g
PkFMTCBURVNUUyBDT01QTEVURS4gU3VtbWFyeToNCj4+ID49PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4+ID5TdGFydGluZyBjZG5z
MyBjb25maWcgY29tYmluYXRpb24gdGVzdHMuLi4NCj4+ID5UaW1lc3RhbXA6IDIwMjblubQgMDPm
nIggMDLml6Ug5pif5pyf5LiAIDA5OjM0OjQ3IENTVA0KPj4gPg0KPj4gPlBBU1M6IGFsbC1idWls
dGluIChTVVBQT1JUPXkgQ0ROUzM9eSBHQURHRVQ9eSBIT1NUPXkgQ0ROU1A9eQ0KPj4gPkNETlNQ
X0c9eSBDRE5TUF9IPXkpDQo+PiA+UEFTUzogc3VwcG9ydC15X2NkbnMzLW1fZ2FkZ2V0LXkgKFNV
UFBPUlQ9eSBDRE5TMz1tIEdBREdFVD15DQo+PiA+SE9TVD15IENETlNQPXkgQ0ROU1BfRz15IENE
TlNQX0g9eSkNCj4+ID5QQVNTOiBzdXBwb3J0LXlfY2RuczMtbV9nYWRnZXQtbiAoU1VQUE9SVD15
IENETlMzPW0gR0FER0VUPW4NCj4+ID5IT1NUPXkgQ0ROU1A9eSBDRE5TUF9HPXkgQ0ROU1BfSD15
KQ0KPj4gPlBBU1M6IHN1cHBvcnQteV9jZG5zcC1tX2dhZGdldC15IChTVVBQT1JUPXkgQ0ROUzM9
eSBHQURHRVQ9eSBIT1NUPXkNCj4+ID5DRE5TUD1tIENETlNQX0c9eSBDRE5TUF9IPXkpDQo+PiA+
UEFTUzogYWxsLW1vZHVsZSAoU1VQUE9SVD1tIENETlMzPW0gR0FER0VUPXkgSE9TVD15IENETlNQ
PW0NCj4+ID5DRE5TUF9HPXkgQ0ROU1BfSD15KQ0KPj4gPlBBU1M6IG5vLWNkbnMzIChTVVBQT1JU
PXkgQ0ROUzM9biBHQURHRVQ9biBIT1NUPW4gQ0ROU1A9eQ0KPj4gPkNETlNQX0c9eSBDRE5TUF9I
PXkpDQo+PiA+UEFTUzogbm8tZ2FkZ2V0IChTVVBQT1JUPXkgQ0ROUzM9eSBHQURHRVQ9biBIT1NU
PXkgQ0ROU1A9eQ0KPj4gPkNETlNQX0c9biBDRE5TUF9IPXkpDQo+PiA+UEFTUzogc3VwcG9ydC15
X2JvdGgtbV9nYWRnZXQteSAoU1VQUE9SVD15IENETlMzPW0gR0FER0VUPXkgSE9TVD15DQo+PiA+
Q0ROU1A9bSBDRE5TUF9HPXkgQ0ROU1BfSD15KQ0KPj4gPlBBU1M6IG1pbmltYWwtbW9kdWxlIChT
VVBQT1JUPW0gQ0ROUzM9bSBHQURHRVQ9biBIT1NUPW4gQ0ROU1A9bQ0KPj4gPkNETlNQX0c9biBD
RE5TUF9IPW4pDQo+PiA+DQo+PiA+VGhpcyBwYXRjaCB3YXMgZGV2ZWxvcGVkIHdpdGggYXNzaXN0
YW5jZSBmcm9tIEFudGhyb3BpYyBDbGF1ZGUgT3B1cyA0LjYuDQo+PiA+DQo+Pg0KPj4gSSBjYW4g
Y29tcGlsZSB0aGUga2VybmVsIGJ1dCB3aGVuIEkgdHJ5IHRvIGluc3RhbGwgbW9kdWxlcyB3aXRo
DQo+PiBtYWtlIG1vZHVsZXNfaW5zdGFsbCBJIGdldCBlcnJvcjoNCj4+DQo+PiBERVBNT0QgIC9s
aWIvbW9kdWxlcy83LjAuMC1yYzEtbmV3LXBjaS1wbGF0LXN1cHBvcnQtbmV4dC0yMDI2MDIyNysN
Cj4+IGRlcG1vZDogRVJST1I6IEN5Y2xlIGRldGVjdGVkOiBjZG5zX3VzYl9jb21tb24gLT4gY2Ru
c3AgLT4NCj5jZG5zX3VzYl9jb21tb24NCj4+IGRlcG1vZDogRVJST1I6IEN5Y2xlIGRldGVjdGVk
OiB1ZGNfY29yZQ0KPj4gZGVwbW9kOiBFUlJPUjogRm91bmQgMiBtb2R1bGVzIGluIGRlcGVuZGVu
Y3kgY3ljbGVzIQ0KPj4gbWFrZVsyXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLm1vZGluc3Q6MTMy
OiBkZXBtb2RdIEVycm9yIDENCj4+DQo+PiBJdCBvY2N1cnMgZXZlbiB3aXRoIG1pbmltYWwgY29u
ZmlndXJhdGlvbjoNCj4+IENPTkZJR19VU0JfQ0ROU19TVVBQT1JUPW0NCj4+ICMgQ09ORklHX1VT
Ql9DRE5TMyBpcyBub3Qgc2V0DQo+PiBDT05GSUdfVVNCX0NETlNQPW0NCj4+IENPTkZJR19VU0Jf
Q0ROU1BfR0FER0VUPXkNCj4+DQo+DQo+VGhhbmtzIGZvciB0ZXN0aW5nLiBJdCBuZWVkcyB0byBs
ZXQgY2RuczMocCkgcGxhdGZvcm0gZHJpdmVyIGFzDQo+c3RhbmRhbG9uZSBtb2R1bGUgdG8gZml4
IGl0LiBXb3VsZCB5b3UgcGxlYXNlIHRyeSBiZWxvdyBmaXggb24gdG9wDQo+b2YgbXkgcGF0Y2gg
c2V0Og0KPg0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jZG5zMy9NYWtlZmlsZSBiL2RyaXZl
cnMvdXNiL2NkbnMzL01ha2VmaWxlDQo+aW5kZXggMGU5YjIwZTc5OWQwLi42MzQ4NGYxNDViYjkg
MTAwNjQ0DQo+LS0tIGEvZHJpdmVycy91c2IvY2RuczMvTWFrZWZpbGUNCj4rKysgYi9kcml2ZXJz
L3VzYi9jZG5zMy9NYWtlZmlsZQ0KPkBAIC0zLDEyICszLDE0IEBADQo+IENGTEFHU19jZG5zMy10
cmFjZS5vCQkJCTo9IC1JJChzcmMpDQo+IENGTEFHU19jZG5zcC10cmFjZS5vCQkJCTo9IC1JJChz
cmMpDQo+DQo+LWNkbnMtdXNiLWNvbW1vbi15CQkJCTo9IGNvcmUubyBkcmQubyBjZG5zMy1wbGF0
Lm8NCj4rY2Rucy11c2ItY29tbW9uLXkJCQkJOj0gY29yZS5vIGRyZC5vDQo+DQo+IGlmZXEgKCQo
Q09ORklHX1VTQiksbSkNCj4gb2JqLW0JCQkJCQkrPSBjZG5zLXVzYi1jb21tb24ubw0KPitvYmot
bQkJCQkJCSs9IGNkbnMzLXBsYXQubw0KPiBlbHNlDQo+IG9iai0kKENPTkZJR19VU0JfQ0ROU19T
VVBQT1JUKQkJCSs9IGNkbnMtdXNiLWNvbW1vbi5vDQo+K29iai0kKENPTkZJR19VU0JfQ0ROU19T
VVBQT1JUKQkJCSs9IGNkbnMzLXBsYXQubw0KPiBlbmRpZg0KPg0KPiBjZG5zLXVzYi1jb21tb24t
JChDT05GSUdfVVNCX0NETlNfSE9TVCkgCSs9IGhvc3Qubw0KPg0KDQpXaXRoIHRoaXMgZml4LCB0
aGUgbW9kdWxlcyBpbnN0YWxsYXRpb24gd29ya3MgY29ycmVjdGx5Lg0KDQpJIGhhdmUgYW4gYWRk
aXRpb25hbCBjb21tZW50IHJlZ2FyZGluZyB0aGUgZ3JvdXBpbmcgb2YgVVNCU1NQIGFuZCBDRE5T
Mw0Kb3B0aW9ucy4gQ3VycmVudGx5LCB0aGV5IGFyZSBub3QgZ3JvdXBlZCB0b2dldGhlciBpbiBt
ZW51Y29uZmlnLA0Kd2hpY2ggbG9va3MgYSBiaXQgdW50aWR5LiANCkl0IG1pZ2h0IGJlIGJldHRl
ciB0byBtb3ZlIHNvbWUgb2YgdGhlIEtjb25maWcgY29uZmlndXJhdGlvbiBoaWdoZXIgdXANCnRv
IGVuc3VyZSB0aGV5IGFyZSBwcm9wZXJseSBncm91cGVkIGluIHRoZSBtZW51Lg0KDQpSZWdhcmRz
DQpQYXdlbA0KDQo+QmVzaWRlcywgd291bGQgeW91IHBsZWFzZSBjb21tZW50IFsxXSwgdGhlIGtl
eSBwb2ludCBpcyBjb3VsZCB3ZQ0KPmtlZXAgb25lIHBsYXRmb3JtIGRyaXZlciB3aXRoIG9uZSBj
b21wYXRpYmxlIHN0cmluZywgYW5kIGNkbnMzIG9yIGNkbnNwDQo+cGxhdGZvcm0gaXMgZGVjaWRl
ZCBhdCBydW50aW1lPw0KPg0KPlsxXQ0KPmh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRw
czovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9rZXJuZWwvbXNnNjA3MjQ4MC4NCj5odG1sX187ISFF
SHNjbVMxeWdpVTFsQSFBTVhDb2tRb3B6aGU3ems2a0tQRmVMTHAtDQo+eXVoMWlzNnhhVV9xZTU2
aVhMWVY5ajViRVZfalVPVjIzaVUwN0oyVk12VVZmODlMaFI2MERDTWJCeHokDQo+DQo+LS0NCj4N
Cj5CZXN0IHJlZ2FyZHMsDQo+UGV0ZXINCg==

