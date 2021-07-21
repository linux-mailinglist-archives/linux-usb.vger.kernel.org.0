Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8CC33D0AC2
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 10:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236533AbhGUHwn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 03:52:43 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238]:13020 "EHLO
        mx0a-0064b401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232802AbhGUHrx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 03:47:53 -0400
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
        by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16L8GU1d032614;
        Wed, 21 Jul 2021 01:28:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=E/oev8bDm3F4LflAYknFmWxL7TN2OJqkNa/TA/zm/fM=;
 b=nqLQgN1Aj00CL2TEBWAvq0wOLuHtonXreRYusqCBsoQbjpSuxD8Zs7m5n2r58FZTBgDd
 mScZkRJshAOHHnIPRtYFYaYCjwb7UESkdqIMo0U5eirk5PFd9tTiAJOtVSFKl6JXslrX
 dXo0by8DfmMwPyqxbBkg+nAIHiw0gEuGOc6VsmqhMSkLBEOKmqHj3pAtTLmjpRar/p4p
 3IagwZgIqz/x7LiQjxR9XNWvr/hKmsDyEjkVBLLWKRHZI3sxdj1mvNUqVpK2hvRxtCsX
 HqsDT5CD3UTnXRQHS977hX6eu9Cr4MD+gbUyBzeJ467YtAXBpKJQk0qbLCOJS0SNSph7 RQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
        by mx0a-0064b401.pphosted.com with ESMTP id 39xb1h85hp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 21 Jul 2021 01:28:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCiMyTu2a9BtKmegbuuEGKsoc2Oe3VVzIywqEx+p0JAeph7YRmegXn7BkjkGRlGCA9/gq6238cvhz9e2dkp/cne2al9SKDsI8sx3NEbzDnPCu2tRi3HM94tHcTh3g01rKOSF4o0babGgg5+LfrN202YQ/EXCRay2u8wnmzsRF+lr3TAaB6IRJZINA1ee/K/52qg2XLh+Wzs20MhsKDR4sks0D5DQmUR2DHebRiGdwutiaZ0vkPkl9sBtF6OCt13iL+vboQzWcSehbM0hK92VyX1XNQbveAjUzBqiuBwZSzTs84XI3u9M1u4MXxyX3qMrY5O5dJQkASuMRR3dfUqqlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/oev8bDm3F4LflAYknFmWxL7TN2OJqkNa/TA/zm/fM=;
 b=DzhmYM7oZKP2B+RclrdoDeSQbI/WfPU9xxpbIDfFzy6xmuvvY9iNQUoBgy7sP5QRy4BGhjep6OhxtoxrG4oFgOriEVWaPBLzZ+eAXM0qi4rk7ysCMQ3qXifdNNo+de0aJqY9A7O0XWtNoGnIghPNLbc1+w3smMhV9+KGpCgdH9B9ZjXWNMZ3CVAMik/eZwnbc7hjAxQx+SmiY4oWnC7fZjXtkvE+9uT2dLYGYgosWKR0YZ+1V4zD+Z21oc8to2HXTBBeKgvoL95KQIWbTfqYrEVqix6JxEgyeRnnxuAzw6egrgqg/SGy8p4sGTD+fjiG49b4nT7HDPlMOtMsg37jaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL1PR11MB5478.namprd11.prod.outlook.com (2603:10b6:208:31d::12)
 by BL0PR11MB3059.namprd11.prod.outlook.com (2603:10b6:208:30::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Wed, 21 Jul
 2021 08:28:11 +0000
Received: from BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b]) by BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b%9]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 08:28:11 +0000
From:   "Zhang, Qiang" <Qiang.Zhang@windriver.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "dvyukov@google.com" <dvyukov@google.com>,
        "paulmck@kernel.org" <paulmck@kernel.org>,
        "dpenkler@gmail.com" <dpenkler@gmail.com>,
        "guido.kiener@rohde-schwarz.com" <guido.kiener@rohde-schwarz.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: usbtmc: Fix RCU stall warning
