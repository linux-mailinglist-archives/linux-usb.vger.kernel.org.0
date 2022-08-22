Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1CC59BD7A
	for <lists+linux-usb@lfdr.de>; Mon, 22 Aug 2022 12:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbiHVKSf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Aug 2022 06:18:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232214AbiHVKSe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Aug 2022 06:18:34 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2042.outbound.protection.outlook.com [40.107.104.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE746394
        for <linux-usb@vger.kernel.org>; Mon, 22 Aug 2022 03:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NERCmSP5phZdd655eamfXkADA7yIzO/bU8CVykE4Cc6kZNQvjI5T5d62RGOdad2ZdX+4fKLk2CzrbBuF3dnfQsA049pvIcn9ZkdiGJ/+IMTihE+G5T7ieRURYn/IVmkaOcBN0RBNWUsZpbKK9ovfzCTYaxwLcVi3JySoUfRRXpWPL5TpYRtWWsrazq5ni85ZyXzu9f8WXKvaVaGvfM/GPbQTn6DARzynbYAespU/ncVa9Gl2HBsLmPTjqTrH/63y4yyUGqtySiK4yVuZ3FVuPA4N2SkLMjG6e6jdC75XzUHlO5zXtsx15KDIqxiF4lNM/GnUk3PClrzX7U55o3xo6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZq8MkK8VOV504PTStEFsNRWpH9euETnVv/+ZwGpZ+M=;
 b=Fm+J4G+3K/WWgPBVUmuURFkNT+Qc1oAeuLrU+nFz+wTEBiEj7cYV4bew09z53hufb6JcfKVQY1FDGYDrgtqnTEIF3v0/nlX4Tzpx4Gul5ipLDmoQsrlPpwuGJB71UzDEOQ1j+X3vBr7DMWPBRuZIxlSC6Ht9RzDXww/aasJ9j/6ZoCxgqhotyHaYkk5+2Qu7O8eCNtm2xb8KhbzHHEu48jidRIFZnkiRMEwBoE84aS29DmU+xfI3t7M76xn4lfS8tEEmQA67w8mw08xEjNROUiXBiq6ec8Df2KwWADTQd764qQOdIh39v+57E+4TNWlp/KazxSZiJTNzLmFdWEHXMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZq8MkK8VOV504PTStEFsNRWpH9euETnVv/+ZwGpZ+M=;
 b=VDBzTTErTeWSlAKyTE7zrpYfNSoof72dJm/SzVI1J9+pc/5sgPL2OfP205BGEMsmJvR/bki7Kl8bfJInboQ1sj91EwNUcbEsom3uj0hJR44QzTGxBRnY6R9hF87CUNfn86ddSAXPlmyFyMjTtxubQtVpbGNDOK4mWSRMuQ445hOT8kKWAUCA0VhAIpZU8HCJ+MmmFwoJqy4Byg1Ay6+Dl4cSi2kplzzcSlPM3WLjTOcfz5xsgAzqw1m8suPZhfwgaOgDsxNGInhEgLbVXShZ6fzUAMj9aN8co8q5Q6tO+aJEURAeuunULrT4OZCkUHV+r15bX9D3LhwLakZp/5il/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by AM6PR04MB4661.eurprd04.prod.outlook.com
 (2603:10a6:20b:18::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 10:18:28 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::7ccc:8f18:a9e2:e1da]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::7ccc:8f18:a9e2:e1da%12]) with mapi id 15.20.5546.022; Mon, 22 Aug
 2022 10:18:22 +0000
