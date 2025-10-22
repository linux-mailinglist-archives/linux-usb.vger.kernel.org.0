Return-Path: <linux-usb+bounces-29515-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D33DBFBD07
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 14:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E675F3A96E7
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 12:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBAD5342C81;
	Wed, 22 Oct 2025 12:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ioRHANfZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335D733DEF8
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 12:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761135498; cv=fail; b=YZo/rI+2ESWnVOKCTzrzr4wLL4uHBd/P8R0T5DHAPXj+nzPSF/VPn0WiZ+ohepFMzKNGG8aangEwhMFRzoGGRg37X+V8cdUo7Z2P694UofqA4wpjPuygatuW4UZ3NrefJ1isG1N+FrabF5gSJDngP3X3NvrndkOfsEzvWfuUjbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761135498; c=relaxed/simple;
	bh=OuPKG2bnTXUEwYdUYxXfHKdZch2whR/HTyfL/4znLUQ=;
	h=Message-ID:Date:From:Subject:To:CC:Content-Type:MIME-Version; b=o250Lkv+KKOx5wqhg6XU1KAlk6ZZTHjtntE7cW5jIWJcsEiiti7W+nBykWiIl4O9N8432G3oIOnKckB6E2kr2Oxjh/Q1mkjHZ6HNB0iYyfoD5bOM9hymnhrl+7Q/MxCGZm2vQVSqgXiAH66ixUVh+2vJr6wSLi2QZDQRZ5W7dA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ioRHANfZ; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761135496; x=1792671496;
  h=message-id:date:from:subject:to:cc:
   content-transfer-encoding:mime-version;
  bh=OuPKG2bnTXUEwYdUYxXfHKdZch2whR/HTyfL/4znLUQ=;
  b=ioRHANfZjvsPxw4C5ZzRbBDpyJnclPTzDNGuypCEJcHsUPl8xp/zaKYG
   KqdeLR0XN1PoqtHGpREdSiLU3YYFKgcHbf9A7o4AEQ5KKJL6vYuBQkISv
   bLEaO0Id/7SJmsRZ3K9yoHZXcUVbpfpBo5Wm6pglMIpHqLJHLUKD86Zn1
   HKdvX0D7TQhbVCfhP0gvOVvz4qFCkzi9W4ShJUeDhp31xCxZkVIN+B/EF
   Xczi1njMqiC7mVjK9X7c+/T1sXr1AYKEClyc8JkZr+MjZeGi7xGLAgRaR
   H+v3kdXS9u4Kt9TFL18qMfechDFpDk3NCUwf4Ym+ZD/afYpB8K+G6tzmZ
   A==;
