Return-Path: <linux-usb+bounces-22475-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B5DA78E98
	for <lists+linux-usb@lfdr.de>; Wed,  2 Apr 2025 14:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDF2516F3BB
	for <lists+linux-usb@lfdr.de>; Wed,  2 Apr 2025 12:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FEB6239588;
	Wed,  2 Apr 2025 12:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="c0f9bThU"
X-Original-To: linux-usb@vger.kernel.org
Received: from outbound-ip8a.ess.barracuda.com (outbound-ip8a.ess.barracuda.com [209.222.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94845239086
	for <linux-usb@vger.kernel.org>; Wed,  2 Apr 2025 12:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743597256; cv=fail; b=Bdrdg6aCqYKVnasmt5dOScxIQSqRP2YUXi/KXsHcluE1x16V62MGzIk9O+x08BSWjiQTDrKja4HR+vZcNHDy5qdZ+aplT0aQai/AUK+KwvVr/tNfp6AtTkAVsIxWRZzu+hzZpRc0rY+DzASPtjPAGaDFXHLJ+lng3IgKAd/qqOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743597256; c=relaxed/simple;
	bh=jmncCogQ2eHYkY8qbradSScdywsbn2TQI195K5t/lHU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O84znblhRdcU7XRyFCSneZVP+zklFNtR1Ua8jYzwNTvIqzwD27tPi7Ni4LswFn0YVWPuUu21F0nOWmY9+VIpQiCVVU8I/lHK/d8y2HSZ3rjYEeivRzswexNKAqd3ioZu3ZeAzdOT3llAvVi2vP7K5kRUNEGyqxS5TrDBkleOIxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com; spf=pass smtp.mailfrom=digi.com; dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b=c0f9bThU; arc=fail smtp.client-ip=209.222.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171]) by mx-outbound47-58.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 02 Apr 2025 12:34:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+N0feTaBXrahTCpYh1B+pMj8bEohErRBZ8E8c5PQvVIaKrFDz/1u/JkIU6JS6J9s2D5by4T3UAVqklMnuSbe4BrRlBdz7FQYLxQR+3PzaNTUOpH2FPn4DnxbP1QQNNW+TeAc1PhDIsZJrhOWC8Ubk1gKMvlQkvZRW4msWLTQt7XTUf3nefKe68AZ1exoUAu8xEb0bxkTg5LU+nom4lBY0wp4Xs0hv3IfrYcQFuDZVmf0gVywGPTJPmpvDdxJmvgPu7pMwG0RNXGDhYcyM5d7mAlE21Wyl8N+ftk8WCjTJZWB5Ob2WzwQXIkNwibS300LutN7LPSjEo7AIJjGSvPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3XpnHz28ba22Fvr4c8XwlmlFkUmGmliCgL7/E3l1eg=;
 b=QtAnu+yz8HhiqZHnbVyGY35u8qymYd3kBIMoDTEElJ4Ct9BWVe2Tr+MquerPySpmBiYPLTmmymeAlyIq59kfBGb7VbXwDipeSeT95Dkp7xIaNZ1fP1DJntYir1RK6YLCQCzXnsHv214gpbyeS0fHlnI4bhdGz6UFXt2JbYIYy7214opvh7peuAMtEjW3LF4gSeU2n7mbtVM3j2LPk1hlPzcELvc815ZGBzEUPUCZa8TmpZxgskaBqFpihgpGt/Xn/28pUZrKfz7M6ec+CE6qNP2Cow+5b0Cyo4KDNo3Q6r42Y+ZF/3buChYuPfcUFGxklTGeT493pMAlBPHdR+9tkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3XpnHz28ba22Fvr4c8XwlmlFkUmGmliCgL7/E3l1eg=;
 b=c0f9bThUCPbvQw/qscuVOEqkf+ezFLDpETSV05OoY0QEuRQL+fWngVawSB3LkUflzsHR1QTMC5Dhg+p7EMjSukJp2W3uIS6IPcupY+9LnyPKExwwUTc9qSLrF6uoe8Sshc+in50CZs93+Pphk6B7Phe0JPKOQCwbqMzKCPKq38Dz1rnkOg0b4yI1r6R04DpzG+LBnzJtwGBqcXrLnvXJNTKGbCoBcW74fA3fO91ixKIT39uOu3Yvw+j5s7VbINdTvqy2fbJ/Qrr7zbX8wrONpf5LJv20QqJNJfpv+kfvqW/OFR9MGGUk1GTqgLMUUQ25jqW/BAsiYwWFeov/c8yKoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from CO1PR10MB4561.namprd10.prod.outlook.com (2603:10b6:303:9d::15)
 by PH7PR10MB6353.namprd10.prod.outlook.com (2603:10b6:510:1b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.36; Wed, 2 Apr
 2025 11:57:41 +0000
Received: from CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::ecc0:e020:de02:c448]) by CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::ecc0:e020:de02:c448%4]) with mapi id 15.20.8583.038; Wed, 2 Apr 2025
 11:57:41 +0000
