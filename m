Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE0A3D30ED
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jul 2021 02:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbhGVXz4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jul 2021 19:55:56 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238]:26214 "EHLO
        mx0a-0064b401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232730AbhGVXz4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Jul 2021 19:55:56 -0400
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
        by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16N0XZLl017771;
        Thu, 22 Jul 2021 17:36:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=fEensRt1snR3ceGQPjDtQlEa38q2maLarD6i5xM0vQk=;
 b=QYf2oVGnhK5NYfUFyZRTbfpNKONOW8tBT+QVQJwzTJuZyqm2CPcsPuXmU2lJry+L6v4H
 tu9zR/rMgbaxuPFtca8NMXVSeusg2ptY+Yw1LerSDmu9um8u2eFlKxX6mkQCeUeim5lE
 dvjYx2x0Lb33qJq7KxKGqNomRr2vYormXZO3HAMiJhueHJ/isVs7TBbo2S/Yso9DydBr
 SlCF105RvwldoTLOtfo6LIRW0Iq7AgpfLuqZeVaniF35ouFAO9sLlu+zOnHTUIJts65M
 39WKP5Hz4fq1i5j2pmYyJRqM8m2WljNVGLfs4QvqSvUEtbujpVJcRv2G92vdVLY+EctQ lQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
        by mx0a-0064b401.pphosted.com with ESMTP id 39y6kr8mcq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 22 Jul 2021 17:36:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KS67N+jg36qaV897sgCP5dQu1H6qUKTjSV4PR7fUiVkmaxuvm+8k0w2vGSKqaX+r8+6EfuSbqpenheZMjnkJNObwkPQsEMFFL+lSYg1X/tBiLNNPcNZyvHX64mgQINZaflnu0ebbAP9PlHXeD+uPsSPjoEx45UpfzEVDMULkbTqI7Ulwmkcm/OOTDtCfJWU2v4OPKBHWmXYpDjFrmhIepWKu/nvSKYbAEeFjGCyPMIxDNb/vhyr757loI8nqBhszsNyPZ0SwF3bZ+pX0wvbpiqOullreihJW39kvF67S0+dIQdFpSKABLbf9PfnpqluN4vYS1Bz+iS29BLnDyeHFuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEensRt1snR3ceGQPjDtQlEa38q2maLarD6i5xM0vQk=;
 b=N/YgYMzY+NpR7rDgdeTLO21YcJcb43aFE5CER/fR6l4j/iAfL37abVXbfet+6ZtHzbjYYP8ulQlVKhwbK07KvPc5yqGlFqNj+WiTVo/uXtlXxOtJ/nWB+Tg6RTZ4OXAa1ofpHoW60JmlwBUME0hGMCPYSQQiOyMifVy1OpcpWYNQsf2Ah6a25+0ewIhYITyoeqbDcp8MHm9DzxBfchctrJRf037AcKz+6ydB4IKGsaHxx5J5N6AiqOywhS3rfsyNg/2Tv+SCMndb4D7iLq15L8lC4njfjZDhjPpdnkoq38+roBecTKYQU2B5KadstJmXMMOGh3lTcVUS9f1XqJZ0wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL1PR11MB5478.namprd11.prod.outlook.com (2603:10b6:208:31d::12)
 by MN2PR11MB4448.namprd11.prod.outlook.com (2603:10b6:208:193::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Fri, 23 Jul
 2021 00:36:09 +0000
Received: from BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b]) by BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b%8]) with mapi id 15.20.4352.028; Fri, 23 Jul 2021
 00:36:09 +0000
From:   "Zhang, Qiang" <Qiang.Zhang@windriver.com>
To:     Guido Kiener <Guido.Kiener@rohde-schwarz.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        dave penkler <dpenkler@gmail.com>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        "paulmck@kernel.org" <paulmck@kernel.org>,
        USB <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: usbtmc: Fix RCU stall warning
