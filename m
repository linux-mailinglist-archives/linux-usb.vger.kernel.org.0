Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF17680670
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 08:23:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235825AbjA3HXv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 02:23:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235333AbjA3HXv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 02:23:51 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2091.outbound.protection.outlook.com [40.107.215.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3F46EB65
        for <linux-usb@vger.kernel.org>; Sun, 29 Jan 2023 23:23:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXMT7wNseocYIB8Vc4DS0VEVBqomoQh8fwbZSpn6dB0JgspIG+O9UtXy/xtU4hvgbYKeOgndhHwBMzFEVCi5oCWni/lf4zez4KPQAMz7AgsUp8zTN00U9OwWMwyKLkpqZj1Jkm3U9hFE2k/LO/sltO3/KIHTYrzAgup8tJddeK7AaZ5RDRaZvbW29nTIaUcHYR0xnvhbnS3TlLXm1v3DZSIjfqTPVbLafXt4wISyqioevEumHnLPX9ywyGANx3vBJznc+23115bcLWRNi/VxC2tLfi3VtL7b6rphkXpM0HdBEmQJfMZkLD/QaKcaLqzca2EPddbsygGNdAfpFpkMkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7o7kpQ91q40Ebx8HU/oBZ2Xb5UP8MX6Mn0MKTCu002k=;
 b=UPyEf+TTwwcNDl8PNEv/sHEZPssK/pF/pE6coH2o/ac1lFMDTTovrrdhn+l2IrAQ+U+JmHdEd4C27eExusA9LInt69JY8pkL6lvfuTK08t3efq6uMX+m185xNsEstXSJjyXKLlXKsXmi/9RWKNW3NybcY6+YGcZdEj3s8iMH3dRWeKx8xwVkbiwcM8Om/Wz0w+hYnONsZQE6kcPRZ0i+pf5jSk4XYVNNR0FN2YMMG9PGlx9y7SOdSCzM/HxuRrtYJpTUtgW2aHrB0WBBhR2l7P+FtPEclYHNCq0wCtRHbA9lfnVe6HLxV37qziX58OrmAzdZrxYWntB210WlTObHKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7o7kpQ91q40Ebx8HU/oBZ2Xb5UP8MX6Mn0MKTCu002k=;
 b=ZBOLVvTa7VoY1NAnX/IESRgByHBdJVtVg5BGzyBKlktjf1K2wFNEo1GlCDLnt8DvFYmWDIki7VkzlL9v2v4a4pJk0t06JHSadXNKYD4pc7p5H1KygHW2DkBv7XoG6fPaizwd4n+5R1PM3umupc2i211Vb5pvTlW+jA9i3hMwxvw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYVPR01MB11168.jpnprd01.prod.outlook.com (2603:1096:400:368::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 07:23:46 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 07:23:46 +0000
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
Thread-Index: AQHZNFRzWGTdb9Qh20GbjjeGaxR0fa62i/xQgAACqkA=
Date:   Mon, 30 Jan 2023 07:23:46 +0000
Message-ID: <OS0PR01MB59220F2F7FA1C03815EC39A486D39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <202301301054.KVvGA5XO-lkp@intel.com>
 <OS0PR01MB5922363553F69FF265A052CA86D39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922363553F69FF265A052CA86D39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYVPR01MB11168:EE_
x-ms-office365-filtering-correlation-id: 46f64a5b-24dd-47a8-fbc5-08db0292eccd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FNLNGtESo8ALUH00qv/JfcnVKvZIe+Ziysw8VvcOCrOn5RqsBuVCT+A0Dc9DEeMRrioK1kYNy0T1Y1bclTTCYGPpy6w5iIYWE/IHv9ZqYHmKGtN/OCcNdAP8KnNBoao+df8ujIuOy1Ee6jGeQchSSO1fMwIFYLpLTX7UeADJMELu2c1pxJTBW4iE22I0PwMavqilj7/jp7pwIqTcJMgaO0W/0U8a7A9kOPQBY0EDHa2vG5JCBWUcy6BlGsjLyzwYV74Z1Ko1mvYL7/fEV12udzbuvfd805yMDbvtdEqhQ98lSw6xpa/ialwt3bKXENEVbH+vumT/iC/oKEpIBIeRw3NYl4RfeH+LkOieZXU/XZYGktVPt0AQk1YD14IsC1WJl7QGUpi97PdhNZuVmO35TTDenIbJyDbkJzxO8zy4Z5LvTFvWtKjK1poRjD3JWJPz07YMQR4aDtIuMNBtjySxB1ZHeJHx5ijzIOnDgxk8oKkqoMflmDdOPLPmD96VGRtrUd4U9iGFCDsGsZl6CPAkSvIb22epTIUCJVARnLI2EpPHv60y9EDhoPj8lzPOrgERysQDMgMhAcV44Dh01qZt6txpGKR2mXMbblLTZ1oW5PY6uuNONUBCl4tjcVVROJS6ctvzzIqidmTu1qBI9fbLjCoPEkGswgn76ZRYxQivA4FBxTuBXOHocgqSQgVYeEEePY1dcvY30Hentww3onMu/sQ0dV3AHJU1DdwSC2wEoSw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199018)(66946007)(66476007)(64756008)(66556008)(66446008)(4326008)(76116006)(5660300002)(6506007)(316002)(54906003)(8936002)(52536014)(2906002)(8676002)(6916009)(41300700001)(71200400001)(7696005)(966005)(478600001)(2940100002)(9686003)(186003)(26005)(83380400001)(33656002)(55016003)(38100700002)(38070700005)(86362001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lk8a6UBgbd1z3SQrYqXAIFY1M77EZo1wRLFphnANn+4ANdJMYyk2CWwb810P?=
 =?us-ascii?Q?1AwckDzdrYx1lM/sUd6VPPdyICFpGyos61sEbFwkK+IaqkJx+GEYjHI5Nbby?=
 =?us-ascii?Q?boBbgu9CHICYv2GIP39ThbVhivRXmHf8VaBp+BYpxFxRzuE5hTeQIAZUsVT1?=
 =?us-ascii?Q?/nzRmnsCjQ/Gkhm7wCc9j4gUkRF4YEYxPLDotejl1qPcoKsZLMMxKoM6jjgh?=
 =?us-ascii?Q?yJrqtFNvZanAUKvAdmGpVY6QmEwI+nHLU4N0CaGRdc03FAHdao7hlNzSae8T?=
 =?us-ascii?Q?ljKGlZgq9mirAw0QaIR2VR2iOF+rlXe+DnMUAJs1sK69/pTbz7kqzICtalSd?=
 =?us-ascii?Q?dyPRfpXFqhm3ycxGusPl5OiY2m8fdkbBNqzn+O0zjgLHTRUWnx3W94qc+IfC?=
 =?us-ascii?Q?p1FqlpT1vED/iiD9/8Wp5+aHqAd+zELj6P1ejGFZhLXDKEaue2Tioh+AAQne?=
 =?us-ascii?Q?V1/B9pBYYzphQUDcYyPNcv5rkx+rIoU67LjQZjF7S77+dGcbxeHwNVQIq4Xp?=
 =?us-ascii?Q?/6UyzbtLFXzKHNheT/fTjL21wbZGOWEDjBnGysRdEkfbTYYIkzlYSCiSkaT/?=
 =?us-ascii?Q?bcLqMm9ps8bCy19YmGaYcXHyYzmHRAjUzC/OzSlh9AXseBwslIdcy17EhAXq?=
 =?us-ascii?Q?os5A4Mu0lotuH+qcywtdJBCgy0w7gA3JzYbCtYCzOLeQBUyNU/sbOedwkUIq?=
 =?us-ascii?Q?7g2v92GYR9OGTrYWERLj05qn+PvjBgXMfajtuqWvtmqp8Q+AM6Fhfp4SUz8z?=
 =?us-ascii?Q?OmE51wA1w7EbcKGpJYIvlJqPgyq+FYKc2kF1L2JRRYyBsWd2+NRJf7uLpDCb?=
 =?us-ascii?Q?hqninsUwzGpq9owCPh1BAYnPcTfu7UQuUjayNjKkPYeR/bThGyCO9drtltbI?=
 =?us-ascii?Q?yG5wlbr/pbHgCGiNJ0TUTda7uvaPdJ0ZlXHA6rUn5Sc+rIip9KMRyrpuzCN4?=
 =?us-ascii?Q?YdDnO4A57iOdc0akeFaqVIf4dq/1eeweuUpuwtyX/DPfvITaaE15fOLsamTL?=
 =?us-ascii?Q?nQKV6caJlLiFcp9VvtYp0/mhmnaFgOZXtAG9wRqEwmCOq0D1yFlLyDedAe1O?=
 =?us-ascii?Q?kghGtukAWRYhXlo9N8Huln9e0uz0atgbyXqtXbH6XeYLNMAUpDfUiX8gcx/R?=
 =?us-ascii?Q?3sxU7LSuJY5Q4Ou6Jz31LmMdKW912buSfWI/aPIk6gUypx2JDApwGwqQLmLT?=
 =?us-ascii?Q?Tj4zYEtuZj4LnwOm0vX5E/1ifD58KXcHKKBLIZoBaVhzDNlAqwk43gl/2YAs?=
 =?us-ascii?Q?lXQZU2AybQscBEy87ctF6L2H3noPft6LB8dMxlHZAXy9ar6u+LRDRlP9BtRk?=
 =?us-ascii?Q?OPTNnFKCuA41dO7wXqJntD4Jd1o4TZZttH88tIpIKnlgI2wjwtUbcnk6HpSQ?=
 =?us-ascii?Q?oPqgLYYtNjH8DM2xjy9YQS5d2QGAssiu2G67GWuyqUOOhJVvu8qPklYgsX/G?=
 =?us-ascii?Q?CfShbUG43gUhGN3P3Pz5L1uhbnWLwamGGWEQRBix9mO8g4GQM6bZaefD9Sw6?=
 =?us-ascii?Q?O0hv+96Wj1255wJ2HpH2bNF0YyEhhKQSKMAH+jsFNmezJvuGIYTiVtRAEsIs?=
 =?us-ascii?Q?Zj2Wuiawq6iHdNohQKVQ9ifADWYnaPzhRN1WW7Ek0CaNDpVjC7SEnh3F97SH?=
 =?us-ascii?Q?eA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f64a5b-24dd-47a8-fbc5-08db0292eccd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2023 07:23:46.3835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G9+Ll529/g0MBWxWzIuDUthsentupN6kpJWqgJ/l3Utdez3nIO9jMiW0JQTZtik0gb5HjzluzSmutQmsM9oHceGMEyzNPUBBAcZoATCAN9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11168
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Subject: RE: [usb:usb-next 35/35] kismet: WARNING: unmet direct dependenc=
ies
> detected for USB_RZV2M_USB3DRD when selected by USB_XHCI_RZV2M
>=20
>=20
> Hi lkp@intel.com,
>=20
> > Subject: [usb:usb-next 35/35] kismet: WARNING: unmet direct
> > dependencies detected for USB_RZV2M_USB3DRD when selected by
> > USB_XHCI_RZV2M
> >
> >         git fetch --no-tags usb usb-next
> >         git checkout c52c9acc415eb6ff54f658492f8c53da0fc3528a
> >         # 1. reproduce by kismet
> >            # install kmax per
> >
> >            kismet --linux-ksrc=3Dlinux --selectees
> > CONFIG_USB_RZV2M_USB3DRD -- selectors CONFIG_USB_XHCI_RZV2M -a=3Dcsky
> >         # 2. reproduce by make
> >            # save the config file to linux source tree
> >            cd linux
> >            make ARCH=3Dcsky olddefconfig
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> >
> > kismet warnings: (new ones prefixed by >>)
> > >> kismet: WARNING: unmet direct dependencies detected for
> > >> USB_RZV2M_USB3DRD
> > when selected by USB_XHCI_RZV2M
> >    .config:4492:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI'
> > invalid
>=20
> Looks like this config from kismet is wrong. Can you please fix it and tr=
y?

Similar wrong config issue reported here [1] as well.

[1] https://lore.kernel.org/linux-mm/202301301239.ht1u9zke-lkp@intel.com/T/

>=20
> Cheers,
> Biju
>=20
> > for ARCH_MMAP_RND_BITS
> >
> >    WARNING: unmet direct dependencies detected for USB_RZV2M_USB3DRD
> >      Depends on [n]: USB_SUPPORT [=3Dy] && USB_GADGET [=3Dn] &&
> > (ARCH_R9A09G011 [=3Dn] || COMPILE_TEST [=3Dy])
> >      Selected by [y]:
> >      - USB_XHCI_RZV2M [=3Dy] && USB_SUPPORT [=3Dy] && USB [=3Dy] &&
> > USB_XHCI_HCD [=3Dy] && USB_XHCI_PLATFORM [=3Dy] && (ARCH_R9A09G011 [=3D=
n] ||
> > COMPILE_TEST [=3Dy])
> >
