Return-Path: <linux-usb+bounces-33712-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJBaLaCsn2m1dAQAu9opvQ
	(envelope-from <linux-usb+bounces-33712-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 03:14:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 251981A00CD
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 03:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BEFD33048EC2
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 02:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B563783A7;
	Thu, 26 Feb 2026 02:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pBaxEm8k";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="O8e8BUID";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Hg+Cd7VH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D79037419F;
	Thu, 26 Feb 2026 02:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772072092; cv=fail; b=RLX7f133vjSiMA3N5bcHCKTAOb+DlHVB8/PaJ6PnjtRhjmRSLAThYvA366V+sofdC8kbsZ6DH8sQ0sR3Fzo/Z7j5tpNBVZQSBKDTWF//tafCpH1rzA0Aq5jJAMoIfP4RRO73mwL3aWfOuRFNPwjJOlU8Iqml7D8ULpqYT2VMk0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772072092; c=relaxed/simple;
	bh=c5W8LGRKtLiSgzV9R/6pmdN8sZ9wmz9j7u0ekF4VNyo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W0m/Y9b8oaH0qZiKdBtgo4rfCB1RH5KDWaOGvCVLEvKyIWdZDX4LuasiK4sQnAOiXJTp8U7RG695sVR9N9wMRilXo6D176mQ/MKDqgyvNsZqRGeWm06LgfdVQTbU4eBE876JQJyzwRvMVdxOR86ZMnsMI30rsGCNM5haZALpVhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pBaxEm8k; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=O8e8BUID; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Hg+Cd7VH reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q1B5cA3932664;
	Wed, 25 Feb 2026 18:14:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=c5W8LGRKtLiSgzV9R/6pmdN8sZ9wmz9j7u0ekF4VNyo=; b=
	pBaxEm8kNiQ+gXNQcF4ED51ZxPWYVif4VGYPGqKwpSVPXXN5td+BNquRDgjmxeVD
	/Jw6nV/3Zl8v+d2SSjyoqdpl476TaNSdB35DXA30T4rOm1xdYnO2mn/T3gUoF+a3
	dT/PodxhUWexwGh3pvuCjcgVycBMn2rbRH6t4C3X8QBmA6IDilLWLUJkMbl6xUYs
	774MXBOsaJY/5JcqXkgPWZA/CNSNvV3QTdMtK6ESMoJgBhQ/vXWbu3ZPta4nt+cU
	p1o9uETutY4aRfX+zviDJFvydj5zmZ1tsj7ehP9jF03OfWPtv27VXqL4A/LaMCBz
	vBePw7XeuWTIGHQpOZA8bg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cj6ska4t6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 18:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772072080; bh=c5W8LGRKtLiSgzV9R/6pmdN8sZ9wmz9j7u0ekF4VNyo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=O8e8BUIDDFHbscGop7BQLFXOGVTMQbwKoFQAwK+JCcdoCR9DkCWGB1vCPb7nSBiNY
	 WKU6u6LAEIFVWWU24bJav6kyWfFzqjf4czbW8bKboxGXlD4gwu56qfoHJDdeCa1oCb
	 2CqDB8fIq8aldE4331hNB8dlu9AMM0vibTPLCfe8Dp4sI5GAFMXILO5G32zuuLFmJ3
	 vJhTnW3aiHZFPrvaT7y9Iu60PQuiwLt4WBV1T+EakqMkKG/+EeUbqvH3Q233rwkfdb
	 V0Jqoiot92QHmUN33atdlbiXKQw2NqyKX2vc6iTgPCjAIjuXR8B9f/aZxoP4/IDFN7
	 Nfhzk832VKF3g==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 69CBA40359;
	Thu, 26 Feb 2026 02:14:39 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 366B1A006B;
	Thu, 26 Feb 2026 02:14:39 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Hg+Cd7VH;
	dkim-atps=neutral
Received: from CH4PR07CU001.outbound.protection.outlook.com (mail-ch4pr07cu00101.outbound.protection.outlook.com [40.93.20.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 661F8220457;
	Thu, 26 Feb 2026 02:14:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hlUgigF+rn8qYqQpAYJ0HQvkDCsZGtnLyniXxP9UoOaswD8ENtZ+Ugtvh5ocJUGrLBGZixdXjmXkTLupyFpZEa1o+mxx2o6ybZclQyRDjxoCPF4E31QxcQkO08Zlu6owo2S67lXTrhKBLND3x1QG3L8/n4MFJ7ds+dvn3IcC71VxAE4svkjIJausNYUoHzhqidYYRN0DsMTl1APax+ORrWHAHmw65JNAMJarhYXmSl7togUxArN6svAE2u9grbhK/GACrZIFz/6os8vZ+9aVHr83xRkX3ygyapSBi68GM/7ESJWCsMOWuY2oLuXhiVbxg7MzAYSMR0jF2f8WvQprwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5W8LGRKtLiSgzV9R/6pmdN8sZ9wmz9j7u0ekF4VNyo=;
 b=T901fPhlhc1uPyrUWWy6mgE9j5S7ttaQPILACV1eRbQ3PPdQCiWEivGxzTgqIT/sKQ4QQ9C6SWRijRpxuEUq2MPC7lP3juJKXciLXOCYUaTiwvcOoas+nlg9jCAmZ7Q1MeXaYR1xxNTlO1otVAjDr+Psc0H8ImBG3G0jNiZZDcnAfpFlyRim1T0KRiC6NYitfifxdPnSVCHhZGeP1l7r5NXFXoJJaNSC/kEazmlhuPtNrDSv1+of+elkuhunU/4IBKcHOVDzXogoC6x3+kKM8XhVyGDKcUqHWfZTSJ4gpswDGdSgHzSiJE3LzOVJLgAjPPO8IEF3MnC0TK2ffmrz9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5W8LGRKtLiSgzV9R/6pmdN8sZ9wmz9j7u0ekF4VNyo=;
 b=Hg+Cd7VH2fWMAg3XPrX7sk344t+n/F7Tv/Y8rKGDlBQgkN72dZTCs6UVzwKTSpg5XLeIZfnIb/q921E3SK7rukADL7b3l5gBVSJ3GcKphm7KDYInr1y3Pw62bf72fon2SwveOBA2hfrIPi+CfX0FID6tnlM30i2MJGDcnOFKb1c=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA1PR12MB6773.namprd12.prod.outlook.com (2603:10b6:806:258::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Thu, 26 Feb
 2026 02:14:32 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 02:14:32 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] usb: dwc3: qcom: simplify error check in
 dwc3_qcom_find_num_ports()
Thread-Topic: [PATCH v3] usb: dwc3: qcom: simplify error check in
 dwc3_qcom_find_num_ports()
Thread-Index: AQHcpiNNiAyUtvoAWUm1OM7XZNYTDrWUPv2A
Date: Thu, 26 Feb 2026 02:14:32 +0000
Message-ID: <20260226021427.xoy2euyaqox7c43h@synopsys.com>
References: <20260225064245.8833-1-zeeshanahmad022019@gmail.com>
 <20260225065157.8952-1-zeeshanahmad022019@gmail.com>
In-Reply-To: <20260225065157.8952-1-zeeshanahmad022019@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA1PR12MB6773:EE_
x-ms-office365-filtering-correlation-id: 7a5f02b8-4711-45ca-6992-08de74dcc7e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 mZ6Fn3mICRrzUfaqYYqxXlm0/c4Yc5yZS2EmmPCJaly3YESzseoq6E7IHKD0hCP/iQWAjjz5zpUlZN+i4KLIMO9S2LBHCcPbgVTwXPcD6cQ19iPGzRHWfhkijrV0NGrUAbv8IKtXxGd9u5Sieh0Hfhls/adNrO9VvCkan5gwECD/FAx4rGvTaMGMYxPGwGd3K1wrliyU02/GRxd/Jp8SRvvHnLhA8ewI68BeFWW4lMZZ7tv9V1mgiychAy/2mQrTJAfs7P28qXa8AClUk8hjsYBgGNoL2vAEamYhCKzTTRPIxAxq2v+F2zZgd79t/achOrMa+kTkan//mjt4M9Nb2BbfUnJcFWFSMKTWZ/t9p1KIOxrciXc0F6FsvfMkP/+b7koIRMXfLyELyYoBoIT936IT0pCmwPBDNmztv7VcuIvypVMqEGt73WiZII+zHgZNjpDelto4pn2aF+6RXJKbQsWRfDjV9NqNtkD9Ompnv3aIbBjx6GsFoLUBrnkztRyRAoES1LRcCLPoO6nXE8N9gZhFhgVzDFdCW1X4cq47GUcG0iSG4Z0gYeyISsV9nF3c1E2g8FiemJkHt19pMo/X3Lm4gKq6WoUDU+9+1fHbKAADzvpFoqzFsm3OUT6YYOrRSU4x3AxagoM7eGPWkg7ot6JP3FMtm3la9L7Ph/pr4SPSSwVTTILBRQ+BbC/2le8wdyS3/p27vPjdlPfQqGUtIYibV0Mv1Tw+OZ3U0wBGHXMh1mLcOZykX02jRudlhyLSVLXLV9d5mNfGFruz4mQ76H2nhhMGCLlwaPat2x365no=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UHZKdzFBb1JjZ1pUcjFLZDlHNjU1Y3llUGdrVnF0ckF6dm5qby9yZHgzcUtF?=
 =?utf-8?B?WDZJbC9xQ21naUxPNGVVTUpiNUM3Y3J4Wmt6WDQ4UEdzbmJBYm85ZEVob3l3?=
 =?utf-8?B?dCs4Ym1GUFFkUDluZTRyejM2aWp4Q0RmaWZBclVHRzdCd0IwTEd3dVhRcGlU?=
 =?utf-8?B?YkdqUVZpQS80SEVOdkZOdFhzdVhCeXczSzczajNVT2VURjArS2h4T001eXlH?=
 =?utf-8?B?K2F6Q0Q1UVY0TlArb0NvWGdJdU5uNG9xY0NxWkk5c3dyN3dLMXA2WnRlOHE1?=
 =?utf-8?B?cE5JRk5kcUlCSmFKMFZVMTNMM1ZTajRnT3pISTFtWEp4MUlaU1dScXJvMVBN?=
 =?utf-8?B?TnpVckdzWUZpM01WWVdOTFhaN3Jtd3JQNjNvWEdWQ0tQWFNPMVJjTW1VaGN0?=
 =?utf-8?B?S0ZHc3orL05LWENZTHNkOUZnNXBSN3hlQkNIWUYrWkJnaTAxeGt6QWNORmU3?=
 =?utf-8?B?NmRLdGZuVzdoR1VJREJNR01pM0dLK25vZmRKaXNVMmRwZ2NNY2xnWmRpb3Fj?=
 =?utf-8?B?ZC9iRnd4MDNHR3k1VjNpQWVsQkRJSmlMWkFsd1RXMEhrVDIvdDVyUERiOHMw?=
 =?utf-8?B?bWx3UXV4dU4yclVZbG4xbUkzSDAzRzFqMzBPR21sVkwyZHFmN3MzdkdkYTNU?=
 =?utf-8?B?TGFjL3lsL2dlV0xjUXQ5ckJtZ2t2dnNoSEFmdTQvdkJ4ZDl2UXBFNmp6aUVK?=
 =?utf-8?B?dU15eFhFZHBVcm0zV281Q0N2bGhIdkhTZWRkenJZbTZQN01sVWdnS0N6UUlP?=
 =?utf-8?B?QU1DWUFqbitabzNmMjhGWUkwTzY2THY1V1hsdkd3UFVlZXM1YjgzQUJGMkVV?=
 =?utf-8?B?dE54S1luZmlvUVdLWkJLMi93SWZzYmVJWkJwN1QwazJSLzZSRUgvbjNIcU1u?=
 =?utf-8?B?cW9RUFpoRDFOb0lHdGpodjZ5TWtBdlRmT0V1bElmWDZXZzJrNk9hUEZjV2M0?=
 =?utf-8?B?S3J2b2hCdUo2ZDNjeHpiTENIbnpYeHRXVzhEZ0lqUHlKV3p5UTQwM1puOXY0?=
 =?utf-8?B?Mk9IUkVLOGpvQmNEWTUveUUzcXFWSFBuU0tMakdqcE9Td0I5T0lqRGpxME1L?=
 =?utf-8?B?bFA0NlY0c2tpcGQ4bVFDZkZJNytweXkrUk9wVFdlYjJndzVsNzIxV2ZsSnBQ?=
 =?utf-8?B?aWw3TGE3bUFHY0E0RWpFQWQ0ZHJaSVl0OFd3V1RrRGNFSDQ3d1BDVWcxS0Vv?=
 =?utf-8?B?Lys5ZVNKNjhzYmdGY2VXWTl3U2I1ekx5a3JSK2xacXNXeEJFVjByRHpTVExR?=
 =?utf-8?B?SGJIYXV4Qng5M3hRMDQwYXRiWVU5UHNTS3h4S1lXNmtCYm5NRUVmNnYwYTFI?=
 =?utf-8?B?MG5RWXplZUxWUnp2QWhLM0NCYmp4alMwSXBEeXdHeWlTNE8vUWxuZzF4VEZO?=
 =?utf-8?B?YVg3MmwzaVZTdmFOUFRFV0U1OEs4ajhPN3hZMnBsdDFRN0lGNlhBOGFkbDh1?=
 =?utf-8?B?eHUwcGJrdXZKMnUyUzVvazFnQktIZ1pCRWNqUkRROFUyZWd5YTJCRGtpS1l1?=
 =?utf-8?B?SFRtMUUvWldjck8zWWcyNzMwdjh0TzNXNGdhaG93bVBWYVFGOXdndU54cXRy?=
 =?utf-8?B?cFVKRnNRa0FWaHRJUU9YY0daOUpCZys1NUlJa3dDd0FMOTZvVmd3SW1QaDQr?=
 =?utf-8?B?Z1N0YmlyOHV3NkJQcEtlS3hMRGJBNG90VG5JcTNtL3VBeTRBcjRpVVhKUmNE?=
 =?utf-8?B?WS9rU3NGZXNYSFpTRDNvbjlzN2dxWVJieUpZZGJwUmRzS01uYmk2d3pNdlV1?=
 =?utf-8?B?U3dLOFNwSkQyVzJIeUduSWNOL2NOUHAySVJodjU1cWx1ck16MmhZQnR6UzY5?=
 =?utf-8?B?a0lPckJQV0pHUndOakpGYXBlalN2OGphTWlkSktHUTNhdkl1UHY0a1Fsb0Rr?=
 =?utf-8?B?ZmEvQ2trdXZOa2I2UzBNK0cwRytvSjNldkhXWGltb1U3ZU9sUUtBOGwyakpm?=
 =?utf-8?B?bWZTaFRvTi9RVFFGYTBrWk03YVhOUVA0SFhxb3o3cmpWNkJzTjJ4NUN3ZTc4?=
 =?utf-8?B?VnN5MVlaMGw2amdsSjVBLytvUWRIbWtmT0lSblFEanpHMHExNTZGR2JOemVN?=
 =?utf-8?B?RmNuc1BRcHRoYkc4NUlqZXpXbGxFWXEvcVZzY0t6eGxxQ3g0bzkxY21jSlVx?=
 =?utf-8?B?N1ZORHN3Z1VkMHFGUFhmQ3NYR1o4amFJK0VUWHROUGxnOWNwMmdRbGE2Z1Fn?=
 =?utf-8?B?d0lqSHExR2pXYjN5RnM3MWpENWhCTHF0V0JxS3hBNXQxSmJ0VmRxTlQ4ZGM5?=
 =?utf-8?B?UHBieTJTVVM2dnZHRkxTRFkrdGp0bzRuMFFOOXFWZ09oQUg4YTE3V0tFbHBm?=
 =?utf-8?B?cTlSTFVUU0lVSDIzdEhHMW9aYmsyMDhsSlg4TS9PWmNDVWhkaEcyQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFD8FD1D4BB4FF4FAB58C44FE43D5AA6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	frVWeOgY3y0JqI2YeO+c50RLDkGL3tgA8d4Yf7mFxUaijlHbvb+v7FrNJiHL4elNICeJUE0cxsiqdJUK8+xSUywzt5VVKdGSTjwqGCDM9qrllNex8spQmPJ2+loMYk7iAi+Z5utFaoKIbPzLvTt2pbpTVrOlse0+kttcCsPFs6ypbhhmyvlmovQZuLbKWV81Qv8Uv7XC76vQ+SwFEsFFRyD+IUocHNiMd6NMdRiUI665wG6ghIvXPrrPVy4Wf5azYhnCFAPJR3C1lhG5iU9g+3Bt5ftI2JFdceJR7h4zWZD2rXhOi320TjSXEl+/VNXTieXMlA4z06xYJ9rV0u0ZMdqYsNWniHyuX62J2TCxENeTSPc6KB1pmcgwOot0GbmSB3afrmU+durinpF3iYnCP0WW8utYyxTgJ303cWLh7a2w5BmG6jRKYadCMZP5gYbniGJJjyP2s80YHHUEmOtADgrwxxiJdwuiS3Pwz9qj40V6Wi0fNYyr5/AVFZmuqRJgQa2z5Wp9CjfUOXBvkpqpf3wfK37cAazWYMZYnFC9hwTG61MpOnJIrxf7miVrLbT4b8HgyqJaQJNxvMnqFJrcSipfEJCeKJrw5h3JxbMIeJcHWtuPYMnh85FhpS1YYQr/6dRjyEVBX5AP87AX0NKUEA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5f02b8-4711-45ca-6992-08de74dcc7e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 02:14:32.7678
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZB2TMfIGFD/o4sBsZ2V+wa52sMV6cg0f0WI5dYsH8aNVWrCkKcvEoLfhikIF6q4ZBwjmLBtwXvIwrNHt4K1WGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6773
X-Authority-Analysis: v=2.4 cv=UIrQ3Sfy c=1 sm=1 tr=0 ts=699fac90 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=pGLkceISAAAA:8 a=jIQo8A4GAAAA:8 a=bFIVNIMtsXGMemHQ2KsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: OeNRn2FL0emdsH69-X1HOiQ6YauNvnVL
X-Proofpoint-ORIG-GUID: OeNRn2FL0emdsH69-X1HOiQ6YauNvnVL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAxOCBTYWx0ZWRfX31wCf4gsaF+b
 ZU2GLBfKL5/oqhxzgoJSXmelAXbLpazeH1Xhc+3xu6dyrh49zEaiOwGgPwunZ7GNUWRLAMy1XRP
 ZO2naFnRnUcN2QvEfi0EJRCSA6z5ROsyBwJfOfDEtzKKMKNxuNcpKO/qFI4lZmrLSnDs03pktlL
 3hH4g7jEXrGwzx+IZJAJ47u2FFDcMOP3RAGWugNLkn+C80wbkrMEmJmMn13i589cro/tuy3I8dr
 hsiIwJWWpDMTmsjpSKwHJZoeoLpCx69EP4/9gYRADuYxmRWAZr3yWJgnnm9c6IHJp0a1tG51SPD
 VML1Le8016SSm7ZylOnz4OAohDbrC+iS4s05HwsUeMkSi8w+MkOT/s8I6o/KMmISiGkZlF19l9g
 hVtAWi2eYZAQMDcxg9CdMoGEA1oqruKRefU44NFCwgdZ3MykKF5OTsk0V/52x59s4hCQBOA25AK
 FNChJYMDWSwgY0R4NwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2602260018
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33712-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[synopsys.com:mid,synopsys.com:dkim,synopsys.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 251981A00CD
X-Rspamd-Action: no action

T24gV2VkLCBGZWIgMjUsIDIwMjYsIFplZXNoYW4gQWhtYWQgd3JvdGU6DQo+IFRoZSBwbGF0Zm9y
bV9nZXRfaXJxX2J5bmFtZV9vcHRpb25hbCgpIGZ1bmN0aW9uIHJldHVybnMgYSBub24temVybw0K
PiBJUlEgbnVtYmVyIG9uIHN1Y2Nlc3MgYW5kIGEgbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWls
dXJlLiBJdA0KPiBuZXZlciByZXR1cm5zIHplcm8uDQo+IA0KPiBUaGUgY3VycmVudCBpbXBsZW1l
bnRhdGlvbiBpbiB0aGUgbW9kZXJuIGR3YzMtcWNvbSBkcml2ZXIgY2hlY2tzIGZvcg0KPiBhIHJl
dHVybiB2YWx1ZSBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gemVyby4gU2luY2UgemVybyBpcyBub3Qg
YQ0KPiB2YWxpZCByZXR1cm4gdmFsdWUsIHNpbXBsaWZ5IHRoZSBjaGVjayB0byBvbmx5IGxvb2sg
Zm9yIG5lZ2F0aXZlDQo+IGVycm9yIGNvZGVzLiBUaGlzIGFsaWducyB0aGUgbG9naWMgd2l0aCB0
aGUgc3RhbmRhcmQgcmV0dXJuIGNvbnRyYWN0DQo+IG9mIHRoZSBwbGF0Zm9ybSBJUlEgQVBJcy4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFplZXNoYW4gQWhtYWQgPHplZXNoYW5haG1hZDAyMjAxOUBn
bWFpbC5jb20+DQo+IC0tLQ0KPiB2MzoNCj4gIC0gRml4IG1pc3NpbmcgdmVyc2lvbiBjaGFuZ2Vs
b2cgaW4gdGhlIHYyIHN1Ym1pc3Npb24uDQo+IHYyOg0KPiAgLSBUYXJnZXRlZCB0aGUgbW9kZXJu
IGR3YzMtcWNvbS5jIGRyaXZlciBpbnN0ZWFkIG9mIHRoZSBsZWdhY3kgb25lIA0KPiAgICBhcyBz
dWdnZXN0ZWQgYnkgVGhpbmggTmd1eWVuLg0KPiAgLSBBdWRpdGVkIHRoZSBtb2Rlcm4gZHJpdmVy
IHRvIGNvbmZpcm0gdGhlIHNhbWUgcmVkdW5kYW50IGVycm9yIA0KPiAgICBjaGVjayBleGlzdHMg
dGhlcmUuDQo+ICAtIFVwZGF0ZWQgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIHNwZWNpZmljYWxseSBt
ZW50aW9uIHRoZSBtb2Rlcm4gDQo+ICAgIGR3YzMtcWNvbSBkcml2ZXIuDQo+IA0KPiAgZHJpdmVy
cy91c2IvZHdjMy9kd2MzLXFjb20uYyB8IDQgKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9kd2MzL2R3YzMtcWNvbS5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYw0KPiBpbmRl
eCA5YWM3NTU0NzgyMGQuLmY0M2Y3M2FjMzZmZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2Iv
ZHdjMy9kd2MzLXFjb20uYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+
IEBAIC01MjYsMTQgKzUyNiwxNCBAQCBzdGF0aWMgaW50IGR3YzNfcWNvbV9maW5kX251bV9wb3J0
cyhzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCWludCBpcnE7DQo+ICANCj4gIAlp
cnEgPSBwbGF0Zm9ybV9nZXRfaXJxX2J5bmFtZV9vcHRpb25hbChwZGV2LCAiZHBfaHNfcGh5XzEi
KTsNCj4gLQlpZiAoaXJxIDw9IDApDQo+ICsJaWYgKGlycSA8IDApDQo+ICAJCXJldHVybiAxOw0K
PiAgDQo+ICAJZm9yIChwb3J0X251bSA9IDI7IHBvcnRfbnVtIDw9IERXQzNfUUNPTV9NQVhfUE9S
VFM7IHBvcnRfbnVtKyspIHsNCj4gIAkJc3ByaW50ZihpcnFfbmFtZSwgImRwX2hzX3BoeV8lZCIs
IHBvcnRfbnVtKTsNCj4gIA0KPiAgCQlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxX2J5bmFtZV9vcHRp
b25hbChwZGV2LCBpcnFfbmFtZSk7DQo+IC0JCWlmIChpcnEgPD0gMCkNCj4gKwkJaWYgKGlycSA8
IDApDQo+ICAJCQlyZXR1cm4gcG9ydF9udW0gLSAxOw0KPiAgCX0NCj4gIA0KPiAtLSANCj4gMi40
My4wDQo+IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMu
Y29tPg0KDQpCUiwNClRoaW5o

