Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D62FCB03A
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 22:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733194AbfJCUhT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Oct 2019 16:37:19 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38277 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbfJCUhS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Oct 2019 16:37:18 -0400
Received: by mail-wm1-f65.google.com with SMTP id 3so3446433wmi.3
        for <linux-usb@vger.kernel.org>; Thu, 03 Oct 2019 13:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=63ds3t73ZrLj3HbV7qUiVgBUuKHqGbWcEjyWgIzskeE=;
        b=ziI1PEzAwuBD/3nwpmQYYXYslTYque2zlEKkMbUyCSw6dlHNV7kB9VAwWgpRurXKN7
         mcDYAmcUhP4bsEqTOLOp0AbA///bwWtKdAP/Z4MthfJQ7kRwHGtBp/lb5UwXguNCgPoQ
         XmUHs1ODk2abTw3MeluecZg+IkWrkJz2mOg6Bqe57LEJevWeEp5tbIi/eMMHn8HSabf2
         YW0j13DLGMF/JF9q0OleDgrOgI+RugOdwOC8B6IAI1lj+J99cQtrssH0cvuTSLNOtufV
         TygGCxlOyWqws2dM4Ux9YWbSh8RVGOp0uKQ7MXo2dt9pqR5oK7lRKvzZmCkPE4o9i2d/
         uo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=63ds3t73ZrLj3HbV7qUiVgBUuKHqGbWcEjyWgIzskeE=;
        b=sipwPvas4g/rs29QYHLLj821y4nY/gLRrRZX1xvak9WVg8FYmxJJrwT8ZHZ/6HfbgF
         EG1y6UQSzBTiK9df+FKYbwy4lCLLqj03e4eLOSH1MwmMWjBouIyanGdeWJWqfqb262h/
         GwofQBGB+Lc1hpiNjHirh/EPTLTi/YLdVrlRuEEwknbNNDgDirIbMn4MBHZY7+oSlAAj
         eZSesWuKmePdTmV0brf2znOZ/dBsXnuo0WV6trbSNspwzg2bj83dHkInzS+KigHizdjH
         sEoL/SUO74+aBaffFwKf0gJCHJTGHpXwddAEynmE+71PtaddiYK0uLKlCIAiu+dK8Ntp
         4chA==
X-Gm-Message-State: APjAAAULXHSJORp2cv02L0+ZwpvwU9HQfnNtTpVyE8cH7ybY0SBw1s7P
        pbRxmrvto6U+4zAIFI9MgcgIQZvyJGQKGbPYX7QHZg==
X-Google-Smtp-Source: APXvYqzVrVcXrzwTGscDiiPv6l+aU2YRfAhMTVv5NfavOPgIBNOF2oVCTqQSyYHsCIQ6dv7jqQDIQMnq8Lmtfdlg0qI=
X-Received: by 2002:a1c:9988:: with SMTP id b130mr8527379wme.164.1570135036923;
 Thu, 03 Oct 2019 13:37:16 -0700 (PDT)
MIME-Version: 1.0
References: <20191002231617.3670-1-john.stultz@linaro.org> <20191002231617.3670-3-john.stultz@linaro.org>
 <2e369349-41f6-bd15-2829-fa886f209b39@redhat.com>
In-Reply-To: <2e369349-41f6-bd15-2829-fa886f209b39@redhat.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 3 Oct 2019 13:37:04 -0700
Message-ID: <CALAqxLVcQ7yZuJCUEqGmvqcz5u0Gd=xJzqLbmiXKR+LJrOhvMQ@mail.gmail.com>
Subject: Re: [RFC][PATCH 2/3] usb: roles: Add usb role switch notifier.
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     lkml <linux-kernel@vger.kernel.org>, Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 3, 2019 at 2:25 AM Hans de Goede <hdegoede@redhat.com> wrote:
> On 03-10-2019 01:16, John Stultz wrote:
> > From: Yu Chen <chenyu56@huawei.com>
> >
> > This patch adds notifier for drivers want to be informed of the usb role
> > switch.
>
> I do not see any patches in this series actually using this new
> notifier.
>
> Maybe it is best to drop this patch until we actually have in-kernel
> users of this new API show up ?

Fair point. I'm sort of taking a larger patchset and trying to break
it up into more easily reviewable chunks, but I guess here I mis-cut.

The user is the hikey960 gpio hub driver here:
  https://git.linaro.org/people/john.stultz/android-dev.git/commit/?id=b06158a2d3eb00c914f12c76c93695e92d9af00f

I'll resubmit again later with that patch included.

thanks
-john
