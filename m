Return-Path: <linux-usb+bounces-18342-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA799EC0D1
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48D6E1886355
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171CC17578;
	Wed, 11 Dec 2024 00:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="sQAudNzU";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XwOna5Vw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="avcYYO6q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CE12451C7
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877179; cv=fail; b=JShZY/NCZE1b/NJETSeJmZklbFOafkv2A3yeI00Y5BEsBgtABH4JWp0X6rsT2UwUELgyiKHquO9i+KAaf/bygw3K9YUfS4eYCBnOTZHw+CERad+aONGwl33Swtn0CNU7PeYp6olRtsdjqtdRJGsrpnkpECqYUutd5wmltBauVPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877179; c=relaxed/simple;
	bh=RcOeBBBwWqfy4MYs+arpbL0+7CgUK/nt+yElenYYZPw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ri7sQ0ADMboCr7HwzIVKwHklo6IGvEvwGlbxftnSlt5GaBh+KuBxIGQlYO6A/FAfbJmai3+S9GYxn5aTAnFZZlVJcAn/X7HP0q4fkHUrvWDaCiLNshE6IDUDyrzJa+tpJJwXnS9rGx1FKDIy4PqhjzAJQGMu6kvT0pAOLGszKYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=sQAudNzU; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=XwOna5Vw; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=avcYYO6q reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAMb3Ws010915;
	Tue, 10 Dec 2024 16:32:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=80tY0UKMjAO4raiEbQV8Vm6524cZE04pqCa5DqkOm1Y=; b=sQAudNzUYGGz
	cC8koNnMB3OWk0GN8bahtf+5kZBCqnVPniEVraLtMoRWlmouz+bz86IxY4Wtxgon
	cige2IjX7ES2EXdQRB8a1gmr4/1xBgrUBL9s0ywzn8heEczMIRg2GAzLZP3ZNrrU
	pR3O/57bC5Oeik8lGAPEpTFELSDpRLJbV0EjZQX7CCMOOsSp91aQ80xWqurfnC6Z
	EUxazk8AGFXShNL6MYR54b73jGVAmdtYEeBoB1qZrzudKpmgpsHe1QNi3tg17gyg
	VKIxoQQ5bUG6jkRHlh3YalufUdmhETqN4iw6RqotjJDZkEHmxRIoXI76b75aIncf
	yhIAI3Fbqg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43cpgb9px4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877172; bh=RcOeBBBwWqfy4MYs+arpbL0+7CgUK/nt+yElenYYZPw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=XwOna5VwkFGK0lzckHLGzszE7I4epSOh7ZIJRgcgWGsfrDZPLfJYNewv8zlNtBXJf
	 vtfuYcWHdvD8s+TycTurwaCJdZnhIY6v9GyevxUk+++ektS+GSYi+Z/VRTI34WzbXJ
	 yPWLSkqhNQZfDiQ1ycXlb9OdjrdNbcRGhXuYrASFZYb/yGi77QPqoFU4WN3qN2Ua3v
	 rN6egs7ZuSlVD7Vpp4xIqE5HBcXUKm+h1wW3oRmMqvdskfbX3YJcMfMPzDditydyxf
	 Tsp6cCZqw2uNyjvp9lcMKphTe6lzM9Y5sGdPBnDTabs0FrAPPWQ3EfzO+au2idheUo
	 USADNr8egiRRA==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6268240175;
	Wed, 11 Dec 2024 00:32:52 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 4BDADA008F;
	Wed, 11 Dec 2024 00:32:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=avcYYO6q;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 10ACE4052F;
	Wed, 11 Dec 2024 00:32:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJM7dg3RsCCMT/epTaSZ8M4t+S/Jmn7MS496RMG1st7/zsVx12QH3mO+F2Uqs70Hcd/E9IAYtAK7uz0VnuUJxEmwwbAIygB66jdDqyHO5zqun8nW38Ga+17iL0+WHFGo/0MNVXR70umxg1mJqAsNdpB0kTxQbJCc/kaXjcxwqjic+2p+2qqxPcoAZ4rDusjnzSh9KHtoqmm9hSuKuteKCGCB4+9oWZZZ7v65W8Etk2u8Aq/WQ54VxB0mS8IlE5q5E5ymyqY2dY257Cgv0mkKqksgCpigG4WPBiaSH9sHtwkDMc/ylrTz5aWJnBcgmW5hngxr0AMs/G/+wx77+lCeyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80tY0UKMjAO4raiEbQV8Vm6524cZE04pqCa5DqkOm1Y=;
 b=cqiacYd9xKRJCzMB/90+gIopEcBqMvw//TlUMEoiwi0ZGpJXcALC0ayOuNcHfMwZ8HQc9SXIo8vJcU5V8O1O27rerUg/hcIeyq+gwduYQerXhG2XTodHds2c5Inlzd/SZqM0QdkRUXDEGnAczL+Gb4pCHO+PnGO1lSdyDo1uH/2YNofU9NUdxADhcF1dncfErIzJzNrxw0GqLRETCQo/b4COwBZY9p3RevRQpRALsRE1kpsuSFfimZlSud/AkqTwAPynvas0+E0hX1ycsw//uQSpqj6bdlnAzFzqrf6KcnDn3n24NSrZVyTXWwbofozk1+qUwsg3r4dxpPf5fgsXAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80tY0UKMjAO4raiEbQV8Vm6524cZE04pqCa5DqkOm1Y=;
 b=avcYYO6q43JLBNKs+r+Hnnkzb+aPSauGV5dmkssMGc0XCfWc3A6ewJQmpz/07o6T2es42hL2Xn4CpkNuBLRcDEO2laJLnY6gkw7Xwg9MufK0qPNl2qpPn7h4eVOEYJHolnHG2pwyl/JNx2mfAq1We0un/tOXBl4fk+ccb2q0n14=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 00:32:49 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:32:49 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 13/28] usb: gadget: f_tcm: Handle multiple commands in
 parallel