Message-ID: <24b4d2af-1401-fa95-0da5-588d9bdfac5f@suse.com>
Date:   Mon, 22 Aug 2022 12:18:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: USB disk disconnect problems
Content-Language: en-US
To:     James Dutton <james.dutton@gmail.com>,
        Matthew Dharm <mdharm-usb@one-eyed-alien.net>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <CAAMvbhFJ+jdFPh5dMV+_jjYUYYgWhCpv5E43Bh=Eoo6su80cUA@mail.gmail.com>
 <YwJFZNUob3BtEM2h@rowland.harvard.edu>
 <CAA6KcBC+4c9JTAt6=HJOciVW=gJ0KsiRWJeNGx-X2g5s+aafFQ@mail.gmail.com>
 <CAAMvbhFWBhkdLW0i5pVsrkJpSKEpsN=9gbHHgaXSP2UavmwvdA@mail.gmail.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CAAMvbhFWBhkdLW0i5pVsrkJpSKEpsN=9gbHHgaXSP2UavmwvdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR10CA0028.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::41) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31384978-f7c1-41e9-6f90-08da8427a465
X-MS-TrafficTypeDiagnostic: AM6PR04MB4661:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N0dMvfcatSKTCtHw21IES3UzL5x9B6Unxrq+FJqxrIu9xBjAA46DZSDx8B7z3pKcgkvh1ZISMLOJJdlRpA0xl5YvidEqUmpPqNxE0IZaLBJswY8PP2JpjEDLo429KdEJRB9zYb14Xsi4rmvS8IeiXw7CU5eHQx06T0YfuoyMwSKM5AX455FYuxOIeuUmaZl516tsaLyUX9732CSngVLlLE2OP04xpgkdq9szHnVCP1DUkx5dzOeBovs3TBb4Gs/rDAPrIN6PcySjUUtynCFjM6vgoGHDonaXQAmy8Mel/6kiMhGvv4bJr5TV11LPfYjnfR1cNsiPhxjC494cP0GZE4dOgGwgiO0a8FCJIlcqSaHrFRtCjLjhJNVqjPI7Sa2YSOG1LXUWGsKVZmGmyWuAqBssH3LR1Y1Q7GifnpZRJrJJFWDArmLQZsRwwyLfwwYXXBrUgxS4vbD+v8yseGGJALJAwd5KiobuEHU/1bJRR/VlEre4rSODU1RabTXn/ZVewCFSp7nGUycIsATs++GDlFqpWMvI0Jh6PYHgbB8NnSMB/vveQz/ibTBiHnZ1ORDi4ZhJylOLik6nW0XM4R0EMDRYYfJXAwZTg+meQlmWFDguJnga3CmITOSKJab6jvqI7Pb33n94GXQRiSuGKCihcpBWPZyy+CKF+yQ8hkDY6z3P2xUCqGfL5qIu7/b5Vlm/sQeXfLYqeUtAb1cZmmmfGPqGGoj7r7/jCsnDjCq4HxHtW/qJHW3cajG2qNcEDsHe8Pjm3bMVrAyKpN0mhQ+Ys7V5Fm+Jg0KRiEy6/irE6bs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(136003)(396003)(366004)(39860400002)(31686004)(6512007)(6506007)(53546011)(41300700001)(478600001)(3480700007)(38100700002)(186003)(110136005)(2616005)(6486002)(66946007)(66476007)(66556008)(4326008)(8676002)(54906003)(83380400001)(8936002)(2906002)(86362001)(316002)(5660300002)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3VraWxoVFZsc1QrUEZ1QTNXWFk0bHZLbXJJdk9oU2JhSFZYYnNtNUcvNHo5?=
 =?utf-8?B?d3BzR0Z3WU0zRmJuTTYwdHAzb0RVUllSMTltdzE1aXE1WjB0aUIyRTBJNEcx?=
 =?utf-8?B?ODMzRVNuRWVvYXNQbEdmRCtSZjVnSmppaEI3R2JXVVZzME1zSUVWQjNPakEy?=
 =?utf-8?B?WlZqV3JISkw3YWJ2eTBUbWxTeEdRd2o5ZUxZL2oxK3paVTZEamtobFFPa3R4?=
 =?utf-8?B?R3NoOTVwbTVaODg1NGFpMXRjMU03c2xoUDA0SkFUYTJrY0VReHRZK0FVZE5t?=
 =?utf-8?B?eTF6N0ttL0U2TEU2K2hUV0lLWDFxTmJSNndpUmVtWlZpcytsODFNSEhZdnd3?=
 =?utf-8?B?N0JMZU93MW00V3krRlpSZ2E0T2w1WXZ3bkFVZ2szaWhYUFZQb0pNZmp0UExn?=
 =?utf-8?B?Ui9WNmNzZ3o0VmRlOUtxZXRRZ3F4RnNVTFR4cjQwdEIvd3VVLzdHUDdORXkw?=
 =?utf-8?B?V3I1YktZcG5YS2hNNXFyYW1EU3EvMVBNMElUT2xXU0hjU216TjFQNytKbGM5?=
 =?utf-8?B?SEhRVkZaRFIxUUREMGF0ejRlNThQczZ2T3BnWS9qZmJqRFE5OElVSTFDaE8y?=
 =?utf-8?B?WFNRbU1IVjAwYWw1bExBdDc4U1VmUXE3bVlxdjdXTkVYaCtqRmJ6WFYvamdN?=
 =?utf-8?B?bXZUMC9LSkd3c0pGN2p3WmhGdUd0VktLMnBwZmxNakMwS0tnTmgyRzRUWVo0?=
 =?utf-8?B?Zy9xT0h6ZGlrU0duWGlqb1p6TmFjLzZ1b3NmbnZtWkRJMm1IVHNNSGg5aGRM?=
 =?utf-8?B?dTJBUXZsRmFjUEZMTUsrZUd1Ym9jR2tYaVVxekx5Mm5mZE5STlFFWXVnbVJu?=
 =?utf-8?B?SFFOS3dSRGRjc0JTRXRXVmcvbjMxVE1VK1ZERHVKaGpGOVhkb2RtZ1lFcmtG?=
 =?utf-8?B?bThkcTVpalZtRUdkekxFVTMvK0wvUlRlY25LTXJtanNmM2NNMXEybWlYaGZZ?=
 =?utf-8?B?Q1ovZTVNYkJ0K2FZak85RmF1NlQxamc0aUJzYXBydkUrRXhjbW9vOTQ0LzZE?=
 =?utf-8?B?bjZhN1dZajZiaWhsUFNIZUdRa2F1Rm53RTVLNXNCWVViN0JsRWgyZ0dMdCt2?=
 =?utf-8?B?d2Y0TFVpYlhEVnpCWWhvT0RQNjdkWHdJdTExQzRqNEp4N1c0Um0vWXlMcWdt?=
 =?utf-8?B?a0VoMDFUcFNHY0tnM2QyWDdpWHdTU1hNRDVMQkM3T2lmNlcySWtnY0ZlUUJH?=
 =?utf-8?B?N0NwTkU0bTdvT2VEVUhkWDhEU0g4cFg5VlBWU29XdkZ2QWFiWS9WYVp1eDZS?=
 =?utf-8?B?eWVvbnl2RDB2REFTdzJrZkhFWGRoTFZ0bEJDa1NBMWRZdEk0SWRJWk5EbkM5?=
 =?utf-8?B?WVhFOTRma0s1TjlCR2crekI3eC8wcUFMVnl6N0d6NnZ4UUVzSWovZFZDV2Nw?=
 =?utf-8?B?TjBZaFBzdWpRMTZMaXhwSDNhNUd4VU1TVE5yeFNFT2VhcHhzQkhjVXZpYVAw?=
 =?utf-8?B?c0Y3V0hudXkwVjF6eDVUU3p1NmlwM2cxY1NCblA3L3l0MkxrenZrNStUbUxl?=
 =?utf-8?B?THFURjNBRFpFTzZ6dzFic3pESWNINXZBU0Uzck1GRHNwL21HaG0rbmtIM2dj?=
 =?utf-8?B?TXRTWHQ4a09QZHFNQkJURCt2Tzl2S2MvQXVpOFdWdDh2TDFkMllURDUvaDlV?=
 =?utf-8?B?SEZYbXFIK1o3S0tqRkpYS050WTBIWmRyUitDZkhLZnJLUXlZck94Y0VPUjk3?=
 =?utf-8?B?QkMyU1ZPR0VUem80MzVka1hGeG9Mc1ZpTFZVcXcxNDFVbU9vRkFLUGVZM09J?=
 =?utf-8?B?STRtWmJVS0NaR0hPcHM4YTlrdjh5VUhORGJRRXhkMWVBN2dVZXFjNFR2dDN5?=
 =?utf-8?B?bUE3YU5nOUUxbmhUQWNzRXdnRWkxcDZweWZ4VGRVdy9sZHkxLzBYc3BwNEFp?=
 =?utf-8?B?QmdPQURIc0g2bGc3NlN5SzNyRllxS0puMlpZemV4aXI4cExXY2pvUXBtTVAw?=
 =?utf-8?B?VlYzSU40dkh4QlR6ZkpvcENYZy9qR1NBeW4vQnpLS1pZS2puT1d1RGxwSWFY?=
 =?utf-8?B?UzdMenNDRXFjRkZlZGlCL1Y0TlFoa05oY25nYjFKekJWUWozaWRjc0dvSDZw?=
 =?utf-8?B?djVDQm5ldzRqcWxXdFJJemx1TFd0N0FJb3dFZEYwWUVHS296L0Uxd2M5bXZ6?=
 =?utf-8?B?N2pKY3dkYkRZSG4rOFZTMk45Wk1BM1l3TnUyQmw1bkFqU2pBd0E2UHlzOVdQ?=
 =?utf-8?Q?XM6FezPMESLEwwundWAVOZ7SvoW25UsaD1eEY8c04JdU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31384978-f7c1-41e9-6f90-08da8427a465
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 10:18:22.4454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSEmIPSZUgnriRLiZizcy9mscC7kGXWZY6ytgVUOpFHFXgNvC2dNit42fjIs/c8HbxTaDB43ZSOx0/9d9QUN5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4661
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 21.08.22 22:59, James Dutton wrote:
> On Sun, 21 Aug 2022 at 21:03, Matthew Dharm
> <mdharm-usb@one-eyed-alien.net> wrote:

