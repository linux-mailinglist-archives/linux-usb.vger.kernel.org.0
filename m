Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E2146D1C7
	for <lists+linux-usb@lfdr.de>; Wed,  8 Dec 2021 12:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232211AbhLHLRI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Dec 2021 06:17:08 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:39312 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230311AbhLHLRH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Dec 2021 06:17:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1638962014;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g0nNwrk9+CnD14yD1+gHbl/tWSRhsJJJUC4jNP05mHs=;
        b=VJAywUDH/CRTwAog1PWMoH8mM6C2ujqwE2LFYT3qCjEfvt/Ge/bCOmoZoqcf5P3T3KCvFW
        enV+mb/SyJ83B4p1K80zfC0yE9RoLXyy+CGwZ2LAxEXZt4rHVmW+GvNuMKKouDzZ+UCcLh
        Xd2W/kQt5/qBD2BDsgyw0/UowhrR1lQ=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-j4ToE9ZCPgmIt_b2k798FA-1; Wed, 08 Dec 2021 12:13:33 +0100
X-MC-Unique: j4ToE9ZCPgmIt_b2k798FA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7i1gjW8otlS45Ndd5vqtnk9hmh0KM01aaOsb2kaD0MRUyqZTVHbSkK2RouulBjB/Poo7cpLlYaqkqDoa0o0TpxzGwVX4tg1ylWZu9MTSFhrSgavWPZW+6biiA490cMZvg+bRhIfAJogzpuqTLdsgGyLa90zM7gFcOVlsL8b7YvfthFZ6yO5Ao7M7eQ7ciUiVlC2BJ7fgjkDQFpeVDYVK/NOnXdjJuoKzQWdzEmBJo/L4LuWFe4JaTlfY5QsCpl68FpDN0CxZR1DmM8OhsPoZEjUm34uKaidbDu7vYbuxFtWcyr9NLO9EhEmaImRh1OCerw3+brwevqcqzx7+qyJZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e25rnSpEp2Yii01hmPdkxEtyMjM3eHdawqiyU00T608=;
 b=Gs/h3lB+JWpX8oLrM0OIy64OqRtghMqyz98YEkcyivgjmVBKVo3qjjsVYzG5rKfuEUdw+6ekcLGj91uKT+LhjSAthozTxC9xrKUKHhpyyL8y41NuBEkrZhJYmMaPIaz8cq2bXVeR3DMwVBr0zSXSTQctljWEHHcCJcT3WinER0jGi6TNCmuI/PKOViKTv07AOXwVm20ZoKp0OpqTCFigd0dBr1FKq7V+qmbkhIflriQjocBYnWa9ODJ+D6dQU1uh+iEbtFhpL3wHWJMFRfb8dlg5VD9x1ole2ZQMh7gkVOnkAAdti2HBNqaW+6UZM58tB1Ur1heyVSN2OwDF/oBApA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DB7PR04MB4844.eurprd04.prod.outlook.com (2603:10a6:10:16::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 8 Dec
 2021 11:13:32 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1%7]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 11:13:32 +0000
Subject: Re: proposal to delete the skeleton driver
To:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        Oliver Neukum <oneukum@suse.com>
CC:     linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        Philipp Hortmann <philipp.g.hortmann@gmail.com>
References: <df5bb0a6-e5f5-e062-5c02-e1de612058e2@suse.com>
 <Ya/jrm59Ai226JtE@mit.edu>
