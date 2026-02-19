Return-Path: <linux-usb+bounces-33468-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK3jKXFzlmlqfQIAu9opvQ
	(envelope-from <linux-usb+bounces-33468-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 03:20:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6A315BAF2
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 03:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0ABA53024A09
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 02:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38CE26ED3F;
	Thu, 19 Feb 2026 02:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JDevZGMg";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hn+KjmXX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Z/2XXn0D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7D018027;
	Thu, 19 Feb 2026 02:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771467504; cv=fail; b=aXHdzVAKDmd1ittOCM2OUQN+DxPXkfx7U7nHFw+Ol+gkfvQDPrRS5otP9tCPDtAdkKHjiPT6BrdtJepyOJoYzjOUKE7X/Vf5vESskRoz9RRR3nY1kL34bO7k5OsjeOor4RSXDqPNEx0Js7FJcZgDU2KTXHvWDR6zJ5LHWuDyjlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771467504; c=relaxed/simple;
	bh=u3i4E6zYvaNPpB6rXvc2+Xs+pLFdnGoKJGpCR05k1uY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GBs2udLCmjMB1CW2xiWr+ML08bOPYwZiOTTPe6+BdeLy+Cg0M5cvkm6ooJISpP4HFxzR0XM3gODP1qScYj65CauVngYe1kVL+b3MxnHsy49aZ9MTyoDbtAZ56WPD14sfjzfGKUgMI32YR+0agOpDIQnIQxysfjsLApUX2E+2LRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JDevZGMg; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hn+KjmXX; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Z/2XXn0D reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J1BAZ3958195;
	Wed, 18 Feb 2026 18:18:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=u3i4E6zYvaNPpB6rXvc2+Xs+pLFdnGoKJGpCR05k1uY=; b=
	JDevZGMguYG9vZ7e94blLvJeHkLJ14U+oFRayTuqMlhdZBl2RR9Cfw5jLujhW3b2
	2bp3QUE3WzdXoHUDMMzYZEMFbhRvXC+HizExpR2IyXas8mrBK4C6ZJbYsSogXkJG
	tfubCdEkjZVN/28sF6nW2x32pTIaG4ArIqv4nrItaWuRW0JwSE6xY2TTEvnAuiaG
	1lJlixJQd2vSXMsHIvdoVF+Qd23pKm0iz22Z834zNbCI5Gut9B2bxUhsSdIsTnn8
	P6I7CWcOj9IT0IprUavmCkcLKhUt7oVuNjCMPDN1EZfFmw+9X2Yj+ywa9uz/8AFS
	G7cpLpDDN0TbzctfK59l6g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cdh9kjkf4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Feb 2026 18:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1771467489; bh=u3i4E6zYvaNPpB6rXvc2+Xs+pLFdnGoKJGpCR05k1uY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=hn+KjmXXW0mHKlZ/K/AgGLK3rHDYWdXhpUQN+5faMTENtSezhkujorwm+JC8hkxvX
	 nrTpJqzPLZNQ4i0xeR2hOzYNfsFqfKNFmCt8kolDbrTFfHCAj6Gj+9/aaKrE6faou2
	 DwSLOLIJ8jVrzuDcfFTwFQMeiVH8OMrhIiDXnCUTlphZuT/vatQcX2JZmouyYrfyz1
	 1onFjiszKAHlrj6vB8Ht6jthcCyVVscGHocgG1GXMSzI4UL3eHpGRUWYJDfo3391aK
	 uo+gYtGB+JqdV9KO2isZn034MW+n387svovK7R2sC+mSbrL8jGTwD7nYSS1Q+L1AAR
	 S4EfXOis69zcw==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AC33840343;
	Thu, 19 Feb 2026 02:18:09 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 75A55A006D;
	Thu, 19 Feb 2026 02:18:07 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Z/2XXn0D;
	dkim-atps=neutral
Received: from CH4PR07CU001.outbound.protection.outlook.com (mail-ch4pr07cu00106.outbound.protection.outlook.com [40.93.20.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 062DF401C3;
	Thu, 19 Feb 2026 02:18:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gy/o3J7R9bBA8r6Lgy/4g5a+Pra+DMtst6tAUjM7Q04JYWTRuWuT1uEj2gcz1Ien1nsySW3H+VaPusFueIQc06hRlAzxgcOJU4fQhtBWKeNoMHlLF+fzZyTHe5VjTzW4f2cPJQgJMYqSoJYo+s2qBopuC+IE0bmjv29p3hBJ2gLABZpuYMy5JYu06MIY7KITXADG9NpGgR/0mcc5QIlLBrKH+VdDeZ8ktQB3F+bPwzhuVyKJVfsGuBjQANpZzB9Or2dJFqmBMBAxOLZq9KIS5ubUL7mv+EzVaDVgGASPfrE8oxGdXwJxdE2MX2zBML7wnLPxvUDB70eo250Ybn4wRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3i4E6zYvaNPpB6rXvc2+Xs+pLFdnGoKJGpCR05k1uY=;
 b=U9TeM+l6UW5McUzf/W0hvUudoGgz8DfoPMJlp6uU2VNMKfLp5zayWxfLigVGcpK9qbhztWZE58HwDZMagSQzdNK7Y/6FsZ2bQu9PmTQ/COEzJXOWkrAMRFq45g8rhRgCGOAjU6B3PwU8B0oM98/6xTyf51e0tpX/k/XEi5PFWH4F1AoEzTWJocGwmglH8Y1d3cDfYRSmX1uP8gBkebTdwSyBI9Xa583hwjvx++lo0SEckM1hQ9zOWqlNoe/8q0cejPsxKTRRti2xd08z4PbdqvbjJ6vvvv48FaaJPFP1Muicihq6GC14M5zkoJpmqrqKjlwhrUt3hFOtOJw0Vmz4nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3i4E6zYvaNPpB6rXvc2+Xs+pLFdnGoKJGpCR05k1uY=;
 b=Z/2XXn0DPFPX+Xk/lZRgd900W2k/AlpySAtn21a3ydu5iuCaOMbMaMFax7kWQNXx95VhBmL6cGwkVNPswAFPH0aklCFP+e7ODViz/XC0DEY2eO8Y4Jg9VcH3jKJWRgJB7MFl429TNC59OVBVALamcrb7EaOP+8zwlKACs9H2V38=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB7567.namprd12.prod.outlook.com (2603:10b6:208:42d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 19 Feb
 2026 02:17:58 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 02:17:58 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "andrzej.p@samsung.com" <andrzej.p@samsung.com>,
        "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
        "chenyufeng@iie.ac.cn" <chenyufeng@iie.ac.cn>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "nab@linux-iscsi.org" <nab@linux-iscsi.org>
Subject: Re: [PATCH] usb: gadget: f_tcm: Fix NULL pointer dereferences in
 nexus handling
Thread-Topic: [PATCH] usb: gadget: f_tcm: Fix NULL pointer dereferences in
 nexus handling
Thread-Index: AQHcn4Wvu8qf06pbZEWeYsPWKDmbZbWH7g+AgAAjfwCAAS35AIAABB+AgAAJO4A=
Date: Thu, 19 Feb 2026 02:17:58 +0000
Message-ID: <20260219021757.eeq35yd7jumpk42n@synopsys.com>
References: <20260219012929.u6btnnmqvbyujz5f@synopsys.com>
 <20260219014455.14351-1-jiashengjiangcool@gmail.com>
In-Reply-To: <20260219014455.14351-1-jiashengjiangcool@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB7567:EE_
x-ms-office365-filtering-correlation-id: 51a03443-39a3-4631-393e-08de6f5d1984
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZFM4cURMMzY5ZzRCZTBWaUU5aFNTa25yTy9ETTZxbmhOUlZJNGlFRUhKUEJN?=
 =?utf-8?B?YkRrUHJrSkRvRUVETjFwRFI3MFBnVTV5bU5SNEJMbkIrVUsyM0VyMGtucjRj?=
 =?utf-8?B?Qm1ORUNUSU9GOC9wai9tZWNrWFU0TE4vMkJwZWhKOFluZC9zaGpheTVUTW1W?=
 =?utf-8?B?RUMyN0VDUWNNTFFhUDNkZExYYW44ODUvU3hyMmk5czNDbnh2TXlncjZUb0RT?=
 =?utf-8?B?MHFhTi9lZ2w0OUhkLzY0QjhpR1JiQ0pZRTRlbnJTYVZqaWc3S1NBZ21zUWhJ?=
 =?utf-8?B?UzBpcCtrdFpsT2pER3dndEllUTJzSUJoRjJDZmtTdzU5QkxYV21FWDE1WVFN?=
 =?utf-8?B?TU15ZGhrSmt5anFWbGVLbHR6MWhIdG9qTEo0QXhxOERudElhK3ZnZmxiZXBH?=
 =?utf-8?B?aEovNk1lZWRSMWY1Z3dGQldYU2E0QThhOGs3TEFSQWk2ZWFDT1Vja0lpUFZp?=
 =?utf-8?B?a2Y4c3EwNExlaGRzZjZ5VTU5QzN2V0xvSk9pcjIvditXMkVEeFg2VjFneFcw?=
 =?utf-8?B?ZlJScWhpLzVrNkpqZERXTVRIU2FVcERsRTJFZVZ6TXc3QWkvNUljVnpKZVF4?=
 =?utf-8?B?TDhOK0NtbXBJaFFRZWVnY1U4VmhiMVVHVDdvR0pwRHdLbUtCdVhvNGpDQlMr?=
 =?utf-8?B?R0FwMWdjVEE2NnI4V2VqNHFEdzdtMWQxN2hJbFFLWkgzN1Q2TlFyc0xlbitE?=
 =?utf-8?B?TUxyNmZ6MzQzV09qUG94RFB5THZ1SThReDdIQStzcjNsZ093d1ZmL0lBNVZF?=
 =?utf-8?B?UGprREY3SU1PVnBzRGFuZVZLNUNpZEJNaWR2MldVT084QlkzZHNRejN0d0ZF?=
 =?utf-8?B?dEVCc25DWDQ2ekdZN3NJYWdPVURqbzFjclBSZmc2N3gvNjJTWVk3aUpTaENr?=
 =?utf-8?B?S2EwZFVxOWlUMlJWZXZpSU9vanpGY0V5SzV4RVZIN3kyWkMzQWZDK2hIbVM1?=
 =?utf-8?B?YWVTYVFEUDFxRnZiMCt5a202cmpmdG1kZVJnUlpmeExhY21kNjlJRDFjVFoz?=
 =?utf-8?B?YTJ1RzA3akd0elZZNDEvRW1CdGZIRHJnT3BRMFVZYko5Z283WHduZ3VsQ2Jj?=
 =?utf-8?B?U2hpQXpZMExCakhSMktTYkpCQXNpdmF2RkJGYk9WMk9Ub0U1QTBEck9PM0Vx?=
 =?utf-8?B?T083ZnlJVHAzYzN6bkJDT2VRWlpad0J6SWl1WUU0aDZQN0Q0bm1uSi9iQVZH?=
 =?utf-8?B?V1IyU0JwdWZTTkU5ZWlISWV4bHZpWHkvZndhaWpZbFF0dXRkRXA1RGs2Vmht?=
 =?utf-8?B?SXFUMnUwbEs5Vnh5TWN4Mk5OelB6SXB1d0FYa2doMVVXRERoUlFWREkxT0lN?=
 =?utf-8?B?ZG1xMHc4aExiWHlYUkdEeEF3bGEyaFlWaTMrOFJkdmFFN3N0QkpVT1E4V0ZM?=
 =?utf-8?B?Y2NPLzZDa0lET3BVYWdwRGtUOVhRR2p5N2FhSzljcFVaQitnZkdoREpEZlZj?=
 =?utf-8?B?dGRIajNxdjYyc0FXaVFGQ2cvUENFM1V0S2RtN2pQT0RMUis2aEphb0NqRHE3?=
 =?utf-8?B?ZkRpOVA5clZoeDBmQWhWL00rOXdlNmsrMEpyUU9KdFlDK1dQV05GZUpHbmZI?=
 =?utf-8?B?R25GZHlOeC9zNEpsSHk1TWowSVBDTVdmcEhmM1JjTzVmNXErV1NGb2VITDBI?=
 =?utf-8?B?NkNjb1hFQS9va3YwTFpBaFNtbDdDV2g2cnZ3dDFnTlhGSVU1S2lXcmZ6VjYw?=
 =?utf-8?B?K242aVZaUlMrelZmNjFDQXdVTFNHVndzSGREangxcHhLU3hqUXprZjd4RW1R?=
 =?utf-8?B?UHpzb0hMRFBmT3h2alBFcFR0VTVYRFZRVXI3aGc1dEg4S2k2YkpTSzdCdVhP?=
 =?utf-8?B?T3FVbmM0MkNMdEZneDV6cmxzakc4UmN1L0NkWTU0VXJTWDJ2aGQrQkhURDJo?=
 =?utf-8?B?ODZESHNrNGt4UWswV0ZrU3hvcFlFT2ZYcnZCL0tzSjF3MnNKV215RjNoNHk1?=
 =?utf-8?B?MlJjYmU2Z1gyd2lKWE43Z2lKTTFJaC9oY3hXTmRQMFcranZJZnNqTmRsdE45?=
 =?utf-8?B?UGRhc1pHd25ROW8vVTByOFc2QSs0SjIwbWUzSVBzbUxVT2NGNjZyYnoxSXBj?=
 =?utf-8?B?ays0ZFAydTRGc1FvMmpZR2V5RzBOUXBUQ2RtUXlFczlXZUxXeG1ibUZsd1g5?=
 =?utf-8?B?U3E2VlVWZnFSSERtbjdGK0QyK3JkbWFkMm1qMlRiRXVRNkpkMWFwaFFhR2o0?=
 =?utf-8?Q?S18OsXrf5ELxsx5XDKJbkh8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WGJOanFSZHYwSmVzamd3c3N1UFg0SkZQSUV0cVdzSFVTQ29zdVJzVWdtVkQr?=
 =?utf-8?B?Q2FlSjlpdHJCajI1SXNKZUlOK1hiTGtmazRhSW84VHBhSTRTZVJRUWJsVnls?=
 =?utf-8?B?RkNBS0l6c3hpc0VMa0ZRUUV0VzdLMWNFd1djRldwWGNaVUIzRy9UZE5JZ1hM?=
 =?utf-8?B?M01reHUxdy94dHF1d2RiejNTZ3A5TExiUEptUzBCYzdDNytsZ2pMdTFWaDJj?=
 =?utf-8?B?RkZCc005amFPM05aQ3hRc21pNitLUmZ6VDZzNVpSME5EaDJ1dWZqckdBbkRz?=
 =?utf-8?B?ODUwWHIzM3l6ZVl1WWJMSnVMMHhXYytseTBDOFJRQ2hLWVp0bGtHa2wweCtj?=
 =?utf-8?B?MHNvSjdIRUxTaWJTQjUyQU56NUNsQ2FXVHNVd0M0NUhEUktyR0ZtTGNOaTFH?=
 =?utf-8?B?a290bC9BRnZDRWZDSDdFbFJqVWtPMXVkUSswczdWQkhUSjVuUlZ3YVh3TmFV?=
 =?utf-8?B?Q3lmTWErNVhRSVBuaTdCU1RHOGUzeFJjUDlQL3NMUGhqVGpZT0o0bEl0eE1C?=
 =?utf-8?B?UnQ0dkJqbHVFN3dpalhtRTEvRW1HMWlNMzNjczhDME1GRTVjOGRTTDMxUlJq?=
 =?utf-8?B?OXNpNEplRnVoUEZUc1VzV1ZwUGVqTmJwYjhVVHlmNzJBV25lNTNKQ3lzSUh2?=
 =?utf-8?B?OHJQRUZVcTBKUDRrU1kwU0llWEFpWHUraFFvWWFqVWkzZU5PL3RsNUZkV21J?=
 =?utf-8?B?Lzg4dkZITCtLWHlFcm5sVVF3K3pxRGF4Tm9LR1ZEcXU0b2V4KzBzNG1vSlpr?=
 =?utf-8?B?bllQb0NKeUZzTUlTU285d2xiclFzVnFGM2VPN0NvT00zYXdiQUlBcG56em1K?=
 =?utf-8?B?V3NjZzhMeWs5eUFlbXdwVWRtSGVUMFR4Z1ZVaVdINDY3SG1iVStabVV3eU5p?=
 =?utf-8?B?MmgvZ0dndFRPWDJ3c1dPUFptT2QzNWJIblJVT0RPWTJsTTNYUTUzQ2xvaFpV?=
 =?utf-8?B?SUYvRjVLeVBPRnZFSXhhQmlMdjd1ZGFNVldTa1R3bVpTczJjMU5KeS9XS2NF?=
 =?utf-8?B?S2tlclJ5c0w3UEsrS2tBMVV1b0ZUR2x6V1pUVUVvWFZxOEMvMHQwZ2dSNnVx?=
 =?utf-8?B?K1k1eVRTRHhaeXdaU2FQNmJIVWV6VFZBUXRwS29ITmxRS2FVbngrTlB2ZlZG?=
 =?utf-8?B?c2d5ZFZQS1h6Tk5MNEtYV3h5aG9vaEN3MXRNSTZTRmZ3eXdmSVl1MWMxYUtH?=
 =?utf-8?B?RFp5Tm1aOEtRYkV6alIwbTk4ZW9qTXVRK0FUUjVPSmxlV1ZXV1duQXN4MDA2?=
 =?utf-8?B?OGVURVIvKzdpT0dMRW9yZzFTY1lZalR5K3RaRTEvU3dpdXl1U1lhYnlFTEJL?=
 =?utf-8?B?VXZRM1gySmJQR0pCNldGMWUzb1VWUlh3bVJZWlVhdzkvUHNmTEloK25oQTgv?=
 =?utf-8?B?QTFYZEhQNDVIR0MrckVydk9vVk5VdjFGalJBVEs4ZkhFeUhlRWUraFhqSUxv?=
 =?utf-8?B?L2RpOXdIRXJUTWVXVzZTQit3dHVRM0REZTlUSjJ5TzNlY1JMMTlpdnBhVUk2?=
 =?utf-8?B?N0pwTEE4d3FvZVd5aW55YlQ2R3o3K3BnY09uSEVGQzA0MHNoUFJHVU5KdEVR?=
 =?utf-8?B?WUN1NnRUSTVzR2hLb244Y1BhMmtBeERSTDNkRjdkMGp0YmN6cVJTNy9Cdlpz?=
 =?utf-8?B?eEh4QVIrMjZXZXN4RG1JaUVmUEtzNjMyeU03OUZsS2xVN0htN1Q1RHNuejho?=
 =?utf-8?B?K0tvNzNnbHVrQ1JVNGorSGNHR3hOYmltazk5TUxIQVFTNWJUVEVRS29nVFJT?=
 =?utf-8?B?L3pnTGcvZjdKdjZ5bi9YUFAwWDB4WnpkNHZZYmVkOHY3TVR2dHdoeGo3RFZQ?=
 =?utf-8?B?bmRmcEpZWUxjRGJrUEJqUjdyU200QnZmdlcxRlZJUWNVUU5QN0d0SHJWSmxh?=
 =?utf-8?B?Q2FVZDVmblNGZkZRa21WcFVrZWN5ZWlVcGdualMxVDNKbUZXSTUwZ2d3RHBr?=
 =?utf-8?B?eUNCTTZYNldEQnM4SURyQkhMam5IeWczUmQzWFdQTGVVeWJFdFhiNCtYaHVI?=
 =?utf-8?B?UG4zaDhHYkF3NEo3YnU5b2xUa3JmUGVWYkVlUWRrR1B4NFBPVFpRT2hOQXdk?=
 =?utf-8?B?MnI4RlA0Z0RzU3BYa2ZPc1hvSzROeFNvNjVWRU1HY1c2TkpKbGl2WWxjRnhs?=
 =?utf-8?B?cnZUV2V4Q1FQZHJuMWo4RkJDYm1iL3ZsanlqQ3dXdkpGb256SWdzM0gxdE56?=
 =?utf-8?B?V0JIcm9MY3hWWlF1aGJWT0J1QTcxYnZSNFliZElOeDlIblEyaTk3UFFVaitn?=
 =?utf-8?B?RGRZY2VCTnF1dDAzTzlsd1Q4WE9rRmJYNUVSbGhkV3RZamlIK2VVeGdnbHhl?=
 =?utf-8?B?dmJMTTZEcXlGK21BYWQvM0toTzRPYmdOMDc1d29pWENoZFdNVkcyQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29A21B1660F36C4D952E7E4C4B345E4C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PhdjN6S4Zt4qC4DpJRjmSGN0xVVkBZI7EcBzEkcqxEO1Rn4LK6a1pDdVM/J/WyFv5F21rvi1cR9Dy4ZSxXmQqAKTe84VUL1ISZW4tA4PSP36xF/PS13zr3s0RFSV9+vT1TM8L7uvBblqvPuftJyMoaENbcL3K9n+zzkAc40D8n51rTFZH0vASgvUNFE+f3LXgv+iD87Ac+yf6VHz2OXcIJfKwV7zUf3a5BRJ8CHeKuioUsm1osHNmzI9lbllLZxpVMuGZQ4rxEqt0WNMr1J0jv/IYYhRCuVgZHRTRHtbpB3aDaP0M66aFiAC1ZBAIiiyFtGabIvx36wk9fTI6SOIgNzybHarqE9yftK8xY5ic/XKfruOrnlk5+bxZgfWAmnr3dmPeRAPNOwJdEuZdONYLcvuaeGJVHL/IEdymtQd6NTn773iKjIbJ9FT07v8b5InRTqG/N2+6nJQWVgNPKSLfXh6ufR6for510ss2ylQzGGaknyXGT5nrngEzxQo1IceObiPIHI7cKu4E7lQLE9WZlNwgc9M+5Q9nKIrnXpXT8u+lrV5BjO5iJ8eoxExAQYRtDr1JHZgMTkRCol8NgJR2UlQM/x2/kCASW/tvZvzVhVej2hoPCRwLZVy2cOP9boqve5bU+rlqStxQ8l24MreNw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a03443-39a3-4631-393e-08de6f5d1984
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 02:17:58.3547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rilI/EMjISa2cXSDVOMmjG4A08tTo3YvUDc3mtWvTwh6aQWEc10h94DUHIUYbHBPpeBls7GmcI97vbMga9ZoCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7567
X-Authority-Analysis: v=2.4 cv=U4KfzOru c=1 sm=1 tr=0 ts=699672e2 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=FLp35xLm-s8bWOqT7X8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: HdRuB_-kBmvYPbpTSHBEbRPhlrpzXthX
X-Proofpoint-GUID: HdRuB_-kBmvYPbpTSHBEbRPhlrpzXthX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDAxOCBTYWx0ZWRfX3ZCijnjn/0YF
 ZbjN8+By0fq89LwyE0ONxoKfbfsflzJyL7NJjuTpKP5MWgcFN0cKDsxjmXVesh0a6VFEqwPTbU6
 6RJ2WNI1mj0GqhKAkfHm3eIotUDwdVpnG0dQ1GthjiqQQlDOB/dcIQSKHFrECuhYToiZIwFB96S
 y4LsXzo9H/g8I1g8/gJFQmDIZep7IhfkeE8+/speA9kkkt0Mx9hPfJVP6cD/AdkVHOwhrzYX6FF
 +NJGViFzMNMn0y1Jcg9DWXnUtw46L0FnniWMb0rBS+6SnAyR7f0qxN8ORCaGclQJuL5bTmSWo8r
 skC/ZvLb5zl80TwVBnMr8cUACPE7f/6U2BpWcgW/apn5QN9szUAqJCNYKxoG0lkeYjGMViMLkOa
 k+x+TIr71Chf/QhdLCr72PwxM6UJGWTLuGy6awmRAUZ3wZbstDkHKtKyoWrpHNmO9aXDM65vTFZ
 CBDfCc10QkgPDIS02fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_05,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2602190018
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[synopsys.com:server fail,tor.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-33468-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,synopsys.com:mid,synopsys.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1F6A315BAF2
X-Rspamd-Action: no action

T24gVGh1LCBGZWIgMTksIDIwMjYsIEppYXNoZW5nIEppYW5nIHdyb3RlOg0KPiBUaGUgYHRwZy0+
dHBnX25leHVzYCBwb2ludGVyIGluIHRoZSBVU0IgVGFyZ2V0IGRyaXZlciBpcyBkeW5hbWljYWxs
eQ0KPiBtYW5hZ2VkIGFuZCB0aWVkIHRvIHVzZXJzcGFjZSBjb25maWd1cmF0aW9uIHZpYSBDb25m
aWdGUy4gSXQgY2FuIGJlDQo+IE5VTEwgaWYgdGhlIFVTQiBob3N0IHNlbmRzIHJlcXVlc3RzIGJl
Zm9yZSB0aGUgbmV4dXMgaXMgZnVsbHkNCj4gZXN0YWJsaXNoZWQgb3IgaW1tZWRpYXRlbHkgYWZ0
ZXIgaXQgaXMgZHJvcHBlZC4NCj4gDQo+IEN1cnJlbnRseSwgZnVuY3Rpb25zIGxpa2UgYGJvdF9z
dWJtaXRfY29tbWFuZCgpYCBhbmQgdGhlIGRhdGENCj4gdHJhbnNmZXIgcGF0aHMgcmV0cmlldmUg
YHR2X25leHVzID0gdHBnLT50cGdfbmV4dXNgIGFuZCBpbW1lZGlhdGVseQ0KPiBkZXJlZmVyZW5j
ZSBgdHZfbmV4dXMtPnR2bl9zZV9zZXNzYCB3aXRob3V0IGFueSB2YWxpZGF0aW9uLiBJZiBhDQo+
IG1hbGljaW91cyBvciBtaXNjb25maWd1cmVkIFVTQiBob3N0IHNlbmRzIGEgQk9UIChCdWxrLU9u
bHkgVHJhbnNwb3J0KQ0KPiBjb21tYW5kIGR1cmluZyB0aGlzIHJhY2Ugd2luZG93LCBpdCB0cmln
Z2VycyBhIE5VTEwgcG9pbnRlcg0KPiBkZXJlZmVyZW5jZSwgbGVhZGluZyB0byBhIGtlcm5lbCBw
YW5pYyAobG9jYWwgRG9TKS4NCj4gDQo+IFRoaXMgZXhwb3NlcyBhbiBpbmNvbnNpc3RlbnQgQVBJ
IHVzYWdlIHdpdGhpbiB0aGUgbW9kdWxlLCBhcyBwZWVyDQo+IGZ1bmN0aW9ucyBsaWtlIGB1c2Jn
X3N1Ym1pdF9jb21tYW5kKClgIGFuZCBgYm90X3NlbmRfYmFkX3Jlc3BvbnNlKClgDQo+IGNvcnJl
Y3RseSBpbXBsZW1lbnQgYSBOVUxMIGNoZWNrIGZvciBgdHZfbmV4dXNgIGJlZm9yZSBwcm9jZWVk
aW5nLg0KPiANCj4gRml4IHRoaXMgYnkgYnJpbmdpbmcgY29uc2lzdGVuY3kgdG8gdGhlIG5leHVz
IGhhbmRsaW5nLiBBZGQgdGhlDQo+IG1pc3NpbmcgYGlmICghdHZfbmV4dXMpYCBjaGVja3MgdG8g
dGhlIHZ1bG5lcmFibGUgQk9UIGNvbW1hbmQgYW5kDQo+IHJlcXVlc3QgcHJvY2Vzc2luZyBwYXRo
cywgYWJvcnRpbmcgdGhlIGNvbW1hbmQgZ3JhY2VmdWxseSB3aXRoIGFuDQo+IGVycm9yIGluc3Rl
YWQgb2YgY3Jhc2hpbmcgdGhlIHN5c3RlbS4NCj4gDQo+IEZpeGVzOiAwOGExY2IwZjY1ZmQgKCJ1
c2I6IGdhZGdldDogdGNtOiBmYWN0b3Igb3V0IGZfdGNtIikNCj4gU2lnbmVkLW9mZi1ieTogSmlh
c2hlbmcgSmlhbmcgPGppYXNoZW5namlhbmdjb29sQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vZl90Y20uYyB8IDEwICsrKysrKysrKysNCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfdGNtLmMgYi9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24v
Zl90Y20uYw0KPiBpbmRleCA2ZTg4MDRmMDRiYWEuLjk1NTRkZGQ5YjRiOCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfdGNtLmMNCj4gKysrIGIvZHJpdmVycy91
c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfdGNtLmMNCj4gQEAgLTEyMjIsNiArMTIyMiwxMSBAQCBzdGF0
aWMgdm9pZCB1c2JnX3N1Ym1pdF9jbWQoc3RydWN0IHVzYmdfY21kICpjbWQpDQo+ICAJc2VfY21k
ID0gJmNtZC0+c2VfY21kOw0KPiAgCXRwZyA9IGNtZC0+ZnUtPnRwZzsNCj4gIAl0dl9uZXh1cyA9
IHRwZy0+dHBnX25leHVzOw0KPiArCWlmICghdHZfbmV4dXMpIHsNCj4gKwkJcHJfZXJyKCJNaXNz
aW5nIG5leHVzLCBpZ25vcmluZyBjb21tYW5kXG4iKTsNCg0KVXNlIGRldl9lcnIuDQoNCkJSLA0K
VGhpbmgNCg==

