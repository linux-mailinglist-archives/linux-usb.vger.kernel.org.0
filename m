Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FEC97163DB
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 16:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231552AbjE3OXl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 May 2023 10:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbjE3OXR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 May 2023 10:23:17 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720511703
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 07:22:42 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3980c92d8d6so3042648b6e.0
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 07:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685456561; x=1688048561;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NIZM2/T84ml7gW7Xjw7ADsFCoNnspokPhg+fhq9izvw=;
        b=LCg3PMiok/DwxR49R2wj18cpQ0BXEdAJF8U0mR9ubgOGH9zsOAjHzsIWgOMCLu0XCe
         GvipbJlXWUVWs2f4EbspDlOmgOqIc5mx3MM/opmyNbx6HnJk5GON1mw1/GXjqaaP8iNM
         EnPqK7FPlSgWcXCw79hAD940PKBV018qACjpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685456561; x=1688048561;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NIZM2/T84ml7gW7Xjw7ADsFCoNnspokPhg+fhq9izvw=;
        b=bNZnVLCEVQbkUq2ie3CWs9712u8hBFC/5wQ4WS7CloB7V2+P/PSn23lXtcJJoEb1OT
         gCbIsfzxQrhfMAbiBXbLUF4Ej4g2fhJa6lZ4nKVr96abF6Gc9PCoG59TnNLKH2I42ld0
         S3XdOfArsdJ6eQXoWVu6IpmgvCIA3KhCA7lP/N0KgI+NWS/BsoFikh3kErVzzOUmnBcf
         l2pUgeduGnS4ThhjMXN6AP290tki3RG9gWpdc5NXu77MSJ8NdtAI9OusIuRny9DxOYZN
         Q8Dihp+FX2CZErEJ6V4JOoOOvp6Nj6lCx72TQrqOST137nGXypNVTbA/JVAYLcBU8Q1n
         ZcQw==
X-Gm-Message-State: AC+VfDwM/TiV+SMwhMIqeknq4CqBdrS109z86zCUarsYZ+q/ifxsbwuT
        s+1keGvULleyRqIdSdfFu2PKVA==
X-Google-Smtp-Source: ACHHUZ6D/m/c087AvqihiuWNyso0BbrEI+oSE1Yi7q+5Y8J0KrouUfo3SSHcLVD1r52pbfzZhFH+gg==
X-Received: by 2002:a05:6808:1792:b0:38d:ed6f:536 with SMTP id bg18-20020a056808179200b0038ded6f0536mr1640245oib.42.1685456561563;
        Tue, 30 May 2023 07:22:41 -0700 (PDT)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id y25-20020a027319000000b0041683566965sm781147jab.80.2023.05.30.07.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 07:22:41 -0700 (PDT)
Date:   Tue, 30 May 2023 14:22:40 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] usb: misc: onboard_hub: Don't warn twice about problems
 during remove
Message-ID: <ZHYGsNmySbxvvdEv@google.com>
References: <20230530073633.2193618-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230530073633.2193618-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 30, 2023 at 09:36:33AM +0200, Uwe Kleine-König wrote:
> If onboard_hub_power_off() called by onboard_hub_remove() fails it emits
> an error message. Forwarding the returned error value to the driver core
> results in another error message. As the return value is otherwise
> ignored, just drop the return value. There is no side effect apart from
> suppressing the core's warning.
> 
> Instead of returning zero unconditionally, convert to .remove_new()
> which has the same semantics as .remove() that unconditionally returns
> zero.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Matthias Kaehlcke <mka@chromium.org>
