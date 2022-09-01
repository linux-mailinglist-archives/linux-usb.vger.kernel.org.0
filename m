Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5813D5A9FCE
	for <lists+linux-usb@lfdr.de>; Thu,  1 Sep 2022 21:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233291AbiIATWN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 1 Sep 2022 15:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbiIATWM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Sep 2022 15:22:12 -0400
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.111.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 420CA79A43
        for <linux-usb@vger.kernel.org>; Thu,  1 Sep 2022 12:22:09 -0700 (PDT)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01lp2043.outbound.protection.outlook.com [104.47.22.43]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-58xyb3z3OoaPTqMJ7A70QA-1; Thu, 01 Sep 2022 21:22:07 +0200
X-MC-Unique: 58xyb3z3OoaPTqMJ7A70QA-1
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZR0P278MB0075.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:17::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Thu, 1 Sep 2022 19:22:05 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6c6d:333:ab23:3f5b]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6c6d:333:ab23:3f5b%2]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 19:22:05 +0000
Date:   Thu, 1 Sep 2022 21:22:04 +0200
From:   Francesco Dolcini <francesco.dolcini@toradex.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        USB mailing list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] USB: gadget: Fix use-after-free Read in usb_udc_uevent()
Message-ID: <20220901192204.GA2268599@francesco-nb.int.toradex.com>
References: <YtlbkmVGJyhO4kR6@rowland.harvard.edu>
 <000000000000acc0e905e4517fa0@google.com>
 <YtlrnhHyrHsSky9m@rowland.harvard.edu>
 <CGME20220808145736eucas1p234e56422bd7973d7f0676e74f03ba405@eucas1p2.samsung.com>
 <b2ba4245-9917-e399-94c8-03a383e7070e@samsung.com>
 <YvFxiXmPlJc9wLZT@rowland.harvard.edu>
 <YvQH7IMTIFO0OCnG@rowland.harvard.edu>
