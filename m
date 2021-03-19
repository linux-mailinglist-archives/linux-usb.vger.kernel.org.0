Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2DB6341D44
	for <lists+linux-usb@lfdr.de>; Fri, 19 Mar 2021 13:46:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhCSMp6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Mar 2021 08:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhCSMpc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Mar 2021 08:45:32 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7673C06175F
        for <linux-usb@vger.kernel.org>; Fri, 19 Mar 2021 05:45:31 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id 97so2988035uav.7
        for <linux-usb@vger.kernel.org>; Fri, 19 Mar 2021 05:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IE3kb1rl77acKmUSLIWnjLCfSHxiy9IgMN+TT6TYALI=;
        b=CWY/ekvWIi695h++8vRnOc/Ti0ZcUUG14tiDuxLd0lwLvmGdXAxyqjroP7wvrJHHG8
         wbv1+tI0yqASImcGQEZ68Yq/QTNJS3lrLsB6YScGZYbK3ZT+fwYCOU7K0rIDIIUL3rMZ
         erw2Dx3EZXvcSGvTqIFpd48pUhCOsTvUC3E6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IE3kb1rl77acKmUSLIWnjLCfSHxiy9IgMN+TT6TYALI=;
        b=LWhs8ah7OfVo/mrYPQG+OvlSJc6IHdFgkJJ1GDHL3u3eqlP8FBUVSVRQxuUwQNdHsR
         Ol4yZsRa7NKmyuXQA497CBS+gqh034gNLW34v4uCo56atL7KCmOHQPjokskTBFH2qKzf
         czLQ2AG5LIlTtTuKfLyUnn9EtBvn8+leVGz3jHsQsj8gVEKNt6VzpWKln6aEFqV/mtc/
         YxEHztV8zBgIrBt5I1n+lE0xutLYEms936f8FB7AvtblDrB0sCgykKPKj3sJBhSl0upw
         i5pNQPYiCyNCy+fi/n26riKi8un7A1H9l1xzgEk6o9ZJjPbmo6IDHq4PlhzIYGwxaLPx
         jl7A==
X-Gm-Message-State: AOAM532EwOyvwoGEgUgluGw+o9lSVKkTRRrJDwqrjrwFhjRpbsEPDDjk
        QDdFpM5GegnRAv89lN9VBjh6+AlWlI4x1RRCbQkbu5XQiHc=
X-Google-Smtp-Source: ABdhPJzXSMTYG2rIx4ZW4Hfd1v2+hfgmXIRqsidw28Sr10pqChxCLweC/xTzlZqAiY99qaz0GSPg/P6kPA/faKO6RvE=
X-Received: by 2002:ab0:7c6c:: with SMTP id h12mr5014914uax.102.1616157930210;
 Fri, 19 Mar 2021 05:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210319124140.2314640-1-vpalatin@chromium.org>
In-Reply-To: <20210319124140.2314640-1-vpalatin@chromium.org>
From:   Vincent Palatin <vpalatin@chromium.org>
Date:   Fri, 19 Mar 2021 13:45:17 +0100
Message-ID: <CAP_ceTwTzZcGXrfXFMEkNBksi6i+VUjSoC6oDA5Oky61GwMo+Q@mail.gmail.com>
Subject: Re: [PATCH] USB: quirks: ignore remote wake-up on Fibocom L850-GL LTE modem
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 19, 2021 at 1:41 PM Vincent Palatin <vpalatin@chromium.org> wrote:
>
> This LTE modem (M.2 card) has a bug in its power managment:
> there is some kind of race condition for U3 wake-up between the host and
> the device. The modem firmware sometimes crashes/locks when both events
> happen at the same time and the modem fully drops off the USB bus (and
> sometimes re-enumerates, sometimes just gets stuck until the next
> reboot).
>
> Tested with the modem wired to the XHCI controller on an AMD 3015Ce
> platform. Without the patch, the modem dropped of the USB bus 5 times in
> 3 days. With the quirk, it stayed connected for a week while the
> 'runtime_suspended_time' counter incremented as excepted.

Forgot the sign-off-by
I will re-send

> ---
>  drivers/usb/core/quirks.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index 6ade3daf7858..76ac5d6555ae 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -498,6 +498,10 @@ static const struct usb_device_id usb_quirk_list[] = {
>         /* DJI CineSSD */
>         { USB_DEVICE(0x2ca3, 0x0031), .driver_info = USB_QUIRK_NO_LPM },
>
> +       /* Fibocom L850-GL LTE Modem */
> +       { USB_DEVICE(0x2cb7, 0x0007), .driver_info =
> +                       USB_QUIRK_IGNORE_REMOTE_WAKEUP },
> +
>         /* INTEL VALUE SSD */
>         { USB_DEVICE(0x8086, 0xf1a5), .driver_info = USB_QUIRK_RESET_RESUME },
>
> --
> 2.31.0.rc2.261.g7f71774620-goog
>
