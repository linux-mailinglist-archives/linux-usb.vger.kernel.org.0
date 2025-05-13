Return-Path: <linux-usb+bounces-23887-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B84FAAB4CDC
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 09:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 007FF1B41AE7
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 07:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB86A1F03D6;
	Tue, 13 May 2025 07:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IkXi/ldA";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Q8JdMjOI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="oZFV46vz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C569A2D7BF;
	Tue, 13 May 2025 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747121787; cv=fail; b=bvXw/Fim1TjAk2ytGGpoSmAlry4G8DYp+YDdb8WrbC8q9tb3NqB5G4dwPRakxA8ZmhE2om5w4nPmXj8gOT4hqXDt38nxrF6fiW9pLKL1o70ZMuISphIawiElq6ld431Dt5iAvM2nIamWohpnZM2hJKu/hTGDi2GrQpoq6KCrOS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747121787; c=relaxed/simple;
	bh=2d4o2SO1F8c06jE/BfJ0+YqhMhjL3XHR8NUKU5/Ix3w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LPvSejwiH6LNpkXcuqN/0KB6ZXu0MsHGWWmsHmDjRE0i2pSMXgoa2mTHOZe7OIPmeoOwo2hcPqGwM9UySWCIYcQw+TN1/njWqq/BJmC594KdZd1gdWj4ugaajn/qt8jq/YvJ9qLCGwh9xkzt15cW36sTjqcIR3xYQY79XUT887c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=IkXi/ldA; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Q8JdMjOI; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=oZFV46vz reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D3WAxM006239;
	Tue, 13 May 2025 00:35:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=2d4o2SO1F8c06jE/BfJ0+YqhMhjL3XHR8NUKU5/Ix3w=; b=
	IkXi/ldAluqjBiRLiynV5SuNsnowPKdX7C2ezRz9MJOF7iQYmghcMSnl1RJtX9jh
	f6h1IqK5QIy3ttr607rw7tHTELFQC0miHyTD/6Wiwqq2tC5JbOHTypWF9/3QtH7M
	ymBuIQd3rHeVxoLTF+r/N8WlJhehFplUEzeL+T+Ovg5UIMHd5jNGhqYs3kngQbMV
	JmEZgWwKOTOukPw9SlPRNiGbRSA4Ui4HbC5rfTZ2xNr7nPOF0C5Fhk8a6DVAOGWH
	CdcmPTQTgxlMZBChSrD4VQP7SmB53bgl7GdnMJYycCFFehr4d4C6hbI3KSmIeT0Q
	G7KBRbnJ5onUIlwkBTEfNQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 46j5efjs0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 00:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1747121748; bh=2d4o2SO1F8c06jE/BfJ0+YqhMhjL3XHR8NUKU5/Ix3w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Q8JdMjOIFj4Anwp3ETx/KtxAFk70LOt+nKhEpdcGPBB4Z5eurFyUAhUvxrezosBYd
	 IgTQJpGmcqF1zAhL3v9bfywpZQWPN8x5FxJ4zEOq5gU6oy22stmAZhacx3K89Ke0Yh
	 PSP7YacUFRr7ZbLpOImFMHArpfL9S2NbafO4a60TJ9dWJxKTmF1XntyR5dxZfixLD+
	 zSnwH7c1RKeMCYEf4VP1KZW2HNQ4ffBhfm3hdQQpqbULuOJe7eQ5iiDxRzN7TMkvVg
	 JHchhxjsebdtozvm7Ksd6UH3YU9V7P7QS6S9NvPguKHzUDhKklt4TDgZkJpRUnlfbB
	 nCWMyhxnS0v/g==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7758F4012B;
	Tue, 13 May 2025 07:35:47 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 45AD8A0077;
	Tue, 13 May 2025 07:35:46 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=oZFV46vz;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9FCC7404D1;
	Tue, 13 May 2025 07:35:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRwSBdrYEk0rZGRCbJ9fcS1cPhYSmuQsKIHJLPUh1SXkjMXyHChVvYYcwnSjqIVr2yThf+rQAgxgF7lA5ZRhWIsCenxFhTPRTq4mC1ezgVl+2FiXXP3h9L3gp56h9db8MwZDxVOm2umvHDL2WVGndYsgdymHuT+tkkY2QPH02nYC8aMY/3nGxrK4QeHZYb8Vq1jDVQEfKU0ersA6b/FXQvloMIJj8uSrtg/y+1XvaqBGns41iZ6kdApoSbvxuYyaKB9kjUW3qCV8GwvgGrUbX7AA+eyaVaM1t1d6NinoplS6OkUeEBPiXRvYTSTxA3XvaNT4jWChupeFjeAPpID2mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2d4o2SO1F8c06jE/BfJ0+YqhMhjL3XHR8NUKU5/Ix3w=;
 b=jOBDOIhBlaaNk17/nAzUn/qN6Aa1fHZKN88fR+6+6a41VUGhufwATmVeir8+wGMkVsBbuI7ZCh33nus3u2ZatDgdstCzZCsBilt/nhSdbFxtVXNe7JM/Q3LapFPVaHuifW0BiQeQrhG7oHJyD2cP+Qw4pwYRLeIS/LRX3SUIzievgmu1ToQ9X+WRpjYOAbkznhymoTf2txF041ZtRgxbYIyXK1BdAKtD8+aPBgBXvSHztL8cCbkm4g/4OFMYH0WidW4C53PtbvW/D3z549GSnqdbREkmnztggdL6mO4PgXBcpKgNmnbE0uL6AmbM469wJHBRg1AgqI+kdySF1l4RLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2d4o2SO1F8c06jE/BfJ0+YqhMhjL3XHR8NUKU5/Ix3w=;
 b=oZFV46vzJnYMEF13Qt3p5TPmijfhxDysaNdFjOn0iATFEz4t7i7bwPf2/eh4UJ28ymBBfQoPKUg2+I0CsCx5+uk+A6WtsxUb/GUJRj1EwpX8psdHJeXz9k9nLFEjBPlAnmBbOHIQmBiuUxfUEl1tqGCQs65dR/rGhQ2vaOq5ox0=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by PH8PR12MB7424.namprd12.prod.outlook.com (2603:10b6:510:228::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 07:35:41 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd%7]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 07:35:41 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Alan Stern
	<stern@rowland.harvard.edu>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Kever Yang
	<kever.yang@rock-chips.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?utf-8?B?SGVydsOpIENvZGluYQ==?= <herve.codina@bootlin.com>,
        Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>,
        Stefan Wahren <wahrenst@gmx.net>,
        Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: DWC2 gadget: unexpected device reenumeration on Rockchip RK3308
Thread-Topic: DWC2 gadget: unexpected device reenumeration on Rockchip RK3308
Thread-Index:
 AQHbrV36Yt40yDyRo02Ih1W6li2lBrOjaf4AgAEt2YCAADK4gIAAHcUAgBqQAQCAAEPdgIAKTfUAgAZOWgA=
Date: Tue, 13 May 2025 07:35:40 +0000
Message-ID: <329f68fb-a097-ff3d-da9d-f535a8429ea7@synopsys.com>
References: <20250414185458.7767aabc@booty>
 <a96409af-4f82-4b65-b822-dd8c71508212@rowland.harvard.edu>
 <cf84f5ca-8c7a-b6c6-492c-c9cf6f73130d@synopsys.com>
 <20250415162825.083f351c@booty>
 <8c2e18a9-44d1-47b3-8fe4-46bdc5be8d76@rowland.harvard.edu>
 <20250502155308.11a991d4@booty>
 <cc80988c-5941-46f3-8183-f3f9acb7dd5d@rowland.harvard.edu>
 <20250509091738.4ae76d18@booty>
