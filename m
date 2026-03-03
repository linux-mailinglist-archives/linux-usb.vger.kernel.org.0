Return-Path: <linux-usb+bounces-33931-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6I4+GMhzp2ljhgAAu9opvQ
	(envelope-from <linux-usb+bounces-33931-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 00:50:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D631F879E
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 00:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E72230F9B41
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 23:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D593750A0;
	Tue,  3 Mar 2026 23:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NK8vbaKL";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ix+/QTHc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eQ/HG6z3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F7F374E4E
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 23:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772581808; cv=fail; b=bTEQLKeEc7YfyZuUN+To9iFQ5MZLdwrumT8Ip4Xd7HLMfUAq13aTB1U78XsjlnwmT2rUU2w/F7JCHXET1qcVvCGcdnF7xOyFO3EhY7F4AtqgnNzaz6vjkHXTvp9vpU0WEcDSN/1eFF4Zx08qPROBZvpS9qlzSSq6vgoJ3nSlx0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772581808; c=relaxed/simple;
	bh=gEbbWCctv2JWm5jQQpGlW8pFypHsggN85SJC0AbKvOo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fXjwu8SzLvy0dCmSuex6acR8P/VLRalsHAUvC/lCkxX1OlSluhDSUCW4YdtnJ+LtNh/uaFQ0uScLyuLt1sZXdjrYbkk4xQFN7Ubu/3BZuHIyHcbTUm2RfJ4hFjb0I1LiQ4WcC2AWZV5c3VBh9haSLSMOfyFDykC20csqp1nRXHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NK8vbaKL; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ix+/QTHc; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=eQ/HG6z3 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623Kiw354186242;
	Tue, 3 Mar 2026 15:49:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=gEbbWCctv2JWm5jQQpGlW8pFypHsggN85SJC0AbKvOo=; b=
	NK8vbaKLkWTkcDJF1YQ1T48FGiluLbJ0tK0rdonUZ3/dYPJQxqOI1dC8f+39w+3K
	RFMMAVIFxUSwpX39SsjR6RB4zgA59uSYX+9Qs80GoSXvvT9CmavlwONqg4Rb5IE7
	USKqQ0UqHSUWqWLhaGtdMy0KYsrBZ6csxcBu+b2ndwn/p2NlVMMy0siYNO8LH21s
	8rHL7TZ5lIoJ0kFhYyDPViq2/mjP4uKBCI50c78N68xEGsGgHPR2eMkJUPGJCglQ
	MhcNU5YFM2lcqZi1qDVU/b3RzEGsjqQwjHKKdM2rrQVDpSTVuKyztTpQu5kZlmen
	r6GLYGeDn4SKIx9y1+7n2g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4cp5qj9ct7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 15:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772581784; bh=gEbbWCctv2JWm5jQQpGlW8pFypHsggN85SJC0AbKvOo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ix+/QTHcxNCVTgjKufnp4Q01RfFa2r84KqVQ1WNrBWv/csR2SLhB0zIK1teJwtB5I
	 sOmC1B+HhnYFTPM/R8yhRBrnJblHkMDG2QrkUd60a5Zk3y1eaO9AL27m0fihxTfYWv
	 KUnS0grzWu4VNv28j0wtv4B2MYcAztuHj+vi45b+VvZnY2hNntgESU+D5uMiSU0QOt
	 1rUNHjxi3v6lsOUrhSn8hyKZy8wihffcdMjUHdQRQcuphDI15m+T5oL9NwPrrH8ZOT
	 ZtLih/8ukFQ22MUeYnkmpvcwLc2gw9+SK/uLeTbzD0Errg95tQ5ySOSv7h8ky/aElj
	 x1Emu0DCAHFag==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5B75E4045F;
	Tue,  3 Mar 2026 23:49:43 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B2F50A0158;
	Tue,  3 Mar 2026 23:49:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=eQ/HG6z3;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00307.outbound.protection.outlook.com [40.93.1.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id F221C402B2;
	Tue,  3 Mar 2026 23:49:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VosIw2BvdD1sYqgYYcSDmsW5RSddEq1SWInsDeZAXNWM5XaS68/99tRYn8XWPxYOx+gaWqcePHc/q2nF27XjWcm7PhyZagVL1bB3iIOaxTQW3y7E4klruRE1uhMynR7VGte8rA9YOpXXkP667woW5uoQgIkcwxxJLUIjY1xoRUbIc557KWS0JLhLCK739oub/GSawrQS0OYVkGXqHnT/p0J4ShzOjc8yQ2uJsjYzzmDl97/XcGPkfvK3qUCM0/vh8YCP0rpQs+RiVKg8dbLDB8gsoh+5f2AvLO15aCHZOscL1mib9T33kNN1NIEIs80iAG8TlwKJtISWOSTPRwQQhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEbbWCctv2JWm5jQQpGlW8pFypHsggN85SJC0AbKvOo=;
 b=UXp6XXXCMR3ErKf3sAtmf2TPpMLbCwsc/jmdsIMmE1u/t0nU6W/Ndvo+ZVZeCulQoRBwldYReS+BmPeZhoUaVPhpl6zuuHarDOz9OEn9Vk1kov7++dRtnfPLGTlvjOmZjnxBo/kO5AtNJDNId7aGP3axzg6xZznoWZGJXlm72nNrUX46mXKiQvFaICYXAJ9TLbAuBgdWwHAIQ3eoXkAt9Jhe13s9vNMD45gC8MlUOWUntSvgLEQODw77f6xXJdk70BmEnx6YF20O8+FQxKcYhLaevkOb3N4QLEQIlOmyWjLlkIlRBxNWZIwWrZF+8L56XtD47iXa6PAzCOmQM1O6GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEbbWCctv2JWm5jQQpGlW8pFypHsggN85SJC0AbKvOo=;
 b=eQ/HG6z31RxP49F1Qs7bAZ0TtmSWNyjlI/g+MpvokEcsS3qcDh8nNlHBA7RKo/pAsMePrxk6YsRtnXPQ5P/3wjUo+7qJhQwRrUkYSr8pFis2Xj6HxIh4m28MgxCh4DRyxR/pLRQHKBafdOeowRhj21EIHy5WTcTND38hG5Nv5LQ=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB9529.namprd12.prod.outlook.com (2603:10b6:208:592::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 23:49:37 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 23:49:37 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4 1/1] usb: dwc3: Support USB3340x ULPI PHY high-speed
 negotiation.
Thread-Topic: [PATCH v4 1/1] usb: dwc3: Support USB3340x ULPI PHY high-speed
 negotiation.
Thread-Index: AQHcqxLp0pUIg5FEREKD5oHwYzLXXrWdeqGA
Date: Tue, 3 Mar 2026 23:49:37 +0000
Message-ID: <20260303234935.zusemc7tvnmetpbs@synopsys.com>
References: <20260303133720.17167-1-ingo.rohloff@lauterbach.com>
 <20260303133720.17167-2-ingo.rohloff@lauterbach.com>
In-Reply-To: <20260303133720.17167-2-ingo.rohloff@lauterbach.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB9529:EE_
x-ms-office365-filtering-correlation-id: cb583f9e-b992-4109-95ad-08de797f87a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 LfSej6pNIdpCAaa12Q8G4XbsfuCXiAw4m8JQ2mDlkfleKspSIHfuljjws7+x9JGKwCxHkBcNrUinaTfL6HjokKeK3LYPxYckRlf8yheePn/wGN5SRRQQwcJFP8oLt2bYaMv0pXN1CKPIbmJJ5pvOPCCFkJp4e6rkMo7UZroR/QZZ07/I2Zz5wGVhEwIA+n414w7AKxq4yW0ADZEjZEXq6I0wHGyb0lPJb6pTtXLbpaxKuFku8AAo+EijwOucIOCEwQZY7VJfAeoBo3TQ7RonmyMHmeHaIK3fy6KdywNlhIh+Qr9tnkLgopg/HQbV+Idws8LPAu4VJEvK0Q+0/AnPr8aMOmRsq1yQkVRV75JCKIB0ptDriU8tm/3aiDiOFCHrbn2HRiVIhUx6dHY5sjPcbHFQi/LGPjAVgNJAd7qoqyYaWoUKqfjAQrlE5Ym4fusunJVR+ZZgR5Iw5HLw3o+D4I+u0JM8xU/mHmg99BReizuRvwwG/oYXA8wc3HX5jVdkNilAuMYcKh4zLJCAP1WhjaGsEB/pd/OzQR4SYbO8QKtDjoMwKgkQ7878gDPKkiqIfiTYD6N12zUzFqH0HMwotX6FxWeRA0CIwfAzI+2gnShcXmqyOG/MPfbzVvFEfCSNK6/e/KCpkzKP/3lnawlOOX5l67DxcyXjUKo9wH8ksFlV8HAgwV55QQyZogLVxF5UKLIQn5ptRalcFOTQ5em2jNh7iPBzMncx+lVjFWtIR0PYWYLrJ4yakH/WaQZKhcvEoc2h1MfSUWEOV3TNawo48jx/B8stzi8TFIKaCtZorV4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bVZ2ZkFhekY3WXZZQjhmcGFDbmk0WWNIRXZMdVZpWldDUGwrbVM5TXVKY001?=
 =?utf-8?B?SzlsKzNBUzYwSlMwc0NJZ3pKSm1KVk1KV1RRY3A4alI1WEhON3dNSTFPeUJK?=
 =?utf-8?B?VVhsZ0hTODA1eVJXMTlQc25WRERQTExZMTM2OFFnWHUrKzVUVUJuc1RHanFm?=
 =?utf-8?B?RFhyNnQ2UXJFNXFzZGg0SzZaeTlIUkNma0dqa0ZBVGxhRGs2SXVxOXBVTHRv?=
 =?utf-8?B?OHUrcGdPK0xub0Q3WERveEV4USttdytzR2w1R0tabGxUaXJDS1BzK0FWb05B?=
 =?utf-8?B?ZEZ0RW5WY0hLNktXQ052MGxFeVlzbXNPbzNSVnVLNk5LT2dIWXZpdmZIVUZx?=
 =?utf-8?B?RThJMmtadmF1Wmhic0NkNFRwSDY1bTNnUEl5STlUZ056ZDRoVDA3RHJUN3dP?=
 =?utf-8?B?MElyVTJkbjIvcDIvcytTSEo5MjhXSWpvQWswRlJrV0Jtc09oWFozSWQzQ1pJ?=
 =?utf-8?B?anloaDcxUXd3MitaYW45cEkxS3Y2NEpLYXh2eHV0TExmRnU0VGhGdklHTE1s?=
 =?utf-8?B?UHlFSDByNGRXcTQrbnJqS0cvUHdQYVVzQ2xEVGE1Mk1LNHF6OXUyZzV2UHdq?=
 =?utf-8?B?emF5SlJIczJZRGg4VVlaaXJpVEoyR3JnQVRzOEtqZmxTMzcvOHhpVkxUKzhD?=
 =?utf-8?B?Tm1BYjVQUDRyRE9IVHF2c3BtWTdQUCtDMEliSE00QUxuN0xzZWxiait2Nm1O?=
 =?utf-8?B?SlpRZThOeVFEd2puSnFTQlptTStTS0Q2YldKZEVQdCtETE1YOW9rYVIxWEUx?=
 =?utf-8?B?Tmk2d0ZCWktUeGRMWlBpeTd2dUtSTEo4VHNxTFFlVGVPNldKQmNndHA5cmp6?=
 =?utf-8?B?aUlWLzdZbmNabVlscXlXd2FNdUpsc0NkNnQxUktqV01TS1hNQ0N3VFA3SHNC?=
 =?utf-8?B?Z0EyUllIWUhNK2lXajdwSUhOV2gzcjBUVFVjbllHclVkbkVGeG55RXRVQjFW?=
 =?utf-8?B?QTJmc3hNai9Tb25Qa2RUcW5UNFpsWVNIWkQrWk1GVEZ2MCtvRU03TS9aV2NE?=
 =?utf-8?B?cjQycXJEcGVaSGQwN0duQ2Z1U1N3UmxNWitKaUZZUk5Pdm1wc3RUdVlNQkx0?=
 =?utf-8?B?MUx1WFNzdDlIck1HMVhlbG9ob2VxdFJLd2JpeisvZ3Q4emhyT2xhZ0JRRW1Q?=
 =?utf-8?B?WGFMbGQ2SkZxSXBXOHFhVUQyd0lGZGNDam1Hb3ZvYXVtWDdjWFZpMk5vaUtZ?=
 =?utf-8?B?OS9mY3BKVHB5bVpFajFoWkRuTk40SEwrNkY5VXM2RFI4d2NBampWbzFhVHor?=
 =?utf-8?B?OUFpcnY0WGM3MnhOakROK0Qvc2xkVjRaM2JFVjFDL1hBUGpPRWlta1A1WmRo?=
 =?utf-8?B?Mkt2Zk1kdjE3OThUVm16TGhwRENmbVI3TjU3NEN5YStYTnRDTWdTUGZKR3Q1?=
 =?utf-8?B?OVdWa1hZRU4xM0NCTkJZQ0tYS0hJTVVUalBDRWdPQyszN0ZScDhyWG1PYnNp?=
 =?utf-8?B?NWVXdWFuSDlCbnY5VVptalhtWDFSaTVXUGY3WlRLNEN2andMNExUQklMbEJY?=
 =?utf-8?B?ZHAyeGorY1lHL2ROWXhoa3BtdHZWZ0hkUFgycndJKzJhZzFueE5KcmMvemRq?=
 =?utf-8?B?QlNoWFBkYmJXVFJHbDBDZ3JpL2I4NEdSc1FJelUxT3F3d1lwQkJZeUN5UzNp?=
 =?utf-8?B?MW81bjhoWTZ4cGtPM2MzZWMxZzBFRlJFM29CYnAzdGgvd2ViNzJlQ0p0NzNI?=
 =?utf-8?B?Ty96ZTg0SWE3UURkdUU4dzEzODRQbXJkZlA0VEZibFdlSFRmYmVwU1VHbjJa?=
 =?utf-8?B?MVBSQkErcFFVOTNFeEV3NkdzbFkvTkQrbXMyUjh4cnQvOTdyMHl0TnpZQ1Vp?=
 =?utf-8?B?TjFnbitya2R1ck81ZVF2MEhMMEZENnlKWHNkLzl6Slh6aTI4bWRqb3VkTXdo?=
 =?utf-8?B?WlNXRU51QjQvR0pRT2Y4MjIrc1dVdHdpVWhtcXNpUGVZNFRLcThKYnNiU0F0?=
 =?utf-8?B?UmRqZk5nYkd3WXp1WmtJVmJJdEZoVjgvQXl4OUtqZXl0UVNUOG1vUDdHRkla?=
 =?utf-8?B?U1pzdUVka0hJck1Nem5CNGx0Zzl4VUdHWWNxWXZoWHhzK3RaWTU1OHB5NG5X?=
 =?utf-8?B?VUt3YlhRL29zbEVudkd0QkpTWGtRb2I1RGl3bFJCZDQxVmwwaVVHS2xPT1kv?=
 =?utf-8?B?bkkzYnpJbEc5Z2lyT1RSTURSTXFpSnUxaGVnM1NVblpGa3pXRDMxRENaSElr?=
 =?utf-8?B?ZklWYUZiSi9YWHdNbUNacnRTcUYvczgyemFZNmJHeU1mM3gvUCtHYU5nQmpZ?=
 =?utf-8?B?MWU0djdtN0xlT25ZMHZsVUxCdTRQUXRoQzFUY0hYMHFlWUgzaG9yeWVsOTFB?=
 =?utf-8?B?eW9FMEkzVGVpRERuNFIvcStSeXhBdHA4dE53NWZhQTNBM29CRk5Vdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8959C3BE35953A4CABB858C76E09FA85@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5TF/10tXiKgGLaIGgdctFT0eQpyiaUICkqJOXbMX5/ImqSoGPN8V4FplpdiHFgyS6/vKmh5y9DvGCqMHZ61D8v3Kl6cf4nVqbJeC1iYpzVF9VSCGA3rUaN+L0YMbBsOLk5KoIgFhCnFUsc+aotoEPYUhYXhHkX8aD/6pP1Y5lgSg37xieqNn7dilDLTX+Qedf6UZtrRbgdPISSx7wasI9sfIyjhzY1DrP1QyhLfVD1EQlXT0qyNuBw9+PfDBcMi/igsxMLPoTCeCoPQP/mWnVzQji3QIEIwfs0Vs6zebsFoH/AHO7+DeiI3DXL9lRpMEoxunQbW2SUaly8hZEvhbyIqgRvoeYy5yQVawhuKde6brwVwEQ9/H1ye3bpxHD7RJEV/DKLNw2H4IMYQV6wAdO28x0rm/Iq3MO97Pm6jfmCsL9wLWdi4a++tbNlonULrTdZ65S3LYVXn/GieTNb+H+rPWA/hGiZqLbMgTKGyDudwISr5/spCYPGixN1yahm/5q55b68rSAaQYnSnQQ43K3dK3wKEyTuI7T8SWvl0NL7XedcoTMmQ1h41wUEFtskCSMreJr0XCsA4VThki2REW5mOBqQeNoVoOx4IBECRWLQIJTqJITb+LYbISqCR/Nxi8FYNX4zH8LTNI0qCfPFrRpQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb583f9e-b992-4109-95ad-08de797f87a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 23:49:37.6425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g54AY4E+5Iw89GL6dZlKpvMMBGhJ4o987KPeJ6Pc+JkAQsWHroG8NqbdMMR82+VZnQI5X9SVtcu5eK0BK90JyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9529
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE5NSBTYWx0ZWRfX5is88a2Q/CHs
 X5qSpu+v27XkEJs5vMe69IdprD2bKQdxiXPiYsrNywHKNSWyUD8pOGzoquqdb0e3gjr8R1+8nJz
 GRxRWdAZSMDVnelTxSpo/wZRdsJMQn3owTxIB0ywHuxQU9hRbtlFjkhxiAHWJoybgvFGzHqeEaq
 QRlMDsy4mGlmsRaMLSz8uksYoz3/36kRIPOX+ADEVecIF8MhvUEdaZWB081/tuE8gto257D472D
 McKcCZYlQY+5zTUVgdCBm5aGFrdnexwrvyaB72tkR2dFBATQU2WQ9B91JeSSQvkt6bpxB95QyKF
 0aFNopmPQgN9rmq0LkNxHdZFvwOgkOi1lQt6o2VmBrA8m6Zj4rEcUywTi0R8ocJNoJiKGLP0e3K
 tQljBmzyhCh+xRDlE9AEpNZbuDWb5QdNECQ6PlVWAg5mhnwSbiqPQPvU8M8ixBrqWVkuvYcXY+p
 bhJbUIWKLMeyPvPr9jg==
X-Authority-Analysis: v=2.4 cv=EOgLElZC c=1 sm=1 tr=0 ts=69a77399 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=XYAwZIGsAAAA:8 a=TZ5gh4L_AAAA:8 a=JSe3Hgbxt_TPIYlOVhkA:9 a=QEXdDO2ut3YA:10
 a=E8ToXWR_bxluHZ7gmE-Z:22 a=2pkA1AvaAoXcNePaGM_w:22
X-Proofpoint-GUID: 3xGYDA0nhXvRFaR9RZ7R7HspqEf4XMio
X-Proofpoint-ORIG-GUID: 3xGYDA0nhXvRFaR9RZ7R7HspqEf4XMio
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030195
X-Rspamd-Queue-Id: E5D631F879E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33931-lists,linux-usb=lfdr.de];
	DKIM_MIXED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,urldefense.com:url];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

