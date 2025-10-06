Return-Path: <linux-usb+bounces-28914-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AED8BBEE31
	for <lists+linux-usb@lfdr.de>; Mon, 06 Oct 2025 20:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F5F6189AEA1
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 18:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16EE27A444;
	Mon,  6 Oct 2025 18:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Q1CaT0Xe";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="f8OwbgKL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YfqDCyoa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C00A242D95
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 18:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759774036; cv=fail; b=GKrTeHRs4GlCppGRpr+C5gErDwYNhRcZDl0GRJWhJmity23vkr3EHiPTrJtTD56Az1V9qN2Fa9fkhO3fBBepxq8U0Ko7duIqqBjgxrYnupqeqRWUpCJ+VI6ZYWIqoRxyaOCRtEiRoJNe2eOLDS9bFkfsVgWRVrpUq35DrGUtb1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759774036; c=relaxed/simple;
	bh=NZT6YM+RMNuDPLyJ8CQJoIvGGGe1qHgS7+9UCo0cuEI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RORKRddguJDsqB6ksTmQTAQHikcI/+4UAybyN3rgE+O6KXGgc9YrQSYlxS9Epht6UTSW6r+3oxtwstXGLX2c1NhtgOk67CyO5xQGej35v0uqh7NFXoyhB11xOAxBp6nzeNCFXCT2T6Q5SqODvsfci3sYkrQ33tgMc6Y87cneqjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Q1CaT0Xe; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=f8OwbgKL; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YfqDCyoa reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596CgXKa015143;
	Mon, 6 Oct 2025 11:06:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=NZT6YM+RMNuDPLyJ8CQJoIvGGGe1qHgS7+9UCo0cuEI=; b=
	Q1CaT0XeLe7uIy28KCUPshf5K0ekAA2oopkDOQ6G24H943pv0M5mTDIXNWVunWFY
	+BcWa4eSMOMBjc3Ui0pzNJO6Exh6DaTb0IawkvIGLkOFO14Eikmk0k3DPxrip6f7
	DN8NaUFw53vjY86cdkL9AOh5/0Q8q61mrqTWjN25ExGITiCbXBmGJ8dCOfKCeSVa
	fUljIZkdT/rBRK83S6/ozUagord0LrETnbhBVYFQ6IKQJNFy/oiroM+l1y/DDsaC
	5g8BBpekBbCau4juBNh74tkFviNDzKDfUVKC59QQMXuVpZHnlIc+/m4R5ulqxcWK
	acIQ/k/OSYHcuKi8AuZ3qA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 49k2gsxs9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 11:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1759773994; bh=NZT6YM+RMNuDPLyJ8CQJoIvGGGe1qHgS7+9UCo0cuEI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=f8OwbgKLyBKEX1tAohqeyKgG9nWuer1/3PGFLIwsmEHdDJjJqdtUEOJvVgvgRYvIi
	 03J73P2apoKOrpwOyosTODguGdQMyQSZy/cD2tqMAr5qVyXSs2fs/dzUYalQR5QH/L
	 4xCOdJ6KraFZzOhw7cHxbAx9JH/ohzuoH1UhRk5WtFqqvMDmw7ByurffHUp5h8fIQf
	 V4IC+T/mLzNFe0H/EtL6hzL+VUddoB+Wmrc8WUfSMtPElCjEy5KSRsUgro26VDKe94
	 IDvTDZq/uh54NFrbE2AqAl9iMI9t2tc9AH0B6M5Cie0bEI/UTxrpRCQRQQSf4qCtgN
	 DMamhA5YLaQTA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 68B5740081;
	Mon,  6 Oct 2025 18:06:34 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 135E4A006B;
	Mon,  6 Oct 2025 18:06:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=YfqDCyoa;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00305.outbound.protection.outlook.com [40.93.12.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 15BAC40140;
	Mon,  6 Oct 2025 18:06:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8YLmtuM8HDUm0N6YxLVtyTtjSouzuMh3B5w08f9qpqW7rOqGWYWRCql/QKjeCbvOLrZHJjuAaTLAAKk03VlJWXoLtt8+O0G49AII7q3SGiEJrtqvZK/AMSsrTiLuRswNaXEKTcy/2TcWVKkLjWi00Yd69+Z0eyI+BtFTlGKRiz89RnW4PqySzbfTmwQx7phsu7OzCvYoOGmmMKmokirrO2iCcb1DOqPSNkXGRvw9RkdJSF11nLxXs/VSLTczWzk5hqtHNTu5V2yo8w0NUf+WFJdJnqW/riyUUNOHlXplX+x3Q+OsSrgTfRtyWMlbJcY5ms0sQvC++F3kjPXWEPm7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZT6YM+RMNuDPLyJ8CQJoIvGGGe1qHgS7+9UCo0cuEI=;
 b=OnjxbmDPwupAR8FzbaRq5zP5wOawMM73mpFqEW4DzsYL7j6EE6NhAFP83VdW/GJL+rmo22IzOvPcfroqLD+rs7aOmQ6iJPv+KZHf5hVZ2ZcqRSB0y42u+IZHLNkMn+u22grZC358RyOXVTCwcBC6XPRkiAgktz+nTjrZ/ydPteO4GFKQNXWrblvMu3kungK8unMjhhn97bHf3axvLU0J8L/GBr37PNRNMuNPpTTvNJ7uGU9GkiLJ+/isgAqFpx/LkqJSbQblXSGRiRtPIYKup0xW20hBQ2R/Qc6wY2P5rQ0bcZbJzQSu0mDGK9JI77U5ndRK/vCO4Dd48RLtX7YxoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZT6YM+RMNuDPLyJ8CQJoIvGGGe1qHgS7+9UCo0cuEI=;
 b=YfqDCyoar3vhJCnwW+WO1HmjR+JNxH+Vq43+p7PRnWtUIPAgPBK+pA8FoB8lvnDbuM/MxNMmomBPhhRD50QBn0LfltcKKODKMF0Pa77hGH4Wz83Azc8q7YrCVWdAQtXqDAKyfdundFqc3J8Ud+wXEOBlhO1Mw5+SLnQqA5oU0bA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB8547.namprd12.prod.outlook.com (2603:10b6:610:164::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 18:06:24 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 18:06:24 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Oliver Neukum <oneukum@suse.com>
CC: "amardeep.rai@intel.com" <amardeep.rai@intel.com>,
        "r.kannappan@intel.com"
	<r.kannappan@intel.com>,
        "mathias.nyman@linux.intel.com"
	<mathias.nyman@linux.intel.com>,
        "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>,
        "stern@rowland.harvard.edu"
	<stern@rowland.harvard.edu>,
        "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/1] USB: core: also treat eUSB2V2 as eUSB2 regarding ISO
 transfers
Thread-Topic: [PATCH 1/1] USB: core: also treat eUSB2V2 as eUSB2 regarding ISO
 transfers
Thread-Index: AQHcNuDGE8QPiMkyw0qs9HQVzZUqO7S1aggA
Date: Mon, 6 Oct 2025 18:06:24 +0000
Message-ID: <20251006180610.lhlzfeo5z6zxgekm@synopsys.com>
References: <20251006164500.131899-1-oneukum@suse.com>
In-Reply-To: <20251006164500.131899-1-oneukum@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB8547:EE_
x-ms-office365-filtering-correlation-id: 84310225-b832-4534-b16c-08de05030fe4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aXgrQ2lSejVZTFMrR2p0WFJOa1k3UXZOWHJGMSticXdTNmNNcUVMZFZ3YU80?=
 =?utf-8?B?WGVURnJhb0VyMUFLTnVzNHZCaW96dGZTQWRyeXZMMzBDTENaaFdONVVkNFd4?=
 =?utf-8?B?Qnlram5uczhhY1RYODk2RDhmaWpDcWdReUpyT25kaVJubWNZSEZEWDBqSXJB?=
 =?utf-8?B?bkMvWFU2U0VkU1c3bGxJVWQyWmN3UEYxaGNFVkhkbkVGS1o3WERVa3BlMlUy?=
 =?utf-8?B?WERjZUQyakd0YTVDNkRrb1gyL0tsYjJKRUZna0Zya2FyL29CN3p5eFdVcmsr?=
 =?utf-8?B?blVMSThHZ0UvVXBiTG4wUkpON0NvNERmc2kxVnhEbzlxQzd1dFF0UjRpRCtn?=
 =?utf-8?B?S2JKc1VCczh5aDlYOVhiL1RLR0l1U1cxSGNrdk12UEpHZDRCRm9Gc2pYdThm?=
 =?utf-8?B?NEV2SWNFWVhNeEhFcC9hNVlFYUU3WUVNUXBRK2dweFU1b21teFZhWFZHNE5O?=
 =?utf-8?B?STkvajI4aUJMbUlpSk9zQXlCZ3JLcHR5SmhqcS9rdzlCNXloQm5EdUx5eEk5?=
 =?utf-8?B?M2RadHl4SWV1ZEtwSWZFenJMeVB3YTVjV0V5VFNmejIvWWE5c1ZLYjVMZ013?=
 =?utf-8?B?RkRnS2NUQkxqaGJ1Y3VxK2pXUUx2M1FtV3ZadGtMQUY5cWdRd1IyYW1tVzdF?=
 =?utf-8?B?TzdQOXNZTUJqUFVtajdxamVPMklUUnlSM3lybDlRNzgva0E1MmtRNi9EeE9h?=
 =?utf-8?B?N0UrSEhLbzlWTlpURzdiWGc0NlRLcHJEN3ppVTNHajVrUjZlU3pyTXFlT2ZH?=
 =?utf-8?B?K3dwd2l3T2xra29MNnZkclI0MDNaM1VCREloa09ya2tSVzVNYlQ2UXRPSHZP?=
 =?utf-8?B?bFFGVVNMNTYvbGRGVkZjZFBrVGdVOTFIbHQrZ3I5NWNJUjNncUwzQWhWeE9u?=
 =?utf-8?B?bUlFa2NVM0dHTUczOWxLdHprMzNRVkZvZGYxU0VSZVRvbXllRlFNdC8ydkcw?=
 =?utf-8?B?Q0xkUXdFdDBlR0kwZ29JWVVsZFlLREFiYjJFNllvTU5CYU5aTmJMcUhwcVhP?=
 =?utf-8?B?blprU2pSUUkzU0hNUjlrd2VoaUFOTEh1TWJaM2J6S01XdURHTmZQc3RtOU8v?=
 =?utf-8?B?c0FzWm40S20rdEtOeUtma1BWZTZuZXRKZkE0QnJHUlI1aG13cFg3d2NzbVQr?=
 =?utf-8?B?TmFlRnhDS1JocHNtSm5sWnYrOVJySG1TdThjTFE4U1N1RTFJdiszRHhISjFE?=
 =?utf-8?B?ZWdvaEpaRjE4K05SazMwMUN2ZEQra0hjemtQay9QZWk1Z2N5KzU5MkoyMU5C?=
 =?utf-8?B?dXU0MGtFM3dWVDFQNHVBdWdUVVdpUFo5Y2VWOTgwckIwbGVGS3dmQU5ycU4r?=
 =?utf-8?B?UTZVOElaTnhZeWJLRXlsWUh2V0lpRkdRODhaWGFZNDVvVFNmd2huQ0tyY290?=
 =?utf-8?B?c0xaMmxZYkhlRUtGRmJnR00xMnFyUU5OR0tOa1hJMUdVMVhMaitidzU0ejVp?=
 =?utf-8?B?bTNtU1c0dkttTXh4Yy9NMEhDc2kvUk1lRndvemhocGU5RlpEaDVWeEYrL040?=
 =?utf-8?B?UXdNczVLSFJ6Ukx1bmhOMTc5M0lIL3FnaHdaSlRMUW1Kd2loSnAwSHZBTjJS?=
 =?utf-8?B?N2dmWVVRWXhIc3lKVmlvL0U2dXd0YU80eW14TVcrYTBaYmUzLzFNL3ZEWThj?=
 =?utf-8?B?ZzZvZkJ4UFhraU5RY0Job0VtYTZhZzZyK3dqS0hEVWJETFFpK2pDVGVqMVRq?=
 =?utf-8?B?cmZNQ1FxZWhBNTh6T2FjQUNEcjdBMm55L2pBeHZHZWFiNmN2YnFUM1IySFpm?=
 =?utf-8?B?b3pjOUx0ZDNIdFUvcVZMN3dRQjJRNXVNQ0NCeW52amtLYlZXSlV5ajRhZG1h?=
 =?utf-8?B?RHFkNEJDWTZwODU0aDIvUVVTaVdFd3JKSDJ4QnIzMlJCc09DcS9GUU0rblhi?=
 =?utf-8?B?U280eXBhQlE5ZmNsZVQ5cVdIMHY3Sk9VTnlaMEVPMmh5QmFudGwwL0xDSGJH?=
 =?utf-8?B?N3FZazVocENjT2FCMWRMNU92UUYrTU5tQmMxV0x3V2pFbUwzeURScWQ3NzRy?=
 =?utf-8?B?L0lSa1BBMzNBQzdVemp2UVk4SXUwcmpuZmQxakRrU3MxVVJocks4WG9qeGMw?=
 =?utf-8?Q?r00b41?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bjZIZXFhYTlGcllmTWVzRU43d0VXRDdCVVlGTVJ3dHphVmVSMEtlcC9ZYVVp?=
 =?utf-8?B?R0J4a21vMEdQN0FXYm4yUWNxeWlOUzgwM1RCN0tqeFFjdUFUZFBCYlR0cER1?=
 =?utf-8?B?QXBjandLTkIycHRoRE5hVCt6d3VqeXYybFpTZjAvb1RaYklnNkU4KzJlV1Jx?=
 =?utf-8?B?S0ZOM3RENkhXWHBtNHlBdGliODJHTmthVWUrUGdZY1E0bkJKN1d3cWYveEFs?=
 =?utf-8?B?b2Eyc2lCL2t2Wnk0MHpjajlvUkRRM2t5SHFrR0RubjFyZWJnZlJ4eXlBMDN6?=
 =?utf-8?B?b0ZPNVdleG5hYlk4MkJaTmQwVHlHVnVFdU1oQ1lEeExzbzVZN05Tb214MmN3?=
 =?utf-8?B?dTVVS0FyOUFCRW84a0tSQ1pyaVFnc3lDYlUvUlJmWG5ueGg4RmhIckI2c2h3?=
 =?utf-8?B?dzZ5akM0andXbWFaeE9WWjBsWW9PZ2RqUTh6ZTNWSExUNThhRUNheXJNbHNS?=
 =?utf-8?B?OWFFcFRKNU5FUUMwY0NXbGFURUdPeDRoMG50VjFnblJGQjlZYnd5alZ3VTNM?=
 =?utf-8?B?UlQ2UmFBSXoyRGNydDYwOUtqL2gzVndNMGhkanNNaVNlZkZ0bFFzRXdQYlNU?=
 =?utf-8?B?VEhWTXBKdzZBNzIrb09rc2tCeEtFVFhXOEl4TTlDdzkyWTlodWdySGpVUElI?=
 =?utf-8?B?c1BlZVNZemRha3ZHTWZ2d0VubW5RMnVOWWpTL2hqM09FcmV5T1AvZ2pKcm5X?=
 =?utf-8?B?b28zM3hDam00WG9Ta0tzTjR6SGhoNDBlQVRyTkdXaXlOcklxUGVENUZra1RK?=
 =?utf-8?B?MTFUd1RaTitGcFVvSmxqMUVhT3JtLzR3ZGJvYnNtS1NaNGM5SHVDVW5DTGJB?=
 =?utf-8?B?QmJsWWtzdk5SR0FlcnEzRlFQa0lDUTZ6eUtiWTllNGxxR1F6SlI1TVRjUkZ5?=
 =?utf-8?B?ZUd2cks1bGZ0R01vLzNJUHloTW5KUkVVa21OdGZsdjI0VVNFREozUnNzTnMr?=
 =?utf-8?B?SWRVeFQraVBpRWJYMlc4Z1hOdllCRU1vUGU4enlFdmhpSGdHRE9nRGVtOU5t?=
 =?utf-8?B?WmU0RTNpeDR5cEFkNElHdWhHN2hKWDdSSC8rZWd2THB0dUZ5WkZKbDJMNWpC?=
 =?utf-8?B?cXB3OExkeWRVOWpsdE1XSzh6dm9Wd0p5Ym1kM3Bob1h1YTVUUFI4NmVmTE5z?=
 =?utf-8?B?dlNrSzRabEczL0tHck1LNmczL0lNWS9GR25Ta1ZHY00zYnJrVTh4LzFhZGxo?=
 =?utf-8?B?cHJTcXViT3NmU3E4dmxObkJqOFVRTjBxbkZkd3ZSTkpweGZpYitYV2xxb3Fv?=
 =?utf-8?B?c09qSjFZV01MVWZNdUVWVGNxVVFRT1drTVA3NXFsNnJvcGJBaVFydjU2SWZS?=
 =?utf-8?B?K3RrRUp4eW5QOE55OTQ2TzZwMmo2QnV0aGR0c041NlZsZHJqMkRKblJnbWc4?=
 =?utf-8?B?MXBwV2xOaHBLbmp3MlFCTVhjQ1h1SEM0OXpEeXNzWjNNQVU2NThrZ3ltU3RF?=
 =?utf-8?B?OXR5ZGp0SVhlSnBXWXZWOVptUE4yK1c3WTNCSzlYdHk3b2k3UmQyLzhvM0U3?=
 =?utf-8?B?bSsrZEg2ejRIWFpaL1NHUVhJUS9Jb0FvK0dKNGVqNkM1clVIaEJ2WDZwcyth?=
 =?utf-8?B?Q1FKK05aNlFBVVA3Vjl5ZU5od3VneGdvdWlOV2pNS2l2NllOeWhWUDkvem9o?=
 =?utf-8?B?V2NRTkVqUVRoMld2ZERIYWY5K1Q4djRLalVpUlI0T0gyOTRBUkNJaFBTYXlI?=
 =?utf-8?B?ZGxqY0hzS3VPak5vLzZab29jcVpSMU9tNXNrTVVEMXBxSWtqSTBFUnBQaXlN?=
 =?utf-8?B?ZGkvNlExU1l6NFZramkzMUo4L3ptaUxFV0ozSVBid2krUUs2aW1nYXRUbjNX?=
 =?utf-8?B?MzZnT293WVE4M01Qd0p1bWFZY3hjWjBoVXR3dytuWEsxM3A1TzQvcURwMmhh?=
 =?utf-8?B?VkZxZFBsOW9mRXpGdVlWL0d3NzB0TnQxYldzVkN3K2ZNbXpnMWcvRlJ6emlJ?=
 =?utf-8?B?MXZnWW1RdjdmV1FtYlU4dVk2cWxxaGtTbUlKcVdEbGNITURWTWsyb1pxeXlT?=
 =?utf-8?B?WC9uOXhSVFljRW9hdWw3MEVycUtyd0FBSnFtVlUzWDV3a08rSmVnbWwxMHl5?=
 =?utf-8?B?OU1JclhlWVJOd2JKWFpxT2V5TGo5RDk5cFd0d1NNKzNMWDU0amgvVFVoNEZY?=
 =?utf-8?Q?KS1X9BMhn/lDKa7HXZg5s/U65?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1CAB3729F5AE14EB699D86F335CB0CD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nd7aLndBQvFv2ZSiPjnX3jCUtiF7xIvRCcs+yJQ2EnAR4m+JZjK+Y/zADLv5U1d8LqJnc1termpbd8Zwnu2hnKOQBFfOZizFkorK2EiiQ9W2ivijXhJ2H9cQGgwfDaWX1EBsszEbHWPg7pGpUSzQ5rLSDZdfq+Uc/ghtTWi4iDqrMFesKzA4ho9IGBLE5dwQLU76eTVBE5b6HacnIgowElpw8U+UWBGyYJmgqS8FhpUPIta6JQJqwXqiquYQcr4mv8tf34txSAUlVsA/3NhVKpZo72m+a06OrVOJH4Eo3SyM0fBPS3NPjvBCbabIEtnNmcvup9VgiJ7If7+l9sTmzEqtmj5Ty6zyzVBdImRGZrNW13gNMrJAMS4EiXz9hiVit7C0jPmrKZTCFLztnHlzkZH36epnPvzXNmO2e/FsodoxsX3FLZhgvx02hHzhSiePFBfz1ufTnLgNEerNcPzhoHP526xqzWeY6uuYUP/TJFE+YMaHpUF/LbwcxsPj5c1eKb2fA8nv4TMmKhS//xC+uXt2TKgrK3OnGUGbDZbaIm0ykR++0CLZ57k2tlMNITcUlf4e/qDwssRF2mqO/iK5EDSQFqzjLy7EM7EEucLjODWn5i7e+I0bw+PgEatxUVBJgeFYfi4q2lWKQL0W78ViVA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84310225-b832-4534-b16c-08de05030fe4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 18:06:24.2235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nUGqucP95XBcuWk0DYNymYxHgtYrPHjTNjTQXpIf83eTse4dLpG5AgAEGViFXnNc3MkOhUpU4md8SBbkbKjy1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8547
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDA5OCBTYWx0ZWRfX15gyd4bp9ow3
 Fuc7RL4xCxmQeCUXy1/+WuWFnTn1WopFdv8cSoPuKHk6+g+8eQ7zLMc7PEKyxL1crf8QvGJ02JI
 rq7U7GuO0IY4DGtoibi+IFJg1Ewzi7tIUVzu6m8RgKzVAgVVqVwx5zylIJTZrcxC0KHOYerEbWm
 uk6poQ1b9xjw6yvKkfCKwu12dzOuAKPjMurSiJEdP14zItiHigwdVKONQ9+RkS2LQlKPQ6aCxoN
 prX91mo3nUvZ3VHBxAk796QEMW/WoD5oB4HcKgb6XgSBi4AIetJejk3c/SFx3JYgxBthN/HKi+G
 Iuh5n1hksQhosC4oTM/lOowWnYGp9HlryyFQzd0bgNOKlZei5NKnB+Gt7CWaLCjKMKgLzAi07G+
 xKBoARdkFCrfinzHNWd8zqGxSeNK2g==
X-Proofpoint-ORIG-GUID: YlbJQlZ0J7MZzq4eI5jo3GbSW_TV9PLe
X-Proofpoint-GUID: YlbJQlZ0J7MZzq4eI5jo3GbSW_TV9PLe
X-Authority-Analysis: v=2.4 cv=SsWdKfO0 c=1 sm=1 tr=0 ts=68e4052b cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=qPHU084jO2kA:10
 a=iox4zFpeAAAA:8 a=cMjw7f-1WyiHI8TE8_cA:9 a=QEXdDO2ut3YA:10
 a=WzC6qhA0u3u7Ye7llzcV:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2509150000 definitions=main-2510040098

T24gTW9uLCBPY3QgMDYsIDIwMjUsIE9saXZlciBOZXVrdW0gd3JvdGU6DQo+IGVVU0IyVjIgZGV2
aWNlcyB1c2UgYSBiY2RVU0Igb2YgMHgwMjMwLCBub3QgMHgwMjIwDQo+IHRvIGlkZW50aWZ5IGFz
IGVVU0IyIGRldmljZXMsIHlldCB0aGVpciBlbmRwb2ludCBjb21wYW5pb24NCj4gZGVzY3JpcHRv
cnMgbXVzdCBhbHNvIGJlIHBhcnNlZC4NCj4gDQo+IEZpeGVzOiBjNzQ5ZjA1OGI0MzcxICgiVVNC
OiBjb3JlOiBBZGQgZVVTQjIgZGVzY3JpcHRvciBhbmQgcGFyc2luZyBpbiBVU0IgY29yZSIpDQoN
ClRoaXMgaXMgbm90IGEgZml4Lg0KDQo+IFNpZ25lZC1vZmYtYnk6IE9saXZlciBOZXVrdW0gPG9u
ZXVrdW1Ac3VzZS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvY29yZS9jb25maWcuYyB8IDQg
KystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jb3JlL2NvbmZpZy5jIGIvZHJpdmVycy91
c2IvY29yZS9jb25maWcuYw0KPiBpbmRleCBiYWY1YmM4NDRiNmYuLmM5NmVmNWU5Yjc0ZCAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvY29yZS9jb25maWcuYw0KPiArKysgYi9kcml2ZXJzL3Vz
Yi9jb3JlL2NvbmZpZy5jDQo+IEBAIC00NTUsNyArNDU1LDcgQEAgc3RhdGljIGludCB1c2JfcGFy
c2VfZW5kcG9pbnQoc3RydWN0IGRldmljZSAqZGRldiwgaW50IGNmZ25vLA0KPiAgCSAqLw0KPiAg
CW1heHAgPSBsZTE2X3RvX2NwdShlbmRwb2ludC0+ZGVzYy53TWF4UGFja2V0U2l6ZSk7DQo+ICAN
Cj4gLQlpZiAobWF4cCA9PSAwICYmIGJjZFVTQiAhPSAweDAyMjAgJiYNCj4gKwlpZiAobWF4cCA9
PSAwICYmIGJjZFVTQiAhPSAweDAyMjAgJiYgYmNkVVNCICE9IDB4MDIzMCAmJg0KPiAgCSAgICAh
KHVzYl9lbmRwb2ludF94ZmVyX2lzb2MoZCkgJiYgYXNudW0gPT0gMCkpDQo+ICAJCWRldl9ub3Rp
Y2UoZGRldiwgImNvbmZpZyAlZCBpbnRlcmZhY2UgJWQgYWx0c2V0dGluZyAlZCBlbmRwb2ludCAw
eCVYIGhhcyBpbnZhbGlkIHdNYXhQYWNrZXRTaXplIDBcbiIsDQo+ICAJCSAgICBjZmdubywgaW51
bSwgYXNudW0sIGQtPmJFbmRwb2ludEFkZHJlc3MpOw0KPiBAQCAtNTA3LDcgKzUwNyw3IEBAIHN0
YXRpYyBpbnQgdXNiX3BhcnNlX2VuZHBvaW50KHN0cnVjdCBkZXZpY2UgKmRkZXYsIGludCBjZmdu
bywNCj4gIAl9DQo+ICANCj4gIAkvKiBQYXJzZSBhIHBvc3NpYmxlIGVVU0IyIHBlcmlvZGljIGVu
ZHBvaW50IGNvbXBhbmlvbiBkZXNjcmlwdG9yICovDQo+IC0JaWYgKHVkZXYtPnNwZWVkID09IFVT
Ql9TUEVFRF9ISUdIICYmIGJjZFVTQiA9PSAweDAyMjAgJiYNCj4gKwlpZiAodWRldi0+c3BlZWQg
PT0gVVNCX1NQRUVEX0hJR0ggJiYgKGJjZFVTQiA9PSAweDAyMjAgfHwgYmNkVVNCID09IDB4MDIz
MCkgJiYNCj4gIAkgICAgIWxlMTZfdG9fY3B1KGQtPndNYXhQYWNrZXRTaXplKSAmJiB1c2JfZW5k
cG9pbnRfaXNfaXNvY19pbihkKSkNCg0KZVVTQjJ2MiBzdXBwb3J0cyBpc29jIE9VVCBhbHNvLg0K
DQo+ICAJCXVzYl9wYXJzZV9ldXNiMl9pc29jX2VuZHBvaW50X2NvbXBhbmlvbihkZGV2LCBjZmdu
bywgaW51bSwgYXNudW0sDQo+ICAJCQkJCQkJZW5kcG9pbnQsIGJ1ZmZlciwgc2l6ZSk7DQo+IC0t
IA0KPiAyLjUxLjANCj4gDQo+IA0KDQpXZSBoYXZlbid0IGFkZGVkIHN1cHBvcnRlZCBmb3IgZVVT
QjJ2Miwgd2Ugc2hvdWxkbid0IGFjY2VwdCAweDAyMzAgeWV0Lg0KVGhlcmUgYXJlIHNvbWUgZGlm
ZmVyZW5jZXMgaW4gZVVTQjJ2MiBtb3JlIHRoYW4ganVzdCB0aGUgY29tcGFuaW9uDQpkZXNjcmlw
dG9yLiAoZS5nLiBIU1ggc3BlZWQgY2hlY2ssIGJ1bGsgTVBTIGZlYXR1cmUsIGFkZGluZyBhbg0K
ZXF1aXZhbGVudCBvZiB1c2JfZW5kcG9pbnRfaXNfaHNfaXNvY19kb3VibGUgY2hlY2sgZm9yIGVV
U0IydjIsIGV0YykuDQoNCldoZW4gYWRkaW5nIHRoZSBzdXBwb3J0IGZvciBlVVNCMnYyLCB0aGlz
IGNoYW5nZSBpcyB0cml2aWFsIGVub3VnaA0KdGhhdCBpdCBjYW4gYmUgYWRkZWQgdGhlbi4NCg0K
VGhhbmtzLA0KVGhpbmg=

