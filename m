Return-Path: <linux-usb+bounces-4332-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 729E4818558
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 11:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 698751C227DE
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 10:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1634314263;
	Tue, 19 Dec 2023 10:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YN9MBChV";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cpUHhrhI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RJnlZ3cv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6017C14A84
	for <linux-usb@vger.kernel.org>; Tue, 19 Dec 2023 10:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BJ9bBt1024120;
	Tue, 19 Dec 2023 02:18:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=7sislO8Bz7g5yqG7vAW2UOrQKQrshSlV1iC5cWtIBYg=; b=
	YN9MBChVLchYLhjmCjrBtsWT+QayEVEKarPDJFyQVun/zgVd1IHZHT6lVwLYJhT7
	Tqzn/Le+0V3qkD4d2Zlu//hmB9jHsXIFnQAsODV7bGDtGvetKCSqIVvFp7Afl958
	8Gb1rZWGWvmiEmBvAlYonuYhQFXOHCrXA5Tw0AhaWXQVCAzlpD2nJzOanu51upQU
	uwkPs2B6CG1WBVsJBte4JYfXLZoY3EV/eCfbtiZno061zMCQBlkh3A8PLPwNfDE6
	F9SeIbrGWG5aBQ9YZpfam7YTVvUOehlnh0TfApsImpwN9mmJD0uUb5cLU8mJHtJk
	deH0Lpky8489Ng6o1a46fQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3v2xsb2gkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Dec 2023 02:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1702981137; bh=7sislO8Bz7g5yqG7vAW2UOrQKQrshSlV1iC5cWtIBYg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=cpUHhrhIa9l+id+IzkUwrbbsE0G11PDsDJlkOD2fcgQGtJ4osV0SEaJ/PME5SNvoL
	 4D6HVAhJkGzHs2yWeL9YmW4QXuPJVFGlpTolizJvrtvvPTUIfNUMkdQOK6Ks1MOlcQ
	 kqZrBbwuQADxuz2KwiSlOpJ1O95Gfn/gmdGgawfp1MnOepKuiAhW3qQtIDs/ZmRKg3
	 VaWI9I0nC0/7p4gWzzqsZ9YW8O/KvC2XHQRLFUgo5dWmrzEhVzFexsBRui/MI3O6tP
	 ocNV5LEiQv4lyEAiSnMyqBltNusscPxLII1+AZvXBA2vryl4aDYnFeZPp/JX8fjhcX
	 OkYU2NMCgGkRw==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D5FD44035C;
	Tue, 19 Dec 2023 10:18:56 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 525B0A0257;
	Tue, 19 Dec 2023 10:18:56 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=RJnlZ3cv;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A0964401C6;
	Tue, 19 Dec 2023 10:18:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKdl6m+meXSaXGGK58EQOKHhzw+f92nvI1DjoL46kwdQ4TEiX9nWNSKLeih9Hjy8a6G+LVAqckTdgePkOBWJtDrCbDIKdCvtZJomsRjW18z6aLU+1nIIaYwDm+SEmfVqiRr2Hcw0fyNNVNpV8X641i98G2OJ8Nb08ncI9+gp6qKOUjOZRTE1ptAmTZwUDNFbb5Q2cH0L5pU4ucBFhSsBEu/8TECclADFtPYM8pmlFjrqPtCiiKqEP89v1jHCKgCRqKG4KhvCxW2f4PdKHz7kcgpxEVKxlXE4Ipgi8pvB2Gx0+frVV2L9vfMqFRpI3CM5NDPc8smZ9tc3Po7l6LADAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sislO8Bz7g5yqG7vAW2UOrQKQrshSlV1iC5cWtIBYg=;
 b=ghxUk5LJgU6kNAdQQgyE82tVq5zfWXpO1fR6WhVJHOwP/HqL4a+slZh9TTVHiWD+tt4tBn2oESWxKFhxZGWu0VPt6ERLRkE+DtVfVpgVOy8JK6QM3zP4XZfG5e/vZIVr8c9jpfHYHnWSx0wjEZ/uFxD5q9uL8ioXKOswjiZwRGN/ZeRimH29+vhZ0eet7A1tDXPx55/GE7nZtMmj2DIoZltt7Tg3jEPMb7lgaifGJoNITeXFpavYMI/6+E1Ub0LBA3FOQRyQbaDcVplVX9Jib035PLu27D9EZ1XL3gDtB6rdZq1Ab5Y0WfqWw1zhmfNsAleq75O34BFJ7RDb5QW9Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sislO8Bz7g5yqG7vAW2UOrQKQrshSlV1iC5cWtIBYg=;
 b=RJnlZ3cvSkzKG7UeyBVs9DcBR0NElPLpVnXE3ws4ghlLmu2bYj5t5ysQeHmvoND4lIeKT7x1IUat6qHEEdioOGFKGUblFPVHdhotDsUhoWNmC+Nv0GvBnGJTrfBFvZn9+63Kb61YRzCcfFtqc7n63YQYGxFi33QBqaCPTmH+vq8=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by MW3PR12MB4555.namprd12.prod.outlook.com (2603:10b6:303:59::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 10:18:49 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::94f2:3161:83a2:4680]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::94f2:3161:83a2:4680%3]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 10:18:49 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Oliver Neukum <oneukum@suse.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: Ivan Ivanov <ivan.ivanov@suse.com>,
        Andrea della Porta
	<andrea.porta@suse.com>
