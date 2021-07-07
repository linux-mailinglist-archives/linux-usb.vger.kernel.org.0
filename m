Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 141973BE091
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jul 2021 03:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhGGBcK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Jul 2021 21:32:10 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238]:64814 "EHLO
        mx0a-0064b401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229949AbhGGBcJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Jul 2021 21:32:09 -0400
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
        by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1671T8Es006712;
        Tue, 6 Jul 2021 18:29:15 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
        by mx0a-0064b401.pphosted.com with ESMTP id 39mmkd8j5t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Jul 2021 18:29:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+q30oluSlCVdOiA1w6WtjQM/0a4OjBzGfVsB6CafchvMnSFBAGzVuM9m4d44gs+9VgPf3ZJalmnkGoZmFzZPh4XndETLSUo1QGiaDD/GH6CYGA0X5m3W2SbGXBBdQzQd3mITkxP2NequAjLW4Bailfiv0/eYaYAn/Mn/QEQI6lJavZ2aT6dqALFljLF2kab+DAHfy7kkKlmeo+tDNxJcRbeNiP6VMcrCaWWx6s68SjjcKClBRnMR8B6yNNLeXX44hUkuAX5tS0+/IFBZtp+Xt4toxYZ42CPRC3rSxrYw1qGL7JpRBMzt4f/0A1b8DAWjEBePcZ1GHnxrs6JfdczZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPoZhrF2ccWyd2qV/yjtuT4V/bK08jDnvR6DFq6Ctmc=;
 b=chZ2q87fy+QlKp2AyEYRYQ+h3Qh0hhzDaVEbnt6vHc6g/7TMDvqa6Q3BHxrdlq715DJyUbvTLeCuIjhFN05BQKitm+EpxjE16KXNmE8AU7g3iwM9nyavw4kZm77XmHZKj8kHVSsEWI7jszgB7NVPIaujf22jtnWovpFXuZCZAOV91K/HKgv8aVC9Id8Qh/Cu67iis24RpJ0Oiw3rbMPVHpoYXxSJcglI/s0G6oxG25H4/OYxTrl6Qv0R8wgMdSoD7N4YrHj7emgUBc+UsTwwZgRp+c73H+tQsikNDr0JUb2VDAs4eakY9PJIyu+6xVtZNwksUpw1i3q9Vq6ocsIa+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPoZhrF2ccWyd2qV/yjtuT4V/bK08jDnvR6DFq6Ctmc=;
 b=lMqYUNVXdxXlsLzqtAk+uIY+5CxxQbBUEpvsvi4vHIVyqvp4kSHPvT1RGzUIoWYbP/ZKU4pLq+0QTjXHAevHrGtZRMOqh8NW+Lv+SoIjatVElBdMzwankL4+wzNtt7lC/trsM/sQCU53UmfwY87XqYrBLjqCaEjIXCuJhtWgVEQ=
Received: from BL1PR11MB5478.namprd11.prod.outlook.com (2603:10b6:208:31d::12)
 by MN2PR11MB4381.namprd11.prod.outlook.com (2603:10b6:208:189::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Wed, 7 Jul
 2021 01:29:12 +0000
Received: from BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b]) by BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b%8]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 01:29:12 +0000
From:   "Zhang, Qiang" <Qiang.Zhang@windriver.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "dvyukov@google.com" <dvyukov@google.com>
CC:     "dpenkler@gmail.com" <dpenkler@gmail.com>,
        "guido.kiener@rohde-schwarz.com" <guido.kiener@rohde-schwarz.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: usbtmc: Fix RCU stall warning
