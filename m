Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A16783EBD41
	for <lists+linux-usb@lfdr.de>; Fri, 13 Aug 2021 22:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234365AbhHMUYQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Aug 2021 16:24:16 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:51274 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233875AbhHMUYN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Aug 2021 16:24:13 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru C5D52208E9AC
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v3 0/2] Stop calling request_irq(), etc. with invalid IRQs in
 the USB drivers`
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Organization: Open Mobile Platform
Message-ID: <fb92857f-3120-9a20-65ba-f21aeb4b9020@omp.ru>
Date:   Fri, 13 Aug 2021 23:23:43 +0300
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

Here are 2 patches against the 'usb-linus' branch of GregKH's 'usb.git' repo.
The affected drivers call platform_get_irq() but largely ignore its result --
they blithely pass the negative error codes to request_irq() (and its ilk)
which expects *unsinged* IRQ #s. Stop doing that by checking what exactly
platform_get_irq() returns.

I've removed 7 patches that GregKH has applied to the usb-testing' branch
(holler if this isn't enough).

[1/2] usb: host: ohci-tmio: add IRQ check
[2/2] usb: phy: tahvo: add IRQ check
