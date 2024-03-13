Return-Path: <linux-usb+bounces-7927-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 215D187A4E2
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 10:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C7CA1F20F2E
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 09:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F829225CB;
	Wed, 13 Mar 2024 09:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EYVmrxnH";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NgtNx/eR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DQTWGa9k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B83A225AA
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 09:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710321731; cv=fail; b=lVBYEjhUOgaxMvv/erbaChO9dn345+4H60Aus52gYQ4EHfPsS8iM/+pZgjoJQRk5+DvPfdehwPykfy+VOf5gn63z8KUFJbvZf1IYxTIEQKzqW4h9fsfXBFUipgBSn6mgczSyP9KudcJU9WhipKliRXmxZynMXt3VbZpF8jIh5vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710321731; c=relaxed/simple;
	bh=vL7ODDU+pnFdMjefo5x/99YfLMyt0eu9NVZUIi7+Xas=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ulFFI8jXp+qRt9DAOEpVlMJ6Wfrmdcl0T9uYlrLYjK9EHYBfOctvf8C+jeAkuqe8PY8M4Q1QIDAhbdoyjUmZ8C82dVwRld2GyEMbcexcFY30nzvFZ1iGDzCx9fLYzes1DuI2i3efHIEV9kq31qO/WrjBzA0xiym0B9UzvXp/MbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EYVmrxnH; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NgtNx/eR; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DQTWGa9k reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42D8KZl8030612;
	Wed, 13 Mar 2024 02:22:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=pfptdkimsnps; bh=C41n
	y06te54zK0498rIecT+MbgvYHWrOhY2BukcEvH4=; b=EYVmrxnH4JPZT+Wqo95e
	kz4VmlMfeBfo9qbxteANk7pKkROEgCwHYW8BtniQSTsFXc1+s2BBgydCj8t+ARfY
	OWGq/WfDJt4irWtW8wBcrOMcz9112uH1BO2IyETOgEf0u68ADtULBcUB0GSq24Se
	wygnVzmGLeiYQANKFsWBGEXF879Ri1+kjlBhRuCY9K5GTVNNEKe/2wiFu1XVMfq6
	4QK23LjywlGAWs+RafCnwv4ZCHcNsJVMOEgeSDCz7c/LkPu6HkIFv1x/LjMtOtwN
	vktYu2bWMNP6DcL0w8+Ibm0K9NOqQL/AAnn116apzDLWTuuDUbhlVhhis0o93IQi
	tA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3wtugxuj5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 02:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1710321726; bh=vL7ODDU+pnFdMjefo5x/99YfLMyt0eu9NVZUIi7+Xas=;
	h=From:To:CC:Subject:Date:From;
	b=NgtNx/eRXgp70vhnxxIOaPoQA/aHssUgINyizUu9uDMZWNXqWNCgnBVDrmZ/BP8fg
	 ktNgQcYWczefXJI240tdsuukqS4yQ/tXOpguU9Yw974rG543l501YP2xBDsBv24IAI
	 jdT7ThxK0rRYqBaGn0xvX3pKQaKYG++HZSIs/Ec7W9QMGMzr0JW77gf32CU1XmY8oF
	 IESsUkiAOb5Erd50A8deF3fYy6E0Z3aeS1C3kML6BxUSQ5+MuKTlQJSD/xeq50oODU
	 xjJW123U7qyj+L0dDFTJ92VtNkzUwtF6IYpjnwxjltMjcnh9etIamUtSeJzS3/dSz3
	 QH4N5g1tcmFnA==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 275D54035C;
	Wed, 13 Mar 2024 09:22:06 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id EA0BDA00B8;
	Wed, 13 Mar 2024 09:22:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=DQTWGa9k;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6F16A4071E;
	Wed, 13 Mar 2024 09:22:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2v1Yq5Ner3XpVXXNKHe+8m0XAQjGKTrAiCmx1nbszR9MGrZkxq5XSw1Pi665B9M5Iu8AavDKkroNOsqe0KFvDfmQw1LMs+jpOWpqKh7sECiLBmYj7XaWjsBZrVQL1N6RgwMdeXLchgHRI724qJw2XMPoCy85bXaVQmwnOzmHqc/RiZq55a3xw88lrgVVnJTs17FNERSCZ11QhM7Eo12UEvNhJ+4XyVBh0XoZUGRBt1xwEyay+jWQL/V7rMYr6aLo9LHkku30AQm3KDYNJS2CzEfCsnxfQW5nV/xV9iThJ67bARODTulZGJSpHkEFXWuxAEbWY341u4GTJJAb7Ys+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C41ny06te54zK0498rIecT+MbgvYHWrOhY2BukcEvH4=;
 b=UZkxJ+lk/i1i38fRugQ8kjtHQYVrzf+HXcgNk8ht5gPQr9tEB0g+tGdqfXPd2JV1I0WdGo6OTz0dLBiQ/iRnctujsE6giN7pXvz5TauRstfMFQxssi+tY7tUtg9t/L3PegF2bxzKcq4YJijfJ9gxmrRjyHiYzRvTYRSKXqzv8+Lxhsr8++yFz9DynIS9TKXVwTjfRGp+GMkvbct9/pvBYnyW4AQU9zhOWxSwmw1XVvBlbSQqSk5zS1HyIRXyTxD+uDO7jvgcZxbY49beTAvO425kW34KeeSibxzaikPJmublU2iZ4kEJh1I0+n4iHlndLzm7j6HT9Xk4f7COktYXFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C41ny06te54zK0498rIecT+MbgvYHWrOhY2BukcEvH4=;
 b=DQTWGa9kPkgiNqa6JyHXSmyQSatbSmKjNiEXu5IPFRp4X+iK49B6GPFFf9c8+aPx6JUEVfoRrfUrYtPGsW9bN4Uu9k/I/zlnqb6XSyd7WocrB/o5TT7bJ+r4mmscgg73E6UypWpu+/lKyueHf1VGEMC0Y08+5epzKet54H3dPio=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by SN7PR12MB6910.namprd12.prod.outlook.com (2603:10b6:806:262::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 09:22:01 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b%6]) with mapi id 15.20.7362.036; Wed, 13 Mar 2024
 09:22:01 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: John Youn <John.Youn@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: [PATCH] usb: dwc2: gadget: Fix exiting from clock gating
