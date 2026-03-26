Return-Path: <linux-usb+bounces-35523-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DAYKNPBxWlnBQUAu9opvQ
	(envelope-from <linux-usb+bounces-35523-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 00:31:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A2A33D117
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 00:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B8793038171
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 23:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2AB39B967;
	Thu, 26 Mar 2026 23:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CmrsKY66";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JTjtemQC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iNrk8Gbn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0AA38B131;
	Thu, 26 Mar 2026 23:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774567596; cv=fail; b=p2R2nmDGKGWIKbhtNyadLX3eRnFeM7oQHGgc4J4ZZRw9BxxG8VEqJtJ6B9U933sIsBrv9uqEGplu1cWLgnA7/N3ZI5qMs71Ryw+D7XcDdGGzPb5k0vStv4TJNdle1ayubfF0VTnx9MpV+DNkwLgNVd1PwVrwGVrRVrtAoCvwpWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774567596; c=relaxed/simple;
	bh=wNk4H52RrkvVo3+We6fy2ZbB+md03n15WbKZDKRO5AU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VEeXPLq9GSYwQyqsRPkjg2AbSaTCt9JNvIloG1cYUdhPah2hUsiAEy9fN9Yh55x86RLWIxful7mb/0iVtutr0MV5szpyUcS89lE2sPsRLUYeMuLfZrQomFm8O6Pr7fbo/rBysVo4RcG7FEDOFptIGsJP635Ssa0Ohx989q2UYIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=CmrsKY66; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JTjtemQC; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=iNrk8Gbn reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QIkaLg2397759;
	Thu, 26 Mar 2026 16:25:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=wNk4H52RrkvVo3+We6fy2ZbB+md03n15WbKZDKRO5AU=; b=
	CmrsKY66owhEoF+Yk5z4T+FtNupLxOnJAAmuHx1vWIs3ARkNoaHfzZB/liXC9daU
	ocZ89/HeRaf5QTdEvp3pTY8foXQ/bfMibFyi7yD0i6Mi0D69JXR/M4YWV76bCFeB
	W4LXmENxkq6+F1Ajt4DVd6uoR7ljgZbo9w8OTQo8fEANz9aXN9sgP+MDVyMzP9hF
	Kiq6N8cbQNUa9PSFwpACQToKwSHlVQy4fz/Ckz9f+LAgpRFwOYuOI6OBQ+LKUZlI
	nYCiRDvkY9SkfplfgXM3/+OI5quk161vtyjDVTadj0bANmkwzgg0PPkcGX4VFz8S
	m/w4q7LZ/BWU8Wa3Ni7a/g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4d57jc2sgb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Mar 2026 16:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1774567555; bh=wNk4H52RrkvVo3+We6fy2ZbB+md03n15WbKZDKRO5AU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=JTjtemQCCCsTOrIDfKV8/2TO1Gz+kosKu1gNmad+qVXDFSvntnhJR4rRflu08QWyn
	 l/ebX4mOSUUtj2LwXxscUdNrmdrVDdFdDKByGghO0JOMNmb4h1OOVesBhHQKbSHR3g
	 QPnRm9RlxLnla3QZsNURj/Rh4AcXOGlDGhy4Lo/xXPorzt0vn7nA+ioUoDARJwZCZT
	 UJWzItymV0zXmA2H7fY9bd6Ptc2QH2q4lFZJvL/xvdAqm1xZvHnc4PSz8trQGfmKR0
	 DbYS00t/9aDV3rD21hUrdy/Wu/jobFKB5c36irrtF9M+qylKBe6rbObT60O57vUT+w
	 CKLnX/K85DNfQ==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 787F040363;
	Thu, 26 Mar 2026 23:25:53 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 87572A00CB;
	Thu, 26 Mar 2026 23:25:53 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=iNrk8Gbn;
	dkim-atps=neutral
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00406.outbound.protection.outlook.com [40.93.13.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 57F164048B;
	Thu, 26 Mar 2026 23:25:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9fmofQZtlixCQizv/kQ6zf6SC8EsxEbyCD98Uw1YnEEf5soQSaTk1z02q6tkUS14TCOb/9/IVnalPuqLQswglSCeqK9jJaMcvVAJ4zQi0WczLiBofmZ0qrHayBEKbEXjem+5zgb+hox3kMoc6qrJdCJs7rnMYTbXm/+/tfpeZAxgMF+A2k85DOlvWZfrad0Rq1wec8oqtoSvEICitjo7+cNHsYaqSILe38VdrJ/nlw/VYqq64h8mM9Gvdb1DEr6eSLehqDGIK2xcz44vM0W+WHM4SRNs5QZLpllT9fSYj7vfVhB5W6WkR+auiss0TH8GCn9KduVZLgxhqXpGXADVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNk4H52RrkvVo3+We6fy2ZbB+md03n15WbKZDKRO5AU=;
 b=lIKL2M0mnam3F7twK9aO3qENppPyVTpqR3ZwB+/k/Xs+N7e84Kn33NNYul3B36PbOcex92m9uTs7wRr2l/vCPbMjTWu1GT1spgGPykaRUIcbPrJFW4sPAPjul9hGY7ff8Ny+DqoOXIsnNy2bwHCv78khDEwLKFM9A/jTB6f8lImjAxzQzv0vJcU0MMq+/78v68b6HP0FwuObuUiNc+7O1CKc6xATw2yoe/bOLyezrFbMyfHVpj9Z6jYBz2vC0LnoNP2z42+reNwCbKEKGp97e6thADs9F8+p+bhNgCjC72oQh34QthkiIWvJg2JawzZLj8qwBr18nxs2He6eu7pMUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNk4H52RrkvVo3+We6fy2ZbB+md03n15WbKZDKRO5AU=;
 b=iNrk8GbniH+eAZdU3RQ1QMCLa4untk6Bdq1L8Swg1iu3FaDJAd1G/lRMJdPGwST+stlG5yA6GkKWRGHxvoE6NBds9k+B3h+WDnn1hj9RMry7BO4s+oULwR0iYH5uns2IIqtujE1jT4MKWrbHljGh2fVEx+9kLms1OmrTocheubk=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH0PR12MB8098.namprd12.prod.outlook.com (2603:10b6:510:29a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Thu, 26 Mar
 2026 23:25:45 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9769.006; Thu, 26 Mar 2026
 23:25:45 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Yixun Lan <dlan@kernel.org>,
        Ze Huang <huang.ze@linux.dev>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v3 1/1] usb: dwc3: Add optional VBUS regulator support to
 SpacemiT K1
Thread-Topic: [PATCH v3 1/1] usb: dwc3: Add optional VBUS regulator support to
 SpacemiT K1
Thread-Index: AQHcvQdkPF7RxbZjd0aKNSkg9efvmLXBdZuA
Date: Thu, 26 Mar 2026 23:25:45 +0000
Message-ID: <20260326232529.db534ijtn2oa2i76@synopsys.com>
References: <20260326100010.3588454-1-amadeus@jmu.edu.cn>
 <20260326100010.3588454-2-amadeus@jmu.edu.cn>
In-Reply-To: <20260326100010.3588454-2-amadeus@jmu.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH0PR12MB8098:EE_
x-ms-office365-filtering-correlation-id: 100ff0ab-1000-4d05-aa2b-08de8b8f0144
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 vBboYG+A4S2bnPtHtQMXMEFJB+DS0s0ggXeG71OF/jNodAw5sEqK3yqGwjcbZziiLonF30FZwXxJUrjq2zP5EhDD6tL7Mz4HTn5NG0Wo1tHEF9Jfh/rXyjjt7Zmy3xvEzvWR3EVxctNkvaTL1DJaiEgnVzst3ANbRC4BnSt6z2meIOdQAPl2rllGXG5bU7sMo+2p5GviOFIV6blxbcgqxSdY80lLVU30lCo5PK2z/Q/kTz/NguOJ3My3j7j+20qPDo0PyCbtFanUV7JxfYXKe9XykAckllQQpECafNa9PJg1FRGY4DLMuGDSo9up7GQnXpGkfvQJt1Anod1NE9CBXDn7f+wxNYRfsK5CO7tbLPgVg45eif5CTov0EfigsNgnzcNqJzqf1O0s7c9KW7IKAQ8b3Nv14QRXrq3OevoZ1KMN23sgmCQ7b2450bldOEDA0kWFNrBoCEaaBtP+YHKT4yp4jyx7Cx2121j29rmHgqgd50ThDRLpeIMwk6jF4BJmiapnUQTcS7PiKg+9/ovTpEarYwaaJTqaOeS6leUv+d+aEQXp7ufO9aGC2yasP3YbwC2+MGhSaGECwXNXfBOiyeQrZLt/Oc7dgzweEnFMwewc90uUVwv+qB4ziAJwu/eUpwoVPAc3qxkeSrdw9R54Gj2ZHbw777Q7r7GiowHwAf24C6QGp5aYyqs+brCkwpDRJUAnr/j0Mj4lxqn+rOnsQml7gz/bK9p+u55RqwNAwFlKPfy1P/XdgeLLNugT5Lngkyuw147uo8eNxG0E8OeU/MSyxFb5dLZLj8GkbcPAF4M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RjBzMkpLaG5GSzQ4aHBzSXZzczkrVWJJQzg4a3EyUnh3OFhvTHg5RmR1RmVo?=
 =?utf-8?B?Y0FDc05FWkkrQ2k2eHFqZzFpL085NUNqUGZidVRxZHVwbjIvYWJ2REpSWFcr?=
 =?utf-8?B?a3U5aHVuakxHbWxKcmd4dzF6MDJJWVBMS1ZNVVI1cHFpOCsxck5ta1ZZU0F1?=
 =?utf-8?B?a2lMK3VacVFuamt4bFBXNjhxeEpJMDYvemMzbUtsS2c3TE4rR1ViUWhkQzE1?=
 =?utf-8?B?Nk1ZOVpYSUZ1MmFnOU9UOUdoT2VJZnRJdU1aM0pXSVFoRUZmWkNHUzRhVTBX?=
 =?utf-8?B?UzcvWGd0cGNHRk5MOG9yZTBTYXZUU1M2RjJpV21mQS9yRFhza3NHWm0zSEJV?=
 =?utf-8?B?TEZvaVNzS0FRcmhUckFvR1N5SWpYN3dsc09CL0VDbmFOV1l3SkU3bG95S0Fq?=
 =?utf-8?B?Q1g1aFdGMGUzU1czYW4zclUwek1PUlc0cFg3V3h2VlM5Mkk5cG1wN1R4ZGs2?=
 =?utf-8?B?ZWt3SGZhNUxQemRxUEl3U2hiY2FGRnRQUzNQeGx0dzBwdk1vMUwxeUFnUlFn?=
 =?utf-8?B?YWVIVHpzN1liSFJrOFFxZlFNalJrVG5ta0dhYW44azc2RjU0NTBxR2cvUWVD?=
 =?utf-8?B?L1pwSS9kNTF3WVZZNGxHZGRVcDNCOUNSekt3eDRWY21JOFFWc3kxT2VqOWpT?=
 =?utf-8?B?NS94Sm1BNUI1U3ZqOTNxSkMrdGp3Z2FKSlFVbXJSQ2hONGF2dDRkSUVING1p?=
 =?utf-8?B?Vm9VTGRqNzU4d3Z4OUNVRVljcEtGVkdjdDA1cmZJVHZwenhkUHNjcTQySzA1?=
 =?utf-8?B?eWxiNkRxU3p2V1g4UnQzd2xSR3cxQ3ZEbkpTYWJadDBDSGJ4bS90Uzlsc2t6?=
 =?utf-8?B?SllHc2puVnN5Q3BFajZpSkRvUXdNL1pOMW8wWitGTmhLc3h0djVXK3U3NlJH?=
 =?utf-8?B?VnIrdzhkeVU3eVdpK0gzODQrUnRUYkd0YVovbXlnTDhZQTBjcDRkVnBmV1Vr?=
 =?utf-8?B?dDBtbjBibU1XRTc4KzF3aTh4eWVOODArNHBkRWsybFlqT1BxajFIVXhXZkx2?=
 =?utf-8?B?bFFmVVNqNmFHOVlkOXd6SlR2VzZDbzlEZDc5SHVldGtqTmNvWkVNWU1paTgx?=
 =?utf-8?B?eWJCQ0tVbElKQkd3dkZwVjlNWFFzcWZNLzZFM2FpMWNKVDQ4TVVxTjZzWUZL?=
 =?utf-8?B?amREWmVWY29NLysvMkp2eVJoYWE1SXpjamRBaHMxV2dRZExWc29UMUZaNC9B?=
 =?utf-8?B?UXd1VFZKRUw1T1daRWRpTnRjRmEvSnA2a2diMW9NOURtNU0raXpVcStEekJX?=
 =?utf-8?B?Q2RrV1BUd2N3MGdsam80UC9qdFFXT053UEd6bTRxNUdTc2duL25EbjU3T2g5?=
 =?utf-8?B?WWdZSGdQSVVxT3RPSGcvQVFscWUweThzU0NJUXZLS3ZWUlBjQkxzQ3Bwc01W?=
 =?utf-8?B?SWN6R252RkJ5ODhsZzdGVDFlbDJ6ZExQSmpsM1BJNHB6WVlLdVRZVDNkY21Y?=
 =?utf-8?B?VDJrRmM4eEJJVWxFRUJ1VUxoeEl1REt3QjY3RVAyOG91SWMwYmpZNyt1K1o0?=
 =?utf-8?B?K2FuM2t6a1VuNWpqTzVzaGsrc1BLKzR0eld5blgxcEk3MXpvbWlweWcyWE1Y?=
 =?utf-8?B?NXNJd29pZ3A3N2daY2tjSE5UOERjNnlyblVpZkczbmlZd01VdHhMeUpFekpJ?=
 =?utf-8?B?N2xySDhGbGVFU1lIMzdKVFVmSXU4bWlTTUJRcjhVT09OMjljeHdZTHQvVlF0?=
 =?utf-8?B?ZjRzcDdqcGxWc0lza05UaFpuMnBZcjJlRElHQzJjNllMT2JHY1g1SDZNbTBS?=
 =?utf-8?B?amREWWVXdktuaExjMWF0MVY3a0ptdzFBcG9YUEphRHZ3VDhqaW5rVURKQ2M3?=
 =?utf-8?B?Q0l2bzNHZWNoTWRGSWdxbzJUaDBHbEkxU3czZWFqTHFKakNsOUdSMFVTTjRP?=
 =?utf-8?B?NHR2bk82VFpDdCs1OEFadzJRekZKRDRkT0ExcndlZ1VoN3pZWitVeXV3cWp6?=
 =?utf-8?B?cDc4SUtucXIwcWE0dVJlZXJsT2wwNnZzQmVnWFVNYk5KUUpUTndDMlF0Rm1H?=
 =?utf-8?B?SEhHZjhNZ3c5eXAxRDRkVkxuWWRPU3BncXhWY0F6WG1ZcmUxbUY0MnVGanVL?=
 =?utf-8?B?OUMrTk5DbUJ6djhqVGdoYmNwZTQwYnlEbS92STd4YjJ2aTk3czUwblVSZ0Qz?=
 =?utf-8?B?bW5JaXdnN2VWbzNnd3Q4WjRpa285b2tROUFqY21qTmx2ajRIRHRKU1JjWWZy?=
 =?utf-8?B?OTJ1bEV2MXE3M0NKcGVvaUU3OHVYR1hTVGZ2K0E1eDVML3IwVDRXZFEvLzJD?=
 =?utf-8?B?bnY3YnZuR2ExcHYxd2lPVGZ0eHZ3ejVvV0wreEc3Y1MxbVZOUzRkcE0zV0Iz?=
 =?utf-8?B?WEhKcWFFbWFZYVFwcVpYTkN3SHFIb0t5NWlaZWQ4dWsrZCtEemJzZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90AF7A118F489C479A3530022E5C7D8F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	aVFWmp8Nm1Q8khKDZrcdDQS3iAVplMfhxf9ezMKARkFomnh/EMMXC3PTexEIOmAMraF8Emf1e9Etfd/8MGr1LC9vL5mV7R+8wIKYT8zFce7+8E+6xT5xeDjP0DqC1gtYEonWzv5ipmnzwdR2LAYrz64obOThY0TgM6yceD3ISxfgZsh+koy66PJpiqJAWGgSTPnvYnEf+55sN+iPB2Y3Cv/w0H+uuenB6mnOo8pGigwAebtH7oC+1ugsRstKCunE2ltNOzzIEYbDOBWTbg0QG42ukLjToZ5ertGsxEZ4Kb9YF3DBJaxDLBlRgOXMtlwEAIrp178fbjzVG1GGpQbmMw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	A8uOE6Ao9Mt0jDV7GGNXZ8KkSXXJFqRNbnlM6b8KN3ynoH7ocLR3IP2UnUFh4bKmP8bSbtxFCXZ2T3CtiusokC1ZQQFPLr+jzMwiy6oldthDv9hbfWTLhom52tgZmXwtjLRk9kfhxbk1TfiUCdhCOX7Fq3An0sX2aL31QFp1sq9jusz/GD/u1oDnFXVMc47eK9tV2+VkQ9qShBwXfhjinOtCqJKviW9wSD5OHw5/GUjCnlZyU5ggrZ6knL6uBjn+dOVbdhD4NZ2amM3e9tX59dVganXMr5q5mYxNm6q+uHYolkqPs2sHMEmHo+32r1TgRX2zVA+6Mv4XfQ3nJxgHU+cPreYoBT79bNTkq8hW0LjaMwe5P0XhEMLJv2LpM6xk5rjtTragpSB+BTd3KbbuVnYvK50CnzSfQUXa0FNoQJC6FuKjnF3bkt/+wCf0EKIK0kY/0dmMBEVw3PU6FX2euGwIKg1ka1y6T8CwAHh3DuCenB9CRwpfsn3jBn3lUo5kAVJix8TZFFuVURyijzGxHfQPlOtsgjO80XxvHu7vpfHl4lULitFpSbm8hD4qoiVxD7fyDHdM7p3NoCUE+0HCT+ONLS6wN9FijseT/KMAx6MbKQS/mnp3D7q+o0lAPQEDRCz5cnzGN1PGH9Y5xwR2DQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 100ff0ab-1000-4d05-aa2b-08de8b8f0144
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 23:25:45.0585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qPUxLJk5YYYLy6/ZhwlvoHUAwjB7b8MhcQT++xRJt3z00+Pc/it6p5wCKZgCl0xF3A9PUt5fPZi95bVRa0yiig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8098
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDE2NiBTYWx0ZWRfXzQqeOdLRXlUi
 Ua5LKElX9s54EA1wfXUnsQRBnFkVZEGWAJ1L/BwAuMgbOXcxf2vvWaIRsrcSJSR317tQBYhWevr
 khwS2AB+Afice6q2s9Nq12sjV1pEa1CRCnG9gKSKqlMPtG21+MbNPBFmUZFuQ7kW1lK1eaLxcBp
 OW03M8tsSFGysx1WtCCoshCVEzV2z743UmZGxkt+BhSMOGrQn/CFF197CLH7AdhQ8g0XVt1XnDh
 ptFYGGR5t9RrZ5pN22tqvGPl1TTZI21xcyh+sStC6djvsF0T+5YuIBesgTSgPRkozmgS6RI+sk2
 n3SRJQy8Y3lDfXT90yFhJjlPAEJ5Z7LHiEQ78Sq0uhqdPqk6TcZAs96kgw1wOx6s8UhiXc51Qp5
 AIlUaZViKiH/VWfVTvQ8P7vJJjORR9PDrqIMwr0uaLdHzH2Q+7XuGcugoeO1jCStHzxmbZp4fDB
 JhPY8wwzLmSIPVG117A==
X-Proofpoint-ORIG-GUID: YDeI1cwFOwqfG-rnc2msl617QblDFAFG
X-Authority-Analysis: v=2.4 cv=bJ8b4f+Z c=1 sm=1 tr=0 ts=69c5c084 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=jIQo8A4GAAAA:8 a=RC_nnOGSDeUlnqkDifEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: YDeI1cwFOwqfG-rnc2msl617QblDFAFG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 bulkscore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603260166
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
	TAGGED_FROM(0.00)[bounces-35523-lists,linux-usb=lfdr.de];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,synopsys.com:dkim,synopsys.com:email,synopsys.com:mid];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E1A2A33D117
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBNYXIgMjYsIDIwMjYsIENodWt1biBQYW4gd3JvdGU6DQo+IFNvbWUgU3BhY2VtaVQg
SzEgYm9hcmRzIChsaWtlIE9yYW5nZVBpIFIyUykgcHJvdmlkZSBVU0IgVkJVUw0KPiB0aHJvdWdo
IGEgY29udHJvbGxhYmxlIHJlZ3VsYXRvci4gQWRkIHN1cHBvcnQgZm9yIHRoZSBvcHRpb25hbA0K
PiB2YnVzLXN1cHBseSBwcm9wZXJ0eSBzbyB0aGUgcmVndWxhdG9yIGNhbiBiZSBwcm9wZXJseSBt
YW5hZ2VkDQo+IGluIGhvc3QgbW9kZSBpbnN0ZWFkIG9mIGxlZnQgYWx3YXlzLW9uLiBOb3RlIHRo
YXQgdGhpcyBkb2Vzbid0DQo+IGFwcGx5IHRvIFVTQiBIdWIgZG93bnN0cmVhbSBwb3J0cyB3aXRo
IGRpZmZlcmVudCBWQlVTIHN1cHBsaWVzLg0KPiANCj4gVGhlIGVuYWJsZWQgYW5kIGRpc2FibGVk
IGFjdGlvbnMgb2YgdGhlIHJlZ3VsYXRvciBhcmUgaGFuZGxlZA0KPiBhdXRvbWF0aWNhbGx5IGJ5
IGRldm1fcmVndWxhdG9yX2dldF9lbmFibGVfb3B0aW9uYWwoKS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IENodWt1biBQYW4gPGFtYWRldXNAam11LmVkdS5jbj4NCj4gLS0tDQo+ICBkcml2ZXJzL3Vz
Yi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMgYi9kcml2
ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMNCj4gaW5kZXggZTg0Njg0NGUwMDIzLi42
NGY1ZTlmMjA2NjMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmlj
LXBsYXQuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMNCj4g
QEAgLTEyLDYgKzEyLDggQEANCj4gICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPg0KPiAgI2luY2x1
ZGUgPGxpbnV4L3JlZ21hcC5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L21mZC9zeXNjb24uaD4NCj4g
KyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4NCj4gKyNpbmNsdWRlIDxsaW51
eC91c2Ivb3RnLmg+DQo+ICAjaW5jbHVkZSAiZ2x1ZS5oIg0KPiAgDQo+ICAjZGVmaW5lIEVJQzc3
MDBfSFNQX0JVU19GSUxURVJfRU4JQklUKDApDQo+IEBAIC02OSw2ICs3MSwyMCBAQCBzdGF0aWMg
aW50IGR3YzNfZWljNzcwMF9pbml0KHN0cnVjdCBkd2MzX2dlbmVyaWMgKmR3YzNnKQ0KPiAgCXJl
dHVybiAwOw0KPiAgfQ0KPiAgDQo+ICtzdGF0aWMgaW50IGR3YzNfc3BhY2VtaXRfazFfaW5pdChz
dHJ1Y3QgZHdjM19nZW5lcmljICpkd2MzZykNCj4gK3sNCj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYg
PSBkd2MzZy0+ZGV2Ow0KPiArDQo+ICsJaWYgKHVzYl9nZXRfZHJfbW9kZShkZXYpID09IFVTQl9E
Ul9NT0RFX0hPU1QpIHsNCj4gKwkJaW50IHJldCA9IGRldm1fcmVndWxhdG9yX2dldF9lbmFibGVf
b3B0aW9uYWwoZGV2LCAidmJ1cyIpOw0KPiArDQo+ICsJCWlmIChyZXQgJiYgcmV0ICE9IC1FTk9E
RVYpDQo+ICsJCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgImZhaWxlZCB0byBlbmFi
bGUgVkJVU1xuIik7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gIHN0
YXRpYyBpbnQgZHdjM19nZW5lcmljX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQo+ICB7DQo+ICAJY29uc3Qgc3RydWN0IGR3YzNfZ2VuZXJpY19jb25maWcgKnBsYXRfY29uZmln
Ow0KPiBAQCAtMjAxLDYgKzIxNywxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMg
ZHdjM19nZW5lcmljX2Rldl9wbV9vcHMgPSB7DQo+ICAJCSAgICAgICBkd2MzX2dlbmVyaWNfcnVu
dGltZV9pZGxlKQ0KPiAgfTsNCj4gIA0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkd2MzX2dlbmVy
aWNfY29uZmlnIHNwYWNlbWl0X2sxX2R3YzMgPSB7DQo+ICsJLmluaXQgPSBkd2MzX3NwYWNlbWl0
X2sxX2luaXQsDQo+ICsJLnByb3BlcnRpZXMgPSBEV0MzX0RFRkFVTFRfUFJPUEVSVElFUywNCj4g
K307DQo+ICsNCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHdjM19nZW5lcmljX2NvbmZpZyBmc2xf
bHMxMDI4X2R3YzMgPSB7DQo+ICAJLnByb3BlcnRpZXMuZ3NidXNjZmcwX3JlcWluZm8gPSAweDIy
MjIsDQo+ICB9Ow0KPiBAQCAtMjExLDcgKzIzMiw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHdj
M19nZW5lcmljX2NvbmZpZyBlaWM3NzAwX2R3YzMgPSAgew0KPiAgfTsNCj4gIA0KPiAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdjM19nZW5lcmljX29mX21hdGNoW10gPSB7DQo+
IC0JeyAuY29tcGF0aWJsZSA9ICJzcGFjZW1pdCxrMS1kd2MzIiwgfSwNCj4gKwl7IC5jb21wYXRp
YmxlID0gInNwYWNlbWl0LGsxLWR3YzMiLCAmc3BhY2VtaXRfazFfZHdjM30sDQo+ICAJeyAuY29t
cGF0aWJsZSA9ICJmc2wsbHMxMDI4YS1kd2MzIiwgJmZzbF9sczEwMjhfZHdjM30sDQo+ICAJeyAu
Y29tcGF0aWJsZSA9ICJlc3dpbixlaWM3NzAwLWR3YzMiLCAmZWljNzcwMF9kd2MzfSwNCj4gIAl7
IC8qIHNlbnRpbmVsICovIH0NCj4gLS0gDQo+IDIuMzQuMQ0KPiANCg0KQWNrZWQtYnk6IFRoaW5o
IE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KQlIsDQpUaGluaA==

