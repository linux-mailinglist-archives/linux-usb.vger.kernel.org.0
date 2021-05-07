Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69625375FFC
	for <lists+linux-usb@lfdr.de>; Fri,  7 May 2021 08:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbhEGGBd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 May 2021 02:01:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:60318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229637AbhEGGBc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 May 2021 02:01:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D452C613EB;
        Fri,  7 May 2021 06:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1620367232;
        bh=8NwwG+RR/NNsJr65sCxdkYns4eegrhY8pURPafj+uTo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AAcpxwevnfLvKbIhpNEWh6cyuRhhclVW4rQWmc5jnVKUH2jX7qIzaEMO6oV6Iiwmi
         ZS6X4bMR+8ACL0UvtPREN+XeOCNMQJFGrSSyo9ihppxBLh+RIqT6zxLWl+t7RVwvZN
         p9/ySDTNHEylM+oVQ4ncBbihhgq3OiyQFnrm3Og8=
Date:   Fri, 7 May 2021 08:00:29 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Saurav Girepunje <saurav.girepunje@gmail.com>
Cc:     saurav.girepunje@hotmail.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] *** SUBJECT HERE ***
Message-ID: <YJTXfYKA8B7RA/z8@kroah.com>
References: <cover.1620361861.git.saurav.girepunje@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1620361861.git.saurav.girepunje@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 07, 2021 at 10:06:17AM +0530, Saurav Girepunje wrote:
> *** BLURB HERE ***

No subject or blurb?

> 
> Saurav Girepunje (2):
>   usb: musb: remove unused function argument
>   usb: musb: Remove unused function argument

Again, these have the same subject line, which is not allowed.

Please fix up and resend them all (we only saw 1 on the mailing list.)

thanks,

greg k-h
