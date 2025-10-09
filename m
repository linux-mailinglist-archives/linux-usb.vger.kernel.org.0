Return-Path: <linux-usb+bounces-29064-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4910CBC7204
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 03:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36998189C677
	for <lists+linux-usb@lfdr.de>; Thu,  9 Oct 2025 01:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B154317D;
	Thu,  9 Oct 2025 01:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUvnOXKg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F4A2F5E
	for <linux-usb@vger.kernel.org>; Thu,  9 Oct 2025 01:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759974344; cv=fail; b=R7RaS3SUcD9qDk90J+A2oHh+o73b0raEIXa5G89Mt/K82YGtxD8zOSq9YhjPVYe1TWmre+1mT0YzQ566SMrj+acL2Sc6UF1xQWYA+MLvrrVW2wduMJEhHuPqXIVf+v2TTaMcoQ8aUg27FjDBbQqntzkQ2JPeZeYrXRt/J8rXjp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759974344; c=relaxed/simple;
	bh=w7w6uaaW6zsWK2g8OUCznocQn9TVDYCQDfz2K4xFVH4=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TZEG3l/FCapcTGtPhD/CVYcBoG+5VetbYC6N0H5oOxPQ83MPAEFrWVZTStRLJUiZr+7krTVdNlimoUXSVowNjIrOrMzPaG8pWPf5RojhOnUp7rDLHUYpfg6vWUkAAs0oBfE0sQ80sb43oudk8BgMFz+MCrW+JxtpbiAb7hBs+6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DUvnOXKg; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759974340; x=1791510340;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=w7w6uaaW6zsWK2g8OUCznocQn9TVDYCQDfz2K4xFVH4=;
  b=DUvnOXKgJyVCPVKpSVsIlMV+PwXyNBalcgxPuSL3MmAsl7xgb7gEARvD
   fo/3g07yiv2I1D+PT45/hetrHQMffei3Kf2nBIsTq7j9ln/L+E3ThigJz
   df6iD/6p2qtFs3+ZYztG/tyAwc21pB07vkRXSJY1+k34q1fQlu2pnBmXP
   ccMjON2zFSUu69WxqjSTJEYFsPeVofojkrDVDspOyn+jFX0icPChnj3bI
   wtIqtT7JjFv6YxIYszEzTRbxIchHX0NK//emluVVSyAYDu3a0IK9OOYXl
   9QmFU9+btsH2Ri3dqHJnKtjiskDcJKZdAzCc+AJJGbjGnFDL74kfiWUOJ
   A==;
X-CSE-ConnectionGUID: i2o21+MRT5qKewkDPcwa8Q==
X-CSE-MsgGUID: HLHru28HQ5eCBlP0UE6qkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61214871"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; 
   d="scan'208";a="61214871"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 18:45:39 -0700
X-CSE-ConnectionGUID: SqYH0ik0REygcVhr8OZCow==
X-CSE-MsgGUID: K6FQ1EfkTqKp6iEd16ZlwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; 
   d="scan'208";a="180517761"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 18:45:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 18:45:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 18:45:38 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 18:45:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VySulOW1sDPaxNLlxLcOK7YLpF/HXoq1k8mjPh0QVGaWyXgmJeDsWGKHQOqHE6ZVaCxepEgwEBwM9JO2Uz5ysECpMLAL/A1GswjkLp+t9G3otQNtu9aCpbXWZ4pgQrysrtx58PpbnKRIDnL8Q9NxomrsNP1Z6zKIo0zwQniu1TPvf/bW9YGN3G2ASi2CxPoZEEq6SYsWHTrMtU9+gHmxEUToLWU1ZKWCaK5GB31jzqdcp7m62LzJuQ00hzYTtLnKL+zQTmFq+UW4gi8w8cd2RSmZW5SRIgBUsBjxCIFyYqIG429vS5Cn73cWwLOyeIIy8zSW9iHNoIr3/BFE015Whw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7w6uaaW6zsWK2g8OUCznocQn9TVDYCQDfz2K4xFVH4=;
 b=Dxp5MepLWYXOzy2Y/gKgyn9anhJ7Ua0Sfxfhpo0MuI2clms2Uu6eATgNqkppWZGCRayhrxSJrMd+uk56oAzUGftDwfwRj5W7pak9Aiu71k5d3zfS/H+AxTGGZJm6KZVNSZiz6+g155ymUUCrUkMmeh8wVbGfOZQzjyLj28EBxewrL9ujrsSGLvbSiODI1npA+fvWxQkYn6B+mjeq4KYp6CDgvUXdjL8E1s6qIz+hHpDMP4Gm048amAdPcTuIF1lnpeDMn2v96tHgwQzsatP2S3as/DO2mSO/rNeEbut3sMILMCseGc33wIjBKgIFO/TKKGSXZ+g6xYvpFgjFKkfOng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF11A2D5672.namprd11.prod.outlook.com (2603:10b6:f:fc02::b)
 by SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 01:45:24 +0000
