Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E13750B398
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 11:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445843AbiDVJEm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 05:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445858AbiDVJEU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 05:04:20 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.140.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 094FE53B7C
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 02:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1650618076; x=1651222876;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XO7KCdINv/kMbzoQQxr4La9GwxGVRGIL3wl6qMhMZ54=;
  b=qny83Fkc2Pvbg+SKZpFpoTuOw2Vqma+2Hz7KBHAcD+Gi4C8FcO1lMJwY
   qeSBw9Z1q0GHhviodHtfxjxn/Z53NfXE1dla4r+NtOdVu4aYnUBo0Zy4X
   hGXjlc4dFkQpk9R5nlcVkjwG2ExA483fxneTSRqHjs//SlN1X2pTXkGSN
   g=;
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2022 09:01:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aICupgujWQmjZ+6TPoNq5BTBqBK7h4f1XHy1xNoee4J1Hi+STtNt+HU6YNWuZ5ewi+1qzm8sdTWy7qhzCNWXpWJfFUpQjYrRbRnnNVHEDI6T99yJPUcGqemEqOaJayjn7Yw2CjZDCxEm0HqdJnvTmMIxk+in60tOdvreRyc0I4OQgK5Qwo8q2w9RYZes2STWRfnWwQrKo3fNfx1LA6OEr09O7xqrKHhEe1XrlMv/F5JgcZEs+Q0Lzpyh9vuHAqC1TeXIPK60haHK2vUztQWeaZ5li+xZBxgZJyppkT8QIh+OvcrjjChsbHg+ULrDf7FPn+aimr2aPOrm/7pU0GTg9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XO7KCdINv/kMbzoQQxr4La9GwxGVRGIL3wl6qMhMZ54=;
 b=N2JdbRWuTY7p5J+DLMdXv7S6ClME+tOubFNNQ19qQoi0JkuucuQJuvarMIc5RJQs5z+0UuUiAuyayBSpUdUSf5CHkcQELB6ehdGlemNJ/nrMChVWyN2bcPLQk6d2yOCDFGCehzudNkrcpm84D6bdNc2jT2DaISfniJ1HhIN2jt4e1sTUc9HvAgJ78ZMDbndhgWhihqmkQsMUfojEmpyshvF1urSUv2NHE3omq6+dMH064Bd+l9GVKi7pgH2U2TDm7qBVJAzfnr13DOq2LIXu1Du6SEO1V9JfDWiTsN+lKMWP4KBlHbZw3KzNtJ8uiAXZby6kP//El+8fTHWRNclAWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 BL3PR02MB8083.namprd02.prod.outlook.com (2603:10b6:208:35c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14; Fri, 22 Apr 2022 09:01:13 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad%5]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 09:01:13 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: RE: [PATCH v6 0/5] usb: gadget: configfs: new trace events
Thread-Topic: [PATCH v6 0/5] usb: gadget: configfs: new trace events
Thread-Index: AQHYSh6zKbuIXYzOWUGz2E/+TjoP7az8KvOA//+NvYA=
Date:   Fri, 22 Apr 2022 09:01:13 +0000
Message-ID: <DM8PR02MB81988A02C692B0760A73AF23E3F79@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1649294865-4388-1-git-send-email-quic_linyyuan@quicinc.com>
 <YmJqfzmz5N0I3n87@kroah.com>
