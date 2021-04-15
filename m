Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96C01360786
	for <lists+linux-usb@lfdr.de>; Thu, 15 Apr 2021 12:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231687AbhDOKtm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Apr 2021 06:49:42 -0400
Received: from mail-mw2nam10on2063.outbound.protection.outlook.com ([40.107.94.63]:19200
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230118AbhDOKtm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Apr 2021 06:49:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndFJJNxs12Y/xcOH6lqp36v1V1yfpD4yd7SLz9ygIe+rpPw0HOQtW9MSX6MNoPtzox8gZQ7R+g/IBiDz7tA2/XXq5WJMDTpbiXjMbabnfpRwffOGpwTNGQgNlF0bIjbcswH/t71V+jtJYgdm9DfLO8ES6y4usJ+3pkTop8gkb+93zzfma16I4K1DOArPzbUoeJI8gnqbYPN4Dy2lUcNp75GlrK9NNf99GRgBiB3+TA9CLeuNf0mfRVi1egPjoaBEh4SwJvWpEL0spxaZjiZTvfngHVVJoQdYc6+/qW1fTjiCIxc39Nv9UJ2/7SBBvbIBsgRMKJn7TwIBjw5v1FNLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCv8PCOi1R0RRlIBBK7ypd/bIAr3GxbqZG96NS4/Q8Y=;
 b=jqHIrKvfts3+nyk31IPsK9OWXcEyFkA7Xg8Znv0eVqoGFeOtbvKUeDO3Hv3OivBc3dDns8hdb/8YIcJgnAug+J/3QZcrQN7ppJBENmIaXlR/CG2CACpxX9qLYXf4rET+lQ/E0mFe7+W19GufQwiAVn13aRtilmHhVHhkugLqO4KjzdLff86yZWVAn+usGrP5X81OWUClRmvr/X83nw64IMPwcBf2zbSZNhqPEFtK99Qn2SPVkoe7WbTKRHfBYwwNfbdZgdt0xRGlhtRx5QA8yB7EWv8xlYokyM0waHmHEQfTeMfMhv/M5fjfDuPBtPw1q6wuCZ78qJmDln4OPU4IqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCv8PCOi1R0RRlIBBK7ypd/bIAr3GxbqZG96NS4/Q8Y=;
 b=AicjeyX91RdOYPaKdMBvTobAS7XX7uh43+3njsuFhSX6uPsLpzXf6xworAybzqOpdDBe342E9ewD0eNKaRRv7oxTFjD2uXtcU9W+G1mJsWOIehH68HrTZPK2F9tzEcpQRshIsPRP4XnScwP0m1X4+Rrz0lvIHRqMDadG0PHL8RY=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3453.namprd12.prod.outlook.com (2603:10b6:208:c3::18)
 by MN2PR12MB3504.namprd12.prod.outlook.com (2603:10b6:208:d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 10:49:17 +0000
Received: from MN2PR12MB3453.namprd12.prod.outlook.com
 ([fe80::1d18:6e9c:8ddf:26b1]) by MN2PR12MB3453.namprd12.prod.outlook.com
 ([fe80::1d18:6e9c:8ddf:26b1%5]) with mapi id 15.20.4042.016; Thu, 15 Apr 2021
 10:49:16 +0000
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, basavaraj.natikar@amd.com
From:   "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Subject: Question on typec_unregister_altmode
Message-ID: <da32299e-e516-d592-29c2-941d0604b40a@amd.com>
Date:   Thu, 15 Apr 2021 16:19:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: PN2PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::19) To MN2PR12MB3453.namprd12.prod.outlook.com
 (2603:10b6:208:c3::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.35.91] (165.204.159.242) by PN2PR01CA0074.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:23::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.17 via Frontend Transport; Thu, 15 Apr 2021 10:49:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcc5b6e2-dfbc-4f12-4431-08d8fffc1d9d
X-MS-TrafficTypeDiagnostic: MN2PR12MB3504:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3504EFB66EEA599871D256E1A04D9@MN2PR12MB3504.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q5PRwXDwKs6h+y8xtl93OrFd/KVY25KelrfFjMlfyxPNoW6fFvALarBgd14sk8Omx/I/ijHSFoBHZbK5bCqT0MktYHByVkT8CmFMpiWpUgKBKmzABaFydSMH4yDxakBme+7poUz7rWcvfoDNlLPlknsQfpj218DrFczeuiJwRA5Iqk3C8/4bmgU/6GrC0e7XFlBSZvo4WdEPI/hmJ9MOh17BpV40wB1qcRU5pPGQIJT7ATrF34hRctbJCqzn5pfREWNLQblOdporhkDkV0ZzNSjM2HgqszLCeuT9bfp6Xg8dUvXAgQySOmHt2SuOSwjrfBQk3GgKAeciUL/dhqdB8igvj7Q6ZeiXYZv/dJFHeIzCYhj6EO72o8V8sbuT17RBwxv/5teuoUVUF6udrUNjF25xHfRQ4SuYNYADGAH/STs4f+IYCU5CCzz83xjjMaHKdgprrm0XhCTUZPUCkz/TNvGFpPkVR9ej3iYhaw2bvLCdji60fSc87D9WHCtivlbC1F5+bI6gSxxPzlyHTQYwrv4Qi+1cgQMCD3EaQrE3qfV3vcEKmCDnqD9YjQXdzka2V7olocYzGjVPmhijvWfLAL7S3t7IQAplpb95lzrVTZg+gUDW1IMzrC8QRfk08oeqSVnp+awRSBZn2wRA7b8oLquggg7IG+htNzvNLMW3dwUHZVPSXQaxB0qau4ok1Qsa2acEv0GyOtDMpixoj6WBrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3453.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(38100700002)(38350700002)(31686004)(8676002)(6486002)(4326008)(186003)(16576012)(16526019)(316002)(5660300002)(6916009)(66556008)(52116002)(4744005)(36756003)(66946007)(31696002)(2906002)(6666004)(86362001)(8936002)(26005)(7116003)(956004)(478600001)(2616005)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OVBRM29rMVF3azZXcU5vMnYxYkNxMTMrRmQ5VXJOWkQydjBLMVh3YnEzc0pa?=
 =?utf-8?B?TU1WRHVMY1k1RWRESFR3WFFiR3BHQ29odzlxaEoyRk5Wb040YTg3d1V4dW1Q?=
 =?utf-8?B?bWhGd1BjWkRzMi9iWFlBa2tqSWNCWEo3NEd5YVhkdTdrNXF5Wk9LTnJtaHJX?=
 =?utf-8?B?djNXUmtTWE1rNHlzVDIwOWsxMWpzTVcxQVZBN0xaZmRtSHBWTk8vQVIya1ho?=
 =?utf-8?B?eHdWR2NxcnRkcHl3YmFnc28xMU1DS2M4TVo2QTlUMmhKeC96WVRtZjZaWm9r?=
 =?utf-8?B?WE1RZWxrMUU3MjYvK2lUdjRaTDRUZFdaT2tHeWpseTRDT2syWUQvaTlsM1BH?=
 =?utf-8?B?d0Z4Z2ZlKzA5L2Rpbzk3bE1GWVVFZ1ZreWFTUUFSZjZBZ0FrcENZTzJVYnRa?=
 =?utf-8?B?Vk1IUWgrUStaelg1R041ZVFXN2N4WjIzOFI0WUF4UDRqamxDcXJRUzZuMGov?=
 =?utf-8?B?ckdBRXlFRWJVTmhwN3FKTjVMMnhienIwYlpmUHgySjR5ZTQ5T0FLR3JmQjEv?=
 =?utf-8?B?bkgyWnJDbElYMStNcEJ6b05kRVhLNW1GZ2pxbUV2SDF4VWw4S3lRTE1DTytB?=
 =?utf-8?B?eThSQXhGNWNlSE1mcENJbmE0MldJbmR0YnZja1FhWnpXTHZiUUY4OEtTRXRi?=
 =?utf-8?B?Y05QbnNOVzJnRTV2cGZ0WjFxMGFOZEZTMnJBSndpd05tQU02RlFhRitBcFBJ?=
 =?utf-8?B?QXhqb1JzazJDUnF5dkxFbmV3cEVmVndEd0d4YmFtTkp0UGRHT1NEbEc1bDBE?=
 =?utf-8?B?OGNHWDRpK3FEQzZEMGQvdEhOT3YzV3VIaFBTOE1mMEZxR0xMWW9CRmd1c0V3?=
 =?utf-8?B?RzBmeGpqUk1Va0hhWFJMYXRJMzRpdG5tNUZiRlZHVEhQV2NsOUZPbDVDUFpD?=
 =?utf-8?B?QWR2RmplSCtQcUlyZVZacUtpcjhCalhJTkdPMFU0KzhCOVovNkhHaXpMRTU0?=
 =?utf-8?B?cWNwa0ZGcTJ3Z21FZk9XQzZ3VUE1NHN3VHNEOWUrTDRKbzZ4dzhMc1dnOHdq?=
 =?utf-8?B?cjdqMmUvdHNGM204VE5taTRIbVZNaFpkNVVjTnVBaHZuQTIxV3BZUmNScWtz?=
 =?utf-8?B?V2kzZmJCWDNoR1ZkeFZCSGV4YXZjTTAvL2YySzhjRFdncjZxRENQOUJyZ1Uz?=
 =?utf-8?B?ZitYUW5KYlV0anRtQjc4MkJzU1J6Y3Q3a0VQL3JYSEx6WDdkSWdCTWVaM0lM?=
 =?utf-8?B?bVBkbUdXWWUzZncvbTNpWERSaStIMFpGT0ZNK25NeEFzdkRaNkdhODU3NjNX?=
 =?utf-8?B?V0JDakYwNU1IMHpWWHZpQ3NBWHB0Wkt3NktWeXFIam5hUjAzRi9FR2ZGMjhn?=
 =?utf-8?B?Y1l2eVFiTFFSTkQvYk5mVU03SWxGbDJ6Z2NVS2o2UytmUUtzL3R4WENTQTY4?=
 =?utf-8?B?Nk1BTllRd2ZiNjlCWG5UYnFGQ2JMYTFMWitwcHhxT0tIdVFpVWNRaGNKeTE3?=
 =?utf-8?B?L251TUlKZ2duemQ4bEFXSFpCSjlTM0djdXJac2dUTTJtNlBZWkhMMW1WQ0dv?=
 =?utf-8?B?OEVMZmdJejlIVGxaeEdZQ2F3ekZnb2pXMmFKcFBGSWVtMFRPWTRHdTlkVnZi?=
 =?utf-8?B?VnpraVlRSFJSV3ZGdHJsdk1KT0krYTF1T1dxSTRkaFpZM3pFVXNlUFR6eVVS?=
 =?utf-8?B?MWNvM2p3VVVkVWZqbURWK0NZZEV5S1pxZXhndWNFVitvN2tPZ3ZjQnh0MFMy?=
 =?utf-8?B?YTlWZ1M2UVNJVnN6RXphanp1OGpRc0FlVm82Tk9yOFdaRWpkQkVCakhOMGNY?=
 =?utf-8?Q?zH+vycQgEnXreMi6jKCUCvJIW/Y9KyyXnaGdSl8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc5b6e2-dfbc-4f12-4431-08d8fffc1d9d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3453.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 10:49:16.8401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xF5L11P4WfS4mBvQeJJl2MtDcxt2osvzDvReI3LUYmJmHVYoNYilXx2m9w+vngq7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3504
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

While working on one of the project i have observed one potential issue with typec_unregister_altmode.

If we unregister partners altmode then following code may fail and give the crash.


typec_mux_put(to_altmode(adev)->mux);

As partner does not get the mux during the register alt mode only port register alt mode has it.

so i think adev->mux should be checked for NULL/invalida pointer. Please correct my understanding.


Regards

Nehal



