Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC15348A554
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jan 2022 02:51:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346426AbiAKBv0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 20:51:26 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:46240
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346422AbiAKBvZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 20:51:25 -0500
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8D0B43FFD7
        for <linux-usb@vger.kernel.org>; Tue, 11 Jan 2022 01:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641865884;
        bh=k+G5Qj8aSKUpp+MDhp0FFQZX3fUBv+M0sfrhlFCHfLc=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=LXmAzLvj4E91Ak4J1Kooc5Qj/zdK3uXICt7VrHy7zusd/l+WfwEC9QkTt8KA9mJYB
         KGvDcqJEZHyxmSwatYfllEUSYa6X7FvYvHq2lSP4vf18cWlzNLcoUApif/f3rOolda
         HuRhGrM+twbTJbEVDd2yqXFNIQVldSTdIxW8NNktdGonFvBsU3Xf50Sap0Ty00hORY
         tP/TQvoi+4jQzFVkdo7GaTaNSFgr40B0ACGrXvI45qbqmKqWddyAvNVk19pCgYaKDf
         z4N/QDWS/et7CI7/Q1ifMLkXas6jP0AfyhdnNzTLRmb5cEXhKS+fJIE4HDF0iSkWJ9
         clY5/LQEEdfYA==
Received: by mail-oo1-f71.google.com with SMTP id r25-20020a4ae5d9000000b002c9ad00c5a5so9706896oov.22
        for <linux-usb@vger.kernel.org>; Mon, 10 Jan 2022 17:51:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k+G5Qj8aSKUpp+MDhp0FFQZX3fUBv+M0sfrhlFCHfLc=;
        b=EqlleVzGJEYo3NFe6US0ZT6PM7C4qJsHu7HBmwmh63U2gcsYsP5smvZxMBobPpcSBG
         N1+hWhfI9IbRmN4wgro3lqmB561pWufEH/uJa2fDvQKfiYueZ9P6XYBqx7ECvdRcZfl5
         LIfhvOUD8kt83kNW4jMJMQU23b7wigkYRpxUOuyYB6mqDy7P7D2sNs+btaB8eQnzIDis
         wABQmDu3+qS8YewxzThw55SrUNhD9RdwInuG86LjViofQQ+7PE7hmPvy9zKPtGVU9uT3
         SzpK/hojsJKOQ5PJo3hORhWOGaWyIgaoSTVCsaQEsFpJ2w/yAdZxdIGMJ7CmnMs9ylQb
         azAg==
X-Gm-Message-State: AOAM533N8XOTiFdRglZ9rZIMNoxwDiC6k4v5nwZmnoaZFfNbMTNqjzSe
        cys4OTvacEiW6yFpRM1EWF9ISaHtgZvyNhX9Y6Ht/AZTesi0N+AQNAsc4v6RULpr9AJmgLKg35D
        ilsxc3NYzZAxWbPUpEWCaCbhumDRUVurFwYwBXYpaZS4L+RgporHbDg==
X-Received: by 2002:a05:6808:198c:: with SMTP id bj12mr384878oib.146.1641865883124;
        Mon, 10 Jan 2022 17:51:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHc1xwY5iJ/hJxcFnR3u0ACkHmc8Oa/YD+Wvsqu2yqojXq/BqwcBugI0SsGkF4PoxlFmVjnr2Ce7+ZFErrCmg=
X-Received: by 2002:a05:6808:198c:: with SMTP id bj12mr384867oib.146.1641865882863;
 Mon, 10 Jan 2022 17:51:22 -0800 (PST)
MIME-Version: 1.0
References: <20220105151427.8373-1-aaron.ma@canonical.com> <YdXVoNFB/Asq6bc/@lunn.ch>
 <bb6d8bc4-abee-8536-ca5b-bac11d1ecd53@suse.com> <YdYbZne6pBZzxSxA@lunn.ch>
 <CAAd53p52uGFjbiuOWAA-1dN7mTqQ0KFe9PxWvPL+fjfQb9K5vQ@mail.gmail.com>
 <YdbuXbtc64+Knbhm@lunn.ch> <CAAd53p5YnQZ0fDiwwo-q3bNMVFTJSMLcdkUuH-7=OSaRrW954Q@mail.gmail.com>
 <20220106183145.54b057c3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAAd53p7egh8G=fPMcua_FTHrA3HA6Dp85FqVhvcSbuO2y8Xz9A@mail.gmail.com> <20220110085110.3902b6d4@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20220110085110.3902b6d4@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Tue, 11 Jan 2022 09:51:11 +0800
Message-ID: <CAAd53p5mSq_bZdsZ=-RweiVLgAYU5+=Uje7TmYtAbBzZ7XCPUA@mail.gmail.com>
Subject: Re: [PATCH 1/3 v3] net: usb: r8152: Check used MAC passthrough address
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>, Oliver Neukum <oneukum@suse.com>,
        Aaron Ma <aaron.ma@canonical.com>, henning.schild@siemens.com,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        davem@davemloft.net, hayeswang@realtek.com, tiwai@suse.de,
        "Limonciello, Mario" <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[+Cc Mario Limonciello, the original author on MAC pass-through]

On Tue, Jan 11, 2022 at 12:51 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Mon, 10 Jan 2022 11:32:16 +0800 Kai-Heng Feng wrote:
> > > > I don't think it's a good idea. On my laptop,
> > > > systemd-udev-settle.service can add extra 5~10 seconds boot time
> > > > delay.
> > > > Furthermore, the external NIC in question is in a USB/Thunderbolt
> > > > dock, it can present pre-boot, or it can be hotplugged at any time.
> > >
> > > IIUC our guess is that this feature used for NAC and IEEE 802.1X.
> > > In that case someone is already provisioning certificates to all
> > > the machines, and must provide a config for all its interfaces.
> > > It should be pretty simple to also put the right MAC address override
> > > in the NetworkManager/systemd-networkd/whatever config, no?
> >
> > If that's really the case, why do major OEMs came up with MAC
> > pass-through? Stupid may it be, I don't think it's a solution looking
> > for problem.
>
> I don't know. Maybe due to a limitation in Windows? Maybe it's hard to
> do in network manager, too, and we're not seeing something. Or perhaps
> simply because they want to convince corporations to buy their
> unreasonably expensive docks.
>
> What I do know is that we need to gain a good understanding of the
> motivation before we push any more of such magic into the kernel.

Mario, do you know how corporate network and other OS handle MAC
pass-through, so we can come up with a more robust design?

Kai-Heng

>
> I may be able to do some testing myself after the Omicron surge is over
> in the US.
