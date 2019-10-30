Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 455C8E97E9
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 09:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbfJ3IP3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Oct 2019 04:15:29 -0400
Received: from gloria.sntech.de ([185.11.138.130]:53952 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725822AbfJ3IP3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 30 Oct 2019 04:15:29 -0400
Received: from [91.217.168.176] (helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1iPj8Y-0006sO-1G; Wed, 30 Oct 2019 09:15:26 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
        katsuhiro@katsuster.net, robin.murphy@arm.com
Subject: Re: [PATCH 1/5] phy: rockchip: add inno-usb3 phy driver
Date:   Wed, 30 Oct 2019 09:15:25 +0100
Message-ID: <10419898.gYlDFaIxON@phil>
In-Reply-To: <20191028182254.30739-2-pgwipeout@gmail.com>
References: <20191028182254.30739-1-pgwipeout@gmail.com> <20191028182254.30739-2-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, 28. Oktober 2019, 19:22:50 CET schrieb Peter Geis:
> Add the rockchip innosilicon usb3 phy driver, supporting devices such as the rk3328.
> Pulled from:
> https://github.com/FireflyTeam/kernel/blob/roc-rk3328-cc/drivers/phy/rockchip/phy-rockchip-inno-usb3.c
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>

What happens on plug - unplug - plug?

I remember what kept me from pushing the usb3 stuff for rk3328
was the usbphy breaking hotplug after the first unplug.

Did this get fixed?

Thanks
Heiko


