Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A472680662
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 08:17:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbjA3HRE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 02:17:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjA3HRD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 02:17:03 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2133.outbound.protection.outlook.com [40.107.117.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C61F1BA
        for <linux-usb@vger.kernel.org>; Sun, 29 Jan 2023 23:17:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCOtMxv4wCNX8sGOZutlTboL4vFPvy03gS33aPARd0PfywvEKIuARaXRabIdfQehBRyjw7Nj+dW/210EgidtQgujiNadVi41jhbo4FysFsoy7NJNr+On7Ox4ni7wAd2SbM6JiCJLvTzVjN5pCC4axapq+OcDKkpQLH96mtYWlM88DfL/oQeVgK+Y5jh/6pSivd4rfNGDohGhEgJwQmYtMcT21MQoY50AZFrPyvW9MadvuVMh9ziGHM6zlaG8XlVcKnQc3Rw1bJXxSHXz4TxarjEYKc5d4sTXlK8Oie4ONhL1RWfqdRPFsJtv7mSr9+XDSY8GecAaKxV5kx/2cu731g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRFdudie+/8HvMFhWOGDyq8xYE06nvz0ISG25mYyQFE=;
 b=BNZJZrvJOAkFbz+ZDqHfjilbVe8HFPNHl+6GC4jsofeGzcYHXjwkfYg9y96ttsj/9VS2djcehrKZD8odXInmJSwhAvusrfPXceHtzVLKR3fMOH4gwTBdH4EPHEXzEd/RodYCKCSC2bJ5oaHT7Z4EkETU3pBZn+KLGKGvmf0tC7ucoRvCTczxP+2M1j3N+c1xVvtTHlovwekHQIj0zLl2qtOPQOzTizVXPHH7YTtzjf2A6lorHfRtMFPvCYwTYPKwdO32s12xjljx/Awcgh3UbbnuEcF+pr6JZrnKG1Lmto+goPTMsK4WbItvAHuvTq6pFIIrR+nHKpPIfPJUwm7pMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRFdudie+/8HvMFhWOGDyq8xYE06nvz0ISG25mYyQFE=;
 b=lwYMwEzGIdfL/wTHSIJsSw8DO0RD2effTVMA4b5mYXC7/yxnH/HnUyCW3FQXH78exjnVWVcOlJXTduEAALzkSq44Qw1O+u78fJ2f/wls8Ain3msLmK5n1hdeA0aFKd6bbnlCxq5z0sJt+O4CuoowKxJlt+F29rzh6/KznBX8Uq0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8387.jpnprd01.prod.outlook.com (2603:1096:604:16d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.20; Mon, 30 Jan
 2023 07:16:59 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 07:16:57 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     kernel test robot <lkp@intel.com>
CC:     Paul Gazzillo <paul@pgazz.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [usb:usb-next 35/35] kismet: WARNING: unmet direct dependencies
 detected for USB_RZV2M_USB3DRD when selected by USB_XHCI_RZV2M
Thread-Topic: [usb:usb-next 35/35] kismet: WARNING: unmet direct dependencies
 detected for USB_RZV2M_USB3DRD when selected by USB_XHCI_RZV2M
Thread-Index: AQHZNFRzWGTdb9Qh20GbjjeGaxR0fa62i/xQ
Date:   Mon, 30 Jan 2023 07:16:57 +0000
Message-ID: <OS0PR01MB5922363553F69FF265A052CA86D39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <202301301054.KVvGA5XO-lkp@intel.com>
In-Reply-To: <202301301054.KVvGA5XO-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8387:EE_
x-ms-office365-filtering-correlation-id: 3d265b87-eba3-4904-607c-08db0291f92b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o9Nute3D6resN6vb9GEGbydjD/xCCPBu0Fad4DZ1RHZvv/7mxolKZEcGUBW+yVufpFusHvaX+p2OftCClVlanWekVFKhiTqqduUNsqqnCt36BkNlyuSRPCTZlvaxnnfnSvSgLe938miwsAy6YHAyjSVJRYT6uNgY1KFOY8O3/ciLRvpibT9WgxaFoQb55Cy673HKekTvsqKwkWSItt5BOgL3ToCdxdl1ypR08IpufwAA0bUfYBXKBCyKDen5zTT2Juwl9ZmCyEVTNwhJf2bdFP9XX1+1hhUxyEE2iUXRIWCJVAXbKhSyyaZBDLlIQd+VmCwHBhiV+2jlOr4GYbDP//U4DRt04nVx4Qu0ciS35t2El/nLB3omnvXNwR0aUzCUdjrCryGcdbgkUh7AYSgo6siUrhbyqzQQwtZtCPYQH5ZlGxr8WBoLRDz27aKjUsog6+zpeMDNk87XYQ6YSAHHfF3WcNYmEhEMPFrO4F+EjS9U4votWHYoDFaccsEnvjM5LhYfHUhLlaxji5xOJ1pzjzK7kGOVynU5qVpN7h4789JBF9geyt2sG6Dv72r6oVLZj2YaM4+m5kcVUX16yNtqAZnpejqu/76w1WFdXS7I38ZO5hq7Nzs3D3XqI22PSZQkBtpBzV21tuejPDxcAesrfnDPzKFs9nwLAIZOKVD8oI/r0OkR71Hcchq3fWPaCLVwGECClHLPQSCimb9Vksh7AQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199018)(33656002)(26005)(54906003)(71200400001)(38070700005)(7696005)(316002)(2906002)(38100700002)(9686003)(186003)(478600001)(66476007)(66446008)(8676002)(6916009)(6506007)(55016003)(66556008)(76116006)(64756008)(66946007)(52536014)(122000001)(86362001)(5660300002)(41300700001)(4326008)(83380400001)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xtmS3dXOCWowVG+T/03DPHkLwzWFNfEVsCSZyafylweZd/EW0wJlyAlGC9aR?=
 =?us-ascii?Q?lHl6VVh731lf4wPQ/O4EFxX6jkWuBgJMLuTON50yblb7KZNMp5QaUCoemkEf?=
 =?us-ascii?Q?n1qGIN83iWnUmdwH2T9KaQKM3xZUO4JL7rdWYvyHF4twHnJah1N8d5NUrSLa?=
 =?us-ascii?Q?zmlml71GJ8caULSAvUpi00gOe0PYJppIx/okCtycevlc/NlSkJ3zGCypU9Bw?=
 =?us-ascii?Q?1/tRNSsOFw5z52lmKXgpdwDTZD4kALkkT6JwwfJjIt64K1uFVo4+bCdHQug4?=
 =?us-ascii?Q?e7OJUtQ2d4mfDyDtk6gdcAaIVR7Bn+22vQz2+j+EnH23ISg+Kf2fZCBbx9WF?=
 =?us-ascii?Q?rvxKIJaCxjLxuJiGGTcZujvK75wZMQQtcaWRv/aY4LG/tgquAT+zKskPEO4t?=
 =?us-ascii?Q?WPcBQbn4ultL92zA/KujrCyxeQbBfw6MZsEL6rgPsknrsfp3no39TWaWLyYf?=
 =?us-ascii?Q?SKeWg/ZFEIzloe7lmkUH8YlvKdl4ruPhDWGG1alETLF8c4acdehcaxAb2x+N?=
 =?us-ascii?Q?5izGjRIsR0S0GUOGEGbq3uaJOelSbw4rRH+z+AXn2SogNlef5Brcwreebs3m?=
 =?us-ascii?Q?x0fH4+Qq4HDLLcv8RuEiSxp8O1EfDEBqLBt+BgS81XNV64HJES80N9ncld6u?=
 =?us-ascii?Q?MF43ky27VOvWm0KVH4Z5FiN0YfGYiEmPxxdBVGTxuEc9n4/Eu1WU2IDlsu3G?=
 =?us-ascii?Q?RP8OCdeDLWLF6BoPohQt3FllBQSusIj6555ddfcodDYBXRbCs16iATtc3dqq?=
 =?us-ascii?Q?rtj0xJUe1Mk/WEYAO6z2k17sjOusIGiLzGQymtVJQvKapsMDaZ6d1rhVyy8g?=
 =?us-ascii?Q?0KpsxuZx03zlqqx0JVfljB+Xe0Uxn5f/I8oBGcNN/Nz9NvbqxnQc26MmxlHE?=
 =?us-ascii?Q?MOVbsl0Ut1Fot/ZJVDYrcmxsr23kfQbRCK7FQgs8cEz5le8EI0Yykws9Wl6H?=
 =?us-ascii?Q?coBY4HtfW4BSdUjs+as5gB7W6mWAhasCHcSoSoPHVViidfkgE3nmrHQbkRsS?=
 =?us-ascii?Q?TAol0dkX+WUpeX7Dv4ycoRFRS+LM27isc8WzSRaYvh6X6dCZO6SNYZc7wKHD?=
 =?us-ascii?Q?Cdr+cRptYSgFnctGr2qOEYpNkZYJr76s5nwey59RgFvuOpZwo6x/jCpXWR8J?=
 =?us-ascii?Q?cdh03lpTULjTqwHGzvbA+zlO7NRtpaZ2Quyg+/7vjwcJk+kM+2Q71E1jTgP4?=
 =?us-ascii?Q?Un+MmWzfr928Z92UPHVEc7JVD5iQ/HvQceuK0J28SQVTK2+qUSWIDMHhccOy?=
 =?us-ascii?Q?MwDjaGf9D8aolVKjt5jiLtDap98+JOLHTlDun5xA3lhFYO6DfEkhl49LQdz7?=
 =?us-ascii?Q?/8rDD7yGBPZ0vVYuss/PHWG3yznzTrL0NuI6Gh+RW3kL00mVMF8OnU7yELaH?=
 =?us-ascii?Q?uJFkC/W0+N4Lpne1EWvc/80abuM7hN5c5sQFuwTraD+p1JeR5EiogLtYWZBM?=
 =?us-ascii?Q?E3Rq7zIpfrjVdgmc5wT950eLg5X9EnndDLs8AS8E/VVOEmPJLIElCWV30cvF?=
 =?us-ascii?Q?5hDFuaq26H5gaiMhPg50POXOL+HhioWEJjeStY5VRrP5+/etBV+URMYIeWI0?=
 =?us-ascii?Q?/DneZOkWjoirw0svef8QE7GKGUdkSzrzdmPVpIi4zLootrwzgBuMFC4OEWr4?=
 =?us-ascii?Q?ZQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d265b87-eba3-4904-607c-08db0291f92b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2023 07:16:57.6315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hxwArIeMSihnap4zlVtUH7+m9Nzr/ncEufZM4BJiHS59WNNDF74VSQmKqye+ssEJRCpsEMBA0W2kbHTBBDNnEAB5WZUXgCWasp8PKML7LAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8387
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi lkp@intel.com,

> Subject: [usb:usb-next 35/35] kismet: WARNING: unmet direct dependencies
> detected for USB_RZV2M_USB3DRD when selected by USB_XHCI_RZV2M
>=20
>         git fetch --no-tags usb usb-next
>         git checkout c52c9acc415eb6ff54f658492f8c53da0fc3528a
>         # 1. reproduce by kismet
>            # install kmax per
>=20
>            kismet --linux-ksrc=3Dlinux --selectees CONFIG_USB_RZV2M_USB3D=
RD --
> selectors CONFIG_USB_XHCI_RZV2M -a=3Dcsky
>         # 2. reproduce by make
>            # save the config file to linux source tree
>            cd linux
>            make ARCH=3Dcsky olddefconfig
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>=20
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for USB_RZV2M_USB3=
DRD
> when selected by USB_XHCI_RZV2M
>    .config:4492:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' inval=
id

Looks like this config from kismet is wrong. Can you please fix it and try?

Cheers,
Biju

> for ARCH_MMAP_RND_BITS
>=20
>    WARNING: unmet direct dependencies detected for USB_RZV2M_USB3DRD
>      Depends on [n]: USB_SUPPORT [=3Dy] && USB_GADGET [=3Dn] && (ARCH_R9A=
09G011
> [=3Dn] || COMPILE_TEST [=3Dy])
>      Selected by [y]:
>      - USB_XHCI_RZV2M [=3Dy] && USB_SUPPORT [=3Dy] && USB [=3Dy] && USB_X=
HCI_HCD
> [=3Dy] && USB_XHCI_PLATFORM [=3Dy] && (ARCH_R9A09G011 [=3Dn] || COMPILE_T=
EST [=3Dy])
>=20
