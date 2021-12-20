Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4B3647A5C3
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 09:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234685AbhLTILP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 03:11:15 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:19148 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229754AbhLTILO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Dec 2021 03:11:14 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BK7WCvI009962
        for <linux-usb@vger.kernel.org>; Mon, 20 Dec 2021 08:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 message-id : date : to : from : subject : cc : mime-version;
 s=corp-2021-07-09; bh=+2Te9vqpE3gsWqo17rkLj93pGERCmYECo667EZGAv90=;
 b=hJPwMMaIQBPlL+2yAAEN/FUuqBVIbew9WEl4FCB9Xjk0105Xaes0IUyT7P+nqyJ7gO6F
 pRkc48ksMUsdac994X/UFEjPyCpOUKffWi+J4v4Xze7SUpmmp9JF889tFfkhkhBE3es4
 w6gLUFjDPDFSByPhFYrxUbDtivH59rO30nqFRd2ksh/Lb6QaJmSRUyjEWDeje8A3Ud6E
 5vRjgFvrIJ9qjgKWihFDF9fpdpXaJb1xOGon5T0Owe2DQwcd2r16QetRk3VSO49RS9Lg
 HVF8WYSWz1H8JFyvRf0/iQ7sOF9WTfFmgnZ71P08mWvIZd/rDnBkzvSyd1PXGz23Eqj0 xw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3d178t2qd7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-usb@vger.kernel.org>; Mon, 20 Dec 2021 08:11:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BK8AZYm176641
        for <linux-usb@vger.kernel.org>; Mon, 20 Dec 2021 08:11:13 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
        by aserp3030.oracle.com with ESMTP id 3d15pbkd15-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-usb@vger.kernel.org>; Mon, 20 Dec 2021 08:11:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgZVJbuTEVwB7oJ1l6UF/5U7ZijUqmfJ9wWrGOd9yzVmv9iupEtpcWWXdT5z5xGe/J2wwmP7p96dyOKbtaEsKrW5X00HLL20u5BEH4SoAE+DB+SC4hydwwWyKxwaFf1V4gToP1FJqq7qGfzrAlwIxESRIRrQK+fkrbnvC/Yyeetz6AVZgZUJ2IQI4+K/AqKVYjqPB74z2XWygLGZq6nxVnjAXksD6UReB2YPBm2imnSM1Yb30kIFZPCaoEAMhit1UUhCWGFmJG6GCUPG4LJKWLyMoNEr1EzToowav5wCgPJhnJ7IEvVFB2xgW1LRWTCfIAXt8d8dtrQ04V7uH9+nDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2Te9vqpE3gsWqo17rkLj93pGERCmYECo667EZGAv90=;
 b=SLBwGdJKB+SeEVqlqUtYuL7Xaum+zOqr9QG5JU9rDs+qGfS4vPGgHXSrz/3L6lINSL1ONGowGgp7yns9As5wSkj9vALm0sR5jKZ5iepVKsKiidV12Vw9e4SE8nR4RaiPk8m2/bqNt9pbSfPxuPqZHleJLM866+0kZz85lMbNFkACD/klj33zvod5NhoMmTmEkg31UKvnj/KOLpk40M+o2Q7eLVAl5mC2JlpPHldo6heU2BWwKD0OjbvodnhxTZZxcH6J3P21TOiGhJUf5NCOCM8Th0bYTh5V+iYIe0WlzAFoJ8xhHh2NXYjjDas4mBdfQ+BUjBGgTTbeLrVus50wxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2Te9vqpE3gsWqo17rkLj93pGERCmYECo667EZGAv90=;
 b=wBeBVAxTDVNroDDPIXfJaJkNiYdDWLo6s2k2oTjpc/KcdwgYt2UQ+bp8Vk0hnh8tBrC50SMPypYVJ7L5qxLfX9aWPGVGlSzgwxTNQYpxojW7YRxxTiqwZ/EoXcCmb0hJb9SLJ106L8X06n6EdqbuFmYUJ2zQe/xtPzL7lzjcKwU=
