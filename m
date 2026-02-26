Return-Path: <linux-usb+bounces-33760-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sL8UJhSgoGlVlAQAu9opvQ
	(envelope-from <linux-usb+bounces-33760-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 20:33:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A83C1AE61A
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 20:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 477723079BB4
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 19:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A428E44D03D;
	Thu, 26 Feb 2026 19:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fl/eXrC7";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="FGZlsV1M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GMnavhqp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F26039E6DD
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 19:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772134050; cv=fail; b=nDFpJfS3dKbQNJUrM4qH/YPxkDjjsyXXu0+6kaiCeABcKhcbiBmER+kLphPZ9nbbyFd3y0kAP5hSc/au/wmBFeuE3tGJVUKeAERU9X/3UxgjkAkZk3QFU1pXGbssX6OgmXtEa1AqDueyP7Bp4ldwGeUIt4iZkPBSgwQc2J6ZeN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772134050; c=relaxed/simple;
	bh=8L3sSqJHW+Yu5tLKMA/JAqmkKxM85DD6uvVwDDHzf2Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dmyXVcsLhO7TEOKSbzNRFW4fGSBn6CR4bI9qguMi3emJp8nrEaZf70CHBN5ePVHqG0G8NPjL7yisDr1aQSLO2Mm3snAIQua9WdcXDna2Q1+9jjql26m24cjpagzmGyrmOMV65dazakD6Ra5cIzJqsMiTuCuRzy005HzZHlhLGNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fl/eXrC7; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=FGZlsV1M; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GMnavhqp reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QHB9t93712661;
	Thu, 26 Feb 2026 11:26:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=8L3sSqJHW+Yu5tLKMA/JAqmkKxM85DD6uvVwDDHzf2Q=; b=
	fl/eXrC7jR4iBSAyfyQf2XdFdpHhSV0gJwlfhwQ1tjsP2/n7iFhMz5taaRfPqeg4
	hBiJFjAGDXQXIYrLSPxfgDdI6tpv8h6ngwKEClOIbzvvFD7sbrYhM6vHO3NSvq00
	iHSi9ZiGngCINl8bGnMBVOtiqG83io1WAAAdAGGh9RI6mfHjuLhJHeGLMms+RKXD
	rVBOirxn50Bb53rkvzNp5lgr3Vmzb4d6j0riB+uXbg9Eeofy5Xjh7gf/v8DV1ZKn
	VUqcG2DqKXcOoLKkBKmiXNn9a7uB0sCtE0EF8WNHXMUFkyai9NX0aSrTHyFay/cR
	b2zWQMNFBYfOx0PET/n0jg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cjkgqc01c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 11:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772134016; bh=8L3sSqJHW+Yu5tLKMA/JAqmkKxM85DD6uvVwDDHzf2Q=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=FGZlsV1MZyW8ncewsckgrOGRs1pIrTZzR2yrT08K6LVp+LAJYGSi4Z4ZBBcZE7A7q
	 JyudzhzzyvzMI327/+gy/xt1X7rfi3lZgtcLKLwLcSwwgjlgch056A9uAE9ZqCTDTw
	 /mYOsceL69ic9lWYJQ4Tt4KFXS5ux490qHIgToJE55sclRnORSNmtCd6yAbgX+O6UO
	 07dXx6FNwMVnDPy0aNiCD8Ql3xzfQ5f3VbyPFsYgQfbu4q6acMD24bpYvYpZBpAuOY
	 PlnglSJ5G3JByvVIbu/WL+HSi3FPR+oGmkAfyKwq87KsfcmgAIsxBTRVWvcGvWuNcG
	 laoic/9eW5A1g==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 50986401CD;
	Thu, 26 Feb 2026 19:26:55 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C4287A006D;
	Thu, 26 Feb 2026 19:26:55 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=GMnavhqp;
	dkim-atps=neutral
Received: from PH0PR07CU006.outbound.protection.outlook.com (mail-ph0pr07cu00601.outbound.protection.outlook.com [40.93.23.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 13CED401DD;
	Thu, 26 Feb 2026 19:26:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTvpn16a/CXOIUkl9Zy2i6QpIXZXsr1x/cZ/S5o7gNhLXo8fAEyy++tkYLYiTc/4O+pGzVOCvywvJcg7Y48oPvZXCdgRQ9OE3s3gK+gLd0a5WjcV8lYs4Wv6n0R3L0dbDsQRWgJFLMAjcHE3kuK3CHZn1t8hbTBWaHI9EsfybLuV9KXaKhilnhTc51HvNeg+B+lGnFXkd8B1bM4rbF8wt6Pq9jiVLULPzzlIRZFVLDWOtpzl8kur5TzqF8agBbOouI+eVme1MdXFDTDpfMDs4ovPeJ2mtZ+LkvD3Ei0tcwkyMnFo4eC7DdCN5iL+1ewU2JR5vqqpQwxA8MOtFIGnrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8L3sSqJHW+Yu5tLKMA/JAqmkKxM85DD6uvVwDDHzf2Q=;
 b=mMYV48/BAg6LRxyud/bjB8PXkZsH8U4JuY4vzafE3wQDzPgAZruWa6W2vYiVTErNkDuWmxS+HWdTstpIz98wL5f+FLne8RoobHAeigPkWuykmCDD/V/QAXwt+2/e3kTV1eZgF352md9gcRVEmDrkXpemx09s+sEVgYa9GPpQ3MZJjmKWhtU7tdwAvzeCYSG9ykGsYP2DcRTmsi8l429pPVWTslCr8WOqpqDzl6CQlv9wrma822Db+5M9a0pzAwdkDTjIq4ji5/3y/7cy9ll7Xu9FFO/moWQtE97YAyRu/9vO0Ow82XD4IlTK9+HNq4kMKqNBUrd9TqC8ViMqoUh7Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8L3sSqJHW+Yu5tLKMA/JAqmkKxM85DD6uvVwDDHzf2Q=;
 b=GMnavhqpnURJtCpv7WyJGJ13Nx0ey96ZqocQ4iEOYmV0jn+gsebpB6S9Awx5LwIk2jd5fPSRxv0K+qOQYhwAARK5M91wrviDBKZplMRA0vlMO7ITJ9jINJr8wT8dBezoN/QkevEotG8FRxakFKUee7ZiEQvcgskqdkoOsr1bdNs=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM4PR12MB6253.namprd12.prod.outlook.com (2603:10b6:8:a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Thu, 26 Feb
 2026 19:26:49 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 19:26:49 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: Support for USB3340x ULPI PHY, via
 "snps,enable_xcvrdly_quirk"
Thread-Topic: [PATCH] usb: dwc3: Support for USB3340x ULPI PHY, via
 "snps,enable_xcvrdly_quirk"
Thread-Index: AQHcpZf4208n0sWyuUS9s4MYOirBG7WSiaIAgADVroCAAOfJgIAAlMIAgACEpIA=
Date: Thu, 26 Feb 2026 19:26:49 +0000
Message-ID: <20260226192645.aban6dcocehjq7ra@synopsys.com>
References: <20260224141438.39524-1-ingo.rohloff@lauterbach.com>
 <20260225000512.tle2eu4gkd4ut6bf@synopsys.com>
 <20260225134959.39e775ff@ingpc2.intern.lauterbach.com>
 <20260226023935.ge3vlasodrrnhq6o@synopsys.com>
 <20260226123200.643e0ddd@ingpc2.intern.lauterbach.com>
In-Reply-To: <20260226123200.643e0ddd@ingpc2.intern.lauterbach.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM4PR12MB6253:EE_
x-ms-office365-filtering-correlation-id: 0eec5bcb-2881-424e-388f-08de756cfd22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 qfdZGnKeolEgOe99bqVXk413VU8etDZMr6EQyYfPi2gcWmzWe1/iykfRqViY4qq780TJIB40TYGYFIgUq+K7riJdTW2XnFiac3mWmyQwEBFRBQgR0dIQd6gJ5WI6P0N969dInlf1XNdFZixF04nUK9qclLhAcsvjH7K3pLsxBoAnqURXR6vq1WWYO76/GmwV7ZE9DmAXRSHw41N/4THB0F2r6xVTwxRPCT8lIKakmhp6AAB3pMEp+j1ieJwrYFBs0q8ClQmdhUHMP+t2t2Q6yG0y5tCTNhDzoqhJWRfRyTpsFmy+7kvC64ZtRGlgGYV5nehkMnGJbn7I+eTQWp56+AAvSIwAIg7MB26zssJ/4ZDfoFzLXwVR+YnkbPYAZS+ZiC9HE7TP9NgqKwLpL/BGQWyqXLA3NjonfPsOVGt5YW2lTva25YA/7WQ+BVlYt9BmOgQgOFjW75l1JQeOmYV5YiAXA6AZds3vvZm0NvS9m20b6iSwh+nIKIcWdCLtr43zhuOX7F7ZKb33AZQ6zWdS1D7YAc4AP4LZ+JjNICN4cJqK6LOzc5sbbmVkKy0zBI5gHGEtiU6vRPmM9DO1KJg7KAWYa5C7m/8EnYMtzkyt3sLVpzw5sBYQwLcmAnejY1etVBbyFCeZuKjJSdgLl+36yReiVJwGOGqU63cVmk61svX/S3WrZH4oGFl6gkbjy8XHM4g8zSlhe0uu5exkh7YtnJolrAKny681ZUppe8rrqCqeRNxwZ71WB0cMOrwIPwIf
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R0k0bGdvNWQzaGt3MmhrRWZGaHFNdjlEeUFkR0VhTTNheUtLTy92ekR5eE5v?=
 =?utf-8?B?bkJ6dDY4blRMNVJIdTFDcDBCTHljRlFsVklnd09uZkNRaTdRa05zaHpUTzNp?=
 =?utf-8?B?cjhlNExLSTRIcGZOTzlEdS8zbHRpak10Z3Q0MGxMQncwYkV5MDBvTzc4S09y?=
 =?utf-8?B?NGZSbkk2bitVZUdEZ0VZQ1l1S0hrbXNnSnBHUWQvUCt1cmozUU0yaTRwQk1P?=
 =?utf-8?B?elkyRmVUcWhPcm1iZVl6YUloU2xRT1M4TFFnVWFwUEk3dDV6ZU9TWnJodnJz?=
 =?utf-8?B?THNSYmFLSG9tQmh0V3k0ZlZkWWVSdVhvdU1VVmU5SExiS1ZkTDh1WXVhc28v?=
 =?utf-8?B?aU9RWE8zclVJZWY5VVROdTNTRlJacXpnYllwaTQwMGxtVXhWRVI2eWtiR2cx?=
 =?utf-8?B?eVFmWmJGS3czYkJoZzlGWmMwd3VZSGF4eHI0Rmg2V21scjBkYkhFeTZ4bEdi?=
 =?utf-8?B?TUo5aUZRWXl6TXlkNm85MWJSSk9ETzhpWnB5UUs3NHR0Q216YTBhMTc0dFIv?=
 =?utf-8?B?d3BnSWowQVRtblJyWkFRL2NrWFYxbzNpZjhpcnEvd0xmNzNGSG1PdENIK3Ri?=
 =?utf-8?B?WWREMVZJN1IyYTlKMVNpY3RwRlNrUHZ4azNZVjlZbUdJVE1DWFBidVNieHN0?=
 =?utf-8?B?ZVh4eXhqYWRNTFBHbFB2aGNienIyK3cwZWhJa3JoZUUvY0ZYSEE4dGVaZllq?=
 =?utf-8?B?Z1c3eEFId1ZxT1M5b28ycXErR29pWFpKMUllZ3Nvak1OekpXOWtuaDJ6VnhW?=
 =?utf-8?B?WDljd0UzejRLNzN0MmNmTjN6ektBQlVKZGJaOHZOaXFxTm5GNmtYRGpSRUk5?=
 =?utf-8?B?Zm95dnY4WmhTRXcvM3RBNy9Mc1R2ejd0L2tsY0xrbzludDhEcU5JQXBDYlVZ?=
 =?utf-8?B?Zit4Z3JkZUNjWnpmVWlFZzBkbUxEWjRtR0xSV1ZBa1RnQTdDWk5QaGtMYVpP?=
 =?utf-8?B?RVB4eFpUdk1NRTBSM0szUlNOaEMvVFVNUUNsdE9xc0VZTm1NSExSNzVJWjFp?=
 =?utf-8?B?NmxHKy9oSlZ4eVNtREJWbTlreXkyVUZFV29NQnVSSDJPK0NWNWVpR2hseUpV?=
 =?utf-8?B?TVh3MjFLM3g1S0p3VnByYndKQ2RxL2wwbWZNVUFqTm5DRUY3Q3lPR2k2bHNm?=
 =?utf-8?B?d091U2l5bEZoNGs0U3N5T3FhbzVGYmVzVVJrMFRtcDhMU2pUSEVyM25HdkRS?=
 =?utf-8?B?Rlc1VXNyWUY1bkJVUXpTYmU2dXE2WGM5MmNTeHNxU0VLa0tsTVZKTWVCdllY?=
 =?utf-8?B?TlZyY0hMNUpPRlR6azJCNTFHQmxVQk9KdGpVUElrdnZvSWUwL05ZRDUvVzhY?=
 =?utf-8?B?eUd6MWo2WnhxaU5LWGhScEVsV3pocXl4TWlOT2ZROHlML1dpc0g0YmlTQlU2?=
 =?utf-8?B?OEFVc0hTSGFzRzVORlJzVTJpby9za1dPa25FNWwxKzMvYjNkRmZSQ2cxWExN?=
 =?utf-8?B?Rno5QTNKRnd5c0tCR1hJajJyR0dCV3FKemhyVW5xRE4wMXRUY3Z2TDFmeXNC?=
 =?utf-8?B?RHA1Qk8vNk51c05oNWkwNk4rWEhkZ0ZRdlV0dFptZjBhdUl1NFIzZDNGTHBO?=
 =?utf-8?B?S29VZW5pSnVmQmMyNGRCbDJUanJyd0hkNXpxUzNNTzU0NWkyVHNiTmxSclQz?=
 =?utf-8?B?MitDdFlHSGVpbDZQOGlWdEF1cWxWdEEyYktIZ1Z4NnJ2TmdCdGYyaUUrR0F5?=
 =?utf-8?B?cWJUQ1ZOa1A4aFQ0WTlmOXFnRi9yeWd5L1Q2MVpISmo4RXZ1eExlYzN6OG00?=
 =?utf-8?B?VDFUdkFONUUrSm5iK1pBSml6WGloWXJHQk1GMjFoUHNXOEZoUDFhOUJZdWdM?=
 =?utf-8?B?cjd5T01udGxHR2xNVDlTdXc5Vmp1bFZ3aG9WYzZSQ3VzeVUwVWRZTnlZYkZM?=
 =?utf-8?B?S1ZyZ1VHN2dLdDhIQjVEWGtyWm1Db2IrbFBXYndUcXp2RE9SOGd3ejU3S3RB?=
 =?utf-8?B?U1JMZmxVVVl1d1U1cEF5Rm5ubEZUZTBpQmI0ZUV0ektiYjBjWEg0VmR2Y3JR?=
 =?utf-8?B?ZFYvTm94Z3Z0b0lGOVlPWUx3cmI3UUx5STdpV2NPRzZiQ3lrWTZJaGFaZFo4?=
 =?utf-8?B?aSt3c2xQd0wvSTdTeTh5NUdYSytsTU9zVG1TN2NFN2JlMmlHQzZ1UTAvYTBp?=
 =?utf-8?B?a24rMmo4dTY0WThLYWtJMjZFVWd6N2Z2bjc4cWEyNkdsUytpeHM3enk4c20x?=
 =?utf-8?B?SzlHR3F3Z0JPZzJMRTRxNk9RcFRFa3FGYWRZbmtqcmVIZ1B5SjN1dzBXS0pN?=
 =?utf-8?B?TEZ3bWg4TGNFSjdhLzRxZ21IdzI4QlJ2T0lwakpkWUdwNzNzQnQwQU9Pcytv?=
 =?utf-8?B?MWxOVlFkWDZJbVFXRWwwZmZKcGlMeCsrVjdpMStiRW02ckNjM2MrQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7121DB94466D740AB0B818A8BC96219@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	io4c4AMPDSaCZsiYqFJ/f1o+rQPfwdOhV6beIVzq5YXY7ozasgMIjpo+a8nq9Xn9W3bY7JwlCte7ybHsz7tKVEa+77cJyiqvl9ntnBle882arF5mBqMAEn3M0jsjhK1S34tjnnv6IPmmTImBR0CX5mMe2RC5UdB6e2u86RQyBukdWpfSGMeLkRyvnZ+qcecuoNwcep0yQt/CUWcYBbnBLEV1wpMiar5omgQ/Qhkjvg5Iq22vD943vWbC2V08YsZ4GnrCYL1YewhnRmSvIraH7RkzUHmvPaWr64zxKaqVtXclAsXM8DPCDUip1lUQ9xgTiLpOAbtL+iJWyBnKG2+tRiXWeuChybyyVExUqVHt+kXue+Co2FBDRDSvvcvL2SvVqegberEicTUeiaTqz/digodke+TzsKZXOusStjJqAEYVFjdFdSclueAgKTvrE/HmwiknjZcR8189hEv5/pQkAWe6qXDkX7yBOyc5OBEKvZsfMI1W/KsHHYGgG8Z+spBpV+50hg6FJhnWtGj1o6DlfAKnKhgmB2ijwc5trr8dOotArnhCn0XudfM94t2QYSbGkVpWTEbhnTHTGeVIX+5ExklSSH+voHYHr+Qmj8CQW+J5QOwPe7T1ZppV6wf/KlnSP2WJU+egCKssSxGzrmpndg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eec5bcb-2881-424e-388f-08de756cfd22
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 19:26:49.6466
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: haQubHhFYg2hULFuH4iRpcMidFrlMcD8e9ACRUBrWD0jkwNZsrVcmnkwuvcDgp2fJVldTTjNcpphnfqz1XqBZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6253
X-Authority-Analysis: v=2.4 cv=V75wEOni c=1 sm=1 tr=0 ts=69a09e81 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=VwQbUJbxAAAA:8 a=jIQo8A4GAAAA:8 a=lUqNFlMzLcXqOibJsSUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: H_vERuaz3kl420owrDxkqdRtTe46Hr2I
X-Proofpoint-ORIG-GUID: H_vERuaz3kl420owrDxkqdRtTe46Hr2I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE3NyBTYWx0ZWRfX3b7HRMg9kQw4
 6zFomgj+9Qz+bq2fIYJvisoTABeGg44Kgp50qVq2ud02XvnCVj6gDucDyyCn30BPuHVdKqE2sRN
 8fsZvIchxJCGsArp0sXXOiOo81fhpenO58pTqLE1cMIaDnno+Wwsixz76DO9y+0SmuOOVmcA7pi
 C0cZPRvQAUsugrjywywmTk1QDOzwkKzI99duVS893eO2MbuURDac43oXyse7hVcF6BOFD06Q5cc
 G5inwG2pJUs7h5uOME4g2A/KPkUfISu5tYT1tuIRX6v74yLjKKf5XfAOI6pkzhremrUgLm5i3V/
 ST25Q3KTGT0aer8MM+R91obu4Dkvbg4N/MYMiump9c27EO3ahPZAziE3RyFEeypGl9JD1ILdfiX
 qIVvArjCDAMETDLNXZN4uGZEp957a+SoEW1my96IEKmlorDfIZ080Eh+896UazntjJwnjiQ6yIO
 8MTkUYEAA0sKHSMBbZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2602260177
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
	TAGGED_FROM(0.00)[bounces-33760-lists,linux-usb=lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,synopsys.com:mid,synopsys.com:dkim,synopsys.com:email];
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
X-Rspamd-Queue-Id: 2A83C1AE61A
X-Rspamd-Action: no action

T24gVGh1LCBGZWIgMjYsIDIwMjYsIEluZ28gUm9obG9mZiB3cm90ZToNCj4gSGVsbG8gVGhpbmgs
DQo+IA0KPiBPbiBUaHUsIDI2IEZlYiAyMDI2IDAyOjM5OjQ2ICswMDAwDQo+IFRoaW5oIE5ndXll
biA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JvdGU6DQo+IA0KPiA+ID4gPiBBbHNvLCBo
b3cgYXJlIHlvdSBwYXNzaW5nIHRoaXMgcXVpcms/IFRocm91Z2ggZGV2aWNldHJlZSBvciBzb2Z0
d2FyZQ0KPiA+ID4gPiBub2RlPyBJIGRvbid0IHNlZSB0aGUgdXNlciBvZiB0aGlzIHByb3BlcnR5
Lg0KPiA+ID4gPiAgIA0KPiA+ID4gDQo+ID4gPiBPbiB0aGUgaGFyZHdhcmUgSSBoYXZlIGdvdCAo
WGlsaW54IFVsdHJhc2NhbGUrIFp5bnFNUCkgSSBwYXNzIGl0IHZpYQ0KPiA+ID4gZGV2aWNldHJl
ZS4gSSBub3cgYWRkZWQgYSAybmQgY29tbWl0LCB3aGljaCBhZGRzIGRvY3VtZW50YXRpb24gZm9y
IHRoZQ0KPiA+ID4gZGV2aWNldHJlZSBiaW5kaW5ncy4NCj4gPiA+ICAgDQo+ID4gDQo+ID4gWW91
IHNob3VsZCBwYXNzIHRoaXMgdmlhIHNvZnR3YXJlIG5vZGUgdGhyb3VnaCB0aGUgZ2x1ZSBkcml2
ZXIuIEkgZG9uJ3QNCj4gPiB0aGluayB0aGVyZSdzIGVub3VnaCBqdXN0aWZpY2F0aW9uIHRvIGNy
ZWF0ZSBhIG5ldyBkZXZpY2V0cmVlIHByb3BlcnR5DQo+ID4ganVzdCBmb3IgdGhpcy4NCj4gDQo+
IFBsZWFzZSBoZWxwIG1lIHRvIHVuZGVyc3RhbmQ6DQo+IEkgdGhpbmsgdGhlIGdsdWUgZHJpdmVy
IHlvdSBhcmUgcmVmZXJyaW5nIHRvIGlzIHRoZSBYaWxpbml4IHNwZWNpZmljIG9uZSwNCj4gc28g
dGhlIG9uZSBpbiBgZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jYCwgd2hpY2ggZGVjbGFy
ZXMNCj4gYGR3YzNfeGxueF9kcml2ZXJgLg0KPiANCj4gSXMgdGhpcyB3aGF0IHlvdSBtZWFuPw0K
PiANCj4gSSB0aGluayBJIHVuZGVyc3RhbmQgaG93IHRvIGNyZWF0ZSBhIHNvZnR3YXJlIG5vZGUg
dGhlcmUgYW5kIGhvdyB0byBwYXNzDQo+IGl0IHRvIHRoZSBtYWluIGR3YzMgZHJpdmVyLg0KPiAN
Cj4gRG8geW91IG1lYW4gdG8gcmVhZCBpbiBhIGR3YzNfeGxueF9kcml2ZXIgc3BlY2lmaWMgZGV2
aWNlIHRyZWUgcHJvcGVydHkNCj4gYW5kIHRoZW4gcGFzcyB0aGlzIHZpYSBzb2Z0d2FyZSBub2Rl
IHRvIHRoZSBtYWluIERXQzMgZHJpdmVyPw0KDQpOb3Qgc29tZSBkZXZpY2UgdHJlZSBwcm9wZXJ0
eSwgYnV0IHRoZSBjb21wYXRpYmxlIHN0cmluZyBmb3IgeW91cg0Kc3BlY2lmaWMgcGxhdGZvcm0u
DQoNCj4gDQo+IEkgYW0gd29uZGVyaW5nIGlmIHRoZSBkd2MzX3hsbnhfZHJpdmVyIGlzIHRoZSBy
aWdodCBwbGFjZSBmb3IgdGhpcy4NCj4gDQo+IFBsZWFzZSBsZXQgbWUgZXhwbGFpbjoNCj4gDQo+
IFRoZSBvcmlnaW4gb2YgdGhlIGZhaWxpbmcgaGlnaC1zcGVlZCBuZWdvdGlhdGlvbiBpcyBub3Qg
YmVjYXVzZQ0KPiBvZiB0aGUgWnlucU1QIHNwZWNpZmljIGhhcmR3YXJlIChzbyB0aGlzIHBhcnRp
Y3VsYXIgc3BlY2lmaWMgRFdDMw0KPiBpbXBsZW1lbnRhdGlvbiksIGJ1dCBiZWNhdXNlIG9mIHRo
ZSBleHRlcm5hbGx5IGNvbm5lY3RlZCANCj4gTWljcm9jaGlwIFVTQjMzNDAgVUxQSSBQSFkuDQo+
IA0KPiBNZWFuaW5nOiBBbnkgRFdDMyBpbXBsZW1lbnRhdGlvbiB3aGljaCBpcyBjb25uZWN0ZWQg
dG8gdGhpcyBwYXJ0aWN1bGFyDQo+IGV4dGVybmFsIFVMUEkgUEhZIHdpbGwgaGF2ZSB0aGlzIGhp
Z2gtc3BlZWQgbmVnb3RpYXRpb24gcHJvYmxlbS4NCj4gDQo+IE9uIHRoZSBvdGhlciBoYW5kOiBJ
ZiB5b3UgY29ubmVjdCBhIGRpZmZlcmVudCBVTFBJIFBIWSB0byB0aGUgWnlucU1QDQo+IERXQzMg
aW1wbGVtZW50YXRpb24sIHRoZW4gdGhpcyB3aWxsIHdvcmsgd2l0aG91dCBhbnkgZXh0cmEgbWVh
c3VyZXMuDQo+IFRoZSBYaWxpbnggZXZhbHVhdGlvbiBib2FyZHMgdXNlIG90aGVyIFVMUEkgUEhZ
cyAoVVNCMzMyMCksIHdoaWNoIGlzDQo+IHdoeSB0aGlzIHByb2JsZW0gZGlkbid0IHBvcCB1cCB3
aXRoIHRoZSBYaWxpbnggZXZhbHVhdGlvbiBib2FyZHMuDQo+IA0KPiBJdCdzIGx1Y2ssIHRoYXQg
dGhlIGR3YzMgY29udHJvbGxlciBoYXMgYSBiaXQgd2hpY2ggYWxsb3dzIGl0DQo+IHRvIHdvcmsg
dG9nZXRoZXIgd2l0aCB0aGlzIHBhcnRpY3VsYXIgVVNCMzM0MCBVTFBJIFBIWS4NCj4gDQo+IFRo
ZSBwcm9wZXJ0eSBpbiB0aGUgZGV2aWNlIHRyZWUgZGVzY3JpYmVzIHRoZSBjaXJjdWl0IGltcGxl
bWVudGVkDQo+IG9uIHlvdXIgaGFyZHdhcmUgYm9hcmQ6DQo+IElmIHlvdSBoYXZlIGFuIGV4dGVy
bmFsbHkgVVNCMzM0MCBVTFBJIFBIWSBjb25uZWN0ZWQgdG8gYSANCj4gRFdDMyBjb250cm9sbGVy
LCB0aGVuIHlvdSBoYXZlIHRvIHNldCB0aGlzIG5ldyBwcm9wZXJ0eS4NCj4gSWYgeW91IGhhdmUg
YSBkaWZmZXJlbnQgSGlnaC1TcGVlZCBVU0IgUEhZIHRoZW4geW91IG1pZ2h0IG5vdCBuZWVkDQo+
IHRvIHNldCB0aGlzIHByb3BlcnR5Lg0KPiBPZiBjb3Vyc2UgdGhpcyBwcm9wZXJ0eSB3aWxsIGFs
c28gaGVscCBpZiB5b3UgaGF2ZSBhIGRpZmZlcmVudA0KPiBIaWdoLVNwZWVkIFBIWSB3aGljaCBo
YXMgdGhlIHNhbWUgYmVoYXZpb3IgYXMgdGhlIFVTQjMzNDAgVUxQSSBQSFkNCj4gYW5kIHNvIGFs
c28gcmVxdWlyZXMgc2V0dGluZyB0aGUgWENWUkRMWSBiaXQuDQo+IA0KPiBJIHRoaW5rIGFueSBE
V0MzIGltcGxlbWVudGF0aW9uIHdoaWNoIGFsbG93cyB0byBjb25uZWN0IGFuIGV4dGVybmFsDQo+
IFVMUEkgUEhZIGlzIGFmZmVjdGVkIGJ5IHRoaXMgcHJvYmxlbS4NCj4gDQo+IFNvIHNob3VsZCBJ
IHJlYWxseSBtb3ZlIHRoaXMgcHJvcGVydHkgdG8gdGhlIFhpbGlueCBzcGVjaWZpYyBnbHVlIGRy
aXZlcj8NCj4gDQoNCkxldCdzIGtlZXAgdGhlIGRpc2N1c3Npb24gaW4gdGhlIHNhbWUgdGhyZWFk
Lg0KDQpDdXJyZW50bHkgdGhlIGR3YzMteGlsaW54IGdsdWUgYXBwbGllcyBzb21lIGNvbW1vbiBz
b2Z0d2FyZSBub2RlIHRvIGFsbA0KWGlsaW54IHBsYXRmb3Jtcy4gWW91IG5lZWQgdG8gY3JlYXRl
IGEgbG9naWMgc3BlY2lmaWMgdG8geW91ciBwbGF0Zm9ybQ0KZm9yIHRoaXMgbmV3IGR3YzMgcHJv
cGVydHksIGFuZCB0aGUgbG9naWMgY2FuIGJlIHBhc3NlZCB0aHJvdWdoDQpvZl9kZXZpY2VfaWQt
PmRhdGEuDQoNClRoaXMgaXMgd2hhdCBJIG5vdGVkIGluIHRoZSBkdC1iaW5kaW5nIHRocmVhZCwg
YW5kIHRoZSBjb21tZW50WypdIGlzIHRoZQ0Kc2FtZSBoZXJlOg0KCUl0IHdpbGwgYmUgc3BlY2lm
aWMgdG8gdGhlIFNvQy4gaWUuIHdoZXRoZXIgdGhlIHNvZnR3YXJlIG5vZGUgZm9yIHRoaXMNCgl3
aWxsIGJlIGNyZWF0ZWQgd2lsbCBiZSBkZXBlbmRlbnQgb24gdGhlIHBsYXRmb3JtIGNvbXBhdGli
bGUgc3RyaW5nLg0KDQoJSWRlYWxseSwgaWYgc29tZW9uZSBpbnRyb2R1Y2VzIGEgbmV3IGR3YzMg
cHJvcGVydHksIHRoZXJlIHNob3VsZCBiZSBhDQoJdXNlciAod2l0aCBhIHNwZWNpZmljIGNvbXBh
dGlibGUgc3RyaW5nIG9yIElEKSBmb3IgdGhhdCBwcm9wZXJ0eS4NCg0KQlIsDQpUaGluaA0KDQpb
Kl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzIwMjYwMjI2MTkwNDMyLmpxNmMz
Z3h3eTZkeWR3cGNAc3lub3BzeXMuY29tL1QvI3U=

