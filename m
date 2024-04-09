Return-Path: <linux-usb+bounces-9117-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F4089D649
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 12:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3D621C238A4
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 10:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2939E81AC3;
	Tue,  9 Apr 2024 10:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IkxJTb/G";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jybAIxAf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="r8cgd5J4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888B081AB1
	for <linux-usb@vger.kernel.org>; Tue,  9 Apr 2024 10:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712657208; cv=fail; b=Www6mO37Wpype3gV9jbpitRLMDCGhUqk8pX6OZ8tJUh8toS1xcPXYm1wTJM+dHdFKLpPFg6hR+wNgQTDCoc5IGk8zQvXd9wxd8cjpUnX9jSjOcZ/O1v94VW0o4annJ1/dc3SBdtj0VB4kgOrcROLrB1FXPgA87aX08z+jq29pik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712657208; c=relaxed/simple;
	bh=JAmaHSnCUgMCVZoBqpJt2T9fuBwTfXQEVLitLwsUO+U=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FX33YBKCwVgQ0gdxBvfxwhTKSsSbVeTmWN8fLY9vU4ryN9tOGHmJPg8+w/xkbizamME7jWPRVLdkIrHGdsLtd6f4501mgtW1tvGgBZQE+Ry7/llb7Gz1scbnr3SbcQPPSzV6GsdY4QviRQfAJwYV1WWajfqw05g6hPg3nkn3Cfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=IkxJTb/G; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jybAIxAf; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=r8cgd5J4 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4393iZYh014074;
	Tue, 9 Apr 2024 03:06:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=pfptdkimsnps; bh=uiks
	0OJvQ4rJSCIjJiQlvwpJPLrdjXuVm/PHyKHtVsM=; b=IkxJTb/GY0Aaw//vaJQh
	yGlNpfI0P3FbRc9H5pd87byio07wjiODZjLZz4PwR9HiCuBkl4MHaYxIj5nmpe1T
	7vmSufMl8X3k/YyJNYIsP6gbTZwpxPTVGyDUvomgLNb9PdqHMIO252VvESGYmRtk
	ay668vTueUTwd8pjiILAAVXAcQ3AhcPmCxdkGA78ua7EvdYjUcyWyJnSyIp6Eqsv
	7F7XrS2cADijDS2DlOlbNp33XJCIsMq6MuxMUuDD2P3DdfSVUbfNYcmglMAr9QU+
	22iIimzVVHaUj5/fu+EL20pdUsZGQiELeHgOjTagPoLWixrGpYAJYbBUJnKhr7ez
	VA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3xb5n3rwen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2024 03:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1712657198; bh=JAmaHSnCUgMCVZoBqpJt2T9fuBwTfXQEVLitLwsUO+U=;
	h=From:To:CC:Subject:Date:From;
	b=jybAIxAfR2NT2DwEWLzjTIWRsUf+Ka8Jbkv3rcdXZfN/vz9bIqgxha2JefJsZR9je
	 4EUf77RWGZX7GIoEGXTVewbEE+YfS8W0eDiRMo6SnjdzP0vl00ln0IIGUHmUgMZual
	 PDObcYFn8yfih09nUAKSMr0UPIHJGG88GlvWoS9QUAT+4csJ0Q6D2vGVhyepXoCn8G
	 J5xqzFb0u4s1zOxTwqUgdsbejTfPeiuEi2sGedTTHbI7kkldlIO9cQ654zGSnYxqj9
	 HctUspIUjLdDHKlhdsUmlDgThjZziGVQ8HdbLZvIL7nLPAehyCSw1zAuglz/BHQKfu
	 544RMBzH3yO4g==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 944764041D;
	Tue,  9 Apr 2024 10:06:38 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 07580A006D;
	Tue,  9 Apr 2024 10:06:37 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=r8cgd5J4;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 74F72401F8;
	Tue,  9 Apr 2024 10:06:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQW0B/t4SHzcG0MJeWPrtC9jKag69O9ja87SYJ7wxZarWAkaA2lo+otJtrD+Bfdu29vXm3BPa5jZUiuAHSJFKouwvXOdejlKtf+zaCO1riBjR3a/VUPO10BThyDyjuBwdDWU8sfp3BFYE77kio9erAyLWf6G5RtwCWvQmhRq0bfq9Ymct/yXSdvXcXCOCiSmtnZa3l1YqL8l2zwpma12+/NC3TKUWqaSMFcM8C/XzO1TNFGMYvzPLo9q4TIqjb+ouSsJiMU1QglbTe6R+XvhMLcimRzGf9F+fw+cG/4jQ3qUt6xlkl+UKXZPOfp5PF06h7H7AZYf1L/TasPv6jeKhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiks0OJvQ4rJSCIjJiQlvwpJPLrdjXuVm/PHyKHtVsM=;
 b=K5HBZ+olmQKZujW8VZ7DfTzG7cscUvSnRKl3JMa7vTUgTGkcxCTk6BjORL9dhWdanWLVfcOSWuc2KJvKK1x0W4e4eMh0idtmbTbCR7K65lWDJTJ7asBRzW8fx99aYfQh3+1Z1xz7hswhe+taIXzLv3oPfCocxWkLkqjMSzblR19TKEXgMzSQTWf+4jQppyh4wuF0KbYXsqZy5R2RfpGjzIBu/QRa8DZhUdvkmEZB2XHiCGQxsYzPwtzzkEOBue42VBFoxccei8BjAHdy6Hu1y/LF7SGRNHve6tx/NyQQBS8g8UUW8weDbJGSsYMy07upEdgvL5fSPWxG8Vm/7Wxwsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiks0OJvQ4rJSCIjJiQlvwpJPLrdjXuVm/PHyKHtVsM=;
 b=r8cgd5J4V9brPT4QHwMYqEnEQCLA0nlgmPWULYLq+D6aHjw+QG9eywfAnRgWPYI0JA09Mk8IOxeZCF+NSMuk/DhiXtyJ1tKmm1TZCuobyZlPFzeAs7QNb0eYEYXJAQkGWEtkH14CgbbAVE5c6rWkvnfZHz0P90y+vARugbRAgF0=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by MW3PR12MB4460.namprd12.prod.outlook.com (2603:10b6:303:2f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.54; Tue, 9 Apr
 2024 10:06:32 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b%6]) with mapi id 15.20.7409.042; Tue, 9 Apr 2024
 10:06:32 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: John Youn <John.Youn@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH] usb: dwc2: host: Fix dereference issue in DDMA completion
 flow.
