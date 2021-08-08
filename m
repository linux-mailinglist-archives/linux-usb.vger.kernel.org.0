Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC4B3E3CB8
	for <lists+linux-usb@lfdr.de>; Sun,  8 Aug 2021 22:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbhHHUcc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 Aug 2021 16:32:32 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:44762 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbhHHUcb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 Aug 2021 16:32:31 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 6770220E12D8
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v2 0/9] Stop calling devm_request_irq() with invalid IRQs in
 the USB drivers
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Organization: Open Mobile Platform
Message-ID: <717ddd7c-22cd-d82c-e43d-80254718c801@omp.ru>
Date:   Sun, 8 Aug 2021 23:30:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Here are 9 patches against the 'usb-linus' branch of GregKH's 'usb.git' repo.
The affected drivers call platform_get_irq() but largely ignore its result --
they blithely pass the negative error codes to request_irq() (and its ilk)
which expects *unsinged* IRQ #s. Stop doing that by checking what exactly
platform_get_irq() returns.

[1/9] usb: dwc3: meson-g12a: add IRQ check
[2/9] usb: dwc3: qcom: add IRQ check
[3/61] usb: gadget: udc: at91: add IRQ check
[4/9] usb: gadget: udc: s3c2410: add IRQ check
[5/9] usb: host: ohci-tmio: add IRQ check
[6/9] usb: misc: brcmstb-usb-pinmap: add IRQ check
[7/9] usb: phy: fsl-usb: add IRQ check
[8/9] usb: phy: tahvo: add IRQ check
[9/9] usb: phy: twl6030: add IRQ checks
