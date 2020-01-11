Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 001EF13839B
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jan 2020 21:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731297AbgAKU4W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Jan 2020 15:56:22 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38289 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731097AbgAKU4V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Jan 2020 15:56:21 -0500
Received: by mail-lj1-f193.google.com with SMTP id w1so5795800ljh.5
        for <linux-usb@vger.kernel.org>; Sat, 11 Jan 2020 12:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XZlxGXGobMGsmqadlObq8GOzyJPOq1Lkh0qYg/LupPA=;
        b=C3fNmEw+OPKCvf40KWGc59H+gvljtskOEszNfkW7Hr5imhk4ne1Mw4SeNtv5kXDDlL
         CzALylKJcb+u8jy/61DCuT6gf+nh60PX5ZAF/CGI60npriY15ldZovmTIGpByYTDbLfc
         VmhG+IsFQYNx17aBoi/vo62wVyWeXDuS4SqoB4C5Q1TipbBgVlChtITiZX8Lc6rYK496
         Z0nYwGDmRdO9BfeGwdBpAo9s99q3l5TefS1xO6siF3peUlIaqVmriRqCNKUDQ+iv8/Ze
         i8yIu68I0A+YwdzaJEy8/wqoO018ROwEg2Dejm9ORhzOdu90z4urbU7EwYdHlvyzEYrl
         9nvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XZlxGXGobMGsmqadlObq8GOzyJPOq1Lkh0qYg/LupPA=;
        b=s+IwzHwqBFnQv+syyJZfx9ZPY7KYYWuSeo6q3e6DVLADrHhN+uNy5LjvG8FfgtGQfJ
         TpCwknDcSp6uZONngrRIwp/6hCz7xoqRh0RzAqzx8XTCKCoMm/TNLF1UDT8oH0JslQU+
         YsXDvAApYX+hPn/nBmHICjFyoHByL1KN0MrOo2H062xOmpPJjWlIDOHvTF/K1KfxXo+o
         XvvMMzJhXqLquPcL6ex4T9znvge+YtSUDtCCqD4UY4uxM8rfnsvr807P+Fz1ZaUgv5xL
         YUNJxCe3gTZkrr6X2hi5Oow8itOIIVjOnGm1/EO/rcjHfYqEFfubUFOH2a6Lj/N9aO/a
         KKwQ==
X-Gm-Message-State: APjAAAWDAK0N09R1hl4KELlTywRg51T1MWINMfctUdnLLj3r2XssS5gL
        GeYdSALEVm1qlzzbMdBqz5VoA9JsFTVu0eqF1jw=
X-Google-Smtp-Source: APXvYqys2cEsqkNMjb4iLIqBy4+adb7FdVgQahK/2pO3cAwiGtPJoG38iTSXfi5ZE0opYurDSxh2M3ul7v5CiDNrCn8=
X-Received: by 2002:a2e:a0cd:: with SMTP id f13mr6172563ljm.251.1578776179734;
 Sat, 11 Jan 2020 12:56:19 -0800 (PST)
MIME-Version: 1.0
References: <1578562558-32462-1-git-send-email-peter.chen@nxp.com>
In-Reply-To: <1578562558-32462-1-git-send-email-peter.chen@nxp.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sat, 11 Jan 2020 17:56:06 -0300
Message-ID: <CAOMZO5CTB_TdW8G8RW41_t-sLhQyZ1Xy9rQW1Pu_BbOcJwe-Kg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] usb: cdns3: add NXP imx8qm glue layer
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>, pawell@cadence.com,
        Roger Quadros <rogerq@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

On Thu, Jan 9, 2020 at 7:55 AM Peter Chen <peter.chen@nxp.com> wrote:

> +static const struct of_device_id cdns_imx_of_match[] = {
> +       { .compatible = "fsl,imx8qm-usb3", },

Please also send a separate patch for documenting this compatible string.
