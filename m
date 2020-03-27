Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94058195B44
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2020 17:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbgC0Qhj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Mar 2020 12:37:39 -0400
Received: from netrider.rowland.org ([192.131.102.5]:45767 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727716AbgC0Qhj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Mar 2020 12:37:39 -0400
Received: (qmail 17155 invoked by uid 500); 27 Mar 2020 12:37:38 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 27 Mar 2020 12:37:38 -0400
Date:   Fri, 27 Mar 2020 12:37:38 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     vladimir.stankovic@displaylink.com
cc:     gregkh@linuxfoundation.org, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <mausb-host-devel@displaylink.com>
Subject: Re: [PATCH v4 4/8] usb: mausb_host: Implement initial hub handlers
In-Reply-To: <20200327152614.26833-5-vladimir.stankovic@displaylink.com>
Message-ID: <Pine.LNX.4.44L0.2003271236040.14887-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 27 Mar 2020 vladimir.stankovic@displaylink.com wrote:

> Implemented handlers for subset of HCD events.
> 
> Signed-off-by: Vladimir Stankovic <vladimir.stankovic@displaylink.com>
> ---
> +/*
> + * For usb 2.0 logitech camera called multiple times, once during
> + * enumeration of device and later after mausb_reset_device.
> + */
> +static int mausb_address_device(struct usb_hcd *hcd, struct usb_device *dev)

> +/*
> + * For usb 2.0 logitech camera called multiple times, once during enumeration
> + * of device and later after mausb_reset_device. In latter case it is
> + * required to address the device again in order for ep0 to work properly.
> + */
> +static int mausb_enable_device(struct usb_hcd *hcd, struct usb_device *dev)

> +/*
> + * For usb 2.0 logitech camera called multiple times,
> + * followed by either mausb_enable_device or mausb_address_device.
> + * Resets device to non-addressed state.
> + */
> +static int mausb_reset_device(struct usb_hcd *hcd, struct usb_device *dev)

Why on earth do you have all these comments about Logitech cameras?  A 
host controller driver shouldn't care about the type of devices it gets 
connected to.

Alan Stern

