Return-Path: <linux-usb+bounces-33678-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDr6HDI9nmkrUQQAu9opvQ
	(envelope-from <linux-usb+bounces-33678-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 01:07:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C995918E4A0
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 01:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DB23307595A
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 00:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B892BAF7;
	Wed, 25 Feb 2026 00:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MaM69knR";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Uw+l9PJY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QQ9CtCPB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3332745C
	for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 00:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771977956; cv=fail; b=UCpkYPmmU+c8rmQ5s5Bpx9y5lWuw0TCFndzlwadbEbHKXFm9NmBFkDepn2WJNfq4eR9Qgf+XDWT859SbwiWpXYH2tP5LjXFLYpBo1CsgWYykCQ9HssVNu9cPrLkWrlx1WQ8TSUk6otAZiIc5c2P9JayGeGnBLMuhX1egv05TOeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771977956; c=relaxed/simple;
	bh=h4fQrIZXI46RMr71vXIogXV5Rlawqfu6XSAG9Tp/VLQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jpjRmNtrdiKFC/06PLDiGayNQoEawxnB6Ui4m9Ep80J+kf+3uQVEhYVewD8EODoJL9Hfm/Y5ehmG4VTphyhw2XhlcyvjtLuZP9dK9y+Uk6WFR4tNjZZabd7sgyNjg0sQdRYoX6SQO8Afpn83H9U5as2mKOUpSi/kQn2Wn6td/jY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MaM69knR; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Uw+l9PJY; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QQ9CtCPB reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OLBJW2532944;
	Tue, 24 Feb 2026 16:05:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=h4fQrIZXI46RMr71vXIogXV5Rlawqfu6XSAG9Tp/VLQ=; b=
	MaM69knRFUbYVx/qKDek/hkc7eII++XG1p0hMoYXiuz1b7oFx8xohYk3/rR0u+Em
	zqmkk8ZDJyvHPAzuu2Bse0pYovABcMd7gNTWKhy7ebWFUzl/3m4GtJnfSxUcnSZT
	+Wyaw+uetdDk0w1E8m0VbsmSOJ/JR7yxoN3rKj3ZwD65eqn6LyQblI0RoOuFicT9
	mDOrUV5IgGRDDXGi6AkPRj9EpzQQL1KqZKvptkPIJxCr8By8UhlJMMguLl5PdMOa
	A8iH7CgxzA5Y+g3N0dhQ12aqN6OpCovpgMdapYugJPdpum1vUlejm6cCChrpQoOj
	nmEKm1s3uNOlVEGM/npllw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4chgt2hvap-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 16:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1771977928; bh=h4fQrIZXI46RMr71vXIogXV5Rlawqfu6XSAG9Tp/VLQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Uw+l9PJY5ct7Sf1ZQW7Kb8uHxOVfmLR22M6shQcXHK0tl3ivEUTbFFVXFZFm2yt7z
	 atiJGdPhVren+0abYcRQDLwJXkNcRPocQx6wRgVrOmnpxACaaMWRobJSlSzXK61WJ1
	 Xee4kRqAak52aQ69MpXzGuAPHK01dWmgnKk0BRot8RY6ULYIvG+ian3Z78Vbw+DkdL
	 XuisZWn8ml4PbApfpvNLzpPEuZVkA1qh1A/s8tZ7jsnKmbC+1GMXvpd2JKPIyYv+nJ
	 LjiGfoT0Yd6QOyuX3QO46qlXEigf+z1uGqZgW7eOC1p1vEK2qUjfGU5IS/gbvJ5YMI
	 ng7inUd0sL71Q==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C30AE401CD;
	Wed, 25 Feb 2026 00:05:27 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 86457A006D;
	Wed, 25 Feb 2026 00:05:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=QQ9CtCPB;
	dkim-atps=neutral
Received: from CO1PR07CU001.outbound.protection.outlook.com (mail-co1pr07cu00102.outbound.protection.outlook.com [40.93.10.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 549A240535;
	Wed, 25 Feb 2026 00:05:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JITwHJo9nUsbx8dFPnNaT48VTU5dc+sLvPeJ4n2l+1BTZFJzXvJeXJyyF5de/UR7osqHaZks4TEXad37Ol9grpj/F0JUM00iVdJeHvkWGB9ywP+XEWuyvZQ6Mjo7rm3czW9qMiIgESRb4pafBP3J/5M4OIa0YcuhayaAOE7T+7CMUkP5kfuglTdWS7XAoaMcLMsXxymTpz4yMegOocfWtw5OGnmilmjefxQ7PR1HG4wGFKjRqGaoZypz3O6sACx5ciWHsk93YjaiFtM6mw/xI2TSks0o4L64QwWFUKDu+nYZP5GHsJEBvSxUHWyosaDe/sXe0Og1ryV/9hF+cu3gxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4fQrIZXI46RMr71vXIogXV5Rlawqfu6XSAG9Tp/VLQ=;
 b=FhAHMdsboweUFnXr0zPvxmdccKuI6OmDnXO+WY18nb7lxIcAzG2iML14MlNlcJR4lkNZ4ZdAnzJT3A5Yf0m6dm1CbXGfucKFMgHSO/gFEUVJbg7Iutb9xr7bFfpwN4+qTzNUhHS+Gso6OEAHg4VruN8KFPgpvC9opSwCUBGdQMGK8PRlN0NqwK7gJXBJFazPbjoTxJVZlI20ZUcDNhI5ox3T102vIpPzjawWYAHeq2kSqJlkzHyfOkzKCFhvuEgcqZxza2uBNLXX8r8tKfhxMW9lpmOjJDZGEp1IAKlfdEz2b/D12mYLiJIVUX49E5nPB/+zGEVsD1+VkZOOjljTOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4fQrIZXI46RMr71vXIogXV5Rlawqfu6XSAG9Tp/VLQ=;
 b=QQ9CtCPBQK9fF08moz/Dw2fVu6tT0rhjEOg1hfIcj/uJIaWtAZTN7NHcWRiA9e20BibK0kOvxedi8s2Inp0nzuAbhKPs7g++B1vnmmjrwPjDw1Ndz/YWGuBan6j7fJTcrFtZNUOkWQAkYn9n7XeLQZeH6FGx2NHFeC++F3QpIg0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY5PR12MB6035.namprd12.prod.outlook.com (2603:10b6:930:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 00:05:24 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 00:05:17 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: Support for USB3340x ULPI PHY, via
 "snps,enable_xcvrdly_quirk"
Thread-Topic: [PATCH] usb: dwc3: Support for USB3340x ULPI PHY, via
 "snps,enable_xcvrdly_quirk"
Thread-Index: AQHcpZf4208n0sWyuUS9s4MYOirBG7WSiaIA
Date: Wed, 25 Feb 2026 00:05:17 +0000
Message-ID: <20260225000512.tle2eu4gkd4ut6bf@synopsys.com>
References: <20260224141438.39524-1-ingo.rohloff@lauterbach.com>
In-Reply-To: <20260224141438.39524-1-ingo.rohloff@lauterbach.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY5PR12MB6035:EE_
x-ms-office365-filtering-correlation-id: a51813b5-cecd-4228-90d5-08de74018f0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UmJMSnNoS1ZqcWJIOG95aDhYOXJaT1E5eHZIWDF1bE41a0IrOXEreGtOemFp?=
 =?utf-8?B?cHl0STh4RXZFLzRaZFA5UUZZZjg5M1hxZmRHNTBhcTFiUVZ2M3lkRUY4WDhH?=
 =?utf-8?B?eVlDL1hyeWdMTXNabU1Nd2ZOQ3phRDllVVUwVlhQK1M5aFg3SnNGVUpXUjZF?=
 =?utf-8?B?Z20yRkpUZkV2MVZIc3BDV2V2M3NXY2JKOGpYRFdhYk1rYWtDdTYrR2JET1Jt?=
 =?utf-8?B?NEEwcWhCcjdqa1VaSjVDdVlPUVFxREtYK3VMQkVnWDZVSUdwTnNPeVNmaHp2?=
 =?utf-8?B?Q2h6bnM1cHVKdDNuUGV1azl3MHQ1bmpaeEZRT2pWM0MrcmFjY1dwRnFRRlZx?=
 =?utf-8?B?MUpnRFNqbEhId0tETDRaaHB6ZEh1RVBOSXNReTRRbFhmY1dxSXd6NG5TZHpG?=
 =?utf-8?B?TGxZdGZPQUkwbWJWR0g5b3YxRzg5aEV4MFZFSWRzWE1vWjFyUzRNcEVUcGlU?=
 =?utf-8?B?clBpSEZqTlNjK1lDbi9Jc1ZFUWRTVXU0dFZtYkZxMmhjRG82VmxCandUV3Z0?=
 =?utf-8?B?VzBVVTFUT0ZoREJJU2lLU1V3MGFmN3hMdmNxRVZVRHNMNHFJQWw5aC9PVFZk?=
 =?utf-8?B?MjZ5RWN4RFdkZXVRNDlSQ2d0dFA5TGhLN1dJTHBHQUNzYm5KaWt4VXYxckl1?=
 =?utf-8?B?TExNMkdsclJlN2ZaL1JrOEltdUR6ZmVXeE5nQ2k1dGV3QlFIT2pLUVEyeE50?=
 =?utf-8?B?bzhQOWMxYm9JZ0RnZXFBa1ZlWSt1NFpZZmRXY1ZtUEJLUG5UVHN0NCtXUTFI?=
 =?utf-8?B?dlZtMEQ1Vm1SSUhscnY4ZlJlRlFiYWk0aWhUYWlzMTE0dThMZHF6aGJwN3lB?=
 =?utf-8?B?QmlxUFRETUZzU3N5Q2VmODJzLzhHMFcxbEtXUmZNLzhMbzBwWU1KZDJycGta?=
 =?utf-8?B?SzhWQ0lWcmNuUHhCNzNzL2VUM09JUmxYYVFrWmtya3BWVFdDeFVLRGZ6bmZj?=
 =?utf-8?B?VjlBNzBJTmw2N1AraDJPb1dIOUhTMFdJNXBWRzhRS3JyUWVlZWpHU25mOXQx?=
 =?utf-8?B?aHB3cVNTWkRKdFF1WW9QbVRZSFlrZFd2L0hPWGlQMU9sVjdsdmVHMkU3REd3?=
 =?utf-8?B?S292aHFnQ3FkLzJJY1pQYUx4NEo1c09wclhtTkZKeWhpK3F4bUFaY0U1STJN?=
 =?utf-8?B?SGtrV1RzaTdPdVZZdEVvMWk5SkZEQzhIbjV1S0xFNVBOclRSZUowVTdsbFhV?=
 =?utf-8?B?QW1sWklZa2NEYjdiODN2THFOU05LcWFFOHlhT2NKRGl3TWtMUFFQODl3Q0c5?=
 =?utf-8?B?aGFvcjVNV1ZtYXo3clZLOStiSkxhd2YzcTBiQXh4b0FMUGpCLzY1c3BRSjhU?=
 =?utf-8?B?ai9xWStKd2E5eUcvWUJMSnYrbGYwRU5UeThXcG9Bby9mL1lSbncxdXpwVkxT?=
 =?utf-8?B?ekwzbkNDOGlEdTFCWjU3Z0gzUzlDWGRvZ2xac3VUZUlHTUFlUlNjT0YzUHNS?=
 =?utf-8?B?YnVsRGZaUjF3Q3ovaHFsZjZqVzlnWkxHMnhzVEMwOENIN1RxUnk2SHN2cmNY?=
 =?utf-8?B?SWppT21uY2U1Ly9NbkdFUkI3VFdQK3RCekxGaG8zMDM4Ny9naGJwMGlrZUdH?=
 =?utf-8?B?RlFJZTN2WHpWNmx0WlZwMkxpamVTOWFkUFVQa20wVEdMYis4eUtFemNsRm4w?=
 =?utf-8?B?cGVYT2l1Qm4za05tMkswcTFSeW1kQ1MvS0ppRFdYNFR3S3ZYTUltUkYwODEw?=
 =?utf-8?B?Z1hITXZDMmc4MmdmdStYVnpnbFBHR3dmYzEwNjN0ZHhzTytFNys4S0dWNE01?=
 =?utf-8?B?ZGJxdWJlbHhHdUYxaWxEcUx1U0YrT1F4RHVDdjdOeWROWjJONkk2UW13RGt6?=
 =?utf-8?B?czl4K2NkRm1MUS9Ka0wvLzhFdWYwSlBFQjlhaDNWSzVpMVdsSGEyakpGa2Nq?=
 =?utf-8?B?T2N4cU9jbjM5OEdLVDBxSnZGa3hjc2JyVjQzTEwwczkxUVRmSDAvelRSOEht?=
 =?utf-8?B?dEJDaFY3bkdIQWVQV1dhdlc1Mzd3ZElqamdFR2MybHd3WjlZSVBqY0wwTDI2?=
 =?utf-8?B?VlcvUlkyRVV1ZzVEYkdYMy9xd21Rb08rTDVCZGZ4ZWxuTk5JaE9LWEd5Wktx?=
 =?utf-8?B?aWpMWVpOak1pNTlMZkY1ZWdqdGhnQTczL2lGU1d3c2JrRFM5UXhsMzdQVkUr?=
 =?utf-8?B?Um4zeE0wN2V6Z0l1SHVCdUVjd2hsWkxrdWlpSGc0WXErZ2pOZFp0b05Pd2ta?=
 =?utf-8?Q?ONJMcW0LF0Cj/OtjlD1KlQU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Wm1zRXZQNjBwWmtSSlg4dTdEbGFUVHBINnNHYU9jK2ZxMm1zeng1YlhmYWMx?=
 =?utf-8?B?Q1BEV0NhaFlzTkdBYTJPQW1MUmFycEFIT0dLMTMzbGRZVXlTby9TV1RzV2Fq?=
 =?utf-8?B?UndSc296U0lXMklZZUFhRWlteG5OeCtIZzNJMytXdWF1U2p4c09mZW5UNjc1?=
 =?utf-8?B?dTEvaEFZRkxiU0NrZFpHZzc2b1JrYXl5RGFoN3lPMzA3VzVxSmxFUFl1anc2?=
 =?utf-8?B?ZzNGUGF3V3AzT2taTEtzdmpSN25UOWFHSHhmMEQwcEdYQXZ5d2Q2am0yOEg3?=
 =?utf-8?B?RTlXV2gzVXpFSGlJUlFxZU5aRjM2RDlPM3drMHBGajVHQmVpY1JHUnovRFRL?=
 =?utf-8?B?RWMrck1aQTdtMnpla1BBLzBnQWFocVhXVU8xNmp1SWNodDZqMTJQRmtveWFI?=
 =?utf-8?B?MzNob3E4LzdyVDEzZ0NGUGtkajBjNWdRY3kxTFdNMEZYMGJsaUY4WWwrNVQz?=
 =?utf-8?B?emJSTmZyU1BOc29OT0FSbEhNUTdUcnFXN1UvQ09yMFRtRXE3cm1mTlJBbndO?=
 =?utf-8?B?UUxENks5QzgrSUppTkFBaG42MDcwM2JNWGFDbENITndVRG1yTXBYRTF2ZjlJ?=
 =?utf-8?B?Q0xzZ2RSSFBoWVdoODZRRDZ5eU1Ma3JYblVuU1VCNUxhQTlPWVRoM002WnVD?=
 =?utf-8?B?UFZsenhCejZvOTRFdWU2MWZ5eko4MG44MmtmOVJ3UC9JbUJVZThzQnkwMVV5?=
 =?utf-8?B?czNQazlLZksvbUd4QnYyeUl4ZGU4Zi9GdXlXbDcxMVZFL0oxSlViOS9TZGlq?=
 =?utf-8?B?M3JLa3E0ZlRSZlhYTGhoMGRWRmVOdGNYdi9ycFJvUHdxZFBtcDlEU25LY0k5?=
 =?utf-8?B?ZVgreEkxUnhRS2hmWkhiK0x1MkxGb1htTnlqSVpGYWZhOGFwTzBJUW1uVnpt?=
 =?utf-8?B?cXdZblYya0hBVEpSMkYyZmViQytMME5NaFhacjVpbW5STllqd3BseXZWY2dI?=
 =?utf-8?B?S3NZbnpVeEQ5c1pPaWFIYjJPWDFKWnliNHQ2cTZmS01PU3B0ZWtUNTJvVTJk?=
 =?utf-8?B?RmZ6ZWptVXlYV21ld1hCcFBXaVZHTDNyUDFYMTkxdWR6bndCQnJVaVNMOUo4?=
 =?utf-8?B?WkVHZDBaejlQVHJuN2RnTHV0Q21oMWU0THBTMFQ3T0NqNkZMV3ZabWdjVm5y?=
 =?utf-8?B?MzE2LzZRNStiaWV1V0VEYUY0aUZld0FKVGtjZ3QzbWQyTHR5MU5qbzlobTBC?=
 =?utf-8?B?YmpGNmpqamllamxMbTFhVHZsekRZT3BHK3FjeG9rZzBDVVdCbVd2R0tlMFJn?=
 =?utf-8?B?K1Y1VTZlZld3YVNiUGYyZjNvZVgrcWZwR3ZHWEJ6TzBnWjIxd1ErSkJ1ZFpF?=
 =?utf-8?B?NHpzVHd0NVhuL0wwTW5zUHZqNVcyR3VhazJFTGREVUtwSjdHVnBzajhraXBQ?=
 =?utf-8?B?Z09jS1lhUUlDTm1laUFKSFc4RDVmelNrb2I3RmhPaWFUeW5wZUJvTVRHczRN?=
 =?utf-8?B?Nm5EVm5sTTJYVVFBbmFYQXpEdjNYbHRYNC9YSXJaUHVrVEZBVkNIVzFPRjVJ?=
 =?utf-8?B?a3FqcUE0RytZamQ4Rmh3bGVsOXVYZXozSWxWeE9IaFljb0p5RmYwcWpsWlZW?=
 =?utf-8?B?RTd6RGh5bWprTXV5YStpNDhtMlNDaS8rSFFtQzZNQU1ia2ZBNHM0UFpUODVj?=
 =?utf-8?B?VUE5eGVhSDVIREs2US81Y0pVVnZ5OW9WTjE2OGRkOTZHVXdCNUw5d21hT0dH?=
 =?utf-8?B?MWlkYWp4ZWhvVVo3eXBlUU1yTjhxV3Q0TU1uU0JCRlF3MlhxdXY0ckZjVXFH?=
 =?utf-8?B?eHV5V2tYOUtKcGVab1JjcXJqQXhwMGFNV2c4V1QzdGRKN0FPVW1GQVVkbGNp?=
 =?utf-8?B?UWthbXJtbW1ySnplamJMUG41OGJhU1ZyZWNhaGVkaTVyaS9Mc1c5NDFPTXdh?=
 =?utf-8?B?THVCNEppaDRsVmFrcGdVNGxvY1M0dElBbHNiUmcrZVNCQmNHTGVSZDF2VEJl?=
 =?utf-8?B?bXRmdm1ZT2txVVRGcnZkRUlmeVhodDNkZFdrZDBZbmdjeWdOWkUwL1lHdWMy?=
 =?utf-8?B?NFExNWtON3Bmd05Cd1FmdFZnS3plZGdzM001OGcrc2lkZk1xWld6Z2cvQkRM?=
 =?utf-8?B?ei9wM1lHRXN6ZjJoTE5rcjAxb3lsRTE4QnZYQllTdHQrcWFkSENSakNHbTVB?=
 =?utf-8?B?Ym5MazRscS9hMGdYTE9rV1lIVStIV2tWeWd5dk1uZmRWVld1QVYzcjA2TUt0?=
 =?utf-8?B?b3BNTDF0RXNtNEdodnpFaVFoQnh3aTdFTzBCMjh4V1M3NEhjcUdrZ2xjNy9R?=
 =?utf-8?B?eVRBWlVGL1o5MG9xVUtPN3p4NWcwbjdLZDRsRnlRd3pJYkVSY284STBMOVBj?=
 =?utf-8?B?L0VSb2pZREh4bC9FWGl5US9jVkVVMjJqYzJoVUZWK2ZjYU1wV2xZQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DAA81A39B6688441AA75E07040A6AA62@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+NRhLTIIZD2qrD9CNWEaIRdl3/YLOqTjfmFH7FQ8eo4hxcoua8xx1c6RJ4N2V/lhddfOlZHYNuIRENjIZscv+b/hn6q2COUggHdQi6yx7rRoLy4FvG1qUKE/JdpilPqmSk0eEM0PDEHs70R6ggb0EiOGH/KizusORt/p/7gIka5PKZhkP/yn7JNLGkqe/hZS92cEvdHCPH9FpkNpGY2FYd3fgkoqNGSNiaW8OXGPd8K3DquRwao5tBrykqgubN0+e/tRNduu7ndni6kEw2MiLRhIsxM5gTKrfnD4bZVJowZt36dNvmkcmghNSWXDhUkAQ3Txqn63B3yV2Ugny7ZzJQ3H5sLC4scAhr+tislme9sZlmn0F0iTKirj1CIzons21I938tnQxwu7gKTHhrlUy9b6ypA7BWf5w2OmqQIGn+TkHjD/LXDI7hAe0xIVsUXENwwFs+GWHaShtZSuHhaaeUtbGMW14U/zgQpN7KNhFiv5NVFUWyknEGjvKzZMfbsSPxHsVipQSrIlXBgIByvRG322cqGI2EN3r/3UPCgdxygcXy4shpZdpgoT8ljHS238/oXeecNdxepGzvfXXsHtm6Z288Sbs4X6g/bhFRbcHtjiIHTsw75gEYhQ581LIIEdlj9kLXi//LAkswNcU0ElWQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a51813b5-cecd-4228-90d5-08de74018f0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 00:05:17.7080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aODhD4Q9G46D5ScJ2iX4/v0orzKXzNbvFyzjRd/n9LbgdAbtmfk8QvpJX1+ntILa1XGkyMaaPgi65TzDOzHj7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6035
X-Proofpoint-GUID: uripQMGUedjuX5jgzI5NerfyNHsChfuR
X-Authority-Analysis: v=2.4 cv=beVmkePB c=1 sm=1 tr=0 ts=699e3cc9 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=XYAwZIGsAAAA:8 a=TZ5gh4L_AAAA:8 a=XsbZaElULojQKVJb9qwA:9 a=QEXdDO2ut3YA:10
 a=E8ToXWR_bxluHZ7gmE-Z:22 a=2pkA1AvaAoXcNePaGM_w:22
X-Proofpoint-ORIG-GUID: uripQMGUedjuX5jgzI5NerfyNHsChfuR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDIxMyBTYWx0ZWRfX3qiQIe6/bLhH
 +jCxfQFL12GMHpnI8Nr1yDCgK5Vpp7b8+DsRYerUZr5eiS4Cp/J4TD8slr9IDZRJ8pWIiAEYZl7
 k/lcE5SgbpJrSKTDv4hfzl60Sf9dDRlSPNYuqyZ0nn8gRxPWi3uhxnyMk4HpKOy6CaKEOuowRnv
 ziUST8B/i6Mw86nzPxkrW/HQ4vNX4bEPtfwzJlGGcHO3PlWSolfqrL0r2Srx+AjkHO6VTD1o28E
 9ZQ1jKrQoXwDMcDe++TyjHcK4DaX963Z8cj+dPsUaI672fN48zPxDB01gfxJKmEpMKyk17cu+/8
 8S8250fwOkCiaTqgkXyecU7iq5QnCL/RobdJ08hZiHy57mT1iifWPOtb/qBj+QJsYrofdzhfhOe
 DMPmSJgfBAHQx3OrlclLYOQbwzE2pdWAup7COTQCN6r6flkRrMnBUg1sWZxvHvTF90IujAvo63s
 yvLWr6PjVeB0gSjAVbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 clxscore=1011
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2602240213
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
	TAGGED_FROM(0.00)[bounces-33678-lists,linux-usb=lfdr.de];
	DKIM_MIXED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,urldefense.com:url,lauterbach.com:email];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C995918E4A0
X-Rspamd-Action: no action

T24gVHVlLCBGZWIgMjQsIDIwMjYsIEluZ28gUm9obG9mZiB3cm90ZToNCj4gVGhlIE1pY3JvY2hp
cCBVU0IzMzQweCBVTFBJIFBIWSByZXF1aXJlcyBhIGRlbGF5IHdoZW4gc3dpdGNoaW5nIHRvIHRo
ZQ0KPiBoaWdoLXNwZWVkIHRyYW5zbWl0dGVyLg0KPiANCj4gT3JpZ2luYWwgZGVzY3JpcHRpb24g
aXMvd2FzIGluIFhpbGlueCBXaWtpIHVuZGVyDQo+ICJVU0IgRGVidWcgR3VpZGUgZm9yIFp5bnEg
VWx0cmFTY2FsZSsgYW5kIFZlcnNhbCBEZXZpY2VzIg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSW5n
byBSb2hsb2ZmIDxpbmdvLnJvaGxvZmZAbGF1dGVyYmFjaC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVy
cy91c2IvZHdjMy9jb3JlLmMgfCAyMCArKysrKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy91
c2IvZHdjMy9jb3JlLmggfCAgMiArKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25z
KCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2ZXJz
L3VzYi9kd2MzL2NvcmUuYw0KPiBpbmRleCAxNjFhNGQ1OGIyY2UuLjkyYWQ3MDFhOTM0MCAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gKysrIGIvZHJpdmVycy91c2Iv
ZHdjMy9jb3JlLmMNCj4gQEAgLTc3Nyw2ICs3NzcsMjMgQEAgc3RhdGljIGludCBkd2MzX2hzX3Bo
eV9zZXR1cChzdHJ1Y3QgZHdjMyAqZHdjLCBpbnQgaW5kZXgpDQo+ICAJaWYgKGR3Yy0+dWxwaV9l
eHRfdmJ1c19kcnYpDQo+ICAJCXJlZyB8PSBEV0MzX0dVU0IyUEhZQ0ZHX1VMUElFWFRWQlVTRFJW
Ow0KPiAgDQo+ICsJLyoNCj4gKwkgKiBGaXhlcyBIaWdoLXNwZWVkIG5lZ290aWF0aW9uIGlzc3Vl
IHdpdGggVVNCMzM0MCwgc2VlOg0KPiArCSAqICAgIGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMv
X19odHRwOi8vd3cxLm1pY3JvY2hpcC5jb20vZG93bmxvYWRzL2VuL0RldmljZURvYy84MDAwMDY0
NUEucGRmX187ISFBNEYyUjlHX3BnIWRYYXY4WUhtYTZPaFpXUjFqaEZ2QnhNNFdndjdPQVVQak1n
QlM4Q1J6LVAweDJPVHI4UEdiRXJVZzdSdGNiTGZzTmloc1BheTRsSGR2b0xKbk45bkpveEdKcXdi
MnFnJCANCj4gKwkgKiAgICAiRGV2aWNlIEVudW1lcmF0aW9uIEZhaWx1cmUgd2l0aCBMaW5rIElQ
IFN5c3RlbXMiDQoNClRoaXMgcGxhdGZvcm0gc3BlY2lmaWMgaW5mbyBhbmQgaG93IGl0IHdhcyBm
b3VuZCBzaG91bGQgZ28gaW50byB0aGUNCmNvbW1pdCBtZXNzYWdlIGFuZCBub3QgaGVyZS4NCg0K
PiArCSAqIEFjY29yZGluZyB0byBkb2N1bWVudGF0aW9uIG9uIHRoZSBJbnRlcm5ldCwNCg0KV2Ug
c2hvdWxkIG5vdCBqdXN0IHJlZmVyZW5jZSB0aGUgIkludGVybmV0Ii4gSWYgeW91IHdhbnQgdG8g
cmVmZXJlbmNlDQpzb21lIGRvY3VtZW50YXRpb24sIHBsZWFzZSBwcm92aWRlIHRoZSBEV0NfdXNi
M3ggZG9jdW1lbnQgc2VjdGlvbiBhbmQNCnZlcnNpb24uDQoNCj4gKwkgKiBEV0MzX0dVU0IyUEhZ
Q0ZHX1hDVlJETFk6DQo+ICsJICogICAgQWRkcyBhIGRlbGF5IGJldHdlZW4gdGhlIGFzc2VydGlv
biBvZiB0aGUNCj4gKwkgKiAgICBVTFBJIFRyYW5zY2VpdmVyIFNlbGVjdCBzaWduYWwgKGZvciBI
UykgYW5kDQoNCkl0IGNhbiBiZSBmb3IgYm90aCBVTFBJIGFuZCBVVE1JLg0KDQo+ICsJICogICAg
dGhlIGFzc2VydGlvbiBvZiB0aGUgVHhWYWxpZCBzaWduYWwgZHVyaW5nIGEgSFMgQ2hpcnAuDQo+
ICsJICoNCj4gKwkgKiBUaGlzIGJpdCBhbHNvIG5lZWRzIHRvIGJlIHNldCBhZ2FpbiB3aGVuIHRo
ZSBkZXZpY2UgY29tZXMgb3V0DQo+ICsJICogb2YgaGliZXJuYXRpb24sIHRoaXMgaXMgY3VycmVu
dGx5IG5vdCBhbiBpc3N1ZSBzaW5jZSBoaWJlcm5hdGlvbg0KPiArCSAqIGlzIG5vdCBlbmFibGVk
Lg0KPiArCSAqLw0KDQpJTU8sIHRoaXMgZG9jIHNob3VsZCBnbyBpbiB0aGUgY29tbWl0IG1lc3Nh
Z2UuDQoNCj4gKwlpZiAoZHdjLT5lbmFibGVfeGN2cmRseV9xdWlyaykNCj4gKwkJcmVnIHw9IERX
QzNfR1VTQjJQSFlDRkdfWENWUkRMWTsNCj4gKw0KPiAgCWR3YzNfd3JpdGVsKGR3YywgRFdDM19H
VVNCMlBIWUNGRyhpbmRleCksIHJlZyk7DQo+ICANCj4gIAlyZXR1cm4gMDsNCj4gQEAgLTE4NTUs
NiArMTg3Miw5IEBAIHN0YXRpYyB2b2lkIGR3YzNfZ2V0X3Byb3BlcnRpZXMoc3RydWN0IGR3YzMg
KmR3YykNCj4gIAlkd2MtPmRpc19zcGxpdF9xdWlyayA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jv
b2woZGV2LA0KPiAgCQkJCSJzbnBzLGRpcy1zcGxpdC1xdWlyayIpOw0KPiAgDQo+ICsJZHdjLT5l
bmFibGVfeGN2cmRseV9xdWlyayA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LA0KPiAr
CQkJCSJzbnBzLGVuYWJsZV94Y3ZyZGx5X3F1aXJrIik7DQoNClVzZSAiLSIgaW5zdGVhZCBvZiAi
XyIgZm9yIHByb3BlcnR5IG5hbWUsIGFuZCBjaGFuZ2UgaXQgdG8NCiJzbnBzLGVuYWJsZS11c2Iy
LXRyYW5zY2VpdmVyLWRlbGF5Ig0KDQpBbHNvLCBob3cgYXJlIHlvdSBwYXNzaW5nIHRoaXMgcXVp
cms/IFRocm91Z2ggZGV2aWNldHJlZSBvciBzb2Z0d2FyZQ0Kbm9kZT8gSSBkb24ndCBzZWUgdGhl
IHVzZXIgb2YgdGhpcyBwcm9wZXJ0eS4NCg0KPiArDQo+ICAJZHdjLT5scG1fbnlldF90aHJlc2hv
bGQgPSBscG1fbnlldF90aHJlc2hvbGQ7DQo+ICAJZHdjLT50eF9kZV9lbXBoYXNpcyA9IHR4X2Rl
X2VtcGhhc2lzOw0KPiAgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCBi
L2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+IGluZGV4IGEzNWIzZGIxZjlmMy4uNDE0MThmM2Y4
NWUxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiArKysgYi9kcml2
ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBAQCAtMzAyLDYgKzMwMiw3IEBADQo+ICAjZGVmaW5lIERX
QzNfR1VTQjJQSFlDRkdfU1VTUEhZCQlCSVQoNikNCj4gICNkZWZpbmUgRFdDM19HVVNCMlBIWUNG
R19VTFBJX1VUTUkJQklUKDQpDQo+ICAjZGVmaW5lIERXQzNfR1VTQjJQSFlDRkdfRU5CTFNMUE0J
QklUKDgpDQo+ICsjZGVmaW5lIERXQzNfR1VTQjJQSFlDRkdfWENWUkRMWQlCSVQoOSkNCj4gICNk
ZWZpbmUgRFdDM19HVVNCMlBIWUNGR19QSFlJRihuKQkobiA8PCAzKQ0KPiAgI2RlZmluZSBEV0Mz
X0dVU0IyUEhZQ0ZHX1BIWUlGX01BU0sJRFdDM19HVVNCMlBIWUNGR19QSFlJRigxKQ0KPiAgI2Rl
ZmluZSBEV0MzX0dVU0IyUEhZQ0ZHX1VTQlRSRFRJTShuKQkobiA8PCAxMCkNCj4gQEAgLTE0MDMs
NiArMTQwNCw3IEBAIHN0cnVjdCBkd2MzIHsNCj4gIAl1bnNpZ25lZAkJZGlzX21ldGFzdGFiaWxp
dHlfcXVpcms6MTsNCj4gIA0KPiAgCXVuc2lnbmVkCQlkaXNfc3BsaXRfcXVpcms6MTsNCj4gKwl1
bnNpZ25lZAkJZW5hYmxlX3hjdnJkbHlfcXVpcms6MTsNCg0KRG9jdW1lbnQgdGhlIG5ldyBmaWVs
ZC4gUmVuYW1lIHRvIGVuYWJsZV91c2IyX3RyYW5zY2VpdmVyX2RlbGF5Lg0KDQo+ICAJdW5zaWdu
ZWQJCWFzeW5jX2NhbGxiYWNrczoxOw0KPiAgCXVuc2lnbmVkCQlzeXNfd2FrZXVwOjE7DQo+ICAJ
dW5zaWduZWQJCXdha2V1cF9jb25maWd1cmVkOjE7DQo+IC0tIA0KPiAyLjUyLjANCj4gDQoNCkJS
LA0KVGhpbmg=

