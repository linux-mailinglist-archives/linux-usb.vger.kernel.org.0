Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D253E6C9D22
	for <lists+linux-usb@lfdr.de>; Mon, 27 Mar 2023 10:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232457AbjC0IGC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Mar 2023 04:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232590AbjC0IF7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Mar 2023 04:05:59 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2045.outbound.protection.outlook.com [40.107.22.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF6949C5
        for <linux-usb@vger.kernel.org>; Mon, 27 Mar 2023 01:05:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPlZChcNlCI9c3wT1+oXMgeqJBMmK61iXtMZeIi9Oqnl+pYPWDWU7zuFCJevfBZjJB8FwJXfk0kWPJEnqvYGK+2ZMH6LFlEcXRB68P7vHuMoSC1uo+XfxboF79n+oL21gDmfQULUZncD5fKpj7+VB4glZx4qWDbVL/MyvWaKKIK1OApqKBZAh1eUeS+NTzwfNtrLJ7Sh63oiZBjyuCIgXet07AziMYzRDHhf8XKSUKSo6rFbuJE8LNoFJq8JgrkIPE399PU2AdXlmMVdo1ffwl0jhAwxAR1TCFWpubT/n3hU+JBMSu9In03G+ceO62qKgeM5DWWsfByaVlUYAmKbSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ze5xDb5Hs9WPD51GfDlq51TpN96EZjP3fUn+ElbVUE0=;
 b=KXd7UiSCyfYbl0FG2C7+v8dm4BXI6zZsrRZDg9qNxFSn9GaqiCm5mKtY8qtzrTS4nOtGO0JbNdFK5i90UoJHQ/ATTgJc7aOjGh7ZVJnItuJARkLB2p9l/Ft1B514VEZ41QVcGnfYhADfpTN5ZnHhj3mfLND3FDvOIWj0CtoRV5TJYRe4Tmz0tJxqCfq7b1M4Ghqk/qJlbv2uWbEhr/B9zAE44n+MAQSm4zjUyBoKa7TeZKchaQkWY8Khd+KGIKjl+MlBBZIzehmNslCLcLGAwJk39bpfweUnJVAbJomrBr1kjz3NprTkBYo7XTbJflN4ukxTsCyElfQkwGE9QyQyTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ze5xDb5Hs9WPD51GfDlq51TpN96EZjP3fUn+ElbVUE0=;
 b=FWLMIvJpX8MkxrL3zGpkM5Zal2jEQ6Qe09iw3Hkk73Lrv5e/zivMLaozK20ewl6uJjEO6UGtkuv/rjR9xzGC3oouO0jb+89bkr6ng2lFi9eGA8PY80tg0jaePzKr1arfHXN8bXbH7pV1Rj2vYpOJ5DJ1KGytaQ1NLVJuLY04EHE2HmlS5sSysDddet2WXReYuY2FJw7beYP+F2NLoq5OV7bkehFag11HvA+RBqjYjpeAWAfhGbxQzdNpCYrPq8GJ3/XrGnYCRk1giCOy+d8lx6Cdt+WOf8IviK9zoUPO8jE6OVcKy9Q6KnIMZ9oeik4LcYR9oUGsEOwrDoautQeJBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by PAXPR04MB8813.eurprd04.prod.outlook.com (2603:10a6:102:20c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 08:05:54 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7])
 by VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7%4]) with
 mapi id 15.20.6178.041; Mon, 27 Mar 2023 08:05:54 +0000
Message-ID: <9f8df0d2-f2af-8e62-fe34-7d826678ac7e@suse.com>
Date:   Mon, 27 Mar 2023 10:05:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Cypress CDC ACM serial port not working correctly with
 autosuspend
To:     =?UTF-8?Q?Michael_La=c3=9f?= <bevan@bi-co.net>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
References: <8be9b56c6becd0981d1cd9c13742df6ba2975b56.camel@bi-co.net>
 <0db2a0a4-6ed4-fe06-217a-cb564f1d4a8c@suse.com>
 <bde43a1913cf55e580e77ac0e059fff3c26dc093.camel@bi-co.net>
 <2f98290f-995b-89ff-8ba2-1463fcf78297@suse.com>
 <9a1381abe0e2b605786bc9c3b2daa3f7bdc3b64c.camel@bi-co.net>
 <e977c0e1-4604-47cc-9c53-619bc897d418@suse.com>
 <646eb1bb5218b9ce5df21e89081b09b84dbd46fd.camel@bi-co.net>
 <46e50745-63e4-7e97-739c-338f9a6445d2@suse.com>
 <c93512db198b14ff8892102cfecec3bea8688aaf.camel@bi-co.net>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <c93512db198b14ff8892102cfecec3bea8688aaf.camel@bi-co.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|PAXPR04MB8813:EE_
