Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9181340061F
	for <lists+linux-usb@lfdr.de>; Fri,  3 Sep 2021 21:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349941AbhICTvE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Sep 2021 15:51:04 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:42543 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349849AbhICTvC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Sep 2021 15:51:02 -0400
Received: by mail-ot1-f41.google.com with SMTP id c19-20020a9d6153000000b0051829acbfc7so351604otk.9;
        Fri, 03 Sep 2021 12:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=adO0q2xojlRhu+hTivxEp5qcD5z43wRia32fqm7lDXE=;
        b=CwXVei6iKAoqhnZ2lQDZC6mjyKS6hSZvUUmmpZdBGMVc22vY6S9n6Y5O9q0/tysenP
         yszLhZEXEA5MU6CJ1iPARqzVXRRixxNPx+CWCOkFifEcsgu4pvIIxisVfOjKxXImV0oc
         lE73gvPR1Nol7W9fgAWDNzqjqpSsnLaTII9Ck3sIYvs36gy0SY9BLk8c9Ocr63/jN959
         zjsWpQKQfjomX4UfH8nByBXM9NHOoVFrOy3sSkwBzucwbF1I3AKAA6SY7L2nxJWvolIM
         Zvls/lkIjuCnwmq6ulFmDeylS+L+ND0vYJkOznxnoTNrJWgfwn4JKx6yHO09FZ/xnOSd
         z2lA==
X-Gm-Message-State: AOAM5308IikU0iKrSX8yWshMHdcG+VVkEhf27f5Erjr7hJpYR1WvSC7r
        O0qTYbPMR9hD+Le3C1xiDg==
X-Google-Smtp-Source: ABdhPJxg332Jb+bksr1+OzYKP9iAy50ZOL/mKwypYYT5SygdFDC0w976PxaviG2MfREjTwK8C6iJjw==
X-Received: by 2002:a9d:4a8d:: with SMTP id i13mr645831otf.180.1630698602202;
        Fri, 03 Sep 2021 12:50:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d10sm32451ooj.24.2021.09.03.12.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 12:50:01 -0700 (PDT)
Received: (nullmailer pid 3345809 invoked by uid 1000);
        Fri, 03 Sep 2021 19:50:00 -0000
Date:   Fri, 3 Sep 2021 14:50:00 -0500
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        linux-sunxi@googlegroups.com, linux-usb@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 37/52] dt-bindings: usb: dwc3: Fix usb-phy check
Message-ID: <YTJ8aAZZueF8DNtt@robh.at.kernel.org>
References: <20210901091852.479202-1-maxime@cerno.tech>
 <20210901091852.479202-38-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901091852.479202-38-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 01 Sep 2021 11:18:37 +0200, Maxime Ripard wrote:
> The original binding was allowing any combination of usb2-phy and
> usb3-phy in the phys and phy-names properties.
> 
> However, the current binding enforces that those properties must be a
> list of usb2-phy and usb3-phy, with exactly one element, effectively
> making usb2-phy the only value being valid.
> 
> Let's rework the properties description to allow either one or two
> element picked with values either usb2-phy or usb3-phy. The rest of the
> tooling makes sure that we don't get any duplicate value, so this should
> be what we want.
> 
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
