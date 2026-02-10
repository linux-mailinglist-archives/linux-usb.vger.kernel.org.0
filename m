Return-Path: <linux-usb+bounces-33222-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNqaOqt8imk4LAAAu9opvQ
	(envelope-from <linux-usb+bounces-33222-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 01:32:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D69115A28
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 01:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BCED302198E
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 00:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60A41F37D3;
	Tue, 10 Feb 2026 00:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HO32q62Z";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Sc6S1PuA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="F+tH2X1F"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB7516F0FE;
	Tue, 10 Feb 2026 00:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770683561; cv=fail; b=lq/Oth8CjsAGedfVct74ltFQs4L1ixhc/GpyR+gyIY33Ti24e96GcfLKkKG+r/OP/U/7ane/EiRqu70ls65v4Lg/k8n4wav2ul3MuxOoh2sNY3hjDTXOU00rm08gwYFaKhm3UUnuOQIKWh3bfbYBYh0+P529p/lBvLdy07QfCW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770683561; c=relaxed/simple;
	bh=6HbiBztdvdyZ2mkFTGRuWN2iZV0b0w+NXkglGQWA8vg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N0YvIdT2UuTt40iDBz15gsRfPitopCSpTpS1KpitquYMSi4BC9ix6mYKan2D3y0ud0UIhhcnHoJtRk9GPPMvY7m0pWd+R3fUaWuCYSRqtWUg6zIbD7ckrFV82EpZsgXUURr5xpXIU31XWDCCnM3aAVkGxfuMdu4FJBi8lyKDC2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=HO32q62Z; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Sc6S1PuA; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=F+tH2X1F reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619Iv7Wl1177893;
	Mon, 9 Feb 2026 16:30:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=6HbiBztdvdyZ2mkFTGRuWN2iZV0b0w+NXkglGQWA8vg=; b=
	HO32q62ZrYvOT3z612/h4v5zH0hlY4f/4oRvGhR+REe9zKA5G1PlT0f0RTNtKjxk
	tHqZpub/LDLZRsf1wEPkH47SjXyulHf4rl+igzKJzkm9p/UtkqPnjIPj4eflxEzg
	wOemerOYPcErcRv7uq4BlrkGotiiyE2gBZlFlngg+szr0zQbPHM2TSwjLnWH79u0
	Brj0QZE68iBkA2U47pJ24nncQ7dLiWenvzoMkI58vDdpB/7rXqdZwcFQ1VL0ct36
	M7h0BGRHgX0uUZRvUm0bjjX4XBEPIFh16z3BNJ1JWNgO3lFd0lpPNS4ZGXrChpW6
	4bNrANTDOblhfjYL+msqJg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4c65h722ef-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 16:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1770683443; bh=6HbiBztdvdyZ2mkFTGRuWN2iZV0b0w+NXkglGQWA8vg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Sc6S1PuAKRSHoFfG4A6Hk1fbMomGCA60Z/6fe0D8fmeGKYKGPBWhqzYQ/0WK5I+fu
	 PQoZqL1fH9vg+Qi3L1Q26hSrdYPeCuyWGdopKWQ+MCLtD3nbkmL0uWNJZ4urGAfwwq
	 r0McVvD+C4iJd3Fq3klfI2fbuUtWu8uquT9J08Roqa3aOzxSCNm8DF6M3IZDarRwey
	 REShimLCI9WBHb1rC8H3BHste1o92sqsy/MJPQJsfLGu+frhB+LCLMTsSFx6FLQNaG
	 tkl1Mgme9lX+KtbsFLMTbbsI70Z2nYgclBuLhT8wrE20U41A0k2mLmyNalk26rVhZO
	 pyvTS9Iuq4BEQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 405624035D;
	Tue, 10 Feb 2026 00:30:42 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 422CAA006D;
	Tue, 10 Feb 2026 00:30:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=F+tH2X1F;
	dkim-atps=neutral
Received: from CO1PR07CU001.outbound.protection.outlook.com (mail-co1pr07cu00103.outbound.protection.outlook.com [40.93.10.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1853422019D;
	Tue, 10 Feb 2026 00:30:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCo/5tqb5W4uQFA9nP5KKEcXGJR1Rr0N07DRyQHS63pKs+oshf4vJ9DBEsYHNAmP5a/YCe01ZIyErdOP1dNdAbDtSZ6lq8AvVPDYRp/7LWKC+udeAO5Jdg0Ge+UB2oXRY+e9tn4BsiSps+NC2zFa/IB+a6bDx+cIjPAsDh7Sodp2FQ7o0LnO+FT6lMRb0lk0e1WTo0RobbrI/66X/aVCBHDWl4tHns2iCTB5tvoUBIhJ5vkVss2b+kEbhe2u3foE08/ypuyzef1EKAxO7Cv4VGb9M1e45SF/YbEzoYv79BpH3P7Y89TMf/LYENDvdExQESyu1SdD9/kaugHbjNybkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HbiBztdvdyZ2mkFTGRuWN2iZV0b0w+NXkglGQWA8vg=;
 b=tq+v6IHBKmvo0ndkn/CWWcGuugQpgMjEF7bjT4mA+Tr9i9/OEi20TCVYKCYOLJuO0xNYGdxokJWk1IMs4oJockHQlhG1B0lddFL/BETNVMYcKVuOw4FV/v05apegrwd9bh6i2cqngB61uEMagquzdyF9HU/vbuX5/z/qgMKCEekSRm8vbQN9p78oESVzxne+XW89YqyJ+ufDvJaZAdsqjiuNRzXdfhMp+xX+nZ83DDSEFlovMgoH/2+ruB/er/Rq6QAHIBUlgPZ/Ev9Y9UD6HgCXJY6NKMD2YdQ6Cz0VCb/WbJOhZBsyh4WxAYaqZ25H9q8u4hTnn7MPGleCpzvEFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HbiBztdvdyZ2mkFTGRuWN2iZV0b0w+NXkglGQWA8vg=;
 b=F+tH2X1FNyscW5StACEppKexEsutRBt9TV02dkS5V/VTP2TQnxDdqD6yCWsijf3JSH+ZMuQsT22i8kjMtwlXpC4MMam3oetfsUYYdGCdbSTItPzQQdoWNlcGa4TL01isU5I7L+4YMNs5gQNvQj28hf5kCzfI3Q91LPUrQmLwKoo=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by BN7PPFABD533732.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6df) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Tue, 10 Feb
 2026 00:30:36 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9542.009; Tue, 10 Feb 2026
 00:30:36 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Votokina Victoria <Victoria.Votokina@kaspersky.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Roger Quadros <rogerq@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
Subject: Re: [PATCH] usb: dwc3: am62: handle usb2_refclk enable failures
Thread-Topic: [PATCH] usb: dwc3: am62: handle usb2_refclk enable failures
Thread-Index: AQHcleA75cB5zKKQo0SQSZsrhM0EO7V7HS8A
Date: Tue, 10 Feb 2026 00:30:36 +0000
Message-ID: <20260210003034.twbkgavdegwlnsvo@synopsys.com>
References: <20260204141131.2451382-1-Victoria.Votokina@kaspersky.com>
In-Reply-To: <20260204141131.2451382-1-Victoria.Votokina@kaspersky.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|BN7PPFABD533732:EE_
x-ms-office365-filtering-correlation-id: bccfebc1-62d1-43f9-4ced-08de683b9c21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|18082099003|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?d0ZITjlyazRKUEVXVWNTWkQ5aGtoUlg5MTk1YmcydHVzb1VtV0s3OE5YNzBu?=
 =?utf-8?B?azBnMURxYk91UmVwM2RIT1ZuUVFBVnJ0elRLNW9xaXFjenFSM2kyTUhNKzU3?=
 =?utf-8?B?S0YzK1lGRVNpWllIT3FJMGlxYXYyN29LUXphNFRvZDg1VlZOaG1vc2l1aGsr?=
 =?utf-8?B?anVFT3FiZUxPek5zK0xoVjhsUG4rMnhnbGl0MjU4MkFyN2FzcjFwRm14NGdR?=
 =?utf-8?B?bjVac1FvZmM4K0c5c29lV0puUk42S28xdzg4Y3RRNGYwdVlCUmhSYm5tbUM2?=
 =?utf-8?B?N3l1WllPV1hRSnFVMTRQczdYMjZ2NXNPZUkra1FQbXcrY1JwaXMvOEJDQ2tn?=
 =?utf-8?B?a1QzTkJGbWRmTmF1UUZuS2RDaVZveDBjRzhsNjVaTHN0M3ptL0lwKzd0bUh3?=
 =?utf-8?B?MXJ5cEU1d24vMGZ6dk81ZmRleHZqN0ZmT1dGNFJuVndhNlNWRTNmTGRzanVs?=
 =?utf-8?B?N2ExRGRzcEc3Q2V1YSs2ZzFMWnY5cHVGM0RnK1VpcjhWVGgrOHpzbnNPTUF0?=
 =?utf-8?B?OHRmZWlWMWxLM0p4WWRQOTdaNkhyY3VHVmwxenE2dEV5TjFlNDB0OGtFWVZo?=
 =?utf-8?B?eXFXd1lmV1VMN0dHQnR6KytBd0JEQ011eUR6WnhJTW5leFAvTlh5Q3p3UTMz?=
 =?utf-8?B?Nm1PYW9UTUFpQi9CeGU1N2JJT01McWJuS2hXQTJocFZwVFFGYVFOYXFwc2dE?=
 =?utf-8?B?dXRQOXBHajJkcE1PVk4vVEpNNGxodzFzNTZuY0VibWN4d09jZ2RnNTBTaUZG?=
 =?utf-8?B?TzF3U1BQbHJZNWVpYklNOTJJYWFQeTY1N05SUEJjVmdRKzRXL3JUY0dqR2xs?=
 =?utf-8?B?bTd4REFpQzdZaWlGVHQ2SlgyVStGN1N6YVEvaHRjeEw2SDRVMlVQbjlCK0tk?=
 =?utf-8?B?TEpPUVlQOFphSkNBajRGN2VVZjZRb05EMThROVNrZ2ZnQXZiV2lZUU1kRjR0?=
 =?utf-8?B?cHVPQk9qajNBSkYwYkFFSUxPUVgxeTFjZVFYOVVGVERBVTV2TmlhZThlWkZO?=
 =?utf-8?B?eW1ib1czVldPWUNwR3VXMXF4TkcvZ085cjhKdTRyNVRmdWJNN282SnBRL0Rl?=
 =?utf-8?B?UHVhNS9GeE9nVUxnWkI4QkVjWUtRNE9CZmtXd3B4M0NHeFZ1Z3pXdkljVTRP?=
 =?utf-8?B?RzlzZG5ydmJPYk1pcHlreEo4NHh6RVFEU2xQakU4RFhDVDBJcmZTU1N2b0Vu?=
 =?utf-8?B?YjBEQnNiMWNYMmFCL3M4RXduN2F6eEtZNjJEc0pEckJlL3piOWg0WkpFdVM1?=
 =?utf-8?B?Ujc2TGVxRjcvTS9CTHlaV1RDekV3U012aWhSOEJpekJtUHVXQjl4dWIrc0Rr?=
 =?utf-8?B?YjRVRE8yUjcxL0h3WUZTejNnczJKckd3aWFIaW0vUzV5bkdCNkU1QS9XcFB1?=
 =?utf-8?B?alJSSTk5UkFvdm9aSnRNVDBGa1ZEa0hFNHB1UzBLZjE2NHkzSU5meVk4VVpF?=
 =?utf-8?B?cVpTMXp4QUJ1N1lIQVZqb01wcXRmMS9nMFc4YzlPWjJ0VmhGdXFmRTVZazZU?=
 =?utf-8?B?TjFhUi9TRUVaNUdubWQxbDEwZzFzYVZzcE1uK0thdXN1UmRnT0tDa0VTRFVr?=
 =?utf-8?B?Q1JqYWp3dUNJVXliRDdRN1BtSlVGK3NkelRsVStNV2Mvdk1iM3NZVWx3cUcr?=
 =?utf-8?B?UW9nV3lUb0JjOUFTaldMVUp3NGJFNDlQR1hHTHdNUXNaM3RCcG9VclZRK0J6?=
 =?utf-8?B?amVwR3dUV216TWJvVTZMT0U3ZUI0OVhDOVQ4MStjbDBURmExaHQ1MGRFLzk3?=
 =?utf-8?B?TEFTSnJtUlpSeEpJcE5SaHFvVWtPOWRVQlJkbkRTdXV2ZUhvUnk3Rlg0M0hW?=
 =?utf-8?B?R3E0TGw2NFpUaDBhMm05dXdCcTY4NmhGKzBUaGNhYVczQlBoZkJtU1pvaEZG?=
 =?utf-8?B?Z1FRWGRhWHE2cG13MjJ3cHl3NGpicTg1VDBxS0o3ZXNpZmRBUDYvbnFZREds?=
 =?utf-8?B?VElsNW52bGxSRjFFSzhiTWN5T0VYMzBjUDVralJlLzhzMjc5VUowalEvQTlP?=
 =?utf-8?B?Ulg4cDBsamRBZTNqRTI1aUlEK3EzdjZUbjBmY0lMU0ZWZk82Umd6ZVFLSEpY?=
 =?utf-8?B?QmJ5dkIvdG5LSkpKT3dXNHFybnVyNG52cVMvWkdqQWYzL0tKVUZEUUNUR3pT?=
 =?utf-8?B?ZUhmZEF5K2Q4WGVMSTh4cXpQRDFvd1ArWVU0Z0VtUzJKaUFINjdVYVhGOGd6?=
 =?utf-8?Q?s9//t3dU6OVyvvMuqqPpk5c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RmhOYUNuQnZLUzQ1MkROejBJdzRxcVlhdFNmeGdwcDZjZ2VUdzVqMGxzN0Rj?=
 =?utf-8?B?OHlNNW9EOVAwZjhXdFhMdTZTSUVtMHpDS3F2ZXBMQXZYaUNHVUd5aFhhRnJY?=
 =?utf-8?B?bXFNeEgxbjJvcWt3Y3A4MTlpRlVMVVdKQkt1TWVPUHB2c2hIdi9Dc2ZQUFFZ?=
 =?utf-8?B?UW4vS0xPb0RsdVpDcU1TSFNHTEhSa2szc2JNTTBqcVBXcFd4SFUvMzdlOEtP?=
 =?utf-8?B?VS91Y2w1aFZkVzhZT1BFbGhhVTFDYWppVXBENFJQL3NjcWIxUW9iSnNldzNM?=
 =?utf-8?B?blExc3FSZ0hzWTdkTmsvUEJGOTVZMkRzRk8vQ0IyWlJFc1paNTFQeHp3RzNm?=
 =?utf-8?B?U1hlMitFdTBkN3BFeExmVlpTdjcwbGxZUmNUaENBZjhKWnBqa09NcDU0aS9U?=
 =?utf-8?B?SFRzdVJHUjMxb1VORFVnamhqWHZzdEFtZmVJVDA4RmFMOTVYRDF2Q2QrNEtC?=
 =?utf-8?B?L2JoQTF3V1BGNzRqQXB0bjNlVWl2cFc0VGRIK0lOK0pWL2I5ODQyYzY3YURG?=
 =?utf-8?B?eHI5aWZxRXpHQVRTSG9INndmODJhTENzVDlLU1ZRcFlMcll4N3RHMjBBL2Rv?=
 =?utf-8?B?WW5Vb2VVWlYzYXQ4Z1ltSWZnaUV5YkVOUTdkV3RrMHlJc0w4bU1YUVkvb3VI?=
 =?utf-8?B?Ny81RjIwNGpERW5EZ1A3SW5FUGpKcHRMOExpSUNVR2ZhNXFFam94Q2l5Ui9V?=
 =?utf-8?B?WEE0QmptOUZhZ2JIVXZueFBML3JDdWl6MElyWEEyTHltNnoyNkZsU2RITTdn?=
 =?utf-8?B?ME1PL085azlEM1RMTUxHQ1luTFJIdTFVMG5yRDdqUk94T1B1VFlKLzErYmNV?=
 =?utf-8?B?bkdIYnBpY1h5NEtmY041VXJyZzhyRjlzcTNJY0ZJWWNqM1owMGxHZ2xma2p5?=
 =?utf-8?B?b3VUaWJGUXhoeUZLeExxbWxHV2lpNjNQRjVta2VvMXZtTE1RU1FCSXZuWWk0?=
 =?utf-8?B?ZnNmdjVXM0pJVTJxUldlZGt0cmEyQXJFQjljWjBPY0V3NXVyRExzRFU4ckFB?=
 =?utf-8?B?L2pKNUNGK3hKa1JsK1FHUlNWajZuS1plYXgxUHJYdUZibXhFVjZOZGVRUzhJ?=
 =?utf-8?B?RU56RFQrbHNnTVRBek5MdTZRNDFleUxHTWZPQXg0K3JNa1BJdUlHd1k1Wi9j?=
 =?utf-8?B?bTFxVmtjM1dlZWRWb2xqb1BmM1VsUy9NdEhuZDRVZ1ZZcXBHVmlyeGVYc0Qx?=
 =?utf-8?B?VGJCUXRKTmtsenRDeTJwY0hFZko1ZmNBTVVIelp5UFJsZlJKWExQMnZoQWFl?=
 =?utf-8?B?VkhaeC8rY3dSdEpzNm1OK1d3TFZMci9wR2Rpb3RRZU5TcDVOeWlyTjI3cDdY?=
 =?utf-8?B?bzFCdVFyZUpwem5xa2ZiaGQyV3RnZm44UDVWem9HclBhS3FvN3VKZGUvOXE3?=
 =?utf-8?B?Q2oxVXdEaUpuczZnbklSdCtXZDZVeUZDMmtXVnBxc3hVRzI5dGF3YmxkblNW?=
 =?utf-8?B?UldFTGhCOWxkK3BlYmRhNTJFMFJjVjBaQUtDdklHMXdmWTU2UjJRTHY0a2Jr?=
 =?utf-8?B?YzFQUjVja2w5aE9oVHhuVS80T0RRZHU3amUxaytVYktnVDd0UTlFQ2psQkVG?=
 =?utf-8?B?Z2k0M0s2RVBnRHVKOE9SWGF2ZGt2dXpPaGpzeVpocHkranFvOVpNZWZtVGcv?=
 =?utf-8?B?MlZLeXk0aVdnb2FSSk00cFhPYmVGMUpmV2tqZGxRT1VDd0w1blN0SEhOOVdI?=
 =?utf-8?B?R0ppeHh5MnplSlNGeTI5N0s1b2oyV1ltcTJ2eVZ3ODFTblFOWmN3UkFuUHBI?=
 =?utf-8?B?elRJNXVnd2hBT1orQm55N3FjWWpCbFNrTTlFT3loaUxQTld2WjgrMG0rWEda?=
 =?utf-8?B?YVhUaVJlemFEWGI2cGxOeURUelhWTWkvOWpTQnQ3MEdzek9QWFA3SVozRzZq?=
 =?utf-8?B?ZEFQdTVQbWVydXpMNEhHRjNudDgvYzF6N2FQVDA3QUppLzFnVjNDZS9BWmVm?=
 =?utf-8?B?YUtVZUVJck1NUzhYU0wxZURjcU9SZE80RVFtNXRXK1kzdEc5MnpNSms5SDJl?=
 =?utf-8?B?M09JKy9vWVRmWFhpbWIwZDJEY3R0WE1DSWlITThHTFFZMzRicllVR245bVJm?=
 =?utf-8?B?aU1pa3F5STNNVjB4bGdpeWIwb2JNcnBiSi9yZVJMRTFoVWcrRjFtajJtT1k5?=
 =?utf-8?B?UGFDU0J5MG1JZ3ZTODhyekhSVE9LM1ZNWU9CMmd4NG9YRnhBV0lJR0NPRXRN?=
 =?utf-8?B?ZDRWYWZDTFlZaUVxOUxmenpsaEdZRU1haEdPL2E1dmNCK2l6RWw2QzJkYzA5?=
 =?utf-8?B?ZUpiQXJPZ044UGlKalErVTVXMDduTUZ3UEc3RGt4dE90YTdSRFNmTzVjUXZY?=
 =?utf-8?B?V2VXN1gyTWc4aWordVNSeU5WdDFMOGM4TWVIUE5xb3MrNHYyZUUzdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B29151B893AC33429C251C5E55AD498B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Kdd5ulkSWurqFasTg0b4/Eo+td9tWwpYdQthBwnJUp9awkdyYrjOeudktoxVVMtgpYDDBvSJMtXsbqRMcINSz/gHoj/mfs+wvDo+M4VB7q30A3orngx/7puYb3J/lNtjNEarl+3M+wNNqDNSwueXlKReBuWvkzTdpw9LGGt7CAPQYBx8ufgLar9q6htLJTDgqEpSGJ3ajVI9gPjx3fKoQIzipyNUgOc/d8AxA67fWdLk8K7mAbn/GkVomxP04ctsSOq9YQx9kWCpuS4/XqMkRJQDaWDt0G9vxUudcPHoWxHpZcG/2KfB7Pyj3dGcwJ94x+zmLMVXuQ3SIHBjo0jMdqvWtOXdcRdvGDHmBrwXzX62CpOUC1Iw6Prkuguv09RXv0qJZ/u40NRbwavTr4m8JQVxVa/dXUgRHyRf43KEGCShXPQmi5uJZ3B7CjO6mHbAv9gzakwY5R26s/HvztruVoap1BGemWWSQ3XEP5m8dTgfIDvlzTpmFa1ujl3hLzqTVUgEWHxggSY0pdAgodFkPKENefDWNznPL84v6dxUuvM7SF7hPgRUdivHxiBZ7jqHXYFaH79+NRvVSypSfSurQpIireWgHYfpTZVxyIIxsgaJT/DQvkuBP/+XHf8EKjOJreE4M+DTinPl8QVSSvUP1A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bccfebc1-62d1-43f9-4ced-08de683b9c21
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 00:30:36.4682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1PdHSYS+VdR6O5PUqOsidtWQ8xuvyG098kwRl4BROOQGIAQEYRLwKTz11WjsjmxdBgv5lqYPXdf7tKAUUUbU3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFABD533732
X-Proofpoint-GUID: JNq2Zhh4R2pLtRthHObT8tItgyD42dPo
X-Authority-Analysis: v=2.4 cv=JPU2csKb c=1 sm=1 tr=0 ts=698a7c33 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=HH5vDtPzAAAA:8 a=ACEZY41XAAAA:8 a=4-7SZabEM4hmT4siiJQA:9 a=QEXdDO2ut3YA:10
 a=QM_-zKB-Ew0MsOlNKMB5:22
X-Proofpoint-ORIG-GUID: JNq2Zhh4R2pLtRthHObT8tItgyD42dPo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDAwMyBTYWx0ZWRfX+shl6ufroDo0
 l7nvtEd4/xYZMBmOLasHr90LrYiYJJZjjaXHtJIp6awUsTSlGo+Yy6nomrnbBMoySzQXGaDMuLr
 5Edx9z5ItHNsetVs+TrQybDL3+0s4O+X18ZnATDssYkviobksiZFsvFlUbtxv/HtLI76raAvPGx
 lMPLPb73EE3Dc8BO0IG8H0Lu8AsGt06toiP5FoqsgVYXa3SNoWPYcIXKADPc8JuTXbHkYwyWHeP
 zNiLmc3CgKU7uqxsqWFAhv9vGG2S4RoQlI36Ssvq1+ZmyZrr2uxx6SNjo18x23ss957nw/EENRo
 fkvHnup0ghSVTTpPnACGFtNw+KLyjZD1iuu+hWwEsYqoNp6kBbsegcxbHlrUfx4q5N20YtUndHm
 oGjGgeE6VePwyYY+FVrF2QbYPu6+Tff7tikrQeUvcR7djvL5Vz8qflaNWORxu4g6CwQAWkHLrbl
 0+CkPJUwoEuZWsokRdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2602100003
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33222-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 69D69115A28
X-Rspamd-Action: no action

T24gV2VkLCBGZWIgMDQsIDIwMjYsIFZvdG9raW5hIFZpY3RvcmlhIHdyb3RlOg0KPiBUaGUgQU02
MiBEV0MzIGdsdWUgZW5hYmxlcyB1c2IyX3JlZmNsayB2aWEgY2xrX3ByZXBhcmVfZW5hYmxlKCks
IGJ1dA0KPiB0aGUgcmV0dXJuIHZhbHVlIHdhcyBpZ25vcmVkIGluIHRoZSBpbml0IHBhdGguIElm
IHRoZSBjbG9jayBjYW5ub3QgYmUNCj4gZW5hYmxlZCAoaW5jbHVkaW5nIC1FUFJPQkVfREVGRVIp
LCB0aGUgZHJpdmVyIGNvbnRpbnVlcyBhbmQgbWF5IGFjY2Vzcw0KPiB0aGUgY29udHJvbGxlci9Q
SFkgaW4gYW4gdW5kZWZpbmVkIHN0YXRlLg0KDQpXaGF0J3MgdGhlIGFjdHVhbCBlcnJvciBoZXJl
IHRoYXQgeW91IGVuY291bnRlcmVkPyBPciBpcyB0aGlzIGENCmh5cG90aGVzaXMvc3RhdGljIGNo
ZWNrPw0KDQo+IA0KPiBBbHNvIGNoZWNrIGR3YzNfdGlfaW5pdCgpIHJldHVybiB2YWx1ZSBvbiBy
ZXN1bWUgd2hlbiBwb3dlci9jb250ZXh0IHdhcw0KPiBsb3N0Lg0KPiANCj4gRm91bmQgYnkgTGlu
dXggVmVyaWZpY2F0aW9uIENlbnRlciAobGludXh0ZXN0aW5nLm9yZykgd2l0aCBTVkFDRS4NCj4g
DQo+IEZpeGVzOiAzMWQ1MDBjMmQwZDQgKCJ1c2I6IGR3YzM6IGR3YzMtYW02MjogUmUtaW5pdGlh
bGl6ZSBjb250cm9sbGVyIGlmIGxvc3QgcG93ZXIgaW4gUE0gc3VzcGVuZCIpDQo+IFNpZ25lZC1v
ZmYtYnk6IFZvdG9raW5hIFZpY3RvcmlhIDxWaWN0b3JpYS5Wb3Rva2luYUBrYXNwZXJza3kuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1hbTYyLmMgfCAxMSArKysrKysrKy0t
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtYW02Mi5jIGIvZHJpdmVycy91
c2IvZHdjMy9kd2MzLWFtNjIuYw0KPiBpbmRleCBlMTFkNzY0M2Y5NjYuLmQ4YjM1MDk4ZTkyMSAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWFtNjIuYw0KPiArKysgYi9kcml2
ZXJzL3VzYi9kd2MzL2R3YzMtYW02Mi5jDQo+IEBAIC0yMDUsNyArMjA1LDkgQEAgc3RhdGljIGlu
dCBkd2MzX3RpX2luaXQoc3RydWN0IGR3YzNfYW02MiAqYW02MikNCj4gIA0KPiAgCWR3YzNfdGlf
d3JpdGVsKGFtNjIsIFVTQlNTX1BIWV9DT05GSUcsIHJlZyk7DQo+ICANCj4gLQljbGtfcHJlcGFy
ZV9lbmFibGUoYW02Mi0+dXNiMl9yZWZjbGspOw0KPiArCXJldCA9IGNsa19wcmVwYXJlX2VuYWJs
ZShhbTYyLT51c2IyX3JlZmNsayk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIGRldl9lcnJf
cHJvYmUoYW02Mi0+ZGV2LCByZXQsICJmYWlsZWQgdG8gZW5hYmxlIHVzYjJfcmVmY2xrXG4iKTsN
Cj4gIA0KPiAgCS8qIFNldCBtb2RlIHZhbGlkIGJpdCB0byBpbmRpY2F0ZSByb2xlIGlzIHZhbGlk
ICovDQo+ICAJcmVnID0gZHdjM190aV9yZWFkbChhbTYyLCBVU0JTU19NT0RFX0NPTlRST0wpOw0K
PiBAQCAtMzYxLDE0ICszNjMsMTcgQEAgc3RhdGljIGludCBkd2MzX3RpX3Jlc3VtZV9jb21tb24o
c3RydWN0IGRldmljZSAqZGV2KQ0KPiAgew0KPiAgCXN0cnVjdCBkd2MzX2FtNjIgKmFtNjIgPSBk
ZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gIAl1MzIgcmVnOw0KPiArCWludCByZXQ7DQo+ICANCj4g
IAlyZWcgPSBkd2MzX3RpX3JlYWRsKGFtNjIsIFVTQlNTX0RFQlVHX0NGRyk7DQo+ICAJaWYgKHJl
ZyAhPSBVU0JTU19ERUJVR19DRkdfRElTQUJMRUQpIHsNCj4gIAkJLyogbG9zdCBwb3dlci9jb250
ZXh0ICovDQo+IC0JCWR3YzNfdGlfaW5pdChhbTYyKTsNCj4gKwkJcmV0dXJuIGR3YzNfdGlfaW5p
dChhbTYyKTsNCg0KVGhpcyBjaGFuZ2VzIHRoZSBjdXJyZW50IGxvZ2ljLiBUaGlzIGlzIHdyb25n
LiBIb3cgZGlkIHlvdSB0ZXN0IHRoaXMuDQoNCj4gIAl9IGVsc2Ugew0KPiArCQlyZXQgPSBjbGtf
cHJlcGFyZV9lbmFibGUoYW02Mi0+dXNiMl9yZWZjbGspOw0KPiArCQlpZiAocmV0KQ0KPiArCQkJ
cmV0dXJuIHJldDsNCj4gIAkJZHdjM190aV93cml0ZWwoYW02MiwgVVNCU1NfREVCVUdfQ0ZHLCBV
U0JTU19ERUJVR19DRkdfT0ZGKTsNCj4gLQkJY2xrX3ByZXBhcmVfZW5hYmxlKGFtNjItPnVzYjJf
cmVmY2xrKTsNCg0KVGhpcyBkb2VzIG1vcmUgdGhhbiB3aGF0J3MgZGVzY3JpYmVkIGluIHRoZSBj
b21taXQuIFBsZWFzZSBleHBsYWluLg0KDQpCUiwNClRoaW5oDQoNCj4gIAl9DQo+ICANCj4gIAlp
ZiAoZGV2aWNlX21heV93YWtldXAoZGV2KSkgew0KPiAtLSANCj4gMi40My4wDQo+IA==

