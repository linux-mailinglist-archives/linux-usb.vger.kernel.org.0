Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 199491E77A8
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 10:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726459AbgE2IDb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 04:03:31 -0400
Received: from mail-eopbgr80073.outbound.protection.outlook.com ([40.107.8.73]:58882
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725821AbgE2IDY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 May 2020 04:03:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dge4AajYQ+7ZnNZ9h3RMqAdupwYqu7w/vvLx0M7YXLBt6sSaDXjtJS0TutTFsgyHg6/iolk76XwwF73eZ02lJIsuEJNEgisIUtoqDM4iPoaC34yPs0OoWIyyaoAaagNh0InYZtHSOTUblzripDkUeeY5ntTJGx2j3EYnCA6GuPsyzXB9QpQpBAWVrxtMR6pUVmqt5M9LsXeB3YxML7RzrTx08begbuuDnSf6LrvUd3SGICuTHwGPdAdewCAGNG9ucRNz0Wy0Wyt+0s45vD6ZCWiyoj3W/g9dHTtGRDK6TNbEAX6QBFxdv2xg1PYCvZsr2ndX/Ds8uGryJ3hKoTNNWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AS8vilZcgYP4Lj7BjQ9vzw6oHZjbqw7ftJuagAPjVU=;
 b=HscYVUm1mWrdkjWTkdb/JG9rNayJLjGIRy9f+G+yKDZZJWoYaVxP7e6s4kISUhsOfWknvRksciJoZlX1/rzWQX4/KcwH1Ph612wMT2vVCmitWyLmIzQNt7Qzsop495iRVR4yuzn27iYrr9QgWO71ZdNoF/n8wGAl21v2p64s/hxrs9ZiYE2zUkSV8pnXOkqtzjoOqHzv7CWI1K6pkSZo4GblMQQxko+FbT+tZfuZ2zEXjlybHHdBC0aLhEtXpmCmBuXjpt2gLsPjnV6XBtyXsKeFTV0sK80uI7Z+xBhUZeQTLkiVKijZZVF6rgcHMJSOvQ19NdlX6m35NBBP47OxNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AS8vilZcgYP4Lj7BjQ9vzw6oHZjbqw7ftJuagAPjVU=;
 b=cdl64mxeU6w7YDyEpogfJ3gNSPVzdcDqpGQAx6tKwxwl9cE3O73WhmjeTwz0la0r7uj8+ggvQDOzTfNT+tjknZlqSlxvpIC31zFRJ0TvffYLHb8Bwq0IbvspGMNmy5bUBAk3ohIDKkhoxzBzD4ATvy4nqKx8VPWAapXeKq+U5ZI=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7175.eurprd04.prod.outlook.com (2603:10a6:20b:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Fri, 29 May
 2020 08:03:20 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 08:03:20 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alexandru M Stan <amstan@chromium.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        Evan Green <evgreen@chromium.org>
Subject: Re: Splitting 1 USB port between 2 devices
Thread-Topic: Splitting 1 USB port between 2 devices
Thread-Index: AQHWNXFnHV8lbJp3n0K0Ibt3KIyJ6qi+tHUA
Date:   Fri, 29 May 2020 08:03:20 +0000
Message-ID: <20200529080344.GC32755@b29397-desktop>
References: <CAHNYxRzH3F7r4A3hOJYWw8fwoSLBESyyN7XQ4HYfw1Y3qoNbJg@mail.gmail.com>
In-Reply-To: <CAHNYxRzH3F7r4A3hOJYWw8fwoSLBESyyN7XQ4HYfw1Y3qoNbJg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 26a63ad8-7750-40a0-31c8-08d803a6c099
x-ms-traffictypediagnostic: AM7PR04MB7175:
x-microsoft-antispam-prvs: <AM7PR04MB71758E865A84D2589A2427108B8F0@AM7PR04MB7175.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04180B6720
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4vmsm1C2lVLLDshEx34DRcjpNe1XVEGNewFjDbecqxSRxWAEFHZTvzLt0ZkhUKqaDp35hEzipDsZBZaXklY3gS4YOdmWrjJ/Kp8EB+0gG3LGubyydorU9U5fVq2LCllZ2XfQuSJRkJP8ASV8F2wGRp4X1GGykiBcdYx011ZPExYI57W4bfRh7kI9RXUBa6wSzqcEav8vWBaFiN6vr6zjfyi0bd7OBRY/tZJd6WcvA+9oj5uGEcAVMJX7hzbO3JGWPg+tzyfUbONLgCqCyVtU9s2CRFDKuY7Bz0kmgzFefTmltiyj0rejKlMc8aicgc+Ot/5U7/zN7AnXyql7PHlUkA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(376002)(346002)(366004)(136003)(396003)(39860400002)(44832011)(91956017)(71200400001)(6486002)(9686003)(2906002)(33656002)(5660300002)(6916009)(66946007)(8676002)(1076003)(64756008)(66446008)(76116006)(66476007)(66556008)(4326008)(8936002)(316002)(54906003)(186003)(478600001)(6506007)(53546011)(86362001)(26005)(6512007)(33716001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: JgCLA4+xWbMFERQNek+EvLK/OmkXnl17LuxBiH2KoDXydpw524/QEuYEZVA4ZN+3ahiTOYfYyhE5UYj9PFSdYM05QzpjZAvJNrbGBHVml/fccpXq2MdiE67frjPnZPjmW1xZTWHJXQAZ0rXXz/IQ1p7Dp/TeaOLB6mr7/Gmx3wknnLgYQ5SAYJ+YPOBE1S0xN5L5LkTMgE4YRroVDXtUxzPXDuOe+QhmmP/XJPAmPHpx78o48VptrZIGp7bm+Q5sRD8yt3E/btxe7buoHW4zZm1htO07JVaxwzf4uvuST4ZVcA7t6eBgnR49fqBuU36ZGUg1ix/FysqurDR72TgkWov885Ml56B/dCNYOi++zv44Q6UES9pg19aQcZj0vd9BLW5XIJC8zrjqQl5VkfR/6dpyZochL6OfbXiZY5EmvkqeFmM/nW9ULqpDFOl5d+p9Q7ILxk14os8R+wPuVhEg+Tbo2v9BZ+ezUxmywJH0uZM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <01CB5949B69B9E458D367A48CB09F5B2@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a63ad8-7750-40a0-31c8-08d803a6c099
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2020 08:03:20.2290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qzhx6ucrmXySYrhRRfuyT9hGj7vEgLd7/RdjDJbX4dxSI9TBTisNBeugilvwByZNZWqT44lDMx2pZhLB5wpIcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7175
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-05-28 14:16:21, Alexandru M Stan wrote:
> Hello,
>=20
> I'm currently helping to design the hardware for yet another chromebook.
>=20
> The particular SOC (and most other alternatives BTH) we're using has a
> limited amount of USB controllers available, usually just 1. Being a
> chromebook we have quite a few needs for USB though: 2 type C ports,
> pogo pins for a connected keyboard, 2 cameras, a type A port. We're
> probably going to have an internal hub no matter what, but it looks
> like even a 4 port hub might not be enough, going to yet a bigger hub
> (which might not be as power efficient) is not ideal, chaining hubs
> that are builtin is also meh.
>=20
> I noticed that some of our cameras use the USB3.0 lines only. Other
> cameras, since they're lower resolution ones use only USB2.0. I
> wondered what would happen if the 2 types of cameras were to share a
> port, since none of the data lines are common between them.
>=20
> I've built a little contraption to test this. It seems to work as
> intended. Both usb cameras seem to enumerate, I can even stream from
> both at the same time with no problem. A macbook seems to also kind of
> work (I can't stream from both for some reason, but i can open either
> I want). I can upload detailed lsusb outputs if needed.
>=20
> My question here is: is this legal as far as Linux is concerned? Can 2
> devices be enumerated under one physical port (even though we're
> talking about separate usb2.0 and 3.0 bus topologies).

In fact, it is two ports (roothubs) from software view, the possible risk f=
or
this design is from hardware view, mainly for USB3

- You can't use external Type-A USB3 port
- USB3-only device should be few, USB3 devices need to consider back
compatible. And you can't only connect USB3 lines for standard USB3
device, it may cause that device can't work if it downgrade to USB2.

>=20
> It seems to work so far with our linux 5.4 chrome os fork (which as
> far as I know is identical to 5.4 LTS for matters concerning usb). But
> the question is would this keep working?
>=20
> Is there any weird port reset interaction that might be annoying here?
> I wouldn't want a reset on the usb 2.0 device to affect the 3.0
> device.

Bus reset is per roothub, this should not happen.

>=20
> Is there any other higher level port management going on in linux,
> where there might be plans to keep track of things, but it's not piped
> enough to see it affect (negatively) this use case.
>=20
> If this is ok, was something like this ever done before?

Maybe Alan knows it more.

>=20
> Bonus, maybe unrelated, question: I've wondered in the past if it's
> legal to route 2.0 and 3.0 lines through different paths.
>=20
> For example, imagine I had one of each:
>  * 2+3.0 controller
>  * 2+3.0 device (eg a 3.0 type A port)
>  * 2.0 device (older usb device)
>=20
> Would it be legal to use only a 2.0 hub, with the 3.0 data lines for
> the 3.0 device bypassing the hub. This would be cheaper than having a
> fully fledged 2+3.0 hub with the second port's 3.0 data lines wasted.

I think it could work, the USB3 lines go to controller directly, and
xHCI driver talks with it and USB2 lines go 2.0 HUB's downstream port,
and EHCI driver talks with it, it will not influence each other.

--=20

Thanks,
Peter Chen=
