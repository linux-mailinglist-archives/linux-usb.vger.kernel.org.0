Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA8A8E538
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 09:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730553AbfHOHIy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 03:08:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:44044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726366AbfHOHIx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Aug 2019 03:08:53 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 97FEC20656;
        Thu, 15 Aug 2019 07:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565852933;
        bh=yyfNAajZQ03NyCiArPb1FNKdE1FxCutrW6DAEOf/7o4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Do3AAM4euj9weNs+x5WmmiDrQ5Ul8s6AtHT9P69KrGhlnUwRFQPWe09Nd4Ssq7x1j
         PkUi1RKEQmJyprkISIGhGcq2tnhss1U8OcBCQ/dbWlPamFYbJJGtPZm9nugnBfc10b
         TT8PGlOcXUyWBJfC+2EMLA1kgweUltlIba9PoG1M=
Date:   Thu, 15 Aug 2019 09:08:49 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     cy_huang <u0084500@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        cy_huang <cy_huang@richtek.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, gene_chen@richtek.com,
        shufan_lee@richtek.com
Subject: Re: [PATCH] From: cy_huang <cy_huang@richtek.com> Subject: usb: add
 more vendor defined ops in tcpci
Message-ID: <20190815070849.GA24779@kroah.com>
References: <1565842753-14245-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565842753-14245-1-git-send-email-u0084500@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 15, 2019 at 12:19:13PM +0800, cy_huang wrote:
> From: cy_huang <cy_huang@richtek.com>

Your subject line is a bit odd :)

Also, we need a "real" name here, and in the signed-off-by line, not an
email prefix.

Please fix up and resend.

thanks,

greg k-h
