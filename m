Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD3430489B
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jan 2021 20:33:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731914AbhAZFns (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jan 2021 00:43:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730741AbhAYQeK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Jan 2021 11:34:10 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 948DEC0613D6
        for <linux-usb@vger.kernel.org>; Mon, 25 Jan 2021 08:33:24 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id p5so15343648oif.7
        for <linux-usb@vger.kernel.org>; Mon, 25 Jan 2021 08:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E1l/fbEu9i0n+FeOZGvlHJfjYTj1jsf5qQmy8O5q578=;
        b=XyA8QCTZG1kV2SzDW4DeEoE71/ufMNgW0iOc8VK7XKr5piOucwxTYQ3DbpjG9kmJIU
         MCHIjvOvoXtAz12XdS020eBLEs8UlmXX78LWRbin0LznZbxuKVYCvu6XCKnsB0orfpp0
         Y8wHgD65sfi3naUK1xh/X2FUHba3ph/HggyDxNnUQN6P1o9+K2xg9acudqS/l7GRWanD
         /fBb2UNmjOcN96phPNx8Muyv7khwd3ibHzsAE9fLmHzzz4eRb5Z0lO/SgbXT5h7j2srw
         /RmZdP6zW84O/lPMZh0Fcg9hdOSrhD80JbL+lH94p9z8SjbHnq/pL7o3BHflBoh+OF8v
         LWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E1l/fbEu9i0n+FeOZGvlHJfjYTj1jsf5qQmy8O5q578=;
        b=SGqv7yOc1lTC8WP7dAdLJhLl3lx4CMQv5IzB8IkAvsmpmrMiTA0XDAywN8IH0KB9MQ
         387cZxaCLvhbJRmBwIAsakeQ37Da7GUzaAvDlJ8ORw5PiCOiHUqqRQWd0KxGLy3x6ktF
         Kr7p3zY6XS3MWsnoKbYZLdo0LuwYuFk0sahFD4VzZDVVxKz1eXuJ7KaX/90d7BIW11OH
         IeFBoCtHUm36+uwcBft1P6sdVTvPH7zGey3NCJmKCOga4Owe5l0MgX/N8uDus8MZt+H4
         Ew1AgwFsHm7qPsRBCzRzcklCVug3QgOGcJ34KoWkE/OUNgI42KxrMoS3qGgmTIFmrjFX
         yiUg==
X-Gm-Message-State: AOAM530L3WgbkiS4/eqnUlGXYH7G6Tt3hjaOtfFO4zEl+C0kQujP//hJ
        /IfhEAu+VRraUkcktxtu8/mY6XPugeDBNSwttXKG4nJ9XFeHTno7
X-Google-Smtp-Source: ABdhPJxtLd0WcE8JllcebiqJLhsC8alI7Nz81nUAXn4yOUWs8uyP3XpSIRvCTWQKRRTMGLG2mmy/pkSnZ9rCRARQ/m8=
X-Received: by 2002:aca:be54:: with SMTP id o81mr606108oif.67.1611592404007;
 Mon, 25 Jan 2021 08:33:24 -0800 (PST)
MIME-Version: 1.0
References: <20210125152235.2942-1-dnlplm@gmail.com> <20210125152235.2942-2-dnlplm@gmail.com>
In-Reply-To: <20210125152235.2942-2-dnlplm@gmail.com>
From:   Aleksander Morgado <aleksander@aleksander.es>
Date:   Mon, 25 Jan 2021 17:33:13 +0100
Message-ID: <CAAP7ucJBw7P6e+e+tkE4vXBCKK+OhvsGzOgPqVsGRvUW+gkyWg@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] net: usb: qmi_wwan: add qmap id sysfs file
 for qmimux interfaces
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 25, 2021 at 4:23 PM Daniele Palmas <dnlplm@gmail.com> wrote:
>
> Add qmimux interface sysfs file qmap/mux_id to show qmap id set
> during the interface creation, in order to provide a method for
> userspace to associate QMI control channels to network interfaces.
>
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>

Thanks for doing this!

Acked-by: Aleksander Morgado <aleksander@aleksander.es>

-- 
Aleksander
https://aleksander.es
