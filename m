Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B74421C7ED
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jul 2020 09:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbgGLHvh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 12 Jul 2020 03:51:37 -0400
Received: from mleia.com ([178.79.152.223]:51268 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725974AbgGLHvg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 12 Jul 2020 03:51:36 -0400
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id DE6423F4C39;
        Sun, 12 Jul 2020 07:51:34 +0000 (UTC)
Subject: Re: [PATCH -next] udc: lpc32xx: make symbol 'lpc32xx_usbddata' static
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Hulk Robot <hulkci@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Colin Ian King <colin.king@canonical.com>,
        Corentin Labbe <clabbe@baylibre.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20200707105350.7064-1-weiyongjun1@huawei.com>
From:   Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <3cf8ef32-1ad4-29d5-9572-da0bf88a226a@mleia.com>
Date:   Sun, 12 Jul 2020 10:51:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200707105350.7064-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20200712_075134_940178_1613D1D2 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message. 
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/7/20 1:53 PM, Wei Yongjun wrote:
> The sparse tool complains as follows:
> 
> drivers/usb/gadget/udc/lpc32xx_udc.c:2989:25: warning:
>  symbol 'lpc32xx_usbddata' was not declared. Should it be static?
> 
> This variable is not used outside of lpc32xx_udc.c, so this commit
> marks it static.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir
