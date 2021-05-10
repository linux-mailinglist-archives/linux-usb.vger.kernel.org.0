Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE0D377E06
	for <lists+linux-usb@lfdr.de>; Mon, 10 May 2021 10:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbhEJIXJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 May 2021 04:23:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:58148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230118AbhEJIXI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 May 2021 04:23:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5CBB861433;
        Mon, 10 May 2021 08:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620634924;
        bh=F8qr5CFjkoss5VAMn+6ydeJ1hfmDPDfEDRj44DNPwLc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LWHiRMiW5vPCXSZUxPEqGELSsTmqJMVd92w4N1dFpshqyz27urszZOWQNnwPJbW/e
         FpsfWguYBKjcrgHX/b9zboIsjqfJRNmIMWZEumG/9Fx0a8GLpW0+BP7u8tSDrgbz93
         zbs6RtVENtb17MXSjPIwGBX+ggeeVEJyV2YnquFFJekLm934oijNowX12fI+EU7fyH
         2lYfWvy46M0swEVPc3WDBuwDNkhtr96PWX6dkeNuwVjJ0dGc8ENN6O50XPpc3yk1Cp
         s4maVYSjCi24vDUtZiYG+OKY0oZMu9kSgEygbD8VqPVlzuoTB1VFDH8KuHBRbY7nW+
         uSc5uJpOdkGrA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lg1Ay-0000QH-Hn; Mon, 10 May 2021 10:22:05 +0200
Date:   Mon, 10 May 2021 10:22:04 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Robert Wolters <robert@woltersonline.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Set custom baud-rate for SCS P4 Dragon
Message-ID: <YJjtLMt/N427U1q7@hovoldconsulting.com>
References: <20210506104425.96371fb3f743800896605ae4@woltersonline.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506104425.96371fb3f743800896605ae4@woltersonline.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 06, 2021 at 10:44:25AM +0200, Robert Wolters wrote:
> Why: FTDI USB serial speed issue with SCS P4 Dragon short-wave modems,
> a custom baud-rate is required
> 
> Solution: set special baud-rate by setting a custom divisor on 38400B

You can set any baudrate you want using the TCSETS2 interface, and you
can still use the legacy TIOCSSERIAL ioctl interface (e.g. setserial)
if you prefer.

No need to be hardcoding anything in the kernel.

Johan
