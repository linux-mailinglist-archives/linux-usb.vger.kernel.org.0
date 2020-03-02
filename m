Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72A5617613B
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2020 18:40:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727401AbgCBRkj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Mar 2020 12:40:39 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55015 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgCBRkj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Mar 2020 12:40:39 -0500
Received: by mail-wm1-f68.google.com with SMTP id z12so188018wmi.4
        for <linux-usb@vger.kernel.org>; Mon, 02 Mar 2020 09:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=K5oqHdhYQsbfwq1JYk39e1I9fjT9r5f+6YhvHb0bQI8=;
        b=MCD49OCiX7UTc2zw7TI6NhGlqWX7Y9VHIk0EDfdExeozCcgciVDPFIH0fd/R1lvBv1
         47evh82+1UHr89jfexA+0pUGgrrkrcWozvZL3nbDc/HB4oXlYJZg4IMGjBw4cQOxf8yH
         vRtckG3qJipaBRkTbNJsxz9XaG9Hazisn3fEh/2BUikhnxMx3Wyp9YMxm/YfCCvP8a1l
         H4IRAUwogSyWctz59D0VCd1sI2lu6JdXgwM3TOk1lQ8BPfTgvMmsZhAD1y1XEcrVSYJ8
         FTkEtknCxWWByrppNDuALB5r+pwuIPmMaHxHgsNGpNRwx/nN4tW5IlNPEN8FZfP26OVv
         zDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=K5oqHdhYQsbfwq1JYk39e1I9fjT9r5f+6YhvHb0bQI8=;
        b=mmMDp2d9mue3qGt2b4D9ESehBEBkft5CD8rBAenfktpjM6EPCfawHAcwLyi8TkypZd
         cXK8nAoKCL6wbUQTMaMbNGdb3m5ADrKbMSOTh/eC7w8/Hyjhg9sADZdtMloeYyNVt56L
         YPnaqb1nLqAtFW9HKbSZuposjF3qKJ2sCCeYI7no4t7l4A5Fln2CgQDnx2fQIfFmqijK
         XfFYRBL0aoVY07HTRkdEroGJoqZnl9DWI4Zgmouw7761n3wleeiMgA0knCJt99mOLVDf
         ebJ5TjJp+HJtBwDnHX6W7stXYEDFSNO5l47rqS6Vx0iZqR2ou269T9mIkW7EQE8wSIEA
         QTtg==
X-Gm-Message-State: ANhLgQ1DQjf/lbWlWT/Wr1oWzbdNigIE3E3QuQwAa/t8LwiSeF9d5425
        3toJQe0HRrfu7UTn9omMud1Kug==
X-Google-Smtp-Source: ADFU+vu4eyZf264stx6XXEuonL5I+rb48iCgNQ3uaj7b59BY/gStshUsUmb52p8X8SoOhZlTgoxJpg==
X-Received: by 2002:a05:600c:2283:: with SMTP id 3mr155939wmf.109.1583170835939;
        Mon, 02 Mar 2020 09:40:35 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id u20sm150314wmj.14.2020.03.02.09.40.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 09:40:34 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Hanjie Lin <hanjie.lin@amlogic.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Yue Wang <yue.wang@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v9 0/3] arm64: meson: Add support for USB on Amlogic A1
In-Reply-To: <1581990859-135234-1-git-send-email-hanjie.lin@amlogic.com>
References: <1581990859-135234-1-git-send-email-hanjie.lin@amlogic.com>
Date:   Mon, 02 Mar 2020 18:40:34 +0100
Message-ID: <7hblper6y5.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Kishon,

Hanjie Lin <hanjie.lin@amlogic.com> writes:

> This patchset adds support for USB on Amlogic A1 SoCs.
>
> Because of my mistake I fogot to add PHY maintainer(Kishon) to mail list in
> before versions, so I have to send this v8(and lateres) version again(only with dwc3
> bindings and driver patch removed).
>
> This patchset is composed with :
> - bindings of the PHY
> - bindings of the USB Control Glue(already accepted in v7)
> - PHY Driver
> - USB Control Glue driver(already accepted in v7)
> - dts of the PHY and USB Controller
>
> The Amlogic A1 USB Complex is composed of :
> - 1 DWC3 USB controller for USB2 Host functionality
> - 1 USB2 PHY for USB2 Host functionality
>
> The USB Control Glue setups the clocks and the reset about DWC3 USB
> controller, and binds to the USB2 PHY. It also configures the 8bit
> UTMI interfaces for the USB2 PHY, including setting USB2 phy mode.
>
> The USB2 PHY driver initializes the phy analog settings, phy PLL 
> setup and phy tuning.
>
> This patchset is based on A1 clock/power domain/reset series at [0].

Gentle reminder ping.

Once you pick up the bindings and driver (patches 1-2) I'll pick up the
DT patch.

Kevin
