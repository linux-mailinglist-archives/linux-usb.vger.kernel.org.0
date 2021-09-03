Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A95133FFA90
	for <lists+linux-usb@lfdr.de>; Fri,  3 Sep 2021 08:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346777AbhICGsR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Sep 2021 02:48:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:18725 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232218AbhICGsR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Sep 2021 02:48:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630651637; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=3VvJri0NRu6wRUG/Jmb1SKwER+ZomJ6JBNYYtrrS0Tg=; b=d0kaGNPw4CL998MsrxIybzT6lTtLgfnH7AdwCdbfm8WtU7FznyfvhVrHCgw34MoJ+HQfnw5Y
 pkVu9cPyAIENA2AVI7yz2sNDORPPjy11pf0e0ewkn11oNSB7NXIDnrfGGdQ6r59bcg51+kOz
 68EOHV2ZG3dPuZTElaLyS1RYy10=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6131c4edc603a0154f342605 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 03 Sep 2021 06:47:09
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 16B4EC43618; Fri,  3 Sep 2021 06:47:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C35D6C4338F;
        Fri,  3 Sep 2021 06:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C35D6C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Date:   Thu, 2 Sep 2021 23:47:01 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Prashant Malani <pmalani@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-pm@vger.kernel.org, bleung@chromium.org,
        heikki.krogerus@linux.intel.com, badhri@google.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [RFC PATCH 1/3] usb: pd: Increase max PDO objects to 13
Message-ID: <20210903064701.GA3515@jackp-linux.qualcomm.com>
References: <20210902213500.3795948-1-pmalani@chromium.org>
 <20210902213500.3795948-2-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902213500.3795948-2-pmalani@chromium.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Prashant,

On Thu, Sep 02, 2021 at 02:34:58PM -0700, Prashant Malani wrote:
> Increase the max number of PDO objects to 13, to accommodate the extra
> PDOs added as a part of EPR (Extended Power Range) operation introduced
> in the USB PD Spec Rev 3.1, v 1.0. See Figure 6-54 for details.
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
>  include/linux/usb/pd.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/usb/pd.h b/include/linux/usb/pd.h
> index 96b7ff66f074..7e8bdca1ce6e 100644
> --- a/include/linux/usb/pd.h
> +++ b/include/linux/usb/pd.h
> @@ -201,7 +201,13 @@ struct pd_message {
>  } __packed;
>  
>  /* PDO: Power Data Object */
> -#define PDO_MAX_OBJECTS		7
> +
> +/*
> + * The EPR (Extended Power Range) structure is a superset of the SPR (Standard Power Range)
> + * capabilities structure, so set the max number of PDOs to 13 instead of 7. On SPR-only systems,
> + * objects 8 through 13 will just be empty.
> + */
> +#define PDO_MAX_OBJECTS		13

Hmm this might break the recent change I made to UCSI in commit
1f4642b72be7 ("usb: typec: ucsi: Retrieve all the PDOs instead of just
the first 4").

 520 static void ucsi_get_src_pdos(struct ucsi_connector *con, int is_partner)
 521 {
 522         int ret;
 523
 524         /* UCSI max payload means only getting at most 4 PDOs at a time */
 525         ret = ucsi_get_pdos(con, 1, con->src_pdos, 0, UCSI_MAX_PDOS);
 526         if (ret < 0)
 527                 return;
 528
 529         con->num_pdos = ret / sizeof(u32); /* number of bytes to 32-bit PDOs */
 530         if (con->num_pdos < UCSI_MAX_PDOS)
 531                 return;
 532
 533         /* get the remaining PDOs, if any */
 534         ret = ucsi_get_pdos(con, 1, con->src_pdos, UCSI_MAX_PDOS,
 535                             PDO_MAX_OBJECTS - UCSI_MAX_PDOS);
				 ^^^^^^^^^^^^^^^
This routine calls the UCSI GET_PDOS command for up to 4 PDOs at a time
since that's the most the return payload can carry.  Currently this
assumes that we'd only need to request the PPM at most twice to retrieve
all the PDOs for up to a maximum of 7 (first request for 4 then again if
needed for the remaining 3).  I'm not sure if any existing UCSI FW would
be updatable to support more than 7 PDOs in the future, much less
support EPR.  In fact, current UCSI 1.2 spec [1] Table 4-34 mentions PDO
offset valid values are 0-7 and anything else "shall not be used", so I
don't know how UCSI will eventually cope with EPR without a spec update.

So if this macro changes to 13 then this call would result in a call to
the UCSI GET_PDOS command passing num_pdos == 13-4 = 9 which would
probably result in an error from the PPM FW.  So we might need to retain
the maximum value of 7 PDOs at least for UCSI here.  Maybe that means
this UCSI driver needs to carry its own definition of
UCSI_MAX_TOTAL_PDOS=7 instead of using PDO_MAX_OBJECTS?

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
