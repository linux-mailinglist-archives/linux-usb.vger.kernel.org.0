Return-Path: <linux-usb+bounces-17967-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB019DEBC0
	for <lists+linux-usb@lfdr.de>; Fri, 29 Nov 2024 18:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D62E281A49
	for <lists+linux-usb@lfdr.de>; Fri, 29 Nov 2024 17:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBC219DF9E;
	Fri, 29 Nov 2024 17:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="UtjYN+1p"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F334087C;
	Fri, 29 Nov 2024 17:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732901687; cv=fail; b=uoFSNvVbfZ+0Exvi0fJhY8Xehw9cZmZbA5bzFoED/qz52/yoUYE6k6jzWlFuRRQ3moXA3EjSxZ23gdcmxNe11OrS6zTpBq0W0Jruz6ALi2BfbsAl0lo7sumFCdxwdIrJFNTiZPrvlehdekGp1GCdi4KGB/91fTdcccEtE7tBTRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732901687; c=relaxed/simple;
	bh=HTrInz5ctVWxcwzOHKfR80STLdYRy7tN2x1WAOs1zVU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ojSGeR259dtHHhVdIG0V8k882EMchO6T5YqbukD04l03ENdkfRXj8JI7cg1YzwfNOb9GtuaRUuSJ1AG0s5UCtemia3qa3ILn1NXdHXYM1/Jh3cUeoDdMXOG3b+Ky4hl51fCYGhMhePhLZkGZCjwoF2K/iqIlfJta2qCn7Y0qBA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=UtjYN+1p; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATFTJ8x023759;
	Fri, 29 Nov 2024 09:34:20 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 437b8ggpjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 09:34:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2VgDMo7CxyYlXklVSHwRwQR+0/PLaoU/7FWTwaJVldfT24fab6a9dge3b+2A1219yBGdacdhA+Ta2y6PU7PrOfIGUzJxDF6xYtCWlg6Y+CIbEit0PFjEiTV2e8v2Bf4PtDvHu7jVFUYgbNVstqub779sqjZtRCY4c3YjLGlSQETBgjwEGW6IeLvqAc5R2zMtu8hAhzn1qZnYd3tkD85LQ/hHIYshds/dvo7rfOVBqOBand4P3An+qkYTT4Ni1gNwUfFDwb+1hVTMyH+mZaBiFzrOY6h7zQe5zmYQpIq0/YqlRzAn2y86iVZ5w/BRLFiWNwNwnxADivvdSszbJN/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4Vi2fCz4PaY/YGZ82dBcdup1FH+cxM00fiNKdihBbA=;
 b=lmpIPHhB/1nJM5ckeTB0MZKjN9TVKSYX2KBodBPOud1YAZBOcr5i7qIRnU6iJqJDpS0dwZk0xJr+ba/hzbV71CCm2XEyt0qRXj0guW7ls6E7FDF8kv7xwF0PBrq8SDzsO8SUN9GSZri38zZyhavTV9YU29Gk7cjSRgA9684Qd5VTFTnkAglaAD85CccWaw628eD4Nim1MvnXDgnIhKKn1T7gFaoWhCpotp3sfPENnSyGYyYHwZSmFGLRWKEGIZJiLrUzOvDPJQF/9mOu7JKCDvLZgloFznUrkE8EY5vNmm2YJy/2LS7xRBC+o21FqHq6G9lm91jmMUyoA9rCry3LaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4Vi2fCz4PaY/YGZ82dBcdup1FH+cxM00fiNKdihBbA=;
 b=UtjYN+1pSzBTcwxXkN8ib4XGJfD6NRtNhNsEHIaMk9QY+aHUmNSDCZ1jV5Fs8qtY8GkJguLdnpozdYSFfpgps5SiNGyoScePAG7EJbvp8+Q/LwAhp9VQbQr/BBxcz1g7rwed075a5yUZxn6mNjnqd56LvbhWT9jn0Jx7MhYk72w=
Received: from MW4PR18MB5084.namprd18.prod.outlook.com (2603:10b6:303:1a7::8)
 by CO6PR18MB4001.namprd18.prod.outlook.com (2603:10b6:5:34f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Fri, 29 Nov
 2024 17:34:15 +0000
Received: from MW4PR18MB5084.namprd18.prod.outlook.com
 ([fe80::1fe2:3c84:eebf:a905]) by MW4PR18MB5084.namprd18.prod.outlook.com
 ([fe80::1fe2:3c84:eebf:a905%7]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 17:34:15 +0000
Message-ID: <2ae369bc-9cf3-49d8-92dc-ad19ddb48efe@marvell.com>
Date: Fri, 29 Nov 2024 23:04:33 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH v10 1/3] phy: fsl-imx8mq-usb: add tca function driver for
 imx95
To: Xu Yang <xu.yang_2@nxp.com>, vkoul@kernel.org, kishon@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        alexander.stein@ew.tq-group.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org
References: <20241115093312.3407815-1-xu.yang_2@nxp.com>
Content-Language: en-US
From: Amit Singh Tomar <amitsinght@marvell.com>
In-Reply-To: <20241115093312.3407815-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::31) To MW4PR18MB5084.namprd18.prod.outlook.com
 (2603:10b6:303:1a7::8)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR18MB5084:EE_|CO6PR18MB4001:EE_
