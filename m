Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCE23E9E05
	for <lists+linux-usb@lfdr.de>; Thu, 12 Aug 2021 07:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234361AbhHLFkX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Aug 2021 01:40:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:33866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231382AbhHLFkU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Aug 2021 01:40:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79FBD60FED;
        Thu, 12 Aug 2021 05:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628746796;
        bh=0vaRNZtqQOgRCFNhvy1ym7kYsCaRUMuACDfnp7A+D/o=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=NOx4Lu+NJQRiWokeEctqqvE72VLLi9UUu0eRcs+aJRpabcJH2XoUQEYm1YlekKYA2
         5ouw1BnYlbYB3Y1OxYMINQq+i9Dhg3dx0IU29VFqP0W8ywWpKbnnPuGKdz463uluz1
         DTgdzjLGPp21bRF8eNgOOymD1ufpg23fmH8M2zFZbegR6KjajAnPwuK15g/iqAIL//
         /SRMTVb0FaCWwa3du6tiEMprgIHDO0jivNjNjCazLjh6QhM1DkKsh7/0zZr/Wlddf1
         UVzvkMdVwvNhQjy99W4z41wNIEgIFTde3aw2ULxTISuHarR8L6CTnwqXQzewOhhr2f
         C08DhTdDxxfkA==
References: <47bacc02-4e34-3208-779c-7072a6261782@omp.ru>
 <9507f50b-50f1-6dc4-f57c-3ed4e53a1c25@omp.ru>
User-agent: mu4e 1.6.2; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 9/9] usb: phy: twl6030: add IRQ checks
Date:   Thu, 12 Aug 2021 08:39:37 +0300
In-reply-to: <9507f50b-50f1-6dc4-f57c-3ed4e53a1c25@omp.ru>
Message-ID: <87v94bz0eu.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Sergey Shtylyov <s.shtylyov@omp.ru> writes:

> The driver neglects to check the result of platform_get_irq()'s calls and
> blithely passes the negative error codes to request_threaded_irq() (which
> takes *unsigned* IRQ #), causing them both to fail with -EINVAL, overriding
> an original error code.  Stop calling request_threaded_irq() with the
> invalid IRQ #s.
>
> Fixes: c33fad0c3748 ("usb: otg: Adding twl6030-usb transceiver driver for OMAP4430")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
