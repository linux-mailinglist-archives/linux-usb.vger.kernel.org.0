Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7207B19569D
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2020 12:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgC0LwT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Mar 2020 07:52:19 -0400
Received: from mga02.intel.com ([134.134.136.20]:17232 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbgC0LwT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Mar 2020 07:52:19 -0400
IronPort-SDR: qRB9rN22I4IevNnTLnnErAPZNC310KnpCRKBtcb6EtjM1qzzvK5QlF9mHRi8zyxg+VjoK0abxI
 8s0v2RpW0FDA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2020 04:52:18 -0700
IronPort-SDR: 1URlbn/bxvep7hqSTDNeEyVTGzDTJRREeRiWNkczKBSFtbs97FFmvk2IgTHr8Ch6MMD/2JohfG
 o8L25uOGvwdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,312,1580803200"; 
   d="scan'208";a="358463417"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 27 Mar 2020 04:52:16 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 27 Mar 2020 13:52:15 +0200
Date:   Fri, 27 Mar 2020 13:52:15 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Azhar Shaikh <azhar.shaikh@intel.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: Correct the documentation for
 typec_cable_put()
Message-ID: <20200327115215.GC1281735@kuha.fi.intel.com>
References: <20200326134633.26780-1-azhar.shaikh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326134633.26780-1-azhar.shaikh@intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 26, 2020 at 06:46:33AM -0700, Azhar Shaikh wrote:
> typec_cable_put() function had typec_cable_get in it's documentation.
> Change it to reflect the correct name.
> 
> Signed-off-by: Azhar Shaikh <azhar.shaikh@intel.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/class.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 7c44e930602f..a7ca415ad1ef 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -859,7 +859,7 @@ struct typec_cable *typec_cable_get(struct typec_port *port)
>  EXPORT_SYMBOL_GPL(typec_cable_get);
>  
>  /**
> - * typec_cable_get - Decrement the reference count on USB Type-C cable
> + * typec_cable_put - Decrement the reference count on USB Type-C cable
>   * @cable: The USB Type-C cable
>   */
>  void typec_cable_put(struct typec_cable *cable)
> -- 
> 2.17.1

thanks,

-- 
heikki
