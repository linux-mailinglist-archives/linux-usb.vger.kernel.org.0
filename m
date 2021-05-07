Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70175376001
	for <lists+linux-usb@lfdr.de>; Fri,  7 May 2021 08:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233905AbhEGGDP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 May 2021 02:03:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:33058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229637AbhEGGDO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 May 2021 02:03:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00DC6613EA;
        Fri,  7 May 2021 06:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1620367334;
        bh=G8F9QMTQfw1hgGVuHVsFRb8d7M/5b+15fyzXN/XgMig=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i1POt83GszDJrezHG5Mi5ab1wRzQqGSHVlTqEDU9EfE0WvNnylEDeRRxvzBtPwVnM
         vDy1X8yEbq9dMZbRouJwOJAOtg7dWEwZ61Y1+vJLHK1pSirC7p7RKZwOpTVw2MZ+Rd
         M4hQU+GjbBtwyxLSmohiNSGOQAHGgELQ973DFoIU=
Date:   Fri, 7 May 2021 08:02:11 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Rui Miguel Silva <rui.silva@linaro.org>
Cc:     kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        clang-built-linux@googlegroups.com, linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 7/9] drivers/usb/isp1760/isp1760-regs.h:286:21:
 warning: initializer overrides prior initialization of this subobject
Message-ID: <YJTX4/vPcsQaoeyI@kroah.com>
References: <202105062318.xxK3ju2U-lkp@intel.com>
 <CB6AA86KSN8C.2UEPEE2H5WFKY@arch-thunder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CB6AA86KSN8C.2UEPEE2H5WFKY@arch-thunder>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 06, 2021 at 04:56:01PM +0100, Rui Miguel Silva wrote:
> Hi Greg,
> I have this all fixed in my v2 branch. So, I think  it is better to
> drop the first 3 from your branch, sorry about that.

Ok, will do now, thanks.

greg k-h