In-Reply-To: <YvQH7IMTIFO0OCnG@rowland.harvard.edu>
X-ClientProxiedBy: MR1P264CA0096.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::10) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc8c7d18-ff64-47ff-7321-08da8c4f4187
X-MS-TrafficTypeDiagnostic: ZR0P278MB0075:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: WUpm8uP1vnRhpj3oR2sx1gMujnsLiu+dtt2HTyR+X8Rx+Hy+5ysx+G+xS9JpH5fgK+1qUzb6uDLAST9fEC4mQGuF69uGg2nKHIICCLACQDskoieGbfstYoBhOY/BKyRCczx7CrSdwS6Rfy8Afy5eEPlG7w02z7fd8Cxrf0JZ2LcEeBmezw4gfQrNYUxXqM8fB6X+ds0FXeSN6E4JXERoREviR3m6sUtyyLzTe+GTNajLSBXjfxpaq+Oi3rXK7WAHXbJEUG7F1MUydfK9xNX37uT/l5oL1rLt5WLtWOLvlo9Q5nDJiKibj+GoqQ7bFfweeA6qpybOE+5bwU5O/wRhWGQHgG3LCq9RilGdbdppHCstp1jrATtbQvAq12eWKPXc4L3ENdAdKFdEhgr6hKtQsdsYSRNxa3kAnKLdg8pRdi8QRtAh1IagxFwnoKvbkWI5TmcvBIStlU9JEjlRGviwPhZ6ZU9yjHXR29imljxeFUbY4XkNitfL+cg3V1m+gIPT7x2O9Udg7GwjLw7qDZ/auzT9P6RRzeWmiTNqUJxA6uXekxOMxhqb1PD8mUF+r7HCYGui6/S7up1eoCTQPKLnzIwTKbIXhJ83som7Ak7wO9mxWLdNg1RyyCz30Z9xIc7wNh/7wQ0HtlfqAFxQouEdka7kvrxmjVFA4VC35GpY5U1+2ePqRettWkUQvU3+xFkJ/p8zTX8vdnp8I0cxoOrTl6yj+z4+TGHGxH+hmpj87vlRZILupwrSq0CVUTOVNa7NRqkt2QgnVpWIKwkb/lBONfxg4OvMtePjH0I2tJMRiVo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39840400004)(376002)(366004)(396003)(136003)(41300700001)(6506007)(2906002)(52116002)(38350700002)(8936002)(38100700002)(54906003)(316002)(6916009)(5660300002)(84970400001)(83380400001)(1076003)(6486002)(966005)(186003)(86362001)(33656002)(4326008)(6512007)(26005)(8676002)(44832011)(478600001)(66476007)(66556008)(66946007);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kjDFrpiW8mQI4SyHWHnkLkpWdY8Ixnlk5bpBA+X85RLClQ0XG67tZRxBl0i7?=
 =?us-ascii?Q?3HlTCBbW/b3n9V69/cmZarQ6K6/6c1Uihe56omX/mmFs9e29rVTptg91f6++?=
 =?us-ascii?Q?7d3ibg5b5T/9f2oGZm0eyVHi9BXFtTmBLYYf3wHzZrFh5BLPLtXZTrOkk5/a?=
 =?us-ascii?Q?Cq/eARWg5Ya7Bv+Q3/f7yB6k33xa+3eA5mYrE013FL3aFJy0LOn4iIqb4QoF?=
 =?us-ascii?Q?rRcW6qjlCFAePEYHPZvIBxjdGe1yL4QAMeiEPfyUF93FROdFK/F0Zhp8X8k+?=
 =?us-ascii?Q?MTHpgf0u89QjWQQLOdfy1U1Xs2KJIgvzvEgwKKTlAeRJs7nF3OzGsnP4gBkv?=
 =?us-ascii?Q?SEk3QrnxZWWLF7zUO7+KA5sBVXr4JbCrNG/FmYYt5Ls6viAqtn8d6kAITU2T?=
 =?us-ascii?Q?VbcLlyGl/+FzutLj+tQuOYD1aDCTG+lAHCjJ2EAhZLg/+ZguNTA8YvxtZsrh?=
 =?us-ascii?Q?OYgARQzRWveuVDpVKHbJK4tDc9BcW3AYsrRvOPq/bX8Rcv1bt71c8oj6+Z6v?=
 =?us-ascii?Q?ptd8hd1/t3kNpSgD0un1I9d2PnLrMzcOWH9Kq47cxZt7FsIYFxwdpuUb2ZXJ?=
 =?us-ascii?Q?/IMKO9S8y4MDrghD43jhkNT5/CatAdcwLM/jvw4nNs0hRBiB13//VPlEwnOF?=
 =?us-ascii?Q?hpnvzQf2xn5kaDul/cyHVhN/jdMoUn1s6E822h29rWs22ophinxZAT4CUzuT?=
 =?us-ascii?Q?UH3HzEy0WzyT9+keog/Z/7wZwJAlyBMoaxMoag8FyDdNGp9YmQ24rjLyn4yZ?=
 =?us-ascii?Q?ikVr5+VbN4kvpmNc1pCxRUoYSqEY0pQHgBhjsXgOw/ve4d8fXYurdUKNlkS7?=
 =?us-ascii?Q?8VcErowKIgutO2cf1486sIiFgIvDkPGe6lRd1eVZkfRAIOzvNs5fXBHs0F3m?=
 =?us-ascii?Q?efSEgU2cGD9GEfo0lwCVZtklAOmbZDefaetNQgD3yy+6Jl3d9f6eH5IN9yKl?=
 =?us-ascii?Q?TlqGM5OA7Ue6w0l2MRjkwzhV5M0Pa8StxBAm8Nsg5uT3tp4+iGGk9ThJgD46?=
 =?us-ascii?Q?AY1sXBT+j8auyO4y6zxa1iIBlhGdwR+MuDz58XUpy6FQI4nGRNvEGGVY3I9m?=
 =?us-ascii?Q?V9SxWi8FgiiUlbSloUMiG1zR3heKkxFn2/9jFNeMeAzAsm/0Upe5LNrtDjTq?=
 =?us-ascii?Q?wwhaXjCz2ocXFNmaNrOpMhPT8WwuDko9xHVRhXGICKQ4/1E75AHIQROrBn04?=
 =?us-ascii?Q?J2yVUA7qq9jjBJFK5a+/R7RpCY6CzgGxCdC8LG6l5ZncqUzT8s8/whpQLhcg?=
 =?us-ascii?Q?s4JRUlQD7yR+WKYR3V6vhMKVhQAmYYN5clpk0jF8O/P7exCD2KyV6IOL3UQv?=
 =?us-ascii?Q?W39NyCVqNEoM7wS7iQdXa8hDgZID4aXa+hoFXlX2kbHYLwEdTNLq1wa80DkU?=
 =?us-ascii?Q?Nn7BzhdgJzsUDM/DrruNC7dzSHrsyBIjgKj7SixczQibzOIqCMemhAwjqVaz?=
 =?us-ascii?Q?vVwsqWpkJl40o0TCdy87Sdfn1wWlPvja3RGQVSEs7dH5iIFF7sask+N8ncPF?=
 =?us-ascii?Q?J9lzqU01bl/r7KTQbeTk2z2yTFJCQHEoRHG2seGeJQY+OHILqNTJtgCn8WNl?=
 =?us-ascii?Q?6+2+RMP1bbMWx4BAXe5rcfCAmBZUGLAZTZVqHW3mMZEGyrSgQ2QgbC7434Md?=
 =?us-ascii?Q?jw=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc8c7d18-ff64-47ff-7321-08da8c4f4187
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 19:22:05.8403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4UWiiCop+h1YpdSR7mrhpkSS/uRaGD4ndTNxYf2tUynIZXmRzVeve+ukHvTCyiyz56cLrdMumuB3KMasMlVyRWVptTlYiiXf3tv35DqIHfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0075
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

