Return-Path: <linux-usb+bounces-33808-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLiEF5Q/ommq1AQAu9opvQ
	(envelope-from <linux-usb+bounces-33808-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 02:06:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D245D1BF9E8
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 02:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1FB2530B7143
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 01:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6FE285C89;
	Sat, 28 Feb 2026 01:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iNNV1BSZ";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="d0MNUK3u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RAjnmYqb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABA7284896
	for <linux-usb@vger.kernel.org>; Sat, 28 Feb 2026 01:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772240754; cv=fail; b=iDYPKgW5DLVYlxq6pKkAKxpNRtz4JKrwTyLh51oUoObBfkxVnZDDgG40OVcSN5vkhpbHdo3J4kdoIf7tt1X4IkSrR/5/VR++v+q4q3xcMEJcfcv6LmK77bZ1TjFl7j3akvp4bM5kv6/BWRk6f1nORKLebpAiskPVYCj4UeCxeoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772240754; c=relaxed/simple;
	bh=RqxFs/FWsuxp1De/59IhlDUPvrtKCBICuMuvZirjlyc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KRwgvWLyAhmAgO69CQkVO9ZhgRBNFGrXHighmQU9B/ajF5KZEduXmqPGDvC/5cMVBI5iPE0n5rg01RUcLt3E/kPaiTbdVKevP4nanXr8RhPJgaTZAuFeMP/3JmXCL9u2XJYlV2OJ1x/MiFln/GV0Cze10H9mpoETAYzd5IkPpi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=iNNV1BSZ; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=d0MNUK3u; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RAjnmYqb reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RLBGEL3097229;
	Fri, 27 Feb 2026 17:05:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=RqxFs/FWsuxp1De/59IhlDUPvrtKCBICuMuvZirjlyc=; b=
	iNNV1BSZdvrxu06bYrWssErJX1hCZz13AuE2NEXQDmr8xV4PfXnUIi0xa1ArjH8m
	7vFums8i/S/oQJwzq9j9Hc/519xkTKS5BOA4LB4V+jR0loW/AXR3kr3/nY5+AjUY
	dp7xpAZKG9g1J2HjLhbboSi9gQ4elHroiuMDY4/zUTEYTM01vfxwOY7/fmVT9zKy
	vaebxN0bogflRmuix73nLxcxkFGkaGoIe5uZTFv8GHYSlQMRjs83Ro0mMPkPepkv
	cMjlqF5XWDVGGlBsSs3ToJN8zvuFWMj59w7PuWgpm5gq9+k7G9OSh9xTcYjd9bgO
	TYJoOcWl22+/bz4jAR/+MQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4ckdnmk92g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 17:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772240717; bh=RqxFs/FWsuxp1De/59IhlDUPvrtKCBICuMuvZirjlyc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=d0MNUK3ud6NjqqzYTnDNnynSdF/oZbdMWWhDCcbfKZQsC4UPb6ffwXfZRdk3VOYWg
	 z3pPO85Y6UxPyCR+1BHEmeQkwK4ZjUzg+SWanO76pzf1HnqV/BoPFKBOPHRPoZp7hE
	 zRpN8w60BBTQp04sETMo1YcuqM5nOyy6xbS1L5nNovvQ2IqKi2YfOftdhjW7w5jj3G
	 MGuXVaA0CtGbC8zmetIUZlR5kyuAInLjNaTAD7afQ/wAjGdJRSX1OCrfrWo/53MM5c
	 OHlMMfmyIwWndc4OHf0FkNgiJTFa6YKhjV4qVqqv3LgIqP7Y57d9qLrCtweclkMYNY
	 LlWKT+RwU9scA==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2882240357;
	Sat, 28 Feb 2026 01:05:17 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id D50A7A00F5;
	Sat, 28 Feb 2026 01:05:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=RAjnmYqb;
	dkim-atps=neutral
Received: from DS2PR08CU001.outbound.protection.outlook.com (mail-ds2pr08cu00106.outbound.protection.outlook.com [40.93.13.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9137340535;
	Sat, 28 Feb 2026 01:05:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kkku79vshUBsH1H0rFhXfN7v3LRwbMB/79Afvu70Y9Ea753sUMYYWQWQrCLih+y/uXy/KcKu4GKALRR1kAgpPW8CmSI8wIsfrd2kxL46rIA2KiRLAGtasOXW5hX6xBOUKmmNFDXYKOUh/MPXtksBBGsN8Th1LQDkkdglqDoJ/MC6WW5SghSW64T0AMBdPzff+ClI3Kz41xv4B+uCKI3OyqjdMDwdHmu3ue6pE5SurhGASGW84cMhkkYB6EThjxCGIdeFqZ5ir9XxwUPF3WyELl+i7bDzNLDaKoL9Xxpfil9c9kfLn+gm3E5crSRiADqP6cl4c2OJGLlmdXlZIFIO4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqxFs/FWsuxp1De/59IhlDUPvrtKCBICuMuvZirjlyc=;
 b=riI7oDt500KmYfPfBUcx7r5Hlpm91pDLhj+N9JSd2DhTY17m0n87HpR+BerPSKl29KUaQDCCfo/GJnwuLyoGBzuwA+sRInwY77kiAUvsZcgQqIIMIBjD1udl4zTG0IkoogKPN/NUPAkFeaAEf8GIqvOdY55H8B0lME7+UlquN6aVTkrUvocW82MKXIr2o3Fpz72HYWNkz1DenU4kLAl6OEHdcK/vegpSWRBl5mNyIjoeoLUhwhR0E2DW57FXFYAYiVpdNs3Xf7r0m8+g7eydLud5STOk+2g8dVmqsJ9zaIzaCDW0EXgPm2sfHKcUdDV+g9Q2q2osOCCGyYcCnYloJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqxFs/FWsuxp1De/59IhlDUPvrtKCBICuMuvZirjlyc=;
 b=RAjnmYqb5lC4MKFWud5rShrLSbgQTFqr+Y+zPsrNyz8hbqAAtQbcTTvWHnFzCxMXPFvRccljGHbOXf14L5FGYaMDSaz82WZCL+BAdITeVbs/GfitI7jejHQquYXK6497OVcZ7XMB6pfDAZpuHAMpWLY8tckZSzyYhtQw23CB2zI=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS0PR12MB6485.namprd12.prod.outlook.com (2603:10b6:8:c6::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16; Sat, 28 Feb 2026 01:05:09 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 01:05:09 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: dwc3: Add property to insert
 delay before TxValid.
Thread-Topic: [PATCH v2 2/2] dt-bindings: usb: dwc3: Add property to insert
 delay before TxValid.
Thread-Index:
 AQHcplcq5wKRsoiC/U2CZtBcYSUwL7WUzwiAgABZrACAADAYAIAAWCeAgAC0FgCAAOrFAA==
Date: Sat, 28 Feb 2026 01:05:09 +0000
Message-ID: <20260228010452.jb5shv6xcm6rco5k@synopsys.com>
References: <20260225000512.tle2eu4gkd4ut6bf@synopsys.com>
 <20260225130323.24606-1-ingo.rohloff@lauterbach.com>
 <20260225130323.24606-3-ingo.rohloff@lauterbach.com>
 <9d59395b-ae39-40b3-af21-75468ec34cd8@kernel.org>
 <20260226171224.3ab6b68f@ingpc2.intern.lauterbach.com>
 <20260226190432.jq6c3gxwy6dydwpc@synopsys.com>
 <20260227002003.gznbxapvqr3slc2o@synopsys.com>
 <20260227120436.6f4e68a9@ingpc2.intern.lauterbach.com>
In-Reply-To: <20260227120436.6f4e68a9@ingpc2.intern.lauterbach.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS0PR12MB6485:EE_
x-ms-office365-filtering-correlation-id: eada1922-8c86-4c26-5f54-08de76656b62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 nDMu6loTZ2YmwqC9ARs6F6/W1zopFixk+ATUP50QHpd4lpptn8SJ3Om17E+Dy7zV89TzC8MWf3qqgLO5cSa5Aqvwi7SBdyuh1sE13jaTgfVIvNvfwRrR78Uxc/BABrEOLNeuwMZVk5qioDa15Dui9wriz6MwZpNpT5SPqJwSkDpj3hc/cP+nd4Qyp4kJP1gAuEiaB9Jvh2HE7v5UkF4UkCu5X5z/Z9aIjHaataxeoAC+Wt0mHCA7bc/oCGXjUR2j/C10t5tO6LwyMYVnPNB9VALaeJsvMXAj+rsrPo+HtCEjpXNy+0EAaF1Y9bTgd/R5lWgoQ35VXv/JfhFphoiWyK78WCoWKzP54Yh23xFjGtQPsVxnQQYOT4YWHz0cwI8w6BSBjAqC8QvZBtENehJ2B7w89yslJ1+IjPjOkjB4iez0ZhF2HFnLFQVi6QQt+YBAGwOXcSjNoASbPSOXIrxKOw4lNEDXw7D9wyi/lwIlV7L5kyB9HE/dw7+iDUvEOosl8f8l8xVp//ghApgoQnku0elPZW0mcaq203hJO3lGPMmcwPBruCTEmJLx483KKyJDPAagbP6rvmlRb++FRbgToeKjMroVY5lbkQ6Z4zdeIQjpTqabfzX+jKML9Ro4m+KJ4Hvke8TM0GR5gjMwAHkMBnxvFP/8BsfQpIhxq2GAKtCaBTmC2QS3ApFR+d0tZDOcXmIyVTCDgJmoxDv0mzaeUfly1TT/QnT427ZmUIzsaVYXYqoNMXAeSlTH57HcL//3
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WGZrN25CeWRkTFMwU0pUd2pBL0hld1Y0MWFvVm5uTkE0US9ybGNhU1ZTRTR1?=
 =?utf-8?B?ZlQwUmRicGhWcWl4VkxqYXNPa3JEN1B1WEQra1Ixa3RhWGVzTCtDbit6QVVJ?=
 =?utf-8?B?RlRDVGt1dU5kRlpCTXJWTG1HZ3NuUE5HMXVlUE5DNTdrS0tucGE1azRLMExW?=
 =?utf-8?B?MkJIQ1l5RVk5OWRERlZGalpwZGt2WXJNTWlEUlhsN2d4UkFFbDFPSXg1TmJi?=
 =?utf-8?B?dmtEd3lhSWRxZ1RlOGtGaHM4Nk5nWVJUeHl6dXpFNTgvODdSMFA1RDNuV0FW?=
 =?utf-8?B?bDQrTWcwNjZJUUNYNnBEeks3WEpURjRta2s1bmlWYWFjWFd3NkR6QkllMzJj?=
 =?utf-8?B?YmlqL0NCTE9XbjRvUTg1V0NyWGpCQTFpMkdSYkFJSnVNSHlQaGdWYkY2ZXdv?=
 =?utf-8?B?ZGZSUXZpbjJYMFZja2ZWdU1QWjE2b09Fc3ZKcWhwa0JQVCtqU1lIakxhb2N5?=
 =?utf-8?B?N1UzS0tNQzR1K0NELzZDQ3Z6QnQyTnFYUUJZdVpNWGo0WU1WTFdJVkc3ZWRp?=
 =?utf-8?B?Z0JDeGVHdklYYzNXWERtQit2M0UvZmhuOVRKSG02YWNsc0x2MXBVNVpDbTNp?=
 =?utf-8?B?ckNPK3RNeUV5OVROVjk2SVF2clBhUTdDaFdVMEtCZkJOY2xzRHZjMDZrdzhh?=
 =?utf-8?B?UVFicU9MbVVQQzY0bGU4NlR1TXRqT0w5aTJtVURRdVNrWFpNcnpHN2QzSWp6?=
 =?utf-8?B?WmxWQ1BzR2dEN2lHTmNqbC9iZUgzTjU4S2ozYTV4cDZZTGhwcithQ0RxL1Vp?=
 =?utf-8?B?MzNWSnVzcm1hTE42ZWFtM082NEVCSWx2bTM0WFRpWVFZclpCdDBqSFRrOUdU?=
 =?utf-8?B?andxRllVaEQ5NStpRlExTVA0QzBoTVRORk05ZThXMDBpcWVYeTRmOS9QdVhM?=
 =?utf-8?B?SXdDblN1WE9tU01TWW93ZU9KUExleHo1WEhrUXFpRlkvZHcrOGxWNDhUNEQ4?=
 =?utf-8?B?VTJ3NWtQaEIrdXkxbVFkSnp4My82Z2FweThGSjRaeDNkZlR1TTVmT1YxQUs3?=
 =?utf-8?B?a3NDcFRaT29VQm5QNGNJbm9PckZiL2NxblZoZ2FobVczRFZ6b0JDTWRhK3RX?=
 =?utf-8?B?akJ4MjJ5eGNCZjZnYzdmc0ZISlpGcDVlWUpoSkM0eWh5M1c3Q2tLVkpLeUFm?=
 =?utf-8?B?V3ZVL25IWjJFRHJZQ0ZEOFVIVXRKMk9JeDY1dlRZbFVVa0w2enNpZ0ZLTTBy?=
 =?utf-8?B?eDNzL0ZQVE1MVm9vb1JpVy9rWVlQYzM3TjhranJWdVhLZ2U1b29KVnN0Nlk4?=
 =?utf-8?B?NTc4SnhKYnV6SndCV2tFaGpuaTFzTnZJUWlrOEpFKzZ1M3Y2ZEhzaEtVcFFt?=
 =?utf-8?B?S1dXLzZHNFYrc0orYUtkMnF6NFpwZ0lyaitXM294SHNFTytCdVRobmRNU1k3?=
 =?utf-8?B?bGU5ZGgyd2tmeE1BbjllZGd4VWNtVk90YUhYMGlwZ0NCM1VHdDNNcWRWVUJS?=
 =?utf-8?B?U1FZNWNjZ215QXRKemh3ams2TUVEdGZmM244Y3dOdUR4WmczWUdjUVZIa0VW?=
 =?utf-8?B?K3Vta0Nrcjh2MUZHVkJMdlM0akFwNkloRWFDdE9JYk5CQ296WW5PUDNXWUpw?=
 =?utf-8?B?MHpzbERVMUloa01BOFIrOG54cEVDbkVaaDJrN1RCVHhsN2taZnZneFlyRFJa?=
 =?utf-8?B?ZXl0OCtuSWlROGZMcUlNS1FYTTBJL2t5SXZYaWZFUUhBWnkwTzB2MWJNWWZv?=
 =?utf-8?B?eCtMUkk1cFdXTVRsaFZ4V0dxSHdXNWM4RkRlQmhRL0lab1JzSkxOdlk0TXVI?=
 =?utf-8?B?c1Q1NkIxaHdmY1FOV3QzdE5QRVJnU3hTbEt4WDJ1blF6OWlhWUpwcEFvUGJw?=
 =?utf-8?B?WXRHQVFpeGEyUTBTYndGa09SeUxrMnA5TVMzU01wTE5MKzRXNys4Q1JVZTFG?=
 =?utf-8?B?N3krWjIzRTJzRUptNnh6U05iQ3dRQUJvekJpUmxiQ2E1bmdhVFRyMmhGa0Vr?=
 =?utf-8?B?TmMvSHdwSFhrcE1mcEZ0NGZrSzhxbjQwVUNqOWtpdmd3bms3SWhaOU5TR1Jv?=
 =?utf-8?B?em9oTkUxTjUxeWxxR0tqa0JsamV4ME8vVzBUdkRaalZKU0QxM1hxMkNXSUtB?=
 =?utf-8?B?aVFpYWtyTFV3QUN2a25aTlluSFh1U1hteDNjNlBHejdyNGkvSjY0ZHVFRU83?=
 =?utf-8?B?MUsyVG1rbUJaY0huV0ovbnBLMk12a2pZcUQ1U2ZIbXQ3a3JUa08wNTBzZUZy?=
 =?utf-8?B?bElJb002Qk1KMGdFNHNUR3VwY29kV0tyUHRmRUg1ekpydlVFUHZlTEFRMzRD?=
 =?utf-8?B?YitrLzBNcWNLOUc1NkQ4RzZSTG1GTFpNSU05dng4UEhCZlFnbEcxTEdQM0hh?=
 =?utf-8?B?ZDVyczlLRklpWVpFTEo0czFkNmludXJTSE1SRzBpdSt2QlBiR3hVZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5310860034A5A1438DDDBA1E056C4529@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L15wL00WmS5ScDLfqytx0Oj2IPyUarQZU478twsiHo3nhRGiXiHQl2fz1vMNOZPCCMfy6QbWOaQpw7Q+g3Dm+LF/vap5TKSG6ULeHLlK8WJ5NddTY+AXcQ/bsfoWj5SCVZ4HhD4cjhVo7GaemI8u6tsrG6dODp31YdUYIMp8mDp4w/ihgtVF1TMTevdq6KTc7eMH+cgi+p/+e5QoudNIZ2LktZkcYH9J8JV5xxJpDJ3RyEyZCCT28q0UxZOnGcG4c/PnRXlMpvKTHE9fjXp63k8m2Rc/u7fE10fkME+ITUQocjFK+VY61oXNXzbndr1CKJCPbkIbjEWrY9aiEjiqN3IRU2AKUJlwLoS1INdefJQdNimuyC2KWpltcFAa+mxpnNZVndpzr5OWWMdopxBH0OybpEDdF5Oe0ajGoAcWlTw5vE+JfWOEiAAWWwVT4AdOBfIKsgyfl19aMrtHzxiynUGvJzaPM9rS+s1yEx8+EfrBVngLuD52dc9RhQkkv4enZrfayNiJ27Rp7NHLtwF9a4+QE+JUtUvOWnMIQNGEQ/WrGYIq4MS4k4oXgfSUmDr6hEXutQrrGfKNQhGRdUMdlZDY7ME4+s7JGbn6R4+lK70mB+FP3SE+S80+JZubmDmTdBl30zFB+Ur8KYhvxGHLpQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eada1922-8c86-4c26-5f54-08de76656b62
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2026 01:05:09.8182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fCnmddzpSfqvLnlP4SnyBOy3MvZEkjC1N5SLTGH9Km+ouGaUXS172nTkTJLzMP54JAcgayAhlcyFFvZgfqOkeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6485
X-Proofpoint-GUID: 68G_givVflYkDZcXGOhSixOBNgpJJ6X6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDAwNyBTYWx0ZWRfXy/qbj16TBclb
 tbkJfa0y8VzOUFCJnykZ4i5K0UIusCQOoMfzMANe/4vfOK0jl2xes56ri64CZC7oAM7cDneKpMG
 yU9HRiHW68HOWn/88Qy9usEHdOayAvXGfnymRGLYTanzxdQ/YSAWWz4mqKnSpjC4pcAlQGTGQBM
 PJJ1zeBHxAm9ks4tbI4EePsmDo748nb+kDks2BmOIDRUWoFMRktGIgZ9qBe7xg3/WdRfY1/w7cq
 TiAptuld+i5hEWtK03yGw8ueUoHVzhHmHu13aEdpcGTNk/6chVG4iBTEMbsuLLo47nholT5nr5C
 CjUyPiKaczpyID8jgQMNN8LnSVVPQi6OcdYR/Q/ZE+2qVg8g56JK665yWtUVRtnMcVBzrlf3snh
 re9usahJzd3elrLXOEYdz8Uz76LUPzT0rKDgnpDOIHOwYETkLCJjrxjvWFTEFrEX8nk9Vun4ZHS
 qYJYGOxBM7qIkWhsjrg==
X-Authority-Analysis: v=2.4 cv=C4bkCAP+ c=1 sm=1 tr=0 ts=69a23f4d cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=XYAwZIGsAAAA:8 a=jIQo8A4GAAAA:8 a=VwQbUJbxAAAA:8 a=liBljJ3LzDc2BVleMDkA:9
 a=QEXdDO2ut3YA:10 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: 68G_givVflYkDZcXGOhSixOBNgpJJ6X6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2602280007
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	TAGGED_FROM(0.00)[bounces-33808-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D245D1BF9E8
X-Rspamd-Action: no action

T24gRnJpLCBGZWIgMjcsIDIwMjYsIEluZ28gUm9obG9mZiB3cm90ZToNCj4gT24gRnJpLCAyNyBG
ZWIgMjAyNiAwMDoyMDoxMCArMDAwMA0KPiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5v
cHN5cy5jb20+IHdyb3RlOg0KPiA+IE9uIFRodSwgRmViIDI2LCAyMDI2LCBUaGluaCBOZ3V5ZW4g
d3JvdGU6DQo+ID4gPiBPbiBUaHUsIEZlYiAyNiwgMjAyNiwgSW5nbyBSb2hsb2ZmIHdyb3RlOiAg
DQo+ID4gPiA+IE9uIFRodSwgMjYgRmViIDIwMjYgMTE6NTE6MjcgKzAxMDANCj4gPiA+ID4gS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToNCj4gPiA+ID4gICANCj4g
PiA+ID4gPiBPbiAyNS8wMi8yMDI2IDE0OjAzLCBJbmdvIFJvaGxvZmYgd3JvdGU6ICANCj4gPiA+
ID4gPiA+IFRoZSBNaWNyb2NoaXAgVVNCMzM0MHggVUxQSSBQSFkgcmVxdWlyZXMgYSBkZWxheSB3
aGVuIHN3aXRjaGluZw0KPiA+ID4gPiA+ID4gdG8gdGhlIGhpZ2gtc3BlZWQgdHJhbnNtaXR0ZXIu
IFNlZToNCj4gPiA+ID4gPiA+ICAgICBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDov
L3d3MS5taWNyb2NoaXAuY29tL2Rvd25sb2Fkcy9lbi9EZXZpY2VEb2MvODAwMDA2NDVBLnBkZl9f
OyEhQTRGMlI5R19wZyFZUnpaa0xUWnI1QmhoNTdGaVhteXE3ZTR3VlBIVWJYWmRnSDNhNjI3TzJr
YnpwT1RQaXdfMU1LR2NfekQ1Y3I4X1ktcjFoNVh2eUZMOWM3WVJOT2JBbC1sbVVOZ1N1VSQgDQo+
ID4gPiA+ID4gPiAgICAgTW9kdWxlIDIgIkRldmljZSBFbnVtZXJhdGlvbiBGYWlsdXJlIHdpdGgg
TGluayBJUCBTeXN0ZW1zIg0KPiA+ID4gPiA+ID4gIA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFNv
IHRoYXQncyBkZWR1Y2libGUgZnJvbSB0aGUgY29tcGF0aWJsZSBhbmQgeW91IGRvIG5vdCBuZWVk
IHRoaXMNCj4gPiA+ID4gPiBwcm9wZXJ0eSBhdCBhbGw/DQo+ID4gPiA+ID4gICANCj4gPiA+ID4g
ICANCj4gPiANCj4gPiBBZnRlciByZWFkaW5nIEluZ28ncyBjb21tZW50IGFnYWluLCBJIGRvbid0
IHRoaW5rIHdlIGNhbiBzaW1wbHkgZGVkdWN0DQo+ID4gd2hldGhlciB0aGlzIHByb3BlcnR5IGlz
IG5lZWRlZCBmcm9tIGp1c3QgdGhlIFhpbGlueCBkd2MzIGNvbXBhdGlibGUuDQo+ID4gSSB0aGlu
ayB0aGlzIG9uZSBtYXkgbmVlZCBpdHMgb3duIGRldmljZXRyZWUgcHJvcGVydHkuDQo+IA0KPiBL
cnp5c3RvZiBnYXZlIG1lIGFub3RoZXIgaWRlYSB0aG91Z2g6DQo+IEluIGRyaXZlcnMvdXNiL2R3
YzMvdWxwaS5jIHRoZSBkd2MzIGNvZGUgd2lsbCBjYWxsIGR3YzNfdWxwaV9pbml0KCksDQo+IGlm
IHRoZSBEV0MzIGNvbnRyb2xsZXIgaXMgY29ubmVjdGVkIHZpYSBVTFBJIHRvIGFuIFVTQiBVTFBJ
IFBIWS4NCg0KVGhhdCdzIGEgbXVjaCBiZXR0ZXIgb3B0aW9uLg0KDQo+IA0KPiBkd2MzX3VscGlf
aW5pdCgpIHdpbGwgY2FsbCB1bHBpX3JlZ2lzdGVyX2ludGVyZmFjZSgpLCB3aGljaCANCj4gKHVu
ZGVyIHRoZSByaWdodCBjaXJjdW1zdGFuY2VzKSB3aWxsIGNhbGwgdWxwaV9yZWFkX2lkKCkuDQo+
IA0KPiBBdCB0aGlzIHBvaW50IGluIHRpbWUgaXQgd291bGQgYmUgZWFzeSB0byB1c2UNCj4gZHdj
M191bHBpX3JlYWQoKS9kd2MzX3VscGlfd3JpdGUoKSB0byByZWFkIG91dCB0aGUNCj4gICBVU0Ig
VUxQSSBQSFkgVmVuZG9ySUQvUHJvZHVjdElEDQo+IGJ5IG1pbWlja2luZyB0aGUgYmVoYXZpb3Ig
b2YgdWxwaV9yZWFkX2lkKCkgZnJvbSBkcml2ZXJzL3VzYi9jb21tb24vdWxwaS5jDQo+IA0KPiBC
YXNlZCBvbiB0aGUgVmVuZG9ySUQvUHJvZHVjdElEIHdlIHRoZW4gY291bGQgc2V0DQo+ICAgIGR3
YzMtPmVuYWJsZV91c2IyX3RyYW5zY2VpdmVyX2RlbGF5DQo+IGlmIG5lY2Vzc2FyeS4NCg0KSSBk
b24ndCB0aGluayBpdCdzIG5lY2Vzc2FyeSBhbnltb3JlLCBzZWUgbXkgZmVlZGJhY2sgaW4geW91
ciBwYXRjaC4NCg0KKE5vdGUgdGhhdCBldmVuIGluIGhpYmVybmF0aW9uIGNhc2UsIHdlIHNhdmUg
YW5kIHJlc3RvcmUgdGhlIEdVU0IyUEhZQ0ZHDQpyZWdpc3RlciBvbiByZXN1bWUuIFNvIHRoZXJl
J3Mgbm8gbmVlZCBmb3IgdGhlIGNvcmUgdG8ga25vdyBhYm91dCB0aGlzDQpzdGF0ZS4pDQoNCj4g
DQo+IFRoaXMgYXBwcm9hY2ggbWVhbnM6DQo+ICogTm8gbmV3IGRldmljZSB0cmVlIHByb3BlcnR5
IG5lY2Vzc2FyeS4NCj4gKiBDb2RlIGF1dG9kZXRlY3RzIHRoZSBwcm9ibGVtYXRpYyBjb21ibyBv
ZiBEV0MzICsgVVNCMzM0MCBVTFBJIFBIWQ0KPiAgIGFuZCBhcHBsaWVzIHRoZSBuZWNlc3Nhcnkg
c2V0dGluZ3MuDQo+ICogV2lsbCB3b3JrIGZvciBhbnkgY29tYmluYXRpb24gb2YgRFdDMyBJUCAr
IFVTQjMzNDAgVUxQSSBQSFksDQo+ICAgYW5kIG5vdCBvbmx5IGZvciB0aGUgIFhpbGlueCBzcGVj
aWZpYyBEV0MzIGltcGxlbWVudGF0aW9uLg0KPiAqIEZ1dHVyZSBwcm9vZjogSWYgdGhlcmUgZXZl
ciBpcyBhbm90aGVyIFVMUEkgUEhZLCB3aGljaCBuZWVkcyBzcGVjaWFsDQo+ICAgc2V0dGluZ3Mg
aW4gdGhlIERXQzMgY29udHJvbGxlciwgeW91IGNvdWxkIHRoZW4ganVzdCBleHRlbmQgdGhlDQo+
ICAgY29kZSB0byBkZXRlY3QgdGhpcyBuZXcgVUxQSSBQSFkgYW5kIGFwcGx5IHRoZSBuZWNlc3Nh
cnkgc2V0dGluZ3MuDQo+IA0KPiBDYXZlYXQ6DQo+IFlvdSBoYXZlIHRoZSBjb2RlIHRvIHJlYWQg
b3V0IHRoZSBVTFBJIFBIWSBWZW5kb3JJRC9Qcm9kdWN0SUQgdHdpY2U6DQo+ICogT25jZSBpbiB1
bHBpX3JlYWRfaWQoKSBmcm9tIGRyaXZlcnMvdXNiL2NvbW1vbi91bHBpLmMNCj4gKiBPbmNlIGlu
IGRyaXZlcnMvdXNiL2R3YzMvdWxwaS5jDQoNCiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgYSBiaWcg
aXNzdWUuDQoNCj4gDQo+IEkgZG8gbm90IHNlZSBhbnkgZWFzeSB3YXkgdG8gZ2V0IGFjY2VzcyB0
byB0aGUgVmVuZG9ySUQvUHJvZHVjdElEDQo+IGZyb20gdWxwaV9yZWFkX2lkKCk7IGluIHBhcnRp
Y3VsYXIgYmVjYXVzZSByaWdodCBub3cgdGhpcyBmdW5jdGlvbg0KPiBpcyBvbmx5IGNhbGxlZCBp
ZiB0aGUgVUxQSSBQSFkgaGFzIGEgY29ycmVzcG9uZGluZyBub2RlIGluIHRoZQ0KPiBkZXZpY2Ug
dHJlZSwgd2hpY2ggY3VycmVudGx5IGlzIG5vdCB0aGUgY2FzZS4NCj4gTWVhbmluZyByaWdodCBu
b3cgdWxwaV9yZWFkX2lkKCkgaXMgTk9UIGNhbGxlZC4NCj4gDQoNCkJSLA0KVGhpbmg=

