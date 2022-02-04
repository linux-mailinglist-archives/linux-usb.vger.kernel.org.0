Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFC14AA453
	for <lists+linux-usb@lfdr.de>; Sat,  5 Feb 2022 00:25:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378178AbiBDXZA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Feb 2022 18:25:00 -0500
Received: from mail-oo1-f49.google.com ([209.85.161.49]:41916 "EHLO
        mail-oo1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378194AbiBDXYr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Feb 2022 18:24:47 -0500
Received: by mail-oo1-f49.google.com with SMTP id q145-20020a4a3397000000b002e85c7234b1so6372390ooq.8;
        Fri, 04 Feb 2022 15:24:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1ZaYRcdSZdo6Oa13Vl/HHQCYryUzGAHNP8vDkNDtJms=;
        b=trTXqKcxuY7XmJe4LRm5DWksXlIa93P4lL80Us/HjS1rAq0F2OoG5NljRWkyZiJ/dt
         8IwVoQ2NriMZOC5x3k8yMSFqX15kH0gM3NmqghOCGsraWPgQlUkcRna+mEmewO32PNHH
         +h5cK9eIdxr4TETr/5sgqhBTtKGNATMUYSCswLXHPaJXXheB1rx9U35cB7/s1ZYjKhiJ
         TkJ5LWZa3y8M0eiqUDea/9ntFIM44UHBFlzkhRsaKeeyv2uoii/h5FzoCfdieM9dxaVE
         SlHn1CZ2UluCgfxxZ6xeAgT9GWxdI1eJVZj+yylocEtZ+KqXjLYQkdx/FD6OrmxqI6Qf
         0vBw==
X-Gm-Message-State: AOAM533JvovrZKChdRObSK6z0ITEQNvbx50tkB3zMflGM1r+B2srxy2r
        8TReFYe9xbmjO+oUtFiUCw==
X-Google-Smtp-Source: ABdhPJxVPj3BlLoqiBjDStnm9FyIHTizRlnQ3Nwgh0J9YHIs/duo4qNr2ZTwmSjfUWji1qE8dUp81A==
X-Received: by 2002:a05:6870:b7a9:: with SMTP id ed41mr363158oab.222.1644017086516;
        Fri, 04 Feb 2022 15:24:46 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d22sm1236894otp.79.2022.02.04.15.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 15:24:45 -0800 (PST)
Received: (nullmailer pid 3377981 invoked by uid 1000);
        Fri, 04 Feb 2022 23:24:44 -0000
Date:   Fri, 4 Feb 2022 17:24:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: usb: dwc3-imx8mp: Add imx8mp
 specific flags
Message-ID: <Yf21vFi/gFYyrS3t@robh.at.kernel.org>
References: <20220126141340.234125-1-alexander.stein@ew.tq-group.com>
 <20220126141340.234125-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126141340.234125-3-alexander.stein@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 26 Jan 2022 15:13:38 +0100, Alexander Stein wrote:
> This adds bindings for features in the USB glue block. They allow
> setting polarity of PWR and OC as well as disabling port power control.
> Also permanently attached can be annotated as well.
> Additional IO address and clock are needed.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../bindings/usb/fsl,imx8mp-dwc3.yaml         | 31 ++++++++++++++++---
>  1 file changed, 27 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
