Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 854CAC2A41
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 01:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729874AbfI3XHQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Sep 2019 19:07:16 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34535 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726789AbfI3XHP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Sep 2019 19:07:15 -0400
Received: by mail-ot1-f68.google.com with SMTP id m19so9922598otp.1;
        Mon, 30 Sep 2019 16:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zDj+DK0QCFIN576pryZq/Y62yXQtYLQJm8d8iZrEbOs=;
        b=HbJldpxWnsMDFgb6VP6Z0kZWFJt00UxqiNBSNqrumszmpxQBSxaGQt9FyhSdFzdJwL
         j1bkr+RC5YTjA63FzQ5hyZNSRn45ODrlhUGNAXgNEdfpfI5+OMmTgQAfzfUst3ZbOZia
         TrnW7zaqIMoDGltmW3vPAG+A5IbCc93/3nbAmlJHQnSNkbD+zqr+73utuByEFUUD4I22
         zRGuwZJSTDHzGTsUUBGZcg5miMX9mphdP0z3p+AfzGh+31KG1DwCef3Wb4qDmBP9z4zz
         B0jYmEwSIAg1/feRt94BJMDXaSM1hY7ACImRogDcVv3spu2kTMFAiPSTvwTP4c1zWDja
         DJqw==
X-Gm-Message-State: APjAAAVWAk1FDcvvPSe/610EToH2MkT3arh61eo11xkLwO82959b5UTc
        dP6NHg9O/vfW2OiYphqhsA==
X-Google-Smtp-Source: APXvYqyQJmQ4TDFGrSERGcpSMAOM1nVOQW8uwKCO9Rm+l0q+Hb6q01p0DIVO2XgqJFm32fxqYe8POA==
X-Received: by 2002:a05:6830:10c5:: with SMTP id z5mr16004320oto.322.1569884835109;
        Mon, 30 Sep 2019 16:07:15 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j9sm4414823oij.15.2019.09.30.16.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 16:07:14 -0700 (PDT)
Date:   Mon, 30 Sep 2019 18:07:14 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     richard.leitner@skidata.com, robh+dt@kernel.org,
        fancer.lancer@gmail.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/4] dt-bindings: usb: usb251xb: add documentation for
 voltage supply
Message-ID: <20190930230714.GA29817@bogus>
References: <20190917144449.32739-1-m.felsch@pengutronix.de>
 <20190917144449.32739-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917144449.32739-2-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 17 Sep 2019 16:44:46 +0200, Marco Felsch wrote:
> Add the optional voltage supply documentation. If not specified the
> dummy-regulator is used.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/usb/usb251xb.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
