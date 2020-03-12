Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6743A182D3A
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2020 11:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgCLKOQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Mar 2020 06:14:16 -0400
Received: from mail-db8eur05on2048.outbound.protection.outlook.com ([40.107.20.48]:6114
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725978AbgCLKOP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Mar 2020 06:14:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHOYE3F7yN5eOOpKY7s/U4iKQsQdWsaSeyfFOKGYtalEwa6xU2d9OkyqRAYXt8jb5hHdU3+4I5q/CtuBhTAPKr1Mkq0UjbKMd6VpDqUUuNOGDjX8zRvMKXjvBnpkWH1K4VanYm47V5z6hN/VUVx/p9admNlvyv23boHz0rUA8X/ly6Ns4OptyTzVl61imdNKpUjSLL4la29ED3JeovFeMHo/INVuJEjZ3Q8NuFvzFWPdv/VNyLpu7teswBlChkXbv9yfVfYimD2gtg9ltEakkc9oVu2qNGaaxOoL7tQ9G3myuNoel38GPDRIZkNQSxtWAinAVL4gxPNVrTOiRqf9ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLgs9E2ThFTs33Kw42tc88Mq7aOD8wbir0Vl1BdW5kc=;
 b=LiYinz8gD/xv9QzQbhi/wTEVvMZGfI6i4jiNkVvjc3ee4p8uibH1caHPb8nlHwIYHBG/fCh3/Fu89F7pRiilEva/PrXg9WxRBSexxHZC6yXtkqPC0OJoqKVzsa3E/VotYnZYD5HPegH07vZxqKOSr6fStW/nYk33A4aRXbStcLr0bAmphKweYYwyMBTZXil9ik4/Qf2qfiPppXlRbp5+OO+lew+2JWiISQDS2Sce2sx5QGXT+BEimGcSldQnXACXJOq+X8VuZQpex5VRpAqMbd8OU9BqN+ehPx23ji5q12Ml3gQ4asRdFdSm8mlt7lXDYRx2yycUs5dxC/op/XjCCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLgs9E2ThFTs33Kw42tc88Mq7aOD8wbir0Vl1BdW5kc=;
 b=hKM9r6i9KgI2Vel2Pmg5H/dJsw8m+/RbXHbUTlVrVLYWszqPGzKqX7tHtCmi7YMxQwnfsd/T0jrVpzU2YqNws15HIYcHjLMpbBKSagfS5/gvcSZni2XhGQZx90+g1OozuvLx+CtKhbLUetq/9naOaJ3C8eAAv83wysXDRJ/0P2o=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB5296.eurprd04.prod.outlook.com (20.177.49.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Thu, 12 Mar 2020 10:13:36 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1%7]) with mapi id 15.20.2793.018; Thu, 12 Mar 2020
 10:13:36 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "bugzilla-daemon@bugzilla.kernel.org" 
        <bugzilla-daemon@bugzilla.kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [Bug 206779] usb subsystems hang
Thread-Topic: [Bug 206779] usb subsystems hang
Thread-Index: AQHV9Jx8nmYJz+Vh502RkV0+NBilA6hExJOA
Date:   Thu, 12 Mar 2020 10:13:36 +0000
Message-ID: <20200312101339.GF14625@b29397-desktop>
References: <bug-206779-208809@https.bugzilla.kernel.org/>
 <bug-206779-208809-SCFxwEJ07j@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206779-208809-SCFxwEJ07j@https.bugzilla.kernel.org/>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7f033697-aca7-4b3c-77b2-08d7c66e0724
