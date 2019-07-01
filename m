Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6A4E59806
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2019 11:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfF1J6q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 05:58:46 -0400
Received: from mga12.intel.com ([192.55.52.136]:51701 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726514AbfF1J6q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 28 Jun 2019 05:58:46 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Jun 2019 02:58:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,427,1557212400"; 
   d="scan'208";a="183657368"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 28 Jun 2019 02:58:43 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 28 Jun 2019 12:58:43 +0300
Date:   Fri, 28 Jun 2019 12:58:43 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, nv@vosn.de
Subject: Re: [PATCH 1/2] drivers/usb/typec/tps6598x.c: fix portinfo width
Message-ID: <20190628095843.GB21701@kuha.fi.intel.com>
References: <20190628083417.GA21701@kuha.fi.intel.com>
 <f8daf204d49fff00db33e2b417a20afcc58ad56e.1561712364.git.nikolaus.voss@loewensteinmedical.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8daf204d49fff00db33e2b417a20afcc58ad56e.1561712364.git.nikolaus.voss@loewensteinmedical.de>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 28, 2019 at 11:01:08AM +0200, Nikolaus Voss wrote:
> Portinfo bit field is 3 bits wide, not 2 bits. This led to
> a wrong driver configuration for some tps6598x configurations.
> 
> Fixes: 0a4c005bd171 ("usb: typec: driver for TI TPS6598x USB Power Delivery controllers")
> Signed-off-by: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>

Shouldn't this be applied to the stable trees as well?

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tps6598x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tps6598x.c b/drivers/usb/typec/tps6598x.c
> index c674abe3cf99..a170c49c2542 100644
> --- a/drivers/usb/typec/tps6598x.c
> +++ b/drivers/usb/typec/tps6598x.c
> @@ -41,7 +41,7 @@
>  #define TPS_STATUS_VCONN(s)		(!!((s) & BIT(7)))
>  
>  /* TPS_REG_SYSTEM_CONF bits */
> -#define TPS_SYSCONF_PORTINFO(c)		((c) & 3)
> +#define TPS_SYSCONF_PORTINFO(c)		((c) & 7)
>  
>  enum {
>  	TPS_PORTINFO_SINK,
> -- 
> 2.17.1

thanks,

-- 
heikki