On Wed, Aug 10, 2022 at 03:33:00PM -0400, Alan Stern wrote:
> On Mon, Aug 08, 2022 at 04:26:49PM -0400, Alan Stern wrote:
> > On Mon, Aug 08, 2022 at 04:57:35PM +0200, Marek Szyprowski wrote:
> > > Hi Alan,
> > 
> > Hi.
> > 
> > > This patch landed recently in linux-next as commit 2191c00855b0 ("USB: 
> > > gadget: Fix use-after-free Read in usb_udc_uevent()"). Unfortunately it 
> > > fixes the issue by introducing another one. It doesn't look very 
> > > probable, but it would be nice to fix it to make the lock dependency 
> > > checker happy.

Hi just bisected a different warning [1], triggered by the same patch and I
was about to send a revert while I noticed you already have a fix more
or less ready, it would be great if you could send it. Please find my
tested-by afterward.

[1] https://lore.kernel.org/all/20220901122129.GA493609@francesco-nb.int.toradex.com/

[   25.942837] ======================================================
[   25.942845] WARNING: possible circular locking dependency detected
[   25.942854] 6.0.0-rc3-0.0.0-devel+git.b90cb1053190 #1 Not tainted
[   25.942866] ------------------------------------------------------
[   25.942873] connmand/667 is trying to acquire lock:
[   25.942887] c2b03348 (kn->active#9){++++}-{0:0}, at: kernfs_remove_by_name_ns+0x50/0xa0
[   25.942948] 
               but task is already holding lock:
[   25.942956] c17af6a0 (rtnl_mutex){+.+.}-{3:3}, at: devinet_ioctl+0xb8/0x8e0
[   25.942996] 
               which lock already depends on the new lock.
[   25.943003] 
               the existing dependency chain (in reverse order) is:
[   25.943010] 
               -> #2 (rtnl_mutex){+.+.}-{3:3}:
[   25.943039]        mutex_lock_killable_nested+0x1c/0x28
[   25.943058]        register_netdev+0xc/0x34
[   25.943072]        gether_register_netdev+0x38/0xb0
[   25.943087]        rndis_bind+0x230/0x3a0
[   25.943102]        usb_add_function+0x7c/0x1d4
[   25.943119]        configfs_composite_bind+0x1c0/0x360
[   25.943133]        gadget_bind_driver+0x9c/0x208
[   25.943148]        really_probe+0xd8/0x410
[   25.943165]        __driver_probe_device+0x94/0x204
[   25.943180]        driver_probe_device+0x2c/0xc4
[   25.943195]        __driver_attach+0xe0/0x1f0
[   25.943209]        bus_for_each_dev+0x70/0xb0
[   25.943224]        bus_add_driver+0x164/0x218
[   25.943238]        driver_register+0x88/0x11c
[   25.943253]        usb_gadget_register_driver_owner+0x40/0xd4
[   25.943267]        gadget_dev_desc_UDC_store+0xd4/0x110
[   25.943281]        configfs_write_iter+0xac/0x118
[   25.943295]        vfs_write+0x2c4/0x46c
[   25.943312]        ksys_write+0x5c/0xd4
[   25.943326]        ret_fast_syscall+0x0/0x1c
[   25.943340]        0xbe9deb88
[   25.943352] 
               -> #1 (udc_lock){+.+.}-{3:3}:
[   25.943381]        mutex_lock_nested+0x1c/0x24
[   25.943396]        usb_udc_uevent+0x34/0xb0
[   25.943409]        dev_uevent+0xfc/0x2cc
[   25.943423]        uevent_show+0x90/0x10c
[   25.943436]        dev_attr_show+0x18/0x48
[   25.943453]        sysfs_kf_seq_show+0x88/0x118
[   25.943465]        seq_read_iter+0x1a4/0x4d4
[   25.943479]        vfs_read+0x1bc/0x288
[   25.943493]        ksys_read+0x5c/0xd4
[   25.943508]        ret_fast_syscall+0x0/0x1c
[   25.943520]        0xbeb5d840
[   25.943530] 
               -> #0 (kn->active#9){++++}-{0:0}:
[   25.943564]        lock_acquire+0xf4/0x364
[   25.943581]        __kernfs_remove+0x330/0x410
[   25.943595]        kernfs_remove_by_name_ns+0x50/0xa0
[   25.943611]        device_del+0x158/0x3dc
[   25.943623]        device_unregister+0x20/0x64
[   25.943636]        wakeup_source_unregister.part.0+0x20/0x54
[   25.943655]        device_set_wakeup_enable+0x54/0x64
[   25.943668]        fec_enet_open+0x2ec/0x394
[   25.943684]        __dev_open+0xe0/0x1a0
[   25.943696]        __dev_change_flags+0x180/0x214
[   25.943708]        dev_change_flags+0x14/0x44
[   25.943720]        devinet_ioctl+0x878/0x8e0
[   25.943733]        inet_ioctl+0x180/0x238
[   25.943746]        sock_ioctl+0x4a0/0x5b4
[   25.943760]        sys_ioctl+0x530/0xdbc
[   25.943775]        ret_fast_syscall+0x0/0x1c
[   25.943787]        0xbe91d960
[   25.943797] 
               other info that might help us debug this:
[   25.943804] Chain exists of:
                 kn->active#9 --> udc_lock --> rtnl_mutex
[   25.943844]  Possible unsafe locking scenario:
[   25.943851]        CPU0                    CPU1
[   25.943857]        ----                    ----
[   25.943863]   lock(rtnl_mutex);
[   25.943879]                                lock(udc_lock);
[   25.943894]                                lock(rtnl_mutex);
[   25.943910]   lock(kn->active#9);
[   25.943930] 
                *** DEADLOCK ***
[   25.943937] 1 lock held by connmand/667:
[   25.943947]  #0: c17af6a0 (rtnl_mutex){+.+.}-{3:3}, at: devinet_ioctl+0xb8/0x8e0
[   25.943989] 
               stack backtrace:
[   25.943997] CPU: 1 PID: 667 Comm: connmand Not tainted 6.0.0-rc3-0.0.0-devel+git.b90cb1053190 #1
[   25.944012] Hardware name: Freescale i.MX7 Dual (Device Tree)
[   25.944025]  unwind_backtrace from show_stack+0x10/0x14
[   25.944049]  show_stack from dump_stack_lvl+0x58/0x70
[   25.944071]  dump_stack_lvl from check_noncircular+0xe8/0x158
[   25.944094]  check_noncircular from __lock_acquire+0x1510/0x288c
[   25.944115]  __lock_acquire from lock_acquire+0xf4/0x364
[   25.944135]  lock_acquire from __kernfs_remove+0x330/0x410
[   25.944157]  __kernfs_remove from kernfs_remove_by_name_ns+0x50/0xa0
[   25.944179]  kernfs_remove_by_name_ns from device_del+0x158/0x3dc
[   25.944199]  device_del from device_unregister+0x20/0x64
[   25.944216]  device_unregister from wakeup_source_unregister.part.0+0x20/0x54
[   25.944238]  wakeup_source_unregister.part.0 from device_set_wakeup_enable+0x54/0x64
[   25.944259]  device_set_wakeup_enable from fec_enet_open+0x2ec/0x394
[   25.944279]  fec_enet_open from __dev_open+0xe0/0x1a0
[   25.944298]  __dev_open from __dev_change_flags+0x180/0x214
[   25.944314]  __dev_change_flags from dev_change_flags+0x14/0x44
[   25.944331]  dev_change_flags from devinet_ioctl+0x878/0x8e0
[   25.944348]  devinet_ioctl from inet_ioctl+0x180/0x238
[   25.944365]  inet_ioctl from sock_ioctl+0x4a0/0x5b4
[   25.944383]  sock_ioctl from sys_ioctl+0x530/0xdbc
[   25.944401]  sys_ioctl from ret_fast_syscall+0x0/0x1c
[   25.944419] Exception stack(0xe14e9fa8 to 0xe14e9ff0)
[   25.944435] 9fa0:                   00000000 be91d984 00000010 00008914 be91d984 be91d978
[   25.944450] 9fc0: 00000000 be91d984 00000010 00000036 00000003 00001002 00000b20 be91db3c
[   25.944462] 9fe0: 00000036 be91d960 b6ba8189 b6b21ae6



> 
> > I suspect the problem is that udc_lock is held for too long.  Probably it 
> > should be released during the calls to udc->driver->bind and 
> > udc->driver->unbind.
> > 
> > Getting this right will require some careful study.  Marek, if I send you 
> > a patch later, will you be able to test it?
> 
> Here's a patch for you to try, when you have the chance.  It reduces the 
> scope of udc_lock to cover only the fields it's supposed to protect and 
> changes the locking in a few other places.
> 

> Index: usb-devel/drivers/usb/gadget/udc/core.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/gadget/udc/core.c
> +++ usb-devel/drivers/usb/gadget/udc/core.c
> @@ -736,7 +736,10 @@ int usb_gadget_disconnect(struct usb_gad
>  	ret = gadget->ops->pullup(gadget, 0);
>  	if (!ret) {
>  		gadget->connected = 0;
> -		gadget->udc->driver->disconnect(gadget);
> +		mutex_lock(&udc_lock);
> +		if (gadget->udc->driver)
> +			gadget->udc->driver->disconnect(gadget);
> +		mutex_unlock(&udc_lock);
>  	}
>  
>  out:
> @@ -1489,7 +1492,6 @@ static int gadget_bind_driver(struct dev
>  
>  	usb_gadget_udc_set_speed(udc, driver->max_speed);
>  
> -	mutex_lock(&udc_lock);
>  	ret = driver->bind(udc->gadget, driver);
>  	if (ret)
>  		goto err_bind;
> @@ -1499,7 +1501,6 @@ static int gadget_bind_driver(struct dev
>  		goto err_start;
>  	usb_gadget_enable_async_callbacks(udc);
>  	usb_udc_connect_control(udc);
> -	mutex_unlock(&udc_lock);
>  
>  	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
>  	return 0;
> @@ -1512,6 +1513,7 @@ static int gadget_bind_driver(struct dev
>  		dev_err(&udc->dev, "failed to start %s: %d\n",
>  			driver->function, ret);
>  
> +	mutex_lock(&udc_lock);
>  	udc->driver = NULL;
>  	driver->is_bound = false;
>  	mutex_unlock(&udc_lock);
> @@ -1529,7 +1531,6 @@ static void gadget_unbind_driver(struct
>  
>  	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
>  
> -	mutex_lock(&udc_lock);
>  	usb_gadget_disconnect(gadget);
>  	usb_gadget_disable_async_callbacks(udc);
>  	if (gadget->irq)
> @@ -1537,6 +1538,7 @@ static void gadget_unbind_driver(struct
>  	udc->driver->unbind(gadget);
>  	usb_gadget_udc_stop(udc);
>  
> +	mutex_lock(&udc_lock);
>  	driver->is_bound = false;
>  	udc->driver = NULL;
>  	mutex_unlock(&udc_lock);
> @@ -1612,7 +1614,7 @@ static ssize_t soft_connect_store(struct
>  	struct usb_udc		*udc = container_of(dev, struct usb_udc, dev);
>  	ssize_t			ret;
>  
> -	mutex_lock(&udc_lock);
> +	device_lock(&udc->gadget->dev);
>  	if (!udc->driver) {
>  		dev_err(dev, "soft-connect without a gadget driver\n");
>  		ret = -EOPNOTSUPP;
> @@ -1633,7 +1635,7 @@ static ssize_t soft_connect_store(struct
>  
>  	ret = n;
>  out:
> -	mutex_unlock(&udc_lock);
> +	device_unlock(&udc->gadget->dev);
>  	return ret;
>  }
>  static DEVICE_ATTR_WO(soft_connect);
> @@ -1652,11 +1654,15 @@ static ssize_t function_show(struct devi
>  			     char *buf)
>  {
>  	struct usb_udc		*udc = container_of(dev, struct usb_udc, dev);
> -	struct usb_gadget_driver *drv = udc->driver;
> +	struct usb_gadget_driver *drv;
> +	int			rc = 0;
>  
> -	if (!drv || !drv->function)
> -		return 0;
> -	return scnprintf(buf, PAGE_SIZE, "%s\n", drv->function);
> +	mutex_lock(&udc_lock);
> +	drv = udc->driver;
> +	if (drv && drv->function)
> +		rc = scnprintf(buf, PAGE_SIZE, "%s\n", drv->function);
> +	mutex_unlock(&udc_lock);
> +	return rc;
>  }
>  static DEVICE_ATTR_RO(function);
>  

Tested-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Francesco

