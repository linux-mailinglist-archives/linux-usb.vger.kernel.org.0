Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54E806C6415
	for <lists+linux-usb@lfdr.de>; Thu, 23 Mar 2023 10:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbjCWJxY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Mar 2023 05:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbjCWJwt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Mar 2023 05:52:49 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2061.outbound.protection.outlook.com [40.107.22.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD1928EAF
        for <linux-usb@vger.kernel.org>; Thu, 23 Mar 2023 02:51:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdRtlZIMenitHWfvmHUcA5cjNCYt8jgKGoFDVpARbzs68YqgahCFNGH5nEyy6XyHsUy6HXrZbuN4+rAUl6FEah/R+ev6yzLhOqXBabQXdYAbEaNpwUNuL//40RWyydoL9861M3zUbShP+3F3kd6KdFwW8UVe+D1jvoZetIoQOwPFAfdUZH8xREBGJK14YOGGCVHgVf8zlwUEa+1HfkENw/bFC/SVHFcMPspCYGad2b6rODRdEI6CLTK4r4t9DLUn/nt/NfbS8XZ4+1hKAWE6yPHGtTH4zi3d2AjFUIP3B1tmmFlHh7n/LxaUnur6sHy5E+XbcwVGB55LDEy+WQnWzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9KuIQ9SdIzKOEYN1Nc0yb0H/xVGOR0+uEqe1KoP03I=;
 b=U8+8QShLHzpMj55eQU6dYv0lqH3/urmZKmQfIwGfhjyKy7cKLNQcXhJzgpsv2eJAIS37Trq5qzlA3Q26Nacyg+QuW2UiR0+NroAWs4Z3g7hlt19AUrAtNlJWNAP70avtiLscpJaaOVvkumIqzGLO46+4fBnCDTG3almIJadJ8VB58IFiOCW8eFGX6QWYXzr+THlYTLhjDQ+DTXwE15QFWeQ+LZLdBgudp8tLw7Ts1FmIB+B2dsIpGnjw9k/PiSJx8uOD+iXHE3aSlr/iiIlXzYt6amtPiaMf2/VR1h+iIEt/Q9WF4ktS/zd48PENi7hMdLROlMuWJ8pNWYZeOOv4RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9KuIQ9SdIzKOEYN1Nc0yb0H/xVGOR0+uEqe1KoP03I=;
 b=Y6kYd8iYJtp+DsPxuO4m40dKBnjhiFqHY30WdVFPP3NCzkkEIvOJReIqzqpjz/xTTJteEs3L4bgV0cRJ6ySUkpLvxsgHsjny46HJ2ZuT0vWzyCMBUc369PK2wQ5eTpovrr7vSgevN3YzAZ5IxU6PnF3GzYOFd2BlTR/GYUwnPILHlKFzHOHycg8Vn1bkgeFF21r9C8lxE3bNvSg17GPny2ZXar673bLby0LHRKM6vjFg6Kz3qonJZ9wt0B7cjNgd13IFpNOs40eCvZUP1OusLG4TBqb/E8OWIuwuEpEhjRJVeaHD0MvrnQzLOlzuwleBsme4/OhCRem+Kst/+e/4zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AM7PR04MB6806.eurprd04.prod.outlook.com (2603:10a6:20b:103::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 09:51:31 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7])
 by VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7%3]) with
 mapi id 15.20.6178.038; Thu, 23 Mar 2023 09:51:31 +0000
Message-ID: <e977c0e1-4604-47cc-9c53-619bc897d418@suse.com>
Date:   Thu, 23 Mar 2023 10:51:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Cypress CDC ACM serial port not working correctly with
 autosuspend
