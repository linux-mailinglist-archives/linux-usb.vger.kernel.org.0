Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42D8314BE14
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2020 17:53:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgA1QxH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jan 2020 11:53:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:54436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726383AbgA1QxH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Jan 2020 11:53:07 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4D132214AF;
        Tue, 28 Jan 2020 16:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580230386;
        bh=Egb177sXO7akCBTlkGNQGMJsdBV4gBRid1LqlLGB2FE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xYWmgHaWWNvoGsWueIEfz1ndKnhab8f+nJat3lk9+OBhZgq4ZUfug8IjgS0kZ8uiy
         wD2uzRyHkPkeA/Ib1rc7/WP9WPNlTXkN1Pmty7MtMZWHxaQilY+cpbEKenSIljC5Up
         gwZpFo3FzQgJj2107uQ5t/mK1wASNbA0aKN/dgGM=
Date:   Tue, 28 Jan 2020 17:53:04 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mans Rullgard <mans@mansr.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND][PATCH 1/2] dt-bindings: usb: add non-removable-ports
 hub property
Message-ID: <20200128165304.GD3666045@kroah.com>
References: <20200124152504.23411-1-mans@mansr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200124152504.23411-1-mans@mansr.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 24, 2020 at 03:25:03PM +0000, Mans Rullgard wrote:
> Add a non-removable-ports property that lists the hardwired downstream
> ports of a hub.  Although hubs can provide this information, they are
> not always configured correctly.  An alternate means of indicating this
> for built-in USB devices is thus useful.
> 
> Signed-off-by: Mans Rullgard <mans@mansr.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-device.txt | 4 ++++
>  1 file changed, 4 insertions(+)

Why is this a RESEND?  What changed from v1?

thanks,

greg k-h
