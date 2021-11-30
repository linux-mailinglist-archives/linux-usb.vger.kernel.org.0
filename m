Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D854E462A93
	for <lists+linux-usb@lfdr.de>; Tue, 30 Nov 2021 03:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237647AbhK3Cjs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Nov 2021 21:39:48 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:50812
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237637AbhK3Cjs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Nov 2021 21:39:48 -0500
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 687DE3F1E5
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 02:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638239786;
        bh=oxiuaktx/5qokjahXHh+aG0BtjuDQ9z0gQ+Y+lO+MIY=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=dDSGyL8E+h3bj11IiSG0En/B7G1C0boKH30zGmHbtWZU3lyFB1uVKrJ15ABv9nYwS
         xdguvzbe6Hs6DFOvXr0TTXieaCKALpmLulMOhdLofZEMV4pzXg/AJCsSjdrEMX8bzd
         N6taiotp5riqdhYHv4GwuVCkoQn4swwm0kOx8Z8+TUeNVdMxMCRc4KldpGiQA/IbTY
         2ljB5EdJxSXBXeef4j/6Eg0ZO3zAVcmvM5U/PPe4Jg1/FU668KHroKRHR/ihPB4vVO
         Kep0fJ5DfySmCKUnlYCagPTV6MaG0IeHrQw76tDaSNfZ+E4J9tOgGMfVS410On2WdD
         90ljAzXjhsVNQ==
Received: by mail-oi1-f199.google.com with SMTP id i82-20020acab855000000b002bcea082cf7so12794276oif.22
        for <linux-usb@vger.kernel.org>; Mon, 29 Nov 2021 18:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oxiuaktx/5qokjahXHh+aG0BtjuDQ9z0gQ+Y+lO+MIY=;
        b=a0nO0LAII63H5Gdrv4VfzCDX8lGP6cIH4tEy+Dn9jI8RSo9Y07RjOnirGJrtsSxGmv
         daD11sqSvlUhraFmAnVm9JiIqMHu3w4tUAUT8Pn/NatvlCDwZ3X3XNaoA0iURYXBgcKk
         J3qAUHRFe/Z5atSuuYv1h0s2fdahEL0sYwNFtbcB02sl1BkqmtTicy8XeAdF191Q7c87
         62P/Sch8+pDo9nJaI5fVLLlxpY9sO3feoE4m/pUyC6c9gvaRIKZuAZ0LiwGGUC9KFt8x
         Gdx8Kystfy1hZXY1f4CopQmQwqIbwI1owvZgONvE/qMbEl9SL5MxN9mlmsJARStymkLc
         9tOw==
X-Gm-Message-State: AOAM5308itJmnjpSZdAcKzfRsNlPZoeabhCStqBy8totrAu3lwiOtSmq
        cWjYq/5hImgq8a3qIkUQccJKdTi3m+H0dxsa9/x/WVBs5tlC4XgXeNufxw2jT0sH2mGGLgcClJn
        mPpYd9vIu+5RCOZnb3pKONXbIZzQ475jbvE0Z7mbn2JegMtJvNY/LTA==
X-Received: by 2002:a05:6808:199c:: with SMTP id bj28mr1828896oib.98.1638239785260;
        Mon, 29 Nov 2021 18:36:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwECiqy5wYL/UHUHM3vDmSGFDhyJzE2Viw+GZwM+SxZwdNz9h+02lWM0SklN69XXUZ609u/sclcTp0eJ00lof4=
X-Received: by 2002:a05:6808:199c:: with SMTP id bj28mr1828873oib.98.1638239784931;
 Mon, 29 Nov 2021 18:36:24 -0800 (PST)
