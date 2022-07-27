Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83C4D582DC8
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jul 2022 19:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241326AbiG0RC6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jul 2022 13:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241270AbiG0RCa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jul 2022 13:02:30 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE8C6C101
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 09:38:21 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id w205so13248120pfc.8
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 09:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E6VKWZ1se4siDxKOWikoAVtDU8DJUcn0aA0tC0NKvZs=;
        b=cWDVwke/DDOP13t1OKQEk6YBBjQLlM5L7E61aOzaJj+whuiOD6LtFAAIx0fIBDW2WA
         KOzCcasAjPLPOMN0PA0D/eIKpupclU6OuYoyDv5vCLHv4JFLZ6v6b+5ZbO/Akaoo58D0
         wTzL9y4I5oJ4SrgZdqKaviee1u15EOHcVYHbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E6VKWZ1se4siDxKOWikoAVtDU8DJUcn0aA0tC0NKvZs=;
        b=caN8zvBNl0fO/pbB7bycGDCicY3ngTA0JwWoB4bg+RJbwJX3TPPWXRbMFOPfAXj40H
         vMQlt0V0Kv1wJ1mVnI9+SXrr8fn0oLAfV7JnmfqfPZtl35ZWXxYtq2OYUImg6NRHe89V
         Wn0BPCucdEy2hipeXxIsdcXjKtxYZqhQHRJJFAKK3YNBsrXFY1owH8mjHc5AMWHBKP5N
         VsI/rJ76rO0Ov8rilZv4rrJ1Dz9Z3XBRNkMeWHaPaZijrRqnz6UgEEiyMNt2JDe6cgCD
         VS7p10WkJtFtC0iAg9VBkUxIemdRLhu+MX7qsnooFgaeQ8JLCuYaDm+zYhKGvlZnSUa+
         QMxw==
X-Gm-Message-State: AJIora8kRkhpW2k1Ewap/wGzz5geQ1pTX58uz+IHlAPrYmLl+F7wxmsE
        9x4SlUC1IDE6inXx2PDlfaQpcQ==
X-Google-Smtp-Source: AGRyM1tAfzfBudqElQyU5yiMVHs0hJr8vaxUU4c2j7awMABZBk05+T9M2cOm7FaFjn3wyJWwTvYNrA==
X-Received: by 2002:a05:6a00:140d:b0:52a:d561:d991 with SMTP id l13-20020a056a00140d00b0052ad561d991mr22993386pfu.46.1658939900308;
        Wed, 27 Jul 2022 09:38:20 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:472c:7351:bacf:5228])
        by smtp.gmail.com with UTF8SMTPSA id d72-20020a621d4b000000b0052bae7a9722sm14101131pfd.116.2022.07.27.09.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 09:38:20 -0700 (PDT)
Date:   Wed, 27 Jul 2022 09:38:18 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/2] usb: misc: onboard_usb_hub: Add TI USB8041 hub
 support
Message-ID: <YuFp+lksU+oHgK+p@google.com>
References: <20220727141117.909361-1-alexander.stein@ew.tq-group.com>
 <20220727141117.909361-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220727141117.909361-2-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 27, 2022 at 04:11:17PM +0200, Alexander Stein wrote:
> This is a 4-port 3.0 USB hub.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Matthias Kaehlcke <mka@chromium.org>
