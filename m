Return-Path: <linux-usb+bounces-1976-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 034E87D0E6E
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 13:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84F032824DC
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 11:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4358F18E3D;
	Fri, 20 Oct 2023 11:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E583CA75;
	Fri, 20 Oct 2023 11:32:26 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97DD21A8;
	Fri, 20 Oct 2023 04:32:21 -0700 (PDT)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 39KBVHwcC4163596, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.93/5.92) with ESMTPS id 39KBVHwcC4163596
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Oct 2023 19:31:17 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 20 Oct 2023 19:31:17 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 20 Oct 2023 19:31:17 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7]) by
 RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7%5]) with mapi id
 15.01.2375.007; Fri, 20 Oct 2023 19:31:16 +0800
From: Hayes Wang <hayeswang@realtek.com>
To: Douglas Anderson <dianders@chromium.org>,
        Jakub Kicinski
	<kuba@kernel.org>,
        "David S . Miller" <davem@davemloft.net>
CC: Grant Grundler <grundler@chromium.org>, Edward Hill <ecgh@chromium.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman
	<horms@kernel.org>, Laura Nao <laura.nao@collabora.com>,
        Alan Stern
	<stern@rowland.harvard.edu>,
        =?iso-8859-1?Q?Bj=F8rn_Mork?= <bjorn@mork.no>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: RE: [PATCH v4 5/5] r8152: Block future register access if register access fails
Thread-Topic: [PATCH v4 5/5] r8152: Block future register access if register
 access fails
Thread-Index: AQHaAtJRIbIHTuR1b0yzMA85nEY4kLBSW1lw
Date: Fri, 20 Oct 2023 11:31:16 +0000
Message-ID: <eaf05cf1486c418790a1b54cbcda3a98@realtek.com>
References: <20231019212130.3146151-1-dianders@chromium.org>
 <20231019142019.v4.5.Ib2affdbfdc2527aaeef9b46d4f23f7c04147faeb@changeid>
In-Reply-To: <20231019142019.v4.5.Ib2affdbfdc2527aaeef9b46d4f23f7c04147faeb@changeid>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.22.228.6]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

