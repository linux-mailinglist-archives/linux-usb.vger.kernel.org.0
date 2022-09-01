Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D23EB5AA003
	for <lists+linux-usb@lfdr.de>; Thu,  1 Sep 2022 21:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233151AbiIATdJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 1 Sep 2022 15:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232065AbiIATdI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Sep 2022 15:33:08 -0400
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.111.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B6D7C503
        for <linux-usb@vger.kernel.org>; Thu,  1 Sep 2022 12:33:06 -0700 (PDT)
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com
 (mail-zr0che01lp2107.outbound.protection.outlook.com [104.47.22.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-mWwtzTOPMjGrERRAo0Yi1Q-1; Thu, 01 Sep 2022 21:33:04 +0200
X-MC-Unique: mWwtzTOPMjGrERRAo0Yi1Q-1
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZRAP278MB0802.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:49::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Thu, 1 Sep 2022 19:33:03 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6c6d:333:ab23:3f5b]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6c6d:333:ab23:3f5b%2]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 19:33:03 +0000
Date:   Thu, 1 Sep 2022 21:33:02 +0200
From:   Francesco Dolcini <francesco.dolcini@toradex.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Felipe Balbi <balbi@kernel.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: gadget: Fix obscure lockdep violation for udc_mutex
Message-ID: <20220901193302.GA2275408@francesco-nb.int.toradex.com>
References: <YwkfhdxA/I2nOcK7@rowland.harvard.edu>
In-Reply-To: <YwkfhdxA/I2nOcK7@rowland.harvard.edu>
X-ClientProxiedBy: MR2P264CA0058.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::22) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd274a4d-7f14-4dda-af40-08da8c50c99e
X-MS-TrafficTypeDiagnostic: ZRAP278MB0802:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: jTz7yH3hnhtox8Wp4U19RLhJQCfRG5ykXtEgCj71le/b151h1Wy6fyP5slzOgBC5LGBeogbr09v6liPMgV64DEsTCTvbeBULoPIDAGG5kUjXxv02g1rLbuSmAbrBuAGmQ8DTuUl6vl+4oEyTYT3QEQI7TigUreZqptPBA+rMjiwQqOje8SwZ7Ab22py3BHoYdXw71JlQOiEI1V+n0bdA3hXNzDtWMCl3AeaKowF4m+4ipSCtuII4wahanAn6oxdiwqP8r40zR2UNEoC+7AywwBmgT0nL1Qyra2PDhSTN9db/GdZifPajfMREPLqJ4xIMFBZk32931UpzVDplolOzoMUo1p5alPExBoy1iaTB6daVKkmolAMNExwAVKqZ7mALXpBXIl2Nl1hYTukq5d+LdK1eSCZM2hkLOURGWp0NuSAjVzt4LNvv/N4eA+l5Sa0dgKMTct1O/Uc44CEVnXa2LGQL6u1o1KXUdE7wNpABGlV2upYokjSfQtyEzbbNb19ey56hGWNT8QNYYh6DoTYr7dkWN72IoL++H1E9V2/lDja8xd3Oba7/hVe3S4LHazXugB5gb+NoC0X0wl6Gn0k2BvyQIya6zL/OcONYotCwdSKuBYII2tvA96uYA5+Ub7ZvKvMXB7HxLuz85q0SJHQiI/JJL9mP/XJlMO5nuN0Jyjl8zGvLoYJm8WSNFD2PrPL1ae87DNaZAKSbqB/yzNzaVTn9ql9BQTHV9+cYi9/lCHMZXX75LUfqX4Z8Ne2ADjpNVeY8QX/D4sSd+lG0bl/2jIPzJD3SNuzrJ91ncVfj284=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(39850400004)(366004)(396003)(6512007)(52116002)(26005)(186003)(1076003)(38100700002)(83380400001)(38350700002)(33656002)(5660300002)(8936002)(8676002)(4326008)(66556008)(66946007)(2906002)(66476007)(4744005)(478600001)(6486002)(966005)(41300700001)(86362001)(54906003)(6916009)(6506007)(44832011)(316002);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4CVbpp6zK4HA+QCCOF8E18FjFddw/TMx7p8+FOg7TFjucQyVb6AnG83WD4wZ?=
 =?us-ascii?Q?ZsIuf6WIMuwuG7C7BCkNfOpl0G/lSLMPVDAwcamh8ZMG9Y+YD+kXU4kzzoup?=
 =?us-ascii?Q?sE1sm8tk3nEOvP7Ezczusf7Q/XSOjcCWoUbxAZ6xudeKblXltqJcTAAwXA1c?=
 =?us-ascii?Q?lP6UKXWYedE11zYA5833h0+KN/jF0y9xvmwcgx/Wy4hlZOlzlmeHowMpkGhm?=
 =?us-ascii?Q?0P9HHfZl9LYX/vAv2Fp3hN104r+nptWhNY1hL4Y19gj5dpDMkfx1VVlEqIU+?=
 =?us-ascii?Q?6GnwR4qNgfNUnCLA+/0IEHYjWXfghKAIsy0Tem0XUB019qOVoPkRB4QYVwl+?=
 =?us-ascii?Q?WOy2hpLTXUZ1PAFFbhdO1P7BBxtIsZj9QO67g6Y3nQg5KJIVWHgN6/sqFenc?=
 =?us-ascii?Q?XFoRJy7AqtQ1cpXIN0sXOQAZ+vF8pX3jUztlwkslMLR45+c1PdN6bmcj+Pgt?=
 =?us-ascii?Q?pMSqBJQfqAWGjuwzKLo164QN57vwAGPRRybozzQo59UQz77oU3DoZLY3wM1e?=
 =?us-ascii?Q?gB6kRcpuMiBao0UXWOMB2ZegkqsMyc8a7jTaEheEqgJiYomh4F8OUEn38UFE?=
 =?us-ascii?Q?Cau0cbkBNtZitOhNKMuf2sUvWIetfXzdsos4vL5eScq/cseriYlG1EmIfqqh?=
 =?us-ascii?Q?VH8WbDtF5rCO5HQ/o9dnO8WTN/qH36U4VLam+IYz0wNS9MTbtGNpnlZD0g4j?=
 =?us-ascii?Q?ROVZUgMDYAUlvhrKYrMk6y1W0EFvm+jIE2rzch/v2Mdo1TvLwxjkuQmww4za?=
 =?us-ascii?Q?/O41veGwno0+HwQ18E4PF6wRgVhahyOc0VktYtf2q3ANtKLait9lArtnApCf?=
 =?us-ascii?Q?eAwTw4nfsg3qR75F1kGaP3I4uAifyIGAMjDq4m/VGpOGI4F68JlCKyHuK5a7?=
 =?us-ascii?Q?7fwrBDsoGNgqzHaK0DIzlHGkaScrmiwdtzd+T1nDTuoE8QHPNMU1VX5kv8m6?=
 =?us-ascii?Q?RmoqjnMdIXeF+SwcSQvVx+I8KVQ1R85w3oqBvqzpfFBCLsJ7rB3qyoeEX4dq?=
 =?us-ascii?Q?I3Li+ZGgiAdfrLxlc490N4sHYpVXgfe3ouYT1jrF+/xCPvbaHGz1TqaoHb8s?=
 =?us-ascii?Q?I2bd3LLCLXjWXfFYzMWF9Ucm+hiWxwKRrzmrcc18zpiGTDUdTbK6NQq8HNRP?=
 =?us-ascii?Q?Ij/fg24b32McXFW/4TcZQb/0My2WjgW/RZX+Mp+BABUt5lviTo6Hzma8lp3L?=
 =?us-ascii?Q?4Z1YzFFlfvJ+wSCulEcl+CRBCJuE37FXDJ8EhRcsL+52eIMGORfeEXFaJDIu?=
 =?us-ascii?Q?u3G8fiQ8OsnZ6ggPM4ROP2fqu/GrNmTXenOmLWqb3k0Mpdr95ZLmg0GvEu9t?=
 =?us-ascii?Q?YB/sIANTzuLpR6/ZAGvDelUTb+1VyrURubuNyph7+sRbpZXT4xMbpxhdaX3V?=
 =?us-ascii?Q?tK+qsoI2Oi+kETQ2g4G7WAWABTqW4ZCOoWUpJYFpZooBpjumTlfa8f+Q/cA5?=
 =?us-ascii?Q?oFJyzvB7TMKNgkAVXmdailZmRYHxklYDtiat9V3WU/yTaagy+bg2BbB65Jgu?=
 =?us-ascii?Q?5MgMz9/gOsRVcRn69O+pPkYrY589oXrD6gMkTI5UKiRNT1GsxHIt/Nn8gWHh?=
 =?us-ascii?Q?0eHwxKqEH0LVN+ISBUkyqQKXPmC/Ff/+X0htAC/ttUerTRhzUl9vxXi04hKQ?=
 =?us-ascii?Q?Wg=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd274a4d-7f14-4dda-af40-08da8c50c99e
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 19:33:03.5175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09Sh3lSpYKnS9jhrCOlKNRZip/kZ9ccZMKNauRdCW1PukMPoBxA+2tJ/vinPHh1sCe5Rh8GFjUr9j9MP+LUjXoT1vWujpmQ4DxN+kJBeS/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0802
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 26, 2022 at 03:31:17PM -0400, Alan Stern wrote:
> A recent commit expanding the scope of the udc_lock mutex in the
> gadget core managed to cause an obscure and slightly bizarre lockdep
> violation.  In abbreviated form:
> 
...

> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: stable@vger.kernel.org
> Fixes: 2191c00855b0 ("USB: gadget: Fix use-after-free Read in usb_udc_uevent()")
> Link: https://lore.kernel.org/all/b2ba4245-9917-e399-94c8-03a383e7070e@samsung.com/

Tested-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Francesco

