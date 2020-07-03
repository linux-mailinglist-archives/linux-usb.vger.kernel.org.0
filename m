Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A031213060
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 02:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbgGCALY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 20:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgGCALX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 20:11:23 -0400
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7872AC08C5C1
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 17:11:23 -0700 (PDT)
Received: by mail-vk1-xa43.google.com with SMTP id g22so2548358vke.9
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 17:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Y+Et5EkXYGsL7JRJ4AQ9XJdBe82k938L/i42V+8C0EY=;
        b=Z9AmD8dPkx4fiiRjmYHxTMlqvOCjThlPmWKKLJvZ3T2o3+Yyvg+J+bsM3oqVB0FJ7E
         ObLuWDyiASL1Qba08pZhuNAjwlMmVMzg1yVu7u5TgW+OqIVz958KU3RfPNw/+HSu9wxm
         mOAs7MD8DP5pshHhrD/6qy6a/w0RcKw3jD5cIQ/xzQD/gD17kj4yBCALH0ANjREmW7RA
         RlgOrtWkeEdV5ApddVfhULPJMte8Hg6OnztcMAqsEw8YIYy9lzS0XrMsRVK+kqa0Ei0p
         CMvDJjEKiCdciXwMB/Cq1T90raGz5RDNO+4D/V+sfpsebZFoEzEoPWP8qadQAf323Cua
         Uafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Y+Et5EkXYGsL7JRJ4AQ9XJdBe82k938L/i42V+8C0EY=;
        b=ailuHcUTzjLg1qZzmC6g+htcqTL/C/VOO3tKAXEY9oxwoeL2Sof7Ot/kcg7+MhWkL2
         K1VAQ0jj+lCv20sOTznWsxK8PykbilQRG6ltMHurcZ7S0ku6nfM596DfVBIafl0bSaaZ
         mBX5ciYnDLZVM8xunAsPlnKI8DR2blbqThgSB6yvxRedO8ZuMw5zPv2ytQ1XVM3y3yAD
         UomNrt/Xsb3rxJm5rx9puC0dJvUct+lV2kuCfT/vioS/2mbdd/UfN/XuwKjA052AIahY
         xHLDoUUZ3c6FjykGCERW8yfhsfNEG36htvM31cU2VfXiL45JEAB2r2ctiqhlDhV0asyh
         Ikdg==
X-Gm-Message-State: AOAM531OnFyGir/A1dkVJanSDqi4SZGu4f4/f01jfgF1LccBqoMsvl71
        aWxkyvdLIiGK0Ll/LYevzIwlS4FCC15wtlTaV7Ni5Q==
X-Google-Smtp-Source: ABdhPJy9uq9KqE2omdBj1DEGuXHJ11ySwnW7lOaiCRmBRzKwAacAyxskombcxPx9euQoDmLWHkwSf1lyF/949Y1eI/4=
X-Received: by 2002:a1f:9358:: with SMTP id v85mr8256509vkd.42.1593735082139;
 Thu, 02 Jul 2020 17:11:22 -0700 (PDT)
MIME-Version: 1.0
From:   Chris Dickens <christopher.a.dickens@gmail.com>
Date:   Thu, 2 Jul 2020 17:11:11 -0700
Message-ID: <CAL-1MmUi6OajEYNuP+OOEeekesZJjAGP-8VDSjGydXAMEFHhMA@mail.gmail.com>
Subject: gadget: Why do Microsoft OS descriptors need their own USB request?
To:     linux-usb <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     andrzej.p@samsung.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I've never understood it, so I figure I might as well just ask.  Why
does the Microsoft OS descriptors support require the allocation of a
separate USB request for the composite gadget device?  Both the
default control request buffer and the "special" OS descriptors buffer
are the same size (4KB) and use the same completion handler.  As far
as I can tell there is nothing distinct between them.  There's only
ever one outstanding USB request queued to ep0, so can the dedicated
USB request be removed and just share the default one?  I'm happy to
provide a patch, unless of course I've missed something.

Regards,
Chris