X-MS-Office365-Filtering-Correlation-Id: 349801db-769e-46ac-9373-08dd109c0b8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1RLWTR3ZlhNTHRmSHMrbnA0bmNSdEpqd1ZyVWdoeVJ3UHJ3eUtDZVQxVnU0?=
 =?utf-8?B?eUpzK2dCckdQV1RRanR6bHo0a0E1WERpU3NCODArd1hEdU93T2Q3RWhXaWtj?=
 =?utf-8?B?RVNYcU5YbWtNZ1hQMEV0THVhcDQvY3JwTDNyRXU1SEN5bUVhc1RhOXhZOVVC?=
 =?utf-8?B?UDRwM3EzcnNVakxTZUdnZFF2TE5OM3RtaFZ1Q2ZTMHUreTdmUkhkSHFqN0ha?=
 =?utf-8?B?T3NxWGNTUkp2cGVtbnBhaElzOFYrY2Eyd1lWbmVwYmtHT25qVjRuYldhMTVR?=
 =?utf-8?B?QXArVm1EK1Q3NjdGd3Z2VnI4ZnBocHNCWU9UVk1qN1Q1Slh4Z1VzMTZYNncv?=
 =?utf-8?B?TWJpNEo4R0tvUUtlU1pma2szeXBiRWtocXNQVDBiZlFwVkpTUTllMlN2RGFX?=
 =?utf-8?B?elFxSzBzaVZOZEl4YjMvTmcySDhjSFRFL3F1WE5GTW9NMGltK1c4d0g5MG1Y?=
 =?utf-8?B?ekptOG14WFZYSUczWVJ5WGhIbkF2ekg0V2g2d3UzS3Jja2dCQ3lBaFdYVGRl?=
 =?utf-8?B?ckVWdWZ1ZlRUREgzak1vRFZuQVhzUG9lOFlwelQxdXJZcXE0MjJNWE9IRzl6?=
 =?utf-8?B?OThDNmFLVVAvSGZMVVF1Rk1SVHR5RFBwRk5XUy9QZjFSSDZhQlBXZDZ0Q0VG?=
 =?utf-8?B?ZWhnR2lzaml5RTFsNnNVeURTeE5aNnRLQjBEbFdMWVZxdU8vVWZpSmk1VVVy?=
 =?utf-8?B?Q0h4aVQrYUJ1OWtoWWJBWW9lYjRtYmdQc1ZvZ2gzZUtKdmtVUlJiV2p6YkdY?=
 =?utf-8?B?QlRJRnBnam80em9QdGdEdnJBRVU5SjhwUms5RmpWczJkNVRwNFNXb09Kelkw?=
 =?utf-8?B?c1k3eTNQMDIrTytKR05CdjBmSTdLVTNLQkJxWFVjcnY4Y0lxTXprdUxxb1Fy?=
 =?utf-8?B?K3lPV01SQittcGZsL292MDZ5Q3FJYSt2VlJFdlgxUW1kdGRmQzFSY3dnN21W?=
 =?utf-8?B?djhtQ1NQRmFwZW5lWno1OVFVSXpWdEFxbThYTWE0M1JRK0padGlmMVZRR1Ju?=
 =?utf-8?B?bTF1WGFKZUJiWnNDK3BVRjVHRzNYYnhQYWNsTWRQZ2ZvOXJnaG84RElsbFFk?=
 =?utf-8?B?NVVBRlk5SS9STnFGeHhKMU41VTE5R0xVNndsc1RybWlxUE5CekJRTkk1NGVr?=
 =?utf-8?B?NUZZdnNTQ0tsYUtQdTRmSmlSYWxTZFNVSThCanZqaU1GOWlxOEkrZTZuS1lq?=
 =?utf-8?B?MmorSk5FdEo3S1JnZHNNLzhvRmRzN1F5RFYwbk5SL2pwRjd6azE0Yk12TE93?=
 =?utf-8?B?UEw4Y2xvL2lWN2piamMyOFFUdG9NVUhYanBuVlhwdzdBZ2t0N2kxcnVHdU43?=
 =?utf-8?B?YlIxV1NHWXF2S1RzWlpyQVFIKzVRKzIxakRJb3MrakltVUFMaVRoNXlhM2RR?=
 =?utf-8?B?TTh0VlFxUnVSZ0pKbXFYcE4xLzRMMXFvR2lSSnNHSGVNMjRBc3NLUFJxUHMy?=
 =?utf-8?B?UFhES0ZmR2NSaEp3aHI5NWw1Z3lJM3R3NmFnTFpaZ0hQSGVvblkyaTN2Rzdr?=
 =?utf-8?B?T1ovYzB2N2lJdnJVY1BaQW92bStibXhUL1V4SjhDR052VnZLd3JKdVMxVklv?=
 =?utf-8?B?U1JrVmZDdmdsNWtNUjZMaWhVOG1rcjdkN09YcjU0dnhpV28yVzBXeTRmWmcv?=
 =?utf-8?B?amNrLyttcHE3d0ZzNEdqNFF3Z0ZQb2ozcllBN1V3NGM3ZFc2MEc3Q3ppSzNs?=
 =?utf-8?B?WmNLZWZ5QmpSWm5taTNCdG5ERjhXb0VZM1FPaGh0UXpFZTVqenBIWmhzMFVx?=
 =?utf-8?B?TzZSZGpTYW1EVE1LdnNOWGUzcTZLdW1xNE1GSXB0NzZHdWRmbjNIa1BuRVpQ?=
 =?utf-8?B?M3RRQ2FnRG94N1IyUVRMNkNNckxXTGVCSEhMMTBHeGtkSHcwaUd5RFdSSXdY?=
 =?utf-8?Q?pdOJWtGe5PcQi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR18MB5084.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEhreGN4RkZoZit6c2N1ZWh4TGc4SVZXYWk0b2liUGhiSEc2Nzd5dzdKcjJm?=
 =?utf-8?B?cGM3U0g4T0UyWi9FTmdvSGVSOWx6VGtnS1ZVTFJlSWdhWFN1dERzSHcyQXlm?=
 =?utf-8?B?WkRMZmZwaFdTRFh4bndLYUduSVhHT2ZrQWpNZ3VWdUNpVllnYjhRd0hzNDUv?=
 =?utf-8?B?TDYrUU43dHZ2L2ZJZGNqWDdXTktwRHloTHpkWVFjVHRnRm91Q1E2U2Jwdy93?=
 =?utf-8?B?Ri95cFpEcm4zaUpuSllzRVhEUWllWnRYVWU5Y2NJOXBmWGowcnJ3bVh5MEp5?=
 =?utf-8?B?dTJXUU5vMTFDVHBMTmhsRzJNOHZYdk5LSExsaVIxMEFzSmxEcHpaK3l4b0hh?=
 =?utf-8?B?dEYyQnVYQXZHblp6Y0E0ZjZDcU1odHpXSGFOV3RJSlp3RmtsUXpnaTlIdW9E?=
 =?utf-8?B?bGkxVWhZcEpselRuRlAxTmt2M25xVTZWUmN2YUw2djNRRGhYNENpcnVCaTZn?=
 =?utf-8?B?QkZKWjVUMEdoeVBKanZtTmpBYU1WQVExMlFPVmhXVjlycGk0VjhFYU8ySFdl?=
 =?utf-8?B?bjdHY0krdmdmelJQQWh2YjZsaVpYNXZMRitsWE1rTU5WSndNbG9zZWVDRjBS?=
 =?utf-8?B?SDJQWERneHdzY2drQS9MVkZ3SkJab1UxeDRrMS90YURtUnBPMGo4c3hPQ2JY?=
 =?utf-8?B?Q3lpZTM4anBZU0s1NUxDMlVYaVlqbG1WSTdTRFArUGVVUGdHSDhLa2xEck5M?=
 =?utf-8?B?M1lBcGVWRXhLODZRQ2s0Z21Hb3NKc0hnNUc4b1J3V1NsTkhJcU9OajQxSVVk?=
 =?utf-8?B?c0o3K3RHYllCZU5vZHBZVjlFNXhLMkFQQXVpMS9LZDI3ZFFuWXJPdUdCRXNs?=
 =?utf-8?B?RUtIMENXbDhTQmhwQ2ExSWNtNWVEcjhZODB1dG00bE1DamtiKy9GTWhPNmFn?=
 =?utf-8?B?WG5pd3BlRG1FSjc2UW5DaVUvd2hXVXdNMjFhUFVlSzU0bHRZUHJpQ1ViS3lD?=
 =?utf-8?B?NmVqUURmUU5sZkU5MnU4TzMrSE8xdmc0WGJWSlI1aXJ2ekpRYU1BRXhMeDN1?=
 =?utf-8?B?SmxLdFcrZVNHRml5eldvOTZ4KzI1N3BIcE5YZS9ZdHoxWFl6K3YwNzgvRjlw?=
 =?utf-8?B?RWZYcnlESzdUek05UWoyS3QxMVN3OGFGR0lQQUVtZlZPeGY1VW4vbnVnQnND?=
 =?utf-8?B?cExRcWlaRTVtRkpFTmdRcS9ManBPWWthREhNRk9MMXp4ZjBEYW9VT0dKcDhn?=
 =?utf-8?B?Qk51NnQvb2tvWExaQlNyRmdXdm5sM0pGTG5Kb2FhTU8wT2JYTG9ETC9TenRo?=
 =?utf-8?B?OU51d0VDd2Q2YlBnbTZranczaUQ3OCtCRjFlQUd2MXJEamkvQ1ROZ1Y2bnJT?=
 =?utf-8?B?cXN1MnBQWk1sb09tUmNQbStuL1NBRzRvRldiV0FLREZMaS9FbENmOWtIOGNr?=
 =?utf-8?B?OFJLY2w2UFZTRm9qZktZWTJiWXVVS3pFMkdRbVkyTzN4ekxrc2U4citObGJl?=
 =?utf-8?B?K0pRRVpVRDNtUFhLb24rMVNNZzRxSTZTeW8wODNidFk3SmNiQkRBQ1cvK1R0?=
 =?utf-8?B?aTZ3VTNpUFZHKzd4cE9nNStRMzVMVkYvbW9MKzlBSTMyOWt3NjBZcmk4NTBs?=
 =?utf-8?B?WlhGaTAwcVJrWUQrVzFYdG4xT2kyUHJtMGY0R0pEaU9VOXNCVElKOFVTU1M5?=
 =?utf-8?B?elJoL09wZVBqMUZxdEdldlpoKys3Q2pUSTJ1YUFwZ3JxMGpsSWhvUmlDWlV2?=
 =?utf-8?B?SCtCaitUTXdhZW5yRElXMXJWSldtTnQ3bDJTUzRsY2ZRMm9mbFp5bXZFY1hm?=
 =?utf-8?B?Ym1MVUdQZDF5QlBubjlIZENiWlNJeUNnZ0Y4TU1wQmhDdmtCRlo5R0lEOC83?=
 =?utf-8?B?MUJEYzYwSHVWVGN3K2FraFh1RjNFWlJhZ0V5L3ErUEZvUUp4QVY1enQ0WkRL?=
 =?utf-8?B?b21hY0NweFUycTBuUDFJRkR0eHh0UEprcW40KzMzWWlHbllWUWZxa2ZvUzNy?=
 =?utf-8?B?bzdVSllKMXRMVmdMZE5zNm0wakExYXFjTHJaWFdmSEdxZDZ3UkRjaG1Gd1p4?=
 =?utf-8?B?K0x5WWFjK2RkeWo4cytBU0NMS1B6Q0Z3VzBYSmVvR3VMMmZnMkx3RlJuZ01w?=
 =?utf-8?B?V0U3U2RlSEQ4UzBYWWhzTUh3YnRIWWVTM0U3N1VWTUg2OEtWdHJHSW0wdi9a?=
 =?utf-8?Q?BmRAehHk6R0vktNR8iZGkTUWA?=
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 349801db-769e-46ac-9373-08dd109c0b8b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR18MB5084.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 17:34:15.4909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7tmybxGvLGeH5GKR81BqJt/dZKUo+Uw0wWj+TvvwnMhCYEWDJd++AHn+pv1VhEes/G1Njf270Qtuszm+Cajsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR18MB4001
X-Proofpoint-ORIG-GUID: -i-74FF5LZ5jsfVp_YjITZZzenkFivUr
X-Proofpoint-GUID: -i-74FF5LZ5jsfVp_YjITZZzenkFivUr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01

Hi,

> The i.MX95 USB3 phy has a Type-C Assist block (TCA). This block consists
> two functional blocks (XBar assist and VBus assist) and one system
> access interface using APB.
> 
> The primary functionality of XBar assist is:
>    - switching lane for flip
>    - moving unused lanes into lower power states.
> 
> This info can be get from:
> i.MX95 RM Chapter 163.3.8 Type-C assist (TCA) block.
> 
> This will add support for TCA block to achieve lane switching and tca
> lower power functionality.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> Reviewed-by: Jun Li <jun.li@nxp.com>
> 
> ---
> Changes in v2:
>    - return the value of imx95_usb_phy_get_tca()
> Changes in v3:
>    - no changes
> Changes in v4:
>    - remove compatible check for imx95
>    - check whether tca register region exist or not, yes means has tca,
>      otherwise skip tca setup
> Changes in v5:
>    - no changes
> Changes in v6:
>    - no changes
> Changes in v7:
>    - fix sparse warnings in imx95_usb_phy_get_tca()
> Changes in v8:
>    - #define TCA_INFO 0xFC -> 0xfc
> Changes in v9:
>    - no changes
> Changes in v10:
>    - no changes
> ---
>    drivers/phy/freescale/Kconfig              |   1 +
>    drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 243 +++++++++++++++++++++
>    2 files changed, 244 insertions(+)
> 
> diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
> index dcd9acff6d01..81f53564ee15 100644
> --- a/drivers/phy/freescale/Kconfig
> +++ b/drivers/phy/freescale/Kconfig
> @@ -5,6 +5,7 @@ if (ARCH_MXC && ARM64) || COMPILE_TEST
>    config PHY_FSL_IMX8MQ_USB
>    	tristate "Freescale i.MX8M USB3 PHY"
>    	depends on OF && HAS_IOMEM
> +	depends on TYPEC || TYPEC=n
>    	select GENERIC_PHY
>    	default ARCH_MXC && ARM64
>    
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index adc6394626ce..f2b2da8cedc3 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -10,6 +10,7 @@
>    #include <linux/phy/phy.h>
>    #include <linux/platform_device.h>
>    #include <linux/regulator/consumer.h>
> +#include <linux/usb/typec_mux.h>
>    
>    #define PHY_CTRL0			0x0
>    #define PHY_CTRL0_REF_SSP_EN		BIT(2)
> @@ -50,11 +51,66 @@
>    
>    #define PHY_TUNE_DEFAULT		0xffffffff
>    
> +#define TCA_CLK_RST			0x00
> +#define TCA_CLK_RST_SW			BIT(9)
> +#define TCA_CLK_RST_REF_CLK_EN		BIT(1)
> +#define TCA_CLK_RST_SUSPEND_CLK_EN	BIT(0)
> +
> +#define TCA_INTR_EN			0x04
> +#define TCA_INTR_STS			0x08
> +
> +#define TCA_GCFG			0x10
> +#define TCA_GCFG_ROLE_HSTDEV		BIT(4)
> +#define TCA_GCFG_OP_MODE		GENMASK(1, 0)
> +#define TCA_GCFG_OP_MODE_SYSMODE	0
> +#define TCA_GCFG_OP_MODE_SYNCMODE	1
> +
> +#define TCA_TCPC			0x14
> +#define TCA_TCPC_VALID			BIT(4)
> +#define TCA_TCPC_LOW_POWER_EN		BIT(3)
> +#define TCA_TCPC_ORIENTATION_NORMAL	BIT(2)
> +#define TCA_TCPC_MUX_CONTRL		GENMASK(1, 0)
> +#define TCA_TCPC_MUX_CONTRL_NO_CONN	0
> +#define TCA_TCPC_MUX_CONTRL_USB_CONN	1
> +
> +#define TCA_SYSMODE_CFG			0x18
> +#define TCA_SYSMODE_TCPC_DISABLE	BIT(3)
> +#define TCA_SYSMODE_TCPC_FLIP		BIT(2)
> +
> +#define TCA_CTRLSYNCMODE_CFG0		0x20
> +#define TCA_CTRLSYNCMODE_CFG1           0x20
> +
> +#define TCA_PSTATE			0x30
> +#define TCA_PSTATE_CM_STS		BIT(4)
> +#define TCA_PSTATE_TX_STS		BIT(3)
> +#define TCA_PSTATE_RX_PLL_STS		BIT(2)
> +#define TCA_PSTATE_PIPE0_POWER_DOWN	GENMASK(1, 0)
> +
> +#define TCA_GEN_STATUS			0x34
> +#define TCA_GEN_DEV_POR			BIT(12)
> +#define TCA_GEN_REF_CLK_SEL		BIT(8)
> +#define TCA_GEN_TYPEC_FLIP_INVERT	BIT(4)
> +#define TCA_GEN_PHY_TYPEC_DISABLE	BIT(3)
> +#define TCA_GEN_PHY_TYPEC_FLIP		BIT(2)
> +
> +#define TCA_VBUS_CTRL			0x40
> +#define TCA_VBUS_STATUS			0x44
> +
> +#define TCA_INFO			0xfc
> +
> +struct tca_blk {
> +	struct typec_switch_dev *sw;
> +	void __iomem *base;
> +	struct mutex mutex;
> +	enum typec_orientation orientation;
> +};
> +
>    struct imx8mq_usb_phy {
>    	struct phy *phy;
>    	struct clk *clk;
>    	void __iomem *base;
>    	struct regulator *vbus;
> +	struct tca_blk *tca;
>    	u32 pcs_tx_swing_full;
>    	u32 pcs_tx_deemph_3p5db;
>    	u32 tx_vref_tune;
> @@ -64,6 +120,175 @@ struct imx8mq_usb_phy {
>    	u32 comp_dis_tune;
>    };
>    
> +
> +static void tca_blk_orientation_set(struct tca_blk *tca,
> +				enum typec_orientation orientation);
> +
> +#ifdef CONFIG_TYPEC
> +
> +static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
> +				enum typec_orientation orientation)
> +{
> +	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
> +	struct tca_blk *tca = imx_phy->tca;
> +	int ret;
> +
> +	if (tca->orientation == orientation)
> +		return 0;
> +
> +	ret = clk_prepare_enable(imx_phy->clk);
> +	if (ret)
> +		return ret;
> +
> +	tca_blk_orientation_set(tca, orientation);
> +	clk_disable_unprepare(imx_phy->clk);
> +
> +	return 0;
> +}
> +
> +static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device *pdev,
> +					struct imx8mq_usb_phy *imx_phy)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct typec_switch_dev *sw;
> +	struct typec_switch_desc sw_desc = { };
> +
> +	sw_desc.drvdata = imx_phy;
> +	sw_desc.fwnode = dev->fwnode;
> +	sw_desc.set = tca_blk_typec_switch_set;
> +	sw_desc.name = NULL;
> +
> +	sw = typec_switch_register(dev, &sw_desc);
> +	if (IS_ERR(sw)) {
> +		dev_err(dev, "Error register tca orientation switch: %ld",
> +				PTR_ERR(sw));
> +		return NULL;
> +	}
> +
> +	return sw;
> +}
> +
> +static void tca_blk_put_typec_switch(struct typec_switch_dev *sw)
> +{
> +	typec_switch_unregister(sw);
> +}
> +
> +#else
> +
> +static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device *pdev,
> +			struct imx8mq_usb_phy *imx_phy)
> +{
> +	return NULL;
> +}
> +
> +static void tca_blk_put_typec_switch(struct typec_switch_dev *sw) {}
> +
> +#endif /* CONFIG_TYPEC */
> +
> +static void tca_blk_orientation_set(struct tca_blk *tca,
> +				enum typec_orientation orientation)
> +{
> +	u32 val;
> +
> +	mutex_lock(&tca->mutex);
> +
> +	if (orientation == TYPEC_ORIENTATION_NONE) {
> +		/*
> +		 * use Controller Synced Mode for TCA low power enable and
> +		 * put PHY to USB safe state.
> +		 */
> +		val = readl(tca->base + TCA_GCFG);
> +		val = FIELD_PREP(TCA_GCFG_OP_MODE, TCA_GCFG_OP_MODE_SYNCMODE);
> +		writel(val, tca->base + TCA_GCFG);
If the register is intended to be completely overwritten, the readl is 
unnecessary. Otherwise, ensure a proper read-modify-write sequence.
> +
> +		val = readl(tca->base + TCA_TCPC);
> +		val = TCA_TCPC_VALID | TCA_TCPC_LOW_POWER_EN;
> +		writel(val, tca->base + TCA_TCPC);
> +
> +		goto out;
> +	}
> +
> +	/* use System Configuration Mode for TCA mux control. */
> +	val = readl(tca->base + TCA_GCFG);
> +	val = FIELD_PREP(TCA_GCFG_OP_MODE, TCA_GCFG_OP_MODE_SYSMODE);
> +	writel(val, tca->base + TCA_GCFG);
> +
> +	/* Disable TCA module */
> +	val = readl(tca->base + TCA_SYSMODE_CFG);
> +	val |= TCA_SYSMODE_TCPC_DISABLE;
> +	writel(val, tca->base + TCA_SYSMODE_CFG);
> +
> +	if (orientation == TYPEC_ORIENTATION_REVERSE)
> +		val |= TCA_SYSMODE_TCPC_FLIP;
> +	else if (orientation == TYPEC_ORIENTATION_NORMAL)
> +		val &= ~TCA_SYSMODE_TCPC_FLIP;
> +
> +	writel(val, tca->base + TCA_SYSMODE_CFG);
> +
> +	/* Enable TCA module */
> +	val &= ~TCA_SYSMODE_TCPC_DISABLE;
> +	writel(val, tca->base + TCA_SYSMODE_CFG);
> +
> +out:
> +	tca->orientation = orientation;
> +	mutex_unlock(&tca->mutex);
> +}
> +
> +static void tca_blk_init(struct tca_blk *tca)
> +{
> +	u32 val;
> +
> +	/* reset XBar block */
> +	val = readl(tca->base + TCA_CLK_RST);
> +	val &= ~TCA_CLK_RST_SW;
> +	writel(val, tca->base + TCA_CLK_RST);
> +
> +	udelay(100);
> +
> +	/* clear reset */
> +	val |= TCA_CLK_RST_SW;
> +	writel(val, tca->base + TCA_CLK_RST);
> +
> +	tca_blk_orientation_set(tca, tca->orientation);
> +}
> +
> +static struct tca_blk *imx95_usb_phy_get_tca(struct platform_device *pdev,
> +				struct imx8mq_usb_phy *imx_phy)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct tca_blk *tca;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (!res)
> +		return NULL;
> +
> +	tca = devm_kzalloc(dev, sizeof(*tca), GFP_KERNEL);
> +	if (!tca)
> +		return ERR_PTR(-ENOMEM);
> +
> +	tca->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(tca->base))
> +		return ERR_CAST(tca->base);
> +
> +	mutex_init(&tca->mutex);
> +
> +	tca->orientation = TYPEC_ORIENTATION_NORMAL;
> +	tca->sw = tca_blk_get_typec_switch(pdev, imx_phy);
> +
> +	return tca;
> +}
> +
> +static void imx95_usb_phy_put_tca(struct imx8mq_usb_phy *imx_phy)
> +{
> +	struct tca_blk *tca = imx_phy->tca;
> +
> +	if (!tca)
> +		return;
> +
> +	tca_blk_put_typec_switch(tca->sw);
> +}
> +
>    static u32 phy_tx_vref_tune_from_property(u32 percent)
>    {
>    	percent = clamp(percent, 94U, 124U);
> @@ -315,6 +540,9 @@ static int imx8mp_usb_phy_init(struct phy *phy)
>    
>    	imx8m_phy_tune(imx_phy);
>    
> +	if (imx_phy->tca)
> +		tca_blk_init(imx_phy->tca);
> +
>    	return 0;
>    }
>    
> @@ -359,6 +587,8 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
>    	 .data = &imx8mq_usb_phy_ops,},
>    	{.compatible = "fsl,imx8mp-usb-phy",
>    	 .data = &imx8mp_usb_phy_ops,},
> +	{.compatible = "fsl,imx95-usb-phy",
> +	 .data = &imx8mp_usb_phy_ops,},
>    	{ }
>    };
>    MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
> @@ -398,6 +628,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>    
>    	phy_set_drvdata(imx_phy->phy, imx_phy);
>    
> +	imx_phy->tca = imx95_usb_phy_get_tca(pdev, imx_phy);
> +	if (IS_ERR(imx_phy->tca))
> +		return dev_err_probe(dev, PTR_ERR(imx_phy->tca),
> +					"failed to get tca\n");
> +
>    	imx8m_get_phy_tuning_data(imx_phy);
>    
>    	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> @@ -405,8 +640,16 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>    	return PTR_ERR_OR_ZERO(phy_provider);
>    }
>    
> +static void imx8mq_usb_phy_remove(struct platform_device *pdev)
> +{
> +	struct imx8mq_usb_phy *imx_phy = platform_get_drvdata(pdev);
> +
> +	imx95_usb_phy_put_tca(imx_phy);
> +}
> +
>    static struct platform_driver imx8mq_usb_phy_driver = {
>    	.probe	= imx8mq_usb_phy_probe,
> +	.remove = imx8mq_usb_phy_remove,
>    	.driver = {
>    		.name	= "imx8mq-usb-phy",
>    		.of_match_table	= imx8mq_usb_phy_of_match,
> -- 
> 2.34.1
> 
> 


