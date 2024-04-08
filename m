Return-Path: <linux-usb+bounces-9024-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1F289B81F
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 09:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D462B234DB
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 07:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E813A22089;
	Mon,  8 Apr 2024 07:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="t8ND8yTd";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ob/bVYIc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bAReix3J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80E02030B
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 07:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712559911; cv=fail; b=fqvr6NiXzT7EBUfSbVOxdc9fg+brZBR9WNsfOzfbnQ9wLa1vklql46owU7Jy6jhbm3JxNCFvEMPlrGzlWr7I37HWY92xXchmevBDj4/oGrijgfJJr/Lno07h7ZB9g0sLI5kvWLBRIpmi6CQPfpPvhMocGSJ/2+BgmyfghdJnTRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712559911; c=relaxed/simple;
	bh=YLJxrfoLnROd3Sb49tUXR6RFv7vTv4phZ/avnG0ywZQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gulquxC6JL0EO50GvBsn9pYc6M2FQ13GztVLjuGVj7K8y34EqgMelqf3g2QHJolS0vl7nYHXhxfXXnWF7RuxaEKu2H1HvwD5zfv/KEwF2Hh5esCmWsEMIz5GTCBZ+aSl3IlBoeSKYheI/y/oGenEYD2v8G+f+CIicYVuPtgN0lM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=t8ND8yTd; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ob/bVYIc; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=bAReix3J reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 438563V3004895;
	Sun, 7 Apr 2024 23:04:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=YLJxrfoLnROd3Sb49tUXR6RFv7vTv4phZ/avnG0ywZQ=; b=
	t8ND8yTdqV28xNBjuaLtR+XzN6b37vlOS6qV2Y1kF5tP60+zWBKlbMUMN1BJjL4D
	crVjtibe1ZQvUP2HAeJWfxAapZDXrhdKMWDaLG1OwVxsDzIM31XlqoRa3vE/MyjG
	b1swsBJwp9M5zUmfr45n08E0EZoAm1ULLtQkcP4baWGjo9nfD1Vvq7PpWTM9zZO1
	Vc8DxpDESFeE9bG6gCbMLD6wXjQ1F+unPFKhVBQIQkTF1GfsD7lSkSqynMQ6yUS2
	nd03thaQCnETCryyLczEsYQogjRtpjT8TYJKcD8CMrX+RWGmiSZ43XQFtJQKka1+
	i9Wsk6eN5PS/Xpaxdko9HA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3xb5n3kqjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Apr 2024 23:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1712556287; bh=YLJxrfoLnROd3Sb49tUXR6RFv7vTv4phZ/avnG0ywZQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Ob/bVYIcbpWu9ENU2Q8baDquXJBTl1ZSMdvAcA827XIxIrclA3NS6LDfrYC9OAhz2
	 AfrGH0XQboktyBPelu8IVwbZIV79m1ME3K7Q4y3wH/f2dg3z7TjaI0W7mZwe5tqciY
	 m1sSZETm5QlB9OUxD+Di0+qhrQeFjml4DFxR4sqlZOatbB1SAbb/ML3pS3WjZCWfug
	 aysCJYNf51ymf3CndxFdW91bqNf++7U6E0nxfssxouMb/tEYT387c39Q9tRQgABBsb
	 ACJt0jFZA0tW1GSF3HdJpQlyQuhO78dXhiorm18rNRNMUKOwm8gpowHQsuLJyL3VJ9
	 IvonUaMVu0rrQ==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7746D40408;
	Mon,  8 Apr 2024 06:04:47 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 263CBA00A7;
	Mon,  8 Apr 2024 06:04:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=bAReix3J;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 99080401CA;
	Mon,  8 Apr 2024 06:04:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nL03eLNdVgJERexFSUy4xFc6bVSoTgRn2ZvgfBKnAG3ZrGVehaCTuMvWw5rsHbyNawAsBvgP2oERHuYaRVQB37a9ysYR1jd8rEiDCG6imhwWL8AjsYQ+Y7jTpWJgkx3P4+qvc3/lRzYEqXWV6nzzlQvxpGGOTqbCoS5nsT6wroWu5HkFkJKGIBEpzFyL48xpzvKCSxrjqae20vviR7ElpC1XaemOZk6TSPwmuUGIy2IHvf135KBjdlJUgy+abCdcYEnFkEzwsevakCqifCKZOI/mjky7/w6j63zGe4ne9PNIKGh7pfY/xohQl90z1xpGQzY1sAtAeqW0ZH51EV1cgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLJxrfoLnROd3Sb49tUXR6RFv7vTv4phZ/avnG0ywZQ=;
 b=Ss0MKFDUNFnjgU1oHoextkI3OfXN5Kqb25YI9K8BJjOc1Dhj6XPjjpu6KUpw15bHJoIahVp5T31JRI6g6CuhzYgncoVy961BCLsZdoVcLtf42HtyS5gxhnAbzY6aXdmUFoswLHa5M72HF+mJmLjbq3FjzxO+8FOlIw8WX1SD/Dt2r2E2bBbrwOv4gmWm4/c7ZktAquMhbi212HIDoGLPgV+so4YkYqUc/WU3Binxeg8Eier6u1EI1sw3OJGVxXmyiAAzfqh9tlv0AQhHH5cdxY9cjgM2pCgPZR9Jf024uPcOojJ5CcDX6B8BS7CjIHr20tON3STFN913sctsX3+LRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLJxrfoLnROd3Sb49tUXR6RFv7vTv4phZ/avnG0ywZQ=;
 b=bAReix3Jry6RqA8KD71tMw9aXz+XZ9kQs9qgF4G9yGj16dZiiklEg5N+ZREBGHT4tJmsXr+sBbSFRt6HzHAePLjaOKeYXL16/QHPLzPhy0e/GWVED6Dsa1mlyVisgmdLjluGzI8w4q35HKFSmKteqXFFOPSOPzLp3I35QDqrdis=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by PH8PR12MB6674.namprd12.prod.outlook.com (2603:10b6:510:1c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 8 Apr
 2024 06:04:43 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b%6]) with mapi id 15.20.7409.042; Mon, 8 Apr 2024
 06:04:42 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [bug report] usb: dwc2: host: Fix ISOC flow in DDMA mode