Thread-Topic: [PATCH] usb: dwc2: host: Fix dereference issue in DDMA
 completion flow.
Thread-Index: AQHaimWZuxHaDJEmgk6XQBdj0Zfu6Q==
Date: Tue, 9 Apr 2024 10:06:32 +0000
Message-ID: 
 <30794381684043b7083bb873d82b012254e033f5.1712656793.git.Minas.Harutyunyan@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|MW3PR12MB4460:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wzBpZI3kxQTj6nsMF01EkQSexXWVoIbaMMJnBLLLa6voBddeUDS9DlvOoL/EPRwlO2MfGUXRuL58HDNYS+kYy371bETp3Q5i8JEEMoyD077lSFh/lkMQUvBUXusPZGh/1+wcKbMa5htPq2jScZ4zYbRD7XKp17yAnfKP79c/wtxYqZRdOIMIAAmaNrdMxHkFUeuMP58+cb48QwHjFlgiyFFS15KZrb45GxOCrnuvsCKlyBb1uA99wr+uw1odn9hjYOHgq2V9O2an4uJEOXsiv0kqfms/R9qSvqqq5t9hi6pFkpOKOgCgP1Y813ykLO9JtNadhbb9eRDNM2N5EDgJ9oY046x3ZbEizU/yggycZ6eZOXjGDiVdcvFUu+TEtqiSnF2fbvaTaeA3mFWXrWtOyNcfq1kgEUIDRP6y91jZTJWWixo3uRCrYcYUrhQqbrviFRwjymvjFT5A2Ibw4B6TZJ1us9bt5N7Hfv6EfMT4htVO/bNQ3MSmK7V/XfPa1Cm842sVT+2uTMedwAEAPM5ecAAGOXTaq7ckK+B34sg8C2DjB44F5H3EYsC8VpWHZFiOo4MgBo2NvZ9AtOr8S+DldBSejgfm85ULWz8QsjFlMknPE4rLXp+K3KD7HTf/GXgMuTIbaxt170dMDTeazJHCHgeFwt7HWNlLj+u+XufWOFs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?dLQDm7Rq0Uqe5QDhIVu6c1OCaF3RhsFXdr47mhpEK79Xf60FgTdEWVp16v?=
 =?iso-8859-1?Q?J4ag9J+mHb/wmeWQGFMSLklfyxm6yfLmEnaU4fbTAuh2iGnmr1uBWMJdWI?=
 =?iso-8859-1?Q?E2gpR/cTQJmMQFY2XxRBR70U5kv564dNuoU07W63JEPsnAMZXN9kRT5wbl?=
 =?iso-8859-1?Q?msWFpBISHYu7nXTJnMVNmIg9syZ6bG89+KNOYccBsW1qldfN7tF5Wiu1cY?=
 =?iso-8859-1?Q?6e8aVI5zQc7vzTs42XEQ5JO0w0/LQvjY0nJAlUMHPXuQ3txNVrw2ONLS3i?=
 =?iso-8859-1?Q?FDATuMvjWLQb/cqA2B9X0VkcLRXPCxNzol6UQdvXo2DgPG0lwhjnSehNHs?=
 =?iso-8859-1?Q?ZVZfGXUNqv0uKaR5saKTj8szXrtmg1SbSWPIuegPOzTgPSobXGfiOu7WJc?=
 =?iso-8859-1?Q?KlBz2qz4nJ+1B7Ofq3pqJZlL2JOjAcT+2iNLFF67/rJ7xFWIeIQ7bDr0Sq?=
 =?iso-8859-1?Q?zx2/6o8foRAZWkVlE+R/dQJjT+CpBoSamqtO0zVHapuV1pgLzr9KkbnvW+?=
 =?iso-8859-1?Q?9O4QHMAyvnyNwJMjlK9j8SYL9kye4tT8wMiU1v5lP2HFFrijYq0w4yit3Y?=
 =?iso-8859-1?Q?GifXdXBBnyLK6B2umqgYQayDW7syrYuQxDqaKfzn9zsLA8bL8Ql3duLbPm?=
 =?iso-8859-1?Q?uDjcZf5fm5Sr5Opg3unwJzlHxlhB5SB3MjmerozedWFdAxcp6TVX6Sogmt?=
 =?iso-8859-1?Q?cahIDz0hBTYkhkMEocqqZe0YkheSowV2KharUFMvOAZk28aq52Hb9zLizp?=
 =?iso-8859-1?Q?wBgUyjHB8GsTc1ylWRpRcTtK1S8Fk+tBIxQeomEylP4u+Ps305bgnfJuAY?=
 =?iso-8859-1?Q?M9iTeCJYnIh+y8mPn4NhLVqiTs7VMJGTn2fZM2JimqSeOs0HAnZhHH2ShK?=
 =?iso-8859-1?Q?tCvk9901qRYez4vu7Lk0oa7FbPJpEnjrhU80rhMniu3PJbV3dLqi5oL2oe?=
 =?iso-8859-1?Q?H7n6u8GTks0Kx3uWMwaq8Pa1a+KFILptnqGe3iFeknvr7bSD6tuSBHAbkT?=
 =?iso-8859-1?Q?dWCGrkSN7Yxr+1kLeZTL9B+58w6SrjFRSzihTs6ZLIbKH2mHLh+4W+dCgM?=
 =?iso-8859-1?Q?toRZpW+hzEN2aYlN6OXotWKCsMnlNhE2+Y3SVqzcWQNBW1eBHmhaQlSrie?=
 =?iso-8859-1?Q?jxEPZCwaE3ZjXuFkGoxsRyrwGplP/yqerEvgSVX+mNtzypu6G6GcOMScJo?=
 =?iso-8859-1?Q?c4WMXgR0LdXv9JPRpGLTvRZ/qbKs4b0dmsL3XCzunuPgh8E7TenYK4AzLs?=
 =?iso-8859-1?Q?DGH/G7RjQbGZ5dpfY2a1lK3aBYgbBSWIT9kmj8nfey6J2yi7pM1ksbHwT3?=
 =?iso-8859-1?Q?XeFr6PWBohtH6l09/MXvg0z4Y+lEaYenNb0QLP1qPomKHicgBNnPN8drxA?=
 =?iso-8859-1?Q?1+fOUWDYMGglM1HuVnZfwRMgNoL+iy1vvU/U9dzgnHy6GlA+//tW5B+j0G?=
 =?iso-8859-1?Q?8EMcperBJzQgLaniYS2wmKNjzA5qHi4VHW6J22p8CXsQWh7lw0LMVtL3Kq?=
 =?iso-8859-1?Q?eBfaH8/O5DGG1N31Qi7UyvHxpk5MaKDCMdMM/w7+z0X9SuY6pV95PZPCSP?=
 =?iso-8859-1?Q?qJcakvNjI90rPnbeDD2pl13oenuiV+B3ucBHfKX+9uxRNzkTJK9bLiKeVi?=
 =?iso-8859-1?Q?ASKoHfq4STW7fvurIrK0OE/BE89HwcmZ6k?=
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
	srQDd2iaaoiEOaUlgIYhjoW9GKOTcdm/JHsVOohRZJ77/B+ZDXjERWUCYvrPZ+hGlVgd3tiPvQC1YYhR0J5qhHS8QUJovpfmAZ8+Vp23QbsyGt4ARP3s7EzsxwICzt4QFVzmUCMVO5DJ3CgiOgR3TkPd06nCSepcNh7JIsAnJ5UOWys6kSNyyVjxWg9Ospn0ysET99qedtAx+B/X3mkiyzww7UH9sMMiL346wI98fx/KdJcbJWE+js8apZMBeu9GegLeP+NHLh15U1U9VXGjmf4uS8a3IzYV1XW+dCPx5n+HyykdAMABVp4z63myCHPwoTQCv4jKrvflwsaBleZLWTDPiJWwlyoqdrS92XHobqwI582Ys0buqnZ3tsMYwgZbDBkDJTyyj9ZsQ7sWiziDCRuLZuT5ewJS9kqRw80wuO3TIrOpkEFbW5HDG8TmKllJpQi9/kVN8zJ13kXEVK+5mFWAAoy55D2MxAEYfE+bImM9aeOEn5czRjQH4TLeFHKkutXuMRxUmMfpDvxRgKUw0T2HXWvNwW0ZX4ieOmBNJB2Ib6dOPxCx4oOzfrEyCI5r+LQDqlWmhIrMxAl7jemJIlRG+TnhTSi21vMGIHOr3KELEkdc0JL0Q6xboe75M4OUGnecVt8ycWSSzH4aX9uLHw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a976ce34-af2e-4d5f-6801-08dc587cbb8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2024 10:06:32.5070
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9qeW2ErDf2YcIXzpk3stonbC+SVU02rIuncyS7WuEuxdeTReFM83WK/6BNd+sovndM/e1E5Xd79TtJasNHyogA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4460
X-Proofpoint-GUID: 9r71Ypw1vx1yvpNO7Fexbi2k2-09_vR-
X-Proofpoint-ORIG-GUID: 9r71Ypw1vx1yvpNO7Fexbi2k2-09_vR-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_06,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404090064

