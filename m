Return-Path: <linux-usb+bounces-33756-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO7GBO2SoGllkwQAu9opvQ
	(envelope-from <linux-usb+bounces-33756-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 19:37:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A0A1ADC69
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 19:37:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2527030D386A
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 18:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1D142848F;
	Thu, 26 Feb 2026 18:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="wDes4/zx";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hNrVmJ0b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Aa4vncML"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DB8427A0D;
	Thu, 26 Feb 2026 18:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129899; cv=fail; b=oNeUwhokLaTopVfoiJUYoXWuRXg0cy1+q2m847pSz2GETHrDRe+2jqyfFAXkoi3HfJQ+SyzcmLPRXj8aYw1tMmBoxJrLOALeuDwBGJE5zJY4BZ1wtxY87iSS64xKNF1zpwgi+Cql83OO8mOIX0g88R2bXRWNJYsL/KmlSBVaYlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129899; c=relaxed/simple;
	bh=T/3bN/zqh6VCmrceLjO9LPAkaC8ODmJyy2XmwaaRBTM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JLq7nRC5uAkU4Er3gKnViUDCAlftb83JAISZFWUYIs5Wiatf6geHX+NKGP55rwWyxQaqMX3i/UWTySds/db9oFQg1bw1KwlJeWTVx0jUuk6I9LK/FaOTOzXgnw1f+dYVNtPS0xIze31AZcq2tBPD0oE1s1PRFbzoWHjwnwsdEhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=wDes4/zx; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hNrVmJ0b; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Aa4vncML reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QHBjoV2760324;
	Thu, 26 Feb 2026 10:17:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=T/3bN/zqh6VCmrceLjO9LPAkaC8ODmJyy2XmwaaRBTM=; b=
	wDes4/zx6RPkbqC7Fl3kUs6Ij9suZd+v80bSPgw2vLlNMxBjqEqCgJKu6/P5WQcs
	yMCuPlelB4RUVn5TLj041SXful0z02DZrHz6OBfLD/6vB0PL0wjNJqS2cAQicfPP
	RWkwHpDgocFTbbcYSEGNFCIEd7B2fVwU4hhii61w7VEuhwUnC/2WRFVCpMnZCdfY
	IVWpums1zEqWiASDzjsk6+8OkC6uxQ99ok4a+Waealqi2VBDd4sskyCXuCrrKFqV
	i7y5rn4a+Ekzwr2oL8qyRk19Rhke9cOgSZDSLgUMrzLv4AmpPsUeLC4GSx3QVyOd
	iifz9YTarXLqa5b/v32SOg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4cjhktm6yc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 10:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772129853; bh=T/3bN/zqh6VCmrceLjO9LPAkaC8ODmJyy2XmwaaRBTM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=hNrVmJ0b3kKMXiVdBTEgBd8Nas7C9WB7shYdtt/8l6BKwL0+3O/S2TDN6uf27lkak
	 v8hkj6bMMBcYWKd3qwAFFMNxr0HAb4ELJbif3VrzuH3FaqUaN5iAVGbrZ5t1rxhGwN
	 z/gssII5AvFgpWGjhS1wCeA5dgTaIS8euGNceHtntOEc2/q9tSC6OWSvcSKvkJL+42
	 yDt1Ktxygdds/6TxYV92GXtRYAm9WXl2tZ0J3s9CNuz5tVQDGIkVihNDy3wH+V5q2p
	 docomX/z3Pjmebgp3ALuvsde2ZbK+IeReRQCnYkydd8+rLTCQJFgGZSDKtGqj23sUO
	 wY7qKdRNMQkaA==
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DB2F1401D3;
	Thu, 26 Feb 2026 18:17:32 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 8861FA00A1;
	Thu, 26 Feb 2026 18:17:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Aa4vncML;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00107.outbound.protection.outlook.com [40.93.1.79])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A003D4035E;
	Thu, 26 Feb 2026 18:17:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPpe4rsDaKQMr5NS1LhorfhCMQJcfsOBtEqcVy0VUV0uqkb//hoeEIhbXRqryqmhwhOTRURo5Y+gk9FFhNSrktsmOHk/vgRvTi4GHfHsRH0R87PmdMj+WiikXVXXjyOoPDdzcJlWcuqSYaOWrvtgN/Y2zz2kvf1xHIxF3vWiU9tocfbSJdlDor1NzsxfsUDFGZZvcwEfd28vuqTxpC2VN6e5nEvfYIBnbLNpiLHLwfEWw4/DBwxCbpnC8GHA1ztlyFWrLmb9VrwMVjkw6dBK7devchzpm9grTBRUc5hDg1ddk9ABU6jLegXpiJCsuVt6b+KARw1nMFChEUaOZ6eRJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/3bN/zqh6VCmrceLjO9LPAkaC8ODmJyy2XmwaaRBTM=;
 b=S1tZ6aAKJIzm5XVfFAs1+3oyZ/Z5IlQsJFFGUqk+mB6AG4nl8cgH0f8EGSgxoJ4WWReenAeeS/xutNW6qjeiAG4KtVkNSrl62DQOQ+un7KAIE0rmnOOHqYNO0IO3hnkQamR5DxyhqFY3qHSXHmx/eQAwqewbPBjnNcjgPq185e54LgZ9DyFiYhTdKRoq2sBsUgTAhx87eYmwssN1VumiKLw5xaf7tip5lx7CdgWOIoo2dNx7cZEyhIbT3daSogQ6HPq88NP4SQeiu/IwBrxY118BZYKFznWeYNUmZg22dOFJ0U/TC0THdxjbD4Ym0Vc/5HlB6OdEo2QMsmavt0+GzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/3bN/zqh6VCmrceLjO9LPAkaC8ODmJyy2XmwaaRBTM=;
 b=Aa4vncMLSl0k9uxIQDtvzo+B0mnqpZuXjHvVwV/BZCSoF2XfIjH4Q4r760ZlMy3A6qfEdVhsPblEicOXqm9FhAOyzgDnSXT+VJKVRhypF/CWR0F5grNKbd/RAOZQJSsnjf8W2Z2NAgGyh3TZ+qX8VcpnC8jJyS76s6RCg24ETYc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by BY5PR12MB4084.namprd12.prod.outlook.com (2603:10b6:a03:205::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.20; Thu, 26 Feb
 2026 18:17:23 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 18:17:23 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Dayu Jiang
	<jiangdayu@xiaomi.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman
	<mathias.nyman@intel.com>,
        Longfang Liu <liulongfang@huawei.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        yudongbin
	<yudongbin@xiaomi.com>, guhuinan <guhuinan@xiaomi.com>,
        chenyu45
	<chenyu45@xiaomi.com>, mahongwei3 <mahongwei3@xiaomi.com>
Subject: Re: [PATCH] usb: xhci: add xhci_halt() for HCE Handling
Thread-Topic: [PATCH] usb: xhci: add xhci_halt() for HCE Handling
Thread-Index:
 AQHcj33Mdj9vpu0YaEml411T+NyHbbVl34MAgAFnWICAAAIXAIAtnDGAgAB6GgCAABoMgA==
Date: Thu, 26 Feb 2026 18:17:23 +0000
Message-ID: <20260226181715.ofgjiq3iq7d7dx6y@synopsys.com>
References: <20260127110422.306711-1-jiangdayu@xiaomi.com>
 <2026012708-liability-sincere-5ed4@gregkh>
 <aXnNcQa5Ooq2wIX2@oa-jiangdayu.localdomain>
 <2026012857-deprive-putdown-0ee8@gregkh>
 <aaAR5VOtnMhvoCem@oa-jiangdayu.localdomain>
 <871991ab-6c8f-47d4-a5b4-b65751750e71@linux.intel.com>
In-Reply-To: <871991ab-6c8f-47d4-a5b4-b65751750e71@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|BY5PR12MB4084:EE_
x-ms-office365-filtering-correlation-id: 697ce740-20c1-4dff-f0d6-08de75634a00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 N+9H0pUB/LeilkBSe+vkaWegZCg33RzNDuZHc3Le9kEmelr5EWgeL6hL314PGEj6MDQMz63eoanX6EuooeyVyWg1uiC/Wq/a6satyX3UKMPEsogThSY7vQE0mW5//cFaCccL4xlO9uxP3H3Vcs4mZX6utq/fboeyDAPHQCPCzge7B+HhVl7h0X6Rg2t5htye+gx+NeOUMC80ypKY9WDzzbC5rJHjZr5Dqw65KdBLmfpoZJcNB8ZZDTCsabAFgZU3K4He2WLbfs2X44nec47a2Pgw0vH9nOKuvJhyUi44YA0YLSVXz2H3IrtCMsRMXYP4RQZvoMICa6tvc6w0egfMkxT3UwqCUNAqAwnP4Br/EK9Lldb2wZnkgRc4zwHyZh7nHGO3f37ZIuj2kqCaMr6O7eHLXa7OcSgqFdsNge9LJBeeVGytt06WNFgLIbfPwG80LpuWzPuESFL9mPltyHUbfmuLorSTOD6hQ89/pR1d8i5EDf9/eeG3ugdjRYipQgHuMrQliMkk6vDSDdOszZ/U3/J1Py+zdAh353S2ZWSZAAIssM1gOO73DhBInVarbtfZsUK/iMkOTZytDtgpCwbNfkxBGOvIAT6iQkP3czblUWuW5n/50nUGOowXp1gbSgnuYO6fC4pjAhXLo3DIxSc1w0FB8blWyv1sMBQUX3b5V4RE1NqcGuaakJtAjY9kY6WGrn6IAwmW/ECyNC8Iwlk/mbIwy3cXYS5sctpbpLBknLAZEqSMMw/M4louJVuC+n5D
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?djFLN3R6bjJTTEh1T04wY2ZuY0lPdTBENUFxdXpWV3NlUTJOWmh3N0hWT3Vv?=
 =?utf-8?B?UjFyV3Fxd0hRNFp5MzVTOHNkdkNsK0h5M2UvSTdEekVSWm9GVWhPamhtaEtn?=
 =?utf-8?B?VzUwRSswUjBhQUZ3bDA5cmdoSFBaNXdHa1A0SnV0bTNFRGtFV0Z5UUc3N1Y4?=
 =?utf-8?B?VXJMdDBRVWNlOGhTQ0FQZHFpRnU3YTdNTEVHVFpUdzdpTERXVTVHYnVmRWNn?=
 =?utf-8?B?OGI1Zm92cHp4ZGx5YWljY1hQV3U0UGdxTUhEM2QvaHBLVFlzS0dQUUNiRjVE?=
 =?utf-8?B?bFdUSlBrQlk1NUJhY2VhTXJ1c2lrVGxZb1JlR29XV09aaGVvUms1dzN6aHQx?=
 =?utf-8?B?cS84eFVvTkNzVElMVzRkVWo3ZlBTRVRsVlV4a0p2RUdMWVJDWVpmaWtoWkZD?=
 =?utf-8?B?enlLYk1YNWhHSzNJZkdMNEtIS2t6NFpEVXlDRGw5eGhVTmJyZUI0UEt6SnpX?=
 =?utf-8?B?T25MT2I1Vk54c25yZFY3TTZJRXJHOEFCUDRVckFDRk1YQ2t4UjVGQmNVbkRt?=
 =?utf-8?B?NElVdmt0MkZuUTkvWmp2b1pieWxGdWVObDVTbC9GYU93SDFKOWhQOHZMWkVr?=
 =?utf-8?B?b2Q3TitsS2ZucC9zTzRtLzZVSHlHamZhWUZiK1pEZkpBczFIMUdTTE1WSjNH?=
 =?utf-8?B?QmVUalFGRk0xeFdDSGViVWVoSjNuSTY0ak85czJITTkwVlJzaTF6RU1icDRV?=
 =?utf-8?B?Tm5zQVVOaWFCaEp3MDJvcHpEbXhhTmQvT3lLQW5QMk1CUWxwQnF1QUVnZGNy?=
 =?utf-8?B?TnNlSDNEME9MQjdncHl6dGpkWDFLSFhxNkNlMm9meTJHcnpNa1BNY0RPR0Fv?=
 =?utf-8?B?Q0F2ZldDZUJVeXlKaWpwclNqcU1TbllDaVNkaFE3T0h0N1JDVDczdkY5RTIw?=
 =?utf-8?B?ODc1UWFnOWRtdGxzd1VPdmNZcFJ6S3o4T2ZXWHBsRUkzQUMvRW8yOFRmVTBJ?=
 =?utf-8?B?VlJ5RXJHbkNWVzhURHJiTk9NaWJDam5ERktwZDZ5NG10OFU5eTVVVFFJSE1D?=
 =?utf-8?B?L1VncFNSekRYOGQyTWFuRmo1NkIyQ2h3ckNWVloyMlo4dTFIOG1XaDFRbENZ?=
 =?utf-8?B?UDNQK3dDanY3YmdpWDZJSk9tbUdMVEp3alBDZDcxOWFQNCtQTXM4a3JyVlNS?=
 =?utf-8?B?em5rWnNMZHUzLzJ6VW1hbDUzdFFjRUwrY2VCb1RjeEFXYVBXM1Y2VUtFQjBq?=
 =?utf-8?B?N0d5R0kzczVyRGpKWU56ZEN5SXRnOGxQZDJncGQxYTUraGhpNDB0QThBWWRZ?=
 =?utf-8?B?NTNKaTN4cWFYMmRpR2hnZ2h3ZkRKU1dRQUhieDJJeWJRWkw2Nkp4dG0wbmFJ?=
 =?utf-8?B?cHpDU2JGVTNWMjJHUVNrb2pFMGJmclVyNDMwdGpJRFlHQTBudnRqOU5sTU1V?=
 =?utf-8?B?cmRvekdCUzdEZXVNbGpON3NsL1JSU21EQ0xFYS9PQkpOWEJkUlN6Y0hzY0Nv?=
 =?utf-8?B?WTVDR0x2a1VEOU9rN2tMS3lwV0dzMGVBNlJrZ0lwZ1Y2cFQ0S3QzcDFDU3hQ?=
 =?utf-8?B?SFlzVGw4bUVrTCt4UzFrc2lsYVNLUzFKdVR2U2twRjBLZjJXdCt2VVRsWXJ4?=
 =?utf-8?B?WUxZZWNEd0JnRkRIV3JNSzBBQ0d2UXJxODRQZ1FFUzI2Ri9uaGRlTDBGblp2?=
 =?utf-8?B?aEladU1aekRBdzcyNWg0blNQbEVHR0xBQWlhU0JWRlh1L2hsUVlaL0pMazhD?=
 =?utf-8?B?UG9YS3lHZ0k2bUh6bFN1Q3p6OS9EU1dLQ2Z1RnZHUlVQMnRpQ0o0Ym8xYWlH?=
 =?utf-8?B?THZkc2dtZmo0Z2h0elBMeW9yU1pMWXZrbEhDTENOYTlwY3ZsKzBIV1psRU1j?=
 =?utf-8?B?OXlEb285VVZxNjhUV2lEWDJsTFI2V0hpVVdUOWluUnpRV0ZIdGs5Q0xQMVN0?=
 =?utf-8?B?U1BkaDVyVTE4L3BKM01PWGt1WFBnenZZK05MYUsxd2xOekNoUy9kNXhuVlB0?=
 =?utf-8?B?bFNxVWVCVFkvTmtCejB5cUs4WmZLbjB2bkR3Vzk3M0l1Z0JybGRZNmZ1bWI5?=
 =?utf-8?B?S0xNTHZrd3NncVU2NXNGQkFtZXhsazMxYkhrdVdQTGI0bklubGI3a1dNc3FM?=
 =?utf-8?B?MXpoWC9LSmY1aUx3TkNoUEd2LzhqNGxOaVB4ZVlqTXJDT09HN3paQWYzeDJu?=
 =?utf-8?B?V1Zxd2l0a01mOStkcFJ5d0w2NEZScmdaNjZ3OURuVGxoLzIzK2N4T2lmeDFi?=
 =?utf-8?B?VDZ4STFxZnFkemFrSzhVa25CZXU2TnpiMnorUWRWRUk4MkYxcHBEZk9INHEz?=
 =?utf-8?B?WjZpWk1qWldhcnM0dU1aVWtkR0w1MFJsMFcyRDRXRjB5ODYvRUxrS2ZKdXVP?=
 =?utf-8?B?UHA5Y2JLWWo1TWN6UTY0TUpJTktrbUwrY1VXbU5RaU9HU0k2WjliUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <25681A29D5CA434BB0C5D1A35803D8E9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EXCIAXGrCAA8jzs02ntK2uHfSI9cT7jVxJNpPhvfN/C59Rh2j19g0Q6v//cK0KtCbOltEhAzZrNqB34KYl+mMr4CFVDP6KeQJnmVUILgKIrDZvquCYwIExGzv0QYxlzdjAPZlzXm/T6MXexTDvu2Xkz4gZpCMW2NhxNOpXLf1AUPBNJLF8hPg00C9jbvFHGzHIezl4+xWJ38ZQMoNK7bx/YTXTyV5qrA+wyLKWuEbfdINHAPSd4lPjV1jq8zg9XLO8n/T8oL9UMod6cVeyzIRvm1FJWKcKlGcQjyOLN+IAWhBrPNwpw71o4sSks55Q+sedT1f0o//723vNyqw+rm6p9HTuisD+GFRb8BjZmhZdtJ4sZnabjf7/XsWWMqszkNjebC2nA8wDOvoujOhJjg0wvcNMYgZKPbTyye5RduH9+A7E/sMh/962P6UCwp4lCORa6ThPE4no3xXaP7itH6ekQ3LqQLZRHksQCetVp0CTZ1WvbjmW9sM+kF/RNgX5BcyOT0kQUMOKRyFpYDB+K9tVzfeDU6CSDG2vo2Bp/o6F23Yj6HhUo8WuvNcqmw3DX1gqLpziuBntbwVIwpQdt6Nq/G+X7XWH5tvBjapfdfQqLJmU3xnSKPtu8F39MqlEUh5aMndfiYL/IbhFqQsEtwGA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 697ce740-20c1-4dff-f0d6-08de75634a00
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 18:17:23.6424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xsiRLb3lOXqJ7hFb3q5ItT/caMig0VuseGFMvjk72WbzApX7+9MCo+8EEmLD6r/Yoz3a0Su5311tACkkSHQjkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4084
X-Proofpoint-ORIG-GUID: jvNSQ4ywBcGmSf4nmUgByeaTTiLCcM33
X-Proofpoint-GUID: jvNSQ4ywBcGmSf4nmUgByeaTTiLCcM33
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE2NiBTYWx0ZWRfXzGZs3wgKa2Fj
 8zrAUJkYtmMSCxR9ZHxRseDdzEBi56uTOF4/c70tLMs2QJpSis1FWiCPzg4tups7jbDUX+z5lyU
 5br3Yho2xjZOmfrNfuXK3cJJKaMG6xFmE2q+q2jDUICM7E99UTDN+tpaSCuW5oDIRwGPuVTUlAH
 G1nep+Y90cD5xbQYe8jNWVK9u/zbw5JDRtlsgP1894WnsQlBDNTCdyz2YE4oxWSpj/0fGz4Dp+o
 XA5f+JtELPyydzmcJ6PhehdQ5RqzsNhmwbUzjzVBTT3rGh7ah9Zo/29YmEN0V86f+m0chp+aIfu
 vZhOA9sReprOZIiEMDN/D6pWs+FUS+FKSHHv0onqAtwCwP7E34dsovo35t71E07mkaycU491tDA
 927P92hDwUCNhphQP0BgvAypX6qApJ72HqFbwbtSqYavwpEHksEKx3OnEu6OcDWpoTUEqq59S+o
 NLLpWj/E56zS8aVJUWA==
X-Authority-Analysis: v=2.4 cv=MZFhep/f c=1 sm=1 tr=0 ts=69a08e3e cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=VwQbUJbxAAAA:8 a=IeNN-m2dAAAA:8 a=KhbiSanuCFVsNA0h2ecA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1011 phishscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2602260166
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33756-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,synopsys.com:mid,synopsys.com:dkim,urldefense.com:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 23A0A1ADC69
X-Rspamd-Action: no action

T24gVGh1LCBGZWIgMjYsIDIwMjYsIE1hdGhpYXMgTnltYW4gd3JvdGU6DQo+IE9uIDIvMjYvMjYg
MTE6MjcsIERheXUgSmlhbmcgd3JvdGU6DQo+ID4gSGkgR3JlZywNCj4gPiANCj4gPiBJIGhhdmUg
dXBkYXRlZCB0aGUgY2hhbmdlbG9nIHRleHQgYXMgcmVxdWVzdGVkIGFuZCByZXN1Ym1pdHRlZCB0
aGUgcGF0Y2guDQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXVzYi8yMDI2MDEyODEwMDc0Ni41NjE2MjYtMS1qaWFuZ2RheXVAeGlh
b21pLmNvbS9fXzshIUE0RjJSOUdfcGchWlNKTkRLeU9pbm0yNnFuZ29wTFctYXhpUXR3REFNZWx5
NGJEcXRxWURHdjFFcldDdFM2a1o2WmFtZGlLb1pLdUN5Q2swSXhNUUs1ZzYyNUdFSXhZV0Z6S3BB
RWlDVXE3JA0KPiA+IFBsZWFzZSBraW5kbHkgcmV2aWV3IGl0IGFuZCBsZXQgbWUga25vdyBpZiBp
dCBpcyBhY2NlcHRhYmxlIG5vdy4NCj4gDQo+IEknbGwgc2VuZCBpdCBmb3J3YXJkLCBidXQgY2hh
bmdlZCB0aGUgY29tbWl0IG1lc3NhZ2UuDQo+IERvZXMgdGhpcyBtb2RpZmllZCB2ZXJzaW9uIHN0
aWxsIGRlc2NyaWJlIHRoZSBjYXNlIGFjY3VyYXRlbHk6DQo+IA0KPiB1c2I6IHhoY2k6IFByZXZl
bnQgaW50ZXJydXB0IHN0b3JtIG9uIGhvc3QgY29udHJvbGxlciBlcnJvciAoSENFKQ0KPiANCj4g
VGhlIHhIQ0kgY29udHJvbGxlciByZXBvcnRzIGEgSG9zdCBDb250cm9sbGVyIEVycm9yIChIQ0Up
IGluIFVBUyBTdG9yYWdlDQo+IERldmljZSBwbHVnL3VucGx1ZyBzY2VuYXJpb3Mgb24gQW5kcm9p
ZCBkZXZpY2VzLCB3aGljaCBpcyBjaGVja2VkIGluDQo+IHhoY2lfaXJxKCkgZnVuY3Rpb24gYW5k
IGNhdXNlcyBhbiBpbnRlcnJ1cHQgc3Rvcm0gKHNpbmNlIHRoZSBpbnRlcnJ1cHQNCj4gaXNu4oCZ
dCBjbGVhcmVkKSwgbGVhZGluZyB0byBzZXZlcmUgc3lzdGVtLWxldmVsIGZhdWx0cy4NCj4gDQo+
IFdoZW4gdGhlIHhIQyBjb250cm9sbGVyIHJlcG9ydHMgSENFIGluIHRoZSBpbnRlcnJ1cHQgaGFu
ZGxlciwgdGhlIGRyaXZlcg0KPiBvbmx5IGxvZ3MgYSB3YXJuaW5nIGFuZCBhc3N1bWVzIHhIQyBh
Y3Rpdml0eSB3aWxsIHN0b3AuIFRoZSBpbnRlcnJ1cHQgc3Rvcm0NCj4gZG9lcyBob3dldmVyIGNv
bnRpbnVlIHVudGlsIGRyaXZlciBtYW51YWxseSBkaXNhYmxlcyB4SEMgaW50ZXJydXB0IGFuZA0K
PiBzdG9wcyB0aGUgY29udHJvbGxlciBieSBjYWxsaW5nIHhoY2lfaGFsdCgpLg0KPiANCj4gVGhl
IGNoYW5nZSBpcyBtYWRlIGluIHhoY2lfaXJxKCkgZnVuY3Rpb24gd2hlcmUgU1RTX0hDRSBzdGF0
dXMgaXMNCj4gY2hlY2tlZCwgbWlycm9yaW5nIHRoZSBleGlzdGluZyBlcnJvciBoYW5kbGluZyBw
YXR0ZXJuIHVzZWQgZm9yDQo+IFNUU19GQVRBTCBlcnJvcnMuDQo+IA0KPiBUaGlzIG9ubHkgZml4
ZXMgdGhlIGludGVycnVwdCBzdG9ybS4gUHJvcGVyIEhDRSByZWNvdmVyeSByZXF1aXJlcyByZXNl
dHRpbmcNCj4gYW5kIHJlLWluaXRpYWxpemluZyB0aGUgeEhDLg0KPiANCg0KVGhlIGNvbnRyb2xs
ZXIgaXMgaGFsdGVkIGlmIHRoZXJlJ3MgYW4gZXJyb3IgbGlrZSBIQ0UuIEl0J3Mgb2RkIHRvIHRy
eQ0KdG8gImhhbHQiIGl0IGFnYWluLiBOb3Qgc3VyZSBob3cgdGhpcyB3aWxsIGltcGFjdCBmb3Ig
b3RoZXIgY29udHJvbGxlcnMuDQpFdmVuIGlmIHdlIGRvbid0IGhhdmUgdGhlIGZ1bGwgSENFIHJl
Y292ZXJ5IGltcGxlbWVudGVkLCBkaWQgd2UgdHJ5IHRvDQpqdXN0IGRvIEhDUlNULCB3aGljaCBp
cyB0aGUgZmlyc3Qgc3RlcCBvZiB0aGUgcmVjb3Zlcnk/DQoNCkJSLA0KVGhpbmg=