In-Reply-To: <YmJqfzmz5N0I3n87@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc24d34d-c2c4-4861-e2a4-08da243ea72c
x-ms-traffictypediagnostic: BL3PR02MB8083:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BL3PR02MB80836BF688765BC99FE43F339FF79@BL3PR02MB8083.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F/WIuwdsAORMieojJBOV8pAG0ggY512AnjcEPb6M9MVcyk1k/fHCs9VMx3U5qahbqNHMzaWkHyDpusYJiP7mvLouuxl2FK2an3FkAocJqT2w0jrOR+8FGmP8u/fzAZxTDPKsa48zt+yFtT1Z/Pryfht3LvOhMqVD9smy0h1C8sL1QcKCF+jf7tgtPQycqulIObE/84p/VICe3eUKRtWbXb6cKyMVq33Bd18JSGCYYWOZImLJYxvjU+PcjCvkjFd1tyyHUaAPAH0GEEUNdJQAONSoliLam5uiB0mfznktcA3B1jWWWs5Md97kxifi07nAYxcFHfjzdMXLu4suNP2MvM+q3Rbas0yWPrjGHfIXhN8EKDSF0F0TPOflKguIwEGbG6xzwoVTmkVQh94G6koKhoGbbDLOiQ/KGbYpB8EHC/OJb1a/L5m5VimBzVaFtnX/LFSsJ1v57eRtliOnHpvbG3W715SU/rYanjZPJJJxdGXEMNfyfw5Ru7ZSiiEux/a8fk0/KdQ6DinoLcWOWA+bPZEjKobjdI+F5dvLokNlgSiMhYXN/02RgCyO6YfB7eu+E7qP4zPQqjBfqAjQf41Du4vnrSssHBSTiJylgRIs6ZLx5/bbwDSj4KWRiiJLejYgZZ2eeRof9Kdr3gHKg1gY85thjJXIEOTzu+XhefVm0rhMLaAtfVDyEkrwVmBXkpksTwtbkRCKjq3YxN+EJad1nA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(107886003)(4326008)(5660300002)(186003)(53546011)(8676002)(33656002)(2906002)(26005)(9686003)(7696005)(6506007)(8936002)(55016003)(52536014)(122000001)(86362001)(508600001)(38070700005)(38100700002)(64756008)(66446008)(76116006)(66476007)(66946007)(66556008)(71200400001)(19627235002)(110136005)(54906003)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?a4R8O9+TJ1iXFkwkDvsxD9hrDg5dk4jHoroPgQi6VZRq5bpH1Mpxdi/1cGR7?=
 =?us-ascii?Q?MEZ0ZLPaGcqD+AVXvMfUI+v/W47KVkXqBRq0X1UsCJRJkysInE6fIHB+KFfB?=
 =?us-ascii?Q?50xPJpHCGrq+2iFwNdfXtzAZcRid2E/Vo6f6sqNYraMqtWQ/9By/bIQslDuo?=
 =?us-ascii?Q?FaBvlXakHMR7cZUxhQ2o419DpCvGqRVuUHmcJ6p1W/dghjUXyfOoNxWYB7Ne?=
 =?us-ascii?Q?L9vwh2NolEft5nNJ4i/mw5f1d3KXUG3A6BP3jVMAyn147vLbjNDY2/ZV5rlj?=
 =?us-ascii?Q?0oWoEir0Z0skANgqU4eNmzTfDYWioSvbOMlMyDDc9DFM3eaDpcKARYNzN731?=
 =?us-ascii?Q?7cfT5PWfvSutyAv9SVr2WUYbFfr92ybz0G7jD2YJ6ybmohf8BKPH8PKvsHCL?=
 =?us-ascii?Q?M9NOecTfpQjK+n8kHQH6+CtFTE4yhfDCkWetsJPlXVe94VPrmVK1HYP1s8F4?=
 =?us-ascii?Q?lU8KnBdfLE4AJR+Y/xxZajNzfTvHfgaEQu5XvwAswJ8efFrH2OjNv3bVcJst?=
 =?us-ascii?Q?blvImMym1UdrbT8eFBKTdnFlWg0SD0n+tNwhwxQ9iliIp4U5UmxNZ/Fjn8gO?=
 =?us-ascii?Q?Tg/S58Do0oG4OB4Fqcbu3Rz10aXvletOpwGjtCq5glx+4EyIOxoWaNWaizzB?=
 =?us-ascii?Q?4E3SwwMfm8+CjQNFm7+I/6qBES759ZKi0ZBwPxGtQDIZCeTSZZNqLH0f9f/e?=
 =?us-ascii?Q?0rk4zIKjYxRmmpfZRrg5UIETV1piggFcG5HLcMFQ0GD10OrL3OVPHYZEf0Oc?=
 =?us-ascii?Q?s01MrkKsadVIHOflFEu34tzJI5fYYDSdGtCCblG/tPIJeTtvRuxPR/zdvhLr?=
 =?us-ascii?Q?aNzPjVj6GtykbZSOI9pLP+nXLMoa8nylWcDM8C1ua8gBt49RgzJBngFjY0yz?=
 =?us-ascii?Q?47EXJPBW2F4dPGhqwlVjmgBe6Ykeymxn5J2v7flEzY+ALwIQqJDrwgu9SZZd?=
 =?us-ascii?Q?3hipjikb9vm8+HH9vGqXqUDkPgxRmmoUyfg/UF+IgYG1zD7Nm4VuVm/GFUgP?=
 =?us-ascii?Q?XqdVuZKcHy9ppEtMPg0gPk4ZqaPx18OWaBeSvgTjL22KWnco2wrg7C+dD0eO?=
 =?us-ascii?Q?qR8WdiXnH00WXU5Pk+oU5Xh6W9Jrp1O57yFT0Uw7Lrl0KJwN6Is1AV2WYh6i?=
 =?us-ascii?Q?6quKVAMBO0nnp6D4wmqpfEmDZXbi0zbrt06bMEYa2yjyr9OewFRK7B4DN9U9?=
 =?us-ascii?Q?K6vZGR5ozXSgIHBtouc/Pi90DMskAJfTjGqPem8sFPOVMY1J9hU5VUybdZhD?=
 =?us-ascii?Q?3FINwVIJ4aJqW2jxFWaAGWqllzVYPxF+BTjxQhIgyPr9oyoC6xyFwRk0dAwX?=
 =?us-ascii?Q?UWQ8LhKUkmWIlflzboNY/SdUlHVrIBpE0pPOukhEsXaI7dGbfG987z748R97?=
 =?us-ascii?Q?DihOe54Y7LVdagd4rB6HhQl2f6mVrWiWdMxzGP5B6KV6pVBi4ZOXcu1/KsZv?=
 =?us-ascii?Q?6eNzmwHqfIosZ9l0b7m5aJ5XPymlPVx9nPE82StbtqfA27NOoNdY0xqfDpOP?=
 =?us-ascii?Q?xISo2CDPZwQbJ2lEEZoOkpZi6FGqTRCHknQ34iQXq0H4MkM2SbdEDkzaq90K?=
 =?us-ascii?Q?5HHBhJSl2Mbzs5vHCidgx3ekir9gxRz7+giQcKjGT7155AWedcUW5gsW27ql?=
 =?us-ascii?Q?DkELkdYimm1Zj/0M/fS6b0LYSzrccyj2WHOSZFr3KFTQycbrT2vg8pDL/S8D?=
 =?us-ascii?Q?XonJUXQTfDj6DYw+/eChSVa8zd0r6GvBQXXgP4kam59ymNrsJqZL+5tAQzq7?=
 =?us-ascii?Q?CKZB1ltUEQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc24d34d-c2c4-4861-e2a4-08da243ea72c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 09:01:13.7342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sAqBcf6O9xrAkh4u+WUMbgSXxtB+gnde4TaQOF6e2PNrI6vT8fXlxkPS9sAhzVjQaFUqreP2I+Se01B/Swq5DQWoX5qYDEPT6WWEyDlNIls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8083
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Friday, April 22, 2022 4:43 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org; Jack Pham
> (QUIC) <quic_jackp@quicinc.com>
> Subject: Re: [PATCH v6 0/5] usb: gadget: configfs: new trace events
>=20
> On Thu, Apr 07, 2022 at 09:27:40AM +0800, Linyu Yuan wrote:
> > Last year I try to add trace event support for usb gadget configfs [1],
> > this time the idea is change a lot, the purpose is trace all user space
> > operation to gadget configuration, include gadget and it's function.
>=20
> But why?  Who will use this, and what for?

