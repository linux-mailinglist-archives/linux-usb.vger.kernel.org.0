Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EEDD21CE9D
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jul 2020 07:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728378AbgGMFKA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jul 2020 01:10:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:49976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725830AbgGMFKA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Jul 2020 01:10:00 -0400
Received: from localhost (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EA53620724;
        Mon, 13 Jul 2020 05:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594617000;
        bh=T+71+s6l4VWPehCQ62h7AwNKehDg0k3KYss2GVwg8LQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IQWA6BtmaDjd6qG8ZENdTwIho0ZEAw06GESpy5ntRo0nuqjg1OpgpEOhgdjoefZl9
         YDkKXQVA+dvoLirfvYV7iS+X/59/6kHzU3dXoElM+4R7lUEhTiRJEGSx31MSYzm/hi
         uCoATr97icxbJAO6hgk+jA3MrcdKzXsNN5O/sop4=
Date:   Mon, 13 Jul 2020 10:39:55 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     kishon@ti.com, linux-usb@vger.kernel.org, jun.li@nxp.com,
        linux-imx@nxp.com
Subject: Re: [PATCH 1/1] phy: cadence: salvo: fix wrong bit definition
Message-ID: <20200713050955.GT34333@vkoul-mobl>
References: <20200703064600.14181-1-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703064600.14181-1-peter.chen@nxp.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 03-07-20, 14:46, Peter Chen wrote:
> It fixes RX detect wakeup using USB3 device, otherwise, the USB3
> device can't wakeup USB PHY when the PHY is in 32Khz clock.

Applied, thanks

-- 
~Vinod
