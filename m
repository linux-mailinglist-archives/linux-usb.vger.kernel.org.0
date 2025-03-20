Return-Path: <linux-usb+bounces-21968-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA7AA6A7F0
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 15:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8207F1B64E95
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 13:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6A9221F12;
	Thu, 20 Mar 2025 13:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="XSzgFIPa"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2087.outbound.protection.outlook.com [40.107.249.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688EC1EB1B7
	for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 13:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742478978; cv=fail; b=YTJecCoTrogKnHvvBfSRqM7u5qTR1/Gm1RqrGX2h1ae1mz2FIpoNRVIl8MQrYECD+jVO7fwD+uwMtErDwyVOZiHWPh/MGwlQfZRpjYjiXqJuz793i5oVm/TRvpmgiqyxxmXXQGkclXzxGbUGQSfHNnucv+WWxVQESkXtlb9PrP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742478978; c=relaxed/simple;
	bh=IyikGsiFQFHGmxnPrjNqnoB91XpbUDxmPsQCmwdprzw=;
	h=Message-ID:Date:Cc:From:Subject:To:Content-Type:MIME-Version; b=nOtS/HVeuKTPKEVGWVm2FadCBcC6d4jBD0aBGvu7g1yjF3VZZ49eMMaGdKyC2qKV946VaYoKqmHIAeLQ3hrOTLmgEiIfMqNLGQfNAc679jAXyEhLm23/dAOFzTlKXIX6CE8HDKS87U/qtk+/nBN+genHmUzgUMV+drl4ntV99CE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=XSzgFIPa; arc=fail smtp.client-ip=40.107.249.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3LNq0/PtyTG8IgPzfD9GCAc4g/pVzzsJrJoLT7DmsuUJo6K3To6aLXZLhOGGk9yLHl4mWecHzrduYtBecabJRy2cijJQBC10w3MGYfqryEDEUJp0UPnz3qXv8eGnKhi4XKvDsKYLGdyS76v4+LCf9ttzL2LccXSx8px/O1rt+XQlccG2XIYAkn+OAaPVegdUORtajnuZmXW4DledBfcaFnwCuguXoWLhwhsgo5VRLRO0/+KtpEKF2KupwGvKgc3LFKu7OHtiAZerfMJb+jYP7QJTeXyRDQT9hDRLOa8b2gF8UrkN4btw9lWhGMdEmUmXd9RUIryM+4mA9Zo2hs2Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUKkpaq2Xh7Srk5h3/ZmHLof88r7s3AtNvrVaUtFtks=;
 b=WdTdoN94MabVO0/g/ZtLCw6s2drH3HduQgGux1QhHl09vrROdVCT6oj5aoHUPnRj72ubEMHLwCKoAa2wZ2B/Zk8eH7bRfxp2uJhbl+uluHcxfuVtlrQNjoMWAkiW0WwCV9fFRdR/KtZuxrtcnnpg7KOEjhJSgR5NPPIuM1dNqKD5LgRjf5d+gdrHDF5oTL/WNXw59exPecHdO2a2UQCxJDIpjkfPa7hi5B2eA0XaBJ2GH8qcQp9MCUKlU2x1kpbsnttR+uZuFYYJQdhn6lVtScJ9NbDCaE55+qX3bI39n/y80sB/iUWxd9DTzgFLReEjgjYy8uhrgUVJIwQuutR0kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUKkpaq2Xh7Srk5h3/ZmHLof88r7s3AtNvrVaUtFtks=;
 b=XSzgFIPa0QTWylXeRAvZCAa/vzGLg3OzozcwCG68xa4qQ5QL6dCJoO8PVx8bgAIfn/BFLpsMUF/gb+ZpUPRH60BKp7h2wnejS1BXp5qlvb2pHGk0c9qWgSmiJ9NAaG5ipgubGttcqs+jf9YvT4eHISHLD2TT+8QWgk7ZU5bxOlc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DUZPR04MB9746.eurprd04.prod.outlook.com (2603:10a6:10:4b1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 13:56:11 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.031; Thu, 20 Mar 2025
 13:56:11 +0000
Message-ID: <939f75e9-7d17-4627-b19f-71e286d11256@cherry.de>
Date: Thu, 20 Mar 2025 14:56:10 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
Cc: Heiko Stuebner <heiko@sntech.de>,
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: Discussing some limitations of USB onboard devices
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DUZPR04MB9746:EE_
X-MS-Office365-Filtering-Correlation-Id: ea13e31f-d390-4f13-0c53-08dd67b6f886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZWhqVzJKWFNyaStoTkRTUXJlSjNSRkNQdHE5QTA1RDVCT2ljKzRvWGNTd1p5?=
 =?utf-8?B?U3pwTzJodkZqSUlQeDc0MTlzU1kxd2hOM21OVUU2WE5BMWxzVVNHVWN2SGJ1?=
 =?utf-8?B?RmU3SmdaRzkwYU41UDRJM0E1MDlncnduZzVjT3hoZmRHU0lYR1lEaTlPdHJY?=
 =?utf-8?B?T25VMFdJSjVKWXFuTFlVK1JKZ3U1U210ZCtSeWtLcnl3d2dDOUZTUUdpYnRG?=
 =?utf-8?B?SlNXem5sRFdrdkcwL3dMdklGQ1Mxa1hjU2MxVjc5YVlReFFocFpJVHRPa1Vz?=
 =?utf-8?B?UFFsN25qZmMrVCt0MHhaVUl1VFg1TWNnS0gyWEgxWTA1cFFrN3NCcnJEeGFy?=
 =?utf-8?B?RDhJYVpRYmxieHhtNFN2SFdoTG9PMGdaYUdQS2xYMEpSdkFEdG5Na0JSQURn?=
 =?utf-8?B?eStNS3M2TjRTU1ZkMHdHa0JMdTcvVWEzeWViYXl5US9BbUZpUEswR0pESVdw?=
 =?utf-8?B?ZncvYzRjRWRYZFYxZUFLNEExYzJFYzUvZHB1SG9QRk5ZZmJnOXF6aERhUk1O?=
 =?utf-8?B?cW5QeWdWV2xNNjNkY3pkbXRxM0lvVHp0TmZ5QkxnVGNDK29hZG1ZQW51K0g4?=
 =?utf-8?B?a096WEtreTJuMHFLWmZNbXdBN3RuTjAyTW9OSG1Ec3lWeXUrbnltY1REUkcr?=
 =?utf-8?B?eTlYdHQrVU5hYzFwSFczeFI1Nm5hdjN0dDhidG1xZjhRb01sNmhGNVlJNVRk?=
 =?utf-8?B?MUU0Skg1WFFDeEtNNml4a2pVZHpldmppWkdKUXQweU16SXFhTFdlbXE2TW1U?=
 =?utf-8?B?TEFveDRaaGVYaW9FWllKZ21PQWgvbUxURzI2cHNTbEN3Q0ZCcUgxY0dnUkU4?=
 =?utf-8?B?Q3V3YUVOSHUwS0dhSmk5Q1AwYmtxdEJIYmlIYlR1SElVYllnWW9vTXlBSGht?=
 =?utf-8?B?MURodzZxVzlBK25jdC9EZEdGaHRiTUpLNWNRMkhuTFEyWldhV2Z1UDBKdDRt?=
 =?utf-8?B?V2VVTzRCTG9wQzNyZXpRUk1EN0FHUjBiZ2cwNERSTUdzbzZuekw3elhhK3Nn?=
 =?utf-8?B?cHRNR1QrV05rZDNLREViaGUxbmlPVDFKdmlTRGJpL0IzYUs5ZW1QSEU2THJG?=
 =?utf-8?B?Q1hIajlsOFFvb2p4ZHpwcEtwUGVCWkJLU2NIbXBoWGYxRTVPTHExQmZVQTRx?=
 =?utf-8?B?UmhaQVV1K0xnaEwzM2h4R09MZWdlNlpOWTBQS29TaEdnSFNoVmhYZk5vYUFV?=
 =?utf-8?B?M1hha0wwcG9ydkpjUytlWGtLNnpkR24ybFBGbUxXdENES3dSNVhITkdZaVhm?=
 =?utf-8?B?VXQ0MStoWWQ3WDE2WUZTQjJkdWZNTDZHaHlneThKQmllVkZIQ1ZQYmFucXJH?=
 =?utf-8?B?NDVvMGovbGJKbkZxMEZ4VjhtSDVNSTF4Z1pLVzQzUTFjZVN5Ti9iWjY1aGU2?=
 =?utf-8?B?V3hhUk9HT2ZNaytzTzB2TTI2Y3RWMHZpaFJJNWlVd1M5SS9DUjVKZTd1VWx4?=
 =?utf-8?B?YTNMT3VwUTBkU0gwMi80Um84MGpnLzhsSFJ3QjQ4OFZKcFQzTWFqOFBSNmd3?=
 =?utf-8?B?czBBSFhZWkd1YnlqNzk5V0MzT2hQUUdDR3ZodmlQMEtHZzRDSWdqQXUzeC9W?=
 =?utf-8?B?SDFQQ0hKcVkxU1hzMW8rRU8wTXQ0eGs3bFNaS1JJUkMvd0RLbUZ0Y2pEYkNv?=
 =?utf-8?B?dURuZkdPcFdnamRxYU1HM0d0dVlYd0xsT2d2V0dvK0NndGxLazdyYmU5dkhF?=
 =?utf-8?B?ME84eFhZdEFwelg0VkcvbGtTUGIvcXd4UTBja3UrVk96NDk1dUdpUGRzWXNx?=
 =?utf-8?B?L281LzVsY0dON2JUN001Zkh1UjJtZHc0Sld5UURkUUpuakVkeUgvY2w1bWRv?=
 =?utf-8?B?bmlId28xZTJHQStCdkQ0bFdBYmFHalhYYnJzVEhQT1JOSUFLZEQwMmN1b1R1?=
 =?utf-8?Q?L5Ylr5QA1ntc+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzZWQ2g0bzFNWXJvWkF1bkFucnR0blJ5SjVCNG5KemZ4TFhtTDVqUkt4ODR4?=
 =?utf-8?B?WlRyRGNLaER2ZmM4RndQeE5EUXI0ZzlBc1NIUm00eURtRS92aFo0KzI3dm94?=
 =?utf-8?B?QXN5UHI2c2ZBUkZmbGphd3RzMUYzTGVQdUM4bFhJaGhiWEhvNGtrbCtUcEJi?=
 =?utf-8?B?ejBTR05kOEhEZVRwOVA2ajdyalhaMEtYRmh3a3JRYmhVWFVUOUlnYnpsUUFY?=
 =?utf-8?B?eDdGa0UySW1oaFJXQldLSXF6RlY1dVg1V1FQZzRTOXJoQUQrQUlyL0FkdXpH?=
 =?utf-8?B?UnNXY3p2cTJESFVKUE4xaUpUNno1SU9yRm95N2I5TmNhYlRFQUpxUnJWZXVK?=
 =?utf-8?B?QlN0ckhuUzJtUGZicGkzVU5takt0MjBLcE1jQzR3WWNJdFJvN3F0b2ltcnJK?=
 =?utf-8?B?SU9nWTdETjg5NlE1ODhubTJaQzJTSTBtVmVzV20xRkYxRmNTbWU0N3ZHdGRO?=
 =?utf-8?B?R3dRNXBnbmpibklGZ0EwUGNqUkQ3bEFXdk9qcDBFLzhhMWFwZHFrV1JJVGVz?=
 =?utf-8?B?azVQL1NjcUJmc2svM0dZTTZwbXFpQ3BudkplKzR2Vm85N1FkNGJudndvQ0x0?=
 =?utf-8?B?dFdPS3I0TDNBUWlHUU9VNUtzTkNaTm5Gc2xzZ2oxd1lHSU5PSEJvNW1oSW5p?=
 =?utf-8?B?L0sxRFJZMUlKQ1hGMTJvdlJCZ2E2dXVKSmxkRUhnRjBLc0hIcUQ0TGlpV3Qy?=
 =?utf-8?B?eXN6cEJtVEM5eE8zaHplQ01QbzdNM1lPYVcwOE5NWVVFV0JQVGE3cDlHdFU0?=
 =?utf-8?B?QkhoUUtDTmtKNTNLVVk1ZnBmdU9FQmY0VmlxMnFDczhiWVBldUlVZDNOKzFa?=
 =?utf-8?B?YmM1TmJqekFyTW5tT1ZaUm83ZWlEQStLUnk4TTdqekM1MEozVndvOHdjTENs?=
 =?utf-8?B?b0JobWFjb2Y0SGhrcXJLNDhXQVkyOXB5eXAwSzJzUW1NTkMxZmdWZE1mRlY1?=
 =?utf-8?B?Vm1iL2tpemdxOElzKzF4M0RVeVkyS21kZHNqOVptVHZlNTZlVTRMcnowWVYz?=
 =?utf-8?B?bEhvTzZWUTN4VFQxMHcxWVgwOVMyckJuamtRa3dLUFkvU3V0bE9NOHlsVVFp?=
 =?utf-8?B?RyttM0x3Y3JGekJjOHJDZkk4Z0lwczEwSVlOYS9SY1RsTWhFQXpVdjZaSkpB?=
 =?utf-8?B?ODFDQUk1djhxaFNEbmdHS3ZmTGZZRmFzL0hPRUJnRzRMSDZqQkdtb2NOcUZQ?=
 =?utf-8?B?cERYdlRCYkpqNHNyUVRWN2kzZW4rQnJVZ1I1YXFuWU54RXArVnVmTWg1ckt4?=
 =?utf-8?B?SkZCTFJyV1hCRjY3amNLam9wdkhOMFFlQitJQTF5MVhRUWN4a0IzTDl4ZmVn?=
 =?utf-8?B?S09seXVlMUlRNDBTR0FpMm9tY2x0SFdyOEg5YUNmU3pyMnBmeEZhcWZIUXRL?=
 =?utf-8?B?SkRaSjNYd3B4UGRuVXBMdS90SkJBeit6ZTZxZGNyNWU5Q2piUlRYdXBmN3hm?=
 =?utf-8?B?VlVCaC9PeEQxejY3bEphNXJodk5ublpOMW5BL3p2dVhBYVQ4VlVDMzhsM0Fp?=
 =?utf-8?B?YStYT0U0M3ltK0c2ckd3cVF3aGpkVFBOT3E5MzBndXo3Q1QzUi9RYVp4bURj?=
 =?utf-8?B?YzFiS0tMdFRYNWljQU1oMDFhd0xnekVhNEVhdUkxa0x5N1pBNnVKQnBGUWZ0?=
 =?utf-8?B?WUlCN1RKQnRmdnZPdHlvL1pORjJ4YXl2T1laVTJKbHBJY2VRSFRFTFpPckVY?=
 =?utf-8?B?U2hUREUvUTVpenBOZDFyRXdjMmExWXVFUmNJUXh3VXNqaVFMQVBrR1lxeGoz?=
 =?utf-8?B?M0lobnhJeG9LNlJyTTdrUS9TVFc1WEZuWW4yTHh0MCt0M3hFaWs3aDRFQmp5?=
 =?utf-8?B?cDcxU21BRGlBWE9iTWdjUThuaWdHbXoyNFV4SFNvUzZNVE1yb1AvcmVyY0Q0?=
 =?utf-8?B?ZzJYajRpNTFkZXd1ckNWM011endwV0lqaE4vRUJYdXF0b1lCeUZUZEJXYmNK?=
 =?utf-8?B?alVBYm0xUTFqL2Y1MGlERHhSN3Q4cHpFa1hIWjcwTFM5Szczay9FTjZWRGls?=
 =?utf-8?B?STRCckxWa1RFNS83bVh2Ri9icVh6eXg0bWZkbE90MDBJN3g5S29YRE42NzNi?=
 =?utf-8?B?MEtRVjFEY25wb0RDcm1qRzhtMUl3WFl3N3NUQ09hSlhQK2hOLzZEREo5MWtV?=
 =?utf-8?B?dUp4c1pFL1g3MzlXM1YyTkRwRjhscXpKWkF0ZUpzVCtzcm54am45ek1zKzB3?=
 =?utf-8?B?elE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ea13e31f-d390-4f13-0c53-08dd67b6f886
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 13:56:10.9986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5n2iAsffX82hBci0ZFDmU8tAgKu34XYUNXAlJ+KfNJC3H8kCliV1PxKiKdEg2beiTdQj4kLdlPIrApX+cvt7nveX0RnqFcqSBXo6PoQpxMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9746

Hi all,

We're working on fixing the Device Tree for our RK3399 Puma board to use 
onboard USB hubs instead of some hack we currently have for handling the 
reset line that is unreliable.

This is the diff I believe should represent what needs to be done for 
supporting that:

"""
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi 
b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index e00fbaa8acc16..7aa260fc9dda7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -60,16 +60,6 @@ vcc3v3_sys: regulator-vcc3v3-sys {
  		vin-supply = <&vcc5v0_sys>;
  	};

-	vcc5v0_host: regulator-vcc5v0-host {
-		compatible = "regulator-fixed";
-		gpio = <&gpio4 RK_PA3 GPIO_ACTIVE_LOW>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&vcc5v0_host_en>;
-		regulator-name = "vcc5v0_host";
-		regulator-always-on;
-		vin-supply = <&vcc5v0_sys>;
-	};
-
  	vcc5v0_sys: regulator-vcc5v0-sys {
  		compatible = "regulator-fixed";
  		regulator-name = "vcc5v0_sys";
@@ -527,8 +517,8 @@ pmic_int_l: pmic-int-l {
  		};
  	};

-	usb2 {
-		vcc5v0_host_en: vcc5v0-host-en {
+	usb {
+		cy3304_reset: cy3304-reset {
  			rockchip,pins =
  			  <4 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
  		};
@@ -597,7 +587,6 @@ u2phy1_otg: otg-port {
  	};

  	u2phy1_host: host-port {
-		phy-supply = <&vcc5v0_host>;
  		status = "okay";
  	};
  };
@@ -609,6 +598,30 @@ &usbdrd3_1 {
  &usbdrd_dwc3_1 {
  	status = "okay";
  	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cy3304_reset>;
+		reset-gpios = <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
+		vdd-supply = <&vcc1v2_phy>;
+		vdd2-supply = <&vcc3v3_sys>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb4b4,6500";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cy3304_reset>;
+		reset-gpios = <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
+		vdd-supply = <&vcc1v2_phy>;
+		vdd2-supply = <&vcc3v3_sys>;
+	};
  };

  &usb_host1_ehci {
"""

However, this simply doesn't work for a few reasons.

1) pinctrl request is broken, I get the following error messages:

"""
[    2.979479] rockchip-pinctrl pinctrl: pin gpio4-3 already requested 
by fe900000.usb:hub@1; cannot claim for 1-1
[    2.981799] rockchip-usb2phy ff770000.syscon:usb2phy@e450: Requested 
PHY is disabled
[    2.981846] xhci-hcd xhci-hcd.4.auto: xHCI Host Controller
[    2.993129] rockchip-pinctrl pinctrl: error -EINVAL: pin-131 (1-1)
[    3.002141] xhci-hcd xhci-hcd.4.auto: new USB bus registered, 
assigned bus number 3
[    3.007936] rockchip-pinctrl pinctrl: error -EINVAL: could not 
request pin 131 (gpio4-3) from group cy3304-reset on device rockchip-pinctrl
[    3.023446] onboard-usb-dev 1-1: Error applying setting, reverse 
things back
[...]
[    3.131038] rockchip-pinctrl pinctrl: pin gpio4-3 already requested 
by fe900000.usb:hub@1; cannot claim for 2-1
[    3.132598] dwmmc_rockchip fe320000.mmc: Version ID is 270a
[    3.136997] rockchip-pinctrl pinctrl: error -EINVAL: pin-131 (2-1)
[    3.142490] dwmmc_rockchip fe320000.mmc: DW MMC controller at irq 
81,32 bit host data width,256 deep fifo
[    3.149860] rockchip-pinctrl pinctrl: error -EINVAL: could not 
request pin 131 (gpio4-3) from group cy3304-reset on device rockchip-pinctrl
[    3.199221] onboard-usb-dev 2-1: Error applying setting, reverse 
things back
"""

This can be worked around by using the HCD node to store the pinctrl, 
but it feels wrong to me.

Another way could be to have a pinctrl-names differ from "default" or 
"init" (e.g. "hub") and handle that directly in the probe of the 
platform device to avoid triggering the automagic pinctrl 
"default"/"init" behavior pre-binding/probing (which I assume is the 
reason for this error?).

2) I get error messages wrt vdd/vdd2 supply for the second hub:

