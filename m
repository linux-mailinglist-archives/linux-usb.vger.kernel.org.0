Return-Path: <linux-usb+bounces-33766-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALcxEmXjoGmhnwQAu9opvQ
	(envelope-from <linux-usb+bounces-33766-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 01:20:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FF51B1335
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 01:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25FC03032655
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 00:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03902367B5;
	Fri, 27 Feb 2026 00:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="L8RDfpa2";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OmV18sN+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aWq9xLFY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B245F1D86DC
	for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 00:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772151649; cv=fail; b=SdMpUyaU3+VnR8vRGWSGuqA7HMY2DvHr7AGqTETW+igin+VsUCp8/aimRGKnTRHeSf66sJld70hO2ikmGpEOAyThF5kfIMLXC3qwObMb/k5Wxdst8uTbpcTppDu4taamAqYyXD9Sp+7id4gyH+AM1XXfEY7tfAeQVtuNMy47+TE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772151649; c=relaxed/simple;
	bh=JEAZ0mSjFX25vJT24cQSFm6lw0kuihFxaNcsMG5wfUo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U/avHP7buQWv1jX0a9KBqta5ynRSYeoX8NecE2aBX0ZdcPMYzknpTKk/DhTUpzZ6qmHW111HbfSkdSv5dmv5tkBq8PmrflZfdOdyuY8abLxWjP7f2z7OzYgWDvEaVHg4gueIctqxqnB3KS4yqd8bA6GNQWZwY2e1RgoJmMHI5/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=L8RDfpa2; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OmV18sN+; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=aWq9xLFY reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QNWe0r4176141;
	Thu, 26 Feb 2026 16:20:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=JEAZ0mSjFX25vJT24cQSFm6lw0kuihFxaNcsMG5wfUo=; b=
	L8RDfpa2xH84HdSjKQgOsl+eYCgWXkZ0pc9ui9Z2Gq993AxZf424nPTsoKyOL4Cn
	qBKs0JmD8rb6O/ViGqmOmL/0jJCEQtQgudACzbeeRGn20wgUjvqjOJzWyvb2MGk1
	dUMQ40sXZ5EywDoA2HMwkawmV5Mk/rT0OlpC803/Yq2H3CSAEqywfKMjc7TeVjwF
	gGmrzeTmElVUxk1FjwQqFEssTxouqtUrYLGDjqNHsh/To9/d4EJgrxh6/wzgTE25
	AO+4tjsFapl0YFKxRWmUzPW98CsqiNUVKD2vNrWSh0yJxygtEhoLct9cbCbxXz6g
	pW82S7JD4wWDaEjmHfwwQA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cjuyshhys-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 16:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772151620; bh=JEAZ0mSjFX25vJT24cQSFm6lw0kuihFxaNcsMG5wfUo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=OmV18sN+mT+ZmdwvGcU9J62vYuGawrPov/l8R0cZb4GOmebbhiOvz75/SIMq7vSfF
	 lPPBx1dqoBbh1A0TFT2Ro3HkHhQ9IKdM/GD9kiKcxI4e1jp9YctUR+gAm2P3bVSWxU
	 1MW9Ee3YA1CW6eIXXaiwilCTNQCU5Q+8osK3LP069Qm4BVudSEacMQ2U1xEF2629hJ
	 MZA2L8mu0DucvfGmFb2TZ4Gqg/VxVBVIGoyEKF5GHVfKFnhLe1ZzdtV9oiDX7hOoTw
	 j2hXXtkXnKS6BZimCd0HO+sV+Qmc1Nkk7dbqSLfsSJe/P64pkg+vFq7461kw+XPo0a
	 mm0v6I+vQvs8g==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8F93D402D6;
	Fri, 27 Feb 2026 00:20:20 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 5442EA006D;
	Fri, 27 Feb 2026 00:20:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=aWq9xLFY;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00301.outbound.protection.outlook.com [40.93.12.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9CDB5220153;
	Fri, 27 Feb 2026 00:20:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RW8OTDK+pwZgvC+Myp0kkwTp3+O0qx6wLu/dX8nJeuLp6jM1hz4agZz4HsvNPBbAmQJw+FjoQ/gW+MDMxsuf7izUVS60IKkvzRXmiisnmvx2TwZcQ4zuFPce1uw+h8kj6RitIS1jUIkBAV+QvdKeHyPYc5XEHq7oRlLXvcsJ30l/0l/QVAo2do0Ja8JP3QhiWqNtsGZbRS7HE9TXJ4w7LmeKWMyLEWZJ4zUuF+/GRDA6WIA7TLrWfTrYdUC6ZHSnHcKakR0Hdx3oqgDu8xdE67ddTJaEOudT9aKge7dqGAlH3qsgZyCl1kxxcIf7mFtNHNlGL8WxAjo27GBApz08fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEAZ0mSjFX25vJT24cQSFm6lw0kuihFxaNcsMG5wfUo=;
 b=nmQGGth/dKJtGKvJODILiGAyj7FvQCsmcuhmqh9nEGMSjnblgiDizNgwhLIr7N7jxvve61LK7M7jW/YW1gDsi5uHpU55DT4hSftadYr2wdYZZaXhgzA4bUUbq+1HZcNc1jFMtJtJ/i2bLgD/a0bmkbruIuRjWNZTR4VqnJ3KA/gNPg9wsUcHEgydJ0tZacqTPGM1HF3WDobSmJ2HIeB5rIhYR6Fy4RVvSjU/tAvKrZlXCOsyqn+18jaoHwUBRjGu15MX1d5aQvCtBNL9NiZdFZtfMadJrOKE2Z+Ty/slw7ir8xcwnhszmCZ6PG8eoEONGx1fRHSmYRgdkygklVWrmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEAZ0mSjFX25vJT24cQSFm6lw0kuihFxaNcsMG5wfUo=;
 b=aWq9xLFYGsSUm9KER14X/4DiuSE/3kzhXEaXMds7NP/bnBvjHWI5b8yEnXmCYpbAjqhn6B9TqBPVXhcf+jU7GMev51p/VTOkkVtEYthtNtH6x55xYdS90Qdyl9lC2l49gH4j5P6LlQAX8M0ki1dUYFU20/sfZux3/50Svqjzzys=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MW4PR12MB6825.namprd12.prod.outlook.com (2603:10b6:303:20d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 00:20:10 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 00:20:10 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Ingo Rohloff <ingo.rohloff@lauterbach.com>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: dwc3: Add property to insert
 delay before TxValid.
Thread-Topic: [PATCH v2 2/2] dt-bindings: usb: dwc3: Add property to insert
 delay before TxValid.
Thread-Index: AQHcplcq5wKRsoiC/U2CZtBcYSUwL7WUzwiAgABZrACAADAYAIAAWCeA
Date: Fri, 27 Feb 2026 00:20:10 +0000
Message-ID: <20260227002003.gznbxapvqr3slc2o@synopsys.com>
References: <20260225000512.tle2eu4gkd4ut6bf@synopsys.com>
 <20260225130323.24606-1-ingo.rohloff@lauterbach.com>
 <20260225130323.24606-3-ingo.rohloff@lauterbach.com>
 <9d59395b-ae39-40b3-af21-75468ec34cd8@kernel.org>
 <20260226171224.3ab6b68f@ingpc2.intern.lauterbach.com>
 <20260226190432.jq6c3gxwy6dydwpc@synopsys.com>
In-Reply-To: <20260226190432.jq6c3gxwy6dydwpc@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MW4PR12MB6825:EE_
x-ms-office365-filtering-correlation-id: 0a364035-318f-4fb0-3a04-08de7595f7e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 R0k4PEcTyz7keRqQA4Dk7xK+ymVCU9bf7FwgkCVpcK2KOMEpVYOYlTDJDT4UOf4co+Hvrs4dhQWOpgAFtldHW7oU5AoPfVJfel8pMcgHFijgPG7b+d1HmsErLWfZHOOlHkMnuVQduZDjVWyrnJns/3XNyYZXxfN9ijgumOe+iXg9Tu7YvRa8zIhQ3tOi2VVujrdxgCMrDRUZdT1CiyVVYfGMFxIu+X4w/DevGMd252/oJLaP+BTwEBzSQRXSU4ZgZckKRMGNB5HTAvQm0iRm5ZffuLUU9L3H6H7nTp51mivLcU2MlExK259PqBL8+DemDY1yD6VGcRljpgTG6ZzJFWF0vvqcOdRNJTTWn3hntoNfyROD1tZdm5U+wlR4G/sQn8DTgi7WXp4QgiL8BXuJupUuSNi0u3he6kT0azxrg0II++7obV0ahLfxo5y9Wtd8lT5+ZfkFxpiMKJFT6LfPSQbxDv+tpz9gJuVaHEbBWGQv5U3ei0MrdE/mONnZDyikp34A7ZKMG4KolVSgPU/EXckNZvUYv4P15V6bqyl40v8LTehVGWjQQ/LjRhFt97lgJw7qGxCy1JfFeP575IGnOyTTWEo4XAoNCH2kIYiFey3lQi6Pau+n6pxPQ76qk2zTTQ59+SFBJzWGgUuo1GssmazMj+yG8dCdn3YmFePTFflM990qgHrwd8YEHmieZ1cU1ofEVW8BeYiewMd6fjSB1uBIYjaSLSIWuEnCTpmT8DeqE4fzyZPn3TRuhxkDVI82
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RXJUR0JoT0sralB5enJsTzNzbU0vS21ZYzFHWTE4RzJFeUI2NWIzdi9iY0Vu?=
 =?utf-8?B?UEorYU16TEJHbTR1Z3dXbjE4bWMwa29lTnRxNlFUTWN4ZVp2NVdPQStlRTk1?=
 =?utf-8?B?WHA1YUVJR2R4b1QxOVZmN3F0NGNwcVJMMStiNUp5U0RUVFJxVlBKK3hhMHFq?=
 =?utf-8?B?ZmlSa1o1UkZLaVVESE1FWmkxMTBhTEhnbnFLcEFSZUNacjRGakd2NVMyN3M0?=
 =?utf-8?B?RkNNNjV0K3JSbEYySmtidVhLUklKdExpWStWZEp5dENObmVhRlFtYzJqMWhZ?=
 =?utf-8?B?UWlrTVl5c3VKUU13ZjdwcGpleWFRcTVLOEVkbkk1K2dyVFJUOTAyakpYdXl2?=
 =?utf-8?B?WFBON2cvQy9Lcy9URGM1SnBpS1BPMVEyU3dhejRPU0FZNVplMnRKbm9hZ2dH?=
 =?utf-8?B?cG5TZG0rekErUW5jUFhJQk03SzhtMk1xZ3RxeWlwVGgvREtNanBybVpjOFBM?=
 =?utf-8?B?RXZzR2E1SEs0UDZUYUJWcmlvd2xhdUpXQTFBbEJyUmZVU0psRkJuUWJwZkxn?=
 =?utf-8?B?RCsvVHFBZVVqWmxzK0FFb0NtK3pRUzdNRXFwQnFUTFpSeUM5YU9CeXJwUThM?=
 =?utf-8?B?aUg5dVpzMXkxeDhnWHA2bW85blBYM1FRTGNXanAwOVV1akVwVkZQK2Y2czBC?=
 =?utf-8?B?QVdPKzBFSnZhM2twNkE5SHVTZm9ZemdwMnRpMHExWUl0QVJIQUd1WEgxeTNC?=
 =?utf-8?B?aVUvbVlmRy9JdE1OYS95ZGkybjB4aHQySVZqck0wUkZtdnVINHhmaDVLSE1Z?=
 =?utf-8?B?bjIrK2p1ZFVRTDhEcTJZTmZjTmVhMnE5Z29vRVRjZWphMHptRDR5VHJUWGJ1?=
 =?utf-8?B?K1Qyd21EWmlIcGVQSXBhc2VLTG93TnlQNFlTVEdCcDJpcFBSb2M4ZGxjRnNT?=
 =?utf-8?B?L25oN1k5U0NLQ0JkcnVxMnJJcWM3WGZCVldKZVBRa1FraVZWTkhUQ3VaZFNj?=
 =?utf-8?B?eDlXeEFiR2svQ0p0N2VHNjBhRE91Q1ZhbjBFdjBEdlNDM1FWNDZxaFJZQmRW?=
 =?utf-8?B?TklVKzJ0WmhPNWYycFFrWWs0RTh2cHVUUlFDVnpMbWtCd1VXTTl6OXQ0QUpv?=
 =?utf-8?B?aFB2cGY3YnlMWnVUZVV1WWVaZnRIanJWZEREcEhNV29za2U4S2IrM0xQeWlK?=
 =?utf-8?B?d3E2V2padXpUOGNMdW9vbHlpS0xGSEZySEFTM2dvVTg2YnFoTlRoSmFWUVJH?=
 =?utf-8?B?dkQ2VlFaWlVwekxMdG8xSzlkWFJ1WUxkQUhDZXZheEl2YURaV3FkVHFpYTJu?=
 =?utf-8?B?bERqaEFsM21SNjlIeXJkd1Z1T0VEV1MrTFRvUm96TlZrYTk3YkN5WmhkMEJi?=
 =?utf-8?B?M1BwTCtEUXN0NlREK1ZMT2xER1VmTk43UXVsc2Nzekh4blNnNmMwUkhOUDhx?=
 =?utf-8?B?N2ZwYTBpVEsvZUZhK2tHR1VrSFg2ckpRTmduTDhIQU9MUHdIZFU3MkhieTJz?=
 =?utf-8?B?dWFaYXBmZkdyWG5SMkNZN0k1TjBjRnVFbFU2dUFocXNVTklHSEc2dzlnc0hT?=
 =?utf-8?B?N3hFTnJYMkJyenNSL3VhVDJkckNJYk0wZnA3amZCcHlaWDhNNlQwUVljR1lV?=
 =?utf-8?B?cDA0UEFGQ2M1Rkx2SVpIQkRhUm1JRm56RG9Nai96aElkODVsVmhuZ2RpR0xI?=
 =?utf-8?B?SGw4OFFkWlpEUDlqbGp3U2RDNHVYQXN0Qm1BSjJVZ0Z6SjI1MDZxOFFaNUUv?=
 =?utf-8?B?aU5qRVN3OWY4SDB3UmNCZ3k1aGRUNVpJQVFHazZMcFlqaGpnRGF6T0VQMEhz?=
 =?utf-8?B?STBkbEMyc3RjelcxVmFUWVJQeGtDK3lwRmwwaTYxTDZNU3hPZjU2VjJsY0Ra?=
 =?utf-8?B?eEJ2WG0xVUxGY2hkOStKQzhVeW1HWFlLQ3FjVTZOZFowc05sZDhGcnVKdllV?=
 =?utf-8?B?WmZ5NWFPcG5QMDdxTGVQU3dKQStWZktNbXVWdVZsWm5zaytUM21RYXUwMjZX?=
 =?utf-8?B?L3A5cnM5d3JnaDFOMFZ0MUxQWWd0THlHNUJFeExteXQzR0ZldjkrdmN3dHRo?=
 =?utf-8?B?Z1hWcWpualdHUjExN1dybnBwejFqZERDRFgwekM3blZCNmFjTEdVV2N5SjlK?=
 =?utf-8?B?cXZ5RGg3MVJEdE51RExiOGhYK2lPeFBHVmc3eE52TnU3cGN4NHFuT1FOMStU?=
 =?utf-8?B?WkxSS3U3OVNVYTlma1Q2N3oxUHN0NlluUnNFRnc4U00xdVFwQ2xkbHFRVGoz?=
 =?utf-8?B?cHoxRUFwdWc3K0w4L0lFSVNzMEVKTDRHNmdLNkUwbFpZK3JFNEhnZXJVYldx?=
 =?utf-8?B?ck4rb1BUUHo0dlgvaEYwZWhEanYxRnZNdVdqeUhnVGMvVDBCSnU0amVlVTYr?=
 =?utf-8?B?TmxOZjFyRmVMVnVlcTZoTDJDNVVDR0NmZmw4QnFPYkRobHhJVmpjZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB0D060F4B191945B0A1ED7B94033A1C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pMg4CYp8883Bh8Gjvsq/caB+msDNKxDzXta1m5/CLocyA7ySJqlm+x0IRwqvrC1DKYiE523I7v+zjj1JCXlFXwY60dN6ZfJBZPYzkPaZo3WPndzGTFc394XCJsInXRf/6ASMBdPbto2IS/Hnm7QermTPq1TiRp07op0E8NsbmAoXuz7TRRbj9MJn7cj4wnysXmZskePui2sfdzQ3dXGrnknJJRgIE6lSYbrSFFQTiPCWA3A2OiOieOAZrJSZrvatWbHwmwOX52MrMEPMj2aYWkttBvtGXM1k8DAfm20RiwT8NdeVPmpPcvwYXrNvtYEro1Xeh6iOMZrFijGKjeWG0yfXWS7ges1QeUdG0qWWBSR5HLAzpx5vxcW7H/q0cfuADQxdu/e0zU0oj9tGuMU/1n4zW0srQ6azonT4nKiKls9NHyAWn4atYHuyaH+LgKLMABvgtcAgcgP8j8zq1Me5qP9uge8wBjwD10KEpLCgVFhWhJy8SGFuy2LVN6QkYEMWXZuk+n+Gqm7igxjJHHdkB0+Cv8oyahvRO7hchXl11d8plj/Ht3gFi7KFyff7yzC9buGpJ8ipeq2f3SW1QGqjaQnkmTif8s80ZWmid8yNeigLeTVx2Wn4Xrzcpvic+xMCCXfREwUc3pEjBKnT4WB2wg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a364035-318f-4fb0-3a04-08de7595f7e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 00:20:10.2361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U/RD45nwDqtIJR4cUfhA0kDjAEgQQjOrYB15eJfhBOUxYWy8x8f6vKmBPXh+uyZNeyvLe+DAzvysPMnakebViQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6825
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAwMSBTYWx0ZWRfX205wEG2sIdtY
 gFe/nSwEZ0tfbgLukjvy72aUcQ1Gc+QbHSopmm4Fa6HSJ3Tu3cffa5B+eKWwrobNg+znOAUUAIz
 yswnYrclS3zZWLh10hhToGBUBoPDvbN+v3xTzmhkXRX+P6jcDPzdvbLnBmOGG8+yvE9s2ZIUqsB
 olu4wVq9WtkpBMz3vL1v2m9OHPZHeH3IBCuY//rWU5mDx7sFhDcrzgtevHIBweHweetzh7L0ETT
 y19K7Gmr3tLQT8QHdltyoGnmlaAYOTE8JcHd2sq2vpD56UHuJ/78FowqPCdcp4tMfR/by0o+Ez/
 WDFADgiECxcbBT7XiGojrHnX83mngegyJLJoZpSVgyeX0BgOgbDPayQWNve+hGC1YA0OMeWCal3
 rC33M6IdJd5JGDzK6mVBsDXx4ha1Kw6eI49J8s6x9u8lT0wZ/9joE4UN3DxMvlOzCA8GRafTXIm
 DGpxJ+ZZTEDAhVKZ9ag==
X-Proofpoint-GUID: _7W8OMzftnSsV25yCMeOGZGZBtBYDy2m
X-Proofpoint-ORIG-GUID: _7W8OMzftnSsV25yCMeOGZGZBtBYDy2m
X-Authority-Analysis: v=2.4 cv=eIUeTXp1 c=1 sm=1 tr=0 ts=69a0e344 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=XYAwZIGsAAAA:8 a=VwQbUJbxAAAA:8 a=6IKl6NRE9SvI_AuI9sYA:9 a=QEXdDO2ut3YA:10
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_03,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 spamscore=0
 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2602270001
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33766-lists,linux-usb=lfdr.de];
	DKIM_MIXED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[synopsys.com:mid,synopsys.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,urldefense.com:url];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 99FF51B1335
X-Rspamd-Action: no action

SGkgS3J6eXN6dG9mLA0KDQpPbiBUaHUsIEZlYiAyNiwgMjAyNiwgVGhpbmggTmd1eWVuIHdyb3Rl
Og0KPiBIaSBJbmdvLA0KPiANCj4gT24gVGh1LCBGZWIgMjYsIDIwMjYsIEluZ28gUm9obG9mZiB3
cm90ZToNCj4gPiBIZWxsbyBLcnp5c3p0b2YsDQo+ID4gDQo+ID4gT24gVGh1LCAyNiBGZWIgMjAy
NiAxMTo1MToyNyArMDEwMA0KPiA+IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9y
Zz4gd3JvdGU6DQo+ID4gDQo+ID4gPiBPbiAyNS8wMi8yMDI2IDE0OjAzLCBJbmdvIFJvaGxvZmYg
d3JvdGU6DQo+ID4gPiA+IFRoZSBNaWNyb2NoaXAgVVNCMzM0MHggVUxQSSBQSFkgcmVxdWlyZXMg
YSBkZWxheSB3aGVuIHN3aXRjaGluZyB0byB0aGUNCj4gPiA+ID4gaGlnaC1zcGVlZCB0cmFuc21p
dHRlci4gU2VlOg0KPiA+ID4gPiAgICAgaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6
Ly93dzEubWljcm9jaGlwLmNvbS9kb3dubG9hZHMvZW4vRGV2aWNlRG9jLzgwMDAwNjQ1QS5wZGZf
XzshIUE0RjJSOUdfcGchWVJ6WmtMVFpyNUJoaDU3RmlYbXlxN2U0d1ZQSFViWFpkZ0gzYTYyN08y
a2J6cE9UUGl3XzFNS0djX3pENWNyOF9ZLXIxaDVYdnlGTDljN1lSTk9iQWwtbG1VTmdTdVUkIA0K
PiA+ID4gPiAgICAgTW9kdWxlIDIgIkRldmljZSBFbnVtZXJhdGlvbiBGYWlsdXJlIHdpdGggTGlu
ayBJUCBTeXN0ZW1zIiAgDQo+ID4gPiANCj4gPiA+IFNvIHRoYXQncyBkZWR1Y2libGUgZnJvbSB0
aGUgY29tcGF0aWJsZSBhbmQgeW91IGRvIG5vdCBuZWVkIHRoaXMNCj4gPiA+IHByb3BlcnR5IGF0
IGFsbD8NCj4gPiA+IA0KPiA+IA0KDQpBZnRlciByZWFkaW5nIEluZ28ncyBjb21tZW50IGFnYWlu
LCBJIGRvbid0IHRoaW5rIHdlIGNhbiBzaW1wbHkgZGVkdWN0DQp3aGV0aGVyIHRoaXMgcHJvcGVy
dHkgaXMgbmVlZGVkIGZyb20ganVzdCB0aGUgWGlsaW54IGR3YzMgY29tcGF0aWJsZS4gSQ0KdGhp
bmsgdGhpcyBvbmUgbWF5IG5lZWQgaXRzIG93biBkZXZpY2V0cmVlIHByb3BlcnR5Lg0KDQpCUiwN
ClRoaW5o