X-MS-Office365-Filtering-Correlation-Id: a5361ebb-499a-4038-20c6-08db2e9a16c9
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uLLIfuWAJ2O3/Os3G9PGlWR1zbbvlDuWcjPsZvgy+wesMKt6aLtwlAZsexeKyHqzRv0eCTrkDNFuQDNIQVCx3wh3Od8L+jlmxdZWVlSNX5mezh3VawmxrgqL0tETY1eU0ISzDtsWHjOkCO/VEkCzd7f1l5XR0wuG1/1e59q01FDYFSMNRQrz8gJZOM7LPduzp5fMWFlWXGxU+HA/S0fOjuZXqrkdgktFRE3nEpDYVyeHUB2PRogiS0GmEWr8A+YBxsRztWPojCODZPOfJ+mFXmVReFw2mOtf+We68wJQGw/ZrJfLK+ZUdLRVzNjOXSo48GXwS6o4tjOVHF1q0TDIhoBm1wZupOuXpv1g7CkudNOacDrq3cmEgKixHMdT1Sz/v8ZX+B6GhtzodOoVd22O44mR/13PwMGg7wkhzCbPZiJdZPnkYULrMUT0XuvJbsJcaVHn0JLDmUOVEQoe5wvsIYCcU1IIOKhSGdpxMElOiGVEWTO6QWZohwPYtBly41Zi+2Ttg7OPFc/Merc/nnp+bloSWPpoVcdHEzGtQUVE1fW0/yPK/hVEZhmLT2MmKLT0SOK3QJBGWgUAJokCH1q02+PbfsKk51mteWwbDg+YJRdcEmzW9ZYtCa0WsI6JBGpAc8K4nxHTOyCvfF7xgXT9jw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199021)(110136005)(316002)(478600001)(5660300002)(8936002)(36756003)(31696002)(86362001)(38100700002)(2906002)(66556008)(66476007)(8676002)(66946007)(41300700001)(186003)(6512007)(6506007)(53546011)(2616005)(83380400001)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXFoaVZrT0ppODRoUW5EaTJlaVplREh5aGlqbGo4TGZMazMzZ3N2UG5qU3BL?=
 =?utf-8?B?NUUycGpOblROREpPaDRQUzlzaklkMEFkdEdscTA2ZGZrekNqV1o3ZG9Wd3hD?=
 =?utf-8?B?R25CNDlwbVZoeW0weGlVL1dWT3JnZHlQeHJNYkhyMFdlcjlKRDJaeWcwTENT?=
 =?utf-8?B?aE5qYzJYb0REY2UyUVlqOERONzVPVzFrbjVaNHExODZSNzVacFhhZmVvT0lF?=
 =?utf-8?B?a0JER2dLVDVXditWMTFLQVNpMlB1TGpMV0hjTE1tWitkRkNIdlFxUFRES0E3?=
 =?utf-8?B?aWpJenFSNG1BRlZtQWRnU3orZXhPQVRZWmU2MW15NnlTNGFhTGgySmJrQ2J0?=
 =?utf-8?B?UnFnZnVmN2JLeHRPSlpKMFB1K0lnSjFEYWJ6citoODBaREV3L0pPZ2JmSkJU?=
 =?utf-8?B?Vy85WGVKT1JUbkVzeExicXU4U0F3alMyTmh0Q3gyVnhtZ2hiWjNBZ1ZGVWZH?=
 =?utf-8?B?SUF4R005WjY0U3hBMzVZT1lyVGdibDRsUDRRb29oTk9xSVNTU0JYT0NWRGNo?=
 =?utf-8?B?eDJxcElsS3RQdmcwK2Z6WEpuNUsrZm5kYVVwU3VCUm5tdEExY1N2OGcwUmJ6?=
 =?utf-8?B?cTQwRmFkWFhNdytSSDJIZDFxcFlsMDNWeFpnVXBCZTFOcDZGdU5kUFJnYkxp?=
 =?utf-8?B?OE01MUdjNXJjbDZ3akpkaVVyVUg2UER2Q3VFd2xDSllCeU1Cclk5aVpINlBq?=
 =?utf-8?B?UDI3UlZDL29sN2tvMkVlY3AvQXA5UFdmNzlySHdxYmxmZG52TE9lVTZvNW9X?=
 =?utf-8?B?eUcxWEVFSktLaDNEV0gzQjNPQnAzbUN5Q2hLQm1IRzBXV1lZbzlhbkxTNHdx?=
 =?utf-8?B?Mi9INzdzbGFONUZrcFYrOENtTitaQ0t2emhmNlFvdDVoSUVPZDFWMDM5TEk5?=
 =?utf-8?B?TWRSSWhMbWM5TXR1RmdwNk5YdGJsN28xbHZiOTVKUWhRMCtRSm5FUXRNU2gz?=
 =?utf-8?B?TTdWVElGUzN5dVlJSlFUN1VSenVraFlEM3lFUVV2dHlZa3RaM2RsMzRvNUo4?=
 =?utf-8?B?Y0V4ZHJEVGQ3ME5tQUdITHVZdWFKeWw0MXM2K1puMjErMTVFa0NnMkFYc1FB?=
 =?utf-8?B?VEpUS0Vaa28yeHhFdVpPSytpM3N4cjRzZWJmazBRcEUrOVdCMWlJSEZkbDVr?=
 =?utf-8?B?TXN5dEZyK0pzZjl2SFlWRDZxcENUVFR3YktaSllVN0h5dG9iWkJvRFNBazgy?=
 =?utf-8?B?QU1sSFF0V2F1aUVoeVdYY3p2KzI1YTdQZmZ4YjZOeS9qelZ1SCt2MFIvRTFx?=
 =?utf-8?B?VlEwTUZhRTJEdTJteHpwRHhxUFBieFlRSzE2cWVlWktMSy9uVVh3TkVBSzZ4?=
 =?utf-8?B?d1RxWTFoSVg4YnpUS1EwemZvZ2dOelc5STlxV2pnaGFxOGhwT2ZkQWg1dkZr?=
 =?utf-8?B?VFFNaVR1Q00xWUpmY0kwRU9QN0NVOFdjK3RHTU9tNmFRZDJYdWxZWjFrSXBQ?=
 =?utf-8?B?QkdxZjErN0FnLzdnME1RK05tYlhtZUQ3c3NlRURXQ1FqZkkyeEdsZzZyTHBR?=
 =?utf-8?B?L215YVlZWTR4aCt3ZTJDbERDZGx0TFpBN1d0WTRCUUdkVE9UcU9KV3dpTkJ4?=
 =?utf-8?B?NWZSNXNaSGZxdWdidWRiRzMxNXZTbXp3RGpLZld2ZUc2V0Q5UFhydnR0OFlw?=
 =?utf-8?B?cTkxZ21UclpXMjFvSG1QZ2RpWUFYVmhrU0RxUUtuQUYxMjQ3cFBTbXdpNkEz?=
 =?utf-8?B?d2pZL1ZGOVhQeE9JSVhiN0ZJeTY2VmpLMlVUOXpMZ1R6TDFHb0pBaFFJdlkw?=
 =?utf-8?B?R3Rwcy9iT2lZZkU2RGRDdU1zRnVlSmRudnlsRU1tWWoxTlhtaE45VHJHM2Vm?=
 =?utf-8?B?dU9aY1p0d1EvVU5PU2djU0tXZW1lRktuR0pSWU5oYVlGMEREalhqV2ZSU3pa?=
 =?utf-8?B?TG1yNmhSTzdQait1Ly9FTVNDbzVkT3VtZGdXMWR2MUtmOUl1ZGdZT1BQSnYz?=
 =?utf-8?B?L1Q4WVdORFJ5dW1TZDZYR1A1Q0poQ28ycFRmZ1ZEa0dGcDZOK0JBZnhJZGR2?=
 =?utf-8?B?ckVIWjlyWDBuZ3UrSUdYTGtCRDFFTzZhMldzUU5SeEFYV0h6Nzc3bHJLL2ZI?=
 =?utf-8?B?Z0haNWFTNUpzUTdXZzY0UDI2YzVRRFJoM2xqWWk0UERWOWxTaWg5SWVMcDdP?=
 =?utf-8?B?eDE2Z3BGRllJbGlGMkthcVhNM0hLdEFxNGFTSnJqUkc0dVN4dk1DMHBwblVG?=
 =?utf-8?Q?ZBRAKHGe3I2+A2gB8KRamqDhp0BBJCJpGzRfXM6TzLkn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5361ebb-499a-4038-20c6-08db2e9a16c9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 08:05:54.6897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4BBXsZVES1gJR9eNiUekui2X9Z4SLgu49lrvFzhh1mEvAZ+HIf7qRl/pj+HbbfSMm9EZZGbIdFA2xH6PJ8S1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8813
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23.03.23 22:32, Michael Laß wrote:
> Am Donnerstag, dem 23.03.2023 um 14:53 +0100 schrieb Oliver Neukum:

>> I am asking because the device says that it is bus powered.
>> That is, are we putting the device into some sleep state?
> 
> This got me thinking. I am observing the behavior on a ZedBoard, a
> development board that contains a Xilinx Zynq SoC and the Cypress UART
> chip connected to that SoC. I now looked into the schematic of that
> board.

Are those devices out in the wild? That is can one buy them or did
you get it through development channels?

> The chip is a CY7C64225-28PVXC and the datasheet has a section on USB
> suspend and resume: When suspended, a separate WAKE input pin has to be
> set high to issue a remote wake-up. The designers of the ZedBoard have
> tied this pin to ground...

That is technically allowed, though disappointing, but then you cannot advertise
"remote wakeup" in the device descriptor.

> So the chip behaves as documented. If any, this is an issue with the
> board design. Nothing the kernel could work around. Sorry, I hope I
> haven't stolen too much of your time.

The kernel could work around it. We could quirk the device to ignore
the remote wakeup bit from this particular device based on ID.
RESET_RESUME would do that, albeit with side effects.

If such devices are found on sale we need to do something.

	Regards
		Oliver

