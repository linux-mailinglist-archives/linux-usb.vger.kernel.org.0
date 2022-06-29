Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D43CD55FF35
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jun 2022 14:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbiF2MB1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jun 2022 08:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233293AbiF2MBZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jun 2022 08:01:25 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00EC43FBC9
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 05:01:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMwjZrhhNzkrDvzGPubgOp7UVxPMS1UKSCZdtmh+j76phlKGbpL44iudn7X5Hd6+FmUw2I1YOxDW2Wygubhp6BgiLgOLsnh7u3anrWHm5Z1iE4n0GdE4hd9o5LMD2KXrAo579JcYAvkXO0foQqX+npI8GiJtVXkHPNFOIbgo8VZQv3aLnENcLuVxrDVUKVpysqdj5Ahweb/QmK06hLSqoNVj+IcPs5RmWIbcrWPYmJiam8LAfA118fraZ0akpLDVfu7E4j3GaNFhnotk8cEjzJkS1czBI7H23F7DcIURKH5rkSpJqs5+2FPR3lt1iN/6iAFOmnvk6QE7Kjnd3V5V+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0kAsGnv5YeaIPs8Q740voakgnwm2hMjplJvGu87dSA=;
 b=SmQbrRUn7oyffw4WDuTDcusYtZChUUqI04CbnHVyJ0+PzaxwQZltZRynGnGL17i47ZFGOQ4DNSIHXEyM6z0euSnetHK/Qr7mg/Gu9odUEv/lMpt0ns8gVz3M1Z+V4+ssO/Yg3qGkO2mRCQ3QnY3dwPg9glXsj1v57/GHZokNVReaHC86fANmN6R5uHkGJVlhUU8zPC97sqcLQSwQzVC+BCaEzn2LySmqZFADOxpmsUFY4YU6b8+0mEKisCp6Q8T1Tjdw1coxw1xTVFHKoWx/V35FEDi+xVkOVC3orONkjblKqJUpryGItxekm+YKSkXlpm+GJ7yajX3K61arjdJA5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0kAsGnv5YeaIPs8Q740voakgnwm2hMjplJvGu87dSA=;
 b=EahVqg+nfXHI7z7T5qyoh7cYLZnvIYCnGIXFnmOcNYiXUH/XJWIvLqczDhldCAYIPgInNDc4rriVEpG5/TQqSqmrERhGuX7WAZBXmkt5mosmbo/YaNh6P18Lu5pM/QPGgnbFe7hI0cTyrEExfxz6R2WNYTSXTtxo3WAd8WshRLuQtjZ7yytU/IqM/tJdt7M+lOyF0u7MYaoqCNQ3daBFS6XFlioC51oxhquJ8pZ3lKGFVXsKL+z3e2u/7yyYcIl4+fMx/iDe08wwzb5Rw/GydnvkyR1nqkdB/EGOAoWYJGgDn5C1vq7KJ/0ZqqHJhLUj938+xPCbhJTOUrj6hsHORg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by VI1PR0402MB2735.eurprd04.prod.outlook.com
 (2603:10a6:800:b5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 12:01:20 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::21d5:a855:6e65:cf5d]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::21d5:a855:6e65:cf5d%12]) with mapi id 15.20.5395.014; Wed, 29 Jun
 2022 12:01:20 +0000
