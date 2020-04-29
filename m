Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5531BE614
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 20:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgD2SRh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 14:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726423AbgD2SRh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 14:17:37 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7D89C03C1AE
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2020 11:17:36 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j1so3743262wrt.1
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2020 11:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=6lfBNlbD4T5zHjO+6zb4aZNCWH8fCBIeJ2zjUEDU5Bc=;
        b=FKjVRVJHicGYD5WTdJMpWpXGtXFSDFjc3LSxc/83GGZ8OWLBuAvH48kbmhFmH5ZKHB
         d6KbAlikjeM2P79sOAnW/zi0L2TjWf6Cr6J/FSc9jNiv/XGitGeOwKbgrCuHv9ganP1U
         /fZeIlvVbQ1LF9LRihu8SJyJ4OHY0kVwWrIMT4nC0afpeRcj4PspcxUtSdELtnTvVhRv
         5rFC1BrK19UiqlmhPKi8ZsKVsvwJC4YuRI2YvtiSDgPHSiH0Qz01kzhtgLmpHjiY2U1K
         +LdAafAP9WKp1Z4p9nowV648/ClsicXciqHrLDPmj4I2kWcm5QXnh+y7IOgSx9nDF1lw
         AWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=6lfBNlbD4T5zHjO+6zb4aZNCWH8fCBIeJ2zjUEDU5Bc=;
        b=kDlqh6AewiamhXj7DTGpeSxks5ORD8/hE/rcoLbwU4W1FyaQndW+4+z0H2PixY/Guj
         g1zuZ3tfRvyuFSTSmeobUsTbH75PBJTW9WlurjLftKXgKQEteLex/bo0vx+nesyMrBgK
         G28YfJoqfBjcKGhlB2WHksrYRTHLT31z9VVz1qaK7N0iP4Jcq2D9iKpNtbBKuVu0n0ei
         i4UAF9R5gLG54CVBcfsGBYqAkbBeRQwY2mESCzTPqZ3eXGjwpaNvzniulIgkebaVnnvP
         rLoBDgPyBEu8GXfwvHbh7hW7h5N4e75WrQ6cMUYdRZYQRqiqeha2ed5w7yJdQ8U4e2xN
         EE+Q==
X-Gm-Message-State: AGi0PuaJC0AZb3ebWqcP5qKyf7LKaz1eYhHbM0ttNypLI7VBsntpWlWI
        L7G94pEgT1SiL0esK7fFQhRtKg==
X-Google-Smtp-Source: APiQypKmIw7W+i+Z4WSURtf6yTrOuBc3eZpc5F2oz+HJ9/6IIKwwniMHrNOG570XslOxNrE5vDfyfA==
X-Received: by 2002:a5d:5081:: with SMTP id a1mr44188891wrt.81.1588184255519;
        Wed, 29 Apr 2020 11:17:35 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id a24sm8596897wmb.24.2020.04.29.11.17.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Apr 2020 11:17:34 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, kishon@ti.com,
        balbi@kernel.org, martin.blumenstingl@googlemail.com
Cc:     linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 10/14] arm64: dts: amlogic: use the new USB control driver for GXL and GXM
In-Reply-To: <20200326134507.4808-11-narmstrong@baylibre.com>
References: <20200326134507.4808-1-narmstrong@baylibre.com> <20200326134507.4808-11-narmstrong@baylibre.com>
Date:   Wed, 29 Apr 2020 11:17:31 -0700
Message-ID: <7hr1w6kvgk.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> Add the correcly architectured USB Glue node and adapt all the Amlogic
> GXL and GXM board to the new organization.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Queued for v5.8,

Kevin