>> In the “old days” (that is, my original design for use-storage) it
>> used to do exactly what you are looking for - based on VID, DID, and
>> SerialNumber it would “remember” devices. The SCSI host would never be
>> destroyed, and when a device re-appeared it would be re-connected to
>> the existing host.

Arguably, in case ACPI tells us that the port is internal we ought
to reintroduce that behavior. It is very much an edge case, though.

>> Honestly, I’m not even sure where you would need to begin to make this
>> work. It would require pretty radical changes is the block I/O layers
>> to differentiate different failure modes, keep a lot more data around
>> after certain types of failures, allow for specifying which devices
>> this new policy (which is assuming reconnected devices really haven’t
>> been altered) applies to, etc — it’s a big lift.

Basically like failover with multi path I'd say.

> Are there any situations where we should actually try to recover?
> What about:
> The OS has not needed to read/write to the disk in a while. The USB
> disk idles out and goes into a power save mode by itself.
> The OS then wishes to write something, but would need to go through
> some sort of wake up procedure first.

We have three issues

1) Is this the same device?
2) Has it been altered while it was disconnected?
3) What do we do in case of memory pressure causing pages to be laundered?

In case of device persistance we ignore #1 and #2 and #3
does not exist

> I don't know if that is a state that is available for USB devices, but
> if it was, would it be fair to try and recover?

That is strictly speaking not a USB question. Every device has this
issue. You just do not check on resumption from S3 or S4whether somebody
has replaced the SATA disk in your system.

	Regards
		Oliver
