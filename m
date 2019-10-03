Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 018D6CB016
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 22:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732848AbfJCUZM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Oct 2019 16:25:12 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40602 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728017AbfJCUZL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Oct 2019 16:25:11 -0400
Received: by mail-pl1-f195.google.com with SMTP id d22so2030582pll.7
        for <linux-usb@vger.kernel.org>; Thu, 03 Oct 2019 13:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=KLlIoah+11WNLI7tRGDU9SjlPuD7QWpbTf5lcunsEHc=;
        b=LPkie/+xxlB4rT5PTiQ1eDCf0mu01pLM/ELzmiZ83YEqt6ip7yplZ80N4qSI/+wW+H
         QX08bofMKDuVQE+docytein2e6CLHfdn4ATCylT/I56xMs8QEWc/bRnESx1cgwVjz+/M
         mplVBgY2LOVn9MJC7OZ1o3KRHmqJ33N/WuAV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=KLlIoah+11WNLI7tRGDU9SjlPuD7QWpbTf5lcunsEHc=;
        b=H95L9gLJhm8B09FEk54Wde7sZ51GWg5ScJABIA7FixzdOu53+W+Lh6P5neswVbPoig
         oz1RsaFwLG38mM1DBMjop0g+quxfXftQvjONdiy1C6L5MNYFVq8vVsIbjmrKXfBa2Mgi
         ven3LX7hnIN0yWPXE2lMzmq+nyZPCbCuwaVO+rZiVMKpu1sfYgAUL2il4TX5Ly+Uo/vu
         pLWGGa1B/Ft5EnhGnKoFXPvdqTyFn+Xu6L5clxSfZIcNwUSM0X0uevODa+NnAQj5Qnmf
         gfoWcq9l+fzs+xChbrMwUsQE53MqMj2TCFcERQBNSRtpF6mUikovDR7r4Kax3e7zq3h5
         YadQ==
X-Gm-Message-State: APjAAAXy3ZFVhmraLzxNhxk25/igp3Jhr2tSAi2KsovPLePM4S8jImw3
        18Z/M28twFZDiC8HS2Mx+NeibA==
X-Google-Smtp-Source: APXvYqwuYaxcD0abXlJ6z9Sw8JipRNWop1dSY3B1qsyhjuysv4y+JbkXu9rI9FD12OHjiA0TACGMIQ==
X-Received: by 2002:a17:902:ac8a:: with SMTP id h10mr11445338plr.170.1570134310869;
        Thu, 03 Oct 2019 13:25:10 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id z13sm3901582pfq.121.2019.10.03.13.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 13:25:10 -0700 (PDT)
Message-ID: <5d965926.1c69fb81.6d844.cdc4@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <01e3d855-c849-ad7f-a6f8-87c806bb488b@redhat.com>
References: <01e3d855-c849-ad7f-a6f8-87c806bb488b@redhat.com>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-kernel@vger.kernel.org, youling 257 <youling257@gmail.com>
Subject: Re: Problem with "driver core: platform: Add an error message to platform_get_irq*()" commit
User-Agent: alot/0.8.1
Date:   Thu, 03 Oct 2019 13:25:09 -0700
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Hans de Goede (2019-10-03 13:20:24)
>=20
> The best solution I can come up with is adding a new
> platform_get_irq_byname_optional mirroring platform_get_irq_optional
> and using that in drivers such as the dwc3 driver.
>=20
> Does anyone have a better suggestion?
>=20

A byname_optional API sounds good to me.

