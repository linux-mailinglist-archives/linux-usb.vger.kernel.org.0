Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 489CD6F56F9
	for <lists+linux-usb@lfdr.de>; Wed,  3 May 2023 13:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbjECLKp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 May 2023 07:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbjECLKo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 May 2023 07:10:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B5B526A9;
        Wed,  3 May 2023 04:10:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 26D3862CC7;
        Wed,  3 May 2023 11:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EE0C433D2;
        Wed,  3 May 2023 11:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683112242;
        bh=s0Ua0IGvfJHjDVRFs1MEv5s7m2oj87gMVXpVRmE+ezY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ks2JmkYxOm4r8x2pfckba6C/Ure5b9zp/hQAQHQjowbCDSnCLwfhzlT2VuhYIRAMF
         SWpqFzbbBaMAi9kuYtd8aOrX8K6Nhm42DqQ+CYAD2Vb2VNSi4alcoYDX7e5DdkuR/e
         cD6WCF632kXF2iNHTLMMUD/uMcxSAb7njJPJatnd7bojlNfLJU4oH19OuXeGnWRmVk
         MERDKuv7c3NYHaOoCyQZ3OV1ZoZQbJxhmhC4GWgnfvelVPEZAZsUm7po+Oec7KR9c7
         UMIsSWnqkNAgD4Fed/D7btblZplPfCupRmVOjvR2qjzIUWhVKRueUbc7hfwTDa8Ze2
         6DiwuIhMwJD6g==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1puANj-0001mf-Rl; Wed, 03 May 2023 13:10:47 +0200
Date:   Wed, 3 May 2023 13:10:47 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Krishna Kurapati <quic_kriskura@quicinc.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com,
        quic_jackp@quicinc.com, quic_harshq@quicinc.com,
        ahalaney@redhat.com, quic_shazhuss@quicinc.com
Subject: Re: [PATCH v7 5/9] usb: dwc3: core: Refactor PHY logic to support
 Multiport Controller
Message-ID: <ZFJBN2i5tXkY8ARA@hovoldconsulting.com>
References: <20230501143445.3851-1-quic_kriskura@quicinc.com>
 <20230501143445.3851-6-quic_kriskura@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230501143445.3851-6-quic_kriskura@quicinc.com>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 01, 2023 at 08:04:41PM +0530, Krishna Kurapati wrote:
> Currently the DWC3 driver supports only single port controller
> which requires at most one HS and one SS PHY.
> 
> But the DWC3 USB controller can be connected to multiple ports and
> each port can have their own PHYs. Each port of the multiport
> controller can either be HS+SS capable or HS only capable
> Proper quantification of them is required to modify GUSB2PHYCFG
> and GUSB3PIPECTL registers appropriately.
> 
> Add support for detecting, obtaining and configuring phy's supported
> by a multiport controller and limit the max number of ports
> supported to 4.
> 
> Signed-off-by: Harsh Agarwal <quic_harshq@quicinc.com>
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  drivers/usb/dwc3/core.c | 262 +++++++++++++++++++++++++++++-----------
>  drivers/usb/dwc3/core.h |  12 +-
>  drivers/usb/dwc3/drd.c  |  13 +-
>  3 files changed, 209 insertions(+), 78 deletions(-)

Note that this patch no longer applies and you need to rebase the series
on mainline (e.g. including commit 1d72fab47656 ("USB: dwc3: refactor
phy handling").

Johan
