Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8CE3724FF0
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jun 2023 00:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239962AbjFFWeq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Jun 2023 18:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240014AbjFFWeN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Jun 2023 18:34:13 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 5C10A1730
        for <linux-usb@vger.kernel.org>; Tue,  6 Jun 2023 15:33:24 -0700 (PDT)
Received: (qmail 206158 invoked by uid 1000); 6 Jun 2023 18:33:22 -0400
Date:   Tue, 6 Jun 2023 18:33:22 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     David Disseldorp <ddiss@suse.de>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: gadget: f_mass_storage: remove unnecessary open
 check
Message-ID: <cc56d8bf-a634-46bb-b874-5847bd4b3bf3@rowland.harvard.edu>
References: <20230606221518.7054-1-ddiss@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606221518.7054-1-ddiss@suse.de>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 07, 2023 at 12:15:18AM +0200, David Disseldorp wrote:
> fsg_lun_is_open() will always and only be true after a successful
> fsg_lun_open() call, so drop the unnecessary conditional.

I don't follow the reasoning.  The relevant code is:

	if (cfg->filename) {
		rc = fsg_lun_open(lun, cfg->filename);
		if (rc)
			goto error_lun;
	}
	...
	if (fsg_lun_is_open(lun)) {

So at this point, the fsg_lun_is_open() condition is true iff 
cfg->filename was set upon entry.  What makes this test unnecessary?

>  Similarly,
> the error_lun label will never be reached with an open lun (non-null
> filp) so remove the unnecessary fsg_lun_close() call.

That makes more sense.

Alan Stern

> Signed-off-by: David Disseldorp <ddiss@suse.de>
> ---
>  drivers/usb/gadget/function/f_mass_storage.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index 3a30feb47073f..da07e45ae6df5 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -2857,7 +2857,7 @@ int fsg_common_create_lun(struct fsg_common *common, struct fsg_lun_config *cfg,
>  			  const char **name_pfx)
>  {
>  	struct fsg_lun *lun;
> -	char *pathbuf, *p;
> +	char *pathbuf = NULL, *p = "(no medium)";
>  	int rc = -ENOMEM;
>  
>  	if (id >= ARRAY_SIZE(common->luns))
> @@ -2907,12 +2907,9 @@ int fsg_common_create_lun(struct fsg_common *common, struct fsg_lun_config *cfg,
>  		rc = fsg_lun_open(lun, cfg->filename);
>  		if (rc)
>  			goto error_lun;
> -	}
>  
> -	pathbuf = kmalloc(PATH_MAX, GFP_KERNEL);
> -	p = "(no medium)";
> -	if (fsg_lun_is_open(lun)) {
>  		p = "(error)";
> +		pathbuf = kmalloc(PATH_MAX, GFP_KERNEL);
>  		if (pathbuf) {
>  			p = file_path(lun->filp, pathbuf, PATH_MAX);
>  			if (IS_ERR(p))
> @@ -2931,7 +2928,6 @@ int fsg_common_create_lun(struct fsg_common *common, struct fsg_lun_config *cfg,
>  error_lun:
>  	if (device_is_registered(&lun->dev))
>  		device_unregister(&lun->dev);
> -	fsg_lun_close(lun);
>  	common->luns[id] = NULL;
>  error_sysfs:
>  	kfree(lun);
> -- 
> 2.35.3
> 
