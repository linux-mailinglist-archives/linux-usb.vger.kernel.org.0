Return-Path: <linux-usb+bounces-33893-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DlWKp86pmnQMgAAu9opvQ
	(envelope-from <linux-usb+bounces-33893-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 02:34:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FB31E7B8B
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 02:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B935303C807
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 01:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23F1373C16;
	Tue,  3 Mar 2026 01:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LrOP9s8M";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BMC97u3C";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="wDP+Sh69"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32A91E8332;
	Tue,  3 Mar 2026 01:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772501634; cv=fail; b=EBxW80HzFj8gHM3EDN+RCucjjqyvsQEWjxYtSsNT48MRCYV1nObKmqkfQ4cFLnZfwFMenpJk2rryIipIN/gE/mov0F9MKvEHXRZIxeaHj5Pi+Oia7ho1s9EwHOWhod+0NdnCKXQOw5TlPIEhgUQfIKGyZP9Rh+ENsmCW7yeSwnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772501634; c=relaxed/simple;
	bh=+16bS02BBsgixbskSX3gb/JqodYqteM3SSZGizJZt1M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qWagveB4xjW7HUzblCzFKR2P8C4hZNXb9/r8JTp4LH2QBTYUFCT+2pLvCOT+sdptJ0Ia1GJtTd6TCSyRCDXb1VlcWmg4IL+Te6RxFMqQ1RGT+uqiJuvnA1tEdO5FJAW/W4d/5yuBUUbLl3cZUP/kwNklHycRUAMl4nsQJlaIli4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=LrOP9s8M; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BMC97u3C; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=wDP+Sh69 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6231LmMu297727;
	Mon, 2 Mar 2026 17:33:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=+16bS02BBsgixbskSX3gb/JqodYqteM3SSZGizJZt1M=; b=
	LrOP9s8MQevjEelns4eU6X+YVSK6MJ03eWy+eMGzKT3SHCYNC1pJIdEaoaegwJWa
	+skX//JlohpzIuct88S4vO3lsWP4GEeok4peZlcwzxHk2C4nkCOmaO3/iWUACCcX
	kRC6TyAondIoIk0WQejO7AGJuc1F7x60k0ky7MUxpRmUpS2sedWSSCb/gAgNJSib
	AWh5ytofDnhjGZ07AeTaZjb3Ny6g52pn8DRpxqhi6Ezvs9V4DjKiElw+oLidqDI1
	ztRcHK37Kjv3klhLfNOX/Knr+gxdmv48yPYMeV8QJdeMqi4V/nP1yVHSZH3SgIIh
	XW9rU/1lUy+OgMJnJnx/vQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cng95t2sk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Mar 2026 17:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772501590; bh=+16bS02BBsgixbskSX3gb/JqodYqteM3SSZGizJZt1M=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=BMC97u3CoR4VnBsAiIezfufToQk0mFhw32pk9Ch0hxztNCrQ+kMyvSoyrkn4Z4Djq
	 bYpcIgjASzpBamJWYZXCKHoIVQPZ/F6EikPMW8ggBrryoRhewle1KAUNS/DyDxBJRk
	 SUewgSe6K6gP/Ok53QMK0uOO7N0gAOJ1FeuSFhaoSEzEwBLEIxz+kPvNdiEEeXqyWc
	 EqWrgAPn02i7lFaH3tBiLV8bysqCH1oNGE0nO+fyM5WhYficE49YBg7PLhArZU4oER
	 WOxDtqhSihvEWYJJpi2QGNKomd4iK4WRHfyV6kjhr9VbOwbUWiCbGP5tk7wwZiPDXN
	 7QFChKAOAV26g==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9246E40124;
	Tue,  3 Mar 2026 01:33:09 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 9F4E6A007F;
	Tue,  3 Mar 2026 01:33:08 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=wDP+Sh69;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00306.outbound.protection.outlook.com [40.93.12.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 58322220480;
	Tue,  3 Mar 2026 01:33:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJogznrXbHOvZwcgi6IOKlCcHz3lBkR/r+stiGGs8SWP1vRqIk7MkKWwe3Ae+IcXLUuUh3DWUGyMOknsNp57nZp8N0cwirarvkX1MyP2bi0iJdfcgD+DwwSugZaDkwycHdCSvgTnmlbHBUoWL2xGprqOZUw2VyQVuVet7fq+5+TbZENaz3+3W44DwLq/W/qFhZk/HBpR4IgXIfoyaT5/W8QQpMmKjLXB+8Vo8pBuCf6MEAnPzaNsGj2FjqLDPd0o/rG4T7q+fsb7mrbja0MkYSLpxJd1UtEyE2pg1ADcvFa3qjNo/TGOEpKNE3zt0Kfu4AQ3/ZyqpMVnN2UAFrLhnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+16bS02BBsgixbskSX3gb/JqodYqteM3SSZGizJZt1M=;
 b=reFJD+bVE820rOGuBzlpfp7rjw3jr8rw1mjDsV2Jt4fTBjqrJfjc09aBlVFLXqTYYl8KXmXpDgLwlQ+PO1X20l0m0wIJ2tGbwRYXbmlae0EhY44heaivNXzN59WCwL4B7m3WGmsQSBOUS8fcmjXfm0N+h+mIc8wOoEexabkGMT7jVSH30fJqoyGF6qIhD16WVh5uXb/8/oBB9cF/l04gyPe+P/JU0d7YOmmtxOEMBxuAoeOa+rYgMrxzUvYyT+Q/OUQKM2vE8hw4aeyQQ1zjK4CFnIECvi1oB0dBbLJ7dhnJacKyghsjLfLslrkBLw1VUiCo8gA9z+Kk1m/JjomPOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+16bS02BBsgixbskSX3gb/JqodYqteM3SSZGizJZt1M=;
 b=wDP+Sh69hoUKC/TY+9lu4bTE8+44YcOmG3sozUHGSyehz1ZQCNQQQXp/iugJlamoLWh60yy55egksskiwLco8jVwKcCyMNsCuwix9lt94zXRqtBjkCxvWvNkK8lx6yj21vyKBh5kpdygWYlLbdonpdgh/rIg4qtFjtqCQrWID0g=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH0PR12MB7861.namprd12.prod.outlook.com (2603:10b6:510:26e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Tue, 3 Mar
 2026 01:32:57 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 01:32:56 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Xu Yang <xu.yang_2@nxp.com>, Randy Dunlap <rdunlap@infradead.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
        Li Jun <jun.li@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] usb: dwc3: add needs_full_reinit flag
Thread-Topic: [PATCH v4 2/3] usb: dwc3: add needs_full_reinit flag
Thread-Index: AQHcm/pas3rtQnSJD0KfS62SL6j+P7WW7UYAgAU2FoA=
Date: Tue, 3 Mar 2026 01:32:56 +0000
Message-ID: <20260303013255.ubvrpojawfztyszh@synopsys.com>
References:
 <20260212-add-flatten-dts-based-dwc3-imx-driver-v4-0-08c10b08ebb6@nxp.com>
 <20260212-add-flatten-dts-based-dwc3-imx-driver-v4-2-08c10b08ebb6@nxp.com>
 <4186c887-fec4-4677-a7b0-e48c52ac5dea@infradead.org>
In-Reply-To: <4186c887-fec4-4677-a7b0-e48c52ac5dea@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH0PR12MB7861:EE_
x-ms-office365-filtering-correlation-id: 3f1ad26f-023a-4a54-98e1-08de78c4cc45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 KeaTHlycsqLgagrIMXEfXronEKj74vq4AiHwYfHbONh733ffxWqBHHOB5EoBC7up/7zO9FQUeqrl8Mmad4tWDMYy/JjtTThJJfpaZGWH/Y14Kzwj/gxBNj4rzd/nk5D5p92M5D5fSTMbNcEO65SU/6rIj7ISRXWzcxYicQZDhLf9hHWvJZUyk+cmHdvVBUCIEJKayPD2MQGaxCp+9WvmSDCOpbfcYc6utwSDJIRisK1PbSqOgNTTmW/qnGN/XPuxbHd8t7t3jKSS6jxZblUbNFJkNIfvGbDECAxWExB2QYj5KjVNLkEwyRcAdXyBYJQCarVpSHTIacvNLTE5NPEo0OQ+oPfasnugkjX3cl0oz1l7rbC0+NQRSPho2ThzOUNPC/rxB1Hu0vkhz7h+VHIINA7u5ZBb43H5fX6zcu4PZEy2oDM/IhirAEADo1qeoVOmSmYrR/2TTdJL+dCmkb9vkTYzmPEWFlpST33kNOgUl5a/AmrqEAPn082L25hk0tXZACpjkSFqJnPPuahcQJ0jFDT8NfeUItQwm+yYN9e4dHRRFtzfP6HQZOIUs9nP+8W6EATix+pnwt86R7VvQ3JDTBtiYsej8tazHwVaHiMScEiJE323FXMtV5jvGWX81YMcscAcgSYTb41OaApTJU1+gg9ZvlnIcrP6T0u5KFYagi7LIhDwnad12XS4Fm9IsxzdTmWXHcc9Xnj2xUvX4XQQAjLZNBaQSpxgelxcahgARYBqJqqeJ0AQzCMPSEhrRdbDnA5KH4bsYDdddQa0EDCGkfomFsU54bXUcEHy1poabZo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eUdVdExoUTNySlNIdFRsMS8yQWFoT2t4RXk1cFlQUE9pdzMralo3L1g0RE0r?=
 =?utf-8?B?enZkd24ybEtTQ3A2YzM1Yi9WS1lBUkdkNU4rZVlSczdMQmN6QW1rSzhiOFNY?=
 =?utf-8?B?aC9oT3d0K3VQY1NlK0NNQzlFOWMzR0t2a0VyL0xQbmpweEpMZ2dWam5nNGhy?=
 =?utf-8?B?ZFMvRUs2VWtxZXBrazJQb0JvMSsrY0p6djB2eU9JOUR3QURDSGdDc1BUZWN6?=
 =?utf-8?B?VWUzNjZPVGJTa0VZZFhKdzhsM1dNWEpZNzNoM2R2ckZxa3R3THRnY0FWblRQ?=
 =?utf-8?B?VjVtRi9TcFZZYXJoOEZjT2t0eUJGK3dwSThDNXkvQmwyQmtvY1JTUExmKzdi?=
 =?utf-8?B?OGlKbDZRZlArN0s1MjR0bkQ5Q0lwaEZ5dlBYV29hSEFWVWsvcjI2QTJ2TFFI?=
 =?utf-8?B?M1diU2JGTEVpelg5ZWM3cm9LejREZmllWUtobG42UG8wU05KMlZ5bDk0bUVT?=
 =?utf-8?B?OUxlajh0YzZEYmU4MEpMNGpMZzNXU0Z2UDJ5OHlqMmw1MXdoL0JFU25SWVlH?=
 =?utf-8?B?Z21Ua0s2V2hRY3J6MzYrclFSc0dxOENnSEljQnY2UUF2OXJkZkViYUUyMCs2?=
 =?utf-8?B?NkRkZVJBdXhwOUtNQTNlU08ybmwyVzc5MExEZjlOcXNtd1dlNWQyUTdxYXpx?=
 =?utf-8?B?YkpMQy9HZjZ1T1ZXM1hsVmErUStBVUlpR3lBZVhneHo0ZnI4QWtuVjloYndj?=
 =?utf-8?B?elhDZEdkSkUxWlhqbVgzNWQ2TVZMOHgvM09pcFlsRGNrRjdwRHFRbU5JaTlX?=
 =?utf-8?B?V081VEdzVTluT2RqR1p4UzdpRXlucWU0b2ZQTXRUdlIxSUwyTWlVYUNYd0VJ?=
 =?utf-8?B?ODNFbjRqdUZWdnZ6cFpsVUo1MkN3b1ljdjZlc3A3dWRWcE9tOTZ1STdPZFFG?=
 =?utf-8?B?V3Nia1Q2cGNocTVrT3lPRUVyRWUwbzlvRGhvK1JYMUZmMFg1c2EzNVhUUU5P?=
 =?utf-8?B?QmNvOHFHWVZnOWtpQ01KamRtY3FQWHFmYWpkUmdBa1pYWnQ2TWNiMUEzUE1P?=
 =?utf-8?B?dSs4NStSS0JjeG5TUEhyWnNGakRmR3RyTzhDS0labjJHTURFMjBnY3dabU1p?=
 =?utf-8?B?aVFFS3gwZC9lcVRyTzdibGhEVmlRbTVIK0hJNWFtWlc4RG1OMGt3YUtnNi9D?=
 =?utf-8?B?Y2J4bEw2S3JkWllnQXR5VGR6c3JZTjVWcmhQbFBRNjZVQ0VUWWxtbHpIYzk5?=
 =?utf-8?B?UVVqSjlJMUJJTVBGekNmVVBPQ2Joek9YWHI0ZHVjWXhoT1lkSjEySTQvdW5X?=
 =?utf-8?B?aFgwUEJ5YzlwRy9SbWxRd2x4ekovcmRvWFRRMzZQU3UweTh3aklWako4aUpk?=
 =?utf-8?B?MDJmMEkwT2RqeWw5Q0phbmFRR0thR3JrWE80UzBSL0UzYUxCWTBqemYvYjBn?=
 =?utf-8?B?K2hEdUI0OFJzMUxBNHNIcHROdHlqempTNmQ0WkR5d3BPSlRpTlNPMVJHaXVE?=
 =?utf-8?B?WGR6VXRmdFJtTkZDVjIySkJsQVVZRnFWNTdrajJQdnNtVUI1WW8wT3VWaWdj?=
 =?utf-8?B?TWNrWENteHNxa1JwYUs4Y1JKTlRhYy9NdXQwVjBZcCt1bVdNV0EyQzhNendu?=
 =?utf-8?B?NU5QNUJZT1l3cVhnUDN1U3h0Si9RUlZpVzIyOXRzWmpwZm1XdHVLSU95NWpp?=
 =?utf-8?B?d2g2NGc5TUVqNGdDNXNFRUYyZVpZaSs1NEE2Qjc4THVWWTlUQlQzMW12UVhh?=
 =?utf-8?B?TSt4MVJONXBBcGhEcE5uK1JmMzFlQmVLeFpoeHpobStENE9GTWNrYk1qRkVr?=
 =?utf-8?B?azFJWkZtVzFTN0pjRmVwbGhReGJ5c1NYbG1jeFhpY3ZyMU5VQ2NSdHprUG9X?=
 =?utf-8?B?N0xjRDBIU2tJZENLb2xJanZqK3ZSTkxyMnRtK0xrRGdrblg0L2d3YW5JRTQ5?=
 =?utf-8?B?RmNnZE5CTmNRczBKTnZMRGp2YmR1K3JUeERPRE9MR1BmQ0t6dHdCZmlpZWpz?=
 =?utf-8?B?WWUyMFFNNlVwLy9rT1RjaWhUOTQrRE1QQVRFZ08vNC9Zd0dJWG15ODVpVlAr?=
 =?utf-8?B?TGZoZC9ObjZ1NTVDS2xUK3pySTk5SkYvc3VyV3NEQThEMUd0QVhvM0hKVXY3?=
 =?utf-8?B?K3JyZmNlU25SaWUrSi9kZXZsdjBTOE1GZkswVGg1eUw1bUd5bVBHTFBpSXNX?=
 =?utf-8?B?RUJFaWk4S2tlSXEyUXBxeVVFZmRSYloyVDFWNkdESUNEdjNvQzdhTWdnVWR0?=
 =?utf-8?B?SGEvd1NzNmNxUEJ3U25wYVl0NGV5YkUzVk5pVXBPRXpXRmFiUGQ5Qm5FSWI5?=
 =?utf-8?B?bGpHMHdYUHBBVlNZTzlQc1hKSjNZRnlDRDFoK21EbkQxeGtRYTBGVHdxUXRX?=
 =?utf-8?B?VDRCdEFNRVJKNzgva015WjRZeWdXdlkxL014Z2NSaTNma2VKYlJDQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AEF11B72EBF3EC478881517A37CB8C5E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	N37QhCmVUc8D4FLGe8WmL4J2NFB45YVjG25CwwvtCs4FfVZD/2pFW4s7lME3Xxq0NQzc1Wg8M8MMvDuRRGvu8EXHWxQ9BSCbchAxASpYzc+1FJhifNYT/7AgvQwYcPI+FfLoQPcdPmZndBByuHudEUdyxMnUsugMvCPwcSDdV+k78PNjjke3aGSKotgZ5Zd+k7B2wYgTh/T88Zl2DKgABgqCfo/Tw6gb0l4Gru6J903AC6yQwhcltrvqQh/SAy7e3A1zPd9n4Ja7EHJPThX/gZ/AE9KJRCFP6NovqZWb/EkNPMnm2YSlF5rIFtEsMFJ2Bhe+cbjfrnam6tnrKl5ZFBLb3H3CgnWaz4klPKfY9I8u/Umv7qFklYUS3lAswmlNA/+iwhQi8xkL0NGrHl1WMoqHbq8iMUXIyNt+x9ZzUC5fPN74bN6wi5FOIwe62XAUIx48Mw1tGkIxT9T84+ZJl7SwfDmpcApmPWlTmorSztjuhPxPXFPql2soDFVwA511NDbYoauZamw1dw13VmRKMLh+qQZ7fmREmY2ufI5fouMF5FjN85DzzQWG3uaSM6cXXjdu40uTwnrT1hXojMUjYPIE1RuPfminQPjImRaf1UFaEj32Q3cwLqZ03n9Dpga8Qn77WITIVsAODJ7YQ/My0g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1ad26f-023a-4a54-98e1-08de78c4cc45
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 01:32:56.8676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N447BoR29zWMkeqpkxEiLxVo7EIckYC5MgC7yrCVhw91vMzVTU3QDbvcRCftHQkeKwhRjhQfB6y3MUf9/MKPgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7861
X-Authority-Analysis: v=2.4 cv=HbgZjyE8 c=1 sm=1 tr=0 ts=69a63a57 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=8AirrxEcAAAA:8 a=QsiipC3PpIkOqSNpdIUA:9 a=QEXdDO2ut3YA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: AlxAJaCCeQT8SoDBL5Nx6Nild9NomcsF
X-Proofpoint-GUID: AlxAJaCCeQT8SoDBL5Nx6Nild9NomcsF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAwNSBTYWx0ZWRfX5sLY6U47Spuv
 7AF1D4ylaMn4KyiczOxN+gBGnvk9jqpP7EyMCRvjy8IiK381SBTK0yKHjmCHZKxvst0dweZt5KG
 mN0BhGgmOlrIaSQSYViQD/TataUJGjOxRL2FNVjMXrvrbFpI5k0iPHJ6q2jFW1ZyNnh/Vm3cmN6
 rBpKzd3ZvfqR+0+OiP/zEkof31xxexUkD+gCCmTSIsv0CrweyUFBLRrwMZzHyD6u3Anzf9FEKj0
 YvnAbNgcTEDRee7KOjYhon7JbjwK4U7/726YflBblQmiHbXwRg+4rAd4W2Kjly8cxwS3wgItknh
 0e2SbJ4mg0I7WQzXmfgekGkSwqS8plsDBfuBmm6Agr4Z0gsdaIvx8KFmKvJ8m5kw/UdSXvkbWlZ
 RG7RQNBICKOcYUG4kZb60E86Sab48ShQ04nAZzvVCjunNWuXfmSNISK9IoVOOtXCiPZurd27q49
 HqpCG7Zy+Ozdwa9rw5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2603030005
X-Rspamd-Queue-Id: 28FB31E7B8B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33893-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[synopsys.com:dkim,synopsys.com:mid,nxp.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

T24gRnJpLCBGZWIgMjcsIDIwMjYsIFJhbmR5IER1bmxhcCB3cm90ZToNCj4gSGktLQ0KPiANCj4g
T24gMi8xMi8yNiAxMjozNSBBTSwgWHUgWWFuZyB3cm90ZToNCj4gPiBUaGUgY3VycmVudCBkZXNp
Z24gYXNzdW1lcyB0aGF0IHRoZSBjb250cm9sbGVyIHJlbWFpbnMgcG93ZXJlZCB3aGVuIHdha2V1
cA0KPiA+IGlzIGVuYWJsZWQuIEhvd2V2ZXIsIHNvbWUgU29DcyBwcm92aWRlIHdha2V1cCBjYXBh
YmlsaXR5IGV2ZW4gd2hlbiB0aGUNCj4gPiBjb250cm9sbGVyIGl0c2VsZiBpcyBwb3dlcmVkIGRv
d24sIHVzaW5nIHNlcGFyYXRlIGRlZGljYXRlZCB3YWtldXAgbG9naWMuDQo+ID4gVGhpcyBhbGxv
d3MgYWRkaXRpb25hbCBwb3dlciBzYXZpbmdzLCBidXQgcmVxdWlyZXMgdGhlIGNvbnRyb2xsZXIg
dG8gYmUNCj4gPiBmdWxseSByZeKAkWluaXRpYWxpemVkIGFmdGVyIHN5c3RlbSByZXN1bWUuDQo+
ID4gDQo+ID4gVG8gc3VwcG9ydCB0aGVzZSBTb0NzLCBpbnRyb2R1Y2UgYSBmbGFnIG5lZWRzX2Z1
bGxfcmVpbml0IGZvciB0aGUgcHVycG9zZS4NCj4gPiBBbmQgdGhlIGdsdWUgbGF5ZXIgbmVlZHMg
dG8gaW5kaWNhdGUgaWYgdGhlIGNvbnRyb2xsZXIgbmVlZHMgdGhpcyBiZWhhdmlvcg0KPiA+IGJ5
IHNldHRpbmcgYSBzYW1lIGZsYWcgbmVlZHNfZnVsbF9yZWluaXQgaW4gZHdjM19wcm9wZXJ0aWVz
Lg0KPiA+IA0KPiA+IFJldmlld2VkLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBYdSBZYW5nIDx4dS55YW5nXzJAbnhwLmNvbT4NCj4gPiAtLS0NCj4g
PiBDaGFuZ2VzIGluIHY0Og0KPiA+ICAtIGFsc28gcmVuYW1lIGNvcmVfbWF5X2xvc2VfcG93ZXIg
dG8gbmVlZHNfZnVsbF9yZWluaXQNCj4gPiAgLSBhZGQgUi1iIHRhZw0KPiA+IENoYW5nZXMgaW4g
djM6DQo+ID4gIC0gbm8gY2hhbmdlcw0KPiA+IENoYW5nZXMgaW4gdjI6DQo+ID4gIC0gcHV0IGNv
cmVfbWF5X2xvc2VfcG93ZXIgaW50byBkd2MzX3Byb3BlcnRpZXMgYW5kIGNoZWNrIGl0IGluDQo+
ID4gICAgZHdjM19nZXRfc29mdHdhcmVfcHJvcGVydGllcygpDQo+ID4gIC0gcmVuYW1lIG1heV9s
b3NlX3Bvd2VyIHRvIG5lZWRzX2Z1bGxfcmVpbml0DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvdXNi
L2R3YzMvY29yZS5jIHwgOSArKysrKysrLS0NCj4gPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmgg
fCAzICsrKw0KPiA+ICBkcml2ZXJzL3VzYi9kd2MzL2dsdWUuaCB8IDMgKysrDQo+ID4gIDMgZmls
ZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiANCj4gDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oIGIvZHJpdmVycy91c2IvZHdj
My9jb3JlLmgNCj4gPiBpbmRleCBhMzViM2RiMWY5ZjMuLjY3YmNjOGRjY2M4OSAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3
YzMvY29yZS5oDQo+ID4gQEAgLTExMTksNiArMTExOSw4IEBAIHN0cnVjdCBkd2MzX2dsdWVfb3Bz
IHsNCj4gPiAgICogQHVzYjNfbHBtX2NhcGFibGU6IHNldCBpZiBoYWRyd2FyZSBzdXBwb3J0cyBM
aW5rIFBvd2VyIE1hbmFnZW1lbnQNCj4gPiAgICogQHVzYjJfbHBtX2Rpc2FibGU6IHNldCB0byBk
aXNhYmxlIHVzYjIgbHBtIGZvciBob3N0DQo+ID4gICAqIEB1c2IyX2dhZGdldF9scG1fZGlzYWJs
ZTogc2V0IHRvIGRpc2FibGUgdXNiMiBscG0gZm9yIGdhZGdldA0KPiA+ICsgKiBAbmVlZHNfZnVs
bF9yZWluaXQ6IHNldCB0byBpbmRpY2F0ZSB0aGUgY29yZSBtYXkgbG9zZSBwb3dlciBhbmQgbmVl
ZCBmdWxsDQo+ID4gKwkJCWluaXRpYWxpemF0aW9uIGR1cmluZyBzeXN0ZW0gcG0NCj4gDQo+IFRo
ZSBsaW5lIGFib3ZlIHNob3VsZCBiZWdpbiB3aXRoDQo+ICAqDQo+IA0KPiBQbGVhc2UgY29ycmVj
dCBpdCBzbyB0aGF0IGtlcm5lbC1kb2MgZG9lc24ndCBjb21wbGFpbjoNCj4gDQo+IFdBUk5JTkc6
IGRyaXZlcnMvdXNiL2R3YzMvY29yZS5oOjExMjIgYmFkIGxpbmU6ICAgICAgICAgICAgICAgICAg
ICAgICAgIGluaXRpYWxpemF0aW9uIGR1cmluZyBzeXN0ZW0gcG0NCj4gDQo+IFRoYW5rcy4NCj4g
DQoNClRoYW5rcyBSYW5keSwgSSBtaXNzZWQgdGhpcyBkdXJpbmcgcmV2aWV3Lg0KDQoNCkhpIFh1
LA0KDQpEbyB5b3UgdGhpbmsgeW91IGNhbiBzZW5kIGEgZml4IGZvciB0aGlzPw0KDQpUaGFua3Ms
DQpUaGluaA==

