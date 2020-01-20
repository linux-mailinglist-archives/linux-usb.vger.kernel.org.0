Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BCB814273C
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 10:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgATJ1q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 04:27:46 -0500
Received: from mga14.intel.com ([192.55.52.115]:34346 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbgATJ1q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jan 2020 04:27:46 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jan 2020 01:27:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,341,1574150400"; 
   d="scan'208";a="274641245"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 20 Jan 2020 01:27:43 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 20 Jan 2020 11:27:42 +0200
Date:   Mon, 20 Jan 2020 11:27:42 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Jun Li <jun.li@nxp.com>
Cc:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v3] usb: typec: tcpci: mask event interrupts when remove
 driver
Message-ID: <20200120092742.GA32175@kuha.fi.intel.com>
References: <1579502333-4145-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579502333-4145-1-git-send-email-jun.li@nxp.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 20, 2020 at 06:43:19AM +0000, Jun Li wrote:
> This is to prevent any possible events generated while unregister
> tpcm port.
> 
> Fixes: 74e656d6b0551 ("staging: typec: Type-C Port Controller Interface driver (tcpci)")
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index c1f7073..dfae41f 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -581,6 +581,12 @@ static int tcpci_probe(struct i2c_client *client,
>  static int tcpci_remove(struct i2c_client *client)
>  {
>  	struct tcpci_chip *chip = i2c_get_clientdata(client);
> +	int err;
> +
> +	/* Disable chip interrupts before unregistering port */
> +	err = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, 0);
> +	if (err < 0)
> +		return err;
>  
>  	tcpci_unregister_port(chip->tcpci);
>  
> -- 
> 2.7.4

-- 
heikki
