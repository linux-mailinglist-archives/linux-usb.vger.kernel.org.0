Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71087464138
	for <lists+linux-usb@lfdr.de>; Tue, 30 Nov 2021 23:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234828AbhK3W0X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Nov 2021 17:26:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233339AbhK3W0T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Nov 2021 17:26:19 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 618C2C061574
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 14:22:59 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id m27so57502927lfj.12
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 14:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=MDdkGpaF7MxpxpPyhszqZmZD0jT3vIBvcpA0vEUyVoc=;
        b=lQpSBhWrGZsnfxgduRa2ickRenf5lYoly7QEZ4X8uJ4+SEn0vnbRemW+8s3XtR0veB
         /XF1Hf1tvK2Ou28dUBGCtIPvT8Qf7F2w1cKJzm3uUcOtYPCVbuPp5LK6uqGcN3H9LZvV
         nmAEU0swQ8HGDaaLA05dPVEAhLwweg/OUinea7DNjmOtl7expJZdVf1Z1Jlm4oSjQF9T
         A06LLbST1caVpMA/hcNd6QtUyS+9vlIwJf7LD+3dRJIqx0LAtk9q1NAStIjDzmAUFgqG
         QBT5oVAUdroaCtFf1wNovGAj5j86XE4qxVaRlufyg/duYzgBOp0g5SmnA2y7acTMlgMh
         LbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=MDdkGpaF7MxpxpPyhszqZmZD0jT3vIBvcpA0vEUyVoc=;
        b=6l/eimjOMZ+XGsgDJRZLUz0x/b+RIFrjClzmfxb2BtvQEiIHYmVc8GRatBCnC029wn
         qRg0wOohA2cs9ypieVTNxD+Tqiq2aV/XmsD+WQ+bWFPpqH8yVcVOfVeFpQJzZiEI37g2
         /pCQjMaSXD9T/zqScyOh6JSYjUMwCxw2Ygm2mQdSSSqPQ33bVby/22pf9WahUfdarJ6Z
         brqUdJAI/xHILy0+v7u0RdUW3Sr71UoUYbirzpNFf4K9Y2QPfYIOWM1bW++CctInXyH5
         lRFn5cQ7Alb23s1ytf8SHuLuVsAffIZ6tMjLUhUVYDi0YgIFR68PXDBvs+oxAe7yPZj4
         dXlA==
X-Gm-Message-State: AOAM533+UpHws8c9yZwyeKTZdFgDXurOkw7Ts9lIrlBO5y4ZhaEu9vNc
        1Ft+Rriz0C/scsync8Eg2Nw=
X-Google-Smtp-Source: ABdhPJyVpj91+6aQYwriN9o2X/ymHu+mTk9r0nO+x2l/Dn6dm+OZiqe7rTzQ4cWclMqDYystkESqHQ==
X-Received: by 2002:a05:6512:e91:: with SMTP id bi17mr2047851lfb.14.1638310977234;
        Tue, 30 Nov 2021 14:22:57 -0800 (PST)
Received: from dell-precision-T3610 (h-98-128-167-144.NA.cust.bahnhof.se. [98.128.167.144])
        by smtp.gmail.com with ESMTPSA id f18sm1612973ljc.104.2021.11.30.14.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 14:22:56 -0800 (PST)
Date:   Tue, 30 Nov 2021 23:22:54 +0100
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH v6 0/5] tools/usbip: Patch set summary
Message-ID: <20211130222254.GA16447@dell-precision-T3610>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To forward a remote usb device over usbip the following steps is required:

1. Execute "usbip bind" on remote end.
2. Execute "usbip attach" on local end.

These steps must be perfomed in above order and after usb device is plugged in.
If the usb device is unplugged on the remote end the steps above needs to be
performed again to establish the connection. This patch set implements a feature
to persistently forward devices on a given bus. When using flag "-p|--persistent"
on remot end, the USB device becomes exported when plugged in. When using flag
"-p|--persistent" on local end, the USB device becomes imported when available
on remote end. Thus it is only required to run the usbip command once on each
end, in any order, to persistently forward usb devices on a given bus.

This is sent in five separate patches:
  tools/usbip: update protocol documentation
  tools/usbip: update manual pages
  tools/usbip: add usb event monitor into libusbip
  tools/usbip: export USB devices on a given bus persistently
  tools/usbip: import USB devices on a given bus persistently
