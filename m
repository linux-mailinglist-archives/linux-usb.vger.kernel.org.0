Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 918FB157E0F
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 16:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727618AbgBJPDE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 10:03:04 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42065 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbgBJPDE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 10:03:04 -0500
Received: by mail-wr1-f67.google.com with SMTP id k11so8121096wrd.9
        for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2020 07:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=CokdOxTwVt/AbjezfT5mlwreLKgbea59Xs1+zMODEpI=;
        b=E4+TyZ2yPsaDZNCzETjeDm0kFMZlSYuq0Sa6MsSMQ7tRFVe7b2Hy5bu75Epe2duRiL
         RbgvF9fmnijgKJLJgJ3wYWrzBXF3IKwJEr91GfpME/Nd4+oYlCzijuI8Nq1xqiQn4VFU
         d4yyiHbAavwq5gVlChAHEBafGIK1ZaxuRKAaj8LX3+9ENbQ/BryD8Dv/c2dXG9FHI1UI
         4cdWSXLQI1F4vFa68fyIYPX4mMF0VyBXl6BqG6m1mr75FAJF8+IgwFDCvjpVb+smFS3i
         uBCu4o39KP8oj/XGLqBEm7E4iqZQ19eOjeTrbwsfWaV4NfXf3hPHvyrLaAjvIyoToGMJ
         eDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=CokdOxTwVt/AbjezfT5mlwreLKgbea59Xs1+zMODEpI=;
        b=fuw3s2gj/GXQvl6NxXOUspMa6nI06SmhNpR+vkqfc0L0hX1rwxh3/3YIHKWORhTGeJ
         eW4JjGgo8xwieLLESRtCxZWVgKiuVw8rNC08LgZBgWUXSTFhjxaS2Eb4+P288edTTOPx
         Y7Qb7wsQn74NATeDdVKfdPpytBBswIzVDwfxBe8LcKkqzG79NwVYmFBlFAowGncSePua
         5fcvWq40JbKYCGqy0eOttlQClnm4iN596WGHQUIDqlegH1yqn/twTMUkF7zAJahvFkY5
         87loYTS22CFwZgeOIShEFin0m0nACLPOzkocXmKxsGj6iKRD24aVuJB9TqroHlqrViHa
         54cQ==
X-Gm-Message-State: APjAAAV4Ggr3E2cIJlySY6hgrwdttmVNnVk56mQ5pog4bwIc5M61BVwe
        szzcg55gWK8LD54eRjcW3whTWQx21iPtaUmweR49lg==
X-Google-Smtp-Source: APXvYqwF+KRu65ArW850wrkDFJ7R7qtCWqc+ZT5t9Dd/JlW+Ck3Gd3ochbgyf9vBtZQ0MzlkCW3zi2LAtN+k1CBno2I=
X-Received: by 2002:a5d:6805:: with SMTP id w5mr2585541wru.64.1581346980148;
 Mon, 10 Feb 2020 07:03:00 -0800 (PST)
MIME-Version: 1.0
From:   Martin Townsend <mtownsend1973@gmail.com>
Date:   Mon, 10 Feb 2020 15:02:48 +0000
Message-ID: <CABatt_xcct6nNp6OELNMO3-R+JPLdh_bn6pH5RxyWQu=m9NhGw@mail.gmail.com>
Subject: Enumerating USB devices in the Bootloader
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

We are using the USB mass storage gadget driver in Linux and
everything is working fairly well but sometimes we are finding that we
are exceeding the 100mA limit (which I think is the default the host
will provide) before Linux has had a change to enumerate the USB
device at which point we ask for 500mA.  We have tried to reduce the
power by ensuring all clocks are turned off, devices not used disabled
etc but can't seem to satisfy the 100mA limit.  We were thinking that
maybe we could enumerate the USB device during U-Boot at which point
we know we are under the 100mA limit.  Does anyone know a reason why
this would not work? would at some point from U-Boot enumerating a new
bMaxPower would the connection be reset and drop back to 100mA during
the kernel startup? Are there any considerations that we would need to
take care of in the kernel for this to work?

Many Thanks,
Martin.
