Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 443B4559B7D
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jun 2022 16:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232139AbiFXO1B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jun 2022 10:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232027AbiFXO1A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jun 2022 10:27:00 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 6396D52524
        for <linux-usb@vger.kernel.org>; Fri, 24 Jun 2022 07:26:59 -0700 (PDT)
Received: (qmail 33925 invoked by uid 1000); 24 Jun 2022 10:26:58 -0400
Date:   Fri, 24 Jun 2022 10:26:58 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Neal Liu <neal_liu@aspeedtech.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Roger Quadros <roger.quadros@nokia.com>,
        Miaohe Lin <linmiaohe@huawei.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Matthew Wilcox <willy@infradead.org>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Cai Huoqing <cai.huoqing@linux.dev>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2] usb: gadget: f_mass_storage: Make CD-ROM emulation
 works with Windows OS
Message-ID: <YrXJss4cTtfenu90@rowland.harvard.edu>
References: <20220624021916.318067-1-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624021916.318067-1-neal_liu@aspeedtech.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 24, 2022 at 10:19:16AM +0800, Neal Liu wrote:
> Add read TOC with format 1 to support CD-ROM emulation with
> Windows OS.
> This patch is tested on Windows OS Server 2019.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> ---
>  drivers/usb/gadget/function/f_mass_storage.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index 3a77bca0ebe1..9edf76c22605 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -1209,7 +1209,8 @@ static int do_read_toc(struct fsg_common *common, struct fsg_buffhd *bh)
>  
>  	switch (format) {
>  	case 0:
> -		/* Formatted TOC */
> +	case 1:
> +		/* Formatted TOC, Session info */

This comment is a little misleading.  0 is formatted TOC, and 1 is 
multi-session info.  The way you wrote it, it looks like the comment 
applies to both formats.  Do it like this:

	case 0:		/* Formatted TOC */
	case 1:		/* Multi-session info */

>  		len = 4 + 2*8;		/* 4 byte header + 2 descriptors */
>  		memset(buf, 0, len);
>  		buf[1] = len - 2;	/* TOC Length excludes length field */

It looks like you ignored one of the problems I pointed out in my 
earlier email:

> When format is 1, the driver is supposed to ignore the start_track
> value.  Your patch does not do this.

Please fix this.

Alan Stern

> @@ -1250,7 +1251,7 @@ static int do_read_toc(struct fsg_common *common, struct fsg_buffhd *bh)
>  		return len;
>  
>  	default:
> -		/* Multi-session, PMA, ATIP, CD-TEXT not supported/required */
> +		/* PMA, ATIP, CD-TEXT not supported/required */
>  		curlun->sense_data = SS_INVALID_FIELD_IN_CDB;
>  		return -EINVAL;
>  	}
> -- 
> 2.25.1
> 
