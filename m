Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 840E4488EEF
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 04:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237217AbiAJDca (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jan 2022 22:32:30 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53728
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232784AbiAJDca (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Jan 2022 22:32:30 -0500
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1F3713F337
        for <linux-usb@vger.kernel.org>; Mon, 10 Jan 2022 03:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641785549;
        bh=4sug0dLhRhcPGEjEeFGRdc9CkJbDLY5TT2Xgy/Zq/m4=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=o4uEzjbdhPEDYM4R2RjpNqGFWQMFHJsru71kz0jAxPQlfijPldIkHqXZ11xyJNicI
         02xXGSCFx2l65I9JpoAXxx3XtSRz0LGFK/G/CUNPIbIwpu8srT+O3BjxgaLV9KHLVV
         xMFFigy8Zlizk9swDkQhCFUvvvvcKu2cpRGA5yG+u55PTyDNBKZ5Nk3pwnUYC1qGdL
         2obKlOXtS3HGx87aiMrGYJphkl4aALWbhfACR3S5X3muDQawCjwS9H2s1bawmXjxxS
         k4oh3k233KlNMYNALCzlzoDtWAk2PCEghulT6Yzg4ljVsQ/yNUM7WbQ9vtEZ2Tv+8Q
         Aq6Y5yu0HrgkA==
Received: by mail-oo1-f70.google.com with SMTP id g20-20020a4a7554000000b002caefc8179cso7954997oof.1
        for <linux-usb@vger.kernel.org>; Sun, 09 Jan 2022 19:32:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4sug0dLhRhcPGEjEeFGRdc9CkJbDLY5TT2Xgy/Zq/m4=;
        b=iTKxQwtwb8cYukmBq+dP2NifYDCw+/avrppPOV+n8lLGLTGqXjqltAndZNcyUfOKVU
         6Y+EhLArx4pMBOAdoOpKSk7Cfsf7Drm7qa6pYX5Qi368fH83HrXhNtHN6Z/NzOhOA5u7
         7tKmcAWx7hjIBkD/9jjov4Zze/No7rb6AqLnBaQitdk6ZHwck7sF2KuAzeUC22K9QSwn
         TflglaqTFdKpq0ohj9iBZuF3QFGfhqPipNH6RYxfhqxuFTyzvlww5tqAx21S8ppe/sFL
         cpjK8OaRk4jmG37TOo+vSqYXIRYM9lLGEO8tuc2bIlRZTYEU06s3CsgCK8itJjB8btM8
         42Jw==
X-Gm-Message-State: AOAM533AuhNghwLtVw1UP8/yaWepVVHLYuRfyqn6/HlTQj1LTCfpmL1t
        nyiWuawxUsAmFgjDF5FL5OKWiG0ry38KG/7X0kWtIheNtmuHK5BTQZTb27Ydr0L0y+mFc8npKWh
        u8tnQxWyv9sA4ShwytwnLhqrczF5EN7FmHuHqktso9AHfx4/3CEw9iA==
X-Received: by 2002:a9d:6e8d:: with SMTP id a13mr11378719otr.269.1641785547703;
        Sun, 09 Jan 2022 19:32:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLsdsJgmKlmkubtw3Jj4nKMO1cuhmE8OAxmOip+T3/N5VsHQVKtOjqbMPVWPa+DqXrazfyUdGQ3mHzqHAwjIk=
X-Received: by 2002:a9d:6e8d:: with SMTP id a13mr11378703otr.269.1641785547443;
 Sun, 09 Jan 2022 19:32:27 -0800 (PST)
MIME-Version: 1.0
References: <20220105151427.8373-1-aaron.ma@canonical.com> <YdXVoNFB/Asq6bc/@lunn.ch>
 <bb6d8bc4-abee-8536-ca5b-bac11d1ecd53@suse.com> <YdYbZne6pBZzxSxA@lunn.ch>
 <CAAd53p52uGFjbiuOWAA-1dN7mTqQ0KFe9PxWvPL+fjfQb9K5vQ@mail.gmail.com>
 <YdbuXbtc64+Knbhm@lunn.ch> <CAAd53p5YnQZ0fDiwwo-q3bNMVFTJSMLcdkUuH-7=OSaRrW954Q@mail.gmail.com>
 <20220106183145.54b057c3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20220106183145.54b057c3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Mon, 10 Jan 2022 11:32:16 +0800
Message-ID: <CAAd53p7egh8G=fPMcua_FTHrA3HA6Dp85FqVhvcSbuO2y8Xz9A@mail.gmail.com>
Subject: Re: [PATCH 1/3 v3] net: usb: r8152: Check used MAC passthrough address
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>, Oliver Neukum <oneukum@suse.com>,
        Aaron Ma <aaron.ma@canonical.com>, henning.schild@siemens.com,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, davem@davemloft.net,
        hayeswang@realtek.com, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 7, 2022 at 10:31 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Fri, 7 Jan 2022 10:01:33 +0800 Kai-Heng Feng wrote:
> > > On device creation, udev can check if it now has both interfaces? If
> > > the internal interface is up, it is probably in use. Otherwise, take
> > > its MAC address and assign it to the dock interface, and give the
> > > internal interface a random MAC address, just in case.
> > >
> > > You probably need to delay NetworkManager, systemd-networkkd,
> > > /etc/network/interfaces etc, so that they don't do anything until
> > > after udevd has settled, indicating all devices have probably been
> > > found.
> >
> > I don't think it's a good idea. On my laptop,
> > systemd-udev-settle.service can add extra 5~10 seconds boot time
> > delay.
> > Furthermore, the external NIC in question is in a USB/Thunderbolt
> > dock, it can present pre-boot, or it can be hotplugged at any time.
>
> IIUC our guess is that this feature used for NAC and IEEE 802.1X.
> In that case someone is already provisioning certificates to all
> the machines, and must provide a config for all its interfaces.
> It should be pretty simple to also put the right MAC address override
> in the NetworkManager/systemd-networkd/whatever config, no?

If that's really the case, why do major OEMs came up with MAC
pass-through? Stupid may it be, I don't think it's a solution looking
for problem.

Kai-Heng
