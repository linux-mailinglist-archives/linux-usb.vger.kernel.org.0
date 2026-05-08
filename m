Return-Path: <linux-usb+bounces-37166-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BdlCJZz/mnEqwAAu9opvQ
	(envelope-from <linux-usb+bounces-37166-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 01:36:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F4D4FCD1B
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 01:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA3713037E54
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 23:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3E6363081;
	Fri,  8 May 2026 23:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Wnx5P5vp";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IF4AUFc3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BNa0Ovh7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866FF3624C9;
	Fri,  8 May 2026 23:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283131; cv=fail; b=cqebVpCosCkmQxSGtpjKS+ev6Q+2Xn26AwWE17Z82Hex30U1Tah4QV8K0fESw/MnkJTsy5hPvD+tUcjIHOyXFLFjoYgAeZy1X07UZ4BCWjzHom/2C1jM/cVU4QNJURbU5yw+CKlJpRUYgBbz+N/dVmA7Uc3Y9j//1L9bttwTH6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283131; c=relaxed/simple;
	bh=DYuIKFmBKMxrxGk/d0DGBsfhNVEQNGKffMlAOoFcdK0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FJ0u8H1X9GI8T7qY9zLzl+n82j3yIwE0AbsxcJ3NyQ1VyRwiXmxa6noafck8XyTIFP0Q6kq5/VFT1xbEYhL/qKjVChu7OGcDdeXQiDqH0ypf+xCXq9OnN53IgeRSWXDasnPkP53mmRxqAe1xRXhqxLSdVxng2oTA1vzvh63RFn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Wnx5P5vp; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=IF4AUFc3; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BNa0Ovh7 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648K0LD52184851;
	Fri, 8 May 2026 16:31:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=DYuIKFmBKMxrxGk/d0DGBsfhNVEQNGKffMlAOoFcdK0=; b=
	Wnx5P5vpG8m0+gA0Y6l153TI/CyGSycDtoVTzbs7yNMHrDUBw76uv4Gfd4OdVm/9
	f7XEDdAdfK7kyGFFkoFxzKvxxNpsp/zwDBD1FzKdu+crUuZpBP5h/MU5H5xeWFle
	st5oudyphsbPvhFwMbvcUzbxQIOp9Jbkwk2iBA51CHs+7DxVuPiy3RIKWxz3HLsL
	roFTupjNPzZrWS1CDXIYptAy18XXHuSU8eibMBqGXFlOXYQOCg/cbTFJNOHDmCOt
	+kcblTELjBLr+0p9C8UT9JgtfMukmV2a0grEgPSrOXi2UGgQ3V9CN6Nw2T1XGWIh
	IP++izXA8wT7fTvsFvjo6w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4e1be0w3sm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 08 May 2026 16:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1778283073; bh=DYuIKFmBKMxrxGk/d0DGBsfhNVEQNGKffMlAOoFcdK0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=IF4AUFc3LaDP16kcb4f7d+O0wcuo2wkTZUPhdZHsIqxibMxt3CshZIo+qXJwaCZqp
	 We4EXS99IM7ybHEzDcQQWipY3phnCY8LYiovFWyj8VjDaO9prqFQRqq05nQoRyKFke
	 J0QRH5O+Dhi55ii+mQHnGPZEBdXWLGYU8wyeEokl8J0ePCI5rrdlWFtXEyaJCoe2zX
	 QokE0yDbUkf+T3UIHLMUa4piKTk/ypRQqlE2LMr0+DEbYZ5uf2qBsQECjIYICcQ+5o
	 I/c2NxosFvkUHYeqCQtsPeaPQep/AV25rPV63Sp+0GtMAYUuEkuQ6atPWBxIazXBu8
	 5sQvmN5rAtZJA==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 00D60401FA;
	Fri,  8 May 2026 23:31:13 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 90087A00AE;
	Fri,  8 May 2026 23:31:12 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=BNa0Ovh7;
	dkim-atps=neutral
Received: from CO1PR07CU001.outbound.protection.outlook.com (mail-co1pr07cu00106.outbound.protection.outlook.com [40.93.10.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 69D7340AD3;
	Fri,  8 May 2026 23:31:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=usDGjkaMKwzHILnZ6+dK5qm30zMobGOQT3Ff/3crZ8+G1tRPbdn7lb8JIvIYK73jceshkoosxM0x1UavkMMvto+FGQckxdxu9ElnYtsctcLCl/rdDuygetZ/LXFDcvXEMTVCbK/Aoeu9hcs8/rPFAh9jFmvlG0H+1Dx1kbDYp9hDczp45I8Cpu//mxiYukOM70wFvb+1ImcQNNMHP0phqH5ai9atUr6qlfOet01Gz/SnTv6rVofov3ev1gT5QUv+J4bg4aB4Ev+R7NPD0hg4RVsBgSU7CnjX3Bj2qnycEoQWSHocVDtXC8oFa/FYGabUuJ6xFUxVCviE3svI4BfCug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYuIKFmBKMxrxGk/d0DGBsfhNVEQNGKffMlAOoFcdK0=;
 b=eoRLxe4NJ0rqsjeTa8LdRd+vL0UsQRVl4WLH67ei4WCc1W9NXWBV4Vzyv65EAG6xg46HqfRIY+xhOaVFV4n/89GxSLGSyaSu+hwi5vRJrYfmkhXhiXK+xuUO7+jGz5OvAF9MoTEW8KwtyMFoG5Zcr1NkezgRzoDy3KodjXWB9thnlRR2CEwqiFtJ086xBwut8OnSzmh6UlLMWXIz48okNZpd+OAsRGkaVRMqvRmwwgHMVvJ/A2tq38fuDLFU/lNoAREMEhbj81kUEdIZsimRlxqvNMOLtAOUQJRQE2OM7FbXBaE8NbSEOJRrovXX5iTa45NK0TFNoAqI8k3gQfIciQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYuIKFmBKMxrxGk/d0DGBsfhNVEQNGKffMlAOoFcdK0=;
 b=BNa0Ovh7PzgDiftQNfb+4deWp0R3f0qupg8xxhT78QAnxGYujo23l+Jbz4tJ92vr3Yxmxjmddcc9Tc2YR/BzTt+ImCltLhz6V1HJtsnn2crvNG2OI415+zHPo/PP+M4G7YUvq2lhizf1oxNM+0ia9D2YDMSs99TBx0xs2Vyd0hQ=
Received: from DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) by
 PH7PR12MB6539.namprd12.prod.outlook.com (2603:10b6:510:1f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 23:31:01 +0000
Received: from DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::2062:8c19:8492:2691]) by DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::2062:8c19:8492:2691%6]) with mapi id 15.20.9891.017; Fri, 8 May 2026
 23:31:00 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 2/2] usb: dwc3: Notify XHCI core of tunneled status