In-Reply-To: <20250509091738.4ae76d18@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|PH8PR12MB7424:EE_
x-ms-office365-filtering-correlation-id: 4362ca04-94f9-48f8-fa49-08dd91f0c32b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NXNFOEFtMG9NbkgwSndGQlVTdjVxczVoRkV1cnpweFE5NnFPaEdGdWhib0o3?=
 =?utf-8?B?d2tiRFIvV3BnZlVWc242bWJNUU9PSEw5UkZvWVlEdTVYVVk4YUlRWHRZcFhr?=
 =?utf-8?B?RXhjdUxkdlhPV2VpamxBd2JWWG9WM2tSOG5JdjJKTHhPeEZHWllGbXYwZkM1?=
 =?utf-8?B?REZtUGhZYXAyTDltVXVoOWg1bGZIY3RPODRlZGFYQ1FiMUhOQnlJbGVNS3Ja?=
 =?utf-8?B?V1UrWW5MVUIvY2xxZU04YVBoTmJsemJjMU0yMitnZG14Z3ZYeU9oWS8zZHBt?=
 =?utf-8?B?VjFhWjlKdUxSMUlKZVBPbHNNYURvMmxHK1pVQURJNE4vMUxXSUhXTkxtSlF5?=
 =?utf-8?B?czR4Yzg0R0daSmpJL3VPOWRYVTR2Y0FHR2F5bzdJNmM5cWhrdGtFcWZWWWtr?=
 =?utf-8?B?TWd4dEFFZkIzMGlRR0x5S1hWcXdzK1lNTnB5TW1mbzlWclVMcUlUOEtRd3lk?=
 =?utf-8?B?ODdobFdUZGUzM0dkREozNm1DZlRNVmhWRTVVcnRqWWtiNzBwUWsvWGQ0NlUr?=
 =?utf-8?B?NTFmMExKWWRNZ0FaZWo3QXhMOXZmMXJFMmJxTmtmNFN2dFBPOGllL0UwUVN5?=
 =?utf-8?B?QXN1SEpJWHBVSWxSZHF0bjRVRTZ3TnNoendYWlhTK3E2aE4zK3c0ZUJhNDIw?=
 =?utf-8?B?ZmNnbjdnS0dwazZQMWtNbldIY1NwTkllMlh6eS9YM3F0dHRXYnlMYXFUYVZq?=
 =?utf-8?B?d0lhM0ZiM1p0V0IyU3F3SG52YzRPTU5Kek11S2pOb1JYM1A1YldHK0V5VmlM?=
 =?utf-8?B?dFI3TmRzSlQrYVI0NlhnQ25wZnlDZHBmUXU4OXRNeE9VUUMvM2YwT3pMM2xo?=
 =?utf-8?B?dDZNSkJpeDFkb24rcVhCM0ZaNHBHb09MYTdrVG9QdmZZSjNXN20vMFlXQUpM?=
 =?utf-8?B?VVF0Mk9lNjRuUWZzb0ZJVHF5NnNTMkVhR2lyR3hidC9kYnRzMU5vS1NkWCtL?=
 =?utf-8?B?Q3FmbXNYa2I5UC9ZSjZ2TFppelA4blhzL0dZRHhHSWFtTlZCeERPZmpKdU9v?=
 =?utf-8?B?WTZ2dGdUa0d0MkZFb204V3lUZTA1elNrVDBKdmF1aVR3WmJxYVNJdUVVc09Y?=
 =?utf-8?B?WTZBOStwck1QVkhzQVVpZVVFWkFEb01VRTBoalNQY1JFbWFLUm1CWUpUSDQ5?=
 =?utf-8?B?RjNUaUJvWm9uZzVuZlJNUDFjRHFZeUJ2NXNWRnZiQU5TMVVSbVlDclBibCtm?=
 =?utf-8?B?ejlUV2JzRDFnMHpjMVhVVVJrQWI4RmxFYnlOQ2NHbE50bDM3WlJ1ZHR3TVFh?=
 =?utf-8?B?OGhDb3BFZGZXQVU3ckhKYlhCNWlIeE02T0IrRGVaMDVZeUtDQmJLRWVCdEwy?=
 =?utf-8?B?NFB5S1dVRFVWVFdNTzhrc1JUd3FxYlJ5bzFDLzBXTUhac0NqR1Z1M2lyZG9v?=
 =?utf-8?B?VFNDWDY5TDJwdDRvam5UTWpJenNJMlNvbXJtQlViSEdlVGNvZ1EzVlh0djAx?=
 =?utf-8?B?aXByeU9OUkplQ3NqelpleEJUK1hhdUVFdGpBYU1BWXd1dWp0NjFWQVBJazNC?=
 =?utf-8?B?WUdkMUtGSncvUFJLMnRRQ04yK2FoWEZNV2RNWGlxTHIxd1B1b3BLKzFrNm4v?=
 =?utf-8?B?NjVpRzU5a1JDQmNpN3VJeVlxMWJuSGNaNjhnVWY5eGpZeFcyQ1pWaEovR3lG?=
 =?utf-8?B?a0FlajllalV4TU0xRkg5aDNoSm5PU2Q1QXprYkxFS2l0S2xDYnJ3YTV5cDd6?=
 =?utf-8?B?Tk9qZGRLYmlPOTVpa1F3Mlp4SEVMdmJuYnhabG5DeU91SGNGam12NDkrY3Z5?=
 =?utf-8?B?UWJMQjJwSklhMDlPS05jZS90WjY1bUszU2t5VjI4MUVGMGVXallvTSs2V2I1?=
 =?utf-8?B?M3QwV0NDWEhtOE1COGZTOTJjdlViQ3Rocm1hRlVuMHdaU2hJNFd4Q0VKeVZX?=
 =?utf-8?B?a1JIdHJFVGVSSS8vOU1DRFZWbzR2N3ZPRjFhUFR3bVNUSVpSdDQzNk9WbEtL?=
 =?utf-8?B?d1dJYm1Cejh5U2ViUjlBRkJtMEhyRU9ybFBDcVJqa1h0cTd5dldOdktTZTdp?=
 =?utf-8?Q?5sQX4QnTpXBaprr2gglIL14zJBqtI8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZWo0RjhGbGE1Y2dubHdqWExiZ3lGT1NyZ1oxQVVQWmlPY0tzRHMrblBtYlcr?=
 =?utf-8?B?cFpiOHJFNnp5eHJERWVXekVyVWNhTS9OLzdMbjlNdUVpN1EvbHhxdzlTWVRh?=
 =?utf-8?B?cUlySkp6Y3U5dkZrbGxUOWVqZHhqVlVDaS91QXpLNVVrcHpUODFMazFHS1ZG?=
 =?utf-8?B?VWZlcWJ3OGRZUXJ5Nm1FYnIzdFloSlJndllKNzFZdXEwMktYY3hnUVk3NGVV?=
 =?utf-8?B?L3hUdFBBd3RsZGtzNXdKVmNlTThCeVhFYmlmVktmdWMvY0hyUm9Qak91Vnox?=
 =?utf-8?B?N1VsWHdKUVRLMytpU3QwaWVVTUZXU0pkc0tzeEJCVTNzdjlUd2lqeWNJOURs?=
 =?utf-8?B?ZjhvUVpnSHE2cW9idkxQZ2FxQTNCUjdNT3RUellEQy9RR0lJN05iTXpMSzZJ?=
 =?utf-8?B?UVM3NFQxNzFUZFZWc0pPdzU3NUg2ZFBoMnZmTVlMc21yang0NTBSTlpQN1Jw?=
 =?utf-8?B?WnRLWHdnSnlPeUdBNlNXQURSc2hDVHB3T29XUkV2SlY2OWd3RnpMOUZZdndD?=
 =?utf-8?B?NWlJSVpxY25tWWlwU3NpTisyTGEzVGVnb1RFWlVTZ25nM28xMmkyY0gwVlFR?=
 =?utf-8?B?ejJoYXM3QS9VSVVlYTgzNmc1MHcxN2RtRmlTaEoyUC9EbEtxYVNTdXlza1oz?=
 =?utf-8?B?STJnMGVVbGsyY3NmYVRmLzQ4RE10STgwcVlGak9MTjl3OTdKeUNPOGNuQnZF?=
 =?utf-8?B?OER0OEdUV0ROcnlZU01SamRFSE41QnhxdmxhUWNIa1JSd0FrYnVBSkRmOW1o?=
 =?utf-8?B?WFhhTmRWd0ZUTXlqSktFWmxsS2FRc0Y3RVVNTk5lb0RJUXE2TmlvYUZEZC9C?=
 =?utf-8?B?blR0RG9xSFBoeEhYbFpzbnd4MkFxQzZJVHZ2bHlNWGs2dEpWcTBIQTJGNEJJ?=
 =?utf-8?B?aURVTE9vZUNpOUgxOXBGTXgyUVlQWFFxcHNGZk5PVHo1Vnk2c2lDdEM1SzM5?=
 =?utf-8?B?aDFLU1Rnbk94dkhYYUJZMk10cGRMbFVtS2l5L0RSeU9HUUk2bFhvL3VXOHBj?=
 =?utf-8?B?SSsvQVBPN3pYVnAvTm5yWUFOTFdYV0ticnJRSUhtdWowTGNxRk1mUkladmFv?=
 =?utf-8?B?Z1JtN2lTVjNHZVNDUml3cjNncU54aWMxb3hyR1hGWGV3RjEyVG5LZ0RhK0Qy?=
 =?utf-8?B?WVBYVmlMZGpkRnc3WHF4b3QxeHB0MnpTakJIaW4vOEpUZk5UUFR2MEZ6WmJR?=
 =?utf-8?B?cDRwWi9jRWJJZittbzV6RGdPbWZSczBFUTFWNzlpcTUrY3BuM2hMNUNNVTZw?=
 =?utf-8?B?UG8za0NoSEtIZGE3YUNGZWp5amd5Uy9CaGI1RXR3SnFqOEhqNjdRdm4yNWtZ?=
 =?utf-8?B?ZnRQR3FWdzhOK09GK1c2cHdxUVJ6NzBEVEdoZ293ZDNwdDcvL0JxT3lYSG9a?=
 =?utf-8?B?Q1R0T0xLN2RvOGdTYjNZSDVkVVRhdXErZXRiTUhHK2NLbElCYlRxdXEwaDlw?=
 =?utf-8?B?U2hXS2tWL3ZSNTJHaUg1SE43NjFvWXJ5RXhNakRKMTAzOFY5UDRTV0Radzh5?=
 =?utf-8?B?RUpnU0JlRjNySktKUGhWZWQwZHJobUVLSkEwNktzM1pwRE1DenYwUzFQL0Zx?=
 =?utf-8?B?YU1rTFJzaTMxZjZORjQ0Y1VrWGdxd20rTmNYeXhSSUEyT0trS01LTnpRYmhD?=
 =?utf-8?B?STA5Z0l6dXp4OFNPNmtQSGxBQitLMDdmOFV5Q1FqN0ZGVjA1eFBPMm50VmxK?=
 =?utf-8?B?VjNCanlHU1lVRGJwV2xOZ2NNL3VMZWZ2MllMVXBYc2lGNWh2bGlaRzRDUFQ1?=
 =?utf-8?B?RWdjZDZzRkltb3FZV3FCYjhaNlB5MEU4ZnNLLytQYUlFM09PYloxdWYvSUxl?=
 =?utf-8?B?MFBNZVFpL3IxOHdxdjg4Q2tUd0V5Yzc0SHhtemptNyt1Rm16eDNvRHFjNGZJ?=
 =?utf-8?B?WXBMSGRZcGlmZ0x4UWlVallBTzlZM2piTkFKOWFjS3haUWhUOG0zSjBXSUNj?=
 =?utf-8?B?VldDSVcwWHhZQklabkZweTlaMTBuUHg1TGszbnh1bGdnaDNYQ3FlQmdhME9Q?=
 =?utf-8?B?U3Q0bjBXbndoaG5UNVJUb2J1NHp5OXlGMWh2SEV5SFk3Sk5ldGlwbS9OT0F2?=
 =?utf-8?B?VjdLTXpXdHlpd0EwYmxNTjlXdW9VN29oem5rVitMT2V3QjBLQWlRTkIzeVpP?=
 =?utf-8?Q?//2Z4YQ9WvOmuDWrWkZwz+dzA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86CCBCFDEF909A4CBC042F4DB2F63040@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xwUPGk8c2dLVC+pPaTDIVy9EJkkt7cRnIkzfbbGI/6a1MKu3FHkH0MFooE1ERHVgzSKZC0c967EiukLAacBQj83Iic4mLyDcUvSEheynaIcIqZ8Ay7svO58UYOK7x4+OUOYO/R7jcGKi2xOumGzNsLaQUNbueWSHZIhnHYwkxUnHzg6P5iPqjCA76mCH8UmaHU+PNevgGW79ZYWBVwQBlZYqt9wI2AQ3aF1fZCnMwtePKU/pYNtMkaU4ix2vK4KLGRHTIlAW9RtWyDY4uf+etwwJz0Hd3C+6mTpBg72hQtTc9uBu1OCRfkqOgutJn88EnfS9smLyoVsMjabWisvuxosIzOv79p5GTtM7oKSwCisq5Ttqv6mge0JuuaLLHZBeLixWqM7BtTx91dvWchbk1HPmnM2sBuc5qTv4nl/bb0uIWJ55hEsThBKyuS66xm7egjVhiwGc47+r0NKlURGBCMYPIhwKTOUbgBy8P5RC415bbSjCGGTPN1vRZG3YsEy00lCMvsBl0aPducM3vb21J8UB2W0YW3SJH6sPQnC2LRssU8lGTErxZLpbSWhw4dueTaYSQfudWKDFnjbFC/sIJI4SRhu4JzNpWs7wCmT8o17uM8cFfuZ2ftkdQ5Y6eMTxo8JRSZJn8+23/9XdDuPSFw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4362ca04-94f9-48f8-fa49-08dd91f0c32b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 07:35:40.8827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0VTBMJJFqwSOwzvWu4TnvXZzR0KG8d9YsbqAxzm7f4ONQy+Zhiva0Wqif+uE1O00f8Z4Zdxnky9vo8RlwUeA9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7424
