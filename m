Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E71635D03C
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 20:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236715AbhDLSYY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 14:24:24 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:44872 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbhDLSYY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Apr 2021 14:24:24 -0400
Received: by mail-oi1-f169.google.com with SMTP id j24so3510722oii.11;
        Mon, 12 Apr 2021 11:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I5HbeKDhcmeEzkTpL+s857z6JwOx8CcHKVixcQWeMqg=;
        b=qVGzCNOkMvM5kU6p5P8u+A85JnN+fSrvNmKu3K0GmNj1gW34KZEs05r/hXtsd9/+lj
         pNR+pPdLGZDN6YRKvz/Gv1kapGWpcl+gkK1899qwgfulG4QGvrGOo/VSQh0iKi4x0aj2
         DG96PAsx+X3sk08ql7op1kTM3pZ8XSNuzPv4/g/N3VWg5z4UcaIHAWClRPvtikcloiOp
         ONVsRNZ6ig3jtbmR5OCy41Kd9yoi6OAVUHdVvrapqVX27JKydsDDG1WziHzAI5fhLd9B
         u6N5P0HnQVwv9V/DXdGYHmYZ57Sr4SIKE9TrrYBX1QkOnQrIkPfkw4KMfjLGTRfvUOZm
         +PcA==
X-Gm-Message-State: AOAM531Pyku6u/89HvRzupwVb59yltja/lVP2at/oRQ8no0gaQgzx1QA
        QdlZBeQ8prpUHZ9/Wm9rOA==
X-Google-Smtp-Source: ABdhPJzVKlY/PDIKP5bFbIi5/h2pnazHJhpoBIZhzlLLlOribqb0QB7d3q70bueIT0GW3jShnMgK7g==
X-Received: by 2002:a05:6808:b3b:: with SMTP id t27mr337538oij.131.1618251845638;
        Mon, 12 Apr 2021 11:24:05 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x2sm2886622ote.47.2021.04.12.11.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 11:24:04 -0700 (PDT)
Received: (nullmailer pid 4153852 invoked by uid 1000);
        Mon, 12 Apr 2021 18:24:03 -0000
Date:   Mon, 12 Apr 2021 13:24:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     narmstrong@baylibre.com, Laurent.pinchart@ideasonboard.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        hsinyi@chromium.org, robh+dt@kernel.org, dafna3@gmail.com,
        megous@megous.com, a.hajda@samsung.com, jernej.skrabec@siol.net,
        airlied@linux.ie, enric.balletbo@collabora.com,
        dri-devel@lists.freedesktop.org, drinkcat@chromium.org,
        chunkuang.hu@kernel.org, jonas@kwiboo.se, kernel@collabora.com
Subject: Re: [PATCH v6 1/2] dt-bindings: display: add
 google,cros-ec-anx7688.yaml
Message-ID: <20210412182403.GA4153823@robh.at.kernel.org>
References: <20210409161951.12365-1-dafna.hirschfeld@collabora.com>
 <20210409161951.12365-2-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409161951.12365-2-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 09 Apr 2021 18:19:50 +0200, Dafna Hirschfeld wrote:
> ChromeOS EC ANX7688 is a display bridge that converts HDMI 2.0 to
> DisplayPort 1.3 Ultra-HDi (4096x2160p60). It is an Analogix ANX7688 chip
> which is connected to and operated by the ChromeOS Embedded Controller
> (See google,cros-ec.yaml). It is accessed using I2C tunneling through
> the EC and therefore its node should be a child of an EC I2C tunnel node
> (See google,cros-ec-i2c-tunnel.yaml).
> 
> ChromOS EC ANX7688 is found on Acer Chromebook R13 (elm)
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  .../bridge/google,cros-ec-anx7688.yaml        | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
