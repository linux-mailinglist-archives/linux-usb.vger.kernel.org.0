Return-Path: <linux-usb+bounces-22457-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA0DA78585
	for <lists+linux-usb@lfdr.de>; Wed,  2 Apr 2025 02:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FDFB1891902
	for <lists+linux-usb@lfdr.de>; Wed,  2 Apr 2025 00:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065DD33DB;
	Wed,  2 Apr 2025 00:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Iel34tuv";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="k/lKBbx7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KNG9pbs8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE8617D2
	for <linux-usb@vger.kernel.org>; Wed,  2 Apr 2025 00:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743552972; cv=fail; b=OhNpB628cBswrh+b/uIdMH30IREOnhJb02JY8Bp3f+0EFd3QR05X8Zs5dIc/E6YSD63nmsMr9SVOhuQ5M6Hw0+0nY12rg4LlMyz4Vhk/8CWfx0UNyLzRYAxnxCNfdVcEhsBAyUGI479k+TJPh2h4NKlHbn9u9oMtyJY0XfeQyzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743552972; c=relaxed/simple;
	bh=gWm6TAlAADIYuSNBM3LOa3tNc9SIdpCf5LpvUTEsPAs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SuVhPftO7jbEt9ThpAOlSQ4KaWUFJq1rSUP3Q5JmnZ3M9/ctZF31VmoFhDeeCf94JzCwz/IaxVMcqEKSpUIZNiNsENmyVyHIEbjmrn8JSIqm4jOp+CpYdNPo9ah9f3EOSPWy74daSyXieUuSLz808sYJegdeW/KPvkqG63w/XkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Iel34tuv; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=k/lKBbx7; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KNG9pbs8 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531Iltq3013465;
	Tue, 1 Apr 2025 16:49:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=gWm6TAlAADIYuSNBM3LOa3tNc9SIdpCf5LpvUTEsPAs=; b=
	Iel34tuvsgl8Y1utmRh5GpbUO9fpbRAS8p4eW5nLMQ/nxqIRCQlMDBRuvv9M7NF/
	/dxVNbhwnHxiYipV626XV+ZE8iB0OsWQUzCdt9mhd031CLHh1Rcg1EDTYlSyPPUQ
	AehJ+/BsvQPgWi95ag6UumpsxLwSs9W1egO1ffII5uMx4btVY0QgVQA0h86In/fx
	d9v9B4fYnRsvr12dyPOr8/AxwtDeCWS+imSGQ//ztyqeIq7ABlMOhT4s1OCIWSOF
	iru47NhmR21HJFXuw6WbAha0myG6G3bMBNtxca5KT3pvUG5i87s7mpGshD6wCK7v
	p/yYala/0YX2Z+DIq+mqiA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 45pfvpqrsq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 16:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1743551357; bh=gWm6TAlAADIYuSNBM3LOa3tNc9SIdpCf5LpvUTEsPAs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=k/lKBbx71V410dWehcX2NwhckR/raWH7qISVB7K7svuXRg1rEOt5saBYRoUTuKJ1F
	 7xy4V6gLJif45hW2aYWZWA+TbBz9s0QtpJCotEpqCTxwbZ+Pr2A1M8ew1//o8oHIwO
	 f+jnP9roRr+2Pe2vzBYsvERpfi77D5JGjfPMsm+ktiPyVXpLmmLHX8XxTkEe7oxKgX
	 IZg0Ngoq6gZkP3SN4kYznb+zK7jJvCdbOQ5DaqaibeAAh/YIjzml6AiNZ+M1qnNz/6
	 4tQ0avEP7wEYhAwgIWT13lrcy5KVd8UCPYm+Vq51UlHcpSAtJR7F9l+noj2iZveVGB
	 MGL11wQEhCBAw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2911940226;
	Tue,  1 Apr 2025 23:49:17 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 70FCAA007A;
	Tue,  1 Apr 2025 23:49:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=KNG9pbs8;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id CF63A401D0;
	Tue,  1 Apr 2025 23:49:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNHV5BvS3g+U5/pR8LazqSNepk+jZsStO0xd73qgWQ/eAEjv5rQSW1DmtRuWYhJMIZlJINrSOohzheEpBakiVjJsCEAQvvIn5O/NQKfg6RMIX7NKdZ9Ng5gkjdTTXPV2IZJRP6J8CzZPrEs+4p5BSpdvONbOV67jwE7eWLTCKrYC76BttTHGqFqxhIE109uQ98EbZvKgpDtEiirhQsLwZTnSDJ6YI891NjnOaWv+XYxRSTxaS9WhX1XdVzDRvYWu3wn7KNuQeSVZI2MXtZXyYsWYP8ctOuW5LgXdJzsin2wA06Fj58tXKCLic41G/kTD8mgYpZQ8TaHIwIWtEIzi2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWm6TAlAADIYuSNBM3LOa3tNc9SIdpCf5LpvUTEsPAs=;
 b=dXZUmOnvh8DardPotfuG991GUacarYtzso/FGIThnQoGzSpQ0kRjyUgQk1TIu4HuRPKPour6VfLeX8n5092b4Dxexmz0HUKiqDzI/VdR7KPKRw0nzWe6s+1OPceofoV8aXLwJchwxfKej5WNAmLRw0+sV9zC+eX0c66edzw56bzSxe4L7RAa/sUa9dJws9gt5nGIAC17WezET3DN3+/BOV7xuL6Yr20s/e/E3Nqpl9lI3R329ptaYVykS1hS7aFP6tsE7eEhJHNgIRn+sxrxAZE8arfitAvxb7KjHdddEtwT0z0Y9OLeVf7FzLwS5GMbHl4tcy7k/Z0KKUt9jiGU/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWm6TAlAADIYuSNBM3LOa3tNc9SIdpCf5LpvUTEsPAs=;
 b=KNG9pbs8lS9lrhuRddraCvMa+piTEHjKoM9+B3cCfwxzxDBCGSnl5yvqw+JRlA1+DessmoYECmpB4SkKamqcst0tV94AUAKzN2CuHMw65eSJBZt9ox4xuU29brfswbKFcTyndLuVydJ0CuPH2zXXLqEGY+seULIW+zjQGmOTsUw=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA0PR12MB9046.namprd12.prod.outlook.com (2603:10b6:208:405::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 23:49:11 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 23:49:11 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Frode Isaksen <fisaksen@baylibre.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Frode Isaksen <frode@meta.com>
Subject: Re: [PATCH] usb: dwc3: ep0: prevent dwc3_request from being queued
 twice
Thread-Topic: [PATCH] usb: dwc3: ep0: prevent dwc3_request from being queued
 twice
Thread-Index: AQHbnyLuqf9Hu8uhE0ul0JwT/TVjubOPgwsA
Date: Tue, 1 Apr 2025 23:49:11 +0000
Message-ID: <20250401234908.npkn5h3vdyefkvxr@synopsys.com>
References: <20250327141630.2085029-1-fisaksen@baylibre.com>
In-Reply-To: <20250327141630.2085029-1-fisaksen@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA0PR12MB9046:EE_
x-ms-office365-filtering-correlation-id: 97a91e82-a8a8-4c2a-a82f-08dd7177cd17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?T1h4L1NlOXpnQS8rbG5zQS9PNjdMZ1BvVzhRODRvb1JZUDlzZHVmNVZSeWc3?=
 =?utf-8?B?WjZBTUhid2l5TU0ybDBVZHNaRi9ibzFFWHNKdnN4akJOVHVmeEtIQS9wZkx0?=
 =?utf-8?B?Y0NkY0Y2OWNWajEvZml3VVp4aEhIaUdHeVBDeVZIVGozZEpzdWpEV0laNStC?=
 =?utf-8?B?TG00MWVzV1NPTUk4cGtzWmJLRFBLcU1mMCtNK3lpcHdVeWNKejZsMWFKTFFa?=
 =?utf-8?B?WmRzTDJLSlRKeDdxMDB0WWRNb0ZSTDEzSWFaVDZWa2x0N0Y5NUE2dGZOdkhJ?=
 =?utf-8?B?eTdxOXBjakpFZkhGcFovUWpxRTl2M3d2NlVNSnhzQ2c3MFQxUWhFZjlBaFh2?=
 =?utf-8?B?SWU4NXFPQzByMklHeDJseTR3VDBPbm5jOFFVeWRqOXc3UmV0RjJSZ2xLeEZx?=
 =?utf-8?B?bmozbDBNN0JYdkw1SC90MDhvWndqZndGZHhJZDJUN2FFMFFJeDRFNXhXR1RB?=
 =?utf-8?B?MnYvNmc5Y2dqQmRmeGdxTUxqTldIdGtqY1JDWHZNdnlXQ1ZIMzJ4aVVoVkRC?=
 =?utf-8?B?a1NGdVg0bFA4Z0JUOGlQclZzTWJ2RnRNOUFEcm9LWHFhKzFteXFmdWZpUUZz?=
 =?utf-8?B?ZUxsUHlPTDJXQkRoWmJKSEI5MGcrMFAyTzZ0NG9YWkdBWnJTT3l5RCtsSjR6?=
 =?utf-8?B?U2ZDbEhCRlJ0ekNXR1BLRGc1YW83cDBYYkRCamt4d2JBS1FxMXlTTEQ3YVpr?=
 =?utf-8?B?YjFVK1Y2aThtWjRIOHgzRVI1eFhhQjRMS0g3b094NW9YNnhIQ283cFhSRENJ?=
 =?utf-8?B?MkMxMnJUbTZLeUpVVUY0aVZ3MXhqSkJQaHR5ckd3eUF3SWNFaHoyMlR2SmJ5?=
 =?utf-8?B?eC9majJUd1BkMW1JcXpLK3RWeCtjMm4vblN1anlRUzdGdk9PcDh0cjcwM0lo?=
 =?utf-8?B?QU43UEJpMXA3amEvb0FSelR0Tnh0WUZOUmtJVitMYVRlSUI3UGJCLzNXQXNU?=
 =?utf-8?B?dE53aHpuYkZQYmYwNjRGejl6ZVVKeFZHbGhNRXFlak9CVERybk1BOU11ZmpP?=
 =?utf-8?B?TDd6Mis2REhHSVIwOTFpVjJ1bjIvVUFsQkdSeFBJTHUrZGZ3dTF0MlU1SWd3?=
 =?utf-8?B?T1M4WDduQkFjZWp6ZFdtUzh5SSsxcW1PbUhEbWducHlhYUZCbUlvUDdOUHR3?=
 =?utf-8?B?VFZyWVhlQklCQUhuR0dubWI3dHk3MFM0dzZOMHF2M3dEVEZES3ZFK210RmFW?=
 =?utf-8?B?VU1tTTQ4eDBxbzFnNXhoaEJLd1FlSjZLaXVzL2JZVWs3aERPdHVFWjV1WUht?=
 =?utf-8?B?ZnI0ejE0NUhraGdvaCs5bnNFMHFTMjQ0dko1bENiQmFPQXFHWi9kVGxiMm81?=
 =?utf-8?B?cExKeGlYd3lST0t6QXROQWRUejFaU05tUTRxL2xEYko2ZUllYTduY3JGRkQy?=
 =?utf-8?B?dzRYUEEwWE5EMXh2UUpjUzR6R05NVm9ud0FMeS95OUp6bmVldWdrRWdpUzNy?=
 =?utf-8?B?SFMvTVFrZW9VMW82MVFEVHVlY0JKRWdlQ085LzFGN1FZTVpuQXRYczhOcGt6?=
 =?utf-8?B?RTdBNHNNMHhCUUZrOGhkR3J2WnZrS1NjL3dLUWZzeXpmK1pBZFNydFBFR25n?=
 =?utf-8?B?SGVNTFg5WGN1TmJNb3krbTV3VGRxSXZrL2ovdUlvSHQwWCt3UUNETXZDOGls?=
 =?utf-8?B?cnNWNGg3ZithdEI4cmVhZ0NQRnc0VytXMGNBbHNPcTU3d1JPREtZNGJrRG8y?=
 =?utf-8?B?WEFXYW95TnppWVlCZWx4YmdDb1JxcklXQWJFdjRzcUpHRG52MVA1VXEyUCtU?=
 =?utf-8?B?MW1rUVZjblZrNHZYUm50R2hBeCs1Q3BiK1hrR0ZKeGRuT0M1OW43eVlsM2po?=
 =?utf-8?B?VUJFWmJnSUVjOGN3czJ6eS9SMmFTWVpqQXFYeFIvNEpLWXU3OHBPMDhDSU1H?=
 =?utf-8?B?MlVEcGw1UUltNEhOSWQ5WWI5SlUzNGFubFhDQk00bGFURkFySUJTNEI5ck84?=
 =?utf-8?Q?rCGwLuPWb6E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aGEzTUNMZktUOXBOQWpSUkpnVytkMWloVlFVdUpGdEl4cm1PQXpVRTU5Q3I1?=
 =?utf-8?B?T01oZWExek1qcENEaXk1dUdiUUc5UTdKSGY3bTNrTmZBdWc3cVRmczRVY2tC?=
 =?utf-8?B?WlRZQ1RubE9iUjAwcVB1QWQ5TG9nR1V5R2xOT1ZUR25NOGlGZUxvK0pMYWQ5?=
 =?utf-8?B?d1FjQjBNRlp4aW9RQXRpdU0rWk5zN2E4ME81ZTc1UjBRZUoxMnp4QUx4WWp3?=
 =?utf-8?B?OHl0VEQvbHBadFNCN1RNQ0JrR29ydk8wTG5aeUJ6YUNKaTRFN2VPak5PTW0r?=
 =?utf-8?B?QmpZYkxOK3JXQ2lXOVNacGQydi90aDNtd2dhQ09HamF2RU9QS2xJR1VINmg3?=
 =?utf-8?B?aFJWcDg3VTBTQ2ZBVUtzdTVjdkZHc2VPR0lURFV0M3VIMDkyTUQyb1N2VEhl?=
 =?utf-8?B?SjMxSUdvTmVjL1lDY05OSWtGMm9ONDh2UllMM2VkcjVhekNKUWxOdkV4RmVF?=
 =?utf-8?B?aXNsaFRiVE5aYUoxZ29tdEovb2ZFRTBvZjdOenFTSElpWWFrOEF3U3hhL0s0?=
 =?utf-8?B?MGVTSXZ6dWtHOXNpcllDbWd5M2YzTzR3K3J5VVNXRytjZFRiemZYdHpWd1Nw?=
 =?utf-8?B?OFQxUVZ4d01oS0x4TlpwRHJGYTM2ZGJIRG52VXE4Q1dnS3hwRldMUGlFM044?=
 =?utf-8?B?TFB0dFRNRnJDR2VVNEQzUURMOVJFYktRTG1hWHppMUUxWHQyaDgyMFVjYW9X?=
 =?utf-8?B?NURWd2RUckg0eG51UFMzVWRBdG11T2FHNG04dmtLcUQwL1VjOE5sRkxPVUh4?=
 =?utf-8?B?WVg4MFBPZUd5NjVKN0lCRC9RUFFPUkdEN1hKTzREYmc2RFROT0JKbURwMVJZ?=
 =?utf-8?B?dzB3MmdMdGdpWEhkVDNKSlN6SDhjN0lOU0NrRURHdnlMYjZWUWVFNFNUeHEw?=
 =?utf-8?B?UXY0N05Qd1liY1N6UzJxalZuSm5XV3ovUVRUcDFWYTBLamZheFBuVi9JMzhT?=
 =?utf-8?B?Wi9INXB0OGlSdWt4RVFFMnMrSWJoODRra2lSNCt5dyttcTNEVnd4Uk93SXdw?=
 =?utf-8?B?WUo5WEpLaklNQXAvMlQ5UGdObU1hZEV3VXMzd3NlZDFQMGlpMmRkLzlFZTFG?=
 =?utf-8?B?SCtUN2dlZVh5aDJYYmhRbW1nNlBFNlQzRjJLTVRlUXlzRnBCeTF4YW1oeHQ0?=
 =?utf-8?B?eTVNeFNPRFVseXB1S2ZacDNMSDk2ZlIvYUxFdGtwSjdhb3U0bGJFNGZuT3hZ?=
 =?utf-8?B?b25ycCt5ODNEMlhiMEhIYUFOdWFMbUtxQ1I3bjB2Q1BGWTJHdEo0TjNVa3Ja?=
 =?utf-8?B?eFc1Zjd6QTBTQnhWUWVKV1hRSVdmdGUwVFV3TWNsSXNVMUpSMEJDV0pUa2dO?=
 =?utf-8?B?QnhTZXhtSXFFdWZRTnFybjkwQnFSMDhrVlh6YWxXcGdUc0tVQU5xYnI0ek15?=
 =?utf-8?B?RkdXR0Q2cDM2UTFqdjdZV0k0azB6VTV2SGJtclIzNGptWlgzdnpwSDUwVUl2?=
 =?utf-8?B?SjkydDNXQ0JEZE5ldzZVY1oxSmtobGkxaEV1azVpNWxLd0IzTUw1cmVuMFhW?=
 =?utf-8?B?Sm9hbzMxczBCNk9ZUGZOMExEcDJSUmxlaDI4cytBcjVKV0c4Z3hYaFJpQkZ1?=
 =?utf-8?B?bEVXck1vQXlCSjIwcDBSS3FkNmFkbGpZT0l3cmJJVStYMjRyRzhQakJmVGMy?=
 =?utf-8?B?MFZhYUZSdDFtNjhGcmM3SFBaUW9vcE9SVjZKSXJSQ1dZOVBEcXhoc2grUUR2?=
 =?utf-8?B?aGY2MG1NcXJRNjlsbWdlQUw1VXdyZHBLTXp3RWI3dld2L0VIMXdFNDNtSzdM?=
 =?utf-8?B?cThMdThRaW9qeHRLbkxodlVETW9LbGNzRnhtNElyVUZJMDY4c1VjYUVMZy9K?=
 =?utf-8?B?ZnlrdUNWakJQWXJMbEwxR2dsL0tHZUMzcTFjSUNiL0V6YThrQ3pQYkt1STIr?=
 =?utf-8?B?b2NNd0dxYVVRRGZEQlMwSU5UZy9NS0JTRThvWXRXS29KbjdoeExSMmRjNm5P?=
 =?utf-8?B?b2NhNGdLbWpNK1U5MDM4ekFIcmxoaGhiZ2dJY3ZmOU8zRk5BanQ5Z2FpYjhV?=
 =?utf-8?B?b1JDWTAwNDRMNjJDVENuQi9YeDA4Mk5XZTJDQ3Nabmp2Q01BTlRBMUtqZzEx?=
 =?utf-8?B?Q2pjdXVLU1QxaE8zM1lqb0QzRjJGNHExUnBIUW9TN1BVb0tuM01SaHZwK0JN?=
 =?utf-8?Q?xAPJ92NVP1o0iV2hzKbH7mx8q?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D7386AB7B9B85418841EC238853AC3E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MNCEeEaWZyxg0xzA/YF6T4thkEp10qifVtnVoB7Ei0m0cIpreiNT1K24XACOyDHv76gM+lFKa9Kwh96itCZzouiE1DGVUqYd7ZjM7GqBMiFFfEEl3FE8wpR54POXkrsBGGh0cg/QqEI3JeTmWhIQ+rmbj1ZC/Y9uT0JXozzHm+OxY1F8r5TExxjjkozBt7oXYc8K6JqEfy5MwApIH0RI3F3kOfbjpPlj9WVM7NVnQDew/tcTg7c9siZap+KzM10HhkZ4/FI0GfEuVmgu2rvNRpggYQt6vAyKeFPQDMcrg7j04/8jt67MZBvQFIAx+WUnz45OwgO8OydDbeRJa436IqUZJtzhDM6aQm8hs0ru6BuBcPmlEYdhvV3bj+ZdsH61pYvZ/WC6GiD5QS0RFvNFEgWx5ryS77RP8UVu2pG6wETuC9sGfj7IjGStyxGHEONjevNLF4LvVWTgQ0jdiqOli6wYzk29dhBPSe/OeAcPNYvKkb9S9wgneiu0eMv2SJxqEk0bTqDnkRIS2n8+JW+YrGHjZ87hZujnWMuBXevYuFZGY+eAx9JnjnI1eoq1uFe36+EvlvC853qHGwYvdLOzx4+2JvG7x8b7OtJIv8GPlf62dpbgTu74SMDjWTiiemqoRsI8jbO2G+LyBsZJjU/pQA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a91e82-a8a8-4c2a-a82f-08dd7177cd17
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 23:49:11.2254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /YE+RXA9cnRThBmdHjkgOaYJJhnuliIyBFACixY8L+0YJnCQixU+9EQO2p3oYjaCvLI2a1jH3cs4JhhP6ggDZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9046
X-Proofpoint-ORIG-GUID: SBs0AUFdW2dWVMq4Xd-AKzNG_rzyE79g
X-Authority-Analysis: v=2.4 cv=Y7/4sgeN c=1 sm=1 tr=0 ts=67ec7b7d cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=H5OGdu5hBBwA:10 a=qPHU084jO2kA:10 a=VabnemYjAAAA:8 a=Ylell4bZ2m-pHLxnI0kA:9 a=QEXdDO2ut3YA:10 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: SBs0AUFdW2dWVMq4Xd-AKzNG_rzyE79g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_10,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 spamscore=0 phishscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010147

T24gVGh1LCBNYXIgMjcsIDIwMjUsIEZyb2RlIElzYWtzZW4gd3JvdGU6DQo+IEZyb206IEZyb2Rl
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
IC0tLQ0KPiBUaGlzIGJ1ZyB3YXMgZGlzY292ZXJlZCwgdGVzdGVkIGFuZCBmaXhlZCAobm8gbW9y
ZSBjcmFzaGVzIHNlZW4pIG9uIA0KPiBNZXRhIFF1ZXN0IDMgZGV2aWNlLiBBbHNvIHRlc3RlZCBv
biBULkkuIEFNNjJ4IGJvYXJkLg0KPiANCj4gIGRyaXZlcnMvdXNiL2R3YzMvZXAwLmMgICAgfCA1
ICsrKysrDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwgMSArDQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3
YzMvZXAwLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2VwMC5jDQo+IGluZGV4IDY2NmFjNDMyZjUyZC4u
ZTI2YzNhNjJkNDcwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2VwMC5jDQo+ICsr
KyBiL2RyaXZlcnMvdXNiL2R3YzMvZXAwLmMNCj4gQEAgLTkxLDYgKzkxLDExIEBAIHN0YXRpYyBp
bnQgX19kd2MzX2dhZGdldF9lcDBfcXVldWUoc3RydWN0IGR3YzNfZXAgKmRlcCwNCj4gIHsNCj4g
IAlzdHJ1Y3QgZHdjMwkJKmR3YyA9IGRlcC0+ZHdjOw0KPiAgDQo+ICsJaWYgKFdBUk4ocmVxLT5z
dGF0dXMgPCBEV0MzX1JFUVVFU1RfU1RBVFVTX0NPTVBMRVRFRCwNCg0KTGV0J3Mgbm90IHVzZSBX
QVJOLiBQZXJoYXBzIGRldl93YXJuPw0KDQo+ICsJCQkJIiVzOiByZXF1ZXN0ICVwSyBhbHJlYWR5
IGluIGZsaWdodFxuIiwNCj4gKwkJCQlkZXAtPm5hbWUsICZyZXEtPnJlcXVlc3QpKQ0KPiArCQly
ZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiAgCXJlcS0+cmVxdWVzdC5hY3R1YWwJPSAwOw0KPiAgCXJl
cS0+cmVxdWVzdC5zdGF0dXMJPSAtRUlOUFJPR1JFU1M7DQo+ICAJcmVxLT5lcG51bQkJPSBkZXAt
Pm51bWJlcjsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2
ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+IGluZGV4IDg5YTRkYzhlYmY5NC4uYzM0NDQ2ZDhjNTRm
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ICsrKyBiL2RyaXZl
cnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gQEAgLTMwMDIsNiArMzAwMiw3IEBAIHN0YXRpYyBpbnQg
X19kd2MzX2dhZGdldF9zdGFydChzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgCWR3Yy0+ZXAwX2JvdW5j
ZWQgPSBmYWxzZTsNCj4gIAlkd2MtPmxpbmtfc3RhdGUgPSBEV0MzX0xJTktfU1RBVEVfU1NfRElT
Ow0KPiAgCWR3Yy0+ZGVsYXllZF9zdGF0dXMgPSBmYWxzZTsNCj4gKwlkd2MtPmVwMF91c2JfcmVx
LnN0YXR1cyA9IERXQzNfUkVRVUVTVF9TVEFUVVNfVU5LTk9XTjsNCj4gIAlkd2MzX2VwMF9vdXRf
c3RhcnQoZHdjKTsNCj4gIA0KPiAgCWR3YzNfZ2FkZ2V0X2VuYWJsZV9pcnEoZHdjKTsNCj4gLS0g
DQo+IDIuNDguMQ0KPiANCg0KSSdtIHN0aWxsIG5vdCBjbGVhciBob3cgdGhpcyBjYW4gaGFwcGVu
LiBBcmUgeW91IHRlc3RpbmcgdGhpcyBhZ2FpbnN0DQptYWlubGluZT8gQ2FuIHlvdSBwcm92aWRl
IHRoZSBkd2MzIHRyYWNlcG9pbnRzPw0KDQpUaGFua3MsDQpUaGluaA==

