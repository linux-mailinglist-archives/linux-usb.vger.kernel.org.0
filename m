Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D57D1F6BD6
	for <lists+linux-usb@lfdr.de>; Sun, 10 Nov 2019 23:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbfKJW7V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 Nov 2019 17:59:21 -0500
Received: from mleia.com ([178.79.152.223]:57924 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726610AbfKJW7U (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 10 Nov 2019 17:59:20 -0500
X-Greylist: delayed 355 seconds by postgrey-1.27 at vger.kernel.org; Sun, 10 Nov 2019 17:59:19 EST
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id 8AC713AE374;
        Sun, 10 Nov 2019 22:53:23 +0000 (UTC)
Subject: Re: [PATCH] usb: gadget: udc: lpc32xx: don't dereference ep until it
 has been null checked
To:     Colin King <colin.king@canonical.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Roland Stigge <stigge@antcom.de>,
        Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191110221413.22321-1-colin.king@canonical.com>
From:   Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <0e5105e3-768e-c8eb-dd73-d097bb7edfb2@mleia.com>
Date:   Mon, 11 Nov 2019 00:53:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20191110221413.22321-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20191110_225323_591453_2C3ACE0D 
X-CRM114-Status: UNSURE (   7.74  )
X-CRM114-Notice: Please train this message. 
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/11/2019 12:14 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer ep is currently being dereferenced when initializing pointer
> udc before ep is being null checked.  Fix this by only dereferencing
> ep after it has been null checked.
> 
> Addresses-Coverity: ("Dereference before null check")
> Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir
