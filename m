Return-Path: <linux-usb+bounces-35215-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2N/ILfmDvGmJzwIAu9opvQ
	(envelope-from <linux-usb+bounces-35215-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 00:17:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FBD2D4068
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 00:17:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ECAF5300F962
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 23:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8973346AC4;
	Thu, 19 Mar 2026 23:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Sihd4mvA";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="U5Uv65Rb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iDx9LHm8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3212C234B
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 23:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773962230; cv=fail; b=T15/zRjCppa3MwyDZV7lhLF9hz1LQ4T9lkpMXe7WOganTdPkUthNUCBlsnJ2WoOu0kNyGUEK2cNkq0QxjtU235dZvnyUCoPfMsHlpagaU9C+XSRCoyp/Z9LSH3wqvw5aLInoTfwP5nuYcv05uoZOcC9fysMEziSk0UA2BPZgfsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773962230; c=relaxed/simple;
	bh=aesGsLlBbUmExqePupXQ0KOT5b1T9oTIDuGWvf91i9k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BRr9iqFJvCOB7KTiQNUqTmjZawpuBAsSAs7gxNFi5556ShVxGGMWTHzO7+BKwrP3/AXuadFLSJFipLOaLIPUJlru7WkMkv5k/STjMWclabble6T/dgfGBtsTygM09v1S7wktrYBKq+X/XEa5V35IJZwIrM+KYXTTw01THZopw+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Sihd4mvA; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=U5Uv65Rb; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=iDx9LHm8 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JL68Au1411455;
	Thu, 19 Mar 2026 16:16:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=aesGsLlBbUmExqePupXQ0KOT5b1T9oTIDuGWvf91i9k=; b=
	Sihd4mvAmepJUDIROQzSSFhT2KoiUiFOYykhHtHiMzacQJRxsQA+aVU2wPb7WTnC
	BpQdPRu+ANv8+s5TUJ5Ojb1eOApkKEMKLCsPOlF1C6ysHMj13xAirYsjNjjNExjI
	mWIIqijtW6pKOyT6GVusPdtgIHWDcIFLysxFohcwb6AHM9FEjLc5fChsNFHMUUPc
	Uc60hAYz2dE7iHytFPx6foriVc2gr1ZI2aVF2UC/9F9I+3sO/cLuw0U3G0oqUwJd
	3TOlJyjz/c+/YF+C2PSMc504isv3gj5LOwKeVmaOXEIC+usgbxPIq/VrqDKYtloh
	OgDw04Gkp4OHCSR+00WHfg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4d0msfsy35-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Mar 2026 16:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1773962189; bh=aesGsLlBbUmExqePupXQ0KOT5b1T9oTIDuGWvf91i9k=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=U5Uv65RbrB4s1R1r9bFC4uEZ29px8/FNw37+jMIaunZTUfrKBJ4GTZm16OA7EK7As
	 EGRNDMLqDzmVwEDfZVT4wOOF35qbObdR9otVVWBVF6zewQc18y/rSD67QvI51M1wz+
	 wlgUq/07r5zRTsdJxvEIcV2JvL6azQNbIn7dsp76bhJNE8o4PlXYOS610UHpjQac6q
	 Ve/9UNyghjAq0/W8yq2bNHx8sWq/nETYP1rJekJcB6ZkCPoXBQmoVDyALt27Xxq6Sf
	 sck3rwoaKKrAjuiIaTiVf0MXA4Ney/00xLCUPW4YrKNQs6ofZS45tcqd0Nvnm0weRd
	 0R3goOowpgQvQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 758A6401F9;
	Thu, 19 Mar 2026 23:16:28 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E142CA00C6;
	Thu, 19 Mar 2026 23:16:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=iDx9LHm8;
	dkim-atps=neutral
Received: from DM2PR04CU003.outbound.protection.outlook.com (mail-dm2pr04cu00306.outbound.protection.outlook.com [40.93.13.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id DB8C722019D;
	Thu, 19 Mar 2026 23:16:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sjt3JjAqsw+NfJxZn+gIahnRUCi/iEfBLxppXd/AM0vX+MHOmJLedLEJJ0xjoVsDyTeOW7dFefdG8MuiQbUpZ8G2jDCZrtyMj3GjY+bg9U7TBRD3cre2Pn60LX944WRqRb3wHIevWCbm9AKIvX1jrjuKlKnG9OGYbr5zleT3a7qU0WimALWcgKm0m+FoEyaTyqPnsMp50LvReC8QOZ2jML5N5dlZA/jOoc/MuN/bUqcwkV6f4HR/OEFiUgKbGZMQmLtnBhb7bajC/oA1sKmbKIQaqyD1yyuTh9/BaBZc+pKrhwf9jsNd8Ma28akmlazJ0/FMtMWUg5RfsHvYZUHHHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aesGsLlBbUmExqePupXQ0KOT5b1T9oTIDuGWvf91i9k=;
 b=G0/RmnvRYuXWYrNmeDj0u/dioyEgNnJsX4T1XKt2LTcsgJB+B+mzQcivbz8n/aHudS3ZJHPJjbzQALsC08i6hfxbMDA8DZ1VaIjo7CjZu616K8Cf4AB3mJH41QVRDncnONdBwE54cgqGym5K1uzORmgyhpRtyLfMv/QnvXVydyfBrOgl9SZxneJf8JpikZUSoAHMtUeyBy44IvHB46VfacFXuJcE2JKDd+B/J8Llb6FEVsAJ6ERue7I34MxI9yJX9XGmV9iwzUEPFx17NEcjMX0JfrvXCG2VPRCfF0NsAe+xv5a9ejBReUhk7bM9mNaGOfWdd9JOFjc6Aw0QObsKOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aesGsLlBbUmExqePupXQ0KOT5b1T9oTIDuGWvf91i9k=;
 b=iDx9LHm8Rfee9i19CHPkCwzSfx2zysz1CWotAckzDAnajXg5cHyqMj2hp5FdWOC/OgN8AjSeaHsubh2FpvXG7VW3q51bF4QJt+9HW98ag6khFYtAGLhGGpT90JGO8dZK53TWFHbPV57CwkKerhAcsOAHC3pJsBxfJgIyBrd40MU=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA0PR12MB7091.namprd12.prod.outlook.com (2603:10b6:806:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.10; Thu, 19 Mar
 2026 23:16:23 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 23:16:23 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Michal Pecio <michal.pecio@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        =?utf-8?B?QmrDuHJuIE1vcms=?= <bjorn@mork.no>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Thread-Topic: correctly handling EPROTO
Thread-Index:
 AQHcsij3bm/3l4J2S0+poPtO9iFJorWq8pYAgAAa5gCAATtij4AATvwAgAB6AQCAAEFHAIAD0b0AgAARygCAAAy8gIAALjgAgAAhdYCAAT4QAIAAHoaAgAAczoCAAQmZAIAAg+gAgABA74CAACdBAIAAI98AgAFicgA=
Date: Thu, 19 Mar 2026 23:16:22 +0000
Message-ID: <20260319231620.3ukqxsrwqikp5zbd@synopsys.com>
References: <4f8b9942-307b-4c31-86f3-1b7b20b34a16@rowland.harvard.edu>
 <d1674f98-cbbf-4a16-8c76-996a0494d931@suse.com>
 <abcd2076-c2d4-403d-8ab8-af747b335075@rowland.harvard.edu>
 <87a692e2-559a-4765-8321-a422751d3589@suse.com>
 <4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
 <8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
 <b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
 <20260318223851.1f6d07d7.michal.pecio@gmail.com>
 <20260318235920.ioek26hdr25rkksp@synopsys.com>
 <1eaf4cf3-4278-4d04-87aa-8b6069d544e1@rowland.harvard.edu>
In-Reply-To: <1eaf4cf3-4278-4d04-87aa-8b6069d544e1@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA0PR12MB7091:EE_
x-ms-office365-filtering-correlation-id: 8ea18dbd-86f2-4142-f5a7-08de860d8963
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 uDK8rLQ+Leo26hrW5FXYNZH4oleNWr7u97srvLNQrnykKWK/mEbMUR1T9fMyDoVwSvBsq7Rmu7o56aJh8k47AvAXoVLVL+tF7mhePppONa2bDwlrR5OWngKOO1AKVPoeMfa70ojjZZQt3IrqsVITBJt0WJfspuQvIpHj0N289bDoJiukt4ymFj+j6T6Cb85zCrrtPOxZR9wS+M8ywMG8FHfklu+WuY/6wg3Dl3GpNYNKOSx8lt/IYd4eu+nmRMyRJ2QJ8Tjme+hQA6hwrEVJdghSwMMbo69yfOe1R8wwgSlnKz6V5bkASV2qrUICm1KQSCkuzwxOW8Ua6fq21JCqLZzsQWvRDQnaHA1pdjmBNb/eQjJ2ftGZhizD3SoiBrj2bUN/vY7hRs2rLwanuP9Pavbq8rdYbJYWEO8xkREe+HKTGdNC0SOm+7a4kMXOWCDBXwTbkkiiSphsh89pmg/Syl88h78eVynAfe9gS9viPHYrNzubcD1Pfy6185XtP4MPFAhiccD4L1x7fTz1NSdtGBFmLns44VRfgpkrHunVyKX7hcGyFawuLfJvX24nIqpbA4FuqMrDxVDgJtV/sh4mwyoTtfMI9uTYaPeJ8UynKf5JZ6MVGtBHuzO2Vzevex0wC0BGsOHMJyI5h6nIM1ivSc3qSac8Kq9y6DeE3BQEw8YFTpSYM4Lka1kJrftUAqJn4/z4A9OZbn0Un1WVBlwkvHR8XO6WdrtbfRjK4TneF+I5iqkw+EOSJOBltbGqlp619048ZwFFdkMWOj1EVur7O4UWN62DjtVoaco5mUGY18U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QkNRckY2bDJDRHR1REpVL21zS2NnMXBRd3M0QkhqMjdMZCtFVk9VajlWQ1lT?=
 =?utf-8?B?NkJVNm5sTFRhQW5lK0xZNlJYSld2NGRkaUlyRnQ5ME81dEZkMm9mVDEyYXN1?=
 =?utf-8?B?M01iWklLQThFaWxERnJ4TGNQSlp1amFhSTBqazVkbFUzeXRhNVZmTEY5RENT?=
 =?utf-8?B?K1ZReDB0R1BNdlVZSE1oQ08vZXhnMEFGQkkxVVEzSnJxZU8yeGpRRjM5NnQw?=
 =?utf-8?B?d3JYUG9uaVVpRDllWHlCNHBsNUtqb2xKOFptS3lEVFZMWG9yTDYvbC95aVpa?=
 =?utf-8?B?dStFSEVTaDJoaEdYWTlxSGFOckY4SUlTWlJWWENFdXZxWkJVblFyWGEvamVZ?=
 =?utf-8?B?Zzhadit5bjJ3UnlmK0hRVzFPMUFRdEFTYXFlUHRjUmZOVjVOc1JuNzYyQ1dD?=
 =?utf-8?B?S2RqVDlzUzM5L3ZiZENiV296bDFsbXlOS2Y0ekxteXhXME5yOTdwVERhbE9L?=
 =?utf-8?B?WUdJSWNNWG0wZ0R2eGJqRmtyZ0lSQ3A0b01QTE9PVUNWcWdnclZ3Uk5aaEVW?=
 =?utf-8?B?azNKRGR5N04zMU1xZXZYZlNDUjNhK2FsVlpQWld5cGRCQVZpRDQySi9mVmZ3?=
 =?utf-8?B?MHZaTlFaUTkyNWlUQUpVeEN2OHlRalRleSsrZW0weWV2c1VIZEpZSG9ZaEp0?=
 =?utf-8?B?R0xCd1V2WkFBN0wrclBJWVJ5WXpiNVJiOGY3S0lWUUNpOHFBYXF3UDhVVXht?=
 =?utf-8?B?KzFObm1KSnVnQzZ2TFkyVDZZMk9tQnk2d3pKMndWQkM3RW80WlkramZROGJw?=
 =?utf-8?B?cUJRblU3L0krQncvNHhtTGIxV3dvWW12VlpZanY3Z0YxSnh6VWpueFFZZTZV?=
 =?utf-8?B?ODZiUjAza1BrUHBFRkZhZFllWnBtL1p2ckdXWldwSC9pVVNKdEl6Z3RBM3p0?=
 =?utf-8?B?bk9QOWlOUzBRNlZ2VEVBc21zZTU5aDdKQ3BGQkd3d3padkdoUE5GbWN6M1lI?=
 =?utf-8?B?OEp2QjR2aHYzMHNmUlVwS3ZXbVo3U3JsY2taWVVpenJoenFOSGF2Y2hTOEFy?=
 =?utf-8?B?Uk9BRUxVcHFyTVlJdXRFUUdaVEVPZ1BKdFRER3pRa2FSN3NlRXZzVjQ0Q0VX?=
 =?utf-8?B?VHdNU2FBTTVNZTVJeHVYSTEzSVBZZmpsWURibnc3MmQ5WXY0UXdRQ0k0aGRV?=
 =?utf-8?B?VWcrVGNrYVAwWEUvWVZFQUsrZFJFK0FLdnlveC9IOVdYQ0gxUHI3d1JRQUI0?=
 =?utf-8?B?U0piYTkxV0lTd3JQNXJKYlBQdjUxL0dmeEROMGsxUHg4WHF2ZWlvQ2pYZXpj?=
 =?utf-8?B?QnFrNjMvbXQyeGkrSDBCbDBuUEIwRlpvd1pqMmxKajQ3WFNCaC9CSW1BUWRK?=
 =?utf-8?B?K2JoTXpJRE1Ec2JIYzh6TU5PaDdtM3Npcy9CMHl0ZGdqVDYxUlI1TWhhMmUy?=
 =?utf-8?B?UFFET1NYL2orWGU0VE9CNEFRTk4waHNtYk02R0NOSW1FNFZMeGdZeTljcnZR?=
 =?utf-8?B?VTdYelVxM2ltdlZLVlJnZ2R4WmhkV1F0YkpXMVp5c2VodUFGNHY5M1oxTmN3?=
 =?utf-8?B?WWZWTThmQjN1Q2k4NFgwMEJVSGxGWVRnZjU0YTRzVjloN3NrM3hrbnhXNTVY?=
 =?utf-8?B?U2F4RnBxeDd0R2dtK3I0cmtnZDQ1Y1k5ejRkaHZCYTN0aDhjNDUrT0dJb2lz?=
 =?utf-8?B?SXgvbEduYktWZFZSRGk0blExOVRJaWlCdnNiYzUxRVEvMnlEWXFhUVhjN0JR?=
 =?utf-8?B?OFFNYjFiVDdCcVJzRllFVllHL2N2NFVjZnByaXFkL3JTNEM0RzlBdXpidkVv?=
 =?utf-8?B?bm5ybk52QXQ1SkNsSUcyenhqRnc5S0VFUkIrVXlhVFNEQXI4Ny9welB6Ly9a?=
 =?utf-8?B?cll3UzZHUU5BNFlmSytCR2plTkg0aHQrNWNwV2dqZkdxMkUwM0dRWm5hdVBa?=
 =?utf-8?B?Y1Z0WE9tWGsvUGZTeVI1UzR5K3dES3FxQWl4QmViTVlMYjVTYTYzY21XU2xP?=
 =?utf-8?B?ZE1jNHQ4ZjYvZnFYL2RNaCtkUDI1M05MMm9VQ2IxREtMS2pQRnNXWWxYMkNG?=
 =?utf-8?B?UFZzZVBRaUJhQW5OaElnSU81alZMWkZ6QU9Mem1vRjJSRVRkU0VZalRERjcz?=
 =?utf-8?B?VWdqcVUvRnN6a0xxT1o0MDFCK0g4cXpWaU9zM2h1RG1VTnhqdm9kQ3hXWUVB?=
 =?utf-8?B?NUhCMmcvcjJEdVFtRlZKN25NYndCVTF1Qm9YRWlCQktKWG5COHMxR212N0JZ?=
 =?utf-8?B?UE9QMUo3Y0V2VzlyZFlvbGVweUlZWXBSeGFNaUFBL1hPWUFoMGpid2liZ3Jl?=
 =?utf-8?B?cDV5TDNSSm90TEkvdExMVmNzbkUvZ1JlcVhzdFYrRVFsNEhyajhFYjdQT2VU?=
 =?utf-8?B?UHg5TFN3SlloaE1PbTdDRFlPL3BuQ1JKb2VnUXk3bTdVZ2huWEx6UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4B25871F8B19F4394BC908B559082E7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	OFkJZ6gJk5z5P15oJZRLDYWGZBxgu6fpIV09RL24bOK/KWrHQrmQt8b7LQ5o97REs1a80ko8YZsmhqYxWEUGTidWjtJzNbeUbj2cK6oiB38bb6WjAqH26x+l8xkE5SksEfKHYQNEFSxEhqoDhyOrGEiBEV+aAOLfWQ/h+ohjdvju13mC8CFbHHYnxYzXGPuxMOq3pYPrran3+YEM3AmBot85KVHFi3jRG7CHQvnOHvxt0HopR5fQldiR15RVYSckLK7JyZSnK8U5l2Ww+cXZCwZaS+1MLhJbcEVDJOY151/qwx6SNjxjDam2+fnvG7lQqgBEGVz8t908Y9HQkfPDGQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NvA3Hd3146KtN6J/r2Sm3wqQteP9d/Xp3UUXMvGiPdSvmfGb09gRfYKL6HSCQHTN8EioD6kXRhN8eBgVyhhY6E+jr5MFBsCTc5qQ5+BgeoGzooTfXLc9tjqtqOILM1xJwBu972lv0oL+ZUD82Ysss9X0QhnOtCiD+adhX/gPHh1cK2tgHBZhG+LMv8IQ/IeXLpR0sQn6p5apkf/cCnqpqstqlpnmaP6qORACk1BxNHwt0Ue8A1AlD91cL/zwkaTryVhlbXCUrmBXcqSiNSUuq8aZtRTRUTXKe723aFpArBoSp2YGwMGs3WcsaD6YIqpdf/gVffBQxAhlE7InR9/gO5qJNoqx8pHXuDYg7z5ndYDQ/7HM5vZC9pVwn9/qk/SYZf+56FpNxdoocZ0eCC60GcthCb7F1AJ1WgJ73sXM2OtVXlQYenceaPZUsT1H1TxJAec8OGhUl+72AqFxP5Tzt1cOnxKcRqsfOzJ0ccK8izB6Q4rLi8DyZVWcPSS5B3qL4apDG298Y4WZiz/4+qUlyHq/pd3D8qE6Q/wakf4qiTfZ9xfMsp3J5qPYyoGZ3Xcwrhxg12cixrEM4RJXckCI/dBDjmTlypgojG/fXl6C/mICmp75nMeDvL4Y6aD9cdlMv+JavWffh0ZckQVgGAUvMg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea18dbd-86f2-4142-f5a7-08de860d8963
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 23:16:23.0685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E5R/v/gdpPBVp5zFd980V3FN9MvHhAbgKDlmJOmTXbPrv5sMT/5RklPt3ezBidWcHqXNmGfATHf9p6SkFECJ7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7091
X-Proofpoint-GUID: ix8UjROFz1d8L_EGGUsTkhzBYIebps88
X-Proofpoint-ORIG-GUID: ix8UjROFz1d8L_EGGUsTkhzBYIebps88
X-Authority-Analysis: v=2.4 cv=S9DUAYsP c=1 sm=1 tr=0 ts=69bc83ce cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=xrrQljTKTtbahvl9rP4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE4NyBTYWx0ZWRfX5sfVxmkRLTCm
 UZjeykSYXqKACV6JMQrMOxTmelSo7aNkdTJ5pXWx/SKe+09bNP3IAAEf2HMH720I2NHuAOywExy
 73G3HZ8PzCzGL2SP5BO5dMrTgoOG1PKenOvCWC4kXMSTU3LEHzy/ui8FDK/KqTzs7w/bmRFhfP+
 O4EPoyqd6VetJuOmUDVhjowR4ydtXgqQyF0rDlqF5aixEyDk4qXwq5d5bwdP4s5qxzpVy2OSyBm
 B6Wf091sY/M0JAbEZNre6QH1HM4SfvyhGKY3U+1WuiuAis2BbNLnIkCC6F48QCYVAyMjMzvD126
 8VFaTNv0eRgj/ANMS/udNMJ7RpEPeW0U+qCzWC3SVNeUZ/0HNWFJRuR+g28lm+ymetsuKAhWOab
 bKOcCvre2Zg25/Knt5sKUPDEggeNxzubpykI8RTQhtv4jDL/4EG/B3/OGw9W5vGKD2/QtuaLzo2
 7fDMleEAWrU/nr8h2+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603190187
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-35215-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.988];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[synopsys.com,gmail.com,suse.com,mork.no,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 26FBD2D4068
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBNYXIgMTgsIDIwMjYsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIFdlZCwgTWFyIDE4
LCAyMDI2IGF0IDExOjU5OjIxUE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBX
ZWQsIE1hciAxOCwgMjAyNiwgTWljaGFsIFBlY2lvIHdyb3RlOg0KPiA+ID4gT24gV2VkLCAxOCBN
YXIgMjAyNiAxMzo0NjoyNiAtMDQwMCwgQWxhbiBTdGVybiB3cm90ZToNCj4gPiA+ID4gT24gV2Vk
LCBNYXIgMTgsIDIwMjYgYXQgMTA6NTQ6MjBBTSArMDEwMCwgT2xpdmVyIE5ldWt1bSB3cm90ZToN
Cj4gPiA+ID4gPiBPbiAxNy4wMy4yNiAxOTowMywgQWxhbiBTdGVybiB3cm90ZToNCj4gPiA+ID4g
PiA+IFlvdSBrbm93LCB3aXRoIGEgVVNCLTIgaG9zdCBjb250cm9sbGVyLCB0cmFuc2FjdGlvbiBl
cnJvcnMgZG9uJ3QNCj4gPiA+ID4gPiA+IG1ha2UgYW4gZW5kcG9pbnQgdW51c2FibGUsIGFuZCBj
bGVhci1oYWx0IGlzbid0IG5lY2Vzc2FyeS4NCj4gPiA+IA0KPiA+ID4gRGVwZW5kcyBvbiB3aGF0
IHlvdSBtZWFuIGJ5ICJ1c2FibGUiLiBJZiB5b3UgZ2V0IEVQUk9UTyByZWFkaW5nIGZyb20NCj4g
PiA+IGEgVHJhbnNhY3Rpb24gVHJhbnNsYXRvciBhbmQgdGhlIFRUIGRpc2NhcmRzIHRoZSBwYWNr
ZXQgKGJlY2F1c2Ugb2YNCj4gPiA+IHRpbWVvdXQgb24gSW50IG9yIGJ5IGV4cGxpY2l0IFNXIHJl
cXVlc3Qgb24gQnVsaykgdGhlbiBub3Qgb25seSBpcyB0aGUNCj4gPiA+IHBhcnRpY3VsYXIgcGFj
a2V0IGxvc3QgYmVjYXVzZSB0aGUgZGV2aWNlIGdvdCBpdHMgQUNLIGFuZCBtb3ZlZCBvbiwgYnV0
DQo+ID4gPiBJIHN1c3BlY3QgdGhlIG5leHQgcGFja2V0IHdpbGwgYmUgZHJvcHBlZCB0b28gZHVl
IHRvIHRvZ2dsZSBtaXNtYXRjaC4NCj4gPiA+IA0KPiA+ID4gR3JhbnRlZCwgRVBST1RPIG91dHNp
ZGUgb2YgZGlzY29ubmVjdGlvbnMgaXMgYXBwYXJlbnRseSByYXJlIGVub3VnaA0KPiA+ID4gdGhh
dCBhIGhvcmRlIG9mIHVzZXJzIGRlbWFuZ2luZyB0aGlzIHRvIGJlIGZpeGVkIGhhc24ndCBtYXRl
cmlhbGl6ZWQuDQo+ID4gDQo+ID4gSSd2ZSBzZWVuIFdpbmRvd3MgZHJpdmVycyBoYW5kbGluZyBV
QVMgdHJhbnNhY3Rpb24gZXJyb3IgcmVjb3ZlcnkNCj4gPiB0aHJvdWdoIGNsZWFyLWhhbHQgYW5k
IHJldHJ5IFNDU0kgY29tbWFuZCwgYW5kIGl0IHdvcmtzIHdlbGwuIEkgaG9wZSB0bw0KPiA+IHNl
ZSB0aGlzIHR5cGUgb2YgcmVjb3ZlcnkgaW1wbGVtZW50ZWQgZm9yIHVzYiBzdG9yYWdlIGFuZCB1
YXMgZGV2aWNlcyBpbg0KPiA+IHRoZSBmdXR1cmUuDQo+IA0KPiBJIGRvbid0IGtub3cgYWJvdXQg
dWFzLCBidXQgdXNiLXN0b3JhZ2UgaGFuZGxlcyB0cmFuc2FjdGlvbiBlcnJvciANCj4gcmVjb3Zl
cnkgaW4gYXBwcm94aW1hdGVseSB0aGUgc2FtZSB3YXkuICBBIGNsZWFyLWhhbHQgaXMgaXNzdWVk
IG9ubHkgaWYgDQo+IHRoZSBkZXZpY2Ugc2VudCBhIGhhbHQgdG9rZW4gLS0gYnV0IHRoYXQncyBu
b3QgY29uc2lkZXJlZCBhIHRyYW5zYWN0aW9uIA0KDQpUaGF0J3MgLUVQSVBFIHJpZ2h0PyBXaXRo
IHRoaXMsIHRoZSBzdG9yYWdlIGRyaXZlciBrbm93cyB0aGF0IGl0IG5lZWRzIHRvDQpwZXJmb3Jt
IGNsZWFyLWhhbHQgYmVjYXVzZSB0aGUgYnVsayBlbmRwb2ludCBpcyBTVEFMTCwgbm90IC1FUFJP
VE8uDQoNCj4gZXJyb3IuICBPdGhlcndpc2UsIGZvciB0aGluZ3MgbGlrZSAtRVBST1RPLCB1c2It
c3RvcmFnZSBkb2VzIGEgZGV2aWNlIA0KPiByZXNldCBhbmQgdGhlIFNDU0kgY29tbWFuZCBpcyBy
ZXRyaWVkLiAgUG9zc2libHkgc2tpcHBpbmcgc29tZSBpbml0aWFsIA0KDQpUaGUgcmVjb3Zlcnkg
SSdtIHRoaW5raW5nIG9mIGRvZXNuJ3QgaW52b2x2ZSBhIHBvcnQgcmVzZXQuIEEgcG9ydCByZXNl
dA0KaXMgdmVyeSBkaXNydXB0aXZlIGFuZCB3aWxsIGltcGFjdCBwZXJmb3JtYW5jZSBncmVhdGx5
LiBJJ20gcmVmZXJyaW5nIHRvDQphbiBpbnRlcm1lZGlhdGUgcmVjb3Zlcnkgc3RlcCBhdCB0aGUg
dXNiIHN0b3JhZ2UgZHJpdmVyIHdpdGhvdXQNCmRlbGVnYXRpbmcgdG8gdGhlIFNDU0kgbGF5ZXIu
DQoNCkN1cnJlbnRseSB3ZSBfaGF2ZV8gdG8gZG8gYSBwb3J0IHJlc2V0IGJlY2F1c2UgdGhlIGJ1
bGsgc2VxdWVuY2UgY2FuIGJlDQpvdXQgb2Ygc3luYyBhbmQgdGhlIHhoY2kgZG9lc24ndCBzeW5j
aHJvbml6ZSBhZ2FpbnN0IHRoZSBkZXZpY2UgZm9yIHRoZQ0Kc3RvcmFnZSBkcml2ZXIgdG8gcmV0
cnkgdGhlIGNvbW1hbmQgZGlyZWN0bHkuDQoNCj4gcG9ydGlvbiBvZiB0aGUgZGF0YSBpZiB0aGUg
dHJhbnNmZXIgd2FzIHBhcnRpYWxseSBzdWNjZXNzZnVsLiAgKFRoaXMgDQo+IG1pZ2h0IG5vdCB3
b3JrIHZlcnkgd2VsbCBmb3IgdGhpbmdzIGxpa2UgdGFwZSBkcml2ZXMsIGJ1dCBkaXNrIGRyaXZl
cyANCj4gaGF2ZSB0aGUgY29udmVuaWVudCBmZWF0dXJlIHRoYXQgcmVhZHMgYW5kIHdyaXRlcyBh
cmUgaWRlbXBvdGVudC4pDQo+IA0KPiA+IFRoZSByZXRyeWluZyBvZiB0aGUgVVJCIG9yIHNlbmRp
bmcgYSBuZXcgc2V0IG9mIFVSQnMgc2hvdWxkIGJlIGENCj4gPiBkZWNpc2lvbiBieSB0aGUgY2xh
c3MgZHJpdmVyIHdoZXJlIHN5bmNocm9uaXphdGlvbiBhdCB0aGUgaGlnaGVyDQo+ID4gcHJvdG9j
b2wgbWF5IGJlIG5lZWRlZC4gQW4gVVJCIGZhaWxlZCB3aXRoIC1FUFJPVE8gbWF5IG1lYW4gc29t
ZQ0KPiA+IHByZXZpb3VzIHN1Y2Nlc3NmdWwgdHJhbnNmZXJzIG5lZWQgdG8gYmUgZGlzY2FyZGVk
IGFuZCByZXRyaWVkIGFsc28uDQo+IA0KPiBUaGF0J3MgYSBnb29kIHBvaW50LiAgVGhlcmUncyBv
bmx5IHNvIG11Y2ggd2UgY2FuIGV4cGVjdCB0aGUgY29yZSB0byANCj4gaGFuZGxlLg0KDQpSaWdo
dC4gTm90IHN1cmUgd2hhdCB0aGUgY29yZSBjYW4gZG8gaGVyZS4NCg0KPiANCj4gPiBXaGF0IHdl
IGRvIGtub3cgaXMgdGhhdCBhbiAtRVBST1RPIG1lYW5zIHRoYXQgdGhlIHhoY2kgZW5kcG9pbnQg
c3RhdGUNCj4gPiB3YXMgaGFsdGVkLCB0aGUgeGhjaSB3b3VsZCBuZWVkIHRvIHJlc2V0IChub3Qg
c29mdCByZXRyeSkgdGhlIGVuZHBvaW50DQo+ID4gYmVmb3JlIGl0IGNhbiBiZSB1c2VkIGFnYWlu
LiBTaW5jZSB0aGUgYnVsayBzZXF1ZW5jZSBpcyByZXNldCBmcm9tIHJlc2V0DQo+ID4gZXAgY29t
bWFuZCwgd2UnZCBuZWVkIGNsZWFyLWhhbHQgdG8gc3luY2hyb25pemUgd2l0aCB0aGUgZGV2aWNl
IHNpZGUuDQo+ID4gVGhlIHJlc2V0IGVwIGNvbW1hbmQgYmVoYXZpb3IgKGFuZCB3aGVuIHRvIHVz
ZSBpdCkgaXMgeGhjaSBzcGVjaWZpYywgc28NCj4gPiBJTUhPLCBpdCBzaG91bGQgdGhlIHhoY2kg
ZHJpdmVyIHRvIGhhbmRsZSB0aGUgY2xlYXItaGFsdC4gV2hpY2ggVVJCKHMpDQo+ID4gbmVlZCB0
byBiZSByZXRyaWVkIHNob3VsZCBiZSBhIGRlY2lzaW9uIGJ5IHRoZSB1cHBlcmxheWVyIGRyaXZl
cnMuDQo+IA0KPiBBbmQgZm9yIHdoaWNoIGRyaXZlcnMgd2lsbCB3ZSB3YW50IHRvIGdvIHRvIHRo
ZSB0cm91YmxlIG9mIGFkZGluZyB0aGlzIA0KPiBraW5kIG9mIGVycm9yIHJlY292ZXJ5PyAgQWx0
ZXJuYXRpdmVzIGluY2x1ZGUgZG9pbmcganVzdCBlbm91Z2ggdG8gbWFrZSANCj4gdGhlIGVuZHBv
aW50IHN0YXJ0IHdvcmtpbmcgYWdhaW4gYW5kIGlnbm9yaW5nIGFueSBkYXRhIGxvc3MsIG9yIA0K
PiBkZWNsYXJpbmcgdGhlIHdob2xlIGRldmljZSB0byBiZSBvZmZsaW5lICh3aGljaCB3b3VsZCBu
ZWVkIGF0IGxlYXN0IGFuIA0KPiB1bmJpbmQgYW5kIG1heWJlIGV2ZW4gYSBwb3dlciBjeWNsZSB0
byByZWNvdmVyIGZyb20pLg0KPiANCg0KV2hhdCBJJ2QgbGlrZSB0byBzZWUgaXMgdGhhdCB0aGUg
ZW5kcG9pbnQgY2FuIGJlIHB1dCBpbiBhIHN0YXRlIHdoZXJlDQp0aGUgY2xhc3MgZHJpdmVyIGNh
biBzdWJtaXQgYSBuZXcgVVJCIHdpdGhvdXQgdW5iaW5kL3Jlc2V0L3Bvd2VyIGN5Y2xlLg0KV2l0
aCB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgeGhjaSBkcml2ZXIsIHdlIGNhbm5v
dCBkbyB0aGF0DQpmb3IgYnVsayBlbmRwb2ludHMgd2l0aCAtRVBST1RPIGVycm9yLg0KDQpCUiwN
ClRoaW5o

