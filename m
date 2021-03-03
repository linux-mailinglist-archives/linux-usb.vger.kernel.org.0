Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4BB132B711
	for <lists+linux-usb@lfdr.de>; Wed,  3 Mar 2021 12:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238766AbhCCKbr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 05:31:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:58564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1842206AbhCCG6P (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Mar 2021 01:58:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAC0564EDC;
        Wed,  3 Mar 2021 06:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614754652;
        bh=Il6NY7vYQFAtp00egyDxGLv8P/xc1G2uH83impl1d1w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2BCR1fdrzSHa8s+JIqAXfc6TPjAO6Ty/GptJwrHVEbMPCxQRXF+0z05d4aYa9DdhH
         FOY5dvKjeJVUN9BpxCoBbUypmyAmDGKJry/VUKqKP73zo5wpjFS2RELINm/UXN4bcH
         Ubchb8EQFcpjEySa+4T4vTF3VQILCRZoXTok/7j8=
Date:   Wed, 3 Mar 2021 07:57:29 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ray Chi <raychi@google.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, kyletso@google.com
Subject: Re: [PATCH] usb: dwc3: document usb_psy in struct dwc3
Message-ID: <YD8zWWH79HaTTyWR@kroah.com>
References: <20210303064842.2723785-1-raychi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303064842.2723785-1-raychi@google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 03, 2021 at 02:48:42PM +0800, Ray Chi wrote:
> The new struct member was added to struct dwc3, but
> a documentation was missing:
> 
> drivers/usb/dwc3/core.h:1273: warning: Function parameter or member 'usb_psy' not described in 'dwc3'
> 
> Signed-off-by: Ray Chi <raychi@google.com>

You forgot the "Reported-by:" line here.

Please fix up and resend a v2.

thanks,

greg k-h