T24gVHVlLCBNYXIgMDMsIDIwMjYsIEluZ28gUm9obG9mZiB3cm90ZToNCj4gVGhlIE1pY3JvY2hp
cCBVU0IzMzQweCBVTFBJIFBIWSByZXF1aXJlcyBhIGRlbGF5IHdoZW4gc3dpdGNoaW5nIHRvIHRo
ZQ0KPiBoaWdoLXNwZWVkIHRyYW5zbWl0dGVyLiBTZWU6DQo+ICAgICBodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cDovL3d3MS5taWNyb2NoaXAuY29tL2Rvd25sb2Fkcy9lbi9EZXZpY2VE
b2MvODAwMDA2NDVBLnBkZl9fOyEhQTRGMlI5R19wZyFkSDRqQnlNSnlDRjFsU2J5U3hESEdPYTZQ
WV83YmhJS0ZwUy0zbUNKdlUyQTQ1NXRRYzFsSGppWU5sX0ZYMHgzdlpXTkJYb0ZfeEtidVFxYmFh
YjhkQTV5Vi1kdEV2TSQgDQo+ICAgICBNb2R1bGUgMiAiRGV2aWNlIEVudW1lcmF0aW9uIEZhaWx1
cmUgd2l0aCBMaW5rIElQIFN5c3RlbXMiDQo+IA0KPiBGb3IgZGV0YWlscyBvbiB0aGUgYmVoYXZp
b3IgYW5kIGZpeCwgcmVmZXIgdG8gdGhlIEFNRCAoZm9ybWVybHkgWGlsaW54KQ0KPiBmb3J1bSBw
b3N0OiAiVVNCIHN0dWNrIGluIGZ1bGwgc3BlZWQgbW9kZSB3aXRoIFVTQjMzNDAgVUxQSSBQSFks
IFp5bnFNUC4iDQo+IA0KPiBUaGlzIHBhdGNoIHVzZXMgdGhlIFVTQiBQSFkgVmVuZG9yLUlEIGFu
ZCBQcm9kdWN0LUlEIHRvIGRldGVjdCB0aGUNCj4gVVNCMzM0MCBQSFkgYW5kIHRoZW4gYXBwbGll
cyB0aGUgbmVjZXNzYXJ5IGZpeCBpZiB0aGlzIFBIWSBpcyBmb3VuZC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEluZ28gUm9obG9mZiA8aW5nby5yb2hsb2ZmQGxhdXRlcmJhY2guY29tPg0KPiAtLS0N
Cj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jIHwgMTYgKysrKysrKysrKysrKysrDQo+ICBkcml2
ZXJzL3VzYi9kd2MzL2NvcmUuaCB8ICA0ICsrKysNCj4gIGRyaXZlcnMvdXNiL2R3YzMvdWxwaS5j
IHwgNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDMgZmls
ZXMgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dXNiL2R3YzMvY29yZS5jIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gaW5kZXggY2FjYzRl
YzlmN2NlLi5kYTE1NzJkMjY4ZDAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29y
ZS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IEBAIC03ODIsNiArNzgyLDIw
IEBAIHN0YXRpYyBpbnQgZHdjM19oc19waHlfc2V0dXAoc3RydWN0IGR3YzMgKmR3YywgaW50IGlu
ZGV4KQ0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+ICtzdGF0aWMgdm9pZCBkd2MzX3VscGlf
YXBwbHlfY29uZmlnKHN0cnVjdCBkd2MzICpkd2MpDQo+ICt7DQo+ICsJaW50IGluZGV4Ow0KPiAr
CXUzMiByZWc7DQo+ICsNCj4gKwlpZiAoZHdjLT5lbmFibGVfdXNiMl90cmFuc2NlaXZlcl9kZWxh
eSkgew0KPiArCQlmb3IgKGluZGV4ID0gMDsgaW5kZXggPCBkd2MtPm51bV91c2IyX3BvcnRzOyBp
bmRleCsrKSB7DQo+ICsJCQlyZWcgPSBkd2MzX3JlYWRsKGR3Yy0+cmVncywgRFdDM19HVVNCMlBI
WUNGRyhpbmRleCkpOw0KPiArCQkJcmVnIHw9IERXQzNfR1VTQjJQSFlDRkdfWENWUkRMWTsNCj4g
KwkJCWR3YzNfd3JpdGVsKGR3Yy0+cmVncywgRFdDM19HVVNCMlBIWUNGRyhpbmRleCksIHJlZyk7
DQoNClRoaXMgc2hvdWxkIGJlIGRvbmUgaW4gZHdjM19oc19waHlfc2V0dXAoKS4gU2VlIG1vcmUg
Y29tbWVudHMgYWJvdXQgdGhpcw0KYmVsb3cuDQoNCj4gKwkJfQ0KPiArCX0NCj4gK30NCj4gKw0K
PiAgLyoqDQo+ICAgKiBkd2MzX3BoeV9zZXR1cCAtIENvbmZpZ3VyZSBVU0IgUEhZIEludGVyZmFj
ZSBvZiBEV0MzIENvcmUNCj4gICAqIEBkd2M6IFBvaW50ZXIgdG8gb3VyIGNvbnRyb2xsZXIgY29u
dGV4dCBzdHJ1Y3R1cmUNCj4gQEAgLTEzNjMsNiArMTM3Nyw4IEBAIGludCBkd2MzX2NvcmVfaW5p
dChzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgCQlkd2MtPnVscGlfcmVhZHkgPSB0cnVlOw0KPiAgCX0N
Cj4gIA0KPiArCWR3YzNfdWxwaV9hcHBseV9jb25maWcoZHdjKTsNCj4gKw0KPiAgCWlmICghZHdj
LT5waHlzX3JlYWR5KSB7DQo+ICAJCXJldCA9IGR3YzNfY29yZV9nZXRfcGh5KGR3Yyk7DQo+ICAJ
CWlmIChyZXQpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCBiL2RyaXZl
cnMvdXNiL2R3YzMvY29yZS5oDQo+IGluZGV4IDY3YmNjOGRjY2M4OS4uN2QwODQ1MTg0MjIzIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiArKysgYi9kcml2ZXJzL3Vz
Yi9kd2MzL2NvcmUuaA0KPiBAQCAtMzAyLDYgKzMwMiw3IEBADQo+ICAjZGVmaW5lIERXQzNfR1VT
QjJQSFlDRkdfU1VTUEhZCQlCSVQoNikNCj4gICNkZWZpbmUgRFdDM19HVVNCMlBIWUNGR19VTFBJ
X1VUTUkJQklUKDQpDQo+ICAjZGVmaW5lIERXQzNfR1VTQjJQSFlDRkdfRU5CTFNMUE0JQklUKDgp
DQo+ICsjZGVmaW5lIERXQzNfR1VTQjJQSFlDRkdfWENWUkRMWQlCSVQoOSkNCj4gICNkZWZpbmUg
RFdDM19HVVNCMlBIWUNGR19QSFlJRihuKQkobiA8PCAzKQ0KPiAgI2RlZmluZSBEV0MzX0dVU0Iy
UEhZQ0ZHX1BIWUlGX01BU0sJRFdDM19HVVNCMlBIWUNGR19QSFlJRigxKQ0KPiAgI2RlZmluZSBE
V0MzX0dVU0IyUEhZQ0ZHX1VTQlRSRFRJTShuKQkobiA8PCAxMCkNCj4gQEAgLTExNjMsNiArMTE2
NCw4IEBAIHN0cnVjdCBkd2MzX2dsdWVfb3BzIHsNCj4gICAqCTMJLSBSZXNlcnZlZA0KPiAgICog
QGRpc19tZXRhc3RhYmlsaXR5X3F1aXJrOiBzZXQgdG8gZGlzYWJsZSBtZXRhc3RhYmlsaXR5IHF1
aXJrLg0KPiAgICogQGRpc19zcGxpdF9xdWlyazogc2V0IHRvIGRpc2FibGUgc3BsaXQgYm91bmRh
cnkuDQo+ICsgKiBAZW5hYmxlX3VzYjJfdHJhbnNjZWl2ZXJfZGVsYXk6IFNldCB0byBpbnNlcnQg
YSBkZWxheSBiZWZvcmUgdGhlDQo+ICsgKgkJCWFzc2VydGlvbiBvZiB0aGUgVHhWYWxpZCBzaWdu
YWwgZHVyaW5nIGEgSFMgQ2hpcnAuDQo+ICAgKiBAc3lzX3dha2V1cDogc2V0IGlmIHRoZSBkZXZp
Y2UgbWF5IGRvIHN5c3RlbSB3YWtldXAuDQo+ICAgKiBAd2FrZXVwX2NvbmZpZ3VyZWQ6IHNldCBp
ZiB0aGUgZGV2aWNlIGlzIGNvbmZpZ3VyZWQgZm9yIHJlbW90ZSB3YWtldXAuDQo+ICAgKiBAc3Vz
cGVuZGVkOiBzZXQgdG8gdHJhY2sgc3VzcGVuZCBldmVudCBkdWUgdG8gVTMvTDIuDQo+IEBAIC0x
NDA2LDYgKzE0MDksNyBAQCBzdHJ1Y3QgZHdjMyB7DQo+ICAJdW5zaWduZWQJCWRpc19tZXRhc3Rh
YmlsaXR5X3F1aXJrOjE7DQo+ICANCj4gIAl1bnNpZ25lZAkJZGlzX3NwbGl0X3F1aXJrOjE7DQo+
ICsJdW5zaWduZWQJCWVuYWJsZV91c2IyX3RyYW5zY2VpdmVyX2RlbGF5OjE7DQo+ICAJdW5zaWdu
ZWQJCWFzeW5jX2NhbGxiYWNrczoxOw0KPiAgCXVuc2lnbmVkCQlzeXNfd2FrZXVwOjE7DQo+ICAJ
dW5zaWduZWQJCXdha2V1cF9jb25maWd1cmVkOjE7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9kd2MzL3VscGkuYyBiL2RyaXZlcnMvdXNiL2R3YzMvdWxwaS5jDQo+IGluZGV4IDU3ZGFhZDE1
ZjUwMi4uNzE5N2JkZGFlODhhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL3VscGku
Yw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL3VscGkuYw0KPiBAQCAtMTQsNiArMTQsOCBAQA0K
PiAgI2luY2x1ZGUgImNvcmUuaCINCj4gICNpbmNsdWRlICJpby5oIg0KPiAgDQo+ICsjZGVmaW5l
IFVTQl9WRU5ET1JfTUlDUk9DSElQIDB4MDQyNA0KPiArDQo+ICAjZGVmaW5lIERXQzNfVUxQSV9B
RERSKGEpIFwNCj4gIAkJKChhID49IFVMUElfRVhUX1ZFTkRPUl9TUEVDSUZJQykgPyBcDQo+ICAJ
CURXQzNfR1VTQjJQSFlBQ0NfQUREUihVTFBJX0FDQ0VTU19FWFRFTkRFRCkgfCBcDQo+IEBAIC04
Myw2ICs4NSw0NiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHVscGlfb3BzIGR3YzNfdWxwaV9vcHMg
PSB7DQo+ICAJLndyaXRlID0gZHdjM191bHBpX3dyaXRlLA0KPiAgfTsNCj4gIA0KPiArc3RhdGlj
IHZvaWQgZHdjM191bHBpX2RldGVjdF9jb25maWcoc3RydWN0IGR3YzMgKmR3YykNCg0KV2UgY2Fu
IHJlbmFtZSB0aGlzIHRvIGR3YzNfdWxwaV9nZXRfcHJvcGVydGllcygpIGFuZCBkZWNsYXJlIGl0
IGluDQpjb3JlLmguIFRoZW4gd2UgY2FuIGhhdmUgdGhlIGR3YzNfZ2V0X3Byb3BlcnRpZXMoKSBj
YWxsIHRoaXMgZnVuY3Rpb24uDQpUaGlzIHdpbGwgZW5zdXJlIHRoYXQgdGhlIG9yZGVyIG9mIHRo
ZSBzZXR0aW5nIG9mIHRoZSBHVVNCMlBIWUNGRyBpcw0KZG9uZSBpbiBkd2MzX2hzX3BoeV9zZXR1
cCgpLCB3aGljaCBpcyBwcmlvciB0byByZWdpc3RlcmluZyB0aGUgdWxwaSBwaHkuDQoNCj4gK3sN
Cj4gKwl1MTYgcHJvZHVjdF9pZDsNCj4gKwl1MTYgdmVuZG9yX2lkOw0KPiArCWludCByZXQ7DQo+
ICsNCj4gKwkvKiBUZXN0IHRoZSBpbnRlcmZhY2UgKi8NCj4gKwlyZXQgPSBkd2MzX3VscGlfd3Jp
dGUoZHdjLT5kZXYsIFVMUElfU0NSQVRDSCwgMHhhYSk7DQo+ICsJaWYgKHJldCA8IDApDQo+ICsJ
CXJldHVybjsNCj4gKw0KPiArCXJldCA9IGR3YzNfdWxwaV9yZWFkKGR3Yy0+ZGV2LCBVTFBJX1ND
UkFUQ0gpOw0KPiArCWlmIChyZXQgPCAwKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwlpZiAocmV0
ICE9IDB4YWEpDQo+ICsJCXJldHVybjsNCg0KRG8gd2UgbmVlZCB0byBjaGVjayBmb3IgZGF0YSBp
bnRlZ3JpdHkgaGVyZT8gVGhhdCBjaGVjayB3aWxsIGJlIGRvbmUNCmR1cmluZyB1bHBpIGluaXQs
IHdoZXJlIGl0IGhhcyBwcm9wZXIgY2hlY2tzIGFuZCBjYW4gZmFpbCBwcm9wZXJseQ0KdGhlcmUu
DQoNCkJSLA0KVGhpbmgNCg0KPiArDQo+ICsJdmVuZG9yX2lkID0gZHdjM191bHBpX3JlYWQoZHdj
LT5kZXYsIFVMUElfVkVORE9SX0lEX0xPVyk7DQo+ICsJdmVuZG9yX2lkIHw9IGR3YzNfdWxwaV9y
ZWFkKGR3Yy0+ZGV2LCBVTFBJX1ZFTkRPUl9JRF9ISUdIKSA8PCA4Ow0KPiArDQo+ICsJcHJvZHVj
dF9pZCA9IGR3YzNfdWxwaV9yZWFkKGR3Yy0+ZGV2LCBVTFBJX1BST0RVQ1RfSURfTE9XKTsNCj4g
Kwlwcm9kdWN0X2lkIHw9IGR3YzNfdWxwaV9yZWFkKGR3Yy0+ZGV2LCBVTFBJX1BST0RVQ1RfSURf
SElHSCkgPDwgODsNCj4gKw0KPiArCWRldl9kYmcoDQo+ICsJCWR3Yy0+ZGV2LCAiZHdjM191bHBp
OiBWZW5kb3JJRCAweCUwNHgsIFByb2R1Y3RJRCAweCUwNHhcbiIsDQo+ICsJCXZlbmRvcl9pZCwg
cHJvZHVjdF9pZA0KPiArCSk7DQo+ICsJc3dpdGNoICh2ZW5kb3JfaWQpIHsNCj4gKwljYXNlIFVT
Ql9WRU5ET1JfTUlDUk9DSElQOg0KPiArCQlzd2l0Y2ggKHByb2R1Y3RfaWQpIHsNCj4gKwkJY2Fz
ZSAweDAwMDk6DQo+ICsJCQkvKiBNaWNyb2NoaXAgVVNCMzM0MCBVTFBJIFBIWSAqLw0KPiArCQkJ
ZHdjLT5lbmFibGVfdXNiMl90cmFuc2NlaXZlcl9kZWxheSA9IHRydWU7DQo+ICsJCQlicmVhazsN
Cj4gKwkJfQ0KPiArCQlicmVhazsNCj4gKwl9DQo+ICt9DQo+ICsNCj4gIGludCBkd2MzX3VscGlf
aW5pdChzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgew0KPiAgCS8qIFJlZ2lzdGVyIHRoZSBpbnRlcmZh
Y2UgKi8NCj4gQEAgLTkyLDYgKzEzNCw4IEBAIGludCBkd2MzX3VscGlfaW5pdChzdHJ1Y3QgZHdj
MyAqZHdjKQ0KPiAgCQlyZXR1cm4gUFRSX0VSUihkd2MtPnVscGkpOw0KPiAgCX0NCj4gIA0KPiAr
CWR3YzNfdWxwaV9kZXRlY3RfY29uZmlnKGR3Yyk7DQo+ICsNCj4gIAlyZXR1cm4gMDsNCj4gIH0N
Cj4gIA0KPiAtLSANCj4gMi41Mi4wDQo+IA==

