Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6641D3FC47D
	for <lists+linux-usb@lfdr.de>; Tue, 31 Aug 2021 11:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240381AbhHaIyC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Aug 2021 04:54:02 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:54640 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240380AbhHaIyB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Aug 2021 04:54:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1630399985;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4i98XxfNlAAAGy5/0coQdxvtjthuoYrCqP1XJ6twgXU=;
        b=Zmt7W7SZPSxlsiCd03DgS3XvjuQiNFkahFnH8y9OkmG20vo0FQR6o+iAK0jtvVBURP6iCz
        LyIerDJBtFYCZqJb3+c0rz6QsIzTzjBAGnmlXcQHV3InB9gW5gW5Df+daqXy2apu+L9kk7
        RoT4qOxbdvSB+0zjI0e4XqCZS1O84/0=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-JzW5Y03pNSuT5RXkun7cjA-1; Tue, 31 Aug 2021 10:53:04 +0200
X-MC-Unique: JzW5Y03pNSuT5RXkun7cjA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMWvRDkqq/+PYtCoxp3wyud/edfuDhqYdvKV6Tv8zRg5t7Na5IhW8X6NOozPJhSmqN0NQOWKniRgliOp4XqFt5O8IDwOnowMOQjZ21lLWBIbkuGn89YG8QJ2a2aGforDinMBT+rehBUs2G8nkJrZT4tH0d2Wd26H2V5DIpIo62xj42mDZSyRzjihj0Uc6g6VYCk8OovOXTe5NKXKz55DgqKzwGrmpzvB79zR1WUuYlInVBQh9vGn95C5/8QbuIWPYy16zjIrvdoUuA/dc08tHf/WTV4/P0/2GWa/2KOls6MU0cm7XGbCkLUDMGEmpjJitx30USXTbH3kkKE8TlgnLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhSGbNJ2vA3w6hpoAOTOSAzJwWcI713aAvauQhtHa1E=;
 b=dh2y453ZpoBSHuv9aXsYgkynDDiGs+o8pJaWHwTA4pGGYotg86D7hZQy4FzSKob0pwOej9dBfiyZIvaqAdSrre+XDCflw3TCyHpMguwunl/8J8z03Y13zrLB9HglurJs8X+13BQ8X4D0RylwNFg+i4iNezhH5ROQwgTxsTrecFs2GvhBt+oaGwJ8I+2kKkzEBMSBAf1d6EtRC4+uIt6wiW4BiNvCaMCE7fVdPOkdKuByrII8R/x5WgXNvYJsndNbK90tWqZ1OLJrQP4nGr//4BnhXxliOdLdPHa2Hdxki/yGGaPod+/cBRDdHf/wYxrRjKsB+kfPpHRiDkQuXn31OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DB8PR04MB5721.eurprd04.prod.outlook.com (2603:10a6:10:aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Tue, 31 Aug
 2021 08:53:01 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 08:53:01 +0000
Subject: Re: [PATCH] USB: core: Make usb_start_wait_urb() interruptible
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Johan Hovold <johan@kernel.org>, Greg KH <greg@kroah.com>,
        syzbot <syzbot+ada0f7d3d9fd2016d927@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com,
        USB mailing list <linux-usb@vger.kernel.org>
References: <20210828180358.GA291431@rowland.harvard.edu>
 <0000000000000f37f405caa41e79@google.com>
 <20210829015825.GA297712@rowland.harvard.edu>
 <YSyPQqMPHRiUvYEx@hovoldconsulting.com>
 <20210830144613.GA332514@rowland.harvard.edu>
 <0e3214c8-a82f-d117-962e-326817244c9a@suse.com>
 <20210830160914.GC332514@rowland.harvard.edu>
