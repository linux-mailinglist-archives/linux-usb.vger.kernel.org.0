Return-Path: <linux-usb+bounces-35813-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NlXDPaYzWkrfQYAu9opvQ
	(envelope-from <linux-usb+bounces-35813-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 00:15:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 853E6380DFA
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 00:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8F1930A691B
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 22:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A84935B636;
	Wed,  1 Apr 2026 22:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lhvGQtVw";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Q42aoZfx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Deje3fO2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBD433F5B6
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 22:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775081352; cv=fail; b=g8RhfD/nzc/ICdbYkg9G8ezRmqEf5Fp6xofOqF9X6rMPpRLYX5NjdipIc6onguZVbUur7un3IyghDAnCx+kasog4/FhVUBpG4sPJFxCbz/vt2ScnNd8jUmvCzWWNx60Ltn9T8/Fh1nNuZxDD+/2+g12MZsaZYCZgG1nnpLo+628=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775081352; c=relaxed/simple;
	bh=F70KkJJaERQKUBn0uuUib2BZ03YTfKkY5OTRw6ltuWI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L6czuFOlBKqSRCnAtY1CYfrUbCPdOfZJpuZn7Q6NkRX7CxMVbAJqT5bcwF63BhR2bONuwtE6vh4vuIvC+YLgUnFNVw49Ez6LG5oyuZJkYuHc1GjA/4EZP6rihMAOe8GpGQ2Zl4VVzztCeDSotAeOhDsmyZdOYiopujJYMZawD2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=lhvGQtVw; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Q42aoZfx; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Deje3fO2 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631J65pf1007928;
	Wed, 1 Apr 2026 15:08:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=F70KkJJaERQKUBn0uuUib2BZ03YTfKkY5OTRw6ltuWI=; b=
	lhvGQtVwewjl2zDvEL3ajd20Na//OJkvO/Tst7rumcPgGcvVL0wE1NnUFY8B/oIB
	jqH7FelXOZbOcC3TCPTC89kDjup1uCL78pdA1oAj4VorprcW2siQNyu36eX+awTW
	47b2scQ05P38Te66K4hzhN7umeO9NciYEFWi68nFP1vTdTojkFiCeRULF7BHicH+
	u9IwmQ30RupsCZbvhPeiMYgTlemIHkFsMPIXVpL3aKGH+mE4CUUy6i88B/hyD5AF
	thqY4p8wdbM8AUq2jRBFIj3XopTBTOBfSQNoMxr4mTVb8hy7yDoSuUb+Gst3nXsX
	NRJALx3cxJyKIvIlxv5OwQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4d9597k0bm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Apr 2026 15:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1775081304; bh=F70KkJJaERQKUBn0uuUib2BZ03YTfKkY5OTRw6ltuWI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Q42aoZfxTpkSug5GAO1I1+W4Wm2utes/dlVNmV7f1KDGSJoLAcPEQrTJDJ85864Q6
	 JFh5jlxgACk3UOB0vTJomWCoE0GTtXLubfUNuaUdYaBjsqMMyfoS/A5fNUp7N29v52
	 r0XRdH7D0L2amxeNhWMFpmkiw0/I1AzsmvtpA+CE9jX2WcY3xxmf3RK1sgABzehqrd
	 kllYKyT1gspHbSQ13KzaSy4mlNbrqJvI8S/QpRz+7SGk7wQHcsX1kjZ+AtHTxbQtNc
	 6n8CWaBDJGOYVIGnFSKzF7l5L2x7D92ctTKiD6ja1OBCGWF9l/uM0JcyUj0eoecs51
	 83dOdb6Ps9yog==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1BA3B40522;
	Wed,  1 Apr 2026 22:08:24 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E1597A01D1;
	Wed,  1 Apr 2026 22:08:23 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Deje3fO2;
	dkim-atps=neutral
Received: from DS2PR08CU001.outbound.protection.outlook.com (mail-ds2pr08cu00105.outbound.protection.outlook.com [40.93.13.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2B7E94058D;
	Wed,  1 Apr 2026 22:08:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKQVSfPTtCu+NDxZj6GKlbnRs4LI77ygftIXM/NK0YmVNn5qsXdaQ7wfpO6LfmSYowUmiPq74fGNEyzg/J2PQjTAZR4sxyPFIvZ2zX5PUXuBgYY9cEXs0vypzKlQB1wmvR0q3MHle1wTEQ2UYm7i0UA2dNcxHCpVOFVRc6Hj5qnOTeQTmLuUKNwNfW8Uxsb1xUnmbQjXfM8uWuBuIwAxNS6TjPF78e653lLRfnCvZtN6ifntA/NozrIMxMhw17Bl+MK+1yo8gipo5VpUShSm6F3N4xXAc44lwcZLSzVHijNvn9ek9zXsqVMiN7Rb7UCEdoJ62g3svaqxU8TYJlD0ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F70KkJJaERQKUBn0uuUib2BZ03YTfKkY5OTRw6ltuWI=;
 b=uNngDlqqYAuyhLQ64JQXdtWAAKzEHe0L0nIrDNxsqATIk40w2hu3UI1EyusEQZjKV5GdOp1/IuAszAZ9v5ScJifrQ+MdTEcT2WLCsz0d44cJGACveb0HAJhqX21rhYyWkpFchbu6wjmz68vpp+E0JXkv8v1NyXbivSHVKMATV/H6RvhFQUoKLUopuGDalATbfESq0QjHp5U06ZLzdjmRTPqWKXrR0BS2ETedvKC6BSGd6vkfXJWeFDLuqMNgcRFkLVr2h4IOAMkVVYHCjq5fA7xinBa5YgVZ6EQJ1nzRiw/gOsYnLy1ryiAKI3Vmvv+cZ5ER4OwU42QDZQATGUhoPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F70KkJJaERQKUBn0uuUib2BZ03YTfKkY5OTRw6ltuWI=;
 b=Deje3fO23PJid59lXbeZfwTB7LE2yHrDCB6IpxZ3RGd46bb017m0OZ0xUL13CEtpsNnnfibwkEse01erzrrEyVRIWMmt0NLeXYVo/0mMSZj0rHlgtW7d3mhJAOMNIhtMRW62zgOg/iOhatu4EGzRh8CDt5LLD4IfDViQV1fEUZE=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS2PR12MB9798.namprd12.prod.outlook.com (2603:10b6:8:2b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 22:08:19 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9769.017; Wed, 1 Apr 2026
 22:08:19 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "michal.pecio@gmail.com" <michal.pecio@gmail.com>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Thread-Topic: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Thread-Index:
 AQHcusCFdimQniQh+kKFqQp1mqfuYbW+fjMAgACCooCAAQbCAIAAqVYAgADI0gCABZiuAIADwCYA
Date: Wed, 1 Apr 2026 22:08:19 +0000
Message-ID: <20260401220816.ynyhgxr5yoeszoea@synopsys.com>
References: <20260323122512.2019893-1-mathias.nyman@linux.intel.com>
 <20260323122512.2019893-2-mathias.nyman@linux.intel.com>
 <20260325015110.v4r5smfvdd62fcua@synopsys.com>
 <0f38e10d-ecac-4beb-ad2c-3a42c2546c3c@linux.intel.com>
 <20260326011910.t7ijezht7g7ttrec@synopsys.com>
 <9cf4008e-2d12-4025-809a-8d9371f45dac@linux.intel.com>
 <20260326232400.zkplsxflhykhayyb@synopsys.com>
 <2604e951-01e8-44d0-a11e-be63b0849c23@linux.intel.com>
In-Reply-To: <2604e951-01e8-44d0-a11e-be63b0849c23@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS2PR12MB9798:EE_
x-ms-office365-filtering-correlation-id: 72bf25aa-d7bc-4711-196a-08de903b2ed4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 hrn8gHEZjSZqxwzZHVM7cLZwNiNMLIirw3zdyX83jZk8Wl3Gi19q8H/s+uEJGf4yKah5xqxJvo7HuTWLo3xlzll/j4GQG7aXm01pMHqPZ5tOS1UxBGT1qJsugo1iVUvr2rtcz6DoC4S9zbDFq3S17ZzAtYCURg6jUA6jDcYgtnjinYeSds6bdPJNphnJ6bqpNZ0Gjraf6mnaSShJ2siSM3oIMVnAs9O6QON4c81aNjOQlOawBY6qSTPhgLod/EuFTolfDR506r4a5hErgW03J581AsUV5j+vs8oucOTiSliEb76O1E8yRZBtS8Se0pbNmWZOthd9GAew8bkdTYBi9xzCl3iqwoWnP9VxnUwOS6mfr7vWOAsDKNOXh/YxIpuWoDpgqoUxXIv+lYTY1L2cdicond509Dr79nOYIf7P1AcAtQmNm+2YF0xwySYBLdROwMn/CkVl6UN+CG805pkdYXDKyuhtjCv0PmEOKgvFDNhRvbkNtTGEND4TnankS3EzZ6AJMJCyri06sTNVHGY2WLqv2S6+QpNbjvwj0QNp0Koveh54+oDA2gKKo6XlQbt3h9tykmmXhrUJm4731gvYFFmShCfB0X4X1SvjeVQIpCSb2j5LnyFfPfR2F2Psch/32DGc0+0QmBvkodx4BuwDNifwuqCXLn5MtrXAJ1WA7BiWPJZVXZPJZncfv0QrwHyzBQR63Kj2NEISYUbXtlC6PP5ESe2p7MUarR2yQHo70YUJ8+WjLRqwYR6vQn128qe43NKoB2YxNmOvZnU62pvO560lPZ8UqIHibkv8zrUVClE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YU9pK0JkUC9lSzVWKy8vMld0T0VIaEgrTjNjNVU3MldMb201ZDF4QzhrblBj?=
 =?utf-8?B?RzU0a1dnRDN6WFNHVEdRem5uTytvRjJqc1dRd2NMQ2FFbkt5Z2JaQTlmWFph?=
 =?utf-8?B?eDAvTndKTUNuOEgyNk1icXRCeFdTWGZFUW1kRTNvS1EyNzJsU1hhWnY4MjM5?=
 =?utf-8?B?TUJVbU5xM2R1RHl5RGVIaE5sbXFUZ3dnL3MyZWZ4OVgzT29UQ0FKUnc3VUE1?=
 =?utf-8?B?NWt6bXJveitOYXEwU2VuNzVNZlZLZ0JRVXpZcE92ZU5lOUhrVmsvTVhPWGNG?=
 =?utf-8?B?SUdwK1ZKOENGbS9admVMclVvY2lwcEc2WHlXeGNlSWIxcW9oc24vNXpPQVhp?=
 =?utf-8?B?MWRleGFVNFhjVU9yQ0tLM0VJUllaNFdQdUwzUSsxQVBLZDFWb2JUeG53V2M2?=
 =?utf-8?B?N1lKUW80dW5XRzV1K2xrcSs0T0VRajJFVGZydmFUeFhnTk00N0YxWnhIVkNO?=
 =?utf-8?B?QXBqNWM2bWg4M1RBY01BRDQxMFptS1RwRjIwR2F3NTFQdTZvVy84RFRWd2sx?=
 =?utf-8?B?NUhJTk1MS3pTem9NRVJOTFlsWHdsVVUxUzViUmVFdjFqY2k1em5UR0RlSHd6?=
 =?utf-8?B?Z1pNYmoyeEVWdThaSjE3c2hkQnBkNisvS1pUakNwQVZCVnlhSFgyaSs5OG9E?=
 =?utf-8?B?QUNibEtPLzNQWFREUUtNVGg0QzJ2SXJPRjcxL0JBYjlpbmRoZUhpR0E1OElF?=
 =?utf-8?B?NkhneERwVW13UnNFcFNNMlFFT0ZxKzlnSkw4YWVSaUk2Y3ZVYzc0c3Z3TVBU?=
 =?utf-8?B?RVVUWElwamxETUtOYjBlVzltdkpnTTJHeENxa00xR3M5WjlBQ3NDTmFrYXc5?=
 =?utf-8?B?QUlZUW9EcEtoZ25MMHBRamZHNnozeGNqdHJXdCtudjN0U2ZpYVlxNWs3Q1NE?=
 =?utf-8?B?dTRSYml3Nnh2TUhZeXoxZi9PUmxUZm8vQXNsOU5CdU81UlJRL2NmZFJSMlhH?=
 =?utf-8?B?eHNpRU5JdTVFTGhVUEUzcFRMK0ZGU1JIQkdyZlZmQ3hlZGFWY2NCQUkxN1JW?=
 =?utf-8?B?dUdjNmNCUEc0V3VoaU1Eb3JCajNicG8rVTFxR0tNdEVvZGNNWnFYaTcvWTZC?=
 =?utf-8?B?SjdRRVB2dVFsQmRvUG00Q21pa1R2eTNyajhwL0Zyc2pzanBnaTBOUFc5NW1l?=
 =?utf-8?B?eUhhdE9EZWc0b2FxcjV4RXVUODF3aVF3bFFMNm9mbHVqaytTcVpZVmoyRmt5?=
 =?utf-8?B?RkVQUXh6aXRWQ0ozM0U1ZEc4OXkwNU5PcTQyOFAwTzB0d2JtN0dvZFRPTmc0?=
 =?utf-8?B?dy92OFRTa0NPTWxrL2ZSMDNPRXRpcTB0dVdUbC9nTlRERk01bHNSVHAwWDZS?=
 =?utf-8?B?dWxRRjZReERlR1VUUHYvWGVRUjR4S2VORmRKS0xHYzBFNzJSWGVMY3YvRDRP?=
 =?utf-8?B?cHJJZ3BhQ3RqSmptcXhoTlZFN2xXVGZWVTFQQ0QxL01kSGxTYXRhU1lNaUJQ?=
 =?utf-8?B?SWkvVUh5b2REbWlkcUZneXppRm82a0Nka3NXbEcyNnZNbUVLeUNSTm1ubUtT?=
 =?utf-8?B?b3JldVB4V1RFMFdvSERkeTJWZE9yR3I4SzlsQ0ZoSm5FKzk4VzJxWEZJazZV?=
 =?utf-8?B?aXZrek9zTE82enpvV0Zldm05d2lUWGl2L3krQ0xyZEdsc3Q4Sk1mNnlGbitB?=
 =?utf-8?B?cVhwOFBCclpScWhsa2xycVpxZGs3ekRUbWJxVlBTMTlNT21PTGJrUktaRUhp?=
 =?utf-8?B?akg4aU5NWXFSSFl5cTlYWXRORFRqbUd6bWsrUDJLcmFQb1NLbzRYYUN1VVdO?=
 =?utf-8?B?WE1UWDdaTUUwYXpkSUpoSlAvb1B1Rmkwa2toMlFhQ3pPQVlUTGxkV29Sa0Mw?=
 =?utf-8?B?ai84UDJSajl5VjRseGtXQVpGSG5WUjZMRm5VQVhaNkNyM2Z1bUN1WnFvL0Yy?=
 =?utf-8?B?cHlNaEdlcVZFdlpnZU1BZEdMelVlZkFDYitXb3NQUHFWc21FcWt6c2U5MmJp?=
 =?utf-8?B?ZHc1TVc2QTlCWmxJeG4yNVBGRk9WY3g1YWo1dmFKc1Jva1QreUdtdzRwdis4?=
 =?utf-8?B?UllyOHVlTUJzQmM0M0RDRTBOd1hMeS9XQUY0dkFkZ2FVMkhBTUtWQmc4UThu?=
 =?utf-8?B?NFQ5YVRtQnYyaHJaWW9KKzRqT0c0TlNpeHhyTDAzVTBKYnlVd1NSQWh4VDlq?=
 =?utf-8?B?dkdGVSsvQlhQUkFQNUg5TytTN2ZUYVoxUzhRZlE2VytIV2tFbjZvRHJWWm1C?=
 =?utf-8?B?UDR0eVBZOWhGTFNYMUNVUmxEYW1HN3lQcUZEWWtTSktOV3ZpQlRTdmhvd1RX?=
 =?utf-8?B?SXV2M251UHFQZXpLZ2Q3YlRGeVNRMm1Zb0hhbXdNTkZLZ1h2Rnk4dmZ6MmhH?=
 =?utf-8?B?VXpHam5QRXhZRDMxWElmRkg4cWVhcE45N0xYTzZYNVIwR3hxb2lLQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <88B4E55922C85B4FAF51BDA473E89D08@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	SB0q4JwCtkl0uPH3V+61icdXJhFvIGrfbuij0GjSUEF4n+9xZVrUgZz32j2e2VqmLbkGOopD765WZnKd8z/bT1oT873W5E+KgH/EkhdAg7UqOCglnv1lJzAiK63A/m1Ii8f5PVtHLVYc4cx57+jYuRvfK6yMtALefR023HssfhPNZLJzo/JFD3kmucmykNgzpg1z4ETeD8QoJHm2NSxVs1LVCpROnd3SY6Y5qhHenAp521z9sSRjL6XYjs4BWHhoAQxE8XQf7xYFu4BJjdBAHsR0IEWsPD8J0ryTWWxDJdSGYoBnK24bPSMir3iwJ+89232N7KK3NcA9MqNTzn7p3w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	B1mkoJ93jFWjHbuVELQv88Bm6vE9MxsDRkFjga0QSDaxtjG95sWx9huQHeFQaw9NCqxXWE0J8YO2buF66ja2Bsw+KhbTH6mXkPF5plpHrXZJHX6mIOsk5hguY2KWOEw7sAL2eEQuydElK1DaQM8OFsEVD8nTkg83KuhEuj2tnqeWPLCwS8e9Mh1SEqzKgc4YggGht+x6FJtIqgyb234P6W9R0mKFkVCO1aBdDJxXx18r+LtR69lkZ+CKaFY05NGgACA4YHbJCsCyx1jO37Xgvm61ORWr/poZsqzyOCuAlSlUE/hQjmMUwxiD9MSNf/US1RU8hcaQMLLRLbT6JSJ6NI7bbGHa71U6IbV182PEHJ/noQpvIhxHRXViIvCE6jRX0OBjcSAvE357VEIBva6uFBdIbwiRsf/ymz4miliAGavI1WcZevWDwkzL3e+DIVpDwX8y0TDfCZr8cVTUkJ3wwo0uKmHtiBt8rSzVPtEb8/7bjetUnLQX0novUsD9bmn5rcrk2g7JEm6jJWv+LcqA88yrxZsMNNtlq5mSqg8Jj5lqReD8tDBiZvcZTk6g9v01XP8Mb64V+LkEwfvctc8iaDADtaE6VKPzKlWZ3E6Wh+i0urqJFmHSs6t0OelLVWZdRWs2TeMq53aTJEzsFr/J1A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72bf25aa-d7bc-4711-196a-08de903b2ed4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 22:08:19.5854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p50JLs5QDbVdEgorTX1nEUCOZGvPPu1s3H6orgLFX3+rPL+Y2f86bWun7onAxBA7uQ95uJjqRUN2QfODTO3fXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9798
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDIwOSBTYWx0ZWRfX5oq0L/m3h8Xm
 c3aUD9S2pD1C4PhPv0SNJMWTobVG2jbZNHg+I/PT4jMW3dHr8PSSRz2Y4fQ73pOrl8xZqmRNe8B
 5cDXyknULMhfEv9/+oSRQWZCDL3vvkO872/iFWWFfR3G0AxUdbYlqXqRRQ0kc57x+cbcoJpiCBm
 ueUktv/0QiQc38yv5nJoVwUcYX1XMOODwwtym19ZAhsSNrVPI+WXluvMUD6BY9V9uMHuD8C7ttO
 09Xj1FgdWObpaUPs8aA8HUHLVSgzLa6/rt44oZPCrnBjWN/MJHl45l6VvQxb92QeWT5haXh1dTK
 Y6cp12h3unrbcoNhxJshEnMiZRlfMovy08KTvH4BQ331qLZ6Ddq6mJbF+knTm1hLJKM3Shk0afg
 zi4dz6q5DlA3JUUjQHzwh/lyqUMQizP7/bfwG5TUxNu1xtCXXYgFsqDJNNHPn1I6xUZO7B3Dpj6
 LiRkJwtTAge2XN03XIQ==
X-Proofpoint-ORIG-GUID: lg-JUPKFE3yb2jtvQlwPKLv6QaITPtVh
X-Proofpoint-GUID: lg-JUPKFE3yb2jtvQlwPKLv6QaITPtVh
X-Authority-Analysis: v=2.4 cv=aJr9aL9m c=1 sm=1 tr=0 ts=69cd9759 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=TTlnyu1N0yvp2gpHHv4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2604010209
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35813-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,synopsys.com:dkim,synopsys.com:mid];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[synopsys.com,vger.kernel.org,rowland.harvard.edu,gmail.com,suse.com,linux.intel.com];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 853E6380DFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uLCBNYXIgMzAsIDIwMjYsIE1hdGhpYXMgTnltYW4gd3JvdGU6DQo+IA0KPiA+IA0KPiA+
IE9uIGEgc2VwYXJhdGUgbm90ZSwgd2lsbCB5b3UgcGxhbiB0byBpbXBsZW1lbnQgdGhlIGNsZWFy
LWhhbHQgZm9yIEVQUk9UTw0KPiA+IGluIHhoY2k/DQo+IA0KPiBJIGRvbid0IHRoaW5rIHRoaXMg
c2hvdWxkIGJlIHBhcnQgb2YgeGhjaSBkcml2ZXIuIERlY2lzaW9uIHRvIHNlbmQgY29udHJvbCBy
ZXF1ZXN0cw0KPiB0byB0aGUgZGV2aWNlIHNob3VsZCBiZSBkb25lIGJ5IGNvcmUgb3IgY2xhc3Mg
ZHJpdmVycy4NCj4gDQoNClRoaXMgbm90IGxpa2UgU1RBTEwgd2hlcmUgaXQncyBzdGFuZGFyZGl6
ZWQgZm9yIHRoZSBjb3JlIG9yIGNsYXNzIGRyaXZlcg0KdG8ga25vdyBob3cgdG8gaGFuZGxlLiBU
aGUgcHJvZ3JhbW1pbmcgc2VxdWVuY2UgZm9yIHRoZSBlcnJvcnMgdGhhdA0KcmVzdWx0ZWQgaW4g
RVBST1RPIGZyb20geGhjaSBpcyBzcGVjaWZpYyB0byB4aGNpLiBUaGF0IGlzLCB0aGUgeGhjaQ0K
cmVzZXQgZW5kcG9pbnQgY29tbWFuZCB3aWxsIHJlc2V0IHRoZSBidWxrIHNlcXVlbmNlLCBpdCdz
IHNwZWNpZmljIHRvDQp4aGNpLiBUaGUgeGhjaSBzcGVjIHJlY29tbWVuZHMgdG8gc2VuZCBhIGNs
ZWFyLWhhbHQgZm9yIHRoaXMgc2NlbmFyaW8sDQpub3QgdGhlIFVTQiBzcGVjIG9yIGFueSBvdGhl
ciBjbGFzcyBzcGVjaWZpYyBzcGVjLiBTbyB3ZSBzaG91bGQgbm90DQpkZWxlZ2F0ZSB0aGlzIHRv
IHRoZSBjb3JlIG9yIGNsYXNzIGRyaXZlciB0byBoYW5kbGUuDQoNCkJSLA0KVGhpbmg=