Received: from SJ0PR10MB5567.namprd10.prod.outlook.com (2603:10b6:a03:3d8::20)
 by SJ0PR10MB5488.namprd10.prod.outlook.com (2603:10b6:a03:37e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Mon, 20 Dec
 2021 08:11:11 +0000
Received: from SJ0PR10MB5567.namprd10.prod.outlook.com
 ([fe80::8926:1593:38e6:d05b]) by SJ0PR10MB5567.namprd10.prod.outlook.com
 ([fe80::8926:1593:38e6:d05b%3]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 08:11:10 +0000
Content-Type: multipart/mixed; boundary="------------YUaZiXaYC8HUX6nXxRqmbf6z"
Message-ID: <738e20c6-c709-d149-fe48-ee89540fe38a@oracle.com>
Date:   Mon, 20 Dec 2021 09:11:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To:     linux-usb@vger.kernel.org
From:   =?UTF-8?Q?Filip_=c5=bdaludek?= <filip.zaludek@oracle.com>
Subject: data throttling under load when serial to usb adapter is used
Cc:     Konrad Wilk <konrad.wilk@oracle.com>
X-ClientProxiedBy: LO3P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::11) To SJ0PR10MB5567.namprd10.prod.outlook.com
 (2603:10b6:a03:3d8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37bfbecb-57c8-4a8f-a0e7-08d9c3904868
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5488:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB5488042E94E6CFE7F43907409F7B9@SJ0PR10MB5488.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:398;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zNeiy9v7vnIw5l6WpvgfjxI0pHxpF6iCK2eAOSX7tI0iunpVnYLwDHgdwMVL72JW0zf0Vk1R01AtrDhqmP72FCO5q093zY/5FnD+QnVGdZoHB5P/zdM57M6YycXxsa8CFbhBUM2JxrcHMUxgK+TCRiYiA3Aq7RoYBFyBzkNXu0AyyKQusEtfea9K72/X0Ni9NXkBRzN/oStpJ8coTHmCM89qOM77eZ4HrgDD80r7+S+HMKOUJavVDAPcJNiyg95wGP0u4Q0zk2y6ZLnN+aXGLHN+hYaH4ijTKzS7d/WuJETf9TpfFk94Y48DXOlBmOhNkPTlS6OIJ106gEsJ4CWCIl2udeRPmUhXhr4ZIsvhndhRtsoKkw7xhAog8Mj2mVJxJa814tNLTFNBgBshHKV+jHJSB8mI/03OrC9bcG2joHV0XhJ9xwYxR2Y/cP9W5K0wSjHN3dEecJ7QhYHJHCwK1iHSM/Kv78Cxt7SGX5QcE6VSbwIsjXQGTwyn64V197PO0QBjQqROUhunqDv4m8Rk4Pr4t0vxxfrp9E/UMInPdjkpiGppJ8/JO5uCDOb2H6Whi6jKE71uVIpqvuDLQzKkySP8jmRsxuyCI4H1iOpp/KAQFZvf/7rXghlQC8EXYxXq/6ZHnRh55YHewuSJQy2pCgvFGxNA08sTY7gviX8v/bz6+X8l29uL1gQeVs6X310UBaHv7mgfohUneqixmx2MCsqE7PSrdu1Qbi0eMaEQp5A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5567.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(83380400001)(5660300002)(31696002)(6512007)(6486002)(186003)(508600001)(36756003)(33964004)(6506007)(86362001)(8936002)(316002)(8676002)(2906002)(6666004)(2616005)(66556008)(66476007)(6916009)(66946007)(4326008)(107886003)(235185007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHVRZmxwY1N0QTRZblNqVG8vS2VHa3hINUJxaDRWVUpITjJIZmp3WURVZXh5?=
 =?utf-8?B?UTI0ZmVhVWxDaWlBOFB1LzlzUkNXaUg4MVRBVFh5czk1MExKQlp4ZU9qMTlh?=
 =?utf-8?B?WitjMU11ZzJpS0EzRzczL3U4TzJBYVhCcmJ6enhCTkhQZGM0OWFwOFdHNk1M?=
 =?utf-8?B?b3V2RTJ4RGtjckZuU21oMW9pOURJYXhML3Q2TkVobnhTT2FUUmI1K0ZDSWZQ?=
 =?utf-8?B?dGttczhIVi9wYUFKSVM0S05EbnA0QWJsdkZKWDRILzhPVVhNeThSMEVIMDB4?=
 =?utf-8?B?WDJKSDFkOGhYejZsUVcybGdCYmFLZVR1OUxUZmhpdnRKdGQxakM2SE4rMWF2?=
 =?utf-8?B?WllySGE5czVka2d3b2tLSXQvQVBsOHZXOEgyODBZeXhkY2MrUWRxRWFJQlNy?=
 =?utf-8?B?bkZzY2ZOQURKaHl3MS9XZ1QvNnRYa2FSRVVxdWtIRVZ1ZmMzOTVvODd5SW14?=
 =?utf-8?B?TmRWSWxudk1vSTdSWUtXSGJ5ZUZ2UE8rYWptUGNXaEtHOW9NaGI0SzJ5NkRU?=
 =?utf-8?B?VVRiWGljS3B5MG9jVzZWdnM2OUdudVpUeXNQbGF5RSt3RncvekoybVMyMkFn?=
 =?utf-8?B?WHgvc1hmSG9HOVVNQlVLaW1MV0owTW1kN1RFQ2RCN1MwMEVCL1JJa0dpMVV3?=
 =?utf-8?B?dzVPSU5Cb0VkcEZ1ME1RN28vRGFhNURiN056RjY2NnBVbGdpNm9OQ25OSHJ4?=
 =?utf-8?B?MitZNWZwQ1EwRXNWR3VDOTMxK2hrUFg4L3FDUlVLcm5NY3pKR2pkdjl2ckw5?=
 =?utf-8?B?R0pNdjkwNENxYjBtNHlRQnlwcVdWK0xTc291NllnMUNQd2plNUswNzJTeTk0?=
 =?utf-8?B?WHEvbjBlTjFIVkpYVEJTS0hXYjU3dENKR1dNNzNnRmlZYnR1WUo3N1loQnR4?=
 =?utf-8?B?TmVQeThLNlp2eWhiZDc3OStJd05UQmM1ZHFLcUpDU01jYWVReUxZazFmUnlM?=
 =?utf-8?B?T0V5SUpGS1BQK2FZTm9JV2ZCeGttYytPbjZKV3dGMGdBd3BKcExkQlBWQ1Ns?=
 =?utf-8?B?OUNuNkYxbzhEODlTT01PZ1NQWitKUzd3K3FrUGxybVcxdzI0cUxJckJSaDg4?=
 =?utf-8?B?ZmlESGtvS3Y2R2dnejV4eTMzVHdNSlQ1cUdWa1BpMG00aXZEVWZUbkF6UzYx?=
 =?utf-8?B?OHhyZStDUmJqUmh6dVVxcm9MaWk0dTVxUSt4RTJMcWVLdUtrRk9BSnA5MWgw?=
 =?utf-8?B?ZnJ4RXluOUNrNi93MEhnRVZGeE9hK2VpWFkvY3NDQzBoTk00NXBGa0lGTzB6?=
 =?utf-8?B?L2xwMVBscHc5b2xibm02RC9STHFCNW8wbUVEeHZzQkljZFlvUks1RjlxRUln?=
 =?utf-8?B?UFhnUGVla3RXVVF2NitZSVRuRFpLbnNiRUtHZkxYc3Nyc3hxSmp5bXJwN0sr?=
 =?utf-8?B?ZTRjRFRPbGRZRTNSMUlaL29yUW5PMXJra05zM29Lc3VPTS9FVmlHOThSQkZG?=
 =?utf-8?B?SEV1a01DNERlRmI4N1FVLzJTQ0dhZWRSMDJSZnQ5dHlIaTh1VVhnV3FlZTZN?=
 =?utf-8?B?SHpMNzIzS1IzcE45NWNKUnYvSG9DeHVuYW11bVhMbktRWDhGKzl0b0RzK3lK?=
 =?utf-8?B?YVNGSDk3K0FIbm5naUx5STI2RkE1SUNVRkRQNjJrc1RYWmF6am1NR21vWUNu?=
 =?utf-8?B?d0VLcDBxZGRjZG4ydWR2bG43emY1SENsaVF1QWNLZ0o2WmpYZlpremxjSzR4?=
 =?utf-8?B?NTFpWVVaUHVQRDA1MVFzUXl5cWs0aGZUKy9YWkYzWVVsZGcreTRyeGhEMUN6?=
 =?utf-8?B?ZFc2SlVmby9ock9EaGdvQXBLdmUyRjVieHkyK2VGc3UxWnV2clJjWFdybi9I?=
 =?utf-8?B?YkVoZWRHVkE4QkxFUVVOb3RqNEhKU1FzTC8rK3UyTFdacTR3dXk5VWhsZHhT?=
 =?utf-8?B?MUtGb0lMbVBYQ1h0aERzZTdiZ21TTzZqT1JaQnlkNEZmbXFEbmpyeXFsY3Ew?=
 =?utf-8?B?aDIrR2VuMkdkQlc4c3ZTdldXZ0dkUWRnSGtiQ1ZiaGtKS0lVZklMendjK0hY?=
 =?utf-8?B?cW5iaWVDcnlxNmpONHA2enFscFZMYmlJdmNLK1dkODlURlFXU3NLWmJveUlH?=
 =?utf-8?B?SWtHb0hCblFjTS9NRnZhTVRqODRTNXFJZ0JrL1JJOWlkdEhWM1REVlQ1azBq?=
 =?utf-8?B?b25yeXYzMXpjbmtMeW1UN3lmT1FjWGVmRzdkUlVJc0JORlpBZnQ1TUFVUFQ3?=
 =?utf-8?B?d3ZWWXpVREVkMzZCUU9LclNSdmQwY2IwZVJsV2R0bm9RN1JXWFhlbzZndmE1?=
 =?utf-8?B?VzEvTWRVMEZGdm5CVkxJajBxSC9nQVVEMmpmbm1BaWxCNkNyaThuUGpVN3FO?=
 =?utf-8?Q?wpK1JAGrP3HuZN0JgO?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37bfbecb-57c8-4a8f-a0e7-08d9c3904868
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5567.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 08:11:10.9080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxZs04PjdiV7EHh/OjBp46b84xyRaWmzx6F/r+b6GhDyRZuAk8u67y/GjdEMA1qgtySVoL2ggai/Ebc1YsNdx3MBnS1uKicXPeIUqd8k0io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5488
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10203 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=775 malwarescore=0
 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200048
X-Proofpoint-ORIG-GUID: HiOSoP_S6t1zpxixBorctjECmNNHetjM
X-Proofpoint-GUID: HiOSoP_S6t1zpxixBorctjECmNNHetjM
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------YUaZiXaYC8HUX6nXxRqmbf6z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit




Hi,
  under load I am experiencing data throttling when serial to usb adapter is used,
but only in direction from wires to usb. Opposite direction seems to be robust.
  To reproduce plug both ends of usb to serial adapter into same hardware and run
attached script. You should see data flowing in both directions, then saturate cpu
`stress --cpu #cpus_plus_two`.
  Data will be corrupted only in serial to usb direction, usually from beginning,
often within first urb. Not seems to be due to flow control.
  Even though chopped bytes are received, rx/tx counters are correctly incremented.
Script implements data sending in two ways, first utilizing socat and second standard
cat command. It is adjusted for RPi4 with miniUART ttyS0, for multiport hardware
and/or ttyAMA0 you will need to tailor accordingly.

Rough failure rates observed (former trials with ~32k dmesg):
ttyAMA0: 'cat' 20% vs. 'socat'  2%
ttyS0  : 'cat' 90% vs. 'socat' 40%

Why to plug both adapter ends into same hardware?
- I believe this is sub-issue of two connected devices, but it is hard to reproduce
- serial port programming




Regards,
Filip Zaludek




Tested chipsets:

ftdi_sio [TTL], Bus 004 Device 003: ID 0403:6001 Future Technology Devices International, Ltd FT232 Serial (UART) IC
pl2303 [TTL], Bus 001 Device 005: ID 067b:2303 Prolific Technology, Inc. PL2303 Serial Port / Mobile Action MA-8910P
ch341-uart [RS232], Bus 001 Device 006: ID 1a86:7523 QinHeng Electronics CH340 serial converter



Tested chipset|platform|OS|kernel:

ftdi_sio|Raspberry Pi 4 Model B Rev 1.4|Oracle Linux Server 8.5|kernel-5.16.0-rc5
* errors only in s->u direction, often corrupted without load

ftdi_sio|Raspberry Pi 4 Model B Rev 1.4|Oracle Linux Server 8.5|kernel-uek-5.15-2148.0.1.el8uek
* errors only in s->u direction

ftdi_sio|BananaPi-M64|openSUSE Tumbleweed 20210829|5.13.12-2-default
ftdi_sio|BananaPi-M64|openSUSE Tumbleweed 20211202|5.15.5-1-default
* errors only in s->u direction, often corrupted without load

ftdi_sio|Raspberry Pi 4 Model B Rev 1.4|Raspbian GNU/Linux 10 (buster)|5.10.63-v7l+
* errors only in s->u direction

ftdi_sio|Raspberry Pi 4 Model B Rev 1.4|Ubuntu 21.10|5.13.0-1011-raspi
* errors only in s->u direction

ftdi_sio|Raspberry Pi 4 Model B Rev 1.4|openSUSE Tumbleweed 20211202|5.15.5-1-default
* errors only in s->u direction

pl2303|Raspberry Pi 4 Model B Rev 1.4|Oracle Linux Server 8.5|kernel-uek-5.4.17-2136.300.7.el8uek
pl2303|Raspberry Pi 4 Model B Rev 1.4|Oracle Linux Server 8.5|kernel-uek-5.15-2148.0.1.el8uek
* errors only in s->u direction

pl2303|Raspberry Pi 4 Model B Rev 1.4|openSUSE Tumbleweed 20211202|5.15.5-1-default
* errors only in s->u direction, often corrupted without load

pl2303|Raspberry Pi 4 Model B Rev 1.4|Ubuntu 21.10|5.13.0-1011-raspi
* errors only in s->u direction, for miniUART & socat errors seems to be really rare under load

pl2303|Raspberry Pi 4 Model B Rev 1.4|Raspbian GNU/Linux 10 (buster)|5.10.63-v7l+
* errors only in s->u direction

ch341-uart|x86_64|Ubuntu 18.04.5 LTS|4.15.0-154-generic
* I was able only once to run this setup, kernel seemed to be resistant under load. Chipset is unreliable.



--------------YUaZiXaYC8HUX6nXxRqmbf6z
Content-Type: application/x-shellscript; name="usb_uart.sh"
Content-Disposition: attachment; filename="usb_uart.sh"
Content-Transfer-Encoding: base64

IyEvYmluL2Jhc2gKClNFUj0idHR5UzAiClVTQj0idHR5VVNCMCIKCnVhcnRfaW5mbygpCnsKICAg
IFRYPSQoZ3JlcCAtb1AgJzE2NTUwLip0eDpcS1swLTldKicgL3Byb2MvdHR5L2RyaXZlci9zZXJp
YWwpCiAgICBSWD0kKGdyZXAgLW9QICcxNjU1MC4qcng6XEtbMC05XSonIC9wcm9jL3R0eS9kcml2
ZXIvc2VyaWFsKQogICAgaWYgY21wIC0tc2lsZW50IC90bXAvZDE2XzAgL3RtcC9kMTYKICAgIHRo
ZW4KCUZMQUc9Ii0tLS0iCiAgICBlbHNlCglGTEFHPSJ8fHx8IgoJZ2l0IC0tbm8tcGFnZXIgZGlm
ZiAvdG1wL2QxNl8wIC90bXAvZDE2CiAgICBmaQogICAgZWNobyAiJChkYXRlKSAgICR7RkxBR30g
ICB0eDoke1RYfSAgIHJ4OiR7Ulh9ICAgJDEgICBEZWx0YTogJCgoIDE2Mzg0IC0gJChzdGF0IC1j
ICVzIC90bXAvZDE2KSApKSIKfQoKdWFydF9zZW5kX19zb2NhdCgpCnsKICAgIHNvY2F0IC1UMC4y
NSAtdSAiJDEiLGIxMTUyMDAscmF3LGVjaG89MCBPUEVOOi90bXAvZDE2LGNyZWF0PTEsdHJ1bmM9
MSAmCiAgICBSWF9QSUQ9JCEKICAgIHN0dHkgc2FuZQkJCQkJCQkJIyBiZXR0ZXIgcmVzdWx0cwog
ICAgc29jYXQgLVUgIiQyIixiMTE1MjAwLHJhdyxlY2hvPTAgT1BFTjovdG1wL2QxNl8wCQkJIyBi
bG9ja2VkIGR1cmluZyBUWAogICAgd2FpdCAkUlhfUElECiAgICB1YXJ0X2luZm8gIiQzIgp9Cgp1
YXJ0X3NlbmRfX2NhdCgpCnsKICAgIGNhdCA8ICIkMSIgPiAvdG1wL2QxNiAmCiAgICBSWF9QSUQ9
JCEKICAgIGNhdCAvdG1wL2QxNl8wID4gIiQyIgogICAgc3R0eSBzYW5lCQkJCQkJCQkjIGJldHRl
ciByZXN1bHRzCiAgICBraWxsICRSWF9QSUQKICAgIHdhaXQgJFJYX1BJRAogICAgdWFydF9pbmZv
ICIkMyIKfQoKIyBDbGVhbnVwIGFmdGVyIF5DCnRyYXAgJ2VjaG8gLWUgIktpbGxpbmcgUnggcHJv
Z3JhbW0uLiAkUlhfUElEIjsga2lsbCAkUlhfUElEIDI+L2Rldi9udWxsOyBleGl0IDAnIFNJR0lO
VCBTSUdURVJNIFNJR0hVUAoKIyBEaXNhYmxlICdnZXR0eScgc2VydmljZQpzeXN0ZW1jdGwgc3Rh
dHVzIHNlcmlhbC1nZXR0eUAkU0VSLnNlcnZpY2UKc3lzdGVtY3RsIHN0b3AgICBzZXJpYWwtZ2V0
dHlAJFNFUi5zZXJ2aWNlCgojIEJlIHN1cmUgdGhlcmUgYXJlIG5vIG9ycGhhbiAnY2F0JyBvciAn
c29jYXQnIGNvbW1hbmRzCnBraWxsIC1TSUdLSUxMIGNhdCAgIDI+L2Rldi9udWxsCnBraWxsIC1T
SUdLSUxMIHNvY2F0IDI+L2Rldi9udWxsCnJtIC1mIC90bXAvZDE2KgoKIyBEYXRhIHRvIHNlbmQK
REFUQV81OUI9ImFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6X0FCQ0RFRkdISUpLTE1OT1BRUlNU
VVZXWFlaXzAxMjM0IgpEQVRBXzE2Sz0kKHByaW50ZiAiJXNcbiIgezAwMC4uMjU1fV8ke0RBVEFf
NTlCfSkKZWNobyAiJERBVEFfMTZLIiA+IC90bXAvZDE2XzAKCiMgc3R0eSBpbml0CnN0dHkgLUYg
L2Rldi8kU0VSIDExNTIwMCByYXcgLWVjaG8Kc3R0eSAtRiAvZGV2LyRVU0IgMTE1MjAwIHJhdyAt
ZWNobwoKd2hpbGUgdHJ1ZQpkbwogICAgdWFydF9zZW5kX19jYXQgL2Rldi8kU0VSIC9kZXYvJFVT
QiAidS0+cyIKICAgIHVhcnRfc2VuZF9fY2F0IC9kZXYvJFVTQiAvZGV2LyRTRVIgInMtPnUiCiAg
ICAjdWFydF9zZW5kX19zb2NhdCAvZGV2LyRTRVIgL2Rldi8kVVNCICJ1LT5zIgogICAgI3VhcnRf
c2VuZF9fc29jYXQgL2Rldi8kVVNCIC9kZXYvJFNFUiAicy0+dSIKZG9uZQo=

--------------YUaZiXaYC8HUX6nXxRqmbf6z--
