Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64C8B558886
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jun 2022 21:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbiFWTS7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jun 2022 15:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbiFWTSo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jun 2022 15:18:44 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 893154F9E1
        for <linux-usb@vger.kernel.org>; Thu, 23 Jun 2022 11:24:16 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-101cdfddfacso523477fac.7
        for <linux-usb@vger.kernel.org>; Thu, 23 Jun 2022 11:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=7KHPbnVlHnkB0EVrXTQL+f9XDuEF911Owwju7ndnO+8=;
        b=limsfAyKYwLYVD3+t6n9NGH70Er6BQNn9CewVXcuC79xXTCHbq+EpwRtFynJnAABb+
         Udmnfdc3hKWQe+U1Bz1e3EefOpEcrWENgi3SzraOMfBwt7ACXA0EXag0R5dnndzUpd0l
         MyHPFG5pARv5QWIDZ2uIIlw0r/9lq0WLQp6vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=7KHPbnVlHnkB0EVrXTQL+f9XDuEF911Owwju7ndnO+8=;
        b=8PSGAu3JH8cC6QA9e1aGxvOwWfSrFrJbZqKytPGcCuTw9cf11mEUOHQCuXcAFvFlLM
         Xy5yikVe9jbvQG8HfRtUExD2OFiXYyDle9G5yIHbJQzH9XUp48yEKERHo06YawczmcyP
         KbmeLfFkjlL6HklSERwylvBFRYgxlEwaH1vssdykZgFPFIuCHfvBQQ73PMcge/Jo1uvH
         ZLIz+m/sUS1tZ85NFSZ3IQpri1M1lYImn8EYatlwCiorHR5XVDhnJkWpCps6xAvgUF4B
         MRDq6Y5z3Ht4k2jR2YjYmtreLf0gKS/sF15BKxLuPmkfBPg8hrHbvbLgewXPvqMHtfqG
         rr3A==
X-Gm-Message-State: AJIora9YBNOPWvWWEzh7rUyLGFfKlSG5jvRn4Y1m8rAB3iog/5eQTtUy
        yPoADnfyeohM4aXwS40qImppa9ri8YmPtUZQW4B47Q==
X-Google-Smtp-Source: AGRyM1uhIlpWAbcw8cS7wBzEeQ5p5CUBwyJ92Exd/1lBwAueqZGyRgRUnjHMsJ5S9ITyrl2U2VT9T3e8pQbKYfsOYPY=
X-Received: by 2002:a05:6870:b627:b0:102:f25:a460 with SMTP id
 cm39-20020a056870b62700b001020f25a460mr3149970oab.193.1656008654604; Thu, 23
 Jun 2022 11:24:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jun 2022 14:24:13 -0400
MIME-Version: 1.0
In-Reply-To: <20220622173605.1168416-7-pmalani@chromium.org>
References: <20220622173605.1168416-1-pmalani@chromium.org> <20220622173605.1168416-7-pmalani@chromium.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 23 Jun 2022 14:24:13 -0400
Message-ID: <CAE-0n51d4S3T+_f+YXsu3es7AMxuyFORSXFQe2LTSkZB4C56Ng@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] dt/bindings: drm/bridge: it6505: Add mode-switch support
To:     Prashant Malani <pmalani@chromium.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     bleung@chromium.org, heikki.krogerus@linux.intel.com,
        Pin-Yen Lin <treapking@chromium.org>,
        Allen Chen <allen.chen@ite.com.tw>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Neil Armstrong <narmstrong@baylibre.com>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>, Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Prashant Malani (2022-06-22 10:34:35)
> From: Pin-Yen Lin <treapking@chromium.org>
>
> ITE IT6505 can be used in systems to switch USB Type-C DisplayPort
> alternate mode lane traffic between 2 Type-C ports.

How does it work? From what I can tell from the information I find when
googling this part[1] and looking at the existing binding doc is that
this device is a DPI to DP bridge, and it outputs DP (probably 4 lanes
of it?). Does the 2 type-c port design work by transmitting DP on two
lanes of DP for one type-c port and another two lanes of DP for the
other type-c port?

DP could be one lane, so if this device is able to output one lane on
any output differential pair then I suspect it could support 4 type-c
ports if the hardware engineer connected it that way. Can you confirm my
suspicion?

[1] https://www.ite.com.tw/en/product/view?mid=45
