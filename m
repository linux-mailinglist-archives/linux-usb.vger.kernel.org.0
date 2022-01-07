Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71942487012
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jan 2022 03:01:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345330AbiAGCBw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jan 2022 21:01:52 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:38882
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345294AbiAGCBu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jan 2022 21:01:50 -0500
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8D9A23F17B
        for <linux-usb@vger.kernel.org>; Fri,  7 Jan 2022 02:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641520909;
        bh=0tdUHwIEzjjxhEbEu8d5q0v4EG4pEmNrosqWtdLydn0=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=ZAJr53YXUUaR2tu7OVrN9GSreHlYI5Ko9TUNNXqLj59sxk8hOBK+/7I0I+hiI8phV
         Ab/JaQcgqOYHkih8guiImhR21rvdDJFgqnx0J/Qh/gQQf8GOuk51+2lMKrJ1lZ+luD
         bt70F4aDm2FcdJ4S9hwGSQNeCcZMc0WbmMdNkVzYjpcgmbxH3bZwd+giRF8yc1RDu3
         iksxaOiEGqRSqSvQWU682qj7GyAGWvn01VN+IcJ0yx/6AK0Qry28CpzBHoZLTixFkC
         RUSPCQ/hjvFnUjIt5isdLr/ugvpetazWKlxJAhwlQCusqw9g3tMDFLV3+q1EBe0Ekt
         mthjuKnrteOBg==
Received: by mail-oi1-f197.google.com with SMTP id t72-20020acaaa4b000000b002c6f0e4294eso3038202oie.6
        for <linux-usb@vger.kernel.org>; Thu, 06 Jan 2022 18:01:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0tdUHwIEzjjxhEbEu8d5q0v4EG4pEmNrosqWtdLydn0=;
        b=bYPXnhDmNB4UDRi2Xu4WW/iYrI6C59epl1Ed9daPiuCtGk4IHDqevZOFLqNed0VSco
         xOYTlPGyPyBVZuiC0SBqsnKl0nguqHhFaDr1sclI2bIK8AJT2Ui0HXTUy/XR3LjHdwkV
         /iRwA/eSHm9VGS/oVuOsTCaoL2qOVEmplqAX0cURcIyLY6/nC2j8qkKueSPWYkEfNCeg
         odT/gPwXSa24gPA3sRUku0g+sEJzNTk/P0d4VTPahWKOV7kEcGU6nOtgQglWfvIw6gOm
         o/HyfFc5FKW0AO0+itnp+nR+AVX7woEsoEP9DiZzjse46DK+e0+lQr68U7al6TrJzVA2
         k7AQ==
X-Gm-Message-State: AOAM530KKNCzsmIV5gvW+1rmeyOcDcwzzCTqnJ5yXxQZ4oBo0dwm/JCL
        P7TmSV6h5jd7jAtNDRAadwERqyPGlCV0wZuNTQuo96IA6eT3JdCgFI5Sy/hniqJinqBSqxqtiU5
        Gw983FM0l+ON799BhCCvxBhlYeGipUNAVVYOoxse1+3fdXT474ZD/kg==
X-Received: by 2002:a9d:24e4:: with SMTP id z91mr43366794ota.11.1641520905167;
        Thu, 06 Jan 2022 18:01:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoKMxqiLZ16B7TmuA/u0QDSkvGiouo9eb0MmzCO53RHn9T1YuaYZSR6xhNxGX/Cs4A4Yrfu/s+WjLnEzx1+Jw=
X-Received: by 2002:a9d:24e4:: with SMTP id z91mr43366777ota.11.1641520904892;
 Thu, 06 Jan 2022 18:01:44 -0800 (PST)
MIME-Version: 1.0
References: <20220105151427.8373-1-aaron.ma@canonical.com> <YdXVoNFB/Asq6bc/@lunn.ch>
 <bb6d8bc4-abee-8536-ca5b-bac11d1ecd53@suse.com> <YdYbZne6pBZzxSxA@lunn.ch>
 <CAAd53p52uGFjbiuOWAA-1dN7mTqQ0KFe9PxWvPL+fjfQb9K5vQ@mail.gmail.com> <YdbuXbtc64+Knbhm@lunn.ch>
In-Reply-To: <YdbuXbtc64+Knbhm@lunn.ch>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Fri, 7 Jan 2022 10:01:33 +0800
Message-ID: <CAAd53p5YnQZ0fDiwwo-q3bNMVFTJSMLcdkUuH-7=OSaRrW954Q@mail.gmail.com>
Subject: Re: [PATCH 1/3 v3] net: usb: r8152: Check used MAC passthrough address
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Aaron Ma <aaron.ma@canonical.com>, kuba@kernel.org,
        henning.schild@siemens.com, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        davem@davemloft.net, hayeswang@realtek.com, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 6, 2022 at 9:28 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Can udev in current form really handle the MAC race? Unless there's a
> > new uevent right before ndo_open() so udev can decide which MAC to
> > assign? Even with that, the race can still happen...
>
> There will always be a race, since the kernel can start using the
> interface before register_netdev() has even finished, before user
> space is running. Take a look at how NFS root works.

Didn't know that, thanks for the insight.

>
> But in general, you can change the MAC address at any time. Some MAC
> drivers will return -EBUSY if the interface is up, but that is
> generally artificial. After a change of MAC address ARP will time out
> after a while and the link peers will get the new MAC address.

I think this makes the whole situation even more complex.

>
> >
> > So what if we keep the existing behavior (i.e. copy MAC from ACPI),
> > and let userspace daemon like NetworkManager to give the second NIC
> > (r8152 in this case) a random MAC if the main NIC (I219 in this case)
> > is already in use? Considering the userspace daemon has the all the
> > information required and it's the policy maker here.
>
> You should be thinking of this in more general terms. You want to
> design a system that will work for any vendors laptop and dock.
>
> You need to describe the two interfaces using some sort of bus
> address, be it PCIe, USB, or a platform device address as used by
> device tree etc.
>
> Let the kernel do whatever it wants with MAC addresses for these two
> interfaces. The only requirement you have is that the laptop internal
> interface gets the vendor allocated MAC address, and that the dock get
> some sort of MAC address, even if it is random.

Those laptops and docks are designed to have duplicated MACs. I don't
understand why but that's why Dell/HP/Lenovo did.
What if the kernel just abstract the hardware/firmware as intended, no
matter how stupid it is, and let userspace to make the right policy?

>
> On device creation, udev can check if it now has both interfaces? If
> the internal interface is up, it is probably in use. Otherwise, take
> its MAC address and assign it to the dock interface, and give the
> internal interface a random MAC address, just in case.
>
> You probably need to delay NetworkManager, systemd-networkkd,
> /etc/network/interfaces etc, so that they don't do anything until
> after udevd has settled, indicating all devices have probably been
> found.

I don't think it's a good idea. On my laptop,
systemd-udev-settle.service can add extra 5~10 seconds boot time
delay.
Furthermore, the external NIC in question is in a USB/Thunderbolt
dock, it can present pre-boot, or it can be hotplugged at any time.

>
> I suspect you will never get a 100% robust design, but you can
> probably get it working enough for the cleaning staff and the CEO, who
> have very simple setups. Power users are going to find all the corner
> cases and will want to disable the udev rule.

But power users may also need to use corporate network to work as
Aaron mentioned.
Packets from unregistered MAC can be filtered under corporate network,
and that's why MAC pass-through is a useful feature that many business
laptops have.

>
>      Andrew
