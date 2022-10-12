Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCE95FC8DD
	for <lists+linux-usb@lfdr.de>; Wed, 12 Oct 2022 18:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbiJLQIJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Oct 2022 12:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiJLQIH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Oct 2022 12:08:07 -0400
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E514D73EE;
        Wed, 12 Oct 2022 09:08:06 -0700 (PDT)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1326637be6eso19938123fac.13;
        Wed, 12 Oct 2022 09:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ecfe6mmS4Fm0mr0H3iIVLFo+3D8PvCFpCLiFox/WEo=;
        b=FbLhoerrMfKEaKwI+XHpr7e6yrH6NCZhSnEsOSVVgGZI3VARteHzntvrciJ4y89T/T
         +lf42oYi+TfpCTTLWYmK2W0hvS9YegsbJ/3jIC/tb0fbTE4A97cTGK3kETpnViwGznIH
         cXpgkDgNQTd3WZciw+PS5jTnFwDtgtVlwHf/LvNsoAnVnNCE9YDOxGidhwwCTN8nLdSn
         h8OMr49JUwZl1idsubEL9wmer1/nkFsk/iDKptFt7/ZIn1hnAlLiKqDgdraSKoetZmHP
         gvaxwxSWhTSO8FN9OH4igoiUlA7/0byUs81llR8XPGJKTVAFKIO5E6eainDkeN/K9IjS
         W0vQ==
X-Gm-Message-State: ACrzQf0xInxEQaYGZ31EJ/hED3q0quZcfgGAblbF0nXFj3KcP9VQmPsb
        ujvXeaqwqGRxPKlCJcoKjYQIFJkRpg==
X-Google-Smtp-Source: AMsMyM6DK/nb/io8kfCo5k8zHJa+86IdRqopjWE6TZnbr8OKSdQ6GxeS7RtRWD4jeQBuwXCaRVHZ8w==
X-Received: by 2002:a05:6870:c689:b0:132:f58f:60d7 with SMTP id cv9-20020a056870c68900b00132f58f60d7mr2763231oab.166.1665590885454;
        Wed, 12 Oct 2022 09:08:05 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h4-20020a056870170400b00136cfb02a94sm1420476oae.7.2022.10.12.09.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 09:08:05 -0700 (PDT)
Received: (nullmailer pid 2236997 invoked by uid 1000);
        Wed, 12 Oct 2022 16:08:06 -0000
Date:   Wed, 12 Oct 2022 11:08:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Peter Chen <peter.chen@kernel.org>,
        Peng Fan <peng.fan@oss.nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 6/6] dt-bindings: usb: ci-hdrc-usb2: Add more phy tuning
 properties
Message-ID: <20221012160806.GA2189350-robh@kernel.org>
References: <20221011082924.884123-1-s.hauer@pengutronix.de>
 <20221011082924.884123-7-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011082924.884123-7-s.hauer@pengutronix.de>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 11, 2022 at 10:29:24AM +0200, Sascha Hauer wrote:
> Following the example of samsung,picophy-dc-vol-level-adjust more
> phy tuning properties are added for configuring the remaining bitfields
> in the USBNC_n_PHY_CFG1 register.

All these properties really doesn't scale. These properties should go 
in the phy node as they are properties or the phy. There's no rule that 
you can only read properties from the driver's device node.

Rob
