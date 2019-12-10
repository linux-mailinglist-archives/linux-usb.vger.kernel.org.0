Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 149961184E6
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 11:22:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbfLJKWe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 05:22:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:57720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727063AbfLJKWe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Dec 2019 05:22:34 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D9372073B;
        Tue, 10 Dec 2019 10:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575973354;
        bh=EMAsYkaVIHiXdK2c5GAqYd2OBB76/3bpMgzpcqIM5to=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ecthEbJ3kWpPMUpseCwYMHaJN1YPpfaRZp/csbKaGy8jV8rY7HrsPAvcAMu2QY0bD
         BAACaM6RTkVN7EYVgc7fQmIGpdwddiv5XE1uZCORFITUqQhZvIbx1p1vFGPUomzszG
         3rjvbsjUW3Hc48pejwP9sGR3Zghl6wDBGu05Gpu0=
Date:   Tue, 10 Dec 2019 11:22:31 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jayshri Pawar <jpawar@cadence.com>
Cc:     linux-usb@vger.kernel.org, felipe.balbi@linux.intel.com,
        heikki.krogerus@linux.intel.com, rogerq@ti.com,
        linux-kernel@vger.kernel.org, jbergsagel@ti.com, nsekhar@ti.com,
        nm@ti.com, peter.chen@nxp.com, kurahul@cadence.com,
        pawell@cadence.com, sparmar@cadence.com
Subject: Re: [RFC PATCH] usb:gadget: Fixed issue with config_ep_by_speed
 function.
Message-ID: <20191210102231.GA3698263@kroah.com>
References: <1575284847-3388-1-git-send-email-jpawar@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1575284847-3388-1-git-send-email-jpawar@cadence.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 02, 2019 at 12:07:27PM +0100, Jayshri Pawar wrote:
>  /**
>   * config_ep_by_speed() - configures the given endpoint
> @@ -144,9 +146,11 @@ next_ep_desc(struct usb_descriptor_header **t)
>   */
>  int config_ep_by_speed(struct usb_gadget *g,
>  			struct usb_function *f,
> -			struct usb_ep *_ep)
> +			struct usb_ep *_ep,
> +			unsigned alt)

Why did you not document this new parameter?  It does not make sense to
me, what does it do, and how is it supposed to be used?

thanks,

greg k-h
