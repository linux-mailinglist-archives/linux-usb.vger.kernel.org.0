Return-Path: <linux-usb+bounces-8454-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA34C88D6CE
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 07:46:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB4061C25C6A
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 06:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F561F941;
	Wed, 27 Mar 2024 06:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NBrDme5s";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BRnS4kLy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="I2lu5h5J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34FC4C9D
	for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 06:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711521984; cv=fail; b=DDHAaUjPcjtlvB9LmkkUEL1VIdG73SZFNO03gEzZ6XPV1RH0n/tu45FtjkGQ2PAsbW7Y9lS2g/3KdGtv+fI7poUpV2Vo2KaZHVasjYNy/yTFpP9WRnr0DkSeYJMXMYCqoWzCyqKpnL1GPxiY3fSyZrKAHuQyjF6ChLg2f59TwHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711521984; c=relaxed/simple;
	bh=OhAiOhRTlF7/sKshCAwcHeVVOlPP0wz+AZNml86oRW4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oop38Q4R9FzQsewkyNXs//37R28Xssj8NZNyOoPr/K2olgXdCeIPjDtr79sarkTx16mTRlXzM3OnnewP1hZMFUStvC54dDkI8srAR73r+4x80I4MNwaKC5IZWfiqbk5KoRuoCil+WWajLf5BtpMDLMJ3iAJp1mycXwK9TdwEZVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NBrDme5s; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BRnS4kLy; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=I2lu5h5J reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42QNvjD2000894;
	Tue, 26 Mar 2024 23:46:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=pfptdkimsnps; bh=iK0O
	0eJzOPIMF9OD7rGWV5RrKfmRDPe81tH5IjsBHC4=; b=NBrDme5s5C3EGSHT4Wle
	Hh8OtSBSGRYyN3BUkNN1tDem+Rc59E3EJN8VLLIUiB1Us+Dfil296fCDAKsrR/0N
	HcY0dIr952cdWiGBjW5lfQqAVY1B1kdDKpBI3xqjypepTnsYXGPKcd2q4mYpU2E3
	38mTEpEKT8HNNEi61Dka5G6S02UNVqpr2Kw0hT6RKtZxcNFE7ndhiYvqJxl2PoMT
	FO1u6pG5zN2VEbhzgEp/8Gz/qwOcDoovDfnxO1pegBfYVLf8PwKJ1XmJ//jUcwro
	cZla40aoY5idXXqypY3BPqKC1fwMEp/8qrSM+Q+j3C0+TedXac0vTykBjLFVgG33
	WA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3x3b6g4aa1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 23:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1711521978; bh=OhAiOhRTlF7/sKshCAwcHeVVOlPP0wz+AZNml86oRW4=;
	h=From:To:CC:Subject:Date:From;
	b=BRnS4kLyBNwe5zrGayrJC3QYN3k04oHf96MfJlg/vP2yq0A2vFLuVXyehYY7w/ahw
	 9tiuRIHLvmGh4qzqH3P/L4cOBOF/OIwIZr20EYQp3XOukfRLRBdA3wJUc2s/IDBvb0
	 9Hzh1m8cuSjwY+A4Lpi5gJOJeUZfvp5MhLzkxi5VHPpwyOstCXxpvJRtngIizHpOH4
	 oynXom9IIRRvySvTRW+umGautZRkwoYcfs6e4+uQkJHRqJ/rMt8GyXAu1HcgXxAHwH
	 FE55ZPaGENzKrKiFDtreShTA4h12to+1Sj12m0gT2DRzRgX5/TVNxvvCYnip9Ix7bi
	 r2Y2JV2BEcFkw==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6159940353;
	Wed, 27 Mar 2024 06:46:18 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 032EBA0075;
	Wed, 27 Mar 2024 06:46:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=I2lu5h5J;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id ACF5440407;
	Wed, 27 Mar 2024 06:46:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyJkP/iPE89505oH1dNQlrMwAcdjF6pnU2mZJqGS1Bw2BilBsF7odOg+GSTpYrBQMI4WyoDIg/vmz3O+LSZsOk0unqh4DLoy9MEfi3JSDUo26a/TQO1n/fS+BOZSDKrEXfZk5wDSuoB/TyhPOcx4t+Zkf6RcHAJt9ZU/aAIKWxeDIbZdarDRAPTzCA3fA52+98KeRztKVu8xOtW6DjjGQh0ktNJvkFi96PhpGNTqKmR8SkOQ7Ay7OYBDcqwVUxSuvRcwyL2aF25B8/X/Fk39DmN/WKHCemTd6HRxZMCqI8O3YkqqwEYWyWoXwNh+3unoZkQEMpdxQIHMBfdF0+3pwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iK0O0eJzOPIMF9OD7rGWV5RrKfmRDPe81tH5IjsBHC4=;
 b=Q7IoilEgKoN73s9lUMMy6iJnfOF7ua9+DU7noseS8Sc9o7qOcDf6pbQt8egqUvThnmiPYZxSnwcioxDgBUFoDjW2mgsI78Yaaso1oq5MRHiZrrGGCK8OWsDUDq3rcOcKNgroJ1G9g1Wbb5Xb/vnhkXiBnNB0vLKgJsCo1/UfBamGClz1VTkeY/GQAPT7/eCMd8fX9lagQCPlyNiZFJrbWydA2HCFV2sVhqTujw8hP/KVQBnsXiAL2vN7+ZRPr6dCuhQzJGbMC5Y+k4GiBijr4LIa4V0sNQI1kKTewQYK2u3MqTJyfeuOCaQpQq5Ayo/6MbAIBjTQuKHAGNmbX7i3ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iK0O0eJzOPIMF9OD7rGWV5RrKfmRDPe81tH5IjsBHC4=;
 b=I2lu5h5JiT6Ub0dmuVUnTMoy2FUMBIZzrvKtx2R0pAoQL9QQBgcdnKmDTbLG/GepijuO+t5/P9b6XKEoxan4+0VXskUNZIoKD0NfF+WbBlZD6QHTxzCnUagB3McjkhnhpEFG5AGtcBHuxiIWPG9zSfOX32DU1vkF94EiclkGpHM=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by IA0PR12MB8745.namprd12.prod.outlook.com (2603:10b6:208:48d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 06:46:11 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b%6]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 06:46:11 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: John Youn <John.Youn@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: [PATCH v2] usb: dwc2: gadget: LPM flow fix
