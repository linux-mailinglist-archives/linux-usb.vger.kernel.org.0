Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 455E768FB68
	for <lists+linux-usb@lfdr.de>; Thu,  9 Feb 2023 00:45:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbjBHXpN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Feb 2023 18:45:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbjBHXpM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Feb 2023 18:45:12 -0500
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E6D1C7D5;
        Wed,  8 Feb 2023 15:44:38 -0800 (PST)
Received: by mail-ot1-f49.google.com with SMTP id y11-20020a05683009cb00b0068dbf908574so66742ott.8;
        Wed, 08 Feb 2023 15:44:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86GDPkQLzQIinLmge+FuDnt1mcQKNQAywtgZ+24kbzU=;
        b=1p7hvCmA7yWjhK5T0SHGH0ZxM9cwTVIqWQVSVsSXe1vk62DAxGfMFO3YXsD1/UUG1z
         hiCm+kQriUXJSWkBPHip5pWo/Zxzn+0ij4kk/dozecU81UKHf9xH701tDsCRvID6MXUJ
         JdPvaPVQZcfGHhelFIm39wG2XhSbfgCp/aurxn9nc9iL+ptSBqq2EJvGbVyggVNS32yo
         GjUajM1QwtZ2Nn6O/8c+b+S2NQwnWn48U7vw0qYCeQW4pwA5OtUkvQgYNi01CdZqqhWU
         3i8+/E0fU57FeWV57OVTnA80SwTX/Xe0KcyvaCfujZErJvV2QdqUgcWJQr1jLR7r9/4B
         duCg==
X-Gm-Message-State: AO0yUKVrVphwwyil49Z2kp8ZY3Sc08vHrHhjidU7dUxiFMaWGH4DQHNz
        BVneqAkXzNCzywAjDzTcNw==
X-Google-Smtp-Source: AK7set+ZOn7/ds0UUzNjgALsW9GAG3fMAjIxORx8CRgXeEBlegqkJflb0HnG7mC+zFfk3yqn2YRpxA==
X-Received: by 2002:a9d:6f97:0:b0:68d:6b28:d92d with SMTP id h23-20020a9d6f97000000b0068d6b28d92dmr5235730otq.18.1675899851742;
        Wed, 08 Feb 2023 15:44:11 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q15-20020a9d4b0f000000b006863ccbf067sm8697770otf.74.2023.02.08.15.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 15:44:11 -0800 (PST)
Received: (nullmailer pid 2931938 invoked by uid 1000);
        Wed, 08 Feb 2023 23:44:10 -0000
Date:   Wed, 8 Feb 2023 17:44:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Darren Stevens <darren@stevens-zone.net>,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/3] Fix ehci-fsl autoload regression on fsl-mph-dr-of
Message-ID: <20230208234410.GA2929814-robh@kernel.org>
References: <20230207110531.1060252-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230207110531.1060252-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 07, 2023 at 12:05:28PM +0100, Alexander Stein wrote:
> Hi,
> 
> I noticed on my ls1021a based platform (TQMLS102xA) that the platform device
> created by fsl-mph-dr-of does not autoload fsl-ehci. Digging into it I noticed
> that starting from commit bb160ee61c04f ("drivers/usb/host/ehci-fsl: Fix
> interrupt setup in host mode.") this platform device has the wrong modalias:
> 
> $ cat /sys/bus/platform/devices/8600000.usb/fsl-ehci.0/modalias 
> of:NusbT(null)Cfsl-usb2-dr-v2.5Cfsl-usb2-dr
> 
> This is the modalias of the parent device, thus module ehci_fsl is not loaded
> automatically. Given the reason of removing the IRQ resource from DT in
> commit a1a2b7125e107 ("of/platform: Drop static setup of IRQ resource from DT
> core") the of_node has to be assigned to the subnode, but for modalias the
> reused of_node has to be ignored.
> 
> Patch 2 is not strictly required to fix autoloading, but this is still a bug fix.
> 
> Best regards,
> Alexander
> 
> Alexander Stein (3):
>   of: device: Ignore modalias of reused nodes
>   of: device: Do not ignore error code in of_device_uevent_modalias
>   usb: host: fsl-mph-dr-of: reuse device_set_of_node_from_dev

Assuming Greg will take these. For the series:

Reviewed-by: Rob Herring <robh@kernel.org>
