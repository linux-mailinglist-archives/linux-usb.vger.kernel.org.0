Return-Path: <linux-usb+bounces-30774-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D23C73034
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 10:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 354B42B3D4
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 09:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC9630B505;
	Thu, 20 Nov 2025 09:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0F6bLmcI"
X-Original-To: linux-usb@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013065.outbound.protection.outlook.com [40.93.196.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A35302158;
	Thu, 20 Nov 2025 09:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763629542; cv=fail; b=uH+E4Tk3T5gAKOAn3NuIEgVRJbUYgg2BxHoz1YC/00EmJrHFvIbTsmWxrmPJNuShukpMG+KoKf7GBOcB2G+USX6ti9TrCMqp9V2bLyJCIREa+9pe8TDy6mz4qSuywBvRL7IHU97crEZVAvc75FE3xNnUlZMIhRzWIMI1VQmImNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763629542; c=relaxed/simple;
	bh=fyLHKvZNG7j5lzbreb5uduQkfwxBiH7KbUP1jrxOhWw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XhQVhFlhad2AV/KasdVklcji0Pb1kykBnxpVKoW9oE768VmozCQGOV9GiwSBlOtY/PZltAGx4e5cqSKs/eNlQXaHa2xDbg4JoSiIsjZQ/WKAp7wXzm2TSUnXaDpEwX/bOezkyrOm2lkfpNeL9KAOBd9NaYcay5Yk4OyuJJi587E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0F6bLmcI; arc=fail smtp.client-ip=40.93.196.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZWbgaCguD7R5He87BsXrMug80unGq2J/j6FINDbjNwHDYgtzXWmAOxhTSWetRNzG/UjThIwQZPtUIj2ge36L/e5enc/5tCH0LVYESVPPZ5KYrVm9w11Htrh58XE13X/If4bR12VpEWsJiZjolQZEuh9jb1fyr3Mglx1ocZGvSBDhpW+hSI+UPMsvYJ0a7iQHmUSfcxn1M2hvl2vrd/aIXI20o7VuKKXWEPx+qYqHa3zdNT/NcWG/tVrhrdSwBE5rOOX/BQmA3M9NML2gjW4rll3EjOTi3eHnJ53+1z8KGPu5eYS3E0x/NWA39fdCjTZVlj8+r4r9UUkjBVE8GoCLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyLHKvZNG7j5lzbreb5uduQkfwxBiH7KbUP1jrxOhWw=;
 b=wzqODfQALaZJ4qsPH3wpSbzLqJSRF61n2XJM6lqZYmBtmaJw6P1jVlGh1O7YQ7Ie7JUa509lH7GbSkIkaoQn+1VwIVle0XKicH61ScbbmM3yNufG5zi3Ihhp13rKLIsam/YqsbEbCQDPW4PfEo7FGy9c+OMMAOidPnrblQ6C5EnrGYigNg1T7CEDhVp/zAGeCFyr9RJVJkv14/6Jew4Q78MUrDF5VLVAwV5ygvmZLH60khX0A+96HzGgcYHcz9PJNy+PugxF7pC6H1vc+I7zISObiTi72z4QsaKDt5SC+Qw9XFLbJ57mECYDYgnbQ9dCmrxxF6EVg/xbdIX44qpXcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyLHKvZNG7j5lzbreb5uduQkfwxBiH7KbUP1jrxOhWw=;
 b=0F6bLmcImIV4uKt1cEjBYxszdKS53/AZhOmK+M4jrjSfJ1SAhJ1sl+lHbJTmX4K+e7UpfLWSjzhAC03s4tltoUXJEdNiZ80EpXtr3vryL0xtWTqCaqHVOurhU2qFURkZ5nwitfJkfzyFZnneECZgYQdyIQudISvY/JX+4MdVwAo=
Received: from MN0PR12MB5953.namprd12.prod.outlook.com (2603:10b6:208:37c::15)
 by MW4PR12MB6707.namprd12.prod.outlook.com (2603:10b6:303:1ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:05:35 +0000
Received: from MN0PR12MB5953.namprd12.prod.outlook.com
 ([fe80::6798:13c6:d7ba:e01c]) by MN0PR12MB5953.namprd12.prod.outlook.com
 ([fe80::6798:13c6:d7ba:e01c%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 09:05:32 +0000
From: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "Simek,
 Michal" <michal.simek@amd.com>, "Thinh.Nguyen@synopsys.com"
	<Thinh.Nguyen@synopsys.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>
Subject: RE: [PATCH 3/3] usb: dwc3: xilinx: Add support to program MMI USB TX
 deemphasis
Thread-Topic: [PATCH 3/3] usb: dwc3: xilinx: Add support to program MMI USB TX
 deemphasis
Thread-Index: AQHcWYspV6MKq+SGwE6VAIK//aJ4b7T7OdWAgAAMBVA=
Date: Thu, 20 Nov 2025 09:05:32 +0000
Message-ID:
 <MN0PR12MB59532EE10DF327B182892A9BB7D4A@MN0PR12MB5953.namprd12.prod.outlook.com>
References: <20251119193036.2666877-1-radhey.shyam.pandey@amd.com>
 <20251119193036.2666877-4-radhey.shyam.pandey@amd.com>
 <20251120-polite-ginger-tarantula-08c98c@kuoka>
In-Reply-To: <20251120-polite-ginger-tarantula-08c98c@kuoka>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-11-20T09:02:59.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5953:EE_|MW4PR12MB6707:EE_
x-ms-office365-filtering-correlation-id: b739a709-fe63-4358-1cb7-08de2813f5b9
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?emxRRTZwdmJKRkY1Qy9MRXVSUERVcTVNdEJ1dWxzYm80dVpXbmVjWHBKbkx3?=
 =?utf-8?B?Q2YxY1RFaEdsUmkyOHJzMlJDblpQSjF3RkxycVZuUXJrcjFOVThIMjM2Q2h4?=
 =?utf-8?B?MlBwMnpwQk4xOXl3S1BQNjlwZzFiNTM5Nzd2djBiK2g3T21QNkpndjYvV25o?=
 =?utf-8?B?bU1XT0NXaDBvN1dQRVZVQXhWZzVBUGl0R0RBWStmNER4aTdTZWJLL1BoNll6?=
 =?utf-8?B?Sy9YWGx2ajVkR2JEcVc3Q2JOU1R3QVFKUmdpRno2NUZiU1RvVHMzL2Z3MWZp?=
 =?utf-8?B?YUZpSHM3enVscGh0ZVk3WGJzVmZIc2lXc290NThWMWcxSTdIL3FJYkZMZllH?=
 =?utf-8?B?OTA3M21GV1hvSG5tZGF6SlhXTEZIM0JlSWFLdlQ5QURkV0xWTW5kYm91RXhv?=
 =?utf-8?B?TWlRNWh2aUR4RzgyK1lJMUtGWEZLOWJpRVViOE55TjZPVW5YZll2WmNNcGhv?=
 =?utf-8?B?eXhhSmVXNzVnMHZBb2pxY2RrYUxzd0VkM2VETHJKZU44NUxGL3JNU3BZTGg3?=
 =?utf-8?B?eWVpT05DV3A4UWo2R3Q0RXF2Y3hudlhqVzd2RWlzcFFLcmZ0S2d2T0dpODdM?=
 =?utf-8?B?U2d0enZYNTFKWDI1MzFYZlgydEFBVFgwekFZNk5BZGNjV2krN1ZPQ1JwYmFh?=
 =?utf-8?B?RGdHTGRSYm9wSm1kQ3NQazhjMzY4dUZZckhNQXIreGpvWXpVd0hkY0d3OTFE?=
 =?utf-8?B?cEVlVGRVaHEzRHhwaFpaNEZnTm5QUnJDK0RJM21wN245bzQxYXFaaWxmcFJR?=
 =?utf-8?B?aVYwdFlOT2ZyTUc5SVQwcGZ5WGhaWmVGK3dpN2xJd2M2aDliait0eWRSdmpn?=
 =?utf-8?B?OTZidy9rK3NvMUVLWVBaTk8rVUt1TTlQb0xUeXNubXZaS3VEM0xXOWZuYXZu?=
 =?utf-8?B?WWwrcmtCOUlRSSt5REJISGtBcTlNNFNTa1VmWE95QlFTRE5vYjdweUk4VXBr?=
 =?utf-8?B?Y29jamwvVzlIMDdZTkR1YzZzcG00anB0cVNYR1VmWm1BKzhNOUU1cTFnUWR4?=
 =?utf-8?B?dDNWODNZc1F2NHZaazVtbEdIVmFsbVRCZ0JZMkJVT3ArTTZZTWoxYW5waW9K?=
 =?utf-8?B?V0MzTDFIK2pmZ25mMEdqaTVoZDRVdEpyaHdZQ20va29ZRFRldzhSeUZoTXBa?=
 =?utf-8?B?bzVEYVZWUTZJaUtTS2VzL2htTEpjMmVRcUY1Ny9IT0s3MFFkYWFKVnR4SS8w?=
 =?utf-8?B?a2RJRjBXSVdIb1Q3QjFUSThqd0hpWGdOV0kzdEV4aE9wZVd0SzllMGF4dzFl?=
 =?utf-8?B?UVEwa2tLT0RKNnZEVEhPd29RVVNUSjdIWEd0TWZ0K2dpVHBzR1hNejdpeDNk?=
 =?utf-8?B?aE8wWWRLakZlWjhTSjBSdlBwVVFzQkRNbzJGUUZyaEtGTzVUREZoaTc0SEVk?=
 =?utf-8?B?ai9pWSt4bFVsS0krajUwMG04Ti9IS0ttbHpqblRaaEVxRFA5WW4wcUtOQ00r?=
 =?utf-8?B?c3RTcytnV21WVkpYTFd5WUl3aldBUTFDSzloV1ZmWGQ2ZzFqano4aVkrc1ZC?=
 =?utf-8?B?QkdjYjVxUW9nemZyL3Zud0ptZTdBY1JLZ2lxVWVzdytmSjlST09ObEh3M202?=
 =?utf-8?B?cjdadncyYk0rZHg2VU9UZXpVMVlsekdJNmtvK3dud28rcjRmY2FLclBnNWRX?=
 =?utf-8?B?a1NyekluU3lEd2c3dWhsQWZPSzY2QzByT0cyL2RJSWFHcHU1TEF6OG9aeDJY?=
 =?utf-8?B?b3VMQWVZMjl2OVRVWk9ZOU9ET3BqbE9NL1pjcU0xL05seVlKM25vbk81SjQy?=
 =?utf-8?B?TmxWUStqYWoyUDFmYjBOUnlCby91U3NpS1c0L0xwOW1MMWh1TnBhOTJrc21y?=
 =?utf-8?B?UnpLMlBWMS84WmNwMnVNeUw3N1BCbUZBU1YzUEw1TCtDSGJOT1FUR21CQXdm?=
 =?utf-8?B?WSs2WUo1ZVlUdmQrYStZTXA3aHRHYUhtUEdnTVZqVjc2UDdabGZMQUVRM2RE?=
 =?utf-8?B?dmV3QkJYYVNLVlBPeGxGQk9JakNwbGIzbk94K2VpTUpBNDBhd3NyVGVheG1W?=
 =?utf-8?B?YURSSjZOb1B1TUtWV3NtU3pneGtpMHBHMjgwL3R2TDc1YVhKQnNWcUhKd1dy?=
 =?utf-8?Q?RvHipM?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5953.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RElUc2NmemxGREVUekNlaTZQZGFjS3FGeTNEYVBvUjRYVlYzVll4b3FPRDhr?=
 =?utf-8?B?ZmV1OHBmakZ5TXI3TUx0MWkvUnlzWWNBZkRibjZaU0tVVU5TTE9GNDBMWkZ2?=
 =?utf-8?B?MlFzTnc3WVh1M0Z0TThnSVRuSm5nOXhUcnV0U3pYUlU3K0U0TmphTDlhM2xY?=
 =?utf-8?B?aFlxTzR6cmFCMXdXMjJqSGt1eW1WeURMYUpHN0dkd0NhWmF6QnJlTnV1WTJS?=
 =?utf-8?B?MlpyZDdlSnBGL1hKckNuWFhsNFNucjJXTmxpTW1NQ1NwSFZiS1JjQ2FMZkJH?=
 =?utf-8?B?MTdBQkdPUlIrTXhYMHd1N0V1VUxrREFwbEhLcHlJOUZML25ZSmpXcWE4Q0JI?=
 =?utf-8?B?TWV2amQ0c091ZGhIRm03aVkrWDN3NWI5QzRpMTBNOW5vbUVIbmtoOXhPQWZu?=
 =?utf-8?B?ZFkrUkZYdExCdTZBdW1Ca2ZlSXVLd3IvVC9UUU9ZQ0RMSWlHUkg3SmZEejc1?=
 =?utf-8?B?MHhFU1pWZ0xpQldMU0JNUzdBd0UwSk1nY242dkZmQlpiczJBNnpUa2JkMmc3?=
 =?utf-8?B?NGJVOHN5dXBNdjQ5WlBvRmIyWUxvSDNBakxBUHdVNzkvdTVjaVhGR2tvL2xT?=
 =?utf-8?B?RWxqZzF3MGwzekpuSDVRa1JtYjRsYlhtYzU1NnUzWmhPN0luSzlkTU51a0lG?=
 =?utf-8?B?WjNDUHlMOFNrMm1ybytvM1ArWllpV3RhQTRmZERtRytPTENqaXBZdHdMN0Zm?=
 =?utf-8?B?T2pyYzdTVFErT0NlSXV1Y2xpOVJYRE5HMjVyaFYra2U2L25OeTcraFN5SlhU?=
 =?utf-8?B?VGxQNUYwLzRYRVIrSHNFRVU1LzFOaEIyWkhWNU9JQlhlUUluSnNKSVpVYWZ2?=
 =?utf-8?B?MlkvbFNMYjBLSUpQY1haaEpxLzRvQ0J1bGlQZSt2L0NGdDMxZHdpNUEzbVFO?=
 =?utf-8?B?dnBuc3hNblZCcXA1N3c4R2xic3FkVU92Q2UwUzlyYnQ0S1VTbzl5Z0huVHNN?=
 =?utf-8?B?M0w3cGN5b0dMTENhQVBtOG1xYmtNZUtKVmIwM3RTMVRGajZhZ1YwMCt4b2ZC?=
 =?utf-8?B?cFhuUEJzMEFTLzlWU3lNZ0psN0RPS2E4ekxjQmthelU4cnllKzhCUzFERk9k?=
 =?utf-8?B?VXNIeVBlb2N6OExDUHo0MENqRTFSZXRaMTM1cTNvVHlqclB5dXFSWk1PNjdF?=
 =?utf-8?B?WVNmZlVIeUQ2cWRCWEtTSTNLQlNMd0FIZk9EUG40UE9UR2xNbHBwZzArbTY4?=
 =?utf-8?B?RSt1OXN4d2x4aHFJaGtqUWVkTjBqVDJLV0dldVhudE9iNG9JeHFPRjNMSVBE?=
 =?utf-8?B?NmdqcXF0cll5SC9uQmoyUGZNQ3doZzNSSVRxM09BQ3NnaFRkaEJsOHhNQU1H?=
 =?utf-8?B?S2hMdWJnSkVCcGo3ZklicWxkNEdxL0tWcE14WCtJcjUvdEQrNU5IUjk2Wisx?=
 =?utf-8?B?OUFFMHpkZ01rbEdpaFI2MGNoMzZnVEN3Nnc1cCt1RTZ2bzFXMnhnMndnbm5t?=
 =?utf-8?B?bXdMWGQ2dVNLOTRtcDNJanIreEtYMmM0eXFmVUVINEFnZVEybjlCclF4K2RZ?=
 =?utf-8?B?bkMvMitxNUsraUh3bjIxQy95azJqNjg3R1QwYzlRY2plb1hDMGo4bkhUdTgy?=
 =?utf-8?B?L05yckVjbHNUeXdGa0IrejRHK0hrK1lQcjl0SEoycGthMUNPY3VrY2FhMlFE?=
 =?utf-8?B?anZFZDJZMEhLNjEvTy95SkhnWXBoUmVSTFE0Z2RaYTJPYzJQUnY0MjBhbTFH?=
 =?utf-8?B?NHZFL1I4Sy9VNWZlaStuN2JYMmJBeEdrTEM4c0hDMmdOSnJFdEZZMEtHZEpO?=
 =?utf-8?B?clpTWmd6QlVUTjdnVU5rWlNmOWQyMkhZR2hLR2tDdExzLzdpaVROL3hzNys4?=
 =?utf-8?B?dU5lODhXRmpINU41cGJ1NHVGeElZb3A0YjE2Rlk4ODhMbTNtZmRNN0RMWnFw?=
 =?utf-8?B?ZnNoRjdDR3RDcURCL1dXcjhTWHNBYTQ3UXUwK242TG1oTjhjV1NlY1BIaWJN?=
 =?utf-8?B?MGJrazhISlB5b1c5a1QvOGNqdm85eENZY3JBN0ZROW9adGcrZit4cWdCTktM?=
 =?utf-8?B?bHgwRWQvNno2OURnd254VTczUmdGa0xhOUpCWUsrU1lUc3hPMWxBUUdWSHpv?=
 =?utf-8?B?NUNZRzRRSStLZ0ZzUEJhK2Z3NXRPRWxvaXYrU1hxemxXYWJoc2FnTGhUNllO?=
 =?utf-8?Q?iRLE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5953.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b739a709-fe63-4358-1cb7-08de2813f5b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 09:05:32.4661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gWcJQoYMgjJNimGmG8bv72RELJRb0ODxltYDllUNZK45lMu6GCFi+QV8+BL/5/h3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6707

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93
c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAyMCwgMjAy
NSAxOjUwIFBNDQo+IFRvOiBQYW5kZXksIFJhZGhleSBTaHlhbSA8cmFkaGV5LnNoeWFtLnBhbmRl
eUBhbWQuY29tPg0KPiBDYzogZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IHJvYmhAa2VybmVs
Lm9yZzsga3J6aytkdEBrZXJuZWwub3JnOw0KPiBjb25vcitkdEBrZXJuZWwub3JnOyBTaW1laywg
TWljaGFsIDxtaWNoYWwuc2ltZWtAYW1kLmNvbT47DQo+IFRoaW5oLk5ndXllbkBzeW5vcHN5cy5j
b207IHAuemFiZWxAcGVuZ3V0cm9uaXguZGU7IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7DQo+
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBnaXQgKEFNRC1YaWxp
bngpIDxnaXRAYW1kLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzNdIHVzYjogZHdjMzog
eGlsaW54OiBBZGQgc3VwcG9ydCB0byBwcm9ncmFtIE1NSSBVU0IgVFgNCj4gZGVlbXBoYXNpcw0K
Pg0KPiBPbiBUaHUsIE5vdiAyMCwgMjAyNSBhdCAwMTowMDozNkFNICswNTMwLCBSYWRoZXkgU2h5
YW0gUGFuZGV5IHdyb3RlOg0KPiA+ICBzdHJ1Y3QgZHdjM194bG54IHsNCj4gPiAgICAgaW50ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBudW1fY2xvY2tzOw0KPiA+IEBAIC0zMDYsNyArMzA3
LDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgZHdjM194bG54X29mX21hdGNoKTsNCj4gPiBz
dGF0aWMgaW50IGR3YzNfc2V0X3N3bm9kZShzdHJ1Y3QgZGV2aWNlICpkZXYpICB7DQo+ID4gICAg
IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBkZXYtPm9mX25vZGUsICpkd2MzX25wOw0KPiA+IC0g
ICBzdHJ1Y3QgcHJvcGVydHlfZW50cnkgcHJvcHNbMl07DQo+ID4gKyAgIHN0cnVjdCBwcm9wZXJ0
eV9lbnRyeSBwcm9wc1szXTsNCj4gPiAgICAgaW50IHByb3BfaWR4ID0gMCwgcmV0ID0gMDsNCj4g
Pg0KPiA+ICAgICBkd2MzX25wID0gb2ZfZ2V0X2NvbXBhdGlibGVfY2hpbGQobnAsICJzbnBzLGR3
YzMiKTsgQEAgLTMyMCw2DQo+ID4gKzMyMSwxMCBAQCBzdGF0aWMgaW50IGR3YzNfc2V0X3N3bm9k
ZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gICAgIGlmIChvZl9kbWFfaXNfY29oZXJlbnQoZHdj
M19ucCkpDQo+ID4gICAgICAgICAgICAgcHJvcHNbcHJvcF9pZHgrK10gPSBQUk9QRVJUWV9FTlRS
WV9VMTYoInNucHMsZ3NidXNjZmcwLQ0KPiByZXFpbmZvIiwNCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweGZmZmYpOw0KPiA+ICsgICBpZiAo
b2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobnAsICJ4bG54LHZlcnNhbDItbW1pLWR3YzMiKSkNCj4N
Cj4gRG9uJ3Qgc3ByaW5rbGUgY29tcGF0aWJsZXMgYWxsIG92ZXIgdGhlIGNvZGUgLSBpdCBkb2Vz
IG5vdCBzY2FsZS4gWW91IGhhdmUgZHJpdmVyDQo+IG1hdGNoIGRhdGEgZm9yIHRoYXQuDQoNClN1
cmUsIGluIHYyIHdpbGwgdXNlIG1hdGNoIGRhdGEgZmxhZyB0byBzcGVjaWZ5IGlmIFRYIGRlZW1w
aGFzaXMgbmVlZA0KdG8gYmUgcmVwcm9ncmFtbWVkLg0KDQpUaGFua3MsDQpSYWRoZXkNCg==

