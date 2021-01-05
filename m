Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76782EAC05
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 14:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729659AbhAENgZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 08:36:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbhAENgY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Jan 2021 08:36:24 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C6F8C061793
        for <linux-usb@vger.kernel.org>; Tue,  5 Jan 2021 05:35:44 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id p22so31067955edu.11
        for <linux-usb@vger.kernel.org>; Tue, 05 Jan 2021 05:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qanCY9ywFg7njDhdnP0AIL5hv0WgQcxttkeThBC4ZG8=;
        b=YUIfxCHX6Kzcseue3f/xTn3TG+nX9E2d9kHmwL9vW08Vf4ye6Zd9KlmUjSt4HwocKR
         XahahbuJYjof1X3noCm7wkH3P36MQ+5TQTsvkWhfVYtL5TrAyHyYHlt07EzwVv9EGhKu
         bJ2iTNXbHvp6j8yqt1mI6JtVeh2rdFamGz6eqcinA0kDYyK+oRPhlltI+dP2lpI7bsJo
         v9a+t7+UmjL5c5/RNhkQ2TJE5a5gyK/vnb6J9/fQLVyrajCr7wmV/GvZAfsuJ7PKo90o
         5/Jy4EFGt2kTH0Hryd96mCEu+U8CZaAzdoz/l+51o2cIDz+AQKHAnvRgVgOdMQz4HmKT
         tnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qanCY9ywFg7njDhdnP0AIL5hv0WgQcxttkeThBC4ZG8=;
        b=NUZVrUZv07NJ8Cdfp+iQ8/mhiAGiuvVXT/ElebctJZVpEQBGRkdgZvMxGAcnJI2QOX
         k5WxIpcNEwAiYskVnjqwJFdLvVoYSQWo2JZAX352gdNKZFE5J4AKs8IPmXn9qyvb6HJc
         T6qhLk+pa0nU1hQTila28PlMm3I+1bhEMiXwXNKbKZGzFn6atd5uAoYFiQs9PdZeSYCr
         6sUT6YOyaTeAdwSePm6XdhW1cZm1dqR8XV+j0/tANhKUa8hCUfakWNIV6jcxbTbnuhAk
         UapOn129I88A0+Se58Pfy04Bh13vl8J2qZuiBqPdyRQ0/0XtgDWhzqKxhuUpGNutkh9n
         d1zw==
X-Gm-Message-State: AOAM532XohQkbjrPqFKQQepPn2IHZn3tmM+xuw8IBjVjx0/cdSj2ZeQC
        5fdi0We19Ycgrw9j1nHS3aCVt5inP3SeIu7YnXs=
X-Google-Smtp-Source: ABdhPJzYUblTncflIS7nWhnaI4+XvlyJzHDY4YThPXpCcMoaX5WNICoBGxR/Elgq3z4d7MDmU75FtXV4EdtdEQalKU8=
X-Received: by 2002:a50:b223:: with SMTP id o32mr76650868edd.79.1609853743141;
 Tue, 05 Jan 2021 05:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20210105092808.15817-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20210105092808.15817-1-mika.westerberg@linux.intel.com>
From:   Yehezkel Bernat <yehezkelshb@gmail.com>
Date:   Tue, 5 Jan 2021 15:35:27 +0200
Message-ID: <CA+CmpXuMD+OcNNJXHHc9oXUMkOjt8mt-UzrQrpe0mHXSmYvNrw@mail.gmail.com>
Subject: Re: [PATCH 1/2] thunderbolt: Start lane initialization after sleep
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Christian Kellner <christian@kellner.me>,
        Mario Limonciello <mario.limonciello@dell.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 5, 2021 at 11:28 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> USB4 spec says that for TBT3 compatible device routers the connection
> manager needs to set SLI (Start Lane Initialization) to get the lanes
> that were not connected back to functional state after sleep. Same needs
> to be done if the link was XDomain.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/thunderbolt/lc.c      | 35 +++++++++++++++++++++++++++++++++++
>  drivers/thunderbolt/switch.c  | 27 ++++++++++++++++++++++++++-
>  drivers/thunderbolt/tb.h      |  1 +
>  drivers/thunderbolt/tb_regs.h |  1 +
>  4 files changed, 63 insertions(+), 1 deletion(-)
>

Acked-by: Yehezkel Bernat <YehezkelShB@gmail.com>
