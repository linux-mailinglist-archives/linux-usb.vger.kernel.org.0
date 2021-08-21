Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54FC03F3A7D
	for <lists+linux-usb@lfdr.de>; Sat, 21 Aug 2021 13:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234001AbhHUL7W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 Aug 2021 07:59:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:37130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229968AbhHUL7W (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 21 Aug 2021 07:59:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2F406120F;
        Sat, 21 Aug 2021 11:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1629547122;
        bh=FOheoCxvP3sxHE1V5C3T1TgynlLTnFs6ENWc1RdfmLI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ig9U6wYfLW2qjIw+6btRGZ+5QZEQJjOxfyUnJUi2DJwWK/B0Gf9GZxpj8EnY4yviM
         kUO4isrGamesUBs8h3B6Sp4lrhSVbJwVBSx0p8r2HByYS1LDpipO1avx+Fq7fzYIQC
         rfy1nYHXoKZNQ5xuyA8yp+RsQ/N2hZCkkHgxGwj8=
Date:   Sat, 21 Aug 2021 13:58:39 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH V2] usb: gadget: configfs: add three trace entries
Message-ID: <YSDqb96M213dL+en@kroah.com>
References: <1629432941-23737-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1629432941-23737-1-git-send-email-quic_linyyuan@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 20, 2021 at 12:15:41PM +0800, Linyu Yuan wrote:
> add UDC/link/unlink trace entry to track important event.

Why?  What exactly does this trace?  Where is it documented?  Who needs
this?

We need a much better changelog here.

> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>


What changed from v1?  That always belongs below the --- line.

thanks,

greg k-h
