Return-Path: <linux-usb+bounces-35087-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBAYEnI8u2lehQIAu9opvQ
	(envelope-from <linux-usb+bounces-35087-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 00:59:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D19242C3FA0
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 00:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AEFB730234C2
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 23:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72673393DDA;
	Wed, 18 Mar 2026 23:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="a8KXwSt+";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZvJPqXr7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="c4nKu0zu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0CA3939CC
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 23:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773878382; cv=fail; b=upZmeebKdTELI9ymh5SJ/sL9s/7lYGXMpKNSg4MrYPzOIyiCHRYAygERKzpA+/7gnTCE6DHcVSlWmBjp4cTmEFoPDNZfsdGo+YE2rj4sKTcepqb9ZewRETMqAnAi1kIg6gHFAfp2LPL+2JEhgHsIRTYBnwvwOeZd2dWZ9NTRkUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773878382; c=relaxed/simple;
	bh=mCTQMMBHU7Tmrr0XzFXOfKGqMWKHJnH6Mlee01BB3Vs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Pzr5HYAxEYkvabqJIZVVFUyY4E+2JU4nuQJHcvTyWgYxxuERDMv1YttNhMSpS/P8u6uuA26skAnbPo9T22CjomvW6B00dJJR4oaF2JWCUktokHNvYWmbWkImMbJpwKczvgy4nTHeeUNJc3TLOLP1TyXWZsSw8vH0GsN/8u5QCks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=a8KXwSt+; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZvJPqXr7; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=c4nKu0zu reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ILQOOH983010;
	Wed, 18 Mar 2026 16:59:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=mCTQMMBHU7Tmrr0XzFXOfKGqMWKHJnH6Mlee01BB3Vs=; b=
	a8KXwSt+pklglxs5AuDxqN+g0VtO0GBezeQmDl6kso5dHCER8HXA6U1GGGED5pxr
	v/RyoFqq3wdtKlKUdXVeymxepTtZzyA1vHtgDz3MGiG6THuTPcM81oiV5GRR6Uc0
	/wQu/oUofDz+sw63jCf3dCTNWKIhKvNYFFtTJIHFEXjE22GDo7S6H4LNT32Oyofu
	2O5lrWMZR9uKJySf5QFtp/XjOqkeEVWVkPE3nh/3nedDFYxCGENRh//G+vMjSi3Y
	DDjbcBgNOf9q4BOzF4Nmwyp30o8F3XzavapNj2epMN/JzJ9Ey/NPVQxeVP3KXe7B
	iQTdeZsA95PMjGugCLy80g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4d03ycrmdt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Mar 2026 16:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1773878370; bh=mCTQMMBHU7Tmrr0XzFXOfKGqMWKHJnH6Mlee01BB3Vs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ZvJPqXr7tKqP8RNfRheaR9Bp90M22+OqHXgSjLqSKKOPbbOdMOc8f6OSYDbv9hQC6
	 JD5a29/waajKpNZMm3F178T4Q+IMHdQvtgOulMsZcDizW2mkcUHgX7oYwG/cGEEcWl
	 odFt3GlZ8XqzqVkplZ58n6/DKE1RdJdzfFDAkZ73mFe7ph7hN5IAQkMXsnkw5hR/zz
	 mMs1MvRjmQ/KzmuEUMixQ9FH0bo1uXL8hEScs9iSYpKb84U+pgRux1FRdKWURW+Lzh
	 DA/bHM0Rr9GDcOJqPNugJCHjt9cYl+IRLIqjCry0TF/pJxNuMtJHmirSBFv9uTcqxh
	 me6BvZfp2u6jA==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6D234401F3;
	Wed, 18 Mar 2026 23:59:29 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id BB75AA005E;
	Wed, 18 Mar 2026 23:59:28 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=c4nKu0zu;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00106.outbound.protection.outlook.com [40.93.13.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id BC38822042F;
	Wed, 18 Mar 2026 23:59:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doh2QpUK0ijImZNkfXlHNuVAbrqDDGUPrt8vasmW9GfqQPu8uYp8wNwdN1qpRZjs3DMOeMC5+pMttr54ttRAB+53bjo0QYvAfyVHbDXZwTwz6pRyKU1ObBny/gJna2oXpA+2mDM4w2gPb7zlKOb19uAv6E5fJ1phNYchPdWb+wzBeAKsIbNalbxrt6wO6j7aB5rD02SwQgmwnd2QoolqFsID6EfhqQiI0QX0ISTef6MuUyGWlSnwfbDTCsp9RIWNys/5mx4/ZiSxm8mqH1O0kSR4Q8J9XEPfgQTncQnOlU6s0/liD4BVzWglMlbqHA+T8R5NJ1UUE87DpVjhOy/0bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCTQMMBHU7Tmrr0XzFXOfKGqMWKHJnH6Mlee01BB3Vs=;
 b=rKt6oVeNAw8A1hxm8Ao4CQ32qWgLWymbBhCrYv+XuQXe4VcIPWbPuf3fcfcKvS4eV8BqdnHjRDxuG7BOLFErrp294wwt6E8MgmhwuW4YYs+/6bYHgxHPL69E7vOji825yrS4TE2LyBBRPDWXE9KOP6Y7R2gfSmK6V2GT0KlE+2vaI8MH55iXoiO1klgOX6b1oEjXTHRPB9Q+2iv+rRkB1r6oBxpYIlWNB9BdFnOD/8wCrn4BOF5OQ5VDAB7LaTgGDo93DXrrXGz9DoDSuy3izmaWTBSiuPBvdNUw4J/wVgDx/8imT/KiOCbY03eb8Hg/vA4NqauDsJSx+PowpucaSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCTQMMBHU7Tmrr0XzFXOfKGqMWKHJnH6Mlee01BB3Vs=;
 b=c4nKu0zuGx6iGNxqQsqL9fr8tp670LfwHgtkGUBygZPvddQVOKG8a5l8Ctj0nAjYi7CwP3jfFRQ2oANx2JDQvZs+E+jFu6lXDmwzYier3M87Gu9UchpZPKQKGYrQmUwmXoy02UpbUHGNgwjxBwOo2mbNJykvYjyDWKeSe+dV4Fw=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB7820.namprd12.prod.outlook.com (2603:10b6:510:268::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 18 Mar
 2026 23:59:21 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 23:59:21 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Michal Pecio <michal.pecio@gmail.com>,
        Alan Stern
	<stern@rowland.harvard.edu>
CC: Oliver Neukum <oneukum@suse.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        =?utf-8?B?QmrDuHJuIE1vcms=?= <bjorn@mork.no>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Thread-Topic: correctly handling EPROTO
Thread-Index:
 AQHcsij3bm/3l4J2S0+poPtO9iFJorWq8pYAgAAa5gCAATtij4AATvwAgAB6AQCAAEFHAIAD0b0AgAARygCAAAy8gIAALjgAgAAhdYCAAT4QAIAAHoaAgAAczoCAAQmZAIAAg+gAgABA74CAACdBAA==
Date: Wed, 18 Mar 2026 23:59:21 +0000
Message-ID: <20260318235920.ioek26hdr25rkksp@synopsys.com>
References: <437037d6-3fe1-4f81-b74a-21bea00725e0@rowland.harvard.edu>
 <0b45d0e4-53f8-4960-b41c-63639b496dac@suse.com>
 <4f8b9942-307b-4c31-86f3-1b7b20b34a16@rowland.harvard.edu>
 <d1674f98-cbbf-4a16-8c76-996a0494d931@suse.com>
 <abcd2076-c2d4-403d-8ab8-af747b335075@rowland.harvard.edu>
 <87a692e2-559a-4765-8321-a422751d3589@suse.com>
 <4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
 <8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
 <b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
 <20260318223851.1f6d07d7.michal.pecio@gmail.com>
In-Reply-To: <20260318223851.1f6d07d7.michal.pecio@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB7820:EE_
x-ms-office365-filtering-correlation-id: 6ec6cbf2-a769-4dcb-b446-08de854a5fad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 cN6ZRYJzdjsudA36j17ESFhLQwrQ+XoTmzgU2QnRgiDj8gqu8ZROEgj1OCo7HQfidoo92Su63Zs1I5wz17UnPhaN35JXEe6dHKrSQ9kzWaLz0ciMoiw+Y+jbxyv8fGMPyp9sfR3QdJ0ko++yRztLZ/RrVKhgbayORoG5Y230da2/Qof123waUmdybTxbIJyRBNadUMds8+Cv7/IsRjQYyrrI0aVo1AkQyL0rKcgxchHRYrnHXXnI4FDr6dVtrwg+fMYAMCukedF1eahSHEC3+LzskJCNy/5dyWxHq+9YgsUzuIUQ5lbZcqZk3L4tdmBFHcLsY2XeZCt142cmW4pvIHKm1Pv1dA+pJmkM6IeVsA8hX4oK9c9wc1XvkVfyjiW5pgygzEbuiwsfrDvbpNk7CgWQuUFOeKW2nD219aWXIwwoh9GFIAeL90cgjs0bK/pWwqufcxJYQucp3RpGingIT+S061MuD15u7DdD9XcRF4jBLTsgRnD06t/DntX5iaVAgGIkIwSNcTKIJvYNZhFl8wDHlxfaL3vV4FtSeTBK0MjtIFlZAWT3cVVgzW5yXDGYIy51K8NdJXRgoZdKOA0kab1V0pIpllKX26XtoQ8yZBbJQgyu/Tm4e9yFAX79urpmC7vaHRh9SExbkpkqG7gvSVAQ7on5aEZGBlD+3vu29lZweksvMLZzNfyj7VuQJGT3fsi0YvhfkgreXXPPqfVK96mfNAX3ty/lmQ6orhXDYfD12FalnG+/jxAPkbxNDaWZqbtg3xhvd6l7fyd+CDvryeZ1C5ZQnqSjvWdgACBh7X8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TzZKcE5UaFBRWkQydWt1aUM2cFBvd25BdWJHbG5aRGJKcFNZZEhybEtTUFZo?=
 =?utf-8?B?bGtuNFVtUGVLVnllZUJtREFsbzhqSW1TS21nZ2g0VnlqaFI4UC9NdUtUVVhO?=
 =?utf-8?B?VTlDandwNkRsNlhqNlk3NGhWcnZEb3JnVnBaRVlIbkVCSXU1UnY2T09kWFlz?=
 =?utf-8?B?ZWhyVGp1cjZXelpHYld4UEFTRHZPSEZlaGVXaHBQZFErUXNadXF3Q0ZRSmhV?=
 =?utf-8?B?UUJDMSs3R2VPRUhjaTZtTzV2TjM3aGQ3eWtYRThxWE1pM3J0QzlNL0I1ejJT?=
 =?utf-8?B?ODdqcWVzaG9qQlpkNzB3clNpd2N1bWZzWWNQRktkLzdLMTUwcGtaK3VSZXRh?=
 =?utf-8?B?Wnp6SEIybk5jTEU0cXpWK2FvOHRWN3F1anR4aEZpZXRwTlVqWEJvWGZrS2Nm?=
 =?utf-8?B?RnBRRTVzREwrUlhmQ3pzbzBQdUpSMTFrV1NTMHZLcFRUd0x6dWlzK3Y4ekZw?=
 =?utf-8?B?QVNWVTRBM09CZVJUZHB3L01tTjE0R1ZiR1hNSGJMa1dIWlN5cGY0MVdsb1RB?=
 =?utf-8?B?dDRZVnJjS3VualUvTHZjNHMyZFRtK3JjSWovaTEyR3FvNTh5Qmt4cGpPano1?=
 =?utf-8?B?TTJFYnhNOFRhb2JQdVB6NFhySjRpZ0dmSFFJbUplNDNwQmpXSEhkcGVPbVh3?=
 =?utf-8?B?VTZLdnY1b1BzcitEaDBHZkVXbTBtY2NCNFpKTXFDd2dZT2NYeVluOUhwRXM2?=
 =?utf-8?B?TDZyY0RyekFUU3h0TWRyQ1lrVnZsN2RNWTRDZzl6aUxQNW9mZFk4UEdCZURj?=
 =?utf-8?B?QytWZDFQaHJHRVU4UHhETG84Zm1UUWx5Q2FNOVhRcjNGMEtoY0FxeElhRkF6?=
 =?utf-8?B?TjhDL2lqWWxzWktmbGZ5Y2JFeXVaT3lqUXdyNzdhUnNDemtjWkMyUE5sVlF0?=
 =?utf-8?B?MmdmTUM4WllKanp2Y1BiVndYRWhucFduOVM2Y3NETDJhbUQxNHlRODljd2Nu?=
 =?utf-8?B?R1MwSkNNays3N1ZGby9LeTZvMjFid1hnOFNpQ29QQUo4N292TUIxM2NPN2Mr?=
 =?utf-8?B?R1Q4cmg0SVgwbXgwcTlJWU9ITmpIbndJcklyUS94VWtZaVBWYXoxcnU2bWVO?=
 =?utf-8?B?enpudlZ4M3pnR2QyNklubWtsbWtyUWdhZlBCc2FaaUJXWDNubmNWWm1NRm11?=
 =?utf-8?B?WS9YYXcyYUFZZmtuN3R1NkloOFRSU09Ldk16VUhRSmJXaDAwQ01xSTlBTGtn?=
 =?utf-8?B?MVMzelpxcDliWHJ4ZXhxTVVDN1hLYTZGTFM3ZUVQUnpUUHFhMUp0UkhoUXZY?=
 =?utf-8?B?eURKTVA1dUEvaHczVy9MMnV3S2YvbXR0YWJCVWhTWjd5cjZJOGM1aWpwY1ll?=
 =?utf-8?B?c0h5OWpUNjRvQjVJWkhwYTRDRU0xOFBxWTltR0xzQ2NYRTUrc1RWc3Q5aDRC?=
 =?utf-8?B?NjlPekZWdHpBaE1wZHhCMVRtUTE5U2dZN21mVkdmL3BkYlZkbkN1THZsdm5H?=
 =?utf-8?B?Lzl6MlArMmIyRFdWZ1c2R29oNStIYlgvYUFNVUkxQlVQdW94VW9zQXVKTEl1?=
 =?utf-8?B?dVBaVVovK2wzWGFleWZmQ3VaS0xxTU05TGJrUE9jOTZqcG54NGpJWVMvRisr?=
 =?utf-8?B?aXk3eGZwVDA3Yng5ems5ck0xWW9IRng1SDVMRGZLeSswOWFjdUh5TzMvUUo1?=
 =?utf-8?B?bkNpMEhTeGtFdjBIRU9SRk9tNGw0dzN4VTVRT1ZXN2EvaDFUQjR5VDdWSmsy?=
 =?utf-8?B?eWowdFRUVGpPZHd2TlZlRFgrV1RhbkM3NjVPeEE4ZHh5ZTI4OERwem9pbTFT?=
 =?utf-8?B?dGkyMlErRVEwYUw5TUxVZVp2elBoQzBRU1REakdxM2FValp2WmdQVVBETlU5?=
 =?utf-8?B?YXkxZDVaSVF2WlpTY1gxeGlXQ000RnA0SEMxc2xIVkdDUXlyeVRrMWh2Ykg3?=
 =?utf-8?B?VzdLVkUyYWtuNUduNlBNbUNadXJXdWJKWFVDeUUweFQ4OFhOR21lU3NtSUMy?=
 =?utf-8?B?MnRYcTlEKzdwZ2Z5bndzYjBMMjNBSkpMK2RsTU1YMWt1K2h6a25McytQa0tF?=
 =?utf-8?B?S0hMYnBvYzR1L2tQUThLaXhLMzduZitRUWJrQTdsOVVIeEdwaDRHck8rUzNI?=
 =?utf-8?B?Sy9veUd3UXpLYnZOVnZXTFVQc2piRGh6MkdlYzFUZCsvbFJIK2ZoVzh5aHdM?=
 =?utf-8?B?MVB5clRTTC9UZEF1YnRyT1Y4QWJiNk5oNXJrWmVrM2tvMTJwMmE0RjdBSm84?=
 =?utf-8?B?OVBCYWI3SUpCUHNtSGlmOWJRVFBLWm9aOGE1WDd0bE0wZUpqTFNGWUNPU2Yy?=
 =?utf-8?B?QnpSQy9tc2QxMlJxU29yeEZrT3pSbmlsczJNUGVMa3FrdFZtNjdEamhpRTdD?=
 =?utf-8?B?blFETjJXNDVxN2ozQUVhZXA2N2xjRlJuazZuQkpXc3hud3U3S2phUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90EE1BFC48012C4C9C1565DD9A0276E8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	IJy8L73YTzKQOHNEEu8GgaS6o3q4b46qqNgMX4jt4Ehxo9+l4gFzva3JVYjpVSWTMAF5NL96TJpT5FbzLyPPW4lnxd1KUGnCBU5fCOEE857C/XEN1GPmYm31aVbt57JVRer/9JMROy29bpY7iWcnsD+fTvhbFj4msmds9j3z9B4YuY2eT+Av6CjcpX4rGhh2izQJZ1HgMG+9s+UhDvIeubWIz7g2KTxX2ggCEWzY0vsNQOP0mqR/CaHaesoMEukxbvgMitDXEqhvsBlj+HIQAENcv+CGYHhfZvKLkkjb/aBHMaIhEgyGoBhMAHFB6I/OpB7Vofn/umJvZyfOfr+cGA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V5XeDatOTh3cTa/fROBmSf/hX6KfE+x3u+IvGrhqS+lrL8bCgUNe1lC3fPN4oygpYdqiiqdQc6m6jDXzdeau9gm71F+sE+IGVHYYOeTEwOWIuL88/4RJXxWJwv8mlcBisjbRz0pa0VbPu0TfLvIFeh2A+mVyUeULGsSfiVLA2j35C0OuBJOFdKKdOOQMLoiSQ+EJUdIHnB3wIb/x7DPaY/XxEo4XhRMzi4mAFimxLvOJp6u8gTAV2262TBK3yqlJyE98oH0FkO/siLyonKu+dEZusbskhaHdzAaodJgidjFLV8G6YQfrxcgKta6bz/vC96G9UiPFLckg+Kblct9q1b6tFfvZ1DRJxtsZz59EPEba8+8Eq0U7dog364M8duenanfZBcBYFW25lYFsHVmQXtpkEns+8hbTIVOmk1NrzwibtUxGgs1p3/1vEkvO5M4mPKHlS7HpSJTYQab04sf6L2zFKz/2QU3xQIHFERTMbz6wIEjs1ysVaBtEkxGTVOWPDZ3QBkeq8wXSWS/cgpK8uU4Ok3k1Q6FUMyD6YaL6LgVQyxHgjQoRC24oQt4hZxrPSfeZULH3xx8SB4MJlQEa/7jI9WmnBW2owmT2fRE8pVIFToVkycDz2hnQaz/WibgUKo/m3nntTnsb+eqNZAr0Cw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec6cbf2-a769-4dcb-b446-08de854a5fad
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 23:59:21.2383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9sA1awOKmTHyTnBCCrCLCj7lQntfkKarcsEzw7NmkAnofx3/OMvLsPy8VH0OKY2SZ6aX8RLek3cYaS/dmzdMmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7820
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDIwNyBTYWx0ZWRfX4aHC/Sdi6W07
 ca7QCsp3n1RYNEVvg3b6TxKjwbyCa7CoLfk3+FMuY7jT9G75azkkM0OdgsDlyziOWvqoEXEBDXg
 +Y39bcVbUbJNHwC0ZUj44N3HHZx7AjWZ3vqcvVt7OHMh717wjWddt7iUOWuOBY1e36xm7v4YLRt
 GszFxu9UWN8EdCL75rwClKDaKgualWVY86w5K0TasBAJhXd8LTk/f+wMAsyp6ZYm1/SDDixo+gS
 1de6pCMSODu+GBRjQxDeEcDNWvskpYVUft/81sSEJrxT5cmbdZq9uq1r+YLzh1AgpbK9NCRAKA6
 aDJkKypMbath3s60EQeTEQT5vncCxMnzu1V4R1YEF+VyvugGk2W6TzFfqo5jtwg4xaZVSkjfKAQ
 dmYkAq3EE2dxwRnle20gmF3eulnMVVcopkFB63tLi12dSziEZiTYW8bISe7LSV0eLSqNbLXykid
 fV1s5PyrxII6XHfopcw==
X-Proofpoint-GUID: AxvA-xR2MklsYt7PzdgR2ptDzZYZLUZM
X-Proofpoint-ORIG-GUID: AxvA-xR2MklsYt7PzdgR2ptDzZYZLUZM
X-Authority-Analysis: v=2.4 cv=arK/yCZV c=1 sm=1 tr=0 ts=69bb3c63 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=Dz7mZhUQ6szD_Sa09_wA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603180207
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35087-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,rowland.harvard.edu];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D19242C3FA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBNYXIgMTgsIDIwMjYsIE1pY2hhbCBQZWNpbyB3cm90ZToNCj4gT24gV2VkLCAxOCBN
YXIgMjAyNiAxMzo0NjoyNiAtMDQwMCwgQWxhbiBTdGVybiB3cm90ZToNCj4gPiBPbiBXZWQsIE1h
ciAxOCwgMjAyNiBhdCAxMDo1NDoyMEFNICswMTAwLCBPbGl2ZXIgTmV1a3VtIHdyb3RlOg0KPiA+
ID4gT24gMTcuMDMuMjYgMTk6MDMsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+ID4gPiA+IFlvdSBrbm93
LCB3aXRoIGEgVVNCLTIgaG9zdCBjb250cm9sbGVyLCB0cmFuc2FjdGlvbiBlcnJvcnMgZG9uJ3QN
Cj4gPiA+ID4gbWFrZSBhbiBlbmRwb2ludCB1bnVzYWJsZSwgYW5kIGNsZWFyLWhhbHQgaXNuJ3Qg
bmVjZXNzYXJ5Lg0KPiANCj4gRGVwZW5kcyBvbiB3aGF0IHlvdSBtZWFuIGJ5ICJ1c2FibGUiLiBJ
ZiB5b3UgZ2V0IEVQUk9UTyByZWFkaW5nIGZyb20NCj4gYSBUcmFuc2FjdGlvbiBUcmFuc2xhdG9y
IGFuZCB0aGUgVFQgZGlzY2FyZHMgdGhlIHBhY2tldCAoYmVjYXVzZSBvZg0KPiB0aW1lb3V0IG9u
IEludCBvciBieSBleHBsaWNpdCBTVyByZXF1ZXN0IG9uIEJ1bGspIHRoZW4gbm90IG9ubHkgaXMg
dGhlDQo+IHBhcnRpY3VsYXIgcGFja2V0IGxvc3QgYmVjYXVzZSB0aGUgZGV2aWNlIGdvdCBpdHMg
QUNLIGFuZCBtb3ZlZCBvbiwgYnV0DQo+IEkgc3VzcGVjdCB0aGUgbmV4dCBwYWNrZXQgd2lsbCBi
ZSBkcm9wcGVkIHRvbyBkdWUgdG8gdG9nZ2xlIG1pc21hdGNoLg0KPiANCj4gR3JhbnRlZCwgRVBS
T1RPIG91dHNpZGUgb2YgZGlzY29ubmVjdGlvbnMgaXMgYXBwYXJlbnRseSByYXJlIGVub3VnaA0K
PiB0aGF0IGEgaG9yZGUgb2YgdXNlcnMgZGVtYW5naW5nIHRoaXMgdG8gYmUgZml4ZWQgaGFzbid0
IG1hdGVyaWFsaXplZC4NCg0KSSd2ZSBzZWVuIFdpbmRvd3MgZHJpdmVycyBoYW5kbGluZyBVQVMg
dHJhbnNhY3Rpb24gZXJyb3IgcmVjb3ZlcnkNCnRocm91Z2ggY2xlYXItaGFsdCBhbmQgcmV0cnkg
U0NTSSBjb21tYW5kLCBhbmQgaXQgd29ya3Mgd2VsbC4gSSBob3BlIHRvDQpzZWUgdGhpcyB0eXBl
IG9mIHJlY292ZXJ5IGltcGxlbWVudGVkIGZvciB1c2Igc3RvcmFnZSBhbmQgdWFzIGRldmljZXMg
aW4NCnRoZSBmdXR1cmUuDQoNCj4gDQo+IEkgZm91bmQgc2ltcGxlIHdheXMgdG8gcHJvZHVjZSBy
ZWNvdmVyYWJsZSBFUFJPVE8gYXQgbG93L2Z1bGwgc3BlZWQsDQo+IGJ1dCBubyBzdWNoIGx1Y2sg
d2l0aCBoaWdoZXIgc3BlZWRzIHNvIGZhci4gSXQgd291bGQgYmUgaGVscGZ1bC4NCg0KR2V0IGEg
YmFkIGNhYmxlLCB0aGF0IHNob3VsZCBoZWxwIHRyaWdnZXJpbmcgdHJhbnNhY3Rpb24gZXJyb3Jz
LiBCYWNrDQp3aGVuIEkgd2FzIGRvaW5nIG1vcmUgaGFyZHdhcmUgdGVzdGluZywgd2Ugd2VyZSBh
YmxlIHRvIHRyaWdnZXIgdGhpcw0KbW9yZSBlYXNpbHkgd2hlbiB0ZXN0aW5nIEJPVCBhbmQgVUFT
IGRldmljZXMgYmVoaW5kIGNlcnRhaW4gaHVicyBhbmQNCmRvY2tzLg0KDQo+IA0KPiA+ID4gPiBJ
IHdvbmRlciBpZiB4aGNpLWhjZCBjb3VsZG4ndCBiZSBhZGp1c3RlZCB0byBiZWhhdmUgdGhlIHNh
bWUgd2F5DQo+ID4gPiA+IChpc3N1aW5nIGl0cyBvd24gY2xlYXItaGFsdCBpbnRlcm5hbGx5LCBp
ZiB0aGF0IGlzIG5lZWRlZCkuIFRoYXQNCj4gPiA+ID4gd291bGQgbWFrZSB0aGluZ3Mgc2ltcGxl
ci4NCj4gPiA+IA0KPiA+ID4gSXQgY291bGQgYmUuIEJ1dCBkbyB5b3Ugd2FudCBhIEhDRCB0byBn
ZW5lcmF0ZSByZXF1ZXN0cyB0byBlbmRwb2ludA0KPiA+ID4gMCBvbiBpdHMgb3duIHdpdGhvdXQg
Y29vcmRpbmF0aW9uIHdpdGggdXNiY29yZSBvciBkcml2ZXJzIGJvdW5kIHRvDQo+ID4gPiBpbnRl
cmZhY2VzIG9mIHRoZSBkZXZpY2U/DQo+IA0KPiBJIGJlbGlldmUgdGhlIGludGVudCBpcyB0byBt
YWludGFpbiB0aGUgaWxsdXNpb24gdGhhdCBkcml2ZXJzIGNhbiBqdXN0DQo+IHJlc3VibWl0IHRo
ZSBmYWlsZWQgVVJCIGFuZCBoYXZlIHRoYXQgYmVjb21lIGEgcHJvcGVyIHJldHJ5Lg0KPiANCj4g
SXQgbGlrZWx5IGNvdWxkIGJlIGRvbmUsIGJ1dCBpdCdzIHN0aWxsIG5vdCB0aGUgc2FtZSB0aGlu
ZyBhcyBvbGQgSENEcw0KPiBhcmUgZG9pbmcgYmVjYXVzZSBpdCBvcGVucyB0aGUgcG9zc2liaWxp
dHkgb2YgZG91YmxlIGRlbGl2ZXJ5LCB3aGlsZQ0KPiBjbG9zaW5nIHRoZSBwb3NzaWJpbGl0eSBv
ZiBmdXJ0aGVyIHBhY2tldCBsb3NzIHNwZWN1bGF0ZWQgYWJvdXQgYWJvdmUuDQo+IA0KPiBRdWVz
dGlvbiBpcyBpZiB0aGlzIGlsbHVzaW9uIGlzIHdvcnRoIGZpZ2h0aW5nIGZvciwgd2hlbg0KPiAx
LiBpdCBoYXNuJ3QgYmVlbiAxMDAlIHJlbGlhYmxlIHNpbmNlIGF0IGxlYXN0IFVTQiAyLjAgYW5k
IFRUcw0KPiAyLiBVU0ItSUYga2VlcHMgY3JlYXRpbmcgcHJvYmxlbXMgZm9yIHNvZnR3YXJlIHRy
eWluZyB0byBiZSBsaWtlIHRoYXQNCj4gMy4geGhjaS1oY2QgaGFzIGJlZW4gdGhpcyBtZXNzIGZv
ciAxNSB5ZWFycyB3aXRob3V0IGxvdWQgY29tcGxhaW50cw0KPiANCj4gV2hhdCBzaG91bGQgYW4g
SENEIGRvIGlmIHN1Y2ggcmVxdWVzdCBmYWlscz8gSnVzdCByZWZ1c2UgVVJCcz8NCj4gDQo+ID4g
TWljaGFsIHNob3VsZCBiZSB0aGUgcGVyc29uIHRvIGFuc3dlciB0aGVzZSBxdWVzdGlvbnMuICBJ
IGd1ZXNzIHRoYXQNCj4gPiBhIGNsZWFyLWhhbHQgaXMgbmVjZXNzYXJ5IGZvciBzeW5jaHJvbml6
aW5nIGFuIHhIQ0kgaG9zdCBjb250cm9sbGVyDQo+ID4gd2l0aCB0aGUgZGV2aWNlJ3MgZW5kcG9p
bnQgYWZ0ZXIgYW4gZXJyb3IsIGJ1dCBJIGRvbid0IHJlYWxseSBrbm93Lg0KPiA+IE1heWJlIGl0
J3MgbmVjZXNzYXJ5IG9ubHkgZm9yIFVTQi0zIGRldmljZXM/DQo+IA0KPiBTdHJpY3RseSwgaXQn
cyB0aGUgb3Bwb3NpdGUgLSBzeW5jaHJvbml6ZSB0aGUgZGV2aWNlIHdpdGggdGhlIGhvc3QNCj4g
aGF2aW5nIGFscmVhZHkgemVyb2VkIGl0cyB0b2dnbGUgb3IgU3VwZXJTcGVlZCBzZXF1ZW5jZSBu
dW1iZXIuDQo+IA0KPiBTdWNoIHRvZ2dsZSBtaXNtYXRjaCBhdCBVU0IyIHNwZWVkcyByZXN1bHRz
IGluIGxvc3Mgb2YgbmV4dCBwYWNrZXQuDQo+IA0KPiBBRkFJVSwgU3VwZXJTcGVlZCBzZXF1ZW5j
ZSBtaXNtYXRjaCBpcyBjb3ZlcmVkIGJ5IFVTQjMgOC4xMSwgd2hpY2ggc2F5cw0KPiAiZGlzY2Fy
ZCB3aXRoIG5vIHJlc3BvbnNlIiwgc28gbWF5YmUgd2Ugd291bGQga2VlcCBnZXR0aW5nIEVQUk9U
TyBkdWUNCj4gdG8gdGltZW91dHMgd2hpbGUgd3JvbmcgbnVtYmVyIGlzIGJlaW5nIHJldHJpZWQs
IGJ1dCBub3Qgc3VyZS4NCj4gDQo+IFJlc2V0dGluZyBob3N0IHNlcXVlbmNlIHN0YXRlIGlzIG5v
dCBtYW5kYXRvcnksIGJ1dCB0aGUgYWx0ZXJuYXRpdmUgaXMNCj4gaW50ZW5kZWQgZm9yIHJldHJ5
aW5nIHRoZSBzYW1lIFVSQiwgbm90IGFub3RoZXIgaWRlbnRpY2FsIG9uZS4gVGhhdA0KPiB3b3Vs
ZCBiZSBhbiBlZGdlIGNhc2UgcG9zc2libHkgZXhlcmNpc2VkIGJ5IG5vIFNXIG90aGVyIHRoYW4g
TGludXguDQo+IA0KDQpUaGUgcmV0cnlpbmcgb2YgdGhlIFVSQiBvciBzZW5kaW5nIGEgbmV3IHNl
dCBvZiBVUkJzIHNob3VsZCBiZSBhDQpkZWNpc2lvbiBieSB0aGUgY2xhc3MgZHJpdmVyIHdoZXJl
IHN5bmNocm9uaXphdGlvbiBhdCB0aGUgaGlnaGVyDQpwcm90b2NvbCBtYXkgYmUgbmVlZGVkLiBB
biBVUkIgZmFpbGVkIHdpdGggLUVQUk9UTyBtYXkgbWVhbiBzb21lDQpwcmV2aW91cyBzdWNjZXNz
ZnVsIHRyYW5zZmVycyBuZWVkIHRvIGJlIGRpc2NhcmRlZCBhbmQgcmV0cmllZCBhbHNvLg0KDQpX
aGF0IHdlIGRvIGtub3cgaXMgdGhhdCBhbiAtRVBST1RPIG1lYW5zIHRoYXQgdGhlIHhoY2kgZW5k
cG9pbnQgc3RhdGUNCndhcyBoYWx0ZWQsIHRoZSB4aGNpIHdvdWxkIG5lZWQgdG8gcmVzZXQgKG5v
dCBzb2Z0IHJldHJ5KSB0aGUgZW5kcG9pbnQNCmJlZm9yZSBpdCBjYW4gYmUgdXNlZCBhZ2Fpbi4g
U2luY2UgdGhlIGJ1bGsgc2VxdWVuY2UgaXMgcmVzZXQgZnJvbSByZXNldA0KZXAgY29tbWFuZCwg
d2UnZCBuZWVkIGNsZWFyLWhhbHQgdG8gc3luY2hyb25pemUgd2l0aCB0aGUgZGV2aWNlIHNpZGUu
DQpUaGUgcmVzZXQgZXAgY29tbWFuZCBiZWhhdmlvciAoYW5kIHdoZW4gdG8gdXNlIGl0KSBpcyB4
aGNpIHNwZWNpZmljLCBzbw0KSU1ITywgaXQgc2hvdWxkIHRoZSB4aGNpIGRyaXZlciB0byBoYW5k
bGUgdGhlIGNsZWFyLWhhbHQuIFdoaWNoIFVSQihzKQ0KbmVlZCB0byBiZSByZXRyaWVkIHNob3Vs
ZCBiZSBhIGRlY2lzaW9uIGJ5IHRoZSB1cHBlcmxheWVyIGRyaXZlcnMuDQoNCkJSLA0KVGhpbmg=