Thanks for review it.
It is not used by user space, just for kernel gadget issue debugging.
Like android, the user space is complicate to kernel developers,
With this trace events, kernel development will understand
What is simplified action happen from user space.

>=20
> > In usb gadget configfs, mainly user can do mkdir/rmdir a group,
> > link/unlink a function, change gadget/function attributes,
> > each operation will touch a struct config_item.
>=20
> As userspace is the thing doing this, why do you need to tell userspace
> again that this happened?
>=20
> > It only have one trace event entry which store string,
> > provide several API which represent user operation and generate string
> > from  struct config_item.
> >
> > example output,
> >    mkdir-80      [000] .....    44.555106: gadget_configfs: mkdir dummy
> >       sh-76      [000] .....    44.562609: gadget_configfs: echo dummy/=
idVendor
> 0x05C6
> >
> >    mkdir-81      [000] .....    44.569795: gadget_configfs: mkdir
> dummy/functions/eem.0
> >       sh-76      [000] .....    44.600221: gadget_configfs: echo
> dummy/functions/eem.0/dev_addr 1e:77:46:4b:1e:96
> >
> >    mkdir-82      [000] .....    44.615542: gadget_configfs: mkdir
> dummy/configs/dummy.1
> >       ln-83      [000] .....    44.628997: gadget_configfs: link
> dummy/configs/dummy.1 dummy/functions/eem.0
> >       sh-76      [000] .....    44.634506: gadget_configfs: echo
> dummy/configs/dummy.1/MaxPower 500
> >
> >    mkdir-84      [000] .....    44.642265: gadget_configfs: mkdir
> dummy/configs/dummy.1/strings/0x409
> >       sh-76      [000] .....    44.663886: gadget_configfs: echo
> dummy/configs/dummy.1/strings/0x409/configuration dummy
> >
> >    rmdir-85      [000] .....    64.255507: gadget_configfs: rmdir
> dummy/configs/dummy.1/strings/0x409
> >       rm-86      [000] .....    64.263926: gadget_configfs: unlink
> dummy/configs/dummy.1 dummy/functions/eem.0
> >    rmdir-87      [000] .....    64.279768: gadget_configfs: rmdir
> dummy/configs/dummy.1
> >    rmdir-88      [000] .....    64.328124: gadget_configfs: rmdir
> dummy/functions/eem.0
> >    rmdir-89      [000] .....    64.992085: gadget_configfs: rmdir dummy
>=20
> As I said in other places, why not just add this to configfs directly
> instead of all over the individual users of this one subsystem?
>=20
> And again, why?

I consider it also, but I found most of fs have no such trace event support=
.
I will try that.

Thanks very much again.

>=20
> thanks,
>=20
> greg k-h