Fixed variable dereference issue in DDMA completion flow.

Fixes: b258e4268850 ("usb: dwc2: host: Fix ISOC flow in DDMA mode")
CC: stable@vger.kernel.org
Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 drivers/usb/dwc2/hcd_ddma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/hcd_ddma.c b/drivers/usb/dwc2/hcd_ddma.c
index 79582b102c7e..994a78ad084b 100644
--- a/drivers/usb/dwc2/hcd_ddma.c
+++ b/drivers/usb/dwc2/hcd_ddma.c
@@ -867,13 +867,15 @@ static int dwc2_cmpl_host_isoc_dma_desc(struct dwc2_h=
sotg *hsotg,
 	struct dwc2_dma_desc *dma_desc;
 	struct dwc2_hcd_iso_packet_desc *frame_desc;
 	u16 frame_desc_idx;
-	struct urb *usb_urb =3D qtd->urb->priv;
+	struct urb *usb_urb;
 	u16 remain =3D 0;
 	int rc =3D 0;
=20
 	if (!qtd->urb)
 		return -EINVAL;
=20
+	usb_urb =3D qtd->urb->priv;
+
 	dma_sync_single_for_cpu(hsotg->dev, qh->desc_list_dma + (idx *
 				sizeof(struct dwc2_dma_desc)),
 				sizeof(struct dwc2_dma_desc),

base-commit: d464dac47260a33add5a206fd3289ec1216e8435
--=20
2.41.0

