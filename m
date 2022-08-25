Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D79C15A17E1
	for <lists+linux-usb@lfdr.de>; Thu, 25 Aug 2022 19:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239959AbiHYRT4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Aug 2022 13:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234722AbiHYRTz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Aug 2022 13:19:55 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BA53636C
        for <linux-usb@vger.kernel.org>; Thu, 25 Aug 2022 10:19:52 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id c16-20020a17090aa61000b001fb3286d9f7so5893115pjq.1
        for <linux-usb@vger.kernel.org>; Thu, 25 Aug 2022 10:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=rNT4Jek4HqTO9abUzm8L6O4yMh+b4j6Bjc06qQP6vTA=;
        b=aQEmLFSAGDOhMrN4kbLCxSmOJo+fiZQjCXhTiBpwBfWQXhmTGmVcXy+wrlpkMvnf6b
         ns4NKV0TLRk4zCAyyiCsTrBJusy0i1SgaW2mOGcyOTut0TpGARwpPShaboHGcs3DKz4r
         LOAe+xkLmXO4jrfnEbhS5GkP3pfuiZ45iwAw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=rNT4Jek4HqTO9abUzm8L6O4yMh+b4j6Bjc06qQP6vTA=;
        b=HwvgzxFLOpMFiw7k6VdgB+6a69cl8+0SEAR34fdtidpZ1GeO3v1FMAfuAtKr1wUcou
         Abo1g97Is3C1FIGFtRC73ZwZhvA1/f44V6XufmuWgoxDfinciNt4a8DL/ZMYhp4ZT3hw
         oigttgLbQ1cQVzHt8zW+i0uJrhtDqVuZsYpGW3s16oKXb0sYUK6AlEfcUPqgWg1BAgPy
         GXOtk7+7AJ+4pLUtA5ns34CLlN+9UEPALzR+NH/cCwT6iyCAQE8OwRsG/lqEL2qXTpq4
         3qygu2DRzAWSX1GFldoqV0eXsrDsaOCyEVJsuXeuxcQYtNKR6X128zfZB8HVxyAsa5R3
         Go9A==
X-Gm-Message-State: ACgBeo1OlSK+HzOjjL6Qta2N5Vz9X+WID9aPJSzTAtdJEyJ++5CDbZuO
        ByxP/yIS/2lmOtAZ8z6p55KOkA==
X-Google-Smtp-Source: AA6agR6zoLTRjbOlBJlkrff4CmBEFvutJhWbV5wTIuWVu+PDwfAsrMax93H0E9gRpAwlfu5Ng4jOyQ==
X-Received: by 2002:a17:902:e945:b0:16b:f802:1660 with SMTP id b5-20020a170902e94500b0016bf8021660mr24765pll.7.1661447991608;
        Thu, 25 Aug 2022 10:19:51 -0700 (PDT)
Received: from chromium.org (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id x18-20020aa79572000000b005379c1368e4sm1671376pfq.179.2022.08.25.10.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 10:19:51 -0700 (PDT)
Date:   Thu, 25 Aug 2022 17:19:49 +0000
From:   Prashant Malani <pmalani@chromium.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: Remove retimers properly
Message-ID: <YwevNWopw70Hyjrf@chromium.org>
References: <20220825140411.10743-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825140411.10743-1-heikki.krogerus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

Thanks for finding this.

On Aug 25 17:04, Heikki Krogerus wrote:
> Retimer device class is left dangling when the typec module
> is unloaded. Attempts to reload the module failed with warning:
> 
>         "sysfs: cannot create duplicate filename '/class/retimer'"
> 
> Fixing the issue by unregistering the class properly.
> 
> Fixes: ddaf8d96f93b ("usb: typec: Add support for retimers")
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Prashant Malani <pmalani@chromium.org>
