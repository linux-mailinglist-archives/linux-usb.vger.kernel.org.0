Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB8FE5244AB
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 07:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347822AbiELFGu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 May 2022 01:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236464AbiELFGq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 May 2022 01:06:46 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.142.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF90B21256
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 22:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1652332005; x=1652936805;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8qHExOkmYHg7Bz2eF5u2txJQAjvWjw6E6tApVpf8ZnU=;
  b=GIeRjJTmeUyjPjgyb4MwOnVE9rggXSMDhzIoUuqSvhXXKxwZ9S1J4Xfq
   DsRg7DCdp015ez6OrVvo1MQGRRVfJWZXO+VhU0ChxT0W73c3g8bYgn0cG
   jP5tF1TgyRWIaKFxFtOKH8e82m64RbT9ENvH4+HGO7yhj90a/nTd/0DQS
   o=;
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 05:06:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ju2xdT7QrVXp9gT5qdFtXqgemL+imq2lLxR27IUEWBcdo0nJE+9BImlfl6+Z/2kgJTNDja04R3J1dN528euIJ4lFB+eHP/B8mi+8YXENap0f679UxYJGMy2uiCJB3EfZizRtCwA1wOFy+rVCZ+8zVqFPnCg5G8C4ZIQSgnT6abkydIruUSMskvrd+qjJ0WXo2Huc5n1+vT+7AVC09wJAqem5TRnqid1vwJnFGc+SHI+GWnEalHfwi4my/HE4oBfQBEuMdlAFs93lcLL+U59unMdNZ6MQMrqXv7cRnAlsVgLb6h38TLWsKpoeFxsSrpwLkvSgETlqiFvuPHyI6xzv7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qHExOkmYHg7Bz2eF5u2txJQAjvWjw6E6tApVpf8ZnU=;
 b=Ko5O1IJMskkbdk6fH66aEeG8DLwdHWNTegVowKNsPDSlcuMyGhV2mLTQ0GHXO7Ji7FgRcBlBaBj7yhcP4dWZJez3tWNQerNyNcPxyUHF2LSQ93en3ZDyfMuWaUnEHgOmNBPkwl9tnjWFhpDMHeDboH9inYnLC1R/nbqJr4HkD3SKJgLcwACzTCND4nwHTOjfkuD7ZClfVNRfusUdqiYTbruUC6T1pUiEGr87C9OAxc4x5Yc2FzJkIbK6+h2uhnSSx3ne+rXz6874RhFVLqb8shvE6pkkMILrOyXCNbztfyPv7z7Go9LHwxmzVBiIy0lHm7OBMCNe+KfsyMagoLE3DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 DM6PR02MB6542.namprd02.prod.outlook.com (2603:10b6:5:1bf::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13; Thu, 12 May 2022 05:06:43 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::ade0:4bec:62c8:4d56]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::ade0:4bec:62c8:4d56%8]) with mapi id 15.20.5250.014; Thu, 12 May 2022
 05:06:43 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: gadget: make f_loopback/f_sourcesink standalone
Thread-Topic: [PATCH] usb: gadget: make f_loopback/f_sourcesink standalone
Thread-Index: AQHYZacDmvusFTBKzEu4DnNOtnZgTq0bFmIA//+VYhKAAARFkA==
Date:   Thu, 12 May 2022 05:06:43 +0000
Message-ID: <DM8PR02MB8198FEBB06CFCC64CB7121A9E3CB9@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1652322094-20698-1-git-send-email-quic_linyyuan@quicinc.com>
 <YnyIok/ezG9csdJV@kroah.com>
 <DM8PR02MB8198AD3B061872DF43801E1AE3CB9@DM8PR02MB8198.namprd02.prod.outlook.com>
 <YnyRljpA1nA7dH/B@kroah.com>
