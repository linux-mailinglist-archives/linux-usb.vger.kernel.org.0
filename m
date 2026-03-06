Return-Path: <linux-usb+bounces-34165-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UE7gEvNdq2mmcQEAu9opvQ
	(envelope-from <linux-usb+bounces-34165-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 00:06:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B674B2287E9
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 00:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 579B03015853
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 23:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18594362142;
	Fri,  6 Mar 2026 23:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lq0jQ5Pl";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DmNlQHuP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XqJ/jKFG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D00345CA1;
	Fri,  6 Mar 2026 23:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772838383; cv=fail; b=BrpOUDDphotNcy/CdJ9Sw5gVIO+zEORw1RaE+OeG+GkX7uwGsib4UIizW3bBSaHKubLzcKTpQUzG0ihX568T5kGD5KQEy0tldWqW/LpiGrHdGkB36PR+TsMXHI+wRQrkz+fSPc+XkIBJYSZdTZBcDF0d3uiyN0dX1geD6ajhODc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772838383; c=relaxed/simple;
	bh=1RCjQM+dAHWMn1IO2imxtSPzK4OwhCmyxXaha/R+M08=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NIOTPTsyf4PPN9fN6fQnwI5qKA5dkfTJawXeTET0DKz5HT9auRzm9xsZX84VbKiAMD9RTTknFFDZSJPQPRIZhoEqMaB8/Xhe9SITnR2CQpBbYsCKQpgp1h4//IUeH7EE2LwGjVsDR+wk6W2p4f3JObHsE/G/h0PD9US1N3fglCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=lq0jQ5Pl; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DmNlQHuP; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=XqJ/jKFG reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626KcKp9697153;
	Fri, 6 Mar 2026 15:06:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=1RCjQM+dAHWMn1IO2imxtSPzK4OwhCmyxXaha/R+M08=; b=
	lq0jQ5PlwHI00alz/SiFYiEP5V41+3DO+XuKn6QhDa/fH4v9kIuDxjvP3Ndp59xw
	kI4RX8f/z5cUQgbI1mRxaYG/LcsD6L2MI7OS3lZzb8zVPk5L6mQ/VYRubU8FSAMM
	LLI22Ze5k0L65srVFGX6zLTpOUTXww71RfCj//upYdLgthrTYSa7ZgjQ8/g9Z4Bd
	zJuUhQvamfioQskbnsODo78xZCgz4a8x9cmBqq+gaLf4gHo4foOogmAFet3SyLlV
	awPPnGLZGnpy23Q7DDXyADZUzQBx+/4XPoMAgWpPqOyLFMvQ5i1mCXjTxI/w7VBg
	kYMx2MRna4Q9mkFHJqZ6SA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4cr2yqj0jv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 15:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772838377; bh=1RCjQM+dAHWMn1IO2imxtSPzK4OwhCmyxXaha/R+M08=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=DmNlQHuPRPEuEdtdMZfKK0tORfVpU0y1/4mkevd5LauEQn5EM9yAo9WDJ8/pbsQ3l
	 Cp6RIeg3fmFeSEiFVI7W3BRpkw7t5d1OoeMURWf4a6tKSNCAMD+gBkrL9EKzooWmkj
	 raSjoiGV8m/I6ToxlBtrVjweKyeliXsEl0qnVbU/3jZhn1u8C8DEKVXOSRgYoRJrSh
	 99azdF7OWht57O+pBITjHoYEUsHOui2Fo2slYNuPhbTH6GpkRCDXJUQmgviPUjVl7f
	 AsOmffDyIlc+/mtIkLQIIOkykkA64AuKwCF1tJt25ufXaaQiclKuejpBRxVpCmZKI7
	 b0ypTAl08g8/w==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2E341401FA;
	Fri,  6 Mar 2026 23:06:17 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E708CA0157;
	Fri,  6 Mar 2026 23:06:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=XqJ/jKFG;
	dkim-atps=neutral
Received: from PH0PR07CU006.outbound.protection.outlook.com (mail-ph0pr07cu00602.outbound.protection.outlook.com [40.93.23.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E8B1340633;
	Fri,  6 Mar 2026 23:06:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Stp6Wa3V0N+hPxvJiDU3Ad+RX0u8S/PmQvpQJMR4VCfgU/NY+8mg536ixxqVn1hQqhE56HnEC+CBp0amwDTW69OuFXPjfSkpwQ3sqIHCgg4PH1d18Wlc9ssMerKw7111t93o+Sg6JGdlEwKbir4ZbSByt6tCnpjyqLKtk+VfDBV+1TmU8RrKbeHY09WaTIwVf8UiToR/dH7wY/xk7joex6T3PcgHWLJppmZ41aNM6e3N9warIAuKyepnz6afUzDkA2rUnB3ryGyVGL1qa4VT+x7k6W4t9ClNlw8QOAOOEtH5fZqPpJzKRXbi/Hw2Z5zDt6n2wRMl4tfLP6PNvLfSLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RCjQM+dAHWMn1IO2imxtSPzK4OwhCmyxXaha/R+M08=;
 b=fU6lGWaPTFgkvCmwi7DHMj/bsSiHDNlRg86EcCg3/4T3Z5npRfwLnYPPxXod0dotKNB+sjom6DZsHIfKRjc8MbLNro+Am1AYKSSm/Oy9rLbA0+izDEcxBvw+YpLOHzjUWapFEzvFJ+tB3ySfUAFm1JDoGgfsI0FMCvjt10pvxaJo0/WXS/E4n3mjXBHkVoBJktc6udN57HFSWWTVQxQASe2aPHFdIIHWVZLpuvwSFnsBQE38/vssE4Yzi0RUg3qU3BuOed2J49sJnuNhsqYd9PMbaKP+rl+yYNT+IMBMlIAdj/EfieGwgqYsPjRaq1OMO8dNdvXL6sifIbxr0EkLPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RCjQM+dAHWMn1IO2imxtSPzK4OwhCmyxXaha/R+M08=;
 b=XqJ/jKFGShFo1KZKBrtPo3vCyNv6BCd3QTUOkD0t5ukdoyymPvNfg2ZtLgkK02T8BmcGSOnr2Uq7RD5UNPkfdadx3J/wzmXNI3e4pYQqNKHIf3HmEvRNECMOi6IUr6J4wSfIURwjf9bAOm3GU5V+Tt4VpBkKAzRV8xrzOOPWHQc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB7567.namprd12.prod.outlook.com (2603:10b6:208:42d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 23:06:04 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 23:06:04 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "smatch@vger.kernel.org" <smatch@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: use explicit 0 for success in
 __dwc3_gadget_kick_transfer()
Thread-Topic: [PATCH] usb: dwc3: gadget: use explicit 0 for success in
 __dwc3_gadget_kick_transfer()
Thread-Index: AQHcrUi1EOvvcN9hq0WVqiVP9IRzFLWiIQQA
Date: Fri, 6 Mar 2026 23:06:04 +0000
Message-ID: <20260306230558.suidaog72tu6l4v2@synopsys.com>
References: <20260306090643.47383-1-zeeshanahmad022019@gmail.com>
In-Reply-To: <20260306090643.47383-1-zeeshanahmad022019@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB7567:EE_
x-ms-office365-filtering-correlation-id: 0d8d00fa-0711-4336-2244-08de7bd4f181
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 eD8BsX548qf9ssSktp9xQLH6uRRrU6lKTBySyYLiIA0CzpR/DTBGdYGPT5enP7NPXSKIXb14RkZZE8JmWCbnAxAi2Qa/JLQSOwsUxhBzQlGqAXza9V/EnLJJlo8VoU4JoXtuKeN+wwdUPGT4oGKqFtVTEI6AQYfKXf072oBAQAIVrjSCRLSP1MkGD914WkXcJufESTWFVNl0jixssTlmvS3s0YK0Cm/V9b/WcW10XlBMM4EDpLo0hxFEfHaHkvn9qUjZc5hTXVEoxOGos0VLSgxuXNJodZC5lH2paDRYYH/T+35yws7gGlTPFa1b3iiUVbINu7qTiDcCfg368D9NGd2M5k4yp1z4qRLKSRc8F3oNehNSodxjv51np2Qs83apBuUh5QSylEOl8xLdTPMdeu/IcCooqW7s3wxbBl6smVCbm+NBHU5ZO/VvJB+AuZ5ISC+jSPpIRMQiHV769D/6qGWrRwMbiizwmMZNtUplL6LHTj8scMzVmoR3ZFmM4qOc3n6LC9UPUymE78brJ27x/fDM1sFr/HH7gkv+rh0JoTv+fC2LTo1xTvlg2udbI39AryEdxRA8u1U2lPVimwQjGJrGSxAqVNGM0ipRStQEswqVKwG2xnbiG3cM+GaAb9Zm2VUgPvTlEuCqIfinrx3Dx911oRRpBlaQb3Joqp+pORjjKyWcN/jeKlR23/YwgxcAw4ROWQ8j90LejNLzTFSKzM2bg0wKRxzwDzOBHzvUI0VSQh/3wvISS09bgh9gsx1x
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NUJQajZQaEdoQlV5SFN2RzRoSkgyek05Y1E4VTUvckF0REQ3aHhCRUZuNWRV?=
 =?utf-8?B?VzVIUDRSYVNBRE0rSDRKZm1ZT0hBVTNSMEhxZ045b0VteTU4c0JSR28vcnUw?=
 =?utf-8?B?eHlwSGxTRWpabTNEVlFCUHJObllXcGtOZ3Q3UzlSQVV4VzgwYzU1TVZETmpY?=
 =?utf-8?B?eFRDMXk3cjZtSnpJQlJWNXUyeXRHZVA2VkQyMGhxUXN1ZGtDTWZnRVFacW1y?=
 =?utf-8?B?RDVwcFFRWmlMK0EySzFRNEVicnJEa20xZm52ZHpqQXBjNjFzYUFlVW43aDlO?=
 =?utf-8?B?VnNIU0tGaEdwdnRyT1oxWnFYK0JNZmk4MWUwZWxPazVVODZBNFdFcENEelEv?=
 =?utf-8?B?SDNlcExvQm5RY2Y1b0xBL3RCMUExWGRheDNMenpzOHNJTzVlRG84Q1dMdVRl?=
 =?utf-8?B?OE5BcWF0RzY3d3RlL1pxcUJWTEh6cDU0emhHUElqaHFZNlg2MHV1cUVCL0E5?=
 =?utf-8?B?Vnp2dlpVQnlNR2hacWg0b2JrMklQdmwzeGU0V3lLdzJBMWhrUkpmMkxjb2FR?=
 =?utf-8?B?K1BIZFd0Z0JNcHVrRmZ1cWdCZktkTDN5YmFIS2FLMGtVbTRTb1FWV0tFMEZj?=
 =?utf-8?B?RjYzYjZwNUZLVy9OSjAyMlFoMTgwNTBFcnAyWVRTWkYwdkV0cFhEYnpvNm1q?=
 =?utf-8?B?UWthcUROT3Vzc04ydGNFYUg0aHRTU2hLam53VW9FYUZoMk5yZlFveEVRa0Z2?=
 =?utf-8?B?aThGTWV4d1VJNDhDSTBqZFFMQ2w0bUg0UktTNUQ5eU9samhKa3ltVnVuYno2?=
 =?utf-8?B?Y0RKclZuT3E2M3hBeUhCZTVZd1lJUnRQN2tKc1UxVXoyVkpuZGRWTHlPc1Vy?=
 =?utf-8?B?MDVHRng4V29CL2NkRUFRWVZ6REQ0THFpSUI5M2E4V2Mzam8vWWs2dWlkcDJl?=
 =?utf-8?B?QjExTHpvZllxSmY5YVliK3A4dnNJTStrL0Y2OXNtZ1hGaVdoejkvcGRVdlFW?=
 =?utf-8?B?QThxZHJtVXVhYWV4VU9TZzZmNUZDcGZhTGZEYS9Hc2pFcWxjWUhscm5IWnlF?=
 =?utf-8?B?eGI0ZTY1RzZwV2RUc3E2Wm1UVkpObnNhT284Vm16bVAwb2x4aUF2cmF5RmlV?=
 =?utf-8?B?Uk5BWEt0d1Q0ZHlpelNRazdJUUVvejdLblArcDFlUnpDVjVtMjBIeWQ4S1NG?=
 =?utf-8?B?MUxMaGFaSG1jTmdQdUhXUzI4cVExUG5ma1JCSEVweERQb2w4dlZBTHhtTlpV?=
 =?utf-8?B?MmoyVFZ6U3c1QndRT1hDTFJxOTV4dDU3emswUkcvUHFBNVljd0ZQaGt6aVVo?=
 =?utf-8?B?VkNOQi8vMnFpSHFqY25ZaHc2WFA0WmplV2pONEtibG5DRmNaR2xoVXNoL2VS?=
 =?utf-8?B?QmhlL1lxcFRxRThFdnBWMzQvZDBLcjZzMURBY0loQjFkNDc0QnRBMEVlaDgr?=
 =?utf-8?B?dFRWNVN3c3IxR0JBcHloTW1sV1FtcTkrVlRoR3FubGlOODc4dTRVbEp1aGtF?=
 =?utf-8?B?WkwweEVzLzFzU29ibllkbTZmOWtZUktndWdMNFFiL09tcnV5dksxYnY1SlJT?=
 =?utf-8?B?TFk2ZFMveFIreTA3TW9iMTkvWXhIR1Y4c0JXOWQwUmY2eUhGSXJqL1pCQ2ZH?=
 =?utf-8?B?aTFKNlJqWXRVREthWTV2dkpMRTlnSFRUaWJ2REFmTjM0VExoVnZvTWdYTzl6?=
 =?utf-8?B?MzE4T1pYSzZOSFBjK2FNZzFpeDJPcTdMZEF5QmhLT2U3eDFDYTI2UHBhcUZu?=
 =?utf-8?B?cWhyQTlHeml3ZWlYYkNyUnZVb2NFRWR0R2lGOUNCUThWaHBjOU5OQmR6UVlU?=
 =?utf-8?B?cnE4UU5VYU9hRFN2VDg0REVVbHpNMlk0VDMwQUFyWktwK1JzUk9mZzlBT2Ny?=
 =?utf-8?B?VGppLzljd0dpUlVIQVZMeTJZeWNKdUxwVnh5UFdSZ3pMcmg3UkRQeUxHdzRw?=
 =?utf-8?B?cWZncUp1bkp4SVpWVXJ1cmdNRlc5N28rWm9wb3RuNHAwaldCdW9lQ1FkS1Vx?=
 =?utf-8?B?elFFQnpCd1hCRWwrcmRuUkhkT2ZFQVcyRXZpWWhyYWRmMXJuNnhCSXN2VFJQ?=
 =?utf-8?B?TGJCNS9VUFBTazdxV0VRWFdFSVR6Y25rZGtoZGd4ZlJyREJ0bURMaDZjU29P?=
 =?utf-8?B?UUpNeUcwck9OS25zRm5SZjZlQ1hkNVpwYkRxdWU5dWI5NmJzRU9hNlRMdVVq?=
 =?utf-8?B?R2xJbHp0L1NTN3lOQWpuNVVrR3F2VVRkNFVkS1BZa3kyK2lDcStRQ0pkcEhV?=
 =?utf-8?B?eEF3WitibS9Rb3l5bVZ1OUdnTWovdmNqVVR0Z1JUcVkyZVlGUEMxMHV4NmRk?=
 =?utf-8?B?OUM5dE5ZV09ITlk0cy9VTmNRelhWQ2htK3d0aG0xKzVKd2NXc1h3SGxMWUtt?=
 =?utf-8?B?MFRiN2xIb0kxZTZ2VEhOczBody96VEFYaUwrWi9qVFkxekZyQlZXQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7520D33A641AE45A8092301CB0CEB11@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	SxmAnphxeM4t3wmqrOKf4V5ZfstwzB7jbvTO1KELvHuk7cSguxQb/YWJ6ZM9gvm2TvXphVeMcTquk/uZtQFbCGZZiBeZpDWI3WlUl/D1e7Pd/pbMoT3/qS7L5BzX0XjguS+VM4LvVvqiIdRbsiZHek6yfJgmIfpRXGNCBdNkonF/XaXyOgT0CNtnJOLtxI6vZWIuFbtKe7PFZGxHfeb6EoGJUTfCyc3eS+Wga7o0y+9q9D8kkgwlot0Dxizk6s5BNlXe4agZy9QY4KiDfwDsp79AiHKiTuLkkbSPntOLJNJVmhjDGsYoCZu7/bIlEXiB45KqABMQskSDXKy/Pb+aqQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qcJpG6aQZlGOCC/ocmT2yGBJQMfbFxRA9dZI6uppRc+3C64FdWAHkLnrw+WUuUEbeUZdycy43Q+hlr77o9I71XPJfpyhfkgPuyz6efQhdqAOUjSEIvn7RcYNMUnHt5s9wqo0MXL5aFOIBbPi+JmcDRkDgb9Gj5fIyloGaGuwUY0ZiwvJsTPVNtG+l3LBUpyjxUcu+/cj6FkraljdqtGwFm0J5TDNvBpC/plf98VoRnbspWKw+3Num7x4DzbTIMz2AocdBkTVEH4P04vSUgEmDkkPz9MjJl9ou7jP+EyfhwJ99XIDCqu84niof7a+HF4CSQwuAKhIiAHkZBs28a8UTmxMRUhL9SA56VQsp6t0TkF+FJeA77ptWOrWo9P5ZD43IFECBPFwcLCHQzwpQZSYuStYM8OxOFSDFLMOuSz5/xLPcHRK4mYTXcnXnnZamuHleFUnynpHAd6vWbQ+uVsvoxo1Kf4+bGTr7Rl+8ABXPdO53nJQdSFHIpJJWtHfw4hbBpk83TrRNAuOuTxKma2ysMFMjPW97f6y0a6v81pCZGjrxYZJpCAkRIXo3GlVHYPbLXgRFTvUVYp/dEggYVKPO2Dw89SuVTXWp5bV6KfTW7cO2yzwfx5ANlSoyjOsFBI9WWmol7m5F/ydk19t0Iy2Jw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8d00fa-0711-4336-2244-08de7bd4f181
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 23:06:04.8104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: llwrjwC2MtA1yw9UYUJQgJ2tNxm7CXpNu9baCmb9SZ9Q5HoYyKqWDaOEzz2OTW2htVdqR2jK2bjYRNMP4K0zXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7567
X-Authority-Analysis: v=2.4 cv=SZ/6t/Ru c=1 sm=1 tr=0 ts=69ab5dea cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=jIQo8A4GAAAA:8
 a=IXqZeh_3c-E37zqV2ZwA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: K4jMGp6zs9CzjOzxyu9MBZDVajJ-qtoQ
X-Proofpoint-ORIG-GUID: K4jMGp6zs9CzjOzxyu9MBZDVajJ-qtoQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDIxNyBTYWx0ZWRfXxDtRqnjkf6nx
 g2cOFeepnxlGKhUBmj4GqCnMCgWyxL0zdSUE3vQuIHZYxWuMUPsKAYIqYXj4Xw25MP7EOcw6PR5
 p4PYhy9hmC/CV/rlvHhndxaC3TtRyBcRXueJ+7CKHZda70xHGTJxsg7Iqu2wayvpWNz9aRkjiOZ
 JWRyHRv1zxv3bd7T6zh3m32UK8gZtVhh2k9IecOy7leQruHkigh8MqUcAQGlVX9Oi+fmo+0KrXd
 YqB1a7qVu2K+cm6a3TToY/4DCUcWOKjNzS+AMKJ1N+gHuSQEwRM4b0nO7f0imaU0c4PWF+0RiNm
 AZFL+Ya2Dfye9vKk8P8g30HSUC3D/0UKAukjsuFqH+Cc5yQ9hmb+6lVGwj17f8kpfVVo0Ci1PxK
 MN8+VfaJ+92dSyvoqHZI/624IEnzduzg/f6s6ZPXDrA3pI9xYj8TV1qc3Rk4e0o2dJVuDzB8bl6
 hMOaigC2H7lf41TfU+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_06,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2603060217
X-Rspamd-Queue-Id: B674B2287E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34165-lists,linux-usb=lfdr.de];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[synopsys.com:dkim,synopsys.com:email,synopsys.com:mid,linaro.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,urldefense.com:url];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

T24gRnJpLCBNYXIgMDYsIDIwMjYsIFplZXNoYW4gQWhtYWQgd3JvdGU6DQo+IFNtYXRjaCB3YXJu
cyB0aGF0IF9fZHdjM19nYWRnZXRfa2lja190cmFuc2ZlcigpIG1pZ2h0IGJlIG1pc3NpbmcgYW4N
Cj4gZXJyb3IgY29kZSB3aGVuIHJldHVybmluZyAncmV0JyBhdCBsaW5lIDE2OTEuDQo+IA0KPiBX
aGlsZSAncmV0JyBpcyBndWFyYW50ZWVkIHRvIGJlIDAgYXQgdGhpcyBwb2ludCwgcmV0dXJuaW5n
IGFuIGV4cGxpY2l0IDANCj4gaW1wcm92ZXMgcmVhZGFiaWxpdHkgYnkgcmVtb3ZpbmcgYSBsZXZl
bCBvZiBpbmRpcmVjdGlvbiBhbmQgY2xhcmlmaWVzDQo+IHRoZSBpbnRlbnQgdGhhdCB0aGlzIGlz
IGEgc3VjY2Vzc2Z1bCAibm8tb3AiIHBhdGguIFRoaXMgY2hhbmdlIGFsc28NCj4gc2lsZW5jZXMg
dGhlIFNtYXRjaCB3YXJuaW5nLg0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxk
YW4uY2FycGVudGVyQGxpbmFyby5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IFplZXNoYW4gQWhtYWQg
PHplZXNoYW5haG1hZDAyMjAxOUBnbWFpbC5jb20+DQo+IC0tLQ0KPiBMaW5rOiBodHRwczovL3Vy
bGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiL0NBUEJX
R3BFaTc3KnNrc05MYXp3PWR0eUEzZDZmQm4tcjEwOTE3azFyRXp3elQzTT1nQUBtYWlsLmdtYWls
LmNvbS9ULyp0X187S3lNISFBNEYyUjlHX3BnIWFzWHF1aDktQ1VPSnRMeWEyYVdQRVFsX3VXeUdM
cGhxbm82ckc3eFNoXzEwajZWLUU1RzQ5Mk5jRkVpTkZFUUkxRTBFazRPOTVkaW8wVWVUcWFYWDFB
QUU4Q09LQ08wJCANCj4gDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwgMiArLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2Fk
Z2V0LmMNCj4gaW5kZXggMGE2ODg5MDRjZThjLi4zZDRjYTY4ZTU4NGMgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9nYWRn
ZXQuYw0KPiBAQCAtMTY4OCw3ICsxNjg4LDcgQEAgc3RhdGljIGludCBfX2R3YzNfZ2FkZ2V0X2tp
Y2tfdHJhbnNmZXIoc3RydWN0IGR3YzNfZXAgKmRlcCkNCj4gIAkgKiB0cmFuc2ZlciwgdGhlcmUn
cyBubyBuZWVkIHRvIHVwZGF0ZSB0aGUgdHJhbnNmZXIuDQo+ICAJICovDQo+ICAJaWYgKCFyZXQg
JiYgIXN0YXJ0aW5nKQ0KPiAtCQlyZXR1cm4gcmV0Ow0KPiArCQlyZXR1cm4gMDsNCj4gIA0KPiAg
CXJlcSA9IG5leHRfcmVxdWVzdCgmZGVwLT5zdGFydGVkX2xpc3QpOw0KPiAgCWlmICghcmVxKSB7
DQo+IC0tIA0KPiAyLjQzLjANCj4gDQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5n
dXllbkBzeW5vcHN5cy5jb20+DQoNCkJSLA0KVGhpbmg=

