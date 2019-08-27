Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 275549DBC3
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2019 04:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728663AbfH0CuM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Aug 2019 22:50:12 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:41778 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727493AbfH0CuM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Aug 2019 22:50:12 -0400
Received: by mail-qk1-f195.google.com with SMTP id g17so15824125qkk.8
        for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2019 19:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T2iPkJ7pf5gy03ZtFr13YyLMEqBiyBna8KsbdE4uLh4=;
        b=OgO/muqhVUTgi3797A1/YaOoRiSxfCK9qTOuvdSWVO5kgttxZF8bud0CU1Q+TemszI
         F4o710BbkBQiYhrPmrHcDtNOUH+xryGN5/3OjKQ5qLMZ5LZDeRnL+hif3HB1kLzLtwhI
         9ed8gSxB4BgFPl432UuxuSCczBxpr9m5bO+SoILvSPaonHHooutjIR4fjNbRLmdXduIp
         ZqFB7LiPb4vVfZ3+79KXKqVuTdRgwrOKGi9eFejvI4xdoLgugjdZwYUsv2rg/gGfy4Y5
         EccSsMFQ7WD0PlCK43idSM/yPkdr0QGnkn4AUgnHESF3RfdIrFIjUjO9S2f748Vq9IjJ
         iS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T2iPkJ7pf5gy03ZtFr13YyLMEqBiyBna8KsbdE4uLh4=;
        b=iHV40oJJJ0vCQv+TwUUTpFItVZCd6q+4Lip8S/p9Ff5qwo+B1gyOxayaCUUMzgjbf3
         GW3odKwmGwtf7BsGh/bpOFW92WuFSmGqRqwowcYButGeiY0Xe0KsRMZhKpaqO6AKrE8F
         ofh+QY0LTvAR2qrlilap7Meum9BrT7h7rjiML33NSf54VRa7N6Zz5rzI8On3MH83ffeh
         6q6wV8ZiME/lbgv0+ObBRi9RriZZMGszyUIuSUkJ/uYQFdiW/4ejrUZHsdjDEoA9nFKS
         6p9JN8Zea2VMnLGng2o6b/mG1HfhytMH+NtuJ1ylqiNWVuRPIth75lI0BNhTbDER+CwS
         pwZQ==
X-Gm-Message-State: APjAAAUfLdLP7FH4ssxxxwFAJIYaB7iM7gD6UftpXAIz/HikCbqreKVm
        XoM3APHPFU0Km8AqPxjJrauyfTNII4ovVdppa3Rbvg==
X-Google-Smtp-Source: APXvYqyorHsPxknELIV3kZZaAxlw5KcVXN96cPbvisDKUGVl/1XaqwDQWul4lUcEGTeWYKVYdyq/febIl7qMeZWHlzk=
X-Received: by 2002:ae9:c206:: with SMTP id j6mr19308064qkg.14.1566874210753;
 Mon, 26 Aug 2019 19:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAD8Lp47Vh69gQjROYG69=waJgL7hs1PwnLonL9+27S_TcRhixA@mail.gmail.com>
 <CAJZ5v0g4T_0VD_oYMF_BF1VM-d1bg-BD8h8=STDrhVBgouPOPg@mail.gmail.com> <01cf6be6-9175-87ca-f3ad-78c06b666893@linux.intel.com>
In-Reply-To: <01cf6be6-9175-87ca-f3ad-78c06b666893@linux.intel.com>
From:   Daniel Drake <drake@endlessm.com>
Date:   Tue, 27 Aug 2019 10:49:59 +0800
Message-ID: <CAD8Lp4658-c=7KabiJ=xuNRCqPwF4BJauMHqh_8WSBfCFHWSSg@mail.gmail.com>
Subject: Re: Ryzen7 3700U xhci fails on resume from sleep
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Endless Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 26, 2019 at 9:32 PM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
> On 26.8.2019 12.29, Rafael J. Wysocki wrote:
> > I wonder if you can reproduce this with the pm-s2idle-rework branch
> > from linux-pm.git merged in.
>
> Root cause looks similar to:
> https://bugzilla.kernel.org/show_bug.cgi?id=203885
>
> Mika wrote a fix for that:
> https://lore.kernel.org/linux-pci/20190821124519.71594-1-mika.westerberg@linux.intel.com/

Thanks for the suggestions. Mika's patch was already applied then
reverted, I applied it again but there's no change.
Also merging in pm-s2idle-rework doesn't make any difference.

Any other ideas? Or comments on my findings so far?
Given that I can't shift D0-D3-D0 reliably directly with setpci before
loading the driver, is that indicative of a fundamental problem with
the platform, or is my test invalid?
Or in terms of other ways of testing the power transition outside of
the suspend path, if a PCI dev is runtime suspended with no driver
loaded, should Linux not be attempting to put it into D3?

Thanks
Daniel
