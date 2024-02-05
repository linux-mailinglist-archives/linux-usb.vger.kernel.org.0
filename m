Return-Path: <linux-usb+bounces-5883-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31005849F40
	for <lists+linux-usb@lfdr.de>; Mon,  5 Feb 2024 17:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CC9AB21FF5
	for <lists+linux-usb@lfdr.de>; Mon,  5 Feb 2024 16:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C07032C92;
	Mon,  5 Feb 2024 16:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ok/Xzk3O";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AAF0nJqr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="paQ9wH2e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BC83FE48
	for <linux-usb@vger.kernel.org>; Mon,  5 Feb 2024 16:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707149158; cv=fail; b=Gl6w6IZ3x+C0DAWB73Owy+pbBwIAy4G2qJDtG51h6AG8fq1t/UqtHhFfTGaABrZVvY8nyuKuXDWpdfcaMYsPprYbJecCMJlso46tWdp5KbCA00YihjoZ7PExfD/J0jVqV/tJgKF6tsJdH3MFRLJbR801LmfWCkxRVCiKCkCJf7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707149158; c=relaxed/simple;
	bh=Pud+jTkLWWmdqguOu6wSOvkpbSyfb5Wc78zkMr4wdpo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F3sQFqrDcW8Ua1wYYcGUoZn02/0802e7h5+5l54ww0D+1CoLezUqyOesPkCjGfYZPfMYp07dEx39V1PkSS4XT2Dv38gFjIpqO993+D06vZuJtwRh+7CMLKc99+Qy3BvLhLJPW+TNiyNmhlNZbNWNQaS6EGTqK8gR7LohPFVAYIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ok/Xzk3O; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=AAF0nJqr; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=paQ9wH2e reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 415Fsk2S014882;
	Mon, 5 Feb 2024 08:05:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=Pud+jTkLWWmdqguOu6wSOvkpbSyfb5Wc78zkMr4wdpo=; b=
	Ok/Xzk3Op/6vtRLA27o/XZuOFBV2TqO68QJUajKrb1rjtLdpPd/MTTZ0qiU/5WKF
	vVOusH7Rv7jnUxb2a5Ss+8Srl5iTmEy/IYrYW0NMfy+bHglS7rYB3iofzhPQpu92
	UIcU4u43FXzr4ecU5FBNjPZgYZihY6iht9HS+uTExhQBghVuMi7OyFGTDU02JZST
	QX23Hdpr03eb4fryQukJvZWlDcxHdVbw0Q97cttq3qq2XLe27PwQLJbgOpUIk3Dk
	JZxjMicRbCl6cgWhUnSoL5rIvasgfuraV8/FfF51ba3bAP8m2SEcpIRX9SOPjBoe
	/Okl7AujpBAu43/uGZt54A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3w1ncp70pa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 08:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1707149142; bh=Pud+jTkLWWmdqguOu6wSOvkpbSyfb5Wc78zkMr4wdpo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=AAF0nJqr97ShSqi92dtq+OoAASXCFn/CoGo01JBLww0hzLGctiILzlRvchLuERW/e
	 cSbnVyNrZGjEOSRnqbStWjoIV26dya/4LYv3lQvv8GfFlT1KpGm52WexlBuh1G/Zwz
	 8l/+Sdwde4+5OC/hyaZkxNpufBuftGGmM+TgWEEmTh2cpMOSruz7i7Oe/h2hc+7bTf
	 P9eb0yTyAlrkUfaOkoFoemEXHnXGuHPfsRjsShObIsSYoB+JPNB8+7wWQYsbTp7M2h
	 3mxittC/fZY+MvvnPHCnUfS4pRNKcqNJnxeWpKt3R0/5iSFpA4OFZsWWMB8X5Xqj+o
	 /PuZtOAUskDzg==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3826F4035A;
	Mon,  5 Feb 2024 16:05:42 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 1C98FA0077;
	Mon,  5 Feb 2024 16:05:42 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=paQ9wH2e;
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A2C9F404F3;
	Mon,  5 Feb 2024 16:05:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfM1EAcPEFUQU5hPy4WNVRoZpTkTycHSAULuo/bz3q2M4lrHvbGOHDkZrnvYvIR7EEw3UQsikWz6Jvofi+3T/xsGrtb1dRxthfhEiK1KlK61IHkb5iKy4biTgKGL4S+0y2xamgPC7kjAmF9/GplXU/WAMzfSMshT3AYI2IETdiGRX2QxNMu8XgRP9Ks3GCAFzdGQFMYQ8zrkIpq2qti4ImifiR8nJ+w/21AYlCUPvjQJzePuJww0qaJ7nwyGWsm3tGS3RNPlCiTaOcmYwnuIL4QLK6nxirlI+pL/wVqbrJDQA73OSBE3yN6B6OFFfhGCrBUO/xuvkkfA6QRdPFRWkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pud+jTkLWWmdqguOu6wSOvkpbSyfb5Wc78zkMr4wdpo=;
 b=ivLbTKp4dhV2NhKRs6je8AoxOdIRLlX75djE/ormGU+ntwQDu81NrE7WMTaMI9xtAkKtB6MwgWvZggUmd/ehaFN/+oQok9/Ckx8JTtDY13m9d2GrMH/7vheE4cnSfJIa8+YvSPXV7FsyFWTTI1GzFz9dPJs6Gp2HRa7d6V3ndg0vewkxgCTbmNxu4RdRKd4WQ1FF+TN2sQmVpi/Q+tm3vT/7XAZJlLq/6hSqZC7dMwa1G75jTF0cY8aJ6MNAkUCU1z1O/G4X8knlaQw1wvovcpYi3sPZvJEogEunffOm2M3+zsWvvIxJH6wvWEy7uChEGBjfPK2iFvG6SvBM3l7RWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pud+jTkLWWmdqguOu6wSOvkpbSyfb5Wc78zkMr4wdpo=;
 b=paQ9wH2eh5GRfbhS7jZ7iwhTI9jfkQkK4uWkDZii/DJJERcVurgQeZUaAlk8kHIa4S52vw0UISd4LDNXC3r3ZO9JGbuZFO9aRoAgbUch1rKmR0u4OBvlgwE3x1paT5H5NwzBHUrTZ88Ne6ZP9aCtw1/qDXaUaeWt2BJRhPwBom8=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.15; Mon, 5 Feb
 2024 16:05:37 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::5866:efa0:7f40:cd66]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::5866:efa0:7f40:cd66%3]) with mapi id 15.20.7270.016; Mon, 5 Feb 2024
 16:05:37 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Pavel Hofman <pavel.hofman@ivitera.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb: gadget: dwc2: RK3308: Transmission to EP OUT stalls at
 larger packet size
