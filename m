Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 303E721CEB7
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jul 2020 07:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728889AbgGMFNZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jul 2020 01:13:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:50844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727829AbgGMFNY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Jul 2020 01:13:24 -0400
Received: from localhost (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6B96720724;
        Mon, 13 Jul 2020 05:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594617204;
        bh=sNwEMnzMjnyMevJ5fKpvrizzjBpnAP1Ys8GpNfdQ4z4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QQz2OglxSySt85av7NPMFfZTqueb0DO9C+FssnfRj/rvOcaw8elpB8cmWzWPKMA/0
         75CwnQVm0Nfr5lSbEQ6j/a8Hl/GgWqF5PPffLE3tjdir9/a0VZy6Ox7FSrmWTXtueK
         3gooGbQ918iysruy8cbUAF5Bm5mKvRXjMAo+eynE=
Date:   Mon, 13 Jul 2020 10:43:20 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH RESEND] phy: exynos5-usbdrd: Calibrating makes sense only
 for USB2.0 PHY
Message-ID: <20200713051320.GW34333@vkoul-mobl>
References: <CGME20200708133811eucas1p1df7b92d7e0ba512c5a7ecdb948edbfcf@eucas1p1.samsung.com>
 <20200708133800.3336-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708133800.3336-1-m.szyprowski@samsung.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 08-07-20, 15:38, Marek Szyprowski wrote:
> PHY calibration is needed only for USB2.0 (UTMI) PHY, so skip calling
> calibration code when phy_calibrate() is called for USB3.0 (PIPE3) PHY.

Applied, thanks

-- 
~Vinod
