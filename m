Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9F13D845D
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jul 2021 02:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232786AbhG1AAt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 20:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232766AbhG1AAt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jul 2021 20:00:49 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E5CCC061757
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 17:00:47 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id p38so634190qvp.11
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 17:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=AekOIeBOFRSNfD3fbvoojzKHnXRHHQ3evLhhrXGhrIE=;
        b=Vcb4VCO0Iy46EtPDDFieAEzorQP5iumpBJW//RC3u5+UT6Mzh6y/CzUcjw14ng2+aC
         A6bx2l1CKlIVD5/CtJPxTvtTL1xW5fe/MK+XaPpwCjkioOvSGLfEsJric6kuJMwrl5eu
         qoifoUSsHslKpGAO0zVuoyldsObY+6SisuET0uUJhs9QVRUm+mSVey2N08dbEzAGEVwC
         wgfeSOcw3h2TbKuL5tOwOdsyfeoMJUOQ1It8/CVCx/YpSFVMAALJJMzMBCh+QaQtya2w
         0N8fWsfzyb6YP2YtdBPiiONMrXdJJnlsp22l/PiWyU0coQr6BsbISu6mfiL/j86bk2Mt
         /aWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=AekOIeBOFRSNfD3fbvoojzKHnXRHHQ3evLhhrXGhrIE=;
        b=C+l6tOQp1uzRUy0jaxgmUWplbDdX491v1xy5eAlU+UVGzVUvC8X0g5JgcOclPqAMNL
         zBlZ+p6XS+ZCLAspa1aDeoDQTSamT1p33bY0qgGvJohtZ0erKNYMc6kyyqXbCTjJj7Zc
         ZlGbLCw5yEf2XvxUzMe0mMMUM3rQpWQkBVxo8atWBGpkkejTjKamE3oq89bU2Twwc38p
         5ffH6xUGd9MPvOObXxHYEuggZ6oWZXqvL3aRW7T+1W9Sqfk+43XU3lTAfb0NDl6+KD55
         xA79Y1LvWRjsFxpuXZuCIA6MLymcu2j18i8U3WmInMqa6QEhxARWbSUbgqlmjwX7T3op
         9JiA==
X-Gm-Message-State: AOAM530Gat5nz3m3X37Xyr9YJ8JdnP+xS5Rb5GSyMi60RbX8hNiS8Zj+
        q9JWRfOLPnLCZwP6cYgKObYkw2/Ux1OGM5Bafdq/DaTNadUH4g==
X-Google-Smtp-Source: ABdhPJznnr/josYAodUdKVB4F/1kJiTi3oubZGQ5HWsrazYRaAc/0DaqqesFU+QwIq6AhfI+mMW01qS3AI/nhrh/Cgo=
X-Received: by 2002:a0c:ac43:: with SMTP id m3mr16227630qvb.5.1627430446364;
 Tue, 27 Jul 2021 17:00:46 -0700 (PDT)
MIME-Version: 1.0
From:   Vasily Khoruzhick <anarsoul@gmail.com>
Date:   Tue, 27 Jul 2021 17:00:20 -0700
Message-ID: <CA+E=qVfWm=3iJ6UR3UzeM-Se5sBjT+xx8CAM2G4bP2NxqW6itg@mail.gmail.com>
Subject: Commit 8a7bf7510d1f ("USB: serial: pl2303: amend and tighten type
 detection") broke pl2303 driver for my adapter
To:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hey,

My PL2303 adapter isn't working after I upgraded to 5.13.

Looks like the culprit is commit 8a7bf7510d1f ("USB: serial: pl2303:
amend and tighten type detection").

It used to work fine in 5.12.x.

Now it fails like this:

[246872.298632] usb 1-1: new full-speed USB device number 14 using xhci_hcd
[246872.440065] usb 1-1: New USB device found, idVendor=067b,
idProduct=23c3, bcdDevice= 3.05
[246872.440079] usb 1-1: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[246872.440085] usb 1-1: Product: USB-Serial Controller
[246872.440089] usb 1-1: Manufacturer: Prolific Technology Inc.
[246872.440093] usb 1-1: SerialNumber: CMA>b103Y23
[246872.445098] pl2303 1-1:1.0: pl2303 converter detected
[246872.445114] pl2303 1-1:1.0: unknown device type, please report to
linux-usb@vger.kernel.org

Any ideas on how to fix it properly? Should I send a patch that
handles bcdDevice == 0x305 and returns TYPE_HX for it from
pl2303_detect_type()?

Regards,
Vasily
