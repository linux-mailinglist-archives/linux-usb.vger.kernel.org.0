Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97E807850D6
	for <lists+linux-usb@lfdr.de>; Wed, 23 Aug 2023 08:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232187AbjHWGwn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Aug 2023 02:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbjHWGwm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Aug 2023 02:52:42 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B13C7
        for <linux-usb@vger.kernel.org>; Tue, 22 Aug 2023 23:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692773561; x=1724309561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xKQvgFXnA6OJnmOI4fC5a0iKzaaRhz6mD8c+KMi0ilY=;
  b=FSHd7eQmM4xC7iuMBd5rWtaQnsbdhWnBr1co/U0fUjcLEsRtjFVvnWYl
   JBQMRqsoTLfwn0O3M8voOCtSJepLQlJtii8mQBCEMhxTFEPqFESQ7hFp3
   OFk35+Y3pu39nIeOZl7YcJ9l/kk/L0Y1Ps+3LaUev6j0o9I4RVLVKx+GT
   GuocwljlZ0Cxr/HdqzVjibDvw46HjyVp0opiCj1pGf04MjCaCyjgzCzG2
   BmmcMB/AN9MOREkrJRy9//xKXVNoyFfG4qS5NVxmBUWjaQaRkN4CaagWj
   D4EHvaykJLqiqPvOVwkvGYtz5XY/JF/CNLtTzvABsTmEf8v/l/8rEi4Ic
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="359068739"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="359068739"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 23:52:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="880288619"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 22 Aug 2023 23:52:42 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 23 Aug 2023 09:52:37 +0300
Date:   Wed, 23 Aug 2023 09:52:37 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux@roeck-us.net, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpm: reset counter when enter into
 unattached state after try role
Message-ID: <ZOWstZYPGFDj/acA@kuha.fi.intel.com>
References: <20230820151518.1403006-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230820151518.1403006-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Aug 20, 2023 at 11:15:18PM +0800, Xu Yang wrote:
> The try_src_count and try_snk_count may still be 1 after enter into
> unattached state. This may be caused by below case:
>  - SNK_TRY->SNK_TRY_WAIT->SRC_TRYWAIT->SNK_UNATTACHED
>  - SRC_TRY->SRC_TRY_WAIT->SNK_TRYWAIT->SNK_UNATTACHED
> 
> The port->attached is not true at the end and tcpm_reset_port() will not
> be called. This will reset counter into for these cases, otherwise the tcpm
> won't try role when new cable attached.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 5639b9a1e0bf..c9a186a8c58c 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -3719,6 +3719,9 @@ static void tcpm_detach(struct tcpm_port *port)
>  	if (tcpm_port_is_disconnected(port))
>  		port->hard_reset_count = 0;
>  
> +	port->try_src_count = 0;
> +	port->try_snk_count = 0;
> +
>  	if (!port->attached)
>  		return;
>  
> -- 
> 2.34.1

-- 
heikki