Thread-Topic: [bug report] usb: dwc2: host: Fix ISOC flow in DDMA mode
Thread-Index: AQHah0FyDgTeY947L0mOwHA544/3Z7Fd5seA
Date: Mon, 8 Apr 2024 06:04:42 +0000
Message-ID: <3a1e01ca-a491-2739-e47c-6a71b610f400@synopsys.com>
References: <ab2cc5d9-3fc9-43a2-abe8-a20338bdcd02@moroto.mountain>
In-Reply-To: <ab2cc5d9-3fc9-43a2-abe8-a20338bdcd02@moroto.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|PH8PR12MB6674:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZoFKTgHjFw5CCL/fJWKYHQr7wFkAfpwC3tqdFMTyf6xE6JoNTVNo92HV465sktuA0ZS7Cwz7Cpyt6aMuY7604OV/EhqcMsi61rH0HbJz5Wyti3b54n9HK0NW4EZYG6dRJkiccwqdvmcjDKe7fHZxCAyg6SayJqb0QD5bJBxLwPwrMV/A93mKQPmclOu1Nevm9vj1q8c/Wk3YnTE6aQNmKvxvpq4i86wDT5TNZdrDFnookPgElz2pgeyyHJY1/hVjGtCY6bZOrbE6xBJQz41kRcXmohscMdKjtSkZwfwa52DKHMvt6/ZTBk8TzYExaUfEMEKFF9UkVoA7fQEMzOppfAQqewGuHYdVl0uPHjc6OZh8PHvhawBAHAXZDp2myFHQi+6vsQLA41FGkQMjHM2iKdbylDaZTaxMnw3kEp4r5nIE4znO/MlgQFXS9gYNqhz0r2KGEkiJZxKOQV9Rkm/erckS4ohiSyDaNQzLOZMErDcr0LwxkLl4J6RTfigKMf3i0L2u8hmt9PPpyRL0KPrCqj1/menxwtCyYgvCgg8LhbxnSVFAToszqZuT8r30bjF5v6vl0VY/JVeFbbyJ/NNfbL6ARRcbS6V3CedvGTSlPstdAOLiIp1BdBmaltI9FjLZHnMHi74cbjQi6/+7JWD8L3SafVsdQRw6TCw+Il5nUmA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bUkrVm5GbmhOOE1WTXNlRmpZTGhWSi96ZzZQMFJ6K3RTd0M3SUFraXRaam1w?=
 =?utf-8?B?eHgyWUtpQU5lWll6cEJuU3Mzbmo3S1JQd1lRYUk4MjdwK3pZSVF6dEUxWmhE?=
 =?utf-8?B?NjlWSkFqK3pYdkd5bDVlSEp5VUxYcEtrY2VXTjJsUVBwei9BUkdyNjF3M2Z0?=
 =?utf-8?B?WDU1NTV4bzg4QktObTQ3QUd4Vi9CMmVDYk1wNWVVZnRaTjdWNkpITi9sV201?=
 =?utf-8?B?L2s2OVJtalJOemdOVnFLVDV0NFpNeEN6bUFlOGhjUktET3dMcXgrV25IUS8r?=
 =?utf-8?B?cDNwNlF6RW1scXM5WTdaU29tT0RXRVVtY0hVMVZhQnJjNmJma1NhbURIMnkv?=
 =?utf-8?B?bU1oeDhaSTV1aEJCSEsyVnc3Z3RjeHVaVEo2dVh1ZUpWOWFzOFNlLzhLMjRQ?=
 =?utf-8?B?K2VDdnhCSE1aT3RDTnpCVTdlY25DZWtVOXY3K1JxTWp5OXIxdDVYOWhuR2Y0?=
 =?utf-8?B?TS8xTmVRa1pTTEZhMUVQc1huOWppRGRWNkp4VzJiYzl6MTVyUkdnTG9Wd2RQ?=
 =?utf-8?B?enFVRHc1R3d5RTh5UzVVUnR4d2orTGxpcThlQjIzM3RCYUg3UFIreUQwZzZk?=
 =?utf-8?B?RGRqM1JOSWFYb053QkFBSUNQZnJmc3N1b2FwSWtJSTRVQU04bnEvSGE2QzB2?=
 =?utf-8?B?RlV6eWJEelFQQkY3cC9OZ3NJN05YOUtwRVIxeE92enFyYjdvTzNqcjNOY1Nr?=
 =?utf-8?B?bWphUXRxNjlBcUNjdi9ncTQvTWx5M0o5VzRSMW1xZzAwTEhqTXlBWGFmY2VL?=
 =?utf-8?B?UEFQYVl6M3l5Q2R5UVBMSDBGNWs1ZGIyZUFMRXNaQ0JRRWR1VmtGYVdJeDla?=
 =?utf-8?B?cmlkSDRSWENpdnpoamtlUWJVK29CNVFMY2ppWkNOMVQveitvMXVsUWxCVW5Y?=
 =?utf-8?B?ZnVwME9ZeitZaUZpM0pLVGdFd2MyTytWbUFGVjhON25obytPWVgycTVRMmJZ?=
 =?utf-8?B?MzVTdkJpWkRDeFRBOWxIRGNTUjNhbzZISlI2VGltZ29WSFNxc0kvNFhJbWhn?=
 =?utf-8?B?WVB5QmVNeUlEN05jd09FVXNYZlEzSGpHb2NKOUxsTnRZKzJ4ejNqM1dVRnFU?=
 =?utf-8?B?Z1hTcXVnaHpiTURUWkJOTjI0U3VqdWhSTUpUUCtmTkpVQy8vTzVkUlkyRXc0?=
 =?utf-8?B?STJja2RUdmIvY3VvQ1FuY1g0UjBjY1VTemswLzNlZzlrcUI4dmZ3aFd3TDFJ?=
 =?utf-8?B?R3M2V0R2Q0U1dmNSMmo1TnNOREdMSC90cXRIdXFBY1RLU052UHVMSEdUQUtP?=
 =?utf-8?B?TkY1ZXBvdyt0WWpabG5zNXhOTGNIT1dZa3hvZjBUdmVJZGFVYnJ1NmhNc09M?=
 =?utf-8?B?dmc3Rm5vWGJ3SGFLSUdCdXBrYXdwQW5Rdy83TGt6RkNEZ3hOZktqcG9xZWZT?=
 =?utf-8?B?d2JxZ2lySFZDZzJiRzRFTlN3cTJkZnRHRTFNbWsvNjJMTUtHOEJzRXBkdXlL?=
 =?utf-8?B?c21OeTlBbUtGYkp4UmVtQVlVY2pKZWZPY1Q1eXZqcW5Bb2tzT3hTdjltOFhE?=
 =?utf-8?B?ZEF1UW5qRzRjaGZHUjZsOXJ2bTl6b29XOEYxRWZNN3hNOUpsRGJRSzZ0b1hZ?=
 =?utf-8?B?NllpSXhldG1qYnBaV2xSKzNIVkxKWXNzTHVyeTZxSUFVQWdwcDhKbDJ4Y2lZ?=
 =?utf-8?B?UWt2M0x3NExsVmw2cHE2NlRJd2Rwc3p2ZjlHcmZlcTdMRjN2NmN1dlAyZncv?=
 =?utf-8?B?UlR1YjI5NEF4TzFyVS82S2tjczJZT2pmWDVxMzhqOVVZcFdKSHpJTVZxd3ph?=
 =?utf-8?B?bUE1aGhxc2dZOWk4ZlR5TFhQemhHMC9BNERYUUVic2pNTEhUR05QdStZelJK?=
 =?utf-8?B?a2pDa2dxcnFTY3VaSVlxZWtqQVB4VzgwaUhQUWV2WVk4Sm80ckRFcHhyR0RG?=
 =?utf-8?B?K3dQUHZ6ajRqRjBrSW8ySjVFR3k0MlMrbUhTTWhZNTVObW43MG1aZVRtMHYw?=
 =?utf-8?B?YkZKdVo1dHdaV2JKc1RpQkJLRzZFZ01XQVRQNHdaZ1U1VW9neFJmSThDZ1Fo?=
 =?utf-8?B?R245RkJQNWxBWVp5LzdFVHFicER0RFpiYThYVFpJNUZXZ2pUMEF4cFNMZGRJ?=
 =?utf-8?B?cXN4QzFQYjN3REVMeXN0K2l3MXo3bVZFcFhMcVpwQSs1Rm1vamF0ZGhGS05q?=
 =?utf-8?Q?yAxQGUIL6frdOGn8CfIgDQAz6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D755594FCDA4C4E980662FBCD2A550C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	y+tQcSFNHrtTvS9NlvZsK/+fku/aRimDu0cB7zuHqAzIeyRRBELBL/UWPrsx5T/0fb/i1rNcpNH89130A8IJrep/vwHfXf0SXZDOsM8d4lbfbncRhD+PcioNXvnOuu37cLZMYQIwp+TIaNf6OrgIegZrbipWc4WYk3q34V4KZcMoId1N+3Qkz0mT+UZ2IKkmRXUqYU+yDgjBvOvQdrg3y+XHaOvsYNB6pIaLFN0/UAnl3T9htXAnnt+ruPKFvJex4WodhvjuWK94qF1a0EjiRJhAlX378uMoURvIyaGgkSMc1wRHgbj8BA67MkzkLQVCPLqhYNPx30IhiGli7hJ4Kezkm9mfUOn8UlaTZaptSE0VP+RZhIjvfe/sdpxFAn3rW6Ne5VbS+t0fmMXibQVNPcvfFK1+D+5eQLY1zT2tbprn8KYr6n9Gw47tDys4Fh8mWjvyrpST8lM1jexSQx66VhXxySfyFVrrRkq/lOX3qO9vFgknFoZJdFNj/5sC3KEaHLnYyK+2qf10i6mSSVtFHd7TkXl2WX4El3wMaOj59Jpt2Rj/37GjSGwOrNoYXDNHbYaLjRvg4scIeF0OxlNax9l9k+MRMF3kR7Qq2bt/gihc/SyQCeOuE3yji+fKUk6wnh3+iObwyPwPQfy/WsqkHA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbea0d61-bbc9-452c-a7a2-08dc5791c893
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2024 06:04:42.6454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RiLmltQ7JHwMtG2fI14lwQfhQRDUnVcfCd7hYWuD3vEHlNbBWxtqsjXZsRaDzGDlBnSjQTw++OidCGjiX7qc7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6674
X-Proofpoint-GUID: lWSKFe4GJN1jWHVzsiQPNvtata7xfNq_
X-Proofpoint-ORIG-GUID: lWSKFe4GJN1jWHVzsiQPNvtata7xfNq_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_04,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404080046