In-Reply-To: <YnyRljpA1nA7dH/B@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b98cd74-85fe-4957-ead2-08da33d534ac
x-ms-traffictypediagnostic: DM6PR02MB6542:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR02MB6542D9394A94C1DACDCE62E79FCB9@DM6PR02MB6542.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j+3uhk4eIIcD1YT20AGYz2bZStSM8I3zMF0S5dsSJu9HL8LPwMUJUhxfzR4rnJiASJgkdOc6tPQQKcRKiEdHwHDmfkv19awx81L6WCoX6JqlTS2yCcD3NGSljuhKu0/4CXNMWweLuaSpS+sT7BZcSLxcxytFH+MoaJ/2yUrnITBjRQbxNfVrzW3hUf4hhgZTvujai5xaliNuHFkP5m0fWTSwnjzk8LitF9dOv9Ql1xQZzCNMhrISH1CzAInxM96Bm3BtRVVkNJ8CnhrIerGVNbwf6/CHOkB6uFhs38cqUrxou9VD3n8zjuMUyb6zdQreLxI7C7pIWLo0VLZc/S2mEYYh2vScJPCyDIJ+woPkGb06A28v+P8SXfGwR4vnBuuNUdUZOqL3qgxFtsuL91gEP2X/80cWJdRjq+Cdk8Vf2leNDuEOQr6u7encQw/ZZ3A/O2m1I9IFTLN9j2q/3zA035oE+8IJpxGjed4JW3lp1ShiNxmb6AjUiDrf0CimlwywABz2G0Bk7ft7EkIoZkciHGlqnwiNIhk9wfEBZLNTfIAhQ39699WLKnOMX7eqkuJaD8trdHHoWBHS66gm1tpQUIWm5ZnQRdDY1b5ouuryCWTv4DTdQAFNQ0klyGd/YmfquotYdWvGmSjE0KuZbYG4LsZTrdjhlrN6bS8yLUI1aH6ediT3N1KvSinLyXUR6JDyCCiw95rM/b+j3xaPnleeXQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(6506007)(53546011)(86362001)(64756008)(66476007)(66946007)(76116006)(66446008)(66556008)(4326008)(8676002)(71200400001)(33656002)(508600001)(7696005)(5660300002)(2906002)(9686003)(316002)(8936002)(52536014)(122000001)(54906003)(110136005)(38100700002)(38070700005)(55016003)(83380400001)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ieosp8nMvEUuzKCPhKEHaI9/XsHSEPewyfHnaXtAk2ugZLM4EFN0ISNkNm/8?=
 =?us-ascii?Q?WXbj4r7rOCkfq2KRpbMIAcAhKENPCe9EWq6qMpiVbpcfonzVX+P7dLVXDw4Q?=
 =?us-ascii?Q?OMEBpcZV/FM+G9va5hBWDCBUuv5y8FgdyNFokVDw9G2w51MOwj0j/jd0mMai?=
 =?us-ascii?Q?Ln4mWdYIT3kHncDTTfFIFKmDeNptVmJmgTQwXtfZTfuMort4696sweEX04Sk?=
 =?us-ascii?Q?ATyb3Q0bMh1prH8h8OONUUaE3lnYZfn3O1VtTcR78r+GaBJaRriJWnYpZpVg?=
 =?us-ascii?Q?RYlP6VRkdfDb+oNPdlJOFT88WA2WIeW0iStvs+spolvqA54SqdnVOq9GWDJT?=
 =?us-ascii?Q?d/Q9b/Ptf8xh3cfUhR9/CqePTc7fUigbNA9YjjhzrPbz0d+BkLucLxqQhC06?=
 =?us-ascii?Q?rI6ryJae6j09E8WThZ8x0rb6vAYCqn5jSzvv9W2mJhSvH8cQvap5apI0LU/A?=
 =?us-ascii?Q?kuZ4wID4BihvV/gFUXA2ZQqt9Trs8vOaEEwYuns1E2tnot0hw0huNuK/QEi2?=
 =?us-ascii?Q?xdnYqpVDGZc5PTIRNf/f6Gsv7F+aem874RudEmD+sJxQVULlBfzK/NdKZA3m?=
 =?us-ascii?Q?tBZm6keUDw1SaaRUAXlS25jpsP9U9gQRrgf2n++CQmU4rUiMMJZ0lb2SLn3/?=
 =?us-ascii?Q?XhKgV4h9lkYdZhZQw31qPpdfJcAmtFovC7rHXBSs5iXi1LBw16U2XJq23puW?=
 =?us-ascii?Q?XbAaMwX6M9RdxkJIEZJoVLV8pBPlKU+HhpWrLexC/19d6ZcGM9PfZd06Pubf?=
 =?us-ascii?Q?bkozHcDPPfC725us5unIAynA2cCkMMm0Pu45DXxrliBRC81EG+G5A3EF0mQZ?=
 =?us-ascii?Q?AEVm+/BwL//bGeAUJ76bmMVayTW4MKcipjNbH+OOtex+7EIz29nRPqedViaq?=
 =?us-ascii?Q?KMOF7Q+dwBTZivqhQXQy+ze93P1JCzWxEn7cj6+vKFXL/YrK49RpkhTgNMuI?=
 =?us-ascii?Q?+QRFFb8FuP5L49vbNuDyQQj5kr6z8UTicjG++4OxhglDNvOXRd2iHNlSDpOF?=
 =?us-ascii?Q?I+yMQOx2YTs1WCvsGEZctXrx84WJNFSfG+CR+VrDxUWfBskYpK/fGy44Whg/?=
 =?us-ascii?Q?mvn9nRNgnujAe8Hf/jynQ+yNW1p3Fv1+ImACv8yByhJFYiyn2fP2Fnqw/euM?=
 =?us-ascii?Q?KWVC01hpSTb7E+81QTTyDOWE3ThfOFZMSJE+AGcdbKwIscP71yLpUzpS9yu+?=
 =?us-ascii?Q?rozH/vD9cAY3TwZJUFBJAm4xeBgMaY048zpxo57epm7ql2tr2COD5z2PYPFl?=
 =?us-ascii?Q?JvbeoYzlDObFpdLZQuJ2GTV7VhNK2pBIBLX+AaVuPk5WGtc7fi1FN9RJIDSM?=
 =?us-ascii?Q?qJpc7AFgeL91n80RnZvmJ8HyIydwTcthk82d6gGHy98G8oxk1Od6BMIw6aqE?=
 =?us-ascii?Q?oUz4XrcpYi+7B7FyotZ5q96h3watEuM5bcIg3C9AdeXEJ+trMTGs+6YAbM2f?=
 =?us-ascii?Q?xakyd+IBDB7Lsoj/55SHziY9yR4XuTzoidfgQvvYtB0r85mruyjULk+gJtCc?=
 =?us-ascii?Q?/3Pvlk8HRqVf8yagTCSmReSc02OgtxqJMdZfpeV7RjYXHPTMmN7u5L5DZ4vU?=
 =?us-ascii?Q?qWrMhPwfeih62/4rs6rPR5TBJjdVU5GsiDL5uqDIsc3/u/CNEWk+G058YAhS?=
 =?us-ascii?Q?asJYYthIvvwFFsBtN0hQ/arNO2EC6WhOgisOaNuJRMEBS/6l4q+zb61Jp0yH?=
 =?us-ascii?Q?b5wJhdZStRSXhiNuBrn5ZN+u0aBIGF6rb+2TKZtpH3MjmLRoGE2DkxIxUuog?=
 =?us-ascii?Q?zsUgoCJc3Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b98cd74-85fe-4957-ead2-08da33d534ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2022 05:06:43.0832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jfByl2ACezl9UPOx0ug/Q+kKn9nk87bvjojkA+OkSrYYoy4kq4e8bznO/kbRTD4dkyldiF9ib/+U4jABPgoNLUna4OOD/e5MhKomvfrNiGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6542
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
> Sent: Thursday, May 12, 2022 12:48 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> Subject: Re: [PATCH] usb: gadget: make f_loopback/f_sourcesink standalone
>=20
> On Thu, May 12, 2022 at 04:20:32AM +0000, Linyu Yuan (QUIC) wrote:
> > > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Sent: Thursday, May 12, 2022 12:10 PM
> > > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> > > Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> > > Subject: Re: [PATCH] usb: gadget: make f_loopback/f_sourcesink
> standalone
> > >
> > > On Thu, May 12, 2022 at 10:21:34AM +0800, Linyu Yuan wrote:
> > > > First remove lb_modinit() and lb_modexit() call from f_sourcesink a=
s
> both
> > > > function belong to f_loopback.c, also there is no need to export
> > > > disable_endpoints() from f_sourcesink, change it to static type.
> > > >
> > > > After first step, we can use DECLARE_USB_FUNCTION_INIT() macro in
> > > > f_sourcesink to create module init/exit function implicit as it onl=
y
> > > > register/unregister one usb function driver.
> > > >
> > > > In f_loopback disable_loopback() function, just add two
> usb_ep_disable()
> > > > call, it will safe to remove original disable_endpoints() call
> > > > which belong to f_sourcesink, and it also safe to use macro
> > > > DECLARE_USB_FUNCTION_INIT() for module init/exit purpose.
> > > >
> > > > Now it is safe to remove function prototype of lb_modinit(),
> > > > lb_modexit() and disable_endpoints() from g_zero.h.
> > > >
> > > > Change Makefile to build f_loopback/f_sourcesink as standalone
> module.
> > >
> > > This describes a lot of what you are doing, but not why you want to d=
o
> > > any of this.
> > >
> > > Please read the kernel documentation for how to write a good kernel
> > > changelog, as-is, I do not understand why this change should be accep=
ted
> > > at all.
> >
> > Can you share more about it ? is it description reason or code change i=
tself  ?
>=20
> Here's the relevant text from my patch bot, which I should have
> triggered for this submission, that explains it a lot better:
>=20
> -----------
>=20
> - You did not specify a description of why the patch is needed, or
>   possibly, any description at all, in the email body.  Please read the
>   section entitled "The canonical patch format" in the kernel file,
>   Documentation/SubmittingPatches for what is needed in order to
>   properly describe the change.
>=20
> - You did not write a descriptive Subject: for the patch, allowing Greg,
>   and everyone else, to know what this patch is all about.  Please read
>   the section entitled "The canonical patch format" in the kernel file,
>   Documentation/SubmittingPatches for what a proper Subject: line should
>   look like.
>=20
> ---------------
>=20
> Does that help?

Got it,

Or not I think I made some cray thing that you said
"I do not understand why this change should be accepted at all"

>=20
> greg k-h
