Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66ED63D0B1E
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 11:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237601AbhGUISi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 04:18:38 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238]:62558 "EHLO
        mx0a-0064b401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236692AbhGUHxx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 03:53:53 -0400
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
        by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16L8BGOJ006470;
        Wed, 21 Jul 2021 01:34:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=3Zfg07MgLryQhChGWkB01RjOGtR2e7fZWT2gDvORazE=;
 b=E4Q7qswPVZftrveJGoUULEdlLziDsLKYzjried2vRdmRoMpwvmrcC4iIMQYI15lGwCy0
 Mh79JBP6ASlfRRFT2GyKaj1cyxIUD3iWjNiSnd1VQbivGNqVF/Hga/7upUZeALlgiP1+
 XuUmmRbE1ZDWX6aw4wHdx4HCVDaQW/ITBTnqpaZXmzWyGO1dGZUSK8dMwpDz5KcE8xqD
 FpA1FvqKuWm/Tqd5ZR5gnBI27rYiQx3gxLvHc/TX+aQAvAvmQKMMsiU9f4L/UbnM0+eE
 LcQRoMs4jfbTosdgzCgkrkP83N+/rq14pQRHC8vgyWiTrdmfp99E8EOYYcmAzduM8OAA LQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
        by mx0a-0064b401.pphosted.com with ESMTP id 39x8q1084r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 21 Jul 2021 01:34:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dllUh85pIYTjqZDGvqD08VezLMQpAc+OK2hppRAJx85vVjlXEz1tNRe6zIZAwwPki29Uco02W6QTExCwN9lGbKIm+SNPKK8qwBSixVaa2RBJI9OlDHIFjg088l5f49wSNX0x72flBfFxHP1AZHqVhCRXK2A8U0YxbHVKVqrbFaQnT0R59Hvx7eLKylJusKrBa3cqA3aii06nisjxkFMemr6A8bNfGNi/78ZxCsu4rOaOR54AEukntNLfyBfHxTXZFOpgRktogV0mM82rbwhvXG38cORH1PoQfX+ZFcyWrEC/ZgoZ0srOUNXOCz6LL14jTnRYgV2jjKmTOV5AuvjHUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Zfg07MgLryQhChGWkB01RjOGtR2e7fZWT2gDvORazE=;
 b=kEKVT43je5CVMcgVN0vDnSyaoY4IKTa6oeNdaF+AwJsNO96B/RpvFIeP+eCZL4gG48FpzgLZnG1i7G2DJBZf0N1kJQaVltg5fs4wnosHrU6VBMkvfKKYfa5Av4R1XkZnB5r+wIkKy/RTKamy1iLlS1JxAdoMb4oE5ymHAk7O4cs/nUkohoznfosasJBwBFNOfsdT5/xy/mHXc6BRBTw8XKkW6A2hxubgziXCJopb72c5zX3+YOnBNfO8dZ3idjaPgYj4c5l+ttr2UsufVL7wByS/JYOyoRY1b5qr5J4eZaVs4pCyKOVmA8IqgpbHP3DNauvj1SaLZ6WjJoGDGYEMOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL1PR11MB5478.namprd11.prod.outlook.com (2603:10b6:208:31d::12)
 by MN2PR11MB4536.namprd11.prod.outlook.com (2603:10b6:208:26a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 08:34:15 +0000
Received: from BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b]) by BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b%9]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 08:34:15 +0000
From:   "Zhang, Qiang" <Qiang.Zhang@windriver.com>
To:     dave penkler <dpenkler@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        "paulmck@kernel.org" <paulmck@kernel.org>,
        Guido <guido.kiener@rohde-schwarz.com>,
        USB <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: usbtmc: Fix RCU stall warning
Thread-Topic: [PATCH] USB: usbtmc: Fix RCU stall warning
Thread-Index: AQHXbJdxsEWtRMwgSkWpoKhE+HBk+6tNJVQAgAAJDoCAAA1Xrg==
Date:   Wed, 21 Jul 2021 08:34:15 +0000
Message-ID: <BL1PR11MB5478BAB7736EEB75734896F0FFE39@BL1PR11MB5478.namprd11.prod.outlook.com>
References: <20210629033236.7107-1-qiang.zhang@windriver.com>
 <YPfIAolSC8mJoQUr@kroah.com>,<CAL=kjP0YnzF8sALwH5T5+NpWn3wsuqR+K3GLHDJXLkdO4usyWw@mail.gmail.com>
In-Reply-To: <CAL=kjP0YnzF8sALwH5T5+NpWn3wsuqR+K3GLHDJXLkdO4usyWw@mail.gmail.com>
Accept-Language: en-001, zh-CN, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89e2ee26-f9bb-4223-f5b9-08d94c225330
x-ms-traffictypediagnostic: MN2PR11MB4536:
x-microsoft-antispam-prvs: <MN2PR11MB4536B933D9A95C14993702D2FFE39@MN2PR11MB4536.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0PJdHR+0/hZrfivPMv8hKBcaP8GRq1drYaTOG+Xv/k7RkRkSIMfajAOUX4/JMsIUx63f4+uawa7GivWzW+th+lJVAGsPlRsAAdDWfU92iTHwyaHNUUrVrcrku+4w5Pq/2pCPPKxnwliqfzIETSKmLpufi9uU1jhnoc9iC3wFlgF0g6OUlU3l5iVpqkIQqooUvLCDg/8s3Cx8L+48bopLj4omwsgTADm3bpntltrCATGopsnIx8GoW+QbmAYQOGqZ+jY+Zc2njkAL3kkmlrZCvHIT+lZokFpIZqI5xz7Dz1OoHZcLjn16R/t7teNsbLY0q6axlcE4Ag3DkwvCVrtI4yIaxXndTT5U1Rv68JlM3kzLrQkKRcil9e57xWzDinagVElKXqq0+8d4klc7IR1iHXe/L3qw+LlGHrYKNkfF69kD5KU67Qet6vFXrygvYbDjyCKT1CECK4nyxo4T7tvHDMJhk1O3Rl6HF6Si1D18fzYh1OlDQIPJpGUugPlkckCqn0Qc/BtaSbry7qrlL6H/kMLTVogEdihus1LQYHKiixOF1SVVz2GZBIjHN7x+Q/PxMh343N0YMyoQY+usRKVi3tgQg+kevwpHSSd5Xq4T3jn6e7zZkG4vQl/n2nthpdSsAqQfwnap4LBIibZBeJ2oCa+X4l8mOO9R8fm+dae68ID/hmKjj6DfC6JzszGP+xBRe38Q3K2O6DD52dYOB7t4Z+OkmS+26WWvIqlbzF/hNSG/sjysIgGwyOAMZwuJyvOd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5478.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(39850400004)(376002)(110136005)(64756008)(52536014)(8676002)(8936002)(2906002)(53546011)(6506007)(54906003)(71200400001)(66446008)(66476007)(66556008)(186003)(66946007)(122000001)(38100700002)(4326008)(26005)(7696005)(316002)(83380400001)(91956017)(76116006)(5660300002)(55016002)(86362001)(478600001)(9686003)(33656002)(586874002)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?SHFrUFZ3TjRzenN2VDNPaGhWQnp3S2FmbnpPUDJ0ZUUwaXZ6Q2tTZ0NT?=
 =?iso-2022-jp?B?UUpJL2tjbmhXZnhWeW53TFA4ZC9taW1ySk9KeGtjZ2l4WjMyeC9WakJs?=
 =?iso-2022-jp?B?ZzhoK1Z3R3FIb3FrUWJGd1FJbUZ6WHF0cFdIU3ErMTJGMzZVRWZ0Y3Ju?=
 =?iso-2022-jp?B?Vmo5WnRGc09Bd2FpenNMUGM0dGpRbC9VQnZUM1lrK1ZadGQ5QkF6MGti?=
 =?iso-2022-jp?B?bnJwT1RDaVUwMlVyTWFmRWNtc1F5K0VJSWgyeVZZOStOT3BONTFDTmVC?=
 =?iso-2022-jp?B?Nnd3UEdWYWgzYlQrdnVGYnBsbE9BbGlQSWJaTk85YVFSMDJTaG1BQTFE?=
 =?iso-2022-jp?B?dlFkUGp1SEZJNTZQVzNBMVZEN1pENkRUVHptcUJSQTZwV1l6M256djJM?=
 =?iso-2022-jp?B?NnF0TXE0U3J5NkdXVzQzNmIxQ29SUzg4UjFWNlVNdmlNNHlhaWxtWndD?=
 =?iso-2022-jp?B?SEF3YWpxTSthY2U1TzYxNHNzVGt3T0hNNFRLS21oZy9XQ05xdVEyQnFF?=
 =?iso-2022-jp?B?NDZLTGQvSHU2NmhTUFdxRVZjd2RhdnVucjlhdGxISUF5NEpTSHNNMzE5?=
 =?iso-2022-jp?B?VmcxVkxISElLeUU1SWxrTnNoK0VtU3dZeG92Y3V6TkRMelJ3Yk9SR2Fm?=
 =?iso-2022-jp?B?M1RYWU5Ua3FCUGJaWlRvSThOdTZtNGEzK1VuckJZWTh3V01oMTBVbDBn?=
 =?iso-2022-jp?B?N1dub09MSHFUV29JREwwbWNRUDNFTUUxaFdQOXZNTkdsVElyKzRrcENx?=
 =?iso-2022-jp?B?SmFuTjFvNlZjcEo4NVg3U2hYYk0reUoxZXNRNFY3c2IwRnFjdUpJRmYz?=
 =?iso-2022-jp?B?bzNDQ2JOOE9lUWdGMWczcUl6ZlpBaUw2bkV2L1ByMVNRR0xrWFZRVWRn?=
 =?iso-2022-jp?B?aGU1SW12eWhKRi9UQmVndkFBcWpIZXdCNEN3cXlzNC9sa25BZVlLbDd5?=
 =?iso-2022-jp?B?Zm0wZW8rekszQUswMWdwT3NMSHNnQkRVdWx4NTA4eUU5cEp2NDFRais2?=
 =?iso-2022-jp?B?QkhYNEx1dWQzZFlZanM5OUxKTjZPQy9DU0J3UGVsODZHWks0MXNCQ2tV?=
 =?iso-2022-jp?B?SURpUUk5ZWdRazhuTEhjcVg3T2xNZnBKYy8wbmErcGhOcC9lVHc2ZnlO?=
 =?iso-2022-jp?B?SXJNRC9WdnFRcUQxTVh2LzR5Slc1Q3UyVkpITDFBNU9mSi9jTGFGdnc5?=
 =?iso-2022-jp?B?S0JTR3NyR2xiMzVmZ3lOQ3dUZVhpek96SFV3OWEzTC9KWmZseDgvV3FZ?=
 =?iso-2022-jp?B?MExqUHFTV05BNUZxUVN1OTZzVW9pZlZxWG9FdUxjWHNEREN4a1pHUTVO?=
 =?iso-2022-jp?B?dVI1a0VybUk1MktVanY0UUorZktGd3RBNm9kM095VDZ2cUxVUGJDZ2NF?=
 =?iso-2022-jp?B?d3JCSldqcVYrbUxDRTR4QWcyQlo3Z1pwdFpCbHhCc054Wm9wUFhXYXN3?=
 =?iso-2022-jp?B?VWdRMy80UjBQUmhBT0Nyd0ZWeU5qTDZhRzU5Szh4Q3l0a21lektydmYv?=
 =?iso-2022-jp?B?aFVPVjNjMHBrbGd2SGM5TDZVNFdTTkM2TDJEY0VqcWdXTTNVTHZEcSs4?=
 =?iso-2022-jp?B?OHQ3Vm5mdUVNQSthSTNUQXlRaFUrUzBJaUsvb0Fhb2tHQmF3Q2JBUCsx?=
 =?iso-2022-jp?B?SFZ2YlQ2MXZOSHN4aEQyQ09zcGd2aDJGNUtHSWFWa2pERjBsTC9aNnFL?=
 =?iso-2022-jp?B?b2hpTUdTQ2JTZi83WmNpdENsR2V5UXhsQUY4S3VHK3dXVU8rUHl5QlFF?=
 =?iso-2022-jp?B?ZDFON0tVbjFMaDEvWmVSZUdNWWZLcjZmaGNXdVNQV3I4WjdQN3RGN3ln?=
 =?iso-2022-jp?B?emVzTXdkTTFiMHpGV25CNkUyUUt1M3M0VW9QNTIxcVNNQjk2WjM3b0wz?=
 =?iso-2022-jp?B?VDdtY0FTWU9WRTl0a3NFc05SZVI4PQ==?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5478.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e2ee26-f9bb-4223-f5b9-08d94c225330
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2021 08:34:15.6030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7krnN3AsQDmJ01b/lqv0VZNi99xuZY9ZYdkSwN2pgJKIGBdVET9uKMJXhVkyXkl5aRFB2WDMClUkPiSkfMRv2JoKFGUCI+6kdqYAhHajIBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4536
X-Proofpoint-GUID: IFK7KMRDjAtb79CK4SfBIzRrYDI4O4GI
X-Proofpoint-ORIG-GUID: IFK7KMRDjAtb79CK4SfBIzRrYDI4O4GI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-21_04,2021-07-21_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 mlxscore=0
 mlxlogscore=993 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107210046
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=0A=
=0A=
________________________________________=0A=
From: dave penkler <dpenkler@gmail.com>=0A=
Sent: Wednesday, 21 July 2021 15:41=0A=
To: Greg KH=0A=
Cc: Zhang, Qiang; Alan Stern; Dmitry Vyukov; paulmck@kernel.org; Guido; USB=
=0A=
Subject: Re: [PATCH] USB: usbtmc: Fix RCU stall warning=0A=
=0A=
[Please note: This e-mail is from an EXTERNAL e-mail address]=0A=
=0A=
On Wed, 21 Jul 2021 at 09:08, Greg KH <gregkh@linuxfoundation.org> wrote:=
=0A=
>=0A=
> On Tue, Jun 29, 2021 at 11:32:36AM +0800, qiang.zhang@windriver.com wrote=
:=0A=
> > From: Zqiang <qiang.zhang@windriver.com>=0A=
>=0A=
> I need a "full" name here, and in the signed-off-by line please.=0A=
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
> What commit does this fix?  Does it need to go to stable kernels?=0A=
>=0A=
> What about the usbtmc maintainers, what do they think about this?=0A=
=0A=
>This patch makes the babbling endpoint retry/recovery code in the real=0A=
>world usb host controller drivers redundant and would prevent usbtmc=0A=
>applications from benefiting from it.=0A=
=0A=
Due to use dummy_hcd host,  as explained earlier  the RCU stall happens all=
 the time,  Is there a better way to solve it =1B$B!)=1B(B=0A=
=0A=
Thanks=0A=
Qiang=0A=
>=0A=
> thanks,=0A=
>=0A=
> greg k-h=0A=
