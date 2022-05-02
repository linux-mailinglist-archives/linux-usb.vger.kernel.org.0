Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D94C1516F8E
	for <lists+linux-usb@lfdr.de>; Mon,  2 May 2022 14:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233459AbiEBMat (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 May 2022 08:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233328AbiEBMat (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 May 2022 08:30:49 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3C0DF6F
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 05:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651494440; x=1683030440;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HQfS11dQnkloUGoLas6yhO7tZiICpEzi/Hjdo9y6SGg=;
  b=IvzMpNh1frI81bBLvNBzRFQpgEGTjdDFNpp4qvd6DladTzG4EGSBxCRz
   hpMDJ9X/StOIpdiG5KXicqeZl8ApjcnDTRK0SxlEQEI1Lwzo3RK51At/l
   fcAL1sw5V6hmjZgH2lhJrexPI48wBQZiAnC5men0qEa54oIyLOX3nsUyI
   jK6XdeEK11xLG0kuU3EkHvOs1TcrkwG2lDD1JP263dP6GfqfcYglfDXMa
   jbOdjf1/hgWpm2hcxHLLZlK91o6CiLonSh1Ev3oe70e685nkk75VjhoYS
   3yb3/miotIH+IANBY0ZX68c+mh90Ma5Qxmb6QNhE4t3myjXR1Y4xAOsYJ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="266045956"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; 
   d="scan'208";a="266045956"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 05:27:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; 
   d="scan'208";a="707585808"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 May 2022 05:27:18 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 02 May 2022 15:27:17 +0300
Date:   Mon, 2 May 2022 15:27:17 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Guenter Roeck <linux@roeck-us.net>, Jun Li <jun.li@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] usb: typec: tcpci: Don't skip cleanup in .remove() on
 error
Message-ID: <Ym/OJRdZxmqDK8/3@kuha.fi.intel.com>
References: <20220502080456.21568-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220502080456.21568-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 02, 2022 at 10:04:56AM +0200, Uwe Kleine-König wrote:
> Returning an error value in an i2c remove callback results in an error
> message being emitted by the i2c core, but otherwise it doesn't make a
> difference. The device goes away anyhow and the devm cleanups are
> called.
> 
> In this case the remove callback even returns early without stopping the
> tcpm worker thread and various timers. A work scheduled on the work
> queue, or a firing timer after tcpci_remove() returned probably results
> in a use-after-free situation because the regmap and driver data were
> freed. So better make sure that tcpci_unregister_port() is called even
> if disabling the irq failed.
> 
> Also emit a more specific error message instead of the i2c core's
> "remove failed (EIO), will be ignored" and return 0 to suppress the
> core's warning.
> 
> This patch is (also) a preparation for making i2c remove callbacks
> return void.
> 
> Fixes: 3ba76256fc4e ("usb: typec: tcpci: mask event interrupts when remove driver")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index e07d26a3cd8e..f33e08eb7670 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -877,7 +877,7 @@ static int tcpci_remove(struct i2c_client *client)
>  	/* Disable chip interrupts before unregistering port */
>  	err = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, 0);
>  	if (err < 0)
> -		return err;
> +		dev_warn(&client->dev, "Failed to disable irqs (%pe)\n", ERR_PTR(err));
>  
>  	tcpci_unregister_port(chip->tcpci);
>  
> 
> base-commit: 3123109284176b1532874591f7c81f3837bbdc17
> -- 
> 2.35.1

thanks,

-- 
heikki