Thread-Topic: [PATCH] usb: dwc2: gadget: Fix exiting from clock gating
Thread-Index: AQHadSfnuR9JM/whwESTlssesNtG3A==
Date: Wed, 13 Mar 2024 09:22:01 +0000
Message-ID: 
 <cbcc2ccd37e89e339130797ed68ae4597db773ac.1708938774.git.Minas.Harutyunyan@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|SN7PR12MB6910:EE_
x-ms-office365-filtering-correlation-id: 8ae02877-aaad-4bc1-4708-08dc433f0a78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uwemynidj4ooXlE2SV4lM02w6yGATKIJxJSbv0fw9OHg3WmQzvTulzpcKWdw7R1ZTu3PA3xvuPxvgVI1y/Vc30ZO/mL8ZZtSAEaVGzSon/Y4CfBJVeI2iBbnLZrMULYVFptza6TQATC1H646ya9CE075xqFJdgxGtG1YrfRuEEDLaxp6TgQ+bYJj7Riy85CKV9j/IYzd/Yb4uqxE5OuhPBGSGStmvX8e8YyPiZp6maTJGHv1Dx8YJQLUJSEkLXYdszoBLCPojW0jF5r9qoQ6CqZfLdfKiV3an4FkdMWYTo6HorSW2qJsjxkAOJVyt8WYgwyufwr2MS3wTGTUPOuE3WOe47gB0p8+/iUj3vEmPKoiOUFPB704FVZupyi8vNvOIlCTE8zphRGOcFxNzzrhSiQ2bZVaujjpuVivMJI+MP4kTYLyd3EJI4ZNof2o5wvyeisadXwEav3piJxbi9PFcXP49bJyb7kGGF9UH6piXi9ggxyIrnUd42YCPGn78/anFd4uCwQlAeVECpdQ4lsta58cBauV91OW5vy1J/NRUdL2nOqvgjSeEtIeDpzmn5Fo7ncZKpZeAz4zd56ttwI2k91TGdCW6VNwK2fdD1w+bU8fivSp6irhRWoYUuiJtjz8VjydGcQWI/qTEMy28igtxe05OogfxqniWpTCUGkDTlPxTw3JXN2nsMhskXGgbRtYPQVhQW/yrk9VQqgjkMymw57x1jqIZGMUt3qx88L9uq0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?p//7edoHiya7hUzAAlZy/UtOf7BIIhbI48VpR3i6YTBj7ZLEjzDWIeyxPU?=
 =?iso-8859-1?Q?0DWbzC265Mb1f8cKsvNFva0tGUqbg9rqeSJr5pg4w5JV5JyOcgQ8rx7CdL?=
 =?iso-8859-1?Q?BDQySfPEhLIT5P3vdy2B8BHPsz/JMoqOCsjIYbGqUOV8f4vUhguw+BJ5ZN?=
 =?iso-8859-1?Q?qH7erZKLaSXWeWc1YPBwfkqXL8iwmAIAFMAc2Ua2X3PGyuP9Y7wLOcE7t/?=
 =?iso-8859-1?Q?HW1L+EpYLK7yozEOLQobj61WVcQntzSXvP5PUA5RsVQKqoRkbF19mo93Ya?=
 =?iso-8859-1?Q?D+/A2u9BmF67KEkqGeNAXFhcetgoP87EvTN6zoWYE5C51dJhvzxaC0/i7u?=
 =?iso-8859-1?Q?xz/OX1s1gI5j0/z0+BYdAyhex7XUtJGSyBeB60Uk0qN/78+PAHCMZyKBR4?=
 =?iso-8859-1?Q?ttndjIqfgIp38/Wgd98jtIsDrl8ijduBgWMborOQgPtOgq9Myq2R+Y+zAw?=
 =?iso-8859-1?Q?rNHAMTxNh4HiuBLEr2xauNJgcazA16RC69sDxi8qonIu7+lxcq7s/t/rxX?=
 =?iso-8859-1?Q?zs209LT8HbznW5R4lS6ZJ4Ac9v/6AsCOwwgXQc1vXzW2TIJMCDLupvpiUp?=
 =?iso-8859-1?Q?DlkxglciK9mX9uhp1zeEbmF29wKa9pKqrWgKgN+LkSZVnC8eoCH6GoE7AV?=
 =?iso-8859-1?Q?LNNAY2E2zBHOjwroxoSAHwILURazTetBy+bE33TviaxAb+ON4SQREGuLTb?=
 =?iso-8859-1?Q?3m4iZ6Vx0JJ74MTz/2eB0WNI6kxZpYRablLxDs5N657uBPHiJ1m8YyCu0f?=
 =?iso-8859-1?Q?rSC8ow+Xvc2uICvinKWlsgiNfP7avFabkYi5lvu0Uloqt0uu/irhhWeBj9?=
 =?iso-8859-1?Q?6Bb/tFCxa2C6p0JHdEyYToRXUriDkpafmhacfI8Z9xkVmMHm7SBr0WuxJp?=
 =?iso-8859-1?Q?t3wcCsmLoppt7lmi91YSloBtduVEVm/YBRikPQYIxQPQxuGLiKI5yjqLzy?=
 =?iso-8859-1?Q?cx493yuUXJy0XlczPVKCvpjrncJQyeKDPJeUQ24xo2W/I0+EgWJfKcBuQo?=
 =?iso-8859-1?Q?h/bIczZ/c3skrFGfkf7SlCtDYVmYJBBHTkFGjxLWCVdbbexw/JLh3TEvO1?=
 =?iso-8859-1?Q?2MoMBi4OlhzlwCO0N5+yR6TuWMgqPp6JI6efv+xLkZGfO4GlJrMUWU7zsl?=
 =?iso-8859-1?Q?xnjsQt3ly6NXe8tDfhTMRUXAi3NFRUfVJK82wE7sTkSpUVexg4F5QA7f4p?=
 =?iso-8859-1?Q?KuIsl003YtPV9tHbXZgCsfycCAzpG1wb4VQFLpcCuJFzBiSnZrKMBKnxbE?=
 =?iso-8859-1?Q?gtMbiuH3XpwVerMnrC21AcMB6mN+0Md5qD9aYjLKNUlLJnR+uSrAiZ/4Mt?=
 =?iso-8859-1?Q?5u8w+pJPVBl3MI1KJgzlTr5Z1LCz24kI8IOuRMbqw+khwcey4r3pdVHqEN?=
 =?iso-8859-1?Q?MRX1ePxXZJEAt3hYx5XE3BUoY3RKRoAxmVc17kmFownb7NseZJpw5Z+PLL?=
 =?iso-8859-1?Q?I4oKzmR33M6JgEMzrUP20snNkmspD6fT//nrkcrN8dXX4pyuUZdul4JW/k?=
 =?iso-8859-1?Q?FhK/AQ6K1shwMSTQTCVa0fr31Wg46YxhRdpyxauj0xrcwID/1HzdtrCY3y?=
 =?iso-8859-1?Q?inkqqJs4vN7XMZRBVMgw6GJWtMCnN6ms98kzbcu20cAZyliezYKqTWT8Qo?=
 =?iso-8859-1?Q?Qjdsnl1pe+L/XUVYoTGpl1hJv/xwKlpjEiEfIKTZG2nO/QGIpTaVSFjA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	wrO9ohL00KamhGnyD1JtdCTRG7PMHQmuKPFet3KMIYId+USTgG9naTRgajsbBEVAWMyxyX6hEKay/KaP6c2ixCQhqNeck/vOSJeW71zjAVB6QqBq5RSqRxciCOc06TBX++GlmjPdpazKBWx2pUfvABpUbfbNfgTp7tdMAJi9Cz3INF8M99AMfCW9UFCVbQ+5ukJBDQeCgy9UFikgEYYSG2kjXcIMfY6TkoRKRDK3ZJrXG7j899+xCVrTrdXfD3bmpbhBPNEUNM7QJJhSBFPDnrq6AwrIFZ6x7ra0hOc+ZZCI1tyGoIJCcjdvVrJHezJZsMztqak/BtUB0wWkvdL5qo+mh26Lv+IDkzCG2cnxUWdck+WppQ1AFXzbN8vgzwlAVeYLq3qIKs6vE8eBgMZvQcWG0vfb0vP+ho4cR/Z4ZOUuqrPwqu8WxJLWi+ZvDeqMTQf/R7uMLCWEO5VrpUnsJ4c+JHsfs9Yf1ZwFs6SJAw3nGvQ/rUztK8VnuPEN/kTvBIhvrpXjNgUPdt597sli2kTnDOLkECbVzbiPfiL9wxgfbAcLOzF2lDl+5huBFOMMrjuoJwroeAO9GO7LCZS2FIOu/MZlQSz8du9Id6FE4zf+Z/ul9X9gS6c7+CRnL1V+s6sQ1HFFf4xdum7h/4aUQg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae02877-aaad-4bc1-4708-08dc433f0a78
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 09:22:01.7085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ctdrd42tNfcHH15sVnWcX5m+nLji5uZ3NG4+t0mOnKadRw+OAAaggHSljdmMv9G4bb7C19D9ZBb8iFgL4jWSCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6910
X-Proofpoint-GUID: W3pjtpRUxalFqYtRIAG8tLjbBHS8_kIE
X-Proofpoint-ORIG-GUID: W3pjtpRUxalFqYtRIAG8tLjbBHS8_kIE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_07,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=668
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2403130068

