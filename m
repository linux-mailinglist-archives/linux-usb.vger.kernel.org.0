Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2606D29A754
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 10:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409054AbgJ0JIV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 05:08:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:58362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408763AbgJ0JIV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Oct 2020 05:08:21 -0400
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 21F3320870;
        Tue, 27 Oct 2020 09:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603789700;
        bh=Ft33R9Ev+Zc7HxyRbaNM+wWYeTEEzN+s0u2NApGSJHY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=CBXKlxfZQGUlJEudBLEevDv6XD8CQqgV4El6ZuBturIzp23Rj+xs/7iDDtnq8ZKok
         J6OdKYfj7OwmTaHHgL0ev7ffqaoU5gxNM5mBXs+Lq8Hv4KPaKGp3sH3mTxIGgTubgG
         naBUVSVHaNe7eGraNvwTxnB7U9RnTVECn361gX+o=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>, pawell@cadence.com, rogerq@ti.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 2/3] usb: cdns3: gadget: own the lock wrongly at the
 suspend routine
In-Reply-To: <20201016101659.29482-3-peter.chen@nxp.com>
References: <20201016101659.29482-1-peter.chen@nxp.com>
 <20201016101659.29482-3-peter.chen@nxp.com>
Date:   Tue, 27 Oct 2020 11:08:16 +0200
Message-ID: <87v9ewc9z3.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Peter Chen <peter.chen@nxp.com> writes:
> @@ -1783,7 +1780,9 @@ static void cdns3_check_usb_interrupt_proceed(struct cdns3_device *priv_dev,
>  
>  	/* Disconnection detected */
>  	if (usb_ists & (USB_ISTS_DIS2I | USB_ISTS_DISI)) {
> +		spin_unlock(&priv_dev->lock);
>  		cdns3_disconnect_gadget(priv_dev);
> +		spin_lock(&priv_dev->lock);

don't you need to add sparse __releases() an __acquires() markers?

>  		priv_dev->gadget.speed = USB_SPEED_UNKNOWN;
>  		usb_gadget_set_state(&priv_dev->gadget, USB_STATE_NOTATTACHED);
>  		cdns3_hw_reset_eps_config(priv_dev);
> @@ -3266,7 +3265,9 @@ static int cdns3_gadget_suspend(struct cdns3 *cdns, bool do_wakeup)
>  {
>  	struct cdns3_device *priv_dev = cdns->gadget_dev;
>  
> +	spin_unlock(&cdns->lock);
>  	cdns3_disconnect_gadget(priv_dev);
> +	spin_lock(&cdns->lock);

ditto

-- 
balbi