From:   Oliver Neukum <oneukum@suse.com>
Message-ID: <9b33445d-7bf9-684a-bf53-f472bb928b96@suse.com>
Date:   Wed, 8 Dec 2021 12:13:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <Ya/jrm59Ai226JtE@mit.edu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-ClientProxiedBy: AM6PR08CA0012.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::24) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
Received: from localhost.localdomain (2001:a61:3b82:1901:9d6b:5ffd:1b6b:2163) by AM6PR08CA0012.eurprd08.prod.outlook.com (2603:10a6:20b:b2::24) with Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport; Wed, 8 Dec 2021 11:13:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5556494a-b549-4f15-6aca-08d9ba3bc547
X-MS-TrafficTypeDiagnostic: DB7PR04MB4844:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <DB7PR04MB4844F15937FB9994B22A98E4C76F9@DB7PR04MB4844.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f21iZuY5DSQH44dHxUVJ35z6QswGqvjrr2/Aw6MLXNL9qrhkMhK2+yv5j7Ec0uTwEPPDH4U1TcuW+1v8y9BO69F8OqUxHOUYh74/1+flufeMvYa8XWlpXe8n7keGD7BYGddmJmrKhdg3U3PRtdGa21S9kFHWVmyB5Kv+4/Pxpe8CrXmEOA82yQY/rASRZB5WWm9A31nO1/cdtMmWJSAh9LTvOJH4RBklgSb0PuaVqdlk56xQL6gQiQpjSH+4dH++C23TstfBQNl0Cf8OQ6Jof59nkwRD51Lbm280yIkbosycbZu0o/ImsQ5YDCTvz+/N/tq7+MrwKs3h4U0N6Ke/ZxYDj93Qe5RPmmkj5X68COINAdh/sNSfaCJ7XhtQmCX2czmwvY2rv6VW6nqq/TduYYnaxpkyXX4AALp3SFfBgdax5zOrvzQYyPB6bmhm9OwpQfeajff9t7rVsL70OlQ1QHcltJpUicF1F9Hm/9CTS5+JLrjAEapd018EEg1aDeGfmleBZgiZPWUXXAdnqmS+4zD444L9tQ7h9lv3bzLbrw9u1NhQ9PEJEzFMIKkbEbDsjr2l9rr0w7St8IbCnlmlveGTeHk4wAbgivPVOLjRlz16RZQaholWAiJOVZLcPeWioIJUC7qxsyvCEj4DWOE1jwD61uHqH41SfaYmXCEB3H8MV+fIE0vqkGm47U+WnYsblyO7pHyBiwlfqPQebfLkDL61HdG+ak36pyyMW5ODw/w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(31686004)(6486002)(5660300002)(4326008)(36756003)(66556008)(66946007)(66476007)(110136005)(31696002)(38100700002)(316002)(83380400001)(8936002)(508600001)(6512007)(86362001)(186003)(6506007)(8676002)(2906002)(4744005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UcNqPFsKMSJGWvtcEpzP+JymJA6gqCftosogBqh986/slhTPsVZHPLhEXDYe?=
 =?us-ascii?Q?c4w+NwM/2O9CksJFY2TrFLWjLn+BUB1Z8nhHU0LShG9MMPmkhU4uG1RWDOUt?=
 =?us-ascii?Q?n54CXFxNqOeL6qg7KP+auUkpxToGLPkLS562ZLB9PmMDjLo9leh2v8uFljYX?=
 =?us-ascii?Q?9/x8lrOKNcHvgKa9wcnKXlZmZiY1LWY3v0datZ9+J/7OHo2jBqZ0wPp7ASGU?=
 =?us-ascii?Q?k6ZuvMmZFKrJ909Kxy0fyMHYGXOqgFOninX5l9/THCC2umvUvVilSh1QNQA9?=
 =?us-ascii?Q?NQinbBIsbsKOAmIphuopukIPmKtT2dISkblpte2WDQCtLf53Dm9mdy7ZtAJ+?=
 =?us-ascii?Q?Xj2dSqVzbKQUEyoRl6x9WTLO9x2a6K/s0IFipAfxnnK/cdMKodXcl1XhPhTQ?=
 =?us-ascii?Q?RqP5iqUtvPSDSpdV8eUwwPGuL76LPdXHSeLufk/WRkgWqDvlk7dEVvaf4LVy?=
 =?us-ascii?Q?GHW0qWpeUasAuRfcES4sgzB5KqZyQRpxfomvz5SfPRBzvBAM/82xdcfx59eq?=
 =?us-ascii?Q?mMn393UVud0q4GK0W9iF6XxFzuI5GtEKLxcCysGbUahIzoqBPejlzpSF8OO5?=
 =?us-ascii?Q?idyAvbfZoiP/xzoZGln5QR6V7+XopXqawAJdU/n0/hS2iISB3OQYYcUtkkJO?=
 =?us-ascii?Q?a2m9uv+JRmFfTpwbucIO9WX1gYQxJ8RcmTLLkopVNE2pEYWNQsAW2i7P0C3p?=
 =?us-ascii?Q?+0SJ0oQ/xBdGLBoMlaffDnkjl+bH6mb19OW1Hl6UY8iFs3oT5bMWjxgV1vlT?=
 =?us-ascii?Q?gpkw4RjUV+LKjdt90WnRVIZ+c49yY7NaVvWmxYtCZDr7K5Jyz7XfHt9xWwNI?=
 =?us-ascii?Q?H5eMEjJaXQ0mZddsRGbWvDRODvEnX2ObJfADkz53cxWdfsqFgO6k2K6AzP8D?=
 =?us-ascii?Q?DSqPshAL5CZ294DB202zklXQV7Uxu3JRv1bRrdVQsavpyDwd7zF4fdRKw4f9?=
 =?us-ascii?Q?Aj45R+KQ3/ESAvE0BPbJ8UZSab2UR2/8VRqrUMWzNEZdC7LrUxw8cF7pRxM7?=
 =?us-ascii?Q?VYq1Xmq/4HZzGKi0VvCIkt+AHgpfomB/u3Cya5lrMgu4Oe+Yf0HfbWI9xse9?=
 =?us-ascii?Q?IF2XWf5kCSW8G6vgdhlDW4M/BXcd9xs3ltsDINo7aDwzDbAsPOKMrha4E848?=
 =?us-ascii?Q?lhsrBgwWtV93GJDradBjNguxeD7WsPTsAFOSlgTil72xv5Nw95rLYFeetuTI?=
 =?us-ascii?Q?yI/9yBX1zKFPnlYHVZMZsFN45VuuCRjaBaZnAoJe5zoenlx8FYVuIS9uiO7d?=
 =?us-ascii?Q?AEoXjvCcGbSCrV7Y1EByQZsJxWBBkQQhI5+S5g8xy1/zLhNt+dopmtvzBOax?=
 =?us-ascii?Q?i/uZ1WbNPovQdfWbAD684jdc9Bsl/9O7Yj5l3ZcFbrvOzJiQRgy4p8R3Xn8R?=
 =?us-ascii?Q?QsMZi7OUY9HPCtycNT5wpY4wgf4giUMAuIuqtgLkYx1xKP40BFoDM/7lBdxm?=
 =?us-ascii?Q?K9RrClCe7rLM0Eq8U8HREA05N3QfRVznPWpFEEzZ6Mj+oChpC+PM1tClL/jr?=
 =?us-ascii?Q?Y2qIvdXgcMjUKGfK23W8J8O2MKPiql+mYSH/ktY0s8S23bcueEckINTyUENY?=
 =?us-ascii?Q?eXRbR6RkArIDuzZiAUOOvoJw/sK8gZHU3SEbnaqxeiEQZFh5QGjKdOa6jxm3?=
 =?us-ascii?Q?IxR+o24bKwxnmiasYO0IHRosLwHSDZm2Rf6jj5/ZfI6FN3jOTNXkVG5buWrw?=
 =?us-ascii?Q?hmmS8BCblFJx2Z8YNPjUZqnGeFw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5556494a-b549-4f15-6aca-08d9ba3bc547
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 11:13:32.7543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BC5FHIM8at1RKrjTVmkLA/zryuwwRewb4kE2k3Eshh1Z+WNT/8m5tNXLNIJzEKa4GpIxOqVDjKOUqvnBg2ztKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4844
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 07.12.21 23:43, Theodore Y. Ts'o wrote:
> In addition to your idea, I wonder if we could point people at some
> simple "real world" drivers that people could look at which are (a)
> simple, and (b) relatively clean and free of anti-patterns that we
> don't want driver authors to copy pasta into their drivers.
I will try to. It may come as a surprise but if we want to limit
ourselves to drivers implementing a classical character device,
the number of recent examples dwindles rapidly.

And I think we should stick to such devices to give examples
comprehensible and relevant to as many people as possible.

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver


