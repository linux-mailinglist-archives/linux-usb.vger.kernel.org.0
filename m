Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A157E3D09BF
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 09:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234205AbhGUGxD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 02:53:03 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238]:45064 "EHLO
        mx0b-0064b401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235472AbhGUGuo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 02:50:44 -0400
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
        by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16L6xHwv014153;
        Wed, 21 Jul 2021 07:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=nOjFPEZ6zSYSvtSbIkeRwinsiOy1HDzMdbFAE7Q6QHM=;
 b=rQI3XzxLoYyNYexwwhgNXDDy0UqqZ1a7XUd7ShchtpznTqgcdtsB/FUI9l2L82SNOsyg
 +gB9+PNm+ppTmbH3UFLNMI7JrYoqF8hO/qg3Tp/z+eTvxFs635W7juIvBun7aVKNwa6c
 IBgVsSmni6E+5dr25Qyvxa2p7CwLPfdN+z4tPq0nP2//IwVnPRwwviF7uiPY04f8vfwl
 san5+xsz2LzvfF4Wx3vpjUpecVsSKVF+42+Xwtroyg/D5RIcqPZqmGyd83UWHLFURFnm
 KhZ/39ZINQ2WuiqYd/3cuncEkw5Ub7vxtPLRdemqOqIFy20mmWPu5/guUElSvKp38/hH 5w== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
        by mx0a-0064b401.pphosted.com with ESMTP id 39xck0r2sd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 21 Jul 2021 07:30:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JM2FS4u3YKJaBuZybxpzIjOSYbO73paDiwPEmqcwH6s61cKKGDmqbe0kYtujtiFAlC+mLQvA/UChr7mof7rUKyZzBGcSi3d9ynFDf1SvJE0ykp9V6+8WTfjMJ5CEN3fDj5ncNczB+j+gM/+i66bpLN8SGRU+qxfsvWau3SszEFv9zJUoOOlVSUvwRtoH1UuHz3JywhwPE84kmJTBCB4d9Vp1WePXBaJlRcnl8zv/3xf6g98Vjj70PepiBKLW56cTU4pJtHGJGGR/EKdXsYXtCzy6oTCU2kLXEYxKXZCfF2Vm3/BFrJ9x7MPR3TIetyRVyMn67Dbp9O8WPkWwg2IbXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOjFPEZ6zSYSvtSbIkeRwinsiOy1HDzMdbFAE7Q6QHM=;
 b=EzG9XYycZZGq47xh+6ua1briv5MmCDl5RHcviqb3SXIrbSGFIpdu1m4XAP+HygP2nkm6567bYZInBN4Uatl6LvBHsDSrvWQLGnqjCHj6PrfyF1HEVtsKuTRRsvtj6KuDrPg0z388YLlFrrDKpZXrUVjgOR9ak31JtGj8wMZHcvZKmV9jkHVazSTpIXijkFjKZ7MYucno6lTYYQuFzBQ0NH3HLPBdkOzwAp4E5ix6n5tKeEpFakhrihdARJbqkd6aLuEW+Wz+Cp1SMifjTCzfDjTqz64rA/AShNmdZK743fpUlXZqah2NpS4CrXkmSdjuIkkJ9E1az1rOE8htUzdVBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL1PR11MB5478.namprd11.prod.outlook.com (2603:10b6:208:31d::12)
 by MN2PR11MB4550.namprd11.prod.outlook.com (2603:10b6:208:267::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 07:30:40 +0000
Received: from BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b]) by BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b%9]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 07:30:39 +0000
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
Thread-Index: AQHXbJdxsEWtRMwgSkWpoKhE+HBk+6tNJVQAgAAD1hQ=
Date:   Wed, 21 Jul 2021 07:30:39 +0000
Message-ID: <BL1PR11MB54783C940009B4DE9CC61DD2FFE39@BL1PR11MB5478.namprd11.prod.outlook.com>
References: <20210629033236.7107-1-qiang.zhang@windriver.com>,<YPfIAolSC8mJoQUr@kroah.com>
In-Reply-To: <YPfIAolSC8mJoQUr@kroah.com>
Accept-Language: en-001, zh-CN, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3fedd0fc-33f5-440d-c44c-08d94c1970b8
x-ms-traffictypediagnostic: MN2PR11MB4550:
x-microsoft-antispam-prvs: <MN2PR11MB4550F0DD25E070B68C88C3CCFFE39@MN2PR11MB4550.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: co41J4PLaVHaU2QjBkSOyoSggzSieFhxWXbPz2xvyxuTP259zcIGmCCpSNTe9OMABzLHl9wL+0wHcq/DMdrbGqo7U+WbEjFZnROqlgZJfoSqXJWlJGRjtBK1xrsh2hpENioAWZbsvf69BhjR/++MnGhLTVrbBN/71+aILSnmCLUK1U+EbrNTdEphUmZnSdnFhjoCP0m/NeBCiocGiqiwdXvctDgXY4jss5KQAyvSkgXa/xy36/5i1CSRmzPaDBQ9EDSLuZ4tHDTnOGMAYVAbyO00/LQ0dRMKw58MYE6zQkqzeTnlwm+8Ft1NiiZrRixy5FZOao36G37lIbWXOnvgXDf+o0ob/vHavSggK5tceOGwFRgEzPoWpvFI+Yi0uunxZ3rQbobfTTVR0o870IPwR3IJ140qLNBbWgBhm4hmty4jSNNTlcat/Yi4cy5Pdye6IEp/Og/j3/psAaciPCEzLXXHyv+trUYPBH7hUWTmLgkrI8GcgLShYWFZrCy92/G9UJktXKCj7jeUHbC+KmR5alYb/1R6VsqLtI0CJrprCOIOe+cp4MXu0BKf9HyAGh/M7QL5lXdDpziDcys2EZ9tQtb9pmbgVvm2sIHHMOvwCJbrJR9m9e48IAgD8GfytsBTw+h6wwEzCBrUZdOTCB3ShYyU1kdLGUJrpM1x5FGcF81lKTd/kkmoUBQj5trrWt1hZU/vYVjfIWYZgRtuyB7HD4f9afA6A8XVRazSPYwo6Zk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5478.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39850400004)(346002)(136003)(396003)(66946007)(7696005)(66556008)(83380400001)(38100700002)(6506007)(5660300002)(9686003)(53546011)(66476007)(76116006)(64756008)(66446008)(55016002)(4326008)(122000001)(478600001)(91956017)(86362001)(8936002)(316002)(186003)(26005)(71200400001)(8676002)(2906002)(33656002)(6916009)(54906003)(52536014)(586874002)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jl5dZbpwzImtL9uIcBF4Z2scy7GN+50zsdcr3mfy6UWhWJRe4dn76IqzmP1e?=
 =?us-ascii?Q?ZUBtDp2UfEud6KSAS7ATE7WrzTu8SfBHuV7FTsh3gAgZbVm+nARQtWdmGoTv?=
 =?us-ascii?Q?efsZLCjHyKye4/A8RXx3H6dqzFAkYfbJ5ESahhnfVXQoKPYAwekaI0pRWHXD?=
 =?us-ascii?Q?bMw5IKsPGlEHJg6XMsUIVc1Gm9qvuSrK1IbKPhFFIZjG1BkXeHIIfgEZRdBX?=
 =?us-ascii?Q?IWDR2ylTDyaE+NsSauEafxAkxbJrvQ/0eF7LfevewjxkoYHoh60pdf59iMA2?=
 =?us-ascii?Q?oTzfpW66zlqkB4h67cfxUl/z0hn9AQHThm2+zwMj9WFUJQ+IQ2EyVm1umL3t?=
 =?us-ascii?Q?/3Kkne16ojDDmP5kEDDPf3Hmg0yYwm5Bf2CrpocRuIROUw2jZF7K8MKtLlvH?=
 =?us-ascii?Q?oIuvdcnsjOb+Oj9XneCmnjo3hsEReHtXWIvJQMItJDzsI+k1dsQT17KekqtX?=
 =?us-ascii?Q?wc6/P0ME9q98tQEvGgh9LOdYmlSr8nNVnMPDczYB2jQB8La8YgcqUADN4qlm?=
 =?us-ascii?Q?adyf1J+7YdOZONIDZQgUwAzGIYa55bfpl9bRhq8/K2ioJu6uZ2dSi5UXeaDh?=
 =?us-ascii?Q?TAsKIp1QOVc5uV9nsgBJKKmAwKHJEfM5O/T1UjcmF+XDKThpUr8B1+z5QGJd?=
 =?us-ascii?Q?qHtwHHpJF9hxkLNF5TaBV/jBa1KUQ4SlEGTvFNFQfvJC6BU9PjI9cteX7/b+?=
 =?us-ascii?Q?2ang26sCU7xk5g73sAy2nLZtzD+WTGKv14A+/VO6zIVjM03RWaJIbuSv98Nz?=
 =?us-ascii?Q?8W/tk7/6MTzcTY8IYlz+1pMYOrzf8+4Pgx5OyOdwcAlKjPxMljJ263msBh0R?=
 =?us-ascii?Q?HSbw7ZusPfiVWTvyQPRqJv+MXcodyuHMSyI+9A65GOiaKXDyDJE//t5/QZD8?=
 =?us-ascii?Q?SdAIERqQIcWkUHaxYtQrxylnY0dOOZbDSNqYyscmJAu484Mc156JKli6c+zj?=
 =?us-ascii?Q?WWgiythzBKha2s25gcEs/y3msUurTrLXSzrOyl3a8YS3iWkF+tpED8iC6S3f?=
 =?us-ascii?Q?7uH+D7WpYTVzU0dfNWGZuxSIaF8SyCUPlHRLfa4l10BOUV3uwEBCxPVJsGqL?=
 =?us-ascii?Q?nqEpsE2YXv7HxmvMbJt1h/yE47CTDAlUN17CxIO+2S3pdCEKBOMfOTDE/TJu?=
 =?us-ascii?Q?vn+IFmBadN5RU1QGjGhS766jl+rGN7H89s0YfOgh+zUVGHG3lBMImA6FDAxB?=
 =?us-ascii?Q?+guY+CUaD6jbi7X1x0CybGeMTqt7EPoDGO1citgMgrIZr9iTOCgtRijE5x/3?=
 =?us-ascii?Q?zhQlsrbL0KLER3CdNvLRJNImqqAgJcI8UlZokCri0nRV2+ltkuSj0PctOHS+?=
 =?us-ascii?Q?nsk=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5478.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fedd0fc-33f5-440d-c44c-08d94c1970b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2021 07:30:39.7471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r6onn9Z6/zyWhX+USIPBnZNONFuFWlwRH19Ltwt3Rt4IMvDnFgFH0yEIhzwAMrD3g640fU7Lz7yWN5TrSZTdgtUGz+jQskMRu0qu0MnvtIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4550
X-Proofpoint-GUID: aL0apnglmqBknzfSQj2Xpji0LWXDDuLv
X-Proofpoint-ORIG-GUID: aL0apnglmqBknzfSQj2Xpji0LWXDDuLv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-21_04,2021-07-21_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=908 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107210039
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=0A=
=0A=
________________________________________=0A=
From: Greg KH <gregkh@linuxfoundation.org>=0A=
Sent: Wednesday, 21 July 2021 15:08=0A=
To: Zhang, Qiang=0A=
Cc: stern@rowland.harvard.edu; dvyukov@google.com; paulmck@kernel.org; dpen=
kler@gmail.com; guido.kiener@rohde-schwarz.com; linux-usb@vger.kernel.org=
=0A=
Subject: Re: [PATCH] USB: usbtmc: Fix RCU stall warning=0A=
=0A=
[Please note: This e-mail is from an EXTERNAL e-mail address]=0A=
=0A=
On Tue, Jun 29, 2021 at 11:32:36AM +0800, qiang.zhang@windriver.com wrote:=
=0A=
> From: Zqiang <qiang.zhang@windriver.com>=0A=
=0A=
>I need a "full" name here, and in the signed-off-by line please.=0A=
=0A=
>=0A=
> rcu: INFO: rcu_preempt self-detected stall on CPU=0A=
> rcu:    1-...!: (2 ticks this GP) idle=3Dd92/1/0x4000000000000000=0A=
>         softirq=3D25390/25392 fqs=3D3=0A=
>         (t=3D12164 jiffies g=3D31645 q=3D43226)=0A=
> rcu: rcu_preempt kthread starved for 12162 jiffies! g31645 f0x0=0A=
>      RCU_GP_WAIT_FQS(5) ->state=3D0x0 ->cpu=3D0=0A=
> rcu:    Unless rcu_preempt kthread gets sufficient CPU time,=0A=
>         OOM is now expected behavior.=0A=
> rcu: RCU grace-period kthread stack dump:=0A=
> task:rcu_preempt     state:R  running task=0A=
>=0A=
> In the case of system use dummy_hcd as usb controller, when the=0A=
> usbtmc devices is disconnected, in usbtmc_interrupt(), if the urb=0A=
> status is unknown, the urb will be resubmit, the urb may be insert=0A=
> to dum_hcd->urbp_list again, this will cause the dummy_timer() not=0A=
> to exit for a long time, beacause the dummy_timer() be called in=0A=
> softirq and local_bh is disable, this not only causes the RCU reading=0A=
> critical area to consume too much time but also makes the tasks in=0A=
> the current CPU runq not run in time, and that triggered RCU stall.=0A=
>=0A=
> return directly when find the urb status is not zero to fix it.=0A=
>=0A=
> Reported-by: syzbot+e2eae5639e7203360018@syzkaller.appspotmail.com=0A=
> Signed-off-by: Zqiang <qiang.zhang@windriver.com>=0A=
=0A=
>What commit does this fix?  Does it need to go to stable kernels?=0A=
=0A=
 I will add fix tags resend,   need to go to stable kernel=0A=
=0A=
>=0A=
>What about the usbtmc maintainers, what do they think about this?=0A=
=0A=
 Alan Stern reviewed this change before.=0A=
=0A=
Thanks=0A=
Qiang=0A=
>=0A=
>thanks,=0A=
>=0A=
>greg k-h=0A=