Added exiting from the clock gating mode on USB Reset Detect interrupt
if core in the clock gating mode.
Added new condition to check core in clock gating mode or no.

Fixes: 9b4965d77e11 ("usb: dwc2: Add exit clock gating from session request=
 interrupt")
Fixes: 5d240efddc7f ("usb: dwc2: Add exit clock gating from wakeup interrup=
t")
Fixes: 16c729f90bdf ("usb: dwc2: Allow exit clock gating in urb enqueue")
Fixes: 401411bbc4e6 ("usb: dwc2: Add exit clock gating before removing driv=
er")
CC: stable@vger.kernel.org
Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 drivers/usb/dwc2/core_intr.c | 9 ++++++---
 drivers/usb/dwc2/gadget.c    | 6 ++++++
 drivers/usb/dwc2/hcd.c       | 2 +-
 drivers/usb/dwc2/platform.c  | 2 +-
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index 158ede753854..f8426e3d2b19 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -297,7 +297,8 @@ static void dwc2_handle_session_req_intr(struct dwc2_hs=
otg *hsotg)
=20
 			/* Exit gadget mode clock gating. */
 			if (hsotg->params.power_down =3D=3D
-			    DWC2_POWER_DOWN_PARAM_NONE && hsotg->bus_suspended)
+			    DWC2_POWER_DOWN_PARAM_NONE && hsotg->bus_suspended &&
+			    !hsotg->params.no_clock_gating)
 				dwc2_gadget_exit_clock_gating(hsotg, 0);
 		}
=20
@@ -408,7 +409,8 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc=
2_hsotg *hsotg)
=20
 			/* Exit gadget mode clock gating. */
 			if (hsotg->params.power_down =3D=3D
-			    DWC2_POWER_DOWN_PARAM_NONE && hsotg->bus_suspended)
+			    DWC2_POWER_DOWN_PARAM_NONE && hsotg->bus_suspended &&
+			    !hsotg->params.no_clock_gating)
 				dwc2_gadget_exit_clock_gating(hsotg, 0);
 		} else {
 			/* Change to L0 state */
@@ -425,7 +427,8 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc=
2_hsotg *hsotg)
 			}