X-Authority-Analysis: v=2.4 cv=Z6XsHGRA c=1 sm=1 tr=0 ts=6822f655 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=qPHU084jO2kA:10 a=gPUDdBPPaSWbe7eHRVcA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: t79rt8N83GEJ7n8CXlh0brCEvd2U5ZVl
X-Proofpoint-ORIG-GUID: t79rt8N83GEJ7n8CXlh0brCEvd2U5ZVl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDA3MSBTYWx0ZWRfXys02phRyFKoV
 0Y4vJbOKSNZcypSJjxMyZVVr7tYivwtAYrT6AAR268WnCdndh7zW6Q4t2gapht02PJ20a+G8z5d
 khcz94gq48RTKl9xyQInqStOfZBqAlfXhg1/dPoOLltrOluUzxa4nKzgHfYAZVJ0a2lB0GCID8P
 FF8fq8Kb7uiPc/l4kEFYHPhzUpMnaTcAxh5BeVDQbBZ1Cl5bffPQsnU0LZv1aI5k8ivu0an7eqM
 jccUj2mNog2iqEimeKzPLK6zzniRKdxX6V4GA4gQwtlT781oEtFbq88xX0SqdlVesENiUrKr9X8
 RKfoYkKop1qo0Bjkweyu0NEYzeIH4Ch11HfJYVEg6ks4X/pfnI06WeGem5JgORwrKw+N+hc1Q+0
 pQSzJ/YNWVfAxdy2nc7SWlKMSso/9h+POGQF0Js/daqHkoBDjxwDT2A/0pGMq1MwpWsPgIrV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 adultscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130071