Thread-Topic: [PATCH 2/2] usb: dwc3: Notify XHCI core of tunneled status
Thread-Index:
 AQHc3GzqfUjaf13lmkyktxAm9F4Ko7YBqo4AgAC23ACAAHigAIAAU7AAgADfCoCAAL/UAA==
Date: Fri, 8 May 2026 23:31:00 +0000
Message-ID: <af5sfCOfBa7mYqPw@vbox>
References:
 <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
 <20260505-topic-dwc3_tunneling_state-v1-2-4aaa6c3c14cb@oss.qualcomm.com>
 <afpyvhadqZw0xfTB@vbox>
 <1163a026-03b2-4860-a422-eb276920b4aa@oss.qualcomm.com>
 <afzP+uoUALSji95Q@hu-jackp-lv.qualcomm.com> <af0SM3C5qHc73DM8@vbox>
 <670f9a9f-54b9-4109-986e-5071caf1dcaf@oss.qualcomm.com>
In-Reply-To: <670f9a9f-54b9-4109-986e-5071caf1dcaf@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5984:EE_|PH7PR12MB6539:EE_
x-ms-office365-filtering-correlation-id: dbeb0fa0-397e-47eb-8210-08dead59dd0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 gd6Qdn3cS2mk2y4RKnkOVebOlQb2FyUoVqZQi9kQvkb3MynxPt1XySkek/yDrps8f/s3dNPvHoySzvrEbV+2QpwlrVMVHlgucagF5C1M+Auqi0bxhpQGbxPAEf8RXgh9d3gaZLVvqPDO+PpMkV9kTyWFj4xjDhRy/vEvZiI3v8WH1zQcAOReOKwoTtpW8g5qVcqgKjZ8t/wLC9ETFo3ICORsSoGPVvb6ObEyRp6qlFNRvH3UMkvuRjF/ccNxV5LhUZ1Q3CL3atnlvYSJJPm2M5n9v+UzG0HoviKva34GwE9GDREOfozZ9xZSBLQtKvCCDFXIAYrPn07tcZwveRSSWuqrJU3PPoUqH4o8AUmruF5xJ1smZqHqGG71zhvwlag/WM8eHFITMXkq7+32Du6GeQZDTnOqku5PEX6XQxV24umgm0Vc/txztvIZ6Ghi7dkM3KAx6qb1U5h97QLjfbr5eMbcwv7r8awIZUgAWO0RNTkxDzN90FxFw6D9E7zFsi5QbctNRptoCpKOD/zvaj7BTDLRR4W6Hy375TeVk0RvhdennXZD19Y8/ICR5LCESx76IMmBZ9J+FXtO1bwaYhZUpuC1Es6CH0MxNi36KPUwoY/XEocLTwCVkbPBxhCkXzYoxbYhxBr6Akn7aAbwDXHdDN97S+Pa774bVvOqjS2biitRm2ypmK9POWMa+6ORHzE6hCW3GW+mkvNuOY0HQANsyAji2gkkCCLQyxWzucB10ykfWvvrAqO2TWTCZx/yPkgW
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5984.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SGtzaW85ZXc3UnJyTW1nM0tneU5YbW9XQWdRSUdLYzhaazJqK2U0SUdiSm9z?=
 =?utf-8?B?UnBDLy9hd1BBbStYSEV4MkxZMHM2REJ2R3N6cGZmelhvTzdGZnpWS09IYXIy?=
 =?utf-8?B?NzVTQVd1YUs3V3ZIaTFudXVDTFZRUGtyVEVmOWJRY3JZSTFET0dDZ3lvYnRl?=
 =?utf-8?B?QWZJMTFURHJsRlVydVVjZHRzZUNTYXUwK2JCL3c5cUNZL2tpanlGb0djQTM4?=
 =?utf-8?B?ajdtb2dFeUhNU0ZZZ0VNaXhJOXQvU2hvYVNFeXpQVU11Z05WWEljOStYWTd6?=
 =?utf-8?B?eXdsUEVLU1BqUWZQSUF6MmZjc05UVGNwK0t6aDM1Z0oxcnhVUnJQb2NkOHBu?=
 =?utf-8?B?VHpaRTFlK0FwNjN5NXFsS0ZZVjV3Q1hoSmo0d1d1RWxnWTY5SkduanZWbEcv?=
 =?utf-8?B?bThxNVExRDR4cFZVMHNqeFlabjlnSXFHTjJESnVvNlIrNXFpNTJjVVh5UkNt?=
 =?utf-8?B?cUpvT1hiK0w5Y1ZKYjZaQzNvUVNLTHNvMW1SVW1Ydk83UHF1UE80aW42bEFn?=
 =?utf-8?B?czJmQTlTY1N3OG5PMHY1ZFVzWHc3b2NnclQwaWlZa1FMb2NjYXBaNUdFc1M2?=
 =?utf-8?B?MEdtRHRMVno1SjZEa3BBTW54VHd5TXZjWlpHWWpNV2h0elhScWlKdUx1Ukx6?=
 =?utf-8?B?SzNiU1liRTh1RHBNckk0bVgxVXJPSE9lblNKY0hPREJYbjdSN2tRQU9hUXdD?=
 =?utf-8?B?RmhPU3EvNS90cGx3Q09XS1k1UnBmVm53SzNGRHN6SkN5Sm50OU4wSnpxWlB5?=
 =?utf-8?B?QUJyVUtoRmtCZ1ZxMVc5N1RVMThxQVpIYkZsT1N4Q25FZDZQSkFXY3NheHQ0?=
 =?utf-8?B?ZTFMMys3YVVVOWVhc2JOMHQwUENyOUtqRjcycGZHaGdRSEduRytnOUJNQVJq?=
 =?utf-8?B?VmdEQVIrUzdSOUQ1SkxGZk9Mb082NGN3VDdtZnYzTm9vQXZKcGQwOURFQXVw?=
 =?utf-8?B?cFhYV0M2SVI4RDRNbXloaGdXQnFWR1cyN3ZkMWJoVFNxV05BS0VTNnZuTjR5?=
 =?utf-8?B?NTdXUG5lUzBadm5BazhpazlpUGRJYjM1bHVGUkJhRUJkc2F0ZXA2eVJhOUZa?=
 =?utf-8?B?Wk5yeHZkYlVVVEk3QTVIMmlRVDdDb0xab1ZGbnBoYTQwclJJSjZHcnNxZHlZ?=
 =?utf-8?B?dkl6RVNIWFk4RVVRWnVVNXlIODluUFlKekZLQ1JDaG15RGF2VFRaMG1Jekky?=
 =?utf-8?B?WjFVeVRtaFd5NHBCbkFtdXE0V090L0x3MFNxSi9NY3lSNmVCOUQyQXRaVzB1?=
 =?utf-8?B?amMxc0xjNVVOWWQwNEw3c0FuTnR5c2dVTmY2NHNlUWtIUmxhZnMvbXdOS3dM?=
 =?utf-8?B?ZHhJSHNoM2pWLzEzRWZkZFV1SlNIeHU2T2RhZFVBUmkvczZ0dVpMUUNHSDlM?=
 =?utf-8?B?RThjdnI1bVFWd0prYjZvYW5sK28wUHlTelNjbVJKUGQwbVFtWUtuMzVxSEw5?=
 =?utf-8?B?L25OSUsrcTE5THJHMU9vakdEZ1J4ZmVObHY5dVBKaTlncS9jd2FYdnFRYUJZ?=
 =?utf-8?B?d28xQi9qemNOQStTWndTd0w5Y0ZPWXplWk5SdlkwS1cxTXpaVHdHa1hUMi9m?=
 =?utf-8?B?ejBITm5yeE1Pa3pVNVJuV0JsKytodUx3Qm15TlhGbWY5d3Foczl3RTc3alVP?=
 =?utf-8?B?VGFaOVVRT2xOMWR6VjBYN1hOdmwzSnJtZHhPK0Jna1QwWVdRSzFoS2NGeDdq?=
 =?utf-8?B?NGVlVnZIWFlmck9DcFIxTmxjMFFQdW5pSlc1Rk5XcFNHTk9mVU42KzYvRWFH?=
 =?utf-8?B?OU1uaU80cnhzcmk0WEhqT1I3RXo0SXRsZkNsZWcvOGhRRkdldkVROElXR3A2?=
 =?utf-8?B?bTlDb1NtYllqajhZd0FtNXQyZ2E5Z1NrdXVoOVVZQXVSUUF3YktiUUQwekw2?=
 =?utf-8?B?L3MwNWJpREZYUmtsU1dNaW5uT3pqV1ozOUxmZ3JmSERudldhWXJ2ZlpNcit5?=
 =?utf-8?B?cHpFOFVCRHY4OTZmTlpDRXZjOFhoWEhlczcvSnE3dG9KWGxaVHVLRTZQOUZS?=
 =?utf-8?B?WHNZTVhhMjd5Y2lvZkppRU5rbi9WZzNDUWFtSXhNZzZDS0tnRXVkbjRvMzRZ?=
 =?utf-8?B?Uy9PVFcrRjF2bkxCK3V4RWlnQXJITXozNkFMckJRVVpReDhyRmxoNHV5cFln?=
 =?utf-8?B?bEplOFJzYy8vQ0tDVTZ3VjZ0YnBWNStob2RFamt1QWtOa2kxTTZYS2hyc3FF?=
 =?utf-8?B?bjhPZ0J6cklsK3dYSWFNR1c5UW1pc09aUEFxYXZheGZnazRtTUk0bEdZTnVx?=
 =?utf-8?B?dGl1Wi9nbXFMQk5kM2ZiNDd3Yk5pZlFaYUFtT0Rnb3Z5RzdmdTB1ektLOUxL?=
 =?utf-8?B?VlBsdzVVVVhZL3ZyUngyN1grcmVDUlBGbTVFLzkwaHJkV2hremY2Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <38B46B8627C70F47B760816AF956E106@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	A1xQ6evEC3rV2ZJuszdGTW/hFZUSNNmgpr3DSMKofKJO0ikJ8uT+o1d4c+QRbZIyMc+JWu3kDVK7wzZlAMqdhkZ5Gxw8iRe7kYz5QpvxP40Pfq4vRt4pejCN1/JFb3wxhAuk/DHVOBoYaUsiQY9HS3Cjb9Ak82nI0OG4cBCeLEMfRs7NXxtouwCdR9bDvb5uVIak/sLprQRP4gJjUOYgJNgmQAHoXnrvzEwaAO0Djp0qMkBFWqM09w7CdA9X5CKh8/+JAqAzb3TyfAf24B3IeK/gyAEtgqGtHvXQx2H1tTQZm6Vk37MpTBV2M8xVAfEkUVAoMV27mLGaitl+KGRjTg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qOX4b7ARP3rXfWuSf8dfspKltbwkT6IzaJ6J1dKxycgINUkT/vUrE/BJb/zPkMzSFCIaoN0EvoFG6nXnLqiYvC0xx8zTfPvNh1u0JL2C5bi7Xwzk/98/gPez8ppm8soF0GJwhIvVao0A2gKH5PapQeCEDe/Wlzb2KTSUOAeaAS0Bnovl/8tIV9Aqlh+JB54Qfaw8QZr48TGbfCL8+e0ctcidvRPgQKRhqd6TCzU7cJyvXXtR5NP+V21fc2GgxnO3krF9UD4KxEjhA4mhSREMjUhDLXJhFCc+1y2JzZvx6yIO5Tsv8/jKHguy6Qdr9ZoWVhgvbYk2NvhbVvDQVAA9qYld5/NaLDt5OmfHXyfZmW3IxdLgSyVOy6pDQ1QxOFPJvdjvDwlZkljcU52F0XlLxLzyuZ9DcndzpG7pISfajYiWrs/eusLYnbPdmtk8I0JwnsRh898Q9ftLm3gv7VRXo8vazeXYyUZJNcai80PWlVYYnjHx0yjrlDfQOZ9f2DHHw0U2I5si7SJLLsAiwsMgRivbDt34Zs5c6Jxw5kjvdAoC8Kj5Orht+34BGMfxS0PkItw9Z0U7Dl7Ga5suA6+oCA2kB2m6YiJHc+QdO2T2YYR/KPhpFq6RQvSwzjo6bXOER4U48LRvc5S4iZJU1O6aRA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5984.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbeb0fa0-397e-47eb-8210-08dead59dd0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2026 23:31:00.4306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YZtQYPuMti5mnL4XntUQLNrdCa5PEBwtxGQXwT/GjFYT+fq8CLhH6aqSmGmQNqwJPyeswy2G3wbdey96b3F/yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6539
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIzMiBTYWx0ZWRfXxoXQa4PkSCJ8
 5yxIbOD5Ca/PBctVkqbQhlgDoeqc7uYmUVzDPRXXqGwV7iHy5o7T4OrrpP2MS9DI0KzLU/aBiLh
 a5M/u7S4ahQCn7Sr4aBGIhJBD9XMpJUyO7S79qxF06s8sNVWj9HgUh9U+sn7qDdw4cKUK9q+Jc9
 Zf1Pegf2l8grcXk4GQ0fEs6nzt1j0g89XhXo9lxV5pMxwsqcaVxwZ/vTdW66R9aYkiIgT8D3mF5
 zu4mP1/+df7vtUOWBkeed/2SUqX4S5b8YqS41lDAnARUNthK8le8RCMKfUs7/os4O2oepCeILNc
 dbBtn2jIyLwvAwOhzWMFH2n3rlEZ5lXwPbbrchfwY8IWqPV80dFQUQlda7URHyoR0poirTSxeqk
 Ms8SjWIwGJW5N+4BGShmugnnAKzFJWfmG1EbNLg+L8nLB5wCXD7Kqj0dZu4hgoW7pmOP+WAJBed
 tA/myx7ti1Htgv6Ku2A==
