Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 040FC633596
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 08:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232251AbiKVHAj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 02:00:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbiKVHAi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 02:00:38 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 721E423BF0;
        Mon, 21 Nov 2022 23:00:37 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id i10so33592491ejg.6;
        Mon, 21 Nov 2022 23:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RukMbpM7DzNOaOS5LbwSgZ9se9n27VN51Vl7EeaDcBA=;
        b=HzOnesO0M/oRRindlCn3A72Afi0XaJBZNYvkRzoKZ6hbxCqgUBOH0AGml+hOeCrv3O
         9WnxOwK9z2ixayRMIBC2EHqOyPxS3CwdVR4cpQh9YuNObRNkKiFu7YHt/U1VcGumhBwu
         Fs8bxkMj4fzV/T0AwDeVqJSWLyxsAcNTSuH6TXtYN597l3zQHKKTM1eRybG4OkxkpdO5
         Typt0DKAptdPi/w0ySvR4tMwGgJw1uXbMeApl6CGgDszL/NbN0kgV5cJPI5ChB5eIYLg
         pJtdyyMgiByu99QkkW4NGCU4I2NiZqZy+rLIqRBlt3FZop9J6Ir2wHfoycEI6YdAIQXk
         OlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RukMbpM7DzNOaOS5LbwSgZ9se9n27VN51Vl7EeaDcBA=;
        b=SaZ7Eka5vLUtOr2GQ8S9sELmKqHIYR2aokKcUfBih5uvv/bI4fHPV0yY1YIbNOifer
         oTpTy6JupShUcbZ+cUesm6wmZikP7wCYhN8s1gXHmP2YorEYWqJGaQEmMyZKrjOGOR+p
         NUvdr3gUgxKdO8e1+LpQtCJT68RFUrr/cWTBpc4sJTU2nuO/CuC6ww9tOgaCutBTOXYh
         lXEqrd0KylIGti8WNkz3R1e1CE7SIjmJQQ32Xz9c3epyOFiOD+ogG8ImJ29/lGVf+mHn
         PbUuPZ9jcibdjv4SjhlNJrXQeSt7tQtGR8rNKFvByvSwQQ4oncLH4i8nJzZGuRYmiam4
         vcRA==
X-Gm-Message-State: ANoB5pllxgLHYOhAPak/dOKl2tzmhcxgAud6i5psbkX2pwbPUJkFQBkC
        UviTtjf3/joK+GlNvcZn2Uz1x89/X2A=
X-Google-Smtp-Source: AA0mqf5W5oeCVQeqq7On7gkKyBkHSppUXtAuOvnts6S6W4doH8Zy8I9BdIeCzt9MfzdP/it1VmLNAw==
X-Received: by 2002:a17:906:77d0:b0:7ae:1826:b27b with SMTP id m16-20020a17090677d000b007ae1826b27bmr10025031ejn.692.1669100435918;
        Mon, 21 Nov 2022 23:00:35 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id qk14-20020a170906d9ce00b00772061034dbsm5664650ejb.182.2022.11.21.23.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 23:00:35 -0800 (PST)
Date:   Tue, 22 Nov 2022 10:00:27 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Albert Briscoe <albertsbriscoe@gmail.com>,
        Zqiang <qiang.zhang@windriver.com>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: function: use after free in printer_close()
Message-ID: <Y3xzi389jS0PmEBA@kadam>
References: <Y3uOxcvowFq75Tzv@kili>
 <b7dcf498-51ea-3aaf-211f-09fa59c38768@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7dcf498-51ea-3aaf-211f-09fa59c38768@collabora.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 21, 2022 at 04:32:52PM +0100, Andrzej Pietrasiewicz wrote:
> Hi Dan,
> 
> I'm fine with either symmetrically removing the DBG() from "printer_open()"
> or with this version of the patch.
> 
> It seems to me that this version better fits "fixing UAF", though.
> Whether the driver is too verbose is another matter, and if it is,
> it deserves its own patch because DBG() invocations are sprinkled
> here and there.

It is too verbose, but I'm trying to cut my kernel work to an hour a day
and then all day Friday so I don't have time to clean to do clean up
work.  A UAF is sort of high value but clean up is endless.

I obviously considered this as v1 but thought deleting was better.  I
still do.  :)  But it's not worth spending time on.

> 
> W dniu 21.11.2022 o 15:44, Dan Carpenter pisze:
> > The printer_dev_free() function frees "dev" but then it is dereferenced
> > by the debug code on the next line.  Flip the order to avoid the use after
> > free.
> > 
> > Fixes: e8d5f92b8d30 ("usb: gadget: function: printer: fix use-after-free in __lock_acquire")
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> Acked-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Thanks!

regards,
dan carpenter

