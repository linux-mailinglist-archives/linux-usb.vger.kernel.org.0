Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62BF6476EAD
	for <lists+linux-usb@lfdr.de>; Thu, 16 Dec 2021 11:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233314AbhLPKQc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Dec 2021 05:16:32 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:33618 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233230AbhLPKQc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Dec 2021 05:16:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1639649791;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U+GCXTa42gwZgw4cloh5c7pbeXpn7xtnMlj5FOP780Y=;
        b=fODsHlFLkcEWuAvqytm0DWqU+zEaCo0XdcerXLLi8zcx8CU1xj/pldCzx6YBdf5R4eM4rT
        EDhIdY43t7vqDCeSguQlEU0mZDUHuKq5T98ZV0cXKBoVeFySZ61ASrRcl2QSWlkO94Q7Q4
        Kx+Mnd91zTsTIzwxp5nFR7ElmWlPm/8=
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-8W_pUle6PBC-RtPBdtFwvw-1; Thu, 16 Dec 2021 11:16:30 +0100
X-MC-Unique: 8W_pUle6PBC-RtPBdtFwvw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaaNez8JZ4ZQsNiaM9tSRVLs2+OZLPmiq/un8NPU+8Vj1UCnDfkbzpP6OiqKFs9fSyMJSNhqpDA+bZRwWG8Z/j++QH8h2R0zdr9tbdlzjZLyn/pwaRN3BCn/44Mq/8qtAPkWAIggEvCydj2aG7KIHIIWb4les1KO8p2kMnumlvd32ap2qIOhikP5xJgKFGgQO0mXxo4qs8lFv4BBSQN2jB58LPK4GzD3qbb2wJQYAfHcvUZd2R+JFsZ9u6W4n4prbuG67S/WD/ZKScFMBdPtyzQ5wH1pdL1UTtXY/R7nda3ML4fZrBGMWvlyvXVMzqzxCK5wr9XsT9HHNrwHl6HivA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DaaTcB2CHRh8dXRoNf3sB4IDgzavDokpuzfaXdr4h0k=;
 b=SNxeePDTgWIOYf7bTRMbcqwrebQDzrmy7bMJFTjhORQ9YjripXxHtSkidm62yuyMBubYAALqd01Z0EtcSrzdCIUCauyR+oztEs+D3g1kEQYme9ptdwPE4RjvNRR1DjnF6sdH2iGmG2fvndRMNMUzCBCg6ej972AJ6WQ56HSHqBPLsydOLBWQ8pAhelYqKD72NR1D/YppCWQJwi1GTRSOTnDnnis4n3F7fR3ZCucCw5+i0lh7I242t5aFb42ies3TPcJxehIkn5KYdYhDvYl7+mB/R/ZaHjGzivOGqrfX3YuEqS3zIMGLhB67/ME6k1XK0eGPDVhoeEVSXDi6FGBR8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DB8PR04MB7019.eurprd04.prod.outlook.com (2603:10a6:10:12b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 10:16:28 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1%7]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 10:16:28 +0000
Subject: Re: [RFC]How else could a malicious device sabotage endpoints for
 usbnet
To:     Greg KH <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>
CC:     linux-usb@vger.kernel.org
References: <ad1ee829-401a-d051-1da8-f9e01caa7b85@suse.com>
 <YbIlBl8Ay1rIED8p@kroah.com> <71bfdff1-61d0-881e-a201-e91920750648@suse.com>
 <YboCTzOTp49HuCxa@kroah.com>
From:   Oliver Neukum <oneukum@suse.com>
Message-ID: <4739899e-54c9-c28a-502c-e3a85118c301@suse.com>
Date:   Thu, 16 Dec 2021 11:16:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <YboCTzOTp49HuCxa@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-ClientProxiedBy: AM6PR10CA0069.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::46) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55f4992b-59fc-4b2f-4978-08d9c07d1f74
X-MS-TrafficTypeDiagnostic: DB8PR04MB7019:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <DB8PR04MB7019A7CD401AB74480D7B916C7779@DB8PR04MB7019.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lBfG1iyTKh5xkNKEjA1xiSxU/+JoyCQpHEodN4Yh360y1cP1pJ3WEXXD5w2kIB5wFWS4AdLizK6GoYnp4esJ2ArxahkqbCi59dQ5zN+Pa2FDrkJafuRQClN0AmojpiYo9OMRnwGtCM5HGqaQycTwKB+NS9NiuuUQ0/EbmaWP7FUXnzqn2/k+LJxjTINgvHKV/iyiRd5+48JaK15t7+ZUuzw2LNK7ay7/TXZv4/YmfKBS+Z8+xbF8vQTPFYxYNNVXbjaflhpuk+nCqdO7M2jO6tBe0YIX1buS22bGEUwUl03fDGRafPsAXW7JzkafGU1TCH9itNoTQWjHtah7U6oqkV+P/YRYMYW6l7gBZA0zyAP/mcg+Si1UtnpTJH5qM2SrMUndLljKMZF0biCwsrJR9JLZe+6Az4kvZ2jBPnEhFAjX542ZeCMvQ5o5Uxh4SwxZ6Y8oJQb93sRxFKhXmT8iYjOb9iDAB/CITyk/HjM5U6FsDwKXJESoHTGaXEdcM7ghfQAESKxG3pnIFCdlpzGmCRsHAzLfDdFnI+418YeqfZYu9eZ7d1FjoD3m9a9GuSYBySf3mHnhAOV/FBBDLC22EKNMJ/x4VAW6ZkSNpVVsc9cSGj3EyMQoounR7TCXYMaC0ZtflxuRNFzOzeKENurUhMV04Q8mrOljzDiA7/YrCNiltiAQvhkh4M1l8QBpm3brNPbWcfhV8DY3/C6PlG49kVn1RctrUu6Uq3Om1eyQoexmQP+PLsUuSj8uuEESTl1Y
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(38100700002)(66476007)(86362001)(66556008)(6506007)(31696002)(2906002)(4326008)(316002)(83380400001)(110136005)(36756003)(31686004)(508600001)(6486002)(53546011)(2616005)(186003)(6512007)(5660300002)(8676002)(4744005)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B0m0pDm1HPDNRQO2Dd2Y5/qYxpzdPAh0ro1UJP6BArHO6PDv13HGf02ndHl5?=
 =?us-ascii?Q?ZXK7kEwQf62tjL4WQE/wQf/UBdy/3YlYyJMWtNzCqxrlqPylc9hTuROyZRNf?=
 =?us-ascii?Q?LlVP13J6HmS8S2AQogZbt+WIG5xmd/TJggiCv7E3VD/ilu1KRe77/M7qLxOM?=
 =?us-ascii?Q?26QA+NCR8QhQXVyk3oKaMePbQ24cm5XXIUVzVLdjwPvnZdmQ0qGRKsDTGLbX?=
 =?us-ascii?Q?bt419hTlsWDFA4rgBvMrSR6E8/Gfm2AlrM78gCKWajQ1IvmQAJxDYhmQq3LM?=
 =?us-ascii?Q?jRGDNd+QFGQ0cyzaQ0gE9QHs0phHAfX3IwPckW4oHxMs3xEEVcnrhsg6pPAh?=
 =?us-ascii?Q?zjCtQvvEDqYybeKGWe2lgpJxE0kRb8yEzM9c1/8KfnwOvevpmZjHVMpnpML2?=
 =?us-ascii?Q?qRLikWM2UHMvNmOF0Eg/fajtvDrRQ1qLHN2vqueUehrZB+NqvPtSz7o2LETD?=
 =?us-ascii?Q?2Vr56cyUDrzv0/pD3b2D5KuxZWV8A3HDLyKD15L5lOBBl25ewgQRw0XBu1UB?=
 =?us-ascii?Q?lKw+XgiMKsropXyLMpTbBEvbhobo2lFMoHyUkTFsN3Rt3rN9iVD8uTqiWNEY?=
 =?us-ascii?Q?PecbCS7B6jo1p81Gw318zIUDqYjN3ELtqfRlRJzFHntPMv2alb0yb291D+7p?=
 =?us-ascii?Q?46Kes//h0fmfXmYGvQh5n7QV0vcN/VAjR7zJsKD16ISBYUE67tctj2yOkJ2s?=
 =?us-ascii?Q?FOex7YogjEhoJuPZTGzam23sUH/KLcCMGCI/wXSCK+zApcNjenVwhtjN6MJ4?=
 =?us-ascii?Q?YmVZ9TcYVwCiLjZiy6aXQLym1casw0OSHLn9jRiXv7qMIEZUdGvdyQL4VhXI?=
 =?us-ascii?Q?xixQV++nubRl9mDjjTVPNNBHY7gL5tYXcHsPfhLN3pPfXX0xrfMCtPsv4nXs?=
 =?us-ascii?Q?t9fyZZ4S4tl8umcWgPzLJmgNS8xxNnuA+7LJeqraVQHmimD299foHJK1NMEd?=
 =?us-ascii?Q?zBK84tAAq7UD5wJFgnK4NWJgdFHAquY9c50fIFaUtN8rl2pQDi3vYARHAvLt?=
 =?us-ascii?Q?dpoCwyu28bnGx0hmiw3OUM5/M+s9B6m1jjgWnUNy1s40V0buMRvyzpPcfpzn?=
 =?us-ascii?Q?sbHLDUUBY2U2GkP7uHkNUouYooe6VNUgGXA9qFkXDPQkWXJxOBpjXtjNZbuB?=
 =?us-ascii?Q?L2ztYcgcZxJQmSkXgeZLAt6o1CJCfaB5P/HdRmUwosG0CkiWdl7c+R8MNCHa?=
 =?us-ascii?Q?HYcoKkT8AEXmchUFA3L73+4IwdbfIkczSRiw6VsanxPPIFOmBN9cONHMXMzf?=
 =?us-ascii?Q?OyGDtIKP9tBzZ1MQUqkJxtMftJrWOOzQs5ksKUL74iDE1OcwaDTtjbUkbq8v?=
 =?us-ascii?Q?KrFdNoOUkVPJjDO3u7jZJOVvT/jUCgEb7dbP/W/p6wEvtHy/YRvSQwDK87Db?=
 =?us-ascii?Q?JJwyXP819OczHOyusSunL78Dcf7u6oMLD3qsNQJPLiNseCQ+Z8TGWcfAiWHS?=
 =?us-ascii?Q?t/pbgjxwTNjni7uC+fwYIlBXVTPagmFAMB2/yFQyzz79jeS5IZN6rUUHl8/7?=
 =?us-ascii?Q?bbkaWF+mhslB95FfnCxIF7eYtHVbf9qXHZU0ZXI4NoPw7biWiYTHi/FLsCOZ?=
 =?us-ascii?Q?08TMDqRcNLPlfibQZvwtVmf8eALF2ZSqgZcvlVS415KjF9+3o9G1YPL5Jmep?=
 =?us-ascii?Q?tsC4mfHmU6OlTKi26J+/EO3QsuV1SNAUCyBr8DY6Cz95/P2Vgej5foPHfuiu?=
 =?us-ascii?Q?uIEtl+1O3T/jDVWBG1ya4o2LXWk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f4992b-59fc-4b2f-4978-08d9c07d1f74
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 10:16:28.1784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpoOs4DlbSM4SS9SBJIc3+CFjvDm10NHRO0P1EcyuUAyuYHxplARYb5O8z4QtztYs6cBwxv7NakxTq8KgIdfkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7019
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 15.12.21 15:57, Greg KH wrote:
> On Wed, Dec 15, 2021 at 03:47:55PM +0100, Oliver Neukum wrote:
>> On 09.12.21 16:47, Greg KH wrote:
>>> Why not use usb_find_common_endpoints() and/or the other helper
>>> functions instead? that's what they were created for.
>> Hi,
>>
>> which one would I use? In this case I already know the endpoints
>> to be verified.
> I have no context here so I have no idea, sorry.

usbnet has three ways to match the endpoints

1) the subdriver provides a method

2) a heuristic to find the endpoints is used (that should be converted
to the new API)

3) they are given nummerically by the subdriver

It turns out that #3 needs to verify the endpoints against malicious
devices.
So the following questions

a) should that verification go into usbcore
b) what possible ways for a malicious device to spoof us can you come
up with

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

