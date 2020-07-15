Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6384B221406
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 20:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbgGOSNe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 14:13:34 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:41872 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbgGOSNd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 14:13:33 -0400
Received: by mail-io1-f68.google.com with SMTP id p205so3228595iod.8;
        Wed, 15 Jul 2020 11:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2z0jMPmTB9DDXO4KvHh6iNAZTCEGZnUYmpDsMOv40Ws=;
        b=gXusvGmQCkW7G3dCgzru1C/WKK74TotIubxWUAAZ3abd5T0SfjLh+2zpEe6LTbYu5I
         MWgM1+ORNjHfG+e5uHexfAl9X5JKELbLo0UuHpKsr755b0x7Lw4sule3cvn4spAcvj6p
         J7KbsV3rcYX3Sd09HiNfLEq/vmrQCvikp1s9LKzXg3Vx9PnYYF89tNzmqPp2CJSKYhIA
         Aj0SlDK1LYNDvf7jaZ3HQ+a3eco0mTam893AbJL+JmuhpOjHYYmk8y2dqDwHRFLkR4rX
         G+/PHz+OjRxoiRlGu2d4yhiQaJmlP8dKOBei465rlpo1J3a/jNLEdLnnwujbgvsNbCPp
         UueQ==
X-Gm-Message-State: AOAM533YNzWtPiJT4GwS2+6WQKIWBWCL6++GKGuRhirB2POzu86dSpDu
        PNLbFWqKxJ5fmq7aNuf+wQ==
X-Google-Smtp-Source: ABdhPJzsTu/hCkev8ZsJi3uqyU6jm2P/7RkPJp0xkraSmBKKiHg3KKn2Gusj73gsQEdQONk2UrgabQ==
X-Received: by 2002:a6b:bb43:: with SMTP id l64mr504378iof.191.1594836812882;
        Wed, 15 Jul 2020 11:13:32 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id u6sm1381601ilg.32.2020.07.15.11.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 11:13:32 -0700 (PDT)
Received: (nullmailer pid 546514 invoked by uid 1000);
        Wed, 15 Jul 2020 18:13:31 -0000
Date:   Wed, 15 Jul 2020 12:13:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        Noralf Tronnes <noralf@tronnes.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: add vendor prefix for EastRising
 Technology Co., Ltd
Message-ID: <20200715181331.GA546460@bogus>
References: <cover.1592055494.git.kamlesh.gurudasani@gmail.com>
 <10dbf4687981634c510462804b8af6bbcf113fbf.1592055494.git.kamlesh.gurudasani@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10dbf4687981634c510462804b8af6bbcf113fbf.1592055494.git.kamlesh.gurudasani@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 13 Jun 2020 19:36:46 +0530, Kamlesh Gurudasani wrote:
> Add vendor prefix for display manufacturer company EastRising
> Technology Co.,Ltd
> 
> [1]https://eastrising.en.ec21.com/
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