Received: from DS4PPF11A2D5672.namprd11.prod.outlook.com
 ([fe80::458e:ba67:2c31:d3cc]) by DS4PPF11A2D5672.namprd11.prod.outlook.com
 ([fe80::458e:ba67:2c31:d3cc%8]) with mapi id 15.20.9182.017; Thu, 9 Oct 2025
 01:45:24 +0000
From: "Cepeda Lopez, Israel A" <israel.a.cepeda.lopez@intel.com>
To: Hans de Goede <hansg@kernel.org>, Peter Robinson <pbrobinson@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: misc: Add x86 dependency for Intel USBIO driver
Thread-Topic: [PATCH] usb: misc: Add x86 dependency for Intel USBIO driver
Thread-Index: AQHcNwnL8YMbg+oTKk6PQshL0rnG27S2c/IAgAKaYNA=
Date: Thu, 9 Oct 2025 01:45:24 +0000
Message-ID: <DS4PPF11A2D56721B45B46D68AACEB28D6EFAEEA@DS4PPF11A2D5672.namprd11.prod.outlook.com>
References: <20251006213957.15668-1-pbrobinson@gmail.com>
 <041e461f-8fec-41ca-a971-2c8a46cbfbbc@kernel.org>
In-Reply-To: <041e461f-8fec-41ca-a971-2c8a46cbfbbc@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF11A2D5672:EE_|SA1PR11MB5899:EE_
x-ms-office365-filtering-correlation-id: 310f7721-639c-4683-e870-08de06d58414
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SURXQTJLUXE1c3QwaldlSHluSUdxa214Smltei83eWFOTU96MGZXRkhLMXdG?=
 =?utf-8?B?TFQyTFphRTE5aDJyUEVrZktnUWZnV01MSnduYWxOR1hXbDJwdGlmSjRNMlVk?=
 =?utf-8?B?OHFGYWx3ck9hVUQ0aG9lMnZ5WnhaR2RxTnVjTGZCS0FSN2RDMnBZdVJYTy9J?=
 =?utf-8?B?Ukx4Y2lBbzZjejJDSko2MEdEZGo1ZU93c0VMQVhJa0EySmRyNlFsS0FmS0hv?=
 =?utf-8?B?amVVNnBxRURWNm5lT1hpQkJNM1ZXcnloM0ZlM2U1Tm1UTzlmbXY1Qi9CRU5T?=
 =?utf-8?B?UlRRNW8vb3B5eWJWcW1BWlhPRmorQVdqOENrRGFQMXd5NHNyRmdTd3YvMUQr?=
 =?utf-8?B?MjJETVU1dUJLODZCUUVyanJKdUVMMElYSDhmVkNPUng1bWV6NFJBVis2ZDVi?=
 =?utf-8?B?ZHdUNEtLbkh2RjdkM1QxbW5BRExjcEtvM3hrL1F5WG1ETmZ5elFtdThsMjdq?=
 =?utf-8?B?aHRPZ3l6YU5hbzNmcXhrT1NqV2RFZm9TcVJYU2paem9KZEJtUjhETmJFOVpL?=
 =?utf-8?B?eld0YUlSdnp2VEdPMU5VaUpzYis4aThOMkJ2SXg2VzBSbk82MzNucS9xbmNK?=
 =?utf-8?B?OFhmSUNwWFRxay9xbS9Ddm5lM3VDTmk5WHNqTjBINTJwNXdIU2xvYUF3eTQ0?=
 =?utf-8?B?aC9HK0tSUlhrZ05BVUJFSHdUUU4wQ0JLKy8yU2VMNDJqVXFNRENmUlZoODlj?=
 =?utf-8?B?L2Z1N0lrUnd5TFhCd2hkV3hrS3cxcmdJbDN4UXlBUVdNME1JQkVVTmdGRWZD?=
 =?utf-8?B?eTlQbVRHQ0wrV3hrV1U5VjU4blZ3VFlXQ1poUStsd1hFN2szeUZnQldlSVpW?=
 =?utf-8?B?V1d1OXdpL0l2SHdQaUVoZE1YZUYxc0kzVmVCbDZNZzQ4THQvZ1ZHenc5SDN0?=
 =?utf-8?B?TU9UQTdPME0zNnBEZGxYWDY4VnllQTg2VndPOVNTd0VHK3hMY3pOdTNPSWJ4?=
 =?utf-8?B?ZkZ1L2hjMFVoMXlFMjIwV0tMVldLZkJ3YUtoVUJ5K0EvYVM5MDJ5eitKTkRI?=
 =?utf-8?B?S2xzUkJCRHJEbkRhbUZUUkZ1SG9MWjF1eEk2eHVlR2d2eWRtU3VJZ0JBUTNJ?=
 =?utf-8?B?dDU2VnpDMVpjSHBKWXkwK1pLdXh1TUM3OSs2akpkMVhVUUE5WGxGS2J6M2Ix?=
 =?utf-8?B?UHpYTUpKT3Z3SDBsSW1DMC9EcFczUFRtbTdNOStzU2YyVWFKODFJTDNzYmV1?=
 =?utf-8?B?WmdGWUZVL0xFeVF5MW9GaGJMM3BJckZLRVZyME92TEplQmNha1lYVHplbTlT?=
 =?utf-8?B?OHVTb2t2ZVRwR25Rc1ZYRDNMSlUwc3oxYkVFemJCeC9jdVREc1ZLKzc0R2Fu?=
 =?utf-8?B?RTZMb0VMMUJUZXlVcjNPRHEvd3BIeVkzNEJuc0tTYkwySGF2alVKN0VORnFB?=
 =?utf-8?B?WkRuWGt5VEJCWFArTENwN0lNbitqbU03ZmdtL3JndUh6eWc0enJCZFZKUC9r?=
 =?utf-8?B?aWo1R3JQNUNjbjdPdnVMNmVkcU9pdlRzYlJ0QW9hTC9HUFFpWTRyYUtUVU9H?=
 =?utf-8?B?RmVlUVZydFlCTVBmcnptQWZEMGRiRms4K1BmeGhNNEhGUUV0eldZOUZXeFJo?=
 =?utf-8?B?RG50RWNLVW9COFFZQ3VnSlV4d1Q2ditzVUVCTnREamdwRUFQR1g1eDNJVTdh?=
 =?utf-8?B?THB0WFVQcDlLM21oWENsTWVtRlJXMmhWbzZ0WkhmYSs1WnBvZkVYWmpib0xs?=
 =?utf-8?B?M0M5WjBIM1dTSWRMSFBESjJiaDFMaWg1UFlaamdoc2JQQzUyK3k3RjJQZ2Jq?=
 =?utf-8?B?ZXJhSTZUa2JhR1RDbjJQdjN1RXN5c0pUcFZ2dzFiS3B4ZW9idi9lQlBkR1pu?=
 =?utf-8?B?UkhScGFrV0VYUnhIQUtKV0hCRWRnODlGNThoWVZDVnlBdDBBdUtneklxcXFP?=
 =?utf-8?B?aGJER1FLT1B0MWxlR0xlZnc2UGtIcWc4Rk5CR3VtcVVRVktLYlB1ajFyNzlT?=
 =?utf-8?B?TkZtb0FiSDAxL3NqUkYwdS9oT2hwMTU0V3FrUlZmeitYdUt6Tng5dmZlLytC?=
 =?utf-8?B?U2txMjUzOU5vTG5YQTc5a0puMzRBQVUxNzIyQUJRak1RNkZtbHgrWXVKQWJl?=
 =?utf-8?Q?gbY12T?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF11A2D5672.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzJ5dUtlUHlva2FDQnhsTUJGTFo2Q0lLT2IwWGdYYTVYSUpFSktCTmFqZkg2?=
 =?utf-8?B?R2xQbXRYQno5VU9LL2hHMFRRWDZqQlEwTnJ6S0RMR2RsN2FPajNzV3F4NXRQ?=
 =?utf-8?B?QTdLQVhsMXlaTnBjQUJYdEZIZU56eThFYnZZeVIyTkZ4dEtEQXhaKzZkb1g3?=
 =?utf-8?B?WFJXb09vWjlJeDI1UFVmS0Rwbk5sMC91NEpSdW5uQnNXTmVPT3VySHh1UzZk?=
 =?utf-8?B?UEVzOG1mbUhEWDYxRmVpSEZuaXozMWxveHc1L1FMRlUyL3BjZFFCN2NmQ2lv?=
 =?utf-8?B?SjlEL3hBTkhUNS8rQ0ZkYVpEZWZ2eE1wZzRHVGRqRHNYQkRLWGxBaDNJaVBm?=
 =?utf-8?B?TXZBUlNROHRBK2tscEt5QjZOQzRCRVREUXJhMzlLSHdXQWdHK09vSktXZUJU?=
 =?utf-8?B?emwvbi9qeHRmUWZKd1VuTXExMjhwUVlFclArOUhseTB6UFpuWDBGMUhjVU9Q?=
 =?utf-8?B?cjVZTTJ5LzNtdE1URjdrUXNyei9XeWNTa1IxOGsvWXRISnBJWlBUdEhaWldB?=
 =?utf-8?B?SlhZTUhzUTBNdjFxR210Q3Y2cm5mN2FGWHM0dTJQdGViVWVNUjlzenQxNStN?=
 =?utf-8?B?TXVZQjlOVy9KbURXbjVlTkx2enZyRFAzbkVIS21oSW40SU4wSFBKOXl4bkd6?=
 =?utf-8?B?QlpKY0V5dGNMbDNmRTNvY08vTk85Z3F3NCtLbmduVXh6NEhGdFFZUG5hcFd0?=
 =?utf-8?B?VG1Mc3BtWjhOcE1Wdlc0NzNCS2c4bDR0WUZoM3dLN3orcFNKUFBYVXZ6UFVr?=
 =?utf-8?B?dUo5NG1EREMyNXh1YWt6VzJBNTUyQ2I2RHNjZU4yLytVV0h5UVRPZEdMeERw?=
 =?utf-8?B?TlBOZTVHS2ppWnpUWndweUw1ZFA3a1l6alZJOG1KV3l2akYwOGFIOVlWUW9u?=
 =?utf-8?B?UDg1TnhiNDV3cHNOenV3MklpZng1bXFwcjNNN1NwUEpNR21ZK0pxM3YvSVd2?=
 =?utf-8?B?dmJnOFZZK0FaaHp6Z2FNbXZidlBMUnRmY0xsdVdkTlRKNUUzUXUzMlN5clVo?=
 =?utf-8?B?OHBDbXp0L0dCTThySWxmZGV0S1VOUGk2Q3pZSnhMU3ZMRTNmcGdWZUtkeHQ0?=
 =?utf-8?B?QzZuN1RpMlNaWktxODFqSUZiN3VsYTVGVTVkbHRBeWpKUXZoUXNBU0JWTHl6?=
 =?utf-8?B?YktQOG5FMzdLUUxkSzRxVjFVR010cGZTczlpblYwa0xXc1NaWGpsVlBUNVZi?=
 =?utf-8?B?aDZ0ZjM4blBYY0FMOW1wRGUwK1N0elFFcXZXVjhwMi9TQVM5U3BJbWZYV3RM?=
 =?utf-8?B?SGl2eFU3UDBQRFVlaEdqaDlVKzR2bHZZMXJHQlZ5OTJ5ZFdHQTVmZG9ENEhS?=
 =?utf-8?B?TVRQVi9KdzY0Q2xteGYyL0ZCbldEeGZQeGN1MkEvQXc5ZksyNGhSdVdIbTY1?=
 =?utf-8?B?UWtsRzhuLzUzLzF1RkN4Y1J5dW5mYVZ4Uno0RXNFT1lqVFRxMUsyNU00L3BE?=
 =?utf-8?B?bnlidUFBNi9SSEFZMm9lbktTOFQrcDBxRnB4SXBVdFFyOElUZEFSdk14c3A4?=
 =?utf-8?B?VG9wSHd2TEoxNXlvS21rRktZUmkzalh1b0pZVk1hQllLbnkyYnN5azlidHJi?=
 =?utf-8?B?aUt1SHZuRkNFYTgrUTB2WXM1NXBuYVVYZ2ovQVc5dkhzcmU0a2NwK2piYVFE?=
 =?utf-8?B?ZDRPamhUWDJOcWdqNTRZbjZ3UCsrVzNtWjRNQkFDQTlzRXRYRTNRMi9aZUhs?=
 =?utf-8?B?RUFsbTUzRlllOHJwc0tmZDRVclpsY1dvM0JvR2tDT012enNUeTd4WEdVZFh1?=
 =?utf-8?B?MC9QMTJaNDN6UkJ5cW1KVnZMcjMvcmpYdG8ralJMekxLVko5Y1hYdDBjTm5h?=
 =?utf-8?B?NmVZTTJEZFY2ZEo3YXV0L1lqSHU3OS9TV1FxVHZWRkpFT2JoRVlDVGIwcVIv?=
 =?utf-8?B?MWgzWUMvNCtWMFRMWUU3bGNwMXM4T2xPNnIzQm1TYjVoUVRuaVVHUVpLbkJQ?=
 =?utf-8?B?dVgvbktWWjgzVW1WcVNKZ1luU28vclRBcllOT24zUXBiQUl4SWJCM2h3WE02?=
 =?utf-8?B?cTJGV1NEMXkyWUVHWUsyam5GZlF0bW54WFlaVkw3L0RkTi95N1c0cnRxenhu?=
 =?utf-8?B?K1hmV3gydjVaYTBZVHZ2MWYrRGI2dlVUcmdTaGNweFdBTGQxVmxJSmlCVmdt?=
 =?utf-8?B?QytKSWFkMS9hMlNFWFFUZTdLVGdlbGNPcG9zSXpqb1VUcElZK1NHVTFkL3BG?=
 =?utf-8?B?K2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF11A2D5672.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 310f7721-639c-4683-e870-08de06d58414
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2025 01:45:24.6588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 437qiNUSFY320sQzXPqa85P9jvM8C0hkxLO2sDx8yGyPRqtyBAaQ83rUhjc/LgCslOB2L7DkjCz975q/JZHJ/r8sfNwZsoaGp5JFQy4aMek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5899
X-OriginatorOrg: intel.com

