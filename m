Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1055D1849B3
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2020 15:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgCMOm4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Mar 2020 10:42:56 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38217 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgCMOm4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Mar 2020 10:42:56 -0400
Received: by mail-lj1-f196.google.com with SMTP id w1so10824480ljh.5
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2020 07:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=wi0ZOZS0+GtU0DMMvOL5TSwnKGX3w+vpuqOnCYIkxnQ=;
        b=GAi8I5ldrGaYxFAfCDsOKA8hmgclwmQVf0g49wqTgToLhpzR1A/b7lnvPFiC7Mr95q
         BdAzpCrUYFxm0XxS6TyQ+8Xjv1Ml4Q2lSblBe0Mo4LHaz14RJp50G5kJpuq+Ou2yvXPR
         /DyA/mlRAVEctLFvT/Tq5DDBY03n2eQCfQxoPL2miKqVVSsadZICY/EA+A+/kxeCB2tB
         jxOs4nSL7xnmYd60qbvdpCBaX0+cw9fVsILq4LCJqAbgsF94LVcnl1QzHU8ep2giRRXk
         TkALzb+c5m5dJctsvjl9uxzDmMXrl76trSxAILq+1iG/7L6kox+5QPSZ5CsxgDN7aau+
         TCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=wi0ZOZS0+GtU0DMMvOL5TSwnKGX3w+vpuqOnCYIkxnQ=;
        b=IWUMdYrvwOOfD+J1dOyRhu/BS40Zq7fG+wVmErX3QayguTwjI0G6cWqoQzywIovfjC
         kiFhnbAV/EWRTHOikJ17VIaEV0sONSBbBxNs3k+/ZQa7pAzyFztwCa14ZAwRUhIhE0hi
         Ec1QG3Ky110DO+xKNujg+GktsPjBGZLNKZWwn+W89ukog0Po7xHWobBXWnHBRxwcKKS9
         7x/QLmRa5i9NoRdOsPKm/1lcXwrrSMDtYNmkg0R/y2ZidD6nOnYxy7SJwpDEJrGNyCiQ
         inEesK6xlwtji5rkypbzpa0gVfUoKs/1WmcN/vdMGFEesMKQ6XFK6XZDT0F+01dn3PrI
         92Rw==
X-Gm-Message-State: ANhLgQ0TBzlsDfM4oNyp3u9n9C5ST/KNN8+T0HPWw9AGc7+5mFtCYNSu
        kSoSywLyjMCe/jfqv7Vcgka3rSmfhXU=
X-Google-Smtp-Source: ADFU+vuTMRfeI6NvqBWiSiwsiu0+oJeTmwvdW8ugyZ57C7GSwGLEaYCJEPXrtbhi5uPDno6q4HC6YA==
X-Received: by 2002:a2e:b892:: with SMTP id r18mr8696725ljp.252.1584110572581;
        Fri, 13 Mar 2020 07:42:52 -0700 (PDT)
Received: from saruman (88-113-215-213.elisa-laajakaista.fi. [88.113.215.213])
        by smtp.gmail.com with ESMTPSA id s8sm8279047ljs.60.2020.03.13.07.42.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:42:51 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Otavio Salvador <otavio.salvador@ossystems.com.br>,
        Peter Chen <peter.chen@nxp.com>
Cc:     Otavio Salvador <otavio@ossystems.com.br>,
        "sorganov\@gmail.com" <sorganov@gmail.com>,
        "mirq-linux\@rere.qmqm.pl" <mirq-linux@rere.qmqm.pl>,
        "felixhaedicke\@web.de" <felixhaedicke@web.de>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: Error when unloading g_serial module
