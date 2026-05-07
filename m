Return-Path: <linux-usb+bounces-37110-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMwtI28W/WlIXgAAu9opvQ
	(envelope-from <linux-usb+bounces-37110-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 00:47:11 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C234EFE3B
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 00:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 31D77300CBF6
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 22:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5943612F6;
	Thu,  7 May 2026 22:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Rui9t8ow";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="czNZYLch";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UiER83Zw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A417E2F8E9F;
	Thu,  7 May 2026 22:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194023; cv=fail; b=g7kyalYKEgqoAagRadCebpOFeqCZ7mAbjGPr3EPuKzHsdZ8utdOqtNkd4yFdLGMiZCMjIPSNrqMYeYja0h3l9IPZM1IWoLtLQiAN6TsCopp7Y4aO1t6OyWj/jmGTr2X4BLmDw36thN6l38L0QQwxlw4QKvLWQnDe1VUeqaAUr3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194023; c=relaxed/simple;
	bh=VYebjTrcF0UsiO5My4eBmNC6Axz74nFhMtZ+zDHC+7w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cvfzBPb3b1M4Ozm+hmOUX7MAUQ6qUsBUz/wezy+BpoSvufUJktOLW4+rGuQdDqxPf/OHwNzpVoteRIMGvHTKYuuDCH0CEq3zM+jSQ+k5qjSVb3l7Joz/JYrfpt9WWjcqs64Nsn2joJwJHcKUC8JDlIkXptOoATCqnZSZRuoEq4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Rui9t8ow; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=czNZYLch; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UiER83Zw reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647MdXPa179240;
	Thu, 7 May 2026 15:46:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=VYebjTrcF0UsiO5My4eBmNC6Axz74nFhMtZ+zDHC+7w=; b=
	Rui9t8owvPbXNlpVmyb17+oNGUX2kprf5/Igco/FpySQrp7glAwQBK5+4Y2ijD8b
	5UGCJnFwg7z54sAliYUCGmjqHqhPIQ7UZLbjtaYoDXpwTq6mlLFXOycUQWIsB5bP
	9xcktNaibds17w3ZJbVLZcJTSbViXCVDzPyRLXLr/USXAFMydpVbjiQ0M5oDzIj1
	Xgf0hpKe1trSz2XNfbF5MZugcgzgsBJAhlZDAQ5Z8dTIXoYLigUpFTpUQEMLZwQQ
	kwrCav9EFAaZRP6LwKq30ejmFdV9KUzfw9FLXx1U6ksCevAWraTzEt39C7JSY4GH
	ejBY4tggi5RTw+uT+oiE0w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4e0xdsta8y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 15:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1778193975; bh=VYebjTrcF0UsiO5My4eBmNC6Axz74nFhMtZ+zDHC+7w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=czNZYLchgZ/9bv2gJMNQPps7ayRUNOXzorsOD3tAKhJCLc2flS3eKC7+F+qIs0LFo
	 Hw+twc/Qn+4BciCJ3TPHPU3e/tKusVBIEvG5eHizBO8XKKLAxgasJYNXSuK+f4JFtO
	 3mw5PHbnj9imtxjHi39KBgHixoEhhLZyP2bbMhyjriStCzbYDRR0jUd13KgWUSs2tC
	 stF4P7X7r9rQiXJco4VOE1ZsNJoPUt6g3pCWd0M5HnuI/DuuUZJqv+ciXP3NXgUH1Z
	 g2LVCxByTojkccm3XgvigqncWGKcXtgk+5e48EoLjaqJek60hgjM7DwWPmlyMmJIk/
	 XLro9hYhJEGFg==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D0C1940520;
	Thu,  7 May 2026 22:46:14 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 82715A009E;
	Thu,  7 May 2026 22:46:14 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=UiER83Zw;
	dkim-atps=neutral
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00400.outbound.protection.outlook.com [40.93.13.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8C1F122010A;
	Thu,  7 May 2026 22:46:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqKAQtf4cmweSWh2dBvWMQg6hj71QRbE18jWDwhtRWkTI7rU+zcMgOJgDQNuGnaVcqivwvGYuM7DQ+7FiOXfuo4xDQ3Jd7Vw8iAMbE7yAl04lEhbBmvHP0xD05pUQggtQmznOjsZhPPwFkm5VgB51yWUUqPXHINrVsl8C9sytLEIomOFoJM4/+sRp3bgYkfoaJUwYc1tLnEWD96YVE/3L0dYQfvMAkMd1jrT5cCBFd0WpW19JXqBbFdUBB0qS9uqKq94xPKWp/0o7KZdHIqVDm70BEq+525OmtFhl8pQGJXATq9Ves1WxnXGbBClwSIC1YXqS5l8ZDh8PfZFkM3nIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYebjTrcF0UsiO5My4eBmNC6Axz74nFhMtZ+zDHC+7w=;
 b=Q+sHROKjkLjoahU7Q6f5A+e0j1E52wyx+CpP8Pa+jtC8opPetHIAdN7pXegErdgYzJhpTt5gTdAlkGFVqBelGkrbUnhmY+9zdcUG/rhTrGBmkG7wZazH0PIF6943/Og9akFJR3B7YYvuUVVkZjFL959FOoz9l88iLOTZ5EaqZOeyVn1pRVXdwtI786/VjWPHuWBXLVMk74cyZYSYq69BBgSeEYs/cnH92QjSKnJSRsUHxIY3S8eD7EZQRgaqeXYm2PokFXKjzGPYy+fI0VC+007Gx7P9TfbTIwNtRwZUByXKnePKk0H9PuIN6tGyN7miIZka1aguvdV5DxBdZX/EPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYebjTrcF0UsiO5My4eBmNC6Axz74nFhMtZ+zDHC+7w=;
 b=UiER83ZwL6HszCwRLcyW8GgOO33L+CB72WqMMf9a81KgYoDxPZk/AuXGTXCBmoQSHuOh4qdSmxGBm9aJ1qq1j0xNdY+JdObeodIy1soghM76ilCQJh5uoHEGH0CBlA1Kp/PWCA2cgtsdjnwZsXH6Km4pfXr+0fa0AADKxmmYdl4=
Received: from DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) by
 DS0PR12MB6464.namprd12.prod.outlook.com (2603:10b6:8:c4::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.18; Thu, 7 May 2026 22:46:09 +0000
Received: from DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::2062:8c19:8492:2691]) by DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::2062:8c19:8492:2691%6]) with mapi id 15.20.9891.017; Thu, 7 May 2026
 22:46:09 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jack Pham
	<jack.pham@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
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
Thread-Index: AQHc3GzqfUjaf13lmkyktxAm9F4Ko7YBqo4AgAC23ACAAHigAIAAU7AA
Date: Thu, 7 May 2026 22:46:09 +0000
Message-ID: <af0SM3C5qHc73DM8@vbox>
References:
 <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
 <20260505-topic-dwc3_tunneling_state-v1-2-4aaa6c3c14cb@oss.qualcomm.com>
 <afpyvhadqZw0xfTB@vbox>
 <1163a026-03b2-4860-a422-eb276920b4aa@oss.qualcomm.com>
 <afzP+uoUALSji95Q@hu-jackp-lv.qualcomm.com>
