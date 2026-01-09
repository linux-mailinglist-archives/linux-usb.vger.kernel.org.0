Return-Path: <linux-usb+bounces-32087-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0709D06A37
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 01:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DEC230313FD
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 00:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5755A18DF80;
	Fri,  9 Jan 2026 00:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="wBQqMlpe";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZlBIzk+r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dnzeN8WJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FCD18027;
	Fri,  9 Jan 2026 00:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767919587; cv=fail; b=R9J/bgqlxCnzCLj1ABRxAixLbZvJV8wn6ecpNHAe3L7eNGpCc4deyUgZpIWKcZwEVuiNSsJmU9Wj9UytjoUeB4/IAACWvxFS+nmGahHdvv9aE88n6Nx6OtfDJ+9Jg7VkTDDzqCojULenztgMb4M6/jcLeXwN7+7fmtO572aHm2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767919587; c=relaxed/simple;
	bh=kPZxvc8vARN121aClJQPfVNB5WnR96uBGSMzwwb+kl4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GcV/7ng8QFL8xclz0X/or554AH9bU0T2to3Jv9RStHwUP4eE5G2mQA1LTj7SXsfWFQkZWQgFilspBw6mErrMXw+vLg7xE9AefYtI43ks3FFGriJy6IXJ28xoXVwviioTcs4s09nyHhm6a2AwDhoNnIDW2zyqkyHiK3aLP7c9l8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=wBQqMlpe; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZlBIzk+r; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dnzeN8WJ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608MhWrG3691364;
	Thu, 8 Jan 2026 16:45:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=kPZxvc8vARN121aClJQPfVNB5WnR96uBGSMzwwb+kl4=; b=
	wBQqMlpePMs/hktRYRu5GBLR6nvMOoHYAfHVxr6G6lcH5BxR0nTYp3TOamUA8pdh
	LOf0ne0L/8Ji1XOtrkssDr+51avSq2OSneBjCrQBwIulUJd9cSp4dUfG/cwEmIqC
	hTmKvK2iIAZelfmrE/YIp5+vc6R0iDSXXYLfuwo7sLmQs2+ZQVuUfPCfT6pVvOWM
	LwRbvWE+CQzGytXl1XjWtvdUs1tqjId2GQeHAtX/3BUftAffHgb1yvEmE+G1t5Eb
	TQA2n/qPHnBUC/OIDksMVcfPxCk/sXlB0Qz1nQRnjmhxBIOiz7ouhnRkyHxAbzI+
	YSLERXwVrJCJWaqofKCSug==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4bjng3grt6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 16:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1767919544; bh=kPZxvc8vARN121aClJQPfVNB5WnR96uBGSMzwwb+kl4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ZlBIzk+r+ciAv8afD3ghG/BNUNfcfN9g4ORDayYW8xe4Fm1ne+65cp6IaqNQdsc1N
	 H6nQhRkeJk/gXtV2XcdCjDxGv/PpSmo1A730ucvq9se9ZIZY+HcLtfH8atKEXz12U3
	 VNiePj0X2Zv1DzAUflVk0SPvfil+ljKxXUVtWOEXRhf+/3r2TvKh3fU5we4Rxq2TrC
	 uOtcbAA4Ghb7he7qTgXUgS+xWw+BOH16gTkuyEtpD8Rv5QJBlZv8LyPFwVrxfk6SCQ
	 3j/L/4R+2SV2/gQ739TdoZ0Y0R+gs8XsIAgMTlhdXQvQzhtl/GEpbG8ZpIIoYlU4iM
	 Dhd7qGrVrCUaA==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4055540540;
	Fri,  9 Jan 2026 00:45:42 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id AD1F0A005A;
	Fri,  9 Jan 2026 00:45:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=dnzeN8WJ;
	dkim-atps=neutral
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00401.outbound.protection.outlook.com [40.93.13.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7C97A4035D;
	Fri,  9 Jan 2026 00:45:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2Az1hg3a2TJDippvWuPJefHYlbQ7LK65t4DwtXwoF7feLf1p5HAR6x5RZht1DD1aW8LYklzKZng5EowuEMuhdPrkIHO5YDOF0g4UXQ4F3BKNtriVi3DkXA3ONX5CbwIDWRbAagJJH/aLArSaJ2ZEIH1rupBIUzoN3ecbwIgQoamRRh/3HTUf6gDcR57PSuOXpKRhvzYc0CKaOdg/heDQFfyQc8HhHNUrQF79W3OZWCHtA5rhUelAYgN59deZArBJckjTpP3CDoYvKSd2rRq3H7NPT+qs+hDch2mL8PZPwjRQcZuCbS3EbWl/Su9FWhqKLMi7A5Y3eiLAvxGbWutmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPZxvc8vARN121aClJQPfVNB5WnR96uBGSMzwwb+kl4=;
 b=jNtpWHPVhCS/wnHR+bGIIZYL68SbIBgYBeOuP4gpEiGZoulIGYLXc1QLB6aZ3aakM09beFuMWmNpklWYFPa/n+/bN5X+8uuXSjd4wQ5MbCCXZ2h9S5tOYsmsl84Rz/bjZk/tZhNtrXrtV4IHsnvHXrbT3inyuowPjwh+tNeKn3eqrShIpk0hMAlnu/2ktUeFRD6gsk3oachmEeR9opZtslTjiicagh8aRVGP5fHFqDw2O2/PRSrNqmi36aFLGvQCq+4FbdtSE3jP5i0O8fy2F5S3NCEUeApLOYjpE88KYBw/9bh+x1NKhO9z1CnRiLHKDKySq8n3x4+x9goU6HhqEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPZxvc8vARN121aClJQPfVNB5WnR96uBGSMzwwb+kl4=;
 b=dnzeN8WJ+u9ArxDPiCezBTUptFb5axHa7QVajZsRsgwGm3Anm5286otAfk6+0GBwuM/8OqIyzb8Pjc77XMzAGM3/kaRgzhoVLnpQuaPqcScuVN3mIGx/JCngLnIETUhTjemWMtVX3i1vH9Wjqoi0GPax0PRnE9kpHNoV6HzYfew=
Received: from MN0PR12MB5979.namprd12.prod.outlook.com (2603:10b6:208:37e::15)
 by SN7PR12MB7251.namprd12.prod.outlook.com (2603:10b6:806:2ab::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 00:45:30 +0000
Received: from MN0PR12MB5979.namprd12.prod.outlook.com
 ([fe80::39d3:f259:acf5:7f7a]) by MN0PR12MB5979.namprd12.prod.outlook.com
 ([fe80::39d3:f259:acf5:7f7a%4]) with mapi id 15.20.9499.002; Fri, 9 Jan 2026
 00:45:29 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Xu Yang <xu.yang_2@nxp.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "jun.li@nxp.com" <jun.li@nxp.com>
Subject: Re: [PATCH v2 3/3] usb: dwc3: imx8mp: disable auto suspend for host
 role
Thread-Topic: [PATCH v2 3/3] usb: dwc3: imx8mp: disable auto suspend for host
 role
Thread-Index: AQHcZZdMlQ8G7roFm0ec5/UZ4PaAXbUk+6sAgCMixQCAARjXAA==
Date: Fri, 9 Jan 2026 00:45:29 +0000
Message-ID: <20260109004520.5l7tkyhgi6cooeda@synopsys.com>
References: <20251205032942.2259671-1-xu.yang_2@nxp.com>
 <20251205032942.2259671-3-xu.yang_2@nxp.com>
 <20251216232638.rglecm3op6qit5a5@synopsys.com>
 <ft43w567youffka6qwrpbzkwctk3dttwsnaqgx45atwjhoenc7@rbpluqz7xpm4>
In-Reply-To: <ft43w567youffka6qwrpbzkwctk3dttwsnaqgx45atwjhoenc7@rbpluqz7xpm4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5979:EE_|SN7PR12MB7251:EE_
x-ms-office365-filtering-correlation-id: 2d3962a5-9230-4efa-d1cb-08de4f18632b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?OXhPRi9rZlBuSEtUUmU0MjIzOGdRSXk2cGFkdlhNaU81enpoYzhyYnVpanJ6?=
 =?utf-8?B?RUFJSXFGRzNmUCtodDNxampUOG00MDk4a0JhUHFzMCtxVzFyYlZJM3NqNDJB?=
 =?utf-8?B?c2RRM0h6cHpxLzNKd21HSWZyWXFSa3JBVEdQc1IzWFF1cVVRa3ZhUW43WGVD?=
 =?utf-8?B?bE1VYkxGUEt3UWRiV0hLNVNwa1k3RVUrTVU3MUVQK01zSEFvTFJ2cWdCRk1Z?=
 =?utf-8?B?azUrV0J1SUJwUlZiTnBUaU9GWVJaN28vUjR0ZVlueld1ZExHeGpFekRGOFNs?=
 =?utf-8?B?WkoyVlplc2UwOUZJeWdkWFFpdWNGUTBIT2IvcHVVMER4Z20zQWk0QjM5YVBw?=
 =?utf-8?B?TENhWWdXSTdya1A3aHpkYi9mR0NyQzNUZFd3MnFwS1dnbHVza0dBcVFSSyt0?=
 =?utf-8?B?ODFtSkpWQ0F3MVA4RzBYb0FEYncwMVFxZEl1SElrWW1PN0J4ZHRWdmFZWkNy?=
 =?utf-8?B?U01TdlExZ2IwcmkyYWNMZi9PTVlrb1l6c2Z5VDhxaTl1c3JzeEhCYWdHMFhJ?=
 =?utf-8?B?Tkx0TXNnelRJNThhWU53Q2ZhZkU1Ni81Rk5TQ0xOVmt2dHhnd1I5TFpTanVQ?=
 =?utf-8?B?OHNGdVcweDJPWEtDQk1CWEM1em9rTWkwaGVvbEw5amlMY0F0aDVuTFlyNXpR?=
 =?utf-8?B?WUlDaC9jUlpXd1NQZGJCVDl5dUhqdklxazNWMnhxMmVjRUZ6VjhTK1BhZEpB?=
 =?utf-8?B?M3BVMFUzeEJxTE1VMTRLVGhsdElTVFROdzJSRHZZd2VsZm9Bd2ZVQkk3Ty9q?=
 =?utf-8?B?Wm9POHNXL0plYUpOVkNSeWFBZlFMS21jeUpRV2FTT1ZWZVFhWW1OT0ZKb1Vx?=
 =?utf-8?B?bXU5WDJEMjlpdjlrTVRmTUd2Mm9NN25ENEFkUGIwa3lWL2F3bDZpTmxoTkFm?=
 =?utf-8?B?ZmRibGRMSTIvemdRdDR3U1pqSU05eXRMck5mRUwzb1pGWDA1Yllwa0d3bEZp?=
 =?utf-8?B?RXR3bUpWTDFFbFZnNWF2QWRYTnFuaFRzZkhDbzh4UGZwRXdWcEJoYXVHY3d5?=
 =?utf-8?B?ZG56SnJQOFdGTDdwcDQ0d2ZlUnZXaW4xMXJQMXd5WUdxakhMT2RHRjkrdk0r?=
 =?utf-8?B?Rk1RWHlyVGRxNDFXU09tYU12MVBOM1I2cytCUFBvMytlS2Z6Nk5BWC9wa01n?=
 =?utf-8?B?YlVqbytSREhFV2tLY0F3K1VMNmFRdzlJWnhERTRUZWYyL0k3OVhOSjJhSDlD?=
 =?utf-8?B?MTlnSGVQQ0NTOTdiaitzckppWEJ5MTVwY0Z3V3ZQbEJrODI4T3pUNHNXNlBz?=
 =?utf-8?B?em0ybTBIcFdPMzRPK1ZwRlZ3eDdKM04wRFlxV3o3NnZVc05VVWZ4djg1OFBX?=
 =?utf-8?B?UmtUTjgya0E1djhTb1BSalZGa0pramxMN1JNdFJKbzkwTFRHY0REOFJmS0pn?=
 =?utf-8?B?NTAyVnRmOEY3UmZLYjAyRW10WWNjaDhVT2RjWmh2VUthYzhaNVNaTks2Skp4?=
 =?utf-8?B?NUY0Sm5jVnlQZlcvWnJQMHZzKzcvMENxS0lZQ0RFSHEycXJRaFdab0xDdGlW?=
 =?utf-8?B?NlRIaEowYWdBNHBmbzl0ZkNDSklsb2RGc3kyb2JLa2xVbzY5dlJWSkJyUjll?=
 =?utf-8?B?YzMzUERLTTlGY0U3a21PeEwvYytYZzJSd2hDT1d5QmtidnJvSi9UMEFxdTcv?=
 =?utf-8?B?WUszV29hRi91UGc4L25aRVYrdURrR2M1Nmt3NmNNMjdNbVEwd3hBOVBSRGFh?=
 =?utf-8?B?T05DTHZMRjAvWXVuOWdhZWU4ZUxBSERiTWhmQ0RtN2hEcGlZdU5KSTFUU1hh?=
 =?utf-8?B?YkQ3WEhleHA2YzZmV1RJNFVoa2dPc0tFbXJ4VjZuNkpDd012NVdBa3JMUlpV?=
 =?utf-8?B?VzcxbzA5OFpjaTJuMTVGc2ZTY2hMRll1SXhvUm5xa2xmRHBZczkxZ2pSM3hG?=
 =?utf-8?B?YlVNbnJ3WFNCbjd1TXlySWlhV0dSMWpxbGp6di90RUg0ZktZeWdmK2I2c2pN?=
 =?utf-8?B?OWo0UFlnSG9oNlNucUJURnBncGdOSmZhZXVFVHZPazJBeVdHTjZWTFliOVFk?=
 =?utf-8?B?bmNGUFpYSGVacTVuOExuZXZNR3ZZR2JwRGVJWkxrbjlmWWNhSXM0ZDdRdkN1?=
 =?utf-8?Q?vfbTo9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5979.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Zk9ZZTlEUXdpR0Rta2E5ajArWUFwUm02TDJWV0hmeFdHZElWcGRZMFdEdlNW?=
 =?utf-8?B?NFdaNnArTEhwNXlIcDdUbXlybVkwSFVpcWlLVDZZMnJBb1A2aHppWml2eWUy?=
 =?utf-8?B?eG5yK2ZXQjY0eHExNHp5bW9jRllkNWIwMGJtOW0ycjhsS2lRYlQ2NWNlVmFE?=
 =?utf-8?B?d2hJYlpRRWc0bFZ4M1JNcUw0Mlp1NFBuSW5kTGgrQ3NFNDhkc1BEWXovU0Fk?=
 =?utf-8?B?ZmJEZTlBVTZ0WnpzVUd4YVdMblI2emNqeGY4RFpONGVUVlFMOGVuVjNtV0Nn?=
 =?utf-8?B?clU4TVM3K3craFR1bzdyTHNSVWhqNDN5aDRRdnJ2ZHFVNVFWTlQ3UXlYTHNp?=
 =?utf-8?B?L0lGSEpQc2JyMnk5dHcwMy9tZit0ckdsRlQ2MWpzMWdhRmkrRm9NZ0hiYnVv?=
 =?utf-8?B?M0c4QkxsZTl6UklNZDBVMkROcVQ4NGkxYUlaQ3RFTjN5VkVnbW80ZE5rMW10?=
 =?utf-8?B?SnNOQzk5dkw5NlZsTjJqUGNkRjZEa2hPQlVhcGRhME13UlkvdVNFekhZSTcx?=
 =?utf-8?B?K1JvczUyUHYrSi8rN2xybFg4YmlHZ1lwbE11YjJMUmhRZ0wrNWtHeDEzMXdm?=
 =?utf-8?B?VzBYWkduWm0xMFJsclUxZ29kY0pNdU0xRXQzK1Q5TkhlQ0hzcThkbUFXSDBw?=
 =?utf-8?B?WHlhMndGWXNPcDd5UU1xQjg0Sk1wcW9sVjZGa3RhZFowNE5UT2I5cjFlWjFJ?=
 =?utf-8?B?aFZCbDRmWkFuQjVlN2RBRDBqK0Juczd5TDZaSU1ObjIvSDhpbjlTdTVVTGty?=
 =?utf-8?B?RUt4TlpoTkV5VXN2YXlBTEh3cjVxV3ZhSndsN1Y4eHJiaFpuU2hZTERFdmVT?=
 =?utf-8?B?d1dKR2wxZ1QweVpZeXJhcjRXNUVtcjM1aEU2M1lSOTArRTE4bVgrbWF6cEYw?=
 =?utf-8?B?b0sybzBrcHV2UnR1SFl5dmwrY3RYQURTdDFjWWdxbEg1aUEweURncWpmbHQx?=
 =?utf-8?B?NDM3amt1dWNvK0JiSnVIRkt3d3ZsZk5ncWdpN25hZG1OdDRJbDZyMnJsZ2VC?=
 =?utf-8?B?ekRoTDM2TkpBWk41TUplK3F0Z0JRZ0FQWGFiOWFUZUxJQlBDeVJlQ2Z4RnVC?=
 =?utf-8?B?ZTczeWRXcjAvV2NBNHdLV0h2aGU2VjZQUkthdFFScEtCTFlRa0I3clM5bkZY?=
 =?utf-8?B?SGZYeGxaK3NFM0RXOHFvWFdMcGUrQXlwdjhvZHMxQ1ovSjlUYi9Cd3dLNnpF?=
 =?utf-8?B?U1lhOURCRTd2d2t2SEtXYmozQWJIL29OMmJOcER2Z0RzR3YyR01MZ1ViQ2xq?=
 =?utf-8?B?N1VkcEhkWHhCVVpvQUt5ZjBKSi9zczVGNEUwcXhSSmVvdGlJK0tndG03QnpV?=
 =?utf-8?B?dVVtVjZiSVI5SXZ0Sll1OHpCakU3OWQ0R0MrRFZnOTRoQ1lkYWlkUEJ3ajZT?=
 =?utf-8?B?ektKNFFqaEdBTGxLbnM2UWRPQVpkU2lEWUwvRndITjVnMnpkblJHdWRKbzRh?=
 =?utf-8?B?VUh2MlZJZk1jUnMvUHZJUWhzU3RwVzhDR1d2M1dVdlBlbWlvQklSYmg1TVFy?=
 =?utf-8?B?cDRDdlUzdWNJRVB5RzNTZGJXRk9tTUF1a3RtcUhDbG9iSmhKb3ZDeXJ1Q1Ew?=
 =?utf-8?B?bUVvdmZsYU14ejJ6RGU5bGRmZlg3V01YZnNyZWVqdVhVTloya1N1WWhQT2tI?=
 =?utf-8?B?eUVOZE13dFIvc3M3YXlhK1ROMTlwYUFZdEJRQVdCa1hnNDF1TTM3aEVkMzIy?=
 =?utf-8?B?bVMyK2RXa25pOWN0MzgxVjErdEpsRC9aM2VXOW5lTHUwcmllOVRWUjY3TnJj?=
 =?utf-8?B?STk5Z2xXVjdEbFhTeElia2VramlPK2kvRzE5Znp5blA3MjJ0azNwTVJtNjVr?=
 =?utf-8?B?RXFYREcyZU1YcFdRcElnMHlmSTM2K05ZczRFcmF3aVp5VTV1TnZsOThFMFFo?=
 =?utf-8?B?c0wraHdFN3diSHJGcWtmaXFWUldMT2pNM3orajQwTytuYnZMRlJHOEo3dzVY?=
 =?utf-8?B?aGx5d0cyVU5Bc21qUHc5cGd6Q0M5WE85bURGaHoyTmRWRjJkY2tlZkdlYlV3?=
 =?utf-8?B?Q0gwa1VKQytIYVRqaG9YZW10VHc2MjhrR1RHUWxBQWg0R3pjcGtrbDQ0SWE1?=
 =?utf-8?B?d0sxTTVCNFVJTXF5K3JyTGFoOUJWMnJ6MjdkRldQWkY0K1lJZXQyeDR2ZjQ3?=
 =?utf-8?B?V012MFJSdHVGR2NvMjE1KzRsb2dlTkxGbnNhZk9xcEg1ejdjejhINGJxSFpj?=
 =?utf-8?B?bTgwUmQxdE5vZlFvNW90NTBTNjFFdm9MKzNhcWlkdlhPRmkvZnhydnJPeEUr?=
 =?utf-8?B?L2dZeXBVcjNHakZaekRGUE1KRlRQTWZjZXM0cHNqMkNtMnNxRFFxZG9RTkVX?=
 =?utf-8?B?K0VpUGVNWWdTV3ZVUkhPQUtQM3MxRGZERGVWZG5tNCtaTzFTSGhCZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6342303F997FD542AE9AFC18807936E3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ynv3cALpvsovUMU6/8dmZgokI5UCLJjFnBqlgpYFppIBvpHxnSnK2r9Y/QgzOsD+CFd9fuStCwQNRpdJBPuf6EQQI+0OWjNFc7+TUjqHf9zN9Ta4dtFlCXOl1fpHeTUhCHAh19qPmTojpPj5inID/9YfIwyHVy0ST0dmAWq3CGXxM1sW+eYlqentWN5qGDhx6BiAcfp+Vfs7FJHhGirunwiJ+9yPJi2LaC1CMimTh1WvNKMmkH2QcwEp05FPrJG+YY1flgzHTbRxU04rtKZfBVA7Ezdjbep6VfVCLmzdlGfvghTvGq/ANHkeVzLLgY/bks2M4JYJNAuiYSN188tl5SdVRFGdqB5OsAJ9qNN09VDw8zJDZjG5Dn0qtZ9KsyrwjwDn4BKSxUvoo6TFuF0md3JXEhbwdJ17lLn7xS/gR0baPXqWTwVnHzTfMdEFKRTZGGtlf5Ccyhzos85sf83B0ztZb11PFJ2RhTDPOABy3pwaZLJ4WNPmk1uzLv+zwAiR/uwUcx/h/JQ6Wim3sYZHHhux/zDR5cV01z5YVP6AvwA/aWfLeDvEpy82OxMKMXQRkMH0qtsmAjjIfDFnoDpY8H0RefAkM75DYpNWYu9/SAPADn1EIHpEZs/ehovcdre+wA8mMarz+PQxNhmZ3O6Xpg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5979.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3962a5-9230-4efa-d1cb-08de4f18632b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 00:45:29.3616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 043ZRbjafjX5Ywe7Cbe6Qwftm+lXxAd+oKqbamIo0tV3uvKiHCogT8jykDSOqW0wmEv8V9PSaYK3tlpoDahAqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7251
X-Proofpoint-ORIG-GUID: YRmyTBGO-TJIMaPs4rKZvNQuJShpyT48
X-Authority-Analysis: v=2.4 cv=TdKbdBQh c=1 sm=1 tr=0 ts=69604fb9 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=AVxt9N0_kYXaG-zipEEA:9
 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAwNCBTYWx0ZWRfX4Q9dUhJ7gmco
 Ya7vCYwZlsEKyQaDZVTaoTi86K1C5lJc+R9QKIhjM+qQ4HVFWpbYonfR0nqfJVmgeZ1m3Qw5qNS
 yyaX67upGkI6UvIrGAmFHUNYGJm6D+we7Sv4lxkT41DJzkqNSw2G+21MyxmT6hBv/j2BftqAwQa
 XBBjHsNCV+Mx1uJ3QHWTtE72KGGE6sFoHrkNtNXaxPqjs29wQfqeymy4vJPyhcucnaBNuxaAnPs
 Rj5Y6KiBFL5JvY6ecFk9DO04ZsHtNzR43uuFjyhJ73LlEHfyULPB/gK2yN8Rj+xjjs6MFRfPqnX
 6hHT74Cv2CvZRbKsPnFAfV29bl4RTB5hgCzR0MvgpSOP73kb8YuUk+TR7VE2RXKsmHa/v+c58Y5
 JsmUnx0idm+48dQ2T5t7u81+jRCHSyXNyCXNeFM5eeuWQELFXJq21JrK8XjqodGDWabYmlSJKPh
 7oIWFSGivFK+tCvGHgQ==
X-Proofpoint-GUID: YRmyTBGO-TJIMaPs4rKZvNQuJShpyT48
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2512120000 definitions=main-2601090004

T24gVGh1LCBKYW4gMDgsIDIwMjYsIFh1IFlhbmcgd3JvdGU6DQo+IE9uIFR1ZSwgRGVjIDE2LCAy
MDI1IGF0IDExOjI2OjQwUE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBGcmks
IERlYyAwNSwgMjAyNSwgWHUgWWFuZyB3cm90ZToNCj4gPiA+IERvIGR3YzMgY29yZSBhdXRvIHN1
c3BlbmQgZW5hYmxlIGZvciBkZXZpY2UgYW5kIGRpc2FibGUgZm9yIGhvc3QNCj4gPiA+ICwgdGhp
cyBjYW4gbWFrZSBzdXJlIGR3YzMgY29yZSBkZXZpY2UgYXV0byBzdXNwZW5kIHNldHRpbmcgaXMN
Cj4gPiA+IGNvcnJlY3QgYWxsIHRoZSB0aW1lLCB0aGUgYmFja2dyb3VuZCBvZiBkaXNhYmxlIGR3
YzMgY29yZSBkZXZpY2UNCj4gPiA+IGF1dG8gc3VzcGVuZCBpcyB0byBtYWtlIGl0cyBwYXJlbnQg
ZGV2aWNlIHN1c3BlbmQgaW1tZWRpYXRlbHkNCj4gPiA+IChzbyB3YWtldXAgZW5hYmxlIGNhbiBi
ZSBlbmFibGVkKSBhZnRlciB4aGNpLXBsYXQgZGV2aWNlIHN1c3BlbmRlZCwNCj4gPiA+IGZvciBk
ZXZpY2UgbW9kZSwgd2Uga2VlcCB0aGUgZHdjMyBjb3JlIGRldmljZSBhdXRvIHN1c3BlbmQgaXMg
dG8NCj4gPiA+IGdpdmUgc29tZSB3YWl0IGZvciBnYWRnZXQgdG8gYmUgZW51bWVyYXRlZC4NCj4g
PiA+IA0KPiA+ID4gTm90ZTogSXQncyBhIHRlbXBvcmFyeSBzb2x1dGlvbiB1bnRpbCB3ZSBzd2l0
Y2ggdG8gdXNpbmcgdGhlIG5ldw0KPiA+ID4gICAgICAgZmxhdHRlbiBtb2RlbC4NCj4gPiA+IA0K
PiA+ID4gU2lnbmVkLW9mZi1ieTogWHUgWWFuZyA8eHUueWFuZ18yQG54cC5jb20+DQo+ID4gPiAN
Cj4gPiA+IC0tLQ0KPiA+ID4gQ2hhbmdlcyBpbiB2MjoNCj4gPiA+ICAtIGFkZCBhIG5vdGUgc3Vn
Z2VzdGVkIGJ5IFRoaW5oDQo+ID4gPiAtLS0NCj4gPiA+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMt
aW14OG1wLmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiAgMSBm
aWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1pbXg4bXAuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1p
bXg4bXAuYw0KPiA+ID4gaW5kZXggOGJlY2U0YmFlY2JmLi4yZTEzY2E1ODhmNDIgMTAwNjQ0DQo+
ID4gPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMNCj4gPiA+ICsrKyBiL2Ry
aXZlcnMvdXNiL2R3YzMvZHdjMy1pbXg4bXAuYw0KPiA+ID4gQEAgLTE1OCwxMSArMTU4LDMxIEBA
IHN0YXRpYyBpcnFyZXR1cm5fdCBkd2MzX2lteDhtcF9pbnRlcnJ1cHQoaW50IGlycSwgdm9pZCAq
X2R3YzNfaW14KQ0KPiA+ID4gIAlyZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ID4gPiAgfQ0KPiA+ID4g
IA0KPiA+ID4gK3N0YXRpYyB2b2lkIGR3YzNfaW14X3ByZV9zZXRfcm9sZShzdHJ1Y3QgZHdjMyAq
ZHdjLCBlbnVtIHVzYl9yb2xlIHJvbGUpDQo+ID4gPiArew0KPiA+ID4gKwlpZiAocm9sZSA9PSBV
U0JfUk9MRV9IT1NUKQ0KPiA+ID4gKwkJLyoNCj4gPiA+ICsJCSAqIEZvciB4aGNpIGhvc3QsIHdl
IG5lZWQgZGlzYWJsZSBkd2MgY29yZSBhdXRvDQo+ID4gPiArCQkgKiBzdXNwZW5kLCBiZWNhdXNl
IGR1cmluZyB0aGlzIGF1dG8gc3VzcGVuZCBkZWxheSg1cyksDQo+ID4gPiArCQkgKiB4aGNpIGhv
c3QgUlVOX1NUT1AgaXMgY2xlYXJlZCBhbmQgd2FrZXVwIGlzIG5vdA0KPiA+ID4gKwkJICogZW5h
YmxlZCwgaWYgZGV2aWNlIGlzIGluc2VydGVkLCB4aGNpIGhvc3QgY2FuJ3QNCj4gPiA+ICsJCSAq
IHJlc3BvbnNlIHRoZSBjb25uZWN0aW9uLg0KPiA+ID4gKwkJICovDQo+ID4gPiArCQlwbV9ydW50
aW1lX2RvbnRfdXNlX2F1dG9zdXNwZW5kKGR3Yy0+ZGV2KTsNCj4gPiANCj4gPiBBcyBub3RlZCBw
cmV2aW91c2x5LCBkb24ndCB3ZSBuZWVkIHRvIHVud2luZCB0aGlzIGluIGR3YzNfaW14OG1wX3Jl
bW92ZQ0KPiA+IGlmIHRoZSBjdXJyZW50IG1vZGUgZGV2aWNlPw0KPiANCj4gVGhhbmtzIGZvciB0
aGUgcmVtaW5kZXIuIEkgY2hlY2sgaXQsIGR3YzNfY29yZV9yZW1vdmUoKSB3aWxsIGNhbGwNCj4g
cG1fcnVudGltZV9kb250X3VzZV9hdXRvc3VzcGVuZCgpLiBTbyBpdCBzZWVtcyB1bm5lY2Vzc2Fy
eSB0byB1bndpbmQgaXQNCj4gYWdhaW4gaW4gZHdjM19pbXg4bXBfcmVtb3ZlKCkuDQo+IA0KDQpU
aGFua3MgZm9yIGNoZWNraW5nLg0KDQpCUiwNClRoaW5o