Message-ID: <e73dd429-55c1-499c-82f1-f9553ce06cda@digi.com>
Date: Wed, 2 Apr 2025 13:57:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Handling incoming ZLP in cdc-wdm
To: Oliver Neukum <oneukum@suse.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
References: <bd07dc48-d6f5-4a95-9dc4-c738640349d1@digi.com>
 <ade69712-836c-4cd9-ba79-79b2d97fba83@digi.com>
 <dc8500a8-df6a-45d4-8ce3-1dad4b8f2413@suse.com>
 <a9bc14f2-7f07-44c0-96fa-0616402792e7@digi.com>
 <d1a9bfca-0c94-4770-b5a9-c7d0432dd476@suse.com>
Content-Language: en-US
From: Robert Hodaszi <robert.hodaszi@digi.com>
In-Reply-To: <d1a9bfca-0c94-4770-b5a9-c7d0432dd476@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0067.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::18) To CO1PR10MB4561.namprd10.prod.outlook.com
 (2603:10b6:303:9d::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4561:EE_|PH7PR10MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aef2c77-7a5d-41cc-1ee1-08dd71dd91f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?R2dLcWVCb1Yyd3FnSWJmZXFiQ0R0dEl5SStOaHI3M0RaQzF3eitVZVAwSkdy?=
 =?utf-8?B?QjNRUG9QR3hJcDh0NnlpMXRYNG0vUENlbmZ0SEd2K1lqTnBhRUd0c1M0OHRK?=
 =?utf-8?B?TG5QL2JRY2ZhdXVLVmppRHhuZWFrYzZMK3BJMnNjY0trWVlPY1BDZUhpMnhC?=
 =?utf-8?B?SkJlRzNTUzRYL3VYbjI5YnZrMHFKK0RtZERFdEpzcHMzalZZbVM4ZEZ6SjBZ?=
 =?utf-8?B?Sk4zT3RJMG1HUGNucU9kQnNta0h0ekFoei9uRWpxclRUSTdqZVpKY3I4djFU?=
 =?utf-8?B?UFR6M0IzR2QzTXpjVWNLalJBQXVKU05kOVFUL2ExZEU0SktIRXlFVnlnRlZ2?=
 =?utf-8?B?dy8vZ0ZUNjRGY09IeC9yR1ljMzBjTjVKUlh4S25YRE8vcWwyUmRyaXlTeW1V?=
 =?utf-8?B?K0Y1R0wwNXh3UmtTdllWQysrWkEvTU1KeldEZ3VJWkNUTzBlSFlDZWs4dnV1?=
 =?utf-8?B?aE1FbWhCRW92M29pV1RscmhWeExGeU1ST1FjYWExTDNtYTZjbHg3R3F3N3FK?=
 =?utf-8?B?SEpqZ25OaDRBeE9FSUFEOVdKbnlIUWUxdVFTaFlhRUxEcWhtTzFFbEh3amxs?=
 =?utf-8?B?YkJIU2o5dDkweE8yWnREQmc0bEJ3ZW1GaU9YVkErbit4MFZ2ZFhRZDM2bTcz?=
 =?utf-8?B?RmF5cTQ2b1FnTm1Bekd0czJLb25yNWQxbTlLYUtQYW1wcWhSL1dPbHMvZ2dW?=
 =?utf-8?B?WFdmMzhRejJWZktmVFc2bm5kRjNTRkVrMzY3SWRXdE10Nm43STYrdEUrOGhD?=
 =?utf-8?B?Z3JaYThOWVIvTDVqRlluOGU1Zm11YlN4cEtzblpHQjdIY1pSUDhwZ2F4N0Y2?=
 =?utf-8?B?ZWJGVUNNMW1vRGZCREd4S2dLRlEvOFdPckhwejM3NGdTdW81ME15azJDLzdK?=
 =?utf-8?B?emRCVzhVQlZ6M2pSblZXZnNienpCdk9yVXBDaTdnb1psZHYxdzI2NElyd3Bw?=
 =?utf-8?B?QkV1VEVrSkJKZDlqdUJQSXdQZ0g5M0dDWU5ha25udU91d3lTMGZQRVphdWRR?=
 =?utf-8?B?Umo2ME1qUlBXZnFWWlljQXVOaDVhVHVSYWRKZ04xV1M0OGx5S2xDNTNBQkFX?=
 =?utf-8?B?b3NrM0tTTC9wY3o4OHF5cHZOTnJ5dFV5bENJZHZmL1dHMThoSDBpZGduWjBR?=
 =?utf-8?B?ZzA5OUV3aFpwWnNJalBPRm5IeEN1aURLelZ2S0RoTDE4ZjdPblZuN0RrVWdE?=
 =?utf-8?B?OFgzUmZETk5iN0d0V05GUEtXSDZKempxTUtJejRoVkFvcUNZZGxHVEI0a3p2?=
 =?utf-8?B?UitzbXhDV04yVkJTMVAxYkhlN1FGejVsSTA3NEtjQWNWbzMwY2N3TGxlNkFU?=
 =?utf-8?B?NlJxdW84anNCRTVwSTJLT2IwYXA2TzRQMldNdVVPVGlGMWpPUndiUUNGWkto?=
 =?utf-8?B?ZW8xSjdISUp1WjlWN3lCUTJTOUo0WVZhYVBCcURyZTNSRUtMN0ZBeUt2YURO?=
 =?utf-8?B?M1FPMUcyY3d6bG5GbEF4dkNKTGlPT295NGRna1FPK09Lb1p0M01zMFJuMkNB?=
 =?utf-8?B?YjdXMEsyK3ptVGJRNlJqcEtuMlFDWWFDNFBGelcrOXFWdzRVcWtxR0NFQWd2?=
 =?utf-8?B?blNvM3hNUnJIZzBYK1ZrblNlZUU2UjZGYm9BVVhrVjUvVE41alhiSFZtTUVj?=
 =?utf-8?B?WUVEV0wyZGlCUlZ2cjNYUTRBQnlOVkNnckg0N1lOTDJsWTBXMWlacm1xZkND?=
 =?utf-8?B?T2U3OGgxYmhYS0hlVmlZTTlneW50SDdSNnZjcnpMU1psbDR2WkRUdzlRR3Fx?=
 =?utf-8?B?ZGNUVmwrNVh3NkZLazl4dUk3TVR0MmR1WmNHOVlkZmNMNjEvVHJTalBnN1Av?=
 =?utf-8?B?aWwrOUZFdzhIUXBmdXZBMWdJb2hBZE9udFcwc05GY3pzTFlXWjdmaFJPYnBs?=
 =?utf-8?B?WjNWVGpmVlN4TDh2c2szcHhRdDVPNklyZ0ZGeTZob1VaNmpuWUg3ZmtLOWJU?=
 =?utf-8?Q?vCWLrFKyXpo=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4561.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OFpqOC9hem5LYXFBb01lTERrVldkTFZ4QjBqL0ZLcENIaDZoVGczamt1VEp6?=
 =?utf-8?B?RDlWbmV1Q2wxZnBzaFJLR0V4MU52cm9QUFNFSnA1bmJ2NGc2U1R1bDlOL0ty?=
 =?utf-8?B?QlpmUVZoaFJJRVMyT3Y4NFZzOXgwczlVeWxnaXJIdVJZT05KWDlIRHN0QnhY?=
 =?utf-8?B?VXB4MkpkcG85czRVYndHNWdJNkV5NlF5ZHY1UlYzQ2Z5MU1pZ1lwQ296czEv?=
 =?utf-8?B?SGNqN1d0VDhwbTh3ekxMUVF0aVVsSGhLNEkxbk5OVmpMZjJtUVJTbkZuZU90?=
 =?utf-8?B?aU8yTnE3SU9SN0VXOWp2cVoyajlVQXdyeTF3alZWMXdBU1JESEVTQi9LRmhV?=
 =?utf-8?B?ZEhBU1VPb245V05URSt0T0hlNUhUVTkrVmQvRGNKTWtxbjlYYWk1UG1kb2Vj?=
 =?utf-8?B?RlFsdEJEQnd4bHNJcXlSZW1scEJvbDRSMmFyTlJxZjRRZUg1NEdFSG9wbGkw?=
 =?utf-8?B?VTNwaFVaVERjM2JleXR6OTZOdmtRS2I2UmdyNTNHKzBSb3BXVis2bXVtWHFZ?=
 =?utf-8?B?NlN3V1d1UmM1cWlPTDJ1UzlpZitwTG1KdlZ4QTBYU0kzMFlvdDFNMzlBbHRr?=
 =?utf-8?B?YVBtbXJqYndTSUhhcU1FSVozR0Q4VFFmY0FnMHFBQXV4SEdkbGpZR2xUdFhj?=
 =?utf-8?B?eVFMK05oZURNVXYwNEFaU2lndWYrazViSTBpSlFWVkQyNy85MjBOU3J6YVFZ?=
 =?utf-8?B?RmZwZjYrTVJ2Vk9jMW91VkRTY21MN3MxWVFEVVQ5S2dmejAzcHl5Q0U0b29V?=
 =?utf-8?B?OW9KbExkU3lsWHEzZ2dIejhkRG1YNmhRamN1UDRMVHgzWmlnQUsvZFhLem93?=
 =?utf-8?B?bnc4b2FoTVRTdHJzSStJSlcrQmdSTGQ1bjM3MDN1Y2d4V2U3WGtTcmU1QlFP?=
 =?utf-8?B?akhjTkNXUzlXOEZTRVZiNkFqcjdubzBGMFFCdjlXTnFCQ3dZYW5TNFZNemlB?=
 =?utf-8?B?VmFNdEc5OUlab2l0WXVFV0x1Y1V1bXFtMm9QUHcreWxGb01obVR1T3UvcWN3?=
 =?utf-8?B?SGNrU2xsWDFHaDRyUG1Ucm9RWmgxcUJhTFh2aDN0Zm1zemFQemFrWDZEVnFk?=
 =?utf-8?B?QmN3K1hiQm5aVVd3TTJqV2dMTUFjRkkrdnNiVTR4b0hoZE92dUZSa3B4ZnNL?=
 =?utf-8?B?T202eVV0QWg4K2JmcVJ6Uzd0VFFCOWluUHhPaHdMTDlpcnpWaFN0cVY2NTB3?=
 =?utf-8?B?eDQvVzVOYkhJaG5XNXVZL1VMYVRvZUZ1OUE1eEwxNy90Rk5CdVNZWUFhenhO?=
 =?utf-8?B?QU85MTUrRmdVVWh1bHF3WG9XeHZmRStoWHJ3b2hiemQrRDRtRTREOGxqelAx?=
 =?utf-8?B?M3BDSWxQbEV1NEJXM3gwVGhISWQwMnR3THYyeHdLbXhyQnpJSHRvQWlVVlZC?=
 =?utf-8?B?RGdlNTBZbHpvcVdZeWpFUWpITTcwRkl1aEFra1U3OG53M2hVVFZzRVMreHNP?=
 =?utf-8?B?MHgwaktPRkJUZFhVSkVYUXdJT2ljY1FQT2JlTUhDa01HNWNtWnp3SHl1bHk1?=
 =?utf-8?B?YzY3am5tQ0hKbUU1cHhnU0doQ1BkSXdSdzRQY2UwNlNSUzdjZlNDVmM3N3dH?=
 =?utf-8?B?Z2tjU2pJeUg5SUJsME8zTE9vNExDQkhmM0hmUW1qZDJ0cnA2RFBtNXo1L1Ar?=
 =?utf-8?B?c0Q4MWNHci9nR3BCRU1yWnd3SHhHVlpVLzlTRHZBLzBxcjkwSUdtajFWLytq?=
 =?utf-8?B?L2d6ZEc2Vzlhc0xwK09UUW53dmdTWjFyWjAzaERRM2V6dVVQWndaTzdObHox?=
 =?utf-8?B?Y1krQTZzUFFkelBsMnBwaS9LTTNKTUNMZ2dUTGw1RWZhSkxTOFNTTWVNUTBu?=
 =?utf-8?B?eDVsc0gzajRUVjBNdXhhWDBCL2IzZUJad09ad29jOFBzRkNBeEgzRFpOQ1NQ?=
 =?utf-8?B?djNNRWUzZm8xMjQ0VTVtY0tHMDAyK1dqd1FvTW1FU2NLdFMza3puUmZtdDdY?=
 =?utf-8?B?ZnU2d2FNWjRvcTM0cnc0NUc4M3J6NjZodG1NQW9EaW9Id0lPL3JtWlhvRTZO?=
 =?utf-8?B?S01sZXlDMnJGSXRNamp4NnF2MHJrU1BwT2ZNYWZ0RVRxaXpwRFJTd1VkWk14?=
 =?utf-8?B?UjRRZlFsc3JLUFNaOHpTdzVONHN6UE1FZ1lPMDJTczlHdms2T2VWaUUvVG4r?=
 =?utf-8?Q?2zEV0kHYcykJxIyPArpXlKmSv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aef2c77-7a5d-41cc-1ee1-08dd71dd91f6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4561.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 11:57:41.1086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b4yAWaZHSm838zVX11Y3yL6LJQth1Ne/JJ0KbtXRemh9dtaQZZQcy4D/nWyU7XgrdlB1tTusdbgGqwDC8ZoHSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6353
X-OriginatorOrg: digi.com
X-BESS-ID: 1743597252-112090-25729-14829-1
X-BESS-VER: 2019.1_20250401.1649
X-BESS-Apparent-Source-IP: 104.47.59.171
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVmYmFkBGBlAsMTnN0CjN1CQ5yc
	jS1DwxydQg0dzEEkgkmlgamVmYKNXGAgAxrtjwQAAAAA==
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.263597 [from 
	cloudscan8-167.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status:1


2025. 03. 31. 11:59 keltezéssel, Oliver Neukum írta:
>
>>      3. we should not set res_length to 0, otherwise  we get stuck 
>> again (actually, should we clear the "if (!desc->reslength)" in 
>> wdm_read(), since that's is no longer possible anymore?
>
> AFAICT it can happen if two threads are racing on wdm_read()
>
I'm not seeing how could we get stuck. I think, with the patch I sent 
previously, we can just simply remove reslength as is, as it is no 
longer used. Nothing sets it to 0 anymore, as in that case, the setter 
gets skipped, and the only consumer is wdm_read(), where, it is only 
checking for 0.

Best regards,
Robert


