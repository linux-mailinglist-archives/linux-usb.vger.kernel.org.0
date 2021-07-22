Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5923D1D48
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jul 2021 07:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhGVEgN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jul 2021 00:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbhGVEgM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Jul 2021 00:36:12 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CAF0C061575
        for <linux-usb@vger.kernel.org>; Wed, 21 Jul 2021 22:16:48 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id v189so2708850ybg.3
        for <linux-usb@vger.kernel.org>; Wed, 21 Jul 2021 22:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tRveWtYDfRTxBNsXLv7NSph+s4fGOrwieyz6vTiYfP8=;
        b=JibbNSl+sQSJXlegu+UpR6kAk9olWu6LT/tJ0jOyHwXOo7TwZPTvHMCg6eudUcMVch
         +eKUWcImvlckSpc+LMG2VglJYof7+bPEUwYSnKyrlOAhupUYJx5jIvRSjHpsK0kTloNj
         c8/rHKPYf8Lfw6ob+IjDMnRGr4CV1/UZNhYMJxie5N9kQi9WwtgUoOuPqpVzA/99x6rO
         ZqJBIXUIXBSvSZU1OJaqxhNLU+AljG7Vie3RMDHcJJi1mvs2tNZf0u+Xfac1NRQOk1Xb
         xr5NbBRemtUbGejACeBKEl1gGmklJjICCZswKotcG3/Ph/NHYPXAo8VG0lCku4CLWsy3
         p6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tRveWtYDfRTxBNsXLv7NSph+s4fGOrwieyz6vTiYfP8=;
        b=HHaPXa6nn66lTzR66iZDRWk4/Yy2m/zI9OQlbKJmfcKH5c25spjURDb1GRDRBSzE5o
         bN75lQn4E4CCQo5Cl3DE7ImwKkJuGBhpYnFF1BKKapzANbkk+zfgDeIqqzpe+yBC+pZX
         wa/0zJFSdYzlsO0vAugTvFbf7xQ+n2PMJrFuoaVKNORqgvslLJBZhss8N0od+TXQCpU+
         fB1RUIoNElzkZbPlh4OjUDmFipxyAJAONLwdl73LzX45TTNwKIYhSeZ8DHaMzsyJXSub
         LXc8c2A4+Ryj1DizSEK0f28fsRhdtu7YVzQuGF4xJ5Md3wpDr3pUCeneD6pSLunE0gx6
         RrXA==
X-Gm-Message-State: AOAM530kXvvD8IG8YFAuND0t7sgUuH3tdkf2GxAUl7TEY4KIWdrUuxPt
        rhvN7H0loUkplKL0JefKWyBEWOVEz3288hOiZrpNUiA2Fm1MUQ==
X-Google-Smtp-Source: ABdhPJxTKTN8mS7voR0Bd6egxOKqRZvFRpzPJG9wFLV8Y5524n4afrJ21BcZ6HVgoYepWjcDmiJGMAfa0+WxkZgeRjo=
X-Received: by 2002:a25:1c1:: with SMTP id 184mr49495666ybb.175.1626931007507;
 Wed, 21 Jul 2021 22:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210622120906.743-1-charlesyeh522@gmail.com>
In-Reply-To: <20210622120906.743-1-charlesyeh522@gmail.com>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Thu, 22 Jul 2021 13:16:36 +0800
Message-ID: <CAAZvQQ7af2zowxUr7UikPkQvBkcx7PFFey-fs1DixwwpWco5CA@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: pl2303: Add new PID to support PL256X (TYPE_MP)
To:     Greg KH <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Cc:     =?UTF-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Any update?

Charles.
