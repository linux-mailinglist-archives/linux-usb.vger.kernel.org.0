Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93CD343AC4F
	for <lists+linux-usb@lfdr.de>; Tue, 26 Oct 2021 08:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232785AbhJZGeH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Oct 2021 02:34:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:54104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229635AbhJZGeF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 Oct 2021 02:34:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99A4F61039;
        Tue, 26 Oct 2021 06:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1635229902;
        bh=5smuRiWqUmW9EHAeSOaFf38Cbdlsru/cJLOjXLrKqqI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L0LmprnM/JJRGLzCQMbs2djgei+1/7kL6+L9EgQ0lgfXKgkwWppTaxvSNHiK2VV8W
         VGRC7Vih4c+2ahZ1CN2i9wvvKgKpM9mbvEeoKOYVI/Nn0P7AwXWMRcvxLy7ViXFUPR
         MaJ8OYWrTtzexX6hU/EReFs5AsGTGTCw/ZI5+N+8=
Date:   Tue, 26 Oct 2021 08:31:39 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Jack Pham <jackp@quicinc.com>
Subject: Re: [PATCH v13 1/2] usb: gadget: configfs: add explicit gi variable
Message-ID: <YXegy/DIEQOcUzR8@kroah.com>
References: <1635229309-2821-1-git-send-email-quic_linyyuan@quicinc.com>
 <1635229309-2821-2-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635229309-2821-2-git-send-email-quic_linyyuan@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 26, 2021 at 02:21:48PM +0800, Linyu Yuan wrote:
> first it will make ussage of to_gadget_info()  consistent,
> and gi will be used in following patch as trace event
> call argument.

Your subject line is odd, it does not make much sense.

And this changelog text also is not very descriptive (and you have an
extra ' ' in it).

Please read the kernel documentation for how to write a good subject
line and changelog text and have one of your coworkers review it before
sending it out again.

thanks,

greg k-h
