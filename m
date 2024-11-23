Return-Path: <linux-usb+bounces-17805-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 672D99D6693
	for <lists+linux-usb@lfdr.de>; Sat, 23 Nov 2024 01:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7BFD1612EE
	for <lists+linux-usb@lfdr.de>; Sat, 23 Nov 2024 00:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F95E29A1;
	Sat, 23 Nov 2024 00:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="tZdjgZgV";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YddEYL1x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KjFQh7j9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B5111CA9
	for <linux-usb@vger.kernel.org>; Sat, 23 Nov 2024 00:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732320147; cv=fail; b=ZSpJ8dsbNAO1HmVPuvNXurJwMU1MrdbpFTXx66Vn7YqtyViyqtY4TY+65j/4BM4s56zB9wxuC7661RHPZcvpfxf7VMrys+Cooxxe3b9AnN2mvca4N8cB8/bxwdGfifS1hOG3KwAvAwFWkO6XKJeKBQ9oBfBT638tGEQZ+PgIKCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732320147; c=relaxed/simple;
	bh=CNA3SxNlrMB6dovVdmP4bO68YDYw+7RvDPWB/0Q6vwU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o+iKnCssMPG+TvPeJjt07+1tTLagLQkZ1gYylzMTRHQs2L/ulddLqIRb9+jXpkUTUD4BZZd7LIHolG/OPPSdODm3v0010VmRDzwxRqHTiwH9HQA53xBvPz7qpEaediiS8DVQ8SEa1zhQNKag27wbVVO7CX5tZmqwtyZ8P6m/uFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=tZdjgZgV; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YddEYL1x; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KjFQh7j9 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AMIYisn008364;
	Fri, 22 Nov 2024 16:02:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=CNA3SxNlrMB6dovVdmP4bO68YDYw+7RvDPWB/0Q6vwU=; b=
	tZdjgZgVyRpTU1EaDMNpcBs5o2yNQ9kRChW8hCEggIMe+yOL80iSpZ2xk5jxkW6o
	Kb8X5sOuNjCwKvybBDMYNKYpv/wdwML3tkq1CQGepRy9dgtS6KcbnqPW+OhSuPJg
	4j+VW56Ovy5Fio4S7TWAfmX7oM1wVv0TV+YMgz1/28Q+TYWwJXmg4B/l4egkjW1Z
	H4XgajPlSDetg3kZIMq0elcc9Li9lkOP8MpaKZdEYWn44kIU1yiFR0HGrKnCDnl6
	EJBEO7LX2XQuaedN2waRIdhHDHbjLMA2OfLBOiU8lE+2Q0pYJJDd2WLx+0Tfx5a6
	pq6q5mmD5rVK8qLUp46Y5g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 42xtwjuyrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 16:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1732320136; bh=CNA3SxNlrMB6dovVdmP4bO68YDYw+7RvDPWB/0Q6vwU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=YddEYL1xTIVUxze7uZgf0DtD/1oynQayLNPfPYh7AjlKpk/hyvLdtt2cOOlpz0dTT
	 NAzPxOmGeiuhUpuLkFGPpAF5WHVKwWBQuAH9U7p1nnM5efL92wH9zVDk8Wb1HEg232
	 ij0uEIUZWjwQzBtmwVbTBEqCgGEHHWRcrPw/coPKc/BW9tcIZPKO0tLFVhuBU9Apjb
	 Ilc2vBFnFudJ+EloVesIoX2j4kNsyFSVCPJODLk1DRoibaOLszmxq4HMNi4k0Z94KN
	 8pFwjs6bj4JWuk2ZWxG1LqGv1YA0WejtPIJS3iyZ+HJPA5UgqF4xU63+ova9JbTg+A
	 HG3atkY6p8N1w==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6551B40136;
	Sat, 23 Nov 2024 00:02:16 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 4FE5AA0065;
	Sat, 23 Nov 2024 00:02:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=KjFQh7j9;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id BA582405A3;
	Sat, 23 Nov 2024 00:02:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjI8/p9dN39PwXefb5qq5aqZMhjovVbCbCzHk+Kmo594deeT5qP0NbWFGZtPz3YpW105SwK92m4YIPwcnlxjGzLe1PzgpUoil/tp60/BppyJjIDD70NJlIQlbvaZi/BPJ9ojO8XBCvYjldDYGG+xzuFNEYKl1tKY+FR/oittlwMrMS1S5dlp4yOE6Z+H8uVg9rMrDW69mGo//CSxiqIhH75wqWzFCyEVHFY73K6FPQ1dp5jfSWjaT1jfGx8D7D4axbjP1jfzA9n5/tnHp/HUCZtvU15QRcd+M9zrJoHvaZgSs2gHTWDngr0HS3xugMXSNXOLLp3XSaDrlBrRNr0qpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNA3SxNlrMB6dovVdmP4bO68YDYw+7RvDPWB/0Q6vwU=;
 b=pUEeGWwC5OIao20oTSFPwng+vwnHW5jx3SO5enEsBnOSy82OfbljmlkkEqhgbeeFbde33+p+rh2bRS9d26tDt+EQNPMzxhFvx08P0SToBiGQYQ5GFS7hqgj8g3kaJ3W8uUXXqxgO0Mwno5NjVeIhTEpvbGI+TfGYocLMzZvgnio/Qic/DEPHr3k4QCu8itTb2+KAFGCWR7+jS+f6J87U66KsPeFrJ//Y9O/NpLysMz+jg1PDMGYHFnHZsxm00KGh/6xF0fuzIEhNwpf02ia4YkvbcfufxsSfnYli7+7zet/8ZubRtlRGyAvGPJ5WX/RJSUCoNn0HTmSHan67zczwDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNA3SxNlrMB6dovVdmP4bO68YDYw+7RvDPWB/0Q6vwU=;
 b=KjFQh7j9EQ93gUqSXWcJPqgqxp9D65bcszdfK315WSnqAO4YMeBGc74xbozXKTjlLyK5hupfoHjdAlF8Mf3aBexXt3ZvxClT4UA8OPc6G6DXi0OpJw7vu2AJ+GpFnLJPEYWefxFIlyphGuCol3y9Rlt3r/P5LKCJ7N3rqsOcx7s=