In-Reply-To: <CAP9ODKr2jJqN1W6MLLstHwyu+15g7xMN5T-SKb0YYvVBAVHbLw@mail.gmail.com>
References: <CAP9ODKrH_7p1p1+9pXc-85m3yHHo_2YLouuXFBOLBr+gsSe+Ew@mail.gmail.com> <CAP9ODKrrgYgHvn6Rm8aC18z9gaCS51AFztD7xYF2H53hbPXS=w@mail.gmail.com> <20200312095304.GE14625@b29397-desktop> <CAP9ODKr2jJqN1W6MLLstHwyu+15g7xMN5T-SKb0YYvVBAVHbLw@mail.gmail.com>
Date:   Fri, 13 Mar 2020 16:42:47 +0200
Message-ID: <87y2s4fh94.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Otavio Salvador <otavio.salvador@ossystems.com.br> writes:
> On Thu, Mar 12, 2020 at 6:53 AM Peter Chen <peter.chen@nxp.com> wrote:
>> On 20-03-07 16:51:48, Otavio Salvador wrote:
>> > Sorry, here is the log withoiut any out-of-tree module:
>> > [root@rv1108 ~]# modprobe  -r g_serial
>> > [   86.928476] 8<--- cut here ---
>> > [   86.928781] Unable to handle kernel NULL pointer dereference at
>> > virtual address 000000d4
>> > [   86.929511] pgd =3D 2c058c2d
>> > [   86.929766] [000000d4] *pgd=3D6591f835, *pte=3D00000000, *ppte=3D00=
000000
>> > [   86.930350] Internal error: Oops: 17 [#1] SMP ARM
>> > [   86.930778] Modules linked in: usb_f_acm u_serial g_serial(-)
>> > libcomposite configfs zram zsmalloc clk_rk808 rtc_rk808 spi_rockchip
>> > [   86.931872] CPU: 0 PID: 498 Comm: sat Not tainted 5.4.23 #41
>> > [   86.932376] Hardware name: Rockchip (Device Tree)
>> > [   86.932818] PC is at _raw_spin_lock_irq+0x8/0x44
>> > [   86.933254] LR is at gs_close+0x28/0x1e4 [u_serial]
>> > [   86.933696] pc : [<c08483b0>]    lr : [<bf03fd28>]    psr: a00e0093
>> > [   86.934255] sp : c5c05d38  ip : 00005401  fp : ffffffed
>> > [   86.934724] r10: c6716db8  r9 : 00000000  r8 : c096d664
>> > [   86.935191] r7 : c5c07b40  r6 : 000000d4  r5 : c0d05c88  r4 : 00000=
000
>> > [   86.935774] r3 : 79f4b188  r2 : c63ca600  r1 : c5c07b40  r0 : 00000=
0d4
>> > [   86.936366] Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM
>> > Segment none
>> > [   86.937010] Control: 10c5387d  Table: 65be406a  DAC: 00000051
>> > [   86.937528] Process sat (pid: 498, stack limit =3D 0x87e8ad9f)
>> > [   86.938041] Stack: (0xc5c05d38 to 0xc5c06000)
>> > [   86.938440] 5d20:
>> >     0f300000 c6716db8
>> > [   86.939172] 5d40: c5c07b40 c63ca600 c5c07b40 79f4b188 c63ca600
>> > 00000000 c0ae9318 c5c07b40
>> > [   86.939904] 5d60: c096d664 00000000 c6716db8 c04f47cc 00000000
>> > c04fc400 c63ca600 00000000
>> > [   86.940637] 5d80: 00000000 c63ca600 c5c07b40 c0ae9318 c5c04000
>> > c096d664 0f300000 c6716db8
>> > [   86.941370] 5da0: ffffffed c04f66a0 800e0093 00000902 c0d8ecd8
>> > c593d180 c0d05c88 00000081
>> > [   86.942101] 5dc0: 00000000 79f4b188 00000000 c096d6e4 c0d05c88
>> > c5910e40 00000000 c6716db8
>> > [   86.942833] 5de0: c5c07b40 00000000 c5c07b40 c02b3250 c5c05ec0
>> > 79f4b188 c5c05ec0 c5c07b40
>> > [   86.943565] 5e00: c6716db8 c5c07b48 c02b3174 00000006 c6716db8
>> > c02aa874 c5c05ec0 00000000
>> > [   86.944296] 5e20: 00000902 00000000 00000000 00000006 c6716db8
>> > c02bd920 c0161a04 00000100
>> > [   86.945029] 5e40: 00000000 000041ed 00000000 00000000 c0d05c88
>> > 00000041 00000000 c014fc70
>> > [   86.945761] 5e60: ffffe000 00000000 c0a7273c c0152494 600e0013
>> > c5813b90 00000002 c6716db8
>> > [   86.946493] 5e80: c708b9d0 c6ef1bb0 00000000 c5813b7c c0a6abdc
>> > 79f4b188 c0d8ecd8 c0d05c88
>> > [   86.947225] 5ea0: c0d05c88 c5c05f70 00000001 fffff000 c5c04000
>> > 00000142 b63a3874 c02bf5f0
>> > [   86.947958] 5ec0: c708b9d0 c6ef1bb0 ad6e75ef 00000006 c70da015
>> > c6371e40 00000000 c6cba6e8
>> > [   86.948689] 5ee0: c6716db8 00000101 00000002 00000054 00000000
>> > 00000000 00000000 c5c05f00
>> > [   86.949424] 5f00: c583b600 c583ba58 00000000 c0843628 c583ba40
>> > c583b600 c0d05c88 c01556a8
>> > [   86.950155] 5f20: ffffe000 79f4b188 00000011 00000020 c70da000
>> > 00000000 00000000 00000002
>> > [   86.950890] 5f40: ffffff9c c02cea14 00000902 79f4b188 ffffff9c
>> > 00000011 c0d05c88 ffffff9c
>> > [   86.951622] 5f60: c70da000 c02abd18 00000000 79f4b188 00000902
>> > c0150000 00000006 00000100
>> > [   86.952355] 5f80: 00000001 79f4b188 003e75dc 00677470 00000011
>> > 00000142 c0101204 c5c04000
>> > [   86.953088] 5fa0: 00000142 c0101000 003e75dc 00677470 ffffff9c
>> > 003e75dc 00000902 00000000
>> > [   86.953824] 5fc0: 003e75dc 00677470 00000011 00000142 b57ff011
>> > 00020000 00020000 b63a3874
>> > [   86.954555] 5fe0: 00000002 b63a3688 b65a48d0 b6fa567c 600e0010
>> > ffffff9c 00000000 00000000
>> > [   86.955312] [<c08483b0>] (_raw_spin_lock_irq) from [<bf03fd28>]
>> > (gs_close+0x28/0x1e4 [u_serial])
>> > [   86.956121] [<bf03fd28>] (gs_close [u_serial]) from [<c04f47cc>]
>> > (tty_release+0xf0/0x47c)
>> > [   86.956864] [<c04f47cc>] (tty_release) from [<c04f66a0>]
>> > (tty_open+0x118/0x3fc)
>> > [   86.957528] [<c04f66a0>] (tty_open) from [<c02b3250>]
>> > (chrdev_open+0xdc/0x1a8)
>> > [   86.958184] [<c02b3250>] (chrdev_open) from [<c02aa874>]
>> > (do_dentry_open+0x21c/0x3f0)
>> > [   86.958898] [<c02aa874>] (do_dentry_open) from [<c02bd920>]
>> > (path_openat+0x470/0x1174)
>> > [   86.959615] [<c02bd920>] (path_openat) from [<c02bf5f0>]
>> > (do_filp_open+0x70/0xdc)
>> > [   86.960293] [<c02bf5f0>] (do_filp_open) from [<c02abd18>]
>> > (do_sys_open+0x180/0x214)
>> > [   86.960985] [<c02abd18>] (do_sys_open) from [<c0101000>]
>> > (ret_fast_syscall+0x0/0x54)
>> > [   86.961671] Exception stack(0xc5c05fa8 to 0xc5c05ff0)
>> > [   86.962130] 5fa0:                   003e75dc 00677470 ffffff9c
>> > 003e75dc 00000902 00000000
>> > [   86.962863] 5fc0: 003e75dc 00677470 00000011 00000142 b57ff011
>> > 00020000 00020000 b63a3874
>> > [   86.963591] 5fe0: 00000002 b63a3688 b65a48d0 b6fa567c
>> > [   86.964054] Code: f57ff05b e12fff1e f10c0080 f590f000 (e1903f9f)
>> > [   86.964603] ---[ end trace 2e9f93ef91ffad40 ]---
>> > [root@rv1108 ~]#
>> >
>>
>> Did you run any applications on it? I can't trigger it by using
>> the latest usb-linus tree, no matter the connection is there or not.
>
> Yes, we do.  We could reproduce it using minicom, for example.

Care to share some steps?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl5rm+cACgkQzL64meEa
mQbgrw//TjjaF61L0myCll5XOakxFvg1bjKyLNLCeeYJIKLyJ4MkWFMyCOrBmoU1
OWJggTNs0+0yR/7YFu9L281c0rpJF7RbJE2K+vSA9Kibbs8ZEugTDOjwP3016Y9W
FX4g4nIlL5jGYmSxtVM/BL4mtt+2O8niNw73NIKbKHn8v19XMfvyELyZgvnrWVeX
fVAzmG07oRblenATjKHuyJbsPY9uvIoTfra5W2UXlqb3cKMLD2UoOMt9RixyaZyM
z4n0HfOaz5ih+s2Xcv5ZtohOoiGOOViJJTOAydz2C5v/lpcwdpIG1dtPHSwKD1FZ
kYGP0G1ZNjN4R3PrJZsnPLWWMBhjbOXOWpYtf30yikfDs33cMD/FBd8ysivbL6zk
EuQktzkqPOLwJvEdo9EH9oHGuaBS+p5j+4VJqSlCy8rBTBdIubmBsp/6Xrzh42GE
YCgLhWdZDEGDmNHSV05WcjKZPazrwBs6RAjE0aQUh3uiVvE92vtgE4t2/WxBhsK/
Jq9vHKNhKV4ehpkF6716gg5sWOmfd2V7Vwk0fx6+vJUBMgNQDLXd9GRl3f4yz88D
Ni/MKXVY94MWiU0HmWCX0Dxjremuv363r42FRYb7+e4/v1qWWzxIEWM2lMDxyBWS
vB5zG/BXNx05n5xIdaTEUeZSTCZlkSFl4fcceqaWIpuS3BkFu0Q=
=PoBU
-----END PGP SIGNATURE-----
--=-=-=--
