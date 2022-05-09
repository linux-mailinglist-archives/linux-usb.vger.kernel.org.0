Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AABFD51F4E1
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 08:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231852AbiEIHAW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 03:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236069AbiEIGzg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 02:55:36 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.140.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F7151110EC
        for <linux-usb@vger.kernel.org>; Sun,  8 May 2022 23:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1652079102; x=1652683902;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cC9B9s+g4iioUlltpWGVVv4Pc97Tuli09klxJXv9880=;
  b=B25buPQNkw77n6jWOE97ePSHCE5wP5a2mq8Sr2Zs43qm+MN2vFhES74Q
   My7fFdG3QPPhnImQf3skdOXECSjvczlLlu5P5NTVuJADAWAyNZnzdEG2A
   hNiFJRXOKMSw2UmjtnsWhqxGEFHHM0qoaagMBBgWXjkm+NU32OswsyUvQ
   g=;
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 06:51:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8mp8wgl0kGnAXW8X0gQx08KSti7CnqpA/xAitJCwRIKo4PJQlthc1QNcM6+jdGdP8xd0o+IalYIjBRVvViDc7G+9WHNZ02fnCt4OpdCsaNpKd5ai9UQDK7f68BMr0fzStGTjP+hhk+KUo3VEj6RRgp3luXU9B2Jc8RWOWhGbtQa4B/Jl1VwcMbhKX6Gu2YQm/6ZvROqz9saO/cPGHHgwQxbJ0OpSEhqHkq8mBd9udjgCwJLbRJtRonYQ7kdeEHkrf/AbmziMm9ms3BOPA9J7FxdVgvOdQyU3JrWr/Xa+2HJJOkgxXs7ynSXMsdX71i0DMRaM1DTBHWA211CWkjfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cC9B9s+g4iioUlltpWGVVv4Pc97Tuli09klxJXv9880=;
 b=aEBRvT7vLhaQPRHOSHyHyYt+b41XzQ2mKN4WMHLypBtg2VcxlhS0ZJo4oTyAzrI+btdpEnMoa8S79nIAwIoXcrBS7tXZY/QqCSe2oztrO2ZnHEf1p2U6a9K5uyx62dUlUvuppZvHwjiK0+Yi8NC1kR7JBv94Laga1fJQWdm00rQzFh8AbGHuBJhumI3txdx1OsZm3pRkM2VKbHrQ4mGQwOYupItr+zVGKLs20wRogyUMGm1Ydcip+J3SpSg/s+OxxiUInxn4PIKb2LfdIJvPDB07cExr5B9xplqFZHaAzP2cOaygE6SS3HhdwahiXEHuJexYxCaj4dxhCqnGR3hj7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 CO6PR02MB7604.namprd02.prod.outlook.com (2603:10b6:303:a5::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.18; Mon, 9 May 2022 06:51:39 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::ade0:4bec:62c8:4d56]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::ade0:4bec:62c8:4d56%8]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 06:51:39 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: RE: [PATCH v2] usb: gadget: update DECLARE_USB_FUNCTION(_INIT) macro
Thread-Topic: [PATCH v2] usb: gadget: update DECLARE_USB_FUNCTION(_INIT) macro
Thread-Index: AQHYY230nDttIUqcTkmlx6dLdiqeG60WjpSA//+LQAA=
Date:   Mon, 9 May 2022 06:51:39 +0000
Message-ID: <DM8PR02MB81980A8B253C4BCB6A50C587E3C69@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1652077685-30622-1-git-send-email-quic_linyyuan@quicinc.com>
 <Yni3/cq6LX4lyHVq@kroah.com>