Thread-Topic: [PATCH v2] usb: dwc2: gadget: LPM flow fix
Thread-Index: AQHagBJ0uahD3pjlD0CC5zMYbqnQZw==
Date: Wed, 27 Mar 2024 06:46:11 +0000
Message-ID: 
 <c263e2ce619774ec73765e33a1851a5910797940.1711520623.git.Minas.Harutyunyan@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|IA0PR12MB8745:EE_
x-ms-office365-filtering-correlation-id: db44607c-98a9-421a-3799-08dc4e299726
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IzZ5St4WKDN1okeNI39Hfrzh24QUv0UAe2ak6U35i+94hDTiFT8yx8hB3ej5LmbGWIIipHXPeTt/TJ4pg6w5Lt1JFP5vTY6YulRJlp2VMxKhPnmgDLI4ht9u0L2pWdSrJ9XaLUxq1l32kbiejN/z8ziwF5pDlsoAJhDuRUadE5TV+Lb4eM4CFhauFf8lGoB0R9PQJ6uLck1yJaBDYuhf1DYyQSmnfiXX8pQHTb5nn4SepWGFrQCcIjovBQoN4ax2G5noIQ8lc4Mj22N+lMXtV/LC/BzXaDs5n/l4kVfNuPXYTuTO6ai0WLetdRyiHjzXvzXBsRan+d8UG8kEJnMnmuB25ZOCNtLpnV6TProZ3u1LqtF+m75eGuohxxflSLjM5QZMxEcqtAYN3sSQDI2IqBrgpQ2WxAyUzR72bdzsTpQE2n1n3ryDtf6qMJ5qJhGiLVow2WxtwEpIy77ijl0kC1EH42ilAIzQDGre+IUoKfbFWJ/uVhg8sj0UX9NwV+iWxeVXs4fE7quEwDXesnGYW9uTFCk42Z75FyJcxClAzb0aEkYOXGFTCGPwZQvDK61XGuh5BoIY3LOzfAWrydGetNeHzYHWqcRgbTrv8bloGTvd20UeWq22yG0PnpVASW+LFT0IpxfaYCiOS59X8oKW5CLBfR0L708aJunlfCzGUSb3P1XMUUCBzl0HGIUqIQmkLYZdJZ7ehbixP7wRhbS71kSO7VIU5AgoXdVMJvRnp3Y=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?hFBxpsrnDoJj1xWEB5InzFJGHApGZygGBw7gmq4HO079WM4oYlwnUW/pv/?=
 =?iso-8859-1?Q?cW1R3eJ2dEllfsA8wkShG6t0g/nRzRRVtFa3lFC+RH+4ZPhz2Z5XQ3Hk+1?=
 =?iso-8859-1?Q?hmrxLgBjf9OzyEMTtjKio08By9ft5rpZEpNoEx5x4diAkIkNIIg/YLZFC4?=
 =?iso-8859-1?Q?4sKowkOFic3TZnUu9xG13dkggqPrD5KX74Jg8w21ySA0b73Gnfz4drQsH9?=
 =?iso-8859-1?Q?4EUMcsg808OHY+yghfdq8V48iEWaKYlf1mPLgSbplh1/PzOmuR2v9pdjCB?=
 =?iso-8859-1?Q?YCPaxM1UbYkANM7eP6fmQ6DJzGqKlkMko9tjnWokS+6Ypk8cdeAM33hazi?=
 =?iso-8859-1?Q?/9S0tGDfEDuUDJWYLgrnMu4iEyrJopphYbagSZ+P3E6XLO3xo0f2q9Spmi?=
 =?iso-8859-1?Q?7th4MkVZNsiEzAoUcKnxf6JhMerFpN5tnwUhZPGcodfkW0vBw1umhqTvit?=
 =?iso-8859-1?Q?1Ri0sdzfxWnrRIFmSMHai13BrVLaj3NN2YoObyFJkHCjeSBN6UVanqgdpU?=
 =?iso-8859-1?Q?fQ/Bpe8Cg6Q71MKZuH/3bXo2kBNq5APwmwy2JKEx49q3XMs3E/794HaRtw?=
 =?iso-8859-1?Q?uWu29v5Jk8pnk1y0E8BE9vSlMOy13EgWuRxz5mCXDtYzvbccAYs70UAVZ8?=
 =?iso-8859-1?Q?s36F5OcosXPAeh1/6DC3f2yGqwnvecwnufzbCnVQ2RgPdYW6A5mW65156U?=
 =?iso-8859-1?Q?uNPv7j4Pt6LvhBFnQWRgJ406yFzLAt3WvahbBED2khD3kXNChKn6E5n97y?=
 =?iso-8859-1?Q?21JZe/voeyRr1aqezqnm4BsojyV0khD0QDqrRRY25SorRzxsY0Ixa8EDvP?=
 =?iso-8859-1?Q?0hiTGL3PTDsANLjrBOSIyzL0wqyuOqxNErszEXPz3gR7ewULb0qHP8yeCn?=
 =?iso-8859-1?Q?P227b1Zy9qPq5eKJnCxEiIPY5BYX9SPpGkYxJs8H6fjRHzRx2Mwn4suFXW?=
 =?iso-8859-1?Q?RKf7KtbOO5ylfLVKDO+6eoDTGD+lyV/TadMxYA1gk5WQeqLZFWIVUq+bf+?=
 =?iso-8859-1?Q?LMrAPwIB28vgrrxNAU/j4SKnn6VeJiNScucKnU78UUWtNepzjsR+2V5PNP?=
 =?iso-8859-1?Q?bnW9zdEOxroiWDVG7+ytaxdF8wj0cdsUq8kpGjmYHSvfJtu84Igtpmu6sz?=
 =?iso-8859-1?Q?KWFkW2MkB7xsocVOop71V+i6lIcxT7THpo5p2j5WdXiGcIMafqk68izMSH?=
 =?iso-8859-1?Q?rPqZWeX6JcPj3wsfrecw7+NrO4LE758nuJ3oHimJdPimz3T4ZZz2AVyH8h?=
 =?iso-8859-1?Q?RK9B8bOdYMXeIXRWsF0b1nCsGYyx78hCdFnT+GQ+KyBvCUgRXDfQQmSCC+?=
 =?iso-8859-1?Q?PyNlVDykworL4vC9pUdYpsohbBw2C1BlU23lWI9Pyet/7YTY0Sf8F1qKdm?=
 =?iso-8859-1?Q?HOH9JUwYUZqB9MfjqP4YI6IfwNvyWXl1fHgPvauHnKKbG0kK0dcujOXPEb?=
 =?iso-8859-1?Q?Sg+6iWSayX2vX8kYlTb9qRthQ21FsXYbtWexFCgDYHFjM/dGQ/wKcJxb6V?=
 =?iso-8859-1?Q?51jrSQmqv/kx6RZ+4rBdyH5UMmOM9EzjPaHeGMneqelynF5a6s+8E88t6N?=
 =?iso-8859-1?Q?CVoLrfsPONGwzibKF4pJWYiv7FV5GTiqHMoMO4rTM8UTph6y7smHjTVsIt?=
 =?iso-8859-1?Q?bzVx/pWixDAO3ar1ttRnm0z0YvQhS8bd5Y?=
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
	YOaJu48L0ueMuhG+0pHpMWjzk8qry/29jPPDEOYhybJ+UR7wibpS1jK9+98dB1ab6LDv5t3t52u+OacEAeXAGhLAzmgs8Tm0F6kKBhMevs/8ddk3q+Wc2/aJYJVE0BDcLTRl8pa2ADABjyL+gXRREsYodB27T3KiAX59VWWEEKV4HI7bi3hq6pTuBkGs4TgtYOinWr8FZOVCF/r1ZmUbaHy38Eh7AvCeXGTRDfWJ9IdQFCmYTRs72SPmgBce1JYH0yInJWlsnLAfPeeEuUMDRSv/mb/kYj7wnkQFHNhh1cou3tHc/+LQSoK21D/wntp5bwM9qXiPbulhE4oEjDEkNZZgRleKE8MP51rCRreO3NRAwJBx2ZBASNxFpCRH3AlzaCeFBpqe/NbJlP53rMNPFJQT5GcQEMwyJaR4ushpfH3RlmbZ/BeSObLQDqrnyjAQvmW6H1vFxO1SuJ0lZdnBSTRrSqC5eEk4WOACnpV1Xm64Z5QAzPxIViMI7++0j/clh7yF+b/RU/O/4UKfyKxaAE9g0tDMFJ7qKe0GAT8J0Evy00uYzVN+TcRvlRyWguuT/GrPoKuFjxHdDSXs4Wolpa0DmPz0PJhob9IqrlFI9X2J3Be7/ccsU6OPBnBpwwRd/McAgWwsZvi3NT1yLvAiQw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db44607c-98a9-421a-3799-08dc4e299726
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2024 06:46:11.5956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kXvLfrAapF06DP5kzyFFE19ru86W/4/UHy2sKX8FzLfe+Vdbf2fQNyhnInXSJcbqTA+vbvU8jhmefF6cP2H6aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8745
X-Proofpoint-GUID: FDmowf8JcI7qU8cEBOdwyxd-NCxdoUmX
X-Proofpoint-ORIG-GUID: FDmowf8JcI7qU8cEBOdwyxd-NCxdoUmX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-27_04,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403270044

Added functionality to exit from L1 state by device initiation
using remote wakeup signaling, in case when function driver queuing
request while core in L1 state.

Fixes: 273d576c4d41 ("usb: dwc2: gadget: Add functionality to exit from LPM=
 L1 state")
Fixes: 88b02f2cb1e1 ("usb: dwc2: Add core state checking")
CC: stable@vger.kernel.org
Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 Changes in v2:
 - added "remotewakeup" parameter description

 drivers/usb/dwc2/core.h      |  1 +
 drivers/usb/dwc2/core_intr.c | 64 ++++++++++++++++++++++++------------
 drivers/usb/dwc2/gadget.c    |  4 +++
 3 files changed, 48 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index c92a1da46a01..747b69d390b2 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -1323,6 +1323,7 @@ int dwc2_backup_global_registers(struct dwc2_hsotg *h=
sotg);
 int dwc2_restore_global_registers(struct dwc2_hsotg *hsotg);
=20
 void dwc2_enable_acg(struct dwc2_hsotg *hsotg);
+void dwc2_wakeup_from_lpm_l1(struct dwc2_hsotg *hsotg, bool remotewakeup);
=20
 /* This function should be called on every hardware interrupt. */
 irqreturn_t dwc2_handle_common_intr(int irq, void *dev);
diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index 158ede753854..e9c95d241850 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -320,12 +320,14 @@ static void dwc2_handle_session_req_intr(struct dwc2_=
hsotg *hsotg)
  * dwc2_wakeup_from_lpm_l1 - Exit the device from LPM L1 state
  *
  * @hsotg: Programming view of DWC_otg controller
+ * @remotewakeup: If true, initiate remote wakeup signaling
  *
  */
-static void dwc2_wakeup_from_lpm_l1(struct dwc2_hsotg *hsotg)
+void dwc2_wakeup_from_lpm_l1(struct dwc2_hsotg *hsotg, bool remotewakeup)
 {
 	u32 glpmcfg;
-	u32 i =3D 0;
+	u32 pcgctl;
+	u32 dctl;
=20
 	if (hsotg->lx_state !=3D DWC2_L1) {
 		dev_err(hsotg->dev, "Core isn't in DWC2_L1 state\n");
@@ -334,37 +336,57 @@ static void dwc2_wakeup_from_lpm_l1(struct dwc2_hsotg=
 *hsotg)
=20
 	glpmcfg =3D dwc2_readl(hsotg, GLPMCFG);
 	if (dwc2_is_device_mode(hsotg)) {
-		dev_dbg(hsotg->dev, "Exit from L1 state\n");
+		dev_dbg(hsotg->dev, "Exit from L1 state, remotewakeup=3D%d\n", remotewak=
eup);
 		glpmcfg &=3D ~GLPMCFG_ENBLSLPM;
-		glpmcfg &=3D ~GLPMCFG_HIRD_THRES_EN;
+		glpmcfg &=3D ~GLPMCFG_HIRD_THRES_MASK;
 		dwc2_writel(hsotg, glpmcfg, GLPMCFG);
=20
-		do {
-			glpmcfg =3D dwc2_readl(hsotg, GLPMCFG);
+		pcgctl =3D dwc2_readl(hsotg, PCGCTL);
+		pcgctl &=3D ~PCGCTL_ENBL_SLEEP_GATING;
+		dwc2_writel(hsotg, pcgctl, PCGCTL);
=20
-			if (!(glpmcfg & (GLPMCFG_COREL1RES_MASK |
-					 GLPMCFG_L1RESUMEOK | GLPMCFG_SLPSTS)))
-				break;
+		glpmcfg =3D dwc2_readl(hsotg, GLPMCFG);
+		if (glpmcfg & GLPMCFG_ENBESL) {
+			glpmcfg |=3D GLPMCFG_RSTRSLPSTS;
+			dwc2_writel(hsotg, glpmcfg, GLPMCFG);
+		}
+
+		if (remotewakeup) {
+			if (dwc2_hsotg_wait_bit_set(hsotg, GLPMCFG, GLPMCFG_L1RESUMEOK, 1000)) =
{
+				dev_warn(hsotg->dev, "%s: timeout GLPMCFG_L1RESUMEOK\n", __func__);
+				goto fail;
+				return;
+			}
+
+			dctl =3D dwc2_readl(hsotg, DCTL);
+			dctl |=3D DCTL_RMTWKUPSIG;
+			dwc2_writel(hsotg, dctl, DCTL);
=20
-			udelay(1);
-		} while (++i < 200);
+			if (dwc2_hsotg_wait_bit_set(hsotg, GINTSTS, GINTSTS_WKUPINT, 1000)) {
+				dev_warn(hsotg->dev, "%s: timeout GINTSTS_WKUPINT\n", __func__);
+				goto fail;
+				return;
+			}
+		}
=20
-		if (i =3D=3D 200) {
-			dev_err(hsotg->dev, "Failed to exit L1 sleep state in 200us.\n");
+		glpmcfg =3D dwc2_readl(hsotg, GLPMCFG);
+		if (glpmcfg & GLPMCFG_COREL1RES_MASK || glpmcfg & GLPMCFG_SLPSTS ||
+		    glpmcfg & GLPMCFG_L1RESUMEOK) {
+			goto fail;
 			return;
 		}
-		dwc2_gadget_init_lpm(hsotg);
+
+		/* Inform gadget to exit from L1 */
+		call_gadget(hsotg, resume);
+		/* Change to L0 state */
+		hsotg->lx_state =3D DWC2_L0;
+		hsotg->bus_suspended =3D false;
+fail:		dwc2_gadget_init_lpm(hsotg);
 	} else {
 		/* TODO */
 		dev_err(hsotg->dev, "Host side LPM is not supported.\n");
 		return;
 	}
-
-	/* Change to L0 state */
-	hsotg->lx_state =3D DWC2_L0;
-
-	/* Inform gadget to exit from L1 */
-	call_gadget(hsotg, resume);
 }
=20
 /*
@@ -385,7 +407,7 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc=
2_hsotg *hsotg)
 	dev_dbg(hsotg->dev, "%s lxstate =3D %d\n", __func__, hsotg->lx_state);
=20
 	if (hsotg->lx_state =3D=3D DWC2_L1) {
-		dwc2_wakeup_from_lpm_l1(hsotg);
+		dwc2_wakeup_from_lpm_l1(hsotg, false);
 		return;
 	}
=20
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index b517a7216de2..38cd91bc29b4 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -1415,6 +1415,10 @@ static int dwc2_hsotg_ep_queue(struct usb_ep *ep, st=
ruct usb_request *req,
 		ep->name, req, req->length, req->buf, req->no_interrupt,
 		req->zero, req->short_not_ok);
=20
+	if (hs->lx_state =3D=3D DWC2_L1) {
+		dwc2_wakeup_from_lpm_l1(hs, true);
+	}
+
 	/* Prevent new request submission when controller is suspended */
 	if (hs->lx_state !=3D DWC2_L0) {
 		dev_dbg(hs->dev, "%s: submit request only in active state\n",

base-commit: 539f317ea7321225be4508975fa6dfbe2281cff9
--=20
2.41.0

