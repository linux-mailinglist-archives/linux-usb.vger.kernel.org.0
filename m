Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37D8643D0A9
	for <lists+linux-usb@lfdr.de>; Wed, 27 Oct 2021 20:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243535AbhJ0S0V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Oct 2021 14:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233726AbhJ0S0V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Oct 2021 14:26:21 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C1C5C061570
        for <linux-usb@vger.kernel.org>; Wed, 27 Oct 2021 11:23:55 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id br18so3363602qkb.1
        for <linux-usb@vger.kernel.org>; Wed, 27 Oct 2021 11:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5dU5i2rPAA1rWa1tBZegagA5UHnsbTclU/Hvls+bm6w=;
        b=LnRRS+MmzvGJTLZ4cdjuzpaM79iMGNZvfqRkeBYT+/VV6Zxo3dkTmrRHfLbM2Y/Cw2
         1+b0r9rHhreWhKzLcucFILGrNT9TEqlx0EM0ljZnye2h5Xduc1sS5dWHE1Xk3PzU3B1L
         3RQhu5MNmGTwvqi8CZObzmDLH4GSQbKTFjuwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5dU5i2rPAA1rWa1tBZegagA5UHnsbTclU/Hvls+bm6w=;
        b=gkTfo0H5v5WhT/g39oJ9mX1REnGwV7IouT4fb/YQsCEZHJLDZouOhSwVEoJN1SdVi/
         tmvVCMuHz8IHGKcYvGKBvDrH7l9ewTovXfs2Ezn0KGfxmzl9SAxeHRAvvQA0+MiOb0kS
         0ttzhNApymUMAqPODYsbQRKokHo/zOta41pfSObYkbiqgHn7RQqf8+7x9Zq8VzbP0Jwl
         rQQjjEygu53mphy5ff97P4H/iwbbdPHAQ/WDy7Yjbqsm1K3QOG4oq9GRNFrrPrV1+gpy
         AOsJ+hj3izEDQiTyca6ruXh4Om4IwXU7j2LQ9qzDA+wga8auyfXH23sM3iVA86RVNMJX
         H2vw==
X-Gm-Message-State: AOAM532Lde5GAC7+hxnA/r+iN9kZGs20VroEDvbxw9dVOcsFpBLVa4RL
        rp+RDduYFZAMGC142LLXhvj1wmwgsVaugg==
X-Google-Smtp-Source: ABdhPJxutit3VAo50uPaBLATERM6Bi9MPoIvLOuNdcIRkRJnhkVH82fSBBYLMefx9aGcXoCKTlFj8Q==
X-Received: by 2002:a37:aec4:: with SMTP id x187mr26600873qke.217.1635359033650;
        Wed, 27 Oct 2021 11:23:53 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id c24sm511279qkp.43.2021.10.27.11.23.52
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 11:23:52 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id q74so2701966ybq.11
        for <linux-usb@vger.kernel.org>; Wed, 27 Oct 2021 11:23:52 -0700 (PDT)
X-Received: by 2002:a25:b851:: with SMTP id b17mr32814544ybm.301.1635359032208;
 Wed, 27 Oct 2021 11:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211026095214.26375-1-johan@kernel.org> <20211026095214.26375-3-johan@kernel.org>
 <CA+ASDXNbMJ1EgPRvosx0AbJgsE-qOiaQjeD=vCEyDLoUQAgkiw@mail.gmail.com> <YXkCVLJrQC7ig31t@hovoldconsulting.com>
In-Reply-To: <YXkCVLJrQC7ig31t@hovoldconsulting.com>
From:   Brian Norris <briannorris@chromium.org>
Date:   Wed, 27 Oct 2021 11:23:41 -0700
X-Gmail-Original-Message-ID: <CA+ASDXPGDOmZgCV01xAAgyOei9sSyNe_VUDWK7pkC_VLs4K8JA@mail.gmail.com>
Message-ID: <CA+ASDXPGDOmZgCV01xAAgyOei9sSyNe_VUDWK7pkC_VLs4K8JA@mail.gmail.com>
Subject: Re: [PATCH 3/3] mwifiex: fix division by zero in fw download path
To:     Johan Hovold <johan@kernel.org>
Cc:     Kalle Valo <kvalo@codeaurora.org>,
        Amitkumar Karwar <amitkarwar@gmail.com>,
        Ganapathi Bhat <ganapathi017@gmail.com>,
        Sharvari Harisangam <sharvari.harisangam@nxp.com>,
        Xinming Hu <huxinming820@gmail.com>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Amitkumar Karwar <akarwar@marvell.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 27, 2021 at 12:40 AM Johan Hovold <johan@kernel.org> wrote:
> On Tue, Oct 26, 2021 at 10:35:37AM -0700, Brian Norris wrote:
> > Seems like you're missing a changelog and a version number, since
> > you've already sent previous versions of this patch.
>
> Seems like you're confusing me with someone else.

Oops, you're correct :( It was only a week or two ago someone else was
trying to patch this, and I didn't remember the "From" correctly.
Sorry!

> I'll send a v2.

Looks better, thanks.

Brian