From:   Oliver Neukum <oneukum@suse.com>
Message-ID: <ad9f7598-d3ba-2128-68ee-c47a58be2a1d@suse.com>
Date:   Tue, 31 Aug 2021 10:52:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210830160914.GC332514@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-ClientProxiedBy: PR3P193CA0045.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::20) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2001:a61:3ba1:6d01:4428:c443:677c:c419) by PR3P193CA0045.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24 via Frontend Transport; Tue, 31 Aug 2021 08:53:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ae4bae0-85fc-48a3-c5f7-08d96c5cbd05
X-MS-TrafficTypeDiagnostic: DB8PR04MB5721:
X-Microsoft-Antispam-PRVS: <DB8PR04MB5721FDDFC604636E3BD6046CC7CC9@DB8PR04MB5721.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cdnJgXaerGLnSUHVcrvCKYhTuMiXKAzeDA2wRTnr7uc0bPHPH97sed5jslnMfsbpp+pVa1PcMmF6bq8iUD0waFAs8DyJvRiWHvZ/KW0uN9hjkylmwOy54aVqltEVbN0Y2qcMwliETxZbVwdwHWDs0DB7JP7m9V1lOQ7CEzC2n3oZP9hnPB7jXQoC8qcneDN2U1GWu2I/CWQ5KEGRq1/fSEXzLPEPx0CjQ2XTFukbrUhert5vPjcEXvsFmuH9bdGmkVGO11M2QSOyCw4fbojduo6aMHpP5qBFqBQqzPXC9CDa6iRyu8vCnvfXvr2GSecTjXiTfbvAcO57wXj/hZ8XEHCrWdNDx1utRQ/5Ml91xIh1Zh02pHt3ra46ECpYkYCdCxs1yRy7Hu3L4Ue7+udXHBN8SWX0xu0wDjTIl2JiD499HRba6655Cpsp/N2zDZ1z1Z2GNFYx4jlrUgu2fe3Vq1yJt2o+WfMuCMGGUQps0ExiSOAYYdjA8DcEsei3j1AHqM99BC3CAf2vOMxyt8ZQpnodRovJ/ByYg9YIoyNWovqdkdSBxjKCDqeJQbgeJMqyZM18UZg+6B1NIJhUWiE1PEi29JBD9mxxR7Gw6euWudGwNvNOmpBAjj9c3ewGdK2rjyJ8vQYBADWM69v3188wG9dbwkuezf1Q9vG1cJSqpUt9lHLDsON3q4BxSwxdxCLJbrMKDsmN5gcXL+Rdd2vt/UoyJoCwtUliO+z2+s8iM/c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(39860400002)(396003)(136003)(346002)(6916009)(31696002)(186003)(66946007)(83380400001)(54906003)(66476007)(6512007)(38100700002)(8676002)(6486002)(86362001)(36756003)(2906002)(6506007)(53546011)(31686004)(478600001)(8936002)(4744005)(66556008)(5660300002)(4326008)(2616005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bux+Yu2xLoWAMVIx4mx9Nt3WqNLkKRRXpb+UDuYRzKSpkvriM3Z8fWYJ/M4r?=
 =?us-ascii?Q?y5zNKn1v94ovc0W0sS8N7Xv/IlZD3iUCY6OdAKL2jhMJJXdj+ujeJOAJQi30?=
 =?us-ascii?Q?qzktVpeZE9E6Vcvg1g6yB9QAm6N6Wrzw5poHucuFddJ4o7mReNX10IJyYfcY?=
 =?us-ascii?Q?SFu4CpKCI3varM6w7T4Clv5dC8VPHbGOBbQmTZZSpFtFK6cdA5wVqhBWwiJ+?=
 =?us-ascii?Q?bYkTfBsBXVgVq6QscMCOzOY2iQBkMHrn9+87DHCdvQJWECOwjvrhM5jJeju9?=
 =?us-ascii?Q?8v8ZCJ1hBdEjdb+xSMG06sDFWLLDCkarAuXxsqbJgbTQmM2sM/rK2dILYKXE?=
 =?us-ascii?Q?fgHJN8zZG91uI6gGhZtHJRoyiXUKXyrt8HSapgmCCWD8K8ACY8TANwycXqe6?=
 =?us-ascii?Q?Ra6a5oKCASZqPmJHLh4vz01uNe/kKNAMjhuv3nwONeRnejizX82L8OzwZ8cA?=
 =?us-ascii?Q?55yRYhdCnUTS8dYiO1U00/iYPgS7ct/vaSikX+EFBZaAJjDdeY7KmFDL9jaO?=
 =?us-ascii?Q?PR++T5+0WtzF9UjURsN777FJkVyA6xdQthEBbgPGHeFIm2esLYvf4LqbRLGt?=
 =?us-ascii?Q?86xspKq7s5Caz+lO8ihFio/bJUrDWRmuSTKiIOmbcXC8mT/VlV00RXB6tLlJ?=
 =?us-ascii?Q?lJmgY4U6u27b5IepPD850evuJvGjCcfeq+SyvfYzuaOzAcCmhQYu9bOysUqL?=
 =?us-ascii?Q?i+SX0umgBu2yCJwMcuXBT6+0lnmezUc3BLz0kO9AxapWvG39U7NNswVatq8b?=
 =?us-ascii?Q?HvEMEbvvBDIqG9oF5dXyCjld2GHNqQTD+E9QioPvY3loBfzQXDE5D4483yZj?=
 =?us-ascii?Q?piKrjCWQ+L62pBP3DF1Wt2dSAacTpGS/0moQZommuPqDfw1nwVsPHhia50fF?=
 =?us-ascii?Q?/UiyLDYDJdAji3ELN/OLBN+6wcn5Aaum/nIOk2EPkMpaOd/ffjMBCHLeOZX6?=
 =?us-ascii?Q?Vui6kRBWPdEVjA25wk58J0i1h7l08D04eJOdPg86tR0PfRYo/MnN2Z+dX8LN?=
 =?us-ascii?Q?Nnjax4GRY/3sxq2A4++NbTx6UojnuX9Uss4CcxBR2BU9YdomzXANqwBhXnjh?=
 =?us-ascii?Q?J7e1tpPRadYQzlvTR2lK1sB7b2EQdxKn5+xnrvmg5z0Zp14Syx2hmbG9KZD/?=
 =?us-ascii?Q?1+f2AuRXFmaC2pkIUWt4u0ywlpzBEIFhG7eop4cErxu5o1Z6qtTfakkYtdcy?=
 =?us-ascii?Q?kjSRW+XX2uQqxrrmehoV0iWLgXWMnc+6IyT2DGSCZfSUC+h3EI38Tx1sSnNY?=
 =?us-ascii?Q?9dD+u2Nw7hKabJ06Zz8Hxm5YovyaeVWHBflw0KgB1LxhgDdnencp0XvA/UrE?=
 =?us-ascii?Q?hHUhyzKXpqXvNGhZzs1Tx/5Y+I9Vw6zoSFIfJBMAnmhm9a8KsYuM+hv7KutD?=
 =?us-ascii?Q?AsNsPvt+DKge2HaLWlff0guHBblY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae4bae0-85fc-48a3-c5f7-08d96c5cbd05
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 08:53:01.5398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qupvZp89kC0uyqSa7XBvMsG2Z+DduJp/luyC/vhgwzEoISrQgXeC58MbfKImmmryHE9osEScC7QHEaVoS7sFPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5721
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 30.08.21 18:09, Alan Stern wrote:
> On Mon, Aug 30, 2021 at 05:11:53PM +0200, Oliver Neukum wrote:
>> On 30.08.21 16:46, Alan Stern wrote:
>>> Do you have alternative suggestions?  I don't think we want special=20
>>> interruptible versions of usb_control_msg() and usb_bulk_msg() just for=
=20
>>> use by usbfs.
>> Hi,
>>
>> why not just pass a flag?
> We could.  But you're ignoring the question I asked earlier in that=20
> email: Is a 5-second uninterruptible delay (the default USB control=20
> timeout) acceptable in general?
We cannot change the five seconds, so this boils down to whether
we can always handle signals when we need to send control messages.
The answer to that is negative.

Suspend/resume, block IO, probe, ioctl(). This list will be rather long.

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver


