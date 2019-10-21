Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C58BDEC57
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 14:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728243AbfJUMfZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 08:35:25 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:32900 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727322AbfJUMfY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Oct 2019 08:35:24 -0400
Received: by mail-pl1-f195.google.com with SMTP id d22so6578715pls.0
        for <linux-usb@vger.kernel.org>; Mon, 21 Oct 2019 05:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aFSoQzruwDjvkM2UWGpQtdqo3XZFLgQ/imuRyHJ84/w=;
        b=WtfeZ/g3228cf5xLw6dlCTjipQ97ZzTgXJNeAcjXFaXaKr5vD08JruOKMf72Q2/+bc
         LcVs33B3N+Z3qov+NTX/S9bs0MfCu0lQ9aAPEhKmOkh7gSlUfD+ELQKAFqKkPxI5ZLhi
         /NiPLjrZBjaCbKeUoe2mg0ZYAAOMQdcmcTkEzAD61MD5kyQ0jviYU8x8psNZj1qNEKCV
         XHPfDbFrQMrHBnEhh5qcWpmjQLFvCi85+yGnk3KjKgTiDSRAsXv9hxk6Sxr4GROmxTjS
         2B1nnzM5tmUjurS1GInwut89mpoAVEZyvikAEnrawh7ijDY7Kaik4LDz3C4e6dZ3IFOD
         oEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aFSoQzruwDjvkM2UWGpQtdqo3XZFLgQ/imuRyHJ84/w=;
        b=K4XJk53ZL19gwB9qkSYuRRNNkbU4S6xJf3Uzv0xaFDLVQHNBYyePkjmTGOoARBcnwB
         JwBnU6/0lWWRS3pT8J/x2Lzns3vYE7ZbEVYU+EGCOM2PXax1ZVqMFkZehc+GNFxy6kQi
         D9Z5C4SEtJXRQ5S2+NORwbLkPY8C0NK6pS8DSad50v0ExVWKkRALcuiA7F0u3yh/4e3t
         6MtfyE5nE3gL0iJdavNN3QQyXBvPRweHb0txKuTMuxlAcJnT/Q7Y3uuVdHUb4z4AjbK8
         uCv6GL2ecz0PAxUcFCgfisN9n62dN+LFpVTpCTEaZrjKfQ/ZQCthk46pQNnh9TvcWd1O
         YURQ==
X-Gm-Message-State: APjAAAXvvCrAkguKiBAzbj24FxgkjLwxhTWEs8Yr3LMpgT2KSDuh63HK
        lzT/SfSjhwumreDlhQrNZEGLYfGIb+jJA0p8B6VOd4U3
X-Google-Smtp-Source: APXvYqyv+kk9HcTiXQ61zU6olrRj4Z09puxOfgt1J1jMXxquXGcBRlgvwcyd+eLX0VyQLJoRGmKGBXLgaaVtM7jB7c0=
X-Received: by 2002:a17:902:6b45:: with SMTP id g5mr24084586plt.336.1571661323722;
 Mon, 21 Oct 2019 05:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <7a9d6e35873d52ec0ab1e6b9827d9299a1f4fb0d.1571409250.git.andreyknvl@google.com>
 <20191018180652.GA1186697@kroah.com>
In-Reply-To: <20191018180652.GA1186697@kroah.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 21 Oct 2019 14:35:12 +0200
Message-ID: <CAAeHK+xk6xo_+D_0xiS-=aP_chaGmeq1kNc0Rdg-KLkXL=h6sA@mail.gmail.com>
Subject: Re: [PATCH 1/2] USB: dummy-hcd: increase max number of devices to 32
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "Jacky . Cao @ sony . com" <Jacky.Cao@sony.com>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 18, 2019 at 8:07 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Oct 18, 2019 at 04:55:56PM +0200, Andrey Konovalov wrote:
> > This patch increases the maximum number of Dummy UDC/HCD devices to 32.
>
> Yes, that is a good description of _what_ the patch does, but it does
> not tell us _why_ you want to do that.

Will do in v2, thanks!

> Also, no signed-off-by, are you sure you ran your patches through
> scripts/checkpatch.pl before sending it out?  It's a good idea to do
> so...

Sorry, missed this, I thought the patch is small enough to not do that :)