TWFrZSBzZW5zZSB0byBtZSwgbm8gb2JqZWN0aW9ucyBlaXRoZXIuDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFucyBkZSBHb2VkZSA8aGFuc2dAa2VybmVsLm9yZz4N
Cj4gU2VudDogVHVlc2RheSwgT2N0b2JlciA3LCAyMDI1IDI6NTkgQU0NCj4gVG86IFBldGVyIFJv
Ymluc29uIDxwYnJvYmluc29uQGdtYWlsLmNvbT47IEdyZWcgS3JvYWgtSGFydG1hbg0KPiA8Z3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBDZXBlZGEgTG9wZXosIElzcmFlbCBBDQo+IDxpc3Jh
ZWwuYS5jZXBlZGEubG9wZXpAaW50ZWwuY29tPjsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZw0K
PiBTdWJqZWN0OiBSZTogW1BBVENIXSB1c2I6IG1pc2M6IEFkZCB4ODYgZGVwZW5kZW5jeSBmb3Ig
SW50ZWwgVVNCSU8gZHJpdmVyDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDYtT2N0LTI1IDExOjM5IFBN
LCBQZXRlciBSb2JpbnNvbiB3cm90ZToNCj4gPiBUaGUgSW50ZWwgVVNCSU8gZHJpdmVyIGlzIHg4
NiBvbmx5LCBvdGhlciBhcmNoaXRlY3R1cmVzIGhhdmUgQUNQSQ0KPiA+IHNvIGFkZCBhbiBhcHBy
b3ByaWF0ZSBkZXBlbmVjeSBwbHVzIGNvbXBpbGUgdGVzdC4NCj4gPg0KPiA+IEZpeGVzOiAxMjFh
MGY4MzlkYmIzICgidXNiOiBtaXNjOiBBZGQgSW50ZWwgVVNCSU8gYnJpZGdlIGRyaXZlciIpDQo+
ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgUm9iaW5zb24gPHBicm9iaW5zb25AZ21haWwuY29tPg0K
PiANCj4gVGVjaG5pY2FsbHkgdGhlIGNoaXAgY291bGQgYWxzbyBiZSB1c2VkIG9uIG90aGVyIHBs
YXRmb3JtcywNCj4gYnV0IHllcyBpbiBwcmFjdGljZSBpdCBpcyBvbmx5IHVzZWQgb24geDg2IHBs
YXRmb3JtcyBzbw0KPiBubyBvYmplY3Rpb25zIGZyb20gbWU6DQo+IA0KPiBSZXZpZXdlZC1ieTog
SGFucyBkZSBHb2VkZSA8aGFuc2dAa2VybmVsLm9yZz4NCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBI
YW5zDQo+IA0KPiANCj4gDQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvdXNiL21pc2MvS2NvbmZpZyB8
IDEgKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3VzYi9taXNjL0tjb25maWcgYi9kcml2ZXJzL3VzYi9taXNjL0tjb25m
aWcNCj4gPiBpbmRleCAwOWFjNmYxYzk4NWZkLi4wYjU2Yjc3M2RiZGY3IDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvdXNiL21pc2MvS2NvbmZpZw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL21pc2Mv
S2NvbmZpZw0KPiA+IEBAIC0xODIsNiArMTgyLDcgQEAgY29uZmlnIFVTQl9MSkNBDQo+ID4gIGNv
bmZpZyBVU0JfVVNCSU8NCj4gPiAgCXRyaXN0YXRlICJJbnRlbCBVU0JJTyBCcmlkZ2Ugc3VwcG9y
dCINCj4gPiAgCWRlcGVuZHMgb24gVVNCICYmIEFDUEkNCj4gPiArCWRlcGVuZHMgb24gWDg2IHx8
IENPTVBJTEVfVEVTVA0KPiA+ICAJc2VsZWN0IEFVWElMSUFSWV9CVVMNCj4gPiAgCWhlbHANCj4g
PiAgCSAgVGhpcyBhZGRzIHN1cHBvcnQgZm9yIEludGVsIFVTQklPIGRyaXZlcnMuDQoNCg==

