Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 894CE194BDE
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 23:58:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgCZW57 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 18:57:59 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:35505 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgCZW57 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 18:57:59 -0400
Received: by mail-ed1-f67.google.com with SMTP id a20so8988811edj.2;
        Thu, 26 Mar 2020 15:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q3/Z7GZVJi0UW1Zu1oYi/BuQdVCIJAHd3iCUPZ44/PU=;
        b=e5dhEBvKcnOYZqE+p9+DD69rZSII4PRcBKD8b/PKJq1OPgYsJn+20sK9QVJo6dAk74
         rqXGoZvOjjhhNLVdKJpm6n2vSOIF8vEHQgwwjVNNMm1bswdtkbqSbUbL/Aw7C4pTq7dz
         RbQVq2apkyYa/jb1uBcjqHXt7iwMpB0hrUGRNRHwIYnCivwETiweR0Ztls4+dND4xREA
         sx74Lr3JYsEPHo7VoMkScWnNdrr6jjmzOcgr9CMUXAKIep6ttoSprkKdaU4lasl/JFG3
         n5zf3tgcPsQjhGo9Xbp3MnT11YMp3NihkMylZwBm/Uv8zJs2SQaOOBsF7YoVcTDnRZiU
         4f7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q3/Z7GZVJi0UW1Zu1oYi/BuQdVCIJAHd3iCUPZ44/PU=;
        b=CmUeXALISceZRkdpvBu3hvNmNJLOPe7ID+sDYQvhdQBNI9Rygqy1Jo0oKQD/S5QVzz
         rmeazSt9WETzNNDxUdzTPGLb+na65w29SXXxKg/v5EaGg9f4SIrPb617YWsI+wZIy0pm
         oyzH6vICKt2q/6IvQjEU374kyqY3EdjQKpqW9z4Vt6HjAtJUfuIXQUgebTl53bAyDa0n
         4z6GOTduWqSnDa8Qmy5qNdJripFwFkL4C2nnCioqW9YD34yrRxCff1ns2FOhEBkaYGsT
         kfcJ9Yv6HKvwO8WqKK8KfCE6IHBHpvL0d63wkMmIuARaRXAad5oScav207VSJda1jdG8
         JR8Q==
X-Gm-Message-State: ANhLgQ2trHxRqLEskwRuHGHEiS9jRCcAYgkzv5cH8gfgshaawg38Sk3m
        28BqMXqrKHV1io7vRr1nvhO9jVIAz1SUOYwh7fA=
X-Google-Smtp-Source: ADFU+vu81+58VLjFlWwPRkccjsbyz6i5eV+Hc6RvJgDEpLHNpf60WKYPTnTNMm3dUNr+vmEW9t2xGbEjqz41aa2/5vw=
X-Received: by 2002:a17:906:4d5a:: with SMTP id b26mr5083102ejv.90.1585263476743;
 Thu, 26 Mar 2020 15:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200326134507.4808-1-narmstrong@baylibre.com> <20200326134507.4808-6-narmstrong@baylibre.com>
In-Reply-To: <20200326134507.4808-6-narmstrong@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Thu, 26 Mar 2020 23:57:45 +0100
Message-ID: <CAFBinCAj5+poov+Nss83o+YU8H62zpFSMtd_HvaM49Ob74Wg=g@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] usb: dwc3: meson-g12a: check return of dwc3_meson_g12a_usb_init
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 26, 2020 at 2:45 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The dwc3_meson_g12a_usb_init function can return an error, check it.
>
> Fixes: e3e716e6b889 ("usb: dwc3: Add Amlogic A1 DWC3 glue")
I think this should be:
Fixes: c99993376f72ca ("usb: dwc3: Add Amlogic G12A DWC3 glue")
(because I don't see where e3e716e6b889 modifies dwc3_meson_g12a_usb_init)

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
and with that:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Martin
