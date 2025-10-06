Return-Path: <linux-usb+bounces-28917-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AA6BBEFAF
	for <lists+linux-usb@lfdr.de>; Mon, 06 Oct 2025 20:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D6D684F146C
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 18:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4174F2D6E77;
	Mon,  6 Oct 2025 18:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PNhqE7FN";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JT+Ya89G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RX6RGd2a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C560623E334
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 18:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759775658; cv=fail; b=C7c6rIYIAe4rfkfHSi3Tu3r9rLSLxOGoqLyPl3pnmVVnBRGGCWH1Iw5hnfUjPTy34Z4Q14YVjgQii7CHEDc0P9O487D/hnLiE4MZMqEA71xUNxVErBWrxg/Mhv0ShoK+JC9C375nVaKXkFaPODzdx3VlPTNMjsrdK3uR1YYZ3t0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759775658; c=relaxed/simple;
	bh=wiEDP0fHssslG9RX0+k+pZ2hSzwgjOBeEArVQynkZNM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JSZOT+bC3KTu6X5AlA7Dyh9kp+HCVTeFs7rMoetk5od0qlW8Ooxzy8XzAIpr/Snoro6owq1fUXfJm0pGeREjGIipkzDH/a7G+3ASwPAZRhGVannFH+NyBIHks1txHU47RxyPaqhN+tmKXUKWkomFUuE40BeKE8TlBC6/bBu7zHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=PNhqE7FN; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JT+Ya89G; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RX6RGd2a reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596Ch3cK017417;
	Mon, 6 Oct 2025 11:34:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=wiEDP0fHssslG9RX0+k+pZ2hSzwgjOBeEArVQynkZNM=; b=
	PNhqE7FN2DXTSw5jqVH4RbBgfm/KHzxHL8nbSwGfFmnBbasZjkoXckMXv1RkhahK
	/g5lU8jt5Telj28gA/ekQrkbZ6fACrD3FVrxJuSNB1sx5TIq2n7w+9sl2vjvJG5W
	69/aoxeF3pi1BcnvXHzeC2SzWQO6hZh2lLKkgrpnlqh3kDhgAEu5OZSZEHxUdW05
	DlNeJCnWc+Tbc62nPAKvJpSOiTRNmyZ/yBhsm6smhYG6hjx6irxKsCKQuXVGOeY5
	U5zj7AjCpPCCBmqaOxDXxpLDzKDLg2oK7H+hNBqSZuY9TkH+UA0E3P+MhFUfYIxL
	psyN4mMQNNn3N5oCUSxYVQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 49k2u2xwrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 11:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1759775639; bh=wiEDP0fHssslG9RX0+k+pZ2hSzwgjOBeEArVQynkZNM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=JT+Ya89GspnBhpbOTvDCso2cavgoHEe8edV+tX9+J6klD3w0kZwUW45kHEzTloWJy
	 +6Zz8Mb+co5udVSu4xnzQFg6cNqb2VL/Gms1eACLqVqJU3MgWWDUCjV0T8MmNuDX5o
	 KxJ/wuG9G+0qijvSSQDDR3fu7pnJYW9e05Xp68D1i/bXnvxvCr1gDpD4s2vlLHbMHg
	 ZrLvkiuVYw5z0gA4mKWc1lLd+Vt4NkMIDDL768/Vm9RAGljuYjPAjWCF2QoP0y7uKP
	 2LOUa1q8ypOr4qx+lflkvuQUH7u06Qm9+IZyuj/8bLC0/3bKjhpb9lfeWWOSOleemi
	 tGQ71Z5HcpkVA==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 77E1040140;
	Mon,  6 Oct 2025 18:33:59 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 0A879A0072;
	Mon,  6 Oct 2025 18:33:59 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=RX6RGd2a;
	dkim-atps=neutral
