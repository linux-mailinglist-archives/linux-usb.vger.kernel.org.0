Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA1904FF5BC
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 13:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbiDMLeQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 07:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231624AbiDMLeO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 07:34:14 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB38635A9C
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 04:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649849513; x=1681385513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2IqD00BH0ojPpWlLnE71dHRQcdrJhKM/efzL9IivP9k=;
  b=HDag/XrZq3jKaA6kKg9uwodJfCkzhZADvoYjdAx3QnhobgNnr4KTF9PG
   oyG4iY2VhcQ7Hr1gn5EWBp4cPRES0DzrE+ttlSV317APopat/YVgQsfzn
   FgLDTEkFckpo3hCh8uAY646mDvvnheEa3cxoAiIO8uM251iGCj71IrhU6
   PfWyIgSrjn44qn72zBMydM1Jfq3BlL39FHex3iFKZdSO8E4SBSqMeXwKS
   yULLmesJGTmb4BYXU51zxt6/SAEkcaHzTxZJUptbzwqWpvGFGzkdVheYA
   Bi+2EOIoNW2qXkiKqXCyQZYNBJ6HRRhZ0uhxHUolHneoxXvWSQipxiB5U
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="260239312"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="260239312"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 04:31:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="700212886"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 13 Apr 2022 04:31:51 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 13 Apr 2022 14:31:50 +0300
Date:   Wed, 13 Apr 2022 14:31:50 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v3 1/4] usb: typec: ucsi: set con->port to NULL when
 register port fail
Message-ID: <Yla0pvOElW+Voh8G@kuha.fi.intel.com>
References: <1649843891-15554-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649843891-15554-2-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649843891-15554-2-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 13, 2022 at 05:58:08PM +0800, Linyu Yuan wrote:
> As con->port will be used in error path of ucsi_init(),
> it should be NULL or valid.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v2: no change
> v3: no change
> 
>  drivers/usb/typec/ucsi/ucsi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index f0c2fa1..77ac0b7 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1100,6 +1100,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>  	con->port = typec_register_port(ucsi->dev, cap);
>  	if (IS_ERR(con->port)) {
>  		ret = PTR_ERR(con->port);
> +		con->port = NULL;
>  		goto out;
>  	}

Please merge this into the next patch.

thanks,

-- 
heikki
