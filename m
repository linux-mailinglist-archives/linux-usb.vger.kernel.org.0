Return-Path: <linux-usb+bounces-37430-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHAPHeMjBWq3SwIAu9opvQ
	(envelope-from <linux-usb+bounces-37430-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 03:22:43 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E723353CAA8
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 03:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBB033030D59
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 01:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277272F25F5;
	Thu, 14 May 2026 01:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kY+g5AMM";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YPkhnBD0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HA0XCVvI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B902B25392A;
	Thu, 14 May 2026 01:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778721758; cv=fail; b=BEALxc88Qeg9LX0LBOQe5o6PNYlFlyUBKfe48VGVBzw4WQIcY1r5Q8rlyV+eYsxDskgy63rA5+MpjWRbs+KRW0C7+PFFt66jTTZGpBZkXvVXmRlwwtyn6f3tgJqiJ8JCh2vXmK62iyNWD+GdLqiAf9plSlti8z09m0E7CRqhBQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778721758; c=relaxed/simple;
	bh=YmTvGUa5EXZgX2RSY5+WLG2MsCz28yiPtv3ygDC0FN8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O6H3ni0ID9riXxMnat31yKpcPsb9Bpw/v3mCKphVbHh4CaFtfIm7rY1dRkVzy7y16MV6Z6MPIT74jr7VQNXqmdwPDcdetMBf2JKMwi9TKBHhHXHzXMZAXxsjK/dfE4jl54Qti8A7JhURycgNZOxPzunl4oFLaswuuJXhW+WmxYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kY+g5AMM; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YPkhnBD0; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=HA0XCVvI reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DLXjj33315084;
	Wed, 13 May 2026 18:21:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=YmTvGUa5EXZgX2RSY5+WLG2MsCz28yiPtv3ygDC0FN8=; b=
	kY+g5AMMbVOboVEijimOO5+FzspxYQ7ncNMM9R0wWiF8shm1VJyi3ZIcFGMwrO0+
	41swp+ho7ClLBmXH1c6en2yTU5hym443Dsbsrhz0gqbfYsG8MqP5uQsONzQwBVR5
	tT6Rtj6+dc7P2qknsJwzPAELbLbzSYYpcW7R2vcrL8modxcbI2nxOv8kOASx9PPE
	m1/O6UPck9YYUXQL9xw5//E40JCzdO2V3YGsdZGXYhJrKe2N06xv+L2+yZ1vTpCC
	8vNTPSsBVD7rKf1ma4d7/V50IdsTGjpHcGvjsXCkO1EJ6icOjrwGH+qQbttkv4MD
	rQYxDaoOomsOZeVHm3RIyg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4e4utf372q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 13 May 2026 18:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1778721699; bh=YmTvGUa5EXZgX2RSY5+WLG2MsCz28yiPtv3ygDC0FN8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=YPkhnBD0yJJjqEUILsjY0EHWoRCO4OkEcw65E4w6d6cS+rb0iguVc01y70aWHv8P7
	 xCViAJA9c2B44J9TGWzoSXg7bqg5gHGDgVZG8tE6c3FykJOhwmRCm5VH0TJmf9fthP
	 NYLN7DpUrwkuFXKhJywwhGJGXs5DDDH3UR42lwAeTJAsDFf5KEFBWdjAiICuJkZR4D
	 br+Ycepm0iZP2pMlpbQRG7btcDe1frIAnlLzhdNZ243hEHhHuQKMMwzMI0AK/waB6C
	 VulVrzx6YI2ErcjGyiyYFAjyML+c3gKULmhluJuqjf+oPzzktGHcKtle/bdhlB2U+8
	 fIlhuQMewWrLA==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 39E07402B2;
	Thu, 14 May 2026 01:21:39 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 0E450A020A;
	Thu, 14 May 2026 01:21:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=HA0XCVvI;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00307.outbound.protection.outlook.com [40.93.1.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 79F37220210;
	Thu, 14 May 2026 01:21:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UH2pv4KFN5V4Y8jsqNlhtRHeEVigWktnF3QTLABmWKGjQ2N1ykQoHz+U7EpeFYHA3V5VWz6c0b63uSxFxuPlt2n5s/QcEdwjL1VPPJ7vlPBkARsCz+KV0L+2aYrUm6NmMYWNaYJRmEya617tqzlp5+DvRGK3F2GFyOFzxf9ivUXGO7hOm8RQK12HwhMfhbh6JNP2+UJ3g8l9x6owoYjiVDvVbPYbqGQZ/lBxV1k0+fkVebRWkeEs2BE/WscXGNFtUf/ohhN/9KBPYnQyKJHXYHCwaIpfjvFI1cYrBKdS47yp/164ceEErSChNGLqb9cULC0bbKdQ7cDwRQOoHN41IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmTvGUa5EXZgX2RSY5+WLG2MsCz28yiPtv3ygDC0FN8=;
 b=h5XbNQj+CRO+MNQOfmx36rqnN8Lvm9SN5YEMCryeZyTeYx+I6TtAuEVLANSXb7ta7ODHg5OwKCo5kbsEC4r+X1FEaLWHJpId0yQXRvTjq7t0DSFOWe+OfOlAwHfRBDcvLYe9JCsEZTGtfHdaWNctQymEfKh3JhC1pzAxrL61A165nyAskTkLZunugTMm2EFSc6MJX5VzH5wkXHxtQ2EI1z8M0I3hJlMQSKiv1iW8+lWBi1oOUEmjyMYwzf7wesjmZYADh9QPoWjCp4wvnydHPyHvBL1ynNLTBPr6e3mixyx1p31IS0lZJmBuj7YNKEJ3tXOfFZLgBY6KW0KmymnbTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmTvGUa5EXZgX2RSY5+WLG2MsCz28yiPtv3ygDC0FN8=;
 b=HA0XCVvIUs56wXZxzviypAz9sEqBEJe33odgriDxthzwJNVmDzO1Z3FFPMwEjskb5QXUKOBJbcKQzH74M8gRM8agJZDVvAo5E1kGuXW1Ia6qUqX1e1JWjB1jEJa1VFHZd8+lNiGt8dZZr6Rs4YxOWJPJ0gH3QtQKvBCUEBrCZJQ=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH2PR12MB9493.namprd12.prod.outlook.com (2603:10b6:610:27c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Thu, 14 May
 2026 01:21:33 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 01:21:33 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Sven Peter <sven@kernel.org>, Jack Pham <jack.pham@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg
	<mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 2/2] usb: dwc3: Notify XHCI core of tunneled status
Thread-Topic: [PATCH 2/2] usb: dwc3: Notify XHCI core of tunneled status
Thread-Index:
 AQHc3GzqfUjaf13lmkyktxAm9F4Ko7YBqo4AgAC23ACAAHigAIAAU7AAgADfCoCAAL/UAIADxZWAgAER1QCAAyLuAA==
Date: Thu, 14 May 2026 01:21:33 +0000
Message-ID: <agUghtwMsx0G-OFS@vbox>
References:
 <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
 <20260505-topic-dwc3_tunneling_state-v1-2-4aaa6c3c14cb@oss.qualcomm.com>
 <afpyvhadqZw0xfTB@vbox>
 <1163a026-03b2-4860-a422-eb276920b4aa@oss.qualcomm.com>
 <afzP+uoUALSji95Q@hu-jackp-lv.qualcomm.com> <af0SM3C5qHc73DM8@vbox>
 <670f9a9f-54b9-4109-986e-5071caf1dcaf@oss.qualcomm.com>
 <af5sfCOfBa7mYqPw@vbox>
 <0431f8ff-545b-4533-8bb3-d4f3d2e30032@oss.qualcomm.com>
 <agKBR1hsbPw_24Ov@vbox>
In-Reply-To: <agKBR1hsbPw_24Ov@vbox>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH2PR12MB9493:EE_
x-ms-office365-filtering-correlation-id: d26c95fd-25df-4944-1cff-08deb1572281
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021|4143699003|56012099003|22082099003|18002099003|3023799003;
x-microsoft-antispam-message-info:
 t1QZrbN/sLPbQV2wLHAkH7JosEcJm5pEKPpjxFO7b9WRI7UOVlRv6vnq/tLaG9aMjs3p66cnbHzZdbaFp0l6ORRqJyA8klZ0otyeTbANU/nQeafoddXlM87s23N0YRxxNy7xVE/z9zrH70Mfs2z0lQolveqYujlvlmMkP7i2x2LO1adHeryVK02CF2UDsD61Adcs22VgUG5c/rwAioLivXAoWkPdn/WpZd1NwLkN0VV2UW28k/d1DR7IYHOmcBsZVIRkcfGoNKVyDfcTQSXlOYHe6iNoEo8LY7GV0dMNQH0z4wWhzc6lD/nOpIwYQsMpjPouEXN3EsCymB7/60dix+VCWdh6HYCMW/uMqVy9X1Q41Qe/karkAQRE8MNFEk1vQHicoaZhYrRjN7lRmGxqOQYoAs1rPBT0Qxh7v/q1w0e39HlXahQ8gEbLLYL+ZYgpt9lr3rvrxugVnAVOmswooqMb7sHfk/G4VEs2lwNSy/DpEdOzwLVc+ldKXKHOumjj+GPt49UuqG+eMuCEF7C7LFmXiIE0tEb+bJPm+swQZsnq4BrKTOOkq/vv1uFZBDPh3Ffwc+Y2SZ8lIy4PrucC6IkO+QUWQd1QTm7zvZxqY+84GfG0wlTSE8LcjsuVNkFVkG8ydie2C1E89d+I01r3SgsHkaiHBbzqu1pwfpCmHRjBTfCNn5GEUSdacqwHyC+DLVeQkR602sfyaAp5Ld58k63mmdiLL/BDFegcVfQPQ3p6g6Fq+XKo9RUkeRRnZ4dN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021)(4143699003)(56012099003)(22082099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Rm1oMmlxYUs1eDhTMjc4cnUrcHhmWFgwS1lVTjcwc0gxWjBhek5UQ2hwMEpT?=
 =?utf-8?B?TEJOVjFUejJKS1FqNjJ5dEgyNGxHQ1pTUlJqQXZvZElIUmpETmMydS85RWhQ?=
 =?utf-8?B?WGUvWHY0TmN3L1hKVmgzTlJ0VXlySXZydFZhY0tqdFFHT1J0UkdpeldJcENP?=
 =?utf-8?B?QmNobWZPeldGa2lqKzluREw3MjkyWlloamN6UExlSEhWZk5STitOdVJZZnVG?=
 =?utf-8?B?VjBDS01zSDVOaTNMN3BkeDJoS1R2SERMWm02UXV2MVYyVjJxRURiV21LbWsy?=
 =?utf-8?B?OTlXNnl4eVFqZHNXS0JQTXNac24wRU9sa0o1Q3BreVV0WGVCYmg0Y0x3aXJj?=
 =?utf-8?B?NUhObldnL3g0eDFwNWJWaGhBV2FRWmtJNmJLeUtwTDE0MVRWdjU1Y1MxNXho?=
 =?utf-8?B?eCt5bndHbDZDLzlwbU5kdFg3OUc1MnVFODFHMGZRM0VJSE11YytTMHhJU09P?=
 =?utf-8?B?dXoyd2tUWVY1ZkRUZW9RTElYQUVYK3BSaDNiYmJmeG5mVXkwMEY1Z0h4UmFK?=
 =?utf-8?B?VHgrOXNhZjlHZTkzQXpVWUlzaG9OcXEzYjZHSUlmQnNwRVVDd1dDNUVZNXEv?=
 =?utf-8?B?dCs1MlZMT1R6M0VrQ2ZOby9idEZpMSt3Znp2dnZuL0hyUXZoMmt1bHlsQWFq?=
 =?utf-8?B?VitUdkZkYk4vSW9PdUZodlFUYmpvSlRFTmpDOTNGQVYxVi9SK2hCYWZ6aWh0?=
 =?utf-8?B?djlKbWxFbFZwVUdVWjJOMVZLaFpWNlkxT3ZxS3ZIeGZTRnBHNXJoSGxRYUdu?=
 =?utf-8?B?SjVPKzBlZ3BCd3laSm5paHBiQjYzdDNteVhUYTNCbEZrWXVHR1JCVFducEI4?=
 =?utf-8?B?ZEU3NUFhREI1eCszS1czNmJUclpzQnFrRUlYcHVTdWxKOGpPM21YbDA5TW1Q?=
 =?utf-8?B?S3lJTUpLT0NqT1JwZUg5cGt3VTJBYkpXUCt3OFp3QkVwb1pZMnJ2ODErWnpF?=
 =?utf-8?B?dUJrWE54cDZoNWcySWQ2VXBLSWdoNjhTK2JNKzBvT2lkcGRPRnQxejU5UzJJ?=
 =?utf-8?B?MFZqWENjelgwMUtoekZTaHk4TEtaYVYxeXJpQ0liNW5HU2M2ZXZacEFOZUlm?=
 =?utf-8?B?cjU5bGo4L2hqc09hQVlXUE1URzVUWFFXVW1pL2ZCR0EwY2dhVVVnaWJJem9S?=
 =?utf-8?B?UC8zWmJnT21XK3M1MmI2Rzg0cS9xRHlpWlVzUjZCeHVwbWFTcEY4VFpCVG1y?=
 =?utf-8?B?clJQQWtsaWtXbkNPM2dZRk1RS2dRRXgzUHVTbXRQaUt3N0lOUWxWTE95TGFi?=
 =?utf-8?B?RU9LWlBtdmpSR2JiNTNJOW5ESDVhZEJUUDRqUFNDRXFIN1pFL2FhVnVKZGVM?=
 =?utf-8?B?ZUZUWU1ZZEdkTFJ2K2k1SmttSlFVdXdWY3JQTVVsWmk2YUlaZmNDcDFDeDBv?=
 =?utf-8?B?aytDS3lid21URFJLaHlVRzM2dE9ZN1B2TzlQdzRQK3MwK1hHRWR4NnphN2Ev?=
 =?utf-8?B?NTczaXFMSytrOE93MmRsTE1FMkt5aW0yYVMyRllFWFdDZ2xDVDNmdkt4V3FO?=
 =?utf-8?B?dlY1VlRnZXpGcU9XQnlld2hBOWZTMnlkTnFpR0lJaktucE8yTHljdzE3N3RB?=
 =?utf-8?B?UkpIM3pBQk1pRlB4RTdsSVRSZnNHbTRUZUgybVc5UDFWajE5bUs5NEhUbTNE?=
 =?utf-8?B?Z09GL2FQTWRGdER0eUQrTm5pUU0yZWFrcEZORUtUaU1vbjdCZG1XTzFyRFo3?=
 =?utf-8?B?SXVlem1HOGEwYWhBZkRvYmY1Y0ZiZUhnWFVCWmtURGtJTWs3NHlHM1N4d0Zp?=
 =?utf-8?B?WU1PMjcwZXV6ZnRBZ1RQMG5RcDV1aTRrd3owZnZKMW02T3I4d3VROUpTZ2pp?=
 =?utf-8?B?M3lJcGtUV2tqb1RDMHlad1MxQnFESUpIWWRwS3BSalJwaG1ScWpqZkhEYURG?=
 =?utf-8?B?cVdJUngrWHdxS1JkSFlabHhWeGUydGtndVZlQlhDcXBhbTVISi9nOVc1eVdW?=
 =?utf-8?B?MUhCVGl4eFNsa3ZRdTFYZzZhRVlLbVAzZlV0cjZjalJjTWNiN1Y5cU0vMkRR?=
 =?utf-8?B?WGhtWVpGQ0lFVE1rV2ROS1FVWHBOdlp3cWhFSm4zd2svZkRWdy83SXBHMjJw?=
 =?utf-8?B?WGtnaHRybTZqMnhvZWhYZENLYWVvZWpGNVdnTkRBeldhVVNvNHVKRXFxY3Bn?=
 =?utf-8?B?SXZDdTZsRUg4WkRzTHgrRk9vZUZHN2RobHhHeE1VVjdRVG96YXM3Q0lhQ2Mv?=
 =?utf-8?B?RU1hNzhvZjRyd25XNWpITE9xUDlrejF6LzByTUpjNkoydUZzWnF6V3NkZzVh?=
 =?utf-8?B?YTFFb1N4WnFUMC9rKzJuc3JHemFLR0RySzB3VHB5RFk1WVRVN0laQUVOb1Bu?=
 =?utf-8?B?VGc1RTJUQ2RZQ0p4aDJhOGdXN09CbWpTRkxzdkNuNDNKdXZsSWozQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <97F32213F020904CBD95BC883373662B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	IxBDN5nFJ1CZwxLMFyGF4hIs9CoZ56uT07b5DhHOh4DTHWFcju6XyQK7zwImv1xn5NxBOFMXygPhBW/3e6PLoC1ulZXVQmXvj0+lP9laWhEYj+jaLhAMqC+7V2DC7BLi0Ee1WJ3nm4oa+/am0cqUkzOFaqS4k3K2X6MxKhLNq+F0dZNeVrw17k8h0Yb+jful2QlWHxtENrMWuQ0k08IP6Q13pf+PfHGt09F3vBhZ+v3OM7VCBR4sB4iMH8T2v+kbJfbJIWKYvIZufmlr18fi6ulnZl5oBllv6za2opYWhTB3wKSPrtwiqYmDKTjZ/DQZXNvTPTRjQkd0qfsxJ95iEQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Jmrt73h4JUKl9iR5GH/0IMeoug6YZg5bY9zbVAgdsjC1EcilDH13GTUn7bO8Jips2qR3xbFyPlaQM2oelP+SD8aZ71o9OlqmXloov/w7Hucu/QOnPp+/jEw0RKmL9L0Ln0jfjSXO8ICMaDQSNEB37nDImYl/zIm2NyqJvhszN4S4kEstnxvcw5JWic3KXjxWfmrc4MPqaWBUpnnTtfaIGyhKc6ygi5zx4w8EUV99C9JWrgQmq2xPljL2orq+B83lcuCII1MQLz9UxBYo49S70DzUTSTWPD6721h7dj1ysi3c7oKBQRp3NjA6QLlUQ0znRTLXYLFPakjIbha2wiYdpN1vnbwGn3SvkzcvV84HRm8FQOrSeYZR2Zvf3fC/b378M9C54k5uY0MtZZV+6TZb9NFe7jfbgkXMZNGZ5mztqSEyHj7apWuklT65xQ5kuuC7oFfzyx87zF/xYrb7qwyMkSmBL+axjyfyvCKsfRTSyZDlOFKnRZla/gOLMeSRfJC9luNQCPCvTeJjYDjyJe67bFOD4/1MN0dvnEMvi9GVI6K8zH7oxEL71xl9camTfXZM+IlexZhwTZ2F6I3HRcN7KKFxj6RcsGC7d0MMRYUf14pCmKnq2ziZh80D3L9NaNp494EYzJ8fpYjqmkNYTUaMiA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d26c95fd-25df-4944-1cff-08deb1572281
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 01:21:33.1726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0jYoOEVhw9cF7/Lb+KX2chYTNkm9pDEL2+JYQ7qfrPfz0TwqlBWcH/epfBdxSKhoSON9wh5NL6k5fYfinGXPfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9493
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAxMSBTYWx0ZWRfX1Mt7JE2ABIIT
 APaFOKhzHVVCBvsWSb3HBX1V7J3L9wu9xVY8BSxVMfdQ9cEgtSVG5D+wEd5ukuzOfRDVKNgNC77
 N9isD6qrT/+UR5raf2YrPAIGcJGg38UtjzRGc8OPltMuB0MEaOcb0nafEXFR/90mKaeK4O2o3lh
 +mXaG+pJZCNxdhr8/9/0Z9P3Sjl3zqDXTSnUvtKq1keby9lwJJntu+jGY7Fs05CBP/QhtjzORHa
 zt/XgfKlrL9ms2AngoCjvNdcDf/GVDOhahpgOqOzv5DCBb2oQXGDntWPZWYtL4x4LaxMAnFL6QV
 RiG8rALXnh/NeK0M/eC547IIRITIgPD8E5Lxjck34U1omVAInr4a25HEwP/GYGJ3lpW1F1r8OOD
 LWVLGDXhaEIkj7YXcTnTh5BdVb5IYD8ngfHrhaMGKeaOnEZhBeV8yfr4Q50KxbPqd212sSDFDm1
 C8kVJ2qxYSd05Kr6OeQ==
X-Proofpoint-ORIG-GUID: hBpdQb-PIfyTtsX1f67nJf4bGHM5dp-F
X-Proofpoint-GUID: hBpdQb-PIfyTtsX1f67nJf4bGHM5dp-F
X-Authority-Analysis: v=2.4 cv=W/AIkxWk c=1 sm=1 tr=0 ts=6a0523a4 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=SZDUe33ifXWiUo0qejgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_04,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605050000 definitions=main-2605140011
X-Rspamd-Queue-Id: E723353CAA8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37430-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,portsc.tm:url];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

T24gVHVlLCBNYXkgMTIsIDIwMjYsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gT24gTW9uLCBNYXkg
MTEsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+ID4gT24gNS85LzI2IDE6MzEgQU0sIFRo
aW5oIE5ndXllbiB3cm90ZToNCj4gPiA+IA0KPiA+ID4gRm9yIHRoZSBEV0MzX0NJT0NUUkxfQ0lP
X0VOIHRvIGJlIHNldCwgaXQgbmVlZHMgdG8gYmUgZG9uZSBieSB0aGUgdHlwZS1jDQo+ID4gPiBk
cml2ZXIgYWZ0ZXIgZGV0ZWN0aW5nIGFsdGVybmF0ZSBtb2RlIHJpZ2h0PyBIb3cgaXMgaXQgYmVp
bmcgZG9uZSBub3c/DQo+ID4gPiBDYW4gdGhlIHVkZXYtPnR1bm5lbF9tb2RlIGJlIHVwZGF0ZWQg
ZGlyZWN0bHkgYnkgeW91ciB0eXBlLWMgZHJpdmVyDQo+ID4gPiB3aGVuIGl0IHNldHMgRFdDM19D
SU9DVFJMX0NJT19FTj8NCj4gPiANCj4gPiBGb3IgdXMsIGl0IHNlZW1zIHRvIGJlIGhhcmR3aXJl
ZCAobm90IHN1cmUgaWYgYWN0dWFsbHksIGJ1dCBkZWZpbml0ZWx5DQo+ID4gZWZmZWN0aXZlbHkp
IHRvIGEgc2VwYXJhdGUgcmVnaXN0ZXIgd2hpY2ggaXMgdXNlZCB0byBzZWxlY3QgdGhlIHJpZ2h0
DQo+ID4gY2xvY2sgbXV4IGZvciB0aGUgVVNCMyBwcm90b2NvbCBhZGFwdGVyIHRvIHdvcmsgKHdo
aWNoIGlzIHRvIGJlIHNldCBpZg0KPiA+IFVTQjMgdHVubmVsaW5nIGlzIGdvaW5nIHRvIGJlIHVz
ZWQpDQo+ID4gDQo+ID4gTW9yZW92ZXIsIHRoZSByZWdpc3RlciBkZWZpbml0aW9uIGZvciBvdXIg
U29DcyBjYWxscyBhbGwgZmllbGRzIG9mDQo+ID4gQ0lPQ1RSTCByZWFkLW9ubHksIHdoZXJlYXMg
dGhlIERXQyBwcm9ncmFtbWluZyBndWlkZSBzYXlzIHRoZXkncmUgUi9XIC0NCj4gPiBwb3NzaWJs
eSBzdXBwb3J0aW5nIG15IHRoZW9yeSBhYm92ZQ0KPiA+IA0KPiA+IEZXSVcsIG91ciBUeXBlLUMg
aW5mcmEgaXMgYXMgc3VjaDoNCj4gPiANCj4gPiAxLiB0aGljayBmaXJtd2FyZSBsYXllciBydW5u
aW5nIG9uIGEgTUNVIHRoYXQgcGVyZm9ybXMgbW9kZSZQRCBoYW5kc2hha2VzDQo+ID4gMi4gZHJp
dmVycy9zb2MvcWNvbS9wbWljX2dsaW5rX2FsdG1vZGUuYyByZWNlaXZlcyBub3RpZmljYXRpb25z
IG9mIHdoYXQNCj4gPiAgICB0aGUgRlcgaGFkIG5lZ290aWF0ZWQgd2l0aCByZWdhcmRzIHRvIG1v
ZGUNCj4gPiAzLiBhIHJlbGF0aXZlbHkgc21hbGwgc3Vic2V0IG9mIFVDU0kgcHJvdmlkZXMgUEQg
ZGF0YSAoYW5kIHNvbWUgYWx0bW9kZQ0KPiA+ICAgIGRhdGEpDQo+ID4gNC4gZHJpdmVycy9waHkv
cXVhbGNvbW0vcGh5LXFjb20tcW1wLWNvbWJvLmMgcmVwcm9ncmFtcyB0aGUgUEhZIGJhc2VkDQo+
ID4gICAgb24gdHlwZWNfbXV4IGV2ZW50cyBpbiBuYXRpdmUgY2FzZXMsIG9yIHRvIFVTQjQvVEJU
IG1vZGUgaWYgdGhlIHJvdXRlcg0KPiA+ICAgIGRyaXZlciByZXF1ZXN0cyBpdCBbdGhhdCBsYXN0
IHBhcnQgaXMgbm90IHlldCB1cHN0cmVhbV0NCj4gPiA1LiBbb3B0aW9uYWxseV0gcmV0aW1lciBk
cml2ZXJzIGluIGJldHdlZW4gKG1vc3Qgb2Z0ZW4gUGFyYWRlIFBTODgzeA0KPiA+ICAgIHNlcmll
cyB2aWEgZHJpdmVycy91c2IvdHlwZWMvbXV4L3BzODgzeC5jKSwgd2hpY2ggYWN0IGFzIGFuDQo+
ID4gICAgYWRkaXRpb25hbCB0eXBlY19tdXgvc3dpdGNoIGluIHRoZSBjaGFpbg0KPiA+IDYuIFtu
b3QgdXBzdHJlYW0geWV0XSBVU0I0IHJvdXRlciBkcml2ZXIgY29uc3VtZXMgc29tZSB0eXBlY19t
dXgNCj4gPiAgICBwYXJhbWV0ZXJzIChvcmllbnRhdGlvbiwgY2FibGUgYW5kIHBhcnRuZXIgY2Fw
YWJpbGl0aWVzKSBhbmQgc2VuZHMgYQ0KPiA+ICAgIGNvbW1hbmQgdG8gYW5vdGhlciBNQ1UgdG8g
aGlnaC1zcGVlZCBsaW5rIGVzdGFibGlzaG1lbnQuIEl0IGFsc28gc2V0cw0KPiA+ICAgIHRoZSBh
Zm9yZW1lbnRpb25lZCBtYWdpYyByZWdpc3Rlci4NCj4gPiANCj4gPiBBdCBhIGdsYW5jZSwgMi4g
c2VlbXMgbGlrZSBhIHJlYXNvbmFibHkgZml0dGluZyBwbGFjZSB0byBzZXQgaXQsIGhvd2V2ZXI6
DQo+ID4gKiBpdCBkb2VzIG5vdCBoYXZlIGFueSBzb3J0IG9mIGEgaGFuZGxlIHRvIHRoZSB0eXBl
Y19jb25uZWN0b3IgKGl0DQo+ID4gb25seSBhY3RzIGxpa2UgYSBtdXggdGhhdCBzZXRzIGFub3Ro
ZXIgbXV4KSwgYW5kDQo+ID4gKiBpdCBtYXkgYmUgZ29pbmcgYXdheSBpbiB0aGUgZnV0dXJlDQo+
ID4gDQo+ID4gc28gSSdkIG11Y2ggcHJlZmVyIHRvIGtlZXAgdGhpcyBsb2dpYyBzb21ld2hlcmUg
bmVhciB3aGVyZSB0aGlzIGl0ZXJhdGlvbg0KPiA+IG9mIHRoZSBwYXRjaCBkb2VzIC0gSSB0aGlu
ayBpdCdsbCBiZSB1c2VmdWwgZm9yIG1vcmUgaW1wbGVtZW50YXRpb25zLCBhcw0KPiA+IEknZCBp
bWFnaW5lIGl0J2QgYmUgZmFpcmx5IGNvbW1vbnBsYWNlIHRvIGhhcmR3aXJlIENJT0NUUkxfQ0lP
X0VOIGFuZA0KPiA+IGFub3RoZXIgcGFydCBvZiB0aGUgcGlwZWxpbmUgdGhhdCBtdXN0IGxvZ2lj
YWxseSBiZSBvbmxpbmUgZm9yIFVTQjQgdG8NCj4gPiBiZSB1c2VmdWwNCj4gPiANCj4gDQo+IFRo
YW5rcyBmb3IgdGhlIGRldGFpbHMuIExldCBtZSBnZXQgYmFjayBhZnRlciBkaXNjdXNzaW5nIHdp
dGggb3VyIHRlYW0NCj4gaW50ZXJuYWxseS4NCj4gDQoNCkhpLA0KDQpUaGVyZSdzIG5vIGNsZWFu
ZXIgd2F5IEkgc2VlIHRvIGRvIHRoaXMuIFdlIGNhbiB1c2UgdGhlDQoidXNiNC1ob3N0LWludGVy
ZmFjZSIgdGhhdCB5b3UgcHJvcG9zZWQuIFdlIGFsc28gbmVlZCB0byBjb25zaWRlciBuZXdlcg0K
RFdDX3VzYjN4IElQIHZlcnNpb25zIHN1cHBvcnQgeEhDSSB0dW5uZWxpbmcgY2FwYWJpbGl0eSBi
aXQgYW5kDQpQT1JUU0MuVE0uIFRoZSB4SENJIHNob3VsZCBjaGVjayBmb3IgdGhlIHhIQ0kgcmVn
aXN0ZXJzIGJlZm9yZSBkZWNpZGluZw0KdG8gZmFsbGJhY2sgdG8gY2hlY2sgdGhlIHhoY2lfcGxh
dC0+dHVubmVsX21vZGUoKS4NCg0KDQpUaGFua3MsDQpUaGluaA==

