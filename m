Return-Path: <linux-usb+bounces-34164-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICiUGbhdq2mmcQEAu9opvQ
	(envelope-from <linux-usb+bounces-34164-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 00:05:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E79152287D9
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 00:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59D71303A8C4
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 23:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96C136164E;
	Fri,  6 Mar 2026 23:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="melXTis3";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NGi4pALq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ii5xk52K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E56345CA1;
	Fri,  6 Mar 2026 23:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772838323; cv=fail; b=I7tZdxnjaqQqT/IugOUxv9fHAmDsllM64tPIiLMOWuTEIx4+J6GdlzPfV48M2stE/rRDa5vao5yp/EQAmszJpCEuHfS4jH5/xZpmI9gi2nApXcpWGAE8TcZpsysim/KCsZwklK45ghLknGI/RBnA97zbEhjEkzrK6U+f+jJotgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772838323; c=relaxed/simple;
	bh=K4A1v0o3b4F7xhIsjpwYwTG2M8TFRz+lzJYgDzonItA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Wzm/0eA5gTzCzxb5Jhuidyd511jQphrJsT/X43ucKX1vav6AVyzGU9EBPEmvvM3NM0pZBYUndn8Fr5qblHAJOsmfP0CuqrxzFtOlKUKLf0tVcXHOCxQ7G+SRV3qqhKUfvpHR5rH7YacbnWMihjTYLlWYHnYaFRwKBWxSSdjPccI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=melXTis3; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NGi4pALq; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ii5xk52K reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626KcMaW1986477;
	Fri, 6 Mar 2026 15:05:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=K4A1v0o3b4F7xhIsjpwYwTG2M8TFRz+lzJYgDzonItA=; b=
	melXTis3qJZv044AfuOe72ov8KX/SQb54ybZe1fiwbIMtyyhbZehkdIFhvh7hemq
	QcqK9d+2shHq6TJNfTcF1iLOAZVKM8w4i0GNE+CIIG5s4NIQ6td9DMbde/CmiEC3
	4x/fDXV2gV2OT830G4au3ltVTgUxv843AqLjndfU1/K9KEbobg1Uv+MqJoysjtub
	2MdT5k9sB4Ryw3lTyyhwpMTaBtCijOhQg8Aubb7Desa6fuwDgaX9L2DSXYWhxAgw
	dZyJufRyR+rT5woZt9AItXsZR8S+QpzkwL0orIbJBEpyafzT9TqtUmkULLqw9oR1
	soDyGFyYTmpV3Zyf2NR9Lw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cr4mk161x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 15:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772838310; bh=K4A1v0o3b4F7xhIsjpwYwTG2M8TFRz+lzJYgDzonItA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=NGi4pALqoGBeMgPVhUTYqfs1H28FlJU6GZcWGx6SJgTq6z2M69/tqEyTpJEFn/nDX
	 aGAlUtALAmPf1COXALmjU74Km4Gf/iDw9nbjrCa+49F+zQcw5oO8KlRXcF3ZHUJhe7
	 rxiaLkI9z3/O9PsaLkm4G7Z4Qnmy2Z5Opir7GNOXWhPvSjgtfpIIi/7WsE0vD9o6Wi
	 10qNMa7AidO1Pt7sZaH2nxLkTrqaUniiceXZ3bKPppl/Yoey6OJ5u+fJgVbsQ7JRgN
	 0a42jG37mrO8Ujdh/rNElI2fwMIDVSjdeIVZ3PTcP58jScJbY4seHvlMWa9OMwXt+D
	 pLnrHw2kdbwiw==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DFC9F403B9;
	Fri,  6 Mar 2026 23:05:09 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 3D98CA005A;
	Fri,  6 Mar 2026 23:05:09 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Ii5xk52K;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00307.outbound.protection.outlook.com [40.93.1.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E72B92205C8;
	Fri,  6 Mar 2026 23:05:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pr25KoykongbgbZet1S0jDxRkMCHHW7WFhlx0BjS2Hirmrovq9XG9NPLgcbszsEJ68kY/QAyUFjMI+mujAYhfWWYCZg5QAtyfIaa/jf/xfu6IFJOOz9z5a4s8wAKyQftshrfbCtdmBHRfVVM6L0oRiFi3K+KapoWlUY3zEiuLtazXsRkwxyJs1WQRIfHmgTyoCfAOdsT01HbmK2HmrdD4nGBARUh53x1sSQxxJg4QKbiXFfOQff0mChuRmtOglyRswZpHzKGPI/6MCBwnsLKGWOWhlr3pCtEFCchzQVR07jRNdOclH/PfqsXwEQmjiw9eI1OiGe185Yre2j96PYmDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4A1v0o3b4F7xhIsjpwYwTG2M8TFRz+lzJYgDzonItA=;
 b=v5T7Z6QNF9X6UrACizj5QgLaA8kMXtS8IttUEgkBgoaw2Gt0NZ8rd6ECPY1UsoduEO0PDd/0lbdkErCAMMxZGOy0Zlt/o/fZ7o6WvnUizQLv04OINVzE4Rk88d+Xxiyn9oQucfdOoOAbqucqTJTUVUgOBzZRoE64oBCy9a2FEoXm4rfenHbg5aciI9YiB0Et/tGwaPs6JQ5gBsZLMoJ1wHXfzNcTj9IAjdYAXolKLLtm6uXItAK96XbAcpRBnzvBVUcBbjrxyTo42E0+z7waf8JU/X7Zzh+/5HH0qyt6az8r0DyysaC7KfRKJRNE1wLkK3Rd6vgyFl2+fVt0B3nJgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4A1v0o3b4F7xhIsjpwYwTG2M8TFRz+lzJYgDzonItA=;
 b=Ii5xk52KGSGueI+TxTB7jSZO5gnNXT7vJ9AHUDl9aNeQSxh4xF2zfwcUgpMqsRURz/Y/KFVUg6sn5w3eFS1TY6MqiSdp84KEBiuNz351ot4t3y1BG/7PJ/Qmd7KvUH0zMxOsKrN1AhIgixh27GYPJcfdXQd+zm3GnzTBV6Px3+A=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB7567.namprd12.prod.outlook.com (2603:10b6:208:42d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 23:05:00 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 23:05:00 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ravineet Singh <ravineet.a.singh@est.tech>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jura@vukad.in" <jura@vukad.in>,
        "malin.jonsson@est.tech" <malin.jonsson@est.tech>
Subject: Re: [PATCH] usb: dwc3: gadget: Inform system of suspended state
Thread-Topic: [PATCH] usb: dwc3: gadget: Inform system of suspended state
Thread-Index: AQHcrITXq3zDzm/ek0SIJMz2SpfVYrWgwp2AgACn7gCAALeyAA==
Date: Fri, 6 Mar 2026 23:05:00 +0000
Message-ID: <20260306230452.rfnxcqhy4ehjuubc@synopsys.com>
References:
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.c5f44c79-75b2-43c1-a791-806fe8b693cd@emailsignatures365.codetwo.com>
 <20240603131304.233403-1-mike.looijmans@topic.nl>
 <20240604010256.4dxamwvcjxug6xfb@synopsys.com>
 <0fceefc4-2b3c-41a4-a6ac-d0b6dbacc1f7@topic.nl>
 <20240604230624.dk3pssivd7g3qb7p@synopsys.com>
 <23bf65a8-b3b2-459e-bee7-ca7c4e4993de@topic.nl>
 <20240606002909.f6a7fwfh7ccb6pxq@synopsys.com>
 <2j6o5atwkm5wl25adcusadiadme7gqpx4vqmscl42wnxgjyh7b@b5om47iesajo>
 <20260306020621.4o52wfl2ej4dxvdg@synopsys.com>
 <jr5jzgvstxr7galevtc7p45q4jx7pk62itv2yki7fw6rlivltz@z6vkp5k5sfj6>
In-Reply-To: <jr5jzgvstxr7galevtc7p45q4jx7pk62itv2yki7fw6rlivltz@z6vkp5k5sfj6>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB7567:EE_
x-ms-office365-filtering-correlation-id: aa4a84bb-ef77-40e6-a003-08de7bd4cb01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 vXdq2JAbs910zxupMrLUL0cMj2E+3dgnM0SZQX5Ib5nF3cgBQ6F16Pq4qk8gjr4tMYDnApzW3rPafrPKtJOYLaKJssSfVOhUldRXQ4i+xT3j00Gn0apU+frnGFYsGdGCnPFqT/SE5EFYwC6EtuzUV8kOopYwgWvZQfFQuxubyuYscNouvdmVYae2yts6yc7Iq2Qjvpxbl+WT2oL039s8snCSzC6v4l9SDQIdK0yGBmTVqYQhAxZ7ClhTVqF+8PkqkiPpvLhBexR1AqLmSzTKyQhJtj8LljJlM8bkxgYAwXw51IJXhCbAEKNMmMelZsk6IAZnxeGe0tABielkuVmix+nGZjtRWgA9BP33M6McEub0nooQZ0drdnCjCUCiwZIO5Yk3pt0Yir2hvG6Kbt6PQTzPDwfIRVgVIxtVRElcKxq+dSE/9iBdoJA5xTVZCEC4xQ3QbBwLrAtF2933FrCOwHIAY9w2qArTkOFmt6CJFo5SUeKKnefxzaIJruQTJI1S7LdIIl3YuGqhuj82+70IigDo4pCTAe/6mlTlownxW7sFGNwGUsqeuDMSfayTy+rwL+x3TIHLx9v5u887uxn1MkJ/thNAKMRGPGT2fJ+x6lwFY/DYqH+bjrgQbZhafz0LTTEtdpYMmFEUenDGCrCjY3HPxa8fSRqS2JF3FQZv2RU6ZRu97m/hILYl3T6C1NiCdljqhLvfOmzkoth60S5GAu2FkBCsJ5cmGpdpKUYUUPMAL8c6kMx5dzPGGZAIPmQs0buazYELAF73Y4XQnX6xCIao3VZMu26DWh5Suy3IfAw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TWFmOU85WkJ6SnBYUTRZNnN2aEJhajgxOHJUMmgwc0Z2L1ZSeVRZQzltemww?=
 =?utf-8?B?eFNwNENyUXJVTFM0NWdVU0FqYnVhbHF4OVVVOWhGZW1OVGJNWGt0WW15TU1E?=
 =?utf-8?B?YUdUbDgrTEduMDloU2ZSNGlPZGRPTmVNODc1Y1EyeHByMVlOaFFXSWxGeUNI?=
 =?utf-8?B?dXFKMjkzNHdyMFpVTS85dG92S29xbVV6TmdjSkd4VE5XcUhqYjVuNUl6NTRy?=
 =?utf-8?B?NzVJeEg1K3FHZDVGT3Mya2pjY25NeklrOFhHTDZCVDl6amNhY09MdFBzMTBZ?=
 =?utf-8?B?bVBBaG9UOWtPdGswMDNMaHFXOFhTVFlzcnBDM09tUzR5NldRWUpZcEd2b2hp?=
 =?utf-8?B?amJTeTdoQkFvY1BsbU5LTmZkSDRiV3prU2xmQUR2S1IxUVpVZ055d2toRnVH?=
 =?utf-8?B?SU9BSXNWd0tWQ1N0U1A3cjhsNlEwQXAvaXRGTmxIS1RYcWNNT1JhZWRKYTRV?=
 =?utf-8?B?N251L2xpMkdzTE1EVWJ4RXZ4RUw5TWRoQnVtTXhMaW8zRU9YZStxNFR1THdJ?=
 =?utf-8?B?VXl6Y05WQWZ5eEdVNm5TOWhWQnVjNU1WWk9HeTlibTMzdkFoUm1aVFNpUUxI?=
 =?utf-8?B?empZVUI4UThPZXVSalJyYVFqQ3Q0NElYeHB6Ui8zSEJkM1gvRWZPQytKN05w?=
 =?utf-8?B?THJQMTNOcEQ1bkZBTXFsOFliMWs3N3d1b0pMQlIyYjdKbGttWEdiYko2SHZt?=
 =?utf-8?B?WjJ6MFAwdU9rdkJ6Y2crT0QzUHZGa1hFS1hqWDBoM2FRRVo0bkN6ajIxRmpa?=
 =?utf-8?B?L01wUzZTYk5mWG83bG9RR1g4eUJ5VE1QQVAzSFMwYjVtSzFDUk5LSCtNYzFr?=
 =?utf-8?B?VVcwS2Q1enhSRzR4dFFhTlM5Ky9PbWZMNkxyQ3V4dU1GVUU5d1J6dXVlaUc3?=
 =?utf-8?B?TEpaczBrZVdZemxFRzFReVRaanllRUVFTEVtOExTcEp6K2lRYlV0MFlSUjlV?=
 =?utf-8?B?VFExSlNYMG9FOTEydEVTd2RnckN1Z2dNQ1FMVExvWCtjelJvY3krVmZmL3Yy?=
 =?utf-8?B?MlBrem91MXRNdm11b2RiTzNIWW5VaDk5aWlFZTNZSm5tenVsOHp4czYxOTVM?=
 =?utf-8?B?VWxYbDRBRVB3RHdtekVwNkJNdE9tb3F2dHpwSzI0NzdPYkZsN1JtOWZKYkg4?=
 =?utf-8?B?K2RWcldzczFMY0FUWDhTN1ZEUmFqN2pPR0pFd1E2RDA4QW9rZXlLVC9nYWtG?=
 =?utf-8?B?eUNSL0lsUDNPUlFtRFJ3ejVpMzdmcEFDbCtJNVE3NlpvNzN3NU5RcWNhQ1lw?=
 =?utf-8?B?VWs0R01FKzIwSTB0MU90TW40Qk1NbWZNdHpQazZXbkY1c1hRNnByL1MrRVNJ?=
 =?utf-8?B?NXowWXk1MFRBcFZOV0JiWlhQK1pMdGZGb0xvWE1ua1QvZFZ2SFhvdUh5TzNr?=
 =?utf-8?B?ZUZTTEtPdXAvSlpnS2JPcFFmM2ZTUDZGY3Y1RU5abzhEWjZJcFhQY0g0SmpW?=
 =?utf-8?B?STkyM3dYdUJxamFrd2lsSXlMU1ZIZ1ErM1JpK2FhdlA4ZXJzRmlkTGJtQ2dn?=
 =?utf-8?B?MFZrL3hDd2lRd0xGSEtKSFQzc1dTNVp6b053Vnp4SURkR1V2ajQ2aVFCSFI0?=
 =?utf-8?B?LzNjZ0hMOFE1aU03cVVZaUxkSm9XNU9Ra255ZHZyZVV0aWRWUUFuR1hVbldK?=
 =?utf-8?B?dGRqOENaV1BRUEVHeGp6alpYSjUxUVRhanBKNCsrUGY0YUtRVUNoeEl1ZFpr?=
 =?utf-8?B?bUFMZzZvSVhwanNkNWQ3N3B2T1p0RGY3MDB0UHRGQ3hJMjNuQWs4WFJaTnlT?=
 =?utf-8?B?a00xNmlTb1JVYzZ1U1VpS1NYaDVXbUZxVEV3VHZudFNoOEV6OWVwMGNWeHYz?=
 =?utf-8?B?disrS0Q1NnBlZG9lYkdCYlFvamtiakZnOXBVM0lGM05kZ1FhL08rbTZGeGRZ?=
 =?utf-8?B?MUVjODNwWE5Fa2JYajBxTG1GYWNUWVR5ek5tdlAvbjhGVjFkekVqZnlFZWpk?=
 =?utf-8?B?N0lvRlRCTjlRNGVtQkZYOXJVWFRsNUJIRTdWc3dXSHl6NllWSS9SSHFKbDJo?=
 =?utf-8?B?NzA4RlczM0dCdU9MQ1RPQy9WYUE3dFJ0K1VUdGdXSFdxZUg2aVN2QmNNL21i?=
 =?utf-8?B?UmlsTVZpZ0d4Y09oZ3oraVhZM3dmcDZSSE1kaU1KZkVyZjlSbGdaRlViaFdH?=
 =?utf-8?B?QWZJQWRXamx1dUFWNjZZTEMzVHdMb21Ed1VZMzBsTEJySmtqUElHdFlvVVFI?=
 =?utf-8?B?cVNlLzVUb3I5Tld5SkFRRVRWTGlxazFYYnlEQVZNek14WWttSmRtcnBiTGUw?=
 =?utf-8?B?WlVpV3psNkRWMjkrZVB0cmc3Z05Idysxa0s3WFVjdEdoZC92YXlRdzFmaGt2?=
 =?utf-8?B?cmV1b205SVJBVk5ybnJreGV5dFh0bDBQS1pNNWR6VE84bEZYZjBKQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <33D27D83B91BCB499F72E05803655D58@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	e0Vn4PVZ77khiYYMjYjg7U5naVyeW2SPpGFNohfmMxb40ZD9csMldFXJng25RgE9X/LrJtQLHIO1aP0Glx4AItvwuw2BYnhgLepVSk7bt2MtjQrvlLMG0WG9MLXPzymJwgwkYfdDkDA/ahfu5VlrLn1rLM5eeoxdmPAPN1Q3+KT9DqMl5/Jq3Fi6delRukntC9fVWHGGszc4cF80z2u5lD8u3SxTSOjHHtjw6EQ5O5f03Db53OnofkvI+bKQW0H2dtlzr2jXqG6WuYsYNn7bJdRZAEF6i1rpRsh5SmfZ2/eVQYLGjf3S4ecXj8y4+ngPmUIYBUfaC8UOLXXD3WpT5A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	A4RRLAnxnLSPpZLzRR8Qnd3ygi66ws4GpKTXaoNCc5QReAfhNijqQbBbNFrDFoURinzLYicR+zpFXTWXyIY+1UK+dLMPmFURKITZHilxN+WqmT2oyYNIO/DrRJu47TWMisJdSZjL0hnSqOQPj0QpFMsUUKwPzR7JWdj/rPTZTrrb053HfcL/o9xYJbcDYiG6xazPRGV14h5UBFhRU9j8cae2+FL6tnUjjvBFQMvVKTBsChsOyz8Qcnn26eOrYpJSRwtLCqB23Q3L9MBlgYtB3NKWN1/RJzFH/+wMszrF9g4+2fVqea5WLJGueqtfXRcaodjblDGbLp0MpsA6ndH3ypfaRK/3e/aQ60RAc3FGKpYcFW2vuTvdPTtM1MDBBKOQzuwaSGeoMv71fEY353Z/5N4ivLCKtmb2ECoVfgvphkdZ8q3APtLzo8PJ4n1eFzT6q6yLizrprU3u+RK/tb01tvfExw99+cASYMPSQMIA/XkHcw9K+0p5s0rFVhvfB7+8PqsSXDp3SCjwUL8LDJikG4qRTRgaq21pm3wMxCYe6tdBefGwqjCe4v/fQKDFfc1A99cRid1FYsL7yfmgbhb5i5T9GXjvb2HXJUfPh9FiQiAnj46Dg7Igwn9C6Cd6VmaqE4odafhf+IYnjfwhNwlB1g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa4a84bb-ef77-40e6-a003-08de7bd4cb01
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 23:05:00.2208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0kDPovOgveNrJqBNjpFcLefJ9CSa3WuPc8J9h33zTTVLuEq8MpZElwYQ7ZYOJis30wDTOfL+BV7yQBoXFq8T1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7567
X-Proofpoint-GUID: jOWsDTemIsxHz-vltrC0q3xq3A1WCUTs
X-Proofpoint-ORIG-GUID: jOWsDTemIsxHz-vltrC0q3xq3A1WCUTs
X-Authority-Analysis: v=2.4 cv=H+rWAuYi c=1 sm=1 tr=0 ts=69ab5da6 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=9GoOu40MpdsJ-Mdi1vwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDIxNyBTYWx0ZWRfX43BGtOhO8t2Z
 dgROn/kCgdvrQO4eu+37IHJ63lFR/ZkQjacrVgL49Lk1LBPjNMH1K7bLsOGZKgstzS/WapnDAlZ
 ex7MQwEYMTmZrHMkhCVR7nas+dqfqJnLCxIAlFLBGvJxzLKX/QHNO0es1SZMtK0N/2MZLBcZ7TY
 roXGipOSFuP4/4+cWJzNeuWlsUMHHn3zgVr2GoEb2OH9TCOBbFknfUH7VUBYf73HQb78ko7LJ1k
 d713lipmnz6z7z+7/6r3EC9lahSvdj+YHHGW8GRI7B/gQFv1UnNeXtV05tjpA6IF+D+Fs89ywV5
 xrXKtuwl7mETzKJnqKNupmx9TVyJGjeMdL50LTgVOIa0Ma2Wz3K4TgkqZs3HmoNF3Qn8K4oyYdY
 WWVUJljW2AByA6CS3TBur9VnSsx2r6uOe7WKOhukcF7MMMFyQOBpi9hnb5rWSk7L0nhL4c3rYFJ
 ZR7CPV35sw/VQH/S0GQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_06,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 clxscore=1015 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2603060217
X-Rspamd-Queue-Id: E79152287D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34164-lists,linux-usb=lfdr.de];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,synopsys.com:dkim,synopsys.com:mid];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

T24gRnJpLCBNYXIgMDYsIDIwMjYsIFJhdmluZWV0IFNpbmdoIHdyb3RlOg0KPiBVbmRlcnN0b29k
LCBteSBiYWQsIHdpbGwgc2VuZCBhIFJGQyBwYXRjaCBpbiB0aGUgZnV0dXJlLg0KPiANCj4gUmVn
ZHVtcHMgKHdpdGhvdXQgdGhlIHBhdGNoKSBhcmUgYXR0YWNoZWQuDQoNClBsZWFzZSBubyB0b3At
cG9zdC4NCg0KVGhpcyBsb29rcyBsaWtlIGFuIGlzc3VlIHdpdGggdGhlIGludGVncmF0aW9uIG9m
IHRoZSBjb250cm9sbGVyIGFuZCB0aGUNCnBoeS9jb25uZWN0b3IuIFlvdXIgcGh5IHZidXMgZGV0
ZWN0aW9uIGxvZ2ljIG5lZWRzIHRvIHByb3Blcmx5IGFzc2VydA0KdGhlIHByb3BlciBzaWduYWxz
IChlLmcuIHZidXN2YWxpZC9wb3dlcnByZXNlbnQgZXRjLikgb24NCmNvbm5lY3Rpb24vZGlzY29u
bmVjdGlvbiBkZXRlY3Rpb24uDQoNCkl0J3MgYmVzdCB0byBmaXggaXQgdGhlcmUuIEZvcmNpbmcg
ZXZlcnkgVTMvTDIgdHJhbnNpdGlvbiB0byBiZSB0cmVhdGVkDQphcyBpZiBpdCdzIGEgZGlzY29u
bmVjdGlvbiBpcyBwcm9ibGVtYXRpYy4gSWYgdGhlcmUncyBhIHJlYWwgVTMvTDIgc3RhdGUNCmNo
YW5nZSBhbmQgdGhlbiB0aGUgaG9zdCByZXN1bWVzLCB0aGUgZGV2aWNlIGFuZCBob3N0IGFyZSBv
dXQgb2Ygc3luYy4NCg0KSSBkb24ndCBzZWUgYSBnb29kIHdvcmthcm91bmQgZm9yIHRoaXMuDQoN
CkJSLA0KVGhpbmg=

