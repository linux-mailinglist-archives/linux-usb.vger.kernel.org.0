Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D11F66D794
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jan 2023 09:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236041AbjAQIJg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Jan 2023 03:09:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235653AbjAQIJW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Jan 2023 03:09:22 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2044.outbound.protection.outlook.com [40.107.21.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808B127483
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 00:09:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GudqQx0j7ubr0MNPkP36+z+pRkqzyxYfij2IXMzcXG18cKJlhW9qXr4CK3z5y1+F28yT8gSBwDDvJQJ5ly6EjslZYYYBi0fVeiItonQcN16qfRDaCw4VfEJ7I+rEkISQ7sxxtHEnBD5q7k/CQGIsl8eDGZQ98cdPhREfAFhbBH5IUABh5b3MboZwkU56vhk8wunruGR6VIRK/KRSO3Co+zmVbjMTny3hFmhEOez0jQX4Qyct9VrYcRptVtL0AXnkARAVWTRoNsCEinAit5d6NODAfkX8e3lXOjqYA2vIg5MH4MvAheE8D4eeJwXt3od3Ltyo5irrYEeo/TQj+c/AyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4DMZx6ddmbq6WmCkfpT1WvlpkEqDhUtAhqktZz1FQ8=;
 b=On/pc5Ulkebp9UW9cBh0ctdWgcWmQFHfGiDb/N9M470pthCTB1G+GwZhM2rSBOnkt/3o/cQ5hOEF0z71asHV+YaxAnZC7YCVJzhTPH2uF3NbxgXoSTYGnQ0cw3Ixx6bpkdhkL+tGEtQc/0LEJHCZ/UQSjJn3TS8ssxjBgc0TZncHDw9fW7u2ooPoCcFeUWgnQ3+VVm7sEd6YXHv44mXAkgT1Fl8jfpl+TXQK+2IQD0xi7hV3SP6HghdbsaMeRLA3WeKvbLI80JVjvfO1pUY94dJ4V1Sql4IgpXG30soKJlo8ZSToYHIZog9ZxASWO9Fnjt1f0ViKaJb8aNqHz8d7NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4DMZx6ddmbq6WmCkfpT1WvlpkEqDhUtAhqktZz1FQ8=;
 b=ulr/OBmchrk1hEnOkpFtf/wzC90p3QNszBkBYV8TL6GWpcpX5FrZvWF7HSfcd26hLgHUvREEsYkm7Q17fEkWazplVDCG2xxIv6Z5RyLQX8EdYVCc2KAAlhb9fZ6vTZVCetRa4uW9Tbm8ZNXj3nHiGbd6BNVoBZvJHF9Aj2zRKT3IlnhE1uFOOSpzNGvY2w6fjb+sHu78xBwND6ml1j4O/8oqKMogBGM1wdbwFD5CkgiHJADUDl6POOq0YqT1qxgX8X+UkuQeR0jEojj71wLNdA44/1mgWc6G9LyKc6ToJUk91abKwtRx+Wg4ITjw1fBB5fb7WOh8EbJt5QS2x2nKkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AM9PR04MB8116.eurprd04.prod.outlook.com (2603:10a6:20b:3e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 08:09:17 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::8d51:14ac:adfd:2d9b]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::8d51:14ac:adfd:2d9b%5]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 08:09:17 +0000
Message-ID: <111d7b42-5e85-58f5-0645-66749e754673@suse.com>
Date:   Tue, 17 Jan 2023 09:09:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] Revert "usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS"
Content-Language: en-US
To:     Juhyung Park <qkrwngud825@gmail.com>,
        =?UTF-8?B?5pu+57qi546y?= <zenghongling@kylinos.cn>
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        oneukum <oneukum@suse.com>, gregkh <gregkh@linuxfoundation.org>,
        stern <stern@rowland.harvard.edu>
References: <2mw02fh6hzd-2mw3w8xfngq@nsmail7.0.0--kylin--1>
 <CAD14+f1p3j3WJUYshneH7A38b8JsiXjtScESB2uOQ-ZyBi57tg@mail.gmail.com>
 <CAD14+f1ebzviMF-pi0ryKU8cRPWp2BqV2dwiXOFjeM30eqrwOg@mail.gmail.com>
 <CAD14+f3De+0oPaq0hOo0D+siTvZDNnBXg7Qg6fKNDh63zVh8Lg@mail.gmail.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CAD14+f3De+0oPaq0hOo0D+siTvZDNnBXg7Qg6fKNDh63zVh8Lg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::22) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AM9PR04MB8116:EE_
