Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C305D76D343
	for <lists+linux-usb@lfdr.de>; Wed,  2 Aug 2023 18:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235275AbjHBQFJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Aug 2023 12:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233644AbjHBQFH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Aug 2023 12:05:07 -0400
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45FDC1735
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 09:05:06 -0700 (PDT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-56c7adba6afso8728867eaf.3
        for <linux-usb@vger.kernel.org>; Wed, 02 Aug 2023 09:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690992305; x=1691597105;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D+cowj12cyXgCZrTGCvkX2H27sFCtoiRtEMV5NFcAss=;
        b=EXJVQTrr36IxKki2U3JeNbocUGsAMA3DBiXqcrJjuoKr4IHN9fPqNQESVdrSh0m6sr
         RKvcPDUsqK9A0Q3rTCHmKkZyw9YewBg4M1WKRcNZSSDqVhz3gf6EscWOwpq1qh7D6jHM
         Huh/zJngJjRoqhwfwrW2zLYnhcrcLTDIVkJRE6YsyJlL3hoGFv/EFTLtYaAemcBO7cf8
         H61gsq2Zg5oUNIVm0XMq/d2CbeYmQOlU0TxWefve+uCGF8TYHDduf5JogE9FGPQ3+vGu
         MxRzemCahuxe0j3I6WXuloddhjkJrC2w8CUY4FS6A0BQ1oN39NG0HIFgXa7MR977J9X1
         ExJQ==
X-Gm-Message-State: ABy/qLZqHcD8EJ5dMfMlaIYzoXOG7XO3btJQb9nndvl9R+rqRzXzjs1H
        I37EfbqjHCIYA/ItiyojmzUb0GRWb1Xv1QfSYumUN56jpf78
X-Google-Smtp-Source: APBJJlHX5R6oz4julb9TUOu4biNZlgeiIBUzmrdBz0ul4T28wXiOFBLFXrdqqkWD1H/9fmhOUP41DLQbK7W0Va561YHUX0p5fSKb
MIME-Version: 1.0
X-Received: by 2002:a05:6808:209b:b0:3a7:3737:60fd with SMTP id
 s27-20020a056808209b00b003a7373760fdmr13403975oiw.7.1690992305683; Wed, 02
 Aug 2023 09:05:05 -0700 (PDT)
Date:   Wed, 02 Aug 2023 09:05:05 -0700
In-Reply-To: <497564c2-632f-472a-914e-5e19488824ae@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b2c2d50601f2d36b@google.com>
Subject: Re: KMSAN: uninit-value in alauda_check_media
From:   syzbot <syzbot+e7d46eb426883fb97efd@syzkaller.appspotmail.com>
To:     stern@rowland.harvard.edu
Cc:     christophe.jaillet@wanadoo.fr, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> This thread has been dormant for over a year and a half.  Let's revive 
> it and try to close out the issue.
>
> Alan Stern
>
> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ v6.5-rc3

Your commands are accepted, but please keep syzkaller-bugs@googlegroups.com mailing list in CC next time. It serves as a history of what happened with each bug report. Thank you.

>
> Index: usb-devel/drivers/usb/storage/alauda.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/storage/alauda.c
> +++ usb-devel/drivers/usb/storage/alauda.c
> @@ -318,7 +318,8 @@ static int alauda_get_media_status(struc
>  	rc = usb_stor_ctrl_transfer(us, us->recv_ctrl_pipe,
>  		command, 0xc0, 0, 1, data, 2);
>  
> -	usb_stor_dbg(us, "Media status %02X %02X\n", data[0], data[1]);
> +	if (rc == USB_STOR_XFER_GOOD)
> +		usb_stor_dbg(us, "Media status %02X %02X\n", data[0], data[1]);
>  
>  	return rc;
>  }
> @@ -454,9 +455,14 @@ static int alauda_init_media(struct us_d
>  static int alauda_check_media(struct us_data *us)
>  {
>  	struct alauda_info *info = (struct alauda_info *) us->extra;
> -	unsigned char status[2];
> +	unsigned char *status = us->iobuf;
> +	int rc;
>  
> -	alauda_get_media_status(us, status);
> +	rc = alauda_get_media_status(us, status);
> +	if (rc != USB_STOR_XFER_GOOD) {
> +		status[0] = 0xF0;	/* Pretend there's no media */
> +		status[1] = 0;
> +	}
>  
>  	/* Check for no media or door open */
>  	if ((status[0] & 0x80) || ((status[0] & 0x1F) == 0x10)