X-Authority-Analysis: v=2.4 cv=DdQnbPtW c=1 sm=1 tr=0 ts=69fe7241 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=EUspDBNiAAAA:8 a=LEgqLGShCAaRJDzFdSIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Mb2tAFZb88O7_tsoSP-XHGe3rpgcjqxK
X-Proofpoint-GUID: Mb2tAFZb88O7_tsoSP-XHGe3rpgcjqxK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 impostorscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 bulkscore=0 adultscore=0 spamscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2604200000 definitions=main-2605080232
X-Rspamd-Queue-Id: 73F4D4FCD1B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37166-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,portsc.tm:url,qualcomm.com:email,synopsys.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

T24gRnJpLCBNYXkgMDgsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+IE9uIDUvOC8yNiAx
Mjo0NiBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIFRodSwgTWF5IDA3LCAyMDI2LCBK
YWNrIFBoYW0gd3JvdGU6DQo+ID4+IE9uIFRodSwgTWF5IDA3LCAyMDI2IGF0IDEyOjM0OjUwUE0g
KzAyMDAsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+ID4+PiBPbiA1LzcvMjYgMTo0MCBBTSwgVGhp
bmggTmd1eWVuIHdyb3RlOg0KPiA+Pj4+IE9uIFR1ZSwgTWF5IDA1LCAyMDI2LCBLb25yYWQgRHli
Y2lvIHdyb3RlOg0KPiA+Pj4+PiBGcm9tOiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lvQG9z
cy5xdWFsY29tbS5jb20+DQo+ID4+Pj4+DQo+ID4+Pj4+IFRoZSBUaHVuZGVyYm9sdCBmcmFtZXdv
cmsgcmVsaWVzIG9uIHRoZSBVU0IgY29yZSB0byBjcmVhdGUgZGV2aWNlIGxpbmtzDQo+ID4+Pj4+
IGZvciB0dW5uZWxlZCBwb3J0cywgc28gdGhhdCB0aGUgVVNCMyBjb250cm9sbGVyIGlzIG9ubHkg
a2VwdA0KPiA+Pj4+PiBydW50aW1lLXJlc3VtZWQgZm9yIHRoZSBkdXJhdGlvbiBvZiB0aGUgdHVu
bmVsaW5nLiBUaGlzIGRlcGVuZHMgb24NCj4gPj4+Pj4gZmlyc3Qga25vd2luZyB3aGV0aGVyIGEg
Y29ubmVjdGlvbiBpcyB0dW5uZWxlZCBvciBuYXRpdmUuDQo+ID4+Pj4+DQo+ID4+Pj4+IEFkZCB0
aGUgbG9naWMgdG8gaGFuZGxlIHRoYXQgZm9yIERXQzMgY29udHJvbGxlcnMuDQo+ID4+Pj4+DQo+
ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IEtvbnJhZCBEeWJjaW8gPGtvbnJhZC5keWJjaW9Ab3NzLnF1
YWxjb21tLmNvbT4NCj4gPj4+Pj4gLS0tDQo+ID4+Pj4+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUu
YyB8IDEyICsrKysrKysrKysrKw0KPiA+Pj4+PiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmggfCAx
OCArKysrKysrKysrKysrKysrKysNCj4gPj4+Pj4gIGRyaXZlcnMvdXNiL2R3YzMvaG9zdC5jIHwg
MTIgKysrKysrKysrKysrDQo+ID4+Pj4+ICAzIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMo
KykNCj4gPj4+Pj4NCj4gPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5j
IGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gPj4+Pj4gaW5kZXggNjUyMTM4OTZkZTk5Li43
Y2VjNDkxMWUyNzggMTAwNjQ0DQo+ID4+Pj4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5j
DQo+ID4+Pj4+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+ID4+Pj4+IEBAIC0xNjIs
NiArMTYyLDE4IEBAIHZvaWQgZHdjM19zZXRfcHJ0Y2FwKHN0cnVjdCBkd2MzICpkd2MsIHUzMiBt
b2RlLCBib29sIGlnbm9yZV9zdXNwaHkpDQo+ID4+Pj4+ICB9DQo+ID4+Pj4+ICBFWFBPUlRfU1lN
Qk9MX0dQTChkd2MzX3NldF9wcnRjYXApOw0KPiA+Pj4+PiAgDQo+ID4+Pj4+ICtlbnVtIHVzYl9s
aW5rX3R1bm5lbF9tb2RlIGR3YzNfbGlua190dW5uZWxfbW9kZShzdHJ1Y3QgZHdjMyAqZHdjLCB1
OCBwb3J0KQ0KPiA+Pj4+PiArew0KPiA+Pj4+PiArCS8qIFByaW9yIHZlcnNpb25zIGhhZCBubyBD
SU8gc3VwcG9ydCAqLw0KPiA+Pj4+PiArCWlmICghRFdDM19WRVJfSVNfV0lUSElOKERXQzMxLCAx
OTFBLCBBTlkpKQ0KPiA+Pj4+PiArCQlyZXR1cm4gVVNCX0xJTktfTkFUSVZFOw0KPiA+Pj4+PiAr
DQo+ID4+Pj4+ICsJaWYgKGR3YzNfcmVhZGwoZHdjLCBEV0MzX0NJT0NUUkwocG9ydCkpICYgRFdD
M19DSU9DVFJMX0NJT19FTikNCj4gPj4+Pg0KPiA+Pj4+IFRoZSBDSU8gcmVnaXN0ZXIgYmxvY2sg
b25seSBleGlzdHMgaWYgRFdDMV9VU0IzMV9FTl9DSU8gaXMgc2V0IChhbmQNCj4gPj4+PiBEV0Nf
VVNCMzFfRU5fVVNCMl9PTkxZIGlzIG5vdCBzZXQpLiBJbiBtb3N0IGNhc2VzLCB0aGlzIHJlZ2lz
dGVyIGJsb2NrDQo+ID4+Pj4gd2lsbCBiZSByZXNlcnZlZCwgcmVnaXN0ZXIgcmVhZCBvZiByZXNl
cnZlZCBibG9jayBzaG91bGQgYmUgMC4gQnV0IHdlDQo+ID4+Pj4gY2FuJ3QgZ3VhcmFudGVlIHRo
YXQgaXQgd2lsbCBhbHdheXMgYmUgdGhlIGNhc2UuDQo+ID4+Pg0KPiA+Pj4gVGhhdCdzIGluY29u
dmVuaWVudCBiZWNhdXNlLi4NCj4gPj4+DQo+ID4+PiBbLi4uXQ0KPiA+Pj4NCj4gPj4+PiBXZSBz
aG91bGRuJ3QgbmVlZCB0byBiZSBkb2luZyB0aGlzLiBUaGlzIHNob3VsZCBiZSBjaGVja2VkIGZy
b20gdGhlDQo+ID4+Pj4geEhDSSBkcml2ZXIuIENoZWNrIHhIQ0kgc3BlYyBmb3IgUE9SVFNDLlRN
IGFuZCBVU0IzIHR1bm5lbGluZyBzdXBwb3J0DQo+ID4+Pj4gY2FwYWJpbGl0eSAoc2VjdGlvbiA3
LjExKS4NCj4gPj4+DQo+ID4+PiAuLkknbSBzZWVpbmcgb25seSBjYXBzIDAvMS8yIChhbmQgMTAg
b24gc29tZSBidXQgbm90IGFsbCkgYWR2ZXJ0aXNlZA0KPiA+Pj4gKEkgcmFuIGEgZm9yLWxvb3Ag
Y2hlY2tpbmcgb2Zmc2V0cyAwLi49MjU1KQ0KPiA+Pg0KPiA+PiBSaWdodC4gIFRoYXQgc2VjdGlv
biBpbiB4SENJIHNwZWMgd2FzIG9ubHkgYWRkZWQgaW4gdGhlIDEuMmIgcmV2aXNpb24uDQo+ID4+
IEhvd2V2ZXIgdGhlIERXQzMxIElQIHZlcnNpb25zIHRoYXQgY3VycmVudCBRdWFsY29tbSBVU0I0
LWNhcGFibGUgU29Dcw0KPiA+PiBhcmUgdXNpbmcgYXJlIDIuMDBhIChhbmQgYSBjdXN0b21pemVk
IHZlcnNpb24gb2YgMS45MWEpIHdoaWNoIGFyZSBvbmx5DQo+ID4+IGNvbXBsaWFudCB0byB4SENJ
IDEuMSBzbyB0aGlzIGNhcGFiaWxpdHkgaXMgbm90IHRoZXJlLCBldmVuIHRob3VnaCB0aGUNCj4g
Pj4gQ0lPIHJlZ2lzdGVyIGJsb2NrIGV4aXN0cy4gIFNvIHNob3J0IG9mIGhhdmluZyB0aGUgcHJv
cGVyIFhIQ0kgYml0LCB0aGlzDQo+ID4+IGlzIHRoZSBuZXh0IGJlc3QsIG5vbi1Tb0Mgc3BlY2lm
aWMgYWx0ZXJuYXRpdmUgd2UndmUgZm91bmQgdGhhdCBjYW4NCj4gPj4gYWxsb3cgWEhDSSBkcml2
ZXIgdG8gaWRlbnRpZnkgd2hlbiBpdCBpcyBvcGVyYXRpbmcgaW4gdHVubmVsIG1vZGUuDQo+ID4+
DQo+ID4gDQo+ID4gSSBzZWUuIElmIHlvdSdyZSB1c2luZyAyLjAwYSwgdGhlbiB3ZSBjYW4ndCB1
c2UgdGhlIHhIQ0kncyBjYXBhYmlsaXR5DQo+ID4gcmVnaXN0ZXIgYW5kIFBPUlRTQy5UTS4NCj4g
PiANCj4gPiBDYW4gd2UgbWF0Y2ggdGhlIGNvbXBhdGlibGUgc3RyaW5nIHRvIGNoZWNrIGZvciBD
SU8gY2FwYWJpbGl0eSBhbmQgaGF2ZQ0KPiA+IHRoaXMgcGFzc2VkIGZyb20geW91ciBnbHVlIGRy
aXZlciBiZWZvcmUgYWNjZXNzaW5nIHRoZSBDSU8gcmVnaXN0ZXJzPw0KPiANCj4gSG0sIHdlIGN1
cnJlbnRseSB1c2UgYSBzaGFyZWQgY29tcGF0aWJsZSBzdHJpbmcgZm9yIHRoZSBVU0IzKzQgKDEu
OTFhLXh4eCkNCj4gYW5kIFVTQjIgKDMuMzBhKSBob3N0cyBvbiB0aGUgVVNCNC1jYXBhYmxlIHBs
YXRmb3Jtcy4uDQoNCk9rLg0KDQo+IA0KPiBBbm90aGVyIGlkZWEgd291bGQgYmUgdG8gYmFpbCBv
dXQgaWYNCj4gDQo+ICFkZXZpY2VfcHJvcGVydHlfcHJlc2VudChkZXYsICJ1c2I0LWhvc3QtaW50
ZXJmYWNlIikNCj4gDQo+IHdoaWNoIHdvdWxkIHBsYWNlIHRoZSBidXJkZW4gb2YgbWFraW5nIHN1
cmUgdGhlIERUIG1ha2VzIHNlbnNlIG9uIHRoZQ0KPiBwcm9ncmFtbWVyICh3aGljaCBpcyBPSyBp
biBteSB2aWV3KQ0KPiANCg0KRm9yIHRoZSBEV0MzX0NJT0NUUkxfQ0lPX0VOIHRvIGJlIHNldCwg
aXQgbmVlZHMgdG8gYmUgZG9uZSBieSB0aGUgdHlwZS1jDQpkcml2ZXIgYWZ0ZXIgZGV0ZWN0aW5n
IGFsdGVybmF0ZSBtb2RlIHJpZ2h0PyBIb3cgaXMgaXQgYmVpbmcgZG9uZSBub3c/DQpDYW4gdGhl
IHVkZXYtPnR1bm5lbF9tb2RlIGJlIHVwZGF0ZWQgZGlyZWN0bHkgYnkgeW91ciB0eXBlLWMgZHJp
dmVyDQp3aGVuIGl0IHNldHMgRFdDM19DSU9DVFJMX0NJT19FTj8NCg0KQlIsDQpUaGluaA==

