Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE96733EBBF
	for <lists+linux-usb@lfdr.de>; Wed, 17 Mar 2021 09:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbhCQImn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Mar 2021 04:42:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:43804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229571AbhCQImk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 17 Mar 2021 04:42:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F12C464ED2;
        Wed, 17 Mar 2021 08:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615970559;
        bh=WeB2YJUvZs1yUqV81ZMzfuXVnO9gyu4LvgBha6Fc6tE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B5iohAI7UhV6VFy6j1IRSVFSerGo6RrSnxmNH5feoMzGdcAFJZ6SzAdWRUsQxpd8P
         vwHB0PEhE3oEKNJz4G/4YRSI2GAS0rf3uf9LHcATu8cBqvUeJ9QIUnCQWMjqTXGELo
         PbymT6Ce1t3dfiIkuhUPVIxQP+PY3is4k/sPE29UkWafaYeeO38c0MHnZdyh7L70QW
         xURpEMUu+lRQrwl2aXF1pozpWOVevHqpimDx+2uujS0Xag9JOUVlJO3qlikmpHYBZd
         flokYwJty8ee8dNCTu2YyXXYLC5Jmdz7QC1mV5DfzioctHKUMJAyCarV1DFv6NYNcG
         pgOrCezceOAvA==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lMRlU-0008Tn-CI; Wed, 17 Mar 2021 09:42:53 +0100
Date:   Wed, 17 Mar 2021 09:42:52 +0100
From:   Johan Hovold <johan@kernel.org>
To:     michaelk@IEEE.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH V3 1/1] USB: serial: pl2303: TA & TB alternate divider
 with non-standard baud rates
Message-ID: <YFHBDIJs4aF2jrQO@hovoldconsulting.com>
References: <20210316171700.952705-1-michaelk@IEEE.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316171700.952705-1-michaelk@IEEE.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 16, 2021 at 01:17:00PM -0400, michaelk@IEEE.org wrote:
> From: Michael G. Katzmann <michaelk@IEEE.org>
> 
> Use an alternate clock divider algorithm and bit ordering for the TA and
> TB versions of the pl2303. It was discovered that these variants do not
> produce the correct baud rates with the existing scheme.
> 
> see https://lore.kernel.org/r/3aee5708-7961-f464-8c5f-6685d96920d6@IEEE.org
> 
> Signed-off-by: Michael G. Katzmann <michaelk@IEEE.org>

Now applied on top of the device-type series. Thanks!

Johan
