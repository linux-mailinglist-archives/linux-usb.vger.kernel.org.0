Return-Path: <linux-usb+bounces-34033-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFiEI2vdqGlmyAAAu9opvQ
	(envelope-from <linux-usb+bounces-34033-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 02:33:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8632209DEC
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 02:33:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6826301AD36
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 01:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624A919E98D;
	Thu,  5 Mar 2026 01:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="vm3dKhU8";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BO0II496";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OYEYBfDX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D4378F4A
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 01:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772674406; cv=fail; b=ME3ghHhYSU8u1YU8mdrGMO4wMo+4rw8dOtPJI8WBUJmxW8LIvl7MpizaDiu2vEqkeQ7qLRRXDaYlFSUs/HcRQQVk1ocSKz2OGGPCbnH3pIVvoTilR+kGWIatoHNFOcwzWR2bnSQpFC5k9L2w4KBwUe61/ThblYalPlhvXTNlMTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772674406; c=relaxed/simple;
	bh=zRI4zsgeO0xBkldXvhM+XMQYk0xnC/wN6KRPhFAUxOM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sg2lAuOLSEO7PHX2j6sMNX9PLpTXp6cfNizZSvEwKtIju+KA9mwqO23cgIXX5bKc2bg6UDF+aa+T5tyvAGKTuMnukSToVsv5isNrE2YHGknqIhUVV/3XeRGlntegQPz6/D4thD3ROdfdTtLYhaVBOcXlw1VsNIcYGp879wx6NyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=vm3dKhU8; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BO0II496; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OYEYBfDX reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6250jOA23758863;
	Wed, 4 Mar 2026 17:32:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=zRI4zsgeO0xBkldXvhM+XMQYk0xnC/wN6KRPhFAUxOM=; b=
	vm3dKhU858cVv4AhdXEkXfFreLJsiyMI6Lv5Xg6fxs56r5t/xKpuITN1ExTUv9gw
	+Vj7S2zn2QetU6btoWJ0mglzTc/Nu/hO/nhzw7RtRZ377HfCZR2vG8deYSRKTWuu
	V39W4hein1PVOvpf/NgFbL9LK4O3S+io8cLVt7DAJjQFW7R/4Ylcb3e6rMrPbLJp
	0cVEO6sTPEAYNT3trY3Vm8o82D++u59BfNk+rhvjCppZD5fzWg9rBV0fg7Sot4Ud
	o4N+PfO7F9RBTVEdQEf2qhF9TNDOULSzdXXMbjvRWr8Op6DSzE3W4HECQ6izcC9J
	oRBRF7GMmDyuEcZQYvYRcA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4cpq0skw0j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 17:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772674376; bh=zRI4zsgeO0xBkldXvhM+XMQYk0xnC/wN6KRPhFAUxOM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=BO0II496jRS7/sQ5TwIkRGOXxj5D+R9mudgJzPovoUAByqux2hHOP+MBSA7jCjanF
	 a6RMnIRnMvtCqpvlWOOiapvztJ1gwzXh3/dLCngiwGYoqyNN2CKYmyAefwyynp9Ssp
	 FmhJqwdFZkfyaAT2dTcsNrHgLKZULOsX5HUilEqHm3KqddflbxGMmoAlXubn9RU8wc
	 WdkwhqGJbmwlrs+xoRG/cwRekV5AIfwfiFgXZByw3jc1/5hIWCUWkAwMPpSokOBoD2
	 FM3K2iCGzgWiHYh8axhGZP6Mebt1UYmSgQyXSAhOVX0Ga0kTCWSzxhb7aVj3r8pxwe
	 Gulxd8TI9TojQ==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 516FA40359;
	Thu,  5 Mar 2026 01:32:55 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id BBADEA006D;
	Thu,  5 Mar 2026 01:32:55 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=OYEYBfDX;
	dkim-atps=neutral
Received: from BL2PR08CU001.outbound.protection.outlook.com (mail-bl2pr08cu00104.outbound.protection.outlook.com [40.93.4.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E7A1F22019D;
	Thu,  5 Mar 2026 01:32:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZcsudYG+xs0ZGYRHCPNwU1G91eaVZ2w6OBa6hoPrHvJaNeNShf8nlwwgRFvrepaeDRCJmj2mj3OnWFC2ZS9TH9FUsE7ffUld9y6jand8gTbik9Ef0EsOHZJqSD9zWmJKmlnrGG66GqqhOzF6W+yicH4fKo+aDNS/pclWZF6aZUYvA3xsqvVilcedfbyQDk0pRr7ntY5UH5s6GhPlRjIDdRXvcHXvIRvb1DOlO57Z5B6Xmbat4fwSIRACpmLZSsEmL7npZcUJUGGpaKJjejaL84a0+zsnfS/QuXRg+OT1n/wM+3x93s3E0mm76OTQLENtTlyMfrItnhmXq0IQ9lfDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRI4zsgeO0xBkldXvhM+XMQYk0xnC/wN6KRPhFAUxOM=;
 b=vLxcee2HQslm44I+8r1FW+ghUmkKVtBNOXwwgEHHxgpyVEN4CDlwgA7Q8a2kRoBKMv95KhAKt87qTJpHak1Rt/G8Ivz84hpXRH+YQrfuKme6poSZeknROvEEyRVwsImwN9E2k5aJz7l2nFsL6w73eo0x3lYhO4KC/7BNZxISzXRwn/yFgkL9I0+Vpf/8/2ewwI8d7o4DfWcCxkyWTjyLQRlsUdY/NKQRINMz1u+fCo4Ct4jXiQ0bDZDCVB9vIwWzKtV3HziACW4JcNq23hS9tPxsLALOfE97kb/49ebw5zzyuyoSeZqSu77mf0MeheeR2UxV+/kIk2Q7r2NAwJ+UMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRI4zsgeO0xBkldXvhM+XMQYk0xnC/wN6KRPhFAUxOM=;
 b=OYEYBfDXvzU2V1rX/Gj18ByzQKrTx7wbrJlSi+XbIdLXM25vTIoEeeRpCad4ws//DsE7F44nKxeY0JEaBYhYzT4U6GGsyLL/M3GqD9I9ZPS0sUfRZK59josEP5DgVN4s7vkitIy3Y+2vc+dYBQt6ZshILw0WczogW0/rKtuhTeg=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH8PR12MB7304.namprd12.prod.outlook.com (2603:10b6:510:217::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 01:32:50 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 01:32:49 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4 1/1] usb: dwc3: Support USB3340x ULPI PHY high-speed
 negotiation.
Thread-Topic: [PATCH v4 1/1] usb: dwc3: Support USB3340x ULPI PHY high-speed
 negotiation.
Thread-Index: AQHcqxLp0pUIg5FEREKD5oHwYzLXXrWdeqGAgAEFf4CAAKmoAA==
Date: Thu, 5 Mar 2026 01:32:49 +0000
Message-ID: <20260305013244.4amgw3bjxxod3aw4@synopsys.com>
References: <20260303133720.17167-1-ingo.rohloff@lauterbach.com>
 <20260303133720.17167-2-ingo.rohloff@lauterbach.com>
 <20260303234935.zusemc7tvnmetpbs@synopsys.com>
 <20260304162531.5548aaeb@ingpc2.intern.lauterbach.com>
In-Reply-To: <20260304162531.5548aaeb@ingpc2.intern.lauterbach.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH8PR12MB7304:EE_
x-ms-office365-filtering-correlation-id: 94064150-ff6b-498c-9740-08de7a571cde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 CXo04l9j7JUxHEt5b5GMwda7sLb+dM4X560xHug6/7bxGIIZ2AhjZCqDi/Kgfp9BLIlIIsDxByvuFFl2rlFeMbFNdISuughKWleN4k0OXQ8woQ+WUKZECZqDkfr+AOIWnog5lCOAoDWxEWdrnO4LCl7UqEXucbsfn2/LiCeWB/44oYnAK1RRLL+iS5e055EJhyynnNoiTMXTQqMqX5UP89F/2C11DyuHCMjXSB/WfwuOeriII4R40KbkzXB3DQZDBnsW8s/Rtot1mBlLcjq6v8CRRskAgPSjZOsjl9dj2062dLYMddDpL0a9DvX+icbwyRPH/QbFvhezROdsb1p7GncamXufoYYaW61m6JE0Bd5QFJBe02Olc3K5dQ9t+XNhNK+ZdJB3a3e4bsKIvEOKcRYFrzWUkQIV4f8MQorr3+n6glduIs6DQmpdk7bbnZez4K8dTjsaAGYGntS+K/jU+L0F7E7F3sEzU2xodu/8kZaubRzpkqfnIbBJXPWTUEhW828v88nq+eP83XtmaPkMmxHJvCuF8ff6+DwqS2Pm421j/zLXMEtMrrbSJ0NIQ0u6FoXMddFgLWx3D8quV+CXP08WvJkULWV0GTAHmi1WvMt/iiadmz2pfsAPPCSmDKPpqT4TAYDABTLz7pDYZaKaZP5ANXqegor8EzaUjEXg2TA3xfURGz7StXH00bCTnJSbcst0prBwdNW9FaoyOe2H7+akEn0ChBL+IWYcV27iKY5CDe38UmQvB9NDQhi7KjVYkMmpd0rJq8udtn+c22pBxmSlu2G2a+IDFSldA/p8Ncc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b2Nod3JGWjJGN2NsMjk1LzN5Uks4VmdVZ3ZPRm8xRkR0Rkk0b1pxTUJaVGor?=
 =?utf-8?B?UlJQY0szZjZjUHJIRFdqRy9SUmI1MXh5NGNYOFR6WmU2YzQ5UmNaOUxxZVBz?=
 =?utf-8?B?OUlvYmp3SDJjcytualpuZjI1RTNKT2ZncmJPSXZZU3UwbDFBcGhLa0wzOHZ2?=
 =?utf-8?B?cFRVRThUY0w1TVJ3OVgzK2RwaHAwZVJsc2NWZnNLbUpxMEljNW9WOG9GdHZa?=
 =?utf-8?B?cVREK0tEOUF5ckpnOGZQNUFNM1k2MU1uczJOekJpNDE2WENSWHNOUjFPSHNr?=
 =?utf-8?B?Z3pvZGVFT29FZXBsNDM3MkFPRjBoTGNCL2tzRGFzblBzUUpYQ3Y3SWIvbm5O?=
 =?utf-8?B?QXhGQThYSElqQzFVbEZFMXhrUkUvUGdHN2JoMi9xcmVvUS9RSkE1TEFTdTRa?=
 =?utf-8?B?OTZHck4wT0xFSnhxb245ejBKWE9aS3hTSnd6SC9iRFhGRzFzK1JKU2orSito?=
 =?utf-8?B?VlBnaVdKTHc3SkxpVjhIdTZna1V2dHRQaXEyVXBFZ1Q5MS96QlQ2ZUZuVWxP?=
 =?utf-8?B?MzVPRTUvRFFaT1hqMGdIZldCeDhyYkZFdzY5a045NDJMdmpUUzNmMURDNFZH?=
 =?utf-8?B?YTE5YmJta2RaTnZCTDE2eTZ3dCtvT1d4cVBlMVdlemxHYWJwSWtxZk9OdjF0?=
 =?utf-8?B?Mk1hTFB2bmhBY2pUbVAzRzlHVXQxQW52enVWUXcyaENHTEVEQlZqeVhtcnVU?=
 =?utf-8?B?dGpIY0pvd1hGNFdLellTWkU4OW8wdE0vSkpZTVZxZ3RpSHYwblRkc24zNlFS?=
 =?utf-8?B?VjI5MmhiZDJvK05XSG5VNkVIcjlxZzRDbHE2TkdrZTFhMVZSc2ZPb045dVdp?=
 =?utf-8?B?R0RheUNtZWppTkUzWGdvY0hpYXZLTEtvTUhkV0JHWmtsUFpJdWZNZE5xVGZD?=
 =?utf-8?B?b0lhQjRBMG00QkVPWkNiSWRxY3R5TUFjUEFQWXV6Q1VtaUo0cVJwQUxGaUk0?=
 =?utf-8?B?SmNRWDdUNVY2L2l1Z3NOeGpaRWZ5OFV1QlNRcy9UVHprMnIvam9Edk1Oc0h4?=
 =?utf-8?B?MTVHOTI0bTFvZE5Ja0J3MVE5Ky92NVdxdzlSN0g0ejRCWTFCblJZQXQ4U3pV?=
 =?utf-8?B?TUZOR25uakI4QSs3ZWJtNDVKSWtXUTRzZllwR0JoaFhwYTFIK2FFTjZzYkR0?=
 =?utf-8?B?aTZtTndHNnRVNTd6RjlmYklZM091MHUxUkJsR3pUTlhvQmhpRHJTaWhZb09Z?=
 =?utf-8?B?aTFPSEJocFRzMTlVaUtpQkJwYittUWZHMDhrTUltOGRLYjlRcjhoQnNHNzBn?=
 =?utf-8?B?dEJlQzBtd1R6L1h4bjJOMHdVcGpjVnNhWmNaazVSQ2hOY3o4VnFxZTRKZFVV?=
 =?utf-8?B?dGJsSmVaTitkY3VORW15bVJqcmkyMGdpL3pXUXBtekU3NmdrM2dsSkhGVmR5?=
 =?utf-8?B?QlBQb0YzK2hKMnl0UkJ6NmloQkV2blFxeWduT25ZYjJ1c1B5ZW5yUnBQeW1G?=
 =?utf-8?B?OFNQems1Q29iN3d0MWZxRlR4SFNqYzhnMEsvUDA0N05odi9lWFRLSE9qRTI0?=
 =?utf-8?B?NStON0RJN2tMeVVNZjhjVWZ6bUNRcUlUd3FocmZoek9uZW51RGdZd3RYL21o?=
 =?utf-8?B?MkNpelN1NSswUy9TTU9MY3ZQMmV3bTJvRjJUU1psWXBiTEx1M3lxR0VUenl0?=
 =?utf-8?B?MGdyaEtWVmxGZmVXTzJaKzVhUkdHRExaMVJ4MGIwMjFnY1pqRjlraURzSTdJ?=
 =?utf-8?B?Tm1SR21XRklqTjZTM2FJakw2RklUQ2E3SC83M1JPQmFEVW4vemlDZks0Wnp6?=
 =?utf-8?B?TnlhOG5KRGd1WVcwWUF4eUJ2N2QvNnZzcjZWRjY1ajdYTFRIcG01bCtJZUda?=
 =?utf-8?B?eFdHU0xWUUVUZjBvUVNXSWVUSXBCd2dFL0g5eSs0R0VuVFU0MDFkc0xjYnJP?=
 =?utf-8?B?Nzk4R3NPcCtoNGl6TDFURVhLd1RoczJHbnJYY2lhdUZnbWxheG8xQkFWYy9V?=
 =?utf-8?B?UGFJSWZVYjY4cFd4RGJKQjB0Z2ROY1ltUG84NHhpSkViUXRXTGxZdGF0V1hC?=
 =?utf-8?B?TXJUTTdFb1NORGNhelVWWXBTMmdJYTBJR2NrdUZ1TVRDZVIxTUp0RHAzeXFh?=
 =?utf-8?B?bDBhY0dtY2N0d09BQ0V6ZXkveVMyN296bXFQajk5K1NDZTVLVUFqZGpTbFRU?=
 =?utf-8?B?UW93OHAvV25EeTQvMnVCMks2VXhkZ2xtRDY4NStabnFRa0RoN2tGSFo4Ny9n?=
 =?utf-8?B?KzI4OUc3Qkk1RFB1RGtFUzNja0dSTWh5d0Mzc3U0YnEvVmZVMDJMZHhncGlX?=
 =?utf-8?B?RDYveDEvY0FJN2o0dGNYVWUzVHlrOHRqTkQya1ZQRVR2VzdpMFZFOGJrVjl3?=
 =?utf-8?B?YlZIS3Z3dWgybGxrVnVkVVZYd0FMS1ZJbmtnRjJJakVlR2o3N2szZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <26D212DD5511204783DA018F3AC95226@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	nrd6/woiRqPO6drga887lNGKKRHaoGc8MmLMX8XzcsOV4o8QQtiPqIHLXum9GmPmAYKGJcazWYEUJhzO83473c0cJTYhI56cd/ncBh0FbZZuDScsNNUZMXElcz8tqZ+MMzA5X9l8w0N0mAQdOSQrs+R+TdC1e8tfRIoH8S7lnszIz1cQe2vixfRhvWj11nni8TtjjAsmDXp1kvJpsYzDs75o5iO90Eubp8SqaUBk1P14rvfI/oBqluqZND5sY4y1gYDNGnk+3+I8g6tfNrruCWp4fQPhvA/Tmy2WyN9mq+rlD7Xu3zBFyIQHg14Bop/WuZq+cPS0obsXNEU/aIoM6A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a/uAwgkCjvGeMFwG06zDUiP15tiPxWm2IFcc/ai32/xtt+f5JVh8LeJ/lr52cFbzlqsg9D2nMEOcPkIvraUmzOobok8UflPLJcoSH9kdFCHpz4j/vo9B8QGuct9+sk5uT9zbDFwJtrpX/Mu9CkReEzJdKwizfxAHRzT666Rzwj+DHkthU56XdGkxvG3Kgh7/obMVCoRoh8AfyQgfJRGSThf/xkcb+sDausTbwHE89QFiWqPsvsDWa7r83132a/MSCV+XTqf3nkdcmLIziwM2MjKxawJSQUXmWSyn8sF1rGe+XyZfD50GJXZUUVahNVwpdCvxae4Y0A3tupgR8C1twcZ9JSDxdDfFTRVPf2v3cqMa93P1HBZ7H9xajYKLqNxBApA1wBZvD18lnGgVnpAtfGuhcbUA8h653TiwLGkJwbAQYiWJMrcUPVnQiEfsec+k6vJqfRPPr3z6jWLxdXtNwvYe3ayROeN67N4DuakmvOYr/dPkXXNRV7O1Q2sm/2LwbVdiLcAjER4QkNb391YMvuyemtRvMIB3Jkdy7ZavPp7DMm54Qx8J4DxazpbnKeHBQKcZYko3xu5/4wkFLGOLTt69fRmiws8jjVN1vKGuOKNd/zKFZ3jfTAo7+JSKtJS3O9GTkd6UkgIXgzShRJbhtg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94064150-ff6b-498c-9740-08de7a571cde
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 01:32:49.7834
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jMfKrXKejl43j6Wy9sN78SqxJOMQ3kJvRbDNhvzfjUGw6HE6ouZnAMsWCIX6OTKD5LLmgIRAYkg6qgyAvVce7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7304
X-Proofpoint-GUID: 3z9BJRt_Pbz4tPtDW3h8vwP9reQ5v7qO
X-Proofpoint-ORIG-GUID: 3z9BJRt_Pbz4tPtDW3h8vwP9reQ5v7qO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAxMSBTYWx0ZWRfX2AdJpTJlt5cZ
 0B8Dx2Wgn49VHfG2WpBcu2VXLtIoQZ28yyYcFr4gaLNylS7ZKiMvdKa6tsnTvZkUapF/c/ezeTq
 5bhq8Ye0qnEJxgw7eDqjLwsO1vYQYJu3sAc4JU1ScUWmv6tKDe4y0/qLI4dCm4fgSglInqL5tUj
 HALvQ8GIT97M2Rx/UFd3qhvkOe6NRr4jhvf6+6fZyFcRoP/jjqdVThowcHHI2B0hwEOYqLowbJL
 oz24WCmSOsJJ5t8AOMDc4fzCDhTtoYmzcEYXanTMAuhq1AjoH03kJ11QykIT+HZ8tUhZeC2SLrh
 jkhYI9EsUdHVkKNTw3RxKlXqTPokm1SgdHdN/iZN1tiPWO2+DyrNK4iCufSbm2RBrmLHNupkASs
 6x6qJBwDwBRhejOCoCYaFyhMFqf3f0RU0+5n7a6RgF3BRA2e0vF6IVidJhyBZz4jgpg/398/Ph0
 Bx8HJl3HJuykMAH6fAA==
X-Authority-Analysis: v=2.4 cv=d/X4CBjE c=1 sm=1 tr=0 ts=69a8dd49 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=d2oNENbPTmHkEwBZ8M8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 adultscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2603050011
X-Rspamd-Queue-Id: E8632209DEC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34033-lists,linux-usb=lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,synopsys.com:dkim,synopsys.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

T24gV2VkLCBNYXIgMDQsIDIwMjYsIEluZ28gUm9obG9mZiB3cm90ZToNCj4gSGVsbG8gVGhpbmgs
DQo+IA0KPiA+ID4gK3N0YXRpYyB2b2lkIGR3YzNfdWxwaV9kZXRlY3RfY29uZmlnKHN0cnVjdCBk
d2MzICpkd2MpICANCj4gPiANCj4gPiBXZSBjYW4gcmVuYW1lIHRoaXMgdG8gZHdjM191bHBpX2dl
dF9wcm9wZXJ0aWVzKCkgYW5kIGRlY2xhcmUgaXQgaW4NCj4gPiBjb3JlLmguIFRoZW4gd2UgY2Fu
IGhhdmUgdGhlIGR3YzNfZ2V0X3Byb3BlcnRpZXMoKSBjYWxsIHRoaXMgZnVuY3Rpb24uDQo+IA0K
PiBJIHRlc3RlZCB0aGlzIGFuZCB0aGlzIGRvZXNuJ3Qgd29yazoNCj4gQXQgdGhlIHRpbWUgZHdj
M19nZXRfcHJvcGVydGllcygpIHJ1bnMsIHRoZSBEV0MzIGNvbnRyb2xsZXIgaGFzbid0IGJlZW4N
Cj4gaW5pdGlhbGl6ZWQgYXQgYWxsIHlldC4NCj4gDQo+IEFueSBhY2Nlc3MgdG8gYSBEV0MzIGhh
cmR3YXJlIHJlZ2lzdGVyIGZhaWxzIChJIHRoaW5rIHRoZSBjbG9ja3MgdG8gdGhlDQo+IERXQzMg
SVAgYXJlIG5vdCBldmVuIGVuYWJsZWQgYXQgdGhhdCBwb2ludCBvZiB0aW1lKSBhbmQgdGhlIGtl
cm5lbCBjcmFzaGVzLg0KDQpBaCwgdGhhdCdzIHJpZ2h0Lg0KDQo+IA0KPiBUbyByZWFkIG91dCB0
aGUgVUxQSSBQSFkgVmVuZG9yL1Byb2R1Y3QgSUQgYXQgbGVhc3QgdGhlIFVMUEkNCj4gaW50ZXJm
YWNlIG9mIHRoZSBEV0MzIGNvbnRyb2xsZXIgbXVzdCBiZSB1cCBhbmQgcnVubmluZy4NCj4gDQo+
ID4gVGhpcyB3aWxsIGVuc3VyZSB0aGF0IHRoZSBvcmRlciBvZiB0aGUgc2V0dGluZyBvZiB0aGUg
R1VTQjJQSFlDRkcgaXMNCj4gPiBkb25lIGluIGR3YzNfaHNfcGh5X3NldHVwKCksIHdoaWNoIGlz
IHByaW9yIHRvIHJlZ2lzdGVyaW5nIHRoZSB1bHBpIHBoeS4NCj4gDQo+IEkgb3JpZ2luYWxseSBo
YWQgdGhlIHNhbWUgaWRlYTogTWFrZSBzdXJlIEdVU0IyUEhZQ0ZHIHNldHRpbmdzIGFyZQ0KPiBj
b3JyZWN0IGJlZm9yZSBJIGRvIGFueSBhY2Nlc3MgdG8gdGhlIFVMUEkgUEhZOyB0aGF0J3Mgd2h5
IEkgb3JpZ2luYWxseQ0KPiB1c2VkIGEgZGV2aWNlIHRyZWUgcHJvcGVydHkuDQo+IA0KPiBCdXQg
YmVjYXVzZSBJIG5vdyB1c2UgdGhlIFZlbmRvci9Qcm9kdWN0IElELCB0aGlzIGRvZXNuJ3Qgd29y
azsNCj4gaW5zdGVhZCB3aGF0IEkgaW1wbGVtZW50ZWQgcmlnaHQgbm93IGRvZXMgdGhpczoNCj4g
DQo+IC0gRmlyc3Qgc2V0dXAgdGhlIFVMUEkgaW50ZXJmYWNlIHRvIGJlIGFibGUgdG8gYWNjZXNz
IHRoZSBVTFBJIFBIWQ0KPiAtIENoZWNrIHdoYXQgVUxQSSBQSFkgbW9kZWwgaXMgY29ubmVjdGVk
ICh2aWEgVmVuZG9yL1Byb2R1Y3QgSUQpDQo+IC0gQXBwbHkgZnVydGhlciB3b3JrYXJvdW5kcyBk
ZXBlbmRpbmcgb24gdGhlIGRldGVjdGVkIFVMUEkgUEhZIG1vZGVsLg0KPiANCj4gVGhlIHNldHRp
bmcgb2YgdGhlIFhDVlJETFkgaW4gR1VTQjJQSFlDRkcgb25seSBoYXMgYW4gZWZmZWN0IG9uY2Ug
eW91DQo+IGVuYWJsZSB0aGUgVVNCIGNvbm5lY3Rpb24uDQo+IA0KDQpSaWdodC4gSSBndWVzcyB3
ZSBjYW4ndCBhdm9pZCBzZXBhcmF0aW5nIHRoaXMgc3RlcC4NCg0KPiANCj4gPiA+ICtzdGF0aWMg
dm9pZCBkd2MzX3VscGlfYXBwbHlfY29uZmlnKHN0cnVjdCBkd2MzICpkd2MpDQo+ID4gPiArew0K
PiA+ID4gICAgLi4uDQo+ID4NCj4gPiBUaGlzIHNob3VsZCBiZSBkb25lIGluIGR3YzNfaHNfcGh5
X3NldHVwKCkuIFNlZSBtb3JlIGNvbW1lbnRzIGFib3V0IHRoaXMNCj4gPiBiZWxvdy4NCj4gDQo+
IFRoZSBwcm9ibGVtIGlzOiBBcyBmYXIgYXMgSSBjYW4gdGVsbCwgZHdjM19oc19waHlfc2V0dXAo
KSBoYXMgdG8gcnVuIGZpcnN0LA0KPiB0byBzZXR1cCB0aGUgRFdDMyBjb250cm9sbGVyIHRvIGFj
Y2VzcyB0aGUgVUxQSSBQSFkgYXQgYWxsLg0KPiANCj4gUmlnaHQgYXQgdGhlIGJlZ2lubmluZyB0
aGUgY29kZSBpbiBkd2MzX2hzX3BoeV9zZXR1cCgpIHJlYWRzOg0KPiANCj4gCS8qIFNlbGVjdCB0
aGUgSFMgUEhZIGludGVyZmFjZSAqLw0KPiAJc3dpdGNoIChEV0MzX0dIV1BBUkFNUzNfSFNQSFlf
SUZDKGR3Yy0+aHdwYXJhbXMuaHdwYXJhbXMzKSkgew0KPiAJY2FzZSBEV0MzX0dIV1BBUkFNUzNf
SFNQSFlfSUZDX1VUTUlfVUxQSToNCj4gDQo+IEkgdGhpbmsgdGhhdCdzIGFsc28gdGhlIHJlYXNv
biB3aHkgZHdjM19jb3JlX2luaXQoKSB1c2VzIHRoaXMgb3JkZXINCj4gDQo+IAlyZXQgPSBkd2Mz
X3BoeV9zZXR1cChkd2MpOw0KPiAJLi4uDQo+IAlpZiAoIWR3Yy0+dWxwaV9yZWFkeSkgew0KPiAJ
CXJldCA9IGR3YzNfY29yZV91bHBpX2luaXQoZHdjKTsNCj4gDQo+IFlvdSBmaXJzdCBoYXZlIHRv
IG1ha2Ugc3VyZSB0aGF0IGR3YzNfcGh5X3NldHVwKCkgaGFzIHNldHVwIHRoZSBpbnRlcmZhY2Vz
DQo+IHRvIHRoZSBQSFlzIChib3RoIEhpZ2gtU3BlZWQgYW5kIFN1cGVyLVNwZWVkKSBiZWZvcmUg
dHJ5aW5nIHRvDQo+IGFjY2VzcyB0aGUgSFMgUEhZLg0KPiANCj4gDQo+ID4gPiArc3RhdGljIHZv
aWQgZHdjM191bHBpX2RldGVjdF9jb25maWcoc3RydWN0IGR3YzMgKmR3YykgDQo+ID4gPiArew0K
PiA+ID4gKwl1MTYgcHJvZHVjdF9pZDsNCj4gPiA+ICsJdTE2IHZlbmRvcl9pZDsNCj4gPiA+ICsJ
aW50IHJldDsNCj4gPiA+ICsNCj4gPiA+ICsJLyogVGVzdCB0aGUgaW50ZXJmYWNlICovDQo+ID4g
PiAuLi4NCj4gPiANCj4gPiBEbyB3ZSBuZWVkIHRvIGNoZWNrIGZvciBkYXRhIGludGVncml0eSBo
ZXJlPyBUaGF0IGNoZWNrIHdpbGwgYmUgZG9uZQ0KPiA+IGR1cmluZyB1bHBpIGluaXQsIHdoZXJl
IGl0IGhhcyBwcm9wZXIgY2hlY2tzIGFuZCBjYW4gZmFpbCBwcm9wZXJseQ0KPiA+IHRoZXJlLg0K
PiANCj4gVGhhbmtzIQ0KPiBPTUcgSSBhbSBzdHVwaWQgOi0pOg0KPiBJIG1pc3VuZGVyc3Rvb2Qg
dGhlIGNvZGUgb2YgdWxwaV9yZWdpc3Rlcl9pbnRlcmZhY2UoKToNCj4gSSB0aG91Z2h0IHVscGlf
cmVnaXN0ZXJfaW50ZXJmYWNlKCkgd291bGQgb25seSBkbyB0aGlzIGNoZWNrIGFuZCByZWFkIG91
dA0KPiB0aGUgVmVuZG9yL1Byb2R1Y3QgSUQsIGlmIHRoZXJlIGlzIGEgbWF0Y2hpbmcgZGV2aWNl
IHRyZWUgbm9kZSwgYnV0IGl0DQo+IHR1cm5zIG91dCBpdCB3aWxsIGFsd2F5cyBkbyB0aGUgY2hl
Y2sgYW5kIHJlYWQgb3V0IHRoZQ0KPiBWZW5kb3IvUHJvZHVjdCBJRCwgZXZlbiBpZiB0aGVyZSBp
cyBubyBtYXRjaGluZyBkZXZpY2UgdHJlZSBub2RlLg0KPiANCj4gVGhpcyBpbiB0dXJuIG1lYW5z
OiBJIGRvbid0IGV2ZW4gaGF2ZSB0byByZXBsaWNhdGUgYW55IGNvZGUsIA0KPiBiZWNhdXNlIHVs
cGlfcmVnaXN0ZXJfaW50ZXJmYWNlKCkgd2lsbCBhbHJlYWR5IHJlYWQgb3V0IHRoZQ0KPiBVTFBJ
IFBIWXMgVmVuZG9yL1Byb2R1Y3QgSUQuDQo+IA0KPiBJZiBkcml2ZXJzL3VzYi9kd2MzL2NvcmUu
YyBpbmNsdWRlcyAibGludXgvdWxwaS9kcml2ZXIuaCIgdGhlIGNvZGUgaW4NCj4gY29yZS5jIGFs
cmVhZHkgaGFzIGFjY2VzcyB0byB0aGUgVUxQSSBQSFkgVmVuZG9yL1Byb2R1Y3QgSUQgdmlhDQo+
ICAgIGR3Yy0+dWxwaS0+aWQudmVuZG9yDQo+ICAgIGR3Yy0+dWxwaS0+aWQucHJvZHVjdA0KPiAN
Cj4gV2hpY2ggbWVhbnM6IEkgZGlyZWN0bHkgY2FuIHVzZSB0aGlzIHRvIGVuYWJsZSB0aGUgWENW
UkRMWSBpbiBHVVNCMlBIWUNGRw0KPiBpZiB0aGUgc3BlY2lmaWMgVmVuZG9yL1Byb2R1Y3QgSUQg
aXMgZm91bmQuDQo+IA0KPiBXaGF0IGRvIHlvdSB0aGluaz8NCj4gDQoNClNvdW5kcyBnb29kISBC
dXQgY2FuIHdlIGhhdmUgdGhlIGNoZWNraW5nIGZvciBWZW5kb3IvUHJvZHVjdCBJRCBpbg0KdWxw
aS5jIGluc3RlYWQgb2YgY29yZS5jPyBJIHdhbnQgdG8ga2VlcCB0aGUgY29yZS5jIGdlbmVyaWMu
DQoNClRoYW5rcywNClRoaW5o