Thread-Topic: [PATCH] USB: usbtmc: Fix RCU stall warning
Thread-Index: Add/H1t4MNXQ8799SV+aKdp8ZJ3RwQAOROBa
Date:   Fri, 23 Jul 2021 00:36:09 +0000
Message-ID: <BL1PR11MB54783815CF0E51446E3979BAFFE59@BL1PR11MB5478.namprd11.prod.outlook.com>
References: <7a4283b5b0b3484e8bc0aa82d75587bf@rohde-schwarz.com>
In-Reply-To: <7a4283b5b0b3484e8bc0aa82d75587bf@rohde-schwarz.com>
Accept-Language: en-001, zh-CN, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rohde-schwarz.com; dkim=none (message not signed)
 header.d=none;rohde-schwarz.com; dmarc=none action=none
 header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a04f546d-b71d-4c5a-44a3-08d94d71ddb6
x-ms-traffictypediagnostic: MN2PR11MB4448:
x-microsoft-antispam-prvs: <MN2PR11MB44480DF18E02D0428BF6EBC8FFE59@MN2PR11MB4448.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X3YuyR1kzp0uFAW9nfrYfxth8ESZMQxuUjApm++tdZA4an9j/v8VdPo42OgjazHvRN5EB5BodaVtgFs/3vzZsaUI8o5jEX6aWOeq0jrYVx4vXKil6siDVvHl5SOzuNsERCPFAWIXavpm1AR+mdsXagDF020wccx79QUrQC/Pwq0wTQZLhEPV+25JKwF8tEC15JTCEONC8A4fdH61Cs30yeSmFt41wBVFo9XAdvlwR5bJKa9Ji67zR3LRtTvj6rIcGbPamFOGCDS0NKXHsU8AldfCr3iYvDk/pTVvgOwAkO+a/XYSNnqWO0gTXOW/YdEcsyyd/WYVjvg2Pn+pM7Jm2c507FYgPwzVp702hBgw9Ar3vZD3sLPFCm8ElYPMcxBaERD9c1+fHtI6eHMnLNwOnh6jhKGTeAqC+EMNh/6MxxpqIiIFvv1JGER6Howw1KCcLY+TmiwOXGQMjH75V6otxXmXDl/fMJkQMm7k6dxOCkgVkVQtonuvpHt8981U6lqLojCO+jP67dsVOQLkjl/IDXmsa3OntXposWAWtY/YYPJhgSkDYpMrh3e5uQNdC0eYWnixfU+CCNXXlZsneSixhKyxVdJmjcqLvqA0FAFiNW2bmQYkSgLR01Bq9TKBfDRfCK2R7PO0keyPiUtZSEFgcwQP1qPEBBDx7KZXYBocpb2GQZM2RClY+OIOe5aAQjQ5bKu2wviKo0iVF9s+egzrbuXbt227YA9PHO5jlJr7VkI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5478.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39850400004)(366004)(66946007)(4326008)(110136005)(316002)(76116006)(66446008)(66556008)(64756008)(66476007)(52536014)(54906003)(8936002)(2906002)(38100700002)(8676002)(122000001)(9686003)(33656002)(83380400001)(86362001)(6506007)(55016002)(71200400001)(478600001)(5660300002)(186003)(91956017)(53546011)(7696005)(586874002)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O99ubCOOqnDu4x4OCy1LwW1NVnGpLE0cQLjSfo8UVSJHRqhzUN3im15KfBFj?=
 =?us-ascii?Q?PElr85q1Qg9wAxNk71lzqpSVixhsJlCro1KkOrgB/qTPq2FPGYkHw72ediLU?=
 =?us-ascii?Q?LR6e73Jz/8chiVJwNvdN2NC0KXXppW2DRbL2+m4pbVJU2wMmG8MZmDGUbqaq?=
 =?us-ascii?Q?gWrNdvMu4jMfCVcvI63IMxQdjBvSLhZVYXk9hQj/jIP2VaoPlqqpvtntXQDW?=
 =?us-ascii?Q?kjErv0hx0uy3eBt0cOO5n7lhAq3sjscOlULpl7OEzYNxFtxNWPUqIgmdh+ep?=
 =?us-ascii?Q?//QQgaXpYNBvxrwA2LGLmJHUFkdqv6D91LAMLE5zkauMuw3qqeZD+6PfUFEZ?=
 =?us-ascii?Q?540tVllrRwaZHvcPI0cR8Hy+urkNV21DS2Xt12l2cHdxso9EFuLNyDvVVbVq?=
 =?us-ascii?Q?Qp2bccbi2/nZwGDrlSbSz0Pxii0RV50KHXN/GmxoM3EjIaz57r3oFnAu+Eg0?=
 =?us-ascii?Q?/C668o7qEIHhSAmOoo6QwcCVzxQiUsm+9MuLfMKhOIoQuzM/MHGFWp85goFQ?=
 =?us-ascii?Q?IQ1xLjGKxKjI27mPU8TNIlX9f10GlS5+WLx1dFB1ZHIbFys3ZSAKnfN6BsTr?=
 =?us-ascii?Q?ziO7q+09DcBHzUPKhksC8L+jseDxqS8tNyPry1ffMeSpcwGhfHVgyRC5pd4J?=
 =?us-ascii?Q?WX3155bpvJDNHTKD20oi/3fJEjOjdc0tAacw6sfhgmzeeNIXsBJLKGNxwrQc?=
 =?us-ascii?Q?UZWnhlDEOLW9chgoJkkQPuK1XuprqzxRANZbI5cQcneuKSP0D8ooRGMI2fEI?=
 =?us-ascii?Q?H4XZifJGlvYG1aITs4yKBKSyZgv9ZaPXkPT9HTWIMEAaGIscf5MtoLdm9Gsn?=
 =?us-ascii?Q?FgvaD6VmRSOQWotTvSDIsdFRaFVgro4E0Vc+QeWMdV2zLt+rtZmtWlr/XOF5?=
 =?us-ascii?Q?3DmEicy03X4l5t0mhaefmrstC7jiEH10hnSl3zg2hljrC1BXwOwYM+PhwKFe?=
 =?us-ascii?Q?6Kv2h1vZ0edYz8A3HtaJ/RglCs22dPT5J/uvXUMyO9PEEuaBJeZpv+oRYX9C?=
 =?us-ascii?Q?iTcdykQR0lEO7hXe+i1k6CV5S5fEa+BsO73PIfk+hksrWzaMV9L2JAp3gJzw?=
 =?us-ascii?Q?hBO+NhAzKjjydZ4BczcRTrP0J1rHYaeeLLt3o5V3MWca0422tX3WhH5jwwym?=
 =?us-ascii?Q?oTTqvu9f/GDDSO5E+O7sBKJqI0fHvqwqXLgpJ2a1I2RYTtXK5g179rIvZe69?=
 =?us-ascii?Q?4rDKm/+MYx7Gy1VevbJYTDHGOckOygNyWh2VHXxFN89KDvyrPOr0Ykz1j5xw?=
 =?us-ascii?Q?2cp0yHiNdxNtyMPgOJgfJ8iN7R/X/3SRToWZHW478YQMA97MIOyH3lwsbWGR?=
 =?us-ascii?Q?rSF3tjEISJMtBmze+HZI5c15Ne0U/TXSDqo+xALt5VeKrTFqjMcKbscq9ZJI?=
 =?us-ascii?Q?M/jaePo=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5478.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a04f546d-b71d-4c5a-44a3-08d94d71ddb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2021 00:36:09.4863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BxP3QSIrbvocmUbYyLrlaEWugHTPHu36ODwGZZLozRTTc339vA6a/x2RJF4xNVWvpjab8VQ9IQgiHNgbaWLJsrPzBrX9Z47CAGs9bUJKhyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4448