Thread-Topic: [PATCH v3 13/28] usb: gadget: f_tcm: Handle multiple commands in
 parallel
Thread-Index: AQHbS2Q07f1OVqmN5E6uNHSroA3rsg==
Date: Wed, 11 Dec 2024 00:32:49 +0000
Message-ID:
 <933cf7191b672bf4cfbea4df19af1b08dc1baca9.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7635:EE_
x-ms-office365-filtering-correlation-id: d794403f-920c-4c05-bccf-08dd197b575a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?zxbJJYjWLy8zJb700nisydwjciPIMoLOKJdcksDzRnvdaHLLC+FwZ1delD?=
 =?iso-8859-1?Q?UjHFMHSEx7RTki0vC1/SsCx4Tin6kmh7XSCC1Vk3Y5L7WJ0ceUN+kWM4CS?=
 =?iso-8859-1?Q?a7zMThZ/piK2kWEiqCAPRbdw4Fjr4BXDc3om6OjUgQxyd5Jl94uFGK36i/?=
 =?iso-8859-1?Q?r3hvEWBVJ4iEhHbNhne0eNtM4dz8O0E97cOYDUX/GFva2pdqsjuiHclUtS?=
 =?iso-8859-1?Q?lY8xLPN+N5Y3N5JMtU2zsg66792JrzuSRzZpe7d32I1CtZYWg9s3T29/HZ?=
 =?iso-8859-1?Q?jb3E3u15twC0aJYCACC5LeUYCLAZc3zGebO21tCA2uA3s+Rs8+hUq2uY4i?=
 =?iso-8859-1?Q?ebmbFtFdIn9WTdIMD1DNrJC9fJ7izgr0+1V3j+XkjGQHo8brThL4TvSMUD?=
 =?iso-8859-1?Q?OWRGGSgkP++P2NjaWSXH8IbzXDXd9wu9NFTyWsN5aVfn2vJWCBrAKXkflO?=
 =?iso-8859-1?Q?7UsCekAo81X+Yd3+OWH9JuMvTAI2c6hOnUiG0rMcTnlyDAPmMmoQCKEmc7?=
 =?iso-8859-1?Q?74xA5JTn6dZQLKFVtmZvdHSohNmPxzNSwBXQO9KKQrGISP3aGHLmL2GR6e?=
 =?iso-8859-1?Q?Jt1v78EAl2pXjTHqiVK90KbAy0EjIHJH+hvBmL/NtB6mpvAGqFTY0c0lll?=
 =?iso-8859-1?Q?VWmCXdpkXxZMcBjuSi9EcqcNPuXVLcxAqPS9biTrI2uAFQLg7ryvOaT/cm?=
 =?iso-8859-1?Q?80a5ltkpE5UhqcUAlYejZhOJNCrpHwB+eaEzj6/zN8DJ3UEQ2kMGrjl7B8?=
 =?iso-8859-1?Q?9gB9/V8uxJQMenvzYdJd22nbVG0xpZZ2HboYGchqsIG2ls5vI/ZxB9ZLRx?=
 =?iso-8859-1?Q?S1i2Ub6ZPrEum63NyUQyMY9sVBLIIunqYtdj/24u75IpvCSOUqrp3ES5ok?=
 =?iso-8859-1?Q?mZqHvWP2UMRg48Md5zhMkGvk6NFFUFZnBo4jbcwkHN7Sfrxm64JvtM9O+N?=
 =?iso-8859-1?Q?aovBg488gFjNl0KXp3eoG42ccGYNx29Rs3a8uy+irDhshC5XAjrxzpQkb+?=
 =?iso-8859-1?Q?TsLtaEn15ZSCOKaAj1FW10O2k5v191k3hCEvMdsP/T6JXXsPSPv2HXBsHu?=
 =?iso-8859-1?Q?KsVGlJfz52noeo0IvLPXD2QirSv+dLZrZmhFtMLXe15jWLT1JN4f4ONjaJ?=
 =?iso-8859-1?Q?pzRKxvu0HtdzfJSvBdUNqWzjp2lOSaajgijIBV4FIaxlot84ZRZ9Wy1hcn?=
 =?iso-8859-1?Q?e62z4CAkCXA9EV0H7s4xwDZqMkbMpjgjbCjKfEp2bPwycL2B2KCxCST55Z?=
 =?iso-8859-1?Q?RYxe7lyu3tTwRVPGltmYovG6gCa2Y/2GevbAmd6uWZi68wMSGAlTnusajP?=
 =?iso-8859-1?Q?cp4A0vh4+HTW8SCwO0ZNFdNwEJEJ/jS+9HADCsNh9oys3eb1WWjIs3EhUf?=
 =?iso-8859-1?Q?omHw+xRTxQS5Ed0yJI6s7hBNWOp12OdMLsNsVkaeRSMEp8ZMeZIBeypiqg?=
 =?iso-8859-1?Q?76QlLWPsGsSGstDGIs6xWkEJLuwAUjl5p0Nekg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TUMlI4YUcnv250YGR0VRl6cwFGIFqyiMjRrMGDg4Eq6sJxougwogsjnL8g?=
 =?iso-8859-1?Q?poZi/mpxhfh2+FYjs3/m4k7jUSp2SD+X9d/zOqcrSEjJ4uEvuPR1Z7SKcm?=
 =?iso-8859-1?Q?MmqB/j5Z2bjQ9yaw98YnrDptubuzGgw2vGRVl74n3N8UDMkSdOcYN5AR5s?=
 =?iso-8859-1?Q?NHqlnqVr0HCUsE+lqx9RRwGrt7Bj/azphv7oWy/JhPCXginhXJJdLzG4+u?=
 =?iso-8859-1?Q?MOG5Y9RKITendk4XsNuL4BurNOTg9XIIDHVli7DlB2K2Q5fcrENZAAMPA4?=
 =?iso-8859-1?Q?cC3yLnvAVGstwu5ouU2NoIC6exqCA6Tbsj2hw0jCAcOsS4/YrP8elvwIJM?=
 =?iso-8859-1?Q?isMuV8pA1LN3E18akTzdrjZ0GgbsPQ2UeNOOMo+02jba8mPDj9YWhkhGbN?=
 =?iso-8859-1?Q?tWRnRJqUnxjroQOfCo3nnMVMk4e7Mt9yDxRP/QKC5bWhy3GLB/jdNbMoms?=
 =?iso-8859-1?Q?IEOFg4WEPm0dBgNqrr3lIY71emZs4wwTgu2H203WcSazx5n1uWOrcdCX69?=
 =?iso-8859-1?Q?sGiIYgfS+h6Wjkw+wMOmNbk0SgufdJeSxs31zTtOWNt0YHv4FsvEHY84IL?=
 =?iso-8859-1?Q?2wRQ4cWC9ROGTf+7EFjJu97ZNgoyfXRRbIxD/2UnM27LdZGZzF5IUBC+W/?=
 =?iso-8859-1?Q?b9bYWy9UAwfBMIBko7oJiosR62uMUmbedJp7jKRXQoBLmbrCA1va8y8d/S?=
 =?iso-8859-1?Q?bwx0b3LVr32v2GFGT1UFpZvYGjxxH+FmgBmqsaB352phUBsyiqhURkLK4v?=
 =?iso-8859-1?Q?e4Y/0TFp3vMECCIC45L9azX3Fa97hg5T/RTHPIH3ilwEA20gozKzNOLMVB?=
 =?iso-8859-1?Q?N2neI0zsJ1Xtege+Gk6O/G7mqMa2z7xPe9LGtZuRfFI8Zsu4o3YLQoa+IF?=
 =?iso-8859-1?Q?LsUG7kanS9OMuScYeD4XPXcGrjWeu79CM3Z5YFfnMVY3EnuxWvu7/0mMlY?=
 =?iso-8859-1?Q?6yBn7/XAGGLcUBC5KDVgVS87pWODFTCfUvB0A8cjSf1L7V9XZs4Kqcshtr?=
 =?iso-8859-1?Q?F/rN3pg/kPoAhLLHGMDDz0Alti1u6GFO3X5GsV/EfYKPfrzA/t3/8vYkxs?=
 =?iso-8859-1?Q?MyZZI8XnKy46eAsTF7clTbVZ76Zb81fYdirnMWViF8gl5VZAD/ZTuxvmGl?=
 =?iso-8859-1?Q?soWFpaYPNAcpCFLbp65LJBlvHXiQXgQ0rIxLL+UDA2faGR/S0AIjWY1O4M?=
 =?iso-8859-1?Q?sl9H+LONnXZ7TtqWLJNNa7XNRtpVg+h0WRU7oooBj6tAHr7XslGmUuod0s?=
 =?iso-8859-1?Q?x+HkjUldU/fXQxrvJbKdPz+G95EOAD1fSESGAbvGhOfn71u/jUaUZdy+2Y?=
 =?iso-8859-1?Q?OFe5spWjUD1Mq7hmMqSEgPv41Jd3HF7f4nXZs44yq8MAyYpPJkLGTqsvq7?=
 =?iso-8859-1?Q?57e6h+tYwRiMOX7/kbx2mVAl+S62RtQxPnYSX0KxB71PD2WZM3IX8DH1aF?=
 =?iso-8859-1?Q?+hwekGGPQ/yNkmnNbm0wWvgiIp9xQlLR/oy5KcvDRah8xMK+IPAK4L7h8g?=
 =?iso-8859-1?Q?0vksKSgKB1GNNqeBliulnm3EDHaaGuz4IEHFvTDXK4dWm5hyA0lrJvZJXT?=
 =?iso-8859-1?Q?ZXVEYkibxyTkBd70M7+Akqg73IVwCtTZAUW9s97HcW4FwIfVmveEci32ZL?=
 =?iso-8859-1?Q?BzdJhf9NQlewLyauOAvQ3i87dfCKHmIT5Z+9FDDUfm27IA2lOzwxq8Ag?=
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
	+JZaIbBb0BY6Z2muCUkS3XJVOeFKN6+UY2op0eoXF1Ru+t4VLuBYpS2f5gGkbKPOkxuWbMRB27MFLvaNpbP5+v/+J7JjcHjhmXSdyHKSNrVoyK4oEj5NmBPoOQLvPUrdhi9FQNZoZLcnMcTb9UeHAGhnAbG445Rr6xJt39ND8htpuQGsAPfWJZaA5YRk72QQaqFl+yn1eaSja6DomJ/mGRKMsodvWAanxxbqAxa5YhVY9X5cvU7VuJmg4HuMehh9zY2Zxq6AqeYx42lvm2bNQACApPko5Q6ZYp+n2l4MP/IOIHBzvha1BvWqaejG/cezL8g1T+LsraNR3WcDOuh+1VBYIwhCzWXYtD4hN85kL9mvz8QCWTeYnLD6hWMTGi03mhsuUAFFTXTNyhAEf+kyut3PX5/hBWzBu/3B0nrPqx0w86iZ5aakgL4rcvNqR+rslXC8bO9RoTvDc4kPawIW+UWLimwa49JvB9w1l0Ukx80VAbsr0xfVZkdPX6tt4ZacOOXMWlqT9qGb6WTxtSV/TNNVcGo6N3nO02tLBFA030hI0KK+/DkegZCXeoMtmXOFbm4brI8gwdWzSNC/WQc7R52IRzee6YiqFxaDZmaaCvtd8u9JC10koRcT2F5XutHB5MtrwnpwUWQklh/o/Pjx9Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d794403f-920c-4c05-bccf-08dd197b575a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:32:49.3646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fGxokrtLX1Ir+R3H3jw6D5U3FC35mnMHEH57DljD5x7R3SCQJzTGKd5DUx+z7HD/UxNHbsLoUyMoJWx5twbDHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
