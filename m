Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3011A7EDB
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2020 15:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388202AbgDNNvh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Apr 2020 09:51:37 -0400
Received: from mga18.intel.com ([134.134.136.126]:34395 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388192AbgDNNvc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Apr 2020 09:51:32 -0400
IronPort-SDR: rpKPPrm8ivSUXKllQ6SpmN/t/revVME+1MZNgzSgiwtdQ/7SNZ7lwVVXYbJ4g51DWq4yToLq6V
 eMopUBpzQySQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 06:51:31 -0700
IronPort-SDR: +B6NSeKtCmzgK3D21UhWFMurOFY+cD8bSZ5NDddCh6pqOYWjtqbWk9Mo8Yk86G2PSMZ09xpYJM
 +Sw6P9FCdobQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; 
   d="scan'208";a="363378788"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 14 Apr 2020 06:51:29 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 14 Apr 2020 16:51:28 +0300
Date:   Tue, 14 Apr 2020 16:51:28 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: pi3usb30532: Set switch_ / mux_desc name
 field to NULL
Message-ID: <20200414135128.GH2828150@kuha.fi.intel.com>
References: <20200414133313.131802-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414133313.131802-1-hdegoede@redhat.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 14, 2020 at 03:33:13PM +0200, Hans de Goede wrote:
> Since commit ef441dd6af91 ("usb: typec: mux: Allow the muxes to be named")
> the typec_switch_desc and typec_mux_desc structs contain a name field.
> 
> The pi3usb30532 driver allocates these structs on the stack and so far did
> not explicitly zero the mem used for the structs. This causes the new name
> fields to point to a random memory address, which in my test case happens
> to be a valid address leading to "interesting" mux / switch names:
> 
> [root@localhost ~]# ls -l /sys/class/typec_mux/
> total 0
> lrwxrwxrwx. 1 root root 0 Apr 14 12:55 ''$'\r''-switch' -> ...
> lrwxrwxrwx. 1 root root 0 Apr 14 12:55 ''$'\320\302\006''2'$'...
> 
> Explicitly initialize the structs to zero when declaring them on the stack
> so that any unused fields get set to 0, fixing this.
> 
> Fixes: ef441dd6af91 ("usb: typec: mux: Allow the muxes to be named")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/pi3usb30532.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/pi3usb30532.c b/drivers/usb/typec/mux/pi3usb30532.c
> index 46457c133d2b..7afe275b17d0 100644
> --- a/drivers/usb/typec/mux/pi3usb30532.c
> +++ b/drivers/usb/typec/mux/pi3usb30532.c
> @@ -114,8 +114,8 @@ pi3usb30532_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
>  static int pi3usb30532_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
> -	struct typec_switch_desc sw_desc;
> -	struct typec_mux_desc mux_desc;
> +	struct typec_switch_desc sw_desc = { };
> +	struct typec_mux_desc mux_desc = { };
>  	struct pi3usb30532 *pi;
>  	int ret;
>  
> -- 
> 2.26.0

thanks,

-- 
heikki
