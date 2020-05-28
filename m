Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B531E5E11
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 13:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388165AbgE1LRn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 07:17:43 -0400
Received: from mail-eopbgr10072.outbound.protection.outlook.com ([40.107.1.72]:40263
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388105AbgE1LRn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 28 May 2020 07:17:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFnzXtpt2O/khl5qCKtQCFCNUUo7KkgmSUca38ANaRy3GanAlnZ94ExeZEpeu/LCyhWJeyxkfywGxx1YbcoSHIYvvC/ABTTj3r5Mz62+La4KxKawx0p5VKN0Iafa0McRy44Fffg4fClQCt9yxVzm4OlZx6yFQOC2GNQG2nRG+RrAvwM0F0kr0WL1L59H6Cc7+9ID+gY7IdrwkLtnW3JPOIx8UX9B+DU5bqaDd7EiQMqCl5OPtAijY+afseqoXup2kT4qfTybWyQlydtsI11QWNTgojMPhHp4Lt3zFVVR8RphjOomxD6Q4I8SnNpfNL4TWyIhW5TcePnCok42OknK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ys7cBL27K7ASYpMsqy+GIH54am7dWZWCsuvY3zPs4QU=;
 b=n/YK/DFLgFK+xCdg7ptjhIXBWalblagXueIYl9Wkga+gEaqN/L01cQ2SkHcbptI/siYoc7UAFh9UOXTyd1k6F41lL+QX4wb1kQunaoR7qIuB06cOjQsFUy5AUhw69C2JEgWM2kNn39KrljfvqndWQHb/Ycde1LMwHVs7FWJ+lrQVPTSL/JPrY4tFN+YVPKIhIJwc5cWo75H89DYEeJHTGTLZfSCyFDSbQKvNCvjbCsHksIh2LDewlTeFwxGMwilC//0974LshHlc3kuOVXcACOcVWLwzZvlYNmcmKryrbsr1LkQAOpZoRVTe52zKsrfyauMJDkuTlG3ZDKfYYS1H6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ys7cBL27K7ASYpMsqy+GIH54am7dWZWCsuvY3zPs4QU=;
 b=Ytrr/TVhI8T2bpWm3Js8+zDcccka9yKF+502Obaf4/NBnIt1r8ZpT9svNIP61BVX0CvUHK3iKRKcLlDhmsg9shchNRXdriWa1pXLMDRcB/nGoZhuWNwAAAix6+tdCxQSQowYeT7hvELYwGJjyIGg39Tixl+Mj+ZyrCLOZDTMmyk=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6936.eurprd04.prod.outlook.com (2603:10a6:20b:106::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Thu, 28 May
 2020 11:17:39 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 11:17:39 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Belisko Marek <marek.belisko@gmail.com>
CC:     Linux USB Mailing List <linux-usb@vger.kernel.org>
Subject: Re: usb raw gadget impossible to sent buffer bigger than 3MB
Thread-Topic: usb raw gadget impossible to sent buffer bigger than 3MB
Thread-Index: AQHWNLgGna5z4KFXNEKgnhn+fIzL8Ki9Wd6A
Date:   Thu, 28 May 2020 11:17:39 +0000
Message-ID: <20200528111803.GA2604@b29397-desktop>
References: <CAAfyv37cFWsvoprz2jZ=jkdiTqxjPSYr_c6w5YYiaKWUe_-V1A@mail.gmail.com>
In-Reply-To: <CAAfyv37cFWsvoprz2jZ=jkdiTqxjPSYr_c6w5YYiaKWUe_-V1A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 20f7a609-518e-453a-536f-08d802f8bb72
x-ms-traffictypediagnostic: AM7PR04MB6936:
x-microsoft-antispam-prvs: <AM7PR04MB6936977EAE136E4B9A5508958B8E0@AM7PR04MB6936.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5TUEkeJcy5zCh4FL3GmNe2RKx4+gvruTMOUp+7S4YfbW1leJPzn/w/dZo7gkA+dzUsvGrQBIocRLNrISNquO+WIS6vK1BGZbio/6Xnqcd1SPFTlCTYocnlBLA2wJ5JNAAUyykZhH6PVqMNYjxGxcPTqiB4HRDGPJ21nU0vpXr7/wxF4dZk0Dna5oeaRVzqGrr4KEMrFbFXqKPgE8ae9rgSsFtZ0wHV93WxqlJy9FFW+Tw4ZinOxMeo888YqGprHI7ExWXw+IRAHgYenOuFjYga8b0EH2DoM8hLebT4kXEx1ULn/62uVxJlzMQz0cGg3iL/VUBN0rLneEY4MMlE+koZHMOTEbCxWJt87HF3kzNPfBlN4nEJSWGYK1N2N9Qo/g
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(396003)(346002)(136003)(39860400002)(366004)(376002)(8936002)(316002)(8676002)(66946007)(66476007)(66556008)(64756008)(66446008)(186003)(6506007)(53546011)(4326008)(76116006)(91956017)(9686003)(6512007)(26005)(44832011)(71200400001)(86362001)(478600001)(2906002)(5660300002)(6486002)(6916009)(1076003)(83380400001)(33716001)(33656002)(135533001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: iAHEXUdVmRz6XnXo81UHarjWZfDR3/c29jMGaUvSg+mqQeYoReRxq8Rpk7Mky+3Cd1XFqWrB1T+bdGd196/LfpkYu5ojN8lRJN6ukKwxoaPo2RXTaDD+Fk2NqWq5096LYajb1yBCHXjCRV/RZTVMLyxGYAY2iwjQFAQmskVgCJRU4348PjQZGjItJnGQMJlN15GeODp6cx4dCOiz620MhBew89y065zOfzwLekI2H8bkdgQ6bPy9UZEYqhzYEINXiEgczso1WAEKNcWL28+f3PKqUPNzeMP4Caks4EEUu+rVsvuFEHQ4GsGQEu316/xP1Ry4EvzBguWi4NpGgrWTm4t1Y0Jr69IQN+/DgWgh0fRWUqDDu9+gWwHjkw7/hBWUR9IJwnfYov0r7N7An5CD0YBVu4DpeeL3yjRKcY0KK+GMUL+KsBbR7vyRuS263kVrqzaRUSu91Y5K63YVDjb4TTY3qSWDrN5DBe1Z4/F0vQc=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DDFA148DC48A3742B4B7DF2315A9B48E@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f7a609-518e-453a-536f-08d802f8bb72
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 11:17:39.1498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8NicaMOaKOZIy+7mv/aYndWoyn2yXdwqx8sWoPzKkmZJ0/TuK4SGvuvPxkOtMDIy2ulukTm6gz7Bqybl0Dniqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6936
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-05-28 08:19:46, Belisko Marek wrote:
> Hi,
>=20
> we're using USB RAW gadget for communicating with PC application. We
> have created loopback test which send file (any size) from PC to
> device and then same data are sent back to PC to verify roundtrip time
> (using bulk data transfer). Everything works fine up to 3MB file size.
> If we sent bigger file like e.g. 5M we can receive file on device but
> when we want to write to output endpoint we got:
>=20
> WARNING: CPU: 0 PID: 12299 at /kernel-source//mm/page_alloc.c:3725
> __alloc_pages_nodemask+0x1b0/0xde4
> [<c010fa08>] (unwind_backtrace) from [<c010c45c>] (show_stack+0x20/0x24)
> [<c010c45c>] (show_stack) from [<c04cc0d4>] (dump_stack+0x20/0x28)
> [<c04cc0d4>] (dump_stack) from [<c01324ac>] (__warn+0xec/0x108)
> [<c01324ac>] (__warn) from [<c0132598>] (warn_slowpath_null+0x30/0x38)
> [<c0132598>] (warn_slowpath_null) from [<c021ccb8>]
> (__alloc_pages_nodemask+0x1b0/0xde4)
> [<c021ccb8>] (__alloc_pages_nodemask) from [<c023b888>]
> (kmalloc_order+0x2c/0x48)
> [<c023b888>] (kmalloc_order) from [<c023b8d0>] (kmalloc_order_trace+0x2c/=
0xd4)
> [<c023b8d0>] (kmalloc_order_trace) from [<c0261c24>] (__kmalloc+0x40/0x26=
4)
> [<c0261c24>] (__kmalloc) from [<bf039bc4>] (ffs_epfile_io+0x13c/0x570
> [usb_f_fs])
> [<bf039bc4>] (ffs_epfile_io [usb_f_fs]) from [<bf03a0c0>]
> (ffs_epfile_write_iter+0xc8/0x120 [usb_f_fs])
> [<bf03a0c0>] (ffs_epfile_write_iter [usb_f_fs]) from [<c02734bc>]
> (new_sync_write+0xc8/0xec)
> [<c02734bc>] (new_sync_write) from [<c027351c>] (__vfs_write+0x3c/0x48)
> [<c027351c>] (__vfs_write) from [<c02749a0>] (vfs_write+0xcc/0x158)
> [<c02749a0>] (vfs_write) from [<c02756ac>] (SyS_write+0x50/0x88)
> [<c02756ac>] (SyS_write) from [<c0107a20>] (ret_fast_syscall+0x0/0x54)
> ---[ end trace fe5f79fe415b9881 ]---
>=20
> and write ends up with: write /run/ffs/ep1: cannot allocate memory
>=20
> When checked free command there should be plenty of available memory.
> Is there some limitation when writing to endpoint? We tried to split
> buffer to e.g. 3M and sent it and this works but looks like there is
> penalty when sending bigger files (100MB file received in 5secs whicle
> sending back it took 2minutes). Thanks for ideas and hints.
>=20

Although you see there are plenty of available memory, but the block number
for the size(eg 64KB) you request may be zero. Since you use old
kernel, the f_fs doesn't support scatter list. To fix it, you may use
small buffer at use space, eg: 16KB per transfer.

--=20

Thanks,
Peter Chen=
