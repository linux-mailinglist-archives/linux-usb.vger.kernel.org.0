Return-Path: <linux-usb+bounces-3459-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A44587FD713
	for <lists+linux-usb@lfdr.de>; Wed, 29 Nov 2023 13:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 602D4283070
	for <lists+linux-usb@lfdr.de>; Wed, 29 Nov 2023 12:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618261D6BD;
	Wed, 29 Nov 2023 12:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D02A95;
	Wed, 29 Nov 2023 04:48:24 -0800 (PST)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3ATClVJf92763797, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3ATClVJf92763797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Nov 2023 20:47:32 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 29 Nov 2023 20:47:32 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 29 Nov 2023 20:47:31 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7]) by
 RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7%5]) with mapi id
 15.01.2375.007; Wed, 29 Nov 2023 20:47:31 +0800
From: Hayes Wang <hayeswang@realtek.com>
To: Douglas Anderson <dianders@chromium.org>,
        Jakub Kicinski
	<kuba@kernel.org>,
        "David S . Miller" <davem@davemloft.net>
CC: Laura Nao <laura.nao@collabora.com>, Edward Hill <ecgh@chromium.org>,
        Alan
 Stern <stern@rowland.harvard.edu>,
        Grant Grundler <grundler@chromium.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman
	<horms@kernel.org>,
        =?iso-8859-1?Q?Bj=F8rn_Mork?= <bjorn@mork.no>,
        Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: RE: [PATCH net v2 2/5] r8152: Add RTL8152_INACCESSIBLE checks to more loops
Thread-Topic: [PATCH net v2 2/5] r8152: Add RTL8152_INACCESSIBLE checks to
 more loops
Thread-Index: AQHaIkOFTo2WdNHKX0+EoLHKjZ89lbCRNJBw
Date: Wed, 29 Nov 2023 12:47:31 +0000
Message-ID: <d6f843b90b7146059332c82159ba79ff@realtek.com>
References: <20231128133811.net.v2.1.I77097aa9ec01aeca1b3c75fde4ba5007a17fdf76@changeid>
 <20231128133811.net.v2.2.I79c8a6c8cafd89979af5407d77a6eda589833dca@changeid>
In-Reply-To: <20231128133811.net.v2.2.I79c8a6c8cafd89979af5407d77a6eda589833dca@changeid>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-kse-serverinfo: RTEXDAG01.realtek.com.tw, 9
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

Douglas Anderson <dianders@chromium.org>
> Sent: Wednesday, November 29, 2023 5:38 AM
[...]
> @@ -3000,6 +3000,8 @@ static void rtl8152_nic_reset(struct r8152 *tp)
>                 ocp_write_byte(tp, MCU_TYPE_PLA, PLA_CR, CR_RST);
>=20
>                 for (i =3D 0; i < 1000; i++) {
> +                       if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +                               return;
>                         if (!(ocp_read_byte(tp, MCU_TYPE_PLA, PLA_CR) & C=
R_RST))
>                                 break;
>                         usleep_range(100, 400);
> @@ -3329,6 +3331,8 @@ static void rtl_disable(struct r8152 *tp)
>         rxdy_gated_en(tp, true);
>=20
>         for (i =3D 0; i < 1000; i++) {
> +               if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +                       return;

I think you have to replace return with break.
Otherwise, rtl_stop_rx() wouldn't be called.
And, you may free the memory which is using, when rtl8152_close () is calle=
d.

>                 ocp_data =3D ocp_read_byte(tp, MCU_TYPE_PLA, PLA_OOB_CTRL=
);
>                 if ((ocp_data & FIFO_EMPTY) =3D=3D FIFO_EMPTY)
>                         break;
> @@ -3336,6 +3340,8 @@ static void rtl_disable(struct r8152 *tp)
>         }
>=20
>         for (i =3D 0; i < 1000; i++) {
> +               if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +                       return;

Same as above.

>                 if (ocp_read_word(tp, MCU_TYPE_PLA, PLA_TCR0) & TCR0_TX_E=
MPTY)
>                         break;
>                 usleep_range(1000, 2000);
> @@ -5499,6 +5505,8 @@ static void wait_oob_link_list_ready(struct r8152 *=
tp)
>         int i;
>=20
>         for (i =3D 0; i < 1000; i++) {
> +               if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +                       return;
>                 ocp_data =3D ocp_read_byte(tp, MCU_TYPE_PLA, PLA_OOB_CTRL=
);
>                 if (ocp_data & LINK_LIST_READY)
>                         break;
> --

Best Regards,
Hayes


