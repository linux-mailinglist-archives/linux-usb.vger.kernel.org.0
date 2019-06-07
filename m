Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0574D38949
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 13:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbfFGLpK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 07:45:10 -0400
Received: from mail-pf1-f174.google.com ([209.85.210.174]:46320 "EHLO
        mail-pf1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727228AbfFGLpK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jun 2019 07:45:10 -0400
Received: by mail-pf1-f174.google.com with SMTP id 81so1036301pfy.13
        for <linux-usb@vger.kernel.org>; Fri, 07 Jun 2019 04:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=nks5MxKbu2Z/dmRxn12Edp+dNmmqr2Dhuedz0d2MekA=;
        b=oFbv5AzKs1MIQDRi41fB47JZjBIasKIitvKzDCbqiXe0WuU+sur78E1Z0jpp3ah+T/
         tLd1EX0rn3AVrMXsAocEXyjdaU8TcB1nB6+OAyZWqLvCPNJYhOfi2b5ul24XnQtMTXse
         y0ECpfl21V9KjXXg/EbSgdA5zTin385ci/YpmG7dC//OXmo1A60cmpACd0A5XAx2G7N4
         QhSe2Xm4KEvjIlAdq8Ow83x/jJpNs094zbuZXzvnBOk9koNLWvWQW8zWQIHV4aMALKRz
         gaRuLiMlBO4z0V4ZLsn9TdJYZsK7MiYbJa5zzRaxWEHdjVgk9bDZXlOwxxKrnBBRrCj/
         1a6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=nks5MxKbu2Z/dmRxn12Edp+dNmmqr2Dhuedz0d2MekA=;
        b=L7Bn+fW/1QdzOSrdBzBchAlkPYZAobN/piOHJNysWxLCgzuojGRyKDuCONdS3LEaen
         WG20T/0/PYDUIgvZb5wX6gY1oNUt2E1SU0KPIIiPZkTe9U+fSCut0PB7dTxIM4F8z1j0
         O9Nr1R0+8aeZ1IQXPUUk8FmVuylOpn+gQ6xnG4O73CD3LYMLpQNHPOzWPGyETqMFWmw0
         xpDFh5K34ETv3G1xXZ5WrvGNEqr7+mfv0gQ+fLcLGqZBQ7scw4hw6yCBowYT8FAqE0c6
         tbWgcVQxJOkLrWMT45vDXj/1+9sIGUawJ6jBhg5aN7vI41doGBuVSdRZU3ospEDvNX3A
         WC6Q==
X-Gm-Message-State: APjAAAVaEJGJnw2HCTmS36HHHl2lT9nQVGxwu+Qzx3DpGQL+jBdMINGJ
        vB8kPt5DFev2r7xik/qjjLLy4ya+Ged9JLaI4q97SA==
X-Google-Smtp-Source: APXvYqwFNSnT44Ux9Pn7KBINEvqzFeQ7wPU92qN9toNOdFCwfQ1IhIIfvadQE3rq7JoXKR6RDbV+r1KplLRMtEeCdec=
X-Received: by 2002:a62:1c91:: with SMTP id c139mr50300483pfc.25.1559907909102;
 Fri, 07 Jun 2019 04:45:09 -0700 (PDT)
MIME-Version: 1.0
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 7 Jun 2019 13:44:58 +0200
Message-ID: <CAAeHK+xRHB28N_VUbcCit=81+wKK=A9X3aA4rTa9aShy7b2Bnw@mail.gmail.com>
Subject: Pass transfer_buffer to gadget drivers
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

I've noticed that when the host performs a control request,
urb->transfer_buffer/transfer_buffer_length are not passed to the
gadget drivers via the setup() call, the only thing that is passed is
the usb_ctrlrequest struct. Is there a way to get the transfer_buffer
from within a gadget driver? If not, what approach would the best to
implement this?

Thanks!