X-Authority-Analysis: v=2.4 cv=d+8PyQjE c=1 sm=1 tr=0 ts=6758ddb5 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=gXydJFn6WctpvZIEjKcA:9 a=wPNLvfGTeEIA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: QpXg3O8t_Tg2YLbDfHn1kg54ccKYDyA_
X-Proofpoint-ORIG-GUID: QpXg3O8t_Tg2YLbDfHn1kg54ccKYDyA_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

Resubmit command on completion to fetch more commands and service them
in parallel. Increase the number of work in a queue. Each work will be
for each command allowing them to be processed concurrently. Also, set
them to be unbounded by cpu to improve performance.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/f_tcm.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/funct=
ion/f_tcm.c
index a3e886294c40..50e6a41aaa82 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -707,21 +707,16 @@ static int usbg_submit_command(struct f_uas *, struct=
 usb_request *);
 static void uasp_cmd_complete(struct usb_ep *ep, struct usb_request *req)
 {
 	struct f_uas *fu =3D req->context;
-	int ret;
=20
-	if (req->status < 0)
+	if (req->status =3D=3D -ESHUTDOWN)
 		return;
=20
-	ret =3D usbg_submit_command(fu, req);
-	/*
-	 * Once we tune for performance enqueue the command req here again so
-	 * we can receive a second command while we processing this one. Pay
-	 * attention to properly sync STAUS endpoint with DATA IN + OUT so you
-	 * don't break HS.
-	 */
-	if (!ret)
+	if (req->status < 0) {
+		usb_ep_queue(fu->ep_cmd, req, GFP_ATOMIC);
 		return;
-	usb_ep_queue(fu->ep_cmd, req, GFP_ATOMIC);
+	}
+
+	usbg_submit_command(fu, req);
 }
=20
 static int uasp_alloc_stream_res(struct f_uas *fu, struct uas_stream *stre=
am)
@@ -1309,7 +1304,8 @@ static struct se_portal_group *usbg_make_tpg(struct s=
e_wwn *wwn,
 		goto unref_dep;
 	mutex_init(&tpg->tpg_mutex);
 	atomic_set(&tpg->tpg_port_count, 0);
-	tpg->workqueue =3D alloc_workqueue("tcm_usb_gadget", 0, 1);
+	tpg->workqueue =3D alloc_workqueue("tcm_usb_gadget",
+					 WQ_UNBOUND, WQ_UNBOUND_MAX_ACTIVE);
 	if (!tpg->workqueue)
 		goto free_tpg;
=20
--=20
2.28.0

