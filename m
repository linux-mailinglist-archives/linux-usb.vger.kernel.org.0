Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E544D3C582
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2019 10:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404302AbfFKICp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jun 2019 04:02:45 -0400
Received: from Galois.linutronix.de ([146.0.238.70]:57177 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404132AbfFKICp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jun 2019 04:02:45 -0400
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
        (envelope-from <bigeasy@linutronix.de>)
        id 1habjm-0004KP-47; Tue, 11 Jun 2019 10:02:34 +0200
Date:   Tue, 11 Jun 2019 10:02:34 +0200
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Dmitry Torokhov <dtor@chromium.org>,
        Suwan Kim <suwan.kim027@gmail.com>,
        Raul E Rangel <rrangel@chromium.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb/hcd: Fix a NULL vs IS_ERR() bug in
 usb_hcd_setup_local_mem()
Message-ID: <20190611080233.goirgth76ftqpfyf@linutronix.de>
References: <20190607135709.GC16718@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190607135709.GC16718@mwanda>
User-Agent: NeoMutt/20180716
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2019-06-07 16:57:09 [+0300], Dan Carpenter wrote:
> The devm_memremap() function doesn't return NULL, it returns error
> pointers.
> 
> Fixes: b0310c2f09bb ("USB: use genalloc for USB HCs with local memory")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
