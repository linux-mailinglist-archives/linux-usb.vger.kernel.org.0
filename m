Return-Path: <linux-usb+bounces-34134-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC8VOltEqmlxOQEAu9opvQ
	(envelope-from <linux-usb+bounces-34134-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 04:04:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEF521AD73
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 04:04:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CFC85301071B
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 03:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0969F366069;
	Fri,  6 Mar 2026 03:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Oh+ABYGA";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="J28cfXYk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="o6y4FeAZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B300B1D5141
	for <linux-usb@vger.kernel.org>; Fri,  6 Mar 2026 03:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772766291; cv=fail; b=mAEPt7f6XRLc9JlGp75xBhrWIbDt+lzsCylinkNHXXsHa4sgUR2TmRSP0bTmpVPUqjk7+mZpC12cr2H/wXoT9fiBeru1PzpaYkWwqeCRdGsO3zInppbxbTpDambDJzn/KhsdupfpoxVvo6Iu4kE99lz1LvRneWJSgGG5BFao/r0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772766291; c=relaxed/simple;
	bh=EXyZ2QXDm5l1loNxd6aruBXZ0sAH3UdLtiWbGdEjWAo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=K/3layjlUaUVv/q8zxznaW2yUiXrsP/N7N+JsNkCcN/hVfV8hzQ6fqqXss1JKKliSvhD3TL6xmAHMSc7pW9FVZMKhT6mKJbWqVWcdhmqUXiRLD8WREIARQ8zJJE7hYF2qxxABNHmib03LTaozW8DpYnTaCQEHHZOal07VJSieUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Oh+ABYGA; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=J28cfXYk; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=o6y4FeAZ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625Kn1QA3016856;
	Thu, 5 Mar 2026 18:02:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=EXyZ2QXDm5l1loNxd6aruBXZ0sAH3UdLtiWbGdEjWAo=; b=
	Oh+ABYGAQ/uhlCZFwP9Zdpo8ru8/ZwDPfbmh5GnUF9AjINhsnoLVYK58UnO0Srgy
	X/FqQqXv9Thqu3KcvsYsZsURqfrlnpTLUz1snKdr52cufwv14+9XvXv/4h4oGQNz
	t4lbEIVPplKoYtCWQl7Gb19GBr3bo8ljxXrNZJRbR0GZZxyOiN60OEk96CoiTQAx
	R2Onnu2k4mZ7cbEkrlJsoL1xQoeLzHshNvmLJ244gFbqUBbWtTjHyo9TZNU0hfzw
	kbGAMO+mfxVEdS2+wcABjCS72Vt4ZZu7sN+eE+SvOriecWNgcXTUaib9NyVDz45s
	zvJlUhpeqwUOQOtuGJrR5Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cqb8f4y90-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Mar 2026 18:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772762545; bh=EXyZ2QXDm5l1loNxd6aruBXZ0sAH3UdLtiWbGdEjWAo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=J28cfXYkARZmRdZvYAANwxThqG/x0IEltfEt2F6coo2tN6Vx2RT+nJmk5mt94pTlu
	 HGXuB1NHxCyLnv/iMFyu+yld6KL+KSYm5Fe/e8Ucs1ASTS/5Fa4nS9sZ6dHoWbkFrp
	 6rFmcKlHrvTJcMThUa9j0eiUW9udHpEBIo4ELItKcKAF1Y77FUNNj7mc+bB+6fduNk
	 cgJ8mfLXelTkqc3+tIilhpAmvVttjczgNkai9B1B2JZl6ihApvkDLVmNjs9HqmhHQ6
	 3RlWdDF0xeR6Hfp/tfEqCiZqmQZSDWsMIwCIFZHUOx0r1+vM/PvBHGCeRm0NyqLpoP
	 nbWU7fPY3haaQ==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AE3C14048B;
	Fri,  6 Mar 2026 02:02:24 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 3671EA00B1;
	Fri,  6 Mar 2026 02:02:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=o6y4FeAZ;
	dkim-atps=neutral
Received: from CH4PR07CU001.outbound.protection.outlook.com (mail-ch4pr07cu00104.outbound.protection.outlook.com [40.93.20.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3ACA6405EA;
	Fri,  6 Mar 2026 02:02:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSZu+cfO03RGnOkYBVN0AqHlRNGVuuvGsuDOgYDayP5bKutIoL7EAF98LUpnllJRRdjh+lV8PcZDJr8tC3/jDMRne6eWMac/Ced3gfna9OPvgeQxqZcraNTi4mBVWA+cyeO3o2iUKQ2SN1Vo/oTGe0siRwJALsM74EKS+Y+SBnvbpOTTp+fZyUli5pxbtbjNwlgVOgmVsZ4VVgJdzM23jdkhL1MLh+mInQfYp9JBrGJDNUUl4M5qmIKhy1f7cx8u0Sr1Pe1XggWYxHVByyNaqXfUu5KChWDeH5yBhY35G6ZTqn6S2LvhAn1CekjeH5z8f44b8Ukz8S8CKqUB7czTBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXyZ2QXDm5l1loNxd6aruBXZ0sAH3UdLtiWbGdEjWAo=;
 b=xa27KiNLHCZ4rAtDxEFjR2X/T7/ogygAFoWk0dQu6gO3fM/HOXSIQEpKXlLA2FpFrfizVpnuadH49ypM/t/BXjysy42DmFMj2qv5Bxpwss3D7kkkM35YEhyhUd0dqxpQN5LeEwX7ez831ri4Ivt3S9NrQn4mYLmVaSXlZkir4z8LIBWKp89mfAUps74tcB2rMMwWx2YM6tNYX/n99UmGLvT+xLtXzwueL5jdwKdi+6gwMb9ZxkZ7Jc3rfnUJ17lj6UAWS+RH28/Ql42ThMq8EbY1TvyoLl8eBq4DkjQ9Qx/tkMdGvzpjTlphGUyHIazvN3ibvEhBmFLHwbjQNDYDPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXyZ2QXDm5l1loNxd6aruBXZ0sAH3UdLtiWbGdEjWAo=;
 b=o6y4FeAZpROwCSzIaZhwMFhEnofyPH8nqrGw0R7rVYBRvWcz5P+qrClQmV2+DYDmPe5sc51LOa4u38RD8xEiCGv6JBnpFosaNiBYTbWJTfA6sDWJy0YqTU0li5GkxjZjQ7H98ngz3+mevU5fc1mAobq6EwG6vq2L84nuZCMQHWs=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ2PR12MB8805.namprd12.prod.outlook.com (2603:10b6:a03:4d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 02:02:18 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 02:02:18 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v5 1/1] usb: dwc3: Support USB3340x ULPI PHY high-speed
 negotiation.
Thread-Topic: [PATCH v5 1/1] usb: dwc3: Support USB3340x ULPI PHY high-speed
 negotiation.
Thread-Index: AQHcrJm2yJ+0pMewMUOYcvmanN8GHrWgwU0A
Date: Fri, 6 Mar 2026 02:02:18 +0000
Message-ID: <20260306020214.qhvz3kmirx7fjlpm@synopsys.com>
References: <20260305121452.54082-1-ingo.rohloff@lauterbach.com>
 <20260305121452.54082-2-ingo.rohloff@lauterbach.com>
In-Reply-To: <20260305121452.54082-2-ingo.rohloff@lauterbach.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ2PR12MB8805:EE_
x-ms-office365-filtering-correlation-id: 65a6f287-3e34-4137-30ba-08de7b246565
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 we2tN5+Xwssf09/6qDuBU1TmniTcIspSobJbQfeZ5RrwPE5u/vvnm45lsBVXvA1RcNJqwOhMDW0znI6EOy4TCpM5ImovGF3Bl8b/q1ec0YBmMH3E1t0vXjip2cR/rTPtB//ZbjjvvKHRNUNZBTgm8rwUg9mhen4cbwb1FPbP6iVgc1v14/NwVqyScUmDp9Djbd2ddZmOyvTbJP4wjOE8bPglnBtal9CE+0dAP124mvRN6HcQxnKylC/5aXAkdMt3/qSPBrynu0hf1BfSx7awRr41DKxfO1W1Pz9z9jfJSbwYMHLjMgwS/XJbLMrKLIBwfcbPSpDeASp6E5YxWndNZXfweHVIjIs31tRmhW7oECAXS7P9VqLRgJhpSroCKHKnVuYVjQQqmfdG11J+XVRDY/YgDyUf3goReCDIj+7PrySBQwo7MWF1jsQmP3WeGw2qk23TZ5sPEOeg+EdtE0s7/dq++yAnGqXshznWQi2LHHaITeUzO+ZzLzLr6TiePPPstBOphJmpTQ7aRj3n7BrOCvyBp3k4nbiN3e21evzaa8MQlz53biO0KUAzYtL2mdbFskiPR9Rxr2KC2iq+pJXLCQvXPCfIr+XgUa/odul44qCWk5AWbWH3uCjytKFGCd9pvFJSsuDny1L1t2Iv7k7Ag+Pi/wEnjqvUPf0PCGWjOMHLb0XVC1+1m0Z4G7X9k6Up0j8pykXXg2+rAE243hR/CT/GzS43bJRm3QfX7WXZs2CYozTOAdnWRPf6qMHBm8fkAOif0ZfvwmVEahlCi/IXP4oFwPbyV6rKngrKoUFzork=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N2NtUC9xUG1UT09UQURZWHcwRlMrRTBia2UyaW42YnNBMWsrSE15dFFWOTNh?=
 =?utf-8?B?VmhNcG1jaTM5blE5ODJvZWNIYnZTSDFyR2xldVY1dTZaaGMxeTR4dmN6S2FK?=
 =?utf-8?B?ZG4xT3J5a1dOWDZhc2pOQ3A0K0NKL0ZKRU5BeGc3b3gzR3lpV28yV0tWamZj?=
 =?utf-8?B?dUZFMkg2cXJJNlN6WWVDenFQSFJOaU5RMlVheVdTUWVmL1djalE0VWZTNWt5?=
 =?utf-8?B?b1l3dFVsZ1hpRGFVcDcvcncrcnR4YSttbU9ZTVExdCtUcHZUSHVpb3FBVmV4?=
 =?utf-8?B?UURpWDN5VllNUGJPNkRXNEdpeXZhVUFCUGErZlZuc3IrckRjR3J1bHJzN2Vi?=
 =?utf-8?B?MGRLRG1IRXgxdEdGeEFLR3FSSy9mTGF4SmdES2ZGWkFVc0oyL0tBcmdKaWRI?=
 =?utf-8?B?aytGZHVCbm5SZHB6WHJHSURlRU9iQXFMaUJIeE9SaHM0bDI5ZzFyVnV6ZUtq?=
 =?utf-8?B?MERld3h1NnpkR0xEMDkxa3BNUDYwb1RSUXBiNWJ4THhUbG01WU9KbHcwNkwx?=
 =?utf-8?B?NzZMU2hJRG1WTVZhSkc2SVV0N3ltakx6eWUveTljVVlTU0UvMk85N0QyeE5q?=
 =?utf-8?B?Q1hhUjhiU094eDM0NHRId0hRZ1BLdnF6K2VHaUg4RERqTkR0bmdqMUF1VjRG?=
 =?utf-8?B?cW83UlpmMTlUOTNGVWFEVWh2bDNITWZjUndIMWhOa0E0aVdRNUQweWxOaVN5?=
 =?utf-8?B?VlZJMmhDWW1aZEhnNzM0Q3JUVUpMMTcyb0dCWlI2VkZobm9aLy9YSjVSOTk0?=
 =?utf-8?B?NTNBZUIzQ2dPSkRRV0Q2aXdCNEJnTXoraHpvR0l0NkZkWE1iVk9tSWRrc2tO?=
 =?utf-8?B?VVMrWlRjME4vMFNidWxmbllkLzJ4RkdNWE9keHJnczIzeDVjVnhSbzFMQWNZ?=
 =?utf-8?B?eU1HbEZvUVFoVGplMHJVYTlRdWZrRm01dXYzZ2NrYlgrVVh4UFBhN2dzNTli?=
 =?utf-8?B?N1FsV2dDclVram9nVkJKYk9WbXdCRHh2WXB1aW1BTWZOZTh4aE82aVdkanQ2?=
 =?utf-8?B?dXlmR0RzNDZRZ0dqSVBKSWhKcVYwR1NpdnVBUjlKVXpMdDFSRjRDb0NrOGI2?=
 =?utf-8?B?TUN5bVZLU2tNL1dvMSsreGlvdDlMVEtrcjBESTRzZWUrSWk5dGNIMDF6b3py?=
 =?utf-8?B?TlF2Sk5JZDF4OXFYSGhTeVdkR0FpYlRrUnRQd2FGRWdUcVFpWFp0K3ZqQUor?=
 =?utf-8?B?TjNjbTJ2QmhhU2dySUczaTJEYjRYN1YyNXVOSmN4K0gyUFRFa3hseStZSVRh?=
 =?utf-8?B?eSttZmhEZUxWd1BSaHNWaWtHS3hiYWJNVFFCanFEbjBnWExMT0lCVjJKNmQr?=
 =?utf-8?B?dkNLRUtkeEhVNHFkWG85RFZlYVM0WTJFTGtQTDQrRlhVcytvQUgzK3ZocGxj?=
 =?utf-8?B?Nk9kU1JDcmVSeU9uUks5Zldjb21URHBtemEvWVc1blVzNVNLeXIrdEFDZ1ow?=
 =?utf-8?B?c1BZb3p1ai8rL1R3ZzU0MGpoWUdaNFlMZ0NiOHB4NFR1TXFraDhlUkdtREhr?=
 =?utf-8?B?bmozOHd1RVVIWEcycVVtOFZNRUJaOWdJWHJBSmQvRFBUajh5dUlCWGZ6enZU?=
 =?utf-8?B?cG5WZ0haM0UvSkYvaC9GbnlRZGg1RHRCNW1pZDN0S0NBMysycEVxOFMwNXdP?=
 =?utf-8?B?NGpPSjJuWTMrOVhLSEJpcUdnOHlpYnI4R0pkUnM2dTRCdlBNenlwUUdnZ2FX?=
 =?utf-8?B?OGsyb0piUlZMNjAxdUxBcm9lcDBFZE5GN0dlcmdDMlNsYld6RXBzVCsyMUhj?=
 =?utf-8?B?SW9GOTN5eXlyay9CSWZSUEh4cGtjUWk2RGI5Wm5URXFOQ2NLZ0txVDMwYVY0?=
 =?utf-8?B?aks5RnhKNHZDeXB0WHJqT0ZJNUpiNGxNTkQvVTJnVEhQaEx1RVV6K1p0RGRa?=
 =?utf-8?B?NlNpazhDNUV6UWtqSzNVemNBbUpYS1JEdERmbHprQkxUYzB4TjFpZnNQL1ho?=
 =?utf-8?B?T0tHUHR6bjlSRE44VlVpL291LzlwOW9HYkRtTjNKSzZUT3N0T0lqZ1hrLzRz?=
 =?utf-8?B?M0VtdGVPV3k5U3ArcS9WOS94OXU3dUlGSlVicHFjTlJERFVwelBKL2xIdndt?=
 =?utf-8?B?SS80bGdwV0xxdjQxOCthRnQvQWtDa1ZaMmV2Z3NER2U5L1J4Rm5sdVVsQjJw?=
 =?utf-8?B?SDJGWWdGTjdBMmhweURJeVhrV0RuMXV1MVZYMXhQdVliZXNqcTNXemcrM0tm?=
 =?utf-8?B?UVU5bFRhTVUxN2ZMQ1ZoVWs2WmM3emo1L0JxQ3IwaXVSdGxZcmFJckNmcVl3?=
 =?utf-8?B?Q1JicTF5TzlseUNHTWYwcWpNdnpGRmxKTnNCdTNhbVdsSUVGZlFHV1dhYmpB?=
 =?utf-8?B?ZTNZbVFnWlVlQit2ZVpJcmpOU3dzc0JmTGJKVTQ3b3M0V1lBVVhHdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D05A85FD3A50D41972D3DF679A25173@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	d6WFOYMtTmVzCZQtGTIPEnPWk6UOFYjK6ucbcPdVFOVWcJsN4EqCjeYNWl1PDUu0jv8z7F6xIhQTY1ZGWjb91/YLKyZ+V0Kfkl4cVAt/yt+lZP4ZXUlaxhiPSH/Y4XF6tHY0V1kCihdALxiVlN7w+GvWp3dGETzrQkKIbigT16A9CYEBOCp2C9aCNSp1/7d7uNgVqBL0F3YwSmIhHYwC7X+r1+Swh+sh1Hwl82L2w2Ufnm1OIF2nXa9V9kBsXQxjY62iCZveF/s7+s5j2YPiOGCRZyFlFtTXd6GgfVdLeiiyuNCAS589oR4LXqgXqKYNo12LnN1aw3UtWDB5fvdz8JxlhxIfNzSGFio6u8kpUUo7CGEBcKvmQzf5recjdJrPAX61kL35Kgw2yjWykRVQgCZyouTHlkfT4D9G+CRljC7VA01YfNSvEu9a29M6sWu/jdL/VClN13uNXstK7OTLKMIo6M6i7dUiP1Dy70efrnK1uttaZgwPaTfyDgZ9Zf9OJjdnXit1bFO+RBKHu6tHIOW37LdQI0rodgO56e3xxOhhRPE27W8fjCaCzp1gjlgNIjsezu/IYMVMcTzk7iOV6EeH2e+5HuUWri3fQvNqzlSPxSB0tc9KIB4tq/b++U3CNdjWvpVQzW6joSYDPeWdUw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a6f287-3e34-4137-30ba-08de7b246565
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 02:02:18.3005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eT2AUnREyGPLRwnj9cGthZDlNudZAfDEI7+bbJFEcyUTMzMxUxpHeWqDBYKgezDeea39mN6yDQcKvfavp8acCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8805
X-Proofpoint-ORIG-GUID: 5tLc_TA6Fspd8z8lNA1WXYifLQkU0-UV
X-Proofpoint-GUID: 5tLc_TA6Fspd8z8lNA1WXYifLQkU0-UV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDAxNyBTYWx0ZWRfX3gxvyTH+l+OG
 Ij7SlMt21sq7Jov5b/Z9xMpIcyhO6Gy9nPWVnr10en7LAucDA0COBn4JNKdK7MrYzhkRyPDd7QG
 aCVwlihLxga8+r3XOrPuUEEiDjvHTIA3O/viLArHkVmQPwnU49cEACiUBObUUtpwgERJGqzwTHw
 ZdZw5E/JAVa9qCHJvXPoDYRGLOJHXcbrsK0mfbRtJb3CQ9M7zJvHN3n6EskIzQ/FlH3ZkxYObCb
 s+jKv6K0ykwPhSwiciIsnxTYg+ZJwS0lN4Dj3QlP004TBbD2Zj5DaoKo8izh+Oo+7SmnY08u+hF
 U1FpxXa+podjbGnq8SlTo/9wWCcQNr0XVBYOoNhXI3UL5vPCy58Hg0m6HZK7mqAc7OmiE4u/Dq6
 tPEL4fPuj5UpCyglE64SImy2D4EAgiAfk9PWAT6j4/7fTGg4ZU+a4BXPv/HE6SoFsDDjjjDH1Xu
 nhfM41lCic8SIZVkx/g==
X-Authority-Analysis: v=2.4 cv=F8dat6hN c=1 sm=1 tr=0 ts=69aa35b1 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=XYAwZIGsAAAA:8 a=TZ5gh4L_AAAA:8 a=jIQo8A4GAAAA:8 a=2myU272RNYexLT_TknYA:9
 a=QEXdDO2ut3YA:10 a=E8ToXWR_bxluHZ7gmE-Z:22 a=2pkA1AvaAoXcNePaGM_w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2603060017
X-Rspamd-Queue-Id: 1DEF521AD73
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	TAGGED_FROM(0.00)[bounces-34134-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

T24gVGh1LCBNYXIgMDUsIDIwMjYsIEluZ28gUm9obG9mZiB3cm90ZToNCj4gVGhlIE1pY3JvY2hp
cCBVU0IzMzQweCBVTFBJIFBIWSByZXF1aXJlcyBhIGRlbGF5IHdoZW4gc3dpdGNoaW5nIHRvIHRo
ZQ0KPiBoaWdoLXNwZWVkIHRyYW5zbWl0dGVyLiBTZWU6DQo+ICAgICBodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cDovL3d3MS5taWNyb2NoaXAuY29tL2Rvd25sb2Fkcy9lbi9EZXZpY2VE
b2MvODAwMDA2NDVBLnBkZl9fOyEhQTRGMlI5R19wZyFiLWdDcEdYZlU5WjM2RE9XaGh3OG5sN1E4
VlZZbEFnWklDSWpHQXBMdG41RnViM2VuT3dVRFVSN0J1SHJuc29tV1hHYzNHOXVCWkJfRFUza1Bo
NzhOUXU0TENpUE9rayQgDQo+ICAgICBNb2R1bGUgMiAiRGV2aWNlIEVudW1lcmF0aW9uIEZhaWx1
cmUgd2l0aCBMaW5rIElQIFN5c3RlbXMiDQo+IA0KPiBGb3IgZGV0YWlscyBvbiB0aGUgYmVoYXZp
b3IgYW5kIGZpeCwgcmVmZXIgdG8gdGhlIEFNRCAoZm9ybWVybHkgWGlsaW54KQ0KPiBmb3J1bSBw
b3N0OiAiVVNCIHN0dWNrIGluIGZ1bGwgc3BlZWQgbW9kZSB3aXRoIFVTQjMzNDAgVUxQSSBQSFks
IFp5bnFNUC4iDQo+IA0KPiBUaGlzIHBhdGNoIHVzZXMgdGhlIFVTQiBQSFkgVmVuZG9yLUlEIGFu
ZCBQcm9kdWN0LUlEIHRvIGRldGVjdCB0aGUNCj4gVVNCMzM0MCBQSFkgYW5kIHRoZW4gYXBwbGll
cyB0aGUgbmVjZXNzYXJ5IGZpeCBpZiB0aGlzIFBIWSBpcyBmb3VuZC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEluZ28gUm9obG9mZiA8aW5nby5yb2hsb2ZmQGxhdXRlcmJhY2guY29tPg0KPiAtLS0N
Cj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jIHwgMjAgKysrKysrKysrKysrKysrKysrKysNCj4g
IGRyaXZlcnMvdXNiL2R3YzMvY29yZS5oIHwgIDQgKysrKw0KPiAgZHJpdmVycy91c2IvZHdjMy91
bHBpLmMgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAzIGZpbGVzIGNoYW5nZWQs
IDQ5IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2Nv
cmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IGluZGV4IGNhY2M0ZWM5ZjdjZS4uNTg4
OTliMWZhOTZkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiArKysg
Yi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBAQCAtNzgyLDYgKzc4MiwyNCBAQCBzdGF0aWMg
aW50IGR3YzNfaHNfcGh5X3NldHVwKHN0cnVjdCBkd2MzICpkd2MsIGludCBpbmRleCkNCj4gIAly
ZXR1cm4gMDsNCj4gIH0NCj4gIA0KPiArc3RhdGljIHZvaWQgZHdjM191bHBpX3NldHVwKHN0cnVj
dCBkd2MzICpkd2MpDQo+ICt7DQo+ICsJaW50IGluZGV4Ow0KPiArCXUzMiByZWc7DQo+ICsNCj4g
KwkvKiBEb24ndCBkbyBhbnl0aGluZyBpZiB0aGVyZSBpcyBubyBVTFBJIFBIWSAqLw0KPiArCWlm
ICghZHdjLT51bHBpKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwlpZiAoZHdjLT5lbmFibGVfdXNi
Ml90cmFuc2NlaXZlcl9kZWxheSkgew0KPiArCQlmb3IgKGluZGV4ID0gMDsgaW5kZXggPCBkd2Mt
Pm51bV91c2IyX3BvcnRzOyBpbmRleCsrKSB7DQo+ICsJCQlyZWcgPSBkd2MzX3JlYWRsKGR3Yy0+
cmVncywgRFdDM19HVVNCMlBIWUNGRyhpbmRleCkpOw0KPiArCQkJcmVnIHw9IERXQzNfR1VTQjJQ
SFlDRkdfWENWUkRMWTsNCj4gKwkJCWR3YzNfd3JpdGVsKGR3Yy0+cmVncywgRFdDM19HVVNCMlBI
WUNGRyhpbmRleCksIHJlZyk7DQo+ICsJCX0NCj4gKwl9DQo+ICt9DQo+ICsNCj4gIC8qKg0KPiAg
ICogZHdjM19waHlfc2V0dXAgLSBDb25maWd1cmUgVVNCIFBIWSBJbnRlcmZhY2Ugb2YgRFdDMyBD
b3JlDQo+ICAgKiBAZHdjOiBQb2ludGVyIHRvIG91ciBjb250cm9sbGVyIGNvbnRleHQgc3RydWN0
dXJlDQo+IEBAIC0xMzYzLDYgKzEzODEsOCBAQCBpbnQgZHdjM19jb3JlX2luaXQoc3RydWN0IGR3
YzMgKmR3YykNCj4gIAkJZHdjLT51bHBpX3JlYWR5ID0gdHJ1ZTsNCj4gIAl9DQo+ICANCj4gKwlk
d2MzX3VscGlfc2V0dXAoZHdjKTsNCj4gKw0KPiAgCWlmICghZHdjLT5waHlzX3JlYWR5KSB7DQo+
ICAJCXJldCA9IGR3YzNfY29yZV9nZXRfcGh5KGR3Yyk7DQo+ICAJCWlmIChyZXQpDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5o
DQo+IGluZGV4IDY3YmNjOGRjY2M4OS4uN2QwODQ1MTg0MjIzIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBA
QCAtMzAyLDYgKzMwMiw3IEBADQo+ICAjZGVmaW5lIERXQzNfR1VTQjJQSFlDRkdfU1VTUEhZCQlC
SVQoNikNCj4gICNkZWZpbmUgRFdDM19HVVNCMlBIWUNGR19VTFBJX1VUTUkJQklUKDQpDQo+ICAj
ZGVmaW5lIERXQzNfR1VTQjJQSFlDRkdfRU5CTFNMUE0JQklUKDgpDQo+ICsjZGVmaW5lIERXQzNf
R1VTQjJQSFlDRkdfWENWUkRMWQlCSVQoOSkNCj4gICNkZWZpbmUgRFdDM19HVVNCMlBIWUNGR19Q
SFlJRihuKQkobiA8PCAzKQ0KPiAgI2RlZmluZSBEV0MzX0dVU0IyUEhZQ0ZHX1BIWUlGX01BU0sJ
RFdDM19HVVNCMlBIWUNGR19QSFlJRigxKQ0KPiAgI2RlZmluZSBEV0MzX0dVU0IyUEhZQ0ZHX1VT
QlRSRFRJTShuKQkobiA8PCAxMCkNCj4gQEAgLTExNjMsNiArMTE2NCw4IEBAIHN0cnVjdCBkd2Mz
X2dsdWVfb3BzIHsNCj4gICAqCTMJLSBSZXNlcnZlZA0KPiAgICogQGRpc19tZXRhc3RhYmlsaXR5
X3F1aXJrOiBzZXQgdG8gZGlzYWJsZSBtZXRhc3RhYmlsaXR5IHF1aXJrLg0KPiAgICogQGRpc19z
cGxpdF9xdWlyazogc2V0IHRvIGRpc2FibGUgc3BsaXQgYm91bmRhcnkuDQo+ICsgKiBAZW5hYmxl
X3VzYjJfdHJhbnNjZWl2ZXJfZGVsYXk6IFNldCB0byBpbnNlcnQgYSBkZWxheSBiZWZvcmUgdGhl
DQo+ICsgKgkJCWFzc2VydGlvbiBvZiB0aGUgVHhWYWxpZCBzaWduYWwgZHVyaW5nIGEgSFMgQ2hp
cnAuDQo+ICAgKiBAc3lzX3dha2V1cDogc2V0IGlmIHRoZSBkZXZpY2UgbWF5IGRvIHN5c3RlbSB3
YWtldXAuDQo+ICAgKiBAd2FrZXVwX2NvbmZpZ3VyZWQ6IHNldCBpZiB0aGUgZGV2aWNlIGlzIGNv
bmZpZ3VyZWQgZm9yIHJlbW90ZSB3YWtldXAuDQo+ICAgKiBAc3VzcGVuZGVkOiBzZXQgdG8gdHJh
Y2sgc3VzcGVuZCBldmVudCBkdWUgdG8gVTMvTDIuDQo+IEBAIC0xNDA2LDYgKzE0MDksNyBAQCBz
dHJ1Y3QgZHdjMyB7DQo+ICAJdW5zaWduZWQJCWRpc19tZXRhc3RhYmlsaXR5X3F1aXJrOjE7DQo+
ICANCj4gIAl1bnNpZ25lZAkJZGlzX3NwbGl0X3F1aXJrOjE7DQo+ICsJdW5zaWduZWQJCWVuYWJs
ZV91c2IyX3RyYW5zY2VpdmVyX2RlbGF5OjE7DQo+ICAJdW5zaWduZWQJCWFzeW5jX2NhbGxiYWNr
czoxOw0KPiAgCXVuc2lnbmVkCQlzeXNfd2FrZXVwOjE7DQo+ICAJdW5zaWduZWQJCXdha2V1cF9j
b25maWd1cmVkOjE7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL3VscGkuYyBiL2Ry
aXZlcnMvdXNiL2R3YzMvdWxwaS5jDQo+IGluZGV4IDU3ZGFhZDE1ZjUwMi4uYTI1NmI3ZjVkNzhi
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL3VscGkuYw0KPiArKysgYi9kcml2ZXJz
L3VzYi9kd2MzL3VscGkuYw0KPiBAQCAtMTAsMTAgKzEwLDEzIEBADQo+ICAjaW5jbHVkZSA8bGlu
dXgvZGVsYXkuaD4NCj4gICNpbmNsdWRlIDxsaW51eC90aW1lNjQuaD4NCj4gICNpbmNsdWRlIDxs
aW51eC91bHBpL3JlZ3MuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC91bHBpL2RyaXZlci5oPg0KPiAg
DQo+ICAjaW5jbHVkZSAiY29yZS5oIg0KPiAgI2luY2x1ZGUgImlvLmgiDQo+ICANCj4gKyNkZWZp
bmUgVVNCX1ZFTkRPUl9NSUNST0NISVAgMHgwNDI0DQo+ICsNCj4gICNkZWZpbmUgRFdDM19VTFBJ
X0FERFIoYSkgXA0KPiAgCQkoKGEgPj0gVUxQSV9FWFRfVkVORE9SX1NQRUNJRklDKSA/IFwNCj4g
IAkJRFdDM19HVVNCMlBIWUFDQ19BRERSKFVMUElfQUNDRVNTX0VYVEVOREVEKSB8IFwNCj4gQEAg
LTgzLDYgKzg2LDI2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdWxwaV9vcHMgZHdjM191bHBpX29w
cyA9IHsNCj4gIAkud3JpdGUgPSBkd2MzX3VscGlfd3JpdGUsDQo+ICB9Ow0KPiAgDQo+ICtzdGF0
aWMgdm9pZCBkd2MzX3VscGlfZGV0ZWN0X2NvbmZpZyhzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiArew0K
PiArCXN0cnVjdCB1bHBpICp1bHBpID0gZHdjLT51bHBpOw0KPiArDQo+ICsJc3dpdGNoICh1bHBp
LT5pZC52ZW5kb3IpIHsNCj4gKwljYXNlIFVTQl9WRU5ET1JfTUlDUk9DSElQOg0KPiArCQlzd2l0
Y2ggKHVscGktPmlkLnByb2R1Y3QpIHsNCj4gKwkJY2FzZSAweDAwMDk6DQo+ICsJCQkvKiBNaWNy
b2NoaXAgVVNCMzM0MCBVTFBJIFBIWSAqLw0KPiArCQkJZHdjLT5lbmFibGVfdXNiMl90cmFuc2Nl
aXZlcl9kZWxheSA9IHRydWU7DQo+ICsJCQlicmVhazsNCj4gKwkJZGVmYXVsdDoNCj4gKwkJCWJy
ZWFrOw0KPiArCQl9DQo+ICsJCWJyZWFrOw0KPiArCWRlZmF1bHQ6DQo+ICsJCWJyZWFrOw0KPiAr
CX0NCj4gK30NCj4gKw0KPiAgaW50IGR3YzNfdWxwaV9pbml0KHN0cnVjdCBkd2MzICpkd2MpDQo+
ICB7DQo+ICAJLyogUmVnaXN0ZXIgdGhlIGludGVyZmFjZSAqLw0KPiBAQCAtOTIsNiArMTE1LDgg
QEAgaW50IGR3YzNfdWxwaV9pbml0KHN0cnVjdCBkd2MzICpkd2MpDQo+ICAJCXJldHVybiBQVFJf
RVJSKGR3Yy0+dWxwaSk7DQo+ICAJfQ0KPiAgDQo+ICsJZHdjM191bHBpX2RldGVjdF9jb25maWco
ZHdjKTsNCj4gKw0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+IC0tIA0KPiAyLjUyLjANCj4g
DQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoN
ClRoYW5rcywNClRoaW5o

