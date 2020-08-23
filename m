Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8277C24ED71
	for <lists+linux-usb@lfdr.de>; Sun, 23 Aug 2020 16:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbgHWOHB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Aug 2020 10:07:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:40010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbgHWOG6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 23 Aug 2020 10:06:58 -0400
Received: from localhost (unknown [122.171.38.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2A264206C0;
        Sun, 23 Aug 2020 14:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598191618;
        bh=Tq4hRv2IPUbOGGn/x6TFd0hocJrEGy7gIGK9B/3PdMI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cy2XscRgm/7tF2FhWl0vP82JzMLroCVfrr3I4hSNRJ3LjyFWtfPY0tiAwYcZOENl5
         kIKQgxMNq+rCLEGGJAVJHzNCNS3aKpzWFTYVN8MCPBTYmpy6+A9HWyDkCaL9+L/H74
         qcxQ+eZcOvBFEROg2VIh2HCBAtjanWbhhna/YSkg=
Date:   Sun, 23 Aug 2020 19:36:54 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v5] phy: samsung: Use readl_poll_timeout function
Message-ID: <20200823140654.GQ2639@vkoul-mobl>
References: <20200720173502.542-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200720173502.542-1-linux.amoon@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-07-20, 17:35, Anand Moon wrote:
> Instead of a busy waiting while loop using udelay
> use readl_poll_timeout function to check the condition
> is met or timeout occurs in crport_handshake function.
> readl_poll_timeout is called in non atomic context so
> it safe to sleep until the condition is met.

Applied, thanks

-- 
~Vinod