Received: from DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) by
 IA1PR12MB7663.namprd12.prod.outlook.com (2603:10b6:208:424::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Sat, 23 Nov
 2024 00:02:11 +0000
Received: from DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::e2e0:bc6d:711f:eeb]) by DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::e2e0:bc6d:711f:eeb%4]) with mapi id 15.20.8182.018; Sat, 23 Nov 2024
 00:02:10 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: =?utf-8?B?TWljaGHFgiBQZWNpbw==?= <michal.pecio@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "a1134123566@gmail.com" <a1134123566@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Inquiry about the f_tcm: Enhance UASP driver work
Thread-Topic: Inquiry about the f_tcm: Enhance UASP driver work
Thread-Index: AQHbO7xmD/jJAOa+EECV26D4vP1gsLLCkxUAgABd64CAAQ1ogA==
Date: Sat, 23 Nov 2024 00:02:10 +0000
Message-ID: <20241123000209.5qowmsx3dxianl64@synopsys.com>
References: <20241122022146.ykwhz4byhy645njg@synopsys.com>
 <20241122085755.29cebea1@foxbook>
In-Reply-To: <20241122085755.29cebea1@foxbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5984:EE_|IA1PR12MB7663:EE_
x-ms-office365-filtering-correlation-id: e108a0fa-3de6-481f-84b0-08dd0b521404
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|3613699012;
x-microsoft-antispam-message-info:
 =?utf-8?B?dEM3cDJKZWdTMjBWWVo0S0kvbmErelVlb2hBMEpINnNJLzZZSXpKUERSQmZT?=
 =?utf-8?B?ZHN6MmR1Ry9TODBxbFBPRDVBdk5NREx3a2lsYlk1bGhXdkNDSUtHVER2Q09l?=
 =?utf-8?B?blRnN3FkWUZ3eEh6Wk5UVWUvL0p1U0Mzck14aklENi8yTFJUZzJabFNSeVl2?=
 =?utf-8?B?alV4aENoQ1VyWHNDUVVBSm1JUytMejczSGh1aUtWeTVsMU1CdTFYVFdmOElm?=
 =?utf-8?B?TjJoRlZCanQvN1JsSWlGcjdMZSszSnJxejJETzlZMlppUVpsb2lRU0g5Ulhh?=
 =?utf-8?B?eUZ6YkpwR2NELzc2bWd1b1NLTlAySGt3ZWttKzh4ZmRpRithWXFna3hWeTcy?=
 =?utf-8?B?M3FMWnpXOGVjUEhwSndOT2U0NGw0aGdTbE54cGZyaDY4QkUybjRQNk5yR0w4?=
 =?utf-8?B?NDEzbWxkR0taSTUrRG45NWlXOWY4WU15NDVTdElzYTk1eCtTcm5aOW43QXBQ?=
 =?utf-8?B?c2VIQTlzcW9DN0t4dE11QkZiVnFnZSthSTdtWHNOczVGemtDeU1xbzBibkVW?=
 =?utf-8?B?My9CVW5KT05XRXQwdFAzZkt5WDBMUU9PLzdTTXlnUXpQZ0wraVVTdGJwZEg0?=
 =?utf-8?B?VDZBcWpDL3RTYXJRU0xkRzhaaDJjeTZmSGRuSG8zb2V6QUluL0IyS2xxZ3V4?=
 =?utf-8?B?V0RCcnV4YzNIdXZwZU9DS2cwSXZFSDh2bVYxckpqNklXZ1NGbUdhb05oRVRC?=
 =?utf-8?B?MGtad1h0bGFiY0N4MHRtclVGa3VEbEhQdit5bjZQZlNLd3JOem5DREZ5RDVm?=
 =?utf-8?B?TnJiTHNVRUtkbTY4UzNBdmVuZGZKR2oxbWVNRzhjazNHUXZ0a2VNODhXZUJY?=
 =?utf-8?B?YlhkR2JLUjUrTDNuTTVJMnVoOUpxbk5aa2lBQ0QrY0JhVXRReUJ5UUljeTNX?=
 =?utf-8?B?U0txTW42S2x5R3FMTEVNbGVKNjNEN09YUjFFR1ZsdTg3aHhjaWdUWEo4MENK?=
 =?utf-8?B?MWpsd0dKVC8wTE80N2FiNlBRUGRhRGhQYVNSdXZ5Q21Fd08rc09lWitLOGNM?=
 =?utf-8?B?dFZ6SmhSc1VzTzYvWjdIN3pYeG8yTEovOUtLQndQVVh6VWUxcGpZM2t1bXds?=
 =?utf-8?B?VVFLZ3RwT1FPVEFKZW1CdFp5bnNVRno4SHFyZUFtSFkxTUowcTRobWZFclNW?=
 =?utf-8?B?b1ZEcGVGbEhqZmt5SlNnNjRydmlkdVFOMzdOZjlKdlNFVWx1UHVOT2ZHdG9Q?=
 =?utf-8?B?VTA0Rm0ySlRWSEZ0Ykg5ZmV1L1UrdTFrd1R4TW1IU05ja2NqUSs3bDU5NXZI?=
 =?utf-8?B?c2dTenR3MmlDOE9Qdmp5Q0x0NjVlV1pPWjRBVDg0QWpBMUFxeHVZamJ3elIv?=
 =?utf-8?B?dmM0alVCbkViYlgrQlhiWGdRVko4SXY3bWZ4U0tPVFAxTHNtd0I5QVpZTHdB?=
 =?utf-8?B?NEVYdURPcTdxWVk1QnNvUHdQbkxTU1RnY2Z0WVk1ZzhiOFA4UlpMYitFRXFX?=
 =?utf-8?B?bHlLcmF1TU5nYzROemxaL1JvQlhhRWxLcUJmckwyVDUrYUZwOVp4NEI0T2ZT?=
 =?utf-8?B?WndSY1kvRUZEN2srS05hcmwzWGEvb25ycnlNc2JneXRjS1lLcDcvMnk2WGo5?=
 =?utf-8?B?UXMxdXdmNnNlVitzNUZ5cGpHZjhYNVRmZmlLUWlCa3RUSzJIS3I4R3lyc0hL?=
 =?utf-8?B?dkZMdHBDQjRlMzZyYms1QkFFYktMQVp1czAxNUdaOEFCdnVaaDR6VkhaaXlv?=
 =?utf-8?B?OVkrWkNVTldiN2x2ZkdNRlpHNGVwK1A1NnF1UHJvMHJUMzlRdmQxNDJYS2JU?=
 =?utf-8?B?dEx0SjFYZ3h3dUt5SnkxVHQ1L3p5bUhPd3lSY3dkcmEvQklNM2taUGw2L2xE?=
 =?utf-8?B?a1BCSlNIcVJTVGFSSWJQY1lnQjVuSm1wQzU4SEZMYTlJOUFSbldDNTlCcHVW?=
 =?utf-8?B?YjgzTDJybDBHcnRDTnFTZjBtSGV4d1hJQlp3bllFaGhtV2pHOWJnaWpmZ2xB?=
 =?utf-8?Q?JaKZMtClXsBp+mfURVPLYfK+j/vlYQJG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5984.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(3613699012);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TlBDUHFrNUdLOWZOT1hxTDJjWlJBdmlhaDM5UEcrbnFsQXB2KzJHWDF5VEd0?=
 =?utf-8?B?T0ozVFNLR0NDL1d2aXQyMUFpeHhhdEg1V3ZNRHRJd0tTVCtXRXBVN0tLZm9J?=
 =?utf-8?B?WGJneVE0VXd5MnUvYStmYTdMbko1dDRSUVR2aFhwcVJDdjRRT05xamhqZVZy?=
 =?utf-8?B?VGEyRFRMVm5yQ1BpOXpKSTN2NE5sdHdaSXRQSXN3VmNveHhqYW9tSEZJNUxj?=
 =?utf-8?B?RVRZK2xlVldPWUdMM0VERlFCSHpzQkl1bS9xcExvTld1V1ArY2pUUzMwWDEy?=
 =?utf-8?B?c3g4QnlmWUdHaE96QUwvV1c4d1prZGxnMm9QZGZTRG9LaGNkaU00T0lqdFov?=
 =?utf-8?B?WUZUQ3VMNTZ3VEwrRzJHaThlYk5DREZpUU5HTXRMWktYeGxyUDNZVVFTd0tR?=
 =?utf-8?B?Zk5URGVhT0djOUlQNlo4MWFob0phd0RMRm1LNTg3WnA4YlR5TTRYR3hGbExK?=
 =?utf-8?B?cEdNYWwwUkRZckxsSER2RGMwQWZ5ZVNrUGQ2T0RSTHFLL1paVE45cWg2Y3RL?=
 =?utf-8?B?OXN0dEw3bEV2akFjaEQyc3h1RDZaVFA3WVRIbG1hR0wxcDVKZURDV3g3a2J1?=
 =?utf-8?B?akQxUGdDOG5VSmVNVlIzK3ZsUFRSVWZjT1ZQbkN0N1BQVGVFbjhnVmVqa0ZH?=
 =?utf-8?B?OTlpMzVLeDBkc3hMNE9CYVlETHYzeDZpR2ttRzEzNjNKVC9VUXhEZ3M0cTlW?=
 =?utf-8?B?aUZ1VjhOclVSSUphZmplMGRDQ1V1MjYxZ0FNeGtmelk2a1hON2lsUm42elps?=
 =?utf-8?B?dU1kSzR3b2RYTTMxZytoOVlPNGw0SSsyT2M1SFB5U3dFWXV5OVF3WjJqWWg5?=
 =?utf-8?B?RXRTSnhMdlIzN3B5Qm9sNXJGOFYvTFZKakNVQTBjZ2pRVFV5WTNzZitEc3Jj?=
 =?utf-8?B?Q01qL0N6WXpGeHVsenZ0MDNlbmhicnFyNGlxdzBBWElFRWl2VHFFQ2lYUTNO?=
 =?utf-8?B?YXcvdWZlMnFldERJa3FaY0JmWUdsdXhJNW1ZVUJzRm9mUjlGR254Vk9uaEVN?=
 =?utf-8?B?Wnl5amN3bnNveHhBWDY3a1RPNjNDY1hlNDVmbWZxU1NpaUZVR3dVWlRnTW1a?=
 =?utf-8?B?MjIyVzl0RHpDcm00NHM2KytnQ2M0b3F0VnYzV0xYNVZSRU13N2Q2R0toUVJL?=
 =?utf-8?B?QnN0dzQ2L3M0cXg5amY3WDFPVU9CVXpkSGZVV0ZsU2h6d3BqV2UxbU1lYTRn?=
 =?utf-8?B?cCtobXlRZTRsaStqNWlua1pueE9DTGFGa2h5ZWxsejNWOU01L1hZQlFYZjN1?=
 =?utf-8?B?cldvYlVtc09XdHNiQkhQMFV4blUzTCtiWC9KUkFCV1VZY1JKVWhNWVJKaFRy?=
 =?utf-8?B?c00vbkZ4M2tFNjNveG8wREI3THpWQ05Wd0NwNVpjcmhMYjZYbkhnZEtwTnd1?=
 =?utf-8?B?dTltdUpvZEFkakE0UEVLMlpVcTZScFRYSC9lQmhUM1Z0M1EySVVlV2lTRVVW?=
 =?utf-8?B?clVLNnhKOG43SlRqNWJLYk5RSWJWRG9jQlo1UHdOTmpSUzB5enpPQkV0VFFh?=
 =?utf-8?B?aE5BdndVWlhEcUdyTm9icmtudG5rc01sMlQwKzB2WjVtQnc1UVhFbTg5S2VV?=
 =?utf-8?B?Rm5Tbm1BUkFxMjlvTDArTVJoYWRxa3RlQzdIUUxZWFBtU2h1Nks0WVVOYmMz?=
 =?utf-8?B?ek1CYzBtcXIrSGFsTjVXbUZSTkI0cjFacTdxMi9yMnNseFFjZXBDR1NUY3Jk?=
 =?utf-8?B?T1VpdVlHZi93Yi9VeVBrWHN0QzNjR1BrZzdhc2Q1bGJoR3hpYjlrQnFOaytZ?=
 =?utf-8?B?SVMwWGhxaDlpUkY2Z2E4YThCaXRhRmNMR2RNdklvKzNLM0trbjZWcklFK3U3?=
 =?utf-8?B?cFhVRkZBZkR0RU1QNUR6Zzl0L1RjYm4xSHc4M2JaKzlveVRGWFo5WlN1Uzdv?=
 =?utf-8?B?L0I3UFZWa0xnUUkyb08zSk9KV2tNeFNRT0gxQzEwbDZhaGFyeDRVSy9IcE0y?=
 =?utf-8?B?OVU4Q2dUaEt5MGJwTnlNK3ZTUkhmVFQrWm5lOEZFZjF3N2QzMkhVaVZHcWtz?=
 =?utf-8?B?N2tZTmJxV3AyT2owNS8wdUdwR0MzNGZhUmJuMVdaOUJRbUtUZGp4bmF0dHl1?=
 =?utf-8?B?OTNLRUdLMkxDSkVnajRXZWFuZ3B3T3dFdHZVUzR6NXRXVFVzaTNidjgzUVZR?=
 =?utf-8?Q?tciFIMfCSf9tUsx/mgriqYY/u?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B108D8A0B9498A4A9E38B186A56B9B4F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZYThHcke+5GzHdaoZE+FEKiBNfzlP33nrwFbwGWStl2dl6CIJRqEPgjn00z0b5L60nb6ixPJJczkeKlvKgmyoHuB8aRx2Lo9GAWSbG0eKFY7lN7gzIZCAhSQIyrLcOJI5hXgmUiXrMCaRksj8SxCX9Vg4CE0rkMIkmRyqkHbwwC3sOL26Gag2K9LDcaInsH3onFrOVclyHumG6ip+N/PesesyHcH/7jajE7EBSGpUVnmEidup/cFbC3apXNFgs9unI0De5jJNztAxOMyyaOciGZ2W8PWfGTINiNqjNykm5BPK6HmJvwh0aE5rL/j+pjPu3m/CEzbd17sgUeEAqf/eXtAB0Z/RmOPbm9hXH+aDWF0msew/vfNV993/jDyIE79J7uB4ruXggnsBM8tIMk7cJ22xRyDqp/pAig3lT892QY+UqHdhC8pVvmwqCcUjQ+IlN4fBBOs+t2LqboagJbrhOkOfMp5J9vei0aKjyRv2OynAAYMncqP+AkS6QbcPdlzmgnEuvV8QPkk4u926gDDjKAr7VF9CFHfyFejcWMCt2LzUgMKyYpx2xZlY6GFiCj9vOEH93P53WbyQNxJ6kpocy6wSKYs+l6Op8phZdYxuAphdE6eTNe7UoppI3zVa4bQqRZHPdoZPyUDgfcGkY3RWw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5984.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e108a0fa-3de6-481f-84b0-08dd0b521404
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2024 00:02:10.7169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MO5pJwy8xLn1qIzCr7vD7agsDTiBra0FbL2WS3MhSNpd3qFN5/ZPFTTtUUyW4EybqGT9MeEr/wRkbQZv558h+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7663
X-Proofpoint-GUID: DaZupacIPqWSNZnTrNm1hsRopCNstlxn
X-Proofpoint-ORIG-GUID: DaZupacIPqWSNZnTrNm1hsRopCNstlxn
X-Authority-Analysis: v=2.4 cv=P6pohTAu c=1 sm=1 tr=0 ts=67411b89 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VlfZXiiP6vEA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=Y30hO1xQ99KgCwrD9c4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=973 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411220203