X-Proofpoint-GUID: 4TcYs0orLG2a91TZNbiYAPfe0FtcPXpT
X-Proofpoint-ORIG-GUID: 4TcYs0orLG2a91TZNbiYAPfe0FtcPXpT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-22_16,2021-07-22_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107230001
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=0A=
=0A=
________________________________________=0A=
From: Guido Kiener <Guido.Kiener@rohde-schwarz.com>=0A=
Sent: Friday, 23 July 2021 01:33=0A=
To: Greg KH; dave penkler=0A=
Cc: Zhang, Qiang; Alan Stern; Dmitry Vyukov; paulmck@kernel.org; USB=0A=
Subject: Re: [PATCH] USB: usbtmc: Fix RCU stall warning=0A=
=0A=
[Please note: This e-mail is from an EXTERNAL e-mail address]=0A=
=0A=
> From: Greg KH=0A=
> Sent: Wednesday, July 21, 2021 11:48 AM=0A=
> Subject: *EXT* Re: [PATCH] USB: usbtmc: Fix RCU stall warning=0A=
>=0A=
> On Wed, Jul 21, 2021 at 11:44:23AM +0200, dave penkler wrote:=0A=
> > On Wed, 21 Jul 2021 at 09:52, Greg KH <gregkh@linuxfoundation.org> wrot=
e:=0A=
> > >=0A=
> > > On Wed, Jul 21, 2021 at 09:41:15AM +0200, dave penkler wrote:=0A=
> > > > On Wed, 21 Jul 2021 at 09:08, Greg KH <gregkh@linuxfoundation.org>=
=0A=
> wrote:=0A=
> > > > >=0A=
> > > > > On Tue, Jun 29, 2021 at 11:32:36AM +0800, qiang.zhang@windriver.c=
om=0A=
> wrote:=0A=
> > > > > > From: Zqiang <qiang.zhang@windriver.com>=0A=
> > > > >=0A=
> > > > > I need a "full" name here, and in the signed-off-by line please.=
=0A=
> > > > >=0A=
> > > > > >=0A=
> > > > > > rcu: INFO: rcu_preempt self-detected stall on CPU=0A=
> > > > > > rcu:    1-...!: (2 ticks this GP) idle=3Dd92/1/0x40000000000000=
00=0A=
> > > > > >         softirq=3D25390/25392 fqs=3D3=0A=
> > > > > >         (t=3D12164 jiffies g=3D31645 q=3D43226)=0A=
> > > > > > rcu: rcu_preempt kthread starved for 12162 jiffies! g31645 f0x0=
=0A=
> > > > > >      RCU_GP_WAIT_FQS(5) ->state=3D0x0 ->cpu=3D0=0A=
> > > > > > rcu:    Unless rcu_preempt kthread gets sufficient CPU time,=0A=
> > > > > >         OOM is now expected behavior.=0A=
> > > > > > rcu: RCU grace-period kthread stack dump:=0A=
> > > > > > task:rcu_preempt     state:R  running task=0A=
> > > > > >=0A=
> > > > > > In the case of system use dummy_hcd as usb controller, when=0A=
> > > > > > the usbtmc devices is disconnected, in usbtmc_interrupt(), if=
=0A=
> > > > > > the urb status is unknown, the urb will be resubmit, the urb=0A=
> > > > > > may be insert to dum_hcd->urbp_list again, this will cause the=
=0A=
> > > > > > dummy_timer() not to exit for a long time, beacause the=0A=
> > > > > > dummy_timer() be called in softirq and local_bh is disable,=0A=
> > > > > > this not only causes the RCU reading critical area to consume=
=0A=
> > > > > > too much time but also makes the tasks in the current CPU runq =
not run=0A=
> in time, and that triggered RCU stall.=0A=
> > > > > >=0A=
> > > > > > return directly when find the urb status is not zero to fix it.=
=0A=
> > > > > >=0A=
> > > > > > Reported-by:=0A=
> > > > > > syzbot+e2eae5639e7203360018@syzkaller.appspotmail.com=0A=
> > > > > > Signed-off-by: Zqiang <qiang.zhang@windriver.com>=0A=
> > > > >=0A=
> > > > > What commit does this fix?  Does it need to go to stable kernels?=
=0A=
> > > > >=0A=
> > > > > What about the usbtmc maintainers, what do they think about this?=
=0A=
> > > >=0A=
> > > > This patch makes the babbling endpoint retry/recovery code in the=
=0A=
> > > > real world usb host controller drivers redundant and would prevent=
=0A=
> > > > usbtmc applications from benefiting from it.=0A=
> > >=0A=
> > > I do not understand, is this change ok or not?=0A=
> > >=0A=
> > > Why do usbtmc applications need to know if babbling happens or not?=
=0A=
> > >=0A=
> > > confused,=0A=
> > Sorry, the issue this patch is trying to fix occurs because the=0A=
> > current usbtmc driver resubmits the URB when it gets an EPROTO return.=
=0A=
> > The dummy usb host controller driver used in the syzbot tests keeps=0A=
> > returning the resubmitted URB with EPROTO causing a loop that starves=
=0A=
> > RCU. With an actual HCI driver it either recovers or returns an EPIPE.=
=0A=
> > In either case no loop occurs. So for my part as a user and maintainer=
=0A=
> > this patch is not ok.=0A=
>=0A=
> Thanks for the review.=0A=
>=0A=
> Zqiang, can you fix this patch up based on this please?=0A=
>=0A=
> thanks,=0A=
>=0A=
> greg k-h=0A=
=0A=
>Qiang,=0A=
>=0A=
>After discussions with Alan and Dave we think that fixing the >usbtmc driv=
er is the best approach to fix the RCU stall warning.=0A=
>Your first proposal was almost ok, but I think we should use >dev_dbg() in=
stead of dev_err() to avoid printing the EPROTO >errors. See below:=0A=
>=0A=
>Please feel free to add the following text to your patch >description.=0A=
>=0A=
>-Guido=0A=
>=0A=
>=0A=
>The function usbtmc_interrupt() resubmits urbs when the error >status=0A=
>of an urb is -EPROTO. In systems using the dummy_hcd usb >controller=0A=
>this can result in endless interrupt loops when the usbtmc device >is=0A=
>disconnected from the host system.=0A=
>=0A=
>Since host controller drivers already try to recover from >transmission=0A=
>errors, there is no need to resubmit the urb or try other solutions=0A=
>to repair the error situation.=0A=
>=0A=
>In case of errors the INT pipe just stops to wait for further packets.=0A=
>=0A=
>Reviewed-by: Guido Kiener <guido.kiener@rohde-schwarz.com>=0A=
>=0A=
>diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class>/usbtmc.c=0A=
>index 74d5a9c5238a..73f419adce61 100644=0A=
>--- a/drivers/usb/class/usbtmc.c=0A=
>+++ b/drivers/usb/class/usbtmc.c=0A=
>@@ -2324,17 +2324,10 @@ static void usbtmc_interrupt(struct >urb *urb)=0A=
>                dev_err(dev, "overflow with length %d, actual length is >%=
d\n",=0A=
>                        data->iin_wMaxPacketSize, urb->actual_length);=0A=
>                fallthrough;=0A=
>-       case -ECONNRESET:=0A=
>-       case -ENOENT:=0A=
>-       case -ESHUTDOWN:=0A=
>-       case -EILSEQ:=0A=
>-       case -ETIME:=0A=
>-       case -EPIPE:=0A=
>+       default:=0A=
>                /* urb terminated, clean up */=0A=
>                dev_dbg(dev, "urb terminated, status: %d\n", status);=0A=
>                return;=0A=
>-       default:=0A=
>-               dev_err(dev, "unknown status received: %d\n", status);=0A=
>        }=0A=
> exit:=0A=
>        rv =3D usb_submit_urb(urb, GFP_ATOMIC);=0A=
>=0A=
=0A=
Thanks=0A=
=0A=
I will resend v2=0A=
=0A=
Qiang=
