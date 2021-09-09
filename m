Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 313204044D9
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 07:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350663AbhIIFQ2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 01:16:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:39642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350660AbhIIFQ2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Sep 2021 01:16:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 83A58600D4;
        Thu,  9 Sep 2021 05:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631164519;
        bh=f238whqD1zFDdpfqkzknGsSGnjPkALhXkrVjnxpNJMw=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=OeoeDmL0o+4TL8LkdKkdtpZy0SaMMCtT6cG8DY/ZbaqOw3qOMWXLzFFwEDyL38kwQ
         BJ6L7aANn4iM7j0ZQ2isOceYOiqciKdKD5kz4zImBoSSwhpJQ4TzS1gMqZRqK6KphL
         q2i9aYPl5w7s/KGmQrvn2b59LNRgWCqg9nvgsHn+j5JkisqcGJFrRvfkQ8hNnFEQBZ
         5D9DBgxfEx1qPHoy6zY7DZ9LtKgzNwofKocwH36ytfczsUMsF4FYo2A+1LzDw/5f8G
         hZPUclmsH6PxwZC3GrpAYhgOh6z5FHCQTqwpWf565KyjVcygL/gRigWQUGfPOcaFHN
         ZRwfS3TCnWMhg==
References: <1631068099-13559-1-git-send-email-jun.li@nxp.com>
User-agent: mu4e 1.6.5; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
        chenyu56@huawei.com, john.stultz@linaro.org,
        linux-usb@vger.kernel.org, faqiang.zhu@nxp.com, linux-imx@nxp.com,
        kishon@ti.com
Subject: Re: [PATCH] usb: dwc3: core: balance phy init and exit
Date:   Thu, 09 Sep 2021 08:12:35 +0300
In-reply-to: <1631068099-13559-1-git-send-email-jun.li@nxp.com>
Message-ID: <87k0jqba8s.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Li Jun <jun.li@nxp.com> writes:

> After we start to do core soft reset while usb role switch,
> the phy init is invoked at every switch to device mode, but
> its counter part de-init is missing, this causes the actual
> phy init can not be done when we really want to re-init phy
> like system resume, because the counter maintained by phy
> core is not 0. considering phy init is actually redundant for
> role switch, so move out the phy init from core soft reset to
> dwc3 core init where is the only place required.
>
> Fixes: f88359e1588b ("usb: dwc3: core: Do core softreset when switch mode")
> Cc: <stable@vger.kernel.org>
> Tested-by: faqiang.zhu <faqiang.zhu@nxp.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>

we need a few more Tested-bys, but patch looks good:

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
