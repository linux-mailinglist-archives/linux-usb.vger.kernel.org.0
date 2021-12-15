Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9160475AFB
	for <lists+linux-usb@lfdr.de>; Wed, 15 Dec 2021 15:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237689AbhLOOsA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Dec 2021 09:48:00 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:50968 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229878AbhLOOsA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Dec 2021 09:48:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1639579678;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N5kS2KPErqjxIg7KECnUuC9MVlwJRMYGylSNJGJfPLQ=;
        b=gKhjtSVbQmTRVPEcNWPxqV5CTIIH09r70o72q+uYOx0+kMoVEdHaIIwz8QUBEyxfbsl/Og
        cNfyO7NSPOjYqZU7+iLnyumo8O5vDdIUYC9wJXrncGy53ZFS1Oh+uLN0FF8QnLo6XkGMOe
        mbCeWrR40AXxA+h7Ca7/Xn2j2PcKn1A=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-HUPHsKpmO-i8Oyqf8bEUiA-1; Wed, 15 Dec 2021 15:47:57 +0100
X-MC-Unique: HUPHsKpmO-i8Oyqf8bEUiA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfBo7IJgbs1mDURKiHBeMgWhbHSAngIyGLJjbrdfx22f39zXs8f5c2YtJHisrx7iv/SOybN+9WUFhH89LSgPBgknOh8hDqC3kVl+o96Od3VxdIxzzi2dmLBpTmWf49Rl3Lh+TNde6fqzwdI/R2WK3d7GhdftDWtdkoVfDVR9d/LkjyuCxGWUwh11MjpEmPO9zl6g/v38sS/3+kWPVOJ/rEALqoyF+/Vftmdi/8Mz6gyXje9Ioh2tH1KFeNDBwFG/eyT6uMhBYWKVw99iMWe+Ky3cYl6sn+ar6hJmrUasIH3pqVmj9p1MesEiMCvg/7fs6mA8RovXjf43qpoRPVLYsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFrC9kkWF3U30471hbtenpKho0/sUkKb0TZ0036RtEQ=;
 b=bKKFc9CW3Uy8X6YiSEBa3WYVeewQlRuU7zJFaIsTvaxNRaQmzFgXINZeuHGeJUQRYOgR+I0Bvq+qy6gM4MFsX0rpocaU+3gjudPuv+2T0jWpBe4IM6hZ/iqE9cuC2Pr70uZlcR3gDA15sir6wE5m/ymR+zSmjs4Awc1uj+b6XHZfe9GJs2dmLqFbvmA4cLLZ+JoaP7MXdHQE4UjTzYp9SJJph4u7YXBE0tZsw+E/kPQnRpHfLP7bf6F5dWXDOURYt14fLEz15fYQ+04gvbVKD/2L58wjLm9KCLEt4QC9cBbWOO8kod+JmNOiF5RnVb9msGLUEJKsj49m3bj70bp7Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DBBPR04MB7993.eurprd04.prod.outlook.com (2603:10a6:10:1eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 14:47:57 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1%7]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 14:47:57 +0000
Subject: Re: [RFC]How else could a malicious device sabotage endpoints for
 usbnet
To:     Greg KH <greg@kroah.com>, Oliver Neukum <oneukum@suse.com>
CC:     linux-usb@vger.kernel.org
References: <ad1ee829-401a-d051-1da8-f9e01caa7b85@suse.com>
 <YbIlBl8Ay1rIED8p@kroah.com>