"""
[    2.564690] dwc3 fe900000.usb: Failed to create device link (0x180) 
with supplier regulator-vcc1v2-phy for /usb@fe900000/usb@fe900000/hub@2
[    2.578928] dwc3 fe900000.usb: Failed to create device link (0x180) 
with supplier regulator-vcc3v3-sys for /usb@fe900000/usb@fe900000/hub@2
"""

I assume this may be because there's no device created with the OF node 
of the second hub (the second device uses the platform device and its OF 
node from the peer-hub, the first device to probe; if I'm not mistaken?).

For that SoM it isn't a big issue because both power rails are always on 
and at boot (like, enforced by hardware), so it'd be fine for us to use 
dummy regulators (e.g. not having the properties in the first place).

3) reset-gpios (and probably other properties like clocks, i2c-bus, 
etc...) need to be identical on both hubs.

Otherwise the first hub to probe will be whose OF node will be used, so 
if properties are missing or different from the other hub, we'll just 
handle properties from that first-to-probe hub. I assume this is fine as 
we expect peer hubs to use the same reset GPIO(s), clocks and everything 
else as they are seen as individual physical entities and that's the 
expectation of how the HW is functioning? Should we (can we?) enforce 
that on the dt-binding level to make sure that is the case?

What are the recommendations here? Did I misunderstand how to declare 
our onboard hub in the DT? Did I misunderstand some internals of this 
onboard hub driver maybe? Is there anything we can do to improve that?

Cheers,
Quentin

