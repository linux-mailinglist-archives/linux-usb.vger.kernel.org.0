Return-Path: <linux-usb+bounces-37111-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6oxBLxYa/WnsXgAAu9opvQ
	(envelope-from <linux-usb+bounces-37111-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 01:02:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1204F00B1
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 01:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 960943024469
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 23:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86ECE37E2FC;
	Thu,  7 May 2026 23:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pKPa0ncw";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dmHtDrqG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="b3P8DCG7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310832F8E82;
	Thu,  7 May 2026 23:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194963; cv=fail; b=QiVLZnddIS92FgaA1Yv8UdJI1/B4c4ap9746MgOH/KM9oOk2Lw7jelsnlKpQNxLvuCAcnPXLB2qiuSs8BYNFqJ37CYAnYyWU4QWboUQsJPQmj9NMQ1zXASXONo+KtBUk6G5L+libiou7RNdz0vFY9KK87tCuQyi5ijYhkEZGGD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194963; c=relaxed/simple;
	bh=avSyuM/qhJzISb5qC6Aqehpw+ODlk1zbytDZaS8eEOk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FX7op0hh/Nq2TNNzHrqIwKbXzRoqo4qgi89l4N1f0tdSl32ejALXeLafpb4CsJvSpR07sjDeIj3+YpS2gavRF5OSbyALyPoyC6JtzjuQ/sSk0bIif1OiQ/V7GKCVfn4dzaMKkrSjlFQGW5YtvpeeYkPAXb576+YwY7Q30MZaRak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pKPa0ncw; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dmHtDrqG; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=b3P8DCG7 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647Mdkr41147107;
	Thu, 7 May 2026 16:02:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=avSyuM/qhJzISb5qC6Aqehpw+ODlk1zbytDZaS8eEOk=; b=
	pKPa0ncwK80Z9LNxF4HIVjX5k+Yvfh+QMir/eF0vT2uZn4vs8j9SD2QOSTJ0eSFn
	WV3oFGA/GPFj97ufvSajiGPdovsJ+Ksm3Q+f9ig1YOzfoIU5jYur1Q0ONdUPOLYL
	+zSWvxkD5FXQ816NLP0zr/jaKHw2xsufbGJl665FL1oXSaj382U1j92TrmFPvPNH
	IP2Dunr13fgec+ua3JAYWl6g6JbFk6O9yFD3UYhAa0jhaNQwzA/wQDzLfT1oQ5uk
	+qcHZqNG7ozFNEtqHlVql0wkBec0k14wb5kmlMRKS2UNMXAOWKWqRAsvK+sYNWQY
	td3fyhdiYC+n9WT1Iz0EPg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4e0urebx4v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 16:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1778194950; bh=avSyuM/qhJzISb5qC6Aqehpw+ODlk1zbytDZaS8eEOk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=dmHtDrqGvzBKpjpXVx+pgS3yO+ttr5dJOHrClIBPhbuH2HMzbXyVP64Vu9K2Xzrlz
	 quaMu9hv4lQTzDw+EeMV8ub4vJshaL1+IsznyKDA5eI3DobKnBz0+QX1C2Tg8Xo2yJ
	 0ZgvhB3xYf2psvkKZlhRu4mA1M3maYz+0lkBt8UT1WLUq/5PlhLRqvS/6kbXOePyMg
	 f18Kb4QWM1el05oxFimMwoUZgWNt5GguDbXGROm68uOS8rKBMaL0ZKcYOTKAjDYK1P
	 QB+n1esSPT0ogxOVR6NuV5hN+qfr3MY/bcBU5eubkCKxWnEQk3JeOu552jo8y/+sK6
	 3WOvpPpylV87w==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AFAA14041B;
	Thu,  7 May 2026 23:02:29 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 52EB9A0072;
	Thu,  7 May 2026 23:02:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=b3P8DCG7;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00304.outbound.protection.outlook.com [40.93.1.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A758140298;
	Thu,  7 May 2026 23:02:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HuWRXUCkyOT89YjkhTVVCLOWv149kl6p9ZR11y/XbqqklLpKH4BWrOzLKooYoJLzhNbO6go9o4gEfHeryThjF55YjUQedCUWKAAvYTomU3dFT0ewca4vPktjGXIUK194QwWS0MOFGc2ZFOvV6CieKbC8UTOv/kKn1FJqoRjeBIyrYcsqormq0WV2ZprAyo8fNG6A3lyfFoW/pC9WCAPk0nVkgv8T6R4nyCZPhczMvLSqYdsXa7/gLN5NyJMPbIScX7mfQf+eZ2YxzAix8RX7wF9qSX+j1zfUoai/5mXHmEhXhlj+VPwOafXgwL2FDwoAq5rAdonZwA5MieOdGP0dqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avSyuM/qhJzISb5qC6Aqehpw+ODlk1zbytDZaS8eEOk=;
 b=smpNn8jKI4lWCNasMnVxbQ9mZIlXAvuRUSy2ajLKJjsjA8+BxaMd5CYit/1bAyyp5+E9ZzEvaze8vISDocUGvmfX31tdD4NCooXozuDLo7X/nNxNa7QsMDnYBgz1gKyU0t9LwnmWoqHwl1VrQF03h1wl4vUrHOW4iXW+y3cmCxAHRjCpTLy2ZVGsPMba1k3Q09ncf6C1SoyEBd4YDMfHQ9HdRlToy8wLr6Kor7Ii9yDAuIHecCgFSdz+EL8mc04rUyE0qWKLDEPM81YSKBSHR6s2XBn+sil1mMYf8j8bZBwtQQMNDaaL8QoZLYnQMdWjEfGJd8u8DizfDBkOx7SSaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avSyuM/qhJzISb5qC6Aqehpw+ODlk1zbytDZaS8eEOk=;
 b=b3P8DCG7DfWMR5bKGdNBK6CPsRDmOFbx60TkFVWkiAy618NdCNTSKd0E/ByajDvHi2KEUo/wuNHX+8Y4GNd+RgAPthDJxCTbNIUDt8xO71y7jTxB50zJqaNTG+0Yd2yOmrsrIGVFznS4lY6Th9WmHM/pi7weiePTydGM131ST9U=
Received: from DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) by
 IA1PR12MB6161.namprd12.prod.outlook.com (2603:10b6:208:3eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Thu, 7 May
 2026 23:02:24 +0000
Received: from DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::2062:8c19:8492:2691]) by DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::2062:8c19:8492:2691%6]) with mapi id 15.20.9891.017; Thu, 7 May 2026
 23:02:23 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jack.pham@oss.qualcomm.com" <jack.pham@oss.qualcomm.com>,
        "wesley.cheng@oss.qualcomm.com" <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH] usb: dwc3: avoid probe deferral when USB power supply is
 not available
Thread-Topic: [PATCH] usb: dwc3: avoid probe deferral when USB power supply is
 not available
Thread-Index: AQHcxuWp9hYn7RcqQkmtW0XySNuTgLX6Dw6AgAe7AACAAZNGAA==
Date: Thu, 7 May 2026 23:02:23 +0000
Message-ID: <af0WXtFvDwbI9-9-@vbox>
References: <20260407232410.4101455-1-elson.serrao@oss.qualcomm.com>
 <afVDFDK_cTO7rH2d@vbox>
 <4db536fd-9b20-49ec-a5f3-1fa3f2876c1e@oss.qualcomm.com>
In-Reply-To: <4db536fd-9b20-49ec-a5f3-1fa3f2876c1e@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5984:EE_|IA1PR12MB6161:EE_
x-ms-office365-filtering-correlation-id: dbbca5d3-cd5a-4d1b-58ef-08deac8cb35c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003|4133799003|38070700021;
x-microsoft-antispam-message-info:
 O/Ik97dejfNzBA2SnF14tX7UCvukkqOIKp6ujwyopzIYN7JH3F2MVI/XfLDmXI84yCyRMkWfp9Rvc68Wp0sCX6t0fXUU4IRknizJF7Ma24PCaWWN8CUS3SwO83Dp/keh92JHKWDOOliXC4xTY56fzc5nHw8n/5swMkbmLDqPRbiMbCNu+ENkzbtpqudSpfTkUiDL7Ll4+tCiFG/Rf+hWAFcY6rExxmqhnkOvwrnOI4/a46obCI+S+ISNLd19HO+kEy+6q9nRrArFsSvWLu2DwfXl6ez+NZtHhdL1l1G2t4CneRC88w2sQUTCj1ak47NkqHb9vqFBcwbPiBs2BrdQEb3NEO4JIQoeJV5qN9JXkCV9EHhQopvRKWyqSJd3idz9y6LLqbsYNEKOETVqrtPosxCIlOPF27srluCj07blAlcirFHVRI0DjXGoEvg9sKF5JZlbTmjHXetQzRolsC6I323N3/6CCmGOXr9wCpA4L0JMmOqHzDQ9ZNCXLQxyvcLBAiEl8gluWYsI1fha3YX4/+MYFA03j4MNedxOMhoXm3vkodG+GKfmYcncgJzOgod1DvICirDdBr5+HWdSRIv7/JMGQWrSmcQFpfSDQAyZeGYhYsoPXbFObc7c+yajiXpaXfKg48EV3y3EzHOKg88J4mKrzI6TXifBuSc2zhXYqNcEpfSwlwAvlzyEeSUSq3RdOR6w2UleiO4idxJNHxQjktI06ypBhMb+zorf0fCiMA4Zs6FD64+Q9Gv4RZrdhZa/
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5984.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003)(4133799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NHZNMzk2ZVQrRzVXZ1V5VjlBMGI0clhNUGM0VmFKVlVXdThUREZBNkplTFZO?=
 =?utf-8?B?aGRkMG9zMDR0TmMzK2FXKzluU2tZTWdwTjNrMUs0NlgwUnBsWm5EWUxSdEZ6?=
 =?utf-8?B?R3JaK2Z5NndveDQ2YUZRSFlWNmxSUTAyWTZvajZ1dWdNYjJLZ1Z2aElnTE94?=
 =?utf-8?B?amN5OWNMdFFidDlBTW1WekxVRkdHeGZ3a0ttUUh6ZkhzdmR0RWtBeHFGYUg5?=
 =?utf-8?B?YytYVGZXWjFmWTJYUHNjQWVxMktNZldTR0pkRXhPdDdmbG11bGZLZU54b3kz?=
 =?utf-8?B?M3ZHUWZiSjhVTFdLMzVMUjZUOHRsRS93bkl5OXBQQUxWMDJkZXJZU3RIOXhV?=
 =?utf-8?B?YlBkaURMa2RpVG5yVjZncndzRmw4MUZ1MWhxMEszdmVDUjFBR0hBbU9EN25H?=
 =?utf-8?B?cmVadmEvT0RQOWpLOWRQL2E1U2IrQnNMSjFBaGdSMkdSZzVicTV4VHpQQWp0?=
 =?utf-8?B?MmE4RUtKU2h2NDVpRklzNFZxdVJrcStXYlJGdTFtWFQrN1o2RGhUTmF2bGNL?=
 =?utf-8?B?ZVBERTM0Y09BaklXR0c3Q3lWQjBoVmpTQU9aV3ZUbmtQVlI2eGpxSTFvUnNl?=
 =?utf-8?B?S3pOam56cmlwc2R5MFR1TUw4eC8yNnl5d20zNS92RU1ENTFCelBNU3BMZk1q?=
 =?utf-8?B?SUMvYzZQaHZsN3dxWDk5UVJsU2dPaUhxZkl6WkJOeGZERkdnZklaVE5WdWNO?=
 =?utf-8?B?TDZ2c0g0SVF4b2NDMFF6cldkWWpCWm0vaEtwZ2NBRHRlSFlGUWJRbnBlc0Uz?=
 =?utf-8?B?VTJ4eDluZHAzWnlEZVd0Rlp6VjFoMSt3ckhLdnl5VDI1cnZ3UFlkU1lrbG9Z?=
 =?utf-8?B?bjh4SVN3ajlkUDNWSGg0RURsMllnVU5yRjkxbUhVRTJsUDhyQXV4ZmdCaVEr?=
 =?utf-8?B?U01zOEp1b3ZYZlhRMFJaUGJkVE1pRUl6Q1NhLzQwTFJmUDFCdW9UVFJwUUli?=
 =?utf-8?B?TFdZcjlOeUV4WUpFZ3VMNGJ1dEhCTGJlbXlUTFlEdW4wL2lDSGlTdSswTEx5?=
 =?utf-8?B?d2NqRElpbXpHSGVIWFFZR1VLRkcxN0dOVVBqU0F6d0JRVVROV0VTd3BpYjE4?=
 =?utf-8?B?RFVXdUpTR0F0QlI5TVpZMldrYXhwTEVjcGtvdWF0QnRmejlOemxWZC9tbk5v?=
 =?utf-8?B?Ni9zc0Nwb05Rc2FPSEtzN1dMNzN0a1hrckNCcFlqdnJyam9UUDlPejAxN2xk?=
 =?utf-8?B?Q3E2QlJQaUMzUGFIaTY5YVpmRUViZW5MYktubEJKMWdWMjRmUk9TZytNWnZE?=
 =?utf-8?B?dDZCdFc3WC8yem0vTG1EbXU2Vm5BUjZyaHI2K1JvV2RyNkpKWjVzSEE3dGlG?=
 =?utf-8?B?bW1BK1E5WEVwcXdTZjlQNy8vaXJ1NXFrVVArdjZJaFBicFVlMzJmRktKY3BG?=
 =?utf-8?B?RWJvU2YrNzJwSEpBT3c1Y1JaSDJjMEJYNDRhRGRpNGpsekk4a0NCcEI0Mjgx?=
 =?utf-8?B?a1BDZmdBemtVaFRiRkhxMGhpODBxRHFTRnRydFpmS2lNbFIyNVl5SUVuV0pG?=
 =?utf-8?B?MXAwR3dScDNZeDVEdW1pcDRBOWRMYkREdmlJWlVRN1gxY0RNTWdDdCt1VUNX?=
 =?utf-8?B?d3hhY2swcFJ2WFlOS3NMY1p2Sk9wSnA3YmFKMlJmd2kzbGl4RVhDYitHZFlD?=
 =?utf-8?B?dHBtcjYxQ2s4a2NWV1ArcDJDU212TU5aQ3B2S0J0aGhXTjUvOGRwUDFEWUFI?=
 =?utf-8?B?eVFVOGRVNnJlQ1Ztd3VLNXlNQmJSVnFzQmZiZGlzM0liWW9xU2d1NXZhdjIr?=
 =?utf-8?B?Y3l6SkZ4ckxKN1dLNGZYaDA5ZW9Ldm1RcWZIVXRrRnYwS3BXN3VxTGVpU0I0?=
 =?utf-8?B?ZWJ5V0liSmRvc0x4V0JJZ0pWMmpZWXRSdFBIc1ZtbThZb25mcUxGalNkanFE?=
 =?utf-8?B?WGFSWE1JaWxsRTh6Skd0a2ozK1FBc3V2WXZKNmorV1BXYUhMTHRMV0ZpZ2pU?=
 =?utf-8?B?Z0N1TTVjUlJUbFdTWXgrdWFuTmROWElkU1hvSmdzOGduWjU1YlM5VHFCRFEv?=
 =?utf-8?B?M3NHY1VvaW54QjhoTmFtRjVYOFhRY014bXFYVGFBS2UrRW1NbDlUbnl6QkFi?=
 =?utf-8?B?OHdmejRYU0thRG1OZldkQWhEU2twd3E0T0E4Ni9MNG54bWV3ZkdhZ1hYWHBs?=
 =?utf-8?B?L1Z2ay96TFpGZGZPN2VMWk01RzhqSWNpTEQ1TUVBSWZxUS8yeWJ5WFk3QnJo?=
 =?utf-8?B?VlJSeTJSemljMENhbHhhZmRXclZMYkU4TFM3MVBpYjdvN0NhNlIxQmo5bU5q?=
 =?utf-8?B?bzVxdlBpQ0FtTUc4aVF0UUVWTTA5NnQrZ0FDVkx5dzg3YldFeVArcXBjc1hq?=
 =?utf-8?B?V3ZnUWp6QndYZDVEc2JwbFpFTEtuazdNaVUwMzdha2RsSk1kUjJoUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8232654D0847040A75A560DB472206F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	GTqG35TIMw4dooHQrjKgHPfoszoLyiz3jln58km3K5I7NdNvyRT9oLwIyw6XNXzzSVa6Faq/kCVQ5xt/vogcW36POeJJf2lnH4Hk2htSskf/YDB8pKpA5EbO9+Zol1PMo65rMtJN0df+gzt6T3C58dkqvQcHVBH2PmePNycWwfSEH0CLJR8pALZ3/QZk5DZmcaulamaKEM/sL85CkjuvT7Kp9HvDjPVhmIVmRKqgYXA+QK2vVje12bkfax1yy6NGy5XKL2+hDgC+Tyd+WufmCyQSlGtF4rPakpjVc1/itq/ZIMe8jX7wGikPuMIspWqDi4y8tXCw371xZB8SVnqTJA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AgmoHFpHyapn8Ryl4GLRyMLhj9BU1YUzDx4Z9fGUNAH9pLv9vl6divHNuV4NZuxKwxjac0TyCDt+j0VEenTfjnx7r0hDMK5GJi1nfc5Ty1pwi22dfP9EbCUdoREhM8MO6i6JGYbTOExBQ2LxV8+DHi7vd64SpqeIycZlA/PI3BuDVa37Q9E4lvirHkUxY5EUcJ4SOC/Aeq/Ps4R7aHwc7vwjaB8yISft1wSrSyzMDwQq9Pi1fl2lboPQ2Gh69EB7w4uPw9PTGNn4GQW0mJ9uSHhLrRaRauP6JHGVvQBDJ7Hoh5N+oXRXJOGKLfp3zcUBRv+/yaZd1GB60QYZ3PCace0dW8IaAnRctJpEj2XpzWdCcRvTBVQAasfkcBAN52EXgvvglnAYowSBW9y4r/oBNPi4Td9pi4fsTnU1+QzYJ3ViAcfseMd+Ide19I+gDH/mpbMzNdbizv0RyiQRPGlw4A7ZJ5oantHWoPeP3y/9LbiQ7wKowRjZfusbthX+7CzEnqbMz8+XQBqp1RbhnqvZAfmWvuISoHW7cmnmJv1lM8r8Df63lIUvp4nzCjwxWfp8Tv4C09YNRY2C1FUhGjnhLk/eoISOOxDzr/u0HWDxY1TDsRdMQ4+kUFYGhpVfNsPvPo5iqc3btHZaimd5VcUtqA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5984.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbbca5d3-cd5a-4d1b-58ef-08deac8cb35c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 23:02:23.6925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LvAC3mWTto8NKlJOqTvBhBhDzBknHMZ3G0p50ue90UTQifblFGHHQZKforJ8BXz6mNhIOmazqTd14vl8yIy3xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6161
X-Proofpoint-ORIG-GUID: 6Q1uihyCEgBa4pC5mllKhXtaLYTGwZyG
X-Authority-Analysis: v=2.4 cv=doLrzVg4 c=1 sm=1 tr=0 ts=69fd1a06 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=isV2AlQURRRHR1egBSIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzNCBTYWx0ZWRfX+P86ehtBhUxr
 Uqj0f20E+W8vN6QGwHU01DEjMLtl3cAoVxjvQX9firN7LfwWbYpj/PthRecbCOEP9DJNMbKKRsd
 O9UGOZuZdRDh5VBSowaMSyNgVaEl/92BOA59G535E3Ne0cZU+Hxfa36V/aLphUSZZw+aGtCSZjE
 7n4u8Bm4kktVKAlCycaNSuZVQ4O0n/5V+Q8ctCdIqamzUWvQ2HcgFtZiLSLBZZZ/6IqNPQnuSLu
 OcBunrEOK6x90lONsEuJaBqQYHR7/5vHIgqbbypcMbeWPe3+Z8T5irf0+mcclqfAEuWsSO4R7h6
 Y7BqurtOo8g2kb4K9LgQOlnKMOEuCFG2yoU/9G6XzUusWZHnyK7YBjVcQIJCxuJQ2hZBi7Ib6pr
 jmU9p8bQ+FSEgwwDgbee9RwGQR4Mt9F0jLdUklxulNZ6iPBeMMGL5S3smg9nM7Uf+T5sNbOgWnt
 1bdZcXyde1RrMSipLdQ==
X-Proofpoint-GUID: 6Q1uihyCEgBa4pC5mllKhXtaLYTGwZyG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2604200000 definitions=main-2605070234
X-Rspamd-Queue-Id: 2B1204F00B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37111-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[synopsys.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,urldefense.com:url];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	RCPT_COUNT_SEVEN(0.00)[7];
	REDIRECTOR_URL(0.00)[urldefense.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

T24gV2VkLCBNYXkgMDYsIDIwMjYsIEVsc29uIFNlcnJhbyB3cm90ZToNCj4gDQo+IA0KPiBPbiA1
LzEvMjAyNiA1OjU1IFBNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gVHVlLCBBcHIgMDcs
IDIwMjYsIEVsc29uIFNlcnJhbyB3cm90ZToNCj4gPj4gVGhlIGR3YzMgZHJpdmVyIGN1cnJlbnRs
eSBkZWZlcnMgcHJvYmUgaWYgdGhlIFVTQiBwb3dlciBzdXBwbHkgaXMgbm90IHlldA0KPiA+PiBy
ZWdpc3RlcmVkLiBPbiBzb21lIHBsYXRmb3JtcywgZXZlbiB0aG91Z2ggY2hhcmdpbmcgYW5kIHBv
d2VyIHN1cHBseQ0KPiA+PiBmdW5jdGlvbmFsaXR5IGlzIGF2YWlsYWJsZSBkdXJpbmcgbm9ybWFs
IG9wZXJhdGlvbiwgdGhlcmUgbWF5IGV4aXN0DQo+ID4+IG1pbmltYWwgYm9vdGluZyBtb2RlcyAo
c3VjaCBhcyByZWNvdmVyeSBvciBkaWFnbm9zdGljIGVudmlyb25tZW50cykgd2hlcmUNCj4gPj4g
dGhlIHJlbGV2YW50IFVTQiBwb3dlciBzdXBwbHkgZGV2aWNlIGlzIG5vdCByZWdpc3RlcmVkLiBJ
biBzdWNoIGNhc2VzLA0KPiA+PiBwcm9iZSBkZWZlcnJhbCBwcmV2ZW50cyBVU0IgZ2FkZ2V0IG9w
ZXJhdGlvbiBlbnRpcmVseS4NCj4gPj4NCj4gPj4gVVNCIGRhdGEgZnVuY3Rpb25hbGl0eSBmb3Ig
YmFzaWMgb3BlcmF0aW9uIGRvZXMgbm90IGluaGVyZW50bHkgZGVwZW5kIG9uDQo+ID4+IHRoZSBw
b3dlciBzdXBwbHkgZnJhbWV3b3JrLCB3aGljaCBpcyBvbmx5IHJlcXVpcmVkIGZvciBlbmZvcmNp
bmcgVkJVUw0KPiA+PiBjdXJyZW50IGNvbnRyb2wuIFRoZSBjb25maWd1cmVkIFZCVVMgY3VycmVu
dCBsaW1pdCBpcyB0eXBpY2FsbHkgZW5mb3JjZWQNCj4gPj4gdGhyb3VnaCB0aGUgY2hhcmdlciBv
ciBQTUlDIHBvd2VyIHBhdGguIFdoZW4gY2hhcmdpbmcgZnVuY3Rpb25hbGl0eSBpcw0KPiA+PiB1
bmF2YWlsYWJsZSwgYXBwbHlpbmcgYSBjdXJyZW50IGxpbWl0IGhhcyBubyBwcmFjdGljYWwgZWZm
ZWN0LCByZWR1Y2luZw0KPiA+PiB0aGUgYmVuZWZpdCBvZiBzdHJpY3QgcHJvYmUtdGltZSBlbmZv
cmNlbWVudCBpbiB0aGVzZSBlbnZpcm9ubWVudHMuDQo+ID4+DQo+ID4+IEluc3RlYWQgb2YgZGVm
ZXJyaW5nIHByb2JlLCByZWdpc3RlciBhIHBvd2VyIHN1cHBseSBub3RpZmllciB3aGVuIHRoZQ0K
PiA+PiBVU0IgcG93ZXIgc3VwcGx5IGlzIG5vdCB5ZXQgYXZhaWxhYmxlLiBDYWNoZSB0aGUgcmVx
dWVzdGVkIFZCVVMgY3VycmVudA0KPiA+PiBsaW1pdCBhbmQgYXBwbHkgaXQgb25jZSB0aGUgbWF0
Y2hpbmcgcG93ZXIgc3VwcGx5IGJlY29tZXMgYXZhaWxhYmxlLCBhcw0KPiA+PiBub3RpZmllZCB0
aHJvdWdoIHRoZSByZWdpc3RlcmVkIGNhbGxiYWNrLg0KPiA+Pg0KPiA+IA0KPiA+IFRoaXMgZ2V0
cyBhIGJpdCBjdW1iZXJzb21lIG5vdyB0aGF0IHdlIG5lZWQgdG8gY29uc2lkZXIgc29tZSBjb3Ju
ZXINCj4gPiBjYXNlcyBhcm91bmQgdGhlIG5vdGlmaWVyIGNhbGxiYWNrLg0KPiA+IA0KPiA+PiBT
aWduZWQtb2ZmLWJ5OiBFbHNvbiBTZXJyYW8gPGVsc29uLnNlcnJhb0Bvc3MucXVhbGNvbW0uY29t
Pg0KPiA+PiAtLS0NCj4gPj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jICAgfCA4MiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0NCj4gPj4gIGRyaXZlcnMvdXNiL2R3YzMv
Y29yZS5oICAgfCAgNCArKw0KPiA+PiAgZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyB8IDEwICsr
KystDQo+ID4+ICAzIGZpbGVzIGNoYW5nZWQsIDgwIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9u
cygtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgYi9k
cml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiA+PiBpbmRleCAxNjFhNGQ1OGIyY2UuLjIwZGYwYjI4
NzYyMyAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gPj4gKysr
IGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gPj4gQEAgLTIxNjcsMjQgKzIxNjcsNzIgQEAg
c3RhdGljIHZvaWQgZHdjM192YnVzX2RyYXdfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmsp
DQo+ID4+ICAJaWYgKHJldCA8IDApDQo+ID4+ICAJCWRldl9kYmcoZHdjLT5kZXYsICJFcnJvciAo
JWQpIHNldHRpbmcgdmJ1cyBkcmF3ICglZCBtQSlcbiIsDQo+ID4+ICAJCQlyZXQsIGR3Yy0+Y3Vy
cmVudF9saW1pdCk7DQo+ID4+ICsNCj4gPj4gKwkvKiBVbnJlZ2lzdGVyIHRoZSBwc3kgbm90aWZp
ZXIgbm93IHRoYXQgd2UgaGF2ZSB0aGUgcG93ZXJfc3VwcGx5IHJlZmVyZW5jZSAqLw0KPiA+PiAr
CWlmIChkd2MtPnBzeV9uYi5ub3RpZmllcl9jYWxsKSB7DQo+ID4gDQo+ID4gSXMgaXQgcG9zc2li
bGUgZm9yIGR3YzNfY29yZV9yZW1vdmUoKSB0byBoYXBwZW4gaGVyZT8gSWYgc28sIHNob3VsZCB3
ZQ0KPiA+IGRvIHNvbWV0aGluZyBhYm91dCBpdD8NCj4gPiANCj4gDQo+IEhpIFRoaW5oDQo+IA0K
PiBUaGFua3MgZm9yIHRoZSByZXZpZXcuDQo+IA0KPiBZZXMgZHdjM19jb3JlX3JlbW92ZSgpIGNv
dWxkIHJhY2Ugd2l0aCB0aGlzIHBhdGguDQo+IA0KPiBUbyBzaW1wbGlmeSB0aGluZ3MsIEnigJlt
IHBsYW5uaW5nIHRvIHVucmVnaXN0ZXIgdGhlIG5vdGlmaWVyIG9ubHkNCj4gZnJvbSBkd2MzX2Nv
cmVfcmVtb3ZlKCksIHNvIHdlIGRvbuKAmXQgbmVlZCB0byBoYW5kbGUgdGhpcyBjYXNlIGhlcmUN
Cj4gYW5kIHRoZSBub3RpZmllciBsaWZldGltZSByZW1haW5zIHRpZWQgdG8gdGhlIGRldmljZSBs
aWZlY3ljbGUuDQo+IA0KPiBMZXQgbWUga25vdyBpZiB5b3XigJlkIHByZWZlciBhIGRpZmZlcmVu
dCBhcHByb2FjaC4NCj4gDQoNClRoYXQncyBmaW5lIHRvIG1lLiBKdXN0IG1ha2Ugc3VyZSB0byBy
ZXR1cm4gZWFybHkgaWYgdGhlIHBvd2VyIHN1cHBseSBpcw0KcmVnaXN0ZXJlZC4NCg0KPHNuaXA+
DQoNCj4gPj4gKw0KPiA+PiArCWR3Yy0+dXNiX3BzeSA9IHBvd2VyX3N1cHBseV9nZXRfYnlfbmFt
ZShkd2MtPnVzYl9wc3lfbmFtZSk7DQo+ID4+ICsJaWYgKCFkd2MtPnVzYl9wc3kpIHsNCj4gPiAN
Cj4gPiBJcyBpdCBwb3NzaWJsZSBmb3IgdGhlIHBvd2VyIHN1cHBseSB0byByZWdpc3RlciBoZXJl
Pw0KPiA+IA0KPiANCj4gVGhlIHBvd2VyX3N1cHBseSBmcmFtZXdvcmsgaW50cm9kdWNlcyBhIH4x
MCBtcyBkZWxheSBbMV0NCj4gYmVmb3JlIGludm9raW5nIG5vdGlmaWVycyBhZnRlciByZWdpc3Ry
YXRpb24uIFNvIGZvciB0aGUgcmFjZSBkZXNjcmliZWQNCj4gYWJvdmUgdG8gb2NjdXIsIG91ciBw
cm9iZSB3b3VsZCBuZWVkIHRvIHN0YWxsIGZvciBtb3JlIHRoYW4gdGhhdA0KPiBkdXJhdGlvbiBi
ZXR3ZWVuIHRoZSBpbml0aWFsIHBvd2VyX3N1cHBseV9nZXRfYnlfbmFtZSgpIGNhbGwNCj4gYW5k
IG5vdGlmaWVyIHJlZ2lzdHJhdGlvbiwgd2hpY2ggc2VlbXMgaGlnaGx5IHVubGlrZWx5IHVuZGVy
IG5vcm1hbA0KPiBjb25kaXRpb25zLg0KPiANCj4gVGhhdCBzYWlkLCB0aGVyZSBpcyBzdGlsbCBh
IHRoZW9yZXRpY2FsIHdpbmRvdyB3aGVyZSB0aGUgcG93ZXINCj4gc3VwcGx5IGNvdWxkIHJlZ2lz
dGVyIGluIHRoYXQgZ2FwLiBJZiB5b3UgdGhpbmsgaXQncyB3b3J0aCBiZWluZw0KPiBkZWZlbnNp
dmUgaGVyZSwgd2UgY291bGQgcmUtY2hlY2sgcG93ZXJfc3VwcGx5X2dldF9ieV9uYW1lKCkgYWZ0
ZXINCj4gcmVnaXN0ZXJpbmcgdGhlIG5vdGlmaWVyIGFuZCBoYW5kbGUgdGhlIGNhc2UgYWNjb3Jk
aW5nbHkuDQo+IA0KPiBbMV0gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90
cmVlL2RyaXZlcnMvcG93ZXIvc3VwcGx5L3Bvd2VyX3N1cHBseV9jb3JlLmM/aD12Ny4xLXJjMipu
NDBfXztJdyEhQTRGMlI5R19wZyFkVWlQVzZtaWJydnNrNHVHTzRNbkdWZzNSMXpSM0VteHhJUk9y
dzROLXl0SFpxN045cS1WNmlyTkFXckJyb2xVUjJIQUJzQUdTUW9NUHpHbkVHUXN2V2Roeld6Y1ZI
T1UkIA0KPiANCg0KRm9yIG15IG93biBzYW5pdHksIGNhbiB3ZSBoYXZlIHRoYXQgZXh0cmEgY2hl
Y2s/IE90aGVyd2lzZSwgZXZlcnkgdGltZSBJDQpzY2FuIHRocm91Z2ggdGhpcyBJIHdvdWxkIG5l
ZWQgdG8gcmVjYWxsIHdoeSBpdCB3YXNuJ3QgbmVlZGVkLg0KDQpUaGFua3MsDQpUaGluaA==