From:   Oliver Neukum <oneukum@suse.com>
Message-ID: <71bfdff1-61d0-881e-a201-e91920750648@suse.com>
Date:   Wed, 15 Dec 2021 15:47:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <YbIlBl8Ay1rIED8p@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-ClientProxiedBy: AM6PR08CA0010.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::22) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7b6f7fc-771a-4d52-06b3-08d9bfd9e1e2
X-MS-TrafficTypeDiagnostic: DBBPR04MB7993:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <DBBPR04MB7993A9ADE41F21998D1E0309C7769@DBBPR04MB7993.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lkVo5/0UqFG8FSQcCof8uoXndQeg+O7Tc0YmtdBgcmCj2P/QbhUDCKnImOU/+NHYTeXkqBG9wSAWn/P37/TxlPQ4uRsyaNmkWoMna8h7Jkxnx7m+i/uwoIiCrN0979s4L9u6HesK7EIGzbKvVVPy1IdrEDs6l40phy2J3IZkPaLEfkEfC16GRnMebheraDtYv1AFIP0Azmj6cGjTgcq8UCp69AmC9nH0sKKkGhRHVvxZ9Cj95Xi/nbyeKBXukLZF5AiXls8e8b3eEUaQEcWmET7MjJZdMi9+CcJr+AO94uaZrKotVhktujdzdFIzWuvXhfJmQbH+mtw6L+acLPOn3exNI6TgHhDztkldP2scegRACaFm3fwYVV2VEA0R2CJRXyd7KHlaUq4sKY2LlLAlSsfu6Zuxag0sQBv4QL0lOQItW/RYVMF+sEQ0DhxTeWbMFhb17G3TYHEx8UeHRDLOF2XIvps3SFClBEXAjvHJYR51SqPIF49IBtmfcve7KK1RweX0qzx9sWxa7qEA6lhLkZ6duMLS4fMc6TkvsNKEqQOHxK2/MI2GjlHb/Gq4LoKsV6IyBjTnc2zL/xvFHamZfz70A4aTi5s47D802C3n9ARG5Tqs0GB26qJih541fI1PJP7E4cmbkK45vD19Bcxr89AvCVQKH/ZOOcspp7J+Uf8OTFUuozpmWJiQXt8FDt0PCRNiRqzJbQR+O/Edv+y5KE/iFYJF4BhFP3sq7zgM/4E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(4326008)(316002)(2906002)(5660300002)(31686004)(508600001)(31696002)(8676002)(8936002)(36756003)(186003)(83380400001)(6512007)(6486002)(86362001)(558084003)(66946007)(2616005)(110136005)(6506007)(53546011)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GMwwRpCUpJVRwXYz7Nw1Qu3ktFQfhXHjxNuovYn/64cB/h7TipjQVgfHYelE?=
 =?us-ascii?Q?kxhLynukzwl4N+TSz/iymLINEalfDWVvuYDz6YtCCUfYmndAhgZGkbTJxJZQ?=
 =?us-ascii?Q?ISLkf+BQ0uQmT5z0xJCBcbCyXDVjU9TFBri1Ape9UggJkuFWbpY8NObLxo7N?=
 =?us-ascii?Q?OIngvjC6hLHU8xzvsoKCVveC2A2CWjRNnRhOi2av2FOaO1d8Oi0vsnxrEdQD?=
 =?us-ascii?Q?5oszgm081icgEuG795YcDbyXqEw7pYPHzY0eHsML4BC8dt3HffXykOX7jS7v?=
 =?us-ascii?Q?s3Vlebu4DHzCJkUNNR0CgBYqdY9FLqBZpGTQy03WFfyDw2jfYxU1N3CY1nA/?=
 =?us-ascii?Q?V1r8XhHGSJZjZfQNnuRI1TlbVvBcWQXSl8ZNcWFf/7URxntCKNk0VjzdPQ06?=
 =?us-ascii?Q?gW464+SzyufxJ90KbCg4ve7QIqiFgIL/FJYimSpidPA2fiStm9XRb8NIJsqS?=
 =?us-ascii?Q?xiurI6rN5yXEbX6sj2IXM6Z7e6vQLwgX4jTLJzEbT4bIy0k1rCcX6uqPKsHb?=
 =?us-ascii?Q?31xD4KBKs6wjqmQiVnZHxIVk58h9XHfaJk7MReyYdF4uLc/ORaHEq0NFThdA?=
 =?us-ascii?Q?tyueC+xjNo8ff6Vhj2Tk4UgLRNIdvhX0/fi4QysgbIZWzFJuOAJKsA2iXsiF?=
 =?us-ascii?Q?3CVjGkA8azOMgHxFAzb+lleKBsptiqPmeNkK0iZ8j7QdWPqglieVM0HJZiZY?=
 =?us-ascii?Q?wAmCfTzYK44PKTJ9M/VRNde24rOUsHuJGSLyF77RpTnS18xalIP3Sb5quuY9?=
 =?us-ascii?Q?Yf0jG8Vp5muRSPtLiaUeOBjRRXSeUlrnZATcpUjpTXEJkD42guYWCgyUpQvl?=
 =?us-ascii?Q?762vEQeCro0mENrA8H8Pe4VhP2ZhzXhAcGAaY56x4J5pIpFONeURrcq31dRx?=
 =?us-ascii?Q?dikDtNdhS+7zlBKaOWocG6qc367dcPvS7iS2CJTgsUypUvjG/FsVljtJVz58?=
 =?us-ascii?Q?W4SsvNeI9To0XRDE1GdZDWg/UqLTmdEwn4nvKN8oF1iBDsqshm6sy9HjnX3t?=
 =?us-ascii?Q?ZIOb8P2NBI6sqeXGLxn9T8ymbuFbCqQ5fN2YO49QLw/TQqlPPWXShbr847nh?=
 =?us-ascii?Q?0iMtLgZDtkyk6P68/2pHpVZVtS4MSuW4ZZQLL5Jw8MjT9T+jvEXOqSAH9jV0?=
 =?us-ascii?Q?zI/F2d2Fc1+ypbYA4NXX2Di6T0B6LPLgAIY8Wqipt/j9aZvJb6Z3UwvPSZfd?=
 =?us-ascii?Q?phnHgZcy7uw6GXP6G9Amns55/f0hbEljIR428BwUbc0Q2lCISJAaRRlxn84J?=
 =?us-ascii?Q?8l7oJQDeFr+Zb7yW8epkfCkWYDZrast6jBqJFTmJQokZyaq/nzRD7iizBHPL?=
 =?us-ascii?Q?roaSYKTQWqxBOhw/9lVqK4zjhU3aprFijw/I8XvP6JWhY9oLFzRv22tsusJE?=
 =?us-ascii?Q?cEcUN9GfQF8NKEbY3+kcNlqcTL0A5NjD1sGgLtrqAbetgLnLzkCndOR5RT7Q?=
 =?us-ascii?Q?iP/lqMaxXUAtL6EMdxRjcKQZYeEqoINKGm7RMXVUc6Kq3K7UAALE8sW4LcSu?=
 =?us-ascii?Q?IKnliCn9St4mFegyh+Nd/UllKZcLnHDWjW5KtKUDKDi1DUcWP7+2MfUsaPIP?=
 =?us-ascii?Q?TUnydLVPMyh8IbHEVnZKdz87vcTGcs9cyftjJS76eSne8UeoZ7BZ+obP+Q/e?=
 =?us-ascii?Q?nfOWrUsW3ykClK1MgoKfIUa3GKSl2FWR6evjf9qsGeOFiBS+AqFoT2v1W2jx?=
 =?us-ascii?Q?snu6XNd8QDihxHSjGhHf2AwOJDE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b6f7fc-771a-4d52-06b3-08d9bfd9e1e2
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 14:47:57.0209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8x9kTAvNYnkY2QL7ZtCOshK5E4vUyckWFPyzRkXXvUrUKBJaLs3T3qq6h3TPcKj/PiWdM7HJnxA+I0D6ADi3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7993
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 09.12.21 16:47, Greg KH wrote:
>
> Why not use usb_find_common_endpoints() and/or the other helper
> functions instead? that's what they were created for.

Hi,

which one would I use? In this case I already know the endpoints
to be verified.

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

