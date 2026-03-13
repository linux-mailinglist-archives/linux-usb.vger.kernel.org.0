Return-Path: <linux-usb+bounces-34770-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOkRHLGTtGkNqgAAu9opvQ
	(envelope-from <linux-usb+bounces-34770-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 23:46:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB6E28A86A
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 23:46:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0924304875F
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 22:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2463DC4DA;
	Fri, 13 Mar 2026 22:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WU+QZIgd";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="COlt6iB4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qWVuRAm4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF203E0229
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 22:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773441966; cv=fail; b=TDajK6AMWHxETOm2/HgxqtVHYFS03+JbRtCDlJnOzHf0w2uSf2w5VfvCTheWwUsP9xm1ciNzEQfiXM74bZoDzlw4H55SFnU2t6Ylg3Fjgonhah8ULI5+A3VIdEHIrX8q46UeaxvLw/ThDIEbYyOP0Wq++lrQgDtUaMDOMW4B1pc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773441966; c=relaxed/simple;
	bh=I/aoArDt9jcjTMbGNyKP8X/HzuuPAf3kpPdV0tLNLck=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Wq9heAGXnpN5hAaYxsxstn69pAagBJ00D8yW9ZVZSCQ6YqrwAHFMBxf+seC1BsZSMnENzaRPe8qqHJikVQe4MkaBTmLvQwMS7SPw60fnvvtSzTsxKQfI5H25u1wanma7z84kfLh3nDl5efCRZxwKul/3YJuoqz0gBjPTE/+7hTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WU+QZIgd; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=COlt6iB4; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=qWVuRAm4 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DMTSuM1617478;
	Fri, 13 Mar 2026 15:45:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=I/aoArDt9jcjTMbGNyKP8X/HzuuPAf3kpPdV0tLNLck=; b=
	WU+QZIgd0xaEwsgnVSgvKcOKo9BVFwXhTrbnBrKwFt19ZPU5YlpQnYUm+YPamwxP
	92iDovpstdqO3pqMw47/losiWTr/i7R+QPNhjMkGbWnUGNwriISqlaIkX+6Gcs15
	i7WWLmkv7FbSWMeGfFLFZmsumALBWMskaGaI40jRr7TWb/65f1rGI3u7NMat9qKo
	/FQPIjqfiNTBvdJR33f0D1WL7Fy3FnZqQNY4unchlBW3kAE45BYjWDiPbmdJUAm2
	ryK/cEmqx/+am7wh5mGveGdjA8gB5FdlAo7CZgpt/mhVH2DYEwlXSPxUCfbg2t4s
	COvLBgZxDplYgT0gwTyN0g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cvfpkw0ny-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 15:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1773441940; bh=I/aoArDt9jcjTMbGNyKP8X/HzuuPAf3kpPdV0tLNLck=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=COlt6iB4qui4PSuOFj4EPMiUS3QUZMsEAHIdfXI8dtTSGq5LKivHLYSlpQS6eAvG+
	 91h/pU6p3R3ObxvqtEoCKlaJcGKZnCXWyGrUiGAyfMBUJGo5kfB4eDZ6kfIhNBffrX
	 5uqVChbThfMWwOS+YChWSDEOKng0u5aH7R8WqzzstEt7HM2UfaUpfjof1rN/uxW/xX
	 71BxLLTIXp8DfIzU3eLZAppp0o6IDxbI5NbJK08qwTIGxQrgvrDBfn0LZAbOrbfhb8
	 aPx2piAX/JwByeeLBsqER7rNRY7wYdQ1FOC8rlREB7pQsqKjJgyyrkbP5Gip5IkeaD
	 AE0u+fxcbjA4w==
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DA07340346;
	Fri, 13 Mar 2026 22:45:39 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 6AA32A0270;
	Fri, 13 Mar 2026 22:45:39 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=qWVuRAm4;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00103.outbound.protection.outlook.com [40.93.13.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7DF0B40529;
	Fri, 13 Mar 2026 22:45:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KpHp9/AuzRKYWpiDtt5RknVvFR0to6Qa/fIn6tHxVIlSbYpwOP6ryHO9eT1OC+MFK8LulIpCwPT9z3vKtzU0aBhh8CEyO6tOMlUM7GOGlVTlKUjsVoCwmnWAkJdmerIkDGSI6AsVkIoLqaCffZhBV9uGOCF4QVAJm54KtqA7aexDySsuF7mJLID1VzUcRx2Bz/BTDuTP97EDf0GlCiKBk8jquG8ziVUg0PPPEPZ6qV2ApDvIfL5qfIg6E7En95YfFERf7rUXZoFC3jsylEvK+9YDLmYEPVFAMAP3VHHA6FsOrnG7gmn/fYxUy5pOu1CUqUCmQvjq7/HOk/WYZicpGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/aoArDt9jcjTMbGNyKP8X/HzuuPAf3kpPdV0tLNLck=;
 b=bCL52r+vyxOFW85bpR5mVc1X2C9mux2KWdh9qc4C7HMw+gJ+GbY8v2UMT0RkjuxTkBQ4NA8RrafL8obmWDZQ6h0S8AMvfT/VaF/tDtJnwUyp6xZk6OrojG6oz6V7+oJdneWocURyDdWRKf/EG+56TbEy9jQiw4smveQtyITeSW7qtBJZOTsZMyeB3Vve98UiQruJE/7Plm4ZNeT7hoYgr9enZBjsysdFjQ/aLH21uUjTn2rV6D9ZZOrj4SnGq9xVyBRpkjfldFXIfqDnm2vhIG51vyGhcC7UzW6A9H7ZTdjPRtg4iqhraV/R5/XCIRFD/ANoIh8UFCGC3VjUlQ0P7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/aoArDt9jcjTMbGNyKP8X/HzuuPAf3kpPdV0tLNLck=;
 b=qWVuRAm4fC50L1AoObacp/ZOnidMg4xE/fMWTX5Mjq+SvQhzs6XmRry0ttOk5VoIZf7Xa5K+xAHCV/rLMeZ1rhU+qbfrypa/jeJwnmekT6BOjNvzTWi1/jlydbyZECrzkFqC8gozIGijrpzpPTqT8JdZPb1TnVIX/OGQ1SbAVdc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ2PR12MB8884.namprd12.prod.outlook.com (2603:10b6:a03:547::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 22:45:32 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9723.008; Fri, 13 Mar 2026
 22:45:32 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Oliver Neukum <oneukum@suse.com>, Michal Pecio <michal.pecio@gmail.com>,
        =?utf-8?B?QmrDuHJuIE1vcms=?= <bjorn@mork.no>,
        USB list
	<linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Thread-Topic: correctly handling EPROTO
Thread-Index: AQHcsij3bm/3l4J2S0+poPtO9iFJorWq8pYAgAAa5gCAATtij4AATvwAgAB6AQA=
Date: Fri, 13 Mar 2026 22:45:32 +0000
Message-ID: <20260313224528.dp6utjqzbdguwlbf@synopsys.com>
References: <261996a8-7ad4-4df2-a469-f6602da71255@suse.com>
 <4f85311c-bdfe-46a4-a310-4a74a3c56b3e@rowland.harvard.edu>
 <64dc9c5d-d662-41e3-898f-71587b940a2c@suse.com>
 <20260313085354.71a6dbf1.michal.pecio@gmail.com>
 <12567c7d-0a17-46a0-8acf-3158c2d9011a@suse.com>
 <9da0ac4f-12bf-4270-af6f-e08b5a89611b@rowland.harvard.edu>
In-Reply-To: <9da0ac4f-12bf-4270-af6f-e08b5a89611b@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ2PR12MB8884:EE_
x-ms-office365-filtering-correlation-id: 374d96ec-ed8f-407c-b4d2-08de81523bb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 7rFFi8amutBfurEB1NPOz8SEFtirRiugqXXa37tA7rRRiC7hGE6IMfWaBffhXsj0t6Ive1CGQY6yLukrIgQZicLxgkgrzdmJ8/mK39VkbK6XVMEvO4mu8WTtGBy6m9LsA96pAjbJK4fQ1zBMDjybtd9n3Xp5oSvbu4Vbe1RsLLarIEB0sLRidPJlDflja+ohzwZdZgo01d5hFWK1Xzlre5XIbD08Iq+laPXzjUkVxamI0BVOMAHTzujR9t4/eMB2KGAy14ijjBhvRjAbZWOJt0PSBvwIsyn69sZhKKYL7BaO/coU6NVwuTan2fY44rRq7ZlLU8Qpaxsr9YPbyoR2QX01ASCPrF6p4BYZT9XamVH0wUc8bjkc+oqISRbyGJ/WerX7FlX0F8O2L6worMKRHkvlJXCV/kuHome+WVMuNRGB5oUe9Z0inkQTzExxp4qmZZR9JIQ8iPiQr2plWYcpRQiu8WE4B4GoN37YglpaBU52FXKho4GcGJD5Hg+U2KFzF7/T2yhUFmA2Tv2S+8PKzOyBylhUvpmB1B2WdJDCzlHlH1KXl1/MVTwEoVqMUivw3s9uuaL1hf0kk780ldkuQzgiZ8fi8cc4iAl8B+z7a6yhhK2h9hMACGG3JuCcX0xvYuosIHX2Etyoo+c2E0tFfjuYOOrWIa4hWtu1Ma0qOI3CB18yYlYHv6mhQTgBPe5v9Kp1hsDVKe4EouAI5wpfg8f61gn0PSXbi96nxAo560zCpRNi1+0xLY4RaOta+Vv/oIO/Lw/Rz/lEHTb6qavPcsdrrSObL4kBPAD5jU8+zlw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K2w5MWlXK0FJZmkwWG9VYU5neXhXelZQdHVnVkRUQStPcXJMZ0dqcG81UEZn?=
 =?utf-8?B?V0dOZWZteExKS0FldThCVkVWaXQyajhsdStLKy9peSs1NURxTHZqKzNKV2Vy?=
 =?utf-8?B?UHlXQ2kvYUhXSnY2K0MyUmZiMkwxN3ZvQWdpR1dtWDBaQWJhK1F2bGZrZ1dE?=
 =?utf-8?B?THRUb09ZaUJlbEthbDNmU0V1alFkUHQ0dXlMb2VmQi94U0JJY0V6dS9nOUl5?=
 =?utf-8?B?Z2h3YmFSNEVvV2c0KzR3cFY5WmxMSHdOazg5Q3Q4SGZEY0VaOURFanpzS2RU?=
 =?utf-8?B?NE10NFcvZDdPVnRrNXRjWEdjc3ZTOTBkT09adm1Xa3RIcmVyNzZXTXBnK3R5?=
 =?utf-8?B?bjJ3Ry9FQzBycUlVd3B1SzM0TmRLdnc4RWtLUTI2WTc0K29paXVodmdXdWVW?=
 =?utf-8?B?OEszWUF4STNhVHhtVzU2bjIybHEzcllWZ0NIRjBlR09aQlVzbmUrY29PQmZH?=
 =?utf-8?B?Zk9lQ2pva0VpeWhqR3YyNm00NVlPOFhYR09yQlo3VnJicXphV3pFNGFCZnVQ?=
 =?utf-8?B?ZkdrdDBBaDF1cmtNTEVSOXNjSlBCNGhxTTlRWlh3cDNVREZVK3lNRC8veEhI?=
 =?utf-8?B?bnhUMjc5TXMrS0x5bWErRUh6TFBNdE10Q2lBZUtPaGg0YnNveHc4L1pFVFcv?=
 =?utf-8?B?Zko5SUUvOEpMV3JSdVhOZ3FTbnZwWXIxK2Y3Y2wwMzdGVjIwc0MxTmxEUFBL?=
 =?utf-8?B?bEFhaXFBNGdZK2JTeFM4ZlM3eVhHWG9rSnlLTm5QcTVITkVJeFNZVE1hZlht?=
 =?utf-8?B?aXdiOG5jK285ejZKaVExRThGUUNDeDNMQjMvSlk3VkhBbzVzYk5DSCtaZ1RS?=
 =?utf-8?B?YW0xanovSlNlQUdQd3RZcTJMRXRpYkVIWFR4ajhEbWVxRjdMK0hMdGlXN1NB?=
 =?utf-8?B?Um5vazhlbnRPM0FIbnRQbGoxcG1pZnZxSHg0VDlXMVZldnArZVREb29ldTB1?=
 =?utf-8?B?dkJsaUliZDNDUUNQOVZVeS9CUFMxYWRkMzlPNklFSGo2ZHVzSDJhL3lnNFRO?=
 =?utf-8?B?REdRZUVTWkE1eW1LVmRjU0RNbjBQTXRrZENzelBjbEUxTEpwS2RVWGZqY1Vp?=
 =?utf-8?B?TVFkdTYzakJUVU5jcmdIVkJuSDM5V0pqd3lWV0VNU2RabjZNd2p3TTdta0Q4?=
 =?utf-8?B?QUZiRWFuM0Z4S3BuTi9HMEFocTQwSjBRUXZad1dFdUdBZ1FaSWllMlRlbjRv?=
 =?utf-8?B?T2hnbVVhaWhvaEEvWGRKclhrdFZUV2lIUXgrSGVRUSsvUkh5VjNHZFY2S3Iv?=
 =?utf-8?B?RnJXWm9DdUhmbUxpZnBtNDkrVmNSZkhCY1RnLy9uVzRCbXNWRnM0dUdKT1VL?=
 =?utf-8?B?N2Y2K3lyaktYelhhekcrYjMyOGlqQXZjWmlYRG1NaXVkL1lhVFVacDJNUVJP?=
 =?utf-8?B?d3R1U3JPRU1FSFIwS0hnTG1OVkY0N1Rpb0tVaGZ4UldlbmNmUEo2YS9DNkg2?=
 =?utf-8?B?Q2NKNWlRMHExYWJzOEd5ZFZia1UyK0l5UThjS2RXOS9hR0VFVnd3WHh4VjNy?=
 =?utf-8?B?VlQrak1uRFMxZVEwZ2RQTXJVWERubWtiSi9udGNUdWFYTWR0RlRWYThjWWVM?=
 =?utf-8?B?dHBTdm5wUVloSHNUTXZqYnErU3oySjN6NFZnRnYvK3FpMDBKdmNEODBzWTFL?=
 =?utf-8?B?VCt6SW1pK1NGZlNNVUhTdXkvODA4M0F3TkFndGFpWUtUNm91bWFxNHI4M00w?=
 =?utf-8?B?T0hldTdrdHhSMW41VDIvQnNsb2RmMzRKb0ZodjcvZ1Njdmd6VW5SbmZ5V3dL?=
 =?utf-8?B?OE5PT3gwaE9vS282VkRVSklFd3R3aWJudmh3aXlMaEZScTY1U3J2YkVZMGRt?=
 =?utf-8?B?WlNHWnBBOXRHUWlxRjRUWlN1U3hERHdlS0lQY05jZkU1WFN6RkNFSjJ0cGdE?=
 =?utf-8?B?Rko0ZHFmWTRIV09jenlzdGhlQXBTOWdYVm83bks5emxkUERENG5ITmxkU3Zx?=
 =?utf-8?B?MnoxdzdnRE9TMVN1cGdEaWJ1SkxPMDF2Q055UTNrQ280RnI5MHMvOVdOMElh?=
 =?utf-8?B?L0ZJcDk4Z2phR1o0cVdlemwwWm1RT0ZwVzhNdGVmSU1aU01JS2l4UHkyUTlU?=
 =?utf-8?B?c3BTSmV0TnB4T2RWOUM0VHRWWEMxbGVWb0pteTh3OG5CbVhiRzlkcWlWVnl6?=
 =?utf-8?B?OW5NczJmRzREU3I1b25ramd5aExubGFZK21DMVVUZzNyNDhXRS9QUE5zRUpp?=
 =?utf-8?B?cng5OURvSDduS3I1VEszZTA5S0hxcjUxaDFBQnBHWXJJbGI3akdjREwzQXFm?=
 =?utf-8?B?QVkzTDV5bGkzRlBUeWVPRHVjZVpOcGJBVXV4WFV0NnYxT1RhQVMwcEdDM3pQ?=
 =?utf-8?B?UlB4MWxPYTRzelNrN0ZBeWZtbkgzZDBuSEFIUGppMWIvWmI5R3VGZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ACE944BC3BD21C4AB35D500C1E68702B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	uYurjZDjAgknnCajdVxudclngSjB8Mk1w5eeVPQnJ562LwwkaXa/41pFpJVe+rlSMz6IPamGFrArT7uI3MNY/w/JSO3reIgRThpoAzydaFb94LFrNWPpXlI9Ns5rNorsJsry53xUi2wZt5SGIFx1ZijeA5NiWGiY4j5TH/win3jU1t16PovlOyhPnJktdLMPNfupwlTQE7m3OJ2qsfBlkygpBW1wG3oo5gaXr/MlQVDTyBnhQpFK0QWGYsMYam8yKQJo4K0GObWWb7aU5f0szo0aC0fODX6ayoylrPzg4XHSFY8gGiTnUIkNOEPJ75hCwhqmkC4jL77vfhTF+UbZ1w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7mXScYkksUYisdlO5HNQDjOlbBJGqYKRAjzkQ6+Rp0rxFQLdZ1WF0jNCNXqv7eSBv4d3VYaunjbcn29xQhnU29bEzK+vkrMRZ6J5rp6ELsTOYbhs54sMJ3j0nCgs/0jr80QYp615ApVjNsTObJ5tKv5xhB8sUoDhKn5RRsrTVmAVJYgjoR9hvPqu13HAHhuv/M7NAKFdkuwCJmfvLmafACR/6v7JUCbLFHKg0m7UYXAphP3hEsXvmEEacCWYaOnGUHBCP/quiKAwr8ltfs4vXrM2BZP0GtMalvNFiWewRKTykeEHLxrdrFAkIc2U5eN7I7VL+iqPRGuIyVyaWJhFPxBW+xTjKapi4x9Hx1epbboo9yzvsARSwZLnerSWvUX9VaWk5UYu09dLbW4TLPO5B7/CCfqTclwfSAkNZsY+sva9gxdgB8eB9NWvPpOfvnvcf2vwNjoL1EjyAMsd5dN7mjYi16HauU1JbkgURUvJ/APX2w8k2vaVXafv2549EISbEBVfCMmWYHasjb9zqq3N3nHTH2KwvHXu53TeLZ/jSZQLCZLqZgX3fKGEwLUHxwOp2q9U6b+2oTdp2Y2HmCFg3SBh/r5iVDriAQQGDGZgAJMEvkSuOdaSfXdpMwSoUtO/gaesoZluckBsM3fDfCDLgQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 374d96ec-ed8f-407c-b4d2-08de81523bb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 22:45:32.2059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h2yPXgHB56r9Qj19TjycdcPr1Tu/vLw3APRHfqBJxSZwO3J+ckCCIcurrK9xRJiSA45a+9mPDof5F7BPZWB+MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8884
X-Proofpoint-GUID: A3dJuRLIdq6Z7IU3aE1-yx4BC_bU3dFG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE4MiBTYWx0ZWRfX8kdV1L/Iw9h1
 jUEksufOyLMWNfLoJ2eEbVE5lcEq+F4y02kFjnNLo/ai8BoXyDfPRQASrQgWhqIrh9NRz9UI6aN
 kWjFGAw0td5tUh3uvCAdeZfS80WlT3H4qXhquxFpVcPwCDgfCqocuRQdsydrbVFIRQJqqBiEzmX
 S5YFrHYA4/XFNmk60gxUcwE119niB8ByltsLutd8vQ5CXv22YKJHwHmudt4yLS6dsaTv+wo76d6
 p5C91irlat2Yj0o/PBkgBRQ9gWTFQ4kPe5NfWS9ED6qR42e992o1rz7OLn0D2MqztzirvSLGHa9
 K6EjW56e6xQNKnNvMIoLwbv4xN5FdxIP03yilUtX0g4SBH6JjUZj6DGjmcznouDhSb1208t0MQE
 U58pLzMgWhyipthpiG8Z7dJ9KeVXxoxRiBrvG647RNWtZL9Xk1HC0W/fVTM/XxAM4Sqd5N/13gn
 HRrJTguzDGfdRxxwOqA==
X-Proofpoint-ORIG-GUID: A3dJuRLIdq6Z7IU3aE1-yx4BC_bU3dFG
X-Authority-Analysis: v=2.4 cv=RJq+3oi+ c=1 sm=1 tr=0 ts=69b49395 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=wDsqrpqxZzOj0Yc8XGcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603130182
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34770-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,synopsys.com:dkim,synopsys.com:mid];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,mork.no,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CEB6E28A86A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gRnJpLCBNYXIgMTMsIDIwMjYsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIEZyaSwgTWFyIDEz
LCAyMDI2IGF0IDExOjMzOjQ4QU0gKzAxMDAsIE9saXZlciBOZXVrdW0gd3JvdGU6DQo+ID4gT24g
MTMuMDMuMjYgMDg6NTMsIE1pY2hhbCBQZWNpbyB3cm90ZToNCj4gPiANCj4gPiBUaGVyZSBhcmUg
YWxzbyB0aGVzZSBwZXNreSBzb2Z0d2FyZSBzeXN0ZW1zIHdoZXJlIGEgcGVycGV0dWFsIGltbWVk
aWF0ZQ0KPiA+IHJldHJ5IGNhdXNlcyBhIGxpdmVsb2NrLg0KPiANCj4gWWVzLCB3ZSBuZWVkIHRv
IGF2b2lkIHRoaXMuDQo+IA0KDQpUaGlzIGNhbiBiZSBoYW5kbGVkIGJ5IHRoZSBjbGFzcyBkcml2
ZXIgKGUuZy4gZmFsbCBiYWNrIHRvIHBvcnQgcmVzZXQNCmFmdGVyIDMgcmV0cnkgZmFpbHVyZXMg
aW4gYSByb3cpLg0KDQo+ID4gV2UgaGF2ZSB0byBhc2sgb3Vyc2VsdmVzIHRvIHdoaWNoIGV4dGVu
dCB3ZSB3YW50IHRvIGRlYWwgd2l0aCBmYWlsaW5nDQo+ID4gaGFyZHdhcmUuIEkgd291bGQgcHJl
ZmVyIHRvIGRlYWwgd2l0aCB0cnVlIGhhcmR3YXJlIGZhaWx1cmUgc2VwYXJhdGVseSwNCj4gPiBi
dXQgaWYgeW91IHRoaW5rIHRoYXQgd2UgbmVlZCB0byBpbmNsdWRlIHRoZSBwb3NzaWJpbGl0eSBv
biBhIGRyaXZlciBsZXZlbCwNCj4gPiBwbGVhc2Ugc2F5IHNvLg0KPiANCj4gSSB0ZW5kIHRvIGdy
b3VwIHRyYW5zYWN0aW9uLWxldmVsIGVycm9ycyBsaWtlIEVQUk9UTyBpbnRvIHRocmVlIA0KPiBj
YXRlZ29yaWVzOg0KPiANCj4gCTEuIERldmljZSBoYXMgYmVlbiB1bnBsdWdnZWQsIGh1YiB3aWxs
IG5vdGlmeSB1cyBzb29uOw0KPiANCj4gCTIuIFVucmVjb3ZlcmFibGUgZGV2aWNlIHByb2JsZW0s
IG5lZWRzIHJlc2V0IG9yIHBvd2VyIGN5Y2xlOw0KPiANCj4gCTMuIFNob3J0IHRlcm0gcHJvYmxl
bSAoY2FibGUgaXNzdWUsIEVNSSwgc3lzdGVtIGxvYWQpLg0KPiANCj4gUmV0cnlpbmcgbWFrZXMg
c2Vuc2UgZm9yIDMgYnV0IG5vdCBmb3IgMSBvciAyLiAgVW5mb3J0dW5hdGVseSB3ZSBjYW4ndCAN
Cj4gdGVsbCB3aGljaCBjYXRlZ29yeSBhIHBhcnRpY3VsYXIgZmF1bHQgbGllcyBpbi4NCg0KVGhl
cmUncyBubyBuZWVkIHRvIGRpc3RpbnF1aXNoIHRoZW0gaWYgd2UgaGF2ZSBhIHByb3BlciBmYWxs
YmFjaw0KcmVjb3ZlcnkgKHN1Y2ggYXMgcmVzZXQvcG93ZXIgY3ljbGUpIHNob3VsZCByZXRyeSBm
YWlsZWQgYXMgbm90ZWQgYWJvdmUuIA0KDQo+DQoNCjxzbmlwPg0KDQo+IA0KPiA+IFsuLl0NCj4g
PiA+IFN1bW1hcnk6DQo+ID4gPiANCj4gPiA+IFJldHJ5aW5nIG1heSBvciBtYXkgbm90IGJlIHBy
b2R1Y3RpdmUgLSBzZWUgMS4NCj4gPiANCj4gPiBEb2VzIGl0IGh1cnQ/IEZ1cnRoZXJtb3JlIGlz
IGl0IGxpa2VsaWVyIHRvIHN1Y2NlZWQgaWYgd2UgY2xlYXINCj4gPiBhIGhhbHQgYmVmb3JlIHdl
IGRvIHNvPw0KPiA+IA0KPiA+ID4gSW4gY2VydGFpbiBjYXNlcyByZXRyaWVzIGFyZSBpbXBvc3Np
YmxlIGFueXdheSAtIHNlZSAyYiBhbmQgNGIuDQo+ID4gPiBFeHRyYSB3b3JrIGJ5IGNsYXNzIHNw
ZWNpZmljIG1lYW5zIGlzIGluZXZpdGFibGUuIFNlZSAiVVNCIHBoaWxvc29waHkiLg0KPiA+IA0K
PiA+IFdlIGFyZSBoYW5kbGluZyBlcnJvcnMuIFRoYXQgaXMsIGNvbmRpdGlvbnMgdGhhdCBzaG91
bGQgbm90IGhhcHBlbg0KPiA+IGluIHRoZSBmaXJzdCBwbGFjZS4gUGVyZmVjdGlvbiB3aWxsIG5v
dCBzZXJ2ZSB1cy4gQ2FuIHdlIGNvbWUgdG8NCj4gPiBzb21ldGhpbmcgcmVhc29uYWJsZSB0aGF0
IHdpbGwgbW9zdGx5IHdvcmsgYW5kIG5vdCBwcmVjbHVkZSBnb2luZw0KPiA+IHRvIG1vcmUgZHJh
c3RpYyBtZXRob2RzIGlmIGl0IGZhaWxzPw0KPiANCj4gQW5kIGFsc28gYmVhcmluZyBpbiBtaW5k
IHRoYXQgcmV0cnlpbmcgd2lsbCBoZWxwIG9ubHkgZm9yIHByb2JsZW1zIG9mIA0KPiB0eXBlIDMg
YWJvdmUuICAoQWxzbyBiZWFyaW5nIGluIG1pbmQgdGhhdCB0aGUgbW9zdCBkcmFzdGljIG1ldGhv
ZHMgDQo+IGludm9sdmUgbWFudWFsIGludGVydmVudGlvbjsgdGhleSBjYW4ndCBiZSBkb25lIGlu
IHNvZnR3YXJlLikNCj4gDQoNCkp1c3Qgd2FudCB0byBnaXZlIG15IDItY2VudCBoZXJlOiBJIGV4
cGVyaW1lbnRlZCBhbmQgaGF2ZSBzZWVuIFdpbmRvd3MNCmRyaXZlcnMgZG8gcmV0cnkgZm9yIE1T
QyAocGFydGljdWxhcmx5IGZvciBVQVNQIGRldmljZXMpLCBhbmQgaXQgd29ya3MNCndlbGwuDQoN
ClRoZSByZXRyeSBpcyBub3Qgc3BlY2lmaWNhbGx5IGF0IHRoZSBmYWlsZWQgVVJCLiBJdCdzIGEg
cmV0cnkgb2YgdGhlDQpVQVNQIGNvbW1hbmQgd2hlcmUgdGhlIGRhdGEgYmxvY2sgb2Zmc2V0IGlz
IHNwZWNpZmllZCwgYW5kIHRoZSBlbnRpcmUNCnRyYW5zZmVyIGlzIHJlc2VudC4NCg0KVGhpcyB3
aWxsIHByb2JhYmx5IG5vdCB3b3JrIGZvciBhcHBsaWNhdGlvbiB3aXRoIGlzb2MgZW5kcG9pbnRz
IHdoZXJlDQp0aW1pbmcgaXMgY3JpdGljYWwgb3IgYXBwbGljYXRpb24gd2l0aG91dCBjZXJ0YWlu
IHN5bmNocm9uaXphdGlvbg0KcHJvdG9jb2wgaW4gaXRzIHRyYW5zZmVyIGhlYWRlci4NCg0KQlIs
DQpUaGluaA==