Thread-Topic: usb: gadget: dwc2: RK3308: Transmission to EP OUT stalls at
 larger packet size
Thread-Index: AQHaWDlYK+JmFGKVjk6y9CgXZKFNMbD70I+AgAAVlgCAAAO2gA==
Date: Mon, 5 Feb 2024 16:05:37 +0000
Message-ID: <0efd145e-eacd-412d-a937-7c7a91790de7@synopsys.com>
References: <91811ad2-991e-bd34-b3ec-2b92229bdd8b@ivitera.com>
 <758d6e5d-d5b4-2bcc-bd51-fb7b49356532@ivitera.com>
 <4c198e2b-72fe-f21c-77a0-7c011ace3c6d@ivitera.com>
In-Reply-To: <4c198e2b-72fe-f21c-77a0-7c011ace3c6d@ivitera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|MN0PR12MB5834:EE_
x-ms-office365-filtering-correlation-id: dc270be6-a935-4cef-b93f-08dc26644ad8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 izqTvGFIwHQNeDf+DUfy8o+/wNHwAqc7z/oc040O8Qv6CCoWAkxtP3i6wL1JhIMEimF1duidK7UGBIgI2ZS6gE05Ul6Eree+qkxNhBRoEMoCWC5klOCLTeX6OPdFQ1uPBwYaLhonm+SSnEZzTN/YdL0CwzVQcenfHFqfAlAgZI+qvVMbVpAQewuo361kUb3UKE83bs/Hs2hb6DneN8c8z1C9RZefnZRFUlGeBj4ob0V+CGayG97Rd+D42VhEFjeJu8wx3i5VLFegabtwslSsUBSAjq1wu/i10n2BRXmAM5FYhjs4OY55AHxN4mLqrAPnZiT0Lfz2wUjsbLW1ZDTsQ1WFd7+a9GBVCCnnA7q9VcCY8X8ElZhE3oDNunuXsNn+h5cUfugedWwhlujGPCigiuw+eLFaAObTcCWEbQzSHzCb8+jFHSzWvuYDTyygnEA8+Yeiii0Zv9hmYavXu6mVB5sIEOGak+PLflWO9hD2lnnbJLcf1yt+Eo2mTlV/udmjKZGDO2T7SWuTVtXXTM284giolyOqUJ/UyN+hLbnIN/nbfrnSnAuL5hRZxdGR2A6r7GvJpm2hLZDU8eafTE3EkEHnspmJJExeelq6o9D+/17E86+NkEkEnyw6U43/iOYo62faFkxY6i6b0qbTPSWIYvmc784mnlgNbdNCWFGEdGKHupGvBvoCnGT/56k+xqP5
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(366004)(346002)(376002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(41300700001)(6506007)(26005)(38100700002)(64756008)(71200400001)(8676002)(66446008)(31686004)(4326008)(66946007)(86362001)(5660300002)(6512007)(2906002)(478600001)(6486002)(53546011)(31696002)(316002)(83380400001)(6916009)(122000001)(76116006)(2616005)(66556008)(36756003)(66476007)(8936002)(38070700009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZWlOV3FJWUxVeURxamcwa2lwWTNIdG5nSkRDdk8vOWZlczJKY2hWYlVZUytp?=
 =?utf-8?B?TitFTHlGclFabElrUTQrckw0RUlzTnRBRnhJYjRkVWI1SVRtcmxZN0l0K1Zi?=
 =?utf-8?B?cjNLN1piVmZaZndweUcybzFhQ3l6VmFaQ0FPWjc5Qi9OQ3RpTEtDcTN1S3dK?=
 =?utf-8?B?VXhVcEdDVUhtZ2ZtVVpLUGppK2p2UVB0L25WdG5JOW1RajZHWC95eXhrMkpt?=
 =?utf-8?B?OEh4bUN4ZzMyK1BwenNlQllYeUkrTmdGSys5NVBlNmZPMTR5dnRiU1BmZWl4?=
 =?utf-8?B?QjZ5YWdpTVIxUG5qSTErc1YyWFh2VjJUWDQ1VFZ1N2RPZGNpS1UwTUxjOWxF?=
 =?utf-8?B?ZnF1am4xbEdBZzRrYXE0L2ZzcjV6aGR0eE4rWHNOMEZYbFU5bUdBd05aM0Vi?=
 =?utf-8?B?bURmZXF4bXZxZHBpcHdpd3pXNm9lU3JBZlV2ejJjYkhSWkhRRjU0VzJkakJU?=
 =?utf-8?B?RHIvc0p6SkpEWUltSFllM3l1ck03Mk83YklZV3VCUTByN0M3TXVnMzU0SCtG?=
 =?utf-8?B?QXZ5MmZxT2loT0NHbENNemZRRmg2K2NrVm9qd3MrcGxPc0VNNFloN0ZjeHhP?=
 =?utf-8?B?Nk9kMnF5alZFbmZQQVNFYVRGZ0VDb2c5TzVOemZsTmprZDFtV2NhcENzbGg0?=
 =?utf-8?B?T2xVcXcvM0dQZWF2U0FvRzdsWTRmMmlleGNjN09Jc0NTUUp4RURzSHVkWmla?=
 =?utf-8?B?SElQMG02dnV2R1ZwanF3M00xZ3RwR0YrWmhBdHkwa1pMVjhQSEMreUFYQ1By?=
 =?utf-8?B?aHluMitNbEdlYlphV2Vsbi9DUmZoQXgyQ0hobzdIY2pKYW8wTnc4RElsQUpR?=
 =?utf-8?B?RVkwQ2E1czJyaUZaTERxUmlFb0xyOUdFUzdTR1cxN0plNlA3d1E1bVJ6cUdy?=
 =?utf-8?B?YnZWVE9ySzQ0NjBqV2RRNFI5REFnNmcvT00rSGl2S2ZiLzRYQ0JZSDZlVkk3?=
 =?utf-8?B?MFp3MkUrL3d5U2xjOW1ZRUVlTWxnV1JDR0E0bGE4NXY0U09Ed3JVL2hiS2ov?=
 =?utf-8?B?ejhkSy9lVnRTQWQ4dkFDb1JLQjc1R2x4Z000eXhhOFgrRkpGeTYvL0VSYk5o?=
 =?utf-8?B?QzNVcUNidTJXUFZvbWVKZjE3djNMSVhXZU02VU5IbGJUTnlERU0rQ1VmU2Zr?=
 =?utf-8?B?YmZ6ZGVlKzdpaTJrTlRrSEo1ZEYvOWFRUzhWTWxqZFRSWVJxa08rMkQ3QzM1?=
 =?utf-8?B?ZG5MZGx2a2F3aFV2T0c1YlJJUzA4dVVnQ01nK3RtNElhOTV1citUMFJXUGF4?=
 =?utf-8?B?UHg4RG41K3ZWUFJoTStKcUJPNmtESFduNC9WTE1haTRvK1RRUCtsVW1tTTNF?=
 =?utf-8?B?RmNzZlVrcGNVS2hRWnZBV2FXczhtSUdzVGVza1l1bFVKbDNlbUNKUVFxaU93?=
 =?utf-8?B?QUgwVEJHN2pZeHNxOTc4ZXc3Q1BFbDhuak5KR2laYVVvYklBR3ZaOWp0NUVE?=
 =?utf-8?B?TVB1QUhheFpZd0xkSzdjaWh6aEpFdXVXVlJOQml5b0k3MmhZTm1hdVRDd3J2?=
 =?utf-8?B?ajBlUHNhZVVDOE1qZWtPRG4rQkF0dTdVUUw5YWZTNGJhQWRaL0JOR2dTWk1F?=
 =?utf-8?B?OHVvSXgxODBpYVhmMGVKeC9ZVzk4Y3BYUXdURFladk5WMlhkZ08vY2lJT1RN?=
 =?utf-8?B?QTFKdUdkeDdkN3hZQjFPQ3RqRUxJdnBiSWk2UkRwMm1paFJHeFJGSVpSYUcy?=
 =?utf-8?B?RFpNM1BidXgrMkZiektZclNpTzgydHFabVlJV3JEcUtIREJJQnNNY0V0a2lt?=
 =?utf-8?B?RnNISk5JbVh5cGVRT2FuOU9sWUk1ZDlTaXIvanI5VGFNYWRZdVhFeXR5VG5Y?=
 =?utf-8?B?MEhMU3c5b1FDa3RFdnJIOWwxb1p3K3hRNVpZVktEU3pTdTJjTmJncXdqbExl?=
 =?utf-8?B?YThpR25FRzgrR29GMlh2WStheHFsOWdFcXZWMU1OcXlBcnBkcStleFA3RWxP?=
 =?utf-8?B?WTRDRGFGZGY2UWdSY1FpWldTL3pGSy9JNnQ0UEpmcGVrblEzY1dhNGlyQ3M3?=
 =?utf-8?B?eWU4MTJKaFQrL1FpY09NT25UcjVBTWNCc1RRWDNEc3BlY0RJQm82QzRzeTdW?=
 =?utf-8?B?Wjk2QmRBeG5oQVdOTmk5ZXN5UEFjb1JKVDZNM0pVVFdPTFNRenF5WFlubWJQ?=
 =?utf-8?Q?76TYWbDFz/8XMJdwvrGrXaj8K?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D482E39B8856A84787B2AA87A27F2EBE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	vmtThvY6hzXCZa8PzYo0wKkz6nvt1Zx/P2HMh/oLJW9qj+68fJyfQsya/7mCD/pKtF3c2KitFZYk2c5KwJPxRP0C36rZjZWL4Yh2We+GMQEBMykKDUY8bas6Gq3MoaCYzbCkv21XyfMVpK+WAsRsUvZyp0SRKagZNJE46GEjkvvKg4oW9q4tiNZ/AVAFhhHR7cigAqeEszs5ybTm7S9sNfsLGfmJo/s2XZRYZLP7yIqvJzQQti77tJM3sxIHiy1wDXYCeeS00VW4QtEJxcGvZnGnPulgYMhMlXosrcOrp6qaWVflbwawePkstGehkQbohlf0BvSdo7+IminZvrL8i7QIaBX2Aor+GEvOr85UEF57QJK1bKFKPW1L5DRfr1ei0YAcQeWxlFx966Z9UoCzr3+v35H4HhVLIadvzo8ZIQ6+xPQFDp8gPv3k5+2ajJaKZ+gDav3ZI/ESi1OcV9Vut+xAOTSeap1byzbWYeO34BlFhdn0NVihcOMbVslJvCwGO/4QqY2z//vGuF5a3TgcprN+OcF+TAgrS+Y/w6M+yLx1ExITa/4fUjYUzRkGJQhq+4lc8PGd2f1ifnkQON8YI4Qas4OyEoTcB9Y+zsKc3EqwCYmOE8vlZudFDdDD6WyCbZDE4CxpANscOB/r9De1/A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc270be6-a935-4cef-b93f-08dc26644ad8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2024 16:05:37.3860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PwOChWcCVc0x9wfXIVapo1HGbUQw3c2GmTpkhpTdRik3ey0LMDYHdaCLj7U4YnkX5o6Syxd5EGfA9u9eH96hhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834
X-Proofpoint-GUID: e4LRpxDOAeg1utFXXPqjxfK78nzkg3Eq
X-Proofpoint-ORIG-GUID: e4LRpxDOAeg1utFXXPqjxfK78nzkg3Eq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxlogscore=461
 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402050122

SGkgUGF2ZWwsDQoNCk9uIDIvNS8yNCAxOTo1MiwgUGF2ZWwgSG9mbWFuIHdyb3RlOg0KPiANCj4g
DQo+IERuZSAwNS4gMDIuIDI0IHYgMTU6MzUgUGF2ZWwgSG9mbWFuIG5hcHNhbChhKToNCj4+DQo+
Pj4NCj4+IEl0IHJlYWxseSBsb29rcyBsaWtlIHNvbWUgRE1BIHBlcmZvcm1hbmNlIGlzc3VlLiBT
dHJlYW0gOTgwIGJ5dGVzLyANCj4+IDI1MHVzIChiSW50ZXJ2YWw9MikgaXMgYml0cGVyZmVjdCwg
bm8gZHJvcHBlZCBwYWNrZXRzLiBXaGlsZSAyNCANCj4+IGJ5dGVzLzEyNXVzIChiSW50ZXJ2YWw9
MSkgZ2V0cyBzdHVjay4gSUlVQyB0aGUgRE1BIGlzIG5vdCBjYXBhYmxlIG9mIA0KPj4gY29weWlu
ZyBwYWNrZXRzIGV2ZXJ5IDEyNXVzLiBQbGVhc2UgaXMgdGhlcmUgYW55IGNoYW5jZSB0byB0d2Vh
ayB0aGUgDQo+PiBwZXJmb3JtYW5jZSB0byBoYW5kbGUgdGhlIDEyNXVzIHBhY2tldHMgcmVsaWFi
bHk/DQo+Pg0KPiANCj4gSSB0cmllZCBpbmNyZWFzaW5nIGZfdWFjMiByZXFfbnVtYmVyL1VBQzJf
REVGX1JFUV9OVU0gZnJvbSAyIHRvIDggYW5kIA0KPiBzdHJlYW1pbmcgc2VlbXMgdG8gcnVuIHN0
YWJsZSBhdCAxMjV1cyBtaWNyb2ZyYW1lcyBub3cgKGluIGJvdGggDQo+IGRpcmVjdGlvbnMgc2lt
dWx0YW5lb3VzbHkpLiBQbGVhc2UgaXMgdGhlcmUgYW55IG90aGVyIGdhZGdldCB0d2VhayB3aGlj
aCANCj4gY291bGQgcG90ZW50aWFsbHkgcmVkdWNlIHRoZSByaXNrIG9mIGRyb3BwZWQgcGFja2V0
cz8gU29tZXRoaW5nIGxpa2UgDQo+IHVzaW5nIHBsYWluIERNQSBpbnN0ZWFkIG9mIGRlc2MgRE1B
IChubyBpZGVhIDotKSApLi4uDQo+IA0KPiBUaGFua3MgYSBsb3QgZm9yIHlvdXIgZXhwZXJ0IG9w
aW5pb24uDQoNCg0KWWVzLCBpdCdzIG1hbmRhdG9yeSB0byBpbmNyZWFzZSBmX3VhYzJfcmVxX251
bWJlciwgYXQgbGVhc3QgNC4gT2J2aW91c2x5IA0KMiBpcyBub3QgZW5vdWdoIGZvciBkZXNjcmlw
dG9yIGxpc3QgYW5kIG1haW4gY2F1c2Ugb2YgQk5BIGludGVycnVwdC4NCkFub3RoZXIgc3VnZ2Vz
dGlvbiB0byBjaGFuZ2UgRE1BIG1vZGUgZnJvbSBERE1BIHRvIEJETUEgYXMgSSBzdWdnZXN0ZWQg
DQppbiBwcmV2aW91cyBlbWFpbC4NCg0KVGhhbmtzLA0KTWluYXM=