Thread-Topic: [PATCH] USB: usbtmc: Fix RCU stall warning
Thread-Index: AQHXbJdxsEWtRMwgSkWpoKhE+HBk+6s2xIs0
Date:   Wed, 7 Jul 2021 01:29:12 +0000
Message-ID: <BL1PR11MB5478A82D5B2B558FAFF4B50FFF1A9@BL1PR11MB5478.namprd11.prod.outlook.com>
References: <20210629033236.7107-1-qiang.zhang@windriver.com>
In-Reply-To: <20210629033236.7107-1-qiang.zhang@windriver.com>
Accept-Language: en-001, zh-CN, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47419b9c-ad8d-4ea2-adf9-08d940e6a01a
x-ms-traffictypediagnostic: MN2PR11MB4381:
x-microsoft-antispam-prvs: <MN2PR11MB43812121EB91A5FC541E9F25FF1A9@MN2PR11MB4381.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wkFChAMt7jsHLdELlpcUS740Wwk1pj0gGuiNPT1At5YODQ30aQXdvEbgZdNAib+DDMeXYYc4Quze1FNRo6LXseLsOMU7/RWmo4UUjL3B1sNgLTlX+97pR8bdNQ4ayyx0ZQUotTkxRNB7ML46/92znSgI3MydRSmGCI5yNIhQnVzGulkxrfFOonKxIYwvXmkoEtjpMrhjsMU91P0KLDv52Pd7mJjkFFJIarto1anYfrD3QxbxoWS2Buf+633gZU3tT1vwXSBtM3uvJVQhdZg4WVMyMuLNGEs30Iiq0JzGvT53lkWvJ2EnA07dkCOuDTmrRZEyuxJBmLWBFW2TpiclmrGQwm2wR9/HtVB1VVnl/UIJ7dna9uQABONh+S/BLtPRjuponWZgr2LZ7SXWNLTpi7XB4vkFKdcK6VyBeRgKbKTjp99uml7icvACs7KupIZp+rj2J1cZbOTnivDs2NJg5DyxuC7vLH2c4qPanZyEwWvTdUTEJvo0J6t8TY5xjmZgF+QwKmkIMEQWIEFAG2qi0Ed79wbTo13Dw5f9fF9WlpQVs087PxN3QPEy3WNlWI5m81XJljBH5G02MjgX22P2isp/ehDVGc8jqJ3IKKSj8L46cg0433HydSTdRsGuJlQ6gkLyUHLEF95hAHOMuqTvRlMtmHUU9vS2qVk2NOUrWrZoymgDXGAxIABgj9BPCDsdR51r/X68qkJ3XP3Mxt3R7g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5478.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(396003)(39850400004)(376002)(4326008)(316002)(33656002)(7696005)(66946007)(66446008)(2906002)(52536014)(478600001)(86362001)(5660300002)(83380400001)(110136005)(8676002)(38100700002)(122000001)(76116006)(26005)(8936002)(53546011)(64756008)(54906003)(91956017)(55016002)(66556008)(186003)(6506007)(9686003)(66476007)(71200400001)(586874002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wgxhBFGtt5pCgCPwVQIxb/AnTFH7yKSE7xYpOFei4C1SbXyQ3Zf719FFvgt+?=
 =?us-ascii?Q?quUuGDhYmznx0MHsVROqh/gM6tD3PMt1mXNTjLAYq4FjlpkMZhhahdTrJnxU?=
 =?us-ascii?Q?othTeh8rYK/qnt8U4CPtJ5JMqMXLLW+K+U7KDmTUPiBv6Di0bjTYhxJiZDNF?=
 =?us-ascii?Q?meb+9AZslGw/gvhKl9UZbLfmRNUwQQ3BYHvpzyLnCSrvRKfBsyc5c5Yg/IJh?=
 =?us-ascii?Q?FOgSEhlumbdy/movWLZ4ldM2umfbfqnogM3SlBf/j06agjNFdRGp/jnI9iLS?=
 =?us-ascii?Q?7KqgC+XqhIxgy1cXYsIKZStg414gNGJ93TVz88ayPKbjgjzLC+LlfSZlVOZd?=
 =?us-ascii?Q?gAeYYFYwzVb4gs7qexJjBTdwq9NvchJxVS8otXtfpQFCZVMpTr2EeY/jbjaA?=
 =?us-ascii?Q?Gi0Ie7vZNXltzvX9Vyh/Rm3ulESnCKNM1z+xj/3etonv+LO9tyWRRRISnaQN?=
 =?us-ascii?Q?BG4LSpdpX8AYAx16yHDGBLDZfW42jH3DsBn/iZQ/22fUju/xDpNz7Ew8Fn+J?=
 =?us-ascii?Q?GaDj0ZKUcj7wQXJGH9p8Qze4hKrPur8fx8AAw/KYvwh/+gye/E2ag0btf1ze?=
 =?us-ascii?Q?y9OrNY/GYpvgm0YVUrTtuLy6ysCykVnhp80XCQLb1RoDPHOVST5wXKwhnqm0?=
 =?us-ascii?Q?kzKcKEfHVjFno/0aoeb+RgzJCoDGiHz3ZG4UI7+d+tJzPc2LMt35/Z5tk6lI?=
 =?us-ascii?Q?IyN2dbD2LvEfAO/LYeuoQyspLiT3NfB5HmlAXjBLK4Yng02/pbEQJeVocRRJ?=
 =?us-ascii?Q?6dWt77Yq3N9rpVr3ZCxknCksSdCWNT3Ty0cxR0eJHkJb76Lm4/HbzaYzYnJ/?=
 =?us-ascii?Q?zgaV+kGalrBa1OpvpjOZ/SmD2f8PppMpa+aEGwC71ptzkI5AzUpRjasPUMhv?=
 =?us-ascii?Q?A7fx6cNzo0KBGEg7WRVKnWnTkhYAfrGK946w3V57dZfdk/MCIEWwR41OgDr9?=
 =?us-ascii?Q?7KhlzVezeGLsZv8XW8s7SRyz5+k1XgwVHi8VnOtyD1cqe6EbT9ld8LzUchzY?=
 =?us-ascii?Q?fjpgiHcq0yq/DSqabgN5L6cNpPVdlVfgFTUFk8zPW125lilbrZZJIu3siFXg?=
 =?us-ascii?Q?wg4tbH3ttAbhn52MmaczZXFvo9oaoYDcNjOic6BRID8/E11VDQnicJn1Yy8i?=
 =?us-ascii?Q?jWOZJ7iLOQCCdcCbsqwflT5sMG/9racCSU1p2ATeW7vjKwGt8bBFlpcewoEY?=
 =?us-ascii?Q?142YOa9kwr6sCU598hiMYytRJlYjpxKYLHNJ9GxaAQz0CDVL3sDujJMUnooH?=
 =?us-ascii?Q?1LjEW2RelZ1j4F1vOCxNcfTLnvrDTGu6oPwG6ioUA70qr7OMJbEIpz8KxpWA?=
 =?us-ascii?Q?BSE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5478.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47419b9c-ad8d-4ea2-adf9-08d940e6a01a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2021 01:29:12.1199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j0zS5xjsFP+Fbs537/7rnRGFsUKwtGCJUJjTD5Z7RLgQjaudq2Pq3oCotmK/8R9IrrecxhRtvi+flKaiZG10Rb3bY/DSz4fxiPNd7jTw4S0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4381
X-Proofpoint-ORIG-GUID: Yby1Dx9UrlUFFKvw53R3QwdUpuFkK48U
X-Proofpoint-GUID: Yby1Dx9UrlUFFKvw53R3QwdUpuFkK48U
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-06_13:2021-07-06,2021-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070005
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=0A=
=0A=
________________________________________=0A=
From: Zhang, Qiang <qiang.zhang@windriver.com>=0A=
Sent: Tuesday, 29 June 2021 11:32=0A=
To: gregkh@linuxfoundation.org; stern@rowland.harvard.edu; dvyukov@google.c=
om=0A=
Cc: paulmck@kernel.org; dpenkler@gmail.com; guido.kiener@rohde-schwarz.com;=
 linux-usb@vger.kernel.org=0A=
=0A=
Hello Greg KH=0A=
=0A=
Have you reviewed this change? =0A=
=0A=
Thanks=0A=
Qiang=0A=
=0A=
>Subject: [PATCH] USB: usbtmc: Fix RCU stall warning=0A=
>=0A=
>From: Zqiang <qiang.zhang@windriver.com>=0A=
>=0A=
>rcu: INFO: rcu_preempt self-detected stall on CPU=0A=
>rcu:    1-...!: (2 ticks this GP) idle=3Dd92/1/0x4000000000000000=0A=
>        softirq=3D25390/25392 fqs=3D3=0A=
>        (t=3D12164 jiffies g=3D31645 q=3D43226)=0A=
>rcu: rcu_preempt kthread starved for 12162 jiffies! g31645 f0x0=0A=
>     RCU_GP_WAIT_FQS(5) ->state=3D0x0 ->cpu=3D0=0A=
>rcu:    Unless rcu_preempt kthread gets sufficient CPU time,=0A=
>        OOM is now expected behavior.=0A=
>rcu: RCU grace-period kthread stack dump:=0A=
>task:rcu_preempt     state:R  running task=0A=
>=0A=
>In the case of system use dummy_hcd as usb controller, when the=0A=
>usbtmc devices is disconnected, in usbtmc_interrupt(), if the urb=0A=
>status is unknown, the urb will be resubmit, the urb may be insert=0A=
>to dum_hcd->urbp_list again, this will cause the dummy_timer() not=0A=
>to exit for a long time, beacause the dummy_timer() be called in=0A=
>softirq and local_bh is disable, this not only causes the RCU reading=0A=
>critical area to consume too much time but also makes the tasks in=0A=
>the current CPU runq not run in time, and that triggered RCU stall.=0A=
>=0A=
>return directly when find the urb status is not zero to fix it.=0A=
>=0A=
>Reported-by: syzbot+e2eae5639e7203360018@syzkaller.appspotmail.com=0A=
>Signed-off-by: Zqiang <qiang.zhang@windriver.com>=0A=
>---=0A=
> drivers/usb/class/usbtmc.c | 12 ++----------=0A=
> 1 file changed, 2 insertions(+), 10 deletions(-)=0A=
>=0A=
>diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c=0A=
>index 74d5a9c5238a..c4e1a88fff78 100644=0A=
>--- a/drivers/usb/class/usbtmc.c=0A=
>+++ b/drivers/usb/class/usbtmc.c=0A=
>@@ -2324,17 +2324,9 @@ static void usbtmc_interrupt(struct urb *urb)=0A=
>                dev_err(dev, "overflow with length %d, actual length is %d=
\n",=0A=
>                        data->iin_wMaxPacketSize, urb->actual_length);=0A=
>                fallthrough;=0A=
>-       case -ECONNRESET:=0A=
>-       case -ENOENT:=0A=
>-       case -ESHUTDOWN:=0A=
>-       case -EILSEQ:=0A=
>-       case -ETIME:=0A=
>-       case -EPIPE:=0A=
>-               /* urb terminated, clean up */=0A=
>-               dev_dbg(dev, "urb terminated, status: %d\n", status);=0A=
>-               return;=0A=
>        default:=0A=
>-               dev_err(dev, "unknown status received: %d\n", status);=0A=
>+               dev_err(dev, "error status received: %d\n", status);=0A=
>+               return;=0A=
>        }=0A=
> exit:=0A=
>        rv =3D usb_submit_urb(urb, GFP_ATOMIC);=0A=
>--=0A=
>2.17.1=0A=
=0A=