Subject: Re: [PATCH] USB: dwc2: write HCINT with INTMASK applied
Thread-Topic: [PATCH] USB: dwc2: write HCINT with INTMASK applied
Thread-Index: AQHaF9Jh+M4x1h3P7ECYkgn6i43CXLCwmd0A
Date: Tue, 19 Dec 2023 10:18:49 +0000
Message-ID: <976cf6fb-fcda-9bc5-d666-9177b4583d26@synopsys.com>
References: <20231115144514.15248-1-oneukum@suse.com>
In-Reply-To: <20231115144514.15248-1-oneukum@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3399:EE_|MW3PR12MB4555:EE_
x-ms-office365-filtering-correlation-id: 4fd914b9-f76f-4adc-d85a-08dc007be454
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qq140lSzFguwASAWOlBd2sP5BUjqLYLroj3vzHYBKj0AXG2V2jTAnoGYmqoDCXoVjpvGX9Cflm9v5YPDJdVmJQhLjTFQxIFO8Ug7X6UZyxDP51RHdUQXbLL+GwY828IJQp3dWmT34PeRkLYwEw0ERdmFbtyElcMzNUyZdzRFLhTnuYtePrFUx33HILtlFZn43ZGvZy7xVioh8Rkz00unQXgt5gjni65pPX/zE8yJ8t6LBkR+gMpk9BaU27XvkK+h+UfMwFA7IlrilvvhKbRKy2o9H7ui7dEYRDH6LIWsC67v6z5pI0ust7iF543U9eFDXF1INV81MIrxnzBsy5x7rogo23gxVGoqfexssQahvX6YbpbV2thi7+K8M/pEgN4OqiozuOPtJ1sfjyC/Ff6UsMsBV1j70WT536WtTlZiaVHzUk9FN9aZ+banectZBB7zWrlDf5POJ92kkRMhD5E8lHSKiHuHnXacd6XNYe1IVskgM8Sjl/AhAgM8Ism3DLgMYBr3at7gg1Vd9KjmyrIEF+v/Lc4RztL3jlpZWKwYUUUUfva9fClyQCYvDvRvIIMuLnlohPTb/bWqzTZ0nrIE+Ij4PSheFL1kmQ23rXtaCXU3jltyG0x6Vfg8nKVJaPxLzUP1UaIjTZ3i9l4GKqvu6LM3J7u3QGStgMnQn7754/85ig8FAd0IrxGaeVRxBNu1
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(366004)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(31686004)(31696002)(86362001)(36756003)(91956017)(478600001)(53546011)(41300700001)(6506007)(76116006)(66476007)(66446008)(64756008)(54906003)(66946007)(66556008)(71200400001)(38070700009)(26005)(122000001)(2616005)(6512007)(38100700002)(83380400001)(2906002)(110136005)(6486002)(5660300002)(316002)(8676002)(8936002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SW1YN0wrRW5VYXV3bUtEV0g2STlrTGNZcnk1VzkvM1IyWHpaUGxWSktoRkYy?=
 =?utf-8?B?QVF6b1dDMlJ1UUVDdzNaRmRCMnVtdFdRZEl3ZjFvbmtKMkdNanhYbjZaajc2?=
 =?utf-8?B?VkJ1YVN5Q2ZKcCtYUFhDak40QUxqUUg0bUVKRUlGNTVzZlFEUGN4QW1OWExG?=
 =?utf-8?B?KzlVODd5WEpHM2d6L1M3L0FLUGhTY2xuL2J6eThEalk4K3hOYlNZUXV1UFkw?=
 =?utf-8?B?ZmEwbEpLMklQd0JFTStJdGs5Z28xQVhhMDR2bC9UaUpvMlJQK1JRZVM0ZmZ0?=
 =?utf-8?B?eTNKV3pCRFBzUDJjc3JEeGg5L0tpUkZvcVN1TWozcGVYdVhPdTJLRnFDNVdx?=
 =?utf-8?B?dW9lelN6SXh6OFU5Rk01S2w1T3A5eno4VHUwOEFHQ0ZVRVVQeXVXemdYKzVF?=
 =?utf-8?B?U1R1cHJ6VFRqT2piYUczYklHb2dsUWtGMjJMVnMrQlBUd3JRdEZSS1dsbXRt?=
 =?utf-8?B?YU53SEVQVlM1MWdmVkhVL3RjTDZTclpIY1NBeVUzeDVJeEVTZEFXMDd4Rkd3?=
 =?utf-8?B?RGdoS09JbjBQVGR0QVo2Vm9QRU9EVGNBUkFId3NaaCtvSXZOa1FFeGVGSTJp?=
 =?utf-8?B?eE5IUXBvMkV0eDgyOWs0bjdpZFFJQ253em4xVEFsMUYzbW1ac1lwT1hUR1hM?=
 =?utf-8?B?TC80Q0VianhpMmQ0WFdHaHZNaHBlSFpzR2Uxa2pGMTA2Z0huNXJ4UUhUL3Ay?=
 =?utf-8?B?UXZOT3pUZVgrc21QN0xTUEVleWZvQUdaandjK1Q3RzJBanVrVmFFczhmVHNy?=
 =?utf-8?B?YVlEZzhiS3B3b2hHYmsrdXN1OVNuTTEzeDNLUE5ENk04TzAveXMwZE1zUG5q?=
 =?utf-8?B?UktLMjRJUXZETXJGMFhSVDVjZ29mSzZSczhkNDV5ejd4Um9KNE42MU5MeVg5?=
 =?utf-8?B?cUZGWkJMVk5ncTRjS1VTUGRmTVBoOWxiUW5IeGRJSDAvUWVDeHdpK05idk11?=
 =?utf-8?B?VllJck5jeTlVYzkrMFJVQTVib1hhSjkzRGlic0g0enA4YW1JbFhLZURXRGZl?=
 =?utf-8?B?MjdrT0ZWRE5Wa0xMbGtpRWR1eEppNFJhN1RVblFHRHNZQ29RSVJ6djBhTy9Q?=
 =?utf-8?B?d3p5OU1rVUt1cWw4aHo3bEZrTm84T3F3cllSaFp1ZjJiVC9KQktGMGdwYzNr?=
 =?utf-8?B?dXFPQWFlRXJYbHdza3NvVVNaMVZXWmdFamF4R2hLUjlud0oxbFJ5dm1JV1FX?=
 =?utf-8?B?OWdNNlBkN1Y2NVZFKzhyZkNCZFRRTjRUbks4dFFXZUVxdzQxK2xPOU5Rekc1?=
 =?utf-8?B?UHg1bWhUd2tiQUt5UjRIOFRDMU9OekhCV2F2NnZZdmdRTEY2T1ZLelRpSnk1?=
 =?utf-8?B?ZmZFNG1HZmRmRDNuZExBajk4KzVLM0R6dHZIR25ZVGszRmhybTNRWGllOURo?=
 =?utf-8?B?eHh5M01tWjBGMjZNcnFFOXdncDhCN2VzYm04V3U4c2FFTmdmdmlPM2RLc1FG?=
 =?utf-8?B?M3gzRTdtTmFmNnlIbzdYRFE2MVVJSlpPSjJJZHpyR3hQcllGWFJNdkNKZlN3?=
 =?utf-8?B?OTF1QWZ6TDZaL1B3bkorc1dlNlFRTWh6S09Kd2hBM2lzcE5XckZMVC9obkJJ?=
 =?utf-8?B?T0JxQkJxaW0xMWJyVDgyQ2U0RmFMc3NxUUVySkJsT1owaWVKc1ZiWDh0ajlC?=
 =?utf-8?B?RDRySVF2d3FvaDMvTU1KWFRBSGlnNE1BMFdLSEV4TGxBU0VoMVNDOTliYUEr?=
 =?utf-8?B?elo0TGVxTXU0NUg0Ti9ydzNiU3dhM2dJTUtzZnVVcEJCK291bTRQa3dmS2NC?=
 =?utf-8?B?Zjl6VzFNbTh2Z0M0Y1hublNHQnNuRVR3SlpGMkVjWmplcGJBN0xlNUJqVGxL?=
 =?utf-8?B?bjV2N0VZWXlWMXAzS0hMWHVHOTlaRGJpTjczdWwzcmQ5ditZWC9EZEYvNDVj?=
 =?utf-8?B?cm5iQmRQdkdVOG1Pblh4cDNhOFBET3pURkNvK2tweDdQTTBtbjdFRHRUTDNT?=
 =?utf-8?B?UmFueXFzM0lDS2dTbU00UjRVTkZlQWhSalU4RUZBcWhEOGdVU29KVGpaYWVL?=
 =?utf-8?B?bVk1a1JjTmRkUytUdnhvdlRRUkc2c2VCdzFUY2dyVjdxeGZuWlcrWkZ3bUNr?=
 =?utf-8?B?UXhucldEQjJOcXFIb0EvSE5YSkR6cG5vMHZnNkV1Y0NNZ0JCY2g3WmNWSld5?=
 =?utf-8?Q?gxUlgRSXqTNCZrFETLZ5f1co6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <87EF2086352FC940A490E7627D0EB50F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	pD1pdedYzTTvusFZ7+H50nFcuIV3cV1EhF1NWOGCjd8obcofXAboHBPznpAWoxvQoUygj36dxFtlrMy8TnqxiSIZpVL9tLei3Th1J8YMb3fqbeM11Jeo9YVQMQ//pdTPLlwaj1WST3DD7AWDG+Cesj6ATU9ly3CfA/ee7DQ0FFecdaBtRm+FVEqwcHQoKDuDtTtE6uWkk5Wt6iNgsGMRxXGXyBxut5rsYtfUsFCRu741R9WbbB43922UwAQwfu9pofVWWtNHhTb3Of82REGtXiluZ8HN3L6LxBAMZWCJzYu9vFFVfMB6mr2oP1aipber0RH3UJ0oRJJtrStEJ9ueeUZrqqOR5jDLd3tHLrDUYOVjvwMDgWaFcvuge6LppxZNZV02+aojTGm6uA9AtH/qTeIEzDRauDit8njfFqCdfyxyjfJUcDm5A4W6dsWO+5xbEReJGXvLIhNk1Kg24jZR/u2a8tcU1/chNHgktmJAnDiajir6iojGCJZvdMQiWltQ82OKKl6S+NrOblP/tW7u4rs37VWGaxfl2OzTFQnAEKcHsoy+NWt71tdks5gTJsDDU+lL9fWKMBawoKKFh1XZ89ZJrwPInLt83n614/fy24Z2jy3NdQVX6TQ2qCW+cDiww1ZpeRCwwBgMf9YBcssA6w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd914b9-f76f-4adc-d85a-08dc007be454
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2023 10:18:49.1399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BQerc0z5uAPx+j1/EHJMcwiYbk6eXf0Jqw+7+jappVg6yukr+yQraaErlL82yNmKQ5Mh4ak4aAVKRdwN948gbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4555
X-Proofpoint-ORIG-GUID: zMzzf1Bk3VqeGPugofdEJi7VdTUnGxX9
X-Proofpoint-GUID: zMzzf1Bk3VqeGPugofdEJi7VdTUnGxX9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=565 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312190076

DQoNCk9uIDExLzE1LzIzIDE4OjQ1LCBPbGl2ZXIgTmV1a3VtIHdyb3RlOg0KPiBkd2MyX2hjX25f
aW50cigpIHdyaXRlcyBiYWNrIElOVE1BU0sgYXMgcmVhZCBidXQgZXZhbHVhdGVzIGl0DQo+IHdp
dGggaW50bWFzayBhcHBsaWVkLiBJbiBzdHJlc3MgdGVzdGluZyB0aGlzIGNhdXNlcyBzcHVyaW91
cw0KPiBpbnRlcnJ1cHRzIGxpa2UgdGhpczoNCj4gDQo+IFtNb24gQXVnIDE0IDEwOjUxOjA3IDIw
MjNdIGR3YzIgM2Y5ODAwMDAudXNiOiBkd2MyX2hjX2NoaGx0ZF9pbnRyX2RtYTogQ2hhbm5lbCA3
IC0gQ2hIbHRkIHNldCwgYnV0IHJlYXNvbiBpcyB1bmtub3duDQo+IFtNb24gQXVnIDE0IDEwOjUx
OjA3IDIwMjNdIGR3YzIgM2Y5ODAwMDAudXNiOiBoY2ludCAweDAwMDAwMDAyLCBpbnRzdHMgMHgw
NDYwMDAwMQ0KPiBbTW9uIEF1ZyAxNCAxMDo1MTowOCAyMDIzXSBkd2MyIDNmOTgwMDAwLnVzYjog
ZHdjMl9oY19jaGhsdGRfaW50cl9kbWE6IENoYW5uZWwgMCAtIENoSGx0ZCBzZXQsIGJ1dCByZWFz
b24gaXMgdW5rbm93bg0KPiBbTW9uIEF1ZyAxNCAxMDo1MTowOCAyMDIzXSBkd2MyIDNmOTgwMDAw
LnVzYjogaGNpbnQgMHgwMDAwMDAwMiwgaW50c3RzIDB4MDQ2MDAwMDENCj4gW01vbiBBdWcgMTQg
MTA6NTE6MDggMjAyM10gZHdjMiAzZjk4MDAwMC51c2I6IGR3YzJfaGNfY2hobHRkX2ludHJfZG1h
OiBDaGFubmVsIDQgLSBDaEhsdGQgc2V0LCBidXQgcmVhc29uIGlzIHVua25vd24NCj4gW01vbiBB
dWcgMTQgMTA6NTE6MDggMjAyM10gZHdjMiAzZjk4MDAwMC51c2I6IGhjaW50IDB4MDAwMDAwMDIs
IGludHN0cyAweDA0NjAwMDAxDQo+IFtNb24gQXVnIDE0IDEwOjUxOjA4IDIwMjNdIGR3YzIgM2Y5
ODAwMDAudXNiOiBkd2MyX3VwZGF0ZV91cmJfc3RhdGVfYWJuKCk6IHRyaW1taW5nIHhmZXIgbGVu
Z3RoDQo+IA0KPiBBcHBseWluZyBJTlRNQVNLIHByZXZlbnRzIHRoaXMuIFRoZSBpc3N1ZSBleGlz
dHMgaW4gYWxsIHZlcnNpb25zIG9mIHRoZQ0KPiBkcml2ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPg0KPiBUZXN0ZWQtYnk6IEl2YW4gSXZh
bm92IDxpdmFuLml2YW5vdkBzdXNlLmNvbT4NCj4gVGVzdGVkLWJ5OiBBbmRyZWEgZGVsbGEgUG9y
dGEgPGFuZHJlYS5wb3J0YUBzdXNlLmNvbT4NCg0KQWNrZWQtYnk6IE1pbmFzIEhhcnV0eXVueWFu
IDxobWluYXNAc3lub3BzeXMuY29tPg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvdXNiL2R3YzIvaGNk
X2ludHIuYyB8IDE1ICsrKysrKystLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2Iv
ZHdjMi9oY2RfaW50ci5jIGIvZHJpdmVycy91c2IvZHdjMi9oY2RfaW50ci5jDQo+IGluZGV4IDAx
NDRjYTgzNTBjMy4uNWM3NTM4ZDQ5OGRkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2My
L2hjZF9pbnRyLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMi9oY2RfaW50ci5jDQo+IEBAIC0y
MDE1LDE1ICsyMDE1LDE3IEBAIHN0YXRpYyB2b2lkIGR3YzJfaGNfbl9pbnRyKHN0cnVjdCBkd2My
X2hzb3RnICpoc290ZywgaW50IGNobnVtKQ0KPiAgIHsNCj4gICAJc3RydWN0IGR3YzJfcXRkICpx
dGQ7DQo+ICAgCXN0cnVjdCBkd2MyX2hvc3RfY2hhbiAqY2hhbjsNCj4gLQl1MzIgaGNpbnQsIGhj
aW50bXNrOw0KPiArCXUzMiBoY2ludCwgaGNpbnRyYXcsIGhjaW50bXNrOw0KPiAgIA0KPiAgIAlj
aGFuID0gaHNvdGctPmhjX3B0cl9hcnJheVtjaG51bV07DQo+ICAgDQo+IC0JaGNpbnQgPSBkd2My
X3JlYWRsKGhzb3RnLCBIQ0lOVChjaG51bSkpOw0KPiArCWhjaW50cmF3ID0gZHdjMl9yZWFkbCho
c290ZywgSENJTlQoY2hudW0pKTsNCj4gICAJaGNpbnRtc2sgPSBkd2MyX3JlYWRsKGhzb3RnLCBI
Q0lOVE1TSyhjaG51bSkpOw0KPiArCWhjaW50ID0gaGNpbnRyYXcgJiBoY2ludG1zazsNCj4gKwlk
d2MyX3dyaXRlbChoc290ZywgaGNpbnQsIEhDSU5UKGNobnVtKSk7DQo+ICsNCj4gICAJaWYgKCFj
aGFuKSB7DQo+ICAgCQlkZXZfZXJyKGhzb3RnLT5kZXYsICIjIyBoY19wdHJfYXJyYXkgZm9yIGNo
YW5uZWwgaXMgTlVMTCAjI1xuIik7DQo+IC0JCWR3YzJfd3JpdGVsKGhzb3RnLCBoY2ludCwgSENJ
TlQoY2hudW0pKTsNCj4gICAJCXJldHVybjsNCj4gICAJfQ0KPiAgIA0KPiBAQCAtMjAzMiwxMSAr
MjAzNCw5IEBAIHN0YXRpYyB2b2lkIGR3YzJfaGNfbl9pbnRyKHN0cnVjdCBkd2MyX2hzb3RnICpo
c290ZywgaW50IGNobnVtKQ0KPiAgIAkJCSBjaG51bSk7DQo+ICAgCQlkZXZfdmRiZyhoc290Zy0+
ZGV2LA0KPiAgIAkJCSAiICBoY2ludCAweCUwOHgsIGhjaW50bXNrIDB4JTA4eCwgaGNpbnQmaGNp
bnRtc2sgMHglMDh4XG4iLA0KPiAtCQkJIGhjaW50LCBoY2ludG1zaywgaGNpbnQgJiBoY2ludG1z
ayk7DQo+ICsJCQkgaGNpbnRyYXcsIGhjaW50bXNrLCBoY2ludCk7DQo+ICAgCX0NCj4gICANCj4g
LQlkd2MyX3dyaXRlbChoc290ZywgaGNpbnQsIEhDSU5UKGNobnVtKSk7DQo+IC0NCj4gICAJLyoN
Cj4gICAJICogSWYgd2UgZ290IGFuIGludGVycnVwdCBhZnRlciBzb21lb25lIGNhbGxlZA0KPiAg
IAkgKiBkd2MyX2hjZF9lbmRwb2ludF9kaXNhYmxlKCkgd2UgZG9uJ3Qgd2FudCB0byBjcmFzaCBi
ZWxvdw0KPiBAQCAtMjA0Niw4ICsyMDQ2LDcgQEAgc3RhdGljIHZvaWQgZHdjMl9oY19uX2ludHIo
c3RydWN0IGR3YzJfaHNvdGcgKmhzb3RnLCBpbnQgY2hudW0pDQo+ICAgCQlyZXR1cm47DQo+ICAg
CX0NCj4gICANCj4gLQljaGFuLT5oY2ludCA9IGhjaW50Ow0KPiAtCWhjaW50ICY9IGhjaW50bXNr
Ow0KPiArCWNoYW4tPmhjaW50ID0gaGNpbnRyYXc7DQo+ICAgDQo+ICAgCS8qDQo+ICAgCSAqIElm
IHRoZSBjaGFubmVsIHdhcyBoYWx0ZWQgZHVlIHRvIGEgZGVxdWV1ZSwgdGhlIHF0ZCBsaXN0IG1p
Z2h0