Thread-Topic: [PATCH] USB: usbtmc: Fix RCU stall warning
Thread-Index: AQHXbJdxsEWtRMwgSkWpoKhE+HBk+6tNJVQAgAAD1hSAAAh0gIAACHde
Date:   Wed, 21 Jul 2021 08:28:11 +0000
Message-ID: <BL1PR11MB5478E420DE1264BA326A0328FFE39@BL1PR11MB5478.namprd11.prod.outlook.com>
References: <20210629033236.7107-1-qiang.zhang@windriver.com>
 <YPfIAolSC8mJoQUr@kroah.com>
 <BL1PR11MB54783C940009B4DE9CC61DD2FFE39@BL1PR11MB5478.namprd11.prod.outlook.com>,<YPfSURndBJSjEAJL@kroah.com>
In-Reply-To: <YPfSURndBJSjEAJL@kroah.com>
Accept-Language: en-001, zh-CN, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4df86d13-5e5d-4cc4-ddd7-08d94c2179fe
x-ms-traffictypediagnostic: BL0PR11MB3059:
x-microsoft-antispam-prvs: <BL0PR11MB3059978E52A620BCE9B5D160FFE39@BL0PR11MB3059.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qfaf0HrVXnIAawLopfPp5i9SyCUpsR3DEs/Gl/9QkBDx2/eTgQ45z7ZXSDpXzRBe434a5PdKFsBa3eTuijtVot4NNhhXNWXDJP5BwGGH7HHfPzxlMroAzT7E5DICOH2B3nqHoSML6YExU/EmfIkLGXNYkeQMdgQ8siy187rVHvKsLFvMvfji8TDbqxJFe6os6JF+UV8euQyUP7r51aRuu623Kox2eXrNBIFvLncvA5vPv1EWNwEBc8ZD2zRebbAkxz8im+DnoSKX2hR/YDfdYv9aVfUv3XU2pNM0N5UnTsw2GbM8eIbKfZnNN03ClnHW187RdbaprwVxdq5gguPnZKmzPk/kZQKqkc5s1cdV2sXCfYHL9laiQhgJ8f2VwoEOw241uCfZaSsSCi3ZKtxtsDB0e9J7yO5bjDI8nZEp8FHyHRK/625xSisCUQZeFjcUBJeq4d2lPN9GHL4r404ZOSatk8PpkoaBC+od8U30JG8XgHxXoITIKp01I+XYIS5C0w4Bqy/ng4L7fvAJDxh+nlhPAF4mY0ZgJqsEQlilBhs5pUb9K1vby7ouXI/s1WtoGcw8sFuI9e8+z3qZ20qp80WWZnPrEjTJ3sVqJNl+S13C7r/3FQL3yVRx9lYOvWrek31/PsWs8bBV/bx/7MxNHR84s2ReoK9oeJvD4/W24YlW305a3K2mfa0T4ReabpbFHpOfjDNuYIzarWwIkg9efuk4/6oYEvAfScLs0QwFwAIf85upyZO+tKZCpAA8YViH/oWcaCE6nQh5GUtD/wtLRdMa9lgIfD0rU690/m/HWRNpbQUkiNT1PpE4byEN79A/PjrfgrCEutUY28OAMW4coFTB4wvo5t48ePBFRr64GO43apYwsZQSwiI/7A1H73TT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5478.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(366004)(39850400004)(346002)(6506007)(966005)(38100700002)(316002)(83380400001)(5660300002)(53546011)(33656002)(26005)(186003)(55016002)(8936002)(66476007)(8676002)(76116006)(91956017)(66556008)(64756008)(66946007)(6916009)(2906002)(7696005)(52536014)(54906003)(4326008)(66446008)(478600001)(71200400001)(9686003)(86362001)(122000001)(586874002)(99710200001)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1FOa9IXLGiraSotF99tYHE26iLbkqCJkwMe4iWDxorJltLqIOETI17pODRfu?=
 =?us-ascii?Q?MWjEnYqDPNmA1twJMfke3A8W+H0bibBGzOP9jd2FNYGg/WzK4lKDIXfqg8BD?=
 =?us-ascii?Q?hpevuqM+uo8Ge/S3hncgvXLdSJmpRNhcV1tJXdvB5DYz9ay9txNM9MuTwkKC?=
 =?us-ascii?Q?Cvr2CSpQ1lUeKgyuIfkyiVM1ZgntErIZCN9MltU138acqWCsw1Tw+J+z+Pca?=
 =?us-ascii?Q?zkB1xDCv4OEkT+XXebv+viLb1FogxiwBoSxtHiN+6sD9sE0DK5lhh6kSQJcS?=
 =?us-ascii?Q?OCjsp8lvM4Cjz5qvNzUkWb6pI+BfPWlE0+z9y5ILn0uzZGRQiHfW6Dqfb/yy?=
 =?us-ascii?Q?vL9CWOVVtCSJGScCAH8PSo7k6eE9c8qd0VB5k0BSR4BOZwriMldczEt1sNqb?=
 =?us-ascii?Q?r/OSM2iRWwdiSoiIkoNw2vXwEm5zsnHu9LvGU5VQujbmWHpdFKfGNEcjD4n3?=
 =?us-ascii?Q?c8WsLEw7dsL4zh3RHnnQfn6GruVubQr+DRePtd2kbaRdJN5xt16MjuNdUhlv?=
 =?us-ascii?Q?ml2Rr5QJ6T3gGWwOnhvkXZvPYgTD1azJms7HhDMlbRJjkQ4sL/ZTMXX9YFkH?=
 =?us-ascii?Q?/kldGUi2ZfcryvCxIWffKAaLVAlXxz5/dYhFY2XWojTu6SjZnxDYDrPSdEnd?=
 =?us-ascii?Q?hYw6ONHG0P9Ne8gA2TrnqpgcPIVbmeyebPmmxcjxyarehL1PqrqDznnxxaJh?=
 =?us-ascii?Q?qPzDOQXz4hss8p0W9oVBVsQyUsY1q21SlG5wOjdNHxRFIgOntyQvOBNPC/7p?=
 =?us-ascii?Q?FUMFlv9heVkKHUV+rfleW2LoQ15rBMPF3NobQ8vuhDUGsA/Q52LaQGzyrbDF?=
 =?us-ascii?Q?/GOplZJIESUPuaaQqOqn8/Ez30NuRDKOJuYjr22QPzO+lz4mJdjGRb7jQHX7?=
 =?us-ascii?Q?iuEgH0mwz2Ym8ok7nYhKLfceuKnJSHg5z7pEHSgZoyfY7LzaRJsRZBOd/odI?=
 =?us-ascii?Q?o12HpOqI+e1qoPLDxWvEVMvVnufObK7AoIZk2M1HyeHkcByafYxyiOCNuRMl?=
 =?us-ascii?Q?w8a9UQ6ymaMrSthb/OzCPnnLv290YJYzlu2MfQpelRfx2vAHYrUTR2XZ5Xgj?=
 =?us-ascii?Q?7cFU/DjnNFsKgkAq8PIH7jIYWhusroAO9ORYhEhWdqN+gZLf7BO079yIuEj7?=
 =?us-ascii?Q?8m4tDO8CJv477GW1SEyJAIIbkZncuuC7MBXLfD7IoEI+JLSRRXk11G1IxMFG?=
 =?us-ascii?Q?z0Nrp4jfKssRZ3Hk/LXtMSi5HQ8BHnXCnb/crBesbeeG35w6W9fVBewFHon1?=
 =?us-ascii?Q?dtDC8MWE8FOl0c0euNWjryvCSv20H8VJd87xPS79+ifWJYT0prFmouPdZ8Py?=
 =?us-ascii?Q?DAE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5478.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df86d13-5e5d-4cc4-ddd7-08d94c2179fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2021 08:28:11.2311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: klc4KYhsMwRHKlf9aBdlyzMoXajmjHcNeDgc+s6ODmjNepWPguXwnsyV8eKyiDAsA23PMfxzeKPrDm1ixIgOsNdk6h2yhDOISQyerVpL1CE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3059
X-Proofpoint-ORIG-GUID: y7ZvQ36jqSXM-1j7NV_k7n-WN7SXLIWS
X-Proofpoint-GUID: y7ZvQ36jqSXM-1j7NV_k7n-WN7SXLIWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-21_04,2021-07-21_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1011 bulkscore=0 suspectscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107210046
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=0A=
=0A=
________________________________________=0A=
From: Greg KH <gregkh@linuxfoundation.org>=0A=
Sent: Wednesday, 21 July 2021 15:52=0A=
To: Zhang, Qiang=0A=
Cc: stern@rowland.harvard.edu; dvyukov@google.com; paulmck@kernel.org; dpen=
kler@gmail.com; guido.kiener@rohde-schwarz.com; linux-usb@vger.kernel.org=
=0A=
Subject: Re: [PATCH] USB: usbtmc: Fix RCU stall warning=0A=
=0A=
[Please note: This e-mail is from an EXTERNAL e-mail address]=0A=
=0A=
On Wed, Jul 21, 2021 at 07:30:39AM +0000, Zhang, Qiang wrote:=0A=
>=0A=
>=0A=
> ________________________________________=0A=
> From: Greg KH <gregkh@linuxfoundation.org>=0A=
> Sent: Wednesday, 21 July 2021 15:08=0A=
> To: Zhang, Qiang=0A=
> Cc: stern@rowland.harvard.edu; dvyukov@google.com; paulmck@kernel.org; dp=
enkler@gmail.com; guido.kiener@rohde-schwarz.com; linux-usb@vger.kernel.org=
=0A=
> Subject: Re: [PATCH] USB: usbtmc: Fix RCU stall warning=0A=
>=0A=
> [Please note: This e-mail is from an EXTERNAL e-mail address]=0A=
>=0A=
> On Tue, Jun 29, 2021 at 11:32:36AM +0800, qiang.zhang@windriver.com wrote=
:=0A=
> > From: Zqiang <qiang.zhang@windriver.com>=0A=
>=0A=
> >I need a "full" name here, and in the signed-off-by line please.=0A=
>=0A=
> >=0A=
> > rcu: INFO: rcu_preempt self-detected stall on CPU=0A=
> > rcu:    1-...!: (2 ticks this GP) idle=3Dd92/1/0x4000000000000000=0A=
> >         softirq=3D25390/25392 fqs=3D3=0A=
> >         (t=3D12164 jiffies g=3D31645 q=3D43226)=0A=
> > rcu: rcu_preempt kthread starved for 12162 jiffies! g31645 f0x0=0A=
> >      RCU_GP_WAIT_FQS(5) ->state=3D0x0 ->cpu=3D0=0A=
> > rcu:    Unless rcu_preempt kthread gets sufficient CPU time,=0A=
> >         OOM is now expected behavior.=0A=
> > rcu: RCU grace-period kthread stack dump:=0A=
> > task:rcu_preempt     state:R  running task=0A=
> >=0A=
> > In the case of system use dummy_hcd as usb controller, when the=0A=
> > usbtmc devices is disconnected, in usbtmc_interrupt(), if the urb=0A=
> > status is unknown, the urb will be resubmit, the urb may be insert=0A=
> > to dum_hcd->urbp_list again, this will cause the dummy_timer() not=0A=
> > to exit for a long time, beacause the dummy_timer() be called in=0A=
> > softirq and local_bh is disable, this not only causes the RCU reading=
=0A=
> > critical area to consume too much time but also makes the tasks in=0A=
> > the current CPU runq not run in time, and that triggered RCU stall.=0A=
> >=0A=
> > return directly when find the urb status is not zero to fix it.=0A=
> >=0A=
> > Reported-by: syzbot+e2eae5639e7203360018@syzkaller.appspotmail.com=0A=
> > Signed-off-by: Zqiang <qiang.zhang@windriver.com>=0A=
>=0A=
> >What commit does this fix?  Does it need to go to stable kernels?=0A=
>=0A=
>  I will add fix tags resend,   need to go to stable kernel=0A=
>=0A=
> >=0A=
> >What about the usbtmc maintainers, what do they think about this?=0A=
>=0A=
>  Alan Stern reviewed this change before.=0A=
>=0A=
>I do not see that on this commit :(=0A=
=0A=
=0A=
=0A=
=0A=
Sorry,  I used the wrong words,  Alan Stern made suggestions for my patch.=
=0A=
=0A=
=0A=
The content is as follows :=0A=
=0A=
On Mon, Jun 28, 2021 at 06:38:37AM +0000, Zhang, Qiang wrote:=0A=
>=0A=
>=0A=
> ________________________________________=0A=
> From: Dmitry Vyukov <dvyukov@google.com>=0A=
> Sent: Monday, 19 April 2021 15:27=0A=
> To: syzbot; Greg Kroah-Hartman; guido.kiener@rohde-schwarz.com; dpenkler@=
gmail.com; lee.jones@linaro.org; USB list=0A=
> Cc: bp@alien8.de; dwmw@amazon.co.uk; hpa@zytor.com; linux-kernel@vger.ker=
nel.org; luto@kernel.org; mingo@redhat.com; syzkaller-bugs@googlegroups.com=
; tglx@linutronix.de; x86@kernel.org=0A=
> Subject: Re: [syzbot] INFO: rcu detected stall in tx=0A=
>=0A=
> [Please note: This e-mail is from an EXTERNAL e-mail address]=0A=
>=0A=
> On Mon, Apr 19, 2021 at 9:19 AM syzbot=0A=
> <syzbot+e2eae5639e7203360018@syzkaller.appspotmail.com> wrote:=0A=
> >=0A=
> > Hello,=0A=
> >=0A=
> > syzbot found the following issue on:=0A=
> >=0A=
> > HEAD commit:    50987bec Merge tag 'trace-v5.12-rc7' of git://git.kerne=
l.o..=0A=
> > git tree:       upstream=0A=
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D1065c5fcd00=
000=0A=
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D398c4d0fe6f=
66e68=0A=
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3De2eae5639e720=
3360018=0A=
> >=0A=
> > Unfortunately, I don't have any reproducer for this issue yet.=0A=
> >=0A=
> > IMPORTANT: if you fix the issue, please add the following tag to the co=
mmit:=0A=
> > Reported-by: syzbot+e2eae5639e7203360018@syzkaller.appspotmail.com=0A=
> >=0A=
> > usbtmc 5-1:0.0: unknown status received: -71=0A=
> > usbtmc 3-1:0.0: unknown status received: -71=0A=
> > usbtmc 5-1:0.0: unknown status received: -71=0A=
>=0A=
> >The log shows an infinite stream of these before the stall, so I=0A=
> >assume it's an infinite loop in usbtmc.=0A=
> >+usbtmc maintainers=0A=
> >=0A=
> >[  370.171634][    C0] usbtmc 6-1:0.0: unknown status received: >-71=0A=
> >[  370.177799][    C1] usbtmc 3-1:0.0: unknown status received: >-71=0A=
=0A=
> This seems like a long time in the following cycle,  when the callback fu=
nction usbtmc_interrupt() find unknown status error, it will submit urb aga=
in. the urb may be insert  urbp_list.=0A=
> due to the dummy_timer() be called in bh-disable.=0A=
> This will result in the RCU reading critical area not exiting for a long =
time (note: bh_disable/enable, preempt_disable/enable is regarded as the RC=
U critical reading area ), and prevent rcu_preempt kthread be schedule and =
running.=0A=
=0A=
> Whether to return directly when we find the urb status is unknown error?=
=0A=
=0A=
Yes.=0A=
> diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c=0A=
> index 74d5a9c5238a..39d44339c03f 100644=0A=
> --- a/drivers/usb/class/usbtmc.c=0A=
> +++ b/drivers/usb/class/usbtmc.c=0A=
> @@ -2335,6 +2335,7 @@ static void usbtmc_interrupt(struct urb *urb)=0A=
>                 return;=0A=
>         default:=0A=
>                 dev_err(dev, "unknown status received: %d\n", status);=0A=
> +               return;=0A=
>         }=0A=
>  exit:=0A=
>         rv =3D usb_submit_urb(urb, GFP_ATOMIC);=0A=
This is the right thing to do.  In fact, you should also change the code=0A=
above this.  There's no real need for special handling of the=0A=
-ECONNRESET, -ENOENT, ..., -EPIPE codes, since the driver will do the=0A=
same thing no matter what the code is.=0A=
=0A=
Alan Stern=
