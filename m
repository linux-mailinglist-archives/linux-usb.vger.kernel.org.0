Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B438B68CBF0
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 02:30:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbjBGBaU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Feb 2023 20:30:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbjBGBaR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Feb 2023 20:30:17 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF4F734C3C
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 17:30:15 -0800 (PST)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 044424253A
        for <linux-usb@vger.kernel.org>; Tue,  7 Feb 2023 01:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1675733414;
        bh=J2kutiaYAv0H4jCNv3t7c5H2zC3p7YBPhiEHmD+719E=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=Zjh7J627SYMWQT/KxLNVDEpHmBBYjVeoB3Z6GPprU9E93vUN+hKoEuyAo4/0JYgWo
         T3UksCx7UXpqOyZnhHWNGYsW03mtKIw1TU9InQn/v1zHoVJ/C/B9kX427dELt5hj/A
         jTxXuyHXvfu3wnXZnzbyF5BdB0ZHVvSKW5byYtozzNNhurc8wnvii3hlB0Tlgs0deb
         u2VqEN7uJPfYzdhNOdu/OxUTFw9DrrM22z7man2X+6MxHLLrn1c8XvFhO3IFdoEoqL
         B8vAkwJpRUfC2x2w1F3EgKWKS+vIaRNut+F++IX1tvN3l11V7XDPTuTk7lsrQMExjr
         Umidepi0pUseA==
Received: by mail-pl1-f199.google.com with SMTP id k14-20020a170902ce0e00b001992e19d3beso271631plg.5
        for <linux-usb@vger.kernel.org>; Mon, 06 Feb 2023 17:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2kutiaYAv0H4jCNv3t7c5H2zC3p7YBPhiEHmD+719E=;
        b=FlLY7T3ulvsrtFIMlgptRPd36Nl9pUMoCyibatzF8JPHRtHqE8o2R46AgADZcIWAAE
         bV8ce0FFuvG2vFtjS4UxQXaLHZGz7kwQIzHAzLpC2sOT9fX7gCXd7BnyUtqBrvYnmEYB
         glmpPxl7M7x09/pXwJ8P7+o463qNfuEd5O+ehBjwuCpVqwj/KxzN+Fy2hkvVJ8luNs8Q
         pgvjbGZyF/r/pj4ohRdpEiHjjD05kqKQtf6QP9Ze0dC4WkqiDvAZQwgyWtH6KejFNK3D
         HRROLtt7BCBxJas+bt/H36WrTYCSwrDZl2F1YXJQkz+G1r4tO98KS2vhC1VZ5cSmKRjc
         8XWg==
X-Gm-Message-State: AO0yUKXjstue2ZLMtkKTV4vEI9VIWHv6ObnOQDrVmMUnNdkW80UTitfT
        Ligw9lpogGDcJVcMvPNwPp6WGvGEgNt6VwXtMoUN6lynDIrZ2cQXqYj41qJ6idqHp25BtDY2FY1
        e9LOyzCZEZdN8q2+/brEmYBT8CfWnw0m75pA8JX0JTY5cs/RFTGOMtA==
X-Received: by 2002:a17:90a:c7cf:b0:230:a5d7:a479 with SMTP id gf15-20020a17090ac7cf00b00230a5d7a479mr1598351pjb.62.1675733411817;
        Mon, 06 Feb 2023 17:30:11 -0800 (PST)
X-Google-Smtp-Source: AK7set9Uh0toKiT475EtXbxzlp+MXeCTb9iY9IWEPZgYWWmIJQHfK+jc0rlN8WIE5pHSQ4oUs3gdEbQU47xKfnN4sgs=
X-Received: by 2002:a17:90a:c7cf:b0:230:a5d7:a479 with SMTP id
 gf15-20020a17090ac7cf00b00230a5d7a479mr1598339pjb.62.1675733411328; Mon, 06
 Feb 2023 17:30:11 -0800 (PST)
MIME-Version: 1.0
References: <20230110081938.30308-1-yangyinglu@loongson.cn>
 <CAAd53p6eUNJf7aNkiXcTKAfhL_cM1Ki7JnW7s4oP7BeFQkP6ag@mail.gmail.com>
 <e684e8d7-6fc9-3331-868c-6cc4122f2cef@loongson.cn> <CAAd53p7_dQc0z_2Bw29xxnxMx6rSdJE7hj-MvH3HszSyE0uWCQ@mail.gmail.com>
 <55bc0144-6d04-db68-b77b-59bd9e7206dc@loongson.cn>
In-Reply-To: <55bc0144-6d04-db68-b77b-59bd9e7206dc@loongson.cn>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Tue, 7 Feb 2023 09:30:00 +0800
Message-ID: <CAAd53p6hyHDV1s6=6ML_Gqw_=w1VypoQhtTGiLLvNMwGw930Vw@mail.gmail.com>
Subject: Re: [PATCH v1] usb: handle warm-reset port requests on hub_init
To:     yangyinglu <yangyinglu@loongson.cn>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Bhuvanesh Surachari <Bhuvanesh_Surachari@mentor.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Ray Chi <raychi@google.com>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yinbo Zhu <zhuyinbo@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi yangyinglu,

