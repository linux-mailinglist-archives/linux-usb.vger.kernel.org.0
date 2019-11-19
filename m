Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33001101258
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2019 05:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbfKSEFl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 23:05:41 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:40570 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727533AbfKSEFk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Nov 2019 23:05:40 -0500
Received: by mail-vk1-f194.google.com with SMTP id k24so4717521vko.7
        for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2019 20:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LIrHQsnQ6V+BzwizI1F2l2BgBcA0oa40rJqoMOUJJDE=;
        b=HCeOD6Tu76jGBNN2vs/QFo9RoiWqR8su519GDX3xUu3RA+PhDKU8rfJhqf8Eytvv3m
         cBf/KnZYDLRM8fHHTz1XmuDdNZnJR4EsstGmBzLt4vkDu0qpNZGEyWLQGmDCfxkSN7JT
         FC/a1JUueTcjv7gMT8S3ww/7ayWyICVvJOioc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LIrHQsnQ6V+BzwizI1F2l2BgBcA0oa40rJqoMOUJJDE=;
        b=dbnq2buRBl5UH2zQD4qtBHyPJ4bkff7/UPtfyIXAsPDugDM9tEWL1Bgvlc3BaYmvAq
         ab3H8h5GkOZOKPxRdshwi1HD2hF97658DTa8rcNBHNEGDAL14BZ7SffwP2KcJub1LMjl
         4Vy9khsxrRipLbaQ5LbprdL98iHyPRo/OzHMYQ8iXhNAlP2xkK/6f0SAKM1WxleF/U+5
         77TC+5RmMnX9LyXhmMk3QRaoBoXEhIeTeyinUfClE15Hip3nDl9vaJCgNfxtFqtLF93A
         AnYXdflnS2JCMCrs+MvY5I8YSf5np2WpCfjNhdghFOVwvtmVtBFMcE6d3s2E48dPcKub
         dLYg==
X-Gm-Message-State: APjAAAX06Cpj71ZFAJB+30AlWxCdjoTP2VEp5h5DeIXux6PSC5Dcn132
        i7Z9zzOTbkNJ1K1tXUgdZIO7oBICRb27pk5UfTtv3Q==
X-Google-Smtp-Source: APXvYqxZjldlrzqFPxGpiEuY9hlr4GZvzrs6hiQjg39NYK3ahlpOSUNqc3f8+uwjpnSO86dKp8sB5dxpA5O5JpWNG1o=
X-Received: by 2002:a1f:3f56:: with SMTP id m83mr13480943vka.51.1574136339707;
 Mon, 18 Nov 2019 20:05:39 -0800 (PST)
MIME-Version: 1.0
References: <20191117033149.259303-1-ikjn@chromium.org> <20191117071442.GC496402@kroah.com>
In-Reply-To: <20191117071442.GC496402@kroah.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 19 Nov 2019 12:05:28 +0800
Message-ID: <CAATdQgBSPHyhWsAvLE=_Fd990exgaZ+Dzftad7++ZjzGsSkmJA@mail.gmail.com>
Subject: Re: [PATCH 0/2] usb: override hub device bInterval with device node
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Suwan Kim <suwan.kim027@gmail.com>,
        "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
        Johan Hovold <johan@kernel.org>,
        Nicolas Boitchat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Nov 17, 2019 at 3:14 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Nov 17, 2019 at 11:31:49AM +0800, Ikjoon Jang wrote:
> > This patchset enables hard wired hub device to use different bInterval
> > from its descriptor when the hub has a combined device node.
>
> If it is a hard-wired hub, why can't you change that interval in the
> firmware for that hub as you (as a platform owner) have control over
> that?

yes, actually that's the best option, but the hub devices were shipped with
mask ROM we can't change the descriptors.

>
> thanks,
>
> greg k-h
