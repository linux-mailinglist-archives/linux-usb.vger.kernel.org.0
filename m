Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8A951BD0F
	for <lists+linux-usb@lfdr.de>; Thu,  5 May 2022 12:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350584AbiEEKXL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 May 2022 06:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245305AbiEEKXK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 May 2022 06:23:10 -0400
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.109.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8AD151E4B
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 03:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1651745968;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KHtraixGRU0xn1DNtScxWVEHMeIoqdfasX7QEZQlxyo=;
        b=bXjQV3zFPUsT0YYM7z3f7z5BHRAkpMYrJ8dFIhpAY5E6xLOtkJj7ellG7NZmmHX0HRajK/
        LYVardeobnWpyy9haQgp9CgPwEvzUVilQrzbHHaMbslLgKCXkS5YOhcKdgUwrJRlnGiKNP
        no0HIACpCh5TQgXlWvOg9rEn7Tn+EP8=
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-lUSnx8mpOUuUPez35exQ1w-1; Thu, 05 May 2022 12:19:26 +0200
X-MC-Unique: lUSnx8mpOUuUPez35exQ1w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVGlQkmj3f9oK/BR3IpEmKr8/tdAA2TgXlfnSGrgXgBSUY0b+6XaPrQ+yCvjDEu9i8i9/Da4QIHRgHC3kGd3G9SdU1dCi3auJSeOgpOcTQ1dT+/3v4gKauBLEIv4+T3I0gqftZv6mXbbgF7w37cpPYP/ZD3EK+JDdq06WdxEr3W11TXEqrjENXpnNMnK9S4GPL2V0Quf15kd3vV5dgQSQgfYCG5TkwQ1rqX0ErFNQfomjr/NrGKvNUYFBNimPLm2BSVHbecrShnn3HS4XxzZ1yyoglRpl3mVUQzY35PgWrTckMiNWk+aNKQ6/d2o4gAnaMYFjoVUwOBbC00cIEF8rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vT8GOeAbeizniFR25PN29VENz6++KiZs7cCLeUNPiD4=;
 b=LoAkJagwgfI8xNb72DM+otY2jIu3ekfo//6pXugEnDJOJ/FawI0diQBn/1Mskff+pgxoCQ2IiMundAkn29RRpXU6Bjse88iyXt0iiA8KHFpRsaXRegUKgFAG6ew9Jtr1U5kS87Olc5lORbYSUKzi1liJ3t+kXNM6E5zSSp2o8rndWH7QoHVvRMDJ6pEd2+uewGadmxlhjufJHdOtDIPAGvj5IORg+QpL/VuV/HeNEjClxE3YGNX8wUZFj9al8TbpA/+KnK3cqd2pe9DzbOPExHY5oKQSXiOkmhHqUeqN2Z05RYBjQD1Ez1ES2U9rrJi3+8QQcf+v2W/86RdVF+/e4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by DB7PR04MB5482.eurprd04.prod.outlook.com
 (2603:10a6:10:85::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Thu, 5 May
 2022 10:19:24 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b%4]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 10:19:24 +0000
Message-ID: <15f82796-fa82-fa26-ed38-f0785f39f87e@suse.com>
Date:   Thu, 5 May 2022 12:19:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4] USB: core: skip unconfiguration if device doesn't
 support it
Content-Language: en-US
To:     Marcel Holtmann <marcel@holtmann.org>,
        Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
CC:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org
References: <20220504083612.143463-1-jtornosm@redhat.com>
 <6A6E8A20-1994-44AD-981A-C8CF472541AC@holtmann.org>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <6A6E8A20-1994-44AD-981A-C8CF472541AC@holtmann.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR05CA0008.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::13) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 696d73e7-1e27-45b1-37ed-08da2e80ba21
