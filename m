Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 014A72EA28F
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 02:10:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728870AbhAEBD1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Jan 2021 20:03:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728858AbhAEBDU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Jan 2021 20:03:20 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15F6AC061574
        for <linux-usb@vger.kernel.org>; Mon,  4 Jan 2021 17:02:40 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id h205so68827334lfd.5
        for <linux-usb@vger.kernel.org>; Mon, 04 Jan 2021 17:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=RV/QcqLHcJ5Ud5XxjtVpeGUML3IomjgQh1qv67NRys0=;
        b=l+cIY5XibR2biY4KnQi3CZe61Vzpng/EZmlgT9iHFUfl/m6MGYXibDM+qRx32eD5pf
         +sV+dNk6sp3Kyksau1qTVc0CYUemr6UF2PhUj3xj+NeD1z/dMNQrcdvCPUAA9343ZGC+
         7OaeY1aIZBvFzDuW9GtSN2ACJmQTiUUb73cFMQyJPRmHdrKn+/5RmCtB2g2gkFG/ORTu
         qkAh+uJMUHa26c9XciNy3drdeBS7f9+gwvGoeHB6S+/Dp+84nha/9x1NKNG9iaCYWmA6
         Bc5JuzBbQAjKqOv/KZmkKZdlmhdB6bvGWoWIlx9wRfNBcTWP5uxXU7XiceHpN9cZN62G
         ecCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=RV/QcqLHcJ5Ud5XxjtVpeGUML3IomjgQh1qv67NRys0=;
        b=qsVMQ53hQmHyUEbRsG/cV2FDrA4gyS4YccE/zRgIRSX3tBm3DBsvw4cLWEPiEekUI6
         tyqtOHSuRGFen+mEq7YdfPOoKGa+6EiGg/CNlk0Tmeyrnx/mrKSbCbGvTLH90S69z7Qp
         mtsA758+R9+/bKGkdGDb7481p079h1ahdje+x0ccSSTaXB+UZA2SFkOUmH55iyAYQZM0
         LyFxVvSGd/jKtopiRDlGso510/Y218H7VvJsqKTrLR54iMIjdWZ56TEPQLFAQT0U3rYU
         W6tZ+BKZa9Wt1bqUcOgRLqmX9qDY75rLZmI1B7lmOQ8gbSLjVX6eWtZ9IP8jTBQZHhyw
         RFtw==
X-Gm-Message-State: AOAM530SX5XpIt5f7sCj8f47YbmxRE96WJ9NRdvJlgkG1nYzuY6E2zQv
        Fq3QwmrWwwtEYC3GlwFNxSdXfDlglgQgGUUGH/Pni3464ME=
X-Google-Smtp-Source: ABdhPJymx680OY5S5SJP3Uug4LVWfFVruggUleKwRcmSp5Ve9+GnVSaLLGxd55egOsHX6BCKzYTnNOGrQuOTH+I/GGI=
X-Received: by 2002:a05:6512:247:: with SMTP id b7mr30946637lfo.171.1609808558667;
 Mon, 04 Jan 2021 17:02:38 -0800 (PST)
MIME-Version: 1.0
From:   Tomasz Grobelny <tomasz.aleksander.grobelny@gmail.com>
Date:   Tue, 5 Jan 2021 02:02:16 +0100
Message-ID: <CAAH9jopk2ngwBDxfmQ8CQsvntW0uUU2e4h3R=drXV2n2y6+Nuw@mail.gmail.com>
Subject: dwc2 gadget mode different behaviour with different hosts
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

I am trying to implement Android Open Accessory Protocol which is a
base for Android Auto Protocol. I am using Odroid N2 working in gadget
mode and trying to send data to car's headunit.

The problem I am facing now is that for some headunits it works, for
some it doesn't. It seems there is some difference in what happens
immediately after the host tries to switch device to accessory mode by
sending control commands 51, 52 and 53. The initial part in all cases
(all headunits I have access to) works just fine, but after it
completes my Odroid gadget should be reinitialized on the USB bus. On
hosts on which it works (my PC and VW headunit) the device gets new
address like this:

[   33.491312] Mass Storage Function, version: 2009/09/11
[   33.491322] LUN: removable file: (no medium)
[   33.504716] file system registered
[   33.506279] read descriptors
[   33.506290] read strings
[   33.510164] dwc2 ff400000.usb: bound driver configfs-gadget
[   33.678710] dwc2 ff400000.usb: new device is high-speed
[   33.750089] dwc2 ff400000.usb: new device is high-speed
[   33.806366] dwc2 ff400000.usb: new address 4
[   37.899601] ffs_data_put(): freeing
[   37.899862] unloading
[   38.942619] file system registered
[   38.943003] read descriptors
[   38.943009] read strings
[   38.946561] dwc2 ff400000.usb: bound driver configfs-gadget
[   39.310762] dwc2 ff400000.usb: new device is high-speed
[   39.381890] dwc2 ff400000.usb: new device is high-speed
[   39.438056] dwc2 ff400000.usb: new address 5

On Fiat's headunit I get the same address for both phases:
[   33.773387] Mass Storage Function, version: 2009/09/11
[   33.773397] LUN: removable file: (no medium)
[   33.784054] file system registered
[   33.792335] read descriptors
[   33.792389] read strings
[   33.796349] dwc2 ff400000.usb: bound driver configfs-gadget
[   34.023544] dwc2 ff400000.usb: new device is high-speed
[   34.131592] dwc2 ff400000.usb: new device is high-speed
[   34.194740] dwc2 ff400000.usb: new address 3
[   34.353478] ffs_data_put(): freeing
[   34.353825] unloading
[   35.392723] file system registered
[   35.393450] read descriptors
[   35.393459] read strings
[   35.403955] dwc2 ff400000.usb: bound driver configfs-gadget
[   37.119299] dwc2 ff400000.usb: new device is high-speed
[   37.227341] dwc2 ff400000.usb: new device is high-speed
[   37.290497] dwc2 ff400000.usb: new address 3

Any idea why this might be the case? Can I somehow enforce that the
device reintroduces itself on the bus and gets new address? Can I
somehow debug what happens when my device is connected as gadget (eg.
see control messages for device/configuration/string descriptors)?

Best regards,
Tomasz Grobelny