On Wed, Feb 1, 2023 at 5:25 PM yangyinglu <yangyinglu@loongson.cn> wrote:
>
> Hi  Kai-Heng,
>
> I'm sorry that it took so long to reply. I found other ways to fix this
> problem. I don't need to fix this code. Thank you.

I actually think this patch is a valid fix, I just want to see more
details for better understanding.

But it's also good that you found other ways to fix it.

Kai-Heng

>
>
> =E5=9C=A8 2023/1/11 =E4=B8=8B=E5=8D=883:04, Kai-Heng Feng =E5=86=99=E9=81=
=93:
> > Hi yangyinglu,
> >
> > On Wed, Jan 11, 2023 at 11:32 AM yangyinglu <yangyinglu@loongson.cn> wr=
ote:
> >>
> >>
> >>
> >> =E5=9C=A8 2023/1/11 =E4=B8=8A=E5=8D=8810:33, Kai-Heng Feng =E5=86=99=
=E9=81=93:
> >>> Hi yangyinglu,
> >>>
> >>> On Tue, Jan 10, 2023 at 4:20 PM yangyinglu <yangyinglu@loongson.cn> w=
rote:
> >>>>
> >>>> USB-C storage device not detected on USB 3.0 host when
> >>>> plugged in after boot, so need to warm-reset port
> >>>
> >>> Is it possible to enable USB dyndbg, plug a USB 3.0 device, then past=
e
> >>> the relevant dmesg here? Thanks!
> >>>
> >>> Kai-Heng
> >>
> >>    hi,
> >>       After entering the system, directly plug and unplug the USB flas=
h
> >> disk. usb control is  etron Technology Inc.The log is as follows:
> >>    [   10.354484] radeon 0000:04:00.0: vgaarb: changed VGA decodes:
> >> olddecodes=3Dio+mem,decodes=3Dnone:owns=3Dnone
> >>    [   10.484794] bridge: filtering via arp/ip/ip6tables is no longer
> >> available by default. Update your scripts to load br_netfilter if you
> >> need this.
> >>    [   10.506968] tun: Universal TUN/TAP device driver, 1.6
> >>    [   10.514128] virbr0: port 1(virbr0-nic) entered blocking state
> >>    [   10.519858] virbr0: port 1(virbr0-nic) entered disabled state
> >>    [   10.525646] device virbr0-nic entered promiscuous mode
> >>    [   10.666536] virbr0: port 1(virbr0-nic) entered blocking state
> >>    [   10.672268] virbr0: port 1(virbr0-nic) entered listening state
> >>    [   10.748564] virbr0: port 1(virbr0-nic) entered disabled state
> >>
> >>    Loongnix GNU/Linux 20 Release 3 loongson-pc ttyS0
> >>
> >>
> >>    loongson-pc login: [  147.701011] usb usb4-port1: Cannot enable. Ma=
ybe
> >> the USB cable is bad?
> >>    [  151.793206] usb usb4-port1: Cannot enable. Maybe the USB cable i=
s bad?
> >>    [  151.799726] usb usb4-port1: attempt power cycle
> >>    [  157.465465] usb usb4-port1: Cannot enable. Maybe the USB cable i=
s bad?
> >>    [  161.557649] usb usb4-port1: Cannot enable. Maybe the USB cable i=
s bad?
> >>    [  161.564167] usb usb4-port1: unable to enumerate USB device
> >>    [  165.641834] usb usb4-port1: Cannot enable. Maybe the USB cable i=
s bad?
> >
> > Is it possible to enable USB dyndbg by adding kernel parameter
> > "usbcore.dyndbg" so we can see the portsc?
> >
> > Kai-Heng
> >
> >>
> >>>
> >>>>
> >>>> Signed-off-by: yangyinglu <yangyinglu@loongson.cn>
> >>>> ---
> >>>>    drivers/usb/core/hub.c | 2 +-
> >>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> >>>> index 77e73fc8d673..bd4496b80c2d 100644
> >>>> --- a/drivers/usb/core/hub.c
> >>>> +++ b/drivers/usb/core/hub.c
> >>>> @@ -1159,7 +1159,7 @@ static void hub_activate(struct usb_hub *hub, =
enum hub_activation_type type)
> >>>>                   }
> >>>>
> >>>>                   /* Make sure a warm-reset request is handled by po=
rt_event */
> >>>> -               if (type =3D=3D HUB_RESUME &&
> >>>> +               if ((type =3D=3D HUB_RESUME || type =3D=3D HUB_INIT2=
) &&
> >>>>                       hub_port_warm_reset_required(hub, port1, ports=
tatus))
> >>>>                           set_bit(port1, hub->event_bits);
> >>>>
> >>>> --
> >>>> 2.20.1
> >>>>
> >>
>
