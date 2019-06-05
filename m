Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C347D35B9B
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 13:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727967AbfFELo3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 07:44:29 -0400
Received: from ns.iliad.fr ([212.27.33.1]:32880 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727977AbfFELo2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Jun 2019 07:44:28 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 6AC72201FB;
        Wed,  5 Jun 2019 13:44:26 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 5452B20109;
        Wed,  5 Jun 2019 13:44:26 +0200 (CEST)
Subject: Re: [PATCH v2] USB: move usb debugfs directory creation to the usb
 common core
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20190605092816.GA23758@kroah.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <6ba00d6b-f236-f640-44b2-e801d9f2aa11@free.fr>
Date:   Wed, 5 Jun 2019 13:44:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605092816.GA23758@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Jun  5 13:44:26 2019 +0200 (CEST)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 05/06/2019 11:28, Greg Kroah-Hartman wrote:

> The USB gadget subsystem wants to use the USB debugfs root directory, so
> move it to the common "core" USB code so that it is properly initialized
> and removed as needed.
> 
> In order to properly do this, we need to load the common code before the
> usb core code, when everything is linked into the kernel, so reorder the
> link order of the code.
> 
> Also as the usb common code has the possibility of the led trigger logic
> to be merged into it, handle the build option properly by only having
> one module init/exit function and have the common code initialize the
> led trigger if needed.
> 
> Reported-by: From: Chunfeng Yun <chunfeng.yun@mediatek.com>

You have a spurious "From: " in there ;-)

Regards.
