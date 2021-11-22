Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57A8F458A63
	for <lists+linux-usb@lfdr.de>; Mon, 22 Nov 2021 09:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbhKVITJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Nov 2021 03:19:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:39398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231183AbhKVITI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Nov 2021 03:19:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D0FB60240;
        Mon, 22 Nov 2021 08:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637568961;
        bh=677Wq317dLK/9QfNnj8dEdL0wLnXwxjF4rs7qNev7Oc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a6WbpMgO+b1yj5g/oJF8xEs8Igw7LSEjNFpQWvam637oFTd5PsqBu5HkpvAgiyHAc
         xXQ3qPpwPpBuGWXhqlvaBd3fdfAFMYnEA1MfTl3yx6Vye6BGSdBhDws9bmHet3ePkF
         9Vgi9NDHdU2WkkNcCb8mMKdrW6Ulp+OtY/+dkNU9v7HXxrMpV6xQICJWenljuSmKTv
         n0YkURYOQsJFyplV0406xZZjDqv/mFA9OR6dTJCob+RScMN1ecwRC25JfQvD83O8Iy
         6Ao3LmQVMDHI7W0zPH9fZ5tDjl7z2cvsXR8dU5W6Hrpz2NnrgWj5lJ8pDOtbTfYcBs
         MGKYttoJ6X15A==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mp4UI-0000aE-8t; Mon, 22 Nov 2021 09:15:42 +0100
Date:   Mon, 22 Nov 2021 09:15:42 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/1] USB: serial: option: add Telit LE910S1 0x9200
 composition
Message-ID: <YZtRrtBZ2vd2Z+dI@hovoldconsulting.com>
References: <20211119140319.10448-1-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119140319.10448-1-dnlplm@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 19, 2021 at 03:03:19PM +0100, Daniele Palmas wrote:
> Add the following Telit LE910S1 composition:
> 
> 0x9200: tty
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> ---

Applied. Thanks, Daniele.

Johan
