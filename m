Return-Path: <linux-usb+bounces-35817-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPJ5EymnzWmvfgYAu9opvQ
	(envelope-from <linux-usb+bounces-35817-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 01:15:53 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A91F23818B3
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 01:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B319330CAFA9
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 23:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807003EF0B0;
	Wed,  1 Apr 2026 23:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="deDdiawI";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MVKajWt2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pO8ic8db"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695A7296BCB;
	Wed,  1 Apr 2026 23:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775084685; cv=fail; b=jm9I/CSn/UBQOOVbOpdZSXLOgwaYdqudfX7YvzdCFvezNXYJ9NnLWl3y7aywV2bqrg5DUx8A/iOWB9kLu4SVGZUtPk1GLsG4lggFJkNCdsN9dhbS+beWjfKC3OZKG3CpJgJ+I4mjz8phxcU1jLyL1/oGob0ZuLCxECAJn+RcFmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775084685; c=relaxed/simple;
	bh=rli2hVImRwNLQCTWYB6FrEp4hhevvNm1W23s89RW9NU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RPuK1NyPnyV6Ds3rta+HuUcdyi8eiYio2jrpgSfhGfZKjOmCg8H8pxjaNXj6P4Lx/sJwCxFs+7+bRYHKYTy1HsIiQ6RjstqayG3zEMbEyD4PU9hZfW6rQopcSwid8EIstOBoSPpcZL8TZbvFGSEXQl9ux/v9irLcrjGnqF2fA0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=deDdiawI; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MVKajWt2; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pO8ic8db reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631J7Bas1644273;
	Wed, 1 Apr 2026 16:04:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=rli2hVImRwNLQCTWYB6FrEp4hhevvNm1W23s89RW9NU=; b=
	deDdiawIuFUev8jOV5PRO3+Y/CJqszFmSLQE9/uAy5703dP2V2jRov1obQnqwrKe
	LxyJHvauDd+jXWKMWl+UjE20EmZSLupJ8mQy+kcZG8kZOyZOwreOGUN3F/AdT3P1
	823DaDYU++NW6dqyiH/nN1N1JTp+S8kFL6nIkCjnfUeNe0HAxfb/JM2/uK0vg6Ks
	8xp8uXIa2A8Kevr5DbEFmq3wt5KIajmkAYkeULO5mOW9uj5frJqSWn636CPze/Mf
	Adu1+ZRxRXrZFDgqZJfeunaOyrdT/fCTVmgjfRlyQWsT7gwWXv6F99fen/pgLUs4
	wcHipOogt96AJq9EgkZ9Cg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4d8yq3p27b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Apr 2026 16:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1775084651; bh=rli2hVImRwNLQCTWYB6FrEp4hhevvNm1W23s89RW9NU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=MVKajWt2VCMcyPbBqydgvEb7Cfyyk3ToeA3UYTmdPuMkQ3HCgdvRHuftWBZDQl4Pi
	 r5gx9pkJzQo7cSjNJc0v9Y6K5VwnVuiRN/GFXUkN5JI0fDOnPkqRgjLURYSchJ84Xb
	 iVt2MZLK6tfugACtu9FFVp8x3kdRjFm/YCg0dapsbdkImTDCyTazys3aXsuKlp3+Dr
	 VinZGG4xAWX5klRzeagrgF6oGVuKmrxjn8nNgo6gBH/JR934y1aWINaQtYeINk5/PV
	 dUOXy2fMVjEcSfutDLgYZUAsyOSpSlWjnOFxJ085SbG4GCjKVZb/2HRW1tMZuTjn5S
	 mF1BupanH40AQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9B9EB40136;
	Wed,  1 Apr 2026 23:04:11 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 0DB07A0296;
	Wed,  1 Apr 2026 23:04:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=pO8ic8db;
	dkim-atps=neutral
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00403.outbound.protection.outlook.com [40.93.13.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 853CF401C8;
	Wed,  1 Apr 2026 23:04:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HiCqfHbvE0lJ4IkQWW7e283cSm1qnpgtU679ioknYbUIHE48bzIp0HDSKMx9M+o1CBNM+4XBGGPc4/JmUwJgJA+DzVzBDG2+8ydOJbdVJlWmVX1zUpsvh0/Y4dy2GRgDt9yD5Inr/p9bq1HMQlDjeiPgWpE07XzszepG/NGEfdnzfr52BoE2Uahe5XP20k0ALSJ1tJD0zNRsXq6yphmiGd/jqYUmF/jB71Z4zCHj/xtsaRLZFDdSr+hXB+6mJ/0f2H79D7WMVAyVRQkHIjUFtM+jzqLrkL+nFoSWVegKw8FYLmR7KNq6WrzYay1NPwOcI2mtx0INwNO/dhc57qbWhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rli2hVImRwNLQCTWYB6FrEp4hhevvNm1W23s89RW9NU=;
 b=brPZJvLhc5yvkGpevcWsrA5sY2L0gdEA6ejpBzE4NeTtpxjEGpMa6FCFxS+R+xLTfGbdOPw6ARVw4ecg9VgwdxkmnQR891gHK623gZQVjSEhL6O9oT1OZtUzg1A4qrxWVnlIDGwjw6IxhlJZsVMYZxAxP83RLJ0PpIazWGh67DWGkucZjhyCmbXxoPr8zItFhtJq/FzKEWO7MUj0J5qUbrb/Tdr3PkhC7UJKPokhTCb1aT5Y1MPA8n/lX6uKlyZUot6yD/+xyPZyyejkUaeNL24vz2xiNqFKtYBUQC2znv/vVaaHQocYVmWb1ATVWnR9udzUhKU8ABQvCEsS2om5Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rli2hVImRwNLQCTWYB6FrEp4hhevvNm1W23s89RW9NU=;
 b=pO8ic8db0nK1rOkN+YVNkyCpZwi4tjVHIRpNZyJgtt3NoYkn72E7/BQ3w8hg6FKJOEF+YV8eyw6JTqo/VD/ZS7sa0EvH4vzZ74Rlm4PeyoNcNSduDL+W6dhH6KRSRTlBJM7UWZW7uTMf7tZJHvGH/GfU1wWza0InVsjAspZucXE=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB7138.namprd12.prod.outlook.com (2603:10b6:510:1ee::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 23:04:05 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9769.017; Wed, 1 Apr 2026
 23:04:05 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git@amd.com" <git@amd.com>
Subject: Re: [PATCH v2 0/4] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2
 controller support
Thread-Topic: [PATCH v2 0/4] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2
 controller support
Thread-Index: AQHcwHfo7FzGs9AZxUynlstD2BlPf7XK1riA
Date: Wed, 1 Apr 2026 23:04:05 +0000
Message-ID: <20260401230401.w2si3gnqvzlszduh@synopsys.com>
References: <20260330190304.1841593-1-radhey.shyam.pandey@amd.com>
In-Reply-To: <20260330190304.1841593-1-radhey.shyam.pandey@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB7138:EE_
x-ms-office365-filtering-correlation-id: 00efd0bc-ff8a-48bc-ed9a-08de9042f92c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 Gr8BSdVuWqr9/jiJpTPdM8wViaANXIB+AV20RFsw4Qd0O5hxHRY3ZjZwFKw+Rti1D4OQnM1wUri8aDQhcMrKtZoOKHPkGoECjhExPd6OB04tptC29GGkbmdxRegFwEc/0/Rj3lMlZovRv7zB4645jzE85YRUFhWcJckUtbJZTnAQz5jCnFQtHKmj0bWrKtL/mWVE5ySmEKWth9y3cWsSijwK6Aqj2fDR209Bsjuw9aXQdu5JCMT7uG/o6R6faB1mUkF9i0Tfcl0KdaYrXPxrfVtD5bTFyVn9H6qRMqjpMDtQTweyXBKYKJpc084p0jtevHgh9ZDPZj3gB75dsN3ElijYNOKFagL65jY+I62pFbWtxVsWcQUL+dB2QszjticAFtWb8rJfEqpPQqK7tR4kncXNwMJyyw7gS6sccBgkmCt7HPm9DmCNS5vtP/WXsU3Wp9VwdhW5Vhh+tY4Du0El+XRs81iVZb5KUvk6j5vTWCtkGAy7BFQo7dEgqCoZCgsNWfuo7WLen9kqDkkI+uWwAJtT4IjVgWfldZ7FshITu0u4d8yRwLOXQsoMH52HiedQNRcWZH55Cso5fWWfLaZ7rBk0exgEw2bnHXKfKzQXx9ZwvrbyW/zeI+Dt2DVr9UbAZKBrDw9oWpgF9FzJW9ZZ5+VGNAB3nDhe05Y4CflsH2L9yX+MUKMAHSOgKvMg6YaoeiwRqsyvphBaqZgP5bppk+ZloC7paau+z/Bk2WVjmyamBoxOx05sTvsrVdzxRpRlCiHmCdhT+3K979Dcp9HRQX0t61hp3oCnabwSExQONFE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OUpDd0pyY1VoMDViNWZsd1VkSVM3Q1F6SVJtWnRDUlpOdWwxbkNTaHhrTjhW?=
 =?utf-8?B?YldxVVd0TE9SVFNHZXdQbW5KajNtZ0pQUkZvZGJ0WWhvVmdIV1hYVWNyWmpt?=
 =?utf-8?B?WVJSeS9qajh5ZWxsL1VnK1BtVTZkODFYTmFaUkFuWGg1VUwxeWZMOTk5d2d4?=
 =?utf-8?B?VlhMaWplcTlmYXYwV2ZORDhrVHNlbDdKV0JBakJZNmZVZ1Z5NFdGVnlFY2xJ?=
 =?utf-8?B?TkRZTjNYZmZYNzdSMkNhSko3ZWdBUFN0eTFlT2NYRXREVGIrWjJTbFdWRzdR?=
 =?utf-8?B?bWxzS2NPSzVTNWUwWFZkb3FpTXo0dFFjTUhkS2JEaTJBTjMrL1dtSXN2SlUv?=
 =?utf-8?B?TFFEYmV3aDhDVjNZd2dJaGxyeHF5YzJ0dXVESnBYWGF5d0RJYkdWaFR5VXp1?=
 =?utf-8?B?U21iTThjbktXVWNlc1JwUEc0YU9OaFdQMStTbnhKejhacklKTThsd0JLcUFP?=
 =?utf-8?B?OURDZTBYcDlET2NIOHkvektCZnp4bHF2SG9KYk5rK1R2bytNQ2NYdEhTVUt4?=
 =?utf-8?B?dXhPazJqZE9hQkU5M3VGZ1lUM0N1NzVyT2RwSXlDZ3hOVnNrZ0orUDFncEN1?=
 =?utf-8?B?NGtISUR2ODJBejdEUGdqdHFnMnJIbG5LNWpYbmdydkxqNDlCVDZvdGpDMkNC?=
 =?utf-8?B?dXMrU1h2V085aEN5Um5jZXdMK3kydmNRSXlCWmNuV0d3WTZGUlhIOEVVRzM1?=
 =?utf-8?B?TzNkQWhoclZWdXN1bXg2M3VST2VQeXd3V0tFTjI3b2c3VW9pSkdGOW54UGxM?=
 =?utf-8?B?MkFteTZUaWxlQ0o5c2c0SDJFVmplVHNqNVErZEJCamQ4MGNDKytsdDhSYkRu?=
 =?utf-8?B?RnIxK2xzMmVxY1prUUMrYkdtM0FEOWw2TnpLUVlEMjdPZ0ZnOHN6RlBaNXRY?=
 =?utf-8?B?UzFLUzhYQndwTyt6VDdmUFhjZVFhdmhiZldWSTM1QUJQQ2toUUIxQnA1akNS?=
 =?utf-8?B?dmxjZHBNTGl0amJkZjJPSkNwTG9ZaDNsVHp4b3NGUkU0OGV0dXQ5emdubWFB?=
 =?utf-8?B?eFRpbjQ1UldyQlpCZ2xwQUQ2Mm9jRkI4UzFDZndVa25uQml1SFZjWU5Wc2gr?=
 =?utf-8?B?MytUTUJtTmN3N2RuTmhyM3EvcG4vVWZ5R04xRGtFQWZ6bklMbXlPQ2NsR1JX?=
 =?utf-8?B?R2EwVFZYcG91NDF1dE5TTGtYWWc4Yk44dU9pQWwxWkRNTmVXZXBmaHpYa2Ni?=
 =?utf-8?B?MzJZMjVxam90SmZUT2I5QlJGQkpqb1VaWFJUM0I5WXIrbVlON2szZkNKNWF4?=
 =?utf-8?B?YnRQaTlYb0J0czJ5alEwZUdYbUpUR3QyTzZoenlrTGlsRE5QVjdOd0s1NDYx?=
 =?utf-8?B?WFBTSmJheWFLQTFDZVJqbEYwTm5OY3N5YUpzYzR6eVhrRTBTMDdjYmUzc0JD?=
 =?utf-8?B?SS9Tb1JUUWFkWFdVMXpzWHZhTUxuVjRqVWhxM1U5Z2dUY3U4eUJ6RjNzamFn?=
 =?utf-8?B?WS9oWU9BdXZmOFcyRUEvNk1hc3V2WldlOU9Jb0xLdk80cTc0N1pTQmczeTlk?=
 =?utf-8?B?S0M5ZnNUbGJRK2JqL0YzMzkwNFV5VmJRdHlYa3plb0ZBSmlFRmppNE9aUGJs?=
 =?utf-8?B?bUhJbnVzQjgyQ0h5WStVZmZDUnVUQWd4ZjdaamZvdzJWcWRpVG1icWNXaWhD?=
 =?utf-8?B?Ym9XTzVrMlVJYUt2dE1RcGpORjh2SmtQUjYrR0pnMHNRUUV4N3JjNmdVQmU5?=
 =?utf-8?B?STdMdDg1MEwvM0JuTDNrYXdyV1ZuUXF0N1hKVndkS3krS2NDZ2YyK3IrVXQ3?=
 =?utf-8?B?R0x3MjJiWi8yZmQ2YnFsVythblZLUk9sUFp6SzRQdXVIV1BFOVV4ZXBhNk5X?=
 =?utf-8?B?M3NHeVZtcVlwajEyNFFKcTVoU1YvZHpTNFZ0U01tZmFTZ2V2OStaS1dVT296?=
 =?utf-8?B?ZnpVUVpQZ1dJajFsbkU2VlM4aVdNYmlMZHJwajVZNFdnaG4zU3VuU2xnSGRa?=
 =?utf-8?B?dVVpODdOTW5FOHpCZk8yeEpXZnlROG5jTEpkTEpKVEJlMGdvZUxra0pFN1NP?=
 =?utf-8?B?ZjBTaXl1U1N2V3JPWlpKM2lVVm9qa0JOT2kyeU5XMjdMZ2p5N0tJdlZIN2k1?=
 =?utf-8?B?M2tqWFgzN1lsd01jTSs3bTRWYVM3ZHowMkZmZUluK2MwRWRFd2hLQ0xrS0lM?=
 =?utf-8?B?Ujl2L1JJWG02K1NJa0srMDAzVGJEOWg4Z1RmazdjVjlCU0xsbkNDNnYvUVBJ?=
 =?utf-8?B?d29UWlRaQlBscDhMV3hSLzUzS3ZoSDF6QnJJOWdmc255VTY0MmZpUmhYYTRj?=
 =?utf-8?B?NHh6ZU10WG5ucGp1dldJOGw3V2FkYXVmdlVSRlJ3QWdFaWpyRUxCV1BCRGR6?=
 =?utf-8?B?K0RGRFFzeWhFWVNzSnE2UHVyR1RlcnZQbTNGaWx5Q1BPTkFQY3ZUZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E009DF23AF7F04ABE0479886BCA7BE2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	jPjYX8JMBURKwpRxLO7/VYHK2Z80eMs1NTrcL/CVjVmnoyLHhtrxaH0OB7rpHTZMtHJZY5jkGHnzR+yB52E66Rq4p3Cuda/K7WEtwTQ572e8XMcl/X1evfPSPaVNCRzX2s9hlpTF59++HavdxK2/MJQLzB38N0j0OzuekIA3g/lxC9jP6SxzrqZioIOZOTbJjNDUf5/l1IvBvKpYi/TEH+4O3Q6i35AnzeY5uwSRoNv4baneiWJQb+cF8S3NcAFogNmK7nFuDGfSfThjAZy6C7nUKUtjyKDxjbVTLI04+T2+v1cXeoC3gXR8vGUSEU3wwysYyUOWGiqYCua3ezNwZQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uoLDdXrXI6bjyu9jseMBiapL3KAOrtxg/0+0+BaEJi35H/eLaVAcmIs+HeJeQPmK3e3I3dJkLMOVtXHjJ7zN6b9ZnPYM9aOHiS3vuyRwQHZ+3mAEADSh6SerkZlMjXfQmZaGcvJvPMx/dhoU09UMZpMIPh8rzS2UCkf+qVctJqFXQY6+uQKGUZk2KfrG9jQtEYLSuR91UiQKv/n5GJduHFje8en14XtdAdJCxpBRacxrhU9jgg03eDy8eH/TV6wzO5Yo3lVh5QGqybCBrMiuC16lc/oyOy5wuM82qFLdeZ7drbr/2cnZVM43GQ8YWH7zzWWJgEHO6kApPVvFKR8P70seYOR9DMkBgHnURxp9DLD8/Q4yXlLvNfwdcs/TBTbEkwGue6ID4No82TMbsyIHlmzG6XZmLmVUgf9kAb3I3joUsVhqSYN6ti5aXCw7UTbw80Wfx6OS6lDiPFELpcx3D5mVfaAL3SKT+HdjwM/O1DfTZDxIu83bfGLOGvhNLHrL4tCLkTbOO9v7T69QNvOn2zNucTdku3uBHpqzxQCSXdiMni6t8+UUUd34AQVRkXEBVrIdx5YwsXwQFrhFrSuDQG6+R4fRH8iPZI5BRtUzEUtbjTPBrWV4AKLLQ1zZh6oqWX2bQLLrZ01n22lucrTg4g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00efd0bc-ff8a-48bc-ed9a-08de9042f92c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 23:04:05.5762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ayxo55/ZRZ/6LmMDmG3AXDfKiTEjZjnGlGHwXXk4p5YlV8IIeQqCeN6xX1P3aYpXvjOnGQ/JxxsSIk/ov5Qu9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7138
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDIxOCBTYWx0ZWRfX7vYR//xTkxbC
 eq+WfjoHgELeKjD6Ffx0RrO/Zae1lBetSmZtMSZ4UzxIHABsbyXE/4lz/aiuEF6m9MO7TTV7jGd
 09l3klJ6Yov1uSBRP2Al4H82ZHbToIsNfh+895qxlmmRRXq5JApd8oyUWFT+ewk66tK5ldDpDxW
 T7z9pNXK8mvunj7biaTmG52XARnQY+cBEt/D9BilLJOGwCNbVa0zP8JSsLymwwoKRqS5uLuIhMg
 jHS3koip9uzsSboGsvvZ4gtVjG/PLAo63i6BNw8eTA5GuBbqs1Mo/OUO8q1oJlheTPrAXaSdweq
 Mxxj2QyoBporpPxujnWAUY8BndEkSD8ISojXE9jLLhrgKRIPj/d240yW2SM7xPOr4JfNTp1Edwb
 AS8hYFHybJi6y+fQ26q8l7PIFVZ5O1+mmdjju4NeOdmicGh9aisXCNPLGFdf4D5DNnvl8uXZaH+
 Q3tiLoh0DfHwowTCy8Q==
X-Authority-Analysis: v=2.4 cv=N/Ak1m9B c=1 sm=1 tr=0 ts=69cda46c cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8 a=GQITfL7Tx9QFd-By690A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: qQuMwLxiPSMherBT-Ord-6plwCE_EOy0
X-Proofpoint-ORIG-GUID: qQuMwLxiPSMherBT-Ord-6plwCE_EOy0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_05,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1011 spamscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2604010218
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TAGGED_FROM(0.00)[bounces-35817-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[synopsys.com:dkim,synopsys.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,urldefense.com:url];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A91F23818B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBNYXIgMzEsIDIwMjYsIFJhZGhleSBTaHlhbSBQYW5kZXkgd3JvdGU6DQo+IFRoaXMg
c2VyaWVzIGludHJvZHVjZXMgc3VwcG9ydCBmb3IgdGhlIE11bHRpLU1lZGlhIEludGVncmF0ZWQg
KE1NSSkgVVNCDQo+IDMuMiBEdWFsLVJvbGUgRGV2aWNlIChEUkQpIGNvbnRyb2xsZXIgb24gWGls
aW54IFZlcnNhbDIgcGxhdGZvcm1zLg0KPiANCj4gVGhlIGNvbnRyb2xsZXIgc3VwcG9ydHMgU1NQ
KDEwLUdicHMpLCBTdXBlclNwZWVkLCBoaWdoLXNwZWVkLCBmdWxsLXNwZWVkDQo+IGFuZCBsb3ct
c3BlZWQgb3BlcmF0aW9uIG1vZGVzLg0KPiANCj4gVVNCMiBhbmQgVVNCMyBQSFkgc3VwcG9ydCBQ
aHlzaWNhbCBjb25uZWN0aXZpdHkgdmlhIHRoZSBUeXBlLUMNCj4gY29ubmVjdGl2aXR5LiBEV0Mz
IHdyYXBwZXIgSVAgSU8gc3BhY2UgaXMgaW4gU0xDUiBzbyByZWcgaXMgbWFkZQ0KPiBvcHRpb25h
bC4NCj4gDQo+IFRoZSBkcml2ZXIgaXMgcmVxdWlyZWQgZm9yIHRoZSBjbG9jaywgcmVzZXQgYW5k
IHBsYXRmb3JtIHNwZWNpZmljDQo+IGluaXRpYWxpemF0aW9uIChjb2hlcmVuY3kvVFhfREVFTVBI
IGV0YykuIEluIHRoaXMgaW5pdGlhbCB2ZXJzaW9uIHR5cGVjDQo+IHJldmVyc2liaWxpdHkgaXMg
bm90IGltcGxlbWVudGVkIGFuZCBpdCBpcyBhc3N1bWVkIHRoYXQgVVNCMyBQSFkgVENBIG11eA0K
PiBwcm9ncmFtbWluZyBpcyBkb25lIGJ5IE1NSSBjb25maWd1cmF0aW9uIGRhdGEgb2JqZWN0IChD
RE9zKSBhbmQgVEkgUEQNCj4gY29udHJvbGxlciBpcyBjb25maWd1cmVkIHVzaW5nIGV4dGVybmFs
IHRpdmEgcHJvZ3JhbW1lciBvbiBWRUszODUNCj4gZXZhbHVhdGlvbiBib2FyZC4NCj4gDQo+IENo
YW5nZXMgZm9yIHYyOg0KPiAtIERUIGJpbmRpbmc6IGZpeCBNSHogc3BhY2luZyAoU0kgY29udmVu
dGlvbiksIHJlb3JkZXIgZGVzY3JpcHRpb24NCj4gICBiZWZvcmUgJHJlZiBpbiB4bG54LHVzYi1z
eXNjb24sIHJlc3RvcmUgenlucW1wLWR3YzMgZXhhbXBsZSBhbmQgYWRkDQo+ICAgdmVyc2FsMi1t
bWktZHdjMyBleGFtcGxlLCBmaXggbm9kZSBuYW1lIGZvciBuby1yZWcgY2FzZSwgdXNlIDEvMQ0K
PiAgIGFkZHJlc3Mvc2l6ZSBjb25maWd1cmF0aW9uIGFuZCBsb3dlcmNhc2UgaGV4IGluIHN5c2Nv
biBvZmZzZXRzLg0KPiAtIFNwbGl0IGNvbmZpZyBzdHJ1Y3QgcmVmYWN0b3JpbmcgKGRldmljZV9n
ZXRfbWF0Y2hfZGF0YSxkd2MzX3hsbnhfY29uZmlnKQ0KPiAgIGludG8gYSBzZXBhcmF0ZSBwcmVw
YXJhdG9yeSBwYXRjaC4NCj4gLSBGaXggZXJyb3IgbWVzc2FnZSBjYXBpdGFsaXphdGlvbiB0byBs
b3dlcmNhc2UgcGVyIGtlcm5lbCBjb252ZW50aW9uLg0KPiAtIFJlbmFtZSBwcm9wZXJ0eSBzbnBz
LGxjc3JfdHhfZGVlbXBoIHRvIHNucHMsbGNzci10eC1kZWVtcGggKGh5cGhlbnMpLg0KPiAtIEZp
eCBkb3VibGUgc3BhY2UgaW4gY29tbWVudCBhbmQgbWlzc2luZyBibGFuayBsaW5lIGluIGNvcmUu
aC4NCj4gLSBVc2UgcGxhdGZvcm0gZGF0YSBpbnN0ZWFkIG9mIG9mX2RldmljZV9pc19jb21wYXRp
YmxlKCkgY2hlY2sgZm9yDQo+ICAgZGVlbXBoYXNpcyBzdXBwb3J0Lg0KPiANCj4gTGluazogaHR0
cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1
MTExOTE5MzAzNi4yNjY2ODc3LTEtcmFkaGV5LnNoeWFtLnBhbmRleUBhbWQuY29tL19fOyEhQTRG
MlI5R19wZyFZU2V5WS1icFFyTUxxc3dBYzFjV05ENUNTSHZHRnlnUEdNRU1wUjlhbXJSTW5SRmpZ
ckZaa3R6Ykx6RXpWWmNRbU9XMzRJVUFmd1JLSHd5N0I4cF9jaVVvcldHSnNBJCANCj4gDQo+IFJh
ZGhleSBTaHlhbSBQYW5kZXkgKDQpOg0KPiAgIGR0LWJpbmRpbmdzOiB1c2I6IGR3YzMteGlsaW54
OiBBZGQgTU1JIFVTQiBzdXBwb3J0IG9uIFZlcnNhbCBHZW4yDQo+ICAgICBwbGF0Zm9ybQ0KPiAg
IHVzYjogZHdjMzogeGlsaW54OiBJbnRyb2R1Y2UgZHdjM194bG54X2NvbmZpZyBmb3IgcGVyLXBs
YXRmb3JtIGRhdGENCj4gICB1c2I6IGR3YzM6IHhpbGlueDogQWRkIFZlcnNhbDIgTU1JIFVTQiAz
LjIgY29udHJvbGxlciBzdXBwb3J0DQo+ICAgdXNiOiBkd2MzOiB4aWxpbng6IEFkZCBzdXBwb3J0
IHRvIHByb2dyYW0gTU1JIFVTQiBUWCBkZWVtcGhhc2lzDQo+IA0KPiAgLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvdXNiL2R3YzMteGlsaW54LnlhbWwgIHwgNzAgKysrKysrKysrKysrKystDQo+ICBk
cml2ZXJzL3VzYi9kd2MzL2NvcmUuYyAgICAgICAgICAgICAgICAgICAgICAgfCAxNyArKysrDQo+
ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgOCArKw0K
PiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jICAgICAgICAgICAgICAgIHwgODkgKysr
KysrKysrKysrKysrLS0tLQ0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAxNjYgaW5zZXJ0aW9ucygrKSwg
MTggZGVsZXRpb25zKC0pDQo+IA0KPiANCj4gYmFzZS1jb21taXQ6IDQ2YjUxMzI1MDQ5MWE3YmZj
OTdkOTg3OTFkYmU2YTEwYmNjODEyOWQNCj4gLS0gDQo+IDIuNDMuMA0KPiANCg0KSGkgUmFkaGV5
LA0KDQpEbyB5b3UgaGF2ZSBwbGFucyB0byBjb252ZXJ0IGR3YzMteGlsaW54IHRvIHVzaW5nIHRo
ZSBuZXcgZmxhdHRlbiBtb2RlbD8NClRoZSBjaGFuZ2UgeW91IGhhdmUgaGVyZSBmaXRzIGJldHRl
ciBmb3IgdGhlIG5ldyBnbHVlIG1vZGVsLg0KDQpCUiwNClRoaW5o

