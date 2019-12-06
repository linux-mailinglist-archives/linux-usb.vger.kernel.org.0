Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 332FD11513C
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 14:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfLFNoC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 08:44:02 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36926 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbfLFNoC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 08:44:02 -0500
Received: by mail-lj1-f195.google.com with SMTP id u17so7725555lja.4
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2019 05:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RBAi6Nh82CUTw0FghctfKsYFP3d+jzhU0NlrMfIPOs8=;
        b=pJWK7llIOnjY+vqG+wrpOKAilH9sNF5aIhXn+ZkfqwNoeMgq8kVcsAr3eZ9NLa2Rc6
         qEAMiBNRQhW2vilmeNr6YVf+g0bCKJhdkhfqiawfMAcWSxcCJt7fkhJC1cSiq+mu/dyX
         dzKLxxDJZ9YQh8fePF4tL7NsScfS3bvP3znBT7VGSzdB/GA18BXE7jTn0V9LeKhgxPUp
         QzCNMXzZC+MLxaSU0ennMvHvMyO3a4jc6v6IubUp6irFmouI4xgwJpPt5hXRaQoqZQWR
         1dQFWOgDIvV6Y9V/S75Kl11+kw+diSsG99cxtKT5PVoXhsnEJWcQifuKKDW3zSew3EDr
         hRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RBAi6Nh82CUTw0FghctfKsYFP3d+jzhU0NlrMfIPOs8=;
        b=EAV4sIUKEXgbw08rAHK0Ev2JdjeNORloJ/piBi+GfO8DjPWpshIxo7U02HmOaheqtX
         pybNBP5MZ68M6L9JyZ5YPODD0UmqKDeKu5Wp17BAuHaTqSULSSKADcFGN1mdG4LRgMcx
         iiHNonm5feohOmiQMO1Qsm3mFKgjb93w1lvReFtIjnqBkYfL7ntU5OdePeor3Q0TuS62
         k8QMaBdmUp6lJ/ab6RdJNFowBq5pUIVtclDd0KCRSphNf0Jh//bR6HZH7YqUCMbhkl01
         YQ8r0N5XYX0Z/Gxzr/KGglC9q8US00KlARzaeoOmREjS/A4TijnHzSuUGXZrW0QwK1M6
         Ccyw==
X-Gm-Message-State: APjAAAXQf4+ziwtFg3RMJDmCzk90hOQ+31imkEiq/nqdsT7/JyZtDQof
        RRQoMA6e0l8/kjyooExmu6C4d4qQBuW1bECL9XjhlA==
X-Google-Smtp-Source: APXvYqzS5fZl1gC3DcZ2iMfei3rPmECZ9Dn9Pav+/XHkZ6wCRXBZggKs/hHhUa5iHa9mG6oufoboPx+qhv4wRx5zNME=
X-Received: by 2002:a2e:b4f6:: with SMTP id s22mr8891077ljm.218.1575639839896;
 Fri, 06 Dec 2019 05:43:59 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191205145641eucas1p1e3f40dff8a0c8e9ca47425e2370eabbb@eucas1p1.samsung.com>
 <20191205145633.187511-1-linus.walleij@linaro.org> <39902b1d-656c-2dc9-34bc-3bfe715db22f@samsung.com>
 <e4ba86d5-3c25-8b2c-981c-efaad4ebc60c@samsung.com> <CACRpkdaV9zoVzpZ3SW-Nvjo6ytUCEjA6fWuW1FSBciQ24j5SZg@mail.gmail.com>
 <402598f1-3230-c48f-c1c0-feda19cb2261@samsung.com>
In-Reply-To: <402598f1-3230-c48f-c1c0-feda19cb2261@samsung.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 6 Dec 2019 14:43:48 +0100
Message-ID: <CACRpkdZBOFXxm_n+A+Oz=MubkSTKG7aUX+9jonB5vm+_XPK_DA@mail.gmail.com>
Subject: Re: [PATCH] usb: usb3503: Convert to use GPIO descriptors
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Stefan Agner <stefan@agner.ch>,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 6, 2019 at 12:43 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:

> arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts: invert RESET
> gpio polarity (to ACTIVE_LOW), not sure about INTN gpio

AFAICT INTN should be set to ACTIVE_HIGH if it is working with the
current code in the kernel.

However it is pretty confusing with the "N" at the end of INTN,
indicating negative polarity. Maybe it means something else,
I haven't checked the datasheet. Maybe all boards have inverters
on these lines so they come out active high.

Yours,
Linus Walleij
