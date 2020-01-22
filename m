Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22CF31456C8
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 14:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbgAVNaj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 08:30:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:53688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726061AbgAVNah (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Jan 2020 08:30:37 -0500
Received: from localhost (unknown [84.241.205.26])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 60CE52071E;
        Wed, 22 Jan 2020 13:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579699837;
        bh=SDAjs5sqIgiybt3H5k/WleDIYd3+zHqgrwyo0ofPTsA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=suOltDmSao76VX45NRqLVOsLVEMbPvVlPxZAoedVymQ/a/w/rKiW1FKdOBdi3r+56
         ItehFVLbxXUj+nQXdOJUet0dMqGYDXqSFbKk57y+qbdqLB+mHr3U+UxnSgS2rtoK+V
         YXR2JzCN5YGjWk4FUCDBm+NOOKmeA05kJ7FyUcYo=
Date:   Wed, 22 Jan 2020 14:26:26 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 5/5] USB: serial: ir-usb: simplify endpoint check
Message-ID: <20200122132626.GE3580@kroah.com>
References: <20200122101530.29176-1-johan@kernel.org>
 <20200122101530.29176-6-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200122101530.29176-6-johan@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 22, 2020 at 11:15:30AM +0100, Johan Hovold wrote:
> Simplify the endpoint sanity check by letting core verify that the
> required endpoints are present.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/usb/serial/ir-usb.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
