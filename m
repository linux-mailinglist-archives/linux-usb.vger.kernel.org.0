Return-Path: <linux-usb+bounces-34034-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJVODsbdqGlmyAAAu9opvQ
	(envelope-from <linux-usb+bounces-34034-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 02:35:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A398A209E19
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 02:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36E58305C3E8
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 01:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB201AF4EF;
	Thu,  5 Mar 2026 01:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="o1N0F9Wi";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XQzWKB9d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OktVLSwY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A68F78F4A;
	Thu,  5 Mar 2026 01:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772674426; cv=fail; b=KPWLvcbHQvWiTFn+HtaV56ozDSmiStmVbBVae7Y7TSCl6Hc4bAnRD3PJzIU4WeynLQnmltUVVixq8cZep6YXG9AgAxadcZAtbuJl+dwsvkgnlE9hUH9JiOn8SHSXeNOZVbaPTvdEwGkFoXmXY3cuVVnWfkSFHaQ8I+rbpAJtXZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772674426; c=relaxed/simple;
	bh=olb0vOXGNk1cyDhwOkkyZPxWhVMIIrrRuuPnl0mfHg0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZU182ZXx5ZfRT0gDnKKX1U4jaJOT1FPEdVxMM/W8xjpzsSzPvRxfu7QOoVZQx5lOdnonvHmimqKvSNHVWx3OD85nr+5lMD0u1kpDyOfVPYsoDIRLWoUAs88fZws6d59qhuNQE60ls+FR6Pb1AU5oMdEOErfXca78LD99Y4qrKZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=o1N0F9Wi; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=XQzWKB9d; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OktVLSwY reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6250ioPO844222;
	Wed, 4 Mar 2026 17:33:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=olb0vOXGNk1cyDhwOkkyZPxWhVMIIrrRuuPnl0mfHg0=; b=
	o1N0F9WiB39j/+QwqaX6d8Ls9KztlV4bm9QFSYHmeGJcmW97RpWCxzxO1NYgW9qu
	SBjImD3q+W9ubOOir2jOAuqzSu84KnwIiENCs3WEvMJNQFRaoLWfwjF3GlWv3utL
	NbeIHtadCV7cKwWuoWL7X5P6Kxk1aDuAfeGI3XG4GF/t9TAw5DYBq7j6O0GLb6yG
	7dkF6KhN1DirYD8EXnEghSMN1+JR9s91MbQqdkhc3+19aaBc4bQXrkfvopbkpbjP
	o2yd0aE/+RXw5pVURgnATf05MW86fcABgq+nAm2jLrbukeWY/IM/s6Q9L8BeOJtu
	vtNrlQxgME4vIUo7vtKV3g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cpxgu0fpt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 17:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772674403; bh=olb0vOXGNk1cyDhwOkkyZPxWhVMIIrrRuuPnl0mfHg0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=XQzWKB9d0ANRj6cYIRVwdcD3aDVNnTgubIdI6uwYMKY/QfGa22UG44gHkmmBNA2In
	 DQU20Rca+ABVpQQi+CPnwnKzPCmANHHNuvPj+o9Y0DOvzHVIaExI7bSv9cVtpZlLVD
	 CbgICp/bJ3P51FuUlfT/u+jGdV5fVu6wRNmy51pBe70vRVpF8jt/IeXT6WleJxBgNa
	 C1OVa43CRK3vi+BQGWDP+tdTh5QZcMes7/Pf7VfstWoUtG5vIbguklkbaUReGI+sO2
	 1CsY3v6zOXWhaL64msvFbI6hszPY4CBYu4k8FEPGhIrNIKZNDShfdcD7f4dY8dPLUe
	 Zox+kPsE9QPkw==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0419B40364;
	Thu,  5 Mar 2026 01:33:23 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B97CAA0076;
	Thu,  5 Mar 2026 01:33:22 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=OktVLSwY;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00300.outbound.protection.outlook.com [40.93.12.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id CDA5240671;
	Thu,  5 Mar 2026 01:33:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EcRTVyPiH1QLP/BQdZiS2X/R/yY41/vqmjvuptmIafttGc+b3eeDHXLQ0e1YXhnYFd4+W+RnK1E5rthgRxPTwm0BuYe6YiQUOqMd5j6j9Q6ovt2lkUbWssoDoSKJhVIw1gMsfqqvKddHiJ1vVuHJo7fCAexqMPk1eVPlDm3H/E3hdMGsnIn+1umaWzqWDuVcBq/Wn15+ZQ2D4gmS3jNtfydu/A8RlQ/J2IoiDONy/pJDlWjQBbrATpe563OUAsCHEBMdQwK1285F6HsZQ5H3Dib7pb+1kTldeu4zsPT+w2WPRjyCDnhtfigTl7ApDTi6my5HGuTqILaF1ZkjS3Z9Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olb0vOXGNk1cyDhwOkkyZPxWhVMIIrrRuuPnl0mfHg0=;
 b=KTSkJYeT6IYMEFmknDTMEwSYofKIBUD5T554Ec0WVFHfXUklucoceFTvO09R8jSg8qlSahj7TWDCPvPdFtlXyD4nObTxDHHI6S1zjx8xHylQgEH1V0PV5v4U3n4l6AAkuAO55uGzIm7lS8qrBRHUmvW3xUlMxJN0KyFdkpDPqcHet+qvOPmpCt0GLRunYHvEiTFA8VHTcD7juxSPDI52//pIUv5jAfvTV61mrkIMse0pS34ZkMxAG6KyDbwcs2EVW3eT6pPQd4gKKj/F8kv6vLAci/bJ8r8D3ODWCqye26oDyjgUQ3m4SEY0gpJVVWDQuX4wh70tnwkWR5rN+yIH6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olb0vOXGNk1cyDhwOkkyZPxWhVMIIrrRuuPnl0mfHg0=;
 b=OktVLSwYyCoTKb+P+/3nJQZCXZMU0GDQlSByrLseMq+KoGwg8xmq3OwzkM/bVkQy6Mt7cWlS9Tuw0JAn69M/JwSNOMHuCzzJNh4Ju9VRKOUI/Kv1TxvQfh/1mpVm6AeVJNWncyGvbnhYHs+viCwoBhdBI9Dph5+I1ILHZQJooWs=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH8PR12MB7304.namprd12.prod.outlook.com (2603:10b6:510:217::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 01:33:17 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 01:33:17 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Xu Yang <xu.yang_2@nxp.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] usb: dwc3: fix a kernel-doc issue
Thread-Topic: [PATCH v2 1/2] usb: dwc3: fix a kernel-doc issue
Thread-Index: AQHcq8tLF9q54NsOMEWBeCUixqTKBLWfKHYA
Date: Thu, 5 Mar 2026 01:33:16 +0000
Message-ID: <20260305013310.432mjnke6bw7nf5g@synopsys.com>
References: <20260304113916.856841-1-xu.yang_2@nxp.com>
In-Reply-To: <20260304113916.856841-1-xu.yang_2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH8PR12MB7304:EE_
x-ms-office365-filtering-correlation-id: e315100c-25f2-40bd-f4cd-08de7a572d19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 +KfoqgBUGBSnIcS7eQCRkO9zp8KUzZlrFHZKt/Rg4+48t6p94xBKwrpWORpmUkhYxtnEDUJeLkQMQwsbNrheQQcVkxOtMKMG3NsKPcZq3iJhV7E3gqNP3Z1x8MrCBopy66Wggvj6oA5BzTpV6FCwsIWUFaNIiyzkCEVY0wkGoi/IqPMupNJgVYtWWX6pHixKdHxjvw/Q+D4mMVmHfMDunTd2XZthZN1IYxKn8ycrWPidhI79yfiOwnryRSX8z9dhQxUmb7zSSPWumkh8EJTCVUkpplZRRlGmJGpQpnE9N6ECl0Oux78Vqb2d41Fuear4/W6AZcQ2Lo3GmQIs6TG2PgXJ+yZOEphdMutfyCdfKnFQSwjxeJbypu3Ps+4k7I6j1ocw38kmVSn148jCUyVVLX7EBGxswrkjkgx1cvPvlduGpXMkkOFOdLggaur/k9wy3cykoq7eycoVcclsf1V2Il3TfSm5wq4/dW/b+PAPXcpk9SsOXRlExYmRZdNt5bUNN9gU21UAPebZXKug09Rh3gowDofaLbIIZ+MusA6Fm2JGrH7CCeHi8hzywBmPlYRQTVZ9E3+gTZkw/QmjSRETIonSlsebjOf5635iRmY8+TVZkaT0EPbwEP42a38uySsWRy0i7SLImKgCCyz/GNpu+Gaktjb26ORy1Mg0fxhdHwIYR8QXDGAZPEp8Bx8gDAKHgQTTOOcm5uAm4eCjvBMpTnb/PtKSuaehEGO5wjYq5+pGK7PgIRKsSdCTIThYp/LmRap7tfCljd9YskGmk9H0vgVhznTCJSvgQ82FbxbAQLw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U015bXIxMHh3citVRHpERUF1RTQzbGZIUTNDdS9zM3lFZ1BYVGMzaThPMng0?=
 =?utf-8?B?RElubGtJRi9EeCtpTHRuNy9OOHlBd29SM3I2M0J2VjhDS2RPOVNNQlh2OFI4?=
 =?utf-8?B?RWtjNEpycnlva2tGcENFZUwveDhxNC9xZWRPMHJ0RUQ3MnMzQmhlMWM2cGRM?=
 =?utf-8?B?NExtR0tmdTFYT0dQd0U1NjN3NyszOG1FQkNhRElKRytZQ1NNdDdJaEdFbGxp?=
 =?utf-8?B?dS9XTDkyOWxFcW1sZC9oS1RLdUtvMlNrOUNnbXhDbFNQZXpoN2s3RUg5c2I0?=
 =?utf-8?B?aHBoRlppSC9RR25NdkFzM3M2bExZbExTZ25XdUZsUDN6bWpnZEhYNFluSTdB?=
 =?utf-8?B?TmplVTl6dUZJVXRLUm5LN2dKc1VYUkkzWXRFNDBWek5wOTgrU1lIZE9TR0tE?=
 =?utf-8?B?R2d3cUtWckZOQkRGdGlkTXVleU44eE1XWmJ0NGxEcW5FNlM2TlUybUZMQWRS?=
 =?utf-8?B?dzVYM0QvSmxyYzNBTjZZSVhVeW5HVFpwdHRabjNySEpNTGF6NkZ0czN6WGdC?=
 =?utf-8?B?RGFLQ2dvZTVpUnQrWGJTYWhQallzUHBjb2NyQ3NEYWx4dnRtTVFvRFA3NUww?=
 =?utf-8?B?RTRsQTByNUxhaGorL1g4N2hWaTRyb0hpQURrUXJ6UWtkS3hoaDEyRkFYNmZF?=
 =?utf-8?B?Q3cyM3dQcUlTQWVGQklTNE9oQS9aTGNSbHVaYnd6MnIxKzBxK3pXMWpnY0Y5?=
 =?utf-8?B?N2V0TzZvK3VDTEQ1cnR6ZnYrMUcxck9YeTNlaVZXWW9IU0FEaDNOak9POFdV?=
 =?utf-8?B?b01CTkhMN2hPclFwS1NyRXRSdTRmbklOL3FLMlM3Y0piTytBWVNQbFNGY1or?=
 =?utf-8?B?cnFmTVJvM2FsRGoweGQ1bnVWdHlDR0pZdVBzSkt3Ym95VHhpTlVkV3Zzc2pl?=
 =?utf-8?B?bklSdGRuTnZyTjMyQ0JrZHZxVzNNdTRTaHBjZGZpTFF3TFZYN3M4ankwank3?=
 =?utf-8?B?Wk11ZUtiN09XSzdaUG1IekdOcjBQcEU2RXRmRzFjaFQwSEtKTm1rRDkzeTIx?=
 =?utf-8?B?b3hTK1hKenRJbk5oM3IrQmtVK2VZMHBvZHAvck5jd3ZzcmpPZ0ttV0dmbHdy?=
 =?utf-8?B?UFJLSnZOU3hmWHQweGxDdEJTVjVhTlgrSzU4YWFVckh3bVRiaGFQWWwyY1BX?=
 =?utf-8?B?WE12eGVidlNXc2JKaEFyNURkbTVkNlJKd3JUWjM4QTBvaEVMeXl5ay9tMWJa?=
 =?utf-8?B?dHdpUmZ5Z2dhRUVobXZNdENCZllLVHUycEJwRjlSY04rcFR4QmJQcWNvUzBl?=
 =?utf-8?B?aVByQW5YQzl3K2plUnQ4a1FIR0UvR0RUR25rZURYVFN4cWQ1cWczSnZaZC9E?=
 =?utf-8?B?aUF0SlhoMFFPalBEcXBvcHZtRXdRTFY3Y1ZQS3FiQk55K0s3S0xwT3gvVmNC?=
 =?utf-8?B?bE8zZHJBdm5sMkJtem0zNDNDZzRqaEFJd2h5MEZNd0hVa3M3clc3L3R3OGRE?=
 =?utf-8?B?eDQySDgzc3pWVzAyVXNGbCtNZGd5V0JLOUNPbDZvWVptSWt1aTgyWk05SWlE?=
 =?utf-8?B?dDRpYnQ0WXFpcU1vZGJMSWZFdmo1UnJDZ3NWdzZLNVBFQmZ6VzJvdTc4cXZz?=
 =?utf-8?B?Q2RVaDRPQmNNOHhlb0VJNFc1dHVBb2ErN2VJUEhNQ3VwWE40UUhscWNRa25V?=
 =?utf-8?B?M1NYQTN4UWZtY0Z3ajFiK1UxdVNwOWVHM1hKVDJDQXZRVVAycFlacEhrYUdJ?=
 =?utf-8?B?MVlOR2xpR2NKdTJOL04zeklIamJvZE5pNlA0eWkza2VuTlh3c0MwYnNJWDNJ?=
 =?utf-8?B?K0VlTnM5M1ZtWld5YXRWanNWaHR2R0cxRzRUU3dFdGFUSllmeGw3ZmJJelhO?=
 =?utf-8?B?US9GZkFRNktRdFFTZjN5cjgxdWoxZlJPcVB6NjB5OGYwZVFHeU9DSDFjK0s1?=
 =?utf-8?B?S0MvUUdaRFlRcFRkeGd2TmxJRUNQV0RlOTZYZnJSdlVhQUhIL1RnelhRajJT?=
 =?utf-8?B?YW1JK25zcmtJcFh3VEZ3ZHM4b3B5MVZtaTB2Sk5jczZSdGtCdzY3TWpEZjlJ?=
 =?utf-8?B?VHQyc3lOcFRjMzJuTlZ2Tlg0SGtrbUpTL0hwdGVKUEpsRmVjMW05WFJsb21F?=
 =?utf-8?B?dStQd1FSL0VIWHB4SmFOdzhlNXB1YWlPY2lCMlV1dGdlT2hCV0NxelZZbXpU?=
 =?utf-8?B?VjRTTDFrb05pMHNtTHFpeG1xNXNWYmUvZ0E3emIxOGpCL0RYSnpwelhxdmR0?=
 =?utf-8?B?Yld5NXdiWWtOQytUYVpwYjl5dEpadG51V0psSERuaUU4OThraklDN0kyTE9w?=
 =?utf-8?B?bWdkL2xyNEljdFZZZU14dW9pcHFvTEVvVWRtWUlvajdON2JTV3lHem80UVFs?=
 =?utf-8?B?L1hZVTlqejNFa2RZTDU2QzFBL2Z6a3pXZjR5aTUvMEErK3hGV2dkUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FBABFE57A9C344382BBCEFDA84E3DD0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	VMCos87raZSO/TYUCLdkehO+MSrPkNiisW8+xrYoKcblFp+FvWldjIQJBh2Y0xhR1unl5XDAbGX9BLuvZf6W+DCHxwQqarO0DGiKe+D82vkbx+LTkTlwwEGGCc30P7iiQSX0BZY6VJSlDLiI1sczhs/HO3csWVoLqx9wwVfCawGI3G884fhkFqzXlpw0PzUn2oJNvtZJMJ0okjmQ7UxtVyaLUTfZGlX7g0Ft1+K2/9zo5NrX1OpnLp/IYFcyN+ijFIB7xe53OGScF5INvDmj1nhQZm7sF6RvPR5a2A5ZyG/8gpcDEw0ib+1sKDfuiCeZbl+igiq7Hg8WsdqV3nZ2sA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ei5GT1+aFLL7b20iaq+QjGE+oH55f40VHyF54e/OqkW9Wl3oNz7TKi5NqeH91W0Qaex8D1Vp0giKeCMJCj0AoS0QFhToZTHC3fYQhEgZ47S8d1TeVCLr8ydXV8uxlJj+9RLiOZLN+ilEhaGcgbI8qetlc1lM7ymQ0g/dBgxYAbXs/zpBvUk7ZcIkpylRqW0Z+DiLpAEHwX+h3Op8eHwoK8nK0OD/N3z8RnAEVHwpugNGcgfyIUu9ui/MursB7bhyHQmNZMp+h+p6P4WFc2rGlljCeCekhOOgJY+F9Whl/7v44YU1+Ymnzt6vCKGVnUDV7F5m7DKIg6i9AhLuRb9BNP/ISi6IFh+ZBssSc6YZLO7H+QrbNFgmqXbZREYTsxxp2oSW8nZxWbRTAv7F0i1s43kDWUJOIVqybsoPAtRaJ7iqUIzpU19DYUqoqL4GaQmxOBHfIZ7m/xnjSuAta5WMQvvTLydQpsUk66/gYi04EpN2/bRx0TlqbfcJtxeONEK52Luz8FB0DkqDC+4vikqMiBu12m21STgn4bpjBWBraM3NFmww95OjtBMnD4ddSVNv2DhvkvcL6EGb9SLuWNX74U5+n8NTfx2+l3LlWbiF4g/fUITASJZo+ptGIsb9Qp4xky+8a8eARhRd4o4hAgyQkg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e315100c-25f2-40bd-f4cd-08de7a572d19
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 01:33:17.0257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 836Ew9hCXbRf8LmG19Dm96C0O9dogQIMst3Be7H1DleJa5tu9ENQNnY00UU0pCuWS7eEtuGQAh6FNa5Z84TMGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7304
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAxMSBTYWx0ZWRfX3jhWW9rc6MXd
 zz3fucX1nTux6R+TBdhsDFByPOfaEgdOGZmqp3nSavgt2310fqF6ml4r0C99pPyhU3i090qTC0P
 9iYT3bFs0bW6bX8wF0Vc4NlDzvAIsD4AnmQICv5YdXagA/+11DAbpaKkK2dg4qubRV6B2a96RqK
 RoqmPN6nZkEqPmnX+Q6vMBRCn2dAkAK0LHTfAxmlPsFp1hHAMX9CkX89EkrwsAFYFm6i3PgpAFL
 hVxa43QK49z5cfQve2pjlsYyD+Er7ge8dsYM4kXB9UbtfheFIgWRzLjqpX+w2AB9l6djqifT962
 W4niXXO7NAK5kbfLOHGdrtGfMcAf9Bvvr61Lft0L3jrryXJouheGIwK6B/0bZgxc12fa+zL7MFG
 qkkPfRX95wS/0fSjokCt7sc/1sp1EVDh0UYLr19Q5RrrLE3G41s/h679vK7Q/IbXQHfcOuJxAck
 fkUAwhAsHvSD/He0bdg==
X-Proofpoint-ORIG-GUID: o45nW-45ikezAxuUV96xhnyJuDPIQJF4
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69a8dd63 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=8AirrxEcAAAA:8 a=jIQo8A4GAAAA:8 a=zJ8DmsPMw8UpJOdUCt0A:9 a=QEXdDO2ut3YA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: o45nW-45ikezAxuUV96xhnyJuDPIQJF4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2603050011
X-Rspamd-Queue-Id: A398A209E19
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34034-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,synopsys.com:dkim,synopsys.com:email,synopsys.com:mid,nxp.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

T24gV2VkLCBNYXIgMDQsIDIwMjYsIFh1IFlhbmcgd3JvdGU6DQo+IEFkZCAnKicgdG8gbmVlZHNf
ZnVsbF9yZWluaXQgY29tbWVudCBsaW5lIHRvIGZpeCBhIGtlcm5lbC1kb2MgaXNzdWUuDQo+IA0K
PiBGaXhlczogYTcxNzMyMWFkN2M0ICgidXNiOiBkd2MzOiBhZGQgbmVlZHNfZnVsbF9yZWluaXQg
ZmxhZyIpDQo+IFNpZ25lZC1vZmYtYnk6IFh1IFlhbmcgPHh1LnlhbmdfMkBueHAuY29tPg0KPiAN
Cj4gLS0tDQo+IENoYW5nZSBpbiB2MjoNCj4gIC0gaW1wcm92ZSB0aGUgY29tbWl0IG1lc3NhZ2UN
Cj4gIC0gYWRkIGZpeCB0YWcNCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCB8IDIg
Ky0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oIGIvZHJpdmVycy91c2IvZHdj
My9jb3JlLmgNCj4gaW5kZXggNjdiY2M4ZGNjYzg5Li43YWRiOGU3NGJkODQgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29y
ZS5oDQo+IEBAIC0xMTIwLDcgKzExMjAsNyBAQCBzdHJ1Y3QgZHdjM19nbHVlX29wcyB7DQo+ICAg
KiBAdXNiMl9scG1fZGlzYWJsZTogc2V0IHRvIGRpc2FibGUgdXNiMiBscG0gZm9yIGhvc3QNCj4g
ICAqIEB1c2IyX2dhZGdldF9scG1fZGlzYWJsZTogc2V0IHRvIGRpc2FibGUgdXNiMiBscG0gZm9y
IGdhZGdldA0KPiAgICogQG5lZWRzX2Z1bGxfcmVpbml0OiBzZXQgdG8gaW5kaWNhdGUgdGhlIGNv
cmUgbWF5IGxvc2UgcG93ZXIgYW5kIG5lZWQgZnVsbA0KPiAtCQkJaW5pdGlhbGl6YXRpb24gZHVy
aW5nIHN5c3RlbSBwbQ0KPiArICoJCQlpbml0aWFsaXphdGlvbiBkdXJpbmcgc3lzdGVtIHBtDQo+
ICAgKiBAZGlzYWJsZV9zY3JhbWJsZV9xdWlyazogc2V0IGlmIHdlIGVuYWJsZSB0aGUgZGlzYWJs
ZSBzY3JhbWJsZSBxdWlyaw0KPiAgICogQHUyZXhpdF9sZnBzX3F1aXJrOiBzZXQgaWYgd2UgZW5h
YmxlIHUyZXhpdCBsZnBzIHF1aXJrDQo+ICAgKiBAdTJzc19pbnAzX3F1aXJrOiBzZXQgaWYgd2Ug
ZW5hYmxlIFAzIE9LIGZvciBVMi9TUyBJbmFjdGl2ZSBxdWlyaw0KPiAtLSANCj4gMi4zNC4xDQo+
IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0K
DQpUaGFua3MsDQpUaGluaA==