SGkgTHVjYSwNCg0KDQpPbiA1LzkvMjUgMTE6MTcsIEx1Y2EgQ2VyZXNvbGkgd3JvdGU6DQo+IEhl
bGxvIEFsYW4sIE1pbmFzLA0KPiANCj4gTWluYXM6IEkgYW0gcmVwb3J0aW5nIG5ldyByZWxldmFu
dCBmaW5kaW5ncyBpbiB0aGlzIGUtbWFpbCBhbmQgaGF2ZQ0KPiBxdWVzdGlvbnMgZm9yIHlvdSBi
ZWxvdy4NCj4gDQo+IE9uIEZyaSwgMiBNYXkgMjAyNSAxMzo1NjowMSAtMDQwMA0KPiBBbGFuIFN0
ZXJuIDxzdGVybkByb3dsYW5kLmhhcnZhcmQuZWR1PiB3cm90ZToNCj4gDQo+PiBPbiBGcmksIE1h
eSAwMiwgMjAyNSBhdCAwMzo1MzowOFBNICswMjAwLCBMdWNhIENlcmVzb2xpIHdyb3RlOg0KPj4+
IEhlbGxvIEFsYW4sDQo+Pj4NCj4+PiB0aGFua3MgZm9yIHlvdXIgY29udGludWVkIHN1cHBvcnQh
DQo+Pj4NCj4+PiBPbiBUdWUsIDE1IEFwciAyMDI1IDEyOjE0OjU4IC0wNDAwDQo+Pj4gQWxhbiBT
dGVybiA8c3Rlcm5Acm93bGFuZC5oYXJ2YXJkLmVkdT4gd3JvdGU6DQo+Pj4NCj4+PiBbLi4uXQ0K
Pj4+ICAgIA0KPj4+Pj4+PiBJdCdzIHF1aXRlIHBvc3NpYmxlIHRoYXQgeW91J3JlIGdldHRpbmcg
bWVzc2VkIHVwIGJ5IGxpbmsgcG93ZXINCj4+Pj4+Pj4gbWFuYWdlbWVudCAoTFBNKS4gIEJ1dCB0
aGF0J3MganVzdCBhIGd1ZXNzLg0KPj4+Pj4NCj4+Pj4+IFdoYXQgd291bGQgYmUgYSBzeW1wdG9t
LCBpZiB0aGF0IGhhcHBlbmVkPw0KPj4+Pg0KPj4+PiBUaGUgZGVidWdnaW5nIGxvZyB3b3VsZG4n
dCBzaG93IG11Y2ggdW5sZXNzIHNvbWV0aGluZyB3ZW50IHdyb25nLiAgWW91DQo+Pj4+IGNvdWxk
IHNlZSBpZiB0aGVyZSBhcmUgYW55IGZpbGVzIGNvbnRhaW5pbmcgImxwbSIgaW4gdGhlaXIgbmFt
ZXMgaW4gdGhlDQo+Pj4+IC9zeXMvYnVzL3VzYi9kZXZpY2VzLzMtMy40LyBkaXJlY3RvcnkgKHdo
aWxlIHRoZSBkZXZpY2UgaXMgY29ubmVjdGVkKQ0KPj4+PiBhbmQgd2hhdCB0aGV5IGNvbnRhaW4u
ICBBbHNvLCB0aGVyZSdzIGEgd2F5IHRvIGRpc2FibGUgTFBNIG9uIHRoZSBob3N0DQo+Pj4+IGJ5
IHNldHRpbmcgYSB1c2Jjb3JlIHF1aXJrcyBtb2R1bGUgcGFyYW1ldGVyOg0KPj4+Pg0KPj4+PiAJ
ZWNobyAxMjA5OjAwMDE6ayA+L3N5cy9tb2R1bGUvdXNiY29yZS9wYXJhbWV0ZXJzL3F1aXJrcw0K
Pj4+DQo+Pj4gVHJpZWQgdGhpcy4gVGhlcmUgaXMgbm8gZmlsZSB3aXRoICdscG0nIGluIHRoZSBu
YW1lIGluDQo+Pj4gL3N5cy9idXMvdXNiL2RldmljZXMvMy0zLjQvLCBhbmQgYWRkaW5nIHRoZSBx
dWlyayBkaWQgbm90IGNoYW5nZSB0aGUNCj4+PiByZXN1bHQ6IHN0aWxsIGEgZGlzY29ubmVjdCBh
bmQgcmVjb25uZWN0IGluIH42IHNlY29uZHMuDQo+Pg0KPj4gT2theSwgc28gTFBNIGRvZXNuJ3Qg
c2VlbSB0byBiZSB0aGUgcmVhc29uLg0KPiANCj4gSSBzZWUsIHRoYW5rcyBmb3IgY2hlY2tpbmcu
DQo+IA0KPj4+PiBZb3UgY291bGQgYWxzbyB0cnkgY29ubmVjdGluZyBhIHVzYm1vbiB0cmFjZSBm
b3IgYnVzIDMsIHNob3dpbmcgd2hhdA0KPj4+PiBoYXBwZW5zIGR1cmluZyB0aGUgaW5pdGlhbCBj
b25uZWN0aW9uIGFuZCBlbnN1aW5nIGRpc2Nvbm5lY3Rpb24uICBBbnkNCj4+Pj4gTFBNIHRyYW5z
aXRpb25zIHdvdWxkIHNob3cgdXAgaW4gdGhlIHRyYWNlLg0KPj4+DQo+Pj4gVHJpZWQgdGhpcywg
YW5kIGhlcmUgYXJlIHRoZSBmZXcgbGluZXMgYmVmb3JlIGFuZCBhZnRlciB0aGUgNX42IHNlY29u
ZHMNCj4+PiBkZWxheS4NCj4+Pg0KPj4+IGZmZmY5OTYyMWU3Njg4NDAgNDAwOTAwOTEwMiBDIEJp
OjE6MDA5OjMgMCAyID0gNjk2ZQ0KPj4+IGZmZmY5OTYyMWU3Njg4NDAgNDAwOTAwOTEwNCBTIEJp
OjE6MDA5OjMgLTExNSAyNTYgPA0KPj4+IGZmZmY5OTYyMWU3NjgzMDAgNDAwOTAwOTExNSBTIEJp
OjE6MDA5OjMgLTExNSAyNTYgPA0KPj4+IGZmZmY5OTYyMWU3Njg4NDAgNDAwOTAwOTE0NCBDIEJp
OjE6MDA5OjMgMCA2ID0gM2EzODM1MzQgMjAzMw0KPj4+IGZmZmY5OTYyMWU3NjgzMDAgNDAwOTAw
OTE1NSBDIEJpOjE6MDA5OjMgMCAxID0gMzcNCj4+PiBmZmZmOTk2MjFlNzY4ODQwIDQwMDkwMDkx
NzggQyBCaToxOjAwOTozIDAgMiA9IDBkMGENCj4+PiBmZmZmOTk2MjFlNzY4ODQwIDQwMDkwMDkx
ODAgUyBCaToxOjAwOTozIC0xMTUgMjU2IDwNCj4+PiBmZmZmOTk2MDgwZjExOTAwIDQwMDkwMDkz
NjEgQyBDaToxOjAxNDowIDAgMjYgPSAxYTAzNDMwMCA0NDAwNDMwMCAyMDAwNDEwMCA0MzAwNGQw
MCAyMDAwNDQwMCA2MTAwNzQwMCA2MTAwDQo+Pj4gZmZmZjk5NjIxZTc2ODMwMCA0MDA5MDA5NjE1
IEMgQmk6MTowMDk6MyAwIDMgPSA1YjIwMjANCj4+PiBmZmZmOTk2MjFlNzY4MzAwIDQwMDkwMDk2
MjQgUyBCaToxOjAwOTozIC0xMTUgMjU2IDwNCj4+PiBmZmZmOTk2MjFlNzY4ODQwIDQwMDkwMDk2
NDUgQyBCaToxOjAwOTozIDAgMyA9IDIwMzIzMw0KPj4+IGZmZmY5OTYyMWU3Njg4NDAgNDAwOTAw
OTY0NiBTIEJpOjE6MDA5OjMgLTExNSAyNTYgPA0KPj4+IGZmZmY5OTYyMWU3NjgzMDAgNDAwOTAw
OTY5MiBDIEJpOjE6MDA5OjMgMCA0ID0gMmUzODM3MzgNCj4+PiBmZmZmOTk2MjFlNzY4MzAwIDQw
MDkwMDk2OTQgUyBCaToxOjAwOTozIC0xMTUgMjU2IDwNCj4+PiBmZmZmOTk2MjFlNzY4ODQwIDQw
MDkwMDk3MDMgQyBCaToxOjAwOTozIDAgMiA9IDM3MzENCj4+PiBmZmZmOTk2MjFlNzY4ODQwIDQw
MDkwMDk3MjIgUyBCaToxOjAwOTozIC0xMTUgMjU2IDwNCj4+PiBmZmZmOTk2MjFlNzY4ODQwIDQw
MDkwMDk5MzMgQyBCaToxOjAwOTozIDAgMiA9IDc0NzINCj4+DQo+PiBJdCBsb29rcyBsaWtlIGRl
dmljZSA5ICh0aGUgbGluZXMgY29udGFpbmluZyA6MTowMDk6MykgYW5kIGRldmljZSAxNCBhcmUN
Cj4+IHVucmVsYXRlZCB0byB0aGUgcHJvYmxlbTsgbmVpdGhlciBvZiB0aGVtIGlzIHlvdXIgRFdD
MiBkZXZpY2UuDQo+IA0KPiBUaGF0J3MgcHJvYmFibHkgYmVjYXVzZSBJIGhhIGNvbm5lY3RlZCBh
biBlbnRpcmUgVVNCIEhVQiB0byB0aGUgbGFwdG9wLA0KPiB3aGljaCBoYWQgaW4gdHVybiBhIFVT
Qi1zZXJpYWwgYWRhcHRlciB0byBhY2Nlc3MgdGhlIGNvbnNvbGUgb24gdGhlDQo+IGJvYXJkIGhl
YWRlcnMuIEkgdW5kZXJzdGFuZCB0aGlzIGNyZWF0ZXMgbW9yZSBub2lzZSwgc28gSSBjaGFuZ2Vk
IG15DQo+IHNldHVwIGxhdGVyIG9uIHRvIG9ubHkgY29ubmVjdCB0aGUgcmVsZXZhbnQgY2FibGUu
DQo+IA0KPj4+IDw8PCA2IHNlY29uZHMgZGVsYXkgPj4+DQo+Pj4NCj4+PiBmZmZmOTk2MDgyOGU5
NTQwIDQwMTQ3OTYxMjggQyBJaToxOjAwMToxIDA6MjA0OCAyID0gMTAwMA0KPj4+IGZmZmY5OTYw
ODI4ZTk1NDAgNDAxNDc5NjE0NSBTIElpOjE6MDAxOjEgLTExNToyMDQ4IDQgPA0KPj4+IGZmZmY5
OTYwODBmMTE5MDAgNDAxNDc5NjE2MiBTIENpOjE6MDAxOjAgcyBhMyAwMCAwMDAwIDAwMDQgMDAw
NCA0IDwNCj4+PiBmZmZmOTk2MDgwZjExOTAwIDQwMTQ3OTYxODkgQyBDaToxOjAwMTowIDAgNCA9
IDAwMDEwMTAwDQo+Pg0KPj4gVGhpcyBzaG93cyB0aGUgaG9zdCBzeXN0ZW0gcmVjZWl2aW5nIGEg
ZGlzY29ubmVjdCBub3RpZmljYXRpb24gKGZvciBwb3J0DQo+PiA0KSBmcm9tIHRoZSBoYXJkd2Fy
ZS4gIFdoaWNoIGlzIG9kZCwgYmVjYXVzZSBlYXJsaWVyIHlvdSBzYWlkIHRoZSBkZXZpY2UNCj4+
IHdhcyAzLTMuNCwgaW5kaWNhdGluZyB0aGF0IGl0IHdhcyBwbHVnZ2VkIGludG8gYSBodWIsIG5v
dCBkaXJlY3RseSBpbnRvDQo+PiB0aGUgaG9zdCBjb250cm9sbGVyLiAgQnV0IHRoZSBub3RpZmlj
YXRpb24gaGVyZSBjb21lcyBmcm9tIHRoZSBob3N0DQo+PiBjb250cm9sbGVyLg0KPj4NCj4+IE9u
IHRoZSBvdGhlciBoYW5kLCBhbiBldmVuIGVhcmxpZXIgZW1haWwgc2FpZCB0aGF0IHRoZSBkZXZp
Y2Ugd2FzIDMtMiwNCj4+IGluZGljYXRpbmcgaXQgX3dhc18gcGx1Z2dlZCBkaXJlY3RseSBpbnRv
IHRoZSBob3N0IGNvbnRyb2xsZXINCj4+DQo+PiBXaGljaCBtZWFucyB5b3UndmUgYmVlbiBjaGFu
Z2luZyB5b3VyIHNldHVwIHdoaWxlIHJ1bm5pbmcgdGhlc2UgdGVzdHMuDQo+PiBOb3QgYSBnb29k
IGlkZWEuDQo+IA0KPiBJIGhhZCB0byBjaGFuZ2UgbGFwdG9wIGJlY2F1c2UgcmVhZGluZyB1c2Jt
b24gZGVidWdmcyBmaWxlcyBpcyBub3QNCj4gd29ya2luZyBvbiBteSBtYWluIGxhcHRvcC4gSSBz
dGlsbCBoYXZlbid0IGZpZ3VyZWQgb3V0IHRoZSByZWFzb24sIGJ1dA0KPiBvbiB0aGUgb3RoZXIg
bGFwdG9wIGl0IHdvcmtzLCBidXQgdW5hdm9pZGFibHkgaXQgY2hhbmdlcyB0aGUgYnVzDQo+IG51
bWJlci4gU29ycnkgYWJvdXQgdGhhdC4NCj4gDQo+Pj4gZmZmZjk5NjA4MGYxMTkwMCA0MDE0Nzk2
MjAxIFMgQ286MTowMDE6MCBzIDIzIDAxIDAwMTAgMDAwNCAwMDAwIDANCj4+PiBmZmZmOTk2MDgw
ZjExOTAwIDQwMTQ3OTYyMTkgQyBDbzoxOjAwMTowIDAgMA0KPj4+IGZmZmY5OTYwODBmMTEwMDAg
NDAxNDc5OTYyNyBTIENpOjE6MDAxOjAgcyBhMyAwMCAwMDAwIDAwMDQgMDAwNCA0IDwNCj4+PiBm
ZmZmOTk2MDgwZjExMDAwIDQwMTQ3OTk2NzkgQyBDaToxOjAwMTowIDAgNCA9IDAwMDEwMDAwDQo+
Pj4gZmZmZjk5NjA4MGYxMTAwMCA0MDE0ODI2MTMyIFMgQ2k6MTowMDE6MCBzIGEzIDAwIDAwMDAg
MDAwNCAwMDA0IDQgPA0KPj4+IGZmZmY5OTYwODBmMTEwMDAgNDAxNDgyNjE2NiBDIENpOjE6MDAx
OjAgMCA0ID0gMDAwMTAwMDANCj4+PiBmZmZmOTk2MDgwZjExMDAwIDQwMTQ4NTIwNzUgUyBDaTox
OjAwMTowIHMgYTMgMDAgMDAwMCAwMDA0IDAwMDQgNCA8DQo+Pj4gZmZmZjk5NjA4MGYxMTAwMCA0
MDE0ODUyMTIyIEMgQ2k6MTowMDE6MCAwIDQgPSAwMDAxMDAwMA0KPj4+IGZmZmY5OTYwODBmMTEw
MDAgNDAxNDg3ODIxMCBTIENpOjE6MDAxOjAgcyBhMyAwMCAwMDAwIDAwMDQgMDAwNCA0IDwNCj4+
PiBmZmZmOTk2MDgwZjExMDAwIDQwMTQ4NzgyNTMgQyBDaToxOjAwMTowIDAgNCA9IDAwMDEwMDAw
DQo+Pj4gZmZmZjk5NjA4MGYxMTAwMCA0MDE0OTA0MDQ5IFMgQ2k6MTowMDE6MCBzIGEzIDAwIDAw
MDAgMDAwNCAwMDA0IDQgPA0KPj4+IGZmZmY5OTYwODBmMTEwMDAgNDAxNDkwNDA4OCBDIENpOjE6
MDAxOjAgMCA0ID0gMDAwMTAwMDANCj4+PiBmZmZmOTk2MDgyOGU5NTQwIDQwMTQ5NDg0MjcgQyBJ
aToxOjAwMToxIDA6MjA0OCAyID0gMTAwMA0KPj4+IGZmZmY5OTYwODI4ZTk1NDAgNDAxNDk0ODQ1
NiBTIElpOjE6MDAxOjEgLTExNToyMDQ4IDQgPA0KPj4+IGZmZmY5OTYyMWU3NjgzMDAgNDAxNDk0
ODQ2MSBDIEJpOjE6MDA5OjMgMCAyID0gNWIyMA0KPj4+IGZmZmY5OTYyMWU3NjgzMDAgNDAxNDk0
ODQ3MiBTIEJpOjE6MDA5OjMgLTExNSAyNTYgPA0KPj4+IGZmZmY5OTYyMWU3Njg4NDAgNDAxNDk0
ODQ4OCBDIEJpOjE6MDA5OjMgMCAyID0gMjAyMA0KPj4+IGZmZmY5OTYyMWU3Njg4NDAgNDAxNDk0
ODQ4OSBTIEJpOjE6MDA5OjMgLTExNSAyNTYgPA0KPj4+IGZmZmY5OTYwODBmMTEwMDAgNDAxNDk0
ODUyMiBTIENpOjE6MDAxOjAgcyBhMyAwMCAwMDAwIDAwMDQgMDAwNCA0IDwNCj4+PiBmZmZmOTk2
MjFlNzY4MzAwIDQwMTQ5NDg1NDUgQyBCaToxOjAwOTozIDAgNTggPSAzMjM5MmUzOCAzMTM3MzMz
NyAzMjVkMjAzZSAzZTNlMjA2NCA3NzYzMzI1ZiA2ODYxNmU2NCA2YzY1NWY2MyA2ZjZkNmQ2Zg0K
Pj4+IGZmZmY5OTYyMWU3NjgzMDAgNDAxNDk0ODU2MCBTIEJpOjE6MDA5OjMgLTExNSAyNTYgPA0K
Pj4+IGZmZmY5OTYwODBmMTEwMDAgNDAxNDk0ODYwNyBDIENpOjE6MDAxOjAgMCA0ID0gMDEwMTAx
MDANCj4+DQo+PiBBbmQgdGhlbiBhYm91dCAxNTAgbXMgbGF0ZXIgKHRoZSBzZWNvbmQgY29sdW1u
IG9mIHRoZSBsb2cgaXMgYQ0KPj4gdGltZXN0YW1wLCBpbiBtaWNyb3NlY29uZHMpLCBhIGNvbm5l
Y3Rpb24gbm90aWZpY2F0aW9uLiAgTm90aGluZw0KPj4gcHJlY2VkaW5nIHRoZSBkaXNjb25uZWN0
IHRvIGV4cGxhaW4gd2hhdCBjYXVzZWQgaXQuDQo+Pg0KPj4+IGZmZmY5OTYyMWU3Njg4NDAgNDAx
NDk0ODYzOSBDIEJpOjE6MDA5OjMgMCAxMCA9IDM3Mzk1ZDIwIDNlM2UzZTIwIDY0NzcNCj4+PiBm
ZmZmOTk2MjFlNzY4ODQwIDQwMTQ5NDg2NDQgUyBCaToxOjAwOTozIC0xMTUgMjU2IDwNCj4+PiBm
ZmZmOTk2MjFlNzY4MzAwIDQwMTQ5NDg2NTcgQyBCaToxOjAwOTozIDAgMyA9IDYzMzI1Zg0KPj4+
IGZmZmY5OTYyMWU3NjgzMDAgNDAxNDk0ODY2MyBTIEJpOjE6MDA5OjMgLTExNSAyNTYgPA0KPj4+
IGZmZmY5OTYyMWU3Njg4NDAgNDAxNDk0ODY4OSBDIEJpOjE6MDA5OjMgMCA1ID0gNjg3MzZmNzQg
NjcNCj4+PiBmZmZmOTk2MjFlNzY4ODQwIDQwMTQ5NDg2OTMgUyBCaToxOjAwOTozIC0xMTUgMjU2
IDwNCj4+PiBmZmZmOTk2MjFlNzY4MzAwIDQwMTQ5NDg3MTggQyBCaToxOjAwOTozIDAgMiA9IDVm
NjkNCj4+PiBmZmZmOTk2MjFlNzY4MzAwIDQwMTQ5NDg3MjAgUyBCaToxOjAwOTozIC0xMTUgMjU2
IDwNCj4+PiBmZmZmOTk2MjFlNzY4ODQwIDQwMTQ5NDg3NTkgQyBCaToxOjAwOTozIDAgNCA9IDcy
NzEzYTMzDQo+Pg0KPj4gVW5yZWxhdGVkIG1hdGVyaWFsLiAgRXZpZGVudGx5IGRldmljZSA5IGlz
IHJ1bm5pbmcgc29tZSBzb3J0IG9mDQo+PiBzZXJpYWwgY29ubmVjdGlvbiwgYmVjYXVzZSBldmVy
eXRoaW5nIGl0IHNlbmRzIGxvb2tzIGxpa2UgQVNDSUkNCj4+IGNoYXJhY3RlcnMuDQo+IA0KPiBQ
ZXJoYXBzIHRoZSBVU0Itc2VyaWFsIEkgbWVudGlvbmVkIGFib3ZlLCB0byBhY2Nlc3MgdGhlIGJv
YXJkIGNvbnNvbGUuDQo+IA0KPj4+IEhvd2V2ZXIgSUlVQyBib3RoIHRoZSB1c2Jtb24gZGVidWdm
cyBpbnRlcmZhY2UgYW5kIFdpcmVzaGFyayBhcmUgdW5hYmxlDQo+Pj4gdG8gY2FwdHVyZSBkaXNj
b25uZWN0aW9uIGV2ZW50cyBiZWNhdXNlIHRoYXQncyBoYW5kbGVkIGJ5IHRoZSBoYXJkd2FyZS4N
Cj4+PiBDb3JyZWN0Pw0KPj4NCj4+IEknbSBub3QgcXVpdGUgc3VyZSBob3cgdG8gYW5zd2VyLiAg
WWVzLCB0aGUgaGFyZHdhcmUgaGFuZGxlcw0KPj4gZGlzY29ubmVjdGlvbnMgLS0gYmVjYXVzZSB0
aGUgaGFyZHdhcmUgaGFuZGxlcyBfZXZlcnl0aGluZ18gdGhhdCBoYXBwZW5zDQo+PiBvbiB0aGUg
VVNCIGJ1cy4gIEFuZCBvbmUgb2YgdGhlIHRoaW5ncyB0aGUgaGFyZHdhcmUgZG9lcyB3aGVuIGhh
bmRsaW5nDQo+PiBkaXNjb25uZWN0aW9ucyBpcyB0byB0ZWxsIHRoZSBkcml2ZXIgdGhhdCBvbmUg
b2NjdXJyZWQ7IHRoYXQncyB3aHkgdGhlDQo+PiByZXBvcnQgc2hvd3MgdXAgaW4gdGhlIHVzYm1v
biAob3IgV2lyZXNoYXJrKSB0cmFjZS4NCj4+DQo+PiBBIFVTQiBhbmFseXplciBjb3VsZCB0ZWxs
IHlvdSBleGFjdGx5IHdoYXQncyBoYXBwZW5pbmcgb24gdGhlIHdpcmUsIGJ1dA0KPj4gdGhleSBh
cmUgZXhwZW5zaXZlLiAgQW5kIGluIHRoaXMgY2FzZSwgSSB0aGluayBhbGwgaXQgd291bGQgdGVs
bCB5b3UgaXMNCj4+IHdoYXQgd2UgYWxyZWFkeSBrbm93OiB0aGF0IGEgZGlzY29ubmVjdCBoYXBw
ZW5lZC4NCj4+DQo+PiBUaGUgZmFjdCB0aGF0IHRoZSBkaXNjb25uZWN0cyBkb24ndCBoYXBwZW4g
d2l0aCB0aGUgdmVuZG9yIGtlcm5lbA0KPj4gaW5kaWNhdGVzIHRoYXQgdGhleSBhcmVuJ3QgY2F1
c2VkIGJ5IGEgaGFyZHdhcmUgcHJvYmxlbSwgc3VjaCBhcyBhIGJhZA0KPj4gY2FibGUgbGluaywg
YnV0IHJhdGhlciBieSBzb21ldGhpbmcgaW4gdGhlIGRldmljZSdzIHNvZnR3YXJlLCBpLmUuLCB0
aGUNCj4+IGR3YzIgZHJpdmVyLg0KPj4NCj4+IEkgZG9uJ3Qga25vdyBhbnl0aGluZyBhYm91dCB0
aGF0IGRyaXZlciwgdGhvdWdoLiAgTWluYXMgaXMgdGhlIGV4cGVydC4NCj4+IFlvdSByZWFsbHkg
bmVlZCBoaXMgYWR2aWNlLg0KPiANCj4gSW4gdGhlIG1lYW53aGlsZSBJIGRpZCB0d28gZXZlbnQg
Y2FwdHVyZXMsIG9uZSB3aXRoIHRoZSBtYWlubGluZSBrZXJuZWwNCj4gYW5kIG9uZSB3aXRoIHRo
ZSB2ZW5kb3Iga2VybmVsLCB1c2luZyB0aGUgc2FtZSBsYXB0b3Agc2V0dXAgYW5kIG5vIGh1Yg0K
PiBpbiBiZXR3ZWVuLCBhbmQgZm9yIGVhY2ggdGVzdCBJIGNhcHR1cmVkIGJvdGggdGhlIHVzYm1v
biBsb2cgYW5kIGENCj4gd2lyZXNoYXJrIGZpbGUuIEJvdGggYXJlIGF2YWlsYWJsZSBpZiBuZWVk
ZWQuDQo+IA0KPiBCeSBhbmFseXppbmcgdGhvc2UgY2FwdHVyZXMgSSBmb3VuZCB0aGF0IHRoZSBj
b21tdW5pY2F0aW9uIGJldHdlZW4gaG9zdA0KPiBhbmQgZ2FkZ2V0IGlzIGFsbW9zdCBpZGVudGlj
YWwuIFRoZSBvbmx5IGRpZmZlcmVuY2VpcyB0aGUgZ2V0DQo+IGNvbmZpZ3VyYXRpb24gZGVzY3Jp
cHRvciByZXNwb25zZSBoYXMgb25lIG1vcmUgZGVzY3JpcHRvciBpbiB0aGUgdmVuZG9yDQo+IGNh
c2UgKHRoZSB3b3JraW5nIG9uZSkuIEhlcmUgaXQgaXM6DQo+IA0KPiBPVEcgRGVzY3JpcHRvcjoN
Cj4gICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgMw0KPiAgICBiRGVzY3JpcHRvclR5cGUgICAg
ICAgICA5DQo+ICAgIGJtQXR0cmlidXRlcyAgICAgICAgIDB4MDMNCj4gICAgICBTUlAgKFNlc3Np
b24gUmVxdWVzdCBQcm90b2NvbCkNCj4gICAgICBITlAgKEhvc3QgTmVnb3RpYXRpb24gUHJvdG9j
b2wpDQo+IA0KPiBJIGRvbid0IGtub3cgZXhhY3R5IHdoYXQgdGhhdCBpbXBsaWVzLCBidXQgZm9y
IGEgcXVpY2sgdGVzdCBJIHdlbnQgaW4NCj4gdGhlIG1haW5saW5lIGtlcm5lbCBhbmQgZm91bmQg
dGhhdCBpdCBjYW4gYWRkIHRoZSBzYW1lIGRlc2NyaXB0b3IgaWYNCj4gYm90aCBvZiB0aGVzZSBp
cyB0cnVlOg0KPiANCj4gICAqIGRyX21vZGUgPSAib3RnIiBpbiBkZXZpY2UgdHJlZQ0KPiAgICog
IkRXQzIgTW9kZSBTZWxlY3Rpb24iIGlzICJEdWFsIHJvbGUgbW9kZSIgaW4ga2NvbmZpZw0KPiAg
ICAgKGkuZS4gQ09ORklHX1VTQl9EV0MyX0RVQUxfUk9MRT15KQ0KPiANCj4gV2hpbGUgSSBoYWQ6
DQo+IA0KPiAgICogZHJfbW9kZSA9ICJwZXJpcGhlcmFsIg0KPiAgICogIkRXQzIgTW9kZSBTZWxl
Y3Rpb24iID0gIkdhZGdldCBvbmx5IG1vZGUiDQo+ICAgICAoaS5lLiBDT05GSUdfVVNCX0RXQzJf
UEVSSVBIRVJBTD15KQ0KPiANCj4gV2l0aCB0aG9zZSB0d28gY2hhbmdlcyB0aGUgbWFpbmxpbmUg
a2VybmVsIG5vdyBiZWhhdmVzIGNvcnJlY3RseSwganVzdA0KPiBsaWtlIHRoZSB2ZW5kb3Iga2Vy
bmVsLiBObyBtb3JlIGRpc2Nvbm5lY3Rpb24gYWZ0ZXIgNS02IHNlY29uZHMuDQo+IA0KPiBGb3Ig
dGhlIHJlY29yZHMsIHRoZSB2ZW5kb3Iga2VybmVsIGFscmVhZHkgaGFkIGRyX21vZGUgPSAib3Rn
IiBhbmQNCj4gQ09ORklHX1VTQl9EV0MyX0RVQUxfUk9MRT15Lg0KPiANCj4gQmFzZWQgb24gbXkg
dmVyeSBsaW1pdGVkIGtub3dsZWRnZSBvZiBVU0IsIGludHVpdGl2ZWx5IGl0IGxvb2tzIHRoYXQ6
DQo+IA0KPiAgICogaW4gcGVyaXBoZXJhbC1vbmx5IG1vZGUgdGhlIE9URyBEZXNjcmlwdG9yIHNo
b3VsZCBub3QgYmUgc2VudA0KPiAgICogaW4gcGVyaXBoZXJhbC1vbmx5IG1vZGUgU1JQIGRvZXMg
bm90IG1ha2Ugc2Vuc2UNCj4gICAqIGluIHBlcmlwaGVyYWwtb25seSBtb2RlIEhOUCBkb2VzIG5v
dCBtYWtlIHNlbnNlDQo+IA0KPiBBcmUgdGhlIGFib3ZlIGNvcnJlY3Q/DQo+IA0KPiBXaGV0aGVy
IHRoZSBhbnN3ZXIsIEkgdGhpbmsgdGhlc2UgbmV3IGZpbmRpbmdzIGRvIG5vdCB5ZXQgZXhwbGFp
biB0aGUNCj4gcHJvYmxlbSBub3IgcG9pbnQgdG8gYSBjb3JyZWN0IHNvbHV0aW9uLiBBcGFydCBm
cm9tIHRoZSBhZGRlZA0KPiBkZXNjcmlwdG9yLCBhbGwgb2YgdGhlIGluaXRpYWwgZW51bWVyYXRp
b24gZXZlbnRzIHNlZW4gYnkgdXNibW9uIGlzDQo+IGlkZW50aWNhbCBpbiB0aGUgdHdvIGNhc2Vz
Lg0KPiANCj4gTWluYXMsIHdlcmUgeW91IGFibGUgdG8gaGF2ZSBhIGxvb2sgYXQgdGhlIGluZm8g
SSBjb2xsZWN0ZWQ/DQo+IERvIHRoZXkgc3VnZ2VzdGluZyB5b3UgYW55dGhpbmcgYWJvdXQgdGhl
IGR3YzIgZHJpdmVyPw0KPiANCkNvbmZpZ3VyYXRpb24gcGFyYW1ldGVyczogQ09ORklHX1VTQl9E
V0MyX0hPU1QsIA0KQ09ORklHX1VTQl9EV0MyX1BFUklQSEVSQUwgYW5kIENPTkZJR19VU0JfRFdD
Ml9EVUFMX1JPTEUgaGF2ZSBpbXBhY3QgDQpvbmx5IG9uIGJ1aWxkIHByb2Nlc3MuIEJhc2VkIG9u
IHRoZXNlIHBhcmFtZXRlcnMgZHJpdmVyIGNhbiBidWlsZCBhcyANCmhvc3Qgb25seSwgZGV2aWNl
IG9ubHkgb3IgaG9zdCArIGRldmljZS4NCg0KT1RHIGZ1bmN0aW9uYWxpdHkgb2YgZGVwZW5kIG9u
Og0KMS4gT24gY29yZSBjb25maWd1cmF0aW9uIC0gR0hXQ0ZHMiBiaXRzIDA6MjoNCk1vZGUgb2Yg
T3BlcmF0aW9uIChPdGdNb2RlKQ0KMydiMDAwOiBITlAtIGFuZCBTUlAtQ2FwYWJsZSBPVEcgKEhv
c3QgJiBEZXZpY2UpDQozJ2IwMDE6IFNSUC1DYXBhYmxlIE9URyAoSG9zdCAmIERldmljZSkNCjMn
YjAxMDogTm9uLUhOUCBhbmQgTm9uLVNSUCBDYXBhYmxlIE9URyAoSG9zdCBhbmQgRGV2aWNlKQ0K
MydiMDExOiBTUlAtQ2FwYWJsZSBEZXZpY2UNCjMnYjEwMDogTm9uLU9URyBEZXZpY2UNCjMnYjEw
MTogU1JQLUNhcGFibGUgSG9zdA0KMydiMTEwOiBOb24tT1RHIEhvc3QNCk90aGVyczogUmVzZXJ2
ZWQNCkFzIHlvdSBjYW4gc2VlIGFib3ZlLCBkZXZpY2Ugb25seSBtb2RlIGNhbiBzdXBwb3J0IE9U
RywgaS5lLiANCiJTUlAtY2FwYWJsZSBkZXZpY2UiLg0KQmFzZWQgb24gcHJvdmlkZWQgT1RHIGRl
c2NyaXB0b3IgeW91ciBjb3JlJ3MgT1RHIG1vZGUgaXMgZXF1YWwgdG8gMCwgDQp3aGljaCBtZWFu
cyAiSE5QLSBhbmQgU1JQLUNhcGFibGUgT1RHIChIb3N0ICYgRGV2aWNlKSIuDQoyLiBEZXBlbmQg
b24gcGxhdGZvcm0gKHNlZSBkd2MyL3BhcmFtLmMpIE9URyBmdW5jdGlvbmFsaXR5IGNhbiBiZSAN
CnVwZGF0ZWQsIGlmIGl0IGFsbG93ZWQgYnkgYWJvdmUgY29yZSBjb25maWd1cmF0aW9uIE9URyBw
YXJhbWV0ZXIuDQozLiBPVEcgZnVuY3Rpb25hbGl0eSBjYW4gdXBkYXRlZCBhbHNvIHRocm91Z2gg
ZGV2aWNldHJlZSBwYXJhbWV0ZXJzIA0Kc2V0dGluZ3MuDQoNClRoYW5rcywNCk1pbmFzDQoNCj4g
QmVzdCByZWdhcmRzLA0KPiBMdWNhDQo+IA==

