Return-Path: <linux-usb+bounces-22719-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9322A7F177
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 01:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 085293B82A6
	for <lists+linux-usb@lfdr.de>; Mon,  7 Apr 2025 23:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809EC229B21;
	Mon,  7 Apr 2025 23:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OUBJzhlQ";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KQ0EB5pB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="klOI9e2L"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CA921B8F8
	for <linux-usb@vger.kernel.org>; Mon,  7 Apr 2025 23:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744069617; cv=fail; b=WHGBzGZHD5yZh5h1wYOolI1GxtmG/4/lpmWIJUjcgJzMFUY7TKpgXH6xqZqzCkUdrGD6rFShRWpYmuYEEY4RZpXcZKZNfx7qGlQEX9qfHxMk18cyTWvx2p5ila79gDh8LcrX2jwTjWbp1PTMNXRsW0Sb+xYDrn9BoaTwFD/b8A0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744069617; c=relaxed/simple;
	bh=HbOAiTddIONFKU2cdUlkehkEicoyGfaBi4E6drkVkPU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lpkLRyrIFTGdOx6FWXRuATxx2f4JKkIuyfK28fkTEwpRAW4uwfcdVyV/eVzg6KnyKgiDn2s4dzH0W9uRDqvi9url0DfjMlKAdUFjyU201XMhAV1rHeauK6XeNj0Dn2mKhEREuLefDwL6WsvEE75r8HGB7dkygH6eKcyEtt/fDE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OUBJzhlQ; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KQ0EB5pB; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=klOI9e2L reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537GVXET015355;
	Mon, 7 Apr 2025 16:46:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=HbOAiTddIONFKU2cdUlkehkEicoyGfaBi4E6drkVkPU=; b=
	OUBJzhlQ7KlVsciYyqHLIbDvO1Bhxii7iSF6pfdfSCptBxTMdgZbI5szTxp58XV+
	isiigXfZdatY20HNLwFp13L9wQmOgF0icejBP8Kq30kWHcwcVRi2Y0g6JarNvtv6
	xY9nWgWlfWQZHhA3FerbHYowKV7h42lGeeU406C0AX764wqDidAo+X7RQs7xVjM6
	6H90b4rlwcyC0MgiM6gAezpGLlOJqTCdTj4JWfZYgcpAi8ne90Of/lh6Nw/9QUDL
	PJGtaXNhf+VrmVw0URuSYV75yqPNrsWTA2KsA7PDEP4xQhet0OBBu7SNahEGNJJq
	ZAflmDjUc47y1mAHjsK3KQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 45u3hp70mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 16:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1744069600; bh=HbOAiTddIONFKU2cdUlkehkEicoyGfaBi4E6drkVkPU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=KQ0EB5pB+/nhd+6oZpv3JiWSJT8egKPBiUPE9YJnP2GDjVjDi/xdOZn8LyeOsunLv
	 0CSD4hd80LKI38Es4E2LMi0U/qN+NAb/SsMwzu1aDClTXuCTYhAFeCmxFc03O5C+ok
	 7Wbra84S0V3MEcY1dDWcFVVFV4snqVLstNpxmH+ygLW0WA35E/dvUgLInkOqj+SaNZ
	 dnFsoPLxCeLRN2K01MCaLnQKusFbuLeLKePk5gSqkYlVokKc3PW1Y0qYumJWhUQb6M
	 kEkf674ND2Nifvd+m5VGqGvZO41vAUB5BCOilICIz2O9eIO4fEFtmbmqLl1bXMAsct
	 727Q7gqbyVzcQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A01A34052E;
	Mon,  7 Apr 2025 23:46:40 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id F3969A006E;
	Mon,  7 Apr 2025 23:46:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=klOI9e2L;
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2045.outbound.protection.outlook.com [104.47.73.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7D4974048F;
	Mon,  7 Apr 2025 23:46:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HE75AeBX7lE6hk0ZcZ0G1bokfE0yYbuTvMeBbT0aoclljXgYsAHZe8ju1LrYYuD1oj3ZLWA5zRs6SeznJLW6rkFkHr3YDy5gXhQJ+Sgqn8v9P/FhG+8GByVjButfiJQByQszZMiP3Zwp21VYNGGUkAWK420ImIE4Lzsjwc+/5yMJXtIktuq5QKQPBnNQOStPh+CioF3fmzL/iiC6kvms3Ho7x+p0a3zKx/ha5l6ugd6c9w/9GC6zM5rri/k6678nf/LZ4IsX8TVlBEPXVl+6u3upzqjrvhyvzzPHRnMJNY5wOZX5BY6q2cfQiLKDMfxyfra6NFmT9nVkpYoamzO1fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HbOAiTddIONFKU2cdUlkehkEicoyGfaBi4E6drkVkPU=;
 b=xYWftk+kIGM39NlkqVjFuBTuJEqanIJX+M2JjKjXsLuLG5iPi3P58+YjRBtFeKw2TToVMzNEASgoTzj+xHpRFGvY1XzwB+VMCT7KHj21/qkS6+thBLb0LlwOOmIpEnnyiE95Hm20s8NVErgvHIcFqtculeVPWHcOBy6gEpQIMn17E4YeJlKiiE5K6mCwCKyxkVTR6Ar5fgcdTW0O75iGgu75rCAlb4cp6Oe0IGkRSRZ3R/z8aTxL7gd6PIzVHFYlUdCOSqXqskvkq1OmrUWRg6mEdKBadkyMVON5nWndgTd0+JiPuYgGdParAlwHncidIddyfiWuwIEGaal42D2VaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HbOAiTddIONFKU2cdUlkehkEicoyGfaBi4E6drkVkPU=;
 b=klOI9e2LhV3lUSlm9yhaRLu5SD1ySS9XWUe15xE3vonRlyGGhkJgIv5qPfDOUbWg4FXD4ng5NVIAfNe847niwd0IeT0f1r2MWCqKFaXtMbbWxxUV4Uk5+zklLtQA3MciCK3Fot99LsTh4y8vrZoqi0ob2K+ZGupZoEwMvaILFf4=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 23:46:35 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 23:46:35 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Frode Isaksen <fisaksen@baylibre.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "krishna.kurapati@oss.qualcomm.com" <krishna.kurapati@oss.qualcomm.com>,
        Frode Isaksen <frode@meta.com>
Subject: Re: [PATCH v2] usb: dwc3: ep0: prevent dwc3_request from being queued
 twice
Thread-Topic: [PATCH v2] usb: dwc3: ep0: prevent dwc3_request from being
 queued twice
Thread-Index: AQHbpKaLdlKY2UACB0ecXA7rrhNjwLOY5SeA
Date: Mon, 7 Apr 2025 23:46:35 +0000
Message-ID: <20250407234605.ghv247aehsprmkqn@synopsys.com>
References: <20250403144134.518383-1-fisaksen@baylibre.com>
In-Reply-To: <20250403144134.518383-1-fisaksen@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS7PR12MB5863:EE_
x-ms-office365-filtering-correlation-id: ce6b3543-6ead-4013-08be-08dd762e6ea1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L1NHNzNVdkxoT2M5aDhVdFpBSEJ6WnBiaDhKdXRmYXRmdmRHdEtrY1RMVENH?=
 =?utf-8?B?QU5tMkdQdzdpdEJtcTA3VisvTzcrODdJRWFtSkFkK0NiUjgzcXVud3M1WDN6?=
 =?utf-8?B?ZmNlaGhUL0pOVVlDRW82M3RYQnRrdTA0OU8wT3NpQVFwajFyVXg0V0YxemZt?=
 =?utf-8?B?MFY4elRTZ0hWK3JUTTh3YVUzcXdvcVNxeXdFMHhCcUl3aWplODRicldNN0tZ?=
 =?utf-8?B?R2Q4MWFLY0FRME5LZzVrTDV3R1JRdG84RWlxK0NRN05WaW5LOGx2VXlXM0xF?=
 =?utf-8?B?MFl4YUd1bTkwN20va1NmQXA4WWlyd1E4STU4U1p0dDA5RmR5UFg3T1ZQVUxU?=
 =?utf-8?B?RTZpME5WNHZ5Qkk1aW5OdnlCRUNkWklvWVRzUVhSbEVDR244N1BCWjlPdjJi?=
 =?utf-8?B?b0NtdTVQS0wyNDBvVXU4bzQvWFFUMkJrV1IxK0Rma0RKWGVwM1NKNVFzc3F3?=
 =?utf-8?B?QzRIUHNERGE2YlE0NjlKc2QrM2NGVlpMZ3cvcklhSjZSMUMwVVRxL1A5U2o5?=
 =?utf-8?B?N3lzS3hhSE1OUmEyQWRDL2s4OE1KYUlHVS84dE1aZFcwOWZIVm9KSkI4Tnk0?=
 =?utf-8?B?T2JZRHp1YjhIQ0toM2JUUmRYODQ5VnFxR0FzVE9BZ3ZjMy9NK1ltZlZ3Zm5C?=
 =?utf-8?B?RkRUdWxGVER4THh1VDNtaUFXR3MwM2FualVZSDdBL2owKzRDU3k0REIyaEEr?=
 =?utf-8?B?c2hQU21QYzBEOUxqN29wVU5GR3V3aW5CbnIwVWsySDBoUzFVSVk0cnVLTVJn?=
 =?utf-8?B?SEdoNlZFa2lob0VJdEhFMmttSlBOT2tnVmEwZllIeDhwNHdNWnZYU3hGd2Z4?=
 =?utf-8?B?K3o2QUNSdDRQaVdZRU0xRzVaNlJLaVdMUGMzVjRZaHFoeTViSkNPSVJoMHJt?=
 =?utf-8?B?aGFGTnNFY2dyeGtVZXVDbGRzQk1XVFI3U2lXL0c1MzdoakhKRXExQUQ0cG1G?=
 =?utf-8?B?WVl6NTJHRnZBbmRBZFRNenVZVUpsaVdTQ3hFaTdiVFpwM2JrSm16VFJCTjB5?=
 =?utf-8?B?NTkwUk9XT2JUU0N6R3pJaS9jbDdSQTJMUy90dHBHd1hoWVNpVlFmODY0aUVl?=
 =?utf-8?B?RGkzdTdDc1Z4cWNDUlBZOXhZRVpKSURSQStNL09hTGlzU0ViQmNtZzZ0cGMz?=
 =?utf-8?B?TVpRZUtlS3NFR0lNUFpmaGtVd0EzMFNPam5pdXFWN1Z2bEFsVGJ4ZWZCN3dM?=
 =?utf-8?B?ejl2Vm5sMm91eHgxaGpld2w4RDRSTEhGWk80bDZkbk02amprdTUyNk81SUYw?=
 =?utf-8?B?OTlwVDd4UVMvMCtNTU9Ba3Q2NURkVkg5VXZYS00yOVBtZllGNFlWdE1Na2Vq?=
 =?utf-8?B?TUt1T0ZZZVR1NGNUWHpQSXdKZHczdmEzUmZRM1pRR2RVbmZLOTA4VjVRc2Ns?=
 =?utf-8?B?Znd6RWRPMDNtaDJSN3NXa09NakY3cGxJY0NNNXJZK3FpWGJJZ3I5UVVVVnZQ?=
 =?utf-8?B?WlAwMEhPcW5XaFFOTEpGalRkVnpCdFZiTlVPTGZuR0FueU0wdENHdERieEpG?=
 =?utf-8?B?UFR4bHd1ZFlHSWRKcno0dnhId05ycDJBbFhQRkZ1ZGtvSm9OMS8ybDhPTDBG?=
 =?utf-8?B?MDBaMmhQWHNNTW5EUGQ0Q3R5WWwvUVdDMTl5Ykd1UnN3TkQ4TU03ZzR5eGRz?=
 =?utf-8?B?djZFcGlaRlJ3WkVLdU1hV1QrTXRMa1pBYlg1b1doOHdpZDRZS2NrdTVCbUEz?=
 =?utf-8?B?S0hlNDZnbkVaMGpMYXFLVjc2cDZVeHFJeW1YYU91K3FwdXRZL3JZOUo0UUJa?=
 =?utf-8?B?dlhFSnpZWmdRL0ZqR3BQVkdhUGN2ZWoxWGJlVjhNUGR0SzBmSHFFK0tULzlY?=
 =?utf-8?B?RGtJRTNzNnd1cnlvcDF5b0NpNmR4bHQ1YWVVT01LcThKZFV3WURCUkpENUVM?=
 =?utf-8?B?dWxiVVV2ekVjdllMRjhaclYvNHJzMlBqZWFSMEc3NWsyMFBVdUtmMHRJeE9X?=
 =?utf-8?Q?JY2XctbyL5pY/n5RT8fg756Kk20MOhlJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a01NdktFc1VDRDJSeWM3K0JRYy8yRXREL20xdWhUOWw2RlFTUEJ3Uy8vczd4?=
 =?utf-8?B?ajBCeXAwU1J4N0I4RzdXekpxOVN6WGI3cjlKMXBNVG1ZdVVkUHJpczNBQ0di?=
 =?utf-8?B?UDBOQWJPcWwzWmlQeVcrV1hQVHNxbm1LYUhpSGRaSk9XeDFEdklGMlZsL0Vx?=
 =?utf-8?B?eW1namY3QXdjd2VpZnBQYmN4ekE4ZTFJRHA0dElPM0NJc0gxWUxTUjNieU8y?=
 =?utf-8?B?OXVyMWVSK3RWZnpTdWd2ZkRtd1NzcDU1S3JNYVc2UStiK0VvV09Ld0FKSlp4?=
 =?utf-8?B?aWRrbk9FU01IVng4SUgyMUNEZk5oV29SWmlIV0ZKTHB4MTMzNDI5dE1rT3Vk?=
 =?utf-8?B?QlpjZjdkYkRFTzBsZnhzUlo4T25aTFpQTlZNUXlyMkNiaGdJSlc4eG9KK0d4?=
 =?utf-8?B?djNSU3VCSEVSSTJVd3ltL1VkdnFmVkpydTVaTVdUeGtQelI0THlOejExMlRN?=
 =?utf-8?B?YVF4LzhIaDNPNUx4MW5DSCtjWnFnVTh0RC8ycmFaeFF1NndGMjhPTGt1c0hK?=
 =?utf-8?B?Q0JsUGo0bUNNSzZDN2VlNFdLMFJjRFEvcmVzTXVoTHNDWXkzMHk2c2UxWXJm?=
 =?utf-8?B?VTBWU3M0NWJGZ2p0dm1pK0w2VllWVGticStSYnh6T0lNQ0poYUR6c2Q5M0Vu?=
 =?utf-8?B?WkVqQXRCdkpRUTZKdmY1MGxWRmpsTmo1MUZLaUFsL09ES0l0M2J3TnNiY1ZE?=
 =?utf-8?B?UktBVjRCSkgrVkswNGZPVmdGRjk2SWNDSVBOM1VGMGF2YjEvZHVwWUpnampx?=
 =?utf-8?B?WUppUlF5RnNubE5HNGlpMVFsSG9uZ0hhYVF6TmpYU21HWXNiOGRxUFA0WVA5?=
 =?utf-8?B?c1N6bUtxZlVhREFBWkFvalZ5eGZlWjZOZGtXNktlZnQwL1g1K0hLN1o3K3FI?=
 =?utf-8?B?MHRjN1ppVFlFVVBMVi95OXcwT1JVR3VodnpsRDhYL2xvdW5hdzNMaldLTERI?=
 =?utf-8?B?bGhJTWdSelV6bnRBYVFmaDAwYjFodmdqWmRxQk1rc0hzWU1oaHRGYmx2TVF0?=
 =?utf-8?B?OFdBeXVaN2tmRkxndW1RdlB0WlJ4M29aVCs2ZUs3KzI1ejJDN3pyWSs5dVJk?=
 =?utf-8?B?ZFF0VGl5QUFEVWxGR1RyQzdmc1drTWlMbm1PamErUEY0Vk03QkRML0RnVU8r?=
 =?utf-8?B?bjhiWE5YbHNHaDI5RFpIWEM5ZENFREhIS3JCdFpFQzdNNFMvN1plYUhsTHlT?=
 =?utf-8?B?Z1c2amRLNysxdUloNTZmZkFIZlVjVlZUZzZIa01rdjBVVG9UZkp1VVJYNVVo?=
 =?utf-8?B?bE91TDM4SEtBYVdxdjlYSlBVQUJuMzlBMUp2aW5YamNCZU55dGJmd0FQd1gy?=
 =?utf-8?B?RWlvQ2xrTmNYQVBnbnh0bGJLNFR6MVBNZlNva1ZhMER6VUlHK0JkdHVKdWYz?=
 =?utf-8?B?SlovZDExUXVRSC9Qd2l0U2FhdFhodzZzRUtXNEloMnhUeG9MejNMelNQRWRB?=
 =?utf-8?B?NWkyUG1jVnoyblpodUdHM3pJU04xOFdQOGJrSlpGQlk4b1RQdkpjRjZvVUZE?=
 =?utf-8?B?c25CNGRoZ0lmd0o0VWRqVDNZQndaRnJxWUppVnZrTG1ROUN6b2gxdSttZE45?=
 =?utf-8?B?ZWxGMTN3MEVCR3UrQmNEVDNqZ2JkSDdiR3R4bHZpN1U3SEJoMitTUVhqVmJq?=
 =?utf-8?B?eVFHQW80b2tueXpPcUFqMzJKbUZyc1o3bTdBMFlpZ3ZHeFUvako5blU1eFc1?=
 =?utf-8?B?RDNjZ0MxUDVzOVZoSGtJdEF6SkF2azd6Yi9BNm5yM3c3Q3ZLMG1LVjI2Q3Bp?=
 =?utf-8?B?MGVURktyeGlNeWV1elk4K2d4Ri9CeEcwZkd0V3gzK1VvN01jRDY3eE5KRHlw?=
 =?utf-8?B?NHZXRXI4SDA4N3F3SFpMakZrclRzcWxuTXpYd0xqY3BhWTNYS0pLaUs1dzNl?=
 =?utf-8?B?MTRtSHgwNXRrZms0VWxjODVJeTkzTWloMVFmVnhhb2l3Sk1lWTNoS2djcEd4?=
 =?utf-8?B?eTQrOUEwTVcwZldtY2RFN1Zid1pONUN1ei9XM2Fta2tHTEVXcVQ1QWN3MG1O?=
 =?utf-8?B?SUo4ZnpIbU5EL0FzOXZLYUFFMjYxZmhRcGt4RHhTalBVZ2VBc3FhV0gzOGZY?=
 =?utf-8?B?L2xrdzZrNzFiZW4xeFFnVDdTeENXOVhQZHgwc3gwZnZJQmlxVDk5dFdwNHF4?=
 =?utf-8?Q?/A1XQt3EE2ylrMz4XKJ6XRFoE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <85A7155306C9DC4BA989DC2FA31758E8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HnPqRpfmSNJvDx9lODDOGCLq4t4aC55+WdBpOhkWD2QDFu7eH2ZAs2DpRcmvgcVpzsnh5biallmU49QFThuvaCCMnpRlp8sx2VwXkR8UDPSmy2UuGE9HJLCS3X2acL2w4Mztbq+SsVjG9Mq0VPCPU+MR81s0zrJTyHmmHAJ307jy88Ji8BJNT1x5jb6E2Y/6KER69csrIZmSe1IIbT8jh+65/jksWii/9EhF37bSLfNbQwQNBJfhcUR9m8s7tGzYhhnNLk8vwR/j2/Jz9+Je7ZT+heuO3LACfnaipcyATyGk+XyzTY89thXRXenEaUrFoNnjZH01hg1lLRj/S13HDsWnm746H5I/YMPClBR23MmJ5wOKhFcNlrhQGoq9BlDN0zql6K31pJUngMu8ApHZGZ1dubIKvRcpXBCHNj4OoLKrwpBy1FwtOG0LhOr2hao9Tm9vbv0JovN/nDd58MX+zUOmSVhL10eUufNRFD11yJBEDWk+63jzNOgGk96bbDd/MAVoZnmuBzfluYSN3Ahkua4T4ei1gJC47t+uGbJsbeyO1sLl5SkTSt6xe4RX8ecTnuna2/0C7lmKLttXYYQwPLdGfe5M0CYiXGOlroHZkfiXL4ul4cvTWxWIZJ6+Z/v+UWt8NBcmYHyTyVgUB28dzQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6b3543-6ead-4013-08be-08dd762e6ea1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 23:46:35.2523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4l5UEUm3eXJoHYWywJr4AF81GoCsA23dDscxQOA2GNYcE/zruCQK9mfK7VTuGAMFclez5a+P30PUTTjwnmWkfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863
X-Proofpoint-ORIG-GUID: jJMmWH6sQi0XOZgKBUi7BlKlqFYHCsGv
X-Authority-Analysis: v=2.4 cv=XIAwSRhE c=1 sm=1 tr=0 ts=67f463e1 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=VabnemYjAAAA:8 a=kXPVjwUK0ld1wpe2PTQA:9 a=QEXdDO2ut3YA:10 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: jJMmWH6sQi0XOZgKBUi7BlKlqFYHCsGv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_07,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504070167

T24gVGh1LCBBcHIgMDMsIDIwMjUsIEZyb2RlIElzYWtzZW4gd3JvdGU6DQo+IEZyb206IEZyb2Rl
IElzYWtzZW4gPGZyb2RlQG1ldGEuY29tPg0KPiANCj4gUHJldmVudCBkd2MzX3JlcXVlc3QgZnJv
bSBiZWluZyBxdWV1ZWQgdHdpY2UsIGJ5IGNoZWNraW5nDQo+IHJlcS0+c3RhdHVzLg0KPiBTaW1p
bGFyIHRvIGNvbW1pdCBiMmI2ZDYwMTM2NWEgKCJ1c2I6IGR3YzM6IGdhZGdldDogcHJldmVudA0K
PiBkd2MzX3JlcXVlc3QgZnJvbSBiZWluZyBxdWV1ZWQgdHdpY2UiKSBmb3Igbm9uLWVwMCBlbmRw
b2ludHMuDQo+IENyYXNoIGxvZzoNCj4gbGlzdF9hZGQgZG91YmxlIGFkZDogbmV3PWZmZmZmZjg3
YWIyYzc5NTAsIHByZXY9ZmZmZmZmODdhYjJjNzk1MCwNCj4gIG5leHQ9ZmZmZmZmODdhYjQ4NWI2
MC4NCj4ga2VybmVsIEJVRyBhdCBsaWIvbGlzdF9kZWJ1Zy5jOjM1IQ0KPiBDYWxsIHRyYWNlOg0K
PiBfX2xpc3RfYWRkX3ZhbGlkKzB4NzAvMHhjMA0KPiBfX2R3YzNfZ2FkZ2V0X2VwMF9xdWV1ZSsw
eDcwLzB4MjI0DQo+IGR3YzNfZXAwX2hhbmRsZV9zdGF0dXMrMHgxMTgvMHgyMDANCj4gZHdjM19l
cDBfaW5zcGVjdF9zZXR1cCsweDE0NC8weDMyYw0KPiBkd2MzX2VwMF9pbnRlcnJ1cHQrMHhhYy8w
eDM0MA0KPiBkd2MzX3Byb2Nlc3NfZXZlbnRfZW50cnkrMHg5MC8weDcyNA0KPiBkd2MzX3Byb2Nl
c3NfZXZlbnRfYnVmKzB4N2MvMHgzM2MNCj4gZHdjM190aHJlYWRfaW50ZXJydXB0KzB4NTgvMHg4
Yw0KPiANCj4gU2lnbmVkLW9mZi1ieTogRnJvZGUgSXNha3NlbiA8ZnJvZGVAbWV0YS5jb20+DQo+
IC0tLQ0KPiB2MSAtPiB2MjogUmVwbGFjZSBXQVJOIHdpdGggZGV2X3dhcm4NCj4gDQo+ICBkcml2
ZXJzL3VzYi9kd2MzL2VwMC5jICAgIHwgNiArKysrKysNCj4gIGRyaXZlcnMvdXNiL2R3YzMvZ2Fk
Z2V0LmMgfCAxICsNCj4gIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9lcDAuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZXAw
LmMNCj4gaW5kZXggNjY2YWM0MzJmNTJkLi43YWIxMDJiNWZkYTUgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvdXNiL2R3YzMvZXAwLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9lcDAuYw0KPiBA
QCAtOTEsNiArOTEsMTIgQEAgc3RhdGljIGludCBfX2R3YzNfZ2FkZ2V0X2VwMF9xdWV1ZShzdHJ1
Y3QgZHdjM19lcCAqZGVwLA0KPiAgew0KPiAgCXN0cnVjdCBkd2MzCQkqZHdjID0gZGVwLT5kd2M7
DQo+ICANCj4gKwlpZiAocmVxLT5zdGF0dXMgPCBEV0MzX1JFUVVFU1RfU1RBVFVTX0NPTVBMRVRF
RCkgew0KPiArCQlkZXZfd2Fybihkd2MtPmRldiwgIiVzOiByZXF1ZXN0ICVwSyBhbHJlYWR5IGlu
IGZsaWdodFxuIiwNCj4gKwkJCWRlcC0+bmFtZSwgJnJlcS0+cmVxdWVzdCk7DQo+ICsJCXJldHVy
biAtRUlOVkFMOw0KPiArCX0NCj4gKw0KPiAgCXJlcS0+cmVxdWVzdC5hY3R1YWwJPSAwOw0KPiAg
CXJlcS0+cmVxdWVzdC5zdGF0dXMJPSAtRUlOUFJPR1JFU1M7DQo+ICAJcmVxLT5lcG51bQkJPSBk
ZXAtPm51bWJlcjsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9k
cml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+IGluZGV4IGI3NWI0YzVjYTdmYy4uZTFlYjUzMWUx
OTJkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ICsrKyBiL2Ry
aXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gQEAgLTMwMDIsNiArMzAwMiw3IEBAIHN0YXRpYyBp
bnQgX19kd2MzX2dhZGdldF9zdGFydChzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgCWR3Yy0+ZXAwX2Jv
dW5jZWQgPSBmYWxzZTsNCj4gIAlkd2MtPmxpbmtfc3RhdGUgPSBEV0MzX0xJTktfU1RBVEVfU1Nf
RElTOw0KPiAgCWR3Yy0+ZGVsYXllZF9zdGF0dXMgPSBmYWxzZTsNCj4gKwlkd2MtPmVwMF91c2Jf
cmVxLnN0YXR1cyA9IERXQzNfUkVRVUVTVF9TVEFUVVNfVU5LTk9XTjsNCj4gIAlkd2MzX2VwMF9v
dXRfc3RhcnQoZHdjKTsNCj4gIA0KPiAgCWR3YzNfZ2FkZ2V0X2VuYWJsZV9pcnEoZHdjKTsNCj4g
LS0gDQo+IDIuNDkuMA0KPiANCg0KTGV0J3MgZGV0ZXJtaW5lIHdoYXQgdGhlIGFjdHVhbCBwcm9i
bGVtIHdhcyBiZWZvcmUgdGhpcyBpcyBhcHBsaWVkLg0KDQpUaGFua3MsDQpUaGluaA==