SGkgR3JlZywNCg0KT24gNC81LzI0IDE0OjA5LCBEYW4gQ2FycGVudGVyIHdyb3RlOg0KPiBIZWxs
byBNaW5hcyBIYXJ1dHl1bnlhbiwNCj4gDQo+IFRoaXMgaXMgYSBzZW1pLWF1dG9tYXRpYyBlbWFp
bCBhYm91dCBuZXcgc3RhdGljIGNoZWNrZXIgd2FybmluZ3MuDQo+IA0KPiBDb21taXQgYjI1OGU0
MjY4ODUwICgidXNiOiBkd2MyOiBob3N0OiBGaXggSVNPQyBmbG93IGluIERETUEgbW9kZSIpDQo+
IGZyb20gTWFyIDEzLCAyMDI0LCBsZWFkcyB0byB0aGUgZm9sbG93aW5nIFNtYXRjaCBjb21wbGFp
bnQ6DQo+IA0KPiAgICAgIGRyaXZlcnMvdXNiL2R3YzIvaGNkX2RkbWEuYzo4NzQgZHdjMl9jbXBs
X2hvc3RfaXNvY19kbWFfZGVzYygpDQo+ICAgICAgd2FybjogdmFyaWFibGUgZGVyZWZlcmVuY2Vk
IGJlZm9yZSBjaGVjayAncXRkLT51cmInIChzZWUgbGluZSA4NzApDQo+IA0KPiBkcml2ZXJzL3Vz
Yi9kd2MyL2hjZF9kZG1hLmMNCj4gICAgIDg2OQkJdTE2IGZyYW1lX2Rlc2NfaWR4Ow0KPiAgICAg
ODcwCQlzdHJ1Y3QgdXJiICp1c2JfdXJiID0gcXRkLT51cmItPnByaXY7DQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl4NCj4gVGhlIHBhdGNoIGFkZHMg
YSBkZXJlZmVyZW5jZQ0KPiANCj4gICAgIDg3MQkJdTE2IHJlbWFpbiA9IDA7DQo+ICAgICA4NzIJ
CWludCByYyA9IDA7DQo+ICAgICA4NzMJDQo+ICAgICA4NzQJCWlmICghcXRkLT51cmIpDQo+ICAg
ICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXg0KPiBUaGUgZXhpc3RpbmcgY2hlY2sgaXMgdG9v
IGxhdGUgbm93DQo+IA0KPiAgICAgODc1CQkJcmV0dXJuIC1FSU5WQUw7DQo+ICAgICA4NzYJDQo+
IA0KPiByZWdhcmRzLA0KPiBkYW4gY2FycGVudGVyDQoNClNob3VsZCBJIHNlbmQgbmV3IHZlcnNp
b24gb2YgdGhpcyBwYXRjaCBvciBzaG91bGQgZGV2ZWxvcCBmaXh1cCBwYXRjaCB0byANCmJlIGFw
cGxpZWQgdG8gInVzYi1saW51cyIgYnJhbmNoPw==