Message-ID: <78bf969a-2936-1eee-9d07-9c1694b25761@suse.com>
Date:   Wed, 29 Jun 2022 14:01:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: acm_port_shutdown hangs for 30 seconds
Content-Language: en-US
To:     Jookia <contact@jookia.org>, linux-usb@vger.kernel.org
References: <YiynBKeGJCMEkgyO@novena-choice-citizen>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <YiynBKeGJCMEkgyO@novena-choice-citizen>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6babcdb-f1fa-4e76-eae0-08da59c7143e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2735:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gkx4r0JlFKcw4cQpsR2txKzFmGMFXty3CmdGzVcHZCVSffAF9YilbmdDtFg+AGOIWvoJ4E1lK/pJun4jPECC9Rs2VwicgepAKMTsF9pWWoRzeJbZFnZ4W6GwV0lkwH6/guegay/oA6Z+/g0jvn6+tiemFFXpJqelz2oZKd9zmkkwPuwNhYQBLKEsCSGNo4Wr6v4UJ4R3ff9i265VsxWm/m4YwFT+LPS3vJb8Ab8vxYv/3c4bQRNyWDJ2p6u47Hz4uWzEn8kvkn26CLKi1wujcp/1RAu9J1lJj+SjnJQMoeWA22gLokCnJeugQJMDpzxoBOgm6obLzFsRawzKa81Om8bYDe67sXusx9107BhOSWiwzoqSEyyE25bIa+G5ugOmc5krEgKGJN5sPFC387vdG7J/jd6R291mUDZhSZbknj2uwRsL2bjsmJfVcW75r0G+BbYIWAvBKmOwNlF/9eVWF94hhKdVDQ6SXM53fY5ah/aLTLaua9u+CdOJrS9yNOVJJEjnxxmZ8NJiiTZDKb5QMzcUUBaTq1+tLwY1MOmQHo8u4T0db0DH3f3nNsfiH3bf6FPsFJlm9Cw/9kkntC9LucHxcKN9CazyNJ4ulRp9RwcYsoSBv5B1Ar722oUXSWLEgBrZJtVY3xnzfOcRuBjWWgi2r7Fio9wJ/0Gy9jbNbwH2/2tCHKwB2K7FMueQP80cmLUi/Dh2UexinaX7bkZr5D+Jj2YdkIGh58W4Im3KDmf/tNJmQR/fiPa3qmVE7kKo8KwZ/gpFBJ0So39I6Sjy3ORoIhikFFzHNphjppWVU99Qi15yqrXv0KK5Wu91mahh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(376002)(136003)(39860400002)(346002)(2616005)(41300700001)(186003)(86362001)(36756003)(6486002)(31696002)(478600001)(66556008)(316002)(38100700002)(66476007)(8676002)(2906002)(66946007)(83380400001)(5660300002)(6512007)(31686004)(6506007)(53546011)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDhwQUs4T24zb1V6Sm43NERiWWo0My8rdFZDTmJzUG00eElYSFRQVVFvKysv?=
 =?utf-8?B?RDdPWFpYa0pTRWI2bHFNKzVNMjFCUmsxYWgwUXZLYzgrbFFEcWg1b3hMUnpT?=
 =?utf-8?B?dVE1Qno3dFpMdlhmSmd4ZzYxNzFZYmVrdXJWUWhYY3J2SnNvaUQwRzJmV3lj?=
 =?utf-8?B?ZEhEUStKTXpvOGlGbWRBbFBKSlVxNllLTXZ5aXdRVkVBUlJISU1ZM0UrVU5S?=
 =?utf-8?B?djg1MXIxaXdtT0MrM1RNSERFSkdFZzROWkFoQXgxc0ovWG41djZsNHZMaElQ?=
 =?utf-8?B?dnRKK2lpVm02dXlKSFZEc1NReldJaFlHUWQ0NWxTN0ptSENla3ovQXZWcno0?=
 =?utf-8?B?cmJpaEVEajVHdklBZGVGcTBaYTRhdEpIM2dvZm9NWU9GbDRVa01CVnNHRVhY?=
 =?utf-8?B?bXNKTzZ4YzViOG4xaW5INmNDTmRtRGlhK1RLbWFnZEJYTEwzOXdTRXUvdmNx?=
 =?utf-8?B?bWRheWFJLytxbTNrVml3Q2c0WWFFTzZFM3FIZHRQUTlYUExUSzJramRSVXg3?=
 =?utf-8?B?dCswNVQraFM5QmEwbDFpMWJISTI2czlqN1NFcHlUcXVNNUpJQ1dLUVhIMVpK?=
 =?utf-8?B?L2pPQXVJblkvQ0RJamwrT1VKa2FwTDhrUUU0Q0hiVGx1QW5tRVUrYjBoSW44?=
 =?utf-8?B?K29DZkk4aHZRcGxiY3NaS00zZVhRRjEzbno1d1lJejkzdC8xTlpDL2RJM1cz?=
 =?utf-8?B?ZVNFNUtmWjBySGtId2pNc0xYZ1NoUlFiWWRWYXV6eUtlR2lWY1RKU1F5a0dh?=
 =?utf-8?B?c1p1Qm14MktqMWczZ0thM3RrbkNVa0d2anViN3k0ckNaL0oxeTRCa2R5cCtq?=
 =?utf-8?B?QWsxR2t0cFJDcW8wR2N4TjNlSTRnMFVXaUJ0ditLRlJIcDZXNitvSE82Mnhh?=
 =?utf-8?B?OWZNUzhMVjNqeVU4R29DdVlTaDNhVGNpcXk3MCtzQUFjR2VxckJ4Ui9YR3Zm?=
 =?utf-8?B?Tm03ci9EOVNlYm9YcU5DWDhXUW8xU0YrNHZJNGhuaEhBU3FCdm5IaHNnVFJp?=
 =?utf-8?B?ZzY0QUdjQVZyV2ZvYWJIbEV3ejczQ2JVanFuUzNPd3N4QUh1UkxkZ0N4cGQ4?=
 =?utf-8?B?WUF5eERiNVh1dGlQblhXUDE1YnB0eDdFU0x4WFQ4YmN0YkxxVytOSjZtV2d5?=
 =?utf-8?B?bzZZckZiSlZNd3V0N1Q1QWNRcnJSYTFPRGpXV1NNNk5xM3A3eGFvL3NHaGF6?=
 =?utf-8?B?amJkbFBNWDBzcGYyVE1QY056QmNDVDZJcUQ4WlhsdkJ5WVFGM1RRZFptZ3kz?=
 =?utf-8?B?cFFlOUFySVRCNCtyUVFPaXhpZWtzSlFVVTMzYUlwV0dvMVRwckJEODZBT05y?=
 =?utf-8?B?UmxaNTFhaUxvVTc0RzdhSURLM1RrdGFLY1NtQkdRVUwwVGxTWVl1K09ma1l4?=
 =?utf-8?B?VE1zcTl6Z0xYRFFzZFdETUNDbHBrUkxVc1hyZ2N5cnZIZ3hYQmd4RGdKZDlt?=
 =?utf-8?B?UTRWMURHQWg5ekZDdjdPS0Mza0pRSkF3RG9VZmdoUGF3eWg3ZUpCRyszZ2hI?=
 =?utf-8?B?OGtaYysyUndXaDFQTG5BZDF6Wmg5c0NOa2xqWC9CaXRoVHg5WTd6dlV1NXF0?=
 =?utf-8?B?cGFBeXZROHBhNVk5eHg3Zll1L0hwc2w5U1BKV0dnYzhVR2VQMGRybi9vazFC?=
 =?utf-8?B?V2pwTXNqVk5RRTlDdWd1TXQ3N1pxbWFMc0k4ZE8wU1NMNU9nZktUSW8zNWI5?=
 =?utf-8?B?djc3Zkk3SDZVNC9PY0s3NWx5aEJvaTV6R1V1MDhLR0Z6TW9uRmZZajZKbDRK?=
 =?utf-8?B?SVowM1d6U01oS1U1MFlJbkxJUXBXVWNzakZKY2VIN0pVWWF3NnlndXpIM05G?=
 =?utf-8?B?aEllN3ZSVXBCOEpjU05CMkVPSmwzTkkrRFpuL05aaGtrbUZMUk1yMm9yMjVw?=
 =?utf-8?B?aXFBZ09IL3AxRFVTbE44Y3kydy9BVFJGWkVMdzkvQWhtbVJWVisxSklEUC9J?=
 =?utf-8?B?UEhjUXA5VXMxcWs0TUplNU95b3lrc0ZIZE8xN1E4R2xqMVBsUGxLck1jUTNF?=
 =?utf-8?B?QTEvbnFDTzhxZUFNazBKZHN3TWhGQVNqVlpxOTZpcEV6dXI5MkFSRlRaQVJ2?=
 =?utf-8?B?MThZMUxMT2hIdnlaaG96clVETmVOZlBnVmxvYjJBaDVhQjNkanRzc1ZhVW82?=
 =?utf-8?B?NUZucVVDSys3ZXIxa01aa1pxNkFwSmdNbUdDL2ZyemdKa2NnYnEyQVZqUWdQ?=
 =?utf-8?Q?xvMCmcPYbmIi+f8dSJ5YEMyjp6enJWbx70zFQEDd5Plg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6babcdb-f1fa-4e76-eae0-08da59c7143e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 12:01:20.1565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIL6DQNxDfIAIPDBRLxAbPeeO5pKCLesaCDsg5Q3ETnkvNnPyFGhv1loh/EMobdqbLwESBKI/URwsekSMrryXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2735
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 12.03.22 14:58, Jookia wrote:
> Hello there,
> 
> I've been banging my head against this issue over the years but sat down
> and started to debug it today.
> 
> When I try to quit GNU screen, minicom or another serial program it
> sometimes hangs for around 30 seconds.
> 
> To reproduce I do this:
> 
> 1. Connect an Arduino Micro with stock LED blink firmware
> 2. Run 'screen /dev/ttyACM1 9600'
> 3. Type some letters (no response from the board is given)
> 4. Quit in some way
> 
> If I skip step 3 (typing letters), the hang does not happen.

You have something in the buffer, which the tty layer will try to send.

> In userspace the hang happens at a call to close() on the TTY, and using

The tty layer is supposed to wait a defined amount of time
if a tty needs to drain.
This amount (among many other things) is traditionally
set with the TIOCSSERIAL ioctl()

> perf and ftrace it looks to be spending a lot of time poisoning urbs in
> acm_port_shutdown.

That is a bit odd.

> - Is this a bug?

Maybe, but unlikely. If and only it takes much more time than the
termios say.

> - Can I reduce the timeout somehow?

ioctl() TIOCSSERIAL. If that does not work,
it's a bug.

	HTH
		Oliver

