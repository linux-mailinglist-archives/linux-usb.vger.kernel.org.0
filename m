Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99277486A40
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jan 2022 20:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243124AbiAFTCu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jan 2022 14:02:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232414AbiAFTCt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jan 2022 14:02:49 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F47BC061245
        for <linux-usb@vger.kernel.org>; Thu,  6 Jan 2022 11:02:49 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id 30so11529013edv.3
        for <linux-usb@vger.kernel.org>; Thu, 06 Jan 2022 11:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=2jowSkbJNqPinrS3/sgyHCDn8reyTa6LeGm2gWPnh7w=;
        b=N1fQLhtogoh5AdBQW2rd4NLYNB5E3Q/QuZtVbQZZ4fwQmnXcrw40L9xOI/NkMjEk/S
         AAUfUSVbDdIN+LmjM6lLAeNw6tcUPpZ0B3kYnT0WoGgbkoROYYzuRgvfvP0edlukv3zb
         ehOvb0Qzklg4DURH6YDhcBB0FI/ch4a6tnHcHHISA0HX5TtTJZbBshafRr6WhLD1xEHF
         B1xKNXRBaaXRteXlB/mSB3O1IyfD0N27WbT9lMh4LKtJMqMDgOvnzjP9SOMpfb9B3rkQ
         mfPGKySf8XuBD/XaVrJ+FgAxhCAvYt2jFknhOsxgECOsxWaasvf0OKT62WKCahZfRMw8
         4w2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=2jowSkbJNqPinrS3/sgyHCDn8reyTa6LeGm2gWPnh7w=;
        b=VmpImVrcJ+rQGIQuNwTuANlM2JE9rA9Fl2ij9px74hxA/fSPQuKoB8ZMiXzWbi5rr3
         5pzciAz9Rir7zAaLuusCL8e10RxLR2lDtdCwfSb/Y7ZmaYcLereO3mNFB0YpJrqpqloA
         T4Hzpvxc0psFAJ0r05fQ21/IP66gehTedxuzBPIzfQ/VLEARmC7ik0BzbeeN3PV6uSd8
         KOyIlTz2rbyJJXFSrn/x3e7PswyRnfXo3nCsE46Tje4Sq7MuPbulDDdvWe/mh0EoUMy0
         8Df++R5EF2mrMR6Y6M31nx9XOqMI3onOvaf3XnnXJKSeD3O+xH87wjGUIXarsVlTLfu7
         68LQ==
X-Gm-Message-State: AOAM530Qq6mqI3Drtcbzi05ik0ShOpEoPljv6S9fZRT6zQ9ZgJTbIJKe
        S4NFTDRC0YAdgYRjVXvAG+q1TP4C34zA4zScO0tvTE48G9k=
X-Google-Smtp-Source: ABdhPJxvA7KctlqcrwyD6hmAliVFmOjxroQz+Qk1K+9DvRABJtI4/ZvQidb40uofgQaTPOIu4vKpbcQe4aRmVi0uvhc=
X-Received: by 2002:a05:6402:41a:: with SMTP id q26mr59689516edv.387.1641495767920;
 Thu, 06 Jan 2022 11:02:47 -0800 (PST)
MIME-Version: 1.0
From:   Zhi Li <lznuaa@gmail.com>
Date:   Thu, 6 Jan 2022 13:02:36 -0600
Message-ID: <CAHrpEqRFvcTdhKq77YtMS1PJE7BYfL+nH4OmY=KE7oxSgP9bFw@mail.gmail.com>
Subject: cnds suspend crash when enable remote wakeup
To:     Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Peter:

resent as plain text.

xhci_disable_hub_port_wake access register cause crash because clock
is turned off by imx cnds run time suspend.

before Ulf's patch,  power domain will can run time resume before call
xhci_disable_hub_port_wake

when disable remote wakeup,  choose_wakeup will call pm_runtime_resume.
but when enable remote wakeup, choose_wakeup will not call pm_runtime_resume.

best regards
Frank Li

The below commit cause this problem.

 commit c1df456d0f06eb9275c1cd4c66548fc5738ea428

Author: Ulf Hansson ulf.hansson@linaro.org

Date:   Thu Mar 4 20:28:43 2021 +0100



    PM: domains: Don't runtime resume devices at genpd_prepare()



    Runtime resuming a device upfront in the genpd_prepare() callback,

    to check if there is a wakeup pending for it, seems like an

    unnecessary thing to do.
