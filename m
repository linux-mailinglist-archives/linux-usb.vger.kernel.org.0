Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3760F742CBA
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jun 2023 21:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232619AbjF2TAW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Jun 2023 15:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232591AbjF2TAT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Jun 2023 15:00:19 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C48A81B1
        for <linux-usb@vger.kernel.org>; Thu, 29 Jun 2023 12:00:18 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-557790487feso762670a12.0
        for <linux-usb@vger.kernel.org>; Thu, 29 Jun 2023 12:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688065218; x=1690657218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RzTSZl4ZrMV7S9CxcKysPR5GZsJOMyGfyeQpbnniNwY=;
        b=bYMJnnMVkMD1qGU3V/p2Ksfzduhx5dbgVJffIfoqMFs2zQyvuRMkPgL+1BjBND7Muc
         Jcam2Ox77QJytBsj2kM1hw+xGiYGSBwXNo9sr6RzzrTeGKQiPC8WsvifCXYovFYAH8iX
         8wXcab/QlDRfTxuLZB3G+PdjQ5GcfjrTk25jY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688065218; x=1690657218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzTSZl4ZrMV7S9CxcKysPR5GZsJOMyGfyeQpbnniNwY=;
        b=iwCkuNG/t8uQCmcbxVMbCNwA9+8+VROZH9NvsOScs9fwqZ3ANvwmX4At4a5UKKG9IZ
         WrZXhD2hVL8IW6yM9xcXMMd/dzPUCURZStSJSivg6ki0vhcG/pXAHh0HBP+UGSeK0GIE
         7wie1F2HeFLgotqyDry+ceaeRkHQ4Lcv0qw4r+mCCdQT0Ufn2ysqgtZ3lXiHxg4EdSLa
         v11I8bBdgx+EJMn+722lxFfMj8he+zvJi44BzpFo/PjrHhT/PTWHInc2EBIuG2HG5iW4
         tqO4dvzKXWCy5Ue8fBgByi8qDSK8VaWVMcUKlq9QU/DE05JbuyUCtkFpJZ6z/Dy48EXR
         O73A==
X-Gm-Message-State: AC+VfDxIkjv6wUS4B05mXHZuxmHsYnVIefYPaZxEJ0WjcTdGRs9zHVN6
        h0w2YAF+gOZHXOdDQDRZzsAhTg==
X-Google-Smtp-Source: ACHHUZ6UmgnsuBwbjXdkwkW0c7gX7XjDQZrqe1/4vO5USaZh7WQ07jAviGsUCR0heTlL1OVpHkpx3w==
X-Received: by 2002:a05:6a20:a10c:b0:11d:9307:8acb with SMTP id q12-20020a056a20a10c00b0011d93078acbmr408192pzk.45.1688065218303;
        Thu, 29 Jun 2023 12:00:18 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id w2-20020a636202000000b005439aaf0301sm9060262pgb.64.2023.06.29.12.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 12:00:17 -0700 (PDT)
Date:   Thu, 29 Jun 2023 12:00:17 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Borislav Petkov <bp@alien8.de>, linux-usb@vger.kernel.org
Subject: Re: UBSAN spat in valid xhci code in Linus's current tree (6.4+)
Message-ID: <202306291159.44DFB7CE6E@keescook>
References: <2023062945-fencing-pebble-0411@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023062945-fencing-pebble-0411@gregkh>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 29, 2023 at 05:36:51PM +0200, Greg KH wrote:
> in include/uapi/linux/usb/ch9.h

Oh wait, this is a _different_ one in ch9. I'll send a patch...

-- 
Kees Cook
