Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 800B517486B
	for <lists+linux-usb@lfdr.de>; Sat, 29 Feb 2020 18:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727447AbgB2Rbb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Feb 2020 12:31:31 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39072 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727411AbgB2Rba (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Feb 2020 12:31:30 -0500
Received: by mail-wr1-f68.google.com with SMTP id y17so7250739wrn.6
        for <linux-usb@vger.kernel.org>; Sat, 29 Feb 2020 09:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=gIWhpXkGhBdD7D4tCRq8IhuPOVGlHh8cgQBYQ6BUTQw=;
        b=QVtbZxL4BTuOxWG9U7zurT8eoEW0kIhCosDTS6Y/48DrOg8qUH0kOS2rvyykW/zWZ2
         QAetKLAw6hJCoqsbII4eHjnCCELiBOm8pnZHs5QmpKLTYHmaznrsrb0tpJfDJQ7Hs/Nj
         0ZPNxzQbF4rk1Sj9k/DmNS31m/LZqXrk0EIj7fYomlSssHR8jjFRqQSPryvnxMlj/oQu
         e/RBcwAWRFuX9r2qRrOUtVvjXY4ZpPBEBmUnslSZCpUfeM0YGsJxaR5J44dkxv3FpuIi
         U72YHyQ2VfOMmJCXEJ0BK1vXYd0KJ/e2RDZtfmu3gEjfZDfZogCJegkZgt9q1ce4AJLj
         JAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=gIWhpXkGhBdD7D4tCRq8IhuPOVGlHh8cgQBYQ6BUTQw=;
        b=pmX4C+pUx+6m/1CeE9RTq2JfoRKmbs0N+I2GxgFgMvJ5dBdbmVKsjKoZ9FfIvoaOPH
         6Va96nJtH50R+4490ogmgUt2o1kMhoC7xq82LwaTy/vbDLxgU1MQEc/vCq0Sr4dTOMct
         /k3+7ar2C8x1VGGrviuWIdjJ6JQ6TGE3F6dBdic2fGjcAFi9pO9MN+ZPQJlFM+N2tA5X
         9EX+nVVY1ALyczWVmsVQUU50aHMAofWdLJrR5tNAlTbOreQqqOyGyFtILKkymWYOez8B
         VN+9Dd2j+vhObtTnIwWxjHwM5lB83gBuVMmmmvHel/RG4hoYTi0hqqLrj9b9L3UGTQkD
         2PZQ==
X-Gm-Message-State: APjAAAVPchiWE9oCJvxhtCjnkgmsyjYjMFtyrCGJugpgHSSMEifgAgTY
        X/bCm8nsrRW/9lAk8VfAmGVetlBtWxiQug==
X-Google-Smtp-Source: APXvYqxT81ciYzv3VRN7D5AK2cO0SiOZFOz6Hky5+PclfU1bKhrwyZ6y65WbJRRZN9RDot83f+FhcA==
X-Received: by 2002:adf:eb51:: with SMTP id u17mr12129653wrn.29.1582997488817;
        Sat, 29 Feb 2020 09:31:28 -0800 (PST)
Received: from localhost (229.3.136.88.rev.sfr.net. [88.136.3.229])
        by smtp.gmail.com with ESMTPSA id 19sm8213197wma.3.2020.02.29.09.31.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Feb 2020 09:31:28 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, balbi@kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dongjin Kim <tobetter@gmail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>, Tim <elatllat@gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: g12-common: add parkmode_disable_ss_quirk on DWC3 controller
In-Reply-To: <20200221091532.8142-4-narmstrong@baylibre.com>
References: <20200221091532.8142-1-narmstrong@baylibre.com> <20200221091532.8142-4-narmstrong@baylibre.com>
Date:   Sat, 29 Feb 2020 18:31:27 +0100
Message-ID: <7hwo859u6o.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> When high load on the DWC3 SuperSpeed port, the controller crashes with:
> [  221.141621] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
> [  221.157631] xhci-hcd xhci-hcd.0.auto: Host halt failed, -110
> [  221.157635] xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
> [  221.159901] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
> [  221.159961] hub 2-1.1:1.0: hub_ext_port_status failed (err = -22)
> [  221.160076] xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
> [  221.165946] usb 2-1.1-port1: cannot reset (err = -22)
>
> Setting the parkmode_disable_ss_quirk quirk fixes the issue.
>
> CC: Dongjin Kim <tobetter@gmail.com>
> Cc: Jianxin Pan <jianxin.pan@amlogic.com>
> Reported-by: Tim <elatllat@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

With the bindings reviewed/acked, I'll queue this DT patch for v5.7.
The binding and driver patches will need to go via the USB tree.

Kevin
