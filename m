Return-Path: <linux-usb+bounces-34508-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIWvJdidsGkflQIAu9opvQ
	(envelope-from <linux-usb+bounces-34508-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 23:40:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBB8259044
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 23:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBDD331AC0F7
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 22:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257703B27D8;
	Tue, 10 Mar 2026 22:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JCvRY/q1";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Y4CYi6lw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fBgqaS3o"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EA53AEF30
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 22:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773182382; cv=fail; b=sVyOu/rMJJFX6B64bQkzH95uS/uA22bUdGowRdzWfjSCbmSY6NhrfqVmsi7CNyjjxuQ5jf2HjT7vfS/uwpva4YB0Ao9bU4h+1IP5YydNhGpFK3X34aIxz48kjZFtOwHqn4bZEmxAQuUpteOLlhveaovyX0VVk5eqHkdEZJkbwN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773182382; c=relaxed/simple;
	bh=2xRVtyXQwu3DKFNY2hh/UOvHQ6ohOeMS84FreSX3J2M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m3MvjSd/f0IIDWzgxFhMth/1VclVR5K2G+B5vAO2ISauZ2jxnWVhm6hjUbBquX8Gtjg0imE3fb/itDS90QCcy/r0Bb0K7q0i7xhYylukQxTordnINfjqh9Cv3fGkc+ZTxyiwC3N+Xk2IgfNMfOtQzzKbk35kPAMN0dg+hySs2kI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JCvRY/q1; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Y4CYi6lw; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fBgqaS3o reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AL0MJp2099252;
	Tue, 10 Mar 2026 15:39:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=2xRVtyXQwu3DKFNY2hh/UOvHQ6ohOeMS84FreSX3J2M=; b=
	JCvRY/q1PI1YE5tBlszqkurYlPzxq2YNjK3+HtAYSpJYSgWKWruVIpGIaMXsG0jm
	p5pJXVhcg9NL0Mid1wzD6NMPG0HPyC2JEOFWSUjh0JUytrvN26q/DWsvsGlP8sim
	ZUuBanc5+U9Tl20ClUIpo+D9NfcAg8f18Zg+MYs7ezQ/gehLi/Lqd9aSvy0X/I2S
	pgpa2/c4y1lW9F2LSVVpGIB7O/paVC+ewg1PZGt/ieLmXBRs0G7JRSNI8nPL9PHE
	jezM30tFD69RkmJzyKSrwEgWTSOVYAM+Ovmb1kTu1GmJ181aQdMe0pgA7NqkzvgS
	8nk0JYqPRb2eTRfP4qMwMg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4ctnc7k9as-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 15:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1773182346; bh=2xRVtyXQwu3DKFNY2hh/UOvHQ6ohOeMS84FreSX3J2M=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Y4CYi6lw19YGvvT32m38BtkE7xecalg0gcCqBRKvtTxPGO0aH9qXgtAnGfv/bbmng
	 Ascs4EB3hm7sK11JOJuyLweHJVBg6Rk7SeyCon8hazWY1CpyoMDxqmtsnkbikqyIKP
	 iyNNJN8UQt3M7ZGkmOz0Xye5tbEBDLl9NLqBZcxvOiC4n2HNEDIdbeamKjxHCmXlRj
	 kOF5sad9zrelsryGrHzsfQXDNTWvK3Dr/Vw2m1JEytfPr4V/QsEEzfJdikMCO949yn
	 m1RTZrm8zouzNJ6WanswV7EovV2I6eLpVvVU1rT4cSFEELe8dRRfC8/RiF6E4lhMoK
	 huSnSpXzioDAA==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1E44A402B2;
	Tue, 10 Mar 2026 22:39:06 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id CAB62A006D;
	Tue, 10 Mar 2026 22:39:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=fBgqaS3o;
	dkim-atps=neutral
Received: from CH4PR07CU001.outbound.protection.outlook.com (mail-ch4pr07cu00106.outbound.protection.outlook.com [40.93.20.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 37A25405E5;
	Tue, 10 Mar 2026 22:39:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLJKhno+dj2mBtZc3x116i6TomqwNisdCVIQx1IlFMQwQYXx1jgMT3HV7BSZCvBEzoXdtDg5URn2UuaBn5GxtHdrFK4/eDnW5LYIXhw6a5ck4vWkkjTEpffl4Hoy9NOj21f1R9oFp8AVHSHuHnyddT8GhAOY44a41WV+tLxlavogG7K7tDK5E7IYrHuOEGeSAZK2GnMW9EEJxTAU3onvH61ghhtJjiif50dQu1gGDCZV/vFfQEsB3IIgT10tVqbgo2/fIpfn8DIdrLhzgT4OnHF9a9QKLiG0SYp/WxzPNWE1rK3T/lobVFlllZbj6xUiTBIHSZzj1sS17GR5axxB8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xRVtyXQwu3DKFNY2hh/UOvHQ6ohOeMS84FreSX3J2M=;
 b=ZBSzredxS5cN0FTZ0zID8uuRwdQhZUSKhVyXg2yW/IfWr0Erm3obwUR95schmYXP5hjQ61wj2FP0bEclCTDIkeHTpfbAOEKc3NdL81UX5eLd8risetvOJVDY27qhinY5mNcUtDGAip5zaDcOAHQiuTWZuO3H2dhWCJkwPa7f/6g4h5H3nHKcaYVpatf9OkuonG0Gi2Mc05O3fwvxXrdOn1qiP//e4voAVzuxkOZH2AShXY92t9asYkjK2MTiWI12Juu2N7bLRcr8BKaT6tWF3n2aNCFOVWfu5VvgfZO5fKkyZgbvCqD8PfkHKuvr/Lo8w0cpWtvpCw97y2W3G3QGOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xRVtyXQwu3DKFNY2hh/UOvHQ6ohOeMS84FreSX3J2M=;
 b=fBgqaS3oz9VTBRK+743gFGmQxxRKZqcmyZhpH+oA901VsyXdXlQhYRxl7nOUC+KGcvVBfmwfjiA0UTY9RE0m9brimMQbHAQfjiNgrwueGFSuRv5johfP1lR4LF0AEnTqn8h78l2RT8fR+95Fef2N/QY+ruL8xwfk682N7iDw+vo=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by LV5PR12MB9827.namprd12.prod.outlook.com (2603:10b6:408:305::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 22:39:02 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 22:39:02 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v1] usb: dwc3: pci: add support for the Intel Nova Lake -H
Thread-Topic: [PATCH v1] usb: dwc3: pci: add support for the Intel Nova Lake
 -H
Thread-Index: AQHcr8T5hvkgOvRxVEW8tU9XNhC0k7WoXdKA
Date: Tue, 10 Mar 2026 22:39:02 +0000
Message-ID: <20260310223857.22fp4b2aileabdtn@synopsys.com>
References: <20260309130204.208661-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20260309130204.208661-1-heikki.krogerus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|LV5PR12MB9827:EE_
x-ms-office365-filtering-correlation-id: 78865550-dd63-484a-7175-08de7ef5d406
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 q8ahQb/bYNTYQxOEfuPUR1Zq8FJ1iXxxcOt7vVWsgbMLxxGXHvqByia3K63gcozPurc9mrhlDnC01Rr67t5tG8duMcQHmHEA/bJqPdn57f6og0OLJb4MKFQsSyo6fsdn1kA8JuBi6Mmf7cCF0DyQlm6v5riikR9F6XhnkXtjgR6pOj2k600gcgMqRvbXSdhtEJWSP8gG/BervxLqup72Lx8p/gEmTIvfVTxSY7pGwWNHps8FhApa7D3v5p/N/vpN6UGHhIW7vNH9pwfc3TKnOf3djm8FsUaJIeDHpivFp8PJJ/xezv3inTYld2A6BbVuxxqqbCjwfFwLV+8NXyW0ng5MEyA+T2UB9Zzkj8iYuigYWAqnOplq6KW52mzXDfuWJYonhze2lM6KIJTFAIii8/7ehS33j44AU0wz4Ipyvn90FVrgDUk7HUqofyc3w6el7RBXHItSBg3CuLbDRJZj+LWBxD1A2RsWZhdQAa3Rcd+CmrqvFv6Lo44O0jwJWfb8elQMt+rssNPSguVW/+7QPm0Gj6+wAdpnrrug49cN61SQulziY6n/VrL24kopYMjWzNkKbYgE/pSFRF6Y8QfUNqSccf/VUR0f+dJ+yrsSI15n9XZDwd38wqfZ4JqiD//KRq0ograSQ8Hk8Mc+ZlPJS7IoO9LXOcq1B9RAx/YJXKSd7ij9EPgGMcKDwBte4+TOsI0M4C8EDvM9hFnoQo6anltyosNEeODVRQBajWz/fCRRRhoFQkwShNK+bI2ACyj8nnA70d1M+xDzrcme0ULkmao2cDJ2p5+HmZ4OouI/uJc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T1FHL05Bczh0cDNwd2VqUDdtSnZtb091YlNoQlNNK0p2czJHWXZhcGp2R0hj?=
 =?utf-8?B?OXVNcSt4NWdETkVQbzdoR3liREg2WE5iM1dORWlXK3g1T1Ewbis5akxhdEpD?=
 =?utf-8?B?V0UzRVozN25yVGtkZWlRYmpSTHloM0JHckthcUFJOHltT1ZnbVF2VkZ0RFU2?=
 =?utf-8?B?VzZxZDgrbVlSRzhRQXA3T2hoYUNzZWYrMUtJcVh4bVdVTEdXdHdIMmFiaVZn?=
 =?utf-8?B?dHJoY3lxeUN1SFhDbjNORU4rcnQ2bEY0WlFDUVVzWW1JL1Q5cklDRlRRUUhM?=
 =?utf-8?B?Y09STGthMHJVR24wQ1hDbGs5RmZvaEdBYm9obitLUEVtR28xekRDUnhqeXNa?=
 =?utf-8?B?Q2J4VzVzQmRkRzM0NTVWWXlrZVQ2MlM1V1dadWMwNktBWkdrbktuOGZOaGZX?=
 =?utf-8?B?QXBlR21ORlBBOFlSWlFuY3M3aVFSNmJTcXZrUEx4V3lpQ2YxSFh0aEp1QVNv?=
 =?utf-8?B?S2NjYXVYb05zNlplVUlQT09PWm03dnpPVllEK2F3ZEZGTVhWWnJXaG90T09s?=
 =?utf-8?B?TXh6ZHFyOVpoYnVBUWhDRGFaVzg1eW9kOVNWSjRrYnd4alpPZUxrRXZLRHNJ?=
 =?utf-8?B?SU4vM0k2eUZ4bTV0Mmt0bmRGR2o3NXJxSG5TUkFqTFdKZWdkWDh6UVlKcVRw?=
 =?utf-8?B?ZmNqS1MyUWZmNy9sK29ETm9EdVBGUkVvaC9JelN4Qk95SHVTNUFnWnlUd3hy?=
 =?utf-8?B?U002dkFVMTZIUy8weG9tNmRMZDFWR2xzaFQwNDhDWCthRVZ3T013RGYwZjVS?=
 =?utf-8?B?ZFNuVktwNXZqa25MSHVqaElvQnA1czdyZ2ZrZWNhVmpobDdNUDJRVitiVnpr?=
 =?utf-8?B?c21UaGZtVXo5TkZ6SmhhMDZCQUlEZy9FcG8zQlJOMnVHV2dGZ2lTSVBSZVd0?=
 =?utf-8?B?UVpPOXF4NVlNRld4TnRmUm9XMlFtL05UbUhVcHk2NjUwQUNTWnFLWm0wYi9P?=
 =?utf-8?B?eXJzME9vNlRUc0R6WUtXQ0t6REg1aDY2eklINFNIQUVCUTlvZnNTRVZ6Y0VH?=
 =?utf-8?B?UFp4WHZYWk92NUEvNkdTOTZyMFpHTUcrS3Uwa3BjUDRzTTRnb2d3M2dYYVo4?=
 =?utf-8?B?Q2JEc2x5ZURGOFdBb1JwMDNJajh2b0FGRE1DdU9RNkxuMjZrNVZVQTVVd0I3?=
 =?utf-8?B?dWZ6ckMvbHc2aUVzbkQrOE9VLzVwODRIcHdaT3VMbEdob2R4dEVpZHdQdU1V?=
 =?utf-8?B?cHpDK05pTXBjaDN1aGI2THl1RjBEZlRhc1c5bUlDUDJCRG8zTHBjcmIwTWRU?=
 =?utf-8?B?QjJuWHd6Q0dBa05qSmtFYjUwemJYTFBmdkxqT3JYNlpOZVc4aGxIbXVhUDlD?=
 =?utf-8?B?VmtnaytBOTZHc3NXSnVBcHpvOTRZY0hpZHdTdXJQVG9BakplRnFRNXhWRW5s?=
 =?utf-8?B?dlFBNXdDSUF4S1hSY2JkUVFvcG9mSktzUldrTFRlSHhUcjZmNjYxZjdDdWVN?=
 =?utf-8?B?THZDamR1SXBvL2xJWG1kcVEvalY3dUtsNkdtUUhzUVo4NXVQbnp2dUMwUnQv?=
 =?utf-8?B?SktmNkJPYyswYzhhTzdubU4zR3lwMnJLVm43OE1rcEpQZ3hUVC92SkFuZkhH?=
 =?utf-8?B?cytVK2QxQktSSkY0OSs3a2lMTXFSSFpNSzVSS2lhb3ErZzB6Z3hSeUUzRkpk?=
 =?utf-8?B?Ump5T2s1aWhoZG8wbTRpYzJnQmtLOExLYmhoRUxIdzFObmMrVHlWQlpHbGY4?=
 =?utf-8?B?MFU2TUh0OCtNZDl1eHkwV011cmN6d3BDbEgxYjkwUXJDdnl4MWhzNTBJMWZw?=
 =?utf-8?B?TUhmODFvaVdhM3JzVi9FRTR3YTMyVVdScEViSjdhYXRvS251c0VuZDJhZHc1?=
 =?utf-8?B?SzdjL2kwU3BxN013T0g4Rm03UzNxRys0bEYyWkhJUGRuMVhqdDRSSVJIZEIw?=
 =?utf-8?B?a2JCUVVnQ1RlNGhkSVA5dHdpcS80bTVza2JCQ055M2hvK1ZqMlExbmZ6K0dR?=
 =?utf-8?B?cXJGT21SdEVoaS9URURlVUUzVytBTFNwVHFRbkV3elo5dTBSanZ0TmlkZ0ti?=
 =?utf-8?B?aVE3aFdmRDZhTWJLUGtxbVBxYTB2bnp0Z1h0VnFFOXluVjNNcExXd1ZqeGdk?=
 =?utf-8?B?YzdQVTZVUG01ZFBpSWZ5SjltRzhCVFV4d1ZaNlJwZ1JBOFlCaHFwd3ZBd1pG?=
 =?utf-8?B?K2VIbDZZem9PUHpzOGREblU2Rm1adlBFV2JYcVlLaUFtRHozSTZCUTgxZEJl?=
 =?utf-8?B?ZjVLNUlJbGNMcXZxMVNpbGc4MnhTRm5VOC91QnhJcmlobklObzhGaEpVeDRZ?=
 =?utf-8?B?SENIR25aTHo2UU52MkN1dTR1blFxZ1BPVHdGSXR5amYyUDlBMkc3Nk1lRzg1?=
 =?utf-8?B?MktSa2pSUVZCSlRCZUtxTHdkTmsxQkJxd3g4cVRjNWhxMVdUSFBvZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C8065ADF879F642847806DE997E2971@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	al4CWOeNLvc5ZR7UjNZVfRteILD1oLGVik8A21RMycJ8xsz8JWrgwadhJCy/du8LsV/4TJQHUkLd31x54x1XCr0KGd1LE3MKVimQybCtVW7h2lkt3MEq/5/ORTAsrGfANhM2riTT+18AQQEEP1CwT+sL6H/2nd7FYPwDGgZ8ktNxkRa9VliNMBlOxeftl+HNnHqddBStTrFrzC5tNaobN9W4U/zoa7P9r6cWrj8cjk5VkvZgIHM6IYJ68Mupx6kaxsfEnXb2xpEcPJNKo7HYp3ZQFIL2eInSFOn+qWIB6tuDHwmxqbBP+JmPEvbZpEzDpLrzg161KZT88ps0u69SOA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vyJziGTiFppKR1ppSk5miJTPDLOuicFLTWSX+GDRJr+vVHo1GKOlE0B+3xBqs3iz6xTkywfzWGMS4JcXdVW/k6b233cL8E3zWUUu7kXzQFezIJ+kpZ+K/sckMUbfoMQgnNNaLxpOWjzVmJqKv5BDDHrttE+5/G2s2/2skP64mQ4UiX6+MySTKmOEnV2J1PGQ4+9pq4rSGshFip1XtGai+k/2akkEYJtkYMIwQ6n+U/hQVjt3VNcIXMqduJh8juHURHWLTewPTaPf5CZeQkO/eRtfEtQVSZFJU42RTFPOcEB3qUnA3CXE5zZerZIkPz6/5EVQrXehRGQZne9cSHpxvF8M8+ARGT6iymrUrsZs9eB9mvaACPPFOGIAhd47WxI/9StNhOJR5sko+91bVNsKcLI0hluTiuHgyhO4+OFQ+K/FzCAa4mxELG8jGst8cRKDxYYpt518iP5/35SBroqnnDenmr9MploeQjmb2Z2J2YNE/lERmQpOZEhb3nW4Nl+g7iwEjpBPPUqTvJp5NLJtv044NDo1w9whcD5RALOY0pQAYTYXDYsF14I1lt4rGDNMXT7+mN7EflOvt9IvPNA/jCiUDo9kM7CMt+NKp9svsBgkF148dXGhVIfj0N4CVowQXItZcTPAG3vLLtYRRx3Y8g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78865550-dd63-484a-7175-08de7ef5d406
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 22:39:02.1990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cdqH1z9gLaS+X/geZjALYGqzT8AWZsRnpg3xxuoyOMjOEGRRDm87UcAWV/NU9VJZzqv7LGgvVEmrHqPZy6r3Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9827
X-Authority-Analysis: v=2.4 cv=U5mfzOru c=1 sm=1 tr=0 ts=69b09d8b cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=QyXUC8HyAAAA:8 a=jIQo8A4GAAAA:8 a=BBERG1uDHp9c1wFQzOUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE5MyBTYWx0ZWRfX156GDsF/J3Z+
 ZNMUkxGKZ6yh3aF80Cq7AIf4C13sDafv8AubKEIXpo17rUw5hV8Vuz37QN47NfFeeHTWiAi1QIJ
 vWszt3V+EjX1F4p6SCR1RVAF/CrTbfGiwNdU69iF7i3uCG8KT2PLQr6eTK7MWx8P/jwv4FhhyM4
 EffoaUYSavqpAzjsgctGJDRnPdZtFwatyNoyHALxbvesgWr7SI2c6HLild5peJAjU8V5oRPfLKs
 iCkUAFTFb69O1FMVMQKnHNLTgqQM/03s8eQ5anhWDtn+xTM9ct2pDCLaUlbI0h6hPpC98mBGMC2
 3GvdFhpMomXvA8r7CrejJHkYcouxDxEv2RYqlQAlSMHMfiVnIUH5dmbuIbn+shdKetQHm1g/W86
 YnMc4qKXW/vkhNNiUxtk0IsGS6CqsHkjOuZUnP8obZd7egtsdNYhP27IxQwyorCOsp1LMBsdnC2
 JL7xz4aN3XS1zca7Akw==
X-Proofpoint-GUID: sAVWhNJIX4Brl3NeuFfG74pWlGFgUtT5
X-Proofpoint-ORIG-GUID: sAVWhNJIX4Brl3NeuFfG74pWlGFgUtT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100193
X-Rspamd-Queue-Id: EFBB8259044
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34508-lists,linux-usb=lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

T24gTW9uLCBNYXIgMDksIDIwMjYsIEhlaWtraSBLcm9nZXJ1cyB3cm90ZToNCj4gVGhpcyBwYXRj
aCBhZGRzIHRoZSBuZWNlc3NhcnkgUENJIElEIGZvciBJbnRlbCBOb3ZhIExha2UgLUgNCj4gZGV2
aWNlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhlaWtraSBLcm9nZXJ1cyA8aGVpa2tpLmtyb2dl
cnVzQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtcGNp
LmMgfCAyICsrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXBjaS5jIGIvZHJpdmVycy91c2IvZHdjMy9k
d2MzLXBjaS5jDQo+IGluZGV4IDZlY2FkYzgxYmQ2YmEuLjZjMWNiYjcyMmNhODUgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1wY2kuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9k
d2MzL2R3YzMtcGNpLmMNCj4gQEAgLTU2LDYgKzU2LDcgQEANCj4gICNkZWZpbmUgUENJX0RFVklD
RV9JRF9JTlRFTF9DTlBICQkweGEzNmUNCj4gICNkZWZpbmUgUENJX0RFVklDRV9JRF9JTlRFTF9D
TlBWCQkweGEzYjANCj4gICNkZWZpbmUgUENJX0RFVklDRV9JRF9JTlRFTF9SUEwJCQkweGE3MGUN
Cj4gKyNkZWZpbmUgUENJX0RFVklDRV9JRF9JTlRFTF9OVkxICQkweGQzN2YNCj4gICNkZWZpbmUg
UENJX0RFVklDRV9JRF9JTlRFTF9QVExICQkweGUzMzINCj4gICNkZWZpbmUgUENJX0RFVklDRV9J
RF9JTlRFTF9QVExIX1BDSAkJMHhlMzdlDQo+ICAjZGVmaW5lIFBDSV9ERVZJQ0VfSURfSU5URUxf
UFRMVQkJMHhlNDMyDQo+IEBAIC00NDcsNiArNDQ4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBw
Y2lfZGV2aWNlX2lkIGR3YzNfcGNpX2lkX3RhYmxlW10gPSB7DQo+ICAJeyBQQ0lfREVWSUNFX0RB
VEEoSU5URUwsIENOUEgsICZkd2MzX3BjaV9pbnRlbF9zd25vZGUpIH0sDQo+ICAJeyBQQ0lfREVW
SUNFX0RBVEEoSU5URUwsIENOUFYsICZkd2MzX3BjaV9pbnRlbF9zd25vZGUpIH0sDQo+ICAJeyBQ
Q0lfREVWSUNFX0RBVEEoSU5URUwsIFJQTCwgJmR3YzNfcGNpX2ludGVsX3N3bm9kZSkgfSwNCj4g
Kwl7IFBDSV9ERVZJQ0VfREFUQShJTlRFTCwgTlZMSCwgJmR3YzNfcGNpX2ludGVsX3N3bm9kZSkg
fSwNCj4gIAl7IFBDSV9ERVZJQ0VfREFUQShJTlRFTCwgUFRMSCwgJmR3YzNfcGNpX2ludGVsX3N3
bm9kZSkgfSwNCj4gIAl7IFBDSV9ERVZJQ0VfREFUQShJTlRFTCwgUFRMSF9QQ0gsICZkd2MzX3Bj
aV9pbnRlbF9zd25vZGUpIH0sDQo+ICAJeyBQQ0lfREVWSUNFX0RBVEEoSU5URUwsIFBUTFUsICZk
d2MzX3BjaV9pbnRlbF9zd25vZGUpIH0sDQo+IC0tIA0KPiAyLjUwLjENCj4gDQoNCkFja2VkLWJ5
OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNCkJSLA0KVGhpbmg=

