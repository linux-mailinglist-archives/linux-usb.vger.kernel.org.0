Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE28A1D475F
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 09:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbgEOHut (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 03:50:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:36148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726706AbgEOHus (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 15 May 2020 03:50:48 -0400
Received: from localhost (unknown [122.178.196.30])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C0B5B205CB;
        Fri, 15 May 2020 07:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589529048;
        bh=yoFxDPyNuth/dPIs8o6XEVpZl0aDgc5+HcyKCXdp6yg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pY0WqLdP/EHwhoaf2sf9upkPt0FtBAim2r8tvHN0AlERBaM3EZebhs40S0qo33Qev
         sKeyTeLCZhyClLydRsh7nzC8AhGJJYPcUmnpBcj9iWHv6uYD/e0lrpn2nE9skMiH7X
         B4s6Dmz+9ayPH9kBsUxC+DBqfWBhInvpACdhhZwc=
Date:   Fri, 15 May 2020 13:20:44 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     kishon@ti.com, linux-usb@vger.kernel.org, jun.li@nxp.com,
        linux-imx@nxp.com
Subject: Re: [PATCH v2 1/1] phy: phy-cadence-salvo: add phy .init API
Message-ID: <20200515075044.GO333670@vkoul-mobl>
References: <20200513125605.5545-1-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513125605.5545-1-peter.chen@nxp.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13-05-20, 20:56, Peter Chen wrote:
> The .init is used for one-time PHY's initialization, and .power_on
> is called many times during the device lifecycle.

Applied, thanks

-- 
~Vinod