In-Reply-To: <afzP+uoUALSji95Q@hu-jackp-lv.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5984:EE_|DS0PR12MB6464:EE_
x-ms-office365-filtering-correlation-id: 49ca8d71-8d04-47fd-0b1e-08deac8a6ea7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 ouGgaCSfEZhCgak4dyFIC/0p+oxLnkXV2sNGBnd10h5BaaH9RSIJ5RGZQvB6+FHzULoleSRaMBnv/R3PC49zF1sWLliBJg4hn9R7u5sw7kcjiSJYkmK4AAnVpH6LDA4QJQXbF+6VAPyrOHZQa8Rn1SlHDU9FfDW1TcOWemZBovBrLIpPyotCoA+QPp6fhL8vHZ1+CsccdFTbkDzp7TgVMR7z6pFxBtVYjGMZWNdbZpFXBqSriIvTewiZ8wrpuMj+kB4PHeM0flztUDHSpfMLoscNfU3GLz/cPqrw76PcjmYcNzstE5sXgoWEOcCRvG6YnDuTb/AjwVi/5mSPYNNIhiMVTpPiO1Eekko9nX/gKZsvnDMQri/qhiOv3awyIIDPaAS7LWh5M7XBu9jwjCy/gnChCShXN13fF2EZgTFVSGSKDAEot4lXb1tONPuPD6i2aPTk8Z2EvsyWJLr+gPWeHG+3uedopCp1IElG2SaU7w8ePwkCGsFSLUeGWifcNZCE+g5guudZ+h3x7EzJXA1kB6T78YbXz4/88wecXU7rwfCVa8GVTrvWdqf3/s/eGcyJVWBvkw5V9w9cZw4pOsaVp7z/QY/MQLgA4K+JVfiUcTQMVRgpXCgccnEtjWI+aMifu0S0A4j9XrNQbaQBJjKciOLic8p2E/veLFPzuARsADhXhjwkxeD1k73WN3RY4n7oKswvoSA8zJ8ZMQnwStCqCS9eAerNK1NEQUUMq1ayZIoAjoKFdDXTpYh/E4yFmTdd
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5984.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dXVWN0FmbllTaEIvbzM3TXFhMHRyaTY5MUQxUlI2amtBRERXVmRWWUJaVmp1?=
 =?utf-8?B?UU9PYm14L05zd2xla3VxTVFRVU1JVE92bEkyeUxBTlpPNCtLaTB6b3pJcm5T?=
 =?utf-8?B?Unp0cUY2WHZJajlzWFZKQXRzNWhyQlZnTmRva1BiMmtVWUw2WmR6Qzk0S3VQ?=
 =?utf-8?B?aDNFbHV6Q3JxakZoVnFzK2VRcXlLckxrYmE4RVpvRmc0Mlh0R0dPR1J5TUlQ?=
 =?utf-8?B?VnhZZ01kOE5pRGlnU0FhRnpKbXRFQjZRSEltL1VJeTdLb0JJSCt0WHZRVTNv?=
 =?utf-8?B?T2UvaTVkeFJYTEc0N0x1YTdtNzdZYWM2bWtWQld0S3pzejdaZjlCd0NWN0wv?=
 =?utf-8?B?ZDc2SlBPdDh3NzFodlEwb1lQYlM3alRuUmhUNmUzZXJ4SDVUKzJEa0tsd1d0?=
 =?utf-8?B?TGcrUjVKd1ppNFFmbTFRTmhVemJXVnNTUFhwSGhUSDYzenR1d1RBbTJKR0xl?=
 =?utf-8?B?Q045ZnQ4L0pxVFlWa20yTVJ0U2hiUGxlOWZUcG5idWFMbnp3ZDE0V1cwSzNt?=
 =?utf-8?B?YmNFRStwU01NMkxMRE5XeXhQMWV1Y2J5NzZtMFFQUFpjRm94RW53VVJ3bHh1?=
 =?utf-8?B?amFrZW1UQ2poVkFSenZON1Q4RjBGOHloM2ZtYXBkak4rd0l1SXd3ckNpSE96?=
 =?utf-8?B?VzJRMWNGVk54eUJ0aTI1eVZ1VzhtdzdoeVhUemMxNWVNNmVaanJLSWVrb0h2?=
 =?utf-8?B?ODh2R2Vnc3htV1ViY2taT2pSMzNHM05UOXdSeVpXajBGV3YwdTNjaXNjS3Zy?=
 =?utf-8?B?Y0dUSjB4RGNScGtKWHRXLzBxL1d6NWRiYTNWQXhzTFliejAxaVZCa2krZWIv?=
 =?utf-8?B?WStTSHNCYmNqTitGbGtWaVBvOHgzQ0dxVzdhdmpEYm9SdHlpZ2dVTDhDSzlo?=
 =?utf-8?B?cjJOS0czV01iMldLaUFvYXBqZzRRUzFJcTF2cVhWT1VJMXdvZWk5N3NSRHVy?=
 =?utf-8?B?c2xybktBWWY4dkxJclhaZ1RCTzBYWE5KUndscXZIRmlnMXBxOGtzblFtWG0y?=
 =?utf-8?B?SHE2UGxTcFl4NnVtSDV1SGJXWk84bTJTMGlyalJ5V0orRGF4eWZ6QVkvbVZw?=
 =?utf-8?B?YVhHN2hJbmNZckVVZ1ovbCsrU0NSK1AxZXNJano1RzlRNFlQTThucTdmQkxj?=
 =?utf-8?B?OUs1ZFNKRVRQZktocEp4YzdMZkdhSXVxWmN1MWxxRDhEOVRzYW90UnZremVl?=
 =?utf-8?B?WmhrV3F2VFhEcUI0MktqMGZiZUxZWVhqWnpVODVjTERUSU1INW5CNmZSL0R4?=
 =?utf-8?B?eXhMb0RnSE5iOWVsTTFjaUhnNGo2V2U2OEgrY0lIcnlPQWZETGhUZUNPK2p2?=
 =?utf-8?B?ZFZ5amhwZjFkbC9ibGQxQWdYT3ZUZ05YRkN2UWNSYndBZEdYdlFVNmVNT0xM?=
 =?utf-8?B?OTNQTERkTEdvSFQwblhONG5aUU10VGx5a1JyN0FLVThyTE9UUndTdVlGbldG?=
 =?utf-8?B?VGNNalVQZEpmcFYvZk5Nd3JqaFpnREh0L0JycjJ6dVBsS21jNENrSDZxY1J2?=
 =?utf-8?B?T216L3Vyd3BYUzBEWHdoRHdudkdOQVFtQUNuZzlVSlM3WXhQY3paL1lrUS8x?=
 =?utf-8?B?VmpqOTZ2MEdQSGlwN2YwdXhOSHFIVlpkdFdGN1crNjlmblNtKzBYRDNsbjNz?=
 =?utf-8?B?VFJudjZsM1QvVGd6aTFVNVFZQ3NUanZ3eVEySUhYK1doRDViaDM2SUU1dVlC?=
 =?utf-8?B?N0tDMU5TS3hld2F3bWY3RVVvWDhQd2xMeVRlcFVvVmFrZmo4RFJRRS92Wmw5?=
 =?utf-8?B?SjdWVmpVL1BFMjJkZ3E0WS9oOEd1cmdzclB2ZjluazB2YnVNU0F5cEhmNThy?=
 =?utf-8?B?YmJ1RFdmUVNmN29BeVVaRU9CTkNCd3hXejhjcDFMMEFia1lWU3lEeFd1K2Er?=
 =?utf-8?B?d3RoeVcyQzY1SEs4NEkzaFBlemlsMndxR2I5UXdPNmplUzV5Q1ZZS2hNQkNH?=
 =?utf-8?B?MzlLazZ2TDE3S3FGMWF4NFJTelpFUGxPRlZSaW1tMUZjdnRlS0p4YnhJMjJJ?=
 =?utf-8?B?SFFIOURPUjY5UWdOV09sbXU4YjY1WjdxRzB6Zngrbm1lMkFJZEhXK2xPb05z?=
 =?utf-8?B?M0FqcllTTU03cXQyRmlYaHdnNUFJQk9MOXZ2bFhGdHVSRjhqQVpYdTB3bExj?=
 =?utf-8?B?cHpmRWp1Mm5SeHBHYzVRdFd3cDNwUkVwS2hDdGxIUGsxQ2MyckFnOENzeE5p?=
 =?utf-8?B?TVJVbWM1a2tvOWhLWmlRWFhvMng5Y0IvK2lKOGl1TnltR2hNd2tWeFZFcmFG?=
 =?utf-8?B?a1pVcFI3WVM2aWpRcnBER25nWXc1L2R4eVpHU2NrbEY4bU03RlJTQm9MQVc5?=
 =?utf-8?B?Ky9ZbTQ4cUEvbkIxUEd3bk8zd2U1eFhGZlE4UGkyeFFwR1NKcDZjdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81796C6C0DB61646BA1E930C166EA309@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	jLOJsUPhv38HK7BD3xgZ8rF/26PYCmKmXUZaMk09fBt3muaocwlpvjXDAnyDQba0nOMZ7750UAq0GowZd6HodxFGkTZ3pSLwM1t51RZffOcMGrqaStdujABcbnJg2ifgO0LLt/Yp4kd3TPoe92KBBt1bSSWeNxgD/5tDSn/5vok8K2vRyGARe2zoGx4xh5NuZPyLskFqsLK6AEr0+8e2vJN5BrqhFQSic++jwZ3A/CCYa426votygunrkvlNBdI3aLFXLAo5PvdEvQKNrLP+Q1Meq30idCFoIm1bhNZpQe390ENUAmNYcTdlxmiE3sl9kGuRAGDXHFpZoWnY5jkKWA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wCuWKVkGA59XhH1syAId3YzNm+t7CGY3GVgPlFIHhvqIPom6P908X3VrBFq+CnerKX/GG/xVqN5I9q8xv1AbfSXCH5XOBz3Ojor9z7QSNwlMmgH7fV56HJEY1vSbPLjdxCYO6sDFQGOvIHkhv42U3Ombsef0RQ1I/KE3H40xENU41VtXGh3QT0U2vIAIHq3DFCvBqHAfvMvxAS1GR1gt4sGUFr6wGmH6I1goSYoUPV7TDCKpruAukt2h1W38jKsqoMngwpcexjKyap+GrInKkYXI72o869feCA703kQVVtCG9dmo2DTiFLH1JnXmDtDu/iPnBNAfoP7fN4y2s+kOJXwtMO/AFybl9Cu4JBDbIDpkQCnCwB7GpooRaoFN15E+J/PD25Lky4jli+yxxFABBOw/hrMrC+Lc3qI/HhFFdiyrUnGkVTLvtHq9/l2eUIGcl/z+NMIgC18Redw06nYJFXGopOaGv5noWFrqqWA9Av5W24dxdIVuduv3blCLMeIsra+tPvGmUn2i1KUigfkKbchw3OQHkcEuxSVRv9KL88oyEVfaduW2BD7KPzRnklueQiYXOX2iD1a6BmabdFHaInWP4CwM1cTrFm78gsPv743uy16/8n9BiFSW2PNA8ZbJehOHpjA4rOCjpmWJ9lbQXA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5984.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ca8d71-8d04-47fd-0b1e-08deac8a6ea7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 22:46:09.4784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oz3Fm+zaDr5Jjl4hl7iFjPfebr87r3800R1ZEnqQW6U0UT7NhsS4KLsR4ikN1h6KxAeMGm95mMvx8zQi9AizFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6464
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMSBTYWx0ZWRfX4h7nXj2qiW0W
 ykf4D4dXjRBMWNV7z65tlRK3CgbsJFOYnRxQ7GriOQRzMHdI/GND2b5nHEcsirsYc/m552HyPMF
 GDeXbwOEkTU3xVn4i5N+aSGxOgVrW0RftqYG5scaAQx7lbeTENyw3HjgqLw7XncLexsOSZGgkxp
 FdT2IIlMe7XTkxyAPIZ51KFu+E7whQp593AcpO2XppEigZOTLALmLh34XNhU7HAYwvwExp2zhIg
 i3Xg+h0nd4ti9HxXNtirYHhHhO5mpmiiGEWq1vT72XB320/1Q5QsSNmcWifXKbUwcIMRvrbTpfW
 7Urofs0Y7kLBY8csLRilP4PEHTOgAMYitHup07L/Ek2WshLnKys3rhbFga1gkJNMfPYtIpS98mM
 4t0meN6labUzzXykRmn0YnJw3YwdbYdd8FKhdjP+Yg6nB7qa3r3stNU0l6WPxN7+5hKYRboO84x
 Tie+o2AKzj211UhAI9w==
X-Authority-Analysis: v=2.4 cv=R/8z39RX c=1 sm=1 tr=0 ts=69fd1637 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=EUspDBNiAAAA:8 a=JCFyygCdLs-1IILk25QA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: QoHE6cZ4aiZ1IqoDrsp-q0BJ_R2QSnK6
X-Proofpoint-ORIG-GUID: QoHE6cZ4aiZ1IqoDrsp-q0BJ_R2QSnK6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2604200000 definitions=main-2605070231
X-Rspamd-Queue-Id: 86C234EFE3B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37110-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,synopsys.com:dkim,qualcomm.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

T24gVGh1LCBNYXkgMDcsIDIwMjYsIEphY2sgUGhhbSB3cm90ZToNCj4gT24gVGh1LCBNYXkgMDcs
IDIwMjYgYXQgMTI6MzQ6NTBQTSArMDIwMCwgS29ucmFkIER5YmNpbyB3cm90ZToNCj4gPiBPbiA1
LzcvMjYgMTo0MCBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+ID4gT24gVHVlLCBNYXkgMDUs
IDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+ID4gPj4gRnJvbTogS29ucmFkIER5YmNpbyA8
a29ucmFkLmR5YmNpb0Bvc3MucXVhbGNvbW0uY29tPg0KPiA+ID4+DQo+ID4gPj4gVGhlIFRodW5k
ZXJib2x0IGZyYW1ld29yayByZWxpZXMgb24gdGhlIFVTQiBjb3JlIHRvIGNyZWF0ZSBkZXZpY2Ug
bGlua3MNCj4gPiA+PiBmb3IgdHVubmVsZWQgcG9ydHMsIHNvIHRoYXQgdGhlIFVTQjMgY29udHJv
bGxlciBpcyBvbmx5IGtlcHQNCj4gPiA+PiBydW50aW1lLXJlc3VtZWQgZm9yIHRoZSBkdXJhdGlv
biBvZiB0aGUgdHVubmVsaW5nLiBUaGlzIGRlcGVuZHMgb24NCj4gPiA+PiBmaXJzdCBrbm93aW5n
IHdoZXRoZXIgYSBjb25uZWN0aW9uIGlzIHR1bm5lbGVkIG9yIG5hdGl2ZS4NCj4gPiA+Pg0KPiA+
ID4+IEFkZCB0aGUgbG9naWMgdG8gaGFuZGxlIHRoYXQgZm9yIERXQzMgY29udHJvbGxlcnMuDQo+
ID4gPj4NCj4gPiA+PiBTaWduZWQtb2ZmLWJ5OiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lv
QG9zcy5xdWFsY29tbS5jb20+DQo+ID4gPj4gLS0tDQo+ID4gPj4gIGRyaXZlcnMvdXNiL2R3YzMv
Y29yZS5jIHwgMTIgKysrKysrKysrKysrDQo+ID4gPj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5o
IHwgMTggKysrKysrKysrKysrKysrKysrDQo+ID4gPj4gIGRyaXZlcnMvdXNiL2R3YzMvaG9zdC5j
IHwgMTIgKysrKysrKysrKysrDQo+ID4gPj4gIDMgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9u
cygrKQ0KPiA+ID4+DQo+ID4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5j
IGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gPiA+PiBpbmRleCA2NTIxMzg5NmRlOTkuLjdj
ZWM0OTExZTI3OCAxMDA2NDQNCj4gPiA+PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0K
PiA+ID4+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+ID4gPj4gQEAgLTE2Miw2ICsx
NjIsMTggQEAgdm9pZCBkd2MzX3NldF9wcnRjYXAoc3RydWN0IGR3YzMgKmR3YywgdTMyIG1vZGUs
IGJvb2wgaWdub3JlX3N1c3BoeSkNCj4gPiA+PiAgfQ0KPiA+ID4+ICBFWFBPUlRfU1lNQk9MX0dQ
TChkd2MzX3NldF9wcnRjYXApOw0KPiA+ID4+ICANCj4gPiA+PiArZW51bSB1c2JfbGlua190dW5u
ZWxfbW9kZSBkd2MzX2xpbmtfdHVubmVsX21vZGUoc3RydWN0IGR3YzMgKmR3YywgdTggcG9ydCkN
Cj4gPiA+PiArew0KPiA+ID4+ICsJLyogUHJpb3IgdmVyc2lvbnMgaGFkIG5vIENJTyBzdXBwb3J0
ICovDQo+ID4gPj4gKwlpZiAoIURXQzNfVkVSX0lTX1dJVEhJTihEV0MzMSwgMTkxQSwgQU5ZKSkN
Cj4gPiA+PiArCQlyZXR1cm4gVVNCX0xJTktfTkFUSVZFOw0KPiA+ID4+ICsNCj4gPiA+PiArCWlm
IChkd2MzX3JlYWRsKGR3YywgRFdDM19DSU9DVFJMKHBvcnQpKSAmIERXQzNfQ0lPQ1RSTF9DSU9f
RU4pDQo+ID4gPiANCj4gPiA+IFRoZSBDSU8gcmVnaXN0ZXIgYmxvY2sgb25seSBleGlzdHMgaWYg
RFdDMV9VU0IzMV9FTl9DSU8gaXMgc2V0IChhbmQNCj4gPiA+IERXQ19VU0IzMV9FTl9VU0IyX09O
TFkgaXMgbm90IHNldCkuIEluIG1vc3QgY2FzZXMsIHRoaXMgcmVnaXN0ZXIgYmxvY2sNCj4gPiA+
IHdpbGwgYmUgcmVzZXJ2ZWQsIHJlZ2lzdGVyIHJlYWQgb2YgcmVzZXJ2ZWQgYmxvY2sgc2hvdWxk
IGJlIDAuIEJ1dCB3ZQ0KPiA+ID4gY2FuJ3QgZ3VhcmFudGVlIHRoYXQgaXQgd2lsbCBhbHdheXMg
YmUgdGhlIGNhc2UuDQo+ID4gDQo+ID4gVGhhdCdzIGluY29udmVuaWVudCBiZWNhdXNlLi4NCj4g
PiANCj4gPiBbLi4uXQ0KPiA+IA0KPiA+ID4gV2Ugc2hvdWxkbid0IG5lZWQgdG8gYmUgZG9pbmcg
dGhpcy4gVGhpcyBzaG91bGQgYmUgY2hlY2tlZCBmcm9tIHRoZQ0KPiA+ID4geEhDSSBkcml2ZXIu
IENoZWNrIHhIQ0kgc3BlYyBmb3IgUE9SVFNDLlRNIGFuZCBVU0IzIHR1bm5lbGluZyBzdXBwb3J0
DQo+ID4gPiBjYXBhYmlsaXR5IChzZWN0aW9uIDcuMTEpLg0KPiA+IA0KPiA+IC4uSSdtIHNlZWlu
ZyBvbmx5IGNhcHMgMC8xLzIgKGFuZCAxMCBvbiBzb21lIGJ1dCBub3QgYWxsKSBhZHZlcnRpc2Vk
DQo+ID4gKEkgcmFuIGEgZm9yLWxvb3AgY2hlY2tpbmcgb2Zmc2V0cyAwLi49MjU1KQ0KPiANCj4g
UmlnaHQuICBUaGF0IHNlY3Rpb24gaW4geEhDSSBzcGVjIHdhcyBvbmx5IGFkZGVkIGluIHRoZSAx
LjJiIHJldmlzaW9uLg0KPiBIb3dldmVyIHRoZSBEV0MzMSBJUCB2ZXJzaW9ucyB0aGF0IGN1cnJl
bnQgUXVhbGNvbW0gVVNCNC1jYXBhYmxlIFNvQ3MNCj4gYXJlIHVzaW5nIGFyZSAyLjAwYSAoYW5k
IGEgY3VzdG9taXplZCB2ZXJzaW9uIG9mIDEuOTFhKSB3aGljaCBhcmUgb25seQ0KPiBjb21wbGlh
bnQgdG8geEhDSSAxLjEgc28gdGhpcyBjYXBhYmlsaXR5IGlzIG5vdCB0aGVyZSwgZXZlbiB0aG91
Z2ggdGhlDQo+IENJTyByZWdpc3RlciBibG9jayBleGlzdHMuICBTbyBzaG9ydCBvZiBoYXZpbmcg
dGhlIHByb3BlciBYSENJIGJpdCwgdGhpcw0KPiBpcyB0aGUgbmV4dCBiZXN0LCBub24tU29DIHNw
ZWNpZmljIGFsdGVybmF0aXZlIHdlJ3ZlIGZvdW5kIHRoYXQgY2FuDQo+IGFsbG93IFhIQ0kgZHJp
dmVyIHRvIGlkZW50aWZ5IHdoZW4gaXQgaXMgb3BlcmF0aW5nIGluIHR1bm5lbCBtb2RlLg0KPiAN
Cg0KSSBzZWUuIElmIHlvdSdyZSB1c2luZyAyLjAwYSwgdGhlbiB3ZSBjYW4ndCB1c2UgdGhlIHhI
Q0kncyBjYXBhYmlsaXR5DQpyZWdpc3RlciBhbmQgUE9SVFNDLlRNLg0KDQpDYW4gd2UgbWF0Y2gg
dGhlIGNvbXBhdGlibGUgc3RyaW5nIHRvIGNoZWNrIGZvciBDSU8gY2FwYWJpbGl0eSBhbmQgaGF2
ZQ0KdGhpcyBwYXNzZWQgZnJvbSB5b3VyIGdsdWUgZHJpdmVyIGJlZm9yZSBhY2Nlc3NpbmcgdGhl
IENJTyByZWdpc3RlcnM/DQoNCkJSLA0KVGhpbmg=