x-ms-traffictypediagnostic: VI1PR04MB5296:
x-microsoft-antispam-prvs: <VI1PR04MB52965AF3F2F5DB9CAB0DB7898BFD0@VI1PR04MB5296.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0340850FCD
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(366004)(39860400002)(136003)(396003)(346002)(376002)(199004)(186003)(6486002)(1076003)(26005)(33716001)(6916009)(8676002)(81166006)(81156014)(8936002)(6506007)(316002)(86362001)(2906002)(53546011)(76116006)(33656002)(66556008)(966005)(5660300002)(64756008)(66446008)(91956017)(66946007)(66476007)(44832011)(4326008)(9686003)(6512007)(478600001)(45080400002)(71200400001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5296;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SnybNC28dXPDve8seCHuzNwiY8GHx9qTtJwzWhWekRyqPlJcwOwdLjf47ROfyMwHqmyuPLfXqbNWKl4bVBUJlfjTODHR7YWpXJrit4pNu6+4EioUh4iib3doPWd+xqK65LVARYUXj4Sv+a1wIlRDA+LDsht+jCtn4pMPwsD/dqy2P7ltYUHFBRTb6lRZKS7eytza55ifFq831eAZyhJY60vg9pKDRTaFJi1yndPQn0tUFOOlcMKWXkcveXGH/iSpvGTAJ6wOwMoYIbcMxMv/GUFggBAbs23xrVCRe19B+CXU2OG0ObAWJLR6PsbO7507kYeEJ+l6Y+OTwGDDt88XGEi19KVlqlJh/nGmCJa27Fz1TvpxiYN1Pqutse3+XawG2H2dhKPqwHb7GelqAXwynt1BZlUWd3gx3jpDbzmkECuNf15K8x28oUW2x8wqjZKtwC01rL5MgALoypIxFx3dOSeIgDm6faqaaKB9lfhuq+K+HawTERFfgczO2EkM5VeM8GquXYgW/CfxTnutYpwupw==
x-ms-exchange-antispam-messagedata: 4zUMwNlKf1FOxjm7qAWc4QbHJ5dVKNLHaSgst9VufGIA3hPrWW1nzt4AQzVZexVtKq+QRkCgTPzi1IaihNWYzwi3kfnTdTXZAnBoes9gKegIAx/i7Og7qQURUkqltoZKpSrl7Pa9aeqMOa2ZuisE0w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <35E238CC9D3AB64481BD95556913271D@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f033697-aca7-4b3c-77b2-08d7c66e0724
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2020 10:13:36.3567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yqzJt9o4dq5Jp66GvDdfCudXaSqk70r2o0t53hBrhA4Zejf6g36wZepv0iAIL+Nf75FqY+vCpocSN2AYDsUdcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5296
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-03-07 16:21:37, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzi=
lla.kernel.org%2Fshow_bug.cgi%3Fid%3D206779&amp;data=3D02%7C01%7Cpeter.chen=
%40nxp.com%7C6362fa93c31249cccc1408d7c2b39d9a%7C686ea1d3bc2b4c6fa92cd99c5c3=
01635%7C0%7C0%7C637191949021070621&amp;sdata=3Dtd13UwZNZb0wRL9WjLJXP%2FUHox=
SxVut7Xq11JJ1iozM%3D&amp;reserved=3D0
>=20
> --- Comment #1 from sander44 (ionut_n2001@yahoo.com) ---
> (In reply to sander44 from comment #0)
> > Hi,
> >=20
> > I observed issue with this version with one usb device.
> >=20
> > My setup is:
> >=20
> > Ubuntu 19.10 clean install
> > Kernel 5.5.7 vanilla, 5.5.7-vanilla
> >=20
> > My issue is:
> > [  726.043665] INFO: task fastboot:1531 blocked for more than 120 secon=
ds.
> > [  726.043716]       Not tainted 5.5.7-vanilla #1
> > [  726.043734] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disab=
les
> > this message.
> > [  726.043753] fastboot        D    0  1531   1413 0x00000004
> > [  726.043755] Call Trace:
> > [  726.043778]  __schedule+0x28c/0x6e0
> > [  726.043779]  schedule+0x44/0xb0
> > [  726.043780]  schedule_timeout+0x1d3/0x2f0
> > [  726.043783]  ? ttwu_do_activate+0x5a/0x70
> > [  726.043784]  wait_for_completion_timeout+0xb3/0x140
> > [  726.043785]  ? wake_up_q+0xb0/0xb0
> > [  726.043787]  usb_start_wait_urb+0x8c/0x180
> > [  726.043788]  usb_bulk_msg+0xb8/0x160
> > [  726.043790]  proc_bulk+0x158/0x3a0
> > [  726.043791]  usbdev_ioctl+0xc08/0x1480
> > [  726.043794]  do_vfs_ioctl+0xa5/0x680
> > [  726.043796]  ? finish_task_switch+0x70/0x260
> > [  726.043798]  ? tomoyo_file_ioctl+0x19/0x20
> > [  726.043799]  ksys_ioctl+0x75/0x80
> > [  726.043801]  __x64_sys_ioctl+0x1a/0x20
> > [  726.043803]  do_syscall_64+0x57/0x1c0
> > [  726.043804]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > [  726.043810] RIP: 0033:0x7f1da431867b
> > [  726.043815] Code: Bad RIP value.
> > [  726.043816] RSP: 002b:00007ffdb4c22af8 EFLAGS: 00000246 ORIG_RAX:
> > 0000000000000010
> > [  726.043817] RAX: ffffffffffffffda RBX: 000055b82cb5c2a0 RCX:
> > 00007f1da431867b
> > [  726.043818] RDX: 00007ffdb4c22b00 RSI: 00000000c0185502 RDI:
> > 0000000000000004
> > [  726.043818] RBP: 0000000000000040 R08: 00000000000001ec R09:
> > 00007ffdb4c22b40
> > [  726.043819] R10: 00007ffdb4c22b00 R11: 0000000000000246 R12:
> > 0000000000000040
> > [  726.043819] R13: 00000006fc23abff R14: 0000000000000000 R15:
> > 00007ffdb4c22c70
> > [  774.124057] usb 1-2: USB disconnect, device number 4
> >=20
> > I had to restart the machine - vm so I could continue the process.
> > My task is: writing a phone with adb and fastboot.
>=20

The kernel is waiting the transfer has finished, but timeout value
from the user app is unlimited (maybe 0). Try to add timeout value
for this transfer to avoid process hang.

--=20

Thanks,
Peter Chen=
