Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF3CA3D3D0D
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jul 2021 18:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235657AbhGWPWm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Jul 2021 11:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235568AbhGWPWm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Jul 2021 11:22:42 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B838C061575
        for <linux-usb@vger.kernel.org>; Fri, 23 Jul 2021 09:03:14 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id h9so2278815ljq.8
        for <linux-usb@vger.kernel.org>; Fri, 23 Jul 2021 09:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bk6hgwWVGfJlAiZufaEVwJ1Aovvg/2N+2IxDL/ft2Ks=;
        b=ZGrUDYQs8Hzj0bL0xuTzR7pkx/jxHRHWw2Js1VlCubxh61nCHsNrvSovd3MkMSYsvP
         uFUQ+TAUdtHdMhtToFYGRApjig+vvb2+SjbiLL26xwllw2JebfYxwKjZL53rnJm8fWr8
         NWS7nREkTGFPWcxj1Q49b6WHlHoTVe4ahllmDnlK2e4dAihJCCZnKTx4mI6NU+0N9O7v
         6HLuBHI5ublfcNScGQmaDwrZ4QcuP7JaXxTVQtYnr4OTGUYF++ycDJV0bT1tVG6mZl5z
         epSh1r7W+D+7iGJsaxyAfAwdMMngLd8T/fxP8J+5z6sqHuyXHa2VpB74lHsOHec00fyH
         NNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bk6hgwWVGfJlAiZufaEVwJ1Aovvg/2N+2IxDL/ft2Ks=;
        b=lkE1laz4lgqzZ1NYpL8ER6wysVyCgiQ+G6iXJhhB0j6Lfh3hRxVXHR4/E+tnIobKgx
         TMZSrCRiObdPgMeFCQ9BnQNflGmd4SI3g2LPIb2zfWs/pAxXbII+msDhdGhZyNWMH9Hd
         QmqMMIIfwoz2UG+lNbmmSqAbyYJMQjqSQVVmK7I4OC3P0dQbwT4Dy5mlO0HYymh1u+3W
         ApA5zF2HBKzsqk0oDtnk3El7JdbbKa1uCmkN4wa7SYeNTqcAAUj+51sDBNSqxl6ZfyND
         yf9dHPguHK+5mFD903bV4cfPYIIi3Xtc+yRZ3kcLkQoFrJvfrOuZRQvJOXxsYWmdxjVY
         oL8Q==
X-Gm-Message-State: AOAM532cSveVoRJG/QAl1uWoDFh4la3YnHX12TnFRrTLYfRe0D6FyP7L
        CJmw3aWjVwbms/Q4hVfdAyc=
X-Google-Smtp-Source: ABdhPJxXu/SZYxvoZW3coXeSyYBQwEy9/bO4NKCRV7qeFuoUzbDnQBoRgA2ISEqaILlh+ACdPd6vtg==
X-Received: by 2002:a2e:9c41:: with SMTP id t1mr3713720ljj.415.1627056192743;
        Fri, 23 Jul 2021 09:03:12 -0700 (PDT)
Received: from reki (broadband-95-84-198-152.ip.moscow.rt.ru. [95.84.198.152])
        by smtp.gmail.com with ESMTPSA id r16sm2282192lfm.91.2021.07.23.09.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 09:03:12 -0700 (PDT)
Date:   Fri, 23 Jul 2021 19:03:11 +0300
From:   Maxim Devaev <mdevaev@gmail.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     balbi@kernel.org, sandeen@redhat.com, linux-usb@vger.kernel.org,
        Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH] usb: gadget: f_hid: fixed NULL pointer dereference
Message-ID: <20210723190311.4f46d7d9@reki>
In-Reply-To: <YPrlqBrdCiO2ogxA@kroah.com>
References: <20210723095323.205593-1-mdevaev@gmail.com>
        <YPqWeCwFQJXLA1ey@kroah.com>
        <20210723182203.48396b80@reki>
        <YPrlqBrdCiO2ogxA@kroah.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Greg KH <gregkh@linuxfoundation.org> writes:
s a v2 in a format that I can apply it in (as a new
> email.)

Sent as ("[PATCH v2] usb: gadget: f_hid: fixed NULL pointer dereference")
