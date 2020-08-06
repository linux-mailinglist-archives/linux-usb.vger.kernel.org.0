Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8162A23D7F9
	for <lists+linux-usb@lfdr.de>; Thu,  6 Aug 2020 10:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728954AbgHFIZI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Aug 2020 04:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728946AbgHFIZG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Aug 2020 04:25:06 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F8A8C061574;
        Thu,  6 Aug 2020 01:25:06 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id p1so27121669pls.4;
        Thu, 06 Aug 2020 01:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VtZTL6+gIK1sJt3cJ7zuQJSCi6/qCpwrTyBQLHCj2S8=;
        b=OG+9CdJZ3W44CK1x0ACetduLjsaqgdlaCWAGhCBzH4drk+NT/7sVWJqo5EQ4O40wjU
         X//LkVywCyxSs+DykBCjxmdogajLS7NiiItI9NutC96YSTCBWLLvxc8T0LgyV17Rdp4e
         E+Qm1vMT8Gkd72bQhQ1ln4bHvMnOzRqe6aLBc6loKakLLdqAGLHysU5wYm8m5vyLhfsQ
         e77LvT8zt26rYT0jOEyz8bYTidpZR21VsWmMvCmhtnEfYRmj3uHtTZj+dcxSGQ1MXgCW
         nKD4XiOU57DnhL7nSogbW8Auk/uvTE7WLTIHEgmvtbt0Za7DhGoPCKzAL0quEp2wnmMC
         2/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VtZTL6+gIK1sJt3cJ7zuQJSCi6/qCpwrTyBQLHCj2S8=;
        b=hr2uvFmW4/cpq2mhqEOr8b45mb/lee+z/UB8kC1NiEHD5MHAXQ/hkTH0ioWv4BAbIl
         Eog8PXMUuLXXZiQ4hQAF/1AUUoge3cQFMhYdggkxfNyadcjoFJiI7qvEZBYB8ueSeLkQ
         h0aIY3nNlq2+Z8IHliPmgFKQcS2xXZ2UPtvteJvULOFn9RM4aNJBT0gNX5O1Q9svhB8u
         3b9za5puVnoEX4oVji80nLtZXvU0Uo7rTCiggRcg8Kut7lavGWFxIkO49tsXRO109tbh
         GCKKbM3JxtRzgNyqMRKFg9SFLlfXrf7hAkHSieiyvqKKR6b/iDSWvDJrCVO3MB8kPZta
         asKg==
X-Gm-Message-State: AOAM532xUGJBjz9B3Lxexcwm7POOLxUcnbWlyGX6qZVA93xqJvRsdRH5
        JQ81hig7IV1FzmGBtrYHz5YjrKV/HidzaJlc+XM=
X-Google-Smtp-Source: ABdhPJzmbxmj08PcVsTlWSiqof+tF9qK3QjOl3a4d12D0ib+K78WCQkugcFS8JtCY3shZrfclqs6X4bZD0ZXQyH/S3M=
X-Received: by 2002:a17:902:59dd:: with SMTP id d29mr6753635plj.170.1596702305301;
 Thu, 06 Aug 2020 01:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200805130252.41973-1-patrick.riphagen@xsens.com>
In-Reply-To: <20200805130252.41973-1-patrick.riphagen@xsens.com>
From:   Frans Klaver <fransklaver@gmail.com>
Date:   Thu, 6 Aug 2020 10:24:54 +0200
Message-ID: <CAH6sp9NE_U-CDcrBueTPpzvCRUC3unCZFhhLFPTRVsCyN9THCQ@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: ftdi_sio: add IDs for Xsens Mti USB converter
To:     Patrick Riphagen <ppriphagen@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Patrick Riphagen <patrick.riphagen@xsens.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Patrick,

On Wed, Aug 5, 2020 at 9:57 PM Patrick Riphagen <ppriphagen@gmail.com> wrote:
>
> The device added has an FTDI chip inside.
> The device is used to connect Xsens USB Motion Trackers.
>
> Signed-off-by: Patrick Riphagen <patrick.riphagen@xsens.com>

Now you've dropped the backport to stable. Just put

Cc: stable@vger.kernel.org

just before your sign-off. Everything will be taken care of
automatically once the patch is merged.

Frans