T24gRnJpLCBOb3YgMjIsIDIwMjQsIE1pY2hhxYIgUGVjaW8gd3JvdGU6DQo+IEhpLA0KPiANCj4g
PiA+IEkgdHJpZWQgdG8gdXNlIGl0IG9uIGR3YzMsIHRob3VnaCBJIGZpeCBzb21lIG90aGVyIHBy
b2JsZW1zLCB0aGUgaG9zdCBzaWRlIHhoY2kNCj4gPiA+ICh1YnVudHUgY2xpZW50KSB1c2luZyBm
aW8gZm9yIHN0cmVzcyB0ZXN0aW5nLCBhbmQgSSBlbmNvdW50ZXJlZCB0aGUgZm9sbG93aW5nDQo+
ID4gPiBlcnJvciBvbiBob3N0Og0KPiA+ID4gWzE4ODM2LjA5MjE1OV0geGhjaV9oY2QgMDAwMDow
MDowZC4wOiBUcmFuc2ZlciBlcnJvciBmb3Igc2xvdCAzIGVwIDEgb24NCj4gPiA+IGVuZHBvaW50
DQo+ID4gPiBbMTg4MzYuMDkyMjExXSBzZCAwOjA6MDowOiBbc2RhXSB0YWcjMTEgZGF0YSBjbXBs
dCBlcnIgLTcxIHVhcy10YWcgMSBpbmZsaWdodDoNCj4gPiA+IENNRA0KPiA+ID4gWzE4ODM2LjA5
MjIxM10gc2QgMDowOjA6MDogW3NkYV0gdGFnIzExIENEQjogV3JpdGUoMTApIDJhIDAwIDAyIDVl
IDMxIDAwIDAwIDAxDQo+ID4gPiAwMCAwMA0KPiA+ID4gLi4uLi5tb3JlIGFuZCBtb3Jlcy4uLi4N
Cj4gPiA+IFsxODg2Ny4zNjkxMThdIHNjc2kgaG9zdDA6IHVhc19laF9kZXZpY2VfcmVzZXRfaGFu
ZGxlciBzdGFydCBbMTg4NjcuNDUzNzk2XSB1c2INCj4gPiA+IDItMy4yOiByZXNldCBTdXBlclNw
ZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDQgdXNpbmcgeGhjaV9oY2QNCj4gPiA+IGFuZCB0aGUgZ2Fk
Z2V0IHNpZGUgaXMga2VlcCByZXNldHRpbmcgY29uZmlnZnMgYW5kIHByaW50aW5nIHdhaXRfZm9y
X2NvbXBsZXRpb24NCj4gPiA+IHRpbWVvdXQgKHNpbmNlIGR3YzMgaGF2ZSApDQo+ID4gPiANCj4g
PiA+IEkgYW0gbm90IHN1cmUgd2hldGhlciB0aGlzIGlzIGR1ZSB0byB0aGUgc3RyZWFtIGV4Y2Vw
dGlvbiBvZiBkd2MzIG9yIHNvbWUNCj4gPiA+IGxvZ2ljYWwgaW4gZl90Y20gYW5kIHRhcmdldC4N
Cj4gPiANCj4gPiBUaGUgZXJyb3IgaXMgLTcxLiBUaGlzIGlzIHRyYW5zYWN0aW9uIGVycm9yIChj
b3VsZCBiZSBhIENSQyBlcnJvcikuIEl0DQo+ID4gY291bGQgYmUgZHVlIHRvIHRoZSBob3N0LCBk
ZXZpY2UgaGFyZHdhcmUsIGVsZWN0cmljYWwgaW50ZXJmZXJlbmNlLCBvcg0KPiA+IGV2ZW4gdGhl
IGNhYmxlLiBObyBsb2dpY2FsIGlzc3VlIGZyb20gc29mdHdhcmUuDQo+IA0KPiBBIHRyYW5zYWN0
aW9uIGVycm9yIGlzIGEgdHJhbnNhY3Rpb24gZXJyb3IsIGJ1dCB3YWl0aW5nIDMwIHNlY29uZHMg
Zm9yDQo+IFVBUyB0byByZXNldCB0aGUgZGV2aWNlIGFmdGVyd2FyZHMgbG9va3Mgd3JvbmcuIEkg
c2VlbSB0byByZWNhbGwgc2VlaW5nDQo+IHNwb3JhZGljIHRyYW5zYWN0aW9uIGVycm9ycyB3aGlj
aCB0cmlnZ2VyZWQgdGhlIHJlc2V0IGluc3RhbnRseS4NCg0KVGhhdCdzIG5vdCB3aGF0IGhhcHBl
bmluZy4gSSBkb24ndCByZWNhbGwgdGhlIHN0b3JhZ2UgY2xhc3MgaGFuZGxlcw0KdHJhbnNhY3Rp
b24gZXJyb3IgYXMgc3VjaC4gSXQganVzdCB3YWl0cyBmb3IgdGhlIHNjc2kgY29tbWFuZCB0aW1l
b3V0Lg0KDQo+IA0KPiBMb25nIGRlbGF5cyBJIGhhdmUgc2VlbiBtYWlubHkgb24gc29tZSB1bmZv
cnR1bmF0ZSBwYWlyaW5ncyBvZiBIQyBhbmQNCj4gZGV2aWNlIChIVyBidWdzPykgd2hpY2ggdHJp
Z2dlciB1bnVzdWFsIGVycm9yIGNvbmRpdGlvbnMgcG9vcmx5IGhhbmRsZWQNCj4gYnkgeGhjaV9o
Y2QuIFRyeSB3aXRoIGR5bmFtaWMgZGVidWcgb24gaGFuZGxlX3RyYW5zZmVybGVzc190eF9ldmVu
dCgpLA0KPiBpZiB5b3VyIGtlcm5lbCBpcyByZWNlbnQgZW5vdWdoIGZvciB0aGF0IHRvIGJlIGEg
c2VwYXJhdGUgZnVuY3Rpb24uDQoNCk5vLCB0aGlzIGRlbGF5IGlzIG5vdCBhIEhXIGJ1Zy4gV2hl
biB0aGVyZSdzIHRyYW5zYWN0aW9uIGVycm9yLCB0aGUgeEhDSQ0KZHJpdmVyIHdpbGwgcmVzZXQg
dGhlIGVuZHBvaW50LiBUaGUgcGFja2V0IHNlcXVlbmNlIG51bWJlciBpcyByZXNldCBhbmQNCm91
dCBvZiBzeW5jIHdpdGggdGhlIGRldmljZS4gVGhlIG5leHQgcGFja2V0IGNhbm5vdCBwcm9jZWVk
IHVudGlsDQp0aGVyZSdzIHNvbWUgc29ydCBvZiByZWNvdmVyeS4gVGhlcmUncyBubyB1c2JfY2xl
YXJfaGFsdCgpIG9yIHBvcnQgcmVzZXQNCmltbWVkaWF0ZWx5IGFmdGVyIGEgLUVQUk9UTy4gVGhl
IG9ubHkgcmVjb3ZlcnkgKHBvcnQgcmVzZXQpIHdpbGwgaGFwcGVuDQppcyBhZnRlciBhIHRpbWVv
dXQuDQoNCj4gDQo+IEluIHRob3NlIGNhc2VzLCBVQVMgc2VlbXMgdG8gd2FpdCBmb3Igb3RoZXIg
c3RyZWFtcyB0byBjb21wbGV0ZSBiZWZvcmUNCj4gcmVzZXR0aW5nLCBidXQgdGhlIHdob2xlIGVu
ZHBvaW50IGlzIHN0b3BwZWQgYW5kIG5vdGhpbmcgbW92ZXMgZm9yd2FyZC4NCj4gQXQgbGVhc3Qg
dGhhdCdzIHRoZSBpbXByZXNzaW9uIEkgZ290LCBJIHdhcyBsb29raW5nIGF0IG90aGVyIHRoaW5n
cy4NCj4gDQo+IElmIHlvdSBhcmVuJ3QgcnVubmluZyBpbnRvIHRoaXMgY2FzZSwgSSB3b3VsZCBz
YXkgc29tZXRoaW5nIG1heSBiZSB3cm9uZw0KPiB3aXRoIFVBUyBpbXBsZW1lbnRhdGlvbiBvbiBv
bmUgb3IgdGhlIG90aGVyIHNpZGUuDQo+IA0KPiBJdCBsb29rcyBsaWtlIHRoZSB0cmFuc2FjdGlv
biBlcnJvciB3YXMgZGVsaXZlcmVkIHRvIFVBUyBieSBtZWFucyBvZg0KPiAtRVBST1RPIHN0YXR1
cyBzbyB4aGNpX2hjZCBoYXMgZG9uZSBpdHMgam9iIGF0IGxlYXN0IGZvciB0aGlzIG9uZSBVUkIu
DQo+IE5vIGlkZWEgd2hhdCBoYXBwZW5lZCBsYXRlciBhbmQgd2h5IHRoZSBkZXZpY2Ugd2Fzbid0
IHJlc2V0IHByb21wdGx5Lg0KPiANCg0KVGhlIGhvc3QgZG9lc24ndCB0ZWxsIHRoZSBkZXZpY2Ug
dG8gcmVzZXQgdW50aWwgYWZ0ZXIgYSB0aW1lb3V0LiBUaGVyZSdzDQpubyBzeW5jJ2luZyBtZWNo
YW5pc20sIHNvIGl0IHdvdWxkbid0IGtub3cgaG93IHRvIHJlY292ZXIuIEFsbCBpdCBjYW4NCnRl
bGwgZnJvbSB0aGUgZGV2aWNlIHNpZGUgaXMgaXQncyB3YWl0aW5nIGZvciB0aGUgdHJhbnNmZXIg
dG8gY29tcGxldGUuDQpQZXJoYXBzIHRoaXMgY2FuIGJlIGVuaGFuY2VkIGluIHRoZSBmdXR1cmUg
aW4gdGhlIHN0b3JhZ2UgY2xhc3MgZHJpdmVyDQpyZWdhcmRpbmcgLUVQUk9UTyByZWNvdmVyeS4N
Cg0KQlIsDQpUaGluaA==