In-Reply-To: <Yni3/cq6LX4lyHVq@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0b49d1b-63ed-49a3-ecfe-08da31885e72
x-ms-traffictypediagnostic: CO6PR02MB7604:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <CO6PR02MB76047CE9FB571D61B922A1BA9FC69@CO6PR02MB7604.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qv1TN9fAJU1NA4Va3LStUrahhrnFZAyo6ywWWy3gFl/ahZQnPaxA1pWXG/ce0KADdS3YONmESiR3SbblnxK6PTmjKp/xblKGue4eNT8UMBi9/tbg5WWwSPlB3l3Y4DE5YnWaBXI/G3vU1b6D2Y3NxJif6bttUzZ0QThHutnIsZxWfs5ruBZFhB/+xL3PpbcygQP4ZxRvwPWOD/xQoZgIQkuPRHRZQYUtaCYBVdrCwgKZbjc1Bj+LdDsjd5HCSP0gvfReC4Q4bIZ/zULqYuI7Uzs4nsqmr1PCMU0s+6AU/AsrdI1zyumZ2tJpEYn6BDArVu9hVp/5eTA5Mq8qlMXThVmXtxt71FVVPXAaqy9PPMHsoAAHDNRVoh8wr71UXjXViOVsbiPMTBc6/0JDyeU/Kj93/uywHRHOKFieRSYtQIw9fNcp++kV+o/FA5FHzTIRNLyyy7bdPj77fJ2TCvZWam8XFVtApVIcPyNqt4BbWwO+cBFENwZa070N+6n7eB5TPe9PkQboqbJ16Hqjl/g1aGKkeMBo4Q6edI1mR9fDXq0n7xXhWJwNSAYndyAh1IGred4ugc76wNMAYNNDZm9EZ535ILr7efRq/rck7ba4hINhroTNE/VsAIWVjy+X/cfZdwfMMVc7ep9a8UIrep3sECUgtzjOLCTBhc6WGZO+Ejt7xdqE1W/1t7+xMmGMzz53aswIUM1CEyBxr45AcGb/Uw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(9686003)(6506007)(2906002)(76116006)(7696005)(4326008)(64756008)(71200400001)(8936002)(8676002)(66446008)(33656002)(5660300002)(86362001)(53546011)(26005)(66556008)(66476007)(66946007)(52536014)(107886003)(15650500001)(38100700002)(38070700005)(55016003)(122000001)(110136005)(54906003)(316002)(186003)(83380400001)(508600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UFRkgy3vPZthMo5yQaSrtueicWCW6VHNgT8rNeUg1rpScZVwAyrc+4pPMnuI?=
 =?us-ascii?Q?28Yk83FWdzA2DAiYky1WClmXicqr5CtzxhDi87kLJ+zcbNIphtOB3JlZjnnJ?=
 =?us-ascii?Q?x8oZbIUedRab3OHNifWG5CLN/V0cpbuJNU9AimP/lrsX95/GD1YCO5QtKd0x?=
 =?us-ascii?Q?F0OpZB/C1YKhelfmboJA7DVa5sqN+l4PO9gOdXnJgbXHpALDJO3Ka/qQIrZA?=
 =?us-ascii?Q?bjIXoC+Tbld68qAzcpJl5rzHU3TzLz2cYoqKYf5YRGa1Hf60ZvXPTl53PgOB?=
 =?us-ascii?Q?q1SwSZ+/IfC6LNTuKYNpzeqTQToDFMi3gW+2NXG+cUvmcI4rXSjOXvLym6Nj?=
 =?us-ascii?Q?BOphenMPsw2QF6QrudjmfG39lzfVtN73HenBpx8KMZE9naD4tjgh8dhbLBYM?=
 =?us-ascii?Q?nqfuHVhQJoeKmK7SsV51P+p1eWR8lGb0sQUBi0KnQ7lNh5cAMxWPq08JZrfH?=
 =?us-ascii?Q?bF5idfOc6F7D/RGANWMnwmV5vPs06JPzRRqDAnLm7UYgdD+ySClbt46hXOdW?=
 =?us-ascii?Q?YqQrliKGQVKbxdUrX0fuI4kO+jHAVNx42qxsFTbc/XGpjP39UXaQGtT31R10?=
 =?us-ascii?Q?6K7THXT/lSEDGMkO56B/khrgA3HktvYT4oz78tgR5CMj7Sda3tFZcn4N/xvK?=
 =?us-ascii?Q?gOxNWmIi9SFACFO/SJicWi3kEflgMb0YXDjSqYW6pJKwwI1abj1f041negFU?=
 =?us-ascii?Q?U1lAgS2GGK7AJbv8JT7NxuFwAXdpB49cBmsWwGXEW8Z4fVEAGYuaOLRkeEnb?=
 =?us-ascii?Q?94ZgEdOWIbYj9biKFWXU4K3w0++RaV8XTsB4X5CVHwoV17T2hO8B+2OvB7T9?=
 =?us-ascii?Q?ObqhadbBOFBm8TUWwlkdWAlPFYJivDndLe5ke24ORGiDG0kTWDJfi3AZzY90?=
 =?us-ascii?Q?HOwqVgix2f0xB7gkvfLpfD6YykJfd36+ZZNJCAVcQ6b2N70uNEivY2yvzGmw?=
 =?us-ascii?Q?ZhWsKpryq6jdA0AuzIiMGmKpHfffvI0aa+3ZfskMMnLjGwNy6rA0swxFo7J1?=
 =?us-ascii?Q?DvqLp5c9Ol3E0ybDBFSJBjFUE0iQcUndhOKMp4LoLaStaE8m3Mb3cssUxk7a?=
 =?us-ascii?Q?4mEqDfQ9pEkN6EaJ4L8a0tQCI9xy7ghcS8m5VqNWv3QzS4A6cGwiCPwq/Wwu?=
 =?us-ascii?Q?n84/4oCHk8WOnJqZazta+y2Jh+KrMbSsf8U300qSanaEfl4sYznGI+2zkLEp?=
 =?us-ascii?Q?dPF7v5WRgu3b/imlPxZulS5k1a72n/XcWlr/c9iNtpvRqIGgo1xGH2A3z6Dl?=
 =?us-ascii?Q?xN/6hxKvbO89h/D8pDL7sIMpdZK72gaNXG47cGhSJn7a94IDiD+D3Q0t98Ij?=
 =?us-ascii?Q?zKAgSdtwNyLCg6Mv6oPM7gg6qqNS1hcLNCYa6K1pLo/Vfgs8OD6VEdQKTgDL?=
 =?us-ascii?Q?9qUf8dWF5CSe5Vo2ogcuiUsFoTAu0v/XGt/nX20cMImeatsN3FEasherbvRX?=
 =?us-ascii?Q?0IBdkWwlA1w0oBPIXB2jqq9lpurTUwd/rJmyWl0yqkOEOpHE8H/qS5sGHx04?=
 =?us-ascii?Q?l1lCnWZoeA3Y2NvQysWGFSDqoMXOSgliJ5Bs7a9gD0DCNWUQTCPZt+Vnf5qX?=
 =?us-ascii?Q?tWBffqVqhZQ5wAWUr8h7nJJ9F+y+jD5rRNNwEfM06cjibMuzWtDErbQzGJSh?=
 =?us-ascii?Q?yk0ZnZxBJhb6314YwzCwqYjeo890ThomG2r0vh6nEAN7LSdRz4QD88WjlTvV?=
 =?us-ascii?Q?Qqpq2a2jymlc96no50BTy2BNvDtcEEBPfXbhmagdw1+ijn7+xOLKJwRu6w63?=
 =?us-ascii?Q?6Lyhin/bWA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b49d1b-63ed-49a3-ecfe-08da31885e72
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 06:51:39.5937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XfP7xQpxOmvT6WASkYed1fRLqZVlxLaMgJhvkVo21gEK32Yuk59dBS7QitPAMCl0E3l3aCPKt+dp0YRJoyupmmhsvnqc3+PPt++5WKMqSRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7604
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Monday, May 9, 2022 2:43 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: linux-usb@vger.kernel.org; Jack Pham (QUIC) <quic_jackp@quicinc.com>
> Subject: Re: [PATCH v2] usb: gadget: update
> DECLARE_USB_FUNCTION(_INIT) macro
>=20
> On Mon, May 09, 2022 at 02:28:05PM +0800, Linyu Yuan wrote:
> > Take DECLARE_USB_FUNCTION_INIT(ffs, ffs_alloc_inst, ffs_alloc) as
> example,
> > it will generate function ffsmod_init/ffsmod_exit()
> > and variable ffsusb_func.
>=20
> I do not think "as example" is needed here, right?
>=20
> > Add possible character '_' in the macro which will generate
> > function/variable name in common format, ffs_mod_init/ffs_mod_exit()
> > and ffs_usb_func.
>=20
> Ok, but why do this?  Why not add any other character?  What problem
> does this solve?
>=20
> >
> > It will apply to all gadget functions which use this macro.
>=20
> That is a given for any macro, and you do nto needs to state this.
Got it, thanks
>=20
> >
> > Also do minor change accordingly to f_loopback.c and f_sourcesink.c.
>=20
> Why "also"?  What minor change are you making and why?
>=20

Will explain the detail change next version.

> When you have "also" in a changelog text, that's a huge hint it should
> be more than one commit, and I think this should be more than one commit
> (hint, the f_loopback.c change can go first).
>=20
> > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > ---
> > v2: fix issue report by kernel test robot <lkp@intel.com>
> >
> >  drivers/usb/gadget/function/f_loopback.c   | 12 +-----------
> >  drivers/usb/gadget/function/f_sourcesink.c |  6 +++---
> >  include/linux/usb/composite.h              | 14 +++++++-------
> >  3 files changed, 11 insertions(+), 21 deletions(-)
>=20
> As the first version showed, you didn't test-build this so I really do
> not understand why it is needed as you obviously are not using this
> change anywhere..  Why the extra churn for no real advantage?

No, on my local workspace, first I only choose f_fs.c to compile.
Sorry for that.

>=20
> thanks,
>=20
> greg k-h