X-CSE-ConnectionGUID: 5rfayf/eQySBDP32mKYUuA==
X-CSE-MsgGUID: yhdHzeHZTY+O/rQ/2bqP5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88746716"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="88746716"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 05:18:16 -0700
X-CSE-ConnectionGUID: tcZ2WD5nQDS0jUPcrdtghA==
X-CSE-MsgGUID: CO1qgoc5RxaTK5/0IZgl/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="183562152"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 05:18:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 05:18:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 05:18:14 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 05:18:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAwoGRSOLvEARaURa5Belc67IuIMHOpIz/jWADbgKjoLfGkSRTXkEqcjXBZ5L9Bs3JEWiwQpMcU/koMNZrvp5gCym529f15xvSKBAbDxdPEQb25CSXvAVhMB/IuTbt2hTcIpUmGcrSCwn0q5A5jXj9mxXQSUCs5r//AxC5SK1A80aiLZblX3mBC0lX2mJqovcLDR5PGBJ8aqyX0Jr0kLSfW07VdXzpTOBQEG6xfBW9mJ4oMvWy35awk2SEt17QKb7x1l/U7oGXVQk/mmR6GpaHQyE/O9movaFhwmo7YaNZmv0O2pVzE1/TcZDCLB521Szx6CP5/+tA4iIhogrBI10w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEippv5MJzdAy0kSLtFUS35n74goFnTzzp5Awz3lPzA=;
 b=hrtCHJ0GNSUS96DL0qymIPJFYeNRvuX/yRwEc0sz88RZifPYU8k5aghapxbVf/Ca/U1z1x5TxbVfasXNFMO7IosaSEKeD8T8QckxpUqAL7LazamFIXfpQNOKmnRjldLIKtB+2nB8mFmedu6r0Vrb4z5M/XxGWqopVT+y6PR3dCFTvQidX5JtSbnaqVXKOcU7HKu3IW58d6aNQKtxD2W3eU3iSm8AB6PFWBoflItwjJb4jzPEYwzW4rxhacp+Ytydo9s0R3cR/BHOvxVPqBRP0IuolPJo2O9+6vL1fnyvaNcGHqeupIRO2PdYgbsqRg1Z6uBSZwdYDzDJzEjr6Qh/hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PPF10DD61CAD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f08) by DM4PR11MB6382.namprd11.prod.outlook.com
 (2603:10b6:8:be::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 12:18:12 +0000
Received: from DM3PPF10DD61CAD.namprd11.prod.outlook.com
 ([fe80::7ef8:7d57:5274:2ed2]) by DM3PPF10DD61CAD.namprd11.prod.outlook.com
 ([fe80::7ef8:7d57:5274:2ed2%8]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 12:18:12 +0000
Message-ID: <6c22b4d5-7d6d-41ab-9b00-9dccf3ec8963@intel.com>
Date: Wed, 22 Oct 2025 15:18:07 +0300
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: "Ruinskiy, Dima" <dima.ruinskiy@intel.com>
Subject: cdc_ncm driver and NCM 1.1 revision
To: Oliver Neukum <oliver@neukum.org>, Oliver Neukum <oneukum@suse.com>
CC: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>, Terry Moore
	<tmm@mcci.com>, <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0022.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::6)
 To DM3PPF10DD61CAD.namprd11.prod.outlook.com (2603:10b6:f:fc00::f08)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF10DD61CAD:EE_|DM4PR11MB6382:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bfd9e23-1232-40bd-eebf-08de116511db
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UExrVEZROUxmMWFwNGVOd3gvMWJ5dUx3YngwQ3RzTXd5eEQzYXo0ZWRVYWVh?=
 =?utf-8?B?MllJYVNDaG1aT09SRlBzZTlQaVUwNUdFNE9FMG40SThwMmhKN3orTFJ5Sk8x?=
 =?utf-8?B?THdGQW9qRGpyelNZRklnVTZWZTBPOEVaa1N0R0Rad0JHUWs0TmtkL3pseU92?=
 =?utf-8?B?L2d2Z1BEcGpYWUdsY0pDcXRtc2hpN3B3MmlNQTVzQThFek9NYk1xa256bVha?=
 =?utf-8?B?dzNwSHFIclFqUGZTTkY4ZEZoK3ZtRHNQQ3lOK1FVb05jMkVzbE52OHpVMGYx?=
 =?utf-8?B?SlczUXdmYnZFK3MvV1FLSUdrYk1Pb3RHMmxFaEMwNzI0VXljeDR1VGVsK1JH?=
 =?utf-8?B?K0ExYWc0ZU1qWVF3NlBWOFpKZWFPOTFSVHpsV0dNWDVIeVYxS3EvK1VEMzcy?=
 =?utf-8?B?cFFNSTFKMS9nT0JqdlVxQnUwMmdPb0FPbVJXdTBLR3NIQTFwWTlGUDhwTG13?=
 =?utf-8?B?Rnd1MTl4T2lPTWl4a2d0RkxlWWk4RGNCSFQyclpIbTFOT1lVNjhpQW94eHll?=
 =?utf-8?B?bUo0Rms1WWV5UDFDTmhvMlhRb0pVd3ZMVE5RcTZ4QWVzUGJXaGZmNy96eDRB?=
 =?utf-8?B?L25KRCsvbGcxYUt4Q2R3RE9MT0tidU0rekxHcW54aUkyVDlkaFdLVGp6NWp1?=
 =?utf-8?B?aGxjWWpSN3prOGcyQU5RVy85Q0N3T1pObzVHdndVMHVZRHdmcFZLZmQrOWJs?=
 =?utf-8?B?Q0JJK1JnNVYyNDZzcUhFT2VscSt6U0tyR2NWU1dDTUZ0Qzhqc0xIUHRKcnZG?=
 =?utf-8?B?RUY4a2N5OVpXRVdvU2x5OGVHYmsxejVCSzdabXRkTnRwNkVnVlprcmhxVHVi?=
 =?utf-8?B?b1pHbm5mM1gvaGtyOVhsYUEwZ09sbXV3SE1WYUdSUjEvaUJJSUVUNHliWnRq?=
 =?utf-8?B?MUlscHFBYVlBWTZSSVBmdkhFN1JsL1pWRzl6SmgwcHY1blI0VjVkVEJZSlht?=
 =?utf-8?B?WmlBN1Q4Vk1GZEtXdkxPQ3o2ZFM2ek0xREZpME1HeFVLTHR0eDMwa255NjFX?=
 =?utf-8?B?Zk9CVGJkQUFqVG5GV3NESjM2VjZZMjNXdUhNNmtYYnBXQ3pGOEp6WmdHREM5?=
 =?utf-8?B?S21acTRzZ1FveHNGYm9idkhlZjJCWGF2UlUzYXkrd2pPWG5wbCtzN3BGTzVt?=
 =?utf-8?B?QlgrWEhvNWo0T2xucTVMZGRjZklLaXVLQXc3bldSS0IvK0Nrdm9XRkhZOEw2?=
 =?utf-8?B?WFQ2KzFIbEZJRVFaa2VkZ3YzR2VRS1VoWDYremJnNmJwR2VLZWp2VDUrckVu?=
 =?utf-8?B?bnVmTU51aGliT2lvTGJtd0paLzRma3lsNzA0UGJ2SktjUHFQaTkySlF1MWZI?=
 =?utf-8?B?dXZkSHdpZnpvV1VBQWw1TE54amRscWpsYjcxWGxXazRSK3NQU1IxOHRGOEoy?=
 =?utf-8?B?L3dqZjJKQW12YUkrY1ZYSnVqc1Y4dHJPUFpuYXhsbUhzdEhnNEZLSWpPaHdP?=
 =?utf-8?B?am5OTnRQMDBiZFliWEc1NlAvSFNCLzRjUTdWekoxQ3JoMUh1QXZGd2pjQmtP?=
 =?utf-8?B?dnF4eE14STJHdzlSTUpoYXIzd0w5aHV4L2h1NTBORkREUnA0ZkpLdjdzT0ts?=
 =?utf-8?B?L0FscUM4N0RGZldOYzUrRHlMU3U4dFpFUG9QalZuQkUrS0lKdUZQSFJJUXVt?=
 =?utf-8?B?RElHUFhUVTc2VmNkSktEM0ZaaVNaazdLOGVaRWlxeW1tYVVvQmlreUNOZE5R?=
 =?utf-8?B?M0NXaFZ5Q1V2bTFORVZBM0NyKzVlWGVJNEJBMVNDVE9KZjhINDkzTHlYcS9u?=
 =?utf-8?B?c3NzZ3ZscGk2aEJZbDNEelczcUtDRThvVjZrV0JmSmlGQTIyZjF6cElkTGhw?=
 =?utf-8?B?WlBoT2lLdkttdSthQjBQOHowQ1pTVTdlNUZyNHArODZXR25tcUU5Q2EvcC9t?=
 =?utf-8?B?WE5nTWxTQmJ5ZWtKZjB5bzMvTE0waVVPOXVLb2xUL2hkR2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF10DD61CAD.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEJucG9zVllWVjVmTS8zL1JITkF5dnM2VlpISkFIY1VuTFJSN01BTGlsRGlD?=
 =?utf-8?B?MHFUWkxwTzhxT2lWenhxeHBhYXRlalZZVUkzN1E0NzkvQ3J4b1hUQ25zcVZu?=
 =?utf-8?B?YnNvOXkvSVhxYTBrcGJzd2lMOHVLUUpNV0JIcFhlbFRnNERqblNQT1FzUXFI?=
 =?utf-8?B?WFErblZvTzBvWlJnekhDL1l5TWdwdFdBMXNCSWsxL1lPMm83eU9uTVVDdk5F?=
 =?utf-8?B?WnREYUVTT25vbXVub3ROdG5Ia1RIUW91akovdzdGQ1d4SW50R3pMaTZDYlor?=
 =?utf-8?B?Nlk2dmdzbVBlQ0NUNVp2Rmc4b0xYZlB2RGU4V0MwVjVXRzA1amV4Tkc1eG9p?=
 =?utf-8?B?ZG9heHpFSmpTZkwxeTFzTHlPTGVXU3E0Qkx1UENsMG5yQTN3T2h6dVk3dnVx?=
 =?utf-8?B?bDgvT3FmTFIxQnFuVEZyRC8zNGRkdjlpZjhKRWFHZ0IwM1hPcG5GZmcxcUdZ?=
 =?utf-8?B?SmpQcUMvK0hVYUI2WXYrSWVTM1RVOWpRZ0Y0UFJGeUhZbnVreVdlcUFTaUpn?=
 =?utf-8?B?Z2VpMkRmM2ZpZDZnUU1nSk5aK0F1cUdjaCtadWg4U2NKZURkellLRUc0amIx?=
 =?utf-8?B?UXBtNFQvd2tFWExXWWMxSk9HQmE5TGtoZmtmaGZ3algwaGF1ZDFPK2JHZVNm?=
 =?utf-8?B?Rmw4c1JCTzB0TmFvSDI4Y213c2xQYWpKRFluOG00ajRubWlEU1RDa091YnNP?=
 =?utf-8?B?c1RYUzZ3UkkyRXRNVnRRNU9oQ0ljTEUwSUdHbTcyM2kwK0w4ZmZ1ek5FREZh?=
 =?utf-8?B?Y3RIb2ZrVnNGaUZ2ekFHYmV2ZmhWVGVmNkY4OEo5SmdkRFh3MGJSQVIvajgr?=
 =?utf-8?B?aHg0WW9EaitFN1NncEdZbXh0L2RyR2VzQk9CRWhpUnlmOXVXU3M0dVFrOG1x?=
 =?utf-8?B?VlBVdUdNZWZSZWI5OFF3M0txUHQ1cEtaaXRvZ0VubDhucXB5R1JIcjROcUdS?=
 =?utf-8?B?ZXRGeWZLWTA3Rk5uZGVPajFOYjIyY1pmbUJRdlVUK1NRSFZyVDcrbkV4bHNs?=
 =?utf-8?B?dTdpUjN6Y0FwS3daTGZNMzRpUERURE5XZkV4Tnc4SUx5M3RyTnh6RGZ1K1hU?=
 =?utf-8?B?OENXZTkxM0RpbGxUdlVXdnFqUGxGWGh2SXdoVEJTTzNDaU5XMVBhNUYxajFI?=
 =?utf-8?B?NlFsTmowMHdKNFQ1UUgwTkp4bStUcjc1eUpOdzUvbW9oMEkzS2NwVEFMcXow?=
 =?utf-8?B?VS9NV214a3BoNWRUYzN3di84YlE5Qk5oVDFHUWlrWDEvMFFySWxTV2FSNlc1?=
 =?utf-8?B?QUFhQWRydzU1RHM1SHVtdkFxUkpJcVFBR2pnTWFJOC9Ba3hSRkpkTFVrM3gr?=
 =?utf-8?B?R3Vsekkwdkw2ZzVnd254Ly92V1hnU1VSb3hUaXRraE9yUGc0OC9DTUFha3lO?=
 =?utf-8?B?RWQxcFdxd0xQbFFMSGFtcUpCWmNBTjJzWS81NVBvOVprazFsRnY0UmJPOGNZ?=
 =?utf-8?B?Wk1LSEFyZURnaUc3c3QyL3lKbUE0TDMvdUEyQzByNnF1c1FiSjY3M3QzQVFW?=
 =?utf-8?B?WWhZbXRNVUh1Nmdab29PZXB0VmtqU0hvVER4ZGx4TEE2NEZVL1BON0ZvRTZV?=
 =?utf-8?B?NTQ5WTRyVHJSd0wwVEd0ZGZxR3FkZVVRcURXdFlEQi9LVzZCTlpjL3Y0blZG?=
 =?utf-8?B?OUUyMFFId3BtaWRYOHZEeTBPK0cySVpkc1hURWpFc0lwbVppZ3JYdVMrWFg3?=
 =?utf-8?B?YW9sZFUwbmVZZWRKdmNlcVJaVSt4ZWFwc0M4ckR5WkVXekNNRVpYT1ZTUkp1?=
 =?utf-8?B?Qy9FUzl6aEkwbWtYVTM0SXJ0YjY4eWh5UHptSWYzdTRqV09ERkJkbldKaDdo?=
 =?utf-8?B?WlFCQjBZZUppK3RtY2ZtL3pWVmxIanFGSzY3RTBpTGdIWkhNdUNkRmdCQmlj?=
 =?utf-8?B?ditLZGVDWlJtM3QwUiswMit0Mmh6SnJ0WENmMng3WHJBelVnSnZGUlI4R0dR?=
 =?utf-8?B?YnhBVW5zL0JqRFJQRjE3aGlaNEVBSXY4R3pFWDIvTHZCekdwUllPY1MxZHFT?=
 =?utf-8?B?YStaM2ZZQjJtdE0vTXZ1TTllektHNzVxTkZNd2NGNE9XdkNHdmtOanptbkZM?=
 =?utf-8?B?Q0FWYmZVS3NFY29iNzlzcFRPRWFJRnNqcTVvbHhnYS9MRUtGaXlUSmdndW1J?=
 =?utf-8?Q?H/LvYI1cLsbHJB7Gs2vdwXuzw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bfd9e23-1232-40bd-eebf-08de116511db
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF10DD61CAD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 12:18:12.5123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ZVJp9y30B6hhaKlItSjJdhENVfTDAiNjHVDMLDeBmSwHYqAqspklPpAzhnajaqG0HWC4xsauphnTOhakvP2zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6382
X-OriginatorOrg: intel.com

Hi Oliver, how are you?

You are listed at the maintainer for the cdc_ncm and usbnet Linux drivers.

The cdc_ncm driver has only had a handful of changes in recent years, as 
the spec too has not been updated for some time.

Recently, the USB NCM workgroup has finished and published a major 
revision to the spec - NCM 1.1 - with several new features as well as 
data path updates.

The new revision is available here:
https://www.usb.org/document-library/usb-communications-class-subclass-specifications-network-control-model-devices-v11

An "executive summary" is here:
https://www.linkedin.com/posts/mcci-corporation_usb-if-compliance-workshop-139-activity-7335815355266719744-BAdf/

There are on-going initiatives to update the Windows and MacOS NCM 
drivers to support the new 1.1 features.

Do you know of any plans to update the Linux driver as well? I expect 
there will be some inquiries as soon as the first NCM1.1-capable devices 
appear, which may happen already next year.

CC-ing Terry and Maze who have been active participants in the NCM 
workgroup and expressed interest in Linux support.

Cheers!

--Dima
(Intel Ethernet driver developer and NCM 1.1 spec co-author)