Received: from BL0PR07CU001.outbound.protection.outlook.com (mail-bl0pr07cu00101.outbound.protection.outlook.com [40.93.4.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E181540143;
	Mon,  6 Oct 2025 18:33:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WceM8s7QBPMyonuKwRKum4p8+4YsQ/odegst/fYi05d2TJpA13tOa/8RxDEUcXZeqlZjE0i0s7/H+dSwKDqBADa1raRfAxzAWEQJQB/N7BQwbC6eFeZgdzKIay35x651acDwxgCHrQABmGS2/vb63tZCHseJPCisvyq0CG/6mkBYV9Z8RAtw576YebxQjnnnVeQNHMyzc2ysovy9eVRpCNwvZVmnkRs0Ia2nk4j06Myl3g7FrI7Xpn77tkymU/WMpd5SQ5jdoRhozo91F33LimJR8Bih07IywO6eh6Ax/SnbpZKDkQbMVSLvgGSCSX2Geb8QKrofEWK9QbyNv0kLXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiEDP0fHssslG9RX0+k+pZ2hSzwgjOBeEArVQynkZNM=;
 b=sHko0YiqY9x8+0zzz77nf6G4FIYWAJrF6ck/m6wA/yw8Nz53Jaeps4feuswTp2sWKkdroloM1JBno0w95Tr0MgDJBKxwPQtIVROrDsySP7rMGfg6x18pv2WoCBkN7FKynjcb9QKXd7pzcHiZrZezwXVGEio13M6xpK4VqTHcQj7hov/0GntUwfUr+ifDeA3G/uRkQSKoHrSurkjBXoU/EHfmOEk35t4f+OIrTPtXY8+Gq53KQKcNsGuGu2GVL4/soeQWwZT7VOb4pGHe7+0ZD3BZzQKVfY/tT95mp3pOTkOv9t/CW4+rnqRHZNFJxYVXPD2ZPmTy1CU1CjztLHWuew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiEDP0fHssslG9RX0+k+pZ2hSzwgjOBeEArVQynkZNM=;
 b=RX6RGd2amOvpyDnvNPtmlLKnnOYKbomMjlEcJzfrx3BpV8s+ljmFHad5r1PmzfBNeW8exOQQHprFCD9mS0Xm7Umf8YyWmyPd7v5qQsPtaednwW2jXSdv5GeOjZGr2BPOC5eZ0UHfbM/ekyZ6jLxF32oTM5/CxuuXT/H5KN0gWO0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM4PR12MB6350.namprd12.prod.outlook.com (2603:10b6:8:a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 18:33:44 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 18:33:44 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Oliver Neukum <oneukum@suse.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "amardeep.rai@intel.com" <amardeep.rai@intel.com>,
        "r.kannappan@intel.com" <r.kannappan@intel.com>,
        "mathias.nyman@linux.intel.com" <mathias.nyman@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/1] USB: core: also treat eUSB2V2 as eUSB2 regarding ISO
 transfers
Thread-Topic: [PATCH 1/1] USB: core: also treat eUSB2V2 as eUSB2 regarding ISO
 transfers
Thread-Index: AQHcNuDGE8QPiMkyw0qs9HQVzZUqO7S1aggAgAACZwCAAAVFAA==
Date: Mon, 6 Oct 2025 18:33:44 +0000
Message-ID: <20251006183338.5zlke6cu5zufw44w@synopsys.com>
References: <20251006164500.131899-1-oneukum@suse.com>
 <20251006180610.lhlzfeo5z6zxgekm@synopsys.com>
 <692e4565-507e-430c-ba97-dc6d6539f800@suse.com>
In-Reply-To: <692e4565-507e-430c-ba97-dc6d6539f800@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM4PR12MB6350:EE_
x-ms-office365-filtering-correlation-id: a9e7733b-4f7a-4cd0-7f0d-08de0506e188
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VXVhT0txRXlzRVlkMURKVmUyVzdGbzVhbGtOLzhDQ1FlbkNvUWt6a3pyamxZ?=
 =?utf-8?B?dWd4dSsxT0xsQVNtT2NXNWJqVnh3eXF3MDdqYTZ2a3J5UlFQRUxXRjlRZFlW?=
 =?utf-8?B?VjhYQSs3SU5mK0VVZzZ1aThYb1RsbTBIbDJJd2RISlYvNW5BWkJPR0FjVUh3?=
 =?utf-8?B?cjBkYjBmTGNhMk9FVGlxYXhha09tdUhYVm8wc2xUWHVFaXVrMFFjT1J5MUpW?=
 =?utf-8?B?Zy9DWTN3QlVuN3czVVNDQi9jOWxnSDYrQTNkeER2dFh6UTJ2d0RLWUZyUngw?=
 =?utf-8?B?Vktsem1sRTdqdXArbkNUdHFiZWlDeWtaVFpNblk0ZE8vZzQ0VHRZdy9yL1Yv?=
 =?utf-8?B?ckRyeWJYWjIyVW91Z0JCMjNwSHVYdE5qUDBReXVmYS9hN3VVWjZvT3czS09M?=
 =?utf-8?B?NWF4NlUxMFp1MEFyYktvTUYwQlpzNXJMN0RmKytjdjRVaVBZQmhLMVI5NmU2?=
 =?utf-8?B?UkVzSE1SMkNsa1BwdmU3TU5MeEJuNGJMV0JQdUE0NHkwaUYxTG51WXV3bEVK?=
 =?utf-8?B?VmVvMk1WOWtWbHhKTndZODJxdkptUVdmNnp2MnVrdjJNdlBJNXpYc0crWU1J?=
 =?utf-8?B?RFlIOUNkVUlpZGR1RjM5U1dFQ2VtdmkwQ1NOT2NrMUJ4VjczZ3NnR0NTb0Ux?=
 =?utf-8?B?bk9lYmdTeWpFVU1tWXJ1UGY4TDdnV051aExCdHdtZ0NZY002VFd3UFpOSzZr?=
 =?utf-8?B?eGRtZTZnRjNrVUNSS1ZwbyszQVJjSWNOeDFNazFsOGsyNFQ4blV3UE5rNkxZ?=
 =?utf-8?B?cGY5cFY3SEppay9XSFh5c1EvV0xVMm1aMWozWldLRkhhSW0wU2lpSmJlb2xi?=
 =?utf-8?B?MmRPYjdVTHhaUFRubXN5Wk1UK2xZVDhtZDBKWUZ0K05CWGd4QzFvdjBxMWQ5?=
 =?utf-8?B?YXJJY0xtbFFrVkk2aFFzNjdGdG1ERS96UUU1QSs1ODFhUTlTcnFDS3cwUCtt?=
 =?utf-8?B?YnhoZEYrb0IraEZtQXpTcmVUUTJYaU80NUJvWll2Y0FoQjZDR1NPa1FQMDFB?=
 =?utf-8?B?WlpMdC8wVVd5c2o4YlNVOS9mbGlRSDMwQVJZcHozMmJ4bko0VzlrRldrQ0FQ?=
 =?utf-8?B?VzdVa1IybEtTblNaYnMrdHA3Tm1JOCtXZjhVYXBFZWptdlIwR3FiUEdWa1Fs?=
 =?utf-8?B?TWVmWDJzL3l1ZHdqdm9NWWlKWTYrREZ2ZEtBSjRFNXp3V1lBZ0FCVUdGSTRQ?=
 =?utf-8?B?eDJCdUVKWFZSTTJPWVpsUTZyYk5udTJNbStERW1HaVBYd2ZpOUhrQU1zK2Vo?=
 =?utf-8?B?a3QyV0lPUGZrK3c4cXNjb2ptOTNKREcwTGV3L3d1R0IvTDRBMlVnRWFyczVI?=
 =?utf-8?B?d2VXUC93RWY1VnpNeHhNTjV0UmVFaVArWTM5ams3TDJjK0tEelBBeGEwOHRu?=
 =?utf-8?B?aGVLYi93enk4MnZlZE1nc1RibDhkZmwramVaSi9XbzFhaGNCUDFueEJrQTJQ?=
 =?utf-8?B?THBaUk5hZ0NVcHF2aStBTWtCZG1VM01LMW5zRUNnL2s2VUUxYy9DbjZ3ZDNG?=
 =?utf-8?B?aGdQVFUxbXBnQmFIUWNzcW1KaTA0M25mQkRyZ2t3VWp0Y0JqZUVLWEkxZ3FE?=
 =?utf-8?B?UWhGUU51Yjh6anNtVmpwajlVbWduZGErUkZaNHJHeUowV3dFL3dSbHZabHMx?=
 =?utf-8?B?eHJSZUYyZnRGUEZtSVgyQ1BjLzRhSXVUSmxjNW14Yi9PYS84bGp1WjNVZmN1?=
 =?utf-8?B?WG5lNGt5cW9yNTcvNjMzdzRVb3lULzFrcFArUWpaanJXWGVHdUVQK01JcTlD?=
 =?utf-8?B?b2RGOS83aTRWVUtPazBGczFsMkU1NWNwOHRMZ3h0ZzhrN1NkSWpWTmdyalBD?=
 =?utf-8?B?SXFQQzFpc3c2VjFDZmFwYVEyK2VseFZxMnpLWmM3RUYyK2E5UThuOGR6a1R3?=
 =?utf-8?B?Uk10SlNadGZ1SVByQ0tPb1FmV1pFYms3c3QzSjlTYmQ0Tkk4OXVIVjZoVjRX?=
 =?utf-8?B?bi9WUnNjejBaWU53V2NRQXdiNStTSjYrQ2JNTG93M25FREx0ZnBkQmRQSGQ0?=
 =?utf-8?B?MTB5QldYSkZOUWRoem1kR0dqUFFBMlc3a3dxVkFsUEliT1NBQ1p3TFloT2Nv?=
 =?utf-8?Q?UjN1kv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZGxSejNMM20rbnFjWmVHbWJKYTRXSElKcjhHTUpnSDJtZ3lrV0ZCOGpsTDdF?=
 =?utf-8?B?VTczWWF1Z2Uwd3NyQjF1NmNZU0pXclk5eVRsbzk3c3VLU09tWU42b0ZTTUR6?=
 =?utf-8?B?RmJIaGVnYm80VWpFNkd3aWQyYmlWZkFRaStFd0ZITTBYNnZHY21rVjhmOTFD?=
 =?utf-8?B?QW1MZEllZkhSYWRIQnJNMThKS1NKaTlLVEs5Q3g2WWhVQjJmTUlNVHVNNGYw?=
 =?utf-8?B?YU1LNVdnZkhsTkh0ME1PbnhCZ2FpMmZpU1JseU8zNXhWMmsrb1FoZWpBalB6?=
 =?utf-8?B?YmFHWkpoaDYxdC9yNTdyMm12TWxzUVBObjQwWWhFdjhDTHJtblZJVGtDMndz?=
 =?utf-8?B?U1VOdzFjUUU1aHppUDlneTJiY1I2Z2RKU01vL0ZPSmI1TThwN2llNXB6dmJU?=
 =?utf-8?B?VnRycDBDNEhDQUdUM2VDbW1LNkhiOUtIZWp1SFF4MzF1MGQwcVZ1ZzBLc2p6?=
 =?utf-8?B?TVcxdWhoT1lEQ1haNzlBbjIxVnZTakZocTN3YWlDbFc5b1JKNnI1RGpVS0I4?=
 =?utf-8?B?UHpna3N2UTJ6VDF0ZHppMVNuSXd5bFpjUDZMQlhROWdHZXBqWldWclFTajIy?=
 =?utf-8?B?eWJvK2szeEdqdEk4NlFLeTdlVWo0aGRReTc0K09JM2lEeUxHcVBKT2UwZCtT?=
 =?utf-8?B?U0dPMWJ1dU5hRUJRbTNBL1RJOXZ1RWUyNjYvemgzNzNGRllrOEZCWnlpbDRv?=
 =?utf-8?B?WmFhSzB6Ukt4TmdoempwWU5EUklIZXZiT20zbDFlZ0wyekdnWTdCS3ozNTlK?=
 =?utf-8?B?ZEdaQi8yQS94LzJwR2NuTDRyOENuaHB5OVVBVENEYm1BS1JVNnNsYnErS1hp?=
 =?utf-8?B?cmg4U2lvZGlEYkpzYWVtZnNPOEJ3dERqNkRsb1pEWkcyYk9EREU2ZVBZamNN?=
 =?utf-8?B?T0M5d1VTelZMQ0QzTlpvVHlFaHlteEFYU05qcXQ0S1lmeEZFV2VBTG56QWxW?=
 =?utf-8?B?RkNPdjVKQnFKUHpac2xlM01tRGFCWUhoeTlsRHhyVE9OdWFtRElkTkQ4cWYr?=
 =?utf-8?B?dWpGdlpNc21xR1Y3cnl4SEhGSWZVTzl6NXpNUXd5N0N3SkJ1MnMxZ1hHbGVk?=
 =?utf-8?B?QnEzYjB1L2lNNEsrR1I1R0RSSTNXbTc4cUtaOUJlSnJ4WUgyYnhnWVdoQ2sv?=
 =?utf-8?B?aTIybVVCekpuUnY3R0dKRUdFT2RSZXJoLzB0NjZsVHEreGVDSGt0eXc4UUk5?=
 =?utf-8?B?STRRUisxVittK0tPdmJpV2VQWk11eEFsTDJKTFVqb0FkR0dtSWVFTURsYnJs?=
 =?utf-8?B?SGZ0WVphMmFkaFp5WWVUays2Y05Qd0tKbXd6TEZsQ3hUaEJUWmNHZlZPS2dD?=
 =?utf-8?B?N3ViSC9iWjFjNkxyaWl6L3QyaDhYblMyWFBGdGN0Qi9OVkdXeVFQQUxOS2JS?=
 =?utf-8?B?SzBLcWlKMXE5L2NId2drVDdrZGdLcFZkb3NaUmFCaEU5WUlFM1N1UWlFdGw4?=
 =?utf-8?B?c2hOais1YjNKbGIyQXczalRQQjFNbXBEWVlZSDhtTzNHL0owNmdkOWtUVi9G?=
 =?utf-8?B?L2ZSVWZQN1BpMXlTbnBzdDhYbVMrSmN5bXJvcWRwUzNnWXZFbmpMb1FMU3hU?=
 =?utf-8?B?emE4Z0ZZZGhGMWlUYmgxYmRiZlk0aXJRczJOMWNXbkUxditsbHdXUlpLQ3lO?=
 =?utf-8?B?MGFhRHFxc0l6U0ZTMGY5Zjh0Ungwelc5blg4cStuNTFCMmNxOXRreEtGOXVt?=
 =?utf-8?B?aVFRTWZCTjVOQjNCZXVUbzRHTjdUaG9LaVdxWEYvRFdLLy9aYTdvbjFqakhF?=
 =?utf-8?B?eUlkaitvbkZycnJGd2E2MXgrZWlXRHlVR05kVFBsNzJhRXp3N1FNdzlrcU9T?=
 =?utf-8?B?SFRlZXhlMDZrV2w2ajhZRzY3OG1lUEpQS21meEJJOWtldWw0L1NMYlE1WklY?=
 =?utf-8?B?ZGJiODdPSTdzaXhoOTNFUlkrWFY4bGVualdjZklGNzJraTdLVlRlcUk5S1d3?=
 =?utf-8?B?UXJENm56T2kwUzZsN05IeVFzaW5CNHRHMEh5UFVNdncwSkxRZGFNNm82N2NZ?=
 =?utf-8?B?NVNvK2pCcTNFR3d4SXdjNU84cFV5dHlGWXNLS2xoZjRITFNJWTFubU5vUWtH?=
 =?utf-8?B?UXA0MTY2TkJVeVJMcENhYUNHdmZ5YlV6aGxqWnRFS2lXclh5SWR6Z0tzOGhD?=
 =?utf-8?B?S1lDT0wvczdNb0FLQ1N6eUZ0MFo3cy9uNlU3SllPdVpxSFBnbUlNeDRlTEZ3?=
 =?utf-8?B?amc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E2005A32D642E478C43C1743952618B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	womUCY7k2/6EVPoxCsGftSiifhuZoQhDf03E+eK7A9Ws3lERixY5qkkvzYF1JWhQgkz2ZyWL2okIcQXqhHfQR1P46jt3mk5vN4/XpERYsdbowgi1UNrD+sp13Igb+FeIysjM5m++464aUMKhspf7yBcTo96p3GAkrYhCW7coFeGt0TPw51HJngc7t1MIyy4r95tYKF6HGRuTXSBexq7KGOrKtnMfE6fPbQqBuV62aA5g10XoNfvi2TLeyH2OnVuKN1wej5SAEIqoiC5l0irqR/ieTT/SaaNmw0bNBcneM5LJmoq3zDA7VtR5vtz0HM00E4riB8KkqyFMJypuZpe5wFH51MkswZmTe/nsWH6LdbP2ExXjAxqtr6879+iRJv3BwtHzRX4X5CGOiUP7LCfgpbqIIppkcFF96MW1OihY3TfnCBNSDcF3DCXZdnKVz4zDhz6ySnN2tDLDeSko1f/X8FHnM7za4a6Idg7tfmAPzCIPFBGsZYBqfzpafQFLdIFwxRtlktueGTBx1FeP5nXzWEutYIX83soUgtRX/dkUhm8/pCUJCD5vPNSmmtz3TuSkPqXKoLqN/gWMka5qGq/Zu3UCbwyq8B7fhchme5N0VKGZDw2zuIThoFQYQizHozAWKUCCrCO9JpkV2SHbWiHfOw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e7733b-4f7a-4cd0-7f0d-08de0506e188
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 18:33:44.4256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T81u3joGy2vaumn+KKbaua4GEEM5gMt8R2FFOEHALdyyX/+zYGD8+pFTMG28KHKXoNUzexWtOtLi+cexKMqImA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6350
X-Authority-Analysis: v=2.4 cv=fMI0HJae c=1 sm=1 tr=0 ts=68e40b98 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=qPHU084jO2kA:10
 a=CNXj9FuswGoa6KBAdvEA:9 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: TaFnhHUY2gbDz_P6tGhP_j96Rhm7cCHG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDEwMSBTYWx0ZWRfX9jiqCqBHxe+O
 dBcs/NfpIgih1Dbc07HBYkiZKD2UajXjCMzMb9OoOS77M4Ndf6pP98O6YuvF/iIto1H6cB3fa6j
 LOMIGvE8QCtF29S5/VqkDpMOdO6YCC1JBRiP5OJ3/ZIK53Is9ZIxjC8fclS1Um5OnBhbY9+l15k
 wKpNTtEklKCUgi7XXNRVaqi1ez3KT6bnIlBj/LDjfVnHVWlyvkLk7VMkb3Bu8dcHGCNbbeySVfT
 5s2CWY67TIHw/rvuzs9pQV39Kqnm/ddxmi0GDFkiSL+9r5Klya2n9u5FrePXJtx5YFdDwxqwRW+
 R6N9gtr3iof+kr5e4foxWnJityk9N42xkQ3mHJUR9wvISwcXw7bN673o37ScxTBDuubxH4IBqmm
 Qo8zJmNx1qT4lUPLrQoOu0a3ssP/0A==
X-Proofpoint-GUID: TaFnhHUY2gbDz_P6tGhP_j96Rhm7cCHG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2509150000 definitions=main-2510040101

T24gTW9uLCBPY3QgMDYsIDIwMjUsIE9saXZlciBOZXVrdW0gd3JvdGU6DQo+IE9uIDA2LjEwLjI1
IDIwOjA2LCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gTW9uLCBPY3QgMDYsIDIwMjUsIE9s
aXZlciBOZXVrdW0gd3JvdGU6DQo+ID4gPiBlVVNCMlYyIGRldmljZXMgdXNlIGEgYmNkVVNCIG9m
IDB4MDIzMCwgbm90IDB4MDIyMA0KPiA+ID4gdG8gaWRlbnRpZnkgYXMgZVVTQjIgZGV2aWNlcywg
eWV0IHRoZWlyIGVuZHBvaW50IGNvbXBhbmlvbg0KPiA+ID4gZGVzY3JpcHRvcnMgbXVzdCBhbHNv
IGJlIHBhcnNlZC4NCj4gPiA+IA0KPiA+ID4gRml4ZXM6IGM3NDlmMDU4YjQzNzEgKCJVU0I6IGNv
cmU6IEFkZCBlVVNCMiBkZXNjcmlwdG9yIGFuZCBwYXJzaW5nIGluIFVTQiBjb3JlIikNCj4gPiAN
Cj4gPiBUaGlzIGlzIG5vdCBhIGZpeC4NCj4gDQo+IEl0IGlzIGJhY2t3YXJkcyBjb21wYXRpYmxl
IHRvIGVVU0IyVjEsIGlzbid0IGl0Pw0KPiBTbyB3ZSBhcmUgZmFpbGluZyB0byB0cmVhdCBhbiBl
VVNCMlYyIGRldmljZXMgYXMNCj4gYW4gZVVTQjJWMSBkZXZpY2Ugd2hlbiB3ZSBzaG91bGQgZG8g
c28uDQoNCkJhc2VkIG9uIG15IHVuZGVyc3RhbmRpbmcsIHRoZSBGaXhlcyB0YWcgc2hvdWxkIHJl
ZmVyZW5jZSBhIGNvbW1pdCB0aGF0DQppbnRyb2R1Y2VkIGEgYnVnIHdoaWNoIHRoaXMgcGF0Y2gg
cmVzb2x2ZXMuIFdlJ3JlIGFkZGluZyBhIGNoZWNrIGZvciBhDQpuZXcgZmVhdHVyZSBoZXJlLiBJ
ZiBiYWNrcG9ydGluZyBpcyBuZWVkZWQsIHdlIGNhbiB1c2UgQ2M6IHN0YWJsZQ0KaW5zdGVhZC4N
Cg0KQlIsDQpUaGluaA==