=20
 			if (hsotg->params.power_down =3D=3D
-			    DWC2_POWER_DOWN_PARAM_NONE && hsotg->bus_suspended)
+			    DWC2_POWER_DOWN_PARAM_NONE && hsotg->bus_suspended &&
+			    !hsotg->params.no_clock_gating)
 				dwc2_host_exit_clock_gating(hsotg, 1);
=20
 			/*
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index b517a7216de2..8d3d937c81f9 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3727,6 +3727,12 @@ static irqreturn_t dwc2_hsotg_irq(int irq, void *pw)
 		if (hsotg->in_ppd && hsotg->lx_state =3D=3D DWC2_L2)
 			dwc2_exit_partial_power_down(hsotg, 0, true);
=20
+		/* Exit gadget mode clock gating. */
+		if (hsotg->params.power_down =3D=3D
+		    DWC2_POWER_DOWN_PARAM_NONE && hsotg->bus_suspended &&
+		    !hsotg->params.no_clock_gating)
+			dwc2_gadget_exit_clock_gating(hsotg, 0);
+
 		hsotg->lx_state =3D DWC2_L0;
 	}
=20
diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 35c7a4df8e71..d5491ada8eed 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -4649,7 +4649,7 @@ static int _dwc2_hcd_urb_enqueue(struct usb_hcd *hcd,=
 struct urb *urb,
 	}
=20
 	if (hsotg->params.power_down =3D=3D DWC2_POWER_DOWN_PARAM_NONE &&
-	    hsotg->bus_suspended) {
+	    hsotg->bus_suspended && !hsotg->params.no_clock_gating) {
 		if (dwc2_is_device_mode(hsotg))
 			dwc2_gadget_exit_clock_gating(hsotg, 0);
 		else
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index b1d48019e944..7b84416dfc2b 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -331,7 +331,7 @@ static void dwc2_driver_remove(struct platform_device *=
dev)
=20
 	/* Exit clock gating when driver is removed. */
 	if (hsotg->params.power_down =3D=3D DWC2_POWER_DOWN_PARAM_NONE &&
-	    hsotg->bus_suspended) {
+	    hsotg->bus_suspended && !hsotg->params.no_clock_gating) {
 		if (dwc2_is_device_mode(hsotg))
 			dwc2_gadget_exit_clock_gating(hsotg, 0);
 		else

base-commit: 539f317ea7321225be4508975fa6dfbe2281cff9
--=20
2.41.0