X-MS-TrafficTypeDiagnostic: DB7PR04MB5482:EE_
X-Microsoft-Antispam-PRVS: <DB7PR04MB5482522603F0936FD179DA68C7C29@DB7PR04MB5482.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FGeY1CrRpLWnjLf2VGHcGPrCOdcG76L5tDKG6v7PkMCCAkUVJm43IwlYNNoCKieI4bpRE5Fz2SqbCl7s9wwI69Qzj3+D/m6oit51H6dWEAvd/Ac05S8cRuyYKUwW1WR/MEF9kh4FHuMmBUTOCWpWsjA+ZPwzOn60PyBySxxtd2YFM7AxOYtMDVJgYQ0HP3n8x6gewGnBkeKVR+6sm8V58a9gAiOn2ZlwMXmPrR9aHZfJsLu4zeSssGypdkaLIG7nZRDQaLc1L/VKvS67YRgSpck0a9zPDnxod3exwvYvVhb3DXFksLVvGKTZ35fHbxG5mYc8snx5/zBGfAwYK0fiwx7eSoKSIDVXl0CRJR0T59Zf5H83bik4WBX6wrW5jCXwwm88FKYZYfJ/OKkbQK1wiDzbpFfF4PCPdsC+B7ITFZLCgdStnXVlpsVAQVtAH2mbyghQyaDviz8eKUQiX3ehK3tcW0TTQ8YsI9xVRgX9hcy5HBeKYMKhJUoVscNgCaPU8N3oUmST7HEBAMF7DqjqNyFK+/RIsOLyxJnHDyoyVrH5PEHlQO1ZUtS9l5Gg2BvMXvOd9Ptie5VL+ugG0OnTXzFdsbgecIBVigIqkSZYNXXgbNpfiupcZYYUlJoLng2fUM4gb2WqUPLwEWc7imSE/ZJKvr1VozVDHPiFZ94QPe93X5G0SoUnWxso7cImTcqxlYBiysF0Jelqboj+vOpF5qB88T+7soOY9aOiYUdxYIQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(2616005)(38100700002)(66946007)(8676002)(66476007)(66556008)(4326008)(36756003)(8936002)(186003)(2906002)(316002)(5660300002)(6486002)(53546011)(508600001)(6512007)(4744005)(31686004)(110136005)(6506007)(6666004)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WFhK+InksulBs+XZSgJ+yn0A2773dkdGXkblOcsjK/V6jmBZPAYqN74d4pjv?=
 =?us-ascii?Q?30r7P/23pyxIuXFDUnCwT1GS2g0dcTXKQUU1/R5nsxiqCd3uW5PbRYw1Oyk9?=
 =?us-ascii?Q?IxSjGsBC8CEZoTwH1N0OYpLJnryMF+6MRIjZ7lmxyPOzBE+RHB3Al2M2F4Bf?=
 =?us-ascii?Q?FJtSaUHZ8QgJrqzjH7xhPEqfewK2vcsMyQdraXcPy9Fvx/9ZJX+R+GIf75ve?=
 =?us-ascii?Q?e7JgF/w9UjYW7qt5/3nUzPfbuQ1vzn3VQTut7jCO9cSgTP6g/rpqZP04Y+RS?=
 =?us-ascii?Q?QY4KoMDyIKos2yRUXdFrEXGS37eVvU//reyiXHXRjJ2YKNjw6XAWwIP/+Apm?=
 =?us-ascii?Q?d4YJq5LgaJjxeDIMUpcPNCZzL45kClntsYIxWCviDIMhFuiBw5zlgO41ZhZM?=
 =?us-ascii?Q?V05Ep4sPww5WnhmbYvKz6H77K6DPvXc/gH+hxIDS9LVu0hc5MJ/v53ZMWs3F?=
 =?us-ascii?Q?ohf1ZxvVb1P6SHBVw479oabsyopJMe+WGhUOpgGcUBeHa4pYGwfZaE139sv0?=
 =?us-ascii?Q?K77sdXcdNEcWm1Lfy08D6lv+0r10r9QEFjdl6aDwB6TxQTs+PJ9NTOfqENrF?=
 =?us-ascii?Q?nnsivajlLs7MdWoqW3ngHVNeTrUH8bP91fqm4I0Vpd8w6RWPm1rGKBn07pS0?=
 =?us-ascii?Q?lnBRh4huUFMiLe+jFF+axKTeNZfZaY2hyxbA0NzFWavQuFOad19dUmFs4S4M?=
 =?us-ascii?Q?Gc8b71KYW4FNyubfuPtMyg8GmlM2ExCy4Jjrn5796LiVy4+Xt7Zf8pKm6HlW?=
 =?us-ascii?Q?J7kuGLJoHKeB6YraFf3x2bmBmHA4yZTX3xJIlPhzkZc2ZlOXiDSSx7VotGwk?=
 =?us-ascii?Q?mXz2bNtW9D8SHQwRFA3AyOn+KB1ZtMOYVO80JsYCiO0wWpP54G9AMqdimERR?=
 =?us-ascii?Q?O8ZcYwfRhfoGmISRpixy+j410BmshKqxlcDGinSGYASIO1wwcvF/zk2MT/lb?=
 =?us-ascii?Q?BQurW/fRkmKzWLSVekB5xpnxrzBVdoII/8Ibe5iVGdul4rJ/5DjReJ17Vvk0?=
 =?us-ascii?Q?RxplxRa+rdJim/HfiUicFdzCaxmdxIOvR1YNRagQ3Vd07JOibrSUAeOfzY11?=
 =?us-ascii?Q?rvx+1El3PXw0sgu2Ik6Wj6LTtziUumtEfvxyxsMx+f5XzhFk+KflYEDyjb9i?=
 =?us-ascii?Q?0+Z2YNQca6TnNZ+kkzgEOBURr8eZY3Wkfew+x1M6JFY+/7Ff0aoD3klxV6w0?=
 =?us-ascii?Q?jxCAYK/Na5jCMIYg6fE1Y4JNFIUa0+oC3kzl3oJHMxG5nk5iNHduPHv7w20s?=
 =?us-ascii?Q?aSL4P+NK3Yh9ALr1w1kmGTatnjW6MKYFphL5wCdWyJ+yit3P4bt64o1aSpJo?=
 =?us-ascii?Q?Shr6CNsvwj1Q17BxI8qf5gepLKBo+NgkZ6gW+Ecpxv2S59qStAUYVcu7sI0p?=
 =?us-ascii?Q?A5MLnzqGUjM/IqApSdrS3btGL1Istx94rpY8/rXNAGqz1MOlMv5lVDrvDfsE?=
 =?us-ascii?Q?3xyGnqWpNuM1EKwIPh3aD2N4L1uYUqZ+9mC2PMl0oE/FcFq0zFTXn6UjbQq5?=
 =?us-ascii?Q?xo2HiwLLW8Fr0ihPKhDdW6MbIVcbj8mC+VlBz1iQhBxlAFA7tEJYFuiu8CVZ?=
 =?us-ascii?Q?JLZ9bS9JGLmTci8s1GFkH/XaR5D/Lcqs2MLRhCGaRQirel30gSTv6MOcnYh+?=
 =?us-ascii?Q?OqjvZ8jaclNfjSCybXPX40hjd6gDTYwLn8n/xMZRvYcf+tj0z+BognXivWv9?=
 =?us-ascii?Q?zjqdFOzTwgYMDAgVFsiq+Aw9fvPIj+pIOrlRbjYtnzIkR4UHYogdWrSIJQXx?=
 =?us-ascii?Q?DPaL0+Dwd+MggtUuRxRXxAqe3Jpv07LuIPFh1nSqL60oIK9a8ifjq4a8JqOZ?=
X-MS-Exchange-AntiSpam-MessageData-1: iUcc2XxSwDIctg==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 696d73e7-1e27-45b1-37ed-08da2e80ba21
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 10:19:24.1652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7Lc6eexIMfk+eZANFiaUjVE+A3sMBZsa93AAsvPW1jKDc7feV0cIXviQw1N8PEs+JY2Wi/+fNpVGrP2qtbv3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5482
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 04.05.22 14:23, Marcel Holtmann wrote:
>
>> @@ -394,6 +397,9 @@ static const struct usb_device_id usb_quirk_list[] =
=3D {
>> 	/* ELMO L-12F document camera */
>> 	{ USB_DEVICE(0x09a1, 0x0028), .driver_info =3D USB_QUIRK_DELAY_CTRL_MSG=
 },
>>
>> +	/* CSR Bluetooth */
>> +	{ USB_DEVICE(0x0a12, 0x0001), .driver_info =3D USB_QUIRK_SKIP_UNCONFIG=
URE },
>> +
> NAK. I said this before.
>
> The VID:PID 0a12:0001 is used in millions of products that work
> correctly. Only because some counterfeit products get things wrong
> doesn=E2=80=99t mean all get marked as broken.
>

Hi,

if I may ask, how certain is that? Soft unbinding is probably not
a common operation.

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

