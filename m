Return-Path: <linux-usb+bounces-16801-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9059B3F10
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 01:22:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BF00283A06
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 00:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517D2FC12;
	Tue, 29 Oct 2024 00:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TzXeDiro";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YzTBwLf7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ca5HSZut"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FA28827
	for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2024 00:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730161349; cv=fail; b=j4av0Fb2uTl86bZG3OXBKS1D1XLoclLelRzlJuzzT6SfcxvihZlqxgvBZBFxfQazgZ4cCyiDNO5wllhXqaZy6rqUu9XoopI6Ri2vziI2aF2LxITpsUrBFdANVVTAcaEvToEZa3iHYzCX4CTMsoz/8K1mXUTd2sPGUVjp+Xa28Ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730161349; c=relaxed/simple;
	bh=HdC+XGuy4RmWUuExj8pgON3pxqSTeHVvfhHpHn8cwfI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G7p9QFO6qRkSQjBzvIkl52xkPTltUMuVBt/GUyUsBWtoRnn0XImw0lZNs+sOQr9+90dtK/q5TrBUDVUqoaUnlGvBuenRHB2yCbFFlDpaodcFoQLL9ZbFA5bPQDq4vk2vgUCFLg7BNkoaQ8wm3DelPZm16tgxRjqa26u+bepJEXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=TzXeDiro; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YzTBwLf7; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ca5HSZut reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SJSYB5009938;
	Mon, 28 Oct 2024 17:22:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=HdC+XGuy4RmWUuExj8pgON3pxqSTeHVvfhHpHn8cwfI=; b=
	TzXeDiro3mcnC61LZSPQElHPCTiFgXMJySVz06IHhDPx9MG97qN5dzn9gkh6SEeI
	GosUBaicqI2+iSN9mb9CWPjvUuaSV+6poE44yNO5A/GUt/Z7rm1wEK5HRhcHTq4u
	/Nw4z2ExJL1iHqAImr+ldIcALnQMgKYGf8ZFKm2PtbtnQU49rNKQV/9BKTOYIRNj
	LbfsnejNc+trLKA0C6iEVmYqy/W84ITEKvx94kuiLUjEtknHtkSFLg8QEoeKWxB8
	N53EdLH/4tktbRLH1gESat/Mn2+GgZjY1YUWbIKP0u9YgLz9fSTP8G+Zj0CNzQ69
	6+RFY4iq7WFouwA4kfQO1A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 42gybvut9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 17:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1730161336; bh=HdC+XGuy4RmWUuExj8pgON3pxqSTeHVvfhHpHn8cwfI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=YzTBwLf712x1R4myxGH4bB3R1cH3YaCxgFnSml38JDkm98Hn/dTmhTWC8d7oaj9W3
	 tWU7lSywi8yuZC7fi0e4tkjv9JbBY728oZd+yYBe+icWQezh0QhJRpMT77vfyyuvk+
	 4BX4JgfPCacIA+XBVkMaB47it7vNhAot58jzdQZ/woy8bJte0YtkSs831Q02znKPJC
	 ir1OBynPLzd5NLxvjg0x2s7kZla05IefNZ6GJ7JW82lk7YoCQrYpbIisSxRaAyMG/L
	 A1HfptecehX7f6nYslHkeAOjn/k3jD9GgxnYOIcTbXRLbh8R/uDiXp51Rehpg4LOPH
	 CTNxSKC4HSbYw==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3A76C4011D;
	Tue, 29 Oct 2024 00:22:16 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 03E55A0081;
	Tue, 29 Oct 2024 00:22:15 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Ca5HSZut;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 26EBE40AF1;
	Tue, 29 Oct 2024 00:22:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjWNTzERM+yRL8PHQCrhYB4GGFKLUJbjBUUB1UTkpZQLJ5FcU1OiRBgt2jF46vsLr4t3NM+QWqifTmVD52MZmZo57+FcoyzOVBv9s4bJZcu/3q8xTb1jA+IX4jkx+yHdBc6H2vIdQ7zCvq4AXzxPlEoB3Lkqt5dFqutRUmQifaPandZQHevUqhSqjRPN50uO9nnCchHfJTcNGqHqakzYty7ImIHeHZu/gAGRD7QDuLIe0Bjy/wci1R7ZK1s6ytpbeQj4RFzqZSHaI8Ot9+wDXfvnIgOOEudXl8z3J2uJtUqB/6KpXRKq0fF3sww04SYoJfOjRyUNEJ65SwbiceQi0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdC+XGuy4RmWUuExj8pgON3pxqSTeHVvfhHpHn8cwfI=;
 b=S/DDfv879NtlCdGw9BCCy0V5WJatgea4ehFzzblXyxQUrjKv9ZQfN0iCnbcCMq/AsDLYto0Rw6lNdzvY1PN1yo0ArAdVTFhFCjEwpmhldz8dAnuUNPwoEWz9gbO4BapicWDxQa5vEyOzglhIhzMYF2Zq0x0MV81qs1S47shshNkeh0B/fF+MzhBbAlwHhiQLZdBA2ZWhv8XmXhcrGVL95QYNO7UYz74zMaIoyKiWcQAFzhhiP9X0FCV8Tho7O9F4835UdbTuhZN5grNZbBNHtJr2DG0CeFciyTO3XxrdkRu/o6rrW1jGVUenvWWX2NG3QUnBURdviewU1FSXoUbsTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdC+XGuy4RmWUuExj8pgON3pxqSTeHVvfhHpHn8cwfI=;
 b=Ca5HSZutF3o66Ot6pP5YS3Oz5DuxkXceQ9pb/fTXRnEjDxQ7Y2swRt171BCWZnoZwjprq972nge5OTaRcJtFp5PWqQQAyKBe3Ihodtdtl+9k0Naxg55mwCakhYXVB2zEjcJOtIikdgC4cSDtgu6EJcI0z4oXmB/beUWaD9VMINw=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA0PR12MB7604.namprd12.prod.outlook.com (2603:10b6:208:438::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 00:22:11 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.8093.018; Tue, 29 Oct 2024
 00:22:10 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Alan Stern <stern@rowland.harvard.edu>,
        Bart Van Severen
	<bart.v.severen@gmail.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb: gadget: automatic remote wakeup on hid write
Thread-Topic: usb: gadget: automatic remote wakeup on hid write
Thread-Index:
 AQHbJfjykPlWtis7Z0quVwW8aaMARbKX3q8AgARsJQCAAAzcAIAABY+AgAAW94CAAHEGgA==
Date: Tue, 29 Oct 2024 00:22:10 +0000
Message-ID: <20241029002209.5eqrdsvpxrh3ycxl@synopsys.com>
References:
 <CAOLjEn56gcrBLYqmtAPY49wpZCUzuKAGSt+L2ADBpAEELoQ1TQ@mail.gmail.com>
 <6daafbf9-5999-463b-9198-cd699deb6721@rowland.harvard.edu>
 <CAOLjEn41agaq4J99BFfekPLvnBBKfvBnj24pXLzpkn21_K4ouA@mail.gmail.com>
 <467b1da8-325f-473d-bf46-96947993c626@rowland.harvard.edu>
 <CAOLjEn4vJuxmRGUpUqMS6C7P82d18TkgURhd71UkXNTm5waYtw@mail.gmail.com>
 <f5ab7ad5-9a9c-475a-9a1e-3f9de8d1a2a9@rowland.harvard.edu>
In-Reply-To: <f5ab7ad5-9a9c-475a-9a1e-3f9de8d1a2a9@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA0PR12MB7604:EE_
x-ms-office365-filtering-correlation-id: c72a49a9-d926-4bbd-452c-08dcf7afbb00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?M3pZbTNQNjhMRnNTb3ZEV0lmRFZPRzIwU1dyT1FDQmxQSlpoNWpYeXNUeWF6?=
 =?utf-8?B?SUtMbVNnS1psMGFLdjg5YnM2UE1BSW9lZ0k3ZHlTS3BUNUNhMmIwUmlTVU1n?=
 =?utf-8?B?NmpSTzl4M0JVY0VkU3FHaWVkWE5YdFJFUCt0VlhNRmRnamluT1RIaVZ6dVF6?=
 =?utf-8?B?T3RoZ3ZkTVNNTW1zV0pwdGFEVnUvcjZ5RnMrVm9wQmZUSHVDSk5LSm9DRWp1?=
 =?utf-8?B?SVBPRHZnb0dGQzdpNFE5Tmt3TUFML2p2RGJFSWZFa044QndXdHkzTzlVRHdG?=
 =?utf-8?B?UC9qMHArclo5T043djB6T2hpNFROeldzWmNudlhtV2EybDU5YWtZUUUxRzYx?=
 =?utf-8?B?T28rZmhHQ1grNE9Iamk4VUhGMlZnZmR5QUlMeFRNczVMY1BKWVNGalprUVhv?=
 =?utf-8?B?YU9mUGV5bWZEYVpSZEo0Qnh4c1kySklCZWRFdEdQZ0ZMLzlqYkVyckE4N0Fl?=
 =?utf-8?B?Y1QvNXBQMXlsQ2Y3akNkaENwdVBWRmc3V3l4ekZKVmgrSzRSMXREdC9md3Bv?=
 =?utf-8?B?RnhmTHpvVGJyVUlaUkRHQ3VLZzYyaTQ1MGU4NmFUSW5Sa3diWE1vZzlGc0Fl?=
 =?utf-8?B?aEhVYUFNbkhkV05QUmhNWkZjMXFLR1JlTkNrR0JSN3ZFbFZ6c21Ud2JydUlV?=
 =?utf-8?B?K2IzWWdzdG5xTmdTd3NTeURtMWVONUZvemJUQVp6elBaMGF5bkhtcjB3YytT?=
 =?utf-8?B?NjJZYjNYcnZ1ajNNaGN1bE12bVBkSFZxcFRQQVVCQmZsa3QyZ2N3VSszMlZh?=
 =?utf-8?B?ZW9tSFhCYldTSGVyZkt1MDJhSUxOMytHT04zd2xEdll4S3lOR2ZmakRicDBI?=
 =?utf-8?B?WWp0UmRvVnNIeHZpdmptd1BNUnhKNW94LytTSmswZHg5RXdCQjZCQklTaUFB?=
 =?utf-8?B?UFVzbzhMQ1Z6LytmU2dXNWU3NFduNGgyRFBhcDZRMW53VDBkcVVUVzZEL3hi?=
 =?utf-8?B?d09GUmJEN3NlTkJIYU5HNU1EQXJlbzNLYVZRZnhqcmNMcFQrVEdiYmZnbnpq?=
 =?utf-8?B?TS9vaVFpVXZxbkJnRnhqSUVLZDl6V0hqTG5zY0NOSWlNeUkvWlRqbERqaTRj?=
 =?utf-8?B?QXRxN013ZEtXakE3ZE5JMU4yOGExM09LUGlJZXlOY0h6cmpiZmNJVEJ1R1pS?=
 =?utf-8?B?MTlIQ3diaENpcnl3TzRHcFd0NFZEL01wNjhiT2lIOGRMMXpadlgzRUh6NXZt?=
 =?utf-8?B?UlB2Nnh5MVp6Szg4N0VNQnBTSVp4blNkNGxsUlRTbGhxRG9rbjZuVkJYL2Fj?=
 =?utf-8?B?TzNWTnhwbzdFR2w2cFhVTTFEa0FHL0xCUmNiazB5NE9qRUdYd2FZZGcxUExH?=
 =?utf-8?B?TUVMbG96WCszNDdHNWNySjdqM0dPSEErNG1WRVNhb0kzQVJaVlpqaFNYSmU1?=
 =?utf-8?B?WC9UTHAzUGhGQ1pWVG5MS0cxWXZybkhhK2ZteXo2akRZNFZHbTVoMjZQamRq?=
 =?utf-8?B?VWU0RVRRaFJwWG85cmU1UytlZmhSNGs0dUZTRG5MRWJsMjRaYkVkeWtSRENR?=
 =?utf-8?B?Q3NsUXBxem0wSmMwb1ZiY3B4WFc0RXJnbys1ODNQTmJpYTdkeExlYURvOXJq?=
 =?utf-8?B?cWdnQlNnR0kybmNjcmx5R1hVL2dOamdKSGg0dHowYnhpZUQwUnU4bUpseWZJ?=
 =?utf-8?B?ZjNHQXFRQnJSTXdvRDJhczljOUVWblZIS1RBdXlja1R3TlkzNFVMOVN3dE5Y?=
 =?utf-8?B?RTBFYlcrSHFYS2ZnVDR6RHdXMHp1YzNaREdTNVl2RzY1ZHJlQ0JSQjRBWk9q?=
 =?utf-8?B?Vm8vNzd1NGhRSmlqMFp1MWQ2TTJjTzdlaVZXZEViNWVzWFBTTjNiYVEzZzVD?=
 =?utf-8?Q?Sv0dUeMXWJfKZBgSrIQFm/V9bkaLbdPA+VGOo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WWd0aXcyV1JkaXJmS0VnQUp2WU4yc1ljcUxxdW0ya2EwQlRGTXhGSWlMcERL?=
 =?utf-8?B?MitKdGZoSmUwN1ZkYVpoTkFuekhaUXUzeEFmdVdpOXFwelo0QjhSaTdvaW1M?=
 =?utf-8?B?a0JnQkJMeDBXeWpkSjFNS2QvNzlnWEgwakFCejFPSkFwQWtvSmVkVHBvaEtB?=
 =?utf-8?B?TWZRVStMNjdNa3R1WE4vbitwMjBnMTV3cStTTWJPUEQzNFFqbWxNQTRybXE4?=
 =?utf-8?B?cEJtc2lYQVV0SXA4a0o0RVgzMDFDZkQ4bHpkaitQTk9CZ09uWGhweTJuUk5h?=
 =?utf-8?B?MnMzb1B1VGRrMmd3dGZtcmVjV09EQXhuazdSRmdqVm13U21LbHpldnNEdWIz?=
 =?utf-8?B?Ymo2YXE2aTN3ZS9JMDVUdnpFUDJsb3krcFo3VzNscDBrbnJxejVUZEl3QmRz?=
 =?utf-8?B?MGhhOEthR0RsVGFMekxsTUQwVHBBV3BSWm5XejNlQjAzcHJtb3pudExnd0JO?=
 =?utf-8?B?OGM5cDI0Q1UyZzBDTHdCbisxTXE0Ni9VTmd5SmNJZmYrNUVPQmd4bHVNVDRG?=
 =?utf-8?B?VXp2UitrdkVFeFdVYlNCaW9iZDRLanNQU3VTTmQ5c2RTbmJIcnJBN0p5cjJL?=
 =?utf-8?B?RFVHRkE3a1Fvd2poZHJiSDJuS2xYaXhpb3RLZlZ4UXovRVBHY1lDeXpwTlBo?=
 =?utf-8?B?Z1hTeHBpeitFaEtGQzNHWnBVbTd1MUhWT3hrdDc0NU5sQXVLQzg2TzJ1NVVs?=
 =?utf-8?B?dHNNTWR0aFp4ZXlWdnh0MStWQUtFZHpYODRWS1lLTCs2N3BGYkRzbENhcCtu?=
 =?utf-8?B?Uk9PYW9PRDZIRGxjRWpveEdJR1dUYkhkTmtnNlRUbldzSFFUQkJkaVhrdndj?=
 =?utf-8?B?MUJNWTdVVU1NalA3NFNvckFpWGhVN1ZCY25yazAvQ1ByZ2JLRkwyOEhQa0Yz?=
 =?utf-8?B?ODU0NldjTGNNM2t6WFVrV01IcVdpRjg3V1J5dy9INHdKN2xRR1BqYllrZUhX?=
 =?utf-8?B?T3NhSDBYdytuMjNiYVNNRFNzVG1QaDZodWgwRHZsM1JtNFpzcVVha21EYUFR?=
 =?utf-8?B?TnFpajRTQVJvc284SjlLeEJPWmFtOXNKdUJBaEhyclpOV0w5KzRMVEtBMVlN?=
 =?utf-8?B?aW5LTnlMbHBSdDdkSWkxWE5mUE5vbGRwV2Q2ZnNuVE5YbnE1VEYvUkVWQ3Iy?=
 =?utf-8?B?L0x1NnJRRUd3NGFjUU1yZXFDOGQ1bXdUb0JxMkcrZldReFozeFphKzBQVHRK?=
 =?utf-8?B?UHlqSzVkaEx5MnNLd3JENStneFB0K0Z4R0Z5VE4rMDlPbmtGUE0zNHk4OFBN?=
 =?utf-8?B?MzEzeWdCeEZBVnZXKzFRS09pbzFEQ1RwU3B3SlJ2UzNpUkg5eUFjb2ZDc2ds?=
 =?utf-8?B?bHJRYkRvQWkzTitPQjJjb2xhWFZhQjFHVzVrUEFidWZqUWd0UHNERWhianMr?=
 =?utf-8?B?ZWhMY1h6S0d1QUtPZDgydC95RERva3RXWmN5RkJpWmtYZFVKeGdrOERscVRn?=
 =?utf-8?B?Z0xyNTIrc0V3WmMvcWVDS3lOa1B0ZzJEN1htVi8vU1IveU1WNzh3V3V4N0V4?=
 =?utf-8?B?SmNkY2toVFZueG05dkRNVnlSZjhOaFFOUDN0VmNtbnBVSFJkQTZWdlMybmUw?=
 =?utf-8?B?dzV2d25QTnJlb0VnL2doS0djVjFCWEQzYkhYd0hHS2ZKOGRCUEdTenpIMHo1?=
 =?utf-8?B?a2pJKzVmUlZlRjMyWTMwMTZyVTVrV3VoQzcvTlVhc3YxMkRaLzc3TGg2OHU4?=
 =?utf-8?B?bkkwUzlUUElGdXdNZFJWdk5ZNHZlK21GTE0wTjJuZitxWjIzRnZPdjA1Nmo5?=
 =?utf-8?B?aU85Vk1FcDdCVlZpOERqTjZmRjljNUsvQ1VLWmhJMzkzTTVwc3hKWVFibEZR?=
 =?utf-8?B?VWczM0haZFJjZlY3cUZlLzJYMktMb002a1BZYzJrMExHV0F4M2V2VGpVRjRM?=
 =?utf-8?B?ZEtRRElhQ0xvQk5iTkE4aW9vZTB4QVJ6Tlk2U0V4VWZMbVlxVFdmalVuSW5y?=
 =?utf-8?B?REtycCtNeWM5RzBNY3ZQNUVXTHJ1TGNuNVkrTjdCeVdsNExBOFEyUTYvVjRv?=
 =?utf-8?B?ZHFGSy9kZkdDbXYwOEowUnVocFhyOUl5bVluV1ppOHFsQ1V2bXgvaENwMW1j?=
 =?utf-8?B?ZmxhYWVvVTFtZHNPbytEOUpWRGoxR0NSNVhCSThFRGl4a2k2K3RXY0hkZGxM?=
 =?utf-8?Q?BP8xZm/VubUY8tHbCJf9RXPC7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AEE4AB98A8D9B347A068990F778232A3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hX9a31Uevnk8IXKxUdYV2BJS2Z3kOarSdGu0hRXqiYwKnVPIc6E8EUMZ2MbNUp9QYYqi4s+qQ/ERuTaqo4NHD30MGtxM8yg1mNVSoDSiuv660nQxKP7et5EKs5NWXBVB7Er6NBsbNfMwliQBgguAjbFTrIXXWJ5h/+dQVC5rNxdMl+gXARTgxjcSAMxRmlQIJ0duc0Ordiv/cTPBoVemhX6OQKHJoiTmyg01MBuCxkv/HZgOJmt6lCATA0KASaI71MpSjjyZR6m4DBcs/9eLHTxqNtZCVEg0zEF9IxxjUw73NEd1M2XNfsK61o6QO4NH8CPWMPk4vA8Jb00CL1lSr0e1TAPZfj2Oti93/SFAqiignq1wRDOC9WwPOqwVApZpP2T80KXXC1sKfOHTCXJje5nbm03Sr8foKm8z+DnnlDqHbriQ98MBOq6nR2yvGnnZrYZ/axiHbyJI5zzruDsY6sBwT+Ex0ju5oX8ArorqwpGyqbquhfebRn36+3EgGrGG/3T1xkLv3nVEGFvt4FDX3L+AAGC3yRtDfMxIi7TS35hkuDYG3GKl2KrwPOWDTAywIwqoDXrJwZ7C1MSgVa6AUTD1ZJ3fbm3AdbTqZyAEqFj+OfEFVSRnF6IyRH5QCECFtT428oUVi5tpEht3QyAA3g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c72a49a9-d926-4bbd-452c-08dcf7afbb00
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 00:22:10.8374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TL5a/CVH0mV8GwrS8uywrlH5qtd0iUBXt3ah4cc/2X6GeTsHO6dkAAspGWN++IwibL2/iW52ZEjjSS1ZNQO4Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7604
X-Authority-Analysis: v=2.4 cv=Av283/9P c=1 sm=1 tr=0 ts=67202ab9 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=nEwiWwFL_bsA:10
 a=qPHU084jO2kA:10 a=jU1gAu74t-eFszW0LDsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: kU48vKCRv5D3IzRNAzR3iffLro2e2Mde
X-Proofpoint-ORIG-GUID: kU48vKCRv5D3IzRNAzR3iffLro2e2Mde
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=793 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1011 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410290001

T24gTW9uLCBPY3QgMjgsIDIwMjQsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIE1vbiwgT2N0IDI4
LCAyMDI0IGF0IDA1OjE1OjI1UE0gKzAxMDAsIEJhcnQgVmFuIFNldmVyZW4gd3JvdGU6DQo+ID4g
T24gTW9uLCBPY3QgMjgsIDIwMjQgYXQgNDo1NeKAr1BNIEFsYW4gU3Rlcm4gPHN0ZXJuQHJvd2xh
bmQuaGFydmFyZC5lZHU+IHdyb3RlOg0KPiA+ID4gVGhlIGdhZGdldCBjb3JlIGRvZXNuJ3Qga25v
dyB3aGVuIHRoZSB1c2VyIHdhbnRzIHRvIGlzc3VlIGEgd2FrZXVwDQo+ID4gPiByZXF1ZXN0OyBv
bmx5IHRoZSBmdW5jdGlvbiBkcml2ZXIga25vd3MgdGhpcy4gIChGb3IgaW5zdGFuY2UsIG9ubHkN
Cj4gPiA+IGZfaGlkLmMga25vd3Mgd2hlbiB0aGVyZSBoYXMgYmVlbiBhbiBoaWQgd3JpdGUuKSAg
QW5kIHRoZSB3aG9sZSBwb2ludCBvZg0KPiA+ID4gdXNiX2dhZGdldF93YWtldXAoKSBpcyB0aGF0
IGl0IHByb3ZpZGVzIGEgd2F5IGZvciB0aGUgZnVuY3Rpb24gZHJpdmVycw0KPiA+ID4gdG8gdGVs
bCB0aGUgZ2FkZ2V0IGNvcmUgdG8gaXNzdWUgYSB3YWtldXAgcmVxdWVzdC4NCj4gPiA+DQo+ID4g
PiBBbGFuIFN0ZXJuDQo+ID4gDQo+ID4gQWdyZWUsIGJlc3QgdG8gaGFuZGxlIGl0IGluIHRoZSBm
dW5jdGlvbiBkcml2ZXIuDQo+ID4gDQo+ID4gVW5mb3J0dW5hdGVseSwgYXMgc3RhdGVkIGVhcmxp
ZXIsIHRoZSBkd2MzIGdhZGdldCBkcml2ZXIgZG9lc24ndA0KPiA+IGVuYWJsZSBsaW5rIHN0YXR1
cyBpbnRlcnJ1cHRzLg0KPiA+IFRoYXQgc2hvdWxkIGJlIGVuYWJsZWQgYWdhaW4sIHNvIHRoYXQg
d2UgY2FuIHRlc3QgaWYgdGhlIGdhZGdldCBpcw0KDQpJZiB5b3UncmUgcmVmZXJyaW5nIHRvIHRo
ZSBsaW5rIHN0YXR1cyBjaGFuZ2UgZXZlbnQsIHRoZW4gd2Ugb25seSBuZWVkDQppdCBmb3IgY2Vy
dGFpbiBzY2VuYXJpb3MuDQoNCj4gPiBzdXNwZW5kZWQgYmVmb3JlDQo+ID4gY2FsbGluZyB1c2Jf
Z2FkZ2V0X3dha2V1cCgpIG9uIGhpZCB3cml0ZS4NCg0KV2UgZG8gZW5hYmxlIHN1c3BlbmQgZXZl
bnQgZm9yIHRoYXQuDQoNCj4gPiBEd2MzX2dhZGdldF93YWtldXAoKSBkb2VzIGZldGNoIGFuZCBj
aGVja3MgdGhlIGxpbmsgc3RhdGUgZXhwbGljaXRseQ0KPiA+IHRvIHJldHVybiBlYXJseQ0KPiA+
IHdoZW4gaW4gVTAsIHNvIG1pZ2h0IGFzIHdlbGwgYWx3YXlzIGNhbGwgdXNiX2dhZGdldF93YWtl
dXAoKSBvbiBoaWQNCj4gPiB3cml0ZSwgYnV0IGl0IGZlZWxzIHVnbHkuDQo+IA0KPiBUaGUgdGVz
dCBoYXMgdG8gYmUgZG9uZSBzb21ld2hlcmU7IEkgZG9uJ3Qgc2VlIHRoYXQgaXQgbWFrZXMgbXVj
aCANCj4gZGlmZmVyZW5jZSB3aGV0aGVyIGl0J3MgaW4gdGhlIGZ1bmN0aW9uIGRyaXZlciBvciB0
aGUgVURDIGRyaXZlci4gIEJ1dCANCj4gaWYgZHdjMyBkb2Vzbid0IGVuYWJsZSBsaW5rIHN0YXR1
cyBpbnRlcnJ1cHRzLCBob3cgZG9lcyBpdCBrbm93IHdoZW4gdG8gDQo+IGludm9rZSB0aGUgZ2Fk
Z2V0IGRyaXZlcidzIC0+c3VzcGVuZCBjYWxsYmFjaz8NCg0KVGhlIGR3YzMgZG9lcyBlbmFibGUg
c3VzcGVuZCBldmVudCB0byBzdXBwb3J0IHRoYXQgY2FsbGJhY2suDQoNCj4gDQo+IEFuZCBlaXRo
ZXIgd2F5LCBpdCBsb29rcyBsaWtlIHRoZXJlIGlzIGEgcG90ZW50aWFsIGZvciByYWNlcy4gIFdo
YXQgaWYgDQo+IHRoZSBob3N0IHB1dHMgdGhlIGxpbmsgaW50byBVMyBqdXN0IGFmdGVyIGFuIGhp
ZCB3cml0ZSBvY2N1cnMgYnV0IGJlZm9yZSANCg0KUmVnYXJkaW5nIHRoZSBwb3RlbnRpYWwgcmFj
ZSBjb25kaXRpb24geW91IG1lbnRpb25lZCwgdGhlIGZfaGlkIGNhbg0KdHJhY2sgd2hlbiB0aGUg
LT5zdXNwZW5kKCkgYW5kIC0+cmVzdW1lKCkgY2FsbGJhY2tzIGFyZSBjYWxsZWQgdG8gaGFuZGxl
DQp0aGVzZSBjb3JuZXIgY2FzZXMuIEhvdyBpdCBzaG91bGQgaGFuZGxlIHRoYXQgaXMgdXAgdG8g
dGhlIGZfaGlkLg0KDQo+IGZfaGlkIGhhcyBoYWQgYSBjaGFuY2UgdG8gcXVldWUgYSBwYWNrZXQg
aW5mb3JtaW5nIHRoZSBob3N0PyAgTWF5YmUgd2UgDQo+IG5lZWQgdG8gYWRkIGEgZmxhZyB0byB0
aGUgdXNiX3JlcXVlc3Qgc3RydWN0dXJlLCB0byBsZXQgdGhlIFVEQyBkcml2ZXIgDQo+IGtub3cg
dGhhdCBpdCBzaG91bGQgaXNzdWUgYSB3YWtldXAgc2lnbmFsIGlmIHRoZSByZXF1ZXN0IGlzIHF1
ZXVlZCB3aGlsZSANCj4gdGhlIGxpbmsgaXMgc3VzcGVuZGVkLg0KPiANCg0KVGhlIGhvc3Qgd2ls
bCBzeW5jIHdpdGggdGhlIGdhZGdldCB2aWEgU2V0RmVhdHVyZShyZW1vdGVfd2FrZXVwKSBjb250
cm9sDQpyZXF1ZXN0IGJlZm9yZSBlbnRlcmluZyBVMy9MMiB0byBlbmFibGUgcmVtb3RlIHdha2V1
cCwgYW5kIGl0IHNob3VsZA0KZGlzYWJsZSByZW1vdGUgd2FrZXVwIGFmdGVyIHJlc3VtZS4gV2Ug
aGF2ZSB0aGUgZmxhZw0KZ2FkZ2V0LT53YWtldXBfYXJtZWQgdG8gdHJhY2sgdGhhdC4gVGhlIGR3
YzNfZ2FkZ2V0X3dha2V1cCgpIHdpbGwgbm90DQp0cmlnZ2VyIHJlbW90ZSB3YWtldXAgaWYgd2Fr
ZXVwX2FybWVkIGlzIGRpc2FibGVkLg0KDQo+IFRoaXMgcGFydCBvZiB0aGUgR2FkZ2V0IEFQSSBo
YXMgbmV2ZXIgYmVlbiB0ZXN0ZWQgdmVyeSBtdWNoLi4uDQo+IA0KPiBBbGFuIFN0ZXJuDQo+IA0K
DQpUaGUgZl9oaWQganVzdCBuZWVkIHRvIHByb3Blcmx5IGltcGxlbWVudCB0aGUgaGFuZGxpbmcg
b2YgcmVtb3RlIHdha2V1cA0KYXMgQWxhbiBub3RlZC4NCg0KQlIsDQpUaGluaA==