Content-Language: en-US
To:     =?UTF-8?Q?Michael_La=c3=9f?= <bevan@bi-co.net>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
References: <8be9b56c6becd0981d1cd9c13742df6ba2975b56.camel@bi-co.net>
 <0db2a0a4-6ed4-fe06-217a-cb564f1d4a8c@suse.com>
 <bde43a1913cf55e580e77ac0e059fff3c26dc093.camel@bi-co.net>
 <2f98290f-995b-89ff-8ba2-1463fcf78297@suse.com>
 <9a1381abe0e2b605786bc9c3b2daa3f7bdc3b64c.camel@bi-co.net>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <9a1381abe0e2b605786bc9c3b2daa3f7bdc3b64c.camel@bi-co.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::14) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AM7PR04MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: 53057f8d-8add-4e2b-8462-08db2b842e0f
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k+3Az74PmoC2QxP9V/OrL5ao8TEo7G6kRck6km76bcHmdzSyugFdIvpr0pkElqRa6Dez/ubaEjFHoGQ6fWOcLx22EnATQC3tcPwelj0qeTt9996FmKr1cvXaCO9ywLszmMELQrt9m0dO5CSQzNxljxXrp/Pvoep6OU+LcM/5Z3YduWXS+lw2vVXgnvqCx+dZ785P/ouXxPiPbJRzIBdkZ0YxevgbaUvZKBE0R7Wc+fcdjE9Ukvf50rD/Rqsrv1yu/AjsMfMvMGEE0Nvj8y4KpqPJTH9ddpzP9T8ZGCgO67ycR+6fOUrCCeHb8G23vJEfXhyANpRa6Kss0qjKtt6BZ7ydOX/Gcb+Hfs7PU5DTskTE+/f0MzpOvv1x929+/MUHgL5wjT+WaqiyfrjE9PqwIjbieZHdTgTuoNKg7fHw5TZRvH0C0cIueA9kSc/2KRbNJiMgmspBHmWdH0P/9Vy8yhiH02kgvIe3YntC3jFwgf4smUr7e28p/nyLuZCyLPWw28HLbcaKD4eMcOjteZ7ReSxBWHaOkYLrdieM3tODm+D4G5xeIwav0fTshDD9Ote6ca9puj+y4b8d/1bZvE99PwWfVplE4agtmGywonS1vdhXvccmpIbENLuwwHrxgUIeUgay3HMmx8EJwCLTdy/2KKWach8bX6NvMh9mn5BbScNv8HDwxYhxpo6nIzJh19K9hh3jvhHj0Ut5hZ4E7o5BFIWdsTbao8vaVnPEymiGjeY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(136003)(376002)(366004)(39850400004)(451199018)(31686004)(38100700002)(2906002)(83380400001)(478600001)(6486002)(2616005)(186003)(31696002)(86362001)(36756003)(316002)(19627235002)(110136005)(66556008)(66476007)(8676002)(66946007)(8936002)(6666004)(53546011)(6512007)(6506007)(5660300002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTBGVU5WM2ZzZ2I1N0dpbEZLRHY3TmMvTUxFUVlkL0I0ZFE4T2taUCs2cFRF?=
 =?utf-8?B?RmZZNVlELzIraVdTcDQ5ZjlLd2wveG9wR0NZc1Nac056MTBQVWtLVENwUEJv?=
 =?utf-8?B?OXJNUnByWVRuRVdzMnQ4ZEp6aTFmVDkvNEo5MWdUOHNkVXVCN1ZneGhjSHIy?=
 =?utf-8?B?Mm9CemdOdnh3T0ExdXZpS2h1Q1NKUC83T3ZacHJ1TU80K3pwNXBRWlk3NGd6?=
 =?utf-8?B?L2EvZ2F0S0FzZ25WYW5PY1o3MllOZC8vM2N5eEZKZ0tWaVMyeUkzN2lRTkli?=
 =?utf-8?B?Qlg2ZUM4Tno5aks5MkRTN3NDYjVkUGpwcXl0V2VFcWppYUZaVUJzYk1DT0Y0?=
 =?utf-8?B?K3N6czhYSmdwMlgxZE0rUXpZRkdYUCtqazZwNjg5WGpGSGREWEY1bnV0Vks3?=
 =?utf-8?B?N1lIb0ttb2loNHdiWUN2QnBtT1JZM1FTblF6VXN2WmFsZ3VoTE4vRVhtVnB2?=
 =?utf-8?B?NU54b0k5eVc1ejBQMXpCeVBoWW4xZ2wySURSSVk5T2NabWFnYXlsbWNCcG85?=
 =?utf-8?B?QytUS0xaMHhBZHZJb1dNeWh5OUFuZCtSc055QTRlTDlXMWdhQWNXaWhXMVVI?=
 =?utf-8?B?YjFLbndLZFRVMzM2azdQN0F6aFgyWEQrZERnemVHNmc4L3p2T21ua3pNU2Iw?=
 =?utf-8?B?ZmpOZGd6R2NHelAydEFrVWFNNTI1QkNiZW1yTU1tVHFGQitqWEtrc0c2QTgy?=
 =?utf-8?B?eEFNQVVOMXRtQTVZNjcxWXNrOUxqYUloTXZSOGRQYVRseDlYUHB6S2J1K042?=
 =?utf-8?B?aUpqZXBtYURBYmNxeE5scUUvdnR1d1JKMmdxenhLL0wzeGFnUTJFSnI1SEg4?=
 =?utf-8?B?dHJGcE5QWWJlN1RZeHZIUXJGVE1YNSs2N3FlS3NzaE9NczdoKzhHNGNRWlNE?=
 =?utf-8?B?QTBPZTNPV29CUFlUZXVIUDNUdk1lMVRhNlE4V2VoSXJXV1dsR2U5bWRWemNy?=
 =?utf-8?B?Ynl0Qy9oL2RxMkZyR2hma1ZEVDlERzRqM2RwSE1UYVVLUG9UZlZHVU9qRjRR?=
 =?utf-8?B?SHk5cHJtdWI5YUxEbEdEdk1halJMU3hldzQrd2YydDdMUWZZY3V3UWlDL0dH?=
 =?utf-8?B?c05DdWl3Z1BjMzRCKzVubmdlWlFsR3RVc1dXU2lPcHFKSERaamEvbGM5NEdH?=
 =?utf-8?B?MTNUVGlKdUhGS3RBbEprR2ZvUytyY1FkTjZwQ1k0TDFzR1BGb2RWS2NlNVZm?=
 =?utf-8?B?R0w2bmo5Z3VmUTNYRkhaNWFuMjNrWmw0ZWI3c3JnNExaMk9GVE81WFQvVnpE?=
 =?utf-8?B?YXBpU1U1bGlmNVBacXBrd2pockxjK043Q2xwL3pLQ0s1bThSK0JKQjJJK0RX?=
 =?utf-8?B?ZEJqRU04bTZXZ1hDMEpYVnJicm5uWXdYSnYydUNyNkVKZnhicEc2RDEwUVZX?=
 =?utf-8?B?U0VZTUQvcDZJdk9iRjRla25VNStJVW5YTDRsRWZDZnhBRWplbk5VUmdBdW9w?=
 =?utf-8?B?S2kwbkwzdXhEbklBMW1KeDNkVDNJMUVnNlhXdDV0ZXhVMTg4ZmRSNm1oL1VE?=
 =?utf-8?B?TlMzSzFzY1phRXBtM1pRYm1udExrSmJIa09DOURjdmhKZmllRlBNdGF6M1Vp?=
 =?utf-8?B?bGw3b09kN1pLTFNKZlpEMnJqQmlWYzRyRFlmSkJCdzZaemI1U0kyMFI3VGtV?=
 =?utf-8?B?WkpZOVgzclZTNzVKQjBxdngvTzROUzJYNGlnMDNRdkgrNmgxRkx2d0djT1BV?=
 =?utf-8?B?dHRza1M4ZmdCaWJISzJHYmtxK2dPdy9MNlYrR1IxNXhOaVFEZy9sWHI5UHNq?=
 =?utf-8?B?S3JJR2hnOEwrQWZDQVpkdlRsbWxnWnYxa1FMUy9udlpxaUxmZkY3enJsbDlk?=
 =?utf-8?B?V1hSTDl1Y0RvQTRzK0ZTc1R0WWtKd2FsU0JzOHVQNm11VGRxY0x4NXhUNHdO?=
 =?utf-8?B?TW9YeWRQSnlhY2NHc3BiOXY4MkF3TTg2ajZtOW9PSGJ5eWRIcVRnRzRBZWlE?=
 =?utf-8?B?SFpZYmhCMTFRSHIvSHpWZG13WlcrS3R4MGVKakJiYnNnUTJvVGtiZS9aTUhW?=
 =?utf-8?B?T3NCVlZ3R3lXL2RWbFFNRmJjL2UyRnZnY2ViNWkvR2VhQmI0Nkd3aG1rL3Ba?=
 =?utf-8?B?RUtlbUc3amo3MUlKUGNqNEVNeG1pem1lVXVrQzBtNWVuWmNDTXpvNnpSNm05?=
 =?utf-8?B?RzFBcHRvZy80SUxJTUk3MlE3MWR3VUhkbTkwVEFkeHNVNFB5OG5QODBiYXpG?=
 =?utf-8?Q?oOnKQyZTm0447egR1PAVGGbnoxFAcJsouoJf94+tPjiZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53057f8d-8add-4e2b-8462-08db2b842e0f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 09:51:31.4002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pK6Uf/RCgTR9qRYV4K0t0dTXkGVLVzuqDxu5EfKT73O+vDfuQtJ6Tq0kiRE8nbgiS/TPPrnNG8l3ZDS4SvBmnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6806
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 18.03.23 13:09, Michael Laß wrote:
Hi,

> 
> * Frame  41ff. (10.8s): Device connected on Port 2
> * Around second 13: Running "screen /dev/ttyACM0 115200" on the host.
> * Frame 131ff. (14.3s): The first "Hello World"
> * Frame 174ff. (16.6s): Port suspend

Frame 174 is a control request (SET_FEATURE) to enable
remote wakeup

>    --> no more communication
> * Around second 52 I did:
>      echo "on" > /sys/bus/usb/devices/5-2/power/control
> * Frame 179ff. (52.8s): Port resume
> * Frame 221ff. (53.3s): "Hello World"
> * More "Hello World"s every three seconds as expected

So far
> * Around second 73 I did:
>      echo "auto" > /sys/bus/usb/devices/5-2/power/control
> * Frame 418ff. (73.7s): Port suspend

Frame 418 is the control request to enable remote wakeup

>    --> no more communication

Just to be clear, the device is generating data, isn't it?
So you would have expected data from a suspended device?

According to your earlier report, the device does support
remote wakeup:

Bus 006 Device 010: ID 04b4:0008 Cypress Semiconductor Corp. CDC ACM serial port
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            2 Communications
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0         8
   idVendor           0x04b4 Cypress Semiconductor Corp.
   idProduct          0x0008 CDC ACM serial port
   bcdDevice            0.00
   iManufacturer           1 2012 Cypress Semiconductor
   iProduct                2 Cypress-USB2UART-Ver1.0G
   iSerial                 4 827211C2091B
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0043
     bNumInterfaces          2
     bConfigurationValue     1
     iConfiguration          3 USB-UART Configuration
     bmAttributes         0xa0
       (Bus Powered)
       Remote Wakeup

As far as I can tell, your device is simply broken and does not trigger
a remote wakeup when it should. It will need a kernel quirk.

	Regards
		Oliver