Douglas Anderson <dianders@chromium.org>
> Sent: Friday, October 20, 2023 5:20 AM
[...]
>  static int generic_ocp_read(struct r8152 *tp, u16 index, u16 size,
> @@ -8265,6 +8353,17 @@ static int rtl8152_pre_reset(struct usb_interface =
*intf)
>         if (!tp)
>                 return 0;
>=20
> +       /* We can only use the optimized reset if we made it to the end o=
f
> +        * probe without any register access fails, which sets
> +        * `PROBED_WITH_NO_ERRORS` to true. If we didn't have that then r=
eturn
> +        * an error here which tells the USB framework to fully unbind/re=
bind
> +        * our driver.
> +        */
> +       if (!test_bit(PROBED_WITH_NO_ERRORS, &tp->flags)) {
> +               mutex_unlock(&tp->control);

I think you forget to remove mutex_unlock here.

> +               return -EIO;
> +       }
> +
>         netdev =3D tp->netdev;
>         if (!netif_running(netdev))
>                 return 0;
> @@ -8277,7 +8376,9 @@ static int rtl8152_pre_reset(struct usb_interface *=
intf)
>         napi_disable(&tp->napi);
>         if (netif_carrier_ok(netdev)) {
>                 mutex_lock(&tp->control);
> +               set_bit(IN_PRE_RESET, &tp->flags);
>                 tp->rtl_ops.disable(tp);
> +               clear_bit(IN_PRE_RESET, &tp->flags);
>                 mutex_unlock(&tp->control);
>         }
>=20
> @@ -8293,6 +8394,8 @@ static int rtl8152_post_reset(struct usb_interface =
*intf)
>         if (!tp)
>                 return 0;
>=20
> +       rtl_set_accessible(tp);
> +

Excuse me. I have a new idea. You could check if it is possible.
If you remove test_bit(PROBED_WITH_NO_ERRORS, &tp->flags) in pre_reset(),
the driver wouldn't be unbound and rebound. Instead, you test PROBED_WITH_N=
O_ERRORS
here to re-initialize the device. Then, you could limit the times of USB re=
set, and
the infinite loop wouldn't occur. The code would be like the following,

	if (!test_bit(PROBED_WITH_NO_ERRORS, &tp->flags)) {
		/* re-init */
		mutex_lock(&tp->control);
		tp->rtl_ops.init(tp);
		mutex_unlock(&tp->control);
		rtl_hw_phy_work_func_t(&tp->hw_phy_work.work);

		/* re-open(). Maybe move after checking netif_running(netdev) */
		mutex_lock(&tp->control);
		tp->rtl_ops.up(tp);
		mutex_unlock(&tp->control);

		/* check if there is any control error */
		if (test_bit(RTL8152_INACCESSIBLE, &tp->flags) {
			if (tp->reg_access_reset_count < REGISTER_ACCESS_MAX_RESETS) {
				/* queue reset again ? */
			} else {
				...
			}
			/* return 0 ? */
		} else {
			set_bit(PROBED_WITH_NO_ERRORS, &tp->flags)
		}
	}


Best Regards,
Hayes

>         /* reset the MAC address in case of policy change */
>         if (determine_ethernet_addr(tp, &sa) >=3D 0) {
>                 rtnl_lock();
> @@ -9494,17 +9597,35 @@ static u8 __rtl_get_hw_ver(struct usb_device *ude=
v)
>         __le32 *tmp;
>         u8 version;
>         int ret;
> +       int i;
>=20
>         tmp =3D kmalloc(sizeof(*tmp), GFP_KERNEL);
>         if (!tmp)
>                 return 0;
>=20
> -       ret =3D usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
> -                             RTL8152_REQ_GET_REGS, RTL8152_REQT_READ,
> -                             PLA_TCR0, MCU_TYPE_PLA, tmp, sizeof(*tmp),
> -                             USB_CTRL_GET_TIMEOUT);
> -       if (ret > 0)
> -               ocp_data =3D (__le32_to_cpu(*tmp) >> 16) & VERSION_MASK;
> +       /* Retry up to 3 times in case there is a transitory error. We do=
 this
> +        * since retrying a read of the version is always safe and this
> +        * function doesn't take advantage of r8152_control_msg() which w=
ould
> +        * queue up a reset upon error.
> +        *
> +        * NOTE: The fact that this read never queues up a reset prevents=
 us
> +        * from getting into a unbind/bind loop if usb_control_msg() fail=
s
> +        * 100% of the time. This is the first control message we do at
> +        * probe time and 3 failures in a row here will cause probe to fa=
il.
> +        */
> +       for (i =3D 0; i < 3; i++) {
> +               ret =3D usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
> +                                     RTL8152_REQ_GET_REGS, RTL8152_REQT_=
READ,
> +                                     PLA_TCR0, MCU_TYPE_PLA, tmp, sizeof=
(*tmp),
> +                                     USB_CTRL_GET_TIMEOUT);
> +               if (ret > 0) {
> +                       ocp_data =3D (__le32_to_cpu(*tmp) >> 16) & VERSIO=
N_MASK;
> +                       break;
> +               }
> +       }
> +
> +       if (i !=3D 0 && ret > 0)
> +               dev_warn(&udev->dev, "Needed %d retries to read version\n=
", i);
>=20
>         kfree(tmp);
>=20
> @@ -9784,7 +9905,29 @@ static int rtl8152_probe(struct usb_interface *int=
f,
>         else
>                 device_set_wakeup_enable(&udev->dev, false);
>=20
> -       netif_info(tp, probe, netdev, "%s\n", DRIVER_VERSION);
> +       mutex_lock(&tp->control);
> +       if (test_bit(RTL8152_INACCESSIBLE, &tp->flags)) {
> +               /* If the device is marked inaccessible before probe even
> +                * finished then one of two things happened. Either we go=
t a
> +                * USB error during probe or the user already unplugged t=
he
> +                * device.
> +                *
> +                * If we got a USB error during probe then we skipped doi=
ng a
> +                * reset in r8152_control_msg() and deferred it to here. =
This
> +                * is because the queued reset will give up after 1 secon=
d
> +                * (see usb_lock_device_for_reset()) and we want to make =
sure
> +                * that we queue things up right before probe finishes.
> +                *
> +                * If the user already unplugged the device then the USB
> +                * framework will call unbind right away for us. The extr=
a
> +                * reset we queue up here will be harmless.
> +                */
> +               usb_queue_reset_device(tp->intf);
> +       } else {
> +               set_bit(PROBED_WITH_NO_ERRORS, &tp->flags);
> +               netif_info(tp, probe, netdev, "%s\n", DRIVER_VERSION);
> +       }
> +       mutex_unlock(&tp->control);
>=20
>         return 0;
>=20
> --
> 2.42.0.758.gaed0368e0e-goog


