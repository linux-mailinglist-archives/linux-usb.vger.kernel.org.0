Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA69583415
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jul 2022 22:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233637AbiG0U2l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jul 2022 16:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiG0U2f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jul 2022 16:28:35 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6266501A1
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 13:28:34 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id w7so16980496ply.12
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 13:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XvciCU2AYsWe5MRwhd2wBflTqlUl2ihwI9A0kzIcY+c=;
        b=MeVdO4IUegy5Bajb8c9ArRN1S99Z2vAWNDzHzQ5kSjaQZLakofVSxUKrdAz7PXNDdB
         +NBceYGM4SeyT3TRCNEGE+mHfBexu6T4X3xteDM9FGFtaWKFaTV3r6mSc4xiT8KxxGkq
         sHKp/gQturtMAnw6R0BDj1xLY8N7YFCnSChqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XvciCU2AYsWe5MRwhd2wBflTqlUl2ihwI9A0kzIcY+c=;
        b=lcyiTqCd6uYx6FR7iGVB7/58mz550uzZjVfvAEtSzI8ZbEXhYJfC+T4wWexl2Mxzds
         sP3nfPQkDAM8aUyaAWPhMzlXRvouYBeBSMS/MBliwSb/AmeZMCGAmAKimZGDGbBrRqee
         9Fzv37po/WMA3h+9HX3yJEae1JcUgmguFRSDVuACa1Mje5fbj8kZjc8WBNuhAEpPdVZD
         YQIIw8OL/vTS66Ct7XzgClywr+zPiz+s4xAYAcaC0DVTuQPgKb8YbMqo0UW81VEX0T2y
         WQTnXJCRyloKWLW0pZ5yvzLAE5yt35wqFvXoqEG6OZb20Lbo+yxFP+qBODpCNr6CKvRW
         sCDw==
X-Gm-Message-State: AJIora/UstOUtJS1S4EezhIciwvMXLhtpD+hdF5Dv95GnDjgUYtZQpkS
        Y2l0Jfii867VFaJ0D6doEETpUw==
X-Google-Smtp-Source: AGRyM1uTuunb9fRvJraTJHxm5+wbgxHDPckpbi1E/dm4a6K47mogRY79H0wWQOrfmN0nyVlAfp4W8w==
X-Received: by 2002:a17:902:7442:b0:16d:b480:31eb with SMTP id e2-20020a170902744200b0016db48031ebmr3961943plt.157.1658953714191;
        Wed, 27 Jul 2022 13:28:34 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:472c:7351:bacf:5228])
        by smtp.gmail.com with UTF8SMTPSA id y12-20020aa79aec000000b005252a06750esm14239779pfp.182.2022.07.27.13.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 13:28:33 -0700 (PDT)
Date:   Wed, 27 Jul 2022 13:28:32 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: Add binding for TI USB8041 hub
 controller
Message-ID: <YuGf8KDhvPDzggZk@google.com>
References: <20220727093801.687361-1-alexander.stein@ew.tq-group.com>
 <5d442d08-0991-9912-d5f7-cb2092c3c0f3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5d442d08-0991-9912-d5f7-cb2092c3c0f3@linaro.org>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alexander,

On Wed, Jul 27, 2022 at 11:56:55AM +0200, Krzysztof Kozlowski wrote:
> On 27/07/2022 11:37, Alexander Stein wrote:
> > The TI USB8041 is a USB 3.0 hub controller with 4 ports.
> > 
> > This initial version of the binding only describes USB related aspects
> > of the USB8041, it does not cover the option of connecting the controller
> > as an i2c slave.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I noticed that you didn't include the binding changes in v4. Please
make sure to include them until the patch has landed in a maintainer
tree.

Thanks

Matthias