X-MS-Office365-Filtering-Correlation-Id: d4bf1651-8c56-4e22-7850-08daf8622119
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mJGD/dW4AVODzIBYXy/GmOfOsjBQLzr1dy3NKs7Ch9QaV8wkXvq4pK5zFNXUbFBtgTqRNdoT81Ca6Ug4ro6Rt+5o4SgHJIBHwtN+4qaBafuqfxs+LV4O927t2T0X9vQ7QiwZHhDAdJQf+q4sMonED/iRv1J3SD/X8CLvCWZFO+wchRwzPL4Pt5h86tmiT0pP3L4CM3NTuQSJ8Jz1ADorQVkGL/YHzl1smrty8KWr8CqEA5DcC9fXz/7qxV5ioaguEnPd7mszRw8uU/rrQAWCNgZSmQo+EEW+G7Cr7fPLSQA08DdvcM0cFWDAZRWuZOHsJWOWF3JHh9WSam8Z5bNY+OjSlPm00q0hr7uIsJv2glQW4fzJQYHfTmw6NUzakvQVnBgg4B1ZDPP2Q0Hm/dNA4bMy/VzICAPcFXwef4mCk2qDLSoY9Ujlm6QfbFZji225794R1Fda1EE601QaPRAlq/kP1fH9Vq2Y3BTcrUkrk8ZxeyH1zFnPUh9DqzxC+A63OarxzBlYx7OUrqIBmYcNEY4U0PO+Tl/yzcRzZr8pEUIfvmxqPpF5lTkZjtwlrgfvdLY+6rnSODIURcKu6AgXj47hubThWMp0SJw92+1Fdsjw8RAS9W47ybPejdg7uUJfBIjw5wyOebEseeM/tyulgAHfYSMmkKG+K82gzfUEumaE67I5vgocIwcwEdrcqdyBHZFqf1liqfOiQ6ZLmrbfVNUahWAl1QUu3cg6DpQye/VfKbLUa8xniX/31kKFbsRq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199015)(36756003)(31696002)(186003)(54906003)(478600001)(6486002)(966005)(110136005)(6512007)(53546011)(6506007)(41300700001)(2906002)(4744005)(8936002)(316002)(5660300002)(4326008)(66556008)(66476007)(66946007)(8676002)(38100700002)(86362001)(2616005)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qkl1NGVjTlZVeHYvNFRxays2R1FGUFlBL0c5NFdMQUhhK2FSSmhNTGdoK2hy?=
 =?utf-8?B?RjNJa0M4MVIvSy8yN1lCT3MvSUFSOFlnZ1RpZXRyaWRwZDFpS0lwYnVuaGh6?=
 =?utf-8?B?VkUyS3VKd2x4UG9iZXUzemp6bmwwUkN0VGdEUHAwY1ZzRTRVVjlaUEx5K2hT?=
 =?utf-8?B?VWNhMDl4eE1nbkNEeU5McG1GTUx5bHpZOG9OQzB5M0tiZzV0cUVnWWNsY1p4?=
 =?utf-8?B?RFk1c2NrTXFDOTd4c0FYYmh2OW5SOEs2SUFUblp0RUxXV25CQTFPY3B6YndD?=
 =?utf-8?B?Z3BQUzEzK1FCekFOaVIyNE1IcWgwWWhOWDRLUlc5VFdEOFJ2TVF0UzQwYmln?=
 =?utf-8?B?d1YrekdmL2UzdGhyemZGTjN5M0c4QU1CRlVlZGtpNWllbHBveklISTU3T0RH?=
 =?utf-8?B?NHZHMk9zb05yUHdPMlhsMjlhSHUwREREMkh4UXNiYktvM01MTlFUQjNRZUll?=
 =?utf-8?B?SVFDVEd6Q2xJTUZWeEpLdFUvNFRFTGoyZEdzRmllSStkTzk4bEV0aVJRVmlz?=
 =?utf-8?B?UW5PUTQrMDJ2ZDZaQ2tmMTBEeHRVbGJJUlhsZmxqVklHVE5xcHBwWm83VjE4?=
 =?utf-8?B?Um1hZWdKSFpJa04wYWdLQTVRT2NSVVZXaDhiK3FJR3c3K0ZoQVk0OTMxcjFj?=
 =?utf-8?B?dTVQVi8wcUJCekRMamM2RjRSSlVia1FnMDVQcjQzNU9HbGFESnNLQ0JmV3ZB?=
 =?utf-8?B?WXl1TjcwMDBYWjhyYkQ2Qyt6c21lYklmTnIwQ0Q3eE1USzkrbHFGSWlhZmQy?=
 =?utf-8?B?alB5NG1YVlQwQXU0bTdjdmo2anJTSUc3YWNkdVRaVmxHMDZESW91NUNiRzJ1?=
 =?utf-8?B?bE5HTkdIc0I2dHVyYi81Um5aQ0YvUllIaE1SaElrL0xlamE5aEdoMXpRSEJK?=
 =?utf-8?B?ZHVEUDNmRXJFTGJTVHZ1T0RUdWNCQ050WTlha1NLblR5TXphSWtESGkyYnha?=
 =?utf-8?B?OGt6cXF1cVhQckQ4dGM2cTZBUTA1eWRYdk53cS9QVGI2SGliZ2R3NnMwSXA1?=
 =?utf-8?B?dHZRS0NiV1N3WXUxWFRZZTBMWlhzdU5vMUxaNDlxWG8ySm9ycGV0KzV1SzY5?=
 =?utf-8?B?OVd2M0JhcTJ0cjdtU0ZsQm1DazllZkx6MFNSS205TG9uY09jYkZ4RGF0eXc3?=
 =?utf-8?B?M1V0K2orM1pHaGtKUTZSSUlyNWJ0UzlKc2lIaWc3aUFlcVAxS29ycmpSL1Yv?=
 =?utf-8?B?c2IxYVZWN1lDcURKclNLNzJQUm1xUnFzd1kwQjZyR0F2Lzg1TWNMYUpZdzhp?=
 =?utf-8?B?ZnRnc1hQN00wK1hEWmhKakc2L0N2Q0JHZUFXaURrVEdNSUtsZ3Q1d0ZER3o2?=
 =?utf-8?B?My9LRVIvN3pzaG1NbVpXVUxkUjNXSDZpUmdqaWJFaUt3ckp0ZGl3VWpBT1hL?=
 =?utf-8?B?YzJrZTJHZW45bHZlWDdXZk5OOVNRaTNZNnRham1YZXZVVDFTNHFYOUZIMmFi?=
 =?utf-8?B?UzRicjRLN3BqYTZJT0dEOU84Y0VpYWR4MFdiMnRmcU5NcVFSTXMvT01HeDdS?=
 =?utf-8?B?eFQrNG1UckVOVWgwMHU1bWFSNTd1WFpJbGN5OFNodlRqaFZ4dkxLdmVCUDc3?=
 =?utf-8?B?Tk8rZW93cWpNbmRhUmMvbzFXRTVIcG9zTW51SHJiYm9WanFsQVBPcTdhU0Rh?=
 =?utf-8?B?MndoMlp4VGhXS1VsbzhqS2ovWWE3NDl5T0UrQlZnUk1xY1BpNWdDcG5KUTVN?=
 =?utf-8?B?M24rUXY1MFVyand2RnV5KzhsTUI0MnI3RG03aXNPMXNDcGJDWXUwMmtuYy9k?=
 =?utf-8?B?TXBRVktSaWFMb0lGN0FEVEpxMXNLRXJIVFFNQjVpSkNlOWNEYmFndFFWSGdD?=
 =?utf-8?B?UWh2N1Zya0cwOU5sdGtZYWptY3djandiRHNscmRFUFdsYzVUNlo0T1BCSDRJ?=
 =?utf-8?B?eTNJdWJhNnVkS2lxRWU5NmRnSjNlOEYzaEZtV0NhOVI2NElkOG5FUHoyMnVj?=
 =?utf-8?B?YmF1a1ZWOXpyeVhpUVJjNy9MbDJWVmpVSHZ2ejVmeXcwcGkra2JCQTRyOCs2?=
 =?utf-8?B?TGs0SitaZXhjWDd1NlcyVHdpaDMxTmFsVWQ1di9JS2xHYU1Id0xMYXNjY1NG?=
 =?utf-8?B?SEQxb0F4UEpXNnBub2gxNW5HNSsrT1NxMDlCK2YzcGFxaHphZ1RVQitTWTAx?=
 =?utf-8?B?aWU0SWVUWHVCa3FyZUs1ZFA4Uk5nMkF1Q1B6QlJXdGQxNlFNQ05xT0twTENE?=
 =?utf-8?Q?Qft4bqz8xN+WUaeWejiiBPTgCLu6Ty46ffCvmruhsWx/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4bf1651-8c56-4e22-7850-08daf8622119
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 08:09:17.4803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Ib1ji+oLICQ03AnZU1cSSpy5ufD4KoMAnb6C4GKC65o+U5aVLEpN5rtjrDnvjG1zP0i9V5qyNNzHUl43dyDUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8116
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 17.01.23 07:16, Juhyung Park wrote:
> Posted a new patch:
> https://lore.kernel.org/all/20230117061046.114145-1-qkrwngud825@gmail.com/T/#u
> 
> This issue has been stalled for way too long. If string-based
> comparisons are too ugly, we can improve it later when Hongling is
> more active towards this issue.

Hi,

very well, you really see no other solution?
If so, could you please enhance the commit log to literally state
that there is no other way to tell them apart? And then resubmit?

	Regards
		Oliver
