Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD1E4BA1EF
	for <lists+linux-usb@lfdr.de>; Thu, 17 Feb 2022 14:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241273AbiBQNwB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Feb 2022 08:52:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237663AbiBQNwA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Feb 2022 08:52:00 -0500
X-Greylist: delayed 64 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 17 Feb 2022 05:51:44 PST
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A78A8240BC
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 05:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1645105904; x=1676641904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=74nPXggCs81kZfRhO/huFY5Oh2F2L6bf2KGSCUbUnNA=;
  b=jdvMnZjrxzir1yzWagKN5E8+FFM//TH1NFUoFwr1j7CM43mHuOfA2wdq
   sT+6+IX3rik4Bx5W1rimQKGX1ylMrq03hurJEInWTmNNeqGOTC0eJqyoy
   LuahfNEPRjznrlgJlXbunrhoOjotZB1qG25jrLM+ELP9ucuFyNH7xEzcy
   ny+M8TFbvmD+YSiGA6r7YhM1Pc/5BscRYXf76lxT7NPEfSojaT3k2Vk+l
   Vtc1nTP43D0Mta1jBPCyQnkKHdC2Q8IzY69RCTVaHZDs6JJcAxl10Ikkq
   sIJhLLssgcTypM7sXt95/hdRAvkA8tUbclherdzZn0dnBfW7kPnh41lEA
   g==;
X-IronPort-AV: E=Sophos;i="5.88,375,1635199200"; 
   d="scan'208";a="22153116"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 17 Feb 2022 14:50:37 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 17 Feb 2022 14:50:37 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 17 Feb 2022 14:50:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1645105837; x=1676641837;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=74nPXggCs81kZfRhO/huFY5Oh2F2L6bf2KGSCUbUnNA=;
  b=he13ooW6R5eKRcbX8PC/VDsv6QntOMbq6Ej+J6ZqtRbzdOdotQaYsljR
   kOuzOR4TSUiW7DmeXfKx/dKUGphzW+XuWfJwUpGHdyrxzUtE98/7xJxxn
   Wnc1kgCqZWapmNtsa8coPUcyJ2Az6litNp7AnDqGJesgOXCDzaWXymEzQ
   q3rhbnuqVgTBYKA6QmF7j8PpGlR5UeiOdwhNeQ9BWQszvLy1R27uYmG8g
   vI4Zmux7Qb+nTzpqQaQeo2GfB7ycunHtmdyAnieEiV4yYJ0kSQGEpo6B7
   25Vf8gnrTHRT4yKw90Q6VkLLzzsb4yjCUO4BnqnkDvgY+Z416kJ/IYxvX
   w==;
X-IronPort-AV: E=Sophos;i="5.88,375,1635199200"; 
   d="scan'208";a="22153115"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 Feb 2022 14:50:37 +0100
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0FEE8280065;
        Thu, 17 Feb 2022 14:50:37 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: (EXT) [PATCH] usb: dwc3: drd: Don't check against CONFIG_OF
Date:   Thu, 17 Feb 2022 14:50:34 +0100
Message-ID: <2620260.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <9f15580ad5810b1e5f31c241b35ebedfbfc30a3f.1644964864.git.Thinh.Nguyen@synopsys.com>
References: <9f15580ad5810b1e5f31c241b35ebedfbfc30a3f.1644964864.git.Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Thinh,

Am Dienstag, 15. Februar 2022, 23:49:48 CET schrieb Thinh Nguyen:
> The CONFIG_OF maybe set, but it may not be applicable to a device. In
> such case, checking against that can cause the device fail to
> initialize. Check against the device node (device->of_node) instead.
> 
> Fixes: a102f07e4edf ("usb: dwc3: drd: Add support for usb-conn-gpio based
> usb-role-switch") Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
> Note: This patch should go on Greg's "usb-testing" branch as the commit it
> fixes is not in mainline yet.
> 
>  drivers/usb/dwc3/drd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> index 25f322e62d3f..b60b5f7b6dff 100644
> --- a/drivers/usb/dwc3/drd.c
> +++ b/drivers/usb/dwc3/drd.c
> @@ -560,7 +560,7 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
>  	if (IS_ERR(dwc->role_sw))
>  		return PTR_ERR(dwc->role_sw);
> 
> -	if (IS_ENABLED(CONFIG_OF)) {
> +	if (dwc->dev->of_node) {
>  		/* populate connector entry */
>  		int ret = devm_of_platform_populate(dwc->dev);
> 
> 

Looks reasonable, thanks.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
on TQMa8MPxL using DT.

Regards,
Alexander



