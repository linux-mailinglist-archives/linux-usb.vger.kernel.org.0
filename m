Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E56442CBB3D
	for <lists+linux-usb@lfdr.de>; Wed,  2 Dec 2020 12:10:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbgLBLKI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Dec 2020 06:10:08 -0500
Received: from mail-eopbgr60041.outbound.protection.outlook.com ([40.107.6.41]:58278
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726299AbgLBLKH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Dec 2020 06:10:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oO7Hnq9pgG5ZqkFVyZE//lZSVzhvOGMqLMyJ4/KM8rVdyvaRtTWC7JuZVYBq3usZBVRZa0WgySoUDXt7o0yuHRgLZn5toUAq8OqZej823qiULaJM7u+bN7YRiyHUNC/o2tMECnTlhVCNQEk1QiRU4kHwX54Jza8pdqh4+SQI1aweh7meP86ZydpEaKDQuoETaL5p8Q7nWYytD3kfOD4ncuY+jnDlFTazTmzgZoJxKdAB93+TopR5AJfqfB1TU/9tZBjv+TSMRKfAHJjohhgnU2XwIe2kUo+qNKdao+LqcrC0uG2G6s2uEJw0H+y74tTUaSRENiqGmVHUtwK7LuBxkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujZINT8FsGuzhWMXnFOBnrYO+wkBiUx60/CQXghqtPU=;
 b=BY1/RJ7N42qjWppHizjbwC7iP1q21NFSq0XPUj1bJf03y/13jr6m5Jfb9EiLc6l1NM7kyMuTe20HSYNmUJT8ImH+wSCyprhty/ztZNMSrt9wh5Fd2T/Gb0Jnk4R3jPyj60U5scufARlPb7bHl8VWn4OWxkIMkpufAPOKRgyUqQeScc0tU1/XCyj/57NXms8ucmOzgIvjRJynr8/zfqZoUWRjP7zn5VtCwuF7RJRuSX0hNrAZkmr3B2wyA0LyxwL41lGzZ6TUO81yMb8/rJAkoeKiXV4cpacnUbL3n6kgw4l0MMqHU1hrIp45aymwhJK0CTIdUyf3wWl8e0jc8ASDgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujZINT8FsGuzhWMXnFOBnrYO+wkBiUx60/CQXghqtPU=;
 b=NfQ44or2nhz3eAl6vx487pYKZFsIp8MeURP9GtjBivTZtldLliGFn7oEbgBMPWH3C5quwLns2bWppiuvxXepDSz3ha+Kxd+K/EWZ0yliqpW+T+UzhFY1VAvj51AbIxSL8WyEiY9LgUaelUrsrSita95Oe6TEsflNIFN2eyQUmMA=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Wed, 2 Dec
 2020 11:09:17 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3611.031; Wed, 2 Dec 2020
 11:09:17 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jack Pham <jackp@codeaurora.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: f_fs: Use local copy of descriptors for
 userspace copy
Thread-Topic: [PATCH] usb: gadget: f_fs: Use local copy of descriptors for
 userspace copy
Thread-Index: AQHWx1iN78Nptb1oeka3004/VodEvanh7S+AgAExWQCAAInKAA==
Date:   Wed, 2 Dec 2020 11:09:17 +0000
Message-ID: <20201202110848.GA26985@b29397-desktop>
References: <20201130203453.28154-1-jackp@codeaurora.org>
 <20201201084245.GC11393@b29397-desktop>
 <20201202025538.GA20623@jackp-linux.qualcomm.com>
In-Reply-To: <20201202025538.GA20623@jackp-linux.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b6e7fa55-e3d9-47d5-7d2d-08d896b2b60c
x-ms-traffictypediagnostic: DBBPR04MB7979:
x-microsoft-antispam-prvs: <DBBPR04MB7979AAEFD5268450611CD81D8BF30@DBBPR04MB7979.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vrn+2+eeeMRoHpiPcQO8DntP5j094tTlPE05Ew0KAUjGkeH4RbnuHampW+kuqZ8U7gZMraq8hIZnTIMcuL67jUeFCSOyCr/Nhc9nMycjpJcq2JvuEmSyMh4GTZdUYfp4mDAIFgQIqLK5o3PCYPji6698U+ttfG4N5OuZinh3Otmg/XsbJYKXgsBdbQfd0DZRkf7y8VabiZRhOKXeDXbnmIoCW6INOqVemUJzFcIZd/AaZhlvbsL/lxpTweNtXDhpMVtOQMk/bsWOQA7Ktp1RD6xgtD6GsBFLZoB6IOm2wG8IGKXhFsUjZGHTF6f0+IATdgFK9WTWAZ+1eP5fYv3akw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(39860400002)(136003)(366004)(376002)(396003)(1076003)(5660300002)(186003)(66446008)(6506007)(64756008)(66476007)(66946007)(66556008)(91956017)(86362001)(83380400001)(26005)(33716001)(8676002)(9686003)(45080400002)(54906003)(44832011)(76116006)(478600001)(53546011)(6512007)(6486002)(4326008)(8936002)(71200400001)(2906002)(6916009)(33656002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?+yNAPrIoc0gGcpwS0s0G/2uEAdYcBDMJsdFiR9GjrMVgFL/isLRSClXhKS9F?=
 =?us-ascii?Q?2CpX41UwtiG9l0y8qQpi2V1RyEXYfzxEF7HEztMvlWodlYVzIPlVilLhpJTL?=
 =?us-ascii?Q?V+B2lGtLGdXWAU6+2tNQ3ZwpucPL6+/JQP+IDwYLHnNbXVav87xe2gZT2Nkk?=
 =?us-ascii?Q?d2ZoWolGDzLxYAoGJuzmV4OidXnVmx7UE/Vr3hLGH/V0M+Tubh0gQ2zdYoxd?=
 =?us-ascii?Q?DlbXgXTF7xF/uJX/y0m6iqcGkviSfldOjGysiOm23bxuoVXTNMv3B4TlZy+m?=
 =?us-ascii?Q?WpUfKufjPFcABCLXibWoNPjAKF/zEtJBt8sgvd6TMLczy6LS35jHstwgiVQd?=
 =?us-ascii?Q?4OAyM6/fJu0tw6e94/eSl9SBV9DM2vv12VlaNuQiolq/jjogEtf50tlZ0uUT?=
 =?us-ascii?Q?NO46waGkaG6zbN89ovG7gyQNupLUNmCWuN0XFSzn3B56oYBhtIVbqXPzcBOj?=
 =?us-ascii?Q?6NqO2ChsJTRG/nx+Oj0YbpMs0PDTXoLoCJNABtzGLu5yYe5cffzI9hT957ES?=
 =?us-ascii?Q?JE4kv14BLdkjQqSe3eaqkEE8bKAgetqstMAyADMVnn1tpFdH/uhro+qlnUw+?=
 =?us-ascii?Q?lmT2C2IIfC3IdVslCeSn2pstiyIPdrnkD70T/H1LpyA9XPjd2+tY6rDeSEmf?=
 =?us-ascii?Q?QqPxT2SdUddlBaQKQ4UzS7sGcP3Crl4UTM8DkekYO4c/ws8ibWRpsvZzHmE5?=
 =?us-ascii?Q?M1DI4kMOQVBnYaOPKWfYtsmzfYYkfnOLCHldhJ46ADEAOD3J1/rBxnqojOJg?=
 =?us-ascii?Q?j+rrAyd+GMOCtPVsP2Fmysgp1C3BxRhytXCmaX82nh2+VcI7OJp5M1b5Olil?=
 =?us-ascii?Q?JmXxf9JC9h9BCQdgpqSsVALtbxHQQEMmlX+Ptdf8GtWAAsbfuf/RflSjTPpR?=
 =?us-ascii?Q?xyZwH+L39+xNos0N+bJCSjT4c53mQE9bzLZJi07jvJ5F6YzMUUp7VAKvJQHh?=
 =?us-ascii?Q?e0ja4dBvljeGNe22Nr5LxGCXR/FxMLBczQ3fV+1SQgR8yAkrAp75391Yvrco?=
 =?us-ascii?Q?M0HP?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A713BA5D76DE3549B8942899C17C58F9@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e7fa55-e3d9-47d5-7d2d-08d896b2b60c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2020 11:09:17.4367
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r6eh3dRXP4QWN88FonsIQNkCQhxc2zJLnnyDYUYRB2SupFxL+HmYJApBnw66E+oKVGG0CGigFX8oIj17W1rVjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7979
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-12-01 18:55:38, Jack Pham wrote:
> (removed Vamsi as he has moved on from USB and his email address is
> bouncing)
>=20
> Hi Peter,
>=20
> On Tue, Dec 01, 2020 at 08:43:14AM +0000, Peter Chen wrote:
> > On 20-11-30 12:34:53, Jack Pham wrote:
> > > From: Vamsi Krishna Samavedam <vskrishn@codeaurora.org>
> > >=20
> > > The function may be unbound causing the ffs_ep and its descriptors
> > > to be freed while userspace is in the middle of an ioctl requesting
> > > the same descriptors. Avoid dangling pointer reference by first
> > > making a local copy of desctiptors before releasing the spinlock.
> > >=20
> > > Fixes: c559a3534109 ("usb: gadget: f_fs: add ioctl returning ep descr=
iptor")
> > > Signed-off-by: Vamsi Krishna Samavedam <vskrishn@codeaurora.org>
> > > Signed-off-by: Jack Pham <jackp@codeaurora.org>
> > > ---
> > >  drivers/usb/gadget/function/f_fs.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/=
function/f_fs.c
> > > index 046f770a76da..c727cb5de871 100644
> > > --- a/drivers/usb/gadget/function/f_fs.c
> > > +++ b/drivers/usb/gadget/function/f_fs.c
> > > @@ -1324,7 +1324,7 @@ static long ffs_epfile_ioctl(struct file *file,=
 unsigned code,
> > >  	case FUNCTIONFS_ENDPOINT_DESC:
> > >  	{
> > >  		int desc_idx;
> > > -		struct usb_endpoint_descriptor *desc;
> > > +		struct usb_endpoint_descriptor desc1, *desc;
> > > =20
> > >  		switch (epfile->ffs->gadget->speed) {
> > >  		case USB_SPEED_SUPER:
> > > @@ -1336,10 +1336,12 @@ static long ffs_epfile_ioctl(struct file *fil=
e, unsigned code,
> > >  		default:
> > >  			desc_idx =3D 0;
> > >  		}
> > > +
> > >  		desc =3D epfile->ep->descs[desc_idx];
> > > +		memcpy(&desc1, desc, desc->bLength);
> > > =20
> > >  		spin_unlock_irq(&epfile->ffs->eps_lock);
> > > -		ret =3D copy_to_user((void __user *)value, desc, desc->bLength);
> > > +		ret =3D copy_to_user((void __user *)value, &desc1, desc1.bLength);
> > >  		if (ret)
> > >  			ret =3D -EFAULT;
> > >  		return ret;
> > > --=20
> >=20
> > Do you have any backtrace to show the problems? I see ffs->ref will be
> > increased at .open, and the .unbind should not free memory if ffs->ref
> > is still two.
>=20
> kfree(func->eps) is getting called directly from ffs_func_unbind()
> which can happen when configfs.c does purge_configs_funcs().
> ffs_func_unbind() does not check for ffs->refs count here, so it looks
> like it can proceed to free it as soon as it releases the eps_lock,
> while the ioctl happens in parallel and then accesses the now stale
> pointer after acquiring & releasing the same eps_lock.
>=20
> But I think I see what you're getting at--would you suggest that we
> avoid freeing func->eps and tie its lifetime to ffs->refs? I agree in
> principle but it also looks a bit tricky as there seem to be several
> reference counters being used in this driver [ffs->refs (refcount_t);
> ffs->opened (atomic_t); ffs_opts->refcnt (unsigned)] that I have a
> little trouble figuring out which one to use. Appreciate any pointers
> if you have any.
>=20
> Here is a quite old backtrace from an internal bug report which was on
> our downstream 4.14 kernel, but I think the issue can still happen on
> current mainline. Also I believe we saw this with ADB but the current
> AOSP version of ADB no longer uses the FUNCTIONFS_ENDPOINT_DESC ioctl()
> so it may not happen with this function. However there are other Android
> functions that use FFS (MTP, Fastboot) which still do use this ioctl so
> I believe it still has the potential to occur if ffs_func_unbind() races
> with ffs_epfile_ioctl().

Jack, after checking more, I think this fix is a good one. ffs->refs is
global reference counter to avoid the ffs_data is freed before all users
have used up. But ffs_epfile_ioctl is per endpoint, it could be freed
earlier.

Peter
>=20
> init: processing action (sys.usb.config=3Dnone && sys.usb.configfs=3D1) f=
rom (/vendor/etc/init/hw/init.msm.usb.configfs.rc:30)
> android_work: sent uevent USB_STATE=3DDISCONNECTED
> Unable to handle kernel paging request at virtual address ffffffefa007fa5=
7
> Mem abort info:
>   Exception class =3D DABT (current EL), IL =3D 32 bits
>   SET =3D 0, FnV =3D 0
>   EA =3D 0, S1PTW =3D 0
>   FSC =3D 7
> Data abort info:
>   ISV =3D 0, ISS =3D 0x00000007
>   CM =3D 0, WnR =3D 0
> swapper pgtable: 4k pages, 39-bit VAs, pgd =3D ffffff956e787000
> [ffffffefa007fa57] *pgd=3D00000001bd6e1003, *pud=3D00000001bd6e1003, *pmd=
=3D00000001bd5e0003, *pte=3D00e800016007f712
> Internal error: Oops: 96000007 [#1] PREEMPT SMP
> init: Command 'rm /config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.=
config=3Dnone && sys.usb.configfs=3D1 (/vendor/etc/init/hw/init.msm.usb.con=
figfs.rc:31) took 77ms and succeeded
> init: processing action (sys.usb.config=3Dnone && sys.usb.configfs=3D1) f=
rom (/init.usb.configfs.rc:1)
> init: Command 'write /config/usb_gadget/g1/UDC none' action=3Dsys.usb.con=
fig=3Dnone && sys.usb.configfs=3D1 (/init.usb.configfs.rc:2) took 0ms and f=
ailed: Unable to write to file '/config/usb_gadget/g1/UDC': Unable to write=
 file contents: No such device
> Modules linked in: wlan(O) machine_dlkm(O) wcd934x_dlkm(O) mbhc_dlkm(O) w=
cd9360_dlkm(O) swr_ctrl_dlkm(O) wcd9xxx_dlkm(O) wsa881x_dlkm(O) wcd_core_dl=
km(O) stub_dlkm(O) wcd_spi_dlkm(O) hdmi_dlkm(O) swr_dlkm(O) pinctrl_wcd_dlk=
m(O) usf_dlkm(O) native_dlkm(O) platform_dlkm(O) q6_dlkm(O) adsp_loader_dlk=
m(O) apr_dlkm(O) q6_notifier_dlkm(O) q6_pdr_dlkm(O) wglink_dlkm(O) msm_11ad=
_proxy
> CPU: 6 PID: 13186 Comm: ->transport Tainted: G S      W  O    4.14.83+ #1
> Hardware name: Qualcomm Technologies, Inc. SM8150 V2 PM8150 QRD DVT (DT)
> task: ffffffef8f491200 task.stack: ffffff800d298000
> pc : ffs_epfile_ioctl+0x1c4/0x364
> lr : ffs_epfile_ioctl+0x1c4/0x364
> sp : ffffff800d29bd40 pstate : 80400145
> x29: ffffff800d29bdc0 x28: ffffffef8f491200=20
> x27: ffffff956cb01000 x26: 000000000000001d=20
> x25: ffffffefa007f8b0 x24: ffffffef499698f0=20
> x23: ffffffefd448c280 x22: ffffffefae6df940=20
> x21: ffffffefa007fa57 x20: 00000079a8101318=20
> x19: ffffffef49969958 x18: 00000895b16f2301=20
> x17: ffffffeffcf624f8 x16: 0000000000004e20=20
> x15: 0000000000000001 x14: ffffffeffcf61af8=20
> x13: 0000000000000008 x12: 00000002dfc5023a=20
> x11: 00000002dfc5023a x10: 0000000000000015=20
> x9 : 0000000000000000 x8 : 0000000000000008=20
> x7 : 6320383030303030 x6 : ffffffeff16037b8=20
> x5 : ffffffef9bc0a380 x4 : 0000000001312d00=20
> x3 : ffffff800d29bb18 x2 : ffffff956ba8ebd0=20
> x1 : ffffff956caf1f4c x0 : ffffff956caf1f4c=20
>=20
> PC: 0xffffff956c38a818:
> a818  f9402308 910043e1 9103a100 97de046c 17ffffc2 f9402300 f8448408 b940=
4908
> a838  71000d1f 1a9f17e9 7100151f 321f03e8 9a890108 8b080f28 f9400915 941d=
b318
> a858  394002b3 320003e2 aa1503e0 aa1303e1 97e32f88 90005d80 52801061 9134=
bc00
> a878  97e2556a d5384108 aa1403ea f9402109 ab13014a 9a8983e9 da9f314a fa09=
015f
>=20
> LR: 0xffffff956c38a818:
> a818  f9402308 910043e1 9103a100 97de046c 17ffffc2 f9402300 f8448408 b940=
4908
> a838  71000d1f 1a9f17e9 7100151f 321f03e8 9a890108 8b080f28 f9400915 941d=
b318
> a858  394002b3 320003e2 aa1503e0 aa1303e1 97e32f88 90005d80 52801061 9134=
bc00
> a878  97e2556a d5384108 aa1403ea f9402109 ab13014a 9a8983e9 da9f314a fa09=
015f
>=20
> SP: 0xffffff800d29bd00:
> bd00  6c38a858 ffffff95 80400145 00000000 0d29bd30 ffffff80 6caf7504 ffff=
ff95
> bd20  ffffffff 0000007f 49969958 ffffffef 0d29bdc0 ffffff80 6c38a858 ffff=
ff95
> bd40  00000003 00000000 6baea5a0 ffffff95 00000001 00000000 0d29bdd0 ffff=
ff80
> bd60  dd4ad288 ffffffef 94706900 cd6f8d01 8f491200 ffffffef 94706900 cd6f=
8d01
>=20
> Process ->transport (pid: 13186, stack limit =3D 0xffffff800d298000)
> Call trace:
>  ffs_epfile_ioctl+0x1c4/0x364
>  vfs_ioctl+0x3c/0x5c
>  do_vfs_ioctl+0x670/0x928
>  SyS_ioctl+0x90/0x9c
>  el0_svc_naked+0x34/0x38
> Code: 9a890108 8b080f28 f9400915 941db318 (394002b3)=20
> ---[ end trace 198e86364be2f515 ]---
> Kernel panic - not syncing: Fatal exception
> SMP: stopping secondary CPUs
> =20
> Thanks,
> Jack
> --=20
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project

--=20

Thanks,
Peter Chen=
