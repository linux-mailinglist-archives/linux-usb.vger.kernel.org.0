Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA76B3112E8
	for <lists+linux-usb@lfdr.de>; Fri,  5 Feb 2021 21:57:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233767AbhBETOV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Feb 2021 14:14:21 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:37133 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233654AbhBETMa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Feb 2021 14:12:30 -0500
Received: by mail-ot1-f43.google.com with SMTP id k25so6092546otb.4;
        Fri, 05 Feb 2021 12:54:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sMbAuO/ZpwNzTU+MAP15wnEg3+eVX3c2ZzjflSg1SMc=;
        b=gR0x2sgeaA5rU+p9wjcX5Dwk2+bbc6Y4ksu8x7IyUbTU0JA59Irhh+HBYWwE9Bjihu
         01lXwRnQLfQGb6m+ciThxsgg4D6wzMRNyCaIz6/B3f5Z9ukYeZKCl7MGXdG1cgnMzqSV
         dFDPyEdtrxvBqdE/WgfYuFmBwFJ0nv9C9pi850vOAms7fUWECttiuGjl4Zp6Xhs3lhr2
         Mg7eNqRWaCkUNCGlVRHV6rpguKctnnM1/IUf5d5TLA418muwg0Pf/WCKQG6wOlMKCuB8
         Uk4iLUByu5k4z4iSkezwMRarJjqVMsPXB9wp1JYL8CIFyKf4spdxIPwUI6vGw2pWdHyq
         T/oQ==
X-Gm-Message-State: AOAM531GNd3xiGeO/BYKF0WSCuyHepkwGn3fiXQD6t2iaL1XumvPr3lt
        O2yR+qz3W8+IPatjmIZUdPohA8YrqQ==
X-Google-Smtp-Source: ABdhPJzFDIBZHPsLjncq8NKBhPPokxP1ndVrxlx0qn2wKJzHpb3rux8Ejl1IPCpqcfMW/kb3MjpfsQ==
X-Received: by 2002:a05:6830:2012:: with SMTP id e18mr4699299otp.32.1612557980310;
        Fri, 05 Feb 2021 12:46:20 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k32sm1981232otc.74.2021.02.05.12.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 12:46:19 -0800 (PST)
Received: (nullmailer pid 3702781 invoked by uid 1000);
        Fri, 05 Feb 2021 20:46:18 -0000
Date:   Fri, 5 Feb 2021 14:46:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, John Youn <John.Youn@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/6] dt-binding: usb: Include USB SSP rates in GenXxY
Message-ID: <20210205204618.GA3702715@robh.at.kernel.org>
References: <cover.1611106162.git.Thinh.Nguyen@synopsys.com>
 <cc7cc15f87e209c9963f19129f51398cdc374358.1611106162.git.Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc7cc15f87e209c9963f19129f51398cdc374358.1611106162.git.Thinh.Nguyen@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 19 Jan 2021 17:36:08 -0800, Thinh Nguyen wrote:
> According to the USB 3.2 spec, a SuperSpeed Plus device can operate at
> gen2x2, gen2x1, or gen1x2. If the USB controller device supports
> multiple lanes at different transfer rates, the user can specify the HW
> capability via these new speed strings:
> 
> "super-speed-plus-gen2x2"
> "super-speed-plus-gen2x1"
> "super-speed-plus-gen1x2"
> 
> If the argument is simply "super-speed-plus", USB controllers should
> default to their maximum transfer rate and number of lanes.
> 
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
> Changes in v7:
> - Rebase on Greg's usb-testing branch
> Changes in v6:
> - Update the different maximum_speed enums to the usb.yaml
> - Remove Reviewed-by: Rob Herring <robh@kernel.org> because the commit is updated
> - Rebase on Greg's usb-testing branch
> - Update commit message
> Changes in v5:
> - Add Reviewed-by: Rob Herring <robh@kernel.org>
> - Rebase on Felipe's testing/next branch
> - Changed Signed-off-by email to match From: email header
> Changes in v4:
> - None
> Changes in v3:
> - Use "maximum-speed" to include both the num-lane and transfer rate for SSP
> - Remove "num-lanes" and "lane-speed-mantissa-gbps" properties
> Changes in v2:
> - Make "num-lanes" and "lane-speed-mantissa-gbps" common USB properties
> 
>  Documentation/devicetree/bindings/usb/usb.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