MIME-Version: 1.0
References: <20211126115652.1134230-1-kai.heng.feng@canonical.com> <745bd358-c34c-9deb-42e6-6f6a54fd3e2e@linux.intel.com>
In-Reply-To: <745bd358-c34c-9deb-42e6-6f6a54fd3e2e@linux.intel.com>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Tue, 30 Nov 2021 10:36:13 +0800
Message-ID: <CAAd53p7ta292yNKYBn3mtav-kPHwtd1GANy9bdCMXL=SPZK+kg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: core: Avoid doing warm reset on disconnect event
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andrew Lunn <andrew@lunn.ch>, Rajat Jain <rajatja@google.com>,
        Chris Chiu <chris.chiu@canonical.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 29, 2021 at 6:18 PM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 26.11.2021 13.56, Kai-Heng Feng wrote:
> > Unplugging USB device may cause an incorrect warm reset loop:
> > [  143.039019] xhci_hcd 0000:00:14.0: Port change event, 2-3, id 19, po=
rtsc: 0x4202c0
> > [  143.039025] xhci_hcd 0000:00:14.0: handle_port_status: starting usb2=
 port polling.
> > [  143.039051] hub 2-0:1.0: state 7 ports 10 chg 0000 evt 0008
> > [  143.039058] xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x4202c=
0, return 0x4102c0
> > [  143.039092] xhci_hcd 0000:00:14.0: clear port3 connect change, ports=
c: 0x4002c0
> > [  143.039096] usb usb2-port3: link state change
> > [  143.039099] xhci_hcd 0000:00:14.0: clear port3 link state change, po=
rtsc: 0x2c0
> > [  143.039101] usb usb2-port3: do warm reset
> > [  143.096736] xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x2b0, =
return 0x2b0
> > [  143.096751] usb usb2-port3: not warm reset yet, waiting 50ms
> > [  143.131500] xhci_hcd 0000:00:14.0: Can't queue urb, port error, link=
 inactive
> > [  143.138260] xhci_hcd 0000:00:14.0: Port change event, 2-3, id 19, po=
rtsc: 0x2802a0
> > [  143.138263] xhci_hcd 0000:00:14.0: handle_port_status: starting usb2=
 port polling.
> > [  143.160756] xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x2802a=
0, return 0x3002a0
> > [  143.160798] usb usb2-port3: not warm reset yet, waiting 200ms
> >
> > The warm reset is due to its PLS is in eSS.Inactive state. However, USB
> > 3.2 spec table 10-13 mentions "Ports can be disabled by either a fault
> > condition (disconnect event or other fault condition)", xHCI 1.2 spec
> > table 5-27 also states that "This flag shall automatically be cleared t=
o
> > =E2=80=980=E2=80=99 by a disconnect event or other fault condition." on=
 PED.
> >
> > So use CSC =3D 0 and PED =3D 0 as indication that device is disconnecti=
ng to
> > avoid doing warm reset.
>
> My understanding is that PED =3D 0 in case of disconnect, error (PLS=3DIn=
active), or
> during active reset signalling. See xHCI Figure 4-27: USB3 Root Hub Port =
State Machine.
> signal states (0,0,0,0) are PP,CCS,PED,PR.

I think it's 1,0,0,0? So for my case, the port is in Error state (PLS
=3D Inactive, 1,0,0,0).

>
> I'm looking at a similar case where Inactive link is reported at disconne=
ct for a while
> before missing terminations are detected and link finally goes to RxDetec=
t.

So the PLS goes from Inactive to RxDetect after a while?
Is the case you are working on also EHL?

>
> If the port was reset immediately when Inactive link state was reported t=
he port stays stuck
> in port reset.
> This might have been related to the address0 locking issues recently fixe=
d.
>
> Anyway, to avoid the extra reset of a removed USB3 device I started polli=
ng the link state of
> the Inactive link for some time before resetting it. This gives the link =
time to detect
> missing terminations and go to RxDetect, and driver can skip the reset.
>
> Planning on upstreaming it, patch is here:
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?h=
=3Dfix_avoid_disconnect_reset&id=3D72d20c026b7812d096c6b5184a3888894401c829

Thanks, let me test this out.

Kai-Heng

>
> -Mathias
