Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08A8B77D893
	for <lists+linux-usb@lfdr.de>; Wed, 16 Aug 2023 04:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241314AbjHPCwc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Aug 2023 22:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236810AbjHPCw1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Aug 2023 22:52:27 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA647212D;
        Tue, 15 Aug 2023 19:52:24 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6887480109bso792178b3a.0;
        Tue, 15 Aug 2023 19:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692154344; x=1692759144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pBnDBacgo0Wjuz4vbeWQQj2kQUCoYKUZpi0rH2k7kbc=;
        b=qkg9dYtCPfXt9Qz+UNC2TZKWO+DnAJIqm5Vq7IhjYwmOWOVj7nN8mxux5B77Ai/pK8
         xLQgJrhxf0u7XMhnBLiKIk2ak0I5UgWynrEbtW0ud7TbFrO3lyT3X4LNTxRcJ8kYvjsJ
         eiJW8VxjuojpOM6T2EYhCvy7y6BWj7s1t6C6JZYSfJ9sNg/ZuPqdy57z2Yv8cJ6+Qkg0
         /2CKdT22yw8ghzI0B+H+0kGFGuy6CY9/nZgT7S/gq1CdfHCnsTt2Fd84M6JNRu7luGIx
         poGxULOl5aj0OTu+bT8uZjMbwcSB1tFq0N/f/taEDav7gpanMtFB9YTBvuEoGgICDbwp
         XxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692154344; x=1692759144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBnDBacgo0Wjuz4vbeWQQj2kQUCoYKUZpi0rH2k7kbc=;
        b=GNZArfQNZ5fJQFYnUe3EQHFRPIGpggIcGriOwedpEEWcneEdZY/VHrFAKuE/t3bNYY
         tQPOYVhsNKDpEpN69KWsA/1UqWp73MSuCndbqa+hzemPLtI/qcBp5NWuHLIhzg6TKoBH
         yrRFj9BiLHbt8/rKV/tnU10A+S46pJqWm3Hx+2++dholxUVMQIzMB2VOwWrLlGTrebsT
         qti/Pcas7OoJmzNiLf/48eDnsJkWFdzyolRhvPOGZhbAogKcBhIh3QM1cRRu2VabXWPU
         pOPRy6C9luXl5dYD5ba6dPD+Yh6mMNvvunRstRYEPnA8K2akF1SZRVsFstc4r/u0AnI2
         k0JA==
X-Gm-Message-State: AOJu0YxTVhLo8SRJfMqsPcGIedAw/2QDivxJmQkxF15VjG9Mr1uCH+qo
        6zEtQdTneMQuFGOhKVf55Mc=
X-Google-Smtp-Source: AGHT+IGJaFszMT/iSru5k1QxXXJdUJ0kuDWJKg8Jo6J8Zcgo/mOb46WbY4jrWWVTALUVINH8xi3A2g==
X-Received: by 2002:a05:6a00:1503:b0:64f:35c8:8584 with SMTP id q3-20020a056a00150300b0064f35c88584mr822860pfu.18.1692154344189;
        Tue, 15 Aug 2023 19:52:24 -0700 (PDT)
Received: from atom0118 ([2405:201:c009:58e9:6a8f:3187:b8c8:1572])
        by smtp.gmail.com with ESMTPSA id y17-20020aa78551000000b00687fcb2ba7csm10024798pfn.103.2023.08.15.19.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 19:52:23 -0700 (PDT)
Date:   Wed, 16 Aug 2023 08:22:17 +0530
From:   Atul Kumar Pant <atulpant.linux@gmail.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     richard.leitner@linux.dev, wsa+renesas@sang-engineering.com,
        mhocko@suse.com, surenb@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, shuah@kernel.org
Subject: Re: [PATCH v1] drivers: usb: Removes use of assignment in if
 condition
Message-ID: <20230816025217.GC57274@atom0118>
References: <20230815204141.51972-1-atulpant.linux@gmail.com>
 <2023081550-absurd-sprint-65e5@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023081550-absurd-sprint-65e5@gregkh>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 15, 2023 at 11:07:02PM +0200, Greg KH wrote:
> On Wed, Aug 16, 2023 at 02:11:41AM +0530, Atul Kumar Pant wrote:
> > This patch fixes following checkpatch.pl issue:
> > ERROR: do not use assignment in if condition
> > 
> > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > ---
> >  drivers/usb/core/devio.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> > index e501a03d6c70..56899fed6bd4 100644
> > --- a/drivers/usb/core/devio.c
> > +++ b/drivers/usb/core/devio.c
> > @@ -2333,9 +2333,10 @@ static int proc_ioctl(struct usb_dev_state *ps, struct usbdevfs_ioctl *ctl)
> >  		}
> >  	}
> >  
> > +	intf = usb_ifnum_to_if(ps->dev, ctl->ifno);
> >  	if (ps->dev->state != USB_STATE_CONFIGURED)
> >  		retval = -EHOSTUNREACH;
> > -	else if (!(intf = usb_ifnum_to_if(ps->dev, ctl->ifno)))
> > +	else if (!intf)
> 
> Did you mean to change the logic here by doing the calculation always?
> Does that change functionality?
> 
> The existing code is fine, running checkpatch on code outside of
> drivers/staging/ or on new patches you are writing, is generally
> discouraged as the code usually is older than checkpatch is :)

	Understood. One question though, should we fix issues like no space
	before open parenthesis (e.g. if(val)) in the code that is outside
	of /drivers/staging/ ?

> 
> thanks,
> 
> greg k-h
