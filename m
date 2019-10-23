Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD69BE1298
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 09:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733296AbfJWHCl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 03:02:41 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47412 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727194AbfJWHCl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 03:02:41 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0E58060953; Wed, 23 Oct 2019 07:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571814161;
        bh=ikJGw0ZB1MvADatt876rpFtahhKx91yokN5QXU9dG9Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gRzCHmRF5SPOxa/rANoXUsuzk++eYVbwSzvUFJQD5it8ajcpAwWJY+nLBavOxGzcZ
         3f0lSxSeFOiec2olyAEbLFni+aqyQgb/WTZobFOy5s/Tu4N08C3AFbQJ23ALnygIuB
         ALxClGM2GP7eL0ErAS08rGVu66oYXHPAlCBLJrZE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7FBD7602DC;
        Wed, 23 Oct 2019 07:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571814160;
        bh=ikJGw0ZB1MvADatt876rpFtahhKx91yokN5QXU9dG9Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mwYyQ+7NFACjAtLksDSYJM8ECO1qLSgbSZxwYmJ74rlC5N6OIFVlIYqFjWfUUNpNe
         KrjCwUTVaLNaoYTvwNyJl2thXflG2vNRLHPOmVyhP/W2N2VHQqeshxfsftJckBgmFA
         fatRBjnCt6vYXf1BzaTW+lBJVsZ6SabfYZgVqvTg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7FBD7602DC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jackp@codeaurora.org
Date:   Wed, 23 Oct 2019 00:02:35 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: gadget: composite: Support more than 500mA
 MaxPower
Message-ID: <20191023070235.GA2257@jackp-linux.qualcomm.com>
References: <20191023065753.32722-1-jackp@codeaurora.org>
 <20191023065753.32722-2-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023065753.32722-2-jackp@codeaurora.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 22, 2019 at 11:57:53PM -0700, Jack Pham wrote:
> USB 3.x SuperSpeed peripherals can draw up to 900mA of VBUS power
> when in configured state. However, if a configuration wanting to
> take advantage of this is added with MaxPower greater than 500
> (currently possible if using a ConfigFS gadget) the composite
> driver fails to accommodate this for a couple reasons:
> 
>  - usb_gadget_vbus_draw() when called from set_config() and
>    composite_resume() will be passed the MaxPower value without
>    regard for the current connection speed, resulting in a
>    violation for USB 2.0 since the max is 500mA.
> 
>  - the bMaxPower of the configuration descriptor would be
>    incorrectly encoded, again if the connection speed is only
>    at USB 2.0 or below, likely wrapping around UINT8_MAX since
>    the 2mA multiplier corresponds to a maximum of 610mA.
                                                    ^^^^^

Argh, my bad math/typo. Should be 510mA (UINT8_MAX = 255 * 2mA).

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
