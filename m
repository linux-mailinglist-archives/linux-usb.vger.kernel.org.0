Return-Path: <linux-usb+bounces-11241-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B221C905FCE
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 02:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9E661C20B17
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 00:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BF18F62;
	Thu, 13 Jun 2024 00:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="r9iDr2GH";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KGZi6bAM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="s5jG3+Db"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8B5BE4A
	for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 00:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718239403; cv=fail; b=GZoFcp1yHzWJ/YVi1o4SdMM4RXZJtIVTsycrSqJa51c/s/Ibaokunog5TuwN/niAyawLak5378eXX1vHdt2NYsJKkywMjufOUwB0l6wCejIHLoXne3g8GJfy5rjZRPv+u5Ma1iFRFlAMQ+D3ATuMmTrfKL19Raxu71u/XWtivA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718239403; c=relaxed/simple;
	bh=OgTmo67icaV86+6ldJRp9obsZKxskuhQt4vGbD15m3w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CBcbGeye55F7hvwfsKvA83LOh85H8MN+RaTPdSbu87jwhKHTjbyjt66HSSWgt2JBM2PWKM75VP0IuaW7MS+dVP9uwF9OmEBX1OrUAdo+jb+8dEzdAX2wyfYBHk2Rw2BqDDfcW/qmJ1YWU03Ay6L1KKkhzA8/jN/sfapyf1uL3zY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=r9iDr2GH; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KGZi6bAM; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=s5jG3+Db reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CLKcHj010143;
	Wed, 12 Jun 2024 17:43:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=OgTmo67icaV86+6ldJRp9obsZKxskuhQt4vGbD15m3w=; b=
	r9iDr2GHlGBob0oDWpE9vDsMiFMENarMJyVH6NSQdt3QASd3YBMd4/1KcP70OC9m
	MzGBcXtxq+CrBU+Z7zmoO+IXoRXkDJIlSBzgab/A10ZgxCKAPhwDUIJ/Rkc6wB0Z
	RjeLxWcE9+dSWzmIzMRFpNxQ2rCbGHI6VnxaZ0jMIipm+n9Lh+lRJACWvJAC7HeQ
	ZFlq3Hn5TfjAKxD2kv4TcaEJTb28SBXJNHJlBiJgYty/154hczTJQlJzQA0+s2OI
	YTlYCeX25cqYEoib0kNELcyvbFi0ypOjtMAMlxvRpJ/CrRXkTaNPijjRUGh7D83V
	f/AMeoGuAZlTUmkxBdTrBg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3yp3mj50k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 17:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1718239390; bh=OgTmo67icaV86+6ldJRp9obsZKxskuhQt4vGbD15m3w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=KGZi6bAM6hdDn9rebCYAv0gtjyjAVw/+p3voN1rdfQe3IA0Psuo32H5MWeptY7fcF
	 y5s1eI5x/bbySyVFDfRiDv7ydgbMg6rzGfOFRiCJtFK8JXXIgPxM+EikeW70IgD5cQ
	 fLFbH+WGVhIeN4DMDiflhnEdBjcZWG3+TE82k/k47UdN00pGhn6J4oVkyp+N0dGrug
	 rT3s7iMMA0p0V1QfgD7eyBJfNoLzwF3uYCQGDVo+TzbK/S+BKLWU7cP3FjPST0Ewg2
	 9TBWvSsECPVwYpIOeaNdJdKRPktR1V5SAmT5MJVbscA4i84BjN9O00AiPm7ielyI/T
	 Auv5E9ExUZn+w==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1595E40540;
	Thu, 13 Jun 2024 00:43:09 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id CC760A005C;
	Thu, 13 Jun 2024 00:43:09 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=s5jG3+Db;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 97DF640353;
	Thu, 13 Jun 2024 00:43:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWgGyZeZayaquie/VioFYoiHarHDiT+wpNi5QFOP5YQKcE9rDWgGj9Ml2dIFgRZWMH5m/5ex079iMC6tPErGYeltLpTRkVuKroT/aKXA/AQuUvbjQuqN4+vIPfi4BqpXifgfsmkeUUalyujq/vm0EuMftCpxJWk0pLLXsUpd03MvWbdBFb5UqP7RLSyBOz65FjkRLb0kFblpovgfsanGj9WmytLMhmSSomqYiL8DI+2bPtNb4KUG4x4hp3HFb+0Tttl3/8uaJ4Gd5gKIvZ/ceIs58L9MoiK4igfIXPJFdaKgejAnZxq3bkzX9dLjekGPaH+YB6FwA8Pik99U1FIs1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgTmo67icaV86+6ldJRp9obsZKxskuhQt4vGbD15m3w=;
 b=n5bWxFTb7inEGdpOzzIXiVdJ9bqjKsMLwc1nzFc2NgFFLOwar6a2AlnkQDVCZ26LtOa3e+o7rmnxzJ0SrevAq3yfnxUNRrqZt7+ViKMDLsCt5DjKsL6oKQRDaA7wVchg+BLBR9vrRbGigC20ODQH5lIkN22z7KXq8dLdZjs3n7d7is1ojFILzC6xs5mhZNSkPBzaqwTzD15vMN/CE1ZFtBq6fIyDW0C+BF6CPi0JaJu7nQc75MpPu3ikuLYyUKhbf1uxsH264Ao1hd7g6cdsBkgobNibxIU4tvGEbtPlqtOjXqAy82DK3yUMXlOIMaG/GxeHm/pxi9VAEihEnE6vwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgTmo67icaV86+6ldJRp9obsZKxskuhQt4vGbD15m3w=;
 b=s5jG3+Db2PFB9PwUdwKFFgWeqn+MGZSmlLySfSX4UeT2k5pXJCfmUytOnZyAo6bweuG+EAVT35l+4SSpF9kW/v9ki2RLYLfKWX3tbsyewwe5XPZFijxP6ghvLlf24ZxXkad+T7y03XvqPQ8UWuxAiKyfefZkHFNABuGUj9hChv0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MW4PR12MB7429.namprd12.prod.outlook.com (2603:10b6:303:21b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 00:43:05 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.7633.036; Thu, 13 Jun 2024
 00:43:05 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "bugzilla-daemon@kernel.org" <bugzilla-daemon@kernel.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Thread-Topic: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Thread-Index: AQHavQiFkf7URCrfX0m/xDX8jr0yULHE2zcA
Date: Thu, 13 Jun 2024 00:43:05 +0000
Message-ID: <20240613004300.kcoaxpwt2xcmszhj@synopsys.com>
References: <bug-218943-208809@https.bugzilla.kernel.org/>
 <bug-218943-208809-gk195DtRUv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218943-208809-gk195DtRUv@https.bugzilla.kernel.org/>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MW4PR12MB7429:EE_
x-ms-office365-filtering-correlation-id: 0d421eca-97eb-4b85-2d1d-08dc8b41c9b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230034|376008|1800799018|366010|38070700012;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UVJEWFdJSXpsVUY3Ykg5VXVFWWMxN1QwL0ZvMVAxMkVNNXluY280Sk1uY0Mr?=
 =?utf-8?B?YUc3c0lDV3pnKzEvYU8yOGdsUkRPY2lXWmxUQnV3ckFDWHlLT1lJcC9JeWVp?=
 =?utf-8?B?eDNFZlVuSXhGM3BXVzR2U3ZWRDVSbTVER2JzeE8reEJQRS9pMHAyalhoRzdU?=
 =?utf-8?B?M00yMmFpNkRHWVcveTdmMWRkdE1rUkFzVjI3aU92U204dlN1OVRJREtha2NN?=
 =?utf-8?B?WXNKeXZ3MEdrUytMQXhBb2hxMnJKOU42eTcxZFUyeGJiZVM0MUpsd0phSHYx?=
 =?utf-8?B?eC8wM0JySUxvRG9LbW10bzhadjY3bU9tbEdwRnB2ZzE3UzcrSzVkZWkwdVo1?=
 =?utf-8?B?TVF5SndZOHhCenJZcTBYejY0QnZVVC96QWhtZkU5eWpyQnkveHpzZWsvYW0r?=
 =?utf-8?B?dFdYNG40VnB0OTBGM1Mvcmp3bEVreTJOV3ozc2tLR3JHN2RCUm9YbExqU1Rl?=
 =?utf-8?B?TmNucmx2RDR1T285UUtoSStkQmNHY2ZjaUFQZUg1VUNWTUdvZExkWFlDdUQ0?=
 =?utf-8?B?RTRBNlRweXR0dTM0RjJTQUFmell6ODhwWlBGZzZubngzYk5ua0FtcnU2Y242?=
 =?utf-8?B?OHE4aWF4NTNSZVEzd3hWS0ZXN1Z5MmRiZnNhNTMrbnZtQ0pMTHpvdS9EdCtN?=
 =?utf-8?B?Z0d4dlMrZG1CSDFLR0RDUEJzcGxPdmYxNk43ZmpYN3FOTTlCaFlIcnJ6bmhY?=
 =?utf-8?B?eXFvSm00OFdUdDlob2syclFseWk5dmIvWG4vWUlIeklobm1GTmxaemZzb0ts?=
 =?utf-8?B?Z3dYZ3lEc2xybys2enVPVWhWRGhEVEFha1pmckdpbktCR2l2b05rUFpRZUhC?=
 =?utf-8?B?VG80NVhmMmVaUXV5bnJkVG9nSnEyWDNjQVFtYTdKNnR0Z3Q2K0ZnOTlqQWZO?=
 =?utf-8?B?RXNpeVcrNFJ6NVhEODVTbzhacG5Eb2FoUllIeldzWjM5TU1pd3RlZERyUHVG?=
 =?utf-8?B?NVFtTFhRN1FwR2N0TE0vREs0Q05BdUR6Y1A5TDgrb1c4R21QOHNIcEI3bmt5?=
 =?utf-8?B?aS9ZdmIzNGhPMUlPcGFVYW01YjRBVTg5TzhWTk5ReWNQcFJ1LzRaekRmNEM5?=
 =?utf-8?B?dlhJbHI1d2VLWWcrQVZRVklrKzJMcGhRWnk0bWZnRlFleGZRYmw1bFFVaVBR?=
 =?utf-8?B?Yzg0Uk5oWjU0SFNHVXJZa05KSnV4REJqUHNoOUFIMlNXTmViQTlxRHFIZnNC?=
 =?utf-8?B?bVp5VCtyOE95bWF5TmJMOFBROTd6RkRHeVNTK2QyRHN4b09Mc2tDSXUrdGdh?=
 =?utf-8?B?S1NUdGt2c3hiL3FkRXNrWjMwTjFOU0xKRUs2L3BLQVVFeG8rMVI4Z000SFFS?=
 =?utf-8?B?THdVQUd1TWtWZ3RKWWRtdHNtbmpqc1FtSHd6YUZDVjFMeEpDbnMyU1lKeWFB?=
 =?utf-8?B?dlZYTW9ZSXl2SXd2aE1WNXdVZkd3aWJaMHZCSlgwWmt3bVFTNWplVkxWdXVH?=
 =?utf-8?B?bWVBdGFtT0w2NEhiQXRKMXgwU2t4ZGNrSkZqUjk0NS85OXNXaVg2STVwb01P?=
 =?utf-8?B?bzgxYjhLOWxyRHhaeEplY3VVZGFvZDJvdTdYUnBxa2pacFF4NUM5Rm5XRGJv?=
 =?utf-8?B?ckRLd3hKUWUrNGhOa2lEM3Q5a0NVazhZUHhYUXdYTU44MldUaFpJRHVBYkQ3?=
 =?utf-8?B?R3pQZGpKZWhra2FLRXZ6clM3c0thTXE3V2pPSW9Xb1ZuRktUeUZnNmJOVHAy?=
 =?utf-8?B?a0lYNzdqUUYxZlpwSVJnT0UydnY3ZnRmaW5hUUVjN2ovcnY4NzhuaEJFK2JU?=
 =?utf-8?Q?1+uiyDfpmkyG0C2/GROHcV1vwc6oILnGjQK+Vc+?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230034)(376008)(1800799018)(366010)(38070700012);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VkV3SU1wQmV1cmo1SU1OUUIzc1o1MFJQMWszVCs1OXM5OUJTSCtRR09jdGk2?=
 =?utf-8?B?R3lpMWx1SS9Yb1F2VGtyWmM1ZHRjOUNJRGJzMEt1eVpKUGF1bGtIYVY3UGto?=
 =?utf-8?B?T0d2NW9uRDVsa2ZmdExDNkJEbE1VR2thQnZRSVo3bjhwWlpBVW1DWkphVVk0?=
 =?utf-8?B?OVVBZ3pIS0J0cVppSE5aUExRdGtZK1JrZi9SUkNETXc0TlpldmRPdXZVUitZ?=
 =?utf-8?B?NjZqWGl4Tmh1SjRQL1g4eW9HeVdWUEh1Y0lnZm1SUURjeFp4S1VHZDJHcURH?=
 =?utf-8?B?OTFpeTdxclRuaVM4MmZYc0pjckRMZmFObEJYa1JkQlV1TG5DcFRoWFYrK2g0?=
 =?utf-8?B?S3FJaW9HME8xbDJGNjFwVFIxN29JcU9zaXBrMVZHSjJVak5OWnc3eUcxWkdy?=
 =?utf-8?B?VXNySklGc1pkM1hWcDFUQjhDemlKNnhVZnFTcHNWV2ZpZ2xpUXJoV0orNy9V?=
 =?utf-8?B?b3JwSG03cENiMUpqK3ZCOEJ3Y2VlOVVjSXppd2c4d0ZkS0ZZMkkyZlRid3RQ?=
 =?utf-8?B?Y2FRTWVMWmZiU0ZXUGFQV0M0NHZnbGtxQ3VOODJBSlJBR2FiUWQ3Yi9yd2ti?=
 =?utf-8?B?cG8rNUpiRkRFQjI3OFNmRi9kUWRjT3FBMzJjbXNELytudFJXbDZDY09TK3p4?=
 =?utf-8?B?Uk05N2xuY3lYeCtNcWdiQmZjVnlVZEQyVU9ZbmR4b0dqRGF2cmJZOEF5eGdh?=
 =?utf-8?B?ZkRKcHd2NGRhakdUcisrRVJ5Q0xWK2FrVXJ5VnJEbDllODczYmM4c05EclpW?=
 =?utf-8?B?WDF6aEQ3Qm9kcUlkV2w5TGhVdUhUQXFkWjhSZ2wwQmRKRkxoMG0yOHU4N0Fr?=
 =?utf-8?B?QVlwT2NCeTlnd1YyNjFJTDdaSkExSUxncEx2VktVKzNtamFGYUtvN3ZTQ2l6?=
 =?utf-8?B?MWZCV3pQR25NYkxGNEtmTTlCOWVLWVZtbWJ3c2UyQTc4VUtWY3BQKzFBUjVq?=
 =?utf-8?B?ZWJzT0h5Zml1cGxQUS95NFZ2dE8ydC9YOGRadGpNcUdFVXZlY3V5ZW1RYlNX?=
 =?utf-8?B?R3dDL04rT0hsT2NoaGJ4Q01LeDhtY1JJRk5XZ3hJQ0lZWVY3SGJRTWxaTkpN?=
 =?utf-8?B?SWpHNElOVXZuVU4vOC92bFNMT3J3a2UwemdEaFkyTTdXZFFxMFVTZXBiWWJa?=
 =?utf-8?B?YmJTMC9XRk5sNTFEbWI1aE5Na1AwYzFVdjR3SmRhRnQ4TEZvN1VuUXNxTGdw?=
 =?utf-8?B?Ky8wSGhudGg3QVArc0ZKYWVZNzlTT2o3SHVpV1g4Wk4veC9FSjVsZklQa0xU?=
 =?utf-8?B?ZWpHdW1EZWNPYUNNbDQvSVRkNitxNXJwUFFrU29tYkpCU0RZS2QvNllxYlJ4?=
 =?utf-8?B?NHF6TGJYaXVXQU5oWE1ja25hUmw0YUhjRmRXTzgrSWZGelpQaGVwaW56bmww?=
 =?utf-8?B?MC9Sbm1Wd3RyN25BMitxTENJQ2Q0OVZpTU40UWx3QURNa1V5T1hxUnpRUDBU?=
 =?utf-8?B?c1V5ZU1NdXB0dGpXVHE5LzNVMDNIYzBYZzg3cmR2bW9WVEhqOUtUOUErcHhv?=
 =?utf-8?B?TFFNenNmY3lQUjJMeWZ1S3RpbWNWVlNhT2Vza3UyRXc4c3ROVTJsbDRzU2dQ?=
 =?utf-8?B?RTdBN2R1a1BvWnBLQ3R6Z01KK3owYUlGejBLTDlnS3BkQk4vT01kdW4xVktQ?=
 =?utf-8?B?TER6b3h2UTJXYWI4RVlOMjU3Tm1sSE00ZWxybTRvdTRMUlB0UlhRY1VVN1N0?=
 =?utf-8?B?QXVMZU1ScFZKak0yNHdIbDJOT1E2YWQxdTZIbzFidTBVemhkUVYvajdud2Vm?=
 =?utf-8?B?L1F0WThLdzlaSHUzL1lqZC95SEFZVVByTjRKTjg1aWo3TnpOeHY1bXR5Mzl2?=
 =?utf-8?B?UEJHWWhsZ080ajJuS0FtbjRpL2E5T09NOUN1aXgxUTFRLzh4a1RrV3c3aldR?=
 =?utf-8?B?U2ZsOEdmRXFVNUFzTVppMDE2U2JmSUxuTWhkd0lkbWtGMkhTR1R6Q0ZUWjNn?=
 =?utf-8?B?aUNScVlad1BtalZHcWJkeW9UZk5pQWZEZ3pWeFVxVkpWR05CV2lTaW1kbUlB?=
 =?utf-8?B?MUVEWjFmTnZBeC94MUwvNUNGZGJNVjJMRWJiY0p4cWhpemtoL0ZBRFgzandq?=
 =?utf-8?B?SzFTTDdPSitDTThQMlBLQzIxbFZndnp2dXk1MFBUSnZyNkNDNXhZemlmaHd5?=
 =?utf-8?Q?Wg0zrjFo/369gBgWJjnd+7Wwb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3CB37D0B5DB3F4BBF76B44C552E14DA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	cD4PRkK9WKTlvIpV9SycfDSZdZZyrZwlDRrAMCcp7q2vK0OWNUIj+rByp28l0eOi5zj1bzzkbvKAfljKNRmC9fPvXsqI4M3MFXdbo+HSb2pGcoxi8cA9PV3a/vdJ77H+HNPiCcx8cTAMErxkNmhwZXK+7CWrIdddZ2OYHvt5GOPOrTdnK51AgncNy8OV75f8DxegAlUSidFcQleCsh4f5xBrGu8viFeq2qh35WDnMfZqu6uornzYqt0s/vtZ3Z9bix594BIYlE8cyYqSqA2sN/rYVRW2wvbcNyab5s3lMM4KaoRvlqok8JR9+Quijt6VAAa+jdtNhTlH0L2vlc4AXjYdf5KIghowFrJrpSLVJaZhfBA5sxRcRnzvGT7XQPAmTVl9bFBKTQc4cvQAViVlTKh0+3whBYWVJzJPj8v7ljz7zXRIcq87DAbA4duHzVBVObXZBKeL9BzULjHbeYKyL9E9etVy1Hr6ndijeChq6d09zvEPkU8UQEGEgdv5Jy2MYT9qcLdo4WAGg4tzb4FlfDpwErEZ8sWkKjfbrBS+rIKf+e5iQiI/DSVsefv9G2OpyVN7/rM//M7LimRLjNjAXQXtA5oIg6TSbtRD5S32j8GBvE+SnrfkVjBhPmwH/lJc9GIlExBpYt1T9APDq8UkIQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d421eca-97eb-4b85-2d1d-08dc8b41c9b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2024 00:43:05.2564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n3KSpbap+3ML0+mEySOwFay1lAhY8avX9RWuh2DAgQLWy4zplxwPI53RYUPZxCd9Ep2B/9Lc8TUOqrH46HlHeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7429
X-Proofpoint-GUID: A1Ddqb4VAs72oYn-dL2zgWL4sRx28w0g
X-Proofpoint-ORIG-GUID: A1Ddqb4VAs72oYn-dL2zgWL4sRx28w0g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_12,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 mlxscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 clxscore=1011 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406130002

T24gV2VkLCBKdW4gMTIsIDIwMjQsIGJ1Z3ppbGxhLWRhZW1vbkBrZXJuZWwub3JnIHdyb3RlOg0K
PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3Jn
L3Nob3dfYnVnLmNnaT9pZD0yMTg5NDNfXzshIUE0RjJSOUdfcGchY0N1elVzVUQtMmVQU3NkQ0Jn
Q09ETmdmdHVIMExoaVl5QnE2LS1BYnFLbVc1d1BCdUdFUUNuU2dPV2hFT2Y0clBpLW42YmQwMkhB
eC1WdkQwdk41NkdvbWlVeDFHSVJNJCANCj4gDQo+IC0tLSBDb21tZW50ICMxOSBmcm9tIEphcnJh
cmQgKGphcnJhcmRAcHJvdG9uLm1lKSAtLS0NCj4gUGx1Z2dlZCBpbiBhIFVTQjMgMTBHYnBzIEhV
QiAocmVkIHBvcnRzKS4gIFVuZGVyIHdpbmRvd3MgdXNidmlldyBzaG93cyBpdCBhcw0KPiBVU0Iz
LjIgU3VwZXJTcGVlZFBsdXMgMTBHYnBzIGFuZCB0aGUgVVNCIGRldmljZXMgY29ubmVjdGVkIGFn
cmVlLiANCj4gDQo+IFVOREVSIExJTlVYIGl0IGlzIGEgNUdicHMgaHViIGFuZCBubyBTdXBlclNw
ZWVkUGx1cy4gIEkgY2FuJ3QgYmVsaWV2ZSB0aGlzIHNvcnQNCj4gb2YgbWFzc2l2ZSBVU0IgcG9y
dCBidWcgaGFzIGV4aXN0ZWQgdGhpcyBsb25nIHVuZGVyIExpbnV4LCBkb2VzIG5vYm9keSB0ZXN0
DQo+IEFNNC9BTTUgdXNiIHBvcnQgc3BlZWQgY29tcGF0aWJpbGl0eT8gDQo+IA0KPiBBbnl3YXks
IHN0aWxsIG5vIGNsdWUgb24gaG93IHRvIGZpeCB0aGlzLCB3YXkgYWJvdmUgbXkgcGF5IGdyYWRl
Lg0KPiANCg0KQXJlIHlvdSB1c2luZyBBc01lZGlhIGhvc3Q/IFRoZW4gSSBzdXNwZWN0IGl0J3Mg
YSBzaW1pbGFyIGlzc3VlIHRoYXQgd2FzDQpyZXBvcnRlZCBiZWZvcmUsIGFuZCB0aGUgaXNzdWUg
aXMgbGlrZWx5IGluIHRoZSBob3N0IGNvbnRyb2xsZXINCnJlcG9ydGluZyB0aGUgd3JvbmcgcG9y
dCBJRCBhbmQgbm90IHRoZSBkcml2ZXIgaXNzdWUuDQoNCkl0J3MgYSBkaWZmZXJlbnQgQXNNZWRp
YSBob3N0IHZlcnNpb24sIGJ1dCB5b3UgY2FuIGNoZWNrb3V0IHRoaXMgWypdDQp0aHJlYWQgZm9y
IG1vcmUgaW5mby4gSSBzdXNwZWN0IHRoZSB0ZXN0IHBhdGNoIEkgcHJvdmlkZWQgdGhlcmUgc2hv
dWxkDQpyZXNvbHZlIHlvdXIgaXNzdWUuIEl0J3MgYmVlbiBhIHdoaWxlLCB5b3UgbWF5IG5lZWQg
dG8gdHdlYWsgdGhhdCBjaGFuZ2UNCnRvIGFwcGx5IGZvciB5b3VyIGxhdGVzdCBrZXJuZWwuDQoN
ClsqXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvNjkwOGFhNjktNDY5Yi04ZjkyLThlMTkt
NjA2ODVmNTI0ZjljQHN5bm9wc3lzLmNvbS8NCg0KQlIsDQpUaGluaA==

